Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B41B792B425
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 11:41:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756026.1164585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR7LC-0003uh-Bs; Tue, 09 Jul 2024 09:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756026.1164585; Tue, 09 Jul 2024 09:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR7LC-0003sx-8J; Tue, 09 Jul 2024 09:40:54 +0000
Received: by outflank-mailman (input) for mailman id 756026;
 Tue, 09 Jul 2024 09:40:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uARp=OJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sR7LA-0003sp-AN
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 09:40:52 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5425fa4b-3dd7-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 11:40:51 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52ea34ffcdaso4623588e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 02:40:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b43967415sm1353135b3a.110.2024.07.09.02.40.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 02:40:50 -0700 (PDT)
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
X-Inumbo-ID: 5425fa4b-3dd7-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720518051; x=1721122851; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7YvRKbpWjM9CR8XBDA1jU/B9xob0nanipFDLR6DJk20=;
        b=EdtDpIhJgDcnEDaAPmBqQmMhALwlV0/amNrVlEOz0OlSZnxEN/t6ySe3HwcKg2d5uM
         QFD4XchgTY7urcrl+EICvVB7DJL/cKaX7cu/hFT5K8GerrW7zdZhKwfHu+1wpZrG+tge
         BysA7MLGS2vZ7xoqmGUmW8JHHCcTNr36wJxbN+t/v12H/hgdZbNsftpKbKVqpyWObHMZ
         Pze0yvHeCxHfbbiEFvBzZed4bTcVJeZ7dS8XQfokrbvQSMWo2+qPvOzy7M8GSPcSmfQO
         hfCWQWYniek80yvhqnFgaspwoMiaGOZeNf4r6fPFsjww+0v9PP5ixDz0L0EpcDzhuAaF
         o6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720518051; x=1721122851;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YvRKbpWjM9CR8XBDA1jU/B9xob0nanipFDLR6DJk20=;
        b=ZyEwqBs3ZVXdoYyVyrb2EXn07heL/yLQt2gMYkokns3IUezB9LTmMbNcTIBCyi5JUO
         d1Q35AYJ0+CQbE8dl4AjVvca1ASY005qflJpIldZh8RG4SKDoA9c8P6jaAdHUUmb0m0Y
         Ov7uoQ8PYNjNywpdCr/FdjkMQ27Stp2w+uRujofgDaoC36hmgIj3LmRgbf6s0Jw1hSC0
         bSN2/qWjvzC5JbFu/Vu33AFXQ9JNVyyBRNDvt3LHF50MqRpeP6XergYXuR1XCRMX2Zl9
         tl06RrB4SQAa7vcBN4Zo8n9/Q3cqCLbJ/5CXRzRAhPpM2F/0ROryYSZVq00ydyDK5xBq
         JiGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWWaRtZKlpkg1o1v9YaY51ExW7X1240ZwN7yB0xUuVYOmldoL5Fw89SSTTwokrlQ/FA4t0LoDWj3wIgcfKyzttr5m3YdRJVGsKh/6n65M=
X-Gm-Message-State: AOJu0YwjwZZeysKaZ/6n6qMWyS7QIZPD0gxvAC01RAsgg1W34Xf+/+KF
	f3tKWG0c/HM9WmtOtSUMYE8+Vhwe1Z9oiG+K4T9xXumpkLPTwKqlPbwhNppJWA==
X-Google-Smtp-Source: AGHT+IHTZppbJxScJUDAxwVhfd1Yj/hteIcEWIDxsPlg05A/ujoKghFl0WFDrFfNc3HQAZXrkVDeUw==
X-Received: by 2002:ac2:48b0:0:b0:52e:6ee4:5eaa with SMTP id 2adb3069b0e04-52eb99d16demr830004e87.54.1720518050589;
        Tue, 09 Jul 2024 02:40:50 -0700 (PDT)
Message-ID: <ecfef639-11ed-4f7c-81de-d1a6c230c465@suse.com>
Date: Tue, 9 Jul 2024 11:40:40 +0200
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
> As noticed in the gitlab analyses, deviating bitmap_switch
> for Rule 20.7 in this way does not work for ECLAIR.
> 
> Instead, the deviation should be put in the macro invocation.

Why is this? I ask in particular because ...

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
>  
>  static inline void bitmap_zero(unsigned long *dst, unsigned int nbits)
>  {
> +	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
>  	bitmap_switch(nbits,,
>  		*dst = 0UL,
>  		memset(dst, 0, bitmap_bytes(nbits)));
> @@ -139,6 +137,7 @@ static inline void bitmap_fill(unsigned long *dst, unsigned int nbits)
>  static inline void bitmap_copy(unsigned long *dst, const unsigned long *src,
>  			unsigned int nbits)
>  {
> +        /* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
>  	bitmap_switch(nbits,,
>  		*dst = *src,
>  		memcpy(dst, src, bitmap_bytes(nbits)));
> @@ -147,6 +146,7 @@ static inline void bitmap_copy(unsigned long *dst, const unsigned long *src,
>  static inline void bitmap_and(unsigned long *dst, const unsigned long *src1,
>  			const unsigned long *src2, unsigned int nbits)
>  {
> +	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
>  	bitmap_switch(nbits,,
>  		*dst = *src1 & *src2,
>  		__bitmap_and(dst, src1, src2, nbits));
> @@ -155,6 +155,7 @@ static inline void bitmap_and(unsigned long *dst, const unsigned long *src1,
>  static inline void bitmap_or(unsigned long *dst, const unsigned long *src1,
>  			const unsigned long *src2, unsigned int nbits)
>  {
> +	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
>  	bitmap_switch(nbits,,
>  		*dst = *src1 | *src2,
>  		__bitmap_or(dst, src1, src2, nbits));
> @@ -163,6 +164,7 @@ static inline void bitmap_or(unsigned long *dst, const unsigned long *src1,
>  static inline void bitmap_xor(unsigned long *dst, const unsigned long *src1,
>  			const unsigned long *src2, unsigned int nbits)
>  {
> +	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
>  	bitmap_switch(nbits,,
>  		*dst = *src1 ^ *src2,
>  		__bitmap_xor(dst, src1, src2, nbits));
> @@ -171,6 +173,7 @@ static inline void bitmap_xor(unsigned long *dst, const unsigned long *src1,
>  static inline void bitmap_andnot(unsigned long *dst, const unsigned long *src1,
>  			const unsigned long *src2, unsigned int nbits)
>  {
> +	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
>  	bitmap_switch(nbits,,
>  		*dst = *src1 & ~*src2,
>  		__bitmap_andnot(dst, src1, src2, nbits));
> @@ -179,6 +182,7 @@ static inline void bitmap_andnot(unsigned long *dst, const unsigned long *src1,
>  static inline void bitmap_complement(unsigned long *dst, const unsigned long *src,
>  			unsigned int nbits)
>  {
> +	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
>  	bitmap_switch(nbits,,
>  		*dst = ~*src & BITMAP_LAST_WORD_MASK(nbits),
>  		__bitmap_complement(dst, src, nbits));
> @@ -187,6 +191,7 @@ static inline void bitmap_complement(unsigned long *dst, const unsigned long *sr
>  static inline int bitmap_equal(const unsigned long *src1,
>  			const unsigned long *src2, unsigned int nbits)
>  {
> +	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
>  	bitmap_switch(nbits,
>  		return -1,
>  		return !((*src1 ^ *src2) & BITMAP_LAST_WORD_MASK(nbits)),
> @@ -196,6 +201,7 @@ static inline int bitmap_equal(const unsigned long *src1,
>  static inline int bitmap_intersects(const unsigned long *src1,
>  			const unsigned long *src2, unsigned int nbits)
>  {
> +	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
>  	bitmap_switch(nbits,
>  		return -1,
>  		return ((*src1 & *src2) & BITMAP_LAST_WORD_MASK(nbits)) != 0,
> @@ -205,6 +211,7 @@ static inline int bitmap_intersects(const unsigned long *src1,
>  static inline int bitmap_subset(const unsigned long *src1,
>  			const unsigned long *src2, unsigned int nbits)
>  {
> +	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
>  	bitmap_switch(nbits,
>  		return -1,
>  		return !((*src1 & ~*src2) & BITMAP_LAST_WORD_MASK(nbits)),
> @@ -213,6 +220,7 @@ static inline int bitmap_subset(const unsigned long *src1,
>  
>  static inline int bitmap_empty(const unsigned long *src, unsigned int nbits)
>  {
> +	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
>  	bitmap_switch(nbits,
>  		return -1,
>  		return !(*src & BITMAP_LAST_WORD_MASK(nbits)),
> @@ -221,6 +229,7 @@ static inline int bitmap_empty(const unsigned long *src, unsigned int nbits)
>  
>  static inline int bitmap_full(const unsigned long *src, unsigned int nbits)
>  {
> +	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
>  	bitmap_switch(nbits,
>  		return -1,
>  		return !(~*src & BITMAP_LAST_WORD_MASK(nbits)),

... having the same comment on every invocation is naturally quite a bit
less desirable. So far I was under the impression that macro-specific
deviations can be dealt with by marking the macro definition accordingly.
I've been assuming this is a general pattern. If it isn't, would you
please first clarify what Eclair's specific requirements are for a SAF
marker to take effect when involving a macro?

Jan

