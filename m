Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E48A688D5
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 10:55:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920178.1324420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuq8P-0003Jm-Fs; Wed, 19 Mar 2025 09:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920178.1324420; Wed, 19 Mar 2025 09:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuq8P-0003Ge-CY; Wed, 19 Mar 2025 09:54:49 +0000
Received: by outflank-mailman (input) for mailman id 920178;
 Wed, 19 Mar 2025 09:54:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuq8N-0003GY-Nv
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 09:54:47 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ff8c6a4-04a8-11f0-9899-31a8f345e629;
 Wed, 19 Mar 2025 10:54:45 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso40933285e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 02:54:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df33d7sm21140141f8f.17.2025.03.19.02.54.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 02:54:44 -0700 (PDT)
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
X-Inumbo-ID: 2ff8c6a4-04a8-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742378085; x=1742982885; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rCf9DMTn01EOhcQqVSSAmsgPbeYjZnhDqgHwo56Z5Gw=;
        b=gZI36xJ2HamYXElEpH4MR7kwbiyL5/xtzVerIyKTfaXcdhAQ9BmkjoqF3k4Jh8LA9K
         WZIGj/Y19RB1q1MC9GThWdq0HUuEE9QZGdXz6sFzCaUnE/5ckPYcGWoYe10y1EiZrZbI
         Ho2KLKLn0cQZNXPJj94QSTR4zhUpaRgyOEzHrnBCHeECBkomtik97yxRaHlmpv/KZEdB
         4fns5FEIQXgy7EFEIvlt3l76UAm+I1CHE7ae2tz5/x02h2zQoGJIsG0Tpv88uOGbITib
         CcHfFDBPTsB7tbFoO9TDdH/CI0kZinopIzqjuk458u89oRBmYB7BCW24CdfzRUiTa1uD
         P1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742378085; x=1742982885;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCf9DMTn01EOhcQqVSSAmsgPbeYjZnhDqgHwo56Z5Gw=;
        b=U94owI7ghCm5G48tWsS/CdfKEFLlqT68LUnZI+mw82E6nysGwBM3ofKBraT7tqKjnX
         hRrtMGtFe84eHmtUtDiqcgHBvhI/fLJKMuR08+kMVYbn5xScCoJUStvrs0OaZF4+Qon+
         7C/wwM1JUWU8qbJDkjJpwtCsuZcKj+COWcmI2T7mrbovL+O6Bfs8abKE3w0ywkB2YJIS
         wjBd91VamYL9qz+x10hPQC68nXkyPk86i4cbmKDMwNDSaf2ntbRvcA/cY+P3FaGnJCfI
         vHasnFCS+QjA6UAxSNhtcLe/xUqgK5LZeVJXGKIc1RFB8W+x19NKhSO4V3tCs7cm+rCF
         ZN+A==
X-Forwarded-Encrypted: i=1; AJvYcCUD/SJ/98zkf2Dww47Z/9FwHGo6nrInSubNYAStsn4V5skfP6DhIIkGQPoeymBZFXWha0WFasxB4Bs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFFpy6fKWUo5QZo12u++WoaOuVqlsITdKlfrjyXCMw7qrowEQf
	+qRkfeco6xiIu0jR39M48O6/VDmXRKeg02u1qhid/jSJCVlDqJabVkrwQSU8Gg==
X-Gm-Gg: ASbGncuGVQmWTUMn02rVLu39MVxKl4mLZJ5cJtbIN7Pl0AkyDoeLzlX0Wd98LXWIsN+
	0JJLBJA24TfeQMwh95Yp52Rzja9S4ZHzuGYV4PqLi54NSuAbzyKj2y5xMkhoCMa/G77PxNbjp0X
	7DkyQxpG4wgdZK5ePfQyoCj37x/Ky+PjkmNHFPrGv/LbTcEqHx5usTn1OKbyfY0h35M9xytFeM0
	vf9eZekbv71MbtvS6RPH323b9/1qyZJrdigeMP0gVokymeWCM9nrK32jWAyVccd1RxepPLF5gcm
	ZZBPsxgIrnH3ypZlMeSlmfAuM08/6kfaOAWYvKUUK+w68wQoPeDunDgxtjs8bD10WENuXAqrQaZ
	k51fZJ61PtfzJzCSTApkYsutyql+Q7A==
X-Google-Smtp-Source: AGHT+IH/FRjyLdoQuwiaBQLMf2XtBW+qVSFoArTlSHhyhNTN2UB7rdClovG3ZMP/pbhLXlTK45AcxQ==
X-Received: by 2002:a05:6000:1fa6:b0:391:4743:6de4 with SMTP id ffacd0b85a97d-39973b416admr1216939f8f.50.1742378085006;
        Wed, 19 Mar 2025 02:54:45 -0700 (PDT)
Message-ID: <ad1bd470-1efa-4019-89ac-386bb05dd44d@suse.com>
Date: Wed, 19 Mar 2025 10:54:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: simplify bitmap_to_xenctl_bitmap for little endian
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, michal.orzel@amd.com, julien@xen.org,
 roger.pau@citrix.com, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2503182002160.2000798@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2503182002160.2000798@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.03.2025 04:03, Stefano Stabellini wrote:
> --- a/xen/common/bitmap.c
> +++ b/xen/common/bitmap.c
> @@ -384,21 +384,26 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
>      uint8_t zero = 0;
>      int err = 0;
>      unsigned int xen_bytes = DIV_ROUND_UP(nbits, BITS_PER_BYTE);
> -    uint8_t *bytemap = xmalloc_array(uint8_t, xen_bytes);
> -
> -    if ( !bytemap )
> -        return -ENOMEM;
> +    uint8_t *bytemap = (uint8_t *)bitmap;

Not only Misra dislikes casting away of const-ness.

>      guest_bytes = DIV_ROUND_UP(xenctl_bitmap->nr_bits, BITS_PER_BYTE);
>      copy_bytes  = min(guest_bytes, xen_bytes);
>  
> -    bitmap_long_to_byte(bytemap, bitmap, nbits);
> +    if ( IS_ENABLED(__BIG_ENDIAN) )
> +    {
> +        bytemap = xmalloc_array(uint8_t, xen_bytes);
> +        if ( !bytemap )
> +            return -ENOMEM;
> +
> +        bitmap_long_to_byte(bytemap, bitmap, nbits);
> +    }

Where did the clamp_last_byte() go in the little-endian case?

>      if ( copy_bytes &&
>           copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes) )
>          err = -EFAULT;
>  
> -    xfree(bytemap);
> +    if ( IS_ENABLED(__BIG_ENDIAN) )
> +        xfree(bytemap);
>  
>      for ( i = copy_bytes; !err && i < guest_bytes; i++ )
>          if ( copy_to_guest_offset(xenctl_bitmap->bitmap, i, &zero, 1) )

What about xenctl_bitmap_to_bitmap()?

Jan

