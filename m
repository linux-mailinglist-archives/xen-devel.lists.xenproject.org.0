Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AA99A05B4
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 11:38:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819853.1233319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10T7-0001Gh-Pp; Wed, 16 Oct 2024 09:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819853.1233319; Wed, 16 Oct 2024 09:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10T7-0001F5-Mg; Wed, 16 Oct 2024 09:37:25 +0000
Received: by outflank-mailman (input) for mailman id 819853;
 Wed, 16 Oct 2024 09:37:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sXg9=RM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t10T5-0000ua-L9
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 09:37:23 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ee26b2c-8ba2-11ef-a0be-8be0dac302b0;
 Wed, 16 Oct 2024 11:37:22 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4314f38d274so9005335e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 02:37:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4313f569a06sm43202255e9.16.2024.10.16.02.37.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2024 02:37:21 -0700 (PDT)
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
X-Inumbo-ID: 3ee26b2c-8ba2-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729071442; x=1729676242; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Nu1ll/Q7Ytyj2ygj7KHssanwlyEVJOTUsRXUr7xGdr0=;
        b=AyoFjq1clVics7s5Hwnc10Icgc86bteFe+wggnQBJaxUb1MXz16djm9JN1mjoDcfhz
         G9p0DUDD3+iHfQr6zBGyWmlke0MmxJ7d/mYpjb8/ctJ+Ljq8v9TZzOcCEN1jC3OChzWA
         jUfo5i1/jQuoH1u38/8qAJnbdl/9PtCpZ4rLn1Mqt738RU9IbZ2NrKvOB8FmFlzXdEos
         6jhhmofWXRMPO2iTSL3n2+DAZkOOfJmEn9zI9TaSPAJpEMZ2hdt4GMJ+XGvGwzw8Wyp0
         dQF6UkLG5lwm6rCIm/iAlwT6I50+kugpMkxjW9QwQRlrIqTF5MpUJWRBv0F6wshfFPeq
         awhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729071442; x=1729676242;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nu1ll/Q7Ytyj2ygj7KHssanwlyEVJOTUsRXUr7xGdr0=;
        b=T39vc+ECwPXesfuI74U3yJwVO+jPX2UcxC1HxIOvAe4dNB7ytJaMHti8ifIs2/laQ8
         5Grh25ftpqNShrg5a6TnkglSr3oyvlKrm6u4lPOsWxizXti3AsAL3wQD1s7awAbM3IWv
         IfD8RPHdKfcvGMN0uEEEwe+KXCQkIoljnzrSatNFExVoYygX5NKD0Y1VxGQnrQhPZgsL
         7vu4Y1g5H71P020kvBpsgp82E+y6yKnwLB9OA7mT5zHJBPOiLSdu4w7AhBqT4lzaI/xT
         +o/jyzI+vgpxw07HlUH6nTiStark6AqcxerP9003dyXkA1GxanXsEOhzpB436F1TADtD
         dRuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf6Cr2ZdzR/38RTf1cStx64MSdxCUeFxYZ7iUDA3gHD5JHtaWJth93OFv5jQz1vNH0vWh0c2WyK5o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx0EdHFmKnYKSC6NdeQyfsNJxrnERchUq1isUHmQtvWxWZcWMtm
	wqb+hznb3Da+fk3CgH45LPT9KXFcoRsQS7AOLA+oJssy2RXtCoTi5ZvXvTKoUw==
X-Google-Smtp-Source: AGHT+IFr62U+fZr9ILF3BKO2IoHBpL/4xypsCXXce08JQoE9zUlf92isD4kicN5Fy6fKIRe6D4BRTA==
X-Received: by 2002:a05:600c:5108:b0:430:9fde:3b92 with SMTP id 5b1f17b1804b1-431255e033bmr171123925e9.14.1729071442240;
        Wed, 16 Oct 2024 02:37:22 -0700 (PDT)
Message-ID: <f5572afc-7c9e-4c2e-ba3f-6ce4f3b71d59@suse.com>
Date: Wed, 16 Oct 2024 11:37:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] byteorder: replace __u16
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <17b6b894-9b41-4e8c-a3a9-ce837797eac3@suse.com>
 <dee82fce-ffc8-493e-8d99-f5c3b321e5b3@suse.com>
 <a7b6fc68-a568-4b61-895d-c295ba3d3095@citrix.com>
 <b5b20a0c-7584-4885-b7b0-c4b1cba8c0bd@suse.com>
Content-Language: en-US
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
In-Reply-To: <b5b20a0c-7584-4885-b7b0-c4b1cba8c0bd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.10.2024 15:34, Jan Beulich wrote:
> On 09.10.2024 15:20, Andrew Cooper wrote:
>> On 09/10/2024 10:21 am, Jan Beulich wrote:
>>> In {big,little}_endian.h the changes are entirely mechanical, except for
>>> dealing with casting away of const from pointers-to-const on lines
>>> touched anyway.
>>>
>>> In swab.h the casting of constants is done away with as well - I simply
>>> don't see what the respective comment is concerned about in our
>>> environment (sizeof(int) >= 4, sizeof(long) >= {4,8} depending on
>>> architecture, sizeof(long long) >= 8). The comment is certainly relevant
>>> in more general cases. Excess parentheses are dropped as well,
>>> ___swab16()'s local variable is renamed, and __arch__swab16()'s is
>>> dropped as being redundant with ___swab16()'s.
>>>
>>> With that no uses of the type remain, so it moves to linux-compat.h.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> I'm unconvinced of the need of the separate ___constant_swab16(). I'm
>>> also unconvinced of the need for said constants (that even had casts on
>>> them).
>>
>> There is a still-good series deleting the whole of byteorder/ and
>> replacing it with a few-hundred line single header.
>>
>> It is the second thing stalled on a governance change (prohibited
>> reasons to object to a change) which clearly no-one gives a damn about
>> fixing.  In fact double spite because it denied a good engineer his
>> first changes in Xen.
>>
>>
>> I don't particularly feel like trying to polish byteorder.  I'm inclined
>> to rebase+repost Lin's patches, at which point the majority of this
>> series simply disappears.
> 
> I wouldn't mind you doing so, as long as that other series then progresses.
> What I don't want to get into is the other series being stuck rendering this
> one stuck, too. Then it would imo be better to take this one first, rebase
> the other on top, and work towards it becoming unstuck (whatever that takes;
> I have no recollection of what the issue was back at the time, all I recall
> is that, yes, there was such work at some point).

Just to have a clear picture: Was your reply an objection, with you indeed
meaning me to hold back this tidying work? If so, can you please indicate
when, at least roughly, you mean to re-post what you think wants re-posting?
If not, can you please indicate so, for me to commit stuff that's otherwise
ready to go in (and which that other work should be easy to re-base over)?

Jan

