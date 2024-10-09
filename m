Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F21E997588
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 21:23:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815119.1228846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sycGv-0001E5-MW; Wed, 09 Oct 2024 19:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815119.1228846; Wed, 09 Oct 2024 19:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sycGv-0001Bw-Ja; Wed, 09 Oct 2024 19:22:57 +0000
Received: by outflank-mailman (input) for mailman id 815119;
 Wed, 09 Oct 2024 19:22:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gYK=RF=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1sycGu-0001Bq-Ce
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 19:22:56 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1d9ace7-8673-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 21:22:54 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2fad8337aa4so1574671fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 12:22:54 -0700 (PDT)
Received: from [10.17.77.207] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faf9b3b44csm15405821fa.131.2024.10.09.12.22.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 12:22:51 -0700 (PDT)
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
X-Inumbo-ID: e1d9ace7-8673-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728501773; x=1729106573; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GSQLceG9p3QM+OuWGP/6HoAoz3Sdm2qiOw4aD+eOnMc=;
        b=BU1/LqQ9eyTaAdN6nTy5A6HkDCvwTmqeyEKM8Z8u3lGRaMfeGmBAWj1oc0o7uhzzwo
         R5JN9jmVAj8BHyXTlAbzGu4GbvR1tJf+wxFNxlB08RHHZzhSCwOX/AVySVWp9ob+I9Yd
         jqXQjcFj5sfqmdmQl7RDgNVZPz6rhYTfPkiUTKeTDGna+550YpTdyqrUr6JlrrrZKy2E
         4RkRCCY/hODnxDCDoROJDyEcYwpaYq5lbg3Gx6PzfRecckralh5NmaMr5zXRem4TMAum
         rN6jA9KahJ5xj3qVfhbNopCILbnX4bYYnMLWqAtc5cZhJRXXR8ic1JOgktQRq7YeguvG
         AJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728501773; x=1729106573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GSQLceG9p3QM+OuWGP/6HoAoz3Sdm2qiOw4aD+eOnMc=;
        b=bPhuX6H5iTSH1Sca1s820rzwRrHov39YMvQoXaQ0OC4nEaDXEa2VZPWjiA8k1P/ZNC
         vWVrAbT1nw4MqD0v1SgaSAeN1Eo0w95eRKqXSoGrB5AG81PYwa/rnb9QLJop2LHfth5/
         M3quu5eUmkFDJkcQsNSxVINdlgXh2NfPT3CWIM0oQVt01vL5ZtDdGV+Q0tQ/IkLFmwc+
         FdkOwog+6P/JtJ7b0Xd4upEGath9KNuz9la0+jnaQNFHKlpCQ2y4WcVdIivyfwxbrkFh
         K4gqKbZH8e+5+3cdOW9+Hl2h69N2NduDMXTSk2iG5POGA1+Vl/nH2//y/VI8Kae/nGGk
         xcWw==
X-Forwarded-Encrypted: i=1; AJvYcCXHG81kHGL68Q4473Un0wKzoWdcRwfO9XZyXTA1LIPPoZs4mR7716Z0S4jlXAaP2WJsxO6ThHJOCxY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKsA/Pdxb2TNK6MGVG6eLDZY0zHxd2AsybcaFG2AZUu5Jrja6M
	c6EVP/UtzEXmTDSMesmPIM8gp0DKV3cWnIIMxda/XWCS0pMMIgT4
X-Google-Smtp-Source: AGHT+IEay2mED8mMcC7pTrRgQKAWjvKeGxchQ+d9aqdgFUey7WFBtqdmJuYNSmfSBM8Q10KwxkQaww==
X-Received: by 2002:a2e:d01:0:b0:2f3:ee5a:ab8b with SMTP id 38308e7fff4ca-2fb187ce9a2mr21382371fa.43.1728501773007;
        Wed, 09 Oct 2024 12:22:53 -0700 (PDT)
Message-ID: <97b40251-bc72-40c7-9023-67684bd636ca@gmail.com>
Date: Wed, 9 Oct 2024 22:22:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fusa: Add requirements for Device Passthrough
To: Julien Grall <julien@xen.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>,
 Hisao Munakata <hisao.munakata.vt@renesas.com>,
 xen-devel@lists.xenproject.org
References: <20241007185508.3044115-1-olekstysh@gmail.com>
 <1c27b9c0-eb2e-49c2-a94b-d1b8ac6550b1@xen.org>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <1c27b9c0-eb2e-49c2-a94b-d1b8ac6550b1@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 09.10.24 10:26, Julien Grall wrote:
> Hi,

Hello Julien


> 
> On 07/10/2024 19:55, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Add common requirements for a physical device assignment to Arm64
>> and AMD64 PVH domains.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>> Based on:
>> [PATCH] docs: fusa: Replace VM with domain
>> https://patchew.org/Xen/20241007182603.826807-1-ayan.kumar.halder@amd.com/
>> ---
>> ---
>>   .../reqs/design-reqs/common/passthrough.rst   | 365 ++++++++++++++++++
>>   docs/fusa/reqs/index.rst                      |   1 +
>>   docs/fusa/reqs/market-reqs/reqs.rst           |  33 ++
>>   docs/fusa/reqs/product-reqs/common/reqs.rst   |  29 ++
>>   4 files changed, 428 insertions(+)
>>   create mode 100644 docs/fusa/reqs/design-reqs/common/passthrough.rst
>>   create mode 100644 docs/fusa/reqs/product-reqs/common/reqs.rst
>>
>> diff --git a/docs/fusa/reqs/design-reqs/common/passthrough.rst 
>> b/docs/fusa/reqs/design-reqs/common/passthrough.rst
>> new file mode 100644
>> index 0000000000..a1d6676f65
>> --- /dev/null
>> +++ b/docs/fusa/reqs/design-reqs/common/passthrough.rst
>> @@ -0,0 +1,365 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Device Passthrough
>> +==================
>> +
>> +The following are the requirements related to a physical device 
>> assignment
>> +[1], [2] to Arm64 and AMD64 PVH domains.
>> +
>> +Requirements for both Arm64 and AMD64 PVH
>> +=========================================
>> +
>> +Hide IOMMU from a domain
>> +------------------------ > +
>> +`XenSwdgn~passthrough_hide_iommu_from_domain~1`
>> +
>> +Description:
>> +Xen shall not expose the IOMMU device to the domain even if I/O 
>> virtualization
>> +is disabled. The IOMMU shall be under hypervisor control only
> This requirement would prevent us to expose a virtual SMMU to the guest.


Are you talking about assigning stage-1 SMMU to the guest? Yes, that is 
a valid point...


> I think the requirement should only be Xen configures the stage-2 IOMMU.


    ... you are right, as was discussed in separate emails, the 
requirement would be turned into "Xen shall configure the IOMMU at boot 
according to the stage 2 translation tables."

> 
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~device_passthrough~1`
>> +
>> +Discover PCI devices from hardware domain
>> +-----------------------------------------
>> +
>> +`XenSwdgn~passthrough_discover_pci_devices_from_hwdom~1`
>> +
>> +Description:
>> +The hardware domain shall enumerate and discover PCI devices and 
>> inform Xen
>> +about their appearance and disappearance.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~device_passthrough~1`
>> +
>> +Discover PCI devices from Xen
>> +-----------------------------
>> +
>> +`XenSwdgn~passthrough_discover_pci_devices_from_xen~1`
>> +
>> +Description:
>> +Xen shall discover PCI devices (enumerated by the firmware 
>> beforehand) during
>> +boot if the hardware domain is not present.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~device_passthrough~1`
>> +
>> +Assign PCI device to domain (with IOMMU)
>> +----------------------------------------
>> +
>> +`XenSwdgn~passthrough_assign_pci_device_with_iommu~1`
>> +
>> +Description:
>> +Xen shall assign a specified PCI device (always implied as 
>> DMA-capable) to
>> +a domain during its creation using passthrough (partial) device tree 
>> on Arm64
>> +and Hyperlaunch device tree on AMD-x86. The physical device to be 
>> assigned is
>> +protected by the IOMMU.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~device_passthrough~1`
>> +
>> +Deassign PCI device from domain (with IOMMU)
>> +--------------------------------------------
>> +
>> +`XenSwdgn~passthrough_deassign_pci_device_with_iommu~1`
>> +
>> +Description:
>> +Xen shall deassign a specified PCI device from a domain during its 
>> destruction.
>> +The physical device to be deassigned is protected by the IOMMU.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~device_passthrough~1`
>> +
>> +Forbid the same PCI device assignment to multiple domains
>> +---------------------------------------------------------
>> +
>> +`XenSwdgn~passthrough_forbid_same_pci_device_assignment~1`
>> +
>> +Description:
>> +Xen shall not assign the same PCI device to multiple domains by 
>> failing to
>> +create a new domain if the device to be passed through is already 
>> assigned
>> +to the existing domain. Also different PCI devices which share some 
>> resources
>> +(interrupts, IOMMU connections) can be assigned only to the same domain.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~device_passthrough~1`
>> +
>> +Requirements for Arm64 only
>> +===========================
>> +
>> +Assign interrupt-less platform device to domain
>> +-----------------------------------------------
> 
> Why does it need to be "interrupt-less"?


This requirement describes one of the possible cases of platform device.

My answer from another email:

Those devices exist and can be assigned to a domain, they are configured
slightly differently in comparison with devices with interrupts
("xen,path" is not needed for the former), other code paths are executed
in Xen.

**********

There was an intention to keep in separate requirements all relevant 
possible cases that can be done using what the passthrough feature 
provides (let's say all possible combinations of dom0less passthrough 
properties).

This is why the document has, for example, the following special cases:
- Assign interrupt-less platform device to domain
- Assign non-DMA-capable platform device to domain
- Assign DMA-capable platform device to domain (with IOMMU)
- Assign DMA-capable platform device to domain (without IOMMU)
...

Now, as I got from other emails, this scheme is not suited well and 
needs to be reworked.


> 
>> +
>> +`XenSwdgn~passthrough_assign_interrupt_less_platform_device~1`
>> +
>> +Description:
>> +Xen shall assign a specified platform device that has only a MMIO region
>> +(does not have any interrupts) to a domain during its creation using 
>> passthrough
>> +device tree.
> 
> Is this requirement meant to be written from a dom0less point of view? 
> Asking because platform device are assigned using an xl configuration 
> for non-dom0less.

Yes. The more, all requirements in this document imply boot time 
domains. Likely, it should be explicitly stated at the beginning of this 
document.

> 
> 
>> +The example of interrupt-less device is PWM or clock controller.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~device_passthrough~1`
>> +
>> +Deassign interrupt-less platform device from domain
>> +---------------------------------------------------
>> +
>> +`XenSwdgn~passthrough_deassign_interrupt_less_platform_device~1`
>> +
>> +Description:
>> +Xen shall deassign a specified platform device that has only a MMIO 
>> region
>> +(does not have any interrupts) from a domain during its destruction.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~device_passthrough~1`
>> +
>> +Assign non-DMA-capable platform device to domain
>> +------------------------------------------------
>> +
>> +`XenSwdgn~passthrough_assign_non_dma_platform_device~1`
>> +
>> +Description:
>> +Xen shall assign a specified non-DMA-capable platform device to a 
>> domain during
>> +its creation using passthrough device tree.
>> +The example of non-DMA-capable device is Timer.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~device_passthrough~1`
>> +
>> +Deassign non-DMA-capable platform device from domain
>> +----------------------------------------------------
>> +
>> +`XenSwdgn~passthrough_deassign_non_dma_platform_device~1`
>> +
>> +Description:
>> +Xen shall deassign a specified non-DMA-capable platform device from a 
>> domain
>> +during its destruction.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~device_passthrough~1`
>> +
>> +Assign DMA-capable platform device to domain (with IOMMU)
>> +---------------------------------------------------------
>> +
>> +`XenSwdgn~passthrough_assign_dma_platform_device_with_iommu~1`
>> +
>> +Description:
>> +Xen shall assign a specified DMA-capable platform device to a domain 
>> during
>> +its creation using passthrough device tree. The physical device to be 
>> assigned
>> +is protected by the IOMMU.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~device_passthrough~1`
>> +
>> +Deassign DMA-capable platform device from domain (with IOMMU)
>> +-------------------------------------------------------------
>> +
>> +`XenSwdgn~passthrough_deassign_dma_platform_device_with_iommu~1`
>> +
>> +Description:
>> +Xen shall deassign a specified DMA-capable platform device from a 
>> domain during
>> +its destruction. The physical device to be deassigned is protected by 
>> the IOMMU.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~device_passthrough~1`
>> +
>> +Assign DMA-capable platform device to domain (without IOMMU)
>> +------------------------------------------------------------
>> +
>> +`XenSwdgn~passthrough_assign_dma_platform_device_without_iommu~1`
>> +
>> +Description:
>> +Xen shall assign a specified DMA-capable platform device to a domain 
>> during
>> +its creation using passthrough device tree. The physical device to be 
>> assigned
>> +is not protected by the IOMMU.
>> +The DMA-capable device assignment which is not behind an IOMMU is 
>> allowed for
>> +the direct mapped domains only. The direct mapped domain must be 
>> either safe or
> 
> What do you mean by "safe" in the context? Did you intend to say "trusted"?

Yes, trusted, thanks.


> 
>> +additional security mechanisms for protecting against possible 
>> malicious or
>> +buggy DMA devices must be in place, e.g. Xilinx memory protection 
>> unit (XMPU)
>> +and Xilinx peripheral protection unit (XPPU).
>> +
>> +Rationale:
>> +The IOMMU is absent from the system or it is disabled (status = 
>> "disabled"
>> +in the host device tree).
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~device_passthrough~1`
>> +
>> +Deassign DMA-capable platform device from domain (without IOMMU)
>> +----------------------------------------------------------------
> 
> Do we actually need a separate section for deassign assign without the 
> IOMMU? IOW, can this be combined with the deassign with IOMMU?


The point was that on deassigment, Xen additionally detaches the device 
from the IOMMU (if the device is protected by the IOMMU) in comparison 
with the device not protected by the IOMMU, and this needs to be covered 
and tested somehow. Therefore, two separate requirement exist here.

Or do you, perhaps, mean to combine with "Deassign non-DMA-capable 
platform device from domain"? Which could be combined, I think.

> 
>> +
>> +`XenSwdgn~passthrough_deassign_dma_platform_device_without_iommu~1`
>> +
>> +Description:
>> +Xen shall deassign a specified DMA-capable platform device from a 
>> domain during
>> +its destruction. The physical device to be deassigned is not protected
>> +by the IOMMU.
>> +
>> +Rationale:
>> +The IOMMU is absent from the system or it is disabled (status = 
>> "disabled"
>> +in the host device tree).
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~device_passthrough~1`
>> +
>> +Map platform device MMIO region identity
>> +----------------------------------------
> 
> Can you explain why we need to make the distinction between identity 
> mapping and ... >
>> +
>> +`XenSwdgn~passthrough_map_platform_device_mmio_region_ident~1`
>> +
>> +Description:
>> +Xen shall map platform device memory region identity (guest address ==
>> +physical address) when assigning a specified platform device to a 
>> domain.
>> +The device can be either non-DMA-capable or DMA-capable.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~device_passthrough~1`
>> +
>> +Map platform device MMIO region non-identity
>> +--------------------------------------------
> 
> ... non-identity one?

MMIO remapping is also what user can do using passthrough feature, the 
point again was how could we check that it worked if there was no 
requirement covering it.


> 
> Cheers,
> 

