Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0221DE3B8
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 12:09:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc4bp-0001C5-9Y; Fri, 22 May 2020 10:08:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L400=7E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jc4bo-0001C0-GL
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 10:08:56 +0000
X-Inumbo-ID: 3ea04792-9c14-11ea-ae69-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ea04792-9c14-11ea-ae69-bc764e2007e4;
 Fri, 22 May 2020 10:08:55 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: YQiBpXNXpK/yGTBHwopQ1csvroi95vSn+S2R+jofk447T3THtGYNymmuv32J7SvQ7qPcGu4/xu
 /VYE9/Sn6YmO1RYL8/Y5fQt69Cgr9/tN/yP2LopZ1VezGELgP7woopXbC7dZw+P8/IoiEIOwjN
 QJ+ZapphVIZZah0NFlT2tzv13TJkoKLA19ZJ5e3UvWmRmADIb3p1SpZOk5bUnP2QUaNwAPosSg
 0co6/a7u2KtmfnzhtZLxMu/VW0GKPwMVzro4OOIs8LcO4VnBqZgL7C3q9sMMjziEhiZ1CUc2nZ
 gns=
X-SBRS: 2.7
X-MesageID: 18447877
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,421,1583211600"; d="scan'208";a="18447877"
Date: Fri, 22 May 2020 12:08:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH] x86/svm: retry after unhandled NPT fault if gfn was
 marked for recalculation
Message-ID: <20200522100846.GV54375@Air-de-Roger>
References: <1590097438-28829-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1590097438-28829-1-git-send-email-igor.druzhinin@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, jbeulich@suse.com,
 andrew.cooper3@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, May 21, 2020 at 10:43:58PM +0100, Igor Druzhinin wrote:
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

Couldn't direct MMIO regions be handled like other types of memory for
the purposes of logdiry mode?

I assume there's already a path here used for other memory types when
logdirty is turned on, and hence would seem better to just make direct
MMIO regions also use that path?

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

I'm slightly worried that this diverges from the EPT implementation
now, in the sense that returning 0 from hvm_hap_nested_page_fault will
no longer trigger a guest crash.

Thanks, Roger.

