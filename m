Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D26B30EFD
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 08:33:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089569.1447100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upLKC-0006xf-Ut; Fri, 22 Aug 2025 06:32:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089569.1447100; Fri, 22 Aug 2025 06:32:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upLKC-0006vP-RT; Fri, 22 Aug 2025 06:32:32 +0000
Received: by outflank-mailman (input) for mailman id 1089569;
 Fri, 22 Aug 2025 06:32:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDWw=3C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1upLKB-0006vJ-Hl
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 06:32:31 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6f69fec-7f21-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 08:32:29 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-afcb7a8dd3dso257265566b.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 23:32:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded35547esm540832166b.50.2025.08.21.23.32.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 23:32:28 -0700 (PDT)
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
X-Inumbo-ID: c6f69fec-7f21-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755844349; x=1756449149; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sbWtywPyRVbOYriWTI/NOHCQnU/KatYA0nzQ5cWfK5k=;
        b=Mg4qUKmzQNYHMqvQdzt7Em71Xps8B7gV2PZb3IjEg+a7kh/Z2syWecmAiYxNwVuJdT
         uhZeUv9u1EFnU6wtqMK1ge1brWzdXpxNPU/zzdVNF6xtldgKQjVL6MqOOuWvbZhl+2oS
         5ygmNaLodBVuSME1usiYydzQZ58cuiVR9uqvccw4NyAQY63TI4zA0NIRvYnDXfrAXgzI
         xKGGHBTTmdcGKg+LwoFN530bkxo1BoawCZO78M5mUnpQ4xYDOibDZL0PyhNE2npSTkmW
         4SobiNmshtnCJRyprnQkkCI2y+WL9u1UE00bRpK9lmlIwu/fnZWVnsv5qsSE8+B63oBl
         aHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755844349; x=1756449149;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbWtywPyRVbOYriWTI/NOHCQnU/KatYA0nzQ5cWfK5k=;
        b=U6elQyRP1KfujmnjZX11HCs2wG8PNPyo/AbIuZRdgsGVFItRMRDSEjfODj5kj/cHii
         4drU1DAx5sfRQN7IrbDnlHUS2xzO/CoLdRdmwj2sHX2oM3a8LtDLJ4QFMiu3/wWS3AoR
         WUOiMiCewlBnY+kGnc+EGECWdbNPIAVDTZ/9DQJtHikplUAZJAebH6hxF4XkhT6s/d4g
         V1F0sfwdxgniJMFW5Dkg6SRAQKO92xLQI71Yu9aBOZ5II2gWa/vWRu8O9eexS85M36Aq
         UYJU3CuxGSy8dbAtaFUjaCTMWxUbek2oeCQKNUscoZw03i9/jbsXquV2X3pxi2GIZhwZ
         ZXZg==
X-Forwarded-Encrypted: i=1; AJvYcCUSAUT0YLe+TIT0LsNODg+HOoXeZkr3S6ufCY/wdCj+zR/bmI8w26zUAAcr2f0yIHueXmWea/wgH0o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywzj3Z3DFaeti9vCwLJyMz7unk5NYeNdZ0LM1uACBQXohEduG/Q
	AzjlC7CX0K99pTxNC1nPqUZxbChsRqL3bTduNF1kn7LpxOXba0Gwg2vp7Rt3BtKS9awH4cjiTvs
	2ZVo=
X-Gm-Gg: ASbGncvIBeNazwIjA5glFDOJrp5Z0CTlnOymVM0UXzcQG/O3/fqeamWTgp8sr/jF7yV
	eRZK2EqP9cvMDNoXB5WtPCAmNfSbuUCbRYjvDqeCTUeYcOzQZNiEPVpBRvwDzWdvZpZVUvnGg4X
	ndr/dElbB6JtSZIzP43OyuqYA4BhC9i4MHrJ0kYykjmnfRr+hALEuPyH9avxLXkdysuICNaTsHL
	Y97wUpirNb8NDjIm1xvERdGDpvC/JVmlmWmjFlFKUTpT/TRqFQjtC2+guFMKa08OTWNwpP9P30j
	ET1c5XvnzVzridzANGxTt5jl1niMTAHXyo0pOApnXjldolt19ImSDQD725Zl+b6HBNN+6pHZUNx
	12Jz5GP89c36fUb+t75mEfx4TR8aEWuafZtE8SZK/1H+m7awHyPzVQjV7Qf9l29/ffYV7HMeLuX
	SXN01WKE0=
X-Google-Smtp-Source: AGHT+IFk9mT8zSxhTt9GoAIHBV4FYmVKc542Sby8cZ1gju+k1IZ1i+qcgw0ywMr5QxfKoKeoB/D2HQ==
X-Received: by 2002:a17:907:2688:b0:afd:d9e4:51e9 with SMTP id a640c23a62f3a-afe297078bbmr137576266b.65.1755844349206;
        Thu, 21 Aug 2025 23:32:29 -0700 (PDT)
Message-ID: <2228c2cf-1cf3-48e3-bf53-b182e34b1a04@suse.com>
Date: Fri, 22 Aug 2025 08:32:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/16] x86/fsgsbase: Improve code generation in
 read_registers()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-17-andrew.cooper3@citrix.com>
 <e1444bbf-89b8-4685-ada6-3092d65fb9c6@suse.com>
 <da892c2b-272d-4aa0-8eea-9e57f414bb5e@citrix.com>
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
In-Reply-To: <da892c2b-272d-4aa0-8eea-9e57f414bb5e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.08.2025 22:52, Andrew Cooper wrote:
> On 19/08/2025 2:19 pm, Jan Beulich wrote:
>> On 15.08.2025 22:41, Andrew Cooper wrote:
>>> It turns out that using the higher level helpers adjacent like this leads to
>>> terrible code generation.  Due to -fno-strict-alising, the store into state->
>>> invalidates the read_cr4() address calculation (which is really cpu_info->cr4
>>> under the hood), meaning that it can't be hoisted.
>>>
>>> As a result we get "locate the top of stack block, get cr4, and see if
>>> FSGSBASE is set" repeated 3 times, and an unreasoanble number of basic blocks.
>>>
>>> Hoist the calculation manually, which results in two basic blocks.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Otoh the function here isn't really performance or size critical. I'm undecided
>> whether the undesirable open-coding or the bad code gen are the lesser evil.
> 
> This function no, but every other place touching FS and GS is
> performance critical.  They're all messy to start with, and get worse
> under FRED.

Is there any (further) bad effect to the function here by the time all of the
FRED bits are in?

Jan

