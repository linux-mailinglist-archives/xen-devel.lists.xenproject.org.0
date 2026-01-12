Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBDBD11F7E
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 11:42:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200002.1516024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfFNH-0002Dy-3T; Mon, 12 Jan 2026 10:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200002.1516024; Mon, 12 Jan 2026 10:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfFNG-0002B3-VS; Mon, 12 Jan 2026 10:42:14 +0000
Received: by outflank-mailman (input) for mailman id 1200002;
 Mon, 12 Jan 2026 10:42:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfFNG-0002Av-3J
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 10:42:14 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59b7c7f0-efa3-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 11:42:11 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-432d2c96215so3143747f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 02:42:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5ff0b2sm37875883f8f.42.2026.01.12.02.42.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 02:42:10 -0800 (PST)
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
X-Inumbo-ID: 59b7c7f0-efa3-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768214531; x=1768819331; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mQxHxdZKA8MI9tF3OkyjB3iEm/ry45hM4hkXuxq/Dfw=;
        b=CS1vKeFhMxKazwz8MNOXR/ICcEQ7MeP7z17waY7FhmxKaiCpUQ+Et8ba0MMgES98lP
         lwb6r3rACgXeNMbkFT8uVhApajOX9+wVEb9sIKt832wBTqskVRTfcXHQL/s464SeZqBw
         faaOsWDBNGweVghbV0mvNztgGzwkk6odBRoBzibAJZrZieCQYCziq+/1bj0yk7FpoCvx
         K24MZYNEolXYDktiPuHc2ZXkMlunex5TTJgRhOoQm1slFqaAgUUNnUoHtAppXst6mK/a
         ecCJ+hTQoOw6VHVSMyEApHE+iiC68xQuA16Z9KDsgmIfa7V+6efn1vcNK34UDc2IX3G2
         wyYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214531; x=1768819331;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQxHxdZKA8MI9tF3OkyjB3iEm/ry45hM4hkXuxq/Dfw=;
        b=GrfwJt3eCG4gvSdhAtfNmqPymrQu1CYWgYNC0ZI8O/6PlXwH0eJkWUbNCo0wOli1ZD
         em4QM4+AYEZ8AiljicqsEGgg+6skJakjxjG02+9hkIp9CXLbIJ7bZ35EfEFXG8Sibpab
         XCuC/hyuh+oe9hlpiu2kITg1m65sstv0kzXsuYZxzpe30rcpRnPyQ4LYbA+95F7tz4Yg
         RNAD91/JDIhdLm5tgDatiFlUKteXaarGoC3O1LPY4lf4rFpUZnWJAVR3f8Q+0WAmY5xh
         8Hu+YOrM+mddLmO0zjdrrGFbKKvb+7hyg9hyqTmhudYUCmR1zhIt6ryofVI+Kknr02+w
         nvUA==
X-Forwarded-Encrypted: i=1; AJvYcCU3cmWtCDgIoXOyjvsL9Wo1cRYA0nhqQH7hEAkPMuYD4BsMyhOxnzvi55xX4SQRoh7PNcIiQ2Xs/4s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQ7ZMvJO1YhwoJx4E1x2lF6zhTEwX/2ZKNEJI5aKdLl4Qq/b+0
	4/v2tc6V28gICyGCr4YUVySiq+9GJ6638J1I86dREWyKZu502FLbqCbW2u9+vESPWA==
X-Gm-Gg: AY/fxX6RBV56w+u4lKRoh/r+9kgyWbLK0hUwQKbbGnEfMpL25vABFAOb8ef+ZqoiSFN
	g3CjiKtT5V6HOHfb36IDfwYw1A1HUCYuM9gaI7mq/UTHDCi0IsWO4frD/I1A/+Cb6ZmUDYw0Zt+
	qUbU6juX5Jhx5KKTrNvRMNrerw8gWJsNOn5G0fcOmebK3LyzdQcMuH3ea/3hJmXhUhdnBTCdB/L
	hnaqA/eFfDlLaC+qleKeQ5Fl2sB4qAi7FyD20j2eAZL0FALXNYHEmy6xn2FktMe+fE1UQO3Gdr9
	TEnOvyjG+wlnpd22OHGucDSf7IBPWwYQCNW/E9anrguoQ6CAx8nKVHg33ouBCOVPoYglzxkNVsv
	Bluop+7bNaOwy/iCra5LqavuA0/IPvcia06VXe5JpFfF1EOPWpAWqjMuYyhmyXItEGawK0YWG3/
	Vri9E2DOgJgYgfELwFEQ5oUnnXghJSfs3idyiUKX66nQOYUNbF1Jj5jHCgd3AZIjQlmIrqn2hQU
	kg=
X-Google-Smtp-Source: AGHT+IHYytF6QP50y8X4gpEhZi7iuv6sdsPI/dNHz7zoSldkUhSn/PjSTDb6HtVV7zX/Unk03TJJqw==
X-Received: by 2002:a5d:5f86:0:b0:42b:39ee:2858 with SMTP id ffacd0b85a97d-432c37d2ebfmr22651611f8f.42.1768214530769;
        Mon, 12 Jan 2026 02:42:10 -0800 (PST)
Message-ID: <9fa77da5-ca63-4c5f-9b6d-1bc7305c5b8e@suse.com>
Date: Mon, 12 Jan 2026 11:42:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/15] xen/riscv: implement
 arch_vcpu_{create,destroy}()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <be49a360ad584edf5fd9891e5f4534a2c2586048.1766595589.git.oleksii.kurochko@gmail.com>
 <2e7ab738-6b5d-4ac4-a46b-1eef1cd09fb1@suse.com>
 <c0b36217-9620-46c3-8bb1-f21afefe72e1@gmail.com>
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
In-Reply-To: <c0b36217-9620-46c3-8bb1-f21afefe72e1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.01.2026 11:19, Oleksii Kurochko wrote:
> On 1/6/26 4:56 PM, Jan Beulich wrote:
>> (some or even all of the comments may also apply to present Arm code)
>>
>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>> +    v->arch.cpu_info = (struct cpu_info *)(v->arch.stack
>>> +                                           + STACK_SIZE
>>> +                                           - sizeof(struct cpu_info));
>> Why the cast?
> 
> Just for readability, from compiler point of view it could be just dropped.

Sorry, for me readability suffers from the cast and the then necessary
parentheses. Plus I've been keeping to tell you that casts can be dangerous,
and hence they would better only ever be used when really unavoidable.

>>> --- a/xen/arch/riscv/include/asm/current.h
>>> +++ b/xen/arch/riscv/include/asm/current.h
>>> @@ -21,6 +21,12 @@ struct pcpu_info {
>>>   /* tp points to one of these */
>>>   extern struct pcpu_info pcpu_info[NR_CPUS];
>>>   
>>> +/* Per-VCPU state that lives at the top of the stack */
>>> +struct cpu_info {
>>> +    /* This should be the first member. */
>>> +    struct cpu_user_regs guest_cpu_user_regs;
>>> +};
>> You may want to enforce what the comment says by way of a BUILD_BUG_ON().
> 
> Makes sense, I will add:
>    BUILD_BUG_ON(offsetof(struct cpu_info, guest_cpu_user_regs) != 0);
> in|arch_vcpu_create()|, somewhere around the initialization of|v->arch.cpu_info = ... . |I noticed that there is no|BUILD_BUG_ON()| variant that can be used outside
> of a function, or does such a variant exist and I’m just missing it? Or there
> is no such sense at all for such variant?

There's none, correct. hence why in a few places we have build_assertions()
functions.

Jan

