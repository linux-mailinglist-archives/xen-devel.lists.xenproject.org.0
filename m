Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18181AEE133
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 16:43:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029160.1402911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWFio-0001w8-JZ; Mon, 30 Jun 2025 14:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029160.1402911; Mon, 30 Jun 2025 14:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWFio-0001tU-GS; Mon, 30 Jun 2025 14:43:02 +0000
Received: by outflank-mailman (input) for mailman id 1029160;
 Mon, 30 Jun 2025 14:43:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWFin-0001tO-In
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 14:43:01 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fc41101-55c0-11f0-b894-0df219b8e170;
 Mon, 30 Jun 2025 16:42:51 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so2071596f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 07:42:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3c7041sm85215835ad.229.2025.06.30.07.42.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 07:42:50 -0700 (PDT)
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
X-Inumbo-ID: 7fc41101-55c0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751294571; x=1751899371; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t2UUFMHYQFxRcKeaKAM8hKE0IDgedE7aosYybtaQ7vQ=;
        b=E9ns0rQTp7bKNDbhFboPzbZeKxIV1jd1MAgQElU+r31llSVC7GSz1HA/6aZPoGESdH
         dMNfC4cWKOktGRYapk4Sxu9SIw9+YFvQaesqfS+4JnqRyi0r965XD2Qgfpo/ZST9aiJE
         KhFAOgrvW6KhC0tauPXj1bcpdVfGYgYgzvsyxlsixxHhXM59RpyG7h7DAG41z5Zp2FMR
         kRQXMQiPJ2eG1LdBOYfKfmfw2ieYUujSF0phrfJ0qy3aSq3oixQa3n6KDGChU7R4jycM
         uVThxeqxMKbYfzul0N5W46QVR566zVDvBzy2Z/i8urylLZusOaMEedragb43NvaTbt9u
         HzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751294571; x=1751899371;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2UUFMHYQFxRcKeaKAM8hKE0IDgedE7aosYybtaQ7vQ=;
        b=dPu+KNDFdnbXss8kzeM1HPv6ItRK7qzHl+vWLT8glOH7vbVR7tm2fjoGJIpu4xo/x5
         jPjbmokQKijTjMKxZciYYkvuVOy6bZBn4zcn4krmgwcZ6oXg4AH2pDNEZNSAYVv0nY7X
         2PFtrH3wI4cdfk3Irf0XjfPtZUb1Yvd189L2xhPPCWr8HLWQqzgH4owxHL0/lU5fKa6m
         5nahyl+DOxW02LXpUqMZeZkdkMv7tJ0MV8lO+AkKwVQK6QqazAHP75GLT4BMSDKu3DKq
         v+V0FNeCZeqB43Vwhln+TOhKY8hWPFx5O1nLJjGp6AQMxhYkw2q38SrpIGn8sokkf6yU
         Hfzw==
X-Forwarded-Encrypted: i=1; AJvYcCU3+wPuZyzYiknZQ27bwyJpTeN7yPyKMUDdHd4xFg8tb/A1Rv6uLLvTuSWH7phaNcK7Z003iWA8DcA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNwTXsur3FJh2ZtJy5paVRTMimHvOn1Oztf8DGiCtia7KZzNep
	4dPOg/we6Pg63dmlufpJ6GIvYfPL2rwgfWtKsuYpvHgt2MqCK7PUe+HOwfb9zb0E+Q==
X-Gm-Gg: ASbGncs+wU2RbsE7tbxx3+CVRJks6iibaYa6V3AsGdozaaABN+bsUQt+1SvltxcU4kD
	0TUYNkLatVWnq07U7PUoVjn1g1MVZQYItyYKUpBZ5muyNGsjMuW59Q6WbX/2WnHl56dv255EvDB
	BcS6EWHfxDN49wM1uYB5DpFobXYTujAWunqneZFw3amYHRB6qKX2Qy62pgw5dW8IjipSLmH310L
	m1hcs1/rOyluYyc3HL5pSbGiuXrDWrWpqx8boy178DEo6TblbQXcuN2gqTVzdFR8e28IRaVkC1g
	U8vrWIFlrWGsqJ47DOINtG1OzFIIEOy5beCWOJCGkhwt8C4FLdwXssbA7pWd/fxzAY7IX1G0Pqg
	tKedtWPdooL+taAWLYNe4wnquefJKAwUpMgev0aqCpy+fwBg=
X-Google-Smtp-Source: AGHT+IHc/B2thAwTWJG3x9SJlU+DmjM1uxc06QqIRBX2qU6vjxrjGXbWKt61iSIyvo2sNFGwEAnSoA==
X-Received: by 2002:a05:6000:4182:b0:3a4:f6ba:51c8 with SMTP id ffacd0b85a97d-3a8f482bc72mr12244635f8f.14.1751294570821;
        Mon, 30 Jun 2025 07:42:50 -0700 (PDT)
Message-ID: <2ebfaa8c-e0bb-4c5b-89e1-48d309ee4989@suse.com>
Date: Mon, 30 Jun 2025 16:42:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/17] xen/riscv: add new p2m types and helper macros
 for type classification
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <f943c6ce5371258af0f36c2633d542341fcf47b4.1749555949.git.oleksii.kurochko@gmail.com>
 <8f45cffe-e2a2-46e3-8370-2b6b4c86dccf@suse.com>
 <13b80e15-9db9-427d-aaa2-c0389e4c248a@gmail.com>
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
In-Reply-To: <13b80e15-9db9-427d-aaa2-c0389e4c248a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.06.2025 16:33, Oleksii Kurochko wrote:
> On 6/26/25 4:59 PM, Jan Beulich wrote:
>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/p2m.h
>>> +++ b/xen/arch/riscv/include/asm/p2m.h
>>> @@ -61,8 +61,28 @@ struct p2m_domain {
>>>   typedef enum {
>>>       p2m_invalid = 0,    /* Nothing mapped here */
>>>       p2m_ram_rw,         /* Normal read/write domain RAM */
>>> +    p2m_ram_ro,         /* Read-only; writes are silently dropped */
>> As indicated before - this type should be added when the special handling that
>> it requires is also introduced.
> 
> Perhaps, I missed that. I will drop this type for now.
> 
>>
>>> +    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
>> What's the _dev suffix indicating here?
> 
> It indicates that it is device memory, probably, it isn't so necessary in case of RISC-V as
> spec doesn't use such terminology. In RISC-V there is only available IO, NC. And we are
> |using PTE_PBMT_IO for |p2m_mmio_direct_dev.
> 
> Maybe it would be better just to rename s/p2m_mmio_direct_dev/p2m_mmio_direct_io.

And what would the _io suffix indicate, beyond what "mmio" already indicates?

Jan

