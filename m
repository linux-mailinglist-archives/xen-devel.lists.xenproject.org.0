Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C6DA72AB7
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 08:43:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928548.1331232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txht7-0004e4-GT; Thu, 27 Mar 2025 07:42:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928548.1331232; Thu, 27 Mar 2025 07:42:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txht7-0004cc-Da; Thu, 27 Mar 2025 07:42:53 +0000
Received: by outflank-mailman (input) for mailman id 928548;
 Thu, 27 Mar 2025 07:42:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txht5-0004cW-IK
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 07:42:51 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 150c377c-0adf-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 08:42:49 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3913fdd003bso316142f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 00:42:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9e6539sm19157592f8f.77.2025.03.27.00.42.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 00:42:48 -0700 (PDT)
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
X-Inumbo-ID: 150c377c-0adf-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743061369; x=1743666169; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGjhqRU/qS5c78h8VhRsUJeEi6tJrE3XsvjZ0/hEp8w=;
        b=ahi0ARmM/xZzqzclx56hzeh6Y10wAEuUSHeZRASSEgGvc3LfGWYfAEu8615nkkQ468
         /Q5s9fFP8I7JcRgmz7i9GjhO53YCs5Eqwp99lKRaN4U2wro1YZw5wUVsNfp/XBfO2V55
         PuZ2z5l4hSAGY66UVfHtc5Xr+HxdqrXB6DuV88vRNDYL5ry1NWtm8mnWQHJKs3XkG821
         +cNEykhEkARH5ZDYMxMl022ibBrxo3sIuNNkBOtEQFYqlGmaBG+sJOGwpMNHt8SKPd/2
         Kpr2t+ABR9069Nlihx9QIlf5i/8+ziBUd+XzOuTYzXGGCCWJDeeJW53MFVClmM5mREQZ
         QOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743061369; x=1743666169;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGjhqRU/qS5c78h8VhRsUJeEi6tJrE3XsvjZ0/hEp8w=;
        b=pXwaRKjLzB1loPCOn4WEakjGxmvkHd4vpk3pTJeFfM06j0tcjlUxS2XnsGAZYPD6gj
         jZPxQvclkBC7efIbX0gMDVLpT/YrDzDS601QoC8rQzKRicTZFeAFuyUxE0iy7vly+HiE
         6QCvxWDY+uVVUi6VDlawa4DA1jw8I7/tU6XUl/a+x4DX/OvQoBxexfvB0yUJnUw0MdtP
         UW4q0TC78ntETqnob10vhPb3Q6knxDT+M9nwfLXb55naQUVgWuwG24vrYNmzxZoSqRql
         JCzKmJ6W8mY3UhXLXrrfpNvhH3xuLXblgGdUc9i4F/vqyxGVmbSkzSahK7KczLoq2ZG2
         TdLw==
X-Forwarded-Encrypted: i=1; AJvYcCV6u2inU/EYkqj3aOtwQcdZwfynDrj4OwJM/8vEww6e0Tc0ESlOGkouBHG7wiHL2tJvLQWZUimixmw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVudxM5RUKGcEs8ABxlxvlrCbzJblCYlAhl/yOjnevisJspXe1
	5BX5qpbua+gvrmbXdcYhTXHPRHzQhmzLgNWIMB4crvUp7DPJy5t/xk8KB4BqpA==
X-Gm-Gg: ASbGncszAqwV93dbSCXR0IvxbviaaI/e6QkAwnUuESyUwWgKy5HZ5zNZtwaEDJGBcCY
	2lGS/+K7MHVWU8cmskuLdrTjk+pqCOhGtbKRgbIw0wT0up5Z7f6fWMz9Pn2aj0sSW8Ly/a2HgCz
	XxGJps5n21Yy8NTrXB+kPHjptAPCvaMgobESHZtk7cVwplGut6xVt/5EOWRpfHFVgSLY1Ww4SPT
	8vnAq8xQ3iqMMINObXfaiN+LZhaK2c5er9JWfWp5u1JiIm3U/Q2VMr0sdOOilkIh85OSwuTqj+u
	J1EwLvvxgDZ0YuMO40eKVIyMcqqjV9732BvxoW1Bn99EjzXC2XYvjeEu6UQ5HHgqew6fSTM5/8m
	LiA1UxL9gq3P/ZE7l73VlEeZyYZAIqA==
X-Google-Smtp-Source: AGHT+IEp39JTZW9V5iZ42M0/U9NEVf3gIwhdyfkU6MvYUOa8+3LEE8ke1EWMH+1kam5j1KfU5jnLGQ==
X-Received: by 2002:a5d:598e:0:b0:391:65c:1b05 with SMTP id ffacd0b85a97d-39ad14f3095mr2018783f8f.11.1743061369100;
        Thu, 27 Mar 2025 00:42:49 -0700 (PDT)
Message-ID: <f76b12af-172a-4faf-9e60-54c4626db8c3@suse.com>
Date: Thu, 27 Mar 2025 08:42:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/riscv: introduce preinit_xen_time()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <1a04711f46a1c0a7cdf709abc37f143747215495.1742918184.git.oleksii.kurochko@gmail.com>
 <86c067f2-87ff-4e75-b94a-9d760fc730e5@suse.com>
 <cb66e1e4-7ac4-4a98-9bdb-b92e6c069f0a@gmail.com>
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
In-Reply-To: <cb66e1e4-7ac4-4a98-9bdb-b92e6c069f0a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2025 20:49, Oleksii Kurochko wrote:
> On 3/26/25 4:13 PM, Jan Beulich wrote:
>> On 25.03.2025 18:36, Oleksii Kurochko wrote:
>>> +/* Set up the timer on the boot CPU (early init function) */
>>> +static void __init preinit_dt_xen_time(void)
>>> +{
>>> +    static const struct dt_device_match __initconstrel timer_ids[] =
>>> +    {
>>> +        DT_MATCH_PATH("/cpus"),
>>> +        { /* sentinel */ },
>>> +    };
>>> +    uint32_t rate;
>>> +
>>> +    timer = dt_find_matching_node(NULL, timer_ids);
>>> +    if ( !timer )
>>> +        panic("Unable to find a compatible timer in the device tree\n");
>>> +
>>> +    dt_device_set_used_by(timer, DOMID_XEN);
>>> +
>>> +    if ( !dt_property_read_u32(timer, "timebase-frequency", &rate) )
>>> +        panic("Unable to find clock frequency\n");
>>> +
>>> +    cpu_khz = rate / 1000;
>> "rate" being only 32 bits wide, what about clock rates above 4GHz? Or is
>> this some external clock running at a much lower rate than the CPU would?
> 
> It is the frequency of the hardware timer that drives the 
> |mtime|register, it defines the frequency (in Hz) at which the timer 
> increments.

And that timer can't plausibly run at more than 4 GHz?

>>> +void __init preinit_xen_time(void)
>>> +{
>>> +    preinit_dt_xen_time();
>>> +
>>> +    xen_start_clock_cycles = get_cycles();
>>> +}
>> I take it that more stuff is going to be added to this function? Else I
>> wouldn't see why preinit_dt_xen_time() needed to be a separate function.
> 
> Actually, I checked my latest downstream branch and I haven't added nothing
> extra to this function.
> Only one thing that I want to add is ACPI case:
>      if ( acpi_disabled )
>          preinit_dt_xen_time();
>      else
>          panic("TBD\n"); /* preinit_acpi_xen_time(); */

That's probably a good enough reason then to keep the function separate.

Jan

