Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3641AA075EE
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 13:42:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868317.1279841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVrr2-00051w-Li; Thu, 09 Jan 2025 12:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868317.1279841; Thu, 09 Jan 2025 12:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVrr2-0004yy-Hs; Thu, 09 Jan 2025 12:41:40 +0000
Received: by outflank-mailman (input) for mailman id 868317;
 Thu, 09 Jan 2025 12:41:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GR/W=UB=bounce.vates.tech=bounce-md_30504962.677fc3ff.v1-6fdcd21ab4f04c64a1ede52008b3a276@srs-se1.protection.inumbo.net>)
 id 1tVrr0-0004yq-Sp
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 12:41:39 +0000
Received: from mail178-22.suw51.mandrillapp.com
 (mail178-22.suw51.mandrillapp.com [198.2.178.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1034bead-ce87-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 13:41:36 +0100 (CET)
Received: from pmta13.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail178-22.suw51.mandrillapp.com (Mailchimp) with ESMTP id
 4YTPYC4nzJzGlsp87
 for <xen-devel@lists.xenproject.org>; Thu,  9 Jan 2025 12:41:35 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 6fdcd21ab4f04c64a1ede52008b3a276; Thu, 09 Jan 2025 12:41:35 +0000
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
X-Inumbo-ID: 1034bead-ce87-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1736426495; x=1736686995;
	bh=kyumva+NQOtk5B+90eZsJXz8lYvexVwZC3S7F5+vdug=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=re8JbPDoC4dZazVzUX/0GJJeACj8aXghXwrIq32kvvkze1zg7csF0NsHYZMTIJLxS
	 SiT4Uk0BYYY9NSH8PyNiJP2gOJ71Y6H+GJfZI2w/2RwCk7crmZLD/BUDnM23vhQAKQ
	 zp60E/kJoz2OOCyFcJahdRKb0K8c5TaJ7TbPF8ei08I2x8Cji5AQNnDKneFGayGg0N
	 iN3+qJA3xDnNYoNJi8THeW5wzwzt0gheSYTlVfZBoXhecv4knm5gnmH9yX19+J7DKu
	 lMAxH4aX9rcTmzWdKNaMyTxl2akKJmoYowORXNGbCJ+wlst6BuBJzkKVhJdITff4ag
	 vbpyZynR+vfeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1736426495; x=1736686995; i=teddy.astie@vates.tech;
	bh=kyumva+NQOtk5B+90eZsJXz8lYvexVwZC3S7F5+vdug=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=z5XvuoxqCNvmWJO+J43oDTczJW4wjHClFrsv1j+Fnk7Sjy+u9gEMH/+KIC/erCA1S
	 brkE4O8a/lVTyCHMeRrsN95vhnooREyiAp/sr6zZIe6ZuQvMGySPn7+K+dmMslUjpi
	 IMtALPjZ6k++XvtL583gCaEjJwhMx0NBmDtLZFwc4c8o9YRDmLQ9WAVP6EKHPEmbrs
	 yc4u9Myzb77zSnDndA/3LA0eGMT8H6FBv9BrNfpAH45YFBISgTkA9WhM96MdvWi0fS
	 t6zzwtL6MS+JO5Bw9MKO9vGipma9IC8QT9E9Sr4LoUbLxkcE85gaL+cL45aIXAUuEE
	 oM38IpJT8NJ2A==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20RFC=20PATCH=20v4=200/5]=20IOMMU=20subsystem=20redesign=20and=20PV-IOMMU=20interface?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1736426493454
Message-Id: <0897deb0-3d57-48a3-8f92-4714ba6d1217@vates.tech>
To: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Lukasz Hawrylko" <lukasz@hawrylko.pl>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, "=?utf-8?Q?Mateusz=20M=C3=B3wka?=" <mateusz.mowka@intel.com>
References: <cover.1730718102.git.teddy.astie@vates.tech> <Z38-y9xR-6C_sARJ@mail-itl> <c0b9fbdb-87db-4f31-8069-0c2d1c4ad4cd@vates.tech> <Z3-8O9opmLfgO5t0@mail-itl>
In-Reply-To: <Z3-8O9opmLfgO5t0@mail-itl>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.6fdcd21ab4f04c64a1ede52008b3a276?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250109:md
Date: Thu, 09 Jan 2025 12:41:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello,

>>> 3. Xen complains on boot about missing endbr64 (surprisingly, it didn't
>>>      exploded):
>>>
>>>       (XEN) alt table ffff82d0404234d8 -> ffff82d040432d82
>>>       (XEN) altcall iommu_get_max_iova+0x11/0x30 dest iommu.c#intel_iommu_get_max_iova has no endbr64
>>>       (XEN) altcall context.c#iommu_reattach_phantom+0x30/0x50 dest iommu.c#intel_iommu_add_devfn has no endbr64
>>>       (XEN) altcall context.c#iommu_detach_phantom+0x25/0x40 dest iommu.c#intel_iommu_remove_devfn has no endbr64
>>>       (XEN) altcall iommu_context_init+0x27/0x40 dest iommu.c#intel_iommu_context_init has no endbr64
>>>       (XEN) altcall iommu_attach_context+0x3c/0xd0 dest iommu.c#intel_iommu_attach has no endbr64
>>>       (XEN) altcall context.c#iommu_attach_context.cold+0x1d/0x53 dest iommu.c#intel_iommu_detach has no endbr64
>>>       (XEN) altcall iommu_detach_context+0x37/0xa0 dest iommu.c#intel_iommu_detach has no endbr64
>>>       (XEN) altcall iommu_reattach_context+0x95/0x240 dest iommu.c#intel_iommu_reattach has no endbr64
>>>       (XEN) altcall context.c#iommu_reattach_context.cold+0x29/0x110 dest iommu.c#intel_iommu_reattach has no endbr64
>>>       (XEN) altcall iommu_context_teardown+0x3f/0xa0 dest iommu.c#intel_iommu_context_teardown has no endbr64
>>>       (XEN) altcall pci.c#deassign_device+0x99/0x270 dest iommu.c#intel_iommu_add_devfn has no endbr64
>>>
>>
>> I also see that, but I am not sure what I need to do to fix it.
> 
> I guess add "cf_check" annotation to functions that are called
> indirectly.
> 

Will add them for v5.

>>> 4. Starting a HVM domU with PCI device fails with:
>>>
>>>       libxl: libxl_pci.c:1552:pci_add_dm_done: Domain 1:xc_assign_device failed: No space left on device
>>>       libxl: libxl_pci.c:1875:device_pci_add_done: Domain 1:libxl__device_pci_add failed for PCI device 0:aa:0.0 (rc -3)
>>>       libxl: libxl_create.c:2061:domcreate_attach_devices: Domain 1:unable to add pci devices
>>>> I didn't change anything in the toolstack - maybe default context needs
>>> to be initialized somehow? But the docs suggest the default context
>>> should work out of the box. On the other hand, changelog for v4 says
>>> some parts are moved to the toolstack, but I don't see any changes in
>>> tools/ in this series...
>>>
>>
>> I only tried stuff inside Dom0, but I haven't really tried passing
>> through a device. I think I missed some step regarding quarantine domain
>> initialization, which is probably why you have "-ENOSPC" here. You can
>> try in the meantime to set "quarantine=0" to disable this part to see if
>> it progresses further.
> 
> That helped a bit. Now domU starts. But device doesn't work - qemu
> complains:
> 
> [2025-01-09 06:52:45] [00:08.0] xen_pt_realize: Real physical device 00:0d.3 registered successfully
> ...
> [2025-01-09 06:52:45] [00:09.0] xen_pt_realize: Real physical device 00:0d.2 registered successfully
> ...
> [2025-01-09 06:52:45] [00:0a.0] xen_pt_realize: Real physical device 00:0d.0 registered successfully
> ...
> [2025-01-09 06:52:59] [00:0a.0] xen_pt_msgctrl_reg_write: setup MSI (register: 87).
> [2025-01-09 06:52:59] [00:0a.0] msi_msix_setup: Error: Mapping of MSI (err: 19, vec: 0x25, entry 0[2025-01-09 06:52:59] x0)
> [2025-01-09 06:52:59] [00:0a.0] xen_pt_msgctrl_reg_write: Warning: Can not map MSI (register: 86)!
> [2025-01-09 06:54:21] [00:08.0] msix_set_enable: disabling MSI-X.
> [2025-01-09 06:54:21] [00:08.0] xen_pt_msixctrl_reg_write: disable MSI-X
> [2025-01-09 06:54:21] [00:09.0] xen_pt_msixctrl_reg_write: enable MSI-X
> [2025-01-09 06:54:21] [00:09.0] msi_msix_setup: Error: Mapping of MSI-X (err: 19, vec: 0xef, entry 0x0)
> [2025-01-09 06:54:21] [00:09.0] msi_msix_setup: Error: Mapping of MSI-X (err: 19, vec: 0xef, entry 0x1)
> [2025-01-09 06:54:21] [00:09.0] msi_msix_setup: Error: Mapping of MSI-X (err: 19, vec: 0xef, entry 0x2)
> [2025-01-09 06:54:21] [00:09.0] msi_msix_setup: Error: Mapping of MSI-X (err: 19, vec: 0xef, entry 0x3)
> [2025-01-09 06:54:21] [00:09.0] msi_msix_setup: Error: Mapping of MSI-X (err: 19, vec: 0xef, entry 0x4)
> [2025-01-09 06:54:21] [00:09.0] msi_msix_setup: Error: Mapping of MSI-X (err: 19, vec: 0xef, entry 0x5)
> [2025-01-09 06:54:21] [00:09.0] msi_msix_setup: Error: Mapping of MSI-X (err: 19, vec: 0xef, entry 0x6)
> [2025-01-09 06:54:21] [00:09.0] msi_msix_setup: Error: Mapping of MSI-X (err: 19, vec: 0xef, entry 0x7)
> [2025-01-09 06:54:21] [00:09.0] msi_msix_setup: Error: Mapping of MSI-X (err: 19, vec: 0xef, entry 0x8)
> [2025-01-09 06:54:21] [00:09.0] msi_msix_setup: Error: Mapping of MSI-X (err: 19, vec: 0xef, entry 0x9)
> [2025-01-09 06:54:21] [00:09.0] msi_msix_setup: Error: Mapping of MSI-X (err: 19, vec: 0xef, entry 0xa)
> [2025-01-09 06:54:21] [00:09.0] msi_msix_setup: Error: Mapping of MSI-X (err: 19, vec: 0xef, entry 0xb)
> 
> and interestingly, Xen says all devices are still in dom0:
> 
> [2025-01-09 06:53:39] (XEN) ==== PCI devices ====
> [2025-01-09 06:53:39] (XEN) ==== segment 0000 ====
> [2025-01-09 06:53:39] (XEN) 0000:aa:00.0 - d0 - node -1
> [2025-01-09 06:53:39] (XEN) 0000:01:00.0 - d0 - node -1  - MSIs < 132 133 134 135 136 >
> [2025-01-09 06:53:39] (XEN) 0000:00:1f.5 - d0 - node -1
> [2025-01-09 06:53:39] (XEN) 0000:00:1f.4 - d0 - node -1
> [2025-01-09 06:53:39] (XEN) 0000:00:1f.3 - d0 - node -1  - MSIs < 139 >
> [2025-01-09 06:53:39] (XEN) 0000:00:1f.0 - d0 - node -1
> [2025-01-09 06:53:39] (XEN) 0000:00:1d.0 - d0 - node -1  - MSIs < 131 >
> [2025-01-09 06:53:39] (XEN) 0000:00:16.0 - d0 - node -1  - MSIs < 138 >
> [2025-01-09 06:53:39] (XEN) 0000:00:15.3 - d0 - node -1
> [2025-01-09 06:53:39] (XEN) 0000:00:15.1 - d0 - node -1
> [2025-01-09 06:53:39] (XEN) 0000:00:15.0 - d0 - node -1
> [2025-01-09 06:53:39] (XEN) 0000:00:14.2 - d0 - node -1
> [2025-01-09 06:53:39] (XEN) 0000:00:14.0 - d0 - node -1
> [2025-01-09 06:53:39] (XEN) 0000:00:12.0 - d0 - node -1
> [2025-01-09 06:53:39] (XEN) 0000:00:0d.3 - d0 - node -1
> [2025-01-09 06:53:39] (XEN) 0000:00:0d.2 - d0 - node -1
> [2025-01-09 06:53:39] (XEN) 0000:00:0d.0 - d0 - node -1
> [2025-01-09 06:53:39] (XEN) 0000:00:0a.0 - d0 - node -1
> [2025-01-09 06:53:39] (XEN) 0000:00:08.0 - d0 - node -1
> [2025-01-09 06:53:39] (XEN) 0000:00:07.3 - d0 - node -1  - MSIs < 130 >
> [2025-01-09 06:53:39] (XEN) 0000:00:07.2 - d0 - node -1  - MSIs < 129 >
> [2025-01-09 06:53:39] (XEN) 0000:00:07.1 - d0 - node -1  - MSIs < 128 >
> [2025-01-09 06:53:39] (XEN) 0000:00:07.0 - d0 - node -1  - MSIs < 127 >
> [2025-01-09 06:53:39] (XEN) 0000:00:06.0 - d0 - node -1  - MSIs < 126 >
> [2025-01-09 06:53:39] (XEN) 0000:00:04.0 - d0 - node -1
> [2025-01-09 06:53:39] (XEN) 0000:00:02.0 - d0 - node -1  - MSIs < 137 >
> [2025-01-09 06:53:39] (XEN) 0000:00:00.0 - d0 - node -1
> 

I checked the PCI passthrough logic, and it looks like some bits are 
missing in my code. While they seem to be set up properly for the IOMMU 
subsystem point of view (DMA remapping at least), their domains 
(pdev->domain) are not updated. I suppose it is what confuses the 
intremap code.

Will do some additional testing with PCI passthrough and plan to fix it 
for v5.

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

