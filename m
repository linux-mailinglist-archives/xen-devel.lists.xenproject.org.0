Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B4385F655
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 11:59:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684333.1064113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd6nl-0004hp-Az; Thu, 22 Feb 2024 10:59:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684333.1064113; Thu, 22 Feb 2024 10:59:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd6nl-0004fs-6N; Thu, 22 Feb 2024 10:59:41 +0000
Received: by outflank-mailman (input) for mailman id 684333;
 Thu, 22 Feb 2024 10:59:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rd6nj-0004St-HS
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 10:59:39 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 786b1307-d171-11ee-98f5-efadbce2ee36;
 Thu, 22 Feb 2024 11:59:37 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a28a6cef709so962711766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 02:59:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 hu17-20020a170907a09100b00a3e6c6f2140sm4446117ejc.117.2024.02.22.02.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 02:59:37 -0800 (PST)
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
X-Inumbo-ID: 786b1307-d171-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708599577; x=1709204377; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PdpM/T7oirETjJPsD87ga5uMfssPawpKdYm3AcDRhag=;
        b=WgAuoFBpoe17YpWQaXs+gZyxD4xo8uktVXVpGSfNhauiu0nHRUGFaNfzJ5jnSHlReV
         antnshXbTjHC6yaB+EdVIa3KSpIy5yRKR+rMmRh6ptPs/ew6QptZZBns0u5txWZXoydK
         6IVXaeQVNwubKiQkiIKhoGk9vtUiXr1NPAe7FBBGUL/mJS4qnGCI6Ne5pnDMq5xOIM4s
         aix4/pKAxaTWXW0NUHB3H1hNRXFRAgbwsv2wfMXY+48TD02XQEw2LYd7Oevy598BukLF
         vN0x6DnxFk+Nl52WRXjyjv2VdeI8atp9j7jCAa9zT1rPFbVuYA7T7dovNiQjaq6MNbN1
         NTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708599577; x=1709204377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PdpM/T7oirETjJPsD87ga5uMfssPawpKdYm3AcDRhag=;
        b=rVOnLw1Rm4QTqgUeUeppNq7yJsCRLxVUJiuXSyfuV4G7e/r0uC6RPi1R/CwEHn4Y4G
         LqMGjFWWWJe2fPWbAIWIAw3U49ZtbfdcQnt9Bqu3W6GGHeF1jksmMMthuEAl+nhYGHsJ
         5Kjc2nA3crV8FVP9Nirw9Ts56shIb358QzI4Ycp+qp/A2CG8VqGk81O+32onqreX6+PP
         uGFADpkLTV6Q6Wl+c83/H3cum45DKc1a+CZ85+IuA3wA6XP7V3vCC2zsaiy9pIkd2dqc
         vBfa+KLLRRyEWmgDWR+0T/SBZ5GtxZ1NusC6pH6Mu13uIgvhOWGT+yK0eQusICZQEHr6
         /QhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9qTQ5yf/+R1MkSZbygG5CTOY9+C9lGXzlrINGW17LaKGaEeB8xY/aNw/OGHuNYQA073JgUfwqbyFJiYWeVxJ/sfOHz1oLzQ4jDYvcfQk=
X-Gm-Message-State: AOJu0YwahhyV8oMuv31hOFKX/kUPOpxATK0MgcD+U6ZmZgcrIpVk4Dwo
	3PuYb0EcbbrAKrK1ieEkRwaIS6MU7NuQxyzr/1TYbPkfKJ+JGG4VWz2xnP9X6Q==
X-Google-Smtp-Source: AGHT+IHw5W6RYLXt0djKTEwzsfBZdmZU5AEmZup3/2gfVvFwbekEq8RZOJX2uTjR/NZGIYCvHS/sgQ==
X-Received: by 2002:a17:906:a86:b0:a3f:97cf:c41e with SMTP id y6-20020a1709060a8600b00a3f97cfc41emr560844ejf.20.1708599577281;
        Thu, 22 Feb 2024 02:59:37 -0800 (PST)
Message-ID: <6af07ce2-7987-4ac0-a5d5-14004146aa08@suse.com>
Date: Thu, 22 Feb 2024 11:59:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/altcall: use an union as register type for function
 parameters
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240221170331.60605-1-roger.pau@citrix.com>
 <c236f02c-241b-4f1d-b037-1d66a8f87d5a@suse.com> <Zdcm6CrINxGeKU1M@macbook>
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
In-Reply-To: <Zdcm6CrINxGeKU1M@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.02.2024 11:50, Roger Pau Monné wrote:
> On Thu, Feb 22, 2024 at 11:32:14AM +0100, Jan Beulich wrote:
>> On 21.02.2024 18:03, Roger Pau Monne wrote:
>>> The above can be worked around by using an union when defining the register
>>> variables, so that `di` becomes:
>>>
>>> register union {
>>>     uint8_t e;
>>>     unsigned long r;
>>> } di asm("rdi") = { .e = b };
>>>
>>> Which results in following code generated for `foo()`:
>>>
>>> foo:                                    # @foo
>>>         movzbl  %dil, %edi
>>>         callq   func
>>>         retq
>>>
>>> So the truncation is not longer lost.
>>
>> But how do you explain this behavior? I see absolutely no reason why filling
>> the one union field should lead to zero-extension. If I'm not mistaken the
>> language allows the rest of the union to retain undefined contents. So to me
>> this looks like you're converting something that failed to build due to a
>> (presumed) bug in Clang to something that any compiler would be permitted to
>> translate to other than what we want.
> 
> Oh, right, I was expecting the compiler to zero extend it, confabulating
> how unmentioned fields are initialized in structs.
> 
> However, if as mentioned in the psABI thread, the callee is required
> to do any zero extension as necessary, using the union shouldn't cause
> issues for compilers that implement the ABI properly.
> 
> IOW: I don't think the proposed workaround would cause issues for gcc.

Well, that's making a lot of assumptions then. There may indeed be little
reason for the compiler to emit different code, but it is absolutely free
to do so. I continue to think that we want to limit this workaround to as
narrow a set of compilers as possible. Clearly for Clang the code is
better than without the workaround, so there's no reason to take this as
an improvement even if in some obscure case it would still cause an issue.
But for a compiler that produces correct code without this workaround, we
shouldn't chance the workaround breaking some case somewhere.

Jan

