Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D45E9A713B0
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 10:29:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927373.1330118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txN45-0000kW-Vh; Wed, 26 Mar 2025 09:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927373.1330118; Wed, 26 Mar 2025 09:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txN45-0000hZ-Sj; Wed, 26 Mar 2025 09:28:49 +0000
Received: by outflank-mailman (input) for mailman id 927373;
 Wed, 26 Mar 2025 09:28:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txN43-0000hT-NF
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 09:28:47 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7661999-0a24-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 10:28:46 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so47086365e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 02:28:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fd9ec29sm175493175e9.30.2025.03.26.02.28.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 02:28:45 -0700 (PDT)
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
X-Inumbo-ID: b7661999-0a24-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742981325; x=1743586125; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lLezJDfb6wlt+VE8qyc+JEwTLurnNBYVVv4E9BTkDE8=;
        b=PFXrHJ6K7UfGrokjC3LPJSv0259P1xkl27ZlpsNt8rxneS1yXSwNEY2HG9mqxF59QY
         LUCX/PYEpUYE6IEOhLTXjVQa763Gd/BFpGEdsvywyWxzdO1a8x9aeFF06p5lxrgUwoPD
         DQrFmPzMUu8g6YGPDm0HK+NbRtfgS52ejvVEfff6Bkm2jg/Id1V5TrvGs73eVAs15fab
         G9sWxbydi0hbp41Et3x73CQJ1t7WoeoOvK9mv5HN1W/Dj+/owX0Yv+6SgdkHKDTFILvk
         VjfpAdooTtmQYoAjDa3XQ/q7GBwFQZlOPlt0tZqcMPWMTzHZU5E2FrQHV/nHMaUsu95e
         KyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742981325; x=1743586125;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLezJDfb6wlt+VE8qyc+JEwTLurnNBYVVv4E9BTkDE8=;
        b=JjE6DUpINQk9uOg2bF/a0A2HR3KrFbSDu4ZoV8ATAN048Aam0yjsYBzDCTCSmp0ylx
         yjwyNNk7bRe7Q3lnNmVx4r+TJovcEEaEo6f8trChkgo9gN1xmBS2BCHP0e0vxLM3bajO
         j9Lbpc10cd4QGinRXd7CDZtbZ3JuvNvdeWq6NQ/g3EJuwFnFLOU7yqNXihkCQ9X9jAEQ
         iKhBQMJzlHlaCnUlewkG41m5JRiN8KSgRCWsJHn+yZ4FaxkwBOoENmvAyZ+pUj1UJA31
         1NuyHmA3QOQlvKkFPMCThSqpAPKjtL/wRrLE6jLMN/46jPu3P2g0wBAQMpiWZw8gpQDv
         b9mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwzRYuUgk+DIHIOxG6AMmLqOtn9H9QYpYuY9jaLrWbNQXAvvQCr8C1tOHGTLX7jyrNKoPbBBwHEfM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyS6ky3a6a0sqMu2FARlLZxPJMiRCvLpUKzsiQF5gPx4x4EPjc1
	TtHSUGRysYc9Kp3uuAE2vxlU4THd4WAbUbu6t63G9tw6IpDuPv7P6iFU6fKvjA==
X-Gm-Gg: ASbGncvoG3A5EUC5ldXCVQZEn1DcEiOYv4kr3BWW89pMfv2JsVaARKHGZwykZaqDZJM
	OJ9m28iNJFzWKI4edicXE6ljkVTsqrK1TtWmvT2fdEAL+8noeHlgo4arrXEIrXLaLcBGu856OQc
	Wuw0010gh5J9QmApKPXOb8ptnojWvymV50Nda9ad848MCX5Xbnvg6aHoHazf63enh0UH4c3Xwdj
	EhzYHdLPQXuaA+/X0gjr6o3f7uQNatkqdsCtL2RP3dM2/z4sBBpRIc3HufrjZZf5/dIMIQKfnqT
	l8G3CVthGpXM1VEdE17hL7UGinOvl89ieLtxZ1/iUnO8mTpJYK9ZgwJdcFboyB83ml14nsHFOSk
	eYlMTQkjHHkPAwYMc3PcI4wndLnSRdA==
X-Google-Smtp-Source: AGHT+IEgAE2EDb2/urRVuy6zKDqX3FNmt+oWa6d8dIx/5jMqt7A8p5wsDuEZElsXKYWaWFtpDeY05w==
X-Received: by 2002:a05:6000:2103:b0:391:2954:de27 with SMTP id ffacd0b85a97d-3997f93c2b0mr14045035f8f.45.1742981325528;
        Wed, 26 Mar 2025 02:28:45 -0700 (PDT)
Message-ID: <45ddac7d-a8cd-4bf0-91ee-83d266628cca@suse.com>
Date: Wed, 26 Mar 2025 10:28:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/elf: Remove ASM_CALL_CONSTRAINT from
 elf_core_save_regs()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250325180005.275552-1-andrew.cooper3@citrix.com>
 <ae306524-bc22-450e-88d6-8c0785003e17@suse.com>
 <1a01a590-acb6-4b6e-9fb9-3af4deabb4b5@citrix.com>
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
In-Reply-To: <1a01a590-acb6-4b6e-9fb9-3af4deabb4b5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.03.2025 10:17, Andrew Cooper wrote:
> On 26/03/2025 9:00 am, Jan Beulich wrote:
>> On 25.03.2025 19:00, Andrew Cooper wrote:
>>> I was mistaken about when ASM_CALL_CONSTRAINT is applicable.  It is not
>>> applicable for plain pushes/pops, so remove it from the flags logic.
>>>
>>> Clarify the description of ASM_CALL_CONSTRAINT to be explicit about unwinding
>>> using framepointers.
>>>
>>> Fixes: 0754534b8a38 ("x86/elf: Improve code generation in elf_core_save_regs()")
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>>  xen/arch/x86/include/asm/asm_defns.h  | 5 +++--
>>>  xen/arch/x86/include/asm/x86_64/elf.h | 2 +-
>>>  2 files changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/include/asm/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
>>> index 92b4116a1564..689d1dcbf754 100644
>>> --- a/xen/arch/x86/include/asm/asm_defns.h
>>> +++ b/xen/arch/x86/include/asm/asm_defns.h
>>> @@ -28,8 +28,9 @@ asm ( "\t.equ CONFIG_INDIRECT_THUNK, "
>>>  
>>>  /*
>>>   * This output constraint should be used for any inline asm which has a "call"
>>> - * instruction.  Otherwise the asm may be inserted before the frame pointer
>>> - * gets set up by the containing function.
>>> + * instruction, which forces the stack frame to be set up prior to the asm
>>> + * block.  This matters when unwinding using framepointers, where the asm's
>>> + * function can get skipped over.
>> Does "forces the stack frame to be set up" really mean the stack frame, or the
>> frame pointer (if one is in use)?
> 
> What do you consider to be the difference, given how frame pointers work
> in our ABI?

My point is that frame pointers are an optional part. Sufficiently high
optimization levels omit them by default, iirc. And depending on
CONFIG_FRAME_POINTER we may explicitly pass -fno-omit-frame-pointer. Even
in that case there is a stack frame that the compiler is setting up. Yet
in that case the effect of ASM_CALL_CONSTRAINT is not relevant. Hence
also why the construct expands to nothing in that case. The comment,
however, is placed outside if the #ifdef, and hence applies to both forms
(according to the way I read such, at least).

> It is the frame pointer which needs setting up, which at a minimum
> involves spilling registers to the stack and getting %rsp into it's
> eventual position.

Right, and all I'm effectively asking for is s/stack frame/frame pointer/
in the new comment text. Then:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Alternatively part or all of the comment could be moved inside the #ifdef.

Jan

