Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA583AEE311
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 17:51:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029239.1403013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWGmY-0007XY-9g; Mon, 30 Jun 2025 15:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029239.1403013; Mon, 30 Jun 2025 15:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWGmY-0007W6-6w; Mon, 30 Jun 2025 15:50:58 +0000
Received: by outflank-mailman (input) for mailman id 1029239;
 Mon, 30 Jun 2025 15:50:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWGmX-0007Vy-IZ
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 15:50:57 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01db0200-55ca-11f0-b894-0df219b8e170;
 Mon, 30 Jun 2025 17:50:55 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-453608ed113so23715785e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 08:50:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2e2493sm88805155ad.48.2025.06.30.08.50.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 08:50:53 -0700 (PDT)
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
X-Inumbo-ID: 01db0200-55ca-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751298654; x=1751903454; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XHRqmBzRfJ5cd6lN8Yd5F/h8vJDkOBgYffL/BDrwugw=;
        b=WFUGTQZj5vIqcD//txSgAXThqq06wu6yr2ArnkuCRmdnWFfn8CMkECl45K2Z/31NZu
         TkbhMAWBFaFOqRWL2I7e4rhsUDPO2dgFPJqC5HzPyuJ05AJMrgofp1f2UsMzu9HjE73o
         GW320kF3GqwQrr/x1a8Gx9lrGh+81/GqePyNOt/C2JvrCWnMJxDP6w5QC++41hsqLRic
         I0rWqtUHNH1Kz9kLdVgZazgoI2z5AStp1gD0VB1GfMZYObUFNKcqjbtVNb2JszJxEgre
         8/9pOmyZqPPQUo/LCwiQOxHdHJNqBmxNDQe1UJmEoIbymgSZ3++Wd1aVLPxXGoV2sGAA
         VAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751298654; x=1751903454;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHRqmBzRfJ5cd6lN8Yd5F/h8vJDkOBgYffL/BDrwugw=;
        b=BQGmnMkUUPPgwHehR8F6y/0692p2sFiJx8YfmGYmA5NBKjDpqGZTeaYezQ/O1v40Z7
         lcOPT18cR513AhIMX2h7sg1BY5uNhJ9ooGxVZqLg1nZd53WLJrm0xs3v3gqJdenJyZVh
         0iYyPh4xXTFomF7EGidbIY7xEnVH7CKgkgfGPD43gMSQQDg/hTKdGU7z4h15OnxLpRai
         i1ImNp4ESrXEb59K3pS/fXrlLXsf5O1xoBPEaOB4Drn/+iM+bApY6bhR4Lz79RJ3JFDi
         A+Vy1Z637tcFZ1IFX4/bQlRpN/GeJ5sU5tzyRHxIMmh+VEBNB+meyoL9KOyuoshlhPhj
         CIDw==
X-Forwarded-Encrypted: i=1; AJvYcCWaNxUWmQb2pX0fgHFVBD3PbtjFdrsfgYXuYS0Kgb2pYJ+yc83+Oi92L/kuYbFkKLiHAovNKkUO6Ts=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqS1CzDQmnjiTq3JJWTe3AO4GFvDeN8QTjLTzipRonA5zsRWdA
	N3xvdkJU5i84pWO5UTTRm3YBcKeU63tEfj4OjFVjaORlSkJDnz4IUK9A+hna8Uenvg==
X-Gm-Gg: ASbGnctBJ8BvDF6Q+0Pcm2QgfdvALbAHYo2RgsMPxaMW5qa3sbpb2vK17fXAeh1CysS
	ODKJCNmPlrHoLwwP2vmlhcrK2NMnewsK26vB3nlNWVthjQIqYYa+ucyz1BugBH20TpLKz/k6Mnj
	4G0XQFbCbKqAXJCO3NkgmaiA+pvo9TImQfMury9OZlVP81Hht/Ga/GLR6PTVS7vTWD4ldWtqTDp
	AFRoILBXMYsYmlaXvXg6z3ew0OU3ZbMSr6XpptMiraDDnWwcH7d0xma4LGP2h79YrtVKiViGQCZ
	EY1yXi9hqDRdIGavHn4yQTQoeRS5kf5umu5iFUgojZ45EJVHbqvFjLgdEqlqOmkBcklK80pmgHr
	mMfuOF2cJN0n6iAKKikhKGgI0UVvqlMhBkcpCNu6o+PVieqw=
X-Google-Smtp-Source: AGHT+IEdoq2wXVKqp8ST8Hi1/5chVZpBVUrimSxKz0ZRQHz+BGLJOSZtm3ZAS3/Eh/MgEjsiXTb6sg==
X-Received: by 2002:adf:b19b:0:b0:3a3:6e85:a529 with SMTP id ffacd0b85a97d-3a8ffcc9ea5mr8819115f8f.51.1751298654427;
        Mon, 30 Jun 2025 08:50:54 -0700 (PDT)
Message-ID: <2a7515a4-0e86-428f-8239-ae97b976f3f2@suse.com>
Date: Mon, 30 Jun 2025 17:50:43 +0200
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
 <6fafc0b4-cfea-4d67-bef6-4e40d1d3e743@gmail.com>
 <f373045d-4479-4c55-b6cd-3c955e456428@suse.com>
 <f5fc8d66-cb90-4064-a215-8a2ea3705272@gmail.com>
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
In-Reply-To: <f5fc8d66-cb90-4064-a215-8a2ea3705272@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.06.2025 17:27, Oleksii Kurochko wrote:
> 
> On 6/30/25 4:45 PM, Jan Beulich wrote:
>> On 30.06.2025 16:38, Oleksii Kurochko wrote:
>>> On 6/30/25 4:33 PM, Oleksii Kurochko wrote:
>>>> On 6/26/25 4:59 PM, Jan Beulich wrote:
>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>> --- a/xen/arch/riscv/include/asm/p2m.h
>>>>>> +++ b/xen/arch/riscv/include/asm/p2m.h
>>>>>> @@ -61,8 +61,28 @@ struct p2m_domain {
>>>>>>    typedef enum {
>>>>>>        p2m_invalid = 0,    /* Nothing mapped here */
>>>>>>        p2m_ram_rw,         /* Normal read/write domain RAM */
>>>>>> +    p2m_ram_ro,         /* Read-only; writes are silently dropped */
>>>>> As indicated before - this type should be added when the special handling that
>>>>> it requires is also introduced.
>>>> Perhaps, I missed that. I will drop this type for now.
>>>>
>>>>>> +    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
>>>>> What's the _dev suffix indicating here?
>>>> It indicates that it is device memory, probably, it isn't so necessary in case of RISC-V as
>>>> spec doesn't use such terminology. In RISC-V there is only available IO, NC. And we are
>>>> |using PTE_PBMT_IO for |p2m_mmio_direct_dev.
>>>>
>>>> Maybe it would be better just to rename s/p2m_mmio_direct_dev/p2m_mmio_direct_io.
>>> I forgot that p2m_mmio_direct_dev is used by common code for dom0less code (handle_passthrough_prop())
>> That'll want abstracting out, I think. I don't view it as helpful to clutter
>> RISC-V (and later perhaps also PPC) with Arm-specific terminology.
> 
> Would it be better then just rename it to p2m_device? Then it won't clear for Arm which type of MMIO p2m's
> types is used as Arm has there MMIO types: *_dev, *_nc, *_c.

I don't understand why Arm matters here. P2M types want naming in a way that makes
sense for RISC-V.

> As an option (which I don't really like) it could be "#define p2m_mmio_direct_dev ARCH_specific_name" in
> asm/p2m.h to not touch common code.

A #define may be needed, but not one to _still_ introduce Arm naming into non-Arm
code.

Jan

