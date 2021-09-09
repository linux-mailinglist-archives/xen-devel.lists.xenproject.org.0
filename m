Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD87405864
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 15:59:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183278.331358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOKaV-0000rJ-8k; Thu, 09 Sep 2021 13:59:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183278.331358; Thu, 09 Sep 2021 13:59:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOKaV-0000om-5Y; Thu, 09 Sep 2021 13:59:35 +0000
Received: by outflank-mailman (input) for mailman id 183278;
 Thu, 09 Sep 2021 13:59:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mOKaT-0000og-OI
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 13:59:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mOKaQ-0007C6-11; Thu, 09 Sep 2021 13:59:30 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mOKaP-0003oh-QS; Thu, 09 Sep 2021 13:59:29 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=DISAgcwJ9G17JAtLAr0zj7opL0G1q7kbwPhmCq4fhPA=; b=1KcMhlmPt/UPDXlUEiA8EZocoa
	LICM6sBrUOhsww+zsA84pVWqD5H/7SWjcqBLPgBlHxyeKocJTCC3h9TuNMMr1XbA9bVG9MrupS52h
	JeNRdivHu9lX5bUsCyuam3oOP2BD06o5vgG4Z8wBK5bdCX3UeGOnuUa1/7fH6vFzfOT8=;
Subject: Re: [PATCH v1 12/14] arm/libxl: Emulated PCI device tree node in
 libxl
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <31e48fe4b219ebaf5f1d9f3f7ca9b433caadc5b2.1629366665.git.rahul.singh@arm.com>
 <c0ea2f05-bf0a-a8b0-a811-d899516c26ba@xen.org>
 <664B0578-B440-4229-8D6B-7B98857E75BF@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3e192581-4167-c9aa-2c32-ff0338e9b800@xen.org>
Date: Thu, 9 Sep 2021 14:59:27 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <664B0578-B440-4229-8D6B-7B98857E75BF@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 20/08/2021 17:03, Rahul Singh wrote:
> Hi Julien,

Hi Rahul,

>> On 19 Aug 2021, at 2:00 pm, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Rahul,
>>
>> On 19/08/2021 13:02, Rahul Singh wrote:
>>> libxl will create an emulated PCI device tree node in the device tree to
>>> enable the guest OS to discover the virtual PCI during guest boot.
>>> Emulated PCI device tree node will only be created when there is any
>>> device assigned to guest.
>>> A new area has been reserved in the arm guest physical map at
>>> which the VPCI bus is declared in the device tree (reg and ranges
>>> parameters of the node).
>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>> ---
>>>   tools/libs/light/libxl_arm.c          | 109 ++++++++++++++++++++++++++
>>>   tools/libs/light/libxl_types.idl      |   1 +
>>>   tools/xl/xl_parse.c                   |   2 +
>>>   xen/include/public/arch-arm.h         |  11 +++
>>>   xen/include/public/device_tree_defs.h |   1 +
>>>   5 files changed, 124 insertions(+)
>>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>>> index e3140a6e00..a091e97e76 100644
>>> --- a/tools/libs/light/libxl_arm.c
>>> +++ b/tools/libs/light/libxl_arm.c
>>> @@ -269,6 +269,58 @@ static int fdt_property_regs(libxl__gc *gc, void *fdt,
>>>       return fdt_property(fdt, "reg", regs, sizeof(regs));
>>>   }
>>>   +static int fdt_property_values(libxl__gc *gc, void *fdt,
>>> +        const char *name, unsigned num_cells, ...)
>>> +{
>>> +    uint32_t prop[num_cells];
>>> +    be32 *cells = &prop[0];
>>> +    int i;
>>> +    va_list ap;
>>> +    uint32_t arg;
>>> +
>>> +    va_start(ap, num_cells);
>>> +    for (i = 0 ; i < num_cells; i++) {
>>> +        arg = va_arg(ap, uint32_t);
>>> +        set_cell(&cells, 1, arg);
>>> +    }
>>> +    va_end(ap);
>>> +
>>> +    return fdt_property(fdt, name, prop, sizeof(prop));
>>> +}
>>> +
>>> +static int fdt_property_vpci_ranges(libxl__gc *gc, void *fdt,
>>> +                                    unsigned addr_cells,
>>> +                                    unsigned size_cells,
>>> +                                    unsigned num_regs, ...)
>>> +{
>>> +    uint32_t regs[num_regs*((addr_cells*2)+size_cells+1)];
>>> +    be32 *cells = &regs[0];
>>> +    int i;
>>> +    va_list ap;
>>> +    uint64_t arg;
>>> +
>>> +    va_start(ap, num_regs);
>>> +    for (i = 0 ; i < num_regs; i++) {
>>> +        /* Set the memory bit field */
>>> +        arg = va_arg(ap, uint64_t);
>>> +        set_cell(&cells, 1, arg);
>>> +
>>> +        /* Set the vpci bus address */
>>> +        arg = addr_cells ? va_arg(ap, uint64_t) : 0;
>>> +        set_cell(&cells, addr_cells , arg);
>>> +
>>> +        /* Set the cpu bus address where vpci address is mapped */
>>> +        set_cell(&cells, addr_cells, arg);
>>> +
>>> +        /* Set the vpci size requested */
>>> +        arg = size_cells ? va_arg(ap, uint64_t) : 0;
>>> +        set_cell(&cells, size_cells,arg);
>>> +    }
>>> +    va_end(ap);
>>> +
>>> +    return fdt_property(fdt, "ranges", regs, sizeof(regs));
>>> +}
>>> +
>>>   static int make_root_properties(libxl__gc *gc,
>>>                                   const libxl_version_info *vers,
>>>                                   void *fdt)
>>> @@ -668,6 +720,57 @@ static int make_vpl011_uart_node(libxl__gc *gc, void *fdt,
>>>       return 0;
>>>   }
>>>   +static int make_vpci_node(libxl__gc *gc, void *fdt,
>>> +        const struct arch_info *ainfo,
>>> +        struct xc_dom_image *dom)
>>> +{
>>> +    int res;
>>> +    const uint64_t vpci_ecam_base = GUEST_VPCI_ECAM_BASE;
>>> +    const uint64_t vpci_ecam_size = GUEST_VPCI_ECAM_SIZE;
>>> +    const char *name = GCSPRINTF("pcie@%"PRIx64, vpci_ecam_base);
>>> +
>>> +    res = fdt_begin_node(fdt, name);
>>> +    if (res) return res;
>>> +
>>> +    res = fdt_property_compat(gc, fdt, 1, "pci-host-ecam-generic");
>>> +    if (res) return res;
>>> +
>>> +    res = fdt_property_string(fdt, "device_type", "pci");
>>> +    if (res) return res;
>>> +
>>> +    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
>>> +            GUEST_ROOT_SIZE_CELLS, 1, vpci_ecam_base, vpci_ecam_size);
>>> +    if (res) return res;
>>> +
>>> +    res = fdt_property_values(gc, fdt, "bus-range", 2, 0,17);
>>
>> AFAICT, the "bus-range" is optional. Can you explain why we need it?
> 
> We need it to implement the function pci_ecam_map_bus().

Ok. Then why next question is what does the 17 mean? Is it tie to how we
implement the vPCI in Xen or the region we reserved?

[...]

>>
>>> +
>>>       if (b_info->type != LIBXL_DOMAIN_TYPE_PV)
>>>           return;
>>>   diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
>>> index 3f9fff653a..78b1ddf0b8 100644
>>> --- a/tools/libs/light/libxl_types.idl
>>> +++ b/tools/libs/light/libxl_types.idl
>>> @@ -644,6 +644,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>>>         ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
>>>                                  ("vuart", libxl_vuart_type),
>>> +                               ("vpci", libxl_defbool),
>>
>> Any new addition in the structure should be accompanied with a LIBXL_HAVE_* in the libxl.h header.
> 
> OK.
>>
>>>                                 ])),
>>>       ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
>>>                                 ])),
>>> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
>>> index 17dddb4cd5..ffafbeffb4 100644
>>> --- a/tools/xl/xl_parse.c
>>> +++ b/tools/xl/xl_parse.c
>>> @@ -1497,6 +1497,8 @@ void parse_config_data(const char *config_source,
>>>           }
>>>           if (d_config->num_pcidevs && c_info->type == LIBXL_DOMAIN_TYPE_PV)
>>>               libxl_defbool_set(&b_info->u.pv.e820_host, true);
>>> +        if (d_config->num_pcidevs)
>>> +            libxl_defbool_set(&b_info->arch_arm.vpci, true);
>>>       }
>>>         if (!xlu_cfg_get_list (config, "dtdev", &dtdevs, 0, 0)) {
>>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
>>> index 0a9749e768..01d13e669e 100644
>>> --- a/xen/include/public/arch-arm.h
>>> +++ b/xen/include/public/arch-arm.h
>>> @@ -426,6 +426,17 @@ typedef uint64_t xen_callback_t;
>>>   #define GUEST_VPCI_ECAM_BASE    xen_mk_ullong(0x10000000)
>>>   #define GUEST_VPCI_ECAM_SIZE    xen_mk_ullong(0x10000000)
>>>   +/* PCI-PCIe memory space types */
>>> +#define GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM xen_mk_ullong(0x42000000)
>>> +#define GUEST_VPCI_ADDR_TYPE_MEM          xen_mk_ullong(0x02000000)
>>
>> What the size of those regions?
> 
> Non Prefetch Memory: Size 64 MB start at 512 MB
> Prefetch Memory: Size 128 GB start at 36 GB
>>
>>> +
>>> +/* Guest PCI-PCIe memory space where config space and BAR will be available.*/
>>> +#define GUEST_VPCI_PREFETCH_MEM_ADDR  xen_mk_ullong(0x900000000)
>>> +#define GUEST_VPCI_MEM_ADDR           xen_mk_ullong(0x20000000)
>> So far the memory layout defines the address in ascending order. So please add that after GUEST_RAM_BANK_BASES_*.
> 
> Ok.
>>
>> However, if I am not mistaken that base address you provide will clash with RAM bank 1. It also seem to be pretty high which means that this will not work for 32-bit domain or on CPUs that don't allow offer large IPA bits.
> 
> Yes I also checked that now that it is having clash with RAM bank 1.
> There is unused space is guest memory that we can use for Non Prefetch Memory as per below guest memory map.
> https://gitlab.com/xen-project/fusa/fusa-docs/-/blob/master/high-level/guest-memory-layout-arm.rst
> 
> Proposed value:
> Non Prefetch Memory: Size 64 MB start at 0x22001000
> Prefetch Memory: Size 4 GB start at 4 GB.

The base address looks fine to me. However, the sizes are much smaller 
to what you initially suggested. Would you be able to clarify why the 
smaller sizes are fine?

> 
>>
>> I think we need to start making the guest layout more dynamic. The VPCI memory space would have to go right after the end of the RAM allocated for a given guest.
>>
>>> +
>>> +#define GUEST_VPCI_PREFETCH_MEM_SIZE      xen_mk_ullong(0x2000000000)
>>> +#define GUEST_VPCI_MEM_SIZE               xen_mk_ullong(0x04000000)
>>
>> It would be better if the size for each region is defined right after each base.
> OK.
> 
>>
>> Also, how did you decide the size of each region?
> 
> I thought 64 MB will be sufficient. I think it should be based on number of devices we can assign to the guest.

We don't have to get the size right now. What I am more interested is to 
have a trace about how those values were decided (even if it just saying 
random). This will help to make any decision if in the future we need to 
resize (in particular downsize) the regions.

Cheers,

-- 
Julien Grall

