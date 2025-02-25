Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F53EA442D9
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 15:34:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895827.1304470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmw07-0003CW-BD; Tue, 25 Feb 2025 14:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895827.1304470; Tue, 25 Feb 2025 14:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmw07-0003AQ-7u; Tue, 25 Feb 2025 14:33:35 +0000
Received: by outflank-mailman (input) for mailman id 895827;
 Tue, 25 Feb 2025 14:33:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmw06-0003AK-Hn
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 14:33:34 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ade20b2-f385-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 15:33:29 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43996e95114so37509075e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 06:33:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd86707asm2438677f8f.5.2025.02.25.06.33.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 06:33:28 -0800 (PST)
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
X-Inumbo-ID: 7ade20b2-f385-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740494008; x=1741098808; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+tyUEjkszCiCFRm//vIAH4sS2l9rS4z3sC8mG//OJqI=;
        b=dZ/e8Y63zXuADrG25TGuWEmyrq+Un2aQUvz+XcUI1hWXgiUU1VM0ItGQPYqJtIb2ZA
         +HQrOVnLWUe9NX3zExyZXGkq8uYRIiGZE7YQ+7TEYDmAxLVcYvXZN/39Gbavw2Lwg6fX
         Gt6Q0fzs53OvHKwH5dLlWfvrd/Zlz+ziamScbrGuuKAYYxpfdZK3AZ1EfQk48C+vKKp5
         Oe/FCnBknokhI4SmuPhyF3GRBGU7fYLxaRQTV3mFpBAQ1AYfgjuSWPGawmaWHdnwpeHj
         dMWo66AeLIGxW/kRKZFImxwnJ3Hg9bYwE57v7C8PSeRX8joE2r0P888udssSVRZ2fU3U
         g9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740494008; x=1741098808;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tyUEjkszCiCFRm//vIAH4sS2l9rS4z3sC8mG//OJqI=;
        b=Ksa12uo1IysMQA+RzLJy55JtBQirZgeVWPJ422PR5TWmTtuoSZPxOuTOv+aANWhLXh
         VdBcTrzhxMKB1iGQivCXFCzwWbWH7Khy/wdQs3AHOU5rai90IR5XAfvlwQa21Wr0K3Y6
         93r27I6n5BEMJSNw8SgI2kN3U3rEeZXSw12JyY9wq0X2Vu7nEFHbdx4ozj/+3kqTlu+i
         jIFxKmxFiEp6TiLkA2Le23p4Wns7y9e2C+KwkAwyNoU+3IOcu802mbvj+aROVW7JaQc3
         8pePN03fmDsJK5k3xMPPGSapB7rAA/ItmLmGNn/c3EaN333nGdREYyVtzOcJ6TyumocW
         vNmw==
X-Forwarded-Encrypted: i=1; AJvYcCX91mvIyceMEMghYMD/X9mJAxwsfkM9o2G5nMxjWncz3XxLztK0AdYxBRTPr/humYtZb/izbEPPuKo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpnyE+b4avr+0EQFdqngBxZMuFd43HjOmLkLbxebJmq/svwVqt
	FiN0F5U/tLgFBqodN0E83OeP3sUZWJRF8hlMRIX8WpJdi5YizJUjUk9altqqoQ==
X-Gm-Gg: ASbGncudAnCzlorDHz2ClhntnNJMZznhG4BqWhdDuOSFcB16wzX4rVTko931pj2pUil
	ZA+sA9jF0tWmldsDX1EE0nlvd0Y3VCMgoCpoHLaRFv+oyUlucFiBKJvID7NO2pDYA5mNrl7s9s2
	oFdjtaYzZCnQ1RyzpP7hnm8T2SzclBnaY6V/bmG0m4TvhdD7eJwLkQVl7MhqZXctl6c/p7QQH4l
	Itkw6YCuxksoppLegU0d33xwQbA/ZCIO7JkJyn1rrSNVkplWlZsJEnvo7nDWdt6K61NND9cjzny
	1tSoy/WGyDnibBh/Mm7z59F0mROQaGICMQpi2BC71QmIG188a9H6Qf7eeT9md+s0Ufi35a0Lhgc
	qJKsiIZJkm7o=
X-Google-Smtp-Source: AGHT+IHoSI1b5cvTPoejKRk72mrQIF8cpyTgcSRXUlaB2WRalTWpbHdqjC1rveb26A8BfBI65UnZ/g==
X-Received: by 2002:a05:600c:4683:b0:439:8523:36cc with SMTP id 5b1f17b1804b1-43ab07ab212mr45394675e9.11.1740494008547;
        Tue, 25 Feb 2025 06:33:28 -0800 (PST)
Message-ID: <924de1d3-94e8-4d0b-8f5d-ebc9a92e81c4@suse.com>
Date: Tue, 25 Feb 2025 15:33:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] x86/IDT: Rename idt_table[] to bsp_idt[]
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
 <20250224160509.1117847-5-andrew.cooper3@citrix.com>
 <fa0cd84c-a3a7-44c8-af62-3e8da91a6d1a@suse.com>
 <0ced63b8-e674-4a88-a979-ff807afe3576@citrix.com>
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
In-Reply-To: <0ced63b8-e674-4a88-a979-ff807afe3576@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.02.2025 13:54, Andrew Cooper wrote:
> On 25/02/2025 9:00 am, Jan Beulich wrote:
>> On 24.02.2025 17:05, Andrew Cooper wrote:
>>> Having variables named idt_table[] and idt_tables[] is not ideal.
>>>
>>> Use X86_IDT_VECTORS and remove IDT_ENTRIES.  State the size of bsp_idt[] in
>>> idt.h so that load_system_tables() and cpu_smpboot_alloc() can use sizeof()
>>> rather than opencoding the calculation.
>>>
>>> Move the variable into a new traps-init.c, to make a start at splitting
>>> traps.c in half.
>> Hmm, I'd expect a file of that name to contain only __init code/data, and
>> hence for it to be possible to ...
>>
>>> --- a/xen/arch/x86/Makefile
>>> +++ b/xen/arch/x86/Makefile
>>> @@ -65,6 +65,7 @@ obj-y += spec_ctrl.o
>>>  obj-y += srat.o
>>>  obj-y += string.o
>>>  obj-y += time.o
>>> +obj-y += traps-init.o
>> ... use
>>
>> obj-bin-y += traps-init.init.o
>>
>> here.
> 
> AP bringup and S3 resume will have a rather hard time working if that
> were the case.
> 
> Plenty of it does end up being __init, but not all.

Hmm, yes. Yet then, taking into consideration what you put in that file
right in this series (which there's nothing init-ish about, as the tables
are needed until we reboot / shut down / crash), what's the designated
pattern for what is to go where?

Jan

