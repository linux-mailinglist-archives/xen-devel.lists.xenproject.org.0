Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D6BA9707A
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:24:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963005.1354141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FTF-0008Ng-SL; Tue, 22 Apr 2025 15:23:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963005.1354141; Tue, 22 Apr 2025 15:23:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FTF-0008L9-PF; Tue, 22 Apr 2025 15:23:37 +0000
Received: by outflank-mailman (input) for mailman id 963005;
 Tue, 22 Apr 2025 15:23:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7FTE-0008L1-Ch
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:23:36 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c088c36b-1f8d-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 17:23:33 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso39747295e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 08:23:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5bbe1csm180372725e9.24.2025.04.22.08.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 08:23:31 -0700 (PDT)
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
X-Inumbo-ID: c088c36b-1f8d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745335412; x=1745940212; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A+dFIFkStbh8OoCB8gwOS5OmcsYKWmPAJW+RI/ru8BQ=;
        b=duB31LftXL/jIwjCAGS2e1AhYUYWdFVh9Kkl6f0EsRfkirK+mqVLEO7IqXkp49Ig51
         AE9RHdqhR9MHMO3fl+ihQSLLqAeZQ7ChIKZDuoYlzV7sogHPpjOkVPzfdxISaG0qzT/g
         GOBJ7t63Qt8qSMq0CCC1ipMQ3Bq1es0J02/WYYkVJzt3Z12cIwhXHewB0HYozxRw6GEO
         4AQZWj8vraA2/yB5dZjm64JtfX96ZcY2SDJiglKk2kMzhKbboasHGlh82AtjLAw4KNig
         z80k1h0Rf7EF1Ey84i1eZwmfvLy4KNHJDjXMbxCdg9Z21q+AeHfMS/NkwKkgWSfVMuKH
         7cPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745335412; x=1745940212;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+dFIFkStbh8OoCB8gwOS5OmcsYKWmPAJW+RI/ru8BQ=;
        b=lOitqg/012G3ynvfSN9Wqnj81U4BOH/J+cX1INUDOo/lAnwK/XiHhlcOcNbez0Vynq
         XOrjHurM1vafFaJgD+HnZWndYbpgDiOs3NSeElxt9qhbSGRf8pOWc6Ok7FzFVfTocgcH
         jedQ7E4B4MippCP88zwn1NqDYZE4mKZoXrw3+oX7kv+I/M6o/WlvFsJmV1z9QfqX5DNa
         FgDJu01drslUb4rLuxHs6MjF9fqIC/M5w99r0ngrr15NyNSecfecWb5i8oU2WNQcRDh9
         Jm2NyDfgFsgT6rnsPWlPXiTjQdwXMdWv964JXqPlVr9Lu/J15h+iFMgJrfUs0jv+3eFw
         9NSg==
X-Forwarded-Encrypted: i=1; AJvYcCWhAeX/NmSQmBD300F6nLMu22E9CgpDfHxP8i1m2D+a3euFO2hDp98kP/uFiY/Ma8sApUil59rMmzk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxe9dio39m3nTmlbRQj5H6e1isHQMR2WAgoOZncPYH+BH1x/zxp
	oyEshIzoH5wr3O/Ldhk46eYTCBCcUIiXmkz6h0JF6s3qBYmXv7+ll8jBXP+NOw==
X-Gm-Gg: ASbGnctfaHzgbT8plKT09A7kCLFOArszXPy+LpnMa8R5GFG8jwykH19r0z+nHpV7PY9
	dZhctr5VpHbQsrRrhLxL9eZvTVfI+pdpr0Yl24eRDhO1TQ1kiUw3vsVcnQItEnocN4zyxkWunhM
	Gprit98i3AZoCgBvJiONEv+Cp8FPTZmdotiK31AX3wmYTUp7CnzcBKIlzaT0L+/zGs8LnISBEIv
	ckht1IlmSjgS0b9DggZgl9VN+rxcBFGrbdwIqPsuuR9FiTxEf9hSSlKr5hcLHhKjFSkUfy7hs38
	jk/DpksaW5s4IBUOC/fQFCh58eNu9Z5Jy3vPAnAeW34jkRkVSHuWZ7jht1d59N4P5rR7WEJDMje
	ajN+umxLZpsFhacBLeup2RmywN8nVldMZYpKh
X-Google-Smtp-Source: AGHT+IHov0IEH8tmALj62+5UKNuImTfypssiO3bqJl1FsRgIsea+X2eU2+ja7hJN8m4phHG2OiCQ6g==
X-Received: by 2002:a05:600c:3acf:b0:43d:40b0:5b with SMTP id 5b1f17b1804b1-4406ac1fc09mr120989455e9.25.1745335412244;
        Tue, 22 Apr 2025 08:23:32 -0700 (PDT)
Message-ID: <6929b073-6a5f-4b34-af5b-96b7b5ac62d6@suse.com>
Date: Tue, 22 Apr 2025 17:23:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/21] x86: Trenchboot Secure Launch DRTM (Xen)
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, trenchboot-devel@googlegroups.com,
 xen-devel@lists.xenproject.org
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
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
In-Reply-To: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.04.2025 17:06, Sergii Dmytruk wrote:
> Kacper Stojek (2):
>   x86/boot: add MLE header and new entry point
>   xen/arch/x86: reserve TXT memory
> 
> Krystian Hebel (7):
>   x86/include/asm/intel_txt.h: constants and accessors for TXT registers
>     and heap
>   x86/boot/slaunch_early: early TXT checks and boot data retrieval
>   x86/intel_txt.c: restore boot MTRRs
>   lib/sha1.c: add file
>   x86/tpm.c: code for early hashing and extending PCRs (for TPM1.2)
>   x86/boot: choose AP stack based on APIC ID
>   x86/smpboot.c: TXT AP bringup
> 
> Michał Żygowski (2):
>   x86/hvm: Check for VMX in SMX when slaunch active
>   x86/cpu: report SMX, TXT and SKINIT capabilities
> 
> Sergii Dmytruk (10):
>   include/xen/slr_table.h: Secure Launch Resource Table definitions
>   x86/boot/slaunch_early: implement early initialization
>   x86/mtrr: expose functions for pausing caching
>   lib/sha256.c: add file
>   x86/tpm.c: support extending PCRs of TPM2.0
>   x86/tpm.c: implement event log for TPM2.0
>   arch/x86: process DRTM policy
>   x86/boot: find MBI and SLRT on AMD
>   arch/x86: support slaunch with AMD SKINIT
>   x86/slaunch: support EFI boot
> 
>  .gitignore                                  |    1 +
>  docs/hypervisor-guide/x86/how-xen-boots.rst |    7 +
>  xen/arch/x86/Makefile                       |   12 +-
>  xen/arch/x86/boot/Makefile                  |   10 +-
>  xen/arch/x86/boot/head.S                    |  250 +++++
>  xen/arch/x86/boot/slaunch_early.c           |  105 ++
>  xen/arch/x86/boot/trampoline.S              |   40 +-
>  xen/arch/x86/boot/x86_64.S                  |   42 +-
>  xen/arch/x86/cpu/amd.c                      |   14 +
>  xen/arch/x86/cpu/cpu.h                      |    1 +
>  xen/arch/x86/cpu/hygon.c                    |    1 +
>  xen/arch/x86/cpu/intel.c                    |   44 +
>  xen/arch/x86/cpu/mtrr/generic.c             |   51 +-
>  xen/arch/x86/e820.c                         |    5 +
>  xen/arch/x86/efi/efi-boot.h                 |   90 +-
>  xen/arch/x86/efi/fixmlehdr.c                |  122 +++
>  xen/arch/x86/hvm/vmx/vmcs.c                 |    3 +-
>  xen/arch/x86/include/asm/apicdef.h          |    4 +
>  xen/arch/x86/include/asm/intel_txt.h        |  452 ++++++++
>  xen/arch/x86/include/asm/mm.h               |    3 +
>  xen/arch/x86/include/asm/msr-index.h        |    3 +
>  xen/arch/x86/include/asm/mtrr.h             |    8 +
>  xen/arch/x86/include/asm/processor.h        |    1 +
>  xen/arch/x86/include/asm/slaunch.h          |   91 ++
>  xen/arch/x86/include/asm/tpm.h              |   19 +
>  xen/arch/x86/intel_txt.c                    |  177 ++++
>  xen/arch/x86/setup.c                        |   32 +-
>  xen/arch/x86/slaunch.c                      |  464 ++++++++
>  xen/arch/x86/smpboot.c                      |   57 +
>  xen/arch/x86/tboot.c                        |   20 +-
>  xen/arch/x86/tpm.c                          | 1057 +++++++++++++++++++
>  xen/common/efi/boot.c                       |    4 +
>  xen/common/efi/runtime.c                    |    1 +
>  xen/include/xen/efi.h                       |    1 +
>  xen/include/xen/sha1.h                      |   12 +
>  xen/include/xen/sha256.h                    |   12 +
>  xen/include/xen/slr_table.h                 |  274 +++++
>  xen/lib/Makefile                            |    2 +
>  xen/lib/sha1.c                              |  240 +++++
>  xen/lib/sha256.c                            |  238 +++++
>  40 files changed, 3914 insertions(+), 56 deletions(-)
>  create mode 100644 xen/arch/x86/boot/slaunch_early.c
>  create mode 100644 xen/arch/x86/efi/fixmlehdr.c
>  create mode 100644 xen/arch/x86/include/asm/intel_txt.h
>  create mode 100644 xen/arch/x86/include/asm/slaunch.h
>  create mode 100644 xen/arch/x86/include/asm/tpm.h
>  create mode 100644 xen/arch/x86/intel_txt.c
>  create mode 100644 xen/arch/x86/slaunch.c
>  create mode 100644 xen/arch/x86/tpm.c
>  create mode 100644 xen/include/xen/sha1.h
>  create mode 100644 xen/include/xen/sha256.h
>  create mode 100644 xen/include/xen/slr_table.h

Just one basic nit right here: In the names of new files you add, please
prefer dashes over underscores.

Jan

