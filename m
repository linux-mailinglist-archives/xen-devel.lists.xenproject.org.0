Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8568CA89FD3
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 15:45:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953979.1348359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4gbR-0005e0-Rx; Tue, 15 Apr 2025 13:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953979.1348359; Tue, 15 Apr 2025 13:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4gbR-0005Zk-OX; Tue, 15 Apr 2025 13:45:29 +0000
Received: by outflank-mailman (input) for mailman id 953979;
 Tue, 15 Apr 2025 13:45:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4gbQ-0005Z6-HN
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 13:45:28 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2f6df32-19ff-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 15:45:26 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39ac56756f6so4863573f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 06:45:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96c05asm14070965f8f.26.2025.04.15.06.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 06:45:25 -0700 (PDT)
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
X-Inumbo-ID: e2f6df32-19ff-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744724726; x=1745329526; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IO+DijkSHnrAyb5ZOzmqtwUZyE04LXM/7oREU+Iq+F8=;
        b=NjTmmMcDL3eEh3yDXvuTUk3uBEHzEfTvXXdDwEHwGQVDT86WNK2mp9PDoLq8B3zRVk
         i6+UyoxLgWk1Sx3wwoCXsT8jWB2kCJr/FWwsxg+wC/xCY3NMsCbn/xXTAg6LXCRRHvqE
         8KvCmuFUjkQ39xaf57vPKwkQZiiLDBSpauuf4G+DT5qdx5D/9F9qEGBDqoEEJRJ0MWkA
         TTMiCHxXMesQs6hQvKp6PLand/TAt87RwTyj0bbj8xrvOFU/SBzzSiDvSlHAQQwHYebP
         9eSezjPT479RP0sfQIZ2jaajgI9T5LGfx2kJciHfYFoj2asMQVo5+Gk6xR/51EySatgd
         Q7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744724726; x=1745329526;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IO+DijkSHnrAyb5ZOzmqtwUZyE04LXM/7oREU+Iq+F8=;
        b=JIVf1qJqhqBrtVQlPqLNTO/irBlz1ifnccVcWk+SBVTrg3oNRbccPlInijbJ7Gc9xg
         RiaPLGLvCJ9Rx6KsRbTerL9u5YvzgVroIE6EiZJeSuz06uqTPrpko95UoOary8KuXmZp
         A5O7Xz1/fFJGckDz59GIIA1gyagSm4e62ZwkqT+SEo6BHGoYQ8HX9JpN9cfx4t44kshy
         vOdpRjr26OwwT+uVUYbcghsdN8r7hSeYY5dNTECa3lFtwntPAtI4L+jejF4iAFNC12TJ
         4hR/LBVy8PsE9Kqx2ZJyEYrcR507aXpWQlbkEaAqG1M1YQKrp9L++6T+v02PNPKT8FBf
         MzVA==
X-Forwarded-Encrypted: i=1; AJvYcCWG+punus65KPpvgFpSLkQnS3PCVr4IchWLW67GPBHR/IuHFZFbn6jHGsQ4ZE2Ck9SQeY1qzVVO/7E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxuamDgDxUudqhHzHFbsQB1kUEJIGSXwY2gyGHLe6gTYNgbtMeW
	q7m6gtQVdKex6OZc1Pys7X2OvlfsPFzp71DITLrwK+e+E6cx2p28BCk1C9rCgg==
X-Gm-Gg: ASbGncuk4ys86+ugIBB5i4U/mqxrjYBABFDntPdcGNDhiHhsj9hGV90dll5BDFCBOqk
	FdjnxW1W9nlMVeZb8YsLvooCq6C9iLD+Qlw9cGy1UGTrM07F1+5fB9l3PTsw68pnyZIa029ksVd
	lqyJcZKgqWNg/e/KIlOLMlFhlt49k6A9/wKYs5nw37/APc5wzKyxHaSjt9HffOUWSiykcm3NMgM
	MBZsZQT1D8Ij/syniJZs8h0QpAuW8XUnj9pWQKlM8d5DFYMlRklFGY9Pxz8vrDOV1BLTZ0P4w5x
	/beriL4T/Ti0Je1Tyynk6lbsCGqid6hCLjTaX+FLrL/2i/GwK419eVcbdVQsZy0ChdzBb55/R3S
	t5oDCWHUeweWdfRtin+HMt6Lr+Q==
X-Google-Smtp-Source: AGHT+IGpwNKjNC3xFlGwjr4kmKIQkJXgO5WI/LPQO4QvhWW/9JzlmoTz9ZDyTGb3Y3JEC//kkDLiig==
X-Received: by 2002:a5d:64c2:0:b0:39a:c9d9:8f95 with SMTP id ffacd0b85a97d-39eaaed2296mr14603104f8f.52.1744724725879;
        Tue, 15 Apr 2025 06:45:25 -0700 (PDT)
Message-ID: <859d0c87-dc90-44c2-ab30-5164eec0705c@suse.com>
Date: Tue, 15 Apr 2025 15:45:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/14] xen/riscv: riscv_of_processor_hartid()
 implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <ab592d50ad161ffed3950bdf58ade49ae90a3c0e.1744126720.git.oleksii.kurochko@gmail.com>
 <65f5952a-8d2a-499c-bd66-53e9e2fbfa9c@suse.com>
 <d10323b7-d95d-4b96-9bf1-7ae8edda153e@gmail.com>
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
In-Reply-To: <d10323b7-d95d-4b96-9bf1-7ae8edda153e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.04.2025 15:39, Oleksii Kurochko wrote:
> On 4/10/25 5:53 PM, Jan Beulich wrote:
>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>> +{
>>> +    const __be32 *cell;
>>> +    int ac;
>>> +    uint32_t len;
>>> +
>>> +    ac = dt_n_addr_cells(cpun);
>>> +    cell = dt_get_property(cpun, "reg", &len);
>>> +    if ( !cell || !ac || ((sizeof(*cell) * ac * (thread + 1)) > len) )
>>> +        return ~0ULL;
>> I'm sorry for my lack of DT knowledge, but what's "thread" representing here?
>> You only pass in 0 below, so it's unclear whether it's what one might expect
>> (the thread number on a multi-threaded core).
> 
> Based on the DT specification alone, the|`reg`| value could refer to either a CPU or a thread ID:
> ```
> The value of reg is a <prop-encoded-array> that defines a unique CPU/thread id for
> the CPU/threads represented by the CPU node. If a CPU supports more than one thread
> (i.e. multiple streams of execution) the reg prop-erty is an array with 1 element
> per thread.
> ```
> 
> My understanding is that the term/thread/ was used in the Linux kernel to cover both
> cases.
> When SMT isn't supported, the CPU can be considered to have a single thread.
> For example, RISC-V uses the term/hardware thread/ to describe a hart (i.e., a CPU).
> 
> Interestingly, the Linux kernel always uses|thread = 0|.
> 
> We could potentially drop this ambiguity and introduce an|ASSERT()| to check that
> the|`reg`| property contains only one entry, representing the HART (CPU) ID:
> ```
>    Software can determine the number of threads by dividing the size of reg by the parent
>    node’s #address-cells. If `|reg`| has more than one entry, it would simply SMT support
>    is required.
> ```
> 
> Does that approach make sense, or should we stick with the current implementation?

If extra enabling is required to make multi-thread CPUs work, then panic()ing
(not so much ASSERT()ing) may make sense, for the time being. Better would be
if we could use all threads in a system right away.

Jan

