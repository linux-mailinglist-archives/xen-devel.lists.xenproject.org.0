Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 578ADA2E7F9
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 10:38:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884504.1294211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thQEw-00015L-WC; Mon, 10 Feb 2025 09:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884504.1294211; Mon, 10 Feb 2025 09:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thQEw-00013X-TM; Mon, 10 Feb 2025 09:38:06 +0000
Received: by outflank-mailman (input) for mailman id 884504;
 Mon, 10 Feb 2025 09:38:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thQEv-00013P-V0
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 09:38:05 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b97a76c2-e792-11ef-b3ef-695165c68f79;
 Mon, 10 Feb 2025 10:38:03 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5de51a735acso4979259a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 01:38:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5de5fb0d738sm4361427a12.59.2025.02.10.01.38.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 01:38:02 -0800 (PST)
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
X-Inumbo-ID: b97a76c2-e792-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739180283; x=1739785083; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OONIJqVMu97Sp9U+NOuTA5Q/9x8uZsL+76w6ZqzFjVA=;
        b=CnNKu7SBTtXLN9ECI6Br7aKoYIYr9Tfz9cLw/EpvDGqgPmEtJ46TuPqh8A9J3l+9Nm
         SlNtflEgl2dl255j4iwf31aZ0KFh8hWr7zQap1JujWofgXstUAQ6p6B/gdd0IoiI0eoo
         z/+HUDQ9KpsHU5f8lumR5NwxPSN7Ajp7cJO1ZoNT7oRzrmMoil7PCj59en7Tmk9ZWgXy
         vSP6kcv8t78B02BZHbCWw2ECLxNcGfCcrX290CESDVy1ajA0bKZisP0gUjC1HiaufMC0
         uRub0B/5GA1brg/x4ui7lCM2FQK2R3fruGORKo/rnGtBIDg8B84WNJPsLqJSYbAW2wzK
         FHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739180283; x=1739785083;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OONIJqVMu97Sp9U+NOuTA5Q/9x8uZsL+76w6ZqzFjVA=;
        b=op28bzMdwbG3qqKVxXumdoSII5WWEH8abgIt+tLGDj951BG7A7C8zPiobCoBFcV1QA
         Onj6rCkYNTKthHKi+WFPiv39lvK7Um2Lk2EmH1yq5SB9DKysI8DsOGVRMoO8zAi+kwGx
         a2GcmX17lOm65v0BoX6IJ2sBOUMgRBW5KfaYrgPsdhc2fe1Pt//RDa0JR0z5/JaLOYNS
         xR42yq6YlpI74CtzxGOsWNi3v5CU+RJgN8+A3BkmdRH/i62N3PR4zn7b4MCYGTr8RL9q
         hhExBRDkoI+i7v5MgTw+tYb3PIZdsoM9JyYgggy7BXZ0lVNZWh9wLb0wlOIh7NdllP+n
         u89A==
X-Forwarded-Encrypted: i=1; AJvYcCU9xM6vOUGgiDrSyM2dVF+Hy3As/UW+sqFsaySFqddYvtqEH8KMIC1Nezu3JurmaDOpbLHDWFafWb0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnhBFn8XtnnfueogJD7a9Ov4hFg8mgmT8JxGx3rQy1XS93m2cz
	UW3+Q/wy+p1v6b6v4QqJE15hlhi9xwKlrrQBIg8in/bHcA2G6YZIPdGLFHXEJw==
X-Gm-Gg: ASbGncuCuTNJEm0a6C1MnyaL2/hk2PGPn3wlY6yMX/WWFWHvCRCyhT0GIGbiXP+lw8Y
	+YukMHXDVcgCbJlRWQpQEfAJZXYS+TeATin6faA5Xt++4WZU+KJFZ2tJ5j7+8SgDf0GEHkc5lgP
	FfMpQk3oUAQ4UedVfz/DF5QlD+e+0RuyiCVrC6KhQOx3Zl6RMT/zTQafxTK30tB4ajwnPd2N0xV
	tG8OlZPlIUk4igx+RL311Gf/bYSPfwW9i1NMicvIK0R9wHuJ5hieUlt305E/Y0i7XxBgtzGAuth
	qZk+XbTEIuz21ctOmcMz3/xd+pNQyPvrZ/2U1dikDD2tz4pIkvivwGOxgHOfgH6UpK4Z2r/CQbe
	B
X-Google-Smtp-Source: AGHT+IEtQQru0Ur4jb27ScRQH+MLHwcpnGVe9r7Td1pn2CYuEHV4Wbn1VTvo+1lB30yHhZfJyHoHTQ==
X-Received: by 2002:a05:6402:5cd:b0:5d0:d9e6:fea1 with SMTP id 4fb4d7f45d1cf-5de4503cc06mr14490228a12.19.1739180282973;
        Mon, 10 Feb 2025 01:38:02 -0800 (PST)
Message-ID: <972947d5-85a7-4abf-b72d-7b316485d0c0@suse.com>
Date: Mon, 10 Feb 2025 10:38:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4-21 v4] xen/riscv: identify specific ISA supported by
 cpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <a63c60c7a97a2b361e3a41f57bed61c0c9a0a89f.1738653407.git.oleksii.kurochko@gmail.com>
 <ab7077b3-6bef-4025-9389-345a345a141c@suse.com>
 <68c8222d-bc5a-4614-bc03-a1ea02693221@gmail.com>
 <0e2e03ae-521a-42c4-9538-2c831b74112c@gmail.com>
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
In-Reply-To: <0e2e03ae-521a-42c4-9538-2c831b74112c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.02.2025 21:00, Oleksii Kurochko wrote:
> 
> On 2/7/25 5:47 PM, Oleksii Kurochko wrote:
>>
>>
>> On 2/4/25 12:47 PM, Jan Beulich wrote:
>>>> +const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
>>>> +    RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
>>>> +    RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
>>>> +    RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
>>>> +    RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
>>>> +    RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
>>>> +    RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
>>>> +    RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
>>>> +    RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
>>>> +    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
>>>> +    RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
>>>> +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>>>> +    RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
>>>> +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>>>> +    RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
>>>> +    RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>>>> +};
>>>> +
>>>> +static const struct riscv_isa_ext_data __initconst required_extensions[] = {
>>>> +    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
>>>> +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>>>> +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>>>> +};
>>> Coming back to my earlier question regarding the B (pseudo-)extension:
>>> Since riscv_isa_ext[] only contains Zbb, is it precluded anywhere in
>>> the spec that DT may mention just B when all of its constituents are
>>> supported?
>>>
>>> Which gets me on to G, which is somewhat similar in nature to B. We
>>> require G when RISCV_ISA_RV64G=y, yet required_extensions[] doesn't
>>> name it or its constituents. Much like we require C when RISCV_ISA_C=y,
>>> yet it's not in the table.
>> Another one thing I am thinking about if we really need a separate required_extensions[] array.
>>
>> We can leave only riscv_isa_ext[] and then just do a check:
>>   bitmap_weight(riscv_isa, ...) == ARRAY_SIZE(riscv_isa_ext)
> 
> It seems like we still need to have two arrays: one for what Xen is supported (and could be passed to guest
> by riscv,isa) and one for what is required for boot.

Well, you can get away with just one array, but only if adding a boolean
to struct riscv_isa_ext_data (indicating whether an extension is required).
I'm not sure though how well that would work overall.

Jan

