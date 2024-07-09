Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E6292BF2C
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 18:09:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756412.1165023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRDP7-00009e-0F; Tue, 09 Jul 2024 16:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756412.1165023; Tue, 09 Jul 2024 16:09:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRDP6-00006V-Tb; Tue, 09 Jul 2024 16:09:20 +0000
Received: by outflank-mailman (input) for mailman id 756412;
 Tue, 09 Jul 2024 16:09:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uARp=OJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sRDP5-00006P-AM
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 16:09:19 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97763f9f-3e0d-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 18:09:16 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52ccc40e72eso3508582e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 09:09:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b439b70d2sm2003251b3a.190.2024.07.09.09.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 09:09:15 -0700 (PDT)
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
X-Inumbo-ID: 97763f9f-3e0d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720541356; x=1721146156; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m0XZTexhlo8x1+AFcieOY7gUvG41s8UTyelE/ma2BdQ=;
        b=FLRHLgSSKAVE0JMge8YBYB7kB4MfBPxWdysjqfuTBbIV77vFQDVCnDWt5QmJJ2Go91
         +xxEd6vG8JAYgQk4ILmoK48voGCspgSB3Ua3P4IyjsTS2RZrxRmgX2x7WozK74lWK17B
         iKHjPWn7znqYruuNWVEIRC+rGAyshJTMjwflSOolP86uPDglXViZC3BvLj6kDGY2CCPF
         Pnbj5yjA2MzFryC6jCDFQDNfWFPNGpc652d+EshXiyUNpU/ph/+bfXzQ+OEZ7bjbYNji
         q/PaF3U6AIM/MMEgIj+OuzdHRfec/FkfC/WW/YewREcuz2l114fTN3DoFFTrdKb2Zcut
         W6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720541356; x=1721146156;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0XZTexhlo8x1+AFcieOY7gUvG41s8UTyelE/ma2BdQ=;
        b=PlJAcddD230Ii4ib3JCON25dS+PDGNpvWKbmpcmbFc9B3PP6Lwt47lbp8wmaxiQOKM
         QPnGgyZGA6tI6oFEf5FrczgGZqPQaQjZweEM99HJDz9CrEhQtsudjYX1VcRvjrvsQqs3
         r7WPagEJDe+G8Z63Jzy0KYBP7N6rUjBM4Y9ytlSune4uGbQnilPdKd/gOOilR/w7Stpl
         6Htn+Zh9OsBcAOAV7MLXHlC/p9Px1+EP0suceKmlilAFjiAmP6IAzAa5Y7kBT97g5zlt
         UTNWpZwLvKHyHfMjYagPcJEqrXeZLJmfWjZaaXajBQ+2CDogfbKIeoThOUgvE1TF9NSa
         lOjg==
X-Forwarded-Encrypted: i=1; AJvYcCWA3h12/ZCJmXI1t9riOLFbIY9sVsS7zB6fnoZChA4N0NH3lEUdGgKpERhTmoDfpS+yiO43gzW7FNXWZNatB9TZPjFk4UB5MPn5Py6gWOY=
X-Gm-Message-State: AOJu0YxbPSBBzdkzcWxkHN/fBYOL5oCanNSuU7F/RpYKzvtye7qoUN2w
	JPgKV8MZa5yE8P2sSi1BJwQjpzMa4Rs0WucSQ1RYNdCJ1eIhVXsy6e0FqZWqzA==
X-Google-Smtp-Source: AGHT+IH2l2OEVcvWO7d2fNf2Rr+TkvasPAedGOoko4KE+NWptRZWZpGsHzxp9eB2BaJuEHo4rN64iQ==
X-Received: by 2002:a19:ac4b:0:b0:52c:84a2:d848 with SMTP id 2adb3069b0e04-52eb99d5f90mr1884581e87.65.1720541356068;
        Tue, 09 Jul 2024 09:09:16 -0700 (PDT)
Message-ID: <5ff40947-5672-4497-83e7-53ea370b5f58@suse.com>
Date: Tue, 9 Jul 2024 18:09:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH for-4.19] xen/bitmap: amend MISRA C deviation for Rule
 20.7
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <794724e70c4e45224916576af01070e8aebe9aab.1720517398.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <794724e70c4e45224916576af01070e8aebe9aab.1720517398.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.07.2024 11:34, Nicola Vetrini wrote:
> --- a/xen/include/xen/bitmap.h
> +++ b/xen/include/xen/bitmap.h
> @@ -103,18 +103,16 @@ extern int bitmap_allocate_region(unsigned long *bitmap, int pos, int order);
>  #define bitmap_switch(nbits, zero, small, large)			  \
>  	unsigned int n__ = (nbits);					  \
>  	if (__builtin_constant_p(nbits) && !n__) {			  \
> -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
>  		zero;							  \
>  	} else if (__builtin_constant_p(nbits) && n__ <= BITS_PER_LONG) { \
> -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
>  		small;							  \
>  	} else {							  \
> -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
>  		large;							  \
>  	}

An observation I made only while discussing this on the meeting is that by
going from this form to ...

>  static inline void bitmap_zero(unsigned long *dst, unsigned int nbits)
>  {
> +	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
>  	bitmap_switch(nbits,,
>  		*dst = 0UL,
>  		memset(dst, 0, bitmap_bytes(nbits)));

... this form, you actually widen what the deviation covers to the entire
macro, which is too much. We don't want to deviate the rule for all of the
arguments, after all.

However, it further occurred to me that the reason for needing the deviation
looks to merely be that in some cases (like the one above) we pass empty
macro arguments. That's getting in the way of parenthesizing the use sites.
We could avoid this, though, by adding e.g.

#define nothing ((void)0)

near the definition of bitmap_switch() and then using that in place of the
empty arguments. Provided of course this is the only obstacle to
parenthesization. At which point no deviation ought to be needed in the
first place.

Jan

