Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E91457257
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 17:04:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228105.394633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo6Mv-0000U9-Sc; Fri, 19 Nov 2021 16:04:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228105.394633; Fri, 19 Nov 2021 16:04:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo6Mv-0000SN-PB; Fri, 19 Nov 2021 16:04:05 +0000
Received: by outflank-mailman (input) for mailman id 228105;
 Fri, 19 Nov 2021 16:04:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Hp3=QG=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mo6Mu-0000SH-I2
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 16:04:04 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f4f7597-4952-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 17:04:02 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:41448)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mo6Mq-000Y46-1t (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 19 Nov 2021 16:04:00 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 59C011FC31;
 Fri, 19 Nov 2021 16:04:00 +0000 (GMT)
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
X-Inumbo-ID: 4f4f7597-4952-11ec-a9d2-d9f7a1cc8784
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <40b1a70a-12ed-e059-3bbd-a93b85a96f1d@srcf.net>
Date: Fri, 19 Nov 2021 16:04:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH for-4.16 v3] efi: fix alignment of function parameters in
 compat mode
Content-Language: en-GB
To: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20211119152403.12069-1-iwj@xenproject.org>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20211119152403.12069-1-iwj@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/11/2021 15:24, Ian Jackson wrote:
> diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
> index 375b94229e..089bb0eb1b 100644
> --- a/xen/common/efi/runtime.c
> +++ b/xen/common/efi/runtime.c
> @@ -638,16 +641,36 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
>  
>          if ( !efi_enabled(EFI_RS) || (efi_rs->Hdr.Revision >> 16) < 2 )
>              return -EOPNOTSUPP;
> +
> +        /*
> +         * Bounce the variables onto the stack to make them 8 byte aligned when
> +         * called from the compat handler, as their placement in
> +         * compat_pf_efi_runtime_call will make them 4 byte aligned instead and
> +         * and compilers may validly complain.
> +	 *
> +	 * Note that while the function parameters are OUT only, copy the
> +	 * values here anyway just in case. This is done regardless of whether
> +	 * called from the compat handler or not, as it's not worth the extra
> +	 * logic to differentiate.
> +         */

Some hardtabs appear to have slipped in.

Jan gave a conditional R-by which permitted a change along these lines,
but he's left the office now too, so you'll have to take him up on that
offer if you want this committing before Monday.

~Andrew

