Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5D0B08802
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 10:36:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046392.1416709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucK6N-0003XL-Kg; Thu, 17 Jul 2025 08:36:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046392.1416709; Thu, 17 Jul 2025 08:36:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucK6N-0003VD-I1; Thu, 17 Jul 2025 08:36:27 +0000
Received: by outflank-mailman (input) for mailman id 1046392;
 Thu, 17 Jul 2025 08:36:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucK6L-0003V7-H8
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 08:36:25 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ed5d220-62e9-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 10:36:23 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so5876395e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 01:36:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3bbe52cdaesm15352085a12.10.2025.07.17.01.36.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 01:36:22 -0700 (PDT)
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
X-Inumbo-ID: 1ed5d220-62e9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752741383; x=1753346183; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ip4Q3/HNx5Jj5pLFerg5GSyF7uOqp0iNk2jET3D7mjA=;
        b=M80Lmstx5DHGydzOgIGjQTeMiKS83ppljTRfAJwM7niF6fDVD4h9GTl0cAf21mkvwz
         ZOxqNVu5OZ25X5o527AjCT46sKxyf+aUXnZMSo5rs98ZDv4XX1GNHrNNJNL57aPPOKOq
         +EGRSyM/bgkrvnhZr7WU+CkczSL423f+r5CqTPNpDZJ2bE+LM/9qBTwnhc8WsXeDWvyq
         zwp1eGqhmjSbGZZXsRJqOiNFTZE3jeg0//e5q5fQJFSrzjh2nhYiHGHHA0bZZ5e+cocq
         wpDxF4NjxT/WJ0+tm5VuhkQrVaDUEjiBZgUITNS1Gqh832nCJl6D6ZpyQ2jmAU15sNzk
         d3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752741383; x=1753346183;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ip4Q3/HNx5Jj5pLFerg5GSyF7uOqp0iNk2jET3D7mjA=;
        b=rcSKhTtXX5kNF7N7SFZFxLxwoSz9I+ZpwoOp+aGyDbAIYShjH+CaWM93omD8bL+/Hl
         hncU0EY7GsK/cfQocSlSwGRXpbbNjVjzN/trL5PsSNk4UbnAqBZ2KbB7t6WoEff9BGEw
         On6SA4LNMlCsaSNEbccY/BXZAnuQHxHI1cJvupFN8XAdP1N5R8GMxFBJQ2+lkgXQD51h
         lo2ZQPeLCDpeNYDtFQlu1hCPFzRAl9R18Yad2v1dndSFub9Nvu11jQBOOHtRd310fG7z
         qAXptq0p3HofgMNLgzf8K2MjSN0zIvrMiemzoPenk9pfI3DnWh5a3jsEfUvKtQiRUclg
         RAig==
X-Forwarded-Encrypted: i=1; AJvYcCWSf4TD6l5CckEP8Nne5X0Hphm7ABWsGYXUtUewfnOl7fvOxweoa55+/An6Q3gGSjscxl1AhojyfT8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzO+XyWmuHnyvMVwJ6BupGxatbU7Yk0yUrsrxpbGTw34VXcsfJs
	zlBy1Oo4RIdxQRq9PV0dAtmMK9DusIF9iAufLkTyHKIokhXgbtAJicVV0kmptSl2DA==
X-Gm-Gg: ASbGncttbGBnr+hifSMWJJyMwUHL0OFeGGbzT0TNEc4hjaU4/ROzoXuaKHV9LPdS7/Q
	K5V1ZR61C0GdHh+Svea7oFeedtSmOsUnq8e4OUZDh12XBHy6nW3U0B1QJqzSsO7pgrOlroUNvkn
	O7JmnkXpzhG5NtSVwUERYZ8fqDvKbJcQykX/8Mok1yyTkWp5ZJ+aKQ4VYrY3wLKvikzyVe/O1tZ
	fa03iiBDb/NnVA3kRBgySkLQJteq5L3jCRxHhnm0VO0+hNiE50+JgH66tUh5ZMu2pQY/bMBdR+A
	DuQPGF+QAXgRHPON2Nf5zl7at3Rgpe9l1qve6C/AEXutwfTgvCouqVHp+VJdS6zkhTpiKpUc9ok
	1tIzA/yjVVev7AgRwbBBMVc/ul2MeBtavX0J+gBtX6NmHhjBVV+M+XzTfeqPnexlt70FsVUrGYi
	2OiUxbHMJfdxyvqWwSiA==
X-Google-Smtp-Source: AGHT+IGtkzQrts7f4XJ7rh1iK2xHY5nB+NkzjS3ijtx6mB9Xyk9VfEmN5XS7FUi6wRxIB2DTasWprA==
X-Received: by 2002:a5d:5f52:0:b0:3a4:dc42:a0ac with SMTP id ffacd0b85a97d-3b60e539d7fmr4039939f8f.49.1752741382715;
        Thu, 17 Jul 2025 01:36:22 -0700 (PDT)
Message-ID: <46feb3ba-d298-4139-a97f-fb3961b0f8d4@suse.com>
Date: Thu, 17 Jul 2025 10:36:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen.efi has MEM_DISCARDABLE flag in Characteristics field of
 .reloc section
To: Yann Sionneau <yann.sionneau@vates.tech>
Cc: yann@sionneau.net,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>, nickc@redhat.com,
 Demi Marie Obenour <demiobenour@gmail.com>
References: <39104717-4b64-483c-b6fd-d30069df4c58@gmail.com>
 <7e039262-1f54-46e1-8f70-ac3f03607d5a@suse.com>
 <7a7f40b8-5d73-421a-9358-30421d12a243@vates.tech>
 <2e1d2e67-ac14-4cb7-a6ea-4351d1418be9@suse.com>
 <06ad1fe7-cc79-4976-8748-318a7f8f2b45@vates.tech>
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
In-Reply-To: <06ad1fe7-cc79-4976-8748-318a7f8f2b45@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.07.2025 10:28, Yann Sionneau wrote:
> On 7/17/25 10:22, Jan Beulich wrote:
>> On 17.07.2025 09:32, Yann Sionneau wrote:
>>> Hello Demi Marie, Jan, Nick, all,
>>>
>>> Thank you Demi Marie for bringing this topic on the mailing list.
>>>
>>> I discussed it a bit with Jan on Matrix but the situation is not pretty,
>>> there is no clean solution that stands out easily.
>>>
>>> As Jan said, it seems .reloc is meant to be discardable, so we can't
>>> blame binutils LD for putting it:
>>>
>>> https://github.com/bminor/binutils-gdb/commit/25c80428af3311e761c87d8f706596b9701602ec#diff-078cf751467928c038996b40073a682425712b9b01182424e68cf18fb08a75b5R953-R977
>>>
>>> And we can't obviously blame the loaders for honoring this flag.
>>>
>>> Most reasonable solution indeed would be to ask binutils to add a link
>>> flag to say "please do not put the DISCARDABLE flag on the .reloc section"
>>>
>>> I'm adding Nick Clifton from binutils in CC so that he can comment on
>>> this possible outcome or any other possible solution.
>>>
>>> In the mean time, while waiting for a solution to emerge (and be merged,
>>> and released) what do we do?
>>>
>>> Do we put some hack in Xen build Makefiles so that xen.efi is
>>> post-processed to strip this bit?
>>>
>>> This could be the temporary solution.
>>
>> As indicated - I don't think this is just a temporary solution. Beyond Xen,
>> I simply don't see value in adding a linker flag (which then, sooner or
>> later, llvm would also need to support just for Xen). The question rather
>> is how to make the Xen side hack as little hacky as possible, without
>> relying on the fragile behavior of objcopy.
> 
> Ok I didn't understand your previous answer, it's more clear now, thank you.
> Would you consider using a tool like this less fragile than objcopy: 
> https://github.com/fallen/keeprelocs ?

Well, something like that. Generalized enough to at least be halfway easy to
later also use for further purposes, and if at all possible using the header
we already have for PE (efi/pe.h).

Jan

