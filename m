Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7397A4E2A47
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 15:15:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293017.497686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWIof-000297-C0; Mon, 21 Mar 2022 14:15:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293017.497686; Mon, 21 Mar 2022 14:15:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWIof-00026s-8y; Mon, 21 Mar 2022 14:15:25 +0000
Received: by outflank-mailman (input) for mailman id 293017;
 Mon, 21 Mar 2022 14:15:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uTAE=UA=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nWIod-00026m-VK
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 14:15:23 +0000
Received: from ppsw-40.csi.cam.ac.uk (ppsw-40.csi.cam.ac.uk [131.111.8.140])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57bc8667-a921-11ec-a405-831a346695d4;
 Mon, 21 Mar 2022 15:15:22 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:44008)
 by ppsw-40.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nWIoa-0003Sf-m2 (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 21 Mar 2022 14:15:20 +0000
Received: from [192.168.1.10] (host-78-149-3-47.as13285.net [78.149.3.47])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id A2FAC1FAA3;
 Mon, 21 Mar 2022 14:15:20 +0000 (GMT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 57bc8667-a921-11ec-a405-831a346695d4
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <9cd9b333-d38e-cb36-38b2-ffac027fc53c@srcf.net>
Date: Mon, 21 Mar 2022 14:15:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] xen/x86/hvm: add missing cf_check for hvm_physdev_op()
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20220321075329.3302-1-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20220321075329.3302-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/03/2022 07:53, Juergen Gross wrote:
> The hypercall handler hvm_physdev_op() is missing a cf_check attribute.
>
> Fixes: cdbe2b0a1aec ("x86: Enable CET Indirect Branch Tracking")
> Signed-off-by: Juergen Gross <jgross@suse.com>

https://lore.kernel.org/xen-devel/20220309152009.10449-1-andrew.cooper3@citrix.com/

The only reason I haven't committed it is because I was chasing
someone's bug report against compat_vcpu_op()...

~Andrew

> ---
>  xen/arch/x86/hvm/hypercall.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
> index 030243810e..62b5349e7d 100644
> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -78,7 +78,7 @@ static long cf_check hvm_grant_table_op(
>  }
>  #endif
>  
> -static long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> +static long cf_check hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>  {
>      const struct vcpu *curr = current;
>      const struct domain *currd = curr->domain;


