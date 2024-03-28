Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE886890891
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 19:50:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699163.1091808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpupD-0006OG-Tv; Thu, 28 Mar 2024 18:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699163.1091808; Thu, 28 Mar 2024 18:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpupD-0006L1-Qy; Thu, 28 Mar 2024 18:50:07 +0000
Received: by outflank-mailman (input) for mailman id 699163;
 Thu, 28 Mar 2024 18:50:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WMz/=LC=eik.bme.hu=balaton@srs-se1.protection.inumbo.net>)
 id 1rpupC-0006Hy-LZ
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 18:50:06 +0000
Received: from zero.eik.bme.hu (zero.eik.bme.hu [2001:738:2001:2001::2001])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd163e97-ed33-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 19:50:04 +0100 (CET)
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CE83F4E6060;
 Thu, 28 Mar 2024 19:50:03 +0100 (CET)
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id 0upp1RZ_X_JD; Thu, 28 Mar 2024 19:50:01 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CC71F4E605E; Thu, 28 Mar 2024 19:50:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C93987456B4;
 Thu, 28 Mar 2024 19:50:01 +0100 (CET)
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
X-Inumbo-ID: fd163e97-ed33-11ee-a1ef-f123f15fe8a2
X-Virus-Scanned: amavisd-new at eik.bme.hu
Date: Thu, 28 Mar 2024 19:50:01 +0100 (CET)
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
Subject: Re: [RFC PATCH-for-9.1 13/29] hw/i386/pc: Remove non-PCI code from
 pc_system_firmware_init()
In-Reply-To: <20240328155439.58719-14-philmd@linaro.org>
Message-ID: <1578f958-8464-f124-3a40-464f932161c4@eik.bme.hu>
References: <20240328155439.58719-1-philmd@linaro.org> <20240328155439.58719-14-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-274745813-1711651801=:36462"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-274745813-1711651801=:36462
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 28 Mar 2024, Philippe Mathieu-Daudé wrote:
> x86_bios_rom_init() is the single non-PCI-machine call
> from pc_system_firmware_init(). Extract it to the caller.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> hw/i386/pc.c       | 6 +++++-
> hw/i386/pc_sysfw.c | 5 +----
> 2 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index f184808e3e..5b96daa414 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -956,7 +956,11 @@ void pc_memory_init(PCMachineState *pcms,
>     }
>
>     /* Initialize PC system firmware */
> -    pc_system_firmware_init(pcms, rom_memory);
> +    if (pci_enabled) {
> +        pc_system_firmware_init(pcms, rom_memory);
> +    } else {
> +        x86_bios_rom_init(machine, "bios.bin", rom_memory, true);
> +    }
>
>     option_rom_mr = g_malloc(sizeof(*option_rom_mr));
>     memory_region_init_ram(option_rom_mr, NULL, "pc.rom", PC_ROM_SIZE,
> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> index 862a082b0a..541dcaef71 100644
> --- a/hw/i386/pc_sysfw.c
> +++ b/hw/i386/pc_sysfw.c
> @@ -202,10 +202,7 @@ void pc_system_firmware_init(PCMachineState *pcms,

Maybe also rename to pc_pci_firmware_init() to make  it clear this is only 
for PCI PC machine now?

Regards,
BALATON Zoltan

>     int i;
>     BlockBackend *pflash_blk[ARRAY_SIZE(pcms->flash)];
>
> -    if (!pc_machine_is_pci_enabled(pcms)) {
> -        x86_bios_rom_init(MACHINE(pcms), "bios.bin", rom_memory, true);
> -        return;
> -    }
> +    assert(pc_machine_is_pci_enabled(pcms));
>
>     /* Map legacy -drive if=pflash to machine properties */
>     for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
>
--3866299591-274745813-1711651801=:36462--

