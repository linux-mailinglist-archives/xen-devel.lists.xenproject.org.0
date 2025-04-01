Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BADA77D02
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 15:58:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934403.1336112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzc8I-00017I-5l; Tue, 01 Apr 2025 13:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934403.1336112; Tue, 01 Apr 2025 13:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzc8I-00014q-2W; Tue, 01 Apr 2025 13:58:26 +0000
Received: by outflank-mailman (input) for mailman id 934403;
 Tue, 01 Apr 2025 13:58:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzc8G-00014k-Pg
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 13:58:24 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6023f332-0f01-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 15:58:23 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso37831505e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 06:58:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8fba3b13sm162074955e9.3.2025.04.01.06.58.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 06:58:22 -0700 (PDT)
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
X-Inumbo-ID: 6023f332-0f01-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743515903; x=1744120703; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xagmlVaVQGeaP1tbXZzkvoh+Y/8fLOW6OUuV1MsP6oY=;
        b=CBTMbmqH/25t6hfrXLyWYW/WDHRQ8JayM1mElOe04wZRVcfTVButbSOaEI2Pyq3uMS
         hVjvjky0dpi9AivkoZlpO1KBWQjhcm/1Znnpy+tD32VXbSfsrSn5IIr7/jd04H25qp+f
         6jzG7VBGRB0T9puroE9P5VX89b6Ee96W6l0/oyDj2RIsERpCurgq1Lv5rbtVq8/L7LHM
         +w7ts+sEiaCcufjzvFj/jJo14ICLVS70qFZxtKCbA+fsHnPzyM/tcAUcpkLVV0pUE3Gh
         BF3tjkolD4a95wMm7eqEE8TXQjD0VXKKZih93AWiEeOawRpkwGUGgX2NAsH2GpPFpoT5
         lHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743515903; x=1744120703;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xagmlVaVQGeaP1tbXZzkvoh+Y/8fLOW6OUuV1MsP6oY=;
        b=einjPegVmsppddX+tYQO6y0xpbNUfUtyiugHkwCLvI1NdXacERstROkQ4wEu2dqBnQ
         M2zZQjmXqnAJVEOM9AitP1guMD/HYU25HEezMoKrIDEBJjVdvMXMmMLcSR4xE8fyoCQV
         q02UwDD1Ji72huFkCBVi0oKkt/VQhAv4q+YnSWE8nZ/ynSvnir5ms6sXK2Z2OJZT/3YS
         G5s10r/Mhnr+1VvmX95xx7oBRq53AoB1cOKdNv1wPLZMmRzsRIKBKz42UHfIn7MtJqIL
         FO5JIxr65H28VNJOJzsMsKqvjJhjEjwUEWSfZqj9CD4SGIR0JTkKnyKMKa5UCTHnHQuB
         pb7w==
X-Forwarded-Encrypted: i=1; AJvYcCVOIUMseTWMqd4O19S1+VrNbQfFjTwuGd19RmlI4wV0yop++ugct234TlZxYRZKhlXdNPqslYgTn2g=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5H42i5JSiMsyX/utGhisXlaOkY9e0kFCHhdiUVIlwTqH+a22Y
	XaS/jMQaN/Oq/cqqjT3jQ9SIzX1gqlwx7tcnWLURhOirbhOVpgrw6qF6Nfq8hQ==
X-Gm-Gg: ASbGncuX/JgmiX9C63FRm9FNF9gU95SlmqVYl2Pd4r7LV/C5nrZd64xx5h6S++pP8vz
	xVh5snyvvU4csZsnnNBbd6Edm3QCSwkOrhiSeNmPnGK8BA1k2mt8Z5p2OHcQqDNgYw6rpKRnJS/
	90i9DNLofw/E1OzRR+vAeZ129zPmwz9RtwJaZrw0vEWIWvipMUN28+xvtNiJK6q8Atjtnfa5DTi
	aaC5Y8NJzUB3uduMBR3+BREfQYheE8uOq1xoOko73H8TFJLoSOQIw0PhUz4zzUYug+gJrsN4Z8d
	CzqAubXaiwfscuXBbS9rkWOH7UbpxcULOp+7/NIgO//xtEoEDh4XRI/V2Ovrz3YHTG4/JLI6Acz
	sIajraO1O1mGljKr232Zc9MZpIWtdFsEk772LhGCI
X-Google-Smtp-Source: AGHT+IGo3eSAgqiQ0OtjCLncy/UAlaDfaK1VWu71bChMENCAVL46y1M+ChhZAfM1TWwM2UgtUwNW0A==
X-Received: by 2002:a05:600c:35c2:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-43db61d0c5fmr122462395e9.9.1743515902567;
        Tue, 01 Apr 2025 06:58:22 -0700 (PDT)
Message-ID: <137124c0-854f-4c31-b907-aecdcf9f5eb6@suse.com>
Date: Tue, 1 Apr 2025 15:58:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] x86/EFI: prevent write-execute sections
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20250401130840.72119-1-roger.pau@citrix.com>
 <c686844c-4cb8-43d0-a762-7f93a30f9388@suse.com>
 <Z-vpoh858ldjXok_@macbook.local>
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
In-Reply-To: <Z-vpoh858ldjXok_@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.04.2025 15:26, Roger Pau Monné wrote:
> On Tue, Apr 01, 2025 at 03:13:52PM +0200, Jan Beulich wrote:
>> On 01.04.2025 15:08, Roger Pau Monne wrote:
>>> Hello,
>>>
>>> The following series aim to remove the presence of any write and execute
>>> section in the PE Xen image.  This is required to support the NX
>>> compatible flag in the PE header.   By the end of the series the
>>> resulting PE image has no relocations that apply to text sections, as
>>> text sections are strictly mapped read-execute only.  Xen itself
>>> attempting to apply relocations to text would result in page-faults.
>>>
>>> A smoke test is added to Gitlab to ensure the PE NX support doesn't
>>> regress.
>>>
>>> Only patches 5 and 10 are carried over from v1, the rest are new.
>>>
>>> Thanks, Roger.
>>>
>>> Roger Pau Monne (11):
>>>   automation/dockers: add to README how to rebuild all containers
>>>   x86/mkreloc: fix obtaining PE image base address
>>>   x86/mkreloc: use the string table to get names
>>>   x86/mkreloc: print the linear address of relocations to read-only
>>>     sections
>>>   xen: remove -N from the linker command line
>>>   x86/efi: discard .text.header for PE binary
>>>   x86/efi: discard multiboot related entry code for PE binary
>>>   x86/boot: place trampoline code in a non-execute section
>>>   x86/efi: avoid a relocation in efi_arch_post_exit_boot()
>>>   x86/efi: do not merge all .init sections
>>>   automation/x86: add a xen.efi test with a strict NX OVMF build
>>>
>>>  automation/build/README.md                   |  7 ++
>>>  automation/build/fedora/41-x86_64.dockerfile |  5 ++
>>>  automation/gitlab-ci/test.yaml               |  9 +++
>>>  automation/scripts/qemu-smoke-x86-64-efi.sh  | 22 +++++-
>>>  xen/arch/arm/Makefile                        |  6 +-
>>>  xen/arch/ppc/Makefile                        |  6 +-
>>>  xen/arch/riscv/Makefile                      |  6 +-
>>>  xen/arch/x86/Makefile                        | 12 +--
>>>  xen/arch/x86/boot/head.S                     |  3 +-
>>>  xen/arch/x86/efi/efi-boot.h                  |  7 +-
>>>  xen/arch/x86/efi/mkreloc.c                   | 77 +++++++++++++++++---
>>>  xen/arch/x86/xen.lds.S                       | 20 +++--
>>>  12 files changed, 138 insertions(+), 42 deletions(-)
>>
>> From titles and diffstat (all Makefile changes being covered by patch 05)
>> it looks like you still don't add passing --nxcompat to the linker. Is
>> that intentionally left out here?
> 
> Hm, and I see I also failed to add (the already RB patch) "xen/build:
> warn about RWX load segments".
> 
> nxcompat should be enabled by default I think?  I can of course make
> it explicit by adding to the PE link command line.

It's not always the default for GNU ld:

#define DEFAULT_DLL_CHARACTERISTICS	(${cygwin_behavior} ? 0 : \
					   IMAGE_DLL_CHARACTERISTICS_DYNAMIC_BASE \
					 | IMAGE_DLL_CHARACTERISTICS_HIGH_ENTROPY_VA \
  					 | IMAGE_DLL_CHARACTERISTICS_NX_COMPAT)

And even that I'm not sure is entirely right. I think it goes from the assumption
that everything that isn't Cygwin is MinGW. EFI, however, is yet something else.
I'm further unconvinced that for any environment the linker may reasonably set
this bit without the programmer's consent. But of course that's also a matter of
how things are documented - there's a command line option after all to turn off
the flag.

Plus there's yet another concern I have. Historical knowledge (i.e. may no longer
be true) of mine is that the DLL characteristics field is applicable only for
binaries which have the IMAGE_FILE_DLL flag set in the respective header field.
EFI binaries aren't libraries, though. Otoh GNU ld, judging from source code,
apparently doesn't set the flag even for DLLs (or I'm simply failing to spot the
respective use of IMAGE_FILE_DLL). Whereas going from observations I find the bit
is set in DLLs of the Cygwin installation I have sitting around somewhere. (IOW -
I'm confused.)

Jan

