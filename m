Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8448A0BE9B
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2025 18:12:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870772.1281857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXNyu-00089w-VL; Mon, 13 Jan 2025 17:12:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870772.1281857; Mon, 13 Jan 2025 17:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXNyu-00087V-RZ; Mon, 13 Jan 2025 17:12:04 +0000
Received: by outflank-mailman (input) for mailman id 870772;
 Mon, 13 Jan 2025 17:12:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q7wO=UF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tXNyt-00086e-R5
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2025 17:12:04 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 810e9e0d-d1d1-11ef-99a4-01e77a169b0f;
 Mon, 13 Jan 2025 18:12:01 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-54024ecc33dso4745852e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2025 09:12:01 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be53f8bsm1427982e87.89.2025.01.13.09.11.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2025 09:11:59 -0800 (PST)
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
X-Inumbo-ID: 810e9e0d-d1d1-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736788321; x=1737393121; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOdwM1gjfO/zMPp4QUgzspx2N1qa3y4IrMx8dc6Xikg=;
        b=DQD+NFONEEVmmE82G7ooHKpXSVM0zD7FZafA4BU+DxSYRfiQ5Ek07wMKLutRtVo152
         G0VBH5eDUyJVTF5Ak4JX9xF6UA3LhScmRTGx8fWuF91+iHcLOT39Hw7bKpSmFJjzxhjK
         0aKOwZrcwHGHNHrQRBsaUqZkK3SmtvL2LkCdVwWIBfn5Wr27WeQi6VhuKENCu8Sto/0k
         oZtP5x2YZmaqda+x2lFQcro7jxMIkPmAnjKc5Xrb3NJl4sdmO+TK5PBZxQd8F7pdD9VG
         OdYFEzuSiRdb6gM5+m85+Nmh5sNcK2r9o8OsegVvlvBKERThq2VBorKAbgNL8BAYNOnE
         6Qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736788321; x=1737393121;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qOdwM1gjfO/zMPp4QUgzspx2N1qa3y4IrMx8dc6Xikg=;
        b=gbDueT1lQW3bSrb2N2NF77Lfs/xEA/SY/6VYtOdT0Ledbq/pqfU6xOmP7LFUNdHzIO
         OtjlN/pLz/nWNEDvq+Ph8xyDaL8t7JABmEQhZCg3I4Ls+Bt0dYstorVRtnuX9SvVvVZK
         COBObWGwDT/1HnaonH766SGciLg/2Gk4umdCeK+zQlTZ/rcebOC1J7NCNSeO8ddUIeCn
         UgavrgEO+VD5chxG1AGSOL4JrnDs4WAhG6D9t8sdaBnltOK2kNBmOczMgeCs8TWimHYY
         AfSf8LvbtNXIbcgakcUjMijaCOdv/MHv1rlM/aSKX58g+1bknx1A4PHXAk+kMMC/Gs7q
         CZ8w==
X-Forwarded-Encrypted: i=1; AJvYcCUOe5MQKRlWmRAP3SuZW0VvWiUN8LhDM9gtYrqIPBmUXKRWz4d7jXj+h5yCeFaOFA7OOCgJcyrDBWA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFA5WTwbHzG8FvS0OoeA00L4K06LqouEb6RWa+QVfXcyTVzVIN
	M9ci54edEReAPpUQo93sw+mkDtXeIhwFcKio/ULeZqp1vrlfu2VQ
X-Gm-Gg: ASbGnctpbOogNz6pqjweBoUIQcOEkDHjNng3ishRKixaiNwNA36Sk1YMZZHFwRA9HJL
	W0coIpbG3Aqo9qdiSlIwxPah/3WV56oIz7jtnHA1LZgCVCQHtY8n/KC9sfEcc8aC4dUljUqREMA
	8J4aAufLmtFQA4JdbKRHjJ1rYA5GppO3K6Ah6CpYSH01oSsimQymookp/a04GwkJEZbZvqSqJyB
	MgdCXtMupRcdHrboJYwo4K7NGxGYRdkKce2ZbHLKJHdmxSkjzNTsiv9ZuLvdOQPZHcVXQ==
X-Google-Smtp-Source: AGHT+IHxd0J0j0CYWOeavgrbHmlF5leMUUdc8mUen+NRZopUladGnluD5zUPBkqJw7EKMk1J2B49tw==
X-Received: by 2002:a05:6512:2394:b0:53e:3a22:7a2e with SMTP id 2adb3069b0e04-542845d1265mr7714220e87.47.1736788320052;
        Mon, 13 Jan 2025 09:12:00 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------M8hA5d9ESfqddvD8G6y0PyIq"
Message-ID: <255b0079-4516-404c-81c1-a49e6f7bf5b4@gmail.com>
Date: Mon, 13 Jan 2025 18:11:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v1 1/1] xen/riscv: identify specific ISA
 supported by cpu
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1734957957.git.oleksii.kurochko@gmail.com>
 <ee14c485c6c6402a2d1706278b21bf3fcf821af9.1734957957.git.oleksii.kurochko@gmail.com>
 <bc636259-5586-428c-8a57-f97ba16a14b8@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <bc636259-5586-428c-8a57-f97ba16a14b8@suse.com>

This is a multi-part message in MIME format.
--------------M8hA5d9ESfqddvD8G6y0PyIq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/8/25 4:21 PM, Jan Beulich wrote:

> On 23.12.2024 13:55, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/arch/riscv/cpufeature.c
>> @@ -0,0 +1,466 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Taken for Linux kernel v6.12-rc3 and modified by
>> + * Oleksii Kurochko<oleksii.kurochko@gmail.com>:
>> + *
>> + * - Drop unconditional setting of {RISCV_ISA_EXT_ZICSR,
>> + *   RISCV_ISA_EXT_ZIFENCEI, RISCV_ISA_EXT_ZICNTR, RISCV_ISA_EXT_ZIHPM} as they
>> + *   are now part of the riscv,isa string.
>> + * - Remove saving of the ISA for each CPU, only the common available ISA is
>> + *   saved.
>> + * - Remove ACPI-related code as ACPI is not supported by Xen.
>> + * - Drop handling of elf_hwcap, since Xen does not provide hwcap to
>> + *   userspace.
>> + * - Replace of_cpu_device_node_get() API, which is not available in Xen,
>> + *   with a combination of dt_for_each_child_node(), dt_device_type_is_equal(),
>> + *   and dt_get_cpuid_from_node() to retrieve cpuid and riscv,isa in
>> + *   riscv_fill_hwcap_from_isa_string().
>> + * - Rename arguments of __RISCV_ISA_EXT_DATA() from _name to ext_name, and
>> + *   _id to ext_id for clarity.
>> + * - Replace instances of __RISCV_ISA_EXT_DATA with RISCV_ISA_EXT_DATA.
>> + * - Replace instances of __riscv_isa_extension_available with
>> + *   riscv_isa_extension_available for consistency.
>> + * - Redefine RISCV_ISA_EXT_DATA() to work only with ext_name and ext_id,
>> + *   as other fields are not used in Xen currently.
>> + * - Add check of first 4 letters of riscv,isa string to
>> + *   riscv_isa_parse_string() as Xen doesn't do this check before so it is
>> + *   necessary to check correctness of riscv,isa string. ( it should start with
>> + *   rv{32,64} with taking into account upper and lower case of "rv").
>> + * - Drop an argument of riscv_fill_hwcap() and riscv_fill_hwcap_from_isa_string()
>> + *   as it isn't used, at the moment.
>> + * - s/pr_info/printk.
>> + * - Apply Xen coding style.
> Having this in the patch description is sufficient imo.
>
>> + * Copyright (C) 2015 ARM Ltd.
>> + * Copyright (C) 2017 SiFive
>> + * Copyright (C) 2024 Vates
>> + */
>> +
>> +#include <xen/acpi.h>
> Didn't you say you dropped the ACPI pieces?

Yes, they are dropped but my intention was to add "panic("%s should be updated correspondingly to support ACPI\n", __func__)"
for the places where ACPI changes should be done in case of ACPI support will be added. And these places are detected by
checking acpi_disabled variable which is in <xen/acpi.h>.

>
>> +#include <xen/bitmap.h>
>> +#include <xen/ctype.h>
>> +#include <xen/device_tree.h>
>> +#include <xen/errno.h>
>> +#include <xen/init.h>
>> +#include <xen/lib.h>
>> +#include <xen/sections.h>
>> +
>> +#include <asm/cpufeature.h>
>> +
>> +struct riscv_isa_ext_data {
>> +    const unsigned int id;
>> +    const char *name;
>> +};
> This is odd - why would the id be const, but not the name? Thus you
> require all instances of the struct to have an initializer. The more
> conventional approach is to apply the const on the instances of the
> structure (e.g. as you already have it for riscv_isa_ext[]).

Agree, not too much sense to have const id, but not the name. Then it should be also "const char * const name".

Lets follow conventional approach and declare riscv_isa_ext_data structure as:
   struct riscv_isa_ext_data {
       unsigned int id;
       const char *name;
   };
name member of riscv_isa_ext_data structure still should be "const char *" to avoid compilation error:
   discarding of `const' qualifier from pointer target type.

An option could be to have a case in macros RISCV_ISA_EXT_DATA():
   #define RISCV_ISA_EXT_DATA(ext_name, ext_id)    \
   {                                               \
       .id = ext_id,                               \
       .name = (char *)#ext_name,                  \
   }
But IMO it is better just to declare riscv_isa_ext_data as suggested above.

>> +static int __init dt_get_cpuid_from_node(const struct dt_device_node *cpu)
>> +{
>> +    const __be32 *prop;
>> +    unsigned int reg_len;
>> +
>> +    if ( dt_n_size_cells(cpu) != 0 )
>> +        printk("cpu node `%s`: #size-cells %d\n",
>> +               dt_node_full_name(cpu), dt_n_size_cells(cpu));
>> +
>> +    prop = dt_get_property(cpu, "reg", &reg_len);
>> +    if ( !prop )
>> +    {
>> +        printk("cpu node `%s`: has no reg property\n", dt_node_full_name(cpu));
>> +        return -EINVAL;
>> +    }
>> +
>> +    if ( reg_len < dt_cells_to_size(dt_n_addr_cells(cpu)) )
>> +    {
>> +        printk("cpu node `%s`: reg property too short\n",
>> +               dt_node_full_name(cpu));
>> +        return -EINVAL;
>> +    }
>> +
>> +    return dt_read_paddr(prop, dt_n_addr_cells(cpu));
>> +}
>> +
>> +/*
>> + * The canonical order of ISA extension names in the ISA string is defined in
>> + * chapter 27 of the unprivileged specification.
>> + *
>> + * Ordinarily, for in-kernel data structures, this order is unimportant but
>> + * isa_ext_arr defines the order of the ISA string in /proc/cpuinfo.
> Inapplicable Linux detail? (If you want to keep it, you'll want to add
> "Linux'es" and avoid mentioning something that looks like a variable
> but then doesn't exist anywhere.)

Agree, no need for this Linux detail, it is not really useful in our case. I will drop it.

>> +    RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
>> +    RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
>> +    RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
>> +    RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
>> +    RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
>> +    RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
>> +    RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
>> +    RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
>> +    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
>> +    RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
>> +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>> +    RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
>> +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> Isn't it kind of implied that with the presence of Zbb, B should also be
> present?

My interpretation of the RISC-V Bitmanip Extension spec is that the 'B' extension is essentially a collection of
the Zba, Zbb, Zbs, and other extensions, but it isn't an extension by itself.
The following is mentioned in the spec:
   The bit-manipulation (bitmanip) extension collection is comprised of several component extensions to the base
   RISC-V architecture that are intended to provide some combination of code size reduction, performance
   improvement, and energy reduction. While the instructions are intended to have general use, some instructions
   are more useful in some domains than others. Hence, several smaller bitmanip extensions are provided, rather
   than one large extension. Each of these smaller extensions is grouped by common function and use case, and
   each of which has its own Zb*-extension name.

>> +    RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
>> +    RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>> +};
> Wouldn't the Z and S prefixes better be recorded in upper case here?

I decided that it is always mentioned in lower case in the spec, but it is wrong and Z and S are
used in upper case (https://github.com/riscv/riscv-isa-manual/blob/main/src/naming.adoc#subset-naming-convention ),
and also there is another one reason mentioned in an answer to another your question below. ( it was marked as [1] )

>> +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>> +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>> +};
>> +
>> +static const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
> Is this variable really useful to have?

Not really. ( at least, at the moment ) It could be dropped.

>> +    {
>> +        const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];
>> +
>> +        if ( (name_end - name == strlen(ext->name)) &&
>> +             !strncasecmp(name, ext->name, name_end - name) )
> Does this really need to be a case-insensitive comparison?

[1]:
Considering that we are discussing to use Z and S in upper case then we need to use strncasecmp()
because `name` comes from riscv, isa property of device tree and it means that letters in
the riscv,isa string must be all lowercase (https://elixir.bootlin.com/linux/v6.12.6/source/Documentation/devicetree/bindings/riscv/extensions.yaml#L34 )
so we have to avoid comparison of extension names which could start in upper case with the same extension name which starts
from lower case:
While the isa <https://elixir.bootlin.com/linux/v6.12.6/B/ident/isa> 
strings in ISA specification are case insensitive, letters in the 
riscv,isa string must be all lowercase. And so to avoid comparison of a 
name from riscv_isa_ext[] which could be theoretically starts from upper 
case we have to use strncasecmp() to transform everything to lower case 
before comparison. And it seems it is better to be on a safe side for 
the cases when some accidentally will use upper case or in 
riscv_isa_ext[] or in riscv,isa property of device-tree.

>> +            break;
>> +        }
>> +    }
>> +}
>> +
>> +static int __init riscv_isa_parse_string(const char *isa, unsigned long *out_bitmap)
>> +{
>> +    if ( isa[0] != 'r' && isa[0] != 'R' )
>> +        return -EINVAL;
>> +
>> +    if ( isa[1] != 'v' && isa[1] != 'V' )
>> +        return -EINVAL;
>> +
>> +    if ( isa[2] != '3' && isa[3] != '2' &&
>> +         isa[2] != '6' && isa[3] != '4' )
>> +        return -EINVAL;
> Any reason to accept the (respectively, depending on configuration) wrong
> bitness? Or to accept e.g. RV34?

Good question. I think there is no any reason to accept the wrong bitness and
it is a bug. I'll re-write the last if-condition.

>
>> +    isa += 4;
>> +
>> +    while ( *isa )
>> +    {
>> +        const char *ext = isa++;
>> +        const char *ext_end = isa;
>> +        bool ext_err = false;
>> +
>> +        switch ( *ext )
>> +        {
>> +        case 'x':
>> +        case 'X':
>> +            if ( acpi_disabled )
>> +                printk_once("Vendor extensions are ignored in riscv,isa."
>> +                            "Use riscv,isa-extensions instead\n");
> How's this connected to ACPI? The more that you said there's nothing
> ACPI-ish left.

The same as above just left that for the case if one day someone will add ACPI support.
( but, at the moment, we could drop it or I will update the comment when I wrote about
dropping of ACPI-connected things to something like: "ACPI is almost fully drop and leave
only places where a code should be updated to have ACPI support".

>> +            /*
>> +             * Workaround for invalid single-letter 's' & 'u' (QEMU).
>> +             * No need to set the bit in riscv_isa as 's' & 'u' are
>> +             * not valid ISA extensions. It works unless the first
>> +             * multi-letter extension in the ISA string begins with
>> +             * "Su" and is not prefixed with an underscore.
>> +             */
>> +            if ( ext[-1] != '_' && ext[1] == 'u' )
>> +            {
>> +                ++isa;
>> +                ext_err = true;
>> +                break;
>> +            }
> I'm afraid I don't understand this; the comment raises more questions
> than it answers.

Some details could be found here about these QEMU workaround from LK view:
https://lore.kernel.org/linux-riscv/ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com/#t

This leads to the following fix in QEMU:
https://patchwork.kernel.org/project/qemu-devel/patch/dee09d708405075420b29115c1e9e87910b8da55.1648270894.git.research_trasio@irq.a4lg.com/#24792587

Considering QEMU's patch, these workaround isn't needed anymore since QEMU 7.1 ( it has been released30 Aug 2022 ) probably we could update the
QEMU version on our CI and just drop these changes.
Or, at least, update the comment with the links mentioned above and add a message that these changes are needed only for QEMU < 7.1.
Am I right that we don't have something like GCC_VERSION in Xen but for QEMU?

>> +        if ( !dt_device_type_is_equal(cpu, "cpu") )
>> +            continue;
>> +
>> +        cpuid = dt_get_cpuid_from_node(cpu);
>> +        if ( cpuid < 0 )
>> +            continue;
>> +
>> +        if ( cpuid >= NR_CPUS )
>> +        {
>> +            printk_once("%s: dts has more cpu than NR_CPUs\n", __func__);
>> +            continue;
>> +        }
>> +
>> +        if ( dt_property_read_string(cpu, "riscv,isa-extensions", &isa) )
>> +        {
>> +            printk("Unable to find \"riscv,isa-extensions\" devicetree entry "
>> +                   "for cpu%d\n", cpuid);
>> +            continue;
>> +        }
>> +        else
>> +            printk("riscv,isa-extensions isnt supported\n");
> IOW no matter what, a message will be logged. Odd.

I think it should be panic but I confused it with printk...

>
> Also: Preferably no "else" after an if() ending in "continue".

If I understand you correctly, we really can drop here "else" and just
panic("riscv,isa-extensions isnt supported\n"), and it would be enough.

>> +        DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
>> +
>> +        if ( !dt_device_type_is_equal(cpu, "cpu") )
>> +            continue;
>> +
>> +        cpuid = dt_get_cpuid_from_node(cpu);
>> +        if ( cpuid < 0 )
>> +            continue;
>> +
>> +        if ( cpuid >= NR_CPUS )
>> +        {
>> +            printk_once("%s: dts has more cpu than NR_CPUs\n", __func__);
> What's "dts"? Did the 's' mean to be in "cpus" instead? Also NR_CPUS
> to avoid confusion.

DTS here means Device Tree Source. It would be more clear to write in the following way:
"CPU id is higher then maximum number of CPUs in Xen."
But I am not sure that his check is correct as it is not clearly defined that CPU ids are
from the range from 0 to NR_CPUS. The following is mentioned in the spec:
   Hart IDs might not necessarily be numbered contiguously in a multiprocessor system,
   but at least one hart must have a hart ID of zero. Hart IDs must be unique within the
   execution environment.
All that it guarantees it is that one of them should be zero and IDs are unique.

I think it would be better just to drop this check.

>> +            panic("there is no support for ACPI\n");
>> +
>> +        riscv_isa_parse_string(isa, this_isa);
>> +
>> +        if ( bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX) )
>> +            bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
>> +        else
>> +            bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
> What if the first instance had no extensions at all? You'll then copy what
> the second instance say, ending up with extensions not supported by one of
> the CPUs.

I think that it's impossible that there is no extensions at all and it should be
considered as a bug of provided riscv,isa property. Thereby it should be enough to
add BUG_ON(!bitmap_empty(this_isa, RISCV_ISA_EXT_MAX)) before if-condition.

>> --- /dev/null
>> +++ b/xen/arch/riscv/include/asm/cpufeature.h
>> @@ -0,0 +1,63 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef ASM__RISCV__CPUFEATURE_H
>> +#define ASM__RISCV__CPUFEATURE_H
>> +
>> +#ifndef __ASSEMBLY__
>> +
>> +#define RISCV_ISA_EXT_a     ('a' - 'a')
>> +#define RISCV_ISA_EXT_c     ('c' - 'a')
>> +#define RISCV_ISA_EXT_d     ('d' - 'a')
>> +#define RISCV_ISA_EXT_f     ('f' - 'a')
>> +#define RISCV_ISA_EXT_h     ('h' - 'a')
>> +#define RISCV_ISA_EXT_i     ('i' - 'a')
>> +#define RISCV_ISA_EXT_m     ('m' - 'a')
>> +#define RISCV_ISA_EXT_q     ('q' - 'a')
>> +#define RISCV_ISA_EXT_v     ('v' - 'a')
>> +
>> +/*
>> + * Increse this to higher value as kernel support more ISA extensions.
>> + */
>> +#define RISCV_ISA_EXT_MAX   128
> What's this about? Why can't the last element of the enum below go without
> this, thus not needing manual bumping here?

RISCV_ISA_EXT_ID_MAX could be used instead of RISCV_ISA_EXT_MAX. RISCV_ISA_EXT_MAX it
is rudiment from Linux kernel which initially I decided to leave to have more close to
Linux kernel code.

>
>> +#define RISCV_ISA_EXT_SxAIA     RISCV_ISA_EXT_SSAIA
> Why does this expand to RISCV_ISA_EXT_SSAIA and not RISCV_ISA_EXT_SMAIA?
> (Easiest way to address: remove the #define, as it's unused. Yet if it
> is to be kept, the question needs addressing, perhaps by way of a code
> comment.)

I agree that it is better just to drop and I will do in that way.
Initial idea was close to Linux kernel. As Linux kernel could run in M mode
then these define should be *_EXT_SMAIA and if it is run in S mode then *_EXT_SSAIA:
#ifdef CONFIG_RISCV_M_MODE 
<https://elixir.bootlin.com/linux/v6.12.6/K/ident/CONFIG_RISCV_M_MODE> 
#define RISCV_ISA_EXT_SxAIA 
<https://elixir.bootlin.com/linux/v6.12.6/C/ident/RISCV_ISA_EXT_SxAIA> 
RISCV_ISA_EXT_SMAIA 
<https://elixir.bootlin.com/linux/v6.12.6/C/ident/RISCV_ISA_EXT_SMAIA> 
#else #define RISCV_ISA_EXT_SxAIA 
<https://elixir.bootlin.com/linux/v6.12.6/C/ident/RISCV_ISA_EXT_SxAIA> 
RISCV_ISA_EXT_SSAIA 
<https://elixir.bootlin.com/linux/v6.12.6/C/ident/RISCV_ISA_EXT_SSAIA> 
#endif And I thought to something similar with hypervisor ( before 
decided that hypervisor mode is mandatory ).

>
>> +/*
>> + * These macros represent the logical IDs of each multi-letter RISC-V ISA
>> + * extension and are used in the ISA bitmap. The logical IDs start from
>> + * RISCV_ISA_EXT_BASE, which allows the 0-25 range to be reserved for single
>> + * letter extensions. The maximum, RISCV_ISA_EXT_MAX, is defined in order
>> + * to allocate the bitmap and may be increased when necessary.
>> + *
>> + * New extensions should just be added to the bottom, rather than added
>> + * alphabetically, in order to avoid unnecessary shuffling.
>> + */
>> +#define RISCV_ISA_EXT_BASE  26
> The comment living above this #define, it also wants wording to match
> this. Specifically the text starts with describing ...
>
>> +enum riscv_isa_ext_id {
> ... this enum instead (which doesn't consist of any macros).
>
>> +    RISCV_ISA_EXT_ZICNTR = RISCV_ISA_EXT_BASE,
>> +    RISCV_ISA_EXT_ZICSR,
>> +    RISCV_ISA_EXT_ZIFENCEI,
>> +    RISCV_ISA_EXT_ZIHINTPAUSE,
>> +    RISCV_ISA_EXT_ZIHPM,
>> +    RISCV_ISA_EXT_ZBB,
>> +    RISCV_ISA_EXT_SMAIA,
>> +    RISCV_ISA_EXT_SSAIA,
>> +    RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
>> +};
> Why can't the single-letter RISCV_ISA_EXT_? be part of this enum as well?

Good point. It could and would be better. Thereby I will refactor that.


>
>> +void riscv_fill_hwcap(void);
>> +
>> +bool riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit);
> A signed bit position? Can negative values be passed in? Actually - can't
> this be enum riscv_isa_ext_id anyway?

No, negative values can't be passed. Extension IDs are always positive.
If we will move everything ( single-letter extensions too ) to enum
riscv_isa_ext_id then we can use enum riscv_isa_ext_id
instead of int here. I think that it would be really better so I will refactor that
accordingly.

Thanks for review!

~ Oleksii

--------------M8hA5d9ESfqddvD8G6y0PyIq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre class="moz-cite-prefix">On 1/8/25 4:21 PM, Jan Beulich wrote:
</pre>
    <blockquote type="cite"
      cite="mid:bc636259-5586-428c-8a57-f97ba16a14b8@suse.com">
      <pre wrap="" class="moz-quote-pre">On 23.12.2024 13:55, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/cpufeature.c
@@ -0,0 +1,466 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Taken for Linux kernel v6.12-rc3 and modified by
+ * Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>:
+ *
+ * - Drop unconditional setting of {RISCV_ISA_EXT_ZICSR,
+ *   RISCV_ISA_EXT_ZIFENCEI, RISCV_ISA_EXT_ZICNTR, RISCV_ISA_EXT_ZIHPM} as they
+ *   are now part of the riscv,isa string.
+ * - Remove saving of the ISA for each CPU, only the common available ISA is
+ *   saved.
+ * - Remove ACPI-related code as ACPI is not supported by Xen.
+ * - Drop handling of elf_hwcap, since Xen does not provide hwcap to
+ *   userspace.
+ * - Replace of_cpu_device_node_get() API, which is not available in Xen,
+ *   with a combination of dt_for_each_child_node(), dt_device_type_is_equal(),
+ *   and dt_get_cpuid_from_node() to retrieve cpuid and riscv,isa in
+ *   riscv_fill_hwcap_from_isa_string().
+ * - Rename arguments of __RISCV_ISA_EXT_DATA() from _name to ext_name, and
+ *   _id to ext_id for clarity.
+ * - Replace instances of __RISCV_ISA_EXT_DATA with RISCV_ISA_EXT_DATA.
+ * - Replace instances of __riscv_isa_extension_available with
+ *   riscv_isa_extension_available for consistency.
+ * - Redefine RISCV_ISA_EXT_DATA() to work only with ext_name and ext_id,
+ *   as other fields are not used in Xen currently.
+ * - Add check of first 4 letters of riscv,isa string to
+ *   riscv_isa_parse_string() as Xen doesn't do this check before so it is
+ *   necessary to check correctness of riscv,isa string. ( it should start with
+ *   rv{32,64} with taking into account upper and lower case of "rv").
+ * - Drop an argument of riscv_fill_hwcap() and riscv_fill_hwcap_from_isa_string()
+ *   as it isn't used, at the moment.
+ * - s/pr_info/printk.
+ * - Apply Xen coding style.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Having this in the patch description is sufficient imo.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * Copyright (C) 2015 ARM Ltd.
+ * Copyright (C) 2017 SiFive
+ * Copyright (C) 2024 Vates
+ */
+
+#include &lt;xen/acpi.h&gt;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Didn't you say you dropped the ACPI pieces?</pre>
    </blockquote>
    <pre>Yes, they are dropped but my intention was to add "panic("%s should be updated correspondingly to support ACPI\n", __func__)"
for the places where ACPI changes should be done in case of ACPI support will be added. And these places are detected by
checking acpi_disabled variable which is in &lt;xen/acpi.h&gt;.

</pre>
    <blockquote type="cite"
      cite="mid:bc636259-5586-428c-8a57-f97ba16a14b8@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#include &lt;xen/bitmap.h&gt;
+#include &lt;xen/ctype.h&gt;
+#include &lt;xen/device_tree.h&gt;
+#include &lt;xen/errno.h&gt;
+#include &lt;xen/init.h&gt;
+#include &lt;xen/lib.h&gt;
+#include &lt;xen/sections.h&gt;
+
+#include &lt;asm/cpufeature.h&gt;
+
+struct riscv_isa_ext_data {
+    const unsigned int id;
+    const char *name;
+};
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This is odd - why would the id be const, but not the name? Thus you
require all instances of the struct to have an initializer. The more
conventional approach is to apply the const on the instances of the
structure (e.g. as you already have it for riscv_isa_ext[]). </pre>
    </blockquote>
    <pre>Agree, not too much sense to have const id, but not the name. Then it should be also "const char * const name".

Lets follow conventional approach and declare riscv_isa_ext_data structure as:
  struct riscv_isa_ext_data {
      unsigned int id;
      const char *name;
  };
name member of riscv_isa_ext_data structure still should be "const char *" to avoid compilation error:
  discarding of `const' qualifier from pointer target type.

An option could be to have a case in macros RISCV_ISA_EXT_DATA():
  #define RISCV_ISA_EXT_DATA(ext_name, ext_id)    \
  {                                               \
      .id = ext_id,                               \
      .name = (char *)#ext_name,                  \
  }
But IMO it is better just to declare riscv_isa_ext_data as suggested above.

</pre>
    <blockquote type="cite"
      cite="mid:bc636259-5586-428c-8a57-f97ba16a14b8@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static int __init dt_get_cpuid_from_node(const struct dt_device_node *cpu)
+{
+    const __be32 *prop;
+    unsigned int reg_len;
+
+    if ( dt_n_size_cells(cpu) != 0 )
+        printk("cpu node `%s`: #size-cells %d\n",
+               dt_node_full_name(cpu), dt_n_size_cells(cpu));
+
+    prop = dt_get_property(cpu, "reg", &amp;reg_len);
+    if ( !prop )
+    {
+        printk("cpu node `%s`: has no reg property\n", dt_node_full_name(cpu));
+        return -EINVAL;
+    }
+
+    if ( reg_len &lt; dt_cells_to_size(dt_n_addr_cells(cpu)) )
+    {
+        printk("cpu node `%s`: reg property too short\n",
+               dt_node_full_name(cpu));
+        return -EINVAL;
+    }
+
+    return dt_read_paddr(prop, dt_n_addr_cells(cpu));
+}
+
+/*
+ * The canonical order of ISA extension names in the ISA string is defined in
+ * chapter 27 of the unprivileged specification.
+ *
+ * Ordinarily, for in-kernel data structures, this order is unimportant but
+ * isa_ext_arr defines the order of the ISA string in /proc/cpuinfo.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Inapplicable Linux detail? (If you want to keep it, you'll want to add
"Linux'es" and avoid mentioning something that looks like a variable
but then doesn't exist anywhere.)</pre>
    </blockquote>
    <pre>Agree, no need for this Linux detail, it is not really useful in our case. I will drop it.

</pre>
    <blockquote type="cite"
      cite="mid:bc636259-5586-428c-8a57-f97ba16a14b8@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
+    RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
+    RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
+    RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
+    RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
+    RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
+    RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
+    RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
+    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
+    RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
+    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
+    RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
+    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Isn't it kind of implied that with the presence of Zbb, B should also be
present?
</pre>
    </blockquote>
    <pre>My interpretation of the RISC-V Bitmanip Extension spec is that the 'B' extension is essentially a collection of
the Zba, Zbb, Zbs, and other extensions, but it isn't an extension by itself.
The following is mentioned in the spec:
  The bit-manipulation (bitmanip) extension collection is comprised of several component extensions to the base
  RISC-V architecture that are intended to provide some combination of code size reduction, performance
  improvement, and energy reduction. While the instructions are intended to have general use, some instructions
  are more useful in some domains than others. Hence, several smaller bitmanip extensions are provided, rather
  than one large extension. Each of these smaller extensions is grouped by common function and use case, and
  each of which has its own Zb*-extension name.</pre>
    <blockquote type="cite"
      cite="mid:bc636259-5586-428c-8a57-f97ba16a14b8@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+    RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
+};
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Wouldn't the Z and S prefixes better be recorded in upper case here?</pre>
    </blockquote>
    <pre>I decided that it is always mentioned in lower case in the spec, but it is wrong and Z and S are
used in upper case ( <a class="moz-txt-link-freetext" href="https://github.com/riscv/riscv-isa-manual/blob/main/src/naming.adoc#subset-naming-convention">https://github.com/riscv/riscv-isa-manual/blob/main/src/naming.adoc#subset-naming-convention</a> ),
and also there is another one reason mentioned in an answer to another your question below. ( it was marked as [1] )

</pre>
    <blockquote type="cite"
      cite="mid:bc636259-5586-428c-8a57-f97ba16a14b8@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
+    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
+};
+
+static const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Is this variable really useful to have?</pre>
    </blockquote>
    <pre>Not really. ( at least, at the moment ) It could be dropped.

</pre>
    <blockquote type="cite"
      cite="mid:bc636259-5586-428c-8a57-f97ba16a14b8@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    {
+        const struct riscv_isa_ext_data *ext = &amp;riscv_isa_ext[i];
+
+        if ( (name_end - name == strlen(ext-&gt;name)) &amp;&amp;
+             !strncasecmp(name, ext-&gt;name, name_end - name) )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Does this really need to be a case-insensitive comparison?
</pre>
    </blockquote>
    <pre>[1]:
Considering that we are discussing to use Z and S in upper case then we need to use strncasecmp()
because `name` comes from riscv, isa property of device tree and it means that letters in
the riscv,isa string must be all lowercase ( <a class="moz-txt-link-freetext" href="https://elixir.bootlin.com/linux/v6.12.6/source/Documentation/devicetree/bindings/riscv/extensions.yaml#L34">https://elixir.bootlin.com/linux/v6.12.6/source/Documentation/devicetree/bindings/riscv/extensions.yaml#L34</a> )
so we have to avoid comparison of extension names which could start in upper case with the same extension name which starts
from lower case:
<span id="codeline-47" class="line-highlight"
style="box-sizing: inherit; background: rgb(248, 237, 195); vertical-align: top; display: block; padding-left: 1em; width: 861.15px; height: 17.275px;"><span
    class="w"
style="box-sizing: inherit; vertical-align: top; color: rgb(187, 187, 187);">      </span><span
    class="l l-Scalar l-Scalar-Plain"
    style="box-sizing: inherit; vertical-align: top;">While the <a
    class="ident"
    href="https://elixir.bootlin.com/linux/v6.12.6/B/ident/isa"
style="box-sizing: inherit; background: linear-gradient(rgba(0, 0, 0, 0) 10%, rgb(244, 246, 255) 10%, rgb(244, 246, 255) 90%, rgba(0, 0, 0, 0) 90%); color: inherit; text-decoration: none; vertical-align: top; font-weight: 700; border-radius: 0.2em;">isa</a> strings in ISA specification are case</span>
</span><span id="codeline-48"
style="box-sizing: inherit; vertical-align: top; display: block; padding-left: 1em;"><span
    class="w"
style="box-sizing: inherit; vertical-align: top; color: rgb(187, 187, 187);">      </span><span
    class="l l-Scalar l-Scalar-Plain"
    style="box-sizing: inherit; vertical-align: top;">insensitive, letters in the riscv,isa string must be all</span>
</span><span id="codeline-49"
style="box-sizing: inherit; vertical-align: top; display: block; padding-left: 1em;"><span
    class="w"
style="box-sizing: inherit; vertical-align: top; color: rgb(187, 187, 187);">      </span><span
    class="l l-Scalar l-Scalar-Plain"
    style="box-sizing: inherit; vertical-align: top;">lowercase.

And so to avoid comparison of a name from riscv_isa_ext[] which could be theoretically starts from upper case
we have to use strncasecmp() to transform everything to lower case before comparison. And it seems it is better
to be on a safe side for the cases when some accidentally will use upper case or in riscv_isa_ext[] or in riscv,isa property
of device-tree.
</span>
</span></pre>
    <blockquote type="cite"
      cite="mid:bc636259-5586-428c-8a57-f97ba16a14b8@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+            break;
+        }
+    }
+}
+
+static int __init riscv_isa_parse_string(const char *isa, unsigned long *out_bitmap)
+{
+    if ( isa[0] != 'r' &amp;&amp; isa[0] != 'R' )
+        return -EINVAL;
+
+    if ( isa[1] != 'v' &amp;&amp; isa[1] != 'V' )
+        return -EINVAL;
+
+    if ( isa[2] != '3' &amp;&amp; isa[3] != '2' &amp;&amp;
+         isa[2] != '6' &amp;&amp; isa[3] != '4' )
+        return -EINVAL;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Any reason to accept the (respectively, depending on configuration) wrong
bitness? Or to accept e.g. RV34?</pre>
    </blockquote>
    <pre>Good question. I think there is no any reason to accept the wrong bitness and
it is a bug. I'll re-write the last if-condition.

</pre>
    <blockquote type="cite"
      cite="mid:bc636259-5586-428c-8a57-f97ba16a14b8@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    isa += 4;
+
+    while ( *isa )
+    {
+        const char *ext = isa++;
+        const char *ext_end = isa;
+        bool ext_err = false;
+
+        switch ( *ext )
+        {
+        case 'x':
+        case 'X':
+            if ( acpi_disabled )
+                printk_once("Vendor extensions are ignored in riscv,isa."
+                            "Use riscv,isa-extensions instead\n");
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
How's this connected to ACPI? The more that you said there's nothing
ACPI-ish left.</pre>
    </blockquote>
    <pre>The same as above just left that for the case if one day someone will add ACPI support.
( but, at the moment, we could drop it or I will update the comment when I wrote about
dropping of ACPI-connected things to something like: "ACPI is almost fully drop and leave
only places where a code should be updated to have ACPI support".</pre>
    <blockquote type="cite"
      cite="mid:bc636259-5586-428c-8a57-f97ba16a14b8@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+            /*
+             * Workaround for invalid single-letter 's' &amp; 'u' (QEMU).
+             * No need to set the bit in riscv_isa as 's' &amp; 'u' are
+             * not valid ISA extensions. It works unless the first
+             * multi-letter extension in the ISA string begins with
+             * "Su" and is not prefixed with an underscore.
+             */
+            if ( ext[-1] != '_' &amp;&amp; ext[1] == 'u' )
+            {
+                ++isa;
+                ext_err = true;
+                break;
+            }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'm afraid I don't understand this; the comment raises more questions
than it answers.</pre>
    </blockquote>
    <pre>Some details could be found here about these QEMU workaround from LK view:
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/linux-riscv/ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com/#t">https://lore.kernel.org/linux-riscv/ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com/#t</a>

This leads to the following fix in QEMU:
<a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/project/qemu-devel/patch/dee09d708405075420b29115c1e9e87910b8da55.1648270894.git.research_trasio@irq.a4lg.com/#24792587">https://patchwork.kernel.org/project/qemu-devel/patch/dee09d708405075420b29115c1e9e87910b8da55.1648270894.git.research_trasio@irq.a4lg.com/#24792587</a>

Considering QEMU's patch, these workaround isn't needed anymore since QEMU 7.1 ( it has been released <span
style="font-family: Roboto, sans-serif; font-size: 11.7333px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 300; letter-spacing: 1px; text-align: start; text-indent: 0px; text-transform: uppercase; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">30 Aug 2022</span> ) probably we could update the
QEMU version on our CI and just drop these changes.
Or, at least, update the comment with the links mentioned above and add a message that these changes are needed only for QEMU &lt; 7.1.
Am I right that we don't have something like GCC_VERSION in Xen but for QEMU?
</pre>
    <blockquote type="cite"
      cite="mid:bc636259-5586-428c-8a57-f97ba16a14b8@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        if ( !dt_device_type_is_equal(cpu, "cpu") )
+            continue;
+
+        cpuid = dt_get_cpuid_from_node(cpu);
+        if ( cpuid &lt; 0 )
+            continue;
+
+        if ( cpuid &gt;= NR_CPUS )
+        {
+            printk_once("%s: dts has more cpu than NR_CPUs\n", __func__);
+            continue;
+        }
+
+        if ( dt_property_read_string(cpu, "riscv,isa-extensions", &amp;isa) )
+        {
+            printk("Unable to find \"riscv,isa-extensions\" devicetree entry "
+                   "for cpu%d\n", cpuid);
+            continue;
+        }
+        else
+            printk("riscv,isa-extensions isnt supported\n");
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
IOW no matter what, a message will be logged. Odd.</pre>
    </blockquote>
    <pre>I think it should be panic but I confused it with printk...

</pre>
    <blockquote type="cite"
      cite="mid:bc636259-5586-428c-8a57-f97ba16a14b8@suse.com">
      <pre wrap="" class="moz-quote-pre">

Also: Preferably no "else" after an if() ending in "continue".</pre>
    </blockquote>
    <pre>If I understand you correctly, we really can drop here "else" and just
panic("riscv,isa-extensions isnt supported\n"), and it would be enough.</pre>
    <blockquote type="cite"
      cite="mid:bc636259-5586-428c-8a57-f97ba16a14b8@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
+
+        if ( !dt_device_type_is_equal(cpu, "cpu") )
+            continue;
+
+        cpuid = dt_get_cpuid_from_node(cpu);
+        if ( cpuid &lt; 0 )
+            continue;
+
+        if ( cpuid &gt;= NR_CPUS )
+        {
+            printk_once("%s: dts has more cpu than NR_CPUs\n", __func__);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What's "dts"? Did the 's' mean to be in "cpus" instead? Also NR_CPUS
to avoid confusion.</pre>
    </blockquote>
    <pre>DTS here means Device Tree Source. It would be more clear to write in the following way:
"CPU id is higher then maximum number of CPUs in Xen."
But I am not sure that his check is correct as it is not clearly defined that CPU ids are
from the range from 0 to NR_CPUS. The following is mentioned in the spec:
  Hart IDs might not necessarily be numbered contiguously in a multiprocessor system,
  but at least one hart must have a hart ID of zero. Hart IDs must be unique within the
  execution environment.
All that it guarantees it is that one of them should be zero and IDs are unique.

I think it would be better just to drop this check.
</pre>
    <pre>
</pre>
    <blockquote type="cite"
      cite="mid:bc636259-5586-428c-8a57-f97ba16a14b8@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+            panic("there is no support for ACPI\n");
+
+        riscv_isa_parse_string(isa, this_isa);
+
+        if ( bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX) )
+            bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
+        else
+            bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What if the first instance had no extensions at all? You'll then copy what
the second instance say, ending up with extensions not supported by one of
the CPUs. 
</pre>
    </blockquote>
    <pre>I think that it's impossible that there is no extensions at all and it should be 
considered as a bug of provided riscv,isa property. Thereby it should be enough to
add BUG_ON(!bitmap_empty(this_isa, RISCV_ISA_EXT_MAX)) before if-condition.
</pre>
    <blockquote type="cite"
      cite="mid:bc636259-5586-428c-8a57-f97ba16a14b8@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef ASM__RISCV__CPUFEATURE_H
+#define ASM__RISCV__CPUFEATURE_H
+
+#ifndef __ASSEMBLY__
+
+#define RISCV_ISA_EXT_a     ('a' - 'a')
+#define RISCV_ISA_EXT_c     ('c' - 'a')
+#define RISCV_ISA_EXT_d     ('d' - 'a')
+#define RISCV_ISA_EXT_f     ('f' - 'a')
+#define RISCV_ISA_EXT_h     ('h' - 'a')
+#define RISCV_ISA_EXT_i     ('i' - 'a')
+#define RISCV_ISA_EXT_m     ('m' - 'a')
+#define RISCV_ISA_EXT_q     ('q' - 'a')
+#define RISCV_ISA_EXT_v     ('v' - 'a')
+
+/*
+ * Increse this to higher value as kernel support more ISA extensions.
+ */
+#define RISCV_ISA_EXT_MAX   128
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What's this about? Why can't the last element of the enum below go without
this, thus not needing manual bumping here?</pre>
    </blockquote>
    <pre>RISCV_ISA_EXT_ID_MAX could be used instead of RISCV_ISA_EXT_MAX. RISCV_ISA_EXT_MAX it
is rudiment from Linux kernel which initially I decided to leave to have more close to
Linux kernel code.

</pre>
    <blockquote type="cite"
      cite="mid:bc636259-5586-428c-8a57-f97ba16a14b8@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#define RISCV_ISA_EXT_SxAIA     RISCV_ISA_EXT_SSAIA
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why does this expand to RISCV_ISA_EXT_SSAIA and not RISCV_ISA_EXT_SMAIA?
(Easiest way to address: remove the #define, as it's unused. Yet if it
is to be kept, the question needs addressing, perhaps by way of a code
comment.)</pre>
    </blockquote>
    <pre>I agree that it is better just to drop and I will do in that way.
Initial idea was close to Linux kernel. As Linux kernel could run in M mode
then these define should be *_EXT_SMAIA and if it is run in S mode then *_EXT_SSAIA:
<span id="codeline-102"
style="box-sizing: inherit; vertical-align: top; display: block; padding-left: 1em;"><span
    class="cp"
style="box-sizing: inherit; vertical-align: top; color: rgb(85, 119, 153);">#ifdef <a
    class="ident"
href="https://elixir.bootlin.com/linux/v6.12.6/K/ident/CONFIG_RISCV_M_MODE"
style="box-sizing: inherit; background: linear-gradient(rgba(0, 0, 0, 0) 10%, rgb(244, 246, 255) 10%, rgb(244, 246, 255) 90%, rgba(0, 0, 0, 0) 90%); color: inherit; text-decoration: none; vertical-align: top; font-weight: 700; border-radius: 0.2em;">CONFIG_RISCV_M_MODE</a></span>
</span><span id="codeline-103" class="line-highlight"
style="box-sizing: inherit; background: rgb(248, 237, 195); vertical-align: top; display: block; padding-left: 1em; width: 671.037px; height: 17.275px;"><span
    class="cp"
style="box-sizing: inherit; vertical-align: top; color: rgb(85, 119, 153);">#define <a
    class="ident"
href="https://elixir.bootlin.com/linux/v6.12.6/C/ident/RISCV_ISA_EXT_SxAIA"
style="box-sizing: inherit; background: linear-gradient(rgba(0, 0, 0, 0) 10%, rgb(244, 246, 255) 10%, rgb(244, 246, 255) 90%, rgba(0, 0, 0, 0) 90%); color: inherit; text-decoration: none; vertical-align: top; font-weight: 700; border-radius: 0.2em;">RISCV_ISA_EXT_SxAIA</a>		<a
    class="ident"
href="https://elixir.bootlin.com/linux/v6.12.6/C/ident/RISCV_ISA_EXT_SMAIA"
style="box-sizing: inherit; background: linear-gradient(rgba(0, 0, 0, 0) 10%, rgb(244, 246, 255) 10%, rgb(244, 246, 255) 90%, rgba(0, 0, 0, 0) 90%); color: inherit; text-decoration: none; vertical-align: top; font-weight: 700; border-radius: 0.2em;">RISCV_ISA_EXT_SMAIA</a></span>
</span><span id="codeline-104"
style="box-sizing: inherit; vertical-align: top; display: block; padding-left: 1em;"><span
    class="cp"
style="box-sizing: inherit; vertical-align: top; color: rgb(85, 119, 153);">#else</span>
</span><span id="codeline-105"
style="box-sizing: inherit; vertical-align: top; display: block; padding-left: 1em;"><span
    class="cp"
style="box-sizing: inherit; vertical-align: top; color: rgb(85, 119, 153);">#define <a
    class="ident"
href="https://elixir.bootlin.com/linux/v6.12.6/C/ident/RISCV_ISA_EXT_SxAIA"
style="box-sizing: inherit; background: linear-gradient(rgba(0, 0, 0, 0) 10%, rgb(244, 246, 255) 10%, rgb(244, 246, 255) 90%, rgba(0, 0, 0, 0) 90%); color: inherit; text-decoration: none; vertical-align: top; font-weight: 700; border-radius: 0.2em;">RISCV_ISA_EXT_SxAIA</a>		<a
    class="ident"
href="https://elixir.bootlin.com/linux/v6.12.6/C/ident/RISCV_ISA_EXT_SSAIA"
style="box-sizing: inherit; background: linear-gradient(rgba(0, 0, 0, 0) 10%, rgb(244, 246, 255) 10%, rgb(244, 246, 255) 90%, rgba(0, 0, 0, 0) 90%); color: inherit; text-decoration: none; vertical-align: top; font-weight: 700; border-radius: 0.2em;">RISCV_ISA_EXT_SSAIA</a></span>
</span><span id="codeline-106"
style="box-sizing: inherit; vertical-align: top; display: block; padding-left: 1em;"><span
    class="cp"
style="box-sizing: inherit; vertical-align: top; color: rgb(85, 119, 153);">#endif

</span><span class="cp"
    style="box-sizing: inherit; vertical-align: top;">And I thought to something similar with hypervisor ( before decided that hypervisor mode is mandatory ).
</span></span></pre>
    <blockquote type="cite"
      cite="mid:bc636259-5586-428c-8a57-f97ba16a14b8@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/*
+ * These macros represent the logical IDs of each multi-letter RISC-V ISA
+ * extension and are used in the ISA bitmap. The logical IDs start from
+ * RISCV_ISA_EXT_BASE, which allows the 0-25 range to be reserved for single
+ * letter extensions. The maximum, RISCV_ISA_EXT_MAX, is defined in order
+ * to allocate the bitmap and may be increased when necessary.
+ *
+ * New extensions should just be added to the bottom, rather than added
+ * alphabetically, in order to avoid unnecessary shuffling.
+ */
+#define RISCV_ISA_EXT_BASE  26
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The comment living above this #define, it also wants wording to match
this. Specifically the text starts with describing ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+enum riscv_isa_ext_id {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... this enum instead (which doesn't consist of any macros).

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    RISCV_ISA_EXT_ZICNTR = RISCV_ISA_EXT_BASE,
+    RISCV_ISA_EXT_ZICSR,
+    RISCV_ISA_EXT_ZIFENCEI,
+    RISCV_ISA_EXT_ZIHINTPAUSE,
+    RISCV_ISA_EXT_ZIHPM,
+    RISCV_ISA_EXT_ZBB,
+    RISCV_ISA_EXT_SMAIA,
+    RISCV_ISA_EXT_SSAIA,
+    RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
+};
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why can't the single-letter RISCV_ISA_EXT_? be part of this enum as well?</pre>
    </blockquote>
    <pre>Good point. It could and would be better. Thereby I will refactor that.
</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:bc636259-5586-428c-8a57-f97ba16a14b8@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+void riscv_fill_hwcap(void);
+
+bool riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
A signed bit position? Can negative values be passed in? Actually - can't
this be enum riscv_isa_ext_id anyway?</pre>
    </blockquote>
    <pre>No, negative values can't be passed. Extension IDs are always positive.
If we will move everything ( single-letter extensions too ) to enum 
riscv_isa_ext_id then we can use enum riscv_isa_ext_id
instead of int here. I think that it would be really better so I will refactor that
accordingly.

Thanks for review!
</pre>
    <pre>~ Oleksii</pre>
  </body>
</html>

--------------M8hA5d9ESfqddvD8G6y0PyIq--

