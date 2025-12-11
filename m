Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9744BCB60B0
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 14:37:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184102.1506632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTgqm-0003ny-TV; Thu, 11 Dec 2025 13:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184102.1506632; Thu, 11 Dec 2025 13:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTgqm-0003lp-Qs; Thu, 11 Dec 2025 13:36:56 +0000
Received: by outflank-mailman (input) for mailman id 1184102;
 Thu, 11 Dec 2025 13:36:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTgql-0003li-Cr
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 13:36:55 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74b9d251-d696-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 14:36:54 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so904675e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 05:36:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8a70394sm5968122f8f.14.2025.12.11.05.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 05:36:53 -0800 (PST)
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
X-Inumbo-ID: 74b9d251-d696-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765460213; x=1766065013; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KTZeg5HypZ4Bp6PChFcxsiqM2EBPg+SVu/ofl0NC9/Q=;
        b=adcAQVRIT0KONbakWE1Zsg+u2B/gJcqPoNAUAAHa/b3XZGfVLNS2NHxV5KbR2msbpG
         M+F7SXuoGU8ZW9iCyyU5f+E1sk0ijaSB+mbrb34TuLJKQctC5xlzka+9b+WxayhUw8dr
         EFWYJ0R4HUHjK/8H/GV+yOdulc9iEneFEh8yJfoUJ/u3wH/biGk6M7ylpkPelVfRXj7y
         rY2kyCBKfK96IBWqakKSfUknn6MilgB8QGEIgskmPx84F2ksbYLIzITNVju+s9AsgXQE
         Sk74cPEq7r/OHBCtzb2dDWuTFZjgkddUuEdI8ugq07lb5abrgreh5QxWVJvEtqAZ0ak7
         nsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765460213; x=1766065013;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTZeg5HypZ4Bp6PChFcxsiqM2EBPg+SVu/ofl0NC9/Q=;
        b=G5ABUBN6MIm+MoxLxnE9eGymjk+lZHJWBv252Tr6gJflO6HWjo3XhxSSErGIiEA+mY
         yzL9D/reOlIzzU5ahS8CSz9MmzjT8KkWL0hC6Rxm72Anv8ryi6wS0BAHjJKL9ozF1LEs
         JKQkyZxuWJhkRfvBT6hPu7yHSkfR902WaOiMpAmcE2XarRvfmzECshPym13mrukhkndw
         XViqsfMscqUxWHQXt9eqMvigrJcF3h8AQvLtY5CXu5p47UQA40VYwBpRk3Z6AtL8cAOg
         uyxM4VGz9rChqHBn+bUf9Vo33TwkVqSNpW0jli/ZFBTGaXo7rIr7nVQ8BfI4v63F+p45
         7T1w==
X-Forwarded-Encrypted: i=1; AJvYcCW4u+UKwd1JQHsGf3y+dMG6qxHrndnheQBO/40KRTGF9Pzn+RB1FvVNVGv/9Ke7nJ7KdFIPSxGghyg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx400AY/mKxFjhpLYeorXHP5CqKq9NBpNRKhX6MfyjCi0iRsPI4
	bphxqeeMX8Gp4EF5T+GD9f5Gjqu4mBGHzR/Xq5h5zeS+mAJRQ/g6h2qQfWiiZFpZ4g==
X-Gm-Gg: AY/fxX7YnVOk0NGbuXyyCOXNB/EXQgtNu3jrLNt4O8GH+e0A12EiwIpCGBTl887j39h
	Y6knyr1vVO6+wQSobl9ya6mI4h1opV7ijaPRC3t5XWXyqS0sK1R59W90jwU9vUCO4+VoFp+SA7P
	exXzz+GG0jNaZCBjUxZrOIh7f2Xx6YQfvEj8+3x3pHi0NhgL6M8UdAq3CoL8Kq40glSf4LqeH2E
	CAPGl7fjOOoeCaEshXL+MWbOac2l+ul8Fwi6aHdZmBzYdDCP/7WkDTtlLl+Sf9jIbo6CHZP1yAX
	2M/jXdVzaTRp8bMQJBa/hXVvVSxIRNc2oUGnYNQAcUaqTNe5IMiX8zoJoxZ4DGjKWbJNZuLC1bn
	3FLiPO049Umf4oj39Gm1WzNJ8jom9pWnG5Vmnv7p3xWPy49GkWctTFRuBTgViR3vSB8838I8q6i
	8vmZre8et1dR60azX3+gvCM8srfTt+x9Tjb3qO4GHn7kiyQ0XI30TVo0DDDcb4ChDreNRkefPyR
	bU=
X-Google-Smtp-Source: AGHT+IGkdUeOaUQU8ibeZSo5zB7V1Az3+Iq5PAzNy6omf8DMh0E9pALf2ssLJ2lmYPV+uy4hlZIREw==
X-Received: by 2002:a05:600c:8719:b0:456:1a69:94fa with SMTP id 5b1f17b1804b1-47a8379de7bmr54922285e9.13.1765460213539;
        Thu, 11 Dec 2025 05:36:53 -0800 (PST)
Message-ID: <741b29c1-f0e6-4ed6-9c72-eb5f08c095cd@suse.com>
Date: Thu, 11 Dec 2025 14:36:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/riscv: add RISC-V legacy SBI extension support
 for guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1764582112.git.oleksii.kurochko@gmail.com>
 <f4e4dc9beef4618ffaabe1c6caec3e10cf78fd5d.1764582112.git.oleksii.kurochko@gmail.com>
 <c3d2a4c4-f591-4bff-b978-18b8c09cf512@suse.com>
 <c1ca8efb-3e17-45e2-ba90-a6f49616bb51@gmail.com>
 <2c84660b-4333-42f9-b178-aab72be9a40d@suse.com>
 <60e200ad-96d3-4384-b9a6-458256f87256@gmail.com>
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
In-Reply-To: <60e200ad-96d3-4384-b9a6-458256f87256@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.12.2025 13:52, Oleksii Kurochko wrote:
> On 12/11/25 12:02 PM, Jan Beulich wrote:
>> On 11.12.2025 11:29, Oleksii Kurochko wrote:
>>> On 12/8/25 4:05 PM, Jan Beulich wrote:
>>>> On 01.12.2025 11:24, Oleksii Kurochko wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/riscv/vsbi/vsbi-legacy-extension.c
>>>>> @@ -0,0 +1,37 @@
>>>>> +
>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>> +
>>>>> +#include <xen/lib.h>
>>>>> +#include <xen/sched.h>
>>>>> +
>>>>> +#include <asm/processor.h>
>>>>> +#include <asm/vsbi.h>
>>>>> +
>>>>> +static int vsbi_legacy_ecall_handler(struct vcpu *vcpu, unsigned long eid,
>>>>> +                                     unsigned long fid,
>>>>> +                                     struct cpu_user_regs *regs)
>>>>> +{
>>>>> +    int ret = 0;
>>>>> +
>>>>> +    switch ( eid )
>>>>> +    {
>>>>> +    case SBI_EXT_0_1_CONSOLE_PUTCHAR:
>>>>> +        printk("%c", (char)regs->a0);
>>>> This is guest output, so shouldn't use plain printk().
>>> I think that I don't know what should be used instead. Could you suggest me something
>>> or point to the code in other arch-s?
>>>
>>> Or do you mean that guest_printk() should be used?
>> No direct replacement will do what you want, as they all prefix something to the
>> string passed (which isn't what you want). You may need to buffer characters and
>> emit them in batches (full lines unless overly long). For x86 see hvm_print_line(),
>> but I think Arm also has something like this.
> 
> I don’t recall anything like that for ARM. The only thing related to character
> buffering that I remember is in vpl011_write_data_xen()
> (https://elixir.bootlin.com/xen/v4.21.0/source/xen/arch/arm/vpl011.c#L76), but it
> does not use the buf declared in struct domain_console. Instead, it provides a
> separate structure for vpl011:
>      struct vpl011_xen_backend {
>          char in[SBSA_UART_FIFO_SIZE];
>          char out[SBSA_UART_OUT_BUF_SIZE];
>          XENCONS_RING_IDX in_cons, in_prod;
>          XENCONS_RING_IDX out_prod;
>      };
> 
> I don’t see that ARM uses struct domain_console.
> 
> By the way, I can’t find a counterpart of hvm_print_line() for reading a character(s).
> Is domain_console->buf intended to be used only for writing characters?

I don't think there's any particular intention, but of course you can use it
only for one of the two.

Jan

