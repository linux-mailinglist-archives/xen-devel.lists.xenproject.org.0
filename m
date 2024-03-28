Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C4489089F
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 19:52:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699165.1091818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpurP-0007HA-98; Thu, 28 Mar 2024 18:52:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699165.1091818; Thu, 28 Mar 2024 18:52:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpurP-0007EN-6K; Thu, 28 Mar 2024 18:52:23 +0000
Received: by outflank-mailman (input) for mailman id 699165;
 Thu, 28 Mar 2024 18:52:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WMz/=LC=eik.bme.hu=balaton@srs-se1.protection.inumbo.net>)
 id 1rpurN-0007Cq-OE
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 18:52:21 +0000
Received: from zero.eik.bme.hu (zero.eik.bme.hu [152.66.115.2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dec7b6b-ed34-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 19:52:19 +0100 (CET)
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 134EF4E605E;
 Thu, 28 Mar 2024 19:52:19 +0100 (CET)
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id wubAWF9IEmeT; Thu, 28 Mar 2024 19:52:17 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1E0994E6061; Thu, 28 Mar 2024 19:52:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1C0297456B4;
 Thu, 28 Mar 2024 19:52:17 +0100 (CET)
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
X-Inumbo-ID: 4dec7b6b-ed34-11ee-a1ef-f123f15fe8a2
X-Virus-Scanned: amavisd-new at eik.bme.hu
Date: Thu, 28 Mar 2024 19:52:17 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
    Eduardo Habkost <eduardo@habkost.net>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Bernhard Beschow <shentey@gmail.com>, 
    Thomas Huth <thuth@redhat.com>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
    Igor Mammedov <imammedo@redhat.com>, 
    Anthony Perard <anthony.perard@citrix.com>, 
    Ani Sinha <anisinha@redhat.com>
Subject: Re: [RFC PATCH-for-9.1 14/29] hw/i386/pc: Move pc_system_flash_create()
 to pc_pci_machine_initfn()
In-Reply-To: <20240328155439.58719-15-philmd@linaro.org>
Message-ID: <2725fdba-465e-7f74-c354-57b88994a2ed@eik.bme.hu>
References: <20240328155439.58719-1-philmd@linaro.org> <20240328155439.58719-15-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-671172952-1711651937=:36462"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-671172952-1711651937=:36462
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 28 Mar 2024, Philippe Mathieu-Daudé wrote:
> pc_system_flash_create() is only useful for PCI-based machines.
> Move the call to the PCI-based init() handler.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> hw/i386/pc.c       |  2 +-
> hw/i386/pc_sysfw.c | 10 ++++------
> 2 files changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 5b96daa414..33724791fd 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1679,7 +1679,6 @@ static void pc_machine_initfn(Object *obj)
>     pcms->fd_bootchk = true;
>     pcms->default_bus_bypass_iommu = false;
>
> -    pc_system_flash_create(pcms);
>     pcms->pcspk = isa_new(TYPE_PC_SPEAKER);
>     object_property_add_alias(OBJECT(pcms), "pcspk-audiodev",
>                               OBJECT(pcms->pcspk), "audiodev");
> @@ -1694,6 +1693,7 @@ static void pc_pci_machine_initfn(Object *obj)
>
>     ppms->acpi_build_enabled = true;
>
> +    pc_system_flash_create(PC_MACHINE(obj));
>     cxl_machine_init(obj, &ppms->cxl_devices_state);
>
>     ppms->machine_done.notify = pc_pci_machine_done;
> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> index 541dcaef71..167ff24fcb 100644
> --- a/hw/i386/pc_sysfw.c
> +++ b/hw/i386/pc_sysfw.c
> @@ -93,12 +93,10 @@ static PFlashCFI01 *pc_pflash_create(PCMachineState *pcms,
>
> void pc_system_flash_create(PCMachineState *pcms)
> {
> -    if (pc_machine_is_pci_enabled(pcms)) {
> -        pcms->flash[0] = pc_pflash_create(pcms, "system.flash0",
> -                                          "pflash0");
> -        pcms->flash[1] = pc_pflash_create(pcms, "system.flash1",
> -                                          "pflash1");
> -    }
> +    assert(pc_machine_is_pci_enabled(pcms));
> +
> +    pcms->flash[0] = pc_pflash_create(pcms, "system.flash0", "pflash0");
> +    pcms->flash[1] = pc_pflash_create(pcms, "system.flash1", "pflash1");
> }

This could just be inlined as it's called once, then no need for assert 
and a separate function.

Regards,
BALATON Zoltan

>
> void pc_system_flash_cleanup_unused(PCMachineState *pcms)
>
--3866299591-671172952-1711651937=:36462--

