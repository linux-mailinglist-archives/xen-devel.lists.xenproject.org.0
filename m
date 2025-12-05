Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0165BCA7095
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 10:59:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178588.1502337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRSaf-0007G2-Co; Fri, 05 Dec 2025 09:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178588.1502337; Fri, 05 Dec 2025 09:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRSaf-0007Dw-9f; Fri, 05 Dec 2025 09:59:05 +0000
Received: by outflank-mailman (input) for mailman id 1178588;
 Fri, 05 Dec 2025 09:59:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vRSad-0007Dq-GV
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 09:59:03 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06aa2667-d1c1-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 10:59:02 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-42e2e77f519so1399061f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Dec 2025 01:59:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbe8fdcsm8007451f8f.6.2025.12.05.01.59.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 01:59:01 -0800 (PST)
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
X-Inumbo-ID: 06aa2667-d1c1-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764928741; x=1765533541; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fSwK9fCUE0C96+EBr8cE2uq9R2lO759fF4j2IVlT98I=;
        b=BWaeo8KiTtHa9+6r8jceV6hDY2M1XZI2SmQ5sO2qgtdzUIvHqlQStyfSsihUn6lXnI
         yM5hzLVrEBwY4Is+N/aO9JLa0uQfca9wQWkA1aK7QtQaQ71xGP8ayttUjOv6mHBio30d
         d8yYikMhiO6ymhf8ijBzEl6WBG2ac+FcpRlR7s0kbP3TmRfKaaz0XOMdX00a2CxQL5Y2
         MEe/O17UbuPYC32Ry2qajQYfBBO7bTW9v1b5HfyPR4ETHGy/fhjC3TRrE1+EJv0fg3de
         Ewj14YWMFePemUdkvbMu/MBotHlgouakEqDYYH8HW5fDy5linOBQzwdX70fIVb+MW2X+
         bqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764928741; x=1765533541;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSwK9fCUE0C96+EBr8cE2uq9R2lO759fF4j2IVlT98I=;
        b=A073ThN/jUTobNP4uT1QNo8QsJFLc6jPxRyWARW8gBvvy6ml18JV4f13qMsJ8UdGEL
         I813pKMY0ffcdYajQl3fJJuJAiTSO2yRKN5hDDfJa5wuhQ5swc+3I3Gl7mNcwQaXhroT
         yvo2d8VobNDOU6eCxml8pjH3b27gc62pwfP9NeUHHaAV7xNWRmCUGj1U5ofgnnKKBsDV
         062CqnFriJ6PNJ8JCbUkKdwmfushJcvNrYonpLF7lJZhMnCjw8bVkJs9MmTlJRf5fjQW
         gprTrCpxWF40ExOew/jKkSl52y+Y/kCzxXe3ofxghoOTCduqbuRBDRZOK97B7bDJsgOg
         Yw3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXsd1CDn1lMTYkpyHw54XJtakJEhQq3Mwxn8l0E1Q4dlhyDmMDEZgra/ev1zNVdZ2QbYwtkyAIK1Ac=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjoEhK3U5yCuWki2u10Dy7MaHhurqTx6ZkMNRlWv8+oFH/FbJf
	Llf0+3A7/AZQ80J/H0GDYNCRdO7MoxCJACKyUSGBxpv3+PxyCuzoXsLtSBEIobQosA==
X-Gm-Gg: ASbGncveNvSvVqIQD16NC+A3T8TjZRq5z9ZCYnlT4fNR38yF5yEBUyY8z0hTH8/du28
	M+KFJxyzkEZaotvxVWYKX6SsNYdh24MLIXL3NqH9idP/gNzXDILiGwihdIUAfU57ClnKzhkSQr5
	lY5Y5cc2ywtoPDi0O7geioB4/z/8k32H3G0lRibZPYXNQP0xdsnqBdc9ubJZfBb/LCaaDrtCZ0F
	bSG53u9RNaWc6z2mA7dezunOOeVzQzzBNW4lYyPQtCpSSfG5jfZt0mFYUq9sNwF3yddY0hKRSfi
	97PlSUyUEv50WQgmtWXd75tXNhO8hxZYYJzzH/vpVPA5zvkkL9BHhlaisct0m7Tp+E312x2bkL5
	CdymYV9VNhEzxeZA/EnpYIshCwiQUlGSqMgqVpS7P3m8P2dkkK+zUWsIJoR1Ym2VgyL9Hy2sg7K
	OdNMg9BsFGnGhECcvT46Z8MS8nUoNBJnlFTt5vTDHMgqh3b7avQxujTAcwKQl/g33tLjjz3Jpim
	qSd/ttH6qZ0Ig==
X-Google-Smtp-Source: AGHT+IFchfcOzbIbyrjaHWggo7M+gSnOYWQUUFdQju3w0UjEl7zS1/8iodAsVFIF4jYKizIPy6jnaQ==
X-Received: by 2002:a5d:5f84:0:b0:3e7:45c7:828e with SMTP id ffacd0b85a97d-42f798482c0mr6723782f8f.33.1764928741423;
        Fri, 05 Dec 2025 01:59:01 -0800 (PST)
Message-ID: <54cad03d-5530-4d6a-b3c3-956906daac1c@suse.com>
Date: Fri, 5 Dec 2025 10:59:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] Changes for several CI improvements
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
 <16830f7a-1bc9-472a-adfc-1d959b6fa58e@suse.com> <aTKrCwCNwtT9ysIz@mail-itl>
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
In-Reply-To: <aTKrCwCNwtT9ysIz@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.12.2025 10:51, Marek Marczykowski-Górecki wrote:
> On Fri, Dec 05, 2025 at 08:34:10AM +0100, Jan Beulich wrote:
>> On 04.12.2025 17:37, Marek Marczykowski-Górecki wrote:
>>> - Alpine update
>>> - Debian trixie
>>> - Linux stubdom
>>> - test arbitrary linux branch
>>>
>>> Technically, the last patch isn't strictly required, but it eases debugging.
>>>
>>> Green pipeline: https://gitlab.com/xen-project/people/marmarek/test-artifacts/-/pipelines/2196630637
>>>
>>> Marek Marczykowski-Górecki (12):
>>>   Add Alpine 3.22 containers
>>>   Switch Linux builds to use Alpine 3.22 container
>>>   Add debian rootfs artifact
>>>   Add linux-6.12.60-x86_64
>>>   Enable CONFIG_USB_RTL8152 in kernel for hw12 runner
>>>   Include git in the ARM64 build container too
>>>   Support building arbitrary Linux branch/tag/commit
>>>   Save Linux config to artifacts too
>>>   Add linux-stubdom dependencies
>>>   Prepare grub for booting x86_64 HVM domU from a disk
>>>   Prepare grub for booting x86_64 HVM domU from a cdrom
>>>   Setup ssh access to test systems
>>
>> Like for the other series, where one patch is missing, I'd like to mention
>> that here patches 01 and 03 didn't make it.
> 
> Yes...
> I don't know what to do about it... xen-devel list reject emails with
> dockerfile changes as "spam". People CCed directly got it. Should I
> include more people in dockerfile patches, just in case?

Personally I'd say no, but maybe others differ. Imo this needs solving some
other way, as legitimate content really shouldn't be blocked from hitting the
list.

Jan

