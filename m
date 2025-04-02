Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C16A7857A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 02:15:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935015.1336538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzlkv-0007j8-4C; Wed, 02 Apr 2025 00:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935015.1336538; Wed, 02 Apr 2025 00:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzlkv-0007hg-1I; Wed, 02 Apr 2025 00:14:57 +0000
Received: by outflank-mailman (input) for mailman id 935015;
 Wed, 02 Apr 2025 00:14:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YWck=WU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tzlku-0007ha-3p
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 00:14:56 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fe0d3c5-0f57-11f0-9ea7-5ba50f476ded;
 Wed, 02 Apr 2025 02:14:53 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 726BC61126;
 Wed,  2 Apr 2025 00:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A414DC4CEE4;
 Wed,  2 Apr 2025 00:14:51 +0000 (UTC)
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
X-Inumbo-ID: 7fe0d3c5-0f57-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743552892;
	bh=DjDOHjuoBfe85suHnJ0PpFAtcPwgZSsYPZVgklI6qJQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aK7KfTTjYWFE52BBT83ruvsz835oHUowybkIh+WEQgiyKyb5jtaMPJiVxen1pMwWJ
	 hOv6Aw64EdHEyJB02lmjpiU976W6F/hLaGuX5nbVPlM3OVqTCgZLNzB0d3snZ1jMwb
	 fOq60FH3YHGLt44DPcdH18NSo2MB/9TawRkh2mRcz7N1QBilQ2lDaZPa9WV9/67NSU
	 xXhn48WO9MoktFYng5PbM0LmmxshXQMqh1E2MfhwF3DAa52PDmYDFBOdSjx7pVkLlH
	 XXX4C9AdouVtnb5JOT3FQNaB5gXR16CUhLPFrwL+sjQq4wtLEgNI3IKXIRcROxmwdR
	 S5Tb07tuNPJ/A==
Date: Tue, 1 Apr 2025 17:14:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5] xen: simplify bitmap_to_xenctl_bitmap for little
 endian
In-Reply-To: <694eac75-e872-4ba0-80ed-95c14cd11f5e@suse.com>
Message-ID: <alpine.DEB.2.22.394.2504011708290.3098208@ubuntu-linux-20-04-desktop>
References: <20250401005008.2787764-1-stefano.stabellini@amd.com> <694eac75-e872-4ba0-80ed-95c14cd11f5e@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Apr 2025, Jan Beulich wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> The little endian implementation of bitmap_to_xenctl_bitmap leads to
> unnecessary xmallocs and xfrees. Given that Xen only supports little
> endian architectures, it is worth optimizing.
> 
> This patch removes the need for the xmalloc on little endian
> architectures.
> 
> Remove clamp_last_byte as it is only called once and only needs to
> modify one byte. Inline it.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v5: Fix IS_ENABLED() use. Keep more code common. Move comment.
>     Convert LE bitmap_long_to_byte() to just a declaration.

Thanks Jan, I looked at your version carefully and it looks correct to
me. I could give my reviewed-by but it looks weird given that I am also
the first author.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/xen/common/bitmap.c
> +++ b/xen/common/bitmap.c
> @@ -40,21 +40,6 @@
>   * for the best explanations of this ordering.
>   */
>  
> -/*
> - * If a bitmap has a number of bits which is not a multiple of 8 then
> - * the last few bits of the last byte of the bitmap can be
> - * unexpectedly set which can confuse consumers (e.g. in the tools)
> - * who also round up their loops to 8 bits. Ensure we clear those left
> - * over bits so as to prevent surprises.
> - */
> -static void clamp_last_byte(uint8_t *bp, unsigned int nbits)
> -{
> -	unsigned int remainder = nbits % 8;
> -
> -	if (remainder)
> -		bp[nbits/8] &= (1U << remainder) - 1;
> -}
> -
>  int __bitmap_empty(const unsigned long *bitmap, unsigned int bits)
>  {
>  	int k, lim = bits/BITS_PER_LONG;
> @@ -338,7 +323,6 @@ static void bitmap_long_to_byte(uint8_t
>  			nbits -= 8;
>  		}
>  	}
> -	clamp_last_byte(bp, nbits);
>  }
>  
>  static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp,
> @@ -359,12 +343,11 @@ static void bitmap_byte_to_long(unsigned
>  
>  #elif defined(__LITTLE_ENDIAN)
>  
> -static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp,
> -				unsigned int nbits)
> -{
> -	memcpy(bp, lp, DIV_ROUND_UP(nbits, BITS_PER_BYTE));
> -	clamp_last_byte(bp, nbits);
> -}
> +#define LITTLE_ENDIAN 1 /* For IS_ENABLED(). */
> +
> +/* Unused function, but a declaration is needed. */
> +void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp,
> +			 unsigned int nbits);
>  
>  static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp,
>  				unsigned int nbits)
> @@ -384,22 +367,46 @@ int bitmap_to_xenctl_bitmap(struct xenct
>      uint8_t zero = 0;
>      int err = 0;
>      unsigned int xen_bytes = DIV_ROUND_UP(nbits, BITS_PER_BYTE);
> -    uint8_t *bytemap = xmalloc_array(uint8_t, xen_bytes);
> +    const uint8_t *bytemap;
> +    uint8_t last, *buf = NULL;
>  
> -    if ( !bytemap )
> -        return -ENOMEM;
> +    if ( !IS_ENABLED(LITTLE_ENDIAN) )
> +    {
> +        buf = xmalloc_array(uint8_t, xen_bytes);
> +        if ( !buf )
> +            return -ENOMEM;
> +
> +        bitmap_long_to_byte(buf, bitmap, nbits);
> +
> +        bytemap = buf;
> +    }
> +    else
> +        bytemap = (const uint8_t *)bitmap;
>  
>      guest_bytes = DIV_ROUND_UP(xenctl_bitmap->nr_bits, BITS_PER_BYTE);
>      copy_bytes  = min(guest_bytes, xen_bytes);
>  
> -    bitmap_long_to_byte(bytemap, bitmap, nbits);
> +    if ( copy_bytes > 1 &&
> +         copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes - 1) )
> +        err = -EFAULT;
> +
> +    /*
> +     * If a bitmap has a number of bits which is not a multiple of 8 then the
> +     * last few bits of the last byte of the bitmap can be unexpectedly set,
> +     * which can confuse consumers (e.g. in the tools), who also may round up
> +     * their loops to 8 bits. Ensure we clear those left over bits so as to
> +     * prevent surprises.
> +     */
> +    last = bytemap[nbits / 8];
> +    if ( nbits % 8 )
> +        last &= (1U << (nbits % 8)) - 1;
> +
> +    xfree(buf);
>  
>      if ( copy_bytes &&
> -         copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes) )
> +         copy_to_guest_offset(xenctl_bitmap->bitmap, copy_bytes - 1, &last, 1) )
>          err = -EFAULT;
>  
> -    xfree(bytemap);
> -
>      for ( i = copy_bytes; !err && i < guest_bytes; i++ )
>          if ( copy_to_guest_offset(xenctl_bitmap->bitmap, i, &zero, 1) )
>              err = -EFAULT;
> 

