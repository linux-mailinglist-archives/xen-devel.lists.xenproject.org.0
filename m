Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F500CB5174
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 09:21:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183633.1506248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTbun-0001qe-1b; Thu, 11 Dec 2025 08:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183633.1506248; Thu, 11 Dec 2025 08:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTbum-0001pD-VA; Thu, 11 Dec 2025 08:20:44 +0000
Received: by outflank-mailman (input) for mailman id 1183633;
 Thu, 11 Dec 2025 08:20:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTbul-0001p7-Gp
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 08:20:43 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47e25011-d66a-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 09:20:41 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so4884645e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 00:20:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89f74291sm20421535e9.11.2025.12.11.00.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 00:20:39 -0800 (PST)
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
X-Inumbo-ID: 47e25011-d66a-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765441240; x=1766046040; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=199tdwz7sf7JJNa5p7Oom8elNhVDlkcvMlfTdUa4kEc=;
        b=M7MQnjX/amoDdyT7tyzu2UQ/AzQbEaXwXlxsj4Dh5BWc87bD9BtME9e+e5LraEIEKN
         DTK7ILiiMkDYjusE8vWDb/Dqdn0m0BCeMBkP3foxFB0FsovDUEZ7Qxgks2D8c+SLXEUs
         biJ7BA9VD1rVdnDWcmXSV+N3lR+W/sBPkhu4o0iu0LuUfEhN+6xjOAAv+I1HBk+ALzJM
         Py8lXHpj4J6q723EAVTVxwUVQFcTiriwYmBqd1tKz/Mud9oDyaW9rI9fMJdgcwMS6olT
         1V5EiR/J2Mjt93G7enep6QOySkQrgwC6lu2E7pdieAE4+sTkXontZHuednuXlhKh7GVI
         eaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765441240; x=1766046040;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=199tdwz7sf7JJNa5p7Oom8elNhVDlkcvMlfTdUa4kEc=;
        b=J5kBJBt8zdUJrCGIUnTKpA2BuI0VTlX5wQF3tfHKOhLcy66Xks9YzjFSKhUHPPUPa1
         T9Db+3j2gtqIoQgi11g9SByxEoBrFZTbavCIO7Ca08aZx9QJko0vdPy3B7RmXGtTFWph
         E0MgeqDy7J5jqGanIbTtVGtUrOCTu/dJIzeu3x/AYs1ECZ66ztdEhWVPpU8i829xkbM5
         l2ZGx3K+vPj1ZNJbSipyvJvsGkodNM/yXOjenue89MOpOgltuVMevVisjtKSQ4seb1bc
         xNr8JQCoZ75m1Adc13bNgnAEzS73hekZUfSynazyq98qH0TCH+F8EpyagZ2+rovJlyVy
         /UFw==
X-Forwarded-Encrypted: i=1; AJvYcCVB5eVuJiyo7vh0aQPWgkHtR8+BqgxTdl+QhZlpSVxxj8WRtuJqNBpsMGwVQB7rDY++QlrRgcGUK4c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YznQ7ZCclRRGiEc5BXtROvnzdiVdj8sXMR8aMrfxhziCvGzbuVK
	nFPGe8q2daOqeXOKECw/7GU/uBqTVAPwHjIkyMMYiBLSMnzzYM8bRT+7tgKzEsSHDQ==
X-Gm-Gg: AY/fxX7ORpYLBcs61bEupF2KRj6ozVZvjNLN42/GSespjqhwEvvKV1hADyB7tR2N6k4
	S+ALNPwhXmzPbgIt0xMSgOlI9O8MkvjYVcEj5nQzpZALBCNHUozfIrrLsBwcLzENn5q4YkL4U7V
	OgL1FWCcCiqcjvWnfNu8LKHv/NFQ6qspt/Su1AoTQm62Fkq/Re0XMoyPtHSJBSxBvpJf/qgYjC3
	F1szwKwAd1TboJBQl9UDhkKvE0nA99FyoY+I5woTZOo0NpVZdves1B4gA9T7bIoTLJaSsqguPOM
	iFUu1psMfCw2O+/sPOn7caoh95PPz458cUngve9dGk1Sz1Mm2gztwBFYUqB2NbXHtLvL8IBjN0s
	gE8jiFbbfCOjpIZMYCrBHo8sKJcEq3DP1AqBe62LwDIPaieidCDoomBN/ExT3LF6JSr5FT2a9uH
	qjTPyPl5NQ7yEvTAcZQZ71in+lXEVRBRd+SJqaQ8DOV5DrpzrObb30yuDkFO8gCYz6awGcwduqf
	+zge8nnM/Ovcg==
X-Google-Smtp-Source: AGHT+IHXVwBp1NRR+fgRyAdxAhAveZwTAo4jwG2ekFJ6zyCdN/9UIO2Xo2hKZNExS62NbkuWDcbBrg==
X-Received: by 2002:a05:600c:190f:b0:47a:8154:33e3 with SMTP id 5b1f17b1804b1-47a83810f33mr50819525e9.28.1765441240270;
        Thu, 11 Dec 2025 00:20:40 -0800 (PST)
Message-ID: <d40dc64e-cf8e-4bf7-9d04-1dcfe4c6abea@suse.com>
Date: Thu, 11 Dec 2025 09:20:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen: Add CONFIG_GC_SECTIONS
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Victor Lira <victorm.lira@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20251209214728.278949-1-jason.andryuk@amd.com>
 <20251209214728.278949-3-jason.andryuk@amd.com>
 <a734eeb0-c3f2-4880-86ee-7eeeb7beeacf@suse.com>
 <974c3c29-8f58-46fd-9ffd-4c574525f66c@amd.com>
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
In-Reply-To: <974c3c29-8f58-46fd-9ffd-4c574525f66c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2025 17:57, Jason Andryuk wrote:
> On 2025-12-10 03:17, Jan Beulich wrote:
>> On 09.12.2025 22:47, Jason Andryuk wrote:
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -680,4 +680,13 @@ config PM_STATS
>>>   	  Enable collection of performance management statistics to aid in
>>>   	  analyzing and tuning power/performance characteristics of the system
>>>   
>>> +config GC_SECTIONS
>>> +	bool "Garbage Collect Sections"
>>> +	select CC_SPLIT_SECTIONS
>>> +	help
>>> +	  During final linking, garbage collect unused sections.  This will
>>> +	  reduce the size of the final Xen binary
>>> +
>>> +	  Only supported for ELF/Multiboot xen/xen.gz, not EFI xen.efi.
>>
>> This last sentence is x86-centric, which it shouldn't be here (or it should
>> say that this is an x86-only aspect).
>>
>> I also wonder whether this wouldn't better live next to CC_SPLIT_SECTIONS.
> 
> If I put it immediately after CC_SPLIT_SECTIONS, menuconfig puts it as a 
> top level option:
> 
> │ │    [*] Garbage Collect Sections
> │ │        Architecture Features  --->
> │ │        Common Features  --->
> 
> I thought Common Features was a better place for it.

Oh, right. I didn't recall CC_SPLIT_SECTIONS wouldn't even have a prompt. I
wonder if it shouldn't gain one, move somewhere here, and then this new
option could be placed next to it.

> Also, I think it should probably gain " if EXPERT" as well.

Not sure there. If this works reliably, I don't see why it would take an
expert to enable. Eventually, after all, this may want to be the default.

Jan

