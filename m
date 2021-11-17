Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E526A454A3B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 16:43:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226896.392246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnN5k-000704-8k; Wed, 17 Nov 2021 15:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226896.392246; Wed, 17 Nov 2021 15:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnN5k-0006xN-5h; Wed, 17 Nov 2021 15:43:20 +0000
Received: by outflank-mailman (input) for mailman id 226896;
 Wed, 17 Nov 2021 15:43:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tBek=QE=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mnN5j-0006xG-49
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 15:43:19 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 152972e8-47bd-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 16:43:17 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:59810)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mnN5g-0007tz-9I (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 17 Nov 2021 15:43:16 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id B67251FC53;
 Wed, 17 Nov 2021 15:43:16 +0000 (GMT)
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
X-Inumbo-ID: 152972e8-47bd-11ec-a9d2-d9f7a1cc8784
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <1927a35e-9902-bee8-f7f2-ab8463043d8e@srcf.net>
Date: Wed, 17 Nov 2021 15:43:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-4.16] efi: fix alignment of function parameters in
 compat mode
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>
References: <20211117153350.19823-1-roger.pau@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20211117153350.19823-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/11/2021 15:33, Roger Pau Monne wrote:
> Currently the max_store_size, remain_store_size and max_size in
> compat_pf_efi_runtime_call are 4 byte aligned, which makes clang
> complain with:
>
> In file included from compat.c:30:
> ./runtime.c:646:13: error: passing 4-byte aligned argument to 8-byte aligned parameter 2 of 'QueryVariableInfo' may result in an unaligned pointer access [-Werror,-Walign-mismatch]
>              &op->u.query_variable_info.max_store_size,
>              ^
> ./runtime.c:647:13: error: passing 4-byte aligned argument to 8-byte aligned parameter 3 of 'QueryVariableInfo' may result in an unaligned pointer access [-Werror,-Walign-mismatch]
>              &op->u.query_variable_info.remain_store_size,
>              ^
> ./runtime.c:648:13: error: passing 4-byte aligned argument to 8-byte aligned parameter 4 of 'QueryVariableInfo' may result in an unaligned pointer access [-Werror,-Walign-mismatch]
>              &op->u.query_variable_info.max_size);
>              ^
> Fix this by bouncing the variables on the stack in order for them to
> be 8 byte aligned.
>
> Note this could be done in a more selective manner to only apply to
> compat code calls, but given the overhead of making an EFI call doing
> an extra copy of 3 variables doesn't seem to warrant the special
> casing.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Cc: Ian Jackson <iwj@xenproject.org>
>
> Tagged for possible inclusion into the release, as it's a likely
> candidate for backport. It shouldn't introduce any functional change
> from a caller PoV. I think the risk is getting the patch wrong and not
> passing the right parameters, or broken EFI implementations corrupting
> data on our stack instead of doing it in xenpf_efi_runtime_call.
> ---
>   xen/common/efi/runtime.c | 24 ++++++++++++++++++++----
>   1 file changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
> index 375b94229e..4462233798 100644
> --- a/xen/common/efi/runtime.c
> +++ b/xen/common/efi/runtime.c
> @@ -607,6 +607,9 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
>       break;
>   
>       case XEN_EFI_query_variable_info:
> +    {
> +        uint64_t max_store_size, remain_store_size, max_size;
> +
>           if ( op->misc & ~XEN_EFI_VARINFO_BOOT_SNAPSHOT )
>               return -EINVAL;
>   
> @@ -638,16 +641,29 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
>   
>           if ( !efi_enabled(EFI_RS) || (efi_rs->Hdr.Revision >> 16) < 2 )
>               return -EOPNOTSUPP;
> +
> +        /*
> +         * Bounce the variables onto the stack to make them 8 byte aligned when
> +         * called from the compat handler, as their placement in
> +         * compat_pf_efi_runtime_call will make them 4 byte aligned instead and
> +         * clang will complain.
> +         *
> +         * Note we do this regardless of whether called from the compat handler
> +         * or not, as it's not worth the extra logic to differentiate.
> +         */
> +        max_store_size = op->u.query_variable_info.max_store_size;
> +        remain_store_size = op->u.query_variable_info.remain_store_size;
> +        max_size = op->u.query_variable_info.max_size;
> +
>           state = efi_rs_enter();
>           if ( !state.cr3 )
>               return -EOPNOTSUPP;
>           status = efi_rs->QueryVariableInfo(
> -            op->u.query_variable_info.attr,
> -            &op->u.query_variable_info.max_store_size,
> -            &op->u.query_variable_info.remain_store_size,
> -            &op->u.query_variable_info.max_size);
> +            op->u.query_variable_info.attr, &max_store_size, &remain_store_size,
> +            &max_size);
>           efi_rs_leave(&state);

This will compile, but the caller won't get any data back unless you 
copy the opposite way here...

~Andrew

>           break;
> +    }
>   
>       case XEN_EFI_query_capsule_capabilities:
>       case XEN_EFI_update_capsule:


