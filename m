Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAC8AEE14C
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 16:46:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029168.1402920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWFlT-0002Tj-VB; Mon, 30 Jun 2025 14:45:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029168.1402920; Mon, 30 Jun 2025 14:45:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWFlT-0002RU-SX; Mon, 30 Jun 2025 14:45:47 +0000
Received: by outflank-mailman (input) for mailman id 1029168;
 Mon, 30 Jun 2025 14:45:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWFlS-0002RO-PT
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 14:45:46 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e72ab568-55c0-11f0-b894-0df219b8e170;
 Mon, 30 Jun 2025 16:45:45 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a57c8e247cso1747893f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 07:45:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af557441asm9820387b3a.95.2025.06.30.07.45.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 07:45:43 -0700 (PDT)
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
X-Inumbo-ID: e72ab568-55c0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751294744; x=1751899544; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CMzYDg/GwR8Fo0/1kMoNuv6cQYbt3N1U6xtipOr3aRY=;
        b=V5zD+1KL4AB2vaHghUQi66oRfEysfph8cbGBrKbD0nJmMAESafZXaa6VICMcWHklDm
         gtsuPsQVEB6prPc7pTQTQJF1OGnZbiqor6zqt6V1ksxoDvOb8RE5kb0qMe77V3h1Jrka
         Prqxux37Pn7tOT546YERlL1b6rgfsTWM+kw1+/o+4vIzzFOh8nL0mjNqaIdjMdv7Ags9
         tQ970Tbc+uZQO/RxjoMZklK11GFdhdWVoaer6j4G/p4xlT8kpzNz9qc4Mimn9EQWFFbS
         mprz2BML1CFTURuN05JP5iSOtc1iKanCb+mO3lrqnsXk7GVnsyMHCDww79Vs3xvd0iUa
         /9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751294744; x=1751899544;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMzYDg/GwR8Fo0/1kMoNuv6cQYbt3N1U6xtipOr3aRY=;
        b=ZfhJrMq+mcA1tBiFP5v/ycp05ZUvvE1nOBgklfwqCjNLak16Y5jBUv/Iu58As0c/y0
         zZleakO1+vnqq2RXJ1mTHxEl+2fSyvSLng8xujV2Asl2Iy2NKrRFIEhDZGSypAn8u1e2
         SYXDFQpSZf9NSOca4grvRndQN5nP7dQA7OiTcSEgG6XjUYUOUFGA8YR7jx5bFjrI2WiI
         HeO5VIQzyW4Xi9VtgN1yeENybYLrJZ9tQmmgTnkhplx5BeEx2+/KVVFkMplt2N+QD94L
         3F7NfP7htYjRf/pWd47kT+n9FYwXaudjmgEUPbrmegIjzZzAgU9sdC+JlZ394a/hV0Zd
         bDSw==
X-Forwarded-Encrypted: i=1; AJvYcCXgO+lT41app+2OqYAaYsFWK5+zL78YuWbjYK61aD17tvDNUmPjirmJ5MILgbqi0JhBgkUveL01ylM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyu8ziB6LnACr7pCK7i6OQE0+pf3ayA43Gm4DU24PISkJBQoeUX
	U0Dy/5FmPLhT2ozNY2a67QQvpO2Cvb87imYLwtcCYDjTJYOXzHHzXnlF2M4eUYi4eQ==
X-Gm-Gg: ASbGncssl6zKm72GTZyWQa3MCenyGle8MfUyiPcA27EQqIoT7wvWE0s+Gq0PBNmKX6t
	igXy4Qx7apAcfo5yCJ2BSxxQ2FsbVvHGOueBml1ZQH4vN8ii60XPRMU0EpPNIlYmN5UdS8egnt3
	JKniQ/mKxAx1fCW3rvThO96Rq4XB0mTcooxaygLbrvoOwLw+wIvB06XkdPXShvL3+weypdXzIge
	2lfgFg6xzm00dTxxDWNYYYPZqHklfqSEhuKXl7UPk9IBs/wF5kj89sqWcFV7CBbEeOM+mpJJzvA
	2HpkWxKtd8LpyLcoo7GMaHj/nZdQoqR5rly5g1RTqxNmABLxyrgG+olUr52Zv0IAXyTReX/LcKf
	r4GBYcB/bvrTnognnbwlSfPLZ2iTwTe0RDD0aIlZZcyvTavM=
X-Google-Smtp-Source: AGHT+IH5tX10ut+T1ZGHfOKMgTfbEMD14QCR1zLfxiENwUnYgycWdukVDL0Qd4OCiWO/3jKCOhc3wQ==
X-Received: by 2002:a5d:5849:0:b0:3a5:8934:4940 with SMTP id ffacd0b85a97d-3a8feb70269mr11891547f8f.50.1751294744244;
        Mon, 30 Jun 2025 07:45:44 -0700 (PDT)
Message-ID: <f373045d-4479-4c55-b6cd-3c955e456428@suse.com>
Date: Mon, 30 Jun 2025 16:45:34 +0200
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
In-Reply-To: <6fafc0b4-cfea-4d67-bef6-4e40d1d3e743@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.06.2025 16:38, Oleksii Kurochko wrote:
> On 6/30/25 4:33 PM, Oleksii Kurochko wrote:
>> On 6/26/25 4:59 PM, Jan Beulich wrote:
>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/include/asm/p2m.h
>>>> +++ b/xen/arch/riscv/include/asm/p2m.h
>>>> @@ -61,8 +61,28 @@ struct p2m_domain {
>>>>   typedef enum {
>>>>       p2m_invalid = 0,    /* Nothing mapped here */
>>>>       p2m_ram_rw,         /* Normal read/write domain RAM */
>>>> +    p2m_ram_ro,         /* Read-only; writes are silently dropped */
>>> As indicated before - this type should be added when the special handling that
>>> it requires is also introduced.
>> Perhaps, I missed that. I will drop this type for now.
>>
>>>> +    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
>>> What's the _dev suffix indicating here?
>> It indicates that it is device memory, probably, it isn't so necessary in case of RISC-V as
>> spec doesn't use such terminology. In RISC-V there is only available IO, NC. And we are
>> |using PTE_PBMT_IO for |p2m_mmio_direct_dev.
>>
>> Maybe it would be better just to rename s/p2m_mmio_direct_dev/p2m_mmio_direct_io.
> 
> I forgot that p2m_mmio_direct_dev is used by common code for dom0less code (handle_passthrough_prop())

That'll want abstracting out, I think. I don't view it as helpful to clutter
RISC-V (and later perhaps also PPC) with Arm-specific terminology.

Jan

