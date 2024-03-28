Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2D389087E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 19:46:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699161.1091799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpul2-00040n-Ew; Thu, 28 Mar 2024 18:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699161.1091799; Thu, 28 Mar 2024 18:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpul2-0003yz-Ay; Thu, 28 Mar 2024 18:45:48 +0000
Received: by outflank-mailman (input) for mailman id 699161;
 Thu, 28 Mar 2024 18:45:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WMz/=LC=eik.bme.hu=balaton@srs-se1.protection.inumbo.net>)
 id 1rpul0-0003xa-DF
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 18:45:46 +0000
Received: from zero.eik.bme.hu (zero.eik.bme.hu [152.66.115.2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61eff8e7-ed33-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 19:45:44 +0100 (CET)
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E86084E6061;
 Thu, 28 Mar 2024 19:45:42 +0100 (CET)
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id E4w3I916cRnf; Thu, 28 Mar 2024 19:45:40 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F0B8B4E605E; Thu, 28 Mar 2024 19:45:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EE2307456B4;
 Thu, 28 Mar 2024 19:45:40 +0100 (CET)
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
X-Inumbo-ID: 61eff8e7-ed33-11ee-a1ef-f123f15fe8a2
X-Virus-Scanned: amavisd-new at eik.bme.hu
Date: Thu, 28 Mar 2024 19:45:40 +0100 (CET)
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
Subject: Re: [RFC PATCH-for-9.1 09/29] hw/i386/pc: Pass PCMachineState argument
 to acpi_setup()
In-Reply-To: <20240328155439.58719-10-philmd@linaro.org>
Message-ID: <04b9fcde-31f1-dfa8-8c4e-a666d0d873d8@eik.bme.hu>
References: <20240328155439.58719-1-philmd@linaro.org> <20240328155439.58719-10-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-534400419-1711651540=:36462"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-534400419-1711651540=:36462
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 28 Mar 2024, Philippe Mathieu-Daudé wrote:
> acpi_setup() caller knows about the machine state, so pass
> it as argument to avoid a qdev_get_machine() call.
>
> We already resolved X86_MACHINE(pcms) as 'x86ms' so use the
> latter.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> hw/i386/acpi-build.h | 3 ++-
> hw/i386/acpi-build.c | 5 ++---
> hw/i386/pc.c         | 2 +-
> 3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/hw/i386/acpi-build.h b/hw/i386/acpi-build.h
> index 0dce155c8c..31de5bddbd 100644
> --- a/hw/i386/acpi-build.h
> +++ b/hw/i386/acpi-build.h
> @@ -2,6 +2,7 @@
> #ifndef HW_I386_ACPI_BUILD_H
> #define HW_I386_ACPI_BUILD_H
> #include "hw/acpi/acpi-defs.h"
> +#include "hw/i386/pc.h"
>
> extern const struct AcpiGenericAddress x86_nvdimm_acpi_dsmio;
>
> @@ -9,7 +10,7 @@ extern const struct AcpiGenericAddress x86_nvdimm_acpi_dsmio;
> #define ACPI_PCIHP_SEJ_BASE 0x8
> #define ACPI_PCIHP_BNMR_BASE 0x10
>
> -void acpi_setup(void);
> +void acpi_setup(PCMachineState *pcms);

This is changed to PcPciMachineState * in a following patch so can't you 
already introduce it here to avoid some churn?

Regards,
BALATON Zoltan

> Object *acpi_get_i386_pci_host(void);
>
> #endif
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 6e8e32e5d2..e702d5e9d2 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2749,9 +2749,8 @@ static const VMStateDescription vmstate_acpi_build = {
>     },
> };
>
> -void acpi_setup(void)
> +void acpi_setup(PCMachineState *pcms)
> {
> -    PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
>     X86MachineState *x86ms = X86_MACHINE(pcms);
>     AcpiBuildTables tables;
>     AcpiBuildState *build_state;
> @@ -2771,7 +2770,7 @@ void acpi_setup(void)
>         return;
>     }
>
> -    if (!x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
> +    if (!x86_machine_is_acpi_enabled(x86ms)) {
>         ACPI_BUILD_DPRINTF("ACPI disabled. Bailing out.\n");
>         return;
>     }
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 6d87d1d4c2..dfc0247bb6 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -601,7 +601,7 @@ void pc_machine_done(Notifier *notifier, void *data)
>     /* set the number of CPUs */
>     x86_rtc_set_cpus_count(x86ms->rtc, x86ms->boot_cpus);
>
> -    acpi_setup();
> +    acpi_setup(pcms);
>     if (x86ms->fw_cfg) {
>         fw_cfg_build_smbios(pcms, x86ms->fw_cfg, pcms->smbios_entry_point_type);
>         fw_cfg_build_feature_control(MACHINE(pcms), x86ms->fw_cfg);
>
--3866299591-534400419-1711651540=:36462--

