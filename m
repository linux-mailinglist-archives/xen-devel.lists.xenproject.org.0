Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 952A8A17DE2
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 13:38:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875408.1285854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taDVO-0007Dt-PG; Tue, 21 Jan 2025 12:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875408.1285854; Tue, 21 Jan 2025 12:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taDVO-0007C8-LX; Tue, 21 Jan 2025 12:37:18 +0000
Received: by outflank-mailman (input) for mailman id 875408;
 Tue, 21 Jan 2025 12:37:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NioT=UN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1taDVM-0007Ag-Re
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 12:37:17 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 714c3982-d7f4-11ef-a0e4-8be0dac302b0;
 Tue, 21 Jan 2025 13:37:14 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-30227ccf803so46304571fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 04:37:14 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a34489fsm20533791fa.29.2025.01.21.04.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 04:37:13 -0800 (PST)
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
X-Inumbo-ID: 714c3982-d7f4-11ef-a0e4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737463034; x=1738067834; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJ+EAvY3g+W4cU26MGjggghSeDmZuBjdFoRe4claR2o=;
        b=iE9j2RYGLMfKSyxQoIzBiPU8vWfuD9nHgOCLq5M+xESShDnGzIPnBux+ZPFFjkKiiG
         a2SRGi8u3sWbI3B+Ybm+/4RtchYFv1qrJcuMBwNE1dPT4zm5XVADqYlTpldowyabOzeB
         aPb7bnlHaSTZ3+3DG5qPzRuhBSsI/svgkYqDP2f/GYc8+Mc5gxsSoUMNiWCrrEKxmWGX
         tP8+pQl3Vz5q3xRqST6NjqlVmWhhbRHv5C4YUZKzJeIckLss872YLm3J8XHu+ivtqTBS
         aCv5PIKxB2p6BJU30Wj4opXzBi3DIySaT/UfES6VaTcophaBBlUaI3yqxP1IqoXk1GQM
         XP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737463034; x=1738067834;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NJ+EAvY3g+W4cU26MGjggghSeDmZuBjdFoRe4claR2o=;
        b=mmOV3RL8DTj+UW2M5naCeb2XzhyCjT+vnYCIFgNqAUOUaj83/YAmVzXaCJv0M3YCRH
         4dZLA2WtkRKUEGg8duBQtI1rum3Eewp3vYHae4q9oz401F6gCdcgZPTkO5HSbEt3d0Fm
         e7byMsNRCYEAHDKqqIjy/GAziiDT+gR8xiAIvagBrCl+rDGlKkiAiTZozqiEYZvOqkdh
         c0ish0Kvs+x6Ac6tpTvL0Ln1WnrYsSJsLxh6tcmgbxsbySdeHzUhplx47iFvPDE4KBYy
         Nb3uSaSB9luY4YvR7hY6e/yuEPZha9w9lE0LFJ5KjVI5XGodACRHU8FQrr5wC55zc9lK
         hS4w==
X-Forwarded-Encrypted: i=1; AJvYcCVP8/ophxLYL5zoX+Y2/xlFsqN65EXRojK7yUG/V4VKf162zlK4JBOFHLI9BsE0Q5wlGqKzQIC9TFI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxnciOcjcG0vNpQRj7W4c0vSPoYOR2szM/gQLfvVLiK4Wjs7Ln6
	JLpfAzfRpIUw31GYKIu/jqLGkPKgUZdFH/4zkLZ/bB+SappiM/32
X-Gm-Gg: ASbGncscGp1vpI3dhxBBTORf1Jq9HRaPWMMgaxdYhhLnvTv1/iNPHOc4MsHfglQ98JW
	+OpmnjDQvvvTep+bgMwjHSSqtIyzmr0UMyN+wc6zYLQGN9ZQpW+Ant6KPfX0umAtyGaK3SF5Rbc
	37tBgPgq6eZS7gkZ3RpORyeIJGqQFd3IY7mt29v+e5ZYnFu3o5c/3avdkCkpwi5W+tBb94AxK7T
	bFFyNA8AX5cUnPpGjthqAdNmGpXD5l2ICKYtpZhhaWbHbN4TrhSdvj4+BoXS+3w6VBMusk3JvEu
	Z+n6FhE=
X-Google-Smtp-Source: AGHT+IHgZs3f0X8lEbaGiuoCFRDd9sUFstMa8tB4iNwoybJGLhPi4+QjJouf3KpL4TEeCdAgR8PIuQ==
X-Received: by 2002:a05:651c:b24:b0:304:67d4:6e2c with SMTP id 38308e7fff4ca-3072cb1f301mr66860841fa.24.1737463033379;
        Tue, 21 Jan 2025 04:37:13 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------C0x33TP0pSjxn0DaWykmYcnz"
Message-ID: <59dd7cdd-b353-4463-966e-345266a7a54e@gmail.com>
Date: Tue, 21 Jan 2025 13:37:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/riscv: identify specific ISA supported by cpu
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <0a6562ae1e22e3fe607054b33df3467c12d0b276.1736956861.git.oleksii.kurochko@gmail.com>
 <0ceaa04e-36ac-4099-8a84-977a08ba16a2@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0ceaa04e-36ac-4099-8a84-977a08ba16a2@suse.com>

This is a multi-part message in MIME format.
--------------C0x33TP0pSjxn0DaWykmYcnz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/20/25 4:13 PM, Jan Beulich wrote:
> On 15.01.2025 17:36, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/arch/riscv/cpufeature.c
>> @@ -0,0 +1,506 @@
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
>> + *   riscv_isa_extension_available for consistency. Also, update the type of
>> + *   `bit` argument of riscv_isa_extension_available().
>> + * - Redefine RISCV_ISA_EXT_DATA() to work only with ext_name and ext_id,
>> + *   as other fields are not used in Xen currently.
>> + * - Add check of first 4 letters of riscv,isa string to
>> + *   riscv_isa_parse_string() as Xen doesn't do this check before so it is
>> + *   necessary to check correctness of riscv,isa string. ( it should start with
>> + *   rv{32,64} with taking into account lower case of "rv").
>> + * - Drop an argument of riscv_fill_hwcap() and riscv_fill_hwcap_from_isa_string()
>> + *   as it isn't used, at the moment.
>> + * - Update the comment message about QEMU workaround.
>> + * - s/pr_info/printk.
> As said before - having this in the commit message is likely enough. Putting
> it here as well is only risking for this to go stale (perhaps rather sooner
> than later).

I misunderstood you last time. I will remove this comment entirely to avoid dealing
with potential staleness in the future.

>
>> + * Copyright (C) 2015 ARM Ltd.
>> + * Copyright (C) 2017 SiFive
>> + * Copyright (C) 2024 Vates
>> + */
>> +
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
>> +#ifdef CONFIG_ACPI
>> +#error "cpufeature.c functions should be updated to support ACPI"
>> +#endif
>> +
>> +struct riscv_isa_ext_data {
>> +    unsigned int id;
>> +    const char *name;
>> +};
>> +
>> +#define RISCV_ISA_EXT_DATA(ext_name, ext_id)    \
>> +{                                               \
>> +    .id = ext_id,                               \
>> +    .name = #ext_name,                          \
>> +}
>> +
>> +/* Host ISA bitmap */
>> +static __ro_after_init DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX);
>> +
>> +static int __init dt_get_cpuid_from_node(const struct dt_device_node *cpu)
>> +{
>> +    const __be32 *prop;
>> +    unsigned int reg_len;
>> +
>> +    if ( dt_n_size_cells(cpu) != 0 )
>> +        printk("cpu node `%s`: #size-cells %d\n",
>> +               dt_node_full_name(cpu), dt_n_size_cells(cpu));
> The call to dt_n_size_cells() is here really just for the printk()?

Yes, it is only used for debug purposes.

Based on DT's bindings (https://www.kernel.org/doc/Documentation/devicetree/bindings/riscv/cpus.txt )
and RISC-V's DTS files in kernel #size-cells for cpu node is expected to be 0.

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
> How come it is okay to (silently) truncate here from paddr_t to int?

Specifically in this case it is okay as it is low chance that cpuid will be higher then the size of `int`.
But based on RISC-V spec. hartid could be from 0 to ((1ULL << (MXLEN)) - 1) [MXLEN is the size of register]
so it would be better to use `long` instead of `int` as return value and use `long` for cpuid variable in
the callers of dt_get_cpuid_from_node().

Probably it would be even better to return error code as `int` to have ability to verify if something wrong
happens during dt_get_cpuid_from_node() and add another one argument to dt_get_cpuid_from_node() with paddr_t
type ( or `unsigned long` as type `paddr_t` looks confusing a little bit for describing of cpu id ) and set this
argument before return.
  

>
>> +}
>> +
>> +/*
>> + * The canonical order of ISA extension names in the ISA string is defined in
>> + * chapter 27 of the unprivileged specification.
>> + *
>> + * The specification uses vague wording, such as should, when it comes to
>> + * ordering, so for our purposes the following rules apply:
>> + *
>> + * 1. All multi-letter extensions must be separated from other extensions by an
>> + *    underscore.
>> + *
>> + * 2. Additional standard extensions (starting with 'Z') must be sorted after
>> + *    single-letter extensions and before any higher-privileged extensions.
>> + *
>> + * 3. The first letter following the 'Z' conventionally indicates the most
>> + *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
>> + *    If multiple 'Z' extensions are named, they must be ordered first by
>> + *    category, then alphabetically within a category.
>> + *
>> + * 4. Standard supervisor-level extensions (starting with 'S') must be listed
>> + *    after standard unprivileged extensions.  If multiple supervisor-level
>> + *    extensions are listed, they must be ordered alphabetically.
>> + *
>> + * 5. Standard machine-level extensions (starting with 'Zxm') must be listed
>> + *    after any lower-privileged, standard extensions.  If multiple
>> + *    machine-level extensions are listed, they must be ordered
>> + *    alphabetically.
>> + *
>> + * 6. Non-standard extensions (starting with 'X') must be listed after all
>> + *    standard extensions. If multiple non-standard extensions are listed, they
>> + *    must be ordered alphabetically.
>> + *
>> + * An example string following the order is:
>> + *    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
>> + *
>> + * New entries to this struct should follow the ordering rules described above.
>> + *
>> + * Extension name must be all lowercase ( according to device-tree binding )
>> + * and strncmp() is used in match_isa_ext() to compare extension names instead
>> + * of strncasecmp().
>> + */
>> +const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
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
>> +    RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
>> +    RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>> +};
>> +
>> +static const struct riscv_isa_ext_data __initconst required_extensions[] = {
>> +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>> +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>> +};
> No Zicsr here?

Agree, it should be added.


>> +
>> +static int __init riscv_isa_parse_string(const char *isa,
>> +                                         unsigned long *out_bitmap)
>> +{
>> +    /*
>> +     * According to RISC-V device tree binding isa string must be all
>> +     * lowercase.
>> +     * To be sure that this is true, ASSERT below is added.
>> +     */
>> +    ASSERT(islower(isa[0]) && islower(isa[1]));
> This looks a little odd to me when you have ...
>
>> +    if ( (isa[0] != 'r') && (isa[1] != 'v') )
>> +        return -EINVAL;
> ... this anyway.

Agree, there is a little sense in having ASSERT() as, actually, if-condition does the same. I'll
drop ASSERT().

>
>> +#if defined(CONFIG_RISCV_32)
>> +    if ( isa[2] != '3' && isa[3] != '2' )
>> +        return -EINVAL;
>> +#elif defined(CONFIG_RISCV_64)
>> +    if ( isa[2] != '6' && isa[3] != '4' )
>> +        return -EINVAL;
>> +#else
>> +    #error "unsupported RISC-V bitness"
>> +#endif
>> +
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
>> +            printk_once("Vendor extensions are ignored in riscv,isa."
>> +                        "Use riscv,isa-extensions instead\n");
> Interesting suggestion considering that doing so will end in a panic().

Do you think that "Use riscv,isa-extensions instead\n" would be better to add when "riscv,isa-extensions" handling
will be ready?

>> +static int __init riscv_fill_hwcap_from_ext_list(void)
>> +{
>> +    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
>> +    const struct dt_device_node *cpu;
>> +    int res = -EINVAL;
>> +
>> +    if ( !cpus )
>> +    {
>> +        printk("Missing /cpus node in the device tree?\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    dt_for_each_child_node(cpus, cpu)
>> +    {
>> +        const char *isa;
>> +        int cpuid;
>> +
>> +        if ( !dt_device_type_is_equal(cpu, "cpu") )
>> +            continue;
>> +
>> +        cpuid = dt_get_cpuid_from_node(cpu);
>> +        if ( cpuid < 0 )
>> +            continue;
>> +
>> +        if ( dt_property_read_string(cpu, "riscv,isa-extensions", &isa) )
>> +        {
>> +            printk("Unable to find \"riscv,isa-extensions\" devicetree entry "
>> +                   "for cpu%d\n", cpuid);
> This is DT's number space for CPUs, isn't it? Any use of cpu%d (or CPU%d) or
> alike generally suggests the number is Xen's. This may want disambiguating
> here.

Yeah, the cpuid in this context is from the DT's namespace.

I'm not sure if we can get Xen's number at this stage, as only one CPU is used. We can only get
the DT's cpuid for Xen's CPU0 as|set_cpuid_to_hartid|(0, bootcpuid) has been already called.
For other CPUs, it depends on the order in which they are booted and the call to|set_cpuid_to_hartid()|.

I think that the best thing we can do is re-wording. I have two options:
1. "for DT's cpu%d node\n", cpuid);
2. "for hartid%d\n", cpuid); -> as based on the function name|set_cpuid_to_hartid|() we are using cpuid
    for Xen's cpu id and hart id - for real cpu id.
I prefer the first one option as it is more explicit and it doesn't require to know RISC-V specific terminology.

>> +static void __init riscv_fill_hwcap_from_isa_string(void)
>> +{
>> +    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
>> +    const struct dt_device_node *cpu;
>> +
>> +    if ( !cpus )
>> +    {
>> +        printk("Missing /cpus node in the device tree?\n");
>> +        return;
>> +    }
>> +
>> +    dt_for_each_child_node(cpus, cpu)
>> +    {
>> +        DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
>> +        const char *isa;
>> +        int cpuid;
>> +
>> +        if ( !dt_device_type_is_equal(cpu, "cpu") )
>> +            continue;
>> +
>> +        cpuid = dt_get_cpuid_from_node(cpu);
>> +        if ( cpuid < 0 )
>> +            continue;
>> +
>> +        if ( dt_property_read_string(cpu, "riscv,isa", &isa) )
>> +        {
>> +            printk("Unable to find \"riscv,isa\" devicetree entry\n");
>> +            continue;
>> +        }
> Interestingly you don't log the CPU number here. What's the deal?

Missed to do that, I will add CPU number to printk().

>
>> +bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
>> +                                   enum riscv_isa_ext_id bit)
>> +{
>> +    const unsigned long *bmap = (isa_bitmap) ? isa_bitmap : riscv_isa;
> Since it helps readability, may I suggest
>
>      const unsigned long *bmap = isa_bitmap ?: riscv_isa;
>
> or even getting away without the local var altogether:
>
>      if ( !isa_bitmap )
>          isa_bitmap = riscv_isa;
>
> ?

I think it would be better then go without local variable. I will proceed in that way.

>> +    if ( ret )
>> +    {
>> +        printk("Falling back to deprecated \"riscv,isa\"\n");
>> +        riscv_fill_hwcap_from_isa_string();
>> +    }
> I continue to find it irritating that you first try a function you
> know won't succeed (and will panic() if the DT item is actually there),
> in order to the log yet another message about using something that's
> deprecated. If this is deprecated, why don't we prefer (and hence
> support) the mor modern approach?

Even though it is considered deprecated, I haven't seen any DTS files in the Linux kernel using|riscv,isa-extension|.
Currently, Xen relies on the DTB generated by QEMU, which still uses|riscv,isa|. This is why, unfortunately, we still
need to support the deprecated|riscv,isa|. (Although I would much prefer using|riscv,isa-extension| since it's easier
to parse.)

Based on the fact that every source I checked doesn't use|riscv,isa-extension|, I decided to postpone adding support
for it. However, this task is still on my TODO list.

I completely agree that this is a frustrating approach. But at the time of porting the code, it seemed like the
best option. After you pointed it out, I think we could improve this part of the code in the following way:
   -    int ret = riscv_fill_hwcap_from_ext_list();
   -
   -    if ( ret )
   -    {
   -        printk("Falling back to deprecated \"riscv,isa\"\n");
   -        riscv_fill_hwcap_from_isa_string();
   -    }
   +    if ( riscv_fill_hwcap_from_isa_string() )
   +        panic("HW capabilities parsing fro isa string failed\n");
( with dropping of riscv_fill_hwcap_from_ext_list() and adding of return value for riscv_fill_hwcap_from_isa_string() )

>> +    for ( i = 0; i < req_extns_amount; i++ )
>> +    {
>> +        const struct riscv_isa_ext_data ext = required_extensions[i];
>> +
>> +        if ( !riscv_isa_extension_available(NULL, ext.id) )
>> +        {
>> +            printk("Xen requires extension: %s\n", ext.name);
>> +            all_extns_available = false;
>> +        }
>> +    }
>> +
>> +    if ( !all_extns_available )
>> +        panic("Look why the extensions above are needed in booting.txt\n");
> Where's this booting.txt? I don't think people should be made hunt it
> down ...

I will add ("...docs/misc/riscv/booting.txt\n").

As an other option I could paste here a link to booting.txt ( it will violate code string length but I think it is
fine in the current case ):
  panic("Look why the extensions above are needed inhttps://gitlab.com/xen-project/xen/-/blob/staging/docs/misc/riscv/booting.txt?ref_type=heads \n");

Thanks.

~ Oleksii

--------------C0x33TP0pSjxn0DaWykmYcnz
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/20/25 4:13 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:0ceaa04e-36ac-4099-8a84-977a08ba16a2@suse.com">
      <pre wrap="" class="moz-quote-pre">On 15.01.2025 17:36, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/cpufeature.c
@@ -0,0 +1,506 @@
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
+ *   riscv_isa_extension_available for consistency. Also, update the type of
+ *   `bit` argument of riscv_isa_extension_available().
+ * - Redefine RISCV_ISA_EXT_DATA() to work only with ext_name and ext_id,
+ *   as other fields are not used in Xen currently.
+ * - Add check of first 4 letters of riscv,isa string to
+ *   riscv_isa_parse_string() as Xen doesn't do this check before so it is
+ *   necessary to check correctness of riscv,isa string. ( it should start with
+ *   rv{32,64} with taking into account lower case of "rv").
+ * - Drop an argument of riscv_fill_hwcap() and riscv_fill_hwcap_from_isa_string()
+ *   as it isn't used, at the moment.
+ * - Update the comment message about QEMU workaround.
+ * - s/pr_info/printk.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
As said before - having this in the commit message is likely enough. Putting
it here as well is only risking for this to go stale (perhaps rather sooner
than later).</pre>
    </blockquote>
    <pre>I misunderstood you last time. I will remove this comment entirely to avoid dealing
with potential staleness in the future.

</pre>
    <blockquote type="cite"
      cite="mid:0ceaa04e-36ac-4099-8a84-977a08ba16a2@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * Copyright (C) 2015 ARM Ltd.
+ * Copyright (C) 2017 SiFive
+ * Copyright (C) 2024 Vates
+ */
+
+#include &lt;xen/bitmap.h&gt;
+#include &lt;xen/ctype.h&gt;
+#include &lt;xen/device_tree.h&gt;
+#include &lt;xen/errno.h&gt;
+#include &lt;xen/init.h&gt;
+#include &lt;xen/lib.h&gt;
+#include &lt;xen/sections.h&gt;
+
+#include &lt;asm/cpufeature.h&gt;
+
+#ifdef CONFIG_ACPI
+#error "cpufeature.c functions should be updated to support ACPI"
+#endif
+
+struct riscv_isa_ext_data {
+    unsigned int id;
+    const char *name;
+};
+
+#define RISCV_ISA_EXT_DATA(ext_name, ext_id)    \
+{                                               \
+    .id = ext_id,                               \
+    .name = #ext_name,                          \
+}
+
+/* Host ISA bitmap */
+static __ro_after_init DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX);
+
+static int __init dt_get_cpuid_from_node(const struct dt_device_node *cpu)
+{
+    const __be32 *prop;
+    unsigned int reg_len;
+
+    if ( dt_n_size_cells(cpu) != 0 )
+        printk("cpu node `%s`: #size-cells %d\n",
+               dt_node_full_name(cpu), dt_n_size_cells(cpu));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The call to dt_n_size_cells() is here really just for the printk()?</pre>
    </blockquote>
    <pre>Yes, it is only used for debug purposes.

Based on DT's bindings ( <a class="moz-txt-link-freetext" href="https://www.kernel.org/doc/Documentation/devicetree/bindings/riscv/cpus.txt">https://www.kernel.org/doc/Documentation/devicetree/bindings/riscv/cpus.txt</a> )
and RISC-V's DTS files in kernel #size-cells for cpu node is expected to be 0.
</pre>
    <blockquote type="cite"
      cite="mid:0ceaa04e-36ac-4099-8a84-977a08ba16a2@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    prop = dt_get_property(cpu, "reg", &amp;reg_len);
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
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
How come it is okay to (silently) truncate here from paddr_t to int?</pre>
    </blockquote>
    <pre>Specifically in this case it is okay as it is low chance that cpuid will be higher then the size of `int`.
But based on RISC-V spec. hartid could be from 0 to ((1ULL &lt;&lt; (MXLEN)) - 1) [MXLEN is the size of register]
so it would be better to use `long` instead of `int` as return value and use `long` for cpuid variable in
the callers of dt_get_cpuid_from_node().

Probably it would be even better to return error code as `int` to have ability to verify if something wrong
happens during dt_get_cpuid_from_node() and add another one argument to dt_get_cpuid_from_node() with paddr_t
type ( or `unsigned long` as type `paddr_t` looks confusing a little bit for describing of cpu id ) and set this
argument before return.
 </pre>
    <blockquote type="cite"
      cite="mid:0ceaa04e-36ac-4099-8a84-977a08ba16a2@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+}
+
+/*
+ * The canonical order of ISA extension names in the ISA string is defined in
+ * chapter 27 of the unprivileged specification.
+ *
+ * The specification uses vague wording, such as should, when it comes to
+ * ordering, so for our purposes the following rules apply:
+ *
+ * 1. All multi-letter extensions must be separated from other extensions by an
+ *    underscore.
+ *
+ * 2. Additional standard extensions (starting with 'Z') must be sorted after
+ *    single-letter extensions and before any higher-privileged extensions.
+ *
+ * 3. The first letter following the 'Z' conventionally indicates the most
+ *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
+ *    If multiple 'Z' extensions are named, they must be ordered first by
+ *    category, then alphabetically within a category.
+ *
+ * 4. Standard supervisor-level extensions (starting with 'S') must be listed
+ *    after standard unprivileged extensions.  If multiple supervisor-level
+ *    extensions are listed, they must be ordered alphabetically.
+ *
+ * 5. Standard machine-level extensions (starting with 'Zxm') must be listed
+ *    after any lower-privileged, standard extensions.  If multiple
+ *    machine-level extensions are listed, they must be ordered
+ *    alphabetically.
+ *
+ * 6. Non-standard extensions (starting with 'X') must be listed after all
+ *    standard extensions. If multiple non-standard extensions are listed, they
+ *    must be ordered alphabetically.
+ *
+ * An example string following the order is:
+ *    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
+ *
+ * New entries to this struct should follow the ordering rules described above.
+ *
+ * Extension name must be all lowercase ( according to device-tree binding )
+ * and strncmp() is used in match_isa_ext() to compare extension names instead
+ * of strncasecmp().
+ */
+const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
+    RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
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
+    RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+    RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
+};
+
+static const struct riscv_isa_ext_data __initconst required_extensions[] = {
+    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
+    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
+};
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
No Zicsr here?</pre>
    </blockquote>
    <pre>Agree, it should be added.


</pre>
    <blockquote type="cite"
      cite="mid:0ceaa04e-36ac-4099-8a84-977a08ba16a2@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+static int __init riscv_isa_parse_string(const char *isa,
+                                         unsigned long *out_bitmap)
+{
+    /*
+     * According to RISC-V device tree binding isa string must be all
+     * lowercase.
+     * To be sure that this is true, ASSERT below is added.
+     */
+    ASSERT(islower(isa[0]) &amp;&amp; islower(isa[1]));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This looks a little odd to me when you have ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( (isa[0] != 'r') &amp;&amp; (isa[1] != 'v') )
+        return -EINVAL;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... this anyway.</pre>
    </blockquote>
    <pre>Agree, there is a little sense in having ASSERT() as, actually, if-condition does the same. I'll
drop ASSERT().

</pre>
    <blockquote type="cite"
      cite="mid:0ceaa04e-36ac-4099-8a84-977a08ba16a2@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#if defined(CONFIG_RISCV_32)
+    if ( isa[2] != '3' &amp;&amp; isa[3] != '2' )
+        return -EINVAL;
+#elif defined(CONFIG_RISCV_64)
+    if ( isa[2] != '6' &amp;&amp; isa[3] != '4' )
+        return -EINVAL;
+#else
+    #error "unsupported RISC-V bitness"
+#endif
+
+    isa += 4;
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
+            printk_once("Vendor extensions are ignored in riscv,isa."
+                        "Use riscv,isa-extensions instead\n");
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Interesting suggestion considering that doing so will end in a panic().</pre>
    </blockquote>
    <pre>Do you think that "Use riscv,isa-extensions instead\n" would be better to add when "riscv,isa-extensions" handling
will be ready?

</pre>
    <blockquote type="cite"
      cite="mid:0ceaa04e-36ac-4099-8a84-977a08ba16a2@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static int __init riscv_fill_hwcap_from_ext_list(void)
+{
+    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
+    const struct dt_device_node *cpu;
+    int res = -EINVAL;
+
+    if ( !cpus )
+    {
+        printk("Missing /cpus node in the device tree?\n");
+        return -EINVAL;
+    }
+
+    dt_for_each_child_node(cpus, cpu)
+    {
+        const char *isa;
+        int cpuid;
+
+        if ( !dt_device_type_is_equal(cpu, "cpu") )
+            continue;
+
+        cpuid = dt_get_cpuid_from_node(cpu);
+        if ( cpuid &lt; 0 )
+            continue;
+
+        if ( dt_property_read_string(cpu, "riscv,isa-extensions", &amp;isa) )
+        {
+            printk("Unable to find \"riscv,isa-extensions\" devicetree entry "
+                   "for cpu%d\n", cpuid);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This is DT's number space for CPUs, isn't it? Any use of cpu%d (or CPU%d) or
alike generally suggests the number is Xen's. This may want disambiguating
here.</pre>
    </blockquote>
    <pre>Yeah, the cpuid in this context is from the DT's namespace.

I'm not sure if we can get Xen's number at this stage, as only one CPU is used. We can only get
the DT's cpuid for Xen's CPU0 as <code>set_cpuid_to_hartid</code>(0, bootcpuid) has been already called.
For other CPUs, it depends on the order in which they are booted and the call to <code>set_cpuid_to_hartid()</code>.

I think that the best thing we can do is re-wording. I have two options:
1. "for DT's cpu%d node\n", cpuid);
2. "for hartid%d\n", cpuid); -&gt; as based on the function name <code>set_cpuid_to_hartid</code>() we are using cpuid
   for Xen's cpu id and hart id - for real cpu id.
I prefer the first one option as it is more explicit and it doesn't require to know RISC-V specific terminology.

</pre>
    <blockquote type="cite"
      cite="mid:0ceaa04e-36ac-4099-8a84-977a08ba16a2@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static void __init riscv_fill_hwcap_from_isa_string(void)
+{
+    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
+    const struct dt_device_node *cpu;
+
+    if ( !cpus )
+    {
+        printk("Missing /cpus node in the device tree?\n");
+        return;
+    }
+
+    dt_for_each_child_node(cpus, cpu)
+    {
+        DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
+        const char *isa;
+        int cpuid;
+
+        if ( !dt_device_type_is_equal(cpu, "cpu") )
+            continue;
+
+        cpuid = dt_get_cpuid_from_node(cpu);
+        if ( cpuid &lt; 0 )
+            continue;
+
+        if ( dt_property_read_string(cpu, "riscv,isa", &amp;isa) )
+        {
+            printk("Unable to find \"riscv,isa\" devicetree entry\n");
+            continue;
+        }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Interestingly you don't log the CPU number here. What's the deal?</pre>
    </blockquote>
    <pre>Missed to do that, I will add CPU number to printk().

</pre>
    <blockquote type="cite"
      cite="mid:0ceaa04e-36ac-4099-8a84-977a08ba16a2@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
+                                   enum riscv_isa_ext_id bit)
+{
+    const unsigned long *bmap = (isa_bitmap) ? isa_bitmap : riscv_isa;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Since it helps readability, may I suggest

    const unsigned long *bmap = isa_bitmap ?: riscv_isa;

or even getting away without the local var altogether:

    if ( !isa_bitmap )
        isa_bitmap = riscv_isa;

?</pre>
    </blockquote>
    <pre>I think it would be better then go without local variable. I will proceed in that way.

</pre>
    <blockquote type="cite"
      cite="mid:0ceaa04e-36ac-4099-8a84-977a08ba16a2@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( ret )
+    {
+        printk("Falling back to deprecated \"riscv,isa\"\n");
+        riscv_fill_hwcap_from_isa_string();
+    }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I continue to find it irritating that you first try a function you
know won't succeed (and will panic() if the DT item is actually there),
in order to the log yet another message about using something that's
deprecated. If this is deprecated, why don't we prefer (and hence
support) the mor modern approach?</pre>
    </blockquote>
    <pre>Even though it is considered deprecated, I haven't seen any DTS files in the Linux kernel using <code>riscv,isa-extension</code>.
Currently, Xen relies on the DTB generated by QEMU, which still uses <code>riscv,isa</code>. This is why, unfortunately, we still
need to support the deprecated <code>riscv,isa</code>. (Although I would much prefer using <code>riscv,isa-extension</code> since it's easier
to parse.)</pre>
    <pre>Based on the fact that every source I checked doesn't use <code>riscv,isa-extension</code>, I decided to postpone adding support
for it. However, this task is still on my TODO list.</pre>
    <pre>I completely agree that this is a frustrating approach. But at the time of porting the code, it seemed like the
best option. After you pointed it out, I think we could improve this part of the code in the following way:
  -    int ret = riscv_fill_hwcap_from_ext_list();
  -
  -    if ( ret )
  -    {
  -        printk("Falling back to deprecated \"riscv,isa\"\n");
  -        riscv_fill_hwcap_from_isa_string();
  -    }
  +    if ( riscv_fill_hwcap_from_isa_string() )
  +        panic("HW capabilities parsing fro isa string failed\n");
( with dropping of riscv_fill_hwcap_from_ext_list() and adding of return value for riscv_fill_hwcap_from_isa_string() )

</pre>
    <blockquote type="cite"
      cite="mid:0ceaa04e-36ac-4099-8a84-977a08ba16a2@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    for ( i = 0; i &lt; req_extns_amount; i++ )
+    {
+        const struct riscv_isa_ext_data ext = required_extensions[i];
+
+        if ( !riscv_isa_extension_available(NULL, ext.id) )
+        {
+            printk("Xen requires extension: %s\n", ext.name);
+            all_extns_available = false;
+        }
+    }
+
+    if ( !all_extns_available )
+        panic("Look why the extensions above are needed in booting.txt\n");
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Where's this booting.txt? I don't think people should be made hunt it
down ...</pre>
    </blockquote>
    <pre>I will add ("...docs/misc/riscv/booting.txt\n").

As an other option I could paste here a link to booting.txt ( it will violate code string length but I think it is
fine in the current case ):
 panic("Look why the extensions above are needed in <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/xen/-/blob/staging/docs/misc/riscv/booting.txt?ref_type=heads">https://gitlab.com/xen-project/xen/-/blob/staging/docs/misc/riscv/booting.txt?ref_type=heads</a> \n");

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------C0x33TP0pSjxn0DaWykmYcnz--

