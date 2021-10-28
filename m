Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 500A143E1F4
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 15:23:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218032.378309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg5N3-0006id-JQ; Thu, 28 Oct 2021 13:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218032.378309; Thu, 28 Oct 2021 13:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg5N3-0006gr-GC; Thu, 28 Oct 2021 13:23:05 +0000
Received: by outflank-mailman (input) for mailman id 218032;
 Thu, 28 Oct 2021 13:23:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mg5N1-0006gl-CY
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 13:23:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mg5Mz-000878-N6; Thu, 28 Oct 2021 13:23:01 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225] helo=[10.7.236.13])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mg5Mz-00023C-H4; Thu, 28 Oct 2021 13:23:01 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=U9+CneLqA59jMvTf40V/pcb3YWfkkZv+ivMYePhNc/0=; b=QVICLKelAk8FXmNf8cSCuqCgku
	G/us69MO5lkDpSQmKyV29hYaR+1eSUkN7MVkALTdI2HTPdjthHvDYV3H88JmYWgtRl2qXowq7Yx9L
	05kSj1rhKc9oAz62kyqmp2dmwLB+Q0WXIsFg3ETZdA/Z0fmQTbiM5J9giqNOc4SGkbiQ=;
Message-ID: <65886734-7333-4469-fcc1-6916db708f13@xen.org>
Date: Thu, 28 Oct 2021 14:22:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "iwj@xenproject.org" <iwj@xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <20211027082533.1406015-1-andr2000@gmail.com>
 <cb7e9ef7-476e-93c3-d3c9-9a9ebc61003d@xen.org>
 <d63c6e0b-8aa3-9ba3-893c-5e464638a8db@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d63c6e0b-8aa3-9ba3-893c-5e464638a8db@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/10/2021 13:09, Oleksandr Andrushchenko wrote:
> Hi, Julien!

Hello,

> On 27.10.21 20:35, Julien Grall wrote:
>> Hi Oleksandr,
>>
>> On 27/10/2021 09:25, Oleksandr Andrushchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> While in vPCI MMIO trap handlers for the guest PCI host bridge it is not
>>> enough for SBDF translation to simply call VPCI_ECAM_BDF(info->gpa) as
>>> the base address may not be aligned in the way that the translation
>>> always work. If not adjusted with respect to the base address it may not be
>>> able to properly convert SBDF and crashes:
>>>
>>> (XEN) vpci_mmio_read 0000:65:1a.0 reg 8bc gpa e65d08bc
>>
>> I can't find a printk() that may output this message. Where does this comes from?
> That was a debug print. I shouldn't have used that in the patch description, but
> probably after "---" to better explain what's happening
>>
>> Anyway, IIUC the guest physical address is 0xe65d08bc which, if I am not mistaken, doesn't belong to the range advertised for GUEST_VPCI_ECAM.
> This is from dom0 I am working on now.
>>
>> IMHO, the stack trace should come from usptream Xen or need some information to explain how this was reproduced.
>>
>>> (XEN) Data Abort Trap. Syndrome=0x6
>>> (XEN) Walking Hypervisor VA 0x467a28bc on CPU0 via TTBR 0x00000000481d5000
>> I can understnad that if we don't substract GUEST_VPCI_ECAM, we would (in theory) not get the correct BDF. But... I don't understand how this would result to a data abort in the hypervisor.
>>
>> In fact, I think the vPCI code should be resilient enough to not crash if we pass the wrong BDF.
> Well, there is no (?) easy way to validate SBDF.

AFAICT pci_ecam_map_bus() is already doing some validation for the bus 
number. So...

  And this could be a problem if we have a misbehaving
> guest which may force Xen to access the memory beyond that of PCI host bridge
>>
>> When there is a data abort in Xen, you should get a stack trace from where this comes from. Can you paste it here?
> (XEN) Data Abort Trap. Syndrome=0x6
> (XEN) Walking Hypervisor VA 0x467a28bc on CPU0 via TTBR 0x00000000481d5000
> (XEN) 0TH[0x0] = 0x00000000481d4f7f
> (XEN) 1ST[0x1] = 0x00000000481d2f7f
> (XEN) 2ND[0x33] = 0x0000000000000000
> (XEN) CPU0: Unexpected Trap: Data Abort

... I am getting quite confused why this is crashing. Are we validation 
correctly the access?


> (XEN) ----[ Xen-4.16-unstable  arm64  debug=y  Not tainted ]----
> (XEN) CPU:    0
> (XEN) PC:     000000000026d3d4 pci_generic_config_read+0x88/0x9c
> (XEN) LR:     000000000026d36c
> (XEN) SP:     000080007ff97c00
> (XEN) CPSR:   0000000060400249 MODE:64-bit EL2h (Hypervisor, handler)
> (XEN)      X0: 00000000467a28bc  X1: 00000000065d08bc  X2: 00000000000008bc
> (XEN)      X3: 000000000000000c  X4: 000080007ffc6fd0  X5: 0000000000000000
> (XEN)      X6: 0000000000000014  X7: ffff800011a58000  X8: ffff0000225a0380
> (XEN)      X9: 0000000000000000 X10: 0101010101010101 X11: 0000000000000028
> (XEN)     X12: 0101010101010101 X13: 0000000000000020 X14: ffffffffffffffff
> (XEN)     X15: 0000000000000001 X16: ffff800010da6708 X17: 0000000000000020
> (XEN)     X18: 0000000000000002 X19: 0000000000000004 X20: 000080007ff97c5c
> (XEN)     X21: 00000000000008bc X22: 00000000000008bc X23: 0000000000000004
> (XEN)     X24: 0000000000000000 X25: 00000000000008bc X26: 00000000000065d0
> (XEN)     X27: 000080007ffb9010 X28: 0000000000000000  FP: 000080007ff97c00
> (XEN)
> (XEN)   VTCR_EL2: 00000000800a3558
> (XEN)  VTTBR_EL2: 00010000bffba000
> (XEN)
> (XEN)  SCTLR_EL2: 0000000030cd183d
> (XEN)    HCR_EL2: 00000000807c663f
> (XEN)  TTBR0_EL2: 00000000481d5000
> (XEN)
> (XEN)    ESR_EL2: 0000000096000006
> (XEN)  HPFAR_EL2: 0000000000e65d00
> (XEN)    FAR_EL2: 00000000467a28bc
> (XEN)
> [snip]
> (XEN) Xen call trace:
> (XEN)    [<000000000026d3d4>] pci_generic_config_read+0x88/0x9c (PC)
> (XEN)    [<000000000026d36c>] pci_generic_config_read+0x20/0x9c (LR)
> (XEN)    [<000000000026d2c8>] pci-access.c#pci_config_read+0x60/0x84
> (XEN)    [<000000000026d4a8>] pci_conf_read32+0x10/0x18
> (XEN)    [<000000000024dcf8>] vpci.c#vpci_read_hw+0x48/0xb8
> (XEN)    [<000000000024e3e4>] vpci_read+0xac/0x24c
> (XEN)    [<000000000024e934>] vpci_ecam_read+0x78/0xa8
> (XEN)    [<000000000026e368>] vpci.c#vpci_mmio_read+0x44/0x7c
> (XEN)    [<0000000000275054>] try_handle_mmio+0x1ec/0x264
> (XEN)    [<000000000027ea50>] traps.c#do_trap_stage2_abort_guest+0x18c/0x2d8
> (XEN)    [<000000000027f088>] do_trap_guest_sync+0xf0/0x618
> (XEN)    [<0000000000269c58>] entry.o#guest_sync_slowpath+0xa4/0xd4
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) CPU0: Unexpected Trap: Data Abort
> (XEN) ****************************************
> 
>>
>>>
>>> Fix this by adjusting the gpa with respect to the host bridge base address
>>> in a way as it is done for x86.
>>>
>>> Fixes: d59168dc05a5 ("xen/arm: Enable the existing x86 virtual PCI support for ARM")
>>>
>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>> ---
>>>    xen/arch/arm/vpci.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
>>> index 8f40a0dec6d2..23f45386f4b3 100644
>>> --- a/xen/arch/arm/vpci.c
>>> +++ b/xen/arch/arm/vpci.c
>>> @@ -24,7 +24,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>>>        unsigned long data;
>>>          /* We ignore segment part and always handle segment 0 */
>>> -    sbdf.sbdf = VPCI_ECAM_BDF(info->gpa);
>>> +    sbdf.sbdf = VPCI_ECAM_BDF(info->gpa - GUEST_VPCI_ECAM_BASE);
>>
>> Looking at the rest of the rest, it seems that
>>   1) the issue is latent as the bits 0-27 are clear
>>   2) this will need to be modified to take into account dom0.
>>
>> So I would prefer if the base address is passed differently (maybe in priv?) from the start. This will avoid extra modification that you already plan to have in a follow-up series.
> I was thinking about the same, but the future code will use priv for other purpose:
> 
> static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>                             register_t *r, void *p)
> {
>       struct pci_host_bridge *bridge = p;
>       pci_sbdf_t sbdf;
>       /* data is needed to prevent a pointer cast on 32bit */
>       unsigned long data;
> 
>       if ( bridge )
>       {
>           sbdf.sbdf = VPCI_ECAM_BDF(info->gpa - bridge->cfg->phys_addr);
>           sbdf.seg = bridge->segment;
>       }
>       else
>           sbdf.sbdf = VPCI_ECAM_BDF(info->gpa - GUEST_VPCI_ECAM_BASE);

Is it the only place you are doing to use bridge? If so, then I think we 
can simply have a structure that would contain phys_addr and segment.

This would be include in the bridge for dom0 and for guest this could be 
a static global variable for now.

Cheers,

-- 
Julien Grall

