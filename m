Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 553BA8C3CCF
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 10:00:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720700.1123613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Qaw-0004Sa-0H; Mon, 13 May 2024 07:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720700.1123613; Mon, 13 May 2024 07:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Qav-0004R4-Tn; Mon, 13 May 2024 07:59:37 +0000
Received: by outflank-mailman (input) for mailman id 720700;
 Mon, 13 May 2024 07:59:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vyab=MQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1s6Qav-0004Qy-A3
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 07:59:37 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd652c75-10fe-11ef-909d-e314d9c70b13;
 Mon, 13 May 2024 09:59:35 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a59cf8140d0so919831066b.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 May 2024 00:59:35 -0700 (PDT)
Received: from ?IPV6:2003:e5:873c:a500:6aaf:b7a7:7c29:ae5c?
 (p200300e5873ca5006aafb7a77c29ae5c.dip0.t-ipconnect.de.
 [2003:e5:873c:a500:6aaf:b7a7:7c29:ae5c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b18110sm561472766b.225.2024.05.13.00.59.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 May 2024 00:59:34 -0700 (PDT)
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
X-Inumbo-ID: bd652c75-10fe-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715587175; x=1716191975; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O5smVEjR/VVS0e2yObdThJN4tCbUbbAC8XLh8Tbaot0=;
        b=AzFdcbKB9nDw6Yeg9OkcOoF8Bm9w1PkkPiwNFeUsjnfcecyidgdwSYfgCDRIIo+dhc
         FkIbRiN3U7pC7hGplebff/bOvTlfNB6zubwsbYvvBiXoBHXPvMQhAkAn5QJ0+8KwZqSd
         tVLO40kE+BTD8FGH17G+Bzjc2xzeVVntw/yYeBA9V3KYtrakb5rdztyZ2LZSzAKR7+VS
         DE6wZ3Fh4kD7PTQWOTtQRgtj3m8TdjNHMCVves5cP//emsxLO70usNh95vCR2yxLi79z
         wYGxhcVwD+zXasgzpO/mY3zK+S2a7LXuN3jfYEFEheBgRfgYee92dneFWmwtU+x4VFoB
         05nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715587175; x=1716191975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O5smVEjR/VVS0e2yObdThJN4tCbUbbAC8XLh8Tbaot0=;
        b=hM52k1pZmvBU/YhqoFw+Xg3OFUT7nSc9GzDmdgpBV9J3AJ7FzPNcix5C+03vZ3c6nv
         RR7UN5vIsrfumcURNTXzfl4VRfjuYlUwEgNHteDU0Bk6bBDesjXG+nQodMWl4YngWmgB
         7apL2Dq1cF1f5g0tJDwbt1lwB9Zl8EkbrJv5UtNLI2NJR7fUrxQIe43U9oWnD/mT4x8r
         AFjpKmr2BjBcdNBYALfe6d4TNAe6cr11ne78rVDo/LXBm9pGeBoBs2wqxdSmbxnutRfY
         DWmWcHsO+T+URpeVex4oOQcR9xS2xvRs88DU3Iwg/F0zX2qrX8X9jZ1l3ezsYqO4vLGK
         xxZA==
X-Forwarded-Encrypted: i=1; AJvYcCUbcXod3IaTGc2Qk5Gi5VckdKYmyz9mfBjzeOZLEV7pCY2PEBwRc1HnfRpY6/nReSicLT1HsScecsp9jXBv4HJt7hasEKzO+iTx3lJkiZo=
X-Gm-Message-State: AOJu0YzImLYbHqk0xBPHAtWp78QMOAi/nhAC/0IwzC1599+BuvqftJW4
	yRoi9QiiIe3Jp4k6xF/k82A6Cok3ZxDtaVsXXmhrrqLpTjhqckCUMHTuC7kUhzk=
X-Google-Smtp-Source: AGHT+IFPTr9tpemxyIWdG1g9bjPz3FBmkzUXW4eLPPKVth/o3VbHpxOnuWWpwypLDHy5PoSAIltx2A==
X-Received: by 2002:a17:906:f111:b0:a5a:28cc:ff85 with SMTP id a640c23a62f3a-a5a2d58545amr563789566b.28.1715587175252;
        Mon, 13 May 2024 00:59:35 -0700 (PDT)
Message-ID: <55bbd23b-d851-4274-9511-c5a7af938a07@suse.com>
Date: Mon, 13 May 2024 09:59:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC KERNEL PATCH v6 3/3] xen/privcmd: Add new syscall to get gsi
 from irq
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "Huang, Ray" <Ray.Huang@amd.com>
References: <20240419033616.607889-1-Jiqian.Chen@amd.com>
 <20240419033616.607889-4-Jiqian.Chen@amd.com>
 <79666084-fc2f-4637-8f0b-3846285601b8@suse.com>
 <BL1PR12MB58493D17E23751A06FC931DDE7E72@BL1PR12MB5849.namprd12.prod.outlook.com>
 <BL1PR12MB5849496A5B3148D162787961E7E22@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <BL1PR12MB5849496A5B3148D162787961E7E22@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13.05.24 09:47, Chen, Jiqian wrote:
> Hi,
> On 2024/5/10 17:06, Chen, Jiqian wrote:
>> Hi,
>>
>> On 2024/5/10 14:46, Jürgen Groß wrote:
>>> On 19.04.24 05:36, Jiqian Chen wrote:
>>>> In PVH dom0, it uses the linux local interrupt mechanism,
>>>> when it allocs irq for a gsi, it is dynamic, and follow
>>>> the principle of applying first, distributing first. And
>>>> the irq number is alloced from small to large, but the
>>>> applying gsi number is not, may gsi 38 comes before gsi 28,
>>>> it causes the irq number is not equal with the gsi number.
>>>> And when passthrough a device, QEMU will use device's gsi
>>>> number to do pirq mapping, but the gsi number is got from
>>>> file /sys/bus/pci/devices/<sbdf>/irq, irq!= gsi, so it will
>>>> fail when mapping.
>>>> And in current linux codes, there is no method to translate
>>>> irq to gsi for userspace.
>>>>
>>>> For above purpose, record the relationship of gsi and irq
>>>> when PVH dom0 do acpi_register_gsi_ioapic for devices and
>>>> adds a new syscall into privcmd to let userspace can get
>>>> that translation when they have a need.
>>>>
>>>> Co-developed-by: Huang Rui <ray.huang@amd.com>
>>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>>> ---
>>>>    arch/x86/include/asm/apic.h      |  8 +++++++
>>>>    arch/x86/include/asm/xen/pci.h   |  5 ++++
>>>>    arch/x86/kernel/acpi/boot.c      |  2 +-
>>>>    arch/x86/pci/xen.c               | 21 +++++++++++++++++
>>>>    drivers/xen/events/events_base.c | 39 ++++++++++++++++++++++++++++++++
>>>>    drivers/xen/privcmd.c            | 19 ++++++++++++++++
>>>>    include/uapi/xen/privcmd.h       |  7 ++++++
>>>>    include/xen/events.h             |  5 ++++
>>>>    8 files changed, 105 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
>>>> index 9d159b771dc8..dd4139250895 100644
>>>> --- a/arch/x86/include/asm/apic.h
>>>> +++ b/arch/x86/include/asm/apic.h
>>>> @@ -169,6 +169,9 @@ extern bool apic_needs_pit(void);
>>>>      extern void apic_send_IPI_allbutself(unsigned int vector);
>>>>    +extern int acpi_register_gsi_ioapic(struct device *dev, u32 gsi,
>>>> +                    int trigger, int polarity);
>>>> +
>>>>    #else /* !CONFIG_X86_LOCAL_APIC */
>>>>    static inline void lapic_shutdown(void) { }
>>>>    #define local_apic_timer_c2_ok        1
>>>> @@ -183,6 +186,11 @@ static inline void apic_intr_mode_init(void) { }
>>>>    static inline void lapic_assign_system_vectors(void) { }
>>>>    static inline void lapic_assign_legacy_vector(unsigned int i, bool r) { }
>>>>    static inline bool apic_needs_pit(void) { return true; }
>>>> +static inline int acpi_register_gsi_ioapic(struct device *dev, u32 gsi,
>>>> +                    int trigger, int polarity)
>>>> +{
>>>> +    return (int)gsi;
>>>> +}
>>>>    #endif /* !CONFIG_X86_LOCAL_APIC */
>>>>      #ifdef CONFIG_X86_X2APIC
>>>> diff --git a/arch/x86/include/asm/xen/pci.h b/arch/x86/include/asm/xen/pci.h
>>>> index 9015b888edd6..aa8ded61fc2d 100644
>>>> --- a/arch/x86/include/asm/xen/pci.h
>>>> +++ b/arch/x86/include/asm/xen/pci.h
>>>> @@ -5,6 +5,7 @@
>>>>    #if defined(CONFIG_PCI_XEN)
>>>>    extern int __init pci_xen_init(void);
>>>>    extern int __init pci_xen_hvm_init(void);
>>>> +extern int __init pci_xen_pvh_init(void);
>>>>    #define pci_xen 1
>>>>    #else
>>>>    #define pci_xen 0
>>>> @@ -13,6 +14,10 @@ static inline int pci_xen_hvm_init(void)
>>>>    {
>>>>        return -1;
>>>>    }
>>>> +static inline int pci_xen_pvh_init(void)
>>>> +{
>>>> +    return -1;
>>>> +}
>>>>    #endif
>>>>    #ifdef CONFIG_XEN_PV_DOM0
>>>>    int __init pci_xen_initial_domain(void);
>>>> diff --git a/arch/x86/kernel/acpi/boot.c b/arch/x86/kernel/acpi/boot.c
>>>> index 85a3ce2a3666..72c73458c083 100644
>>>> --- a/arch/x86/kernel/acpi/boot.c
>>>> +++ b/arch/x86/kernel/acpi/boot.c
>>>> @@ -749,7 +749,7 @@ static int acpi_register_gsi_pic(struct device *dev, u32 gsi,
>>>>    }
>>>>      #ifdef CONFIG_X86_LOCAL_APIC
>>>> -static int acpi_register_gsi_ioapic(struct device *dev, u32 gsi,
>>>> +int acpi_register_gsi_ioapic(struct device *dev, u32 gsi,
>>>>                        int trigger, int polarity)
>>>>    {
>>>>        int irq = gsi;
>>>> diff --git a/arch/x86/pci/xen.c b/arch/x86/pci/xen.c
>>>> index 652cd53e77f6..f056ab5c0a06 100644
>>>> --- a/arch/x86/pci/xen.c
>>>> +++ b/arch/x86/pci/xen.c
>>>> @@ -114,6 +114,21 @@ static int acpi_register_gsi_xen_hvm(struct device *dev, u32 gsi,
>>>>                     false /* no mapping of GSI to PIRQ */);
>>>>    }
>>>>    +static int acpi_register_gsi_xen_pvh(struct device *dev, u32 gsi,
>>>> +                    int trigger, int polarity)
>>>> +{
>>>> +    int irq;
>>>> +
>>>> +    irq = acpi_register_gsi_ioapic(dev, gsi, trigger, polarity);
>>>> +    if (irq < 0)
>>>> +        return irq;
>>>> +
>>>> +    if (xen_pvh_add_gsi_irq_map(gsi, irq) == -EEXIST)
>>>> +        printk(KERN_INFO "Already map the GSI :%u and IRQ: %d\n", gsi, irq);
>>>> +
>>>> +    return irq;
>>>> +}
>>>> +
>>>>    #ifdef CONFIG_XEN_PV_DOM0
>>>>    static int xen_register_gsi(u32 gsi, int triggering, int polarity)
>>>>    {
>>>> @@ -558,6 +573,12 @@ int __init pci_xen_hvm_init(void)
>>>>        return 0;
>>>>    }
>>>>    +int __init pci_xen_pvh_init(void)
>>>> +{
>>>> +    __acpi_register_gsi = acpi_register_gsi_xen_pvh;
>>>
>>> No support for unregistering the gsi again?
>> __acpi_unregister_gsi is set in function acpi_set_irq_model_ioapic.
>> Maybe I need to use a new function to call acpi_unregister_gsi_ioapic and remove the mapping of irq and gsi from xen_irq_list_head ?
> When I tried to support unregistering the gsi and removing the mapping during disable device,
> I encountered that after running "xl pci-assignable-add 03:00.0", callstack pcistub_init_device->xen_pcibk_reset_device->pci_disable_device->pcibios_disable_device->acpi_pci_irq_disable->__acpi_unregister_gsi
> removed the mapping, after that when user space called xen_gsi_from_irq to get gsi, it failed.
> 
> To cover above case, I want to change the implementation of xen_gsi_from_irq to pass sbdf to get the gsi instead of passing irq,
> Because the sbdf and gsi of a device is unique and wiil not be changed even device is disabled or re-enabled.
> 
> Do you think this kind of change is acceptable?

Yes, I think so.


Juergen

