Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F04BC849EDB
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:55:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676363.1052512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX1Jn-0007u6-Dl; Mon, 05 Feb 2024 15:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676363.1052512; Mon, 05 Feb 2024 15:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX1Jn-0007rz-A0; Mon, 05 Feb 2024 15:55:35 +0000
Received: by outflank-mailman (input) for mailman id 676363;
 Mon, 05 Feb 2024 15:55:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rX1Jl-0007rr-Mb
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:55:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rX1Jl-0000uB-Hq; Mon, 05 Feb 2024 15:55:33 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rX1Jl-0003Vw-Cd; Mon, 05 Feb 2024 15:55:33 +0000
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
	bh=QKshiG3nxZwm8q/Fqxj+/eHcM0mPQ48QLY97q67MNpE=; b=UuyveCB53Oxut1PbRgARUpp2tU
	ED5RZMD8XJ/rPv/n7n64eSF/CGcpkRbjTGxrNdXcELaSDNOw9loU6g0AfXUGYSw8drBulBemqe6wB
	fH3ziszeeULfnlLY50n00UaQHbzkkneiJ7SaLp1nkcFkkt2lYKd2kznmQ6NfCKthaof4=;
Message-ID: <072da633-de82-4d93-b467-8372973406fe@xen.org>
Date: Mon, 5 Feb 2024 15:55:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/bitmap: Compile with -Wsign-conversion
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20240205151454.1920291-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240205151454.1920291-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

Title: You seem to change common code. So s/x86//

On 05/02/2024 15:14, Andrew Cooper wrote:
> Use pragmas to able the warning in this file only.  All supported versions of
> Clang understand this, while older GCCs simply ignore it.
> 
> bitmap_find_free_region() is the only function which isn't sign-convert
> clean.  This highlights a latent bug in that it can't return successfully for
> a bitmap larger than 2G.
> 
> Add an extra check, and explicit cast to silence the warning.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> 
> Slightly RFC.  This is our first use of pragmas like this.

The only other approach I can think of is specifying the CFLAGS per file 
like Linux did. I don't know if our build system supports that though.

AFAICT, the only advantage would be to avoid duplicating the pragmas. So 
this is not a strong preference.

> ---
>   xen/common/bitmap.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
> index 18e23e2f0e18..b14f8a3b3030 100644
> --- a/xen/common/bitmap.c
> +++ b/xen/common/bitmap.c
> @@ -14,6 +14,9 @@
>   #include <xen/lib.h>
>   #include <asm/byteorder.h>
>   
> +#pragma GCC diagnostic warning "-Wsign-conversion"
> +#pragma clang diagnostic warning "-Wsign-conversion"
> +

OOI, any reason why wasn't added at the right at the top of the file?

>   /*
>    * bitmaps provide an array of bits, implemented using an an
>    * array of unsigned longs.  The number of valid bits in a
> @@ -263,7 +266,7 @@ int bitmap_find_free_region(unsigned long *bitmap, unsigned int bits, unsigned i
>   	unsigned int pages = 1 << order;
>   	unsigned int i;
>   
> -	if(pages > BITS_PER_LONG)
> +	if (pages > BITS_PER_LONG || bits >= INT_MAX)
>   		return -EINVAL;
>   
>   	/* make a mask of the order */
> @@ -278,7 +281,7 @@ int bitmap_find_free_region(unsigned long *bitmap, unsigned int bits, unsigned i
>   		if((bitmap[index] & (mask << offset)) == 0) {
>   			/* set region in bimap */
>   			bitmap[index] |= (mask << offset);
> -			return i;
> +			return (int)i;

It took me a while to realize that this patch should be reviewed after 
"x86/bitmap: Even more signed-ness fixes".

Before hand, 'i' is a signed int and we would return -ENOMEM if 'bits' 
is negative. So I wonder whether the change in common/bitmap.c should 
belong to the other patch?

Cheers,

-- 
Julien Grall

