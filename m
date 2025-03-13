Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3F2A5FAE8
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:12:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912743.1318955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslAJ-00050H-RD; Thu, 13 Mar 2025 16:12:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912743.1318955; Thu, 13 Mar 2025 16:12:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslAJ-0004xL-OM; Thu, 13 Mar 2025 16:12:11 +0000
Received: by outflank-mailman (input) for mailman id 912743;
 Thu, 13 Mar 2025 16:12:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tslAI-0004xF-JK
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:12:10 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e88834fc-0025-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 17:12:06 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso8055345e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:12:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb318a3dsm2549864f8f.74.2025.03.13.09.12.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 09:12:07 -0700 (PDT)
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
X-Inumbo-ID: e88834fc-0025-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741882328; x=1742487128; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7pD43WYx7h5WIEm4qKmoGo5dMRCJtIqX3bMyJ2GTlmo=;
        b=dhlFs0FiZu+CxMmOpXSeaj17ih38Tt96glAWVnwx55PbRxX3P9678wTYW+Y+ELbTwD
         sARTG2EBpeQMTitpP9JwrjLi3w5i0yR4zpUHC6rfTXuCoqObGYZ6+REQYTGC6np7xflN
         cHGGYMIc5EoRkl5UDSCLobAYQpyHsyHYHhHy5unyzuLh0E5J/nnxnL2LlrkAqarZgcpW
         x/ceFyM1j7KKdcB7XWS/NMHOey7PPU22Cc6gfrCn/Tw5hCXjV+C6VDTX737cogngUE4C
         v2Q6zwgHwbYoGY47HN8RJRz1xj/J8A3xDQVYnuz4AWqEvzVrOFJFm21tjwzxhE3A8HDv
         ojwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741882328; x=1742487128;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pD43WYx7h5WIEm4qKmoGo5dMRCJtIqX3bMyJ2GTlmo=;
        b=dznkFN0fiSUTRauO07S4cu/1NRD/xlP+hWD5tDocuK7FMQgUDMDZg3TjXDj8y4xsf3
         3oYKzBLWDvscejEF+OLWM9xIfAzkbzsTxUtczFDNKrYiwuR9qcbd8gKIrL6sBdRRxmnh
         Esk2Y65on2sGCLwETxZsOKVLwTiA+XRzR85BQXA9qNu73i//oamXY9a3XitJhTVmgjVI
         BbjwZpD3gqpH9g7dL1KvmkA5OvzDf7irrU25hcLT572PCxrYMVXvOZUHli+pCTzO264/
         +ANvOGid9XtTdNKIvzLEF8/Zklseof+kKXrEZ+fmAeGxJYwyo8W9Gw/KtKRBONBeXJq/
         1wXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIlggaAJWIcLc0OTRRNZxVpEYNxnhn7+OvAEq9fpO4V/GWSyDsLOBJ3FvpFYPQpcFIV1/VsbuOaL0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPKvQQTkA+hdrvABdxmoCjDUUoYoJqp/Myo/vqb9meKcpRDfe1
	hfEf20Ms5e3J5IX/7ri1uFchgYkYMpKhJ2lUiqJW8rlDAPe1OkmufG/zZ2pbbg==
X-Gm-Gg: ASbGncvP1G8rQ9jWryGXvrIZ6zj+v6LfmrL21Id8weq23qnduPUgBV3hkAAGpKJwEQv
	THRrqHbCvLLTB2AqRAQdez3KTK1wClO2J1iWk24Mhggp6y628V9tXy257bxqRW3AM5eNcfLdQ88
	vFc25KCcULGiLQxkIHY7I9aS+dmh+osXE7Wk1PlFLcy4Q2YLv6+0I2MNjULW73tMznKSFth/dXz
	nEk+ySfVXSFU5LU/l2lEkULsH0TxglgYGwB1sEmLHCqZlfLQ7YvL4BR6zvFFcWruxKWbX2ws4et
	pAQoy6tTMPWdCy747+BwyLqrOahqSWoB1KUC1bolO5DjcXYtJZiG+/4Myhc7kXOe7BnwJ47R56v
	ddpkCicBrpLDhdfEUC9A+Vu02tXddcA==
X-Google-Smtp-Source: AGHT+IG7cWuDP6icKTUBpL8jkMuJEusmMpq5PY9gltHNNhnyl8WRTp4hcH4AGVUiYk1vEOAsRfA74g==
X-Received: by 2002:adf:a31e:0:b0:390:e85b:a8ee with SMTP id ffacd0b85a97d-396c1471b8fmr126016f8f.1.1741882328001;
        Thu, 13 Mar 2025 09:12:08 -0700 (PDT)
Message-ID: <775e644d-10a0-4cbe-a6de-20b3464245d0@suse.com>
Date: Thu, 13 Mar 2025 17:12:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] symbols: don't over-align generated data
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <58b3d7dc-5966-432c-8def-e841feaee1c8@suse.com>
 <816a0320-d229-4f7e-b1b5-51dbb640c5c8@suse.com>
 <748ebdd6-9518-4c6b-9dd3-7ffd13ea08c7@citrix.com>
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
In-Reply-To: <748ebdd6-9518-4c6b-9dd3-7ffd13ea08c7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2025 17:07, Andrew Cooper wrote:
> On 13/03/2025 1:53 pm, Jan Beulich wrote:
>> x86 is one of the few architectures where .align has the same meaning as
>> .balign; most other architectures (Arm, PPC, and RISC-V in particular)
>> give it the same meaning as .p2align. Aligning every one of these item
>> to 256 bytes (on all 64-bit architectures except x86-64) is clearly too
>> much.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

>> ---
>> Even uniformly aligning to 4 (x86, Arm32) or 8 bytes is too much imo,
>> when some of the items require only 1- or 2-byte alignment.
> 
> It matters about the largest item, not the smallest.

The labels we generate are all followed by uniform-granularity data.
Labels starting arrays of bytes or shorts are nevertheless 4- or 8-byte
aligned.

>> Is there a reason only x86 defines SYMBOLS_ORIGIN, to halve the address
>> table in size? (Arm32 and other possible 32-bit ports of course have no
>> need for doing so, but for 64-bit ones that can make quite a bit of a
>> difference.)
> 
> I think the likely answer is that noone really understands how the
> symbol generation works, and didn't know that setting SYMBOLS_ORIGIN
> would be relevant.

Hmm, I didn't consider this might be the reason, but you may well be right.

Jan


