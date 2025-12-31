Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FEDCEB870
	for <lists+xen-devel@lfdr.de>; Wed, 31 Dec 2025 09:27:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194514.1512897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1varWr-0001Ie-KK; Wed, 31 Dec 2025 08:26:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194514.1512897; Wed, 31 Dec 2025 08:26:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1varWr-0001H5-Gy; Wed, 31 Dec 2025 08:26:01 +0000
Received: by outflank-mailman (input) for mailman id 1194514;
 Wed, 31 Dec 2025 08:26:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TQtY=7F=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1varWq-0001Gz-2J
 for xen-devel@lists.xenproject.org; Wed, 31 Dec 2025 08:26:00 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5520330d-e622-11f0-b15d-2bf370ae4941;
 Wed, 31 Dec 2025 09:25:58 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-64b8123c333so15542916a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Dec 2025 00:25:58 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b9159a6d0sm37274445a12.28.2025.12.31.00.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Dec 2025 00:25:56 -0800 (PST)
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
X-Inumbo-ID: 5520330d-e622-11f0-b15d-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767169557; x=1767774357; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P/Fpjb0bF3HFDiGsBLIcCPc1rGuQa+vBiK0RSagfPnQ=;
        b=T7R5wK+86v0lAyT2ORKBSK4Yw5YMXWYg8FDR03ysfKrTFkVYg+sMD66Spcep2o5iBl
         P4Vc5B9SHJ0GYmk1k5xexWvFK1nJEJGrq1lOePobcIrsFeqm+ZJw1Il5d0sOxFXK1qsg
         htcKNHK70dv3IS+/Eo/48qjl3pMN+JTFqw0x7qXtY1IZ1jcUU1m9o1SldNKhzCvddm1/
         FJaxTx9FObvdQ+rh5W6L+7YQyqwsmsoD57PA8KDoXST1Y6kLzKbgqMKYpC7BvloB8KK5
         swJj9xj5hUC5ruNfnngrQ/R09KZIH5qb1SbCoMdF6h9tb+Ebx6lZyj8+mt1hR97LT6x1
         BNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767169557; x=1767774357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/Fpjb0bF3HFDiGsBLIcCPc1rGuQa+vBiK0RSagfPnQ=;
        b=LH71di7+mxnRXlJtJiTVpBI4DtnkfIb8Ezn5YKnxTog1k+LfBu/XvsyFPv0WizDc/v
         G5iPNRPaokfPu6gFsQOm3SkKYeG1eDG6WByd3ykc/x8MqOAU+SxSWd5NhrT/IO430o4d
         sbjGaocvta0jab6vsAsL+dL0bD1j1lJHDF84VGqfEdZe8yRsqLKGrmYCvKLqmXJvETc9
         TMkfEFkV36mj0+Tf/hm2YVpRMyLdb/SZuyB2jtEuLVmhTd8oWMGR0cF3sDEOIqSjxpdT
         Xbh5vKowoZmPdQSxDJF97jRZ8cS2cySFKQkuMHl83hS7o9KOLyah3C6XNqoJEzPtghNC
         pbYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwvdjDemxfcWvYhGt5xNIwS6S0G0biuNX9qmH/7vNtuGGlIc14bQmNCfFlPQ34CBLKx2DB+iblQMc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2rz9HpagjiN0MivHDz9QTMi9vqaKun6ggcfXTFCN464I+YJd+
	+QMTVvjA4J1+5qpVo4PFKsFlbSNLz+sxR8SAY23HQq0bPhrcoNPeN9Qh
X-Gm-Gg: AY/fxX79frkZR9Oy3csgncwIT/JMgbKcHF3ObCC6+PoGIIxIr0DGuoAFAvfIamamHK5
	mluGaFfeVdi6iLdv6jwa1dBTRLH/tjbc7XH3yA+knXWOLxVcVCWX/e/Y1g+TsYGsJm8c/rg5Hgp
	IvFVLF812r33lvsVaoS7NA+t7DhA5uHHR0cId5E/HFt0A3cGlMy8gUPcb7Yw3v4dRIfIe1N3FUE
	c7vdN666POyL+S7UwVxnVkN4bCAMnRKGdlSqltDgVuXVV0uN2+AAS7RiyBZHolQilZuYkZtMHoK
	VhevypPI3pV9NA514efwFniskCyHd3TFuyEWaZhNr3g83eDzUaAinim/ieldjnCEVYqxnjEncEa
	VdwAbssF6b8zfmuWfHNn5rHzUIf5uz9llIz+wbMPLXPYfBusrUE87N5umlhaV4fCW8UgTM17nPs
	NE1/ni/6iX7S2rLA73pTuvu8T52Ak/v6W3/JczUac7WWjgseDN1QsyzK46mtSP5B4=
X-Google-Smtp-Source: AGHT+IFnhaGWdlnnfBTlaw87D6c3dx7QoDyTdPFMdXmu6aKrKNhf834Ni0Y6DnmUTkpR/CdQSJKCWA==
X-Received: by 2002:aa7:dad6:0:b0:64b:8d7a:71cf with SMTP id 4fb4d7f45d1cf-64b8ecb2eb3mr24844238a12.26.1767169557346;
        Wed, 31 Dec 2025 00:25:57 -0800 (PST)
Message-ID: <1cbe7c3e-bfe5-4ee7-a8f7-6a76089ef4d5@gmail.com>
Date: Wed, 31 Dec 2025 09:25:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] xen/riscv: add RISC-V virtual SBI base extension
 support for guests
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1767108625.git.oleksii.kurochko@gmail.com>
 <d49e5b9555d4f04d569e20d9c9feb23b298c7ee1.1767108625.git.oleksii.kurochko@gmail.com>
 <991068a3-0e17-4cae-9653-5be170f29ab6@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <991068a3-0e17-4cae-9653-5be170f29ab6@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Teddy,

On 12/30/25 7:02 PM, Teddy Astie wrote:
> Le 30/12/2025 à 16:52, Oleksii Kurochko a écrit :
>> Add support of virtual SBI base extension calls for RISC-V guests, delegating
>> hardware-specific queries to the underlying SBI and handling version and
>> firmware ID queries directly.
>>
>> The changes include:
>> 1. Define new SBI base extension function IDs (SBI_EXT_BASE_GET_MVENDORID,
>>      SBI_EXT_BASE_GET_MARCHID, SBI_EXT_BASE_GET_MIMPID).
>> 2. Introduce XEN_SBI_VER_MAJOR, XEN_SBI_VER_MINOR for imeplenataion of
>>      SBI_EXT_BASE_GET_SPEC_VERSION.
>> 4. Introduce SBI_XEN_IMPID to implement SBI_EXT_BASE_GET_IMP_ID.
>> 5. Implement handling of SBI base extension functions, including version,
>>      firmware ID, and machine-specific queries.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v4:
>>    - Move definition of XEN_SBI_VER_{MAJOR, MINOR} to base-extension.c.
>>    - Correct string format for FID: s/#%#lx/#%lu.
>>    - Print first EID then FID (as vsbi/core.c code does).
>> ---
>> Changes in v3:
>>    - s/XEN_SBI_IMPID/SBI_XEN_IMPID
>>    - Add ASSERT(eid == SBI_EXT_BASE) in vsbi_base_ecall_handler().
>>    - Fix code style for switch/case.
>>    - Use current instead of `vcpu` argument as it was dropped from
>>      vsbi_base_ecall_handler() prototype.
>>    - Add comments for define-s XEN_SBI_VER_{MAJOR, MINOR} and SBI_XEN_IMPID.
>> ---
>> Changes in v2:
>>    - s/vsbi-base-extension.*/base-extension.*
>>    - Introduce VCPU_SBI_IMPID, XEN_SBI_VER_MINOR and XEN_SBI_VER_MAJOR.
>>    - Return VCPU_SBI_IMPID in the case of SBI_EXT_BASE_GET_IMP_ID.
>>    - Return Xen version in the case of SBI_EXT_BASE_GET_IMP_VERSION.
>>    - Use domain_crash() instead of panic() for default case.
>>    - For SBI_EXT_BASE_GET_{MVENDORID,MARCHID,MIMPID} abd SBI_EXT_BASE_PROBE_EXT
>>      add handling of a domain is h/w or not.
>> ---
>>    xen/arch/riscv/include/asm/sbi.h     |  6 ++
>>    xen/arch/riscv/vsbi/Makefile         |  1 +
>>    xen/arch/riscv/vsbi/base-extension.c | 82 ++++++++++++++++++++++++++++
>>    3 files changed, 89 insertions(+)
>>    create mode 100644 xen/arch/riscv/vsbi/base-extension.c
>>
>> diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
>> index 751bae6d6654..79f7ff5c5501 100644
>> --- a/xen/arch/riscv/include/asm/sbi.h
>> +++ b/xen/arch/riscv/include/asm/sbi.h
>> @@ -14,6 +14,9 @@
>>    
>>    #include <xen/cpumask.h>
>>    
>> +/* SBI-defined implementation ID */
>> +#define SBI_XEN_IMPID 7
>> +
>>    #define SBI_EXT_0_1_SET_TIMER               0x0
>>    #define SBI_EXT_0_1_CONSOLE_PUTCHAR         0x1
>>    #define SBI_EXT_0_1_CONSOLE_GETCHAR         0x2
>> @@ -32,6 +35,9 @@
>>    #define SBI_EXT_BASE_GET_IMP_ID         0x1
>>    #define SBI_EXT_BASE_GET_IMP_VERSION    0x2
>>    #define SBI_EXT_BASE_PROBE_EXT          0x3
>> +#define SBI_EXT_BASE_GET_MVENDORID      0x4
>> +#define SBI_EXT_BASE_GET_MARCHID        0x5
>> +#define SBI_EXT_BASE_GET_MIMPID         0x6
>>    
>>    /* SBI function IDs for RFENCE extension */
>>    #define SBI_EXT_RFENCE_REMOTE_FENCE_I           0x0
>> diff --git a/xen/arch/riscv/vsbi/Makefile b/xen/arch/riscv/vsbi/Makefile
>> index bc5755cb13d6..8ce470f787c5 100644
>> --- a/xen/arch/riscv/vsbi/Makefile
>> +++ b/xen/arch/riscv/vsbi/Makefile
>> @@ -1,2 +1,3 @@
>> +obj-y += base-extension.o
>>    obj-y += core.o
>>    obj-y += legacy-extension.o
>> diff --git a/xen/arch/riscv/vsbi/base-extension.c b/xen/arch/riscv/vsbi/base-extension.c
>> new file mode 100644
>> index 000000000000..41a95ae188dd
>> --- /dev/null
>> +++ b/xen/arch/riscv/vsbi/base-extension.c
>> @@ -0,0 +1,82 @@
>> +
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/lib.h>
>> +#include <xen/sched.h>
>> +#include <xen/version.h>
>> +
>> +#include <asm/processor.h>
>> +#include <asm/sbi.h>
>> +#include <asm/vsbi.h>
>> +
>> +/* Xen-controlled SBI version reported to guests */
>> +#define XEN_SBI_VER_MAJOR 0
>> +#define XEN_SBI_VER_MINOR 2
>> +
>> +static int vsbi_base_ecall_handler(unsigned long eid, unsigned long fid,
>> +                                   struct cpu_user_regs *regs)
>> +{
>> +    int ret = 0;
>> +    struct sbiret sbi_ret;
>> +
>> +    ASSERT(eid == SBI_EXT_BASE);
>> +
>> +    switch ( fid )
>> +    {
>> +    case SBI_EXT_BASE_GET_SPEC_VERSION:
>> +        regs->a1 = MASK_INSR(XEN_SBI_VER_MAJOR, SBI_SPEC_VERSION_MAJOR_MASK) |
>> +                   XEN_SBI_VER_MINOR;
>> +        break;
>> +
>> +    case SBI_EXT_BASE_GET_IMP_ID:
>> +        regs->a1 = SBI_XEN_IMPID;
>> +        break;
>> +
>> +    case SBI_EXT_BASE_GET_IMP_VERSION:
>> +        regs->a1 = (xen_major_version() << 16) | xen_minor_version();
>> +        break;
>> +
>> +    case SBI_EXT_BASE_GET_MVENDORID:
>> +    case SBI_EXT_BASE_GET_MARCHID:
>> +    case SBI_EXT_BASE_GET_MIMPID:
>> +        if ( is_hardware_domain(current->domain) )
>> +        {
>> +            sbi_ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
>> +            ret = sbi_ret.error;
>> +            regs->a1 = sbi_ret.value;
>> +        }
>> +        else
>> +            /*
>> +             * vSBI should present a consistent, virtualized view to guests.
>> +             * In particular, DomU-visible data must remain stable across
>> +             * migration and must not expose hardware-specific details.
>> +             *
>> +             * These register(s) must be readable in any implementation,
>> +             * but a value of 0 can be returned to indicate the field
>> +             * is not implemented.
>> +             */
>> +            regs->a1 = 0;
>> +
>> +        break;
>> +
>> +    case SBI_EXT_BASE_PROBE_EXT:
>> +        regs->a1 = vsbi_find_extension(regs->a0) ? 1 : 0;
>> +        break;
>> +
>> +    default:
>> +        /*
>> +         * TODO: domain_crash() is acceptable here while things are still under
>> +         * development.
>> +         * It shouldn't stay like this in the end though: guests should not
>> +         * be punished like this for something Xen hasn't implemented.
>> +         */
>> +        domain_crash(current->domain,
>> +                     "%s: Unsupported ecall: EID: #%#lx FID: #%lu\n",
>> +                     __func__, eid, fid);
> I think we should rather report "SBI_ERR_NOT_SUPPORTED" (-2) instead
> (eventually logging a warning in Xen) ?

The final goal is to return|SBI_ERR_NOT_SUPPORTED|.|domain_crash()| is used
only temporarily and will be kept until a usable alternative (lets say fully
supported dom0less) is available.

~ Oleksii

>
>> +        break;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +VSBI_EXT(base, SBI_EXT_BASE, SBI_EXT_BASE, vsbi_base_ecall_handler)
> Teddy
>
>
> --
> Teddy Astie | Vates XCP-ng Developer
>
> XCP-ng & Xen Orchestra - Vates solutions
>
> web: https://vates.tech
>
>
>

