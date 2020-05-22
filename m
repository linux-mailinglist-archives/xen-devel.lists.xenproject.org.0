Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 231021DE374
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 11:46:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc4FT-0006zH-8M; Fri, 22 May 2020 09:45:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hXvX=7E=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jc4FS-0006yb-8v
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 09:45:50 +0000
X-Inumbo-ID: 04915530-9c11-11ea-aba8-12813bfff9fa
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04915530-9c11-11ea-aba8-12813bfff9fa;
 Fri, 22 May 2020 09:45:49 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:37674
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jc4FO-000NKL-M2 (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 22 May 2020 10:45:46 +0100
Subject: Re: [PATCH] x86/svm: retry after unhandled NPT fault if gfn was
 marked for recalculation
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org
References: <1590097438-28829-1-git-send-email-igor.druzhinin@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <dae35bcf-5b85-a760-9d15-139973215334@citrix.com>
Date: Fri, 22 May 2020 10:45:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1590097438-28829-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: wl@xen.org, jbeulich@suse.com, roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21/05/2020 22:43, Igor Druzhinin wrote:
> If a recalculation NPT fault hasn't been handled explicitly in
> hvm_hap_nested_page_fault() then it's potentially safe to retry -
> US bit has been re-instated in PTE and any real fault would be correctly
> re-raised next time.
>
> This covers a specific case of migration with vGPU assigned on AMD:
> global log-dirty is enabled and causes immediate recalculation NPT
> fault in MMIO area upon access. This type of fault isn't described
> explicitly in hvm_hap_nested_page_fault (this isn't called on
> EPT misconfig exit on Intel) which results in domain crash.
>
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> ---
>  xen/arch/x86/hvm/svm/svm.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 46a1aac..f0d0bd3 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -1726,6 +1726,10 @@ static void svm_do_nested_pgfault(struct vcpu *v,
>          /* inject #VMEXIT(NPF) into guest. */
>          nestedsvm_vmexit_defer(v, VMEXIT_NPF, pfec, gpa);
>          return;
> +    case 0:
> +        /* If a recalculation page fault hasn't been handled - just retry. */
> +        if ( pfec & PFEC_user_mode )
> +            return;

This smells like it is a recipe for livelocks.

Everything should have been handled properly by the call to
p2m_pt_handle_deferred_changes() which precedes svm_do_nested_pgfault().

It is legitimate for the MMIO mapping to end up being transiently
recalculated, but the fact that p2m_pt_handle_deferred_changes() doesn't
fix it up suggests that the bug is there.

Do you have the complete NPT walk to the bad mapping? Do we have
_PAGE_USER in the leaf mapping, or is this perhaps a spurious fault?

~Andrew

