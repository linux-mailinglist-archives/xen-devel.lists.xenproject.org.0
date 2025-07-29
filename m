Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 078C0B149FE
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 10:21:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062163.1427791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugfaH-0005N2-Tr; Tue, 29 Jul 2025 08:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062163.1427791; Tue, 29 Jul 2025 08:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugfaH-0005KZ-R0; Tue, 29 Jul 2025 08:21:17 +0000
Received: by outflank-mailman (input) for mailman id 1062163;
 Tue, 29 Jul 2025 08:21:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugfaG-0005JG-5r
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 08:21:16 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9803f60-6c54-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 10:21:06 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b78bca0890so870722f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 01:21:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2403e44cb15sm31636375ad.0.2025.07.29.01.20.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 01:21:05 -0700 (PDT)
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
X-Inumbo-ID: f9803f60-6c54-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753777266; x=1754382066; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=emhV0WTEPM81xc6cS2mSxFMg6sTx3bXADKgMtoM6FLI=;
        b=RPXWEJBEZHkaxB3eCqbj3Fwgxw+eyOzjZe4gHwGGS2FoYFbpG0lMQ6a8P7Yudj9htv
         TCishwsfNQ/XJ3uIHzAiYIaJSiQmU/hkctXyQr9TJN98Uukho8U5r2A/o97wscdRMal/
         3Ju4PosHGeZK9awTt/SbPtC4VdqTcxQhypXP32o4a3duzB+C/U1rxHpdjccX7tGiT3dX
         mjP/BGwSWtYBcHtC8Eh6bYfZBL8GDqFFe6HhSDexf6jmsAZYmpiqSe4eOek1xBTDvKK1
         GjsBA02oljZRVUseToq8OZo+AA98lEz1jTXg2ADd22efJW0btXS8Xq3rwZFLFvjkuZfg
         he5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753777266; x=1754382066;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emhV0WTEPM81xc6cS2mSxFMg6sTx3bXADKgMtoM6FLI=;
        b=rOa8Cx+4l3/djg13Oqx65ScOFn+pFQ3z34VqQBis2e+IDnm7PN78rI6+1eTbHHIn+z
         mMHmK0nqooWKdfMdaVI+u+ZAnCF1RrswTQYhvVcohLyaoejHaOj4JScD9BhyCSkfYVs5
         gayRXzzBV4spLG6C2jSKKzVKX8w4ddbTbU+2f789g0E9EaOSqUVFiIBxgH7/rEMz2ErL
         JlLs6H02lvg9whPHARjmpXQxFBJ7aXCiK1yOfO1Wr8rSnvq6WCX04DUvlolTDIYJN4JP
         Ezw3MFvanrN5k0F6VqAxQMTtUdrrSgRCrWhJpwyiOeeGLC2H66l+lXeUbTMJ+kTaWQzv
         tjQA==
X-Gm-Message-State: AOJu0YzFLmSaMOrMMuQe5ldGNZmPg8yVh4Jerv/o/WpDmfldsd56S3wV
	aWdxSAcFqq3qCqbS1W3+BuKjAUGqeBUIE1ZmCEeheoJvdx+Bp/ioRqi5v8vK6dKadg==
X-Gm-Gg: ASbGnctAjd5JVvnViVb9eAfiDs/ChW4h+r+5WmMU7yyYtHkqnekcHEBmWRxrrLHFRHF
	1hEdf+s0DhPMoB5yuz0kJ2/IJaMGUzdaCe/d9Xhss2oCWb7kUdpFwcdZMtGaiAJC27E//R3BpB6
	1Za8Smdvz7KGultA8L81dUmrYUGj2rB9RzPQ8AxF/KT9/JSzb/4Zq6JMDdU82AbLOksPfXJMaA6
	TqCuLwGEtPp/ZoS0Y4eXMNyHV/hfBzyxBW/Pfy9OSAeXSUsgdIMyikW/j58cClrXtr5h0qDiCFg
	r4X0a1r/yiq31e/KhbPYdRIbHgPT8rPMDihl1mij52GqR9LBVCipkipQrqtm6DkAZXRx+3GWmJ7
	nTH7SlEhW3f8qnbYE1tcglgbo5XuhZrt6bJpCIZ6QmqWEK39MwjyjnzI/A5++A/zV8Dst3f5JlO
	3r3TwTgTQ=
X-Google-Smtp-Source: AGHT+IF+OHt7NhZoFAbs6R0YiyYNiObUKwF8uchmNLdU30flGpHskPaGOh+RPt97GInuY6ikO/Qydg==
X-Received: by 2002:a05:6000:4310:b0:3b7:8228:7a35 with SMTP id ffacd0b85a97d-3b782287bddmr7182836f8f.46.1753777266318;
        Tue, 29 Jul 2025 01:21:06 -0700 (PDT)
Message-ID: <182d2b92-ba93-4916-a277-d7996b784fa2@suse.com>
Date: Tue, 29 Jul 2025 10:20:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
To: dmkhn@proton.me
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
References: <90e79e175b5f703f33944415df3c7a73d6abc385.1753722403.git.oleksii_moisieiev@epam.com>
 <aIfrhfoaEBx2tyM3@kraken>
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
In-Reply-To: <aIfrhfoaEBx2tyM3@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.07.2025 23:28, dmkhn@proton.me wrote:
> On Mon, Jul 28, 2025 at 05:07:30PM +0000, Oleksii Moisieiev wrote:
>> This commit introduces a new Kconfig option, `CONFIG_DOM0_BOOT`, to
>> allow for building Xen without support for booting a regular domain (Dom0).
>> This functionality is primarily intended for the ARM architecture.
>>
>> A new Kconfig symbol, `HAS_DOM0`, has been added and is selected by
>> default for ARM and X86 architecture. This symbol signifies that an
>> architecture has the capability to support a Dom0.
>>
>> The `DOM0_BOOT` option depends on `HAS_DOM0` and defaults to 'y'. For
>> expert users, this option can be disabled (`CONFIG_EXPERT=y` and no
>> `CONFIG_DOM0_BOOT` in the config), which will compile out the Dom0
>> creation code on ARM. This is useful for embedded or dom0less-only
>> scenarios to reduce binary size and complexity.
>>
>> The ARM boot path has been updated to panic if it detects a non-dom0less
>> configuration while `CONFIG_DOM0_BOOT` is disabled, preventing an invalid
>> boot.
>>
>> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>>
>> ---
>>
>> ---
>>  xen/arch/arm/Kconfig        |  1 +
>>  xen/arch/arm/domain_build.c |  8 ++++++++
>>  xen/arch/arm/setup.c        | 14 ++++++++++----
>>  xen/arch/x86/Kconfig        |  1 +
>>  xen/common/Kconfig          | 11 +++++++++++
>>  5 files changed, 31 insertions(+), 4 deletions(-)
> 
> I think there should be changes in
>   include/xen/domain.h
> and
>   arch/arm/include/asm/setup.h
> to compile out declarations of dom0_max_vcpus() and create_dom0() under new
> CONFIG_DOM0_BOOT.

Adding #ifdef-ary just to hide declarations is often merely adding clutter,
without providing a clear benefit. I didn't check in this case, but I think
when making such a request you want to clarify what the gains would be of
adding more #ifdef.

Jan

