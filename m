Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A542A77BD3
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 15:14:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934262.1336029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbRH-0001Gv-98; Tue, 01 Apr 2025 13:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934262.1336029; Tue, 01 Apr 2025 13:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbRH-0001ES-6H; Tue, 01 Apr 2025 13:13:59 +0000
Received: by outflank-mailman (input) for mailman id 934262;
 Tue, 01 Apr 2025 13:13:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzbRF-0001ED-N0
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 13:13:57 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 295648e5-0efb-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 15:13:54 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso37073875e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 06:13:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b658b7bsm13918170f8f.20.2025.04.01.06.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 06:13:53 -0700 (PDT)
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
X-Inumbo-ID: 295648e5-0efb-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743513234; x=1744118034; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k2aOFrJeLChF3MlqRq3WH4VJ3NAOi+R+dVtjMisS9nE=;
        b=dA8dWoI2c4xAtzFS5QefN0eXPutUl22Py5/as/FNAbcQasRVckvmS29pM8ypDBpOSg
         qzSoffk6zVPL+ZomOWL8Ut6ExpsjhKT+lkaBr/5LvrigaSyVRf5tQ28zw3HqsXhJBM6U
         l3iBcCGrY5l7M3MwfPaJG0iSG4HeFzfbL4MKigbpnCzTDZvxrP3EBAMMYoEXQGeorS6A
         LDb8wFtYs8T/LG0GpBzlQpbfv6bF2wBKSaoPEj3Hmcluz0+Cjx5ltJyDwa9PRFUXIKTD
         G1yjU2Ke0wJf4damYa6JvjEf1e4pKJB/sV4ekhXrpDuFrLDf/VDGe/IEOPfJk/MI2iLF
         /1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743513234; x=1744118034;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2aOFrJeLChF3MlqRq3WH4VJ3NAOi+R+dVtjMisS9nE=;
        b=olWLE6VoVCH/noFZO3A14+t7jvFFmgymhYQayuhTBlyDeuSBbNrvFywJq5yx96349d
         eSSKWSi5q5v58BdSCM0siGDKRZiZbjrl1vALfYmHCllGLXKM9xzFrdNhkusemlboTqdp
         LBV4HLIu0GbB2yf+4BgrmClLWlt5FEYe05yF/hdlrVXSoHr6PDMGdRPf/huCVxEUJqAm
         oxs3I9AE7b8XmXwtbVU06gQ2JlSwr/tgdFje8fPf+21OB/fvMlrMsTAYAYi7Siwln7Wn
         JrV83fbLQxsdKbybsNVayK480cVqBn1KDwSXWiME/jfz82gdn1aYgR41+EiGDwZQ/yfh
         M+eA==
X-Forwarded-Encrypted: i=1; AJvYcCXG5SglfhsRdtVWr7HkG62EwmFy2ocrWTpI5EUcC2wThIs03FkBghXAGWvsDWOmTr3rNEDDoEcig/I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjXrAHOAWS3Lxb1ugvVaMW//orI303AtJmJPHwnaTU18WgPhlT
	yttUx7CfLsC4uC/5zsF4PpdVtIf3ZAfdCJ64mo2CkQ+qCx/88NC0/VTzpGODYQ==
X-Gm-Gg: ASbGncsk2LxXDMJzWdobwj8uHET294BvAFtOYoepLbbh2rM72GQzp8reJ+1fw3MJG62
	Fic9utLR92cvi6qwXH0rht5szs9fBjN+M6cVjTuKA69BOcUrMxxfncXSuqB/1k+sEWEstR7zVxe
	uInl+jJjbhNWi1FiTab1RmNfuZKpqtDEigYKq8ZK2prTfxmrachBT0tnP9SfW5omBeE83Rico9H
	IkLeuZAOJXn66epi6T176nfXb+fs55xOswH/hVPhvfo1Xp/MfC9D4rlBEPCFba6VYAAMZ+S9YZy
	1OipTchGLJEWZ3t1EGvrHU6clvYfCxDazRGHaHu6L9xRdYqNnbmz+z9Symd0QUnpmj1MY+F3wc+
	qQb6Atjemgvo0A8Q3i3BiLJyBzGDIWA==
X-Google-Smtp-Source: AGHT+IH2XFvrXrEpvXa4wXWmABZvGl+Rv3rxTfd1HKyfO65pXGtMSlIseu0EGsHlE4ZG1ZOwFrwH2g==
X-Received: by 2002:a05:600c:45cd:b0:43d:54a:221c with SMTP id 5b1f17b1804b1-43e94a3bccdmr110965595e9.18.1743513233684;
        Tue, 01 Apr 2025 06:13:53 -0700 (PDT)
Message-ID: <c686844c-4cb8-43d0-a762-7f93a30f9388@suse.com>
Date: Tue, 1 Apr 2025 15:13:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] x86/EFI: prevent write-execute sections
To: Roger Pau Monne <roger.pau@citrix.com>
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
In-Reply-To: <20250401130840.72119-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.04.2025 15:08, Roger Pau Monne wrote:
> Hello,
> 
> The following series aim to remove the presence of any write and execute
> section in the PE Xen image.  This is required to support the NX
> compatible flag in the PE header.   By the end of the series the
> resulting PE image has no relocations that apply to text sections, as
> text sections are strictly mapped read-execute only.  Xen itself
> attempting to apply relocations to text would result in page-faults.
> 
> A smoke test is added to Gitlab to ensure the PE NX support doesn't
> regress.
> 
> Only patches 5 and 10 are carried over from v1, the rest are new.
> 
> Thanks, Roger.
> 
> Roger Pau Monne (11):
>   automation/dockers: add to README how to rebuild all containers
>   x86/mkreloc: fix obtaining PE image base address
>   x86/mkreloc: use the string table to get names
>   x86/mkreloc: print the linear address of relocations to read-only
>     sections
>   xen: remove -N from the linker command line
>   x86/efi: discard .text.header for PE binary
>   x86/efi: discard multiboot related entry code for PE binary
>   x86/boot: place trampoline code in a non-execute section
>   x86/efi: avoid a relocation in efi_arch_post_exit_boot()
>   x86/efi: do not merge all .init sections
>   automation/x86: add a xen.efi test with a strict NX OVMF build
> 
>  automation/build/README.md                   |  7 ++
>  automation/build/fedora/41-x86_64.dockerfile |  5 ++
>  automation/gitlab-ci/test.yaml               |  9 +++
>  automation/scripts/qemu-smoke-x86-64-efi.sh  | 22 +++++-
>  xen/arch/arm/Makefile                        |  6 +-
>  xen/arch/ppc/Makefile                        |  6 +-
>  xen/arch/riscv/Makefile                      |  6 +-
>  xen/arch/x86/Makefile                        | 12 +--
>  xen/arch/x86/boot/head.S                     |  3 +-
>  xen/arch/x86/efi/efi-boot.h                  |  7 +-
>  xen/arch/x86/efi/mkreloc.c                   | 77 +++++++++++++++++---
>  xen/arch/x86/xen.lds.S                       | 20 +++--
>  12 files changed, 138 insertions(+), 42 deletions(-)

From titles and diffstat (all Makefile changes being covered by patch 05)
it looks like you still don't add passing --nxcompat to the linker. Is
that intentionally left out here?

Jan

