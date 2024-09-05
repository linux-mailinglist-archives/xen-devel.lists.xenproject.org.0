Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFF596D4C1
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 11:56:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790986.1200741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sm9DG-0001YC-PK; Thu, 05 Sep 2024 09:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790986.1200741; Thu, 05 Sep 2024 09:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sm9DG-0001WC-Mj; Thu, 05 Sep 2024 09:55:38 +0000
Received: by outflank-mailman (input) for mailman id 790986;
 Thu, 05 Sep 2024 09:55:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sm9DF-0001W5-1E
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 09:55:37 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff2fdfca-6b6c-11ef-a0b3-8be0dac302b0;
 Thu, 05 Sep 2024 11:55:35 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2f502086419so7715411fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 02:55:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc699e68sm1010926a12.62.2024.09.05.02.55.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 02:55:33 -0700 (PDT)
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
X-Inumbo-ID: ff2fdfca-6b6c-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725530135; x=1726134935; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EmjLVAtNJbN6aDw8jfGE9gAya5PI860JO+nqmwI/OFs=;
        b=b5JxCDqhtJRPshHLX4+QRx5wupeJ7o0rczwEzsV12R2QBjWzPMXWsO1upET9ulRRfW
         EJ3E//MsNKtDwm8n/Sj/UIuSoWCxMcmXT3eHO1VbAf50K/49NFh6n6q1s+wgkoyTarJU
         k+BtKjvxopbosnIiMYHoNtCDfLyT2d9FxgsG4xE+T9gC86ZQ07t++W8OcxdIG6QEHsWT
         3SGqGwJHUnMVk4jlGqNNax6LRfwbyF5sy8Hi0JUG9NuMhM0C3qAcrgNNUB/66x2f9neg
         JfJaMW5NpwyK6BdyM68CSHD/utgWDLRXFt83zfIjac5H0Sfr2G3fnh3XINfuzZppE3w/
         5WJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725530135; x=1726134935;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmjLVAtNJbN6aDw8jfGE9gAya5PI860JO+nqmwI/OFs=;
        b=d4jIQQOtC/Amaz8BCRYNoETHIu48PCLIWEsUX3Dl3OdrgSoFy8ibhktVF1wecr6+qA
         spbjoMwnMlGCdMMniCFKMxKt9mN9+u1Eqfe273/AM0PpmXkibL93wUePRd/dKfn0yaSD
         e4WA/+87Oykk35iJy5jYsA1N6E2BuPWmJOwTypAZHtbAD55re/58IlZvh866tgGXh0GD
         a8EBofuwRn4Mz1SnfbDYj55/V8y+trHOSvnHe+Eq2cixCSea8976J+5omTq2u253N1Zq
         yZnUn4LI2bRP9dPbSwc9GueixOxv9sAhSxFNp56CaSEaGVhY6ZWi25FS55KtGF2SPGW9
         CHQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwS7M++N4DmRT6ZdlLzy9pPg+HkbJCBqk2Vjuc9Q4LYG5MDsU5r7hRvvA2saZKuFeHcLZfP5K2GCo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7KBivGATm9DlLcEdPul+pQIVjkFwv7WEHhq9f7EzTG2hxLvsr
	Tq59RW8DgtzR5O2hQcJIBUrkFiG+enbxAMh6wqbKlxcQ4BKOGlZA0JOfddOINk4fiQ9Bnufo8uQ
	=
X-Google-Smtp-Source: AGHT+IFZ70utS0PV1ujFf8Uto8e5Ewur9Ys5dxzzfLQPmVvCzgFT2l4VeeUU+13HfqdBxLjpogCvVg==
X-Received: by 2002:a2e:752:0:b0:2ee:4c66:6828 with SMTP id 38308e7fff4ca-2f64441f272mr58903041fa.24.1725530134648;
        Thu, 05 Sep 2024 02:55:34 -0700 (PDT)
Message-ID: <2cc9a2a1-61df-420a-9b50-d6e96a6fd162@suse.com>
Date: Thu, 5 Sep 2024 11:55:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] x86/bitops: Use the POPCNT instruction when
 available
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240904225530.3888315-1-andrew.cooper3@citrix.com>
 <20240904225530.3888315-6-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240904225530.3888315-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.09.2024 00:55, Andrew Cooper wrote:
> It has existed in x86 CPUs since 2008, so we're only 16 years late adding
> support.  With all the other scafolding in place, implement arch_hweightl()
> for x86.
> 
> The only complication is that the call to arch_generic_hweightl() is behind
> the compilers back.  Address this by writing it in ASM and ensure that it
> preserves all registers.
> 
> Copy the code generation from generic_hweightl().  It's not a complicated
> algorithm, and is easy to regenerate if needs be, but cover it with the same
> unit tests as test_generic_hweightl() just for piece of mind.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



