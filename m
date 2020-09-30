Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE0527E42B
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 10:51:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.502.1619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNXpp-0006e4-8H; Wed, 30 Sep 2020 08:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502.1619; Wed, 30 Sep 2020 08:51:37 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNXpp-0006df-4u; Wed, 30 Sep 2020 08:51:37 +0000
Received: by outflank-mailman (input) for mailman id 502;
 Wed, 30 Sep 2020 08:51:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YD0F=DH=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1kNXpn-0006dY-SL
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 08:51:35 +0000
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2247a94c-6688-4ef2-83a4-df444393ce30;
 Wed, 30 Sep 2020 08:51:33 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w5so830284wrp.8
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 01:51:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c4sm1566550wme.27.2020.09.30.01.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 01:51:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A58AD1FF7E;
 Wed, 30 Sep 2020 09:51:30 +0100 (BST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YD0F=DH=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
	id 1kNXpn-0006dY-SL
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 08:51:35 +0000
X-Inumbo-ID: 2247a94c-6688-4ef2-83a4-df444393ce30
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2247a94c-6688-4ef2-83a4-df444393ce30;
	Wed, 30 Sep 2020 08:51:33 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w5so830284wrp.8
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 01:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version:content-transfer-encoding;
        bh=oL+2vXW6jWztE16nGTpxgQzFC1LkU16uie9bO3WhXvA=;
        b=u8HOSWjUYVJnh6YWf/ZVomNqnz6yfFODGFnbuyJm5Uv5SwC0lpu2X6g40su8joD44/
         O44691LOx6jPmPBkmGbbk0LNrBCorSNmC0SMGU7x0hnnWJ+0PjSQtVSJVfsXBPmkHmz5
         wuoJO0FMnuxQivPi10ZAnMMiUMZi4cgt+6cq5w3zwLL3gJ1c3qqP6KyF3neVOO+NewAK
         Yhsrb25K/sevXBe+RqoeoAJqe8X8S8KaJtvEqvfMJkVuGaqTGjB+BrYAq3yRkrds1mE+
         y76MLcn+M+RuD5lyleG1RxmyVBPT3EhJLcfzsGr2aP/Aeh/WvcIhH7McUK/Nu7XpsnnA
         4DzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
        bh=oL+2vXW6jWztE16nGTpxgQzFC1LkU16uie9bO3WhXvA=;
        b=ENCbFhw/ONKvKQc7jc2Ez+rR2SKbwUma6fjUNy/WTR2/k8FszSeR04pWLE0GHAX7Ex
         JEQ0W3N6oSSSCUTtLV7g5HK/xdhLRy1EbvFC9VxOvUR3KWA5jR1t2oc5NMVnVhZGEQna
         SCAqN8k53dALJIwTt2r6Ui086pD3E2vd6iu/1TSim2rv0QD7iUcih29/Fb87vxIDgERP
         yLIPsKrdPAvL6iEMjB9E2axYxeUAqOScTS5NFIkz9ZPplAUyTm2S1OHxnKMmL/Wkp/ge
         E/65afEq1xVI3tPjm3h7tXNIXWbxSkFWwVjJS1VFRy4pO8McQvG7p6TTWDb62xSikPNZ
         0V4A==
X-Gm-Message-State: AOAM533X83rxOQ0KoKKSxZNloKbzFxl3vNOQlYXZtusbzS6QrVPaJkIT
	RHXxQ3NjjPTQTtYtPI6MKqm9aw==
X-Google-Smtp-Source: ABdhPJwpPNUrRkV72KfksCSfWEX8vcPbdgQux9Q+UxzpLoUNa+y7GSv3pCO9FNjF5wZWG8bEZ8NSng==
X-Received: by 2002:a5d:6ac9:: with SMTP id u9mr1842875wrw.46.1601455892308;
        Wed, 30 Sep 2020 01:51:32 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id c4sm1566550wme.27.2020.09.30.01.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 01:51:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A58AD1FF7E;
	Wed, 30 Sep 2020 09:51:30 +0100 (BST)
References: <20200926205542.9261-1-julien@xen.org>
 <87k0wcppnj.fsf@linaro.org> <5afbce1c-0c45-4b8c-771a-f83b91328e4a@xen.org>
 <87d024p9tc.fsf@linaro.org> <d4f86fcf-fe13-5d96-895f-2737300b6628@arm.com>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Andr=C3=A9?= Przywara <andre.przywara@arm.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 masami.hiramatsu@linaro.org, ehem+xen@m5p.com, bertrand.marquis@arm.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
 <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH 0/4] xen/arm: Unbreak ACPI
In-reply-to: <d4f86fcf-fe13-5d96-895f-2737300b6628@arm.com>
Date: Wed, 30 Sep 2020 09:51:30 +0100
Message-ID: <87a6x7przh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Andr=C3=A9 Przywara <andre.przywara@arm.com> writes:

> On 29/09/2020 22:11, Alex Benn=C3=A9e wrote:
>
> Hi,
>
>> Julien Grall <julien@xen.org> writes:
>>=20
>>> Hi Alex,
>>>
>>> On 29/09/2020 16:29, Alex Benn=C3=A9e wrote:
>>>>
>>>> Julien Grall <julien@xen.org> writes:
>>>>
>>>>> From: Julien Grall <jgrall@amazon.com>
>>>>>
>>>>> Hi all,
>>>>>
>>>>> Xen on ARM has been broken for quite a while on ACPI systems. This
>>>>> series aims to fix it.
>>>>>
>>>>> Unfortunately I don't have a system with ACPI v6.0 or later (QEMU see=
ms
>>>>> to only support 5.1).
>
> Does QEMU provide ACPI tables? Or is this actually EDK2 generating
> them?

It certainly does - whether EDK2 mangles them afterwards is another
question. For the -M virt machine we currently generate:

  /* FADT */
  static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
                              VirtMachineState *vms, unsigned dsdt_tbl_offs=
et)
  {
      /* ACPI v5.1 */
      AcpiFadtData fadt =3D {
          .rev =3D 5,
          .minor_ver =3D 1,
          .flags =3D 1 << ACPI_FADT_F_HW_REDUCED_ACPI,
          .xdsdt_tbl_offset =3D &dsdt_tbl_offset,
      };

      switch (vms->psci_conduit) {
      case QEMU_PSCI_CONDUIT_DISABLED:
          fadt.arm_boot_arch =3D 0;
          break;
      case QEMU_PSCI_CONDUIT_HVC:
          fadt.arm_boot_arch =3D ACPI_FADT_ARM_PSCI_COMPLIANT |
                               ACPI_FADT_ARM_PSCI_USE_HVC;
          break;
      case QEMU_PSCI_CONDUIT_SMC:
          fadt.arm_boot_arch =3D ACPI_FADT_ARM_PSCI_COMPLIANT;
          break;
      default:
          g_assert_not_reached();
      }

      build_fadt(table_data, linker, &fadt, NULL, NULL);
  }

Looking through the code it seems we stop around 5.0 - even the new
fancy x86 microvm ACPI tables are described as /* ACPI 5.0: 4.1
Hardware-Reduced ACPI */.

>
>> So I did only some light testing.
>
> So about that v6.0 or later: it seems like the requirement comes from:
> commit 1c9bd43019cd "arm/acpi: Parse FADT table and get PSCI flags":
> "Since STAO table and the GIC version are introduced by ACPI 6.0, we
> will check the version and only parse FADT table with version >=3D 6.0. If
> firmware provides ACPI tables with ACPI version less than 6.0, OS will
> be messed up with those information, so disable ACPI if we get an FADT
> table with version less than 6.0."
>
> STAO (and XENV) have indeed been introduced by ACPI v6.0, but those
> tables are supposed to be *generated* by Xen and handed down to Dom0,
> they will never be provided by firmware (or parsed) by the Xen
> hypervisor. Checking the Linux code it seems to actually not (yet?)
> support the STAO named list, and currently finds and uses the STAO (UART
> block bit) regardless of the FADT version number.
>
> I can't find anything GIC related in the FADT, the whole GIC information
> is described in MADT.

I think we are generating full data for both GIC2 and GIC3:

  /* MADT */
  static void
  build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
  {
      VirtMachineClass *vmc =3D VIRT_MACHINE_GET_CLASS(vms);
      int madt_start =3D table_data->len;
      const MemMapEntry *memmap =3D vms->memmap;
      const int *irqmap =3D vms->irqmap;
      AcpiMadtGenericDistributor *gicd;
      AcpiMadtGenericMsiFrame *gic_msi;
      int i;

      acpi_data_push(table_data, sizeof(AcpiMultipleApicTable));

      gicd =3D acpi_data_push(table_data, sizeof *gicd);
      gicd->type =3D ACPI_APIC_GENERIC_DISTRIBUTOR;
      gicd->length =3D sizeof(*gicd);
      gicd->base_address =3D cpu_to_le64(memmap[VIRT_GIC_DIST].base);
      gicd->version =3D vms->gic_version;

      for (i =3D 0; i < vms->smp_cpus; i++) {
          AcpiMadtGenericCpuInterface *gicc =3D acpi_data_push(table_data,
                                                             sizeof(*gicc));
          ARMCPU *armcpu =3D ARM_CPU(qemu_get_cpu(i));

          gicc->type =3D ACPI_APIC_GENERIC_CPU_INTERFACE;
          gicc->length =3D sizeof(*gicc);
          if (vms->gic_version =3D=3D 2) {
              gicc->base_address =3D cpu_to_le64(memmap[VIRT_GIC_CPU].base);
              gicc->gich_base_address =3D cpu_to_le64(memmap[VIRT_GIC_HYP].=
base);
              gicc->gicv_base_address =3D cpu_to_le64(memmap[VIRT_GIC_VCPU]=
.base);
          }
          gicc->cpu_interface_number =3D cpu_to_le32(i);
          gicc->arm_mpidr =3D cpu_to_le64(armcpu->mp_affinity);
          gicc->uid =3D cpu_to_le32(i);
          gicc->flags =3D cpu_to_le32(ACPI_MADT_GICC_ENABLED);

          if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
              gicc->performance_interrupt =3D cpu_to_le32(PPI(VIRTUAL_PMU_I=
RQ));
          }
          if (vms->virt) {
              gicc->vgic_interrupt =3D cpu_to_le32(PPI(ARCH_GIC_MAINT_IRQ));
          }
      }

      if (vms->gic_version =3D=3D 3) {
          AcpiMadtGenericTranslator *gic_its;
          int nb_redist_regions =3D virt_gicv3_redist_region_count(vms);
          AcpiMadtGenericRedistributor *gicr =3D acpi_data_push(table_data,
                                                           sizeof *gicr);

          gicr->type =3D ACPI_APIC_GENERIC_REDISTRIBUTOR;
          gicr->length =3D sizeof(*gicr);
          gicr->base_address =3D cpu_to_le64(memmap[VIRT_GIC_REDIST].base);
          gicr->range_length =3D cpu_to_le32(memmap[VIRT_GIC_REDIST].size);

          if (nb_redist_regions =3D=3D 2) {
              gicr =3D acpi_data_push(table_data, sizeof(*gicr));
              gicr->type =3D ACPI_APIC_GENERIC_REDISTRIBUTOR;
              gicr->length =3D sizeof(*gicr);
              gicr->base_address =3D
                  cpu_to_le64(memmap[VIRT_HIGH_GIC_REDIST2].base);
              gicr->range_length =3D
                  cpu_to_le32(memmap[VIRT_HIGH_GIC_REDIST2].size);
          }

          if (its_class_name() && !vmc->no_its) {
              gic_its =3D acpi_data_push(table_data, sizeof *gic_its);
              gic_its->type =3D ACPI_APIC_GENERIC_TRANSLATOR;
              gic_its->length =3D sizeof(*gic_its);
              gic_its->translation_id =3D 0;
              gic_its->base_address =3D cpu_to_le64(memmap[VIRT_GIC_ITS].ba=
se);
          }
      } else {
          gic_msi =3D acpi_data_push(table_data, sizeof *gic_msi);
          gic_msi->type =3D ACPI_APIC_GENERIC_MSI_FRAME;
          gic_msi->length =3D sizeof(*gic_msi);
          gic_msi->gic_msi_frame_id =3D 0;
          gic_msi->base_address =3D cpu_to_le64(memmap[VIRT_GIC_V2M].base);
          gic_msi->flags =3D cpu_to_le32(1);
          gic_msi->spi_count =3D cpu_to_le16(NUM_GICV2M_SPIS);
          gic_msi->spi_base =3D cpu_to_le16(irqmap[VIRT_GIC_V2M] + ARM_SPI_=
BASE);
      }

      build_header(linker, table_data,
                   (void *)(table_data->data + madt_start), "APIC",
                   table_data->len - madt_start, 3, NULL, NULL);
  }


>
> Linux/arm64 seems to be happy with ACPI >=3D v5.1:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/a=
rch/arm64/kernel/acpi.c#n148
>
> So can we relax the v6.0 requirement, to be actually >=3D v5.1? That is
> among the first to support ARM anyway, IIRC.
>
> I have only a smattering about ACPI, so happy to stand corrected.

I'd certainly be happy with that as reduces the number of components
that need to be uprevved to get support.

>
> Cheers,
> Andre
>
>>>>
>>>> I was hoping to get more diagnostics out to get it working under QEMU
>>>> TCG so I think must of missed a step:
>>>>
>>>>    Loading Xen 4.15-unstable ...
>>>>    Loading Linux 4.19.0-11-arm64 ...
>>>>    Loading initial ramdisk ...
>>>>    Using modules provided by bootloader in FDT
>>>>    Xen 4.15-unstable (c/s Sat Sep 26 21:55:42 2020 +0100 git:72f3d495d=
0) EFI loader
>>>>    ...silence...
>>>>
>>>> I have a grub installed from testing on a buster base:
>>>>
>>>>    dpkg --status grub-arm64-efi
>>>>    Version: 2.04-8
>>>>
>>>> With:
>>>>
>>>>    GRUB_CMDLINE_LINUX_DEFAULT=3D""
>>>>    GRUB_CMDLINE_LINUX=3D"console=3DttyAMA0"
>>>>    GRUB_CMDLINE_LINUX_XEN_REPLACE=3D"console=3Dhvc0 earlyprintk=3Dxen"
>>>>    GRUB_CMDLINE_XEN=3D"loglvl=3Dall guest_loglvl=3Dall com1=3D115200,8=
n1,0x3e8,5console=3Dcom1,vg"
>>>>
>>>> And I built Xen with --enable-systemd and tweaked the hypervisor .conf=
ig:
>>>>
>>>>    CONFIG_EXPERT=3Dy
>>>>    CONFIG_ACPI=3Dy
>>>>
>>>> So any pointers to make it more verbose would be helpful.
>>>
>>> The error is hapenning before Xen setup the console. You can get early=
=20
>>> output on QEMU if you rebuild Xen with the following .config options:
>>>
>>> CONFIG_DEBUG=3Dy
>>> CONFIG_EARLY_UART_CHOICE_PL011=3Dy
>>> CONFIG_EARLY_UART_PL011=3Dy
>>> CONFIG_EARLY_PRINTK=3Dy
>>> CONFIG_EARLY_UART_BASE_ADDRESS=3D0x09000000
>>> CONFIG_EARLY_UART_PL011_BAUD_RATE=3D0
>>> CONFIG_EARLY_PRINTK_INC=3D"debug-pl011.inc"
>>=20
>> OK I can see it fails on the ACPI and then tries to fall back to FDT and
>> then fails to find the GIC:
>>=20
>>   (XEN) CMDLINE[00000000f7bbe000]:chosen placeholder root=3DUUID=3Dcf00c=
d3a-066b-4146-bedf-f811d3343077 ro console=3Dhvc0 earlyprintk=3Dxen
>>   (XEN)
>>   (XEN) Command line: placeholder loglvl=3Dall guest_loglvl=3Dall com1=
=3D115200,8n1,0x3e8,5console=3Dcom1,vg no-real-mode edd=3Doff
>>   (XEN) parameter "placeholder" unknown!
>>   (XEN) parameter "no-real-mode" unknown!
>>   (XEN) parameter "edd" unknown!
>>   (XEN) ACPI: RSDP 138560000, 0024 (r2 BOCHS )
>>   (XEN) ACPI: XSDT 138550000, 004C (r1 BOCHS  BXPCFACP        1       10=
00013)
>>   (XEN) ACPI: FACP 138510000, 010C (r5 BOCHS  BXPCFACP        1 BXPC    =
    1)
>>   (XEN) ACPI: DSDT 138520000, 14A6 (r2 BOCHS  BXPCDSDT        1 BXPC    =
    1)
>>   (XEN) ACPI: APIC 138500000, 018C (r3 BOCHS  BXPCAPIC        1 BXPC    =
    1)
>>   (XEN) ACPI: GTDT 1384F0000, 0060 (r2 BOCHS  BXPCGTDT        1 BXPC    =
    1)
>>   (XEN) ACPI: MCFG 1384E0000, 003C (r1 BOCHS  BXPCMCFG        1 BXPC    =
    1)
>>   (XEN) ACPI: SPCR 1384D0000, 0050 (r2 BOCHS  BXPCSPCR        1 BXPC    =
    1)
>>   (XEN) Unsupported FADT revision 5.1, should be 6.0+, will disable ACPI
>>   (XEN) acpi_boot_table_init: FADT not found (-22)
>>   (XEN) Domain heap initialised
>>   (XEN) Booting using Device Tree
>>   (XEN) Platform: Generic System
>>   (XEN)
>>   (XEN) ****************************************
>>   (XEN) Panic on CPU 0:
>>   (XEN) Unable to find compatible GIC in the device tree
>>   (XEN) ****************************************
>>   (XEN)
>>   (XEN) Reboot in five seconds...
>>=20
>> Despite saying it is going to reboot it never manages to. Any idea how
>> it is trying to reset the system?
>>=20


--=20
Alex Benn=C3=A9e

