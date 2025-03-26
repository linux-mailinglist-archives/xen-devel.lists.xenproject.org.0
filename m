Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1679A71A67
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 16:33:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928009.1330770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txSkk-0000RR-JY; Wed, 26 Mar 2025 15:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928009.1330770; Wed, 26 Mar 2025 15:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txSkk-0000P9-Gu; Wed, 26 Mar 2025 15:33:14 +0000
Received: by outflank-mailman (input) for mailman id 928009;
 Wed, 26 Mar 2025 15:33:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txSkj-0000P3-Dj
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 15:33:13 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ffdd6c1-0a57-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 16:33:11 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3912c09be7dso4669079f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 08:33:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82e83482sm5929025e9.14.2025.03.26.08.33.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 08:33:10 -0700 (PDT)
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
X-Inumbo-ID: 9ffdd6c1-0a57-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743003191; x=1743607991; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D6mNQiPv2roExn7o1sekMybwiaNzAsyneItle3PBlpk=;
        b=O6Lfk+dcVRB9Bk6Bse+r143fgidkI2U6faz9Uj8W0YGqanqA+kpsy19PK78FcBAC/1
         AKbXkLcZuK9XZ6UCkwtP8jk+PxBgWU+KuJ3P/uvEVdQ9jLN3HX8fDjDeLV/m4wxN0/iO
         TrtpdLPO88SEQvbO5gK8GaVN8+K6UOEeXJV3ZYfJQSv0GUnLdFoTZsE1+Zf3y4nKm5q1
         OZnLeLfL1X8kJPvlwK6DO4HoFN+4t4WKdaRo/qhR6y2WTWOnim4FMAl0VU6iY6tuLd0X
         /FpEAagDREk0+9kuYXw40BjJ5YyA5WIBYUF06X1XHePvmyeRvzRs7tFv8jdJg1j6l1MH
         7wLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743003191; x=1743607991;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6mNQiPv2roExn7o1sekMybwiaNzAsyneItle3PBlpk=;
        b=Lobo9r/LcGtUdomJ6Dzbfdh4pU45gzTqP6TCLeaJvNBhld5/Ud7+gWsK3P42iMec4J
         oNyx7waCzQ1GS0nQsWOLw1ZhZPF6I56dgTewllh+P3XalptPqmzEoi8YGS8vtTjQ3HAs
         54ivJgO1kGPTk/xqHZ+hWrAjKQ2TlHa0pBAvOaKeqYNfsVa+6eb3L2bPuRNrt375/Wvr
         hhpwEsif7KGL/dsTEKQJdTiouuZJwjTkxWvaH5TVLv6rFA51D+OAS7uQUQVTuIIKUkHh
         Arvip2CyaH9CuPwBMtou5481O7tHT3iH9DhfXSuhjw15v2uCt6wcCW8Rw6TuMdLk6F06
         qNAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7rtjLLdc3toJXE7/xCDOJFzjiuKbDEEBvzpuIuDWYxOn3cZ7GOtvWYlmCYLBPngIQynFkSpjQK3g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyTC8PWzIjz8hEQu71h0XWDaeRNcZ2d2p+it7dSRJel9C07EwOI
	3fEf2tIQHGq9s8zUCnlL8zPT8JGONi10sTX2FaaSeNVl72g4lsELRfx+vFDR3g==
X-Gm-Gg: ASbGnctYWqVwoQHH4H8SHt8gvQKqBW6ztgBiA59/zS0zAqptJ0Lieg9xBj6ppHlAXce
	5sEV77+eJvwckKTYBp4N6Y27oRQcQht3UIqTenwSN3CIWor3n3A8PEJXxHufgfK/xalIAfbYOjG
	At0+Mt7YWw+qzOgxM5bP1qVEsenkyLcK1bnbnYHfqJxIh2cp8sKNeaJGq+XcZlhzkumJGQkisrw
	JPC7r0RJYXPODMcSHLN9UBlVl5s8O4VEOnhkQaTIp65FdwrSgddrHYBHrvAAcHAQnmgPbb8cIUi
	5w8SsE0EjNd4uVlqMvlmdZKVKKFe4AS61uIAVNEz2s7sPfkg6veGHvcJB2bAc2wdEjzBQniMidt
	AcDCLnUqPGAGuX3B75hK1YpGm0cOtjSXWVu+Pk3Nl
X-Google-Smtp-Source: AGHT+IG3cMWRg9GpjcfBghWL7oqhUP++O/0VjDq4zeOdi/WtmSsB4JbzrNNA/Mw6oA2BrZ3h6OPuFw==
X-Received: by 2002:a05:6000:1864:b0:391:10c5:d1ab with SMTP id ffacd0b85a97d-3997f8f61d0mr17234935f8f.5.1743003190558;
        Wed, 26 Mar 2025 08:33:10 -0700 (PDT)
Message-ID: <4af7fa9a-ec99-4304-8016-9f1448d9e2a6@suse.com>
Date: Wed, 26 Mar 2025 16:33:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/emul: Adjust handling of CR8_LEGACY
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250326152558.350103-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250326152558.350103-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.03.2025 16:25, Andrew Cooper wrote:
> The CR8_LEGACY feature was introduced in the K8 Revision F.  It doesn't exist
> in prior revisions of the K8.
> 
> Furthermore, from APM Vol2 3.1.5 CR8 (Task Priority Register, TPR):
> 
>   The AMD64 architecture introduces a new control register, CR8, defined as
>   the task priority register (TPR).
> 
> Give CR8_LEGACY a dependency on LM, seeing as CR8 doesn't exist on pre-64bit
> CPUs.

But that's not what LM stands for in the dependencies. If you want to run a
guest strictly as 32-bit one, you could suppress exposure of LM. That
shouldn't also suppress the ability to access CR8 then, though - the LOCK
way of accessing was - aiui - specifically added to allow access to it from
a 32-bit kernel.

> Additionally, from APM Vol3 4 System Instructions MOV CRn:
> 
>   CR8 can be read and written in 64-bit mode, using a REX prefix.  CR8 can be
>   read and written in all modes using a LOCK prefix instead of a REX prefix to
>   specify the additional opcode bit.
> 
> i.e. the LOCK prefix serves as an alternative encoding for REX.R.
> 
> Switch decode_twobyte() from += 8 to |= 8 to better match the description
> given.  Other indications that the encoding isn't additive are that the CR
> intercepts stop at 15, that LOCK MOV CR8 generates #UD rather than becoming a
> CR0 access.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> Also, designers never put an ADD into silicon if they can possibly avoid it,
> because it's slow and large compared to the single OR gate needed in this
> case.

My reading of the respective doc was never resulting in something unambiguous.
I find this argument far more convincing than anything that's in the doc.

I probably should have tried out REX + LOCK. Maybe I even did and concluded
from it faulting that the two things are cumulative.

Jan

