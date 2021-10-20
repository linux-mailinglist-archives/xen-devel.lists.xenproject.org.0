Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98289435260
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 20:09:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214067.372490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdG1T-0003qa-SH; Wed, 20 Oct 2021 18:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214067.372490; Wed, 20 Oct 2021 18:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdG1T-0003ny-Ox; Wed, 20 Oct 2021 18:09:07 +0000
Received: by outflank-mailman (input) for mailman id 214067;
 Wed, 20 Oct 2021 18:09:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mdG1S-0003ns-BB
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 18:09:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdG1S-00033s-8m; Wed, 20 Oct 2021 18:09:06 +0000
Received: from [54.239.6.185] (helo=[192.168.28.129])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdG1S-0008B1-2n; Wed, 20 Oct 2021 18:09:06 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=N/XCGEC3DOiRnjbDfQMNBYEJ5aHPoDQ1o02xoy+36gY=; b=eZQrywKiXK3eqDwyw6z34jc5VL
	38tyI6inIdzxyBWf8k5fILqBTrPETyRM5yOI+iphbcofWKV2xxMXLnPhyqVq8iT3WL+/VppAgbfGY
	engyOGwdDuQiWSUBPDqydwRljMwtge0O3raIka1O/sN3M++t8bfNzIhXnW4ZfI3C5X5s=;
Message-ID: <997d95fa-f259-e904-88a2-97910cef101e@xen.org>
Date: Wed, 20 Oct 2021 19:09:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [XEN][RFC PATCH 05/13] libfdt: Change overlay_get_target() type
To: Vikram Garhwal <fnu.vikram@xilinx.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org
References: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
 <1630562763-390068-6-git-send-email-fnu.vikram@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1630562763-390068-6-git-send-email-fnu.vikram@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram

On 02/09/2021 07:05, Vikram Garhwal wrote:
> Remove static function type from overlay_get_target().

Please explain why this is necessary. But if we really need then...

> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> ---
>   xen/common/libfdt/fdt_overlay.c | 2 +-
>   xen/include/xen/libfdt/libfdt.h | 2 ++
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/libfdt/fdt_overlay.c b/xen/common/libfdt/fdt_overlay.c
> index 15a8cdb..1ffb669 100644
> --- a/xen/common/libfdt/fdt_overlay.c
> +++ b/xen/common/libfdt/fdt_overlay.c
> @@ -56,7 +56,7 @@ static uint32_t overlay_get_target_phandle(const void *fdto, int fragment)
>    *      the targeted node offset in the base device tree
>    *      Negative error code on error
>    */
> -static int overlay_get_target(const void *fdt, const void *fdto,
> +int overlay_get_target(const void *fdt, const void *fdto,
>   			      int fragment, char const **pathp)

... the function should be prefixed to fdt_*.

I would also like to avoid diverging from what the original source. So 
can this please be sent to the libfdt community first?

>   {
>   	uint32_t phandle;
> diff --git a/xen/include/xen/libfdt/libfdt.h b/xen/include/xen/libfdt/libfdt.h
> index b6c8b67..e1cc6f2 100644
> --- a/xen/include/xen/libfdt/libfdt.h
> +++ b/xen/include/xen/libfdt/libfdt.h
> @@ -1737,4 +1737,6 @@ int fdt_overlay_apply(void *fdt, void *fdto);
>   
>   const char *fdt_strerror(int errval);
>   
> +int overlay_get_target(const void *fdt, const void *fdto, int fragment,
> +                       char const **pathp);
>   #endif /* _LIBFDT_H */
> 

Cheers,

-- 
Julien Grall

