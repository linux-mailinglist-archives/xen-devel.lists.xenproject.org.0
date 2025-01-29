Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF398A2185D
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 08:56:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878918.1289125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td2vg-00057x-3b; Wed, 29 Jan 2025 07:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878918.1289125; Wed, 29 Jan 2025 07:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td2vg-00055i-13; Wed, 29 Jan 2025 07:56:08 +0000
Received: by outflank-mailman (input) for mailman id 878918;
 Wed, 29 Jan 2025 07:56:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1td2vf-00055c-62
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 07:56:07 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7da685ed-de16-11ef-99a4-01e77a169b0f;
 Wed, 29 Jan 2025 08:56:05 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5d96944401dso10813762a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 23:56:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6a2fbcca0sm549817566b.101.2025.01.28.23.56.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 23:56:04 -0800 (PST)
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
X-Inumbo-ID: 7da685ed-de16-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738137365; x=1738742165; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K/Okr+Pagtqjv6CJ8CoRIdA57yq3DXtsNYEeGfdN0ko=;
        b=CZ9V60SsZCbgKx0dDyIdbFcy4qQfhIDCtabmqouc/ojR2FERc39b/oAzmvMfnITy3E
         kRj7dydmHgb6eFEHKzvCddllz5Wn7PkJZpAkR3vVs30CRsmg6wYsmBqL8wFtnrVB17wi
         EtzxXLkplBjXQhsU4ep4pzH/f7blte0x+VsPxOL8ySYeucBfNBKqqaERswNowix16F2D
         4a8DtINLKvwN4qXUBLx15PLKKaOVDVXCPBDDkWpIW7AcOknigqIYvj+ui2xjVeh/sxrJ
         w5vuEubo7ZC2GQSfDZyFHl1/FV91PkIHAai0fgROIELyflZffHjzeqqKSITYlIxKurbT
         QV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738137365; x=1738742165;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/Okr+Pagtqjv6CJ8CoRIdA57yq3DXtsNYEeGfdN0ko=;
        b=MEooW2s0YolX+IgRe+ywA9aEmgCawOeFIxNAn1IStTIGqeR/SNBCVrnYQT+9PUHV8k
         G/IJuEzIjSo3AEtc3Ptvk/RWC3nCMjUVM8S9a9/pjnS8AnSmWUydw2Mz+SmUO12KMCPg
         P2Rr6/hnIJDGapXXG5uskHiM0hVj36p27GAlNIt0uMs3dqJKb9yaAnAObajAT9fy6J2n
         rc6YFnq3ehxj+Mi1a2AZKl3NuKtNOVJROgHU2mUG3IU5LXh4tiT6FuXJfFwyuK0GgJ7P
         F7qIfEv+/2GL95dEka+2Wc68jLOW3ON1hzoxN01HQWZdJQSU+SMtSPggwyJTp5UMgKPm
         S3Zg==
X-Forwarded-Encrypted: i=1; AJvYcCWjBIqJMBnCS3F3umtr8rZrEjmv7Wlhcr64RdKWtYx7iq3HnHQY/eEJr1deMwmVZ7aznaes2JJcfR4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZsxuLMrK5xHMSrhHleV1Kb4Okqe8zAX0Lz0uPIhdoL9PaS41l
	RXq58JvGwMA7e+uBIlgYzv7bfRC+xw6J+DARnBdCQosx88qc6oStneM8cCng5A==
X-Gm-Gg: ASbGncv+QijBSZxq/iERodkt7Z5TG8FZrj5XQ1j8GBpuzWPiqV7/vXqvEXnLiwJ3CK8
	xuNkFZzwuW//v6yrC1rDS47wBBit82z0vEqVVL38iMszKwpaRpFYOzggtw1lVYCsqNVRmk4Nld1
	Lm5CfpaUmvleGCNK84Z9NNcDtEhq59BAXIB6aKqg4H6GO0mLiGJNptAWt2LX3MWHKV24I2oXaTk
	1wSXxWrLRa//nF/iTGsc3NuZaqhlrYtjO6A1Zgwct3aar6xYD//ClYiETTXvJ48O8AL3vHZ1388
	WopJFSNTtEwiPOghuW8D2yJJtkXuZMll0E9CRYjkVGglotNHHepIa4o91dInzCVHGRFpYA0z9bR
	Fq9Zde+nDoKM=
X-Google-Smtp-Source: AGHT+IHK8WQ/g/1ERnSQ33elHTcROz3RTpGGcRz5+xoMnnSAS2iU1lH5gv0yRU3hP6aX4dUvKQua3w==
X-Received: by 2002:a17:907:724c:b0:ab2:b5f1:567d with SMTP id a640c23a62f3a-ab6cfd0a17amr168419666b.32.1738137364712;
        Tue, 28 Jan 2025 23:56:04 -0800 (PST)
Message-ID: <f57b6e29-c0c8-4166-9567-53ac01225b26@suse.com>
Date: Wed, 29 Jan 2025 08:56:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/24] xen/8250-uart: add missing definitions
To: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-19-c5d36b31d66c@ford.com>
 <d58cfd92-cd73-4a7f-8660-6a235ae887e5@amd.com>
 <_2QXLWvBsyAVvLYs1e9CcyCX4s4MXM4YyIrs-lqVvpVUzZTdO6qkqnwJzHV_EEQnWkUhn2nhazgADEnsEM4kf8ciUYTrsjSJll57wFcW4nM=@proton.me>
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
In-Reply-To: <_2QXLWvBsyAVvLYs1e9CcyCX4s4MXM4YyIrs-lqVvpVUzZTdO6qkqnwJzHV_EEQnWkUhn2nhazgADEnsEM4kf8ciUYTrsjSJll57wFcW4nM=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.01.2025 02:16, Denis Mukhin wrote:
> On Tuesday, January 28th, 2025 at 2:34 PM, Jason Andryuk <jason.andryuk@amd.com> wrote:
> 
>>
>>
>> On 2025-01-03 20:58, Denis Mukhin via B4 Relay wrote:
>>
>>> From: Denis Mukhin dmukhin@ford.com
>>>
>>> Added missing definitions needed for NS8250 UART emulator.
>>>
>>> Re-used newly introduced MSR definitions in the existing ns16550 driver.
>>>
>>> Also, fixed indentation in a comment for FCR register.
>>>
>>> Signed-off-by: Denis Mukhin dmukhin@ford.com
>>> ---
>>> xen/drivers/char/ns16550.c | 6 ++--
>>> xen/include/xen/8250-uart.h | 78 +++++++++++++++++++++++++++++++++------------
>>> 2 files changed, 60 insertions(+), 24 deletions(-)
>>
>>> diff --git a/xen/include/xen/8250-uart.h b/xen/include/xen/8250-uart.h
>>> index d13352940c13c50bac17d4cdf2f3bf584380776a..6d1af31d582a3dd674a401d7f649e28c889cdc3e 100644
>>> --- a/xen/include/xen/8250-uart.h
>>> +++ b/xen/include/xen/8250-uart.h
>>
>>> @@ -51,12 +54,19 @@
>>> #define UART_IIR_THR 0x02 /* - tx reg. empty /
>>> #define UART_IIR_MSI 0x00 / - MODEM status /
>>> #define UART_IIR_BSY 0x07 / - busy detect (DW) /
>>> +#define UART_IIR_FE 0xC0 / FIFO enabled (2 bits) */
>>>
>>> /* FIFO Control Register /
>>> -#define UART_FCR_ENABLE 0x01 / enable FIFO /
>>> -#define UART_FCR_CLRX 0x02 / clear Rx FIFO /
>>> -#define UART_FCR_CLTX 0x04 / clear Tx FIFO /
>>> -#define UART_FCR_DMA 0x10 / enter DMA mode */
>>
>>
>> 0x10 is bit 4...
>>
>>> +#define UART_FCR_ENABLE BIT(0, U) /* enable FIFO /
>>> +#define UART_FCR_CLRX BIT(1, U) / clear Rx FIFO /
>>> +#define UART_FCR_CLTX BIT(2, U) / clear Tx FIFO /
>>> +#define UART_FCR_DMA BIT(3, U) / enter DMA mode */
>>
>>
>> Now it's 0x08. Is this a bug fix? Looks like UART_FCR_DMA is unused.
> 
> Correct, NS16550 defines FCR DMA as bit#3 (0x08):
>   https://www.ti.com/lit/ds/symlink/tl16c550c.pdf
> 
>   Table 7-3. Summary of Accessible Registers
>   7.7.2 FIFO Control Register (FCR)

Any actual corrections you make need mentioning in the description.
I'm glad Jason spotted this; I did overlook it.

Jan

