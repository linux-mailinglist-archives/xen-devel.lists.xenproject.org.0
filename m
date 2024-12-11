Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FBD9ED00F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 16:42:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854909.1267984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLOqa-0001Gr-RA; Wed, 11 Dec 2024 15:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854909.1267984; Wed, 11 Dec 2024 15:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLOqa-0001ET-OT; Wed, 11 Dec 2024 15:41:56 +0000
Received: by outflank-mailman (input) for mailman id 854909;
 Wed, 11 Dec 2024 15:41:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLOqZ-0001AJ-Nz
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 15:41:55 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 718b84c8-b7d6-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 16:41:54 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733931704905995.210486743355;
 Wed, 11 Dec 2024 07:41:44 -0800 (PST)
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
X-Inumbo-ID: 718b84c8-b7d6-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1733931707; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PMizDMuZaK2Ohs+ThE9lT52OJsP3MxJJNbFdU4fBBZ9sRMP/9s/htmwgRU/sNMacUISrAiPwQB82xBSKf+4jm98FnJb5/CvcDRpYI7y9p9Vt9G3eZXOC0vU8nyxy7Mr9ie0WzM9p4aJLYpfHC9wMHbIsoxR8HmCGXoZXy390nA0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733931707; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4liT0qrO/T3UlhWquLdcJPHwO80fJ6Dv48246bTbq6A=; 
	b=DWsGLMzBaujyePswk+ppZ6sF+cDXeM8MajUH1Ra0Xk3ZtmW2N1JxD80LHjZJUqC9OtlggpmKrUS3+Jr4kGXXSFveOmqfIRKjJDWsPDBOeTqZcTtNLCdoiSDxqSJtSfG3fGx7g4wjA0MWAel18uvc+YBuf6ygxcWK4bB5wCemZ1w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733931707;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4liT0qrO/T3UlhWquLdcJPHwO80fJ6Dv48246bTbq6A=;
	b=Ry5R187/7mJcfbBefyZKCV+YVBquiXisMceqowOzFmg7qaGyDVadFIJo5+5oxqKL
	dK+rrVk4xtjUQLpfFUvyQHzryzoaMQAEwnklaUr8x/t/yJmum1jlfmi7IrFxYkPGeVc
	oY+N7Jau9p5vj/87s0uRWrRsbYnYozcxFwslf2wI=
Message-ID: <b9f1396d-7675-404e-b04e-4344143fcc57@apertussolutions.com>
Date: Wed, 11 Dec 2024 10:41:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/15] x86/hyperlaunch: locate dom0 kernel with
 hyperlaunch
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-9-dpsmith@apertussolutions.com>
 <91e6d4e7-b4ff-4e13-8814-95eaac891cf4@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <91e6d4e7-b4ff-4e13-8814-95eaac891cf4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 12/2/24 06:53, Jan Beulich wrote:
> On 23.11.2024 19:20, Daniel P. Smith wrote:
>> Look for a subnode of type `multiboot,kernel` within a domain node. If found,
>> process the reg property for the MB1 module index. If the bootargs property is
>> present and there was not an MB1 string, then use the command line from the
>> device tree definition.
> 
> Why specifically MB1?

Because Xen converts MB2 into an MB1 chain very early in the entry 
points that take MB2. By the time HL code is executed, it will only ever 
see a list of MB1 modules.

>> --- a/xen/arch/x86/domain_builder/core.c
>> +++ b/xen/arch/x86/domain_builder/core.c
>> @@ -56,6 +56,18 @@ void __init builder_init(struct boot_info *bi)
>>   
>>           printk(XENLOG_INFO "  Number of domains: %d\n", bi->nr_domains);
>>       }
>> +    else
>> +    {
>> +        int i;
> 
> Plain int when ...
> 
>> +        /* Find first unknown boot module to use as Dom0 kernel */
>> +        printk("Falling back to using first boot module as dom0\n");
>> +        i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
>> +        bi->mods[i].type = BOOTMOD_KERNEL;
>> +        bi->domains[0].kernel = &bi->mods[i];
>> +        bi->nr_domains = 1;
>> +    }
> 
> ... it's used as array index (and there's no check for the function return
> value being negative)?

Nope, that is an artifact from early version of boot module series in 
which first_boot_module_index() returned a plain int. Will fix.

>> --- a/xen/arch/x86/domain_builder/fdt.c
>> +++ b/xen/arch/x86/domain_builder/fdt.c
>> @@ -14,6 +14,122 @@
>>   
>>   #include "fdt.h"
>>   
>> +static inline int __init fdt_get_prop_as_reg(
> 
> What does "reg" stand for here?

Device Tree defines a two field "prop-encoded=array" property type 
called reg.

>> +    const void *fdt, int node, const char *name, unsigned int ssize,
>> +    unsigned int asize, uint64_t *size, uint64_t *addr)
>> +{
>> +    int ret;
>> +    const struct fdt_property *prop;
>> +    fdt32_t *cell;
>> +
>> +    /* FDT spec max size is 4 (128bit int), but largest arch int size is 64 */
>> +    if ( ssize > 2 || asize > 2 )
>> +        return -EINVAL;
>> +
>> +    prop = fdt_get_property(fdt, node, name, &ret);
>> +    if ( !prop || ret < sizeof(u32) )
>> +        return ret < 0 ? ret : -EINVAL;
>> +
>> +    /* read address field */
>> +    cell = (fdt32_t *)prop->data;
>> +
>> +    if ( asize == 1 )
>> +    {
>> +        uint32_t val;
>> +        fdt_cell_as_u32(cell, &val);
>> +        *addr = (uint64_t)val;
> 
> No need for a cast here nor ...
> 
>> +    }
>> +    else
>> +        fdt_cell_as_u64(cell, addr);
>> +
>> +    /* read size field */
>> +    cell += asize;
>> +
>> +    if ( ssize == 1 )
>> +    {
>> +        uint32_t val;
>> +        fdt_cell_as_u32(cell, &val);
>> +        *size = (uint64_t)val;
> 
> ... here?

No the compiler does not need the cast, placed to remind readers what 
was being done. Can/will drop.

>> +    }
>> +    else
>> +        fdt_cell_as_u64(cell, size);
>> +
>> +    return 0;
>> +}
> 
> This whole function reads very much like a library one. Does it really need
> adding here, rather than to the FDT library code we already have? In any
> event there's nothing x86-specific about it, afaics.

This is where it gets complicated. Most of the higher order functions 
exposed by xen/device_tree.h are written to work with FDT indexing 
structures, referred to as the unflattened tree. Deconflicting the mixed 
use of FDT and FDT index in device_tree.h is beyond the scope of this 
series.

>> +static int __init dom0less_module_node(
>> +    void *fdt, int node, int size_size, int address_size)
> 
> Three times plain int, when ...
> 
>> +{
>> +    uint64_t size, addr;
>> +    int ret = fdt_get_prop_as_reg(fdt, node, "reg", size_size, address_size,
> 
> ... two get converted to unsigned int in the course of the function call
> here?

The libfdt function returns signed int for size_size and address_size to 
allow returning an error code, which is checked for at the time of 
invocation. After that point, the value is guaranteed to be >= 0. They 
can be left as int in the function calls or a pair of temporary plain 
ints could be used for the libfdt call and if no error, store the value 
into unsigned.

>> +                                  &size, &addr);
>> +    /* An FDT error value may have been returned, translate to -EINVAL */
>> +    if ( ret < 0 )
>> +        return -EINVAL;
>> +
>> +    if ( size != 0 )
>> +        return -EOPNOTSUPP;
> 
> Not knowing much about DT: What does 0 represent here?

The libfdt code treats 0 as a valid value, whether zero is a valid value 
is driven by the contextual usage of the property.

>> +    if ( addr > MAX_NR_BOOTMODS )
>> +        return -ERANGE;
>> +
>> +    /*
>> +     * MAX_NR_BOOTMODS cannot exceed the max for MB1, represented by a u32,
>> +     * thus the cast down to a u32 will be safe due to the prior check.
>> +     */
>> +    return (int)addr;
> 
> Comment and cast contradict one another. DYM u32 (really: uint32_t), or plain
> int? If you mean to return a plain int (for the sake of the -errno values
> further up), MAX_NR_BOOTMODS needs to stay below 2**31.

Good point, we cannot artificially impose 2^31 limit when 2^32 is the 
legitimate upper bound supported by the MB1 protocol. Even if that value 
is impractical. At the same time, it is beneficial to be able to 
communicate failures along with some delineation of the failure. Let me 
think about this, and in the meantime suggestions are welcomed.

>> +static int __init process_domain_node(
>> +    struct boot_info *bi, void *fdt, int dom_node)
>> +{
>> +    int node;
>> +    struct boot_domain *bd = &bi->domains[bi->nr_domains];
>> +    const char *name = fdt_get_name(fdt, dom_node, NULL);
>> +    int address_size = fdt_address_cells(fdt, dom_node);
>> +    int size_size = fdt_size_cells(fdt, dom_node);
>> +
>> +    if ( address_size < 0 || size_size < 0 )
>> +    {
>> +        printk("  failed processing #address or #size for domain %s)\n",
>> +               name == NULL ? "unknown" : name);
>> +        return -EINVAL;
>> +    }
>> +
>> +    fdt_for_each_subnode(node, fdt, dom_node)
>> +    {
>> +        if ( fdt_node_check_compatible(fdt, node, "multiboot,kernel") == 0 )
>> +        {
>> +            int idx = dom0less_module_node(fdt, node, size_size, address_size);
>> +            if ( idx < 0 )
>> +            {
>> +                printk("  failed processing kernel module for domain %s)\n",
>> +                       name == NULL ? "unknown" : name);
>> +                return idx;
>> +            }
>> +
>> +            if ( idx > bi->nr_modules )
>> +            {
>> +                printk("  invalid kernel module index for domain node (%d)\n",
>> +                       bi->nr_domains);
>> +                return -EINVAL;
>> +            }
>> +
>> +            printk("  kernel: boot module %d\n", idx);
>> +            bi->mods[idx].type = BOOTMOD_KERNEL;
>> +            bd->kernel = &bi->mods[idx];
>> +        }
>> +    }
> 
> What if you find two?

No different than if someone accidentally duplicated the module line for 
the kernel in grub.cfg. It's a violation of the boot convention with the 
resulting behavior being indeterminate, which may or may not result in 
failure/panic when the domain attempts to boot. It might be worth adding 
a warning if a duplicate kernel entry is detected. It is possible that 
such a configuration would boot if it was a duplicate paste situation. 
So I would not feel right panicking, when there is a possibility that 
the configuration could boot.

>> --- a/xen/arch/x86/domain_builder/fdt.h
>> +++ b/xen/arch/x86/domain_builder/fdt.h
>> @@ -3,6 +3,7 @@
>>   #define __XEN_X86_FDT_H__
>>   
>>   #include <xen/init.h>
>> +#include <xen/libfdt/libfdt.h>
>>   
>>   #include <asm/bootinfo.h>
>>   
>> @@ -10,6 +11,22 @@
>>   #define HYPERLAUNCH_MODULE_IDX 0
>>   
>>   #ifdef CONFIG_DOMAIN_BUILDER
>> +
>> +static inline int __init fdt_cell_as_u32(const fdt32_t *cell, uint32_t *val)
>> +{
>> +    *val = fdt32_to_cpu(*cell);
>> +
>> +    return 0;
>> +}
>> +
>> +static inline int __init fdt_cell_as_u64(const fdt32_t *cell, uint64_t *val)
>> +{
>> +    *val = ((uint64_t)fdt32_to_cpu(cell[0]) << 32) |
>> +           (uint64_t)fdt32_to_cpu(cell[1]);
>> +
>> +    return 0;
>> +}
> 
> Basic library routines again?

Same as above.

v/r,
dps


