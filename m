Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC20A9AC4E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 13:42:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966213.1356499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7uxk-00069q-Ge; Thu, 24 Apr 2025 11:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966213.1356499; Thu, 24 Apr 2025 11:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7uxk-00068H-DZ; Thu, 24 Apr 2025 11:41:52 +0000
Received: by outflank-mailman (input) for mailman id 966213;
 Thu, 24 Apr 2025 11:41:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KF8R=XK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7uxj-00068B-26
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 11:41:51 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1974e896-2101-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 13:41:45 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so8564675e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Apr 2025 04:41:45 -0700 (PDT)
Received: from [192.168.1.23] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2bf751sm18014445e9.34.2025.04.24.04.41.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 04:41:44 -0700 (PDT)
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
X-Inumbo-ID: 1974e896-2101-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745494905; x=1746099705; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XA2DZNhBlFBiy/erxI5im6paQA1RJkr+LnWitzQ9+fI=;
        b=mls0n8M15fEEEVihsb3iKbNFbewtyWVoSGi2sTT9KhzkJHdp2gTxqbXX8VIKiGB69+
         AbBadtcETr+C9t8QSxL43jCtodxYWJXgMPltqzFYoH+VKtQZnUM9+f57BPoA0WLBD9Nz
         ZbBIbn/ArBdpWWww4hRRCs92SPBHD2dWKSRNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745494905; x=1746099705;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XA2DZNhBlFBiy/erxI5im6paQA1RJkr+LnWitzQ9+fI=;
        b=f6/OBBJBwVHcyOF4qZi5mAc/UW1SjDm7Ypugo22OCbSdC2obgkuj3c9zzx97n1/Ks5
         KKQiv/4eLkWtekIMkMWr5/LsdLv6yEjyIevOelwYJ1spXEAsPRUm2GWwe+yFP0nHBm8p
         7FVKn8n3gKfIsBJmOhvOo/eIbNScrNIdjG8FDa2liHeYkBaTQhEmzTeAx1iR4K7nW0qe
         KUoRhlNPGGjVKDF1Yw8/2COUOh4OwQkcTQ3mQB8WWoz/yMaZzIaAC0t2AAUb7Rxs+1vh
         NlTOdT2MwTSxJa5zVrN3j81GzKpWNUBRmxr11wA4WY00h6PP+f7ZBhIY4GQHRaNRHEN7
         dTyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1jdtmg0cfNGbyFJTg1aB0vsYWPtqrn7i7DZPhSnMtYq/Z3Z43L75SJSmxAl2s6bC0K2OSZzbYt7s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyH3RoncOgGWj2RmzHYDpKk0a+o8+f9XAx2QjhZCOmbCJn9PtNI
	YxQVgmW4sVxwQsC0SLCfU9SVRT+zcopG4V8W9rFs59qfjW/BIWf3LnJxu0k584A=
X-Gm-Gg: ASbGnct9uj6FfeaQuefL/berdHWikJR1zYFD2dseQHVpc973SKefXC6zvd3OHyEsSH9
	Pdu9o4bNT6CXyrpWgmKtkEX+/zd9mnsnup8t8JewuSgyrEq1I7vEyuk77oa7Fporm5VjVU2o5M3
	mJPwGEoRV6hyRGlQyyvsLxQgVsjze9CsuS8k28LT6D2fvqUeMBTZt1Z608arDIRwzF/NBuv1GEJ
	66UPVx+xbRTKpb3zojpACuZYRSOrLoGrTXdUW/MupXgMViG5lCk9mC+Znl15rkU+V3/GfmrWPUB
	cGF9OwdbMopAD9OqxFfqbB0okW8bMsKE7TnjhKKC7aW/X0PKB/okLhbd3ZVYiLIra3Q6pu1Dvap
	Gq2Tk
X-Google-Smtp-Source: AGHT+IHboyJ5fuPQIr4DWS+Pc1hvFFbrYO5b9sOwB8W9IAcDMI6xKw3jBWElJxOEp/JNDKkmtMiJ7A==
X-Received: by 2002:a05:600c:3b1a:b0:43d:40b0:5b with SMTP id 5b1f17b1804b1-4409bd76e79mr17324675e9.25.1745494904937;
        Thu, 24 Apr 2025 04:41:44 -0700 (PDT)
Message-ID: <041d4bd5-962c-4600-b436-0ec214a6c6ca@citrix.com>
Date: Thu, 24 Apr 2025 12:41:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: fix buffer over-read in bitmap_to_xenctl_bitmap()
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250424103841.94828-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250424103841.94828-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/04/2025 11:38 am, Roger Pau Monne wrote:
> There's an off-by-one when calculating the last byte in the input array to
> bitmap_to_xenctl_bitmap(), which leads to bitmaps with sizes multiple of 8
> to over-read and incorrectly use a byte past the end of the array.

/sigh

> While there also ensure that bitmap_to_xenctl_bitmap() is not called with a
> bitmap of 0 length.
>
> Fixes: 288c4641c80d ('xen: simplify bitmap_to_xenctl_bitmap for little endian')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

You ought to note that this is only not getting an XSA because
288c4641c80d isn't in a released Xen yet.

> ---
>  xen/common/bitmap.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
> index bf1a7fd91e36..415d6bc074f6 100644
> --- a/xen/common/bitmap.c
> +++ b/xen/common/bitmap.c
> @@ -369,6 +369,12 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
>      const uint8_t *bytemap;
>      uint8_t last, *buf = NULL;
>  
> +    if ( !nbits )
> +    {
> +	ASSERT_UNREACHABLE();
> +	return -EILSEQ;
> +    }

I don't see any hypercalls performing a bits==0 check, so I expect this
is reachable.

> +
>      if ( !IS_ENABLED(LITTLE_ENDIAN) )
>      {
>          buf = xmalloc_array(uint8_t, xen_bytes);
> @@ -396,7 +402,7 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
>       * their loops to 8 bits. Ensure we clear those left over bits so as to
>       * prevent surprises.
>       */
> -    last = bytemap[nbits / 8];
> +    last = bytemap[(nbits - 1) / 8];
>      if ( nbits % 8 )
>          last &= (1U << (nbits % 8)) - 1;
>  

This (preexisting) logic is mad.  The overwhelming majority of cases are
going to be a multiple of 8, and as you notice, the 0 case can't be
fixed like this.

It should all be inside a copy_bytes conditional as is done in
xenctl_bitmap_to_bitmap().

~Andrew

