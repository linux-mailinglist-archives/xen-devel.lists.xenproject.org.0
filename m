Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEEBA6D787
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 10:35:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925193.1328066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tweD2-0000Sr-Ve; Mon, 24 Mar 2025 09:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925193.1328066; Mon, 24 Mar 2025 09:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tweD2-0000QT-Sm; Mon, 24 Mar 2025 09:35:04 +0000
Received: by outflank-mailman (input) for mailman id 925193;
 Mon, 24 Mar 2025 09:35:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tweD1-0000QN-PR
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 09:35:03 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4262535e-0893-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 10:35:01 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so3472444f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 02:35:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a345fsm10286040f8f.24.2025.03.24.02.35.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 02:35:00 -0700 (PDT)
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
X-Inumbo-ID: 4262535e-0893-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742808901; x=1743413701; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dbVI0X70i4oDNJjK6zaSI2pSBXpL2weMFJnXvcyV4XY=;
        b=VRrT5Rs9aek1tXlyoA4xG73p0ogWpbu6tUDjT9W2v2jGZHEsJEIpg/W5SNyEoVfyZ0
         zcU3Lxn1jonCOkAqCd0fB3E4ItsLGd5C1OBdUDjtL/reBdTMcjfT9QRqSiBdA7DC+yUP
         s9uYgj9/K0azKbE3UdMCGrfyzhjTIau0mfFH3+tzeZY/oqVSnS6EKEs4cxTbk16ujxDU
         rNvVqU5uHpIpojCPKQ1sd1MPQL2PgVwmf6YLgJPnuEY52RMPa7NF0atQikEOCDSkNmYD
         dKe7Xmsn6ZKxf2zs1ddowlhGbllxDzgcZPzZMu+EEL9BdHPjd4PtTW+2zCbKtYoA89cD
         araA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742808901; x=1743413701;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbVI0X70i4oDNJjK6zaSI2pSBXpL2weMFJnXvcyV4XY=;
        b=oJGIUKUcbpihZbrqFAYnIQMkBbO3DhpyRYbI4CKHyIdmzzmwdMPpoKMisxDTv1Q+Uh
         umvCEVJOVwBGA8kVcVoXPNb/ygVEn1GMKIs76d0PdkF7g5Vp70TqNoPwSIl0BS9vbCGz
         GeYRAHzH4LLi6iFIADOECKmGdXEiUDHYkVUuvn9oUi6NV0oT7koDRLw6w9BjphAS/Rfb
         bTWcyVChF+IgbywW+bSsJS43NDp/cRP6lapVnfkei8A1LlSfW38pz3Ygtl/RDEV4O9NB
         qWY1MniC7pPYH65X4jQ583V54DRUVPENIwGQzL+Z1EcLTa90jDyO0yRdYyTZ5wDj1awe
         zKKA==
X-Forwarded-Encrypted: i=1; AJvYcCUxv1WfQqkTBksyn5XajV2/WIQWy0I0M++714/ZsehQKtVQ7VtqfBmjuAx/zHM8mARYlLhG6cINVOM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVBu5f7vWvEmXUwdT+ksLKBrUzfORYXB6LeR6+B9WzIWqOqIFn
	95FRnlqfuRSt6jqiSiZwGTcB9yvytD8RwDCdAc8AIaotSlUsMMTG6Frb/7xcig==
X-Gm-Gg: ASbGncv4z64Unl9yqhXCdczgBM1bVxWEoOh4oyZpb9GIqLCrBLve7oZ90mzDpXQCBuN
	0W1tZ7ltngDffv9+CrUncsrBAhgDg4kLNxBJsgVkaZQyjGs1T+ZKmmup1Bd0VdIq+WefpE0bfQD
	UwyLnmbG+tVpRFU1wCdt/rhtu9IPtEDAXfRXo7ZmMfVhiynTvoSBYTMYR71wqE1Nimaq4eU2GUX
	gDo1hoSPVNzIh8ZGSKETKEH3I0IWWvxIxl544uZ6A7R7D4IIPfgVDyUU7qAcWQ9sNBSiPoVUhCd
	Ot+mpf840vNKPFCmcbrropy8deyLI5lz4TRwVlh8WBMRTm0XhU23wq4Pn33exyv5LOFFj0V86Fb
	fpfWTUPf9y1DIKTj9EP7MyEOYmvuvRw==
X-Google-Smtp-Source: AGHT+IGsGTJaaUs5qghVP1/OgMH/OfFA+F/d24WvyPW9lpskWEbLWc6b42rw1soDyy6UAw+b0FJ7pw==
X-Received: by 2002:a05:6000:2cf:b0:38b:d7d2:12f6 with SMTP id ffacd0b85a97d-3997f8f789emr9342982f8f.2.1742808901006;
        Mon, 24 Mar 2025 02:35:01 -0700 (PDT)
Message-ID: <59cdc84c-6e5a-4752-b09a-945d05badd91@suse.com>
Date: Mon, 24 Mar 2025 10:35:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: simplify bitmap_to_xenctl_bitmap for little endian
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, michal.orzel@amd.com, julien@xen.org,
 roger.pau@citrix.com, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2503182002160.2000798@ubuntu-linux-20-04-desktop>
 <ad1bd470-1efa-4019-89ac-386bb05dd44d@suse.com>
 <alpine.DEB.2.22.394.2503191754480.2325679@ubuntu-linux-20-04-desktop>
 <8297406e-b281-4783-9238-d6326db3fa15@suse.com>
 <alpine.DEB.2.22.394.2503211607200.2325679@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <alpine.DEB.2.22.394.2503211607200.2325679@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.03.2025 00:09, Stefano Stabellini wrote:
> On Thu, 20 Mar 2025, Jan Beulich wrote:
>> On 20.03.2025 01:57, Stefano Stabellini wrote:
>>> On Wed, 19 Mar 2025, Jan Beulich wrote:
>>>> What about xenctl_bitmap_to_bitmap()?
>>>  
>>> Let me see first if I managed to handle bitmap_to_xenctl_bitmap well.
>>
>> Well, the code looks correct to me, but the description now has gone
>> stale. I also wonder whether with that extra restriction the optimization
>> is then actually worth it. Just one further nit:
> 
> Hi Jan, you make a good point. I tried to come up with a better
> approach. What do you think of this?
> 
> 
> diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
> index 3da63a32a6..2f448693c3 100644
> --- a/xen/common/bitmap.c
> +++ b/xen/common/bitmap.c
> @@ -52,7 +52,7 @@ static void clamp_last_byte(uint8_t *bp, unsigned int nbits)
>  	unsigned int remainder = nbits % 8;
>  
>  	if (remainder)
> -		bp[nbits/8] &= (1U << remainder) - 1;
> +		*bp &= (1U << remainder) - 1;
>  }
>  
>  int __bitmap_empty(const unsigned long *bitmap, unsigned int bits)
> @@ -338,7 +338,6 @@ static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp,
>  			nbits -= 8;
>  		}
>  	}
> -	clamp_last_byte(bp, nbits);
>  }
>  
>  static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp,
> @@ -363,7 +362,6 @@ static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp,
>  				unsigned int nbits)
>  {
>  	memcpy(bp, lp, DIV_ROUND_UP(nbits, BITS_PER_BYTE));
> -	clamp_last_byte(bp, nbits);
>  }
>  
>  static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp,
> @@ -384,21 +382,40 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
>      uint8_t zero = 0;
>      int err = 0;
>      unsigned int xen_bytes = DIV_ROUND_UP(nbits, BITS_PER_BYTE);
> -    uint8_t *bytemap = xmalloc_array(uint8_t, xen_bytes);
> -
> -    if ( !bytemap )
> -        return -ENOMEM;
> +    uint8_t last;
>  
>      guest_bytes = DIV_ROUND_UP(xenctl_bitmap->nr_bits, BITS_PER_BYTE);
>      copy_bytes  = min(guest_bytes, xen_bytes);
>  
> -    bitmap_long_to_byte(bytemap, bitmap, nbits);
> +    if ( IS_ENABLED(__BIG_ENDIAN) )
> +    {
> +        uint8_t *bytemap = xmalloc_array(uint8_t, xen_bytes);
>  
> -    if ( copy_bytes &&
> -         copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes) )
> -        err = -EFAULT;
> +        if ( !bytemap )
> +            return -ENOMEM;
>  
> -    xfree(bytemap);
> +        bitmap_long_to_byte(bytemap, bitmap, nbits);
> +        last = bytemap[nbits/8];

Same style nit as before.

> +        if ( copy_bytes &&

copy_bytes > 1

> +             copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes - 1) )
> +            err = -EFAULT;
> +
> +        xfree(bytemap);
> +    }
> +    else
> +    {
> +        const uint8_t *bytemap = (const uint8_t *)bitmap;
> +        last = bytemap[nbits/8];
> +
> +        if ( copy_bytes &&
> +             copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes - 1) )
> +            err = -EFAULT;

The two identical instances would imo better stay common, even if this may
require another function-scope variable (to invoke xfree() on after the
copy-out).

> +    }
> +
> +    clamp_last_byte(&last, nbits);
> +    if ( copy_to_guest_offset(xenctl_bitmap->bitmap, copy_bytes - 1, &last, 1) )
> +        err = -EFAULT;

Careful here in particular when copy_bytes == 0.

Jan


