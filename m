Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 115EF6EB26
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 21:36:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoYbR-00021l-2A; Fri, 19 Jul 2019 19:31:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m52c=VQ=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1hoYbP-00021g-F8
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 19:31:35 +0000
X-Inumbo-ID: cefd3a21-aa5b-11e9-8980-bc764e045a96
Received: from mail-qt1-x831.google.com (unknown [2607:f8b0:4864:20::831])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cefd3a21-aa5b-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 19:31:30 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id w17so32194019qto.10
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jul 2019 12:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=6EPI6ReiI8+xfYNjC5oS7Bk7kIo6dz/yP8qGJWx43K4=;
 b=U0NV09/5utYShx0J6cRPv+fhX7iJYUOCM5A5FMmvHzTFkMioaS09joXRwH84raU/sb
 9F6l1NVWQ2ytdRTj/ufiOL/MIYTImcYzFucNm389gJQgVkiKqOaoy+wiTXoOm8yMnq71
 Lm7oK1ba5h0mE1UooM0QUHhEfswPAS/FYzP+quJIpJLb02riog/xoaEKdDE1htFSxxtS
 8KhLoKkq5C6C5DNg7spwFkU/pdxp0bnfcnbLxLVkOHUrCTT8SJyByEM2+5oY9D9/33Oc
 /DQnagen4TsoQalem9uiZSujC/x7j7u3EPihAOHvvg0cyfAjqwW0qmmiE1c9eY5ZyThi
 yc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=6EPI6ReiI8+xfYNjC5oS7Bk7kIo6dz/yP8qGJWx43K4=;
 b=tls87Y9GCLpezuqqYhuKogkXdHAQ6tbqQD2qhMkZNDOiu+GrpT1FvmKVhU32h9x6QL
 ENiVQnz2Y/1zEln6cJIWGok84zjcl1fdt/yzID+I6n0lQrVFmUxU+avxqho/1CkKjJ3I
 5NKGIK64QYFtNfD9d8mREkw6vlwla+6jWK/yBIru5Xi1hA84sGrGpyb7myRWek65g0q+
 t9TFj1AqHS4jbRGg+y/gmoDvJ4N1/SQrvUoc2E6OpfEzOR5YYpQ44y1FYGINa7nKNIH/
 eLGIVbqQ94+r1lzi0cstEQncVvawoZu89Rogh6fZxmjwXjjYQzblAEthtKSPdsSCMx2z
 o8Vw==
X-Gm-Message-State: APjAAAUEEk0obaZNPw5LsUy38p2Y3HUFNFOCb3e2G0csIB8+p00L0h3Y
 M5ANAPOnAw8JnC0qwMDcqKHu0k5BvlKAP9r3qedGKBvVLjlnhA==
X-Google-Smtp-Source: APXvYqw0Ibw5JOYg/VWarjXUw2AeNRpMJJ763LEonkdnGSPa/ASzpAe/7KQCrxzktHoCkuJaoH8mvp8tf8wc4h864Ik=
X-Received: by 2002:aed:3bb5:: with SMTP id r50mr37081744qte.89.1563564688705; 
 Fri, 19 Jul 2019 12:31:28 -0700 (PDT)
MIME-Version: 1.0
From: Roman Shaposhnik <roman@zededa.com>
Date: Fri, 19 Jul 2019 12:31:17 -0700
Message-ID: <CAMmSBy9g-QFHTXhpHK6=xDFiBDj4LpnJ=cXj405MMmA1rJaOUg@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="000000000000dac487058e0dc52e"
Subject: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--000000000000dac487058e0dc52e
Content-Type: text/plain; charset="UTF-8"

Hi!

we're using Xen on Advantech ARK-2250 Embedded Box PC:
    https://www.elmark.com.pl/web/uploaded/karty_produktow/advantech/ark-2250l/ark-2250l_instrukcja-uzytkownika.pdf

After upgrading to Xen 4.12.0 from 4.11.0 we now have to utilize  iommu=no-igfx
workaround as per:
     https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html#iommu

Without the workaround the screen appears to be garbled with colored
static noise and the following message keeps showing up:
(XEN) printk: 26235 messages suppressed.
(XEN) [VT-D]DMAR:[DMA Read] Request device [0000:00:02.0] fault addr
8e43c000, iommu reg = ffff82c00021d000
(XEN) printk: 26303 messages suppressed.
(XEN) [VT-D]DMAR:[DMA Read] Request device [0000:00:02.0] fault addr
8e2c6000, iommu reg = ffff82c00021d000

Once iommu=no-igfx is applied the box can boot fine.

At the end of this email, you can see a full log of the box booting
all the way into Dom0 with iommu=no-igfx applied. I am also attaching
similar log without no-igfx

Please let me know if you need any more information to help us diagnose this.

Thanks,
Roman.

0x0000:0x00:0x02.0x0: ROM: 0x10000 bytes at 0x8968d018
0x0000:0x02:0x00.0x0: ROM: 0x10000 bytes at 0x89640018
0x0000:0x00:0x1f.0x6: ROM: 0x10c00 bytes at 0x8962f018
 Xen 4.12.0
(XEN) Xen version 4.12.0 (@) (gcc (Alpine 6.4.0) 6.4.0) debug=n  Mon
Jun 17 18:50:07 UTC 2019
(XEN) Latest ChangeSet:
(XEN) Bootloader: GRUB 2.03
(XEN) Command line: iommu=no-igfx com1=115200,8n1 console=com1,vga
dom0_mem=1024M,max:1024M dom0_max_vcpus=1 dom0_vcpus_pin smt=false
(XEN) Xen image load base address: 0x88600000
(XEN) Video information:
(XEN)  VGA is graphics mode 1680x1050, 32 bpp
(XEN) Disc information:
(XEN)  Found 0 MBR signatures
(XEN)  Found 1 EDD information structures
(XEN) EFI RAM map:
(XEN)  0000000000000000 - 0000000000058000 (usable)
(XEN)  0000000000058000 - 0000000000059000 (reserved)
(XEN)  0000000000059000 - 000000000009f000 (usable)
(XEN)  000000000009f000 - 00000000000a0000 (reserved)
(XEN)  0000000000100000 - 000000008648a000 (usable)
(XEN)  000000008648a000 - 000000008648b000 (ACPI NVS)
(XEN)  000000008648b000 - 00000000864b5000 (reserved)
(XEN)  00000000864b5000 - 000000008c224000 (usable)
(XEN)  000000008c224000 - 000000008c528000 (reserved)
(XEN)  000000008c528000 - 000000008c736000 (usable)
(XEN)  000000008c736000 - 000000008cea7000 (ACPI NVS)
(XEN)  000000008cea7000 - 000000008d2ff000 (reserved)
(XEN)  000000008d2ff000 - 000000008d300000 (usable)
(XEN)  000000008d300000 - 000000008d400000 (reserved)
(XEN)  00000000e0000000 - 00000000f0000000 (reserved)
(XEN)  00000000fe000000 - 00000000fe011000 (reserved)
(XEN)  00000000fec00000 - 00000000fec01000 (reserved)
(XEN)  00000000fee00000 - 00000000fee01000 (reserved)
(XEN)  00000000ff000000 - 0000000100000000 (reserved)
(XEN)  0000000100000000 - 000000016e000000 (usable)
(XEN) ACPI: RSDP 8CE49000, 0024 (r2 ALASKA)
(XEN) ACPI: XSDT 8CE490A8, 00CC (r1 ALASKA   A M I   1072009 AMI     10013)
(XEN) ACPI: FACP 8CE6C370, 010C (r5 ALASKA   A M I   1072009 AMI     10013)
(XEN) ACPI: DSDT 8CE49208, 23167 (r2 ALASKA   A M I   1072009 INTL 20120913)
(XEN) ACPI: FACS 8CE8EF80, 0040
(XEN) ACPI: APIC 8CE6C480, 0084 (r3 ALASKA   A M I   1072009 AMI     10013)
(XEN) ACPI: FPDT 8CE6C508, 0044 (r1 ALASKA   A M I   1072009 AMI     10013)
(XEN) ACPI: FIDT 8CE6C550, 009C (r1 ALASKA   A M I   1072009 AMI     10013)
(XEN) ACPI: MCFG 8CE6C5F0, 003C (r1 ALASKA   A M I   1072009 MSFT       97)
(XEN) ACPI: HPET 8CE6C630, 0038 (r1 ALASKA   A M I   1072009 AMI.    5000B)
(XEN) ACPI: LPIT 8CE6C668, 0094 (r1 INTEL   SKL-ULT        0 MSFT       5F)
(XEN) ACPI: SSDT 8CE6C700, 0248 (r2 INTEL  sensrhub        0 INTL 20120913)
(XEN) ACPI: SSDT 8CE6C948, 2BAE (r2 INTEL  PtidDevc     1000 INTL 20120913)
(XEN) ACPI: SSDT 8CE6F4F8, 0BE3 (r2 INTEL  Ther_Rvp     1000 INTL 20120913)
(XEN) ACPI: SSDT 8CE700E0, 04A3 (r2 INTEL     zpodd     1000 INTL 20120913)
(XEN) ACPI: DBGP 8CE70588, 0034 (r1 INTEL                  0 MSFT       5F)
(XEN) ACPI: DBG2 8CE705C0, 0054 (r0 INTEL                  0 MSFT       5F)
(XEN) ACPI: SSDT 8CE70618, 06E9 (r2  INTEL xh_rvp07        0 INTL 20120913)
(XEN) ACPI: SSDT 8CE70D08, 547E (r2 SaSsdt  SaSsdt      3000 INTL 20120913)
(XEN) ACPI: UEFI 8CE76188, 0042 (r1                        0             0)
(XEN) ACPI: SSDT 8CE761D0, 0E73 (r2 CpuRef  CpuSsdt     3000 INTL 20120913)
(XEN) ACPI: BGRT 8CE77048, 0038 (r1 ALASKA   A M I   1072009 AMI     10013)
(XEN) ACPI: DMAR 8CE77080, 00A8 (r1 INTEL      SKL         1 INTL        1)
(XEN) ACPI: TPM2 8CE77128, 0034 (r3        Tpm2Tabl        1 AMI         0)
(XEN) ACPI: ASF! 8CE77160, 00A5 (r32 INTEL       HCG        1 TFSM    F4240)
(XEN) System RAM: 4003MB (4099736kB)
(XEN) Domain heap initialised
(XEN) ACPI: 32/64X FACS address mismatch in FADT -
8ce8ef80/0000000000000000, using 32
(XEN) IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
(XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs
(XEN) [VT-D]  RMRR address range 8d800000..8fffffff not in reserved
memory; need "iommu_inclusive_mapping=1"?
(XEN) Switched to APIC driver x2apic_cluster.
(XEN) xstate: size: 0x440 and states: 0x1f
(XEN) Speculative mitigation facilities:
(XEN)   Hardware features:
(XEN)   Compiled-in support: SHADOW_PAGING
(XEN)   Xen settings: BTI-Thunk N/A, SPEC_CTRL: No, Other:
(XEN)   L1TF: believed vulnerable, maxphysaddr L1D 46, CPUID 39, Safe
address 8000000000
(XEN)   Support for HVM VMs: RSB EAGER_FPU
(XEN)   Support for PV VMs: RSB EAGER_FPU
(XEN)   XPTI (64-bit PV only): Dom0 enabled, DomU enabled (with PCID)
(XEN)   PV L1TF shadowing: Dom0 disabled, DomU enabled
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Initializing Credit2 scheduler
(XEN) Platform timer is 23.999MHz HPET
(XEN) Detected 2496.011 MHz processor.
(XEN) Initing memory sharing.
(XEN) Intel VT-d iommu 0 supported page sizes: 4kB, 2MB, 1GB.
(XEN) Intel VT-d iommu 1 supported page sizes: 4kB, 2MB, 1GB.
(XEN) Intel VT-d Snoop Control not enabled.
(XEN) Intel VT-d Dom0 DMA Passthrough not enabled.
(XEN) Intel VT-d Queued Invalidation enabled.
(XEN) Intel VT-d Interrupt Remapping enabled.
(XEN) Intel VT-d Posted Interrupt not enabled.
(XEN) Intel VT-d Shared EPT tables enabled.
(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) Interrupt remapping enabled
(XEN) Enabled directed EOI with ioapic_ack_old on!
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using old ACK method
(XEN) TSC_DEADLINE disabled due to Errata; please update microcode to
version 0xb2 (or later)
(XEN) Allocated console ring of 16 KiB.
(XEN) mwait-idle: max C-state count of 8 reached
(XEN) VMX: Supported advanced features:
(XEN)  - APIC MMIO access virtualisation
(XEN)  - APIC TPR shadow
(XEN)  - Extended Page Tables (EPT)
(XEN)  - Virtual-Processor Identifiers (VPID)
(XEN)  - Virtual NMI
(XEN)  - MSR direct-access bitmap
(XEN)  - Unrestricted Guest
(XEN)  - VMCS shadowing
(XEN)  - VM Functions
(XEN)  - Virtualisation Exceptions
(XEN)  - Page Modification Logging
(XEN) HVM: ASIDs enabled.
(XEN) HVM: VMX enabled
(XEN) HVM: Hardware Assisted Paging (HAP) detected
(XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) mwait-idle: max C-state count of 8 reached
(XEN) mwait-idle: max C-state count of 8 reached
(XEN) mwait-idle: max C-state count of 8 reached
(XEN) Brought up 2 CPUs
(XEN) Dom0 has maximum 312 PIRQs
(XEN)  Xen  kernel: 64-bit, lsb, compat32
(XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x2a2c000
(XEN) PHYSICAL MEMORY ARRANGEMENT:
(XEN)  Dom0 alloc.:   0000000164000000->0000000168000000 (245760 pages
to be allocated)
(XEN) VIRTUAL MEMORY ARRANGEMENT:
(XEN)  Loaded kernel: ffffffff81000000->ffffffff82a2c000
(XEN)  Init. ramdisk: 0000000000000000->0000000000000000
(XEN)  Phys-Mach map: 0000008000000000->0000008000200000
(XEN)  Start info:    ffffffff82a2c000->ffffffff82a2c4b4
(XEN)  Xenstore ring: 0000000000000000->0000000000000000
(XEN)  Console ring:  0000000000000000->0000000000000000
(XEN)  Page tables:   ffffffff82a2d000->ffffffff82a46000
(XEN)  Boot stack:    ffffffff82a46000->ffffffff82a47000
(XEN)  TOTAL:         ffffffff80000000->ffffffff82c00000
(XEN)  ENTRY ADDRESS: ffffffff826aa180
(XEN) Dom0 has maximum 1 VCPUs
(XEN) Bogus DMIBAR 0xfed18001 on 0000:00:00.0
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: Errors and warnings
(XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)
(XEN) Xen is relinquishing VGA console.
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 480kB init memory
mapping kernel into physical memory
about to get started...
[    0.000000] Linux version 4.19.5-linuxkit (root@48efbd0309a6) (gcc
version 6.3.0 (Alpine 6.3.0)) #1 SMP Mon Jun 17 17:43:29 UTC 2019
[    0.000000] Command line: console=hvc0 earlyprintk=xen rootdelay=3
root=PARTUUID=61ff5ba4-aea3-4c21-a11c-b899a6a88def text
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating
point registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is
832 bytes, using 'standard' format.
[    0.000000] Released 0 page(s)
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] Xen: [mem 0x0000000000000000-0x0000000000057fff] usable
[    0.000000] Xen: [mem 0x0000000000058000-0x0000000000058fff] reserved
[    0.000000] Xen: [mem 0x0000000000059000-0x000000000009efff] usable
[    0.000000] Xen: [mem 0x000000000009f000-0x00000000000fffff] reserved
[    0.000000] Xen: [mem 0x0000000000100000-0x0000000040061fff] usable
[    0.000000] Xen: [mem 0x0000000040062000-0x0000000086489fff] unusable
[    0.000000] Xen: [mem 0x000000008648a000-0x000000008648afff] ACPI NVS
[    0.000000] Xen: [mem 0x000000008648b000-0x00000000864b4fff] reserved
[    0.000000] Xen: [mem 0x00000000864b5000-0x000000008c223fff] unusable
[    0.000000] Xen: [mem 0x000000008c224000-0x000000008c527fff] reserved
[    0.000000] Xen: [mem 0x000000008c528000-0x000000008c735fff] unusable
[    0.000000] Xen: [mem 0x000000008c736000-0x000000008cea6fff] ACPI NVS
[    0.000000] Xen: [mem 0x000000008cea7000-0x000000008d2fefff] reserved
[    0.000000] Xen: [mem 0x000000008d2ff000-0x000000008d2fffff] unusable
[    0.000000] Xen: [mem 0x000000008d300000-0x000000008d3fffff] reserved
[    0.000000] Xen: [mem 0x00000000e0000000-0x00000000efffffff] reserved
[    0.000000] Xen: [mem 0x00000000fe000000-0x00000000fe010fff] reserved
[    0.000000] Xen: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
[    0.000000] Xen: [mem 0x00000000fed90000-0x00000000fed91fff] reserved
[    0.000000] Xen: [mem 0x00000000fee00000-0x00000000feefffff] reserved
[    0.000000] Xen: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
[    0.000000] Xen: [mem 0x0000000100000000-0x000000016dffffff] unusable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] efi: EFI v2.40 by American Megatrends
[    0.000000] efi:  ESRT=0x8d29c098  ACPI=0x8ce49000  ACPI
2.0=0x8ce49000  SMBIOS=0xf05e0  SMBIOS 3.0=0xf0600  MPS=0xfc9c0
[    0.000000] SMBIOS 3.0.0 present.
[    0.000000] DMI:  /, BIOS 5.11 06/12/2017
[    0.000000] Hypervisor detected: Xen PV
[    0.000689] tsc: Detected 2496.010 MHz processor
[    0.010540] last_pfn = 0x40062 max_arch_pfn = 0x400000000
[    0.010541] Disabled
[    0.010543] x86/PAT: MTRRs disabled, skipping PAT initialization too.
[    0.010546] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP  UC  UC
[    0.010576] Kernel/User page tables isolation: disabled on XEN PV.
[    0.176019] Secure boot disabled
[    0.176033] ACPI: Early table checksum verification disabled
[    0.176039] ACPI: RSDP 0x000000008CE49000 000024 (v02 ALASKA)
[    0.176048] ACPI: XSDT 0x000000008CE490A8 0000CC (v01 ALASKA A M I
  01072009 AMI  00010013)
[    0.176078] ACPI: FACP 0x000000008CE6C370 00010C (v05 ALASKA A M I
  01072009 AMI  00010013)
[    0.176134] ACPI: DSDT 0x000000008CE49208 023167 (v02 ALASKA A M I
  01072009 INTL 20120913)
[    0.176145] ACPI: FACS 0x000000008CE8EF80 000040
[    0.176157] ACPI: APIC 0x000000008CE6C480 000084 (v03 ALASKA A M I
  01072009 AMI  00010013)
[    0.176168] ACPI: FPDT 0x000000008CE6C508 000044 (v01 ALASKA A M I
  01072009 AMI  00010013)
[    0.176180] ACPI: FIDT 0x000000008CE6C550 00009C (v01 ALASKA A M I
  01072009 AMI  00010013)
[    0.176191] ACPI: MCFG 0x000000008CE6C5F0 00003C (v01 ALASKA A M I
  01072009 MSFT 00000097)
[    0.176203] ACPI: HPET 0x000000008CE6C630 000038 (v01 ALASKA A M I
  01072009 AMI. 0005000B)
[    0.176214] ACPI: LPIT 0x000000008CE6C668 000094 (v01 INTEL
SKL-ULT  00000000 MSFT 0000005F)
[    0.176226] ACPI: SSDT 0x000000008CE6C700 000248 (v02 INTEL
sensrhub 00000000 INTL 20120913)
[    0.176245] ACPI: SSDT 0x000000008CE6C948 002BAE (v02 INTEL
PtidDevc 00001000 INTL 20120913)
[    0.176257] ACPI: SSDT 0x000000008CE6F4F8 000BE3 (v02 INTEL
Ther_Rvp 00001000 INTL 20120913)
[    0.176268] ACPI: SSDT 0x000000008CE700E0 0004A3 (v02 INTEL  zpodd
  00001000 INTL 20120913)
[    0.176280] ACPI: DBGP 0x000000008CE70588 000034 (v01 INTEL
  00000000 MSFT 0000005F)
[    0.176291] ACPI: DBG2 0x000000008CE705C0 000054 (v00 INTEL
  00000000 MSFT 0000005F)
[    0.176303] ACPI: SSDT 0x000000008CE70618 0006E9 (v02 INTEL
xh_rvp07 00000000 INTL 20120913)
[    0.176315] ACPI: SSDT 0x000000008CE70D08 00547E (v02 SaSsdt SaSsdt
  00003000 INTL 20120913)
[    0.176327] ACPI: UEFI 0x000000008CE76188 000042 (v01
  00000000      00000000)
[    0.176338] ACPI: SSDT 0x000000008CE761D0 000E73 (v02 CpuRef
CpuSsdt  00003000 INTL 20120913)
[    0.176350] ACPI: BGRT 0x000000008CE77048 000038 (v01 ALASKA A M I
  01072009 AMI  00010013)
[    0.176362] ACPI: RMAD 0x000000008CE77080 0000A8 (v01 INTEL  SKL
  00000001 INTL 00000001)
[    0.176374] ACPI: TPM2 0x000000008CE77128 000034 (v03
Tpm2Tabl 00000001 AMI  00000000)
[    0.176385] ACPI: ASF! 0x000000008CE77160 0000A5 (v32 INTEL   HCG
  00000001 TFSM 000F4240)
[    0.176416] Setting APIC routing to Xen PV.
[    0.179941] Zone ranges:
[    0.179943]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.179945]   DMA32    [mem 0x0000000001000000-0x0000000040061fff]
[    0.179947]   Normal   empty
[    0.179948] Movable zone start for each node
[    0.179949] Early memory node ranges
[    0.179951]   node   0: [mem 0x0000000000001000-0x0000000000057fff]
[    0.179952]   node   0: [mem 0x0000000000059000-0x000000000009efff]
[    0.179954]   node   0: [mem 0x0000000000100000-0x0000000040061fff]
[    0.180528] Reserved but unavailable: 32769 pages
[    0.180530] Initmem setup node 0 [mem 0x0000000000001000-0x0000000040061fff]
[    0.185470] p2m virtual area at (____ptrval____), size is 40000000
[    0.285486] Remapped 98 page(s)
[    0.285528] Reserving Intel graphics memory at [mem 0x8e000000-0x8fffffff]
[    0.285848] ACPI: PM-Timer IO Port: 0x1808
[    0.285881] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.285883] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.285885] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.285887] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.285929] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
[    0.285938] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.285941] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.285954] Using ACPI (MADT) for SMP configuration information
[    0.285958] ACPI: HPET id: 0x8086a701 base: 0xfed00000
[    0.285980] smpboot: Allowing 4 CPUs, 0 hotplug CPUs
[    0.286001] [mem 0x90000000-0xdfffffff] available for PCI devices
[    0.286005] Booting paravirtualized kernel on Xen
[    0.286006] Xen version: 4.12.0 (preserve-AD)
[    0.286009] clocksource: refined-jiffies: mask: 0xffffffff
max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.400398] random: get_random_bytes called from
start_kernel+0x92/0x4be with crng_init=0
[    0.400407] setup_percpu: NR_CPUS:128 nr_cpumask_bits:128
nr_cpu_ids:4 nr_node_ids:1
[    0.400651] percpu: Embedded 45 pages/cpu @(____ptrval____) s143768
r8192 d32360 u524288
[    0.400710] Built 1 zonelists, mobility grouping on.  Total pages: 258024
[    0.400722] Kernel command line: console=hvc0 earlyprintk=xen
rootdelay=3 root=PARTUUID=61ff5ba4-aea3-4c21-a11c-b899a6a88def text
[    0.400935] Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes)
[    0.400976] Inode-cache hash table entries: 65536 (order: 7, 524288 bytes)
[    0.401125] x2apic disabled
[    0.430609] software IO TLB: mapped [mem 0x3a600000-0x3e600000] (64MB)
[    0.441378] Memory: 930940K/1048572K available (12300K kernel code,
1595K rwdata, 3068K rodata, 1584K init, 1952K bss, 117632K reserved,
0K cma-reserved)
[    0.441440] ftrace: allocating 43497 entries in 170 pages
[    0.458530] rcu: Hierarchical RCU implementation.
[    0.458533] rcu: RCU restricting CPUs from NR_CPUS=128 to nr_cpu_ids=1.
[    0.458534] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1
[    0.461631] Using NULL legacy PIC
[    0.461633] NR_IRQS: 8448, nr_irqs: 256, preallocated irqs: 0
[    0.461649] xen:events: Using FIFO-based ABI
[    0.461818] Console: colour dummy device 80x25
[    0.461995] console [tty0] enabled
[    0.462487] console [hvc0] enabled
[    0.462494] ACPI: Core revision 20180810
[    0.477623] ACPI BIOS Warning (bug): Incorrect checksum in table
[BGRT] - 0x99, should be 0xAF (20180810/tbprint-177)
[    0.477695] clocksource: xen: mask: 0xffffffffffffffff max_cycles:
0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[    0.477716] installing Xen timer for CPU 0
[    0.477801] clocksource: tsc-early: mask: 0xffffffffffffffff
max_cycles: 0x23fa80a809f, max_idle_ns: 440795273818 ns
[    0.477865] Calibrating delay loop (skipped), value calculated
using timer frequency.. 4992.02 BogoMIPS (lpj=24960100)
[    0.477874] pid_max: default: 32768 minimum: 301
[    0.477951] Security Framework initialized
[    0.477956] Yama: becoming mindful.
[    0.477981] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)
[    0.477990] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 bytes)
[    0.478256] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    0.478262] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[    0.478268] Spectre V2 : Vulnerable: Minimal generic ASM retpoline
[    0.478273] Spectre V2 : Spectre v2 / SpectreRSB mitigation:
Filling RSB on context switch
[    0.478279] Speculative Store Bypass: Vulnerable
[    0.527925] Freeing SMP alternatives memory: 24K
[    0.529303] VPMU disabled by hypervisor.
[    0.529471] Performance Events: unsupported p6 CPU model 78 no PMU
driver, software events only.
[    0.529545] rcu: Hierarchical SRCU implementation.
[    0.529706] NMI watchdog: Perf NMI watchdog permanently disabled
[    0.529768] smp: Bringing up secondary CPUs ...
[    0.529773] smp: Brought up 1 node, 1 CPU
[    0.529777] smpboot: Max logical packages: 1
[    0.529942] devtmpfs: initialized
[    0.529996] x86/mm: Memory block size: 128MB
[    0.530398] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.530409] futex hash table entries: 256 (order: 2, 16384 bytes)
[    0.530623] NET: Registered protocol family 16
[    0.530644] xen:grant_table: Grant tables using version 1 layout
[    0.530659] Grant table initialized
[    0.530809] audit: initializing netlink subsys (disabled)
[    0.530908] audit: type=2000 audit(1563563921.812:1):
state=initialized audit_enabled=0 res=1
[    0.531069] ACPI FADT declares the system doesn't support PCIe
ASPM, so disable it
[    0.531077] ACPI: bus type PCI registered
[    0.531203] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem
0xe0000000-0xefffffff] (base 0xe0000000)
[    0.531212] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820
[    0.585062] PCI: Using configuration type 1 for base access
[    0.587021] cryptd: max_cpu_qlen set to 1000
[    0.587137] ACPI: Added _OSI(Module Device)
[    0.587142] ACPI: Added _OSI(Processor Device)
[    0.587147] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.587151] ACPI: Added _OSI(Processor Aggregator Device)
[    0.587156] ACPI: Added _OSI(Linux-Dell-Video)
[    0.587160] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.634267] ACPI: 8 ACPI AML tables successfully acquired and loaded
[    0.640637] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.645652] ACPI: Dynamic OEM Table Load:
[    0.645663] ACPI: SSDT 0xFFFF88803A316000 00037F (v02 PmRef
Cpu0Cst  00003001 INTL 20120913)
[    0.646212] ACPI: Dynamic OEM Table Load:
[    0.646221] ACPI: SSDT 0xFFFF888039811800 00063F (v02 PmRef
Cpu0Ist  00003000 INTL 20120913)
[    0.648440] ACPI: EC: EC started
[    0.648446] ACPI: EC: interrupt blocked
[    0.648501] ACPI: \_SB_.PCI0.LPCB.EC0_: Used as first EC
[    0.648507] ACPI: \_SB_.PCI0.LPCB.EC0_: GPE=0x50,
EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.648513] ACPI: \_SB_.PCI0.LPCB.EC0_: Used as boot DSDT EC to
handle transactions
[    0.648519] ACPI: Interpreter enabled
[    0.648531] ACPI: (supports S0 S5)
[    0.648535] ACPI: Using IOAPIC for interrupt routing
[    0.648582] PCI: Using host bridge windows from ACPI; if necessary,
use "pci=nocrs" and report a bug
[    0.649911] ACPI: Enabled 7 GPEs in block 00 to 7F
[    0.653085] ACPI: Power Resource [PG00] (on)
[    0.653513] ACPI: Power Resource [PG01] (on)
[    0.653972] ACPI: Power Resource [PG02] (on)
[    0.660615] ACPI: Power Resource [WRST] (on)
[    0.661101] ACPI: Power Resource [WRST] (on)
[    0.661544] ACPI: Power Resource [WRST] (on)
[    0.661975] ACPI: Power Resource [WRST] (on)
[    0.662467] ACPI: Power Resource [WRST] (on)
[    0.662901] ACPI: Power Resource [WRST] (on)
[    0.663328] ACPI: Power Resource [WRST] (on)
[    0.663818] ACPI: Power Resource [WRST] (on)
[    0.664249] ACPI: Power Resource [WRST] (on)
[    0.664690] ACPI: Power Resource [WRST] (on)
[    0.665203] ACPI: Power Resource [WRST] (on)
[    0.665634] ACPI: Power Resource [WRST] (on)
[    0.666070] ACPI: Power Resource [WRST] (on)
[    0.666553] ACPI: Power Resource [WRST] (on)
[    0.666979] ACPI: Power Resource [WRST] (on)
[    0.667406] ACPI: Power Resource [WRST] (on)
[    0.667897] ACPI: Power Resource [WRST] (on)
[    0.668338] ACPI: Power Resource [WRST] (on)
[    0.668780] ACPI: Power Resource [WRST] (on)
[    0.669265] ACPI: Power Resource [WRST] (on)
[    0.684236] ACPI: Power Resource [FN00] (off)
[    0.684400] ACPI: Power Resource [FN01] (off)
[    0.684510] ACPI: Power Resource [FN02] (off)
[    0.684616] ACPI: Power Resource [FN03] (off)
[    0.684730] ACPI: Power Resource [FN04] (off)
[    0.686266] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-fe])
[    0.686279] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM
ClockPM Segments MSI]
[    0.689484] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug
SHPCHotplug PME PCIeCapability LTR]
[    0.689492] acpi PNP0A08:00: FADT indicates ASPM is unsupported,
using BIOS configuration
[    0.690190] PCI host bridge to bus 0000:00
[    0.690197] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.690203] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.690208] pci_bus 0000:00: root bus resource [mem
0x000a0000-0x000bffff window]
[    0.690215] pci_bus 0000:00: root bus resource [mem
0x90000000-0xdfffffff window]
[    0.690221] pci_bus 0000:00: root bus resource [mem
0xfd000000-0xfe7fffff window]
[    0.690227] pci_bus 0000:00: root bus resource [bus 00-fe]
(XEN) Bogus DMIBAR 0xfed18001 on 0000:00:00.0
[    0.691006] pci 0000:00:02.0: BAR 2: assigned to efifb
[    0.694276] pci 0000:00:1c.0: Intel SPT PCH root port ACS workaround enabled
[    0.694833] pci 0000:00:1c.5: Intel SPT PCH root port ACS workaround enabled
[    0.698688] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.699418] pci 0000:02:00.0: 2.000 Gb/s available PCIe bandwidth,
limited by 2.5 GT/s x1 link at 0000:00:1c.5 (capable of 7.876 Gb/s
with 8 GT/s x1 link)
[    0.699724] pci 0000:00:1c.5: PCI bridge to [bus 02]
[    0.704143] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.704232] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 *10 11 12 14 15)
[    0.704322] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.704418] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.704507] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.704592] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.704680] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.704768] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.705534] ACPI: EC: interrupt unblocked
[    0.705573] ACPI: EC: event unblocked
[    0.705598] ACPI: \_SB_.PCI0.LPCB.EC0_: GPE=0x50,
EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.705605] ACPI: \_SB_.PCI0.LPCB.EC0_: Used as boot DSDT EC to
handle transactions and events
[    0.705655] xen:balloon: Initialising balloon driver
[    0.705801] SCSI subsystem initialized
[    0.705887] ACPI: bus type USB registered
[    0.705909] usbcore: registered new interface driver usbfs
[    0.705920] usbcore: registered new interface driver hub
[    0.705940] usbcore: registered new device driver usb
[    0.705956] pps_core: LinuxPPS API ver. 1 registered
[    0.705961] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
Rodolfo Giometti <giometti@linux.it>
[    0.705969] PTP clock support registered
[    0.706008] Registered efivars operations
[    0.710766] PCI: Using ACPI for IRQ routing
[    0.748524] NetLabel: Initializing
[    0.748529] NetLabel:  domain hash size = 128
[    0.748533] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.748553] NetLabel:  unlabeled traffic allowed by default
[    0.748718] clocksource: Switched to clocksource tsc-early
[    0.765269] VFS: Disk quotas dquot_6.6.0
[    0.765291] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.765339] FS-Cache: Loaded
[    0.765343] hugetlbfs: disabling because there are no supported
hugepage sizes
[    0.765401] CacheFiles: Loaded
[    0.765415] pnp: PnP ACPI init
[    0.765704] system 00:00: [io  0x0a00-0x0a2f] has been reserved
[    0.766250] Already setup the GSI :4
[    0.768279] system 00:05: [io  0x0200-0x027f] has been reserved
[    0.769079] system 00:06: [io  0x029c-0x029d] has been reserved
[    0.769352] system 00:07: [io  0x0680-0x069f] has been reserved
[    0.769359] system 00:07: [io  0xffff] has been reserved
[    0.769364] system 00:07: [io  0xffff] has been reserved
[    0.769369] system 00:07: [io  0xffff] has been reserved
[    0.769374] system 00:07: [io  0x1800-0x18fe] has been reserved
[    0.769380] system 00:07: [io  0x164e-0x164f] has been reserved
[    0.769579] system 00:09: [io  0x1854-0x1857] has been reserved
[    0.769879] system 00:0a: [mem 0xfed10000-0xfed17fff] has been reserved
[    0.769886] system 00:0a: [mem 0xfed18000-0xfed18fff] has been reserved
[    0.769892] system 00:0a: [mem 0xfed19000-0xfed19fff] has been reserved
[    0.769898] system 00:0a: [mem 0xe0000000-0xefffffff] has been reserved
[    0.769904] system 00:0a: [mem 0xfed20000-0xfed3ffff] has been reserved
[    0.769909] system 00:0a: [mem 0xfed90000-0xfed93fff] could not be reserved
[    0.769915] system 00:0a: [mem 0xfed45000-0xfed8ffff] has been reserved
[    0.769921] system 00:0a: [mem 0xff000000-0xffffffff] has been reserved
[    0.769927] system 00:0a: [mem 0xfee00000-0xfeefffff] has been reserved
[    0.769933] system 00:0a: [mem 0xdffe0000-0xdfffffff] has been reserved
[    0.769988] system 00:0b: [mem 0xfd000000-0xfdabffff] has been reserved
[    0.769995] system 00:0b: [mem 0xfdad0000-0xfdadffff] has been reserved
[    0.770001] system 00:0b: [mem 0xfdb00000-0xfdffffff] has been reserved
[    0.7[    1.491547] Key type encrypted registered
[    1.493473] rtc_cmos 00:08: setting system clock to 2019-07-19
19:18:43 UTC (1563563923)
[    1.494433] Waiting 3 sec before mounting root device...
[    1.700989] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    1.706737] ata1.00: ATA-9: SQF-S25M8-64G-SAC, SAFM02A3, max UDMA/133
[    1.707867] ata1.00: 125045424 sectors, multi 16: LBA48 NCQ (depth 32), AA
[    1.709118] ata1.00: configured for UDMA/133
[    1.710321] scsi 0:0:0:0: Direct-Access     ATA
SQF-S25M8-64G-SA 02A3 PQ: 0 ANSI: 5
[    1.711647] sd 0:0:0:0: [sda] 125045424 512-byte logical blocks:
(64.0 GB/59.6 GiB)
[    1.712791] sd 0:0:0:0: [sda] Write Protect is off
[    1.713976] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    1.715068] sd 0:0:0:0: [sda] Write cache: enabled, read cache:
enabled, doesn't support DPO or FUA
[    1.717800]  sda: sda1 sda2 sda3 sda4 sda9
[    1.719269] sd 0:0:0:0: [sda] Attached SCSI disk
[    1.721673] ata2: SATA link down (SStatus 4 SControl 300)
[    1.737879] usb 1-1: new low-speed USB device number 2 using xhci_hcd
[    1.837912] clocksource: tsc: mask: 0xffffffffffffffff max_cycles:
0x23fa80a809f, max_idle_ns: 440795273818 ns
[    1.839077] clocksource: Switched to clocksource tsc
[    1.928802] input: Logitech USB Keyboard as
/devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.0/0003:046D:C31C.0001/input/input6
[    1.997981] hid-generic 0003:046D:C31C.0001: input: USB HID v1.10
Keyboard [Logitech USB Keyboard] on usb-0000:00:14.0-1/input0
[    2.004853] input: Logitech USB Keyboard Consumer Control as
/devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:046D:C31C.0002/input/input7
[    2.068052] input: Logitech USB Keyboard System Control as
/devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:046D:C31C.0002/input/input8
[    2.069388] hid-generic 0003:046D:C31C.0002: input: USB HID v1.10
Device [Logitech USB Keyboard] on usb-0000:00:14.0-1/input1
[    2.217897] usb 1-7: new full-speed USB device number 3 using xhci_hcd
[    2.399047] random: fast init done
[    4.484487] VFS: Mounted root (squashfs filesystem) readonly on device 8:2.
[    4.487173] Freeing unused kernel image memory: 1584K
[    4.507975] Write protecting the kernel read-only data: 18432k
[    4.516183] Freeing unused kernel image memory: 2020K
[    4.517742] Freeing unused kernel image memory: 1028K
[    4.518785] Run /sbin/init as init process
[    5.129834] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[    5.130918] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    5.132125] Already setup the GSI :16
[    5.133307] e1000e 0000:00:1f.6: Interrupt Throttling Rate
(ints/sec) set to dynamic conservative mode
[    5.234464] e1000e 0000:00:1f.6 0000:00:1f.6 (uninitialized):
registered PHC clock
[    5.326539] e1000e 0000:00:1f.6 eth0: (PCI Express:2.5GT/s:Width
x1) 00:0b:ab:e4:d0:c5
[    5.327674] e1000e 0000:00:1f.6 eth0: Intel(R) PRO/1000 Network Connection
[    5.330518] e1000e 0000:00:1f.6 eth0: MAC: 12, PHY: 12, PBA No: FFFFFF-0FF
[    5.362049] cfg80211: Loading compiled-in X.509 certificates for
regulatory database
[    5.371724] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    5.372933] platform regulatory.0: Direct firmware load for
regulatory.db failed with error -2
[    5.374112] cfg80211: failed to load regulatory.db
[    5.424847] rtl8723be 0000:01:00.0: enabling device (0000 -> 0003)
[    5.426136] Already setup the GSI :18
[    5.459064] rtl8723be: Using firmware rtlwifi/rtl8723befw_36.bin
[    5.462917] rtlwifi: rtlwifi: wireless switch is on
[    5.481131] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.4.0-k
[    5.482341] igb: Copyright (c) 2007-2014 Intel Corporation.
[    5.483648] Already setup the GSI :17
[    5.514869] pps pps0: new PPS source ptp1
[    5.516458] igb 0000:02:00.0: added PHC on eth1
[    5.517974] igb 0000:02:00.0: Intel(R) Gigabit Ethernet Network Connection
[    5.519441] igb 0000:02:00.0: eth1: (PCIe:2.5Gb/s:Width x1) 00:0b:ab:e4:d0:c6
[    5.520701] igb 0000:02:00.0: eth1: PBA No: 000200-000
[    5.521831] igb 0000:02:00.0: Using MSI-X interrupts. 1 rx
queue(s), 1 tx queue(s)
................   ..............   ................
 ................   ............   ................
              ....    .........   ....
    ................   .......   ................
     ................   .....   ................
                    ...   .   ....
        ................     ................
          ...............   ................

              Edge Virtualization Engine
Take a look around and don't forget to use eve(1).
login[518]: root login on 'hvc0'
linuxkit-000babe4d0c5:~#
[    6.069552] IPVS: ftp: loaded support on port[0] = 21
[    6.158121] FAT-fs (sda4): utf8 is not a recommended IO charset for
FAT filesystems, filesystem will be case sensitive!
[    6.163850] FAT-fs (sda4): Volume was not properly unmounted. Some
data may be corrupt. Please run fsck.
[    6.222733] IPVS: ftp: loaded support on port[0] = 21
[    6.261491] random: crng init done
2019/07/19 19:18:48 Wrote 1000 bytes of entropy, exiting as oneshot
[    8.572992] usbcore: registered new interface driver qcserial
[    8.574283] usbserial: USB Serial support registered for Qualcomm USB modem
[    8.586813] usbcore: registered new interface driver cdc_wdm
[    8.593148] usbcore: registered new interface driver qmi_wwan
[    8.823492] EXT4-fs (sda9): mounting ext3 file system using the
ext4 subsystem
[    8.834988] EXT4-fs (sda9): mounted filesystem with ordered data
mode. Opts: (null)

linuxkit-000babe4d0c5:~# eve enter
/ # xl info
host                   : linuxkit-000babe4d0c5
release                : 4.19.5-linuxkit
version                : #1 SMP Mon Jun 17 17:43:29 UTC 2019
machine                : x86_64
nr_cpus                : 2
max_cpu_id             : 3
nr_nodes               : 1
cores_per_socket       : 2
threads_per_core       : 1
cpu_mhz                : 2496.011
hw_caps                :
bfebfbff:76faf3ff:2c100800:00000121:0000000f:009c6fbf:00000000:00000100
virt_caps              : pv hvm hvm_directio pv_directio
total_memory           : 4003
free_memory            : 2912
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 12
xen_extra              : .0
xen_version            : 4.12.0
xen_caps               : xen-3.0-x86_64 xen-3.0-x86_32p hvm-3.0-x86_32
hvm-3.0-x86_32p hvm-3.0-x86_64
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=0xffff800000000000
xen_changeset          :
xen_commandline        : iommu=no-igfx com1=115200,8n1
console=com1,vga dom0_mem=1024M,max:1024M dom0_max_vcpus=1
dom0_vcpus_pin smt=false
cc_compiler            : gcc (Alpine 6.4.0) 6.4.0
cc_compile_by          :
cc_compile_domain      :
cc_compile_date        : Mon Jun 17 18:50:07 UTC 2019
build_id               : 00f4459480dee2ae1aab93918bb20f4b9719364b
xend_config_format     : 4

--000000000000dac487058e0dc52e
Content-Type: text/plain; charset="US-ASCII"; name="boot_without_workaround.txt"
Content-Disposition: attachment; filename="boot_without_workaround.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_jyai0mrn0>
X-Attachment-Id: f_jyai0mrn0

IFhlbiA0LjEyLjAKKFhFTikgWGVuIHZlcnNpb24gNC4xMi4wIChAKSAoZ2NjIChBbHBpbmUgNi40
LjApIDYuNC4wKSBkZWJ1Zz1uICBNb24gSnVuIDE3IDE4OjUwOjA3IFVUQyAyMDE5CihYRU4pIExh
dGVzdCBDaGFuZ2VTZXQ6CihYRU4pIEJvb3Rsb2FkZXI6IEdSVUIgMi4wMwooWEVOKSBDb21tYW5k
IGxpbmU6IGNvbTE9MTE1MjAwLDhuMSBjb25zb2xlPWNvbTEgZG9tMF9tZW09MTAyNE0sbWF4OjEw
MjRNIGRvbTBfbWF4X3ZjcHVzPTEgZG9tMF92Y3B1c19waW4gc210PWZhbHNlCihYRU4pIFhlbiBp
bWFnZSBsb2FkIGJhc2UgYWRkcmVzczogMHg4ODYwMDAwMAooWEVOKSBWaWRlbyBpbmZvcm1hdGlv
bjoKKFhFTikgIFZHQSBpcyBncmFwaGljcyBtb2RlIDE2ODB4MTA1MCwgMzIgYnBwCihYRU4pIERp
c2MgaW5mb3JtYXRpb246CihYRU4pICBGb3VuZCAwIE1CUiBzaWduYXR1cmVzCihYRU4pICBGb3Vu
ZCAxIEVERCBpbmZvcm1hdGlvbiBzdHJ1Y3R1cmVzCihYRU4pIEVGSSBSQU0gbWFwOgooWEVOKSAg
MDAwMDAwMDAwMDAwMDAwMCAtIDAwMDAwMDAwMDAwNTgwMDAgKHVzYWJsZSkKKFhFTikgIDAwMDAw
MDAwMDAwNTgwMDAgLSAwMDAwMDAwMDAwMDU5MDAwIChyZXNlcnZlZCkKKFhFTikgIDAwMDAwMDAw
MDAwNTkwMDAgLSAwMDAwMDAwMDAwMDlmMDAwICh1c2FibGUpCihYRU4pICAwMDAwMDAwMDAwMDlm
MDAwIC0gMDAwMDAwMDAwMDBhMDAwMCAocmVzZXJ2ZWQpCihYRU4pICAwMDAwMDAwMDAwMTAwMDAw
IC0gMDAwMDAwMDA4NjQ4YTAwMCAodXNhYmxlKQooWEVOKSAgMDAwMDAwMDA4NjQ4YTAwMCAtIDAw
MDAwMDAwODY0OGIwMDAgKEFDUEkgTlZTKQooWEVOKSAgMDAwMDAwMDA4NjQ4YjAwMCAtIDAwMDAw
MDAwODY0YjUwMDAgKHJlc2VydmVkKQooWEVOKSAgMDAwMDAwMDA4NjRiNTAwMCAtIDAwMDAwMDAw
OGMyMjQwMDAgKHVzYWJsZSkKKFhFTikgIDAwMDAwMDAwOGMyMjQwMDAgLSAwMDAwMDAwMDhjNTI4
MDAwIChyZXNlcnZlZCkKKFhFTikgIDAwMDAwMDAwOGM1MjgwMDAgLSAwMDAwMDAwMDhjNzM2MDAw
ICh1c2FibGUpCihYRU4pICAwMDAwMDAwMDhjNzM2MDAwIC0gMDAwMDAwMDA4Y2VhNzAwMCAoQUNQ
SSBOVlMpCihYRU4pICAwMDAwMDAwMDhjZWE3MDAwIC0gMDAwMDAwMDA4ZDJmZjAwMCAocmVzZXJ2
ZWQpCihYRU4pICAwMDAwMDAwMDhkMmZmMDAwIC0gMDAwMDAwMDA4ZDMwMDAwMCAodXNhYmxlKQoo
WEVOKSAgMDAwMDAwMDA4ZDMwMDAwMCAtIDAwMDAwMDAwOGQ0MDAwMDAgKHJlc2VydmVkKQooWEVO
KSAgMDAwMDAwMDBlMDAwMDAwMCAtIDAwMDAwMDAwZjAwMDAwMDAgKHJlc2VydmVkKQooWEVOKSAg
MDAwMDAwMDBmZTAwMDAwMCAtIDAwMDAwMDAwZmUwMTEwMDAgKHJlc2VydmVkKQooWEVOKSAgMDAw
MDAwMDBmZWMwMDAwMCAtIDAwMDAwMDAwZmVjMDEwMDAgKHJlc2VydmVkKQooWEVOKSAgMDAwMDAw
MDBmZWUwMDAwMCAtIDAwMDAwMDAwZmVlMDEwMDAgKHJlc2VydmVkKQooWEVOKSAgMDAwMDAwMDBm
ZjAwMDAwMCAtIDAwMDAwMDAxMDAwMDAwMDAgKHJlc2VydmVkKQooWEVOKSAgMDAwMDAwMDEwMDAw
MDAwMCAtIDAwMDAwMDAxNmUwMDAwMDAgKHVzYWJsZSkKKFhFTikgQUNQSTogUlNEUCA4Q0U0OTAw
MCwgMDAyNCAocjIgQUxBU0tBKQooWEVOKSBBQ1BJOiBYU0RUIDhDRTQ5MEE4LCAwMENDIChyMSBB
TEFTS0EgICBBIE0gSSAgIDEwNzIwMDkgQU1JICAgICAxMDAxMykKKFhFTikgQUNQSTogRkFDUCA4
Q0U2QzM3MCwgMDEwQyAocjUgQUxBU0tBICAgQSBNIEkgICAxMDcyMDA5IEFNSSAgICAgMTAwMTMp
CihYRU4pIEFDUEk6IERTRFQgOENFNDkyMDgsIDIzMTY3IChyMiBBTEFTS0EgICBBIE0gSSAgIDEw
NzIwMDkgSU5UTCAyMDEyMDkxMykKKFhFTikgQUNQSTogRkFDUyA4Q0U4RUY4MCwgMDA0MAooWEVO
KSBBQ1BJOiBBUElDIDhDRTZDNDgwLCAwMDg0IChyMyBBTEFTS0EgICBBIE0gSSAgIDEwNzIwMDkg
QU1JICAgICAxMDAxMykKKFhFTikgQUNQSTogRlBEVCA4Q0U2QzUwOCwgMDA0NCAocjEgQUxBU0tB
ICAgQSBNIEkgICAxMDcyMDA5IEFNSSAgICAgMTAwMTMpCihYRU4pIEFDUEk6IEZJRFQgOENFNkM1
NTAsIDAwOUMgKHIxIEFMQVNLQSAgIEEgTSBJICAgMTA3MjAwOSBBTUkgICAgIDEwMDEzKQooWEVO
KSBBQ1BJOiBNQ0ZHIDhDRTZDNUYwLCAwMDNDIChyMSBBTEFTS0EgICBBIE0gSSAgIDEwNzIwMDkg
TVNGVCAgICAgICA5NykKKFhFTikgQUNQSTogSFBFVCA4Q0U2QzYzMCwgMDAzOCAocjEgQUxBU0tB
ICAgQSBNIEkgICAxMDcyMDA5IEFNSS4gICAgNTAwMEIpCihYRU4pIEFDUEk6IExQSVQgOENFNkM2
NjgsIDAwOTQgKHIxIElOVEVMICAgU0tMLVVMVCAgICAgICAgMCBNU0ZUICAgICAgIDVGKQooWEVO
KSBBQ1BJOiBTU0RUIDhDRTZDNzAwLCAwMjQ4IChyMiBJTlRFTCAgc2Vuc3JodWIgICAgICAgIDAg
SU5UTCAyMDEyMDkxMykKKFhFTikgQUNQSTogU1NEVCA4Q0U2Qzk0OCwgMkJBRSAocjIgSU5URUwg
IFB0aWREZXZjICAgICAxMDAwIElOVEwgMjAxMjA5MTMpCihYRU4pIEFDUEk6IFNTRFQgOENFNkY0
RjgsIDBCRTMgKHIyIElOVEVMICBUaGVyX1J2cCAgICAgMTAwMCBJTlRMIDIwMTIwOTEzKQooWEVO
KSBBQ1BJOiBTU0RUIDhDRTcwMEUwLCAwNEEzIChyMiBJTlRFTCAgICAgenBvZGQgICAgIDEwMDAg
SU5UTCAyMDEyMDkxMykKKFhFTikgQUNQSTogREJHUCA4Q0U3MDU4OCwgMDAzNCAocjEgSU5URUwg
ICAgICAgICAgICAgICAgICAwIE1TRlQgICAgICAgNUYpCihYRU4pIEFDUEk6IERCRzIgOENFNzA1
QzAsIDAwNTQgKHIwIElOVEVMICAgICAgICAgICAgICAgICAgMCBNU0ZUICAgICAgIDVGKQooWEVO
KSBBQ1BJOiBTU0RUIDhDRTcwNjE4LCAwNkU5IChyMiAgSU5URUwgeGhfcnZwMDcgICAgICAgIDAg
SU5UTCAyMDEyMDkxMykKKFhFTikgQUNQSTogU1NEVCA4Q0U3MEQwOCwgNTQ3RSAocjIgU2FTc2R0
ICBTYVNzZHQgICAgICAzMDAwIElOVEwgMjAxMjA5MTMpCihYRU4pIEFDUEk6IFVFRkkgOENFNzYx
ODgsIDAwNDIgKHIxICAgICAgICAgICAgICAgICAgICAgICAgMCAgICAgICAgICAgICAwKQooWEVO
KSBBQ1BJOiBTU0RUIDhDRTc2MUQwLCAwRTczIChyMiBDcHVSZWYgIENwdVNzZHQgICAgIDMwMDAg
SU5UTCAyMDEyMDkxMykKKFhFTikgQUNQSTogQkdSVCA4Q0U3NzA0OCwgMDAzOCAocjEgQUxBU0tB
ICAgQSBNIEkgICAxMDcyMDA5IEFNSSAgICAgMTAwMTMpCihYRU4pIEFDUEk6IERNQVIgOENFNzcw
ODAsIDAwQTggKHIxIElOVEVMICAgICAgU0tMICAgICAgICAgMSBJTlRMICAgICAgICAxKQooWEVO
KSBBQ1BJOiBUUE0yIDhDRTc3MTI4LCAwMDM0IChyMyAgICAgICAgVHBtMlRhYmwgICAgICAgIDEg
QU1JICAgICAgICAgMCkKKFhFTikgQUNQSTogQVNGISA4Q0U3NzE2MCwgMDBBNSAocjMyIElOVEVM
ICAgICAgIEhDRyAgICAgICAgMSBURlNNICAgIEY0MjQwKQooWEVOKSBTeXN0ZW0gUkFNOiA0MDAz
TUIgKDQwOTk3MzZrQikKKFhFTikgRG9tYWluIGhlYXAgaW5pdGlhbGlzZWQKKFhFTikgQUNQSTog
MzIvNjRYIEZBQ1MgYWRkcmVzcyBtaXNtYXRjaCBpbiBGQURUIC0gOGNlOGVmODAvMDAwMDAwMDAw
MDAwMDAwMCwgdXNpbmcgMzIKKFhFTikgSU9BUElDWzBdOiBhcGljX2lkIDIsIHZlcnNpb24gMzIs
IGFkZHJlc3MgMHhmZWMwMDAwMCwgR1NJIDAtMTE5CihYRU4pIEVuYWJsaW5nIEFQSUMgbW9kZTog
IEZsYXQuICBVc2luZyAxIEkvTyBBUElDcwooWEVOKSBbVlQtRF0gIFJNUlIgYWRkcmVzcyByYW5n
ZSA4ZDgwMDAwMC4uOGZmZmZmZmYgbm90IGluIHJlc2VydmVkIG1lbW9yeTsgbmVlZCAiaW9tbXVf
aW5jbHVzaXZlX21hcHBpbmc9MSI/CihYRU4pIFN3aXRjaGVkIHRvIEFQSUMgZHJpdmVyIHgyYXBp
Y19jbHVzdGVyLgooWEVOKSB4c3RhdGU6IHNpemU6IDB4NDQwIGFuZCBzdGF0ZXM6IDB4MWYKKFhF
TikgU3BlY3VsYXRpdmUgbWl0aWdhdGlvbiBmYWNpbGl0aWVzOgooWEVOKSAgIEhhcmR3YXJlIGZl
YXR1cmVzOgooWEVOKSAgIENvbXBpbGVkLWluIHN1cHBvcnQ6IFNIQURPV19QQUdJTkcKKFhFTikg
ICBYZW4gc2V0dGluZ3M6IEJUSS1UaHVuayBOL0EsIFNQRUNfQ1RSTDogTm8sIE90aGVyOgooWEVO
KSAgIEwxVEY6IGJlbGlldmVkIHZ1bG5lcmFibGUsIG1heHBoeXNhZGRyIEwxRCA0NiwgQ1BVSUQg
MzksIFNhZmUgYWRkcmVzcyA4MDAwMDAwMDAwCihYRU4pICAgU3VwcG9ydCBmb3IgSFZNIFZNczog
UlNCIEVBR0VSX0ZQVQooWEVOKSAgIFN1cHBvcnQgZm9yIFBWIFZNczogUlNCIEVBR0VSX0ZQVQoo
WEVOKSAgIFhQVEkgKDY0LWJpdCBQViBvbmx5KTogRG9tMCBlbmFibGVkLCBEb21VIGVuYWJsZWQg
KHdpdGggUENJRCkKKFhFTikgICBQViBMMVRGIHNoYWRvd2luZzogRG9tMCBkaXNhYmxlZCwgRG9t
VSBlbmFibGVkCihYRU4pIFVzaW5nIHNjaGVkdWxlcjogU01QIENyZWRpdCBTY2hlZHVsZXIgcmV2
MiAoY3JlZGl0MikKKFhFTikgSW5pdGlhbGl6aW5nIENyZWRpdDIgc2NoZWR1bGVyCihYRU4pIFBs
YXRmb3JtIHRpbWVyIGlzIDIzLjk5OU1IeiBIUEVUCihYRU4pIERldGVjdGVkIDI0OTYuMTEwIE1I
eiBwcm9jZXNzb3IuCihYRU4pIEluaXRpbmcgbWVtb3J5IHNoYXJpbmcuCihYRU4pIEludGVsIFZU
LWQgaW9tbXUgMCBzdXBwb3J0ZWQgcGFnZSBzaXplczogNGtCLCAyTUIsIDFHQi4KKFhFTikgSW50
ZWwgVlQtZCBpb21tdSAxIHN1cHBvcnRlZCBwYWdlIHNpemVzOiA0a0IsIDJNQiwgMUdCLgooWEVO
KSBJbnRlbCBWVC1kIFNub29wIENvbnRyb2wgbm90IGVuYWJsZWQuCihYRU4pIEludGVsIFZULWQg
RG9tMCBETUEgUGFzc3Rocm91Z2ggbm90IGVuYWJsZWQuCihYRU4pIEludGVsIFZULWQgUXVldWVk
IEludmFsaWRhdGlvbiBlbmFibGVkLgooWEVOKSBJbnRlbCBWVC1kIEludGVycnVwdCBSZW1hcHBp
bmcgZW5hYmxlZC4KKFhFTikgSW50ZWwgVlQtZCBQb3N0ZWQgSW50ZXJydXB0IG5vdCBlbmFibGVk
LgooWEVOKSBJbnRlbCBWVC1kIFNoYXJlZCBFUFQgdGFibGVzIGVuYWJsZWQuCihYRU4pIEkvTyB2
aXJ0dWFsaXNhdGlvbiBlbmFibGVkCihYRU4pICAtIERvbTAgbW9kZTogUmVsYXhlZAooWEVOKSBJ
bnRlcnJ1cHQgcmVtYXBwaW5nIGVuYWJsZWQKKFhFTikgRW5hYmxlZCBkaXJlY3RlZCBFT0kgd2l0
aCBpb2FwaWNfYWNrX29sZCBvbiEKKFhFTikgRU5BQkxJTkcgSU8tQVBJQyBJUlFzCihYRU4pICAt
PiBVc2luZyBvbGQgQUNLIG1ldGhvZAooWEVOKSBUU0NfREVBRExJTkUgZGlzYWJsZWQgZHVlIHRv
IEVycmF0YTsgcGxlYXNlIHVwZGF0ZSBtaWNyb2NvZGUgdG8gdmVyc2lvbiAweGIyIChvciBsYXRl
cikKKFhFTikgQWxsb2NhdGVkIGNvbnNvbGUgcmluZyBvZiAxNiBLaUIuCihYRU4pIG13YWl0LWlk
bGU6IG1heCBDLXN0YXRlIGNvdW50IG9mIDggcmVhY2hlZAooWEVOKSBWTVg6IFN1cHBvcnRlZCBh
ZHZhbmNlZCBmZWF0dXJlczoKKFhFTikgIC0gQVBJQyBNTUlPIGFjY2VzcyB2aXJ0dWFsaXNhdGlv
bgooWEVOKSAgLSBBUElDIFRQUiBzaGFkb3cKKFhFTikgIC0gRXh0ZW5kZWQgUGFnZSBUYWJsZXMg
KEVQVCkKKFhFTikgIC0gVmlydHVhbC1Qcm9jZXNzb3IgSWRlbnRpZmllcnMgKFZQSUQpCihYRU4p
ICAtIFZpcnR1YWwgTk1JCihYRU4pICAtIE1TUiBkaXJlY3QtYWNjZXNzIGJpdG1hcAooWEVOKSAg
LSBVbnJlc3RyaWN0ZWQgR3Vlc3QKKFhFTikgIC0gVk1DUyBzaGFkb3dpbmcKKFhFTikgIC0gVk0g
RnVuY3Rpb25zCihYRU4pICAtIFZpcnR1YWxpc2F0aW9uIEV4Y2VwdGlvbnMKKFhFTikgIC0gUGFn
ZSBNb2RpZmljYXRpb24gTG9nZ2luZwooWEVOKSBIVk06IEFTSURzIGVuYWJsZWQuCihYRU4pIEhW
TTogVk1YIGVuYWJsZWQKKFhFTikgSFZNOiBIYXJkd2FyZSBBc3Npc3RlZCBQYWdpbmcgKEhBUCkg
ZGV0ZWN0ZWQKKFhFTikgSFZNOiBIQVAgcGFnZSBzaXplczogNGtCLCAyTUIsIDFHQgooWEVOKSBt
d2FpdC1pZGxlOiBtYXggQy1zdGF0ZSBjb3VudCBvZiA4IHJlYWNoZWQKKFhFTikgbXdhaXQtaWRs
ZTogbWF4IEMtc3RhdGUgY291bnQgb2YgOCByZWFjaGVkCihYRU4pIG13YWl0LWlkbGU6IG1heCBD
LXN0YXRlIGNvdW50IG9mIDggcmVhY2hlZAooWEVOKSBCcm91Z2h0IHVwIDIgQ1BVcwooWEVOKSBE
b20wIGhhcyBtYXhpbXVtIDMxMiBQSVJRcwooWEVOKSAgWGVuICBrZXJuZWw6IDY0LWJpdCwgbHNi
LCBjb21wYXQzMgooWEVOKSAgRG9tMCBrZXJuZWw6IDY0LWJpdCwgUEFFLCBsc2IsIHBhZGRyIDB4
MTAwMDAwMCAtPiAweDJhMmMwMDAKKFhFTikgUEhZU0lDQUwgTUVNT1JZIEFSUkFOR0VNRU5UOgoo
WEVOKSAgRG9tMCBhbGxvYy46ICAgMDAwMDAwMDE2NDAwMDAwMC0+MDAwMDAwMDE2ODAwMDAwMCAo
MjQ1NzYwIHBhZ2VzIHRvIGJlIGFsbG9jYXRlZCkKKFhFTikgVklSVFVBTCBNRU1PUlkgQVJSQU5H
RU1FTlQ6CihYRU4pICBMb2FkZWQga2VybmVsOiBmZmZmZmZmZjgxMDAwMDAwLT5mZmZmZmZmZjgy
YTJjMDAwCihYRU4pICBJbml0LiByYW1kaXNrOiAwMDAwMDAwMDAwMDAwMDAwLT4wMDAwMDAwMDAw
MDAwMDAwCihYRU4pICBQaHlzLU1hY2ggbWFwOiAwMDAwMDA4MDAwMDAwMDAwLT4wMDAwMDA4MDAw
MjAwMDAwCihYRU4pICBTdGFydCBpbmZvOiAgICBmZmZmZmZmZjgyYTJjMDAwLT5mZmZmZmZmZjgy
YTJjNGI0CihYRU4pICBYZW5zdG9yZSByaW5nOiAwMDAwMDAwMDAwMDAwMDAwLT4wMDAwMDAwMDAw
MDAwMDAwCihYRU4pICBDb25zb2xlIHJpbmc6ICAwMDAwMDAwMDAwMDAwMDAwLT4wMDAwMDAwMDAw
MDAwMDAwCihYRU4pICBQYWdlIHRhYmxlczogICBmZmZmZmZmZjgyYTJkMDAwLT5mZmZmZmZmZjgy
YTQ2MDAwCihYRU4pICBCb290IHN0YWNrOiAgICBmZmZmZmZmZjgyYTQ2MDAwLT5mZmZmZmZmZjgy
YTQ3MDAwCihYRU4pICBUT1RBTDogICAgICAgICBmZmZmZmZmZjgwMDAwMDAwLT5mZmZmZmZmZjgy
YzAwMDAwCihYRU4pICBFTlRSWSBBRERSRVNTOiBmZmZmZmZmZjgyNmFhMTgwCihYRU4pIERvbTAg
aGFzIG1heGltdW0gMSBWQ1BVcwooWEVOKSBCb2d1cyBETUlCQVIgMHhmZWQxODAwMSBvbiAwMDAw
OjAwOjAwLjAKKFhFTikgSW5pdGlhbCBsb3cgbWVtb3J5IHZpcnEgdGhyZXNob2xkIHNldCBhdCAw
eDQwMDAgcGFnZXMuCihYRU4pIFNjcnViYmluZyBGcmVlIFJBTSBpbiBiYWNrZ3JvdW5kCihYRU4p
IFN0ZC4gTG9nbGV2ZWw6IEVycm9ycyBhbmQgd2FybmluZ3MKKFhFTikgR3Vlc3QgTG9nbGV2ZWw6
IE5vdGhpbmcgKFJhdGUtbGltaXRlZDogRXJyb3JzIGFuZCB3YXJuaW5ncykKKFhFTikgKioqIFNl
cmlhbCBpbnB1dCB0byBET00wICh0eXBlICdDVFJMLWEnIHRocmVlIHRpbWVzIHRvIHN3aXRjaCBp
bnB1dCkKKFhFTikgRnJlZWQgNDgwa0IgaW5pdCBtZW1vcnkKKFhFTikgW1ZULURdRE1BUjpbRE1B
IFJlYWRdIFJlcXVlc3QgZGV2aWNlIFswMDAwOjAwOjAyLjBdIGZhdWx0IGFkZHIgOGU0ODAwMDAs
IGlvbW11IHJlZyA9IGZmZmY4MmMwMDAyMWQwMDAKKFhFTikgW1ZULURdRE1BUjogcmVhc29uIDA2
IC0gUFRFIFJlYWQgYWNjZXNzIGlzIG5vdCBzZXQKKFhFTikgW1ZULURdSU5UUi1SRU1BUDogUmVx
dWVzdCBkZXZpY2UgWzAwMDA6ZjA6MWYuMF0gZmF1bHQgaW5kZXggMCwgaW9tbXUgcmVnID0gZmZm
ZjgyYzAwMDIxZjAwMAooWEVOKSBbVlQtRF1JTlRSLVJFTUFQOiByZWFzb24gMjIgLSBQcmVzZW50
IGZpZWxkIGluIHRoZSBJUlRFIGVudHJ5IGlzIGNsZWFyCm1hcHBpbmcga2VybmVsIGludG8gcGh5
c2ljYWwgbWVtb3J5CmFib3V0IHRvIGdldCBzdGFydGVkLi4uCihYRU4pIFtWVC1EXURNQVI6W0RN
QSBSZWFkXSBSZXF1ZXN0IGRldmljZSBbMDAwMDowMDowMi4wXSBmYXVsdCBhZGRyIDhlNDgwMDAw
LCBpb21tdSByZWcgPSBmZmZmODJjMDAwMjFkMDAwCihYRU4pIFtWVC1EXURNQVI6IHJlYXNvbiAw
NiAtIFBURSBSZWFkIGFjY2VzcyBpcyBub3Qgc2V0CihYRU4pIFtWVC1EXURNQVI6W0RNQSBSZWFk
XSBSZXF1ZXN0IGRldmljZSBbMDAwMDowMDowMi4wXSBmYXVsdCBhZGRyIDhlNGE3MDAwLCBpb21t
dSByZWcgPSBmZmZmODJjMDAwMjFkMDAwCihYRU4pIFtWVC1EXURNQVI6IHJlYXNvbiAwNiAtIFBU
RSBSZWFkIGFjY2VzcyBpcyBub3Qgc2V0CihYRU4pIFtWVC1EXURNQVI6W0RNQSBSZWFkXSBSZXF1
ZXN0IGRldmljZSBbMDAwMDowMDowMi4wXSBmYXVsdCBhZGRyIDhlNGMyMDAwLCBpb21tdSByZWcg
PSBmZmZmODJjMDAwMjFkMDAwCihYRU4pIFtWVC1EXURNQVI6IHJlYXNvbiAwNiAtIFBURSBSZWFk
IGFjY2VzcyBpcyBub3Qgc2V0ClsgICAgMC4wMDAwMDBdIExpbnV4IHZlcnNpb24gNC4xOS41LWxp
bnV4a2l0IChyb290QDQ4ZWZiZDAzMDlhNikgKGdjYyB2ZXJzaW9uIDYuMy4wIChBbHBpbmUgNi4z
LjApKSAjMSBTTVAgTW9uIEp1biAxNyAxNzo0MzoyOSBVVEMgMjAxOQpbICAgIDAuMDAwMDAwXSBD
b21tYW5kIGxpbmU6IGNvbnNvbGU9aHZjMCBlYXJseXByaW50az14ZW4gcm9vdGRlbGF5PTMgcm9v
dD1QQVJUVVVJRD02MWZmNWJhNC1hZWEzLTRjMjEtYTExYy1iODk5YTZhODhkZWYgdGV4dApbICAg
IDAuMDAwMDAwXSB4ODYvZnB1OiBTdXBwb3J0aW5nIFhTQVZFIGZlYXR1cmUgMHgwMDE6ICd4ODcg
ZmxvYXRpbmcgcG9pbnQgcmVnaXN0ZXJzJwpbICAgIDAuMDAwMDAwXSB4ODYvZnB1OiBTdXBwb3J0
aW5nIFhTQVZFIGZlYXR1cmUgMHgwMDI6ICdTU0UgcmVnaXN0ZXJzJwpbICAgIDAuMDAwMDAwXSB4
ODYvZnB1OiBTdXBwb3J0aW5nIFhTQVZFIGZlYXR1cmUgMHgwMDQ6ICdBVlggcmVnaXN0ZXJzJwpb
ICAgIDAuMDAwMDAwXSB4ODYvZnB1OiB4c3RhdGVfb2Zmc2V0WzJdOiAgNTc2LCB4c3RhdGVfc2l6
ZXNbMl06ICAyNTYKWyAgICAwLjAwMDAwMF0geDg2L2ZwdTogRW5hYmxlZCB4c3RhdGUgZmVhdHVy
ZXMgMHg3LCBjb250ZXh0IHNpemUgaXMgODMyIGJ5dGVzLCB1c2luZyAnc3RhbmRhcmQnIGZvcm1h
dC4KWyAgICAwLjAwMDAwMF0gUmVsZWFzZWQgMCBwYWdlKHMpClsgICAgMC4wMDAwMDBdIEJJT1Mt
cHJvdmlkZWQgcGh5c2ljYWwgUkFNIG1hcDoKWyAgICAwLjAwMDAwMF0gWGVuOiBbbWVtIDB4MDAw
MDAwMDAwMDAwMDAwMC0weDAwMDAwMDAwMDAwNTdmZmZdIHVzYWJsZQpbICAgIDAuMDAwMDAwXSBY
ZW46IFttZW0gMHgwMDAwMDAwMDAwMDU4MDAwLTB4MDAwMDAwMDAwMDA1OGZmZl0gcmVzZXJ2ZWQK
WyAgICAwLjAwMDAwMF0gWGVuOiBbbWVtIDB4MDAwMDAwMDAwMDA1OTAwMC0weDAwMDAwMDAwMDAw
OWVmZmZdIHVzYWJsZQpbICAgIDAuMDAwMDAwXSBYZW46IFttZW0gMHgwMDAwMDAwMDAwMDlmMDAw
LTB4MDAwMDAwMDAwMDBmZmZmZl0gcmVzZXJ2ZWQKWyAgICAwLjAwMDAwMF0gWGVuOiBbbWVtIDB4
MDAwMDAwMDAwMDEwMDAwMC0weDAwMDAwMDAwNDAwNjFmZmZdIHVzYWJsZQpbICAgIDAuMDAwMDAw
XSBYZW46IFttZW0gMHgwMDAwMDAwMDQwMDYyMDAwLTB4MDAwMDAwMDA4NjQ4OWZmZl0gdW51c2Fi
bGUKWyAgICAwLjAwMDAwMF0gWGVuOiBbbWVtIDB4MDAwMDAwMDA4NjQ4YTAwMC0weDAwMDAwMDAw
ODY0OGFmZmZdIEFDUEkgTlZTClsgICAgMC4wMDAwMDBdIFhlbjogW21lbSAweDAwMDAwMDAwODY0
OGIwMDAtMHgwMDAwMDAwMDg2NGI0ZmZmXSByZXNlcnZlZApbICAgIDAuMDAwMDAwXSBYZW46IFtt
ZW0gMHgwMDAwMDAwMDg2NGI1MDAwLTB4MDAwMDAwMDA4YzIyM2ZmZl0gdW51c2FibGUKWyAgICAw
LjAwMDAwMF0gWGVuOiBbbWVtIDB4MDAwMDAwMDA4YzIyNDAwMC0weDAwMDAwMDAwOGM1MjdmZmZd
IHJlc2VydmVkClsgICAgMC4wMDAwMDBdIFhlbjogW21lbSAweDAwMDAwMDAwOGM1MjgwMDAtMHgw
MDAwMDAwMDhjNzM1ZmZmXSB1bnVzYWJsZQpbICAgIDAuMDAwMDAwXSBYZW46IFttZW0gMHgwMDAw
MDAwMDhjNzM2MDAwLTB4MDAwMDAwMDA4Y2VhNmZmZl0gQUNQSSBOVlMKWyAgICAwLjAwMDAwMF0g
WGVuOiBbbWVtIDB4MDAwMDAwMDA4Y2VhNzAwMC0weDAwMDAwMDAwOGQyZmVmZmZdIHJlc2VydmVk
ClsgICAgMC4wMDAwMDBdIFhlbjogW21lbSAweDAwMDAwMDAwOGQyZmYwMDAtMHgwMDAwMDAwMDhk
MmZmZmZmXSB1bnVzYWJsZQpbICAgIDAuMDAwMDAwXSBYZW46IFttZW0gMHgwMDAwMDAwMDhkMzAw
MDAwLTB4MDAwMDAwMDA4ZDNmZmZmZl0gcmVzZXJ2ZWQKWyAgICAwLjAwMDAwMF0gWGVuOiBbbWVt
IDB4MDAwMDAwMDBlMDAwMDAwMC0weDAwMDAwMDAwZWZmZmZmZmZdIHJlc2VydmVkClsgICAgMC4w
MDAwMDBdIFhlbjogW21lbSAweDAwMDAwMDAwZmUwMDAwMDAtMHgwMDAwMDAwMGZlMDEwZmZmXSBy
ZXNlcnZlZApbICAgIDAuMDAwMDAwXSBYZW46IFttZW0gMHgwMDAwMDAwMGZlYzAwMDAwLTB4MDAw
MDAwMDBmZWMwMGZmZl0gcmVzZXJ2ZWQKWyAgICAwLjAwMDAwMF0gWGVuOiBbbWVtIDB4MDAwMDAw
MDBmZWQ5MDAwMC0weDAwMDAwMDAwZmVkOTFmZmZdIHJlc2VydmVkClsgICAgMC4wMDAwMDBdIFhl
bjogW21lbSAweDAwMDAwMDAwZmVlMDAwMDAtMHgwMDAwMDAwMGZlZWZmZmZmXSByZXNlcnZlZApb
ICAgIDAuMDAwMDAwXSBYZW46IFttZW0gMHgwMDAwMDAwMGZmMDAwMDAwLTB4MDAwMDAwMDBmZmZm
ZmZmZl0gcmVzZXJ2ZWQKWyAgICAwLjAwMDAwMF0gWGVuOiBbbWVtIDB4MDAwMDAwMDEwMDAwMDAw
MC0weDAwMDAwMDAxNmRmZmZmZmZdIHVudXNhYmxlClsgICAgMC4wMDAwMDBdIE5YIChFeGVjdXRl
IERpc2FibGUpIHByb3RlY3Rpb246IGFjdGl2ZQpbICAgIDAuMDAwMDAwXSBlZmk6IEVGSSB2Mi40
MCBieSBBbWVyaWNhbiBNZWdhdHJlbmRzClsgICAgMC4wMDAwMDBdIGVmaTogIEVTUlQ9MHg4ZDI5
YzA5OCAgQUNQST0weDhjZTQ5MDAwICBBQ1BJIDIuMD0weDhjZTQ5MDAwICBTTUJJT1M9MHhmMDVl
MCAgU01CSU9TIDMuMD0weGYwNjAwICBNUFM9MHhmYzljMApbICAgIDAuMDAwMDAwXSBTTUJJT1Mg
My4wLjAgcHJlc2VudC4KWyAgICAwLjAwMDAwMF0gRE1JOiAgLywgQklPUyA1LjExIDA2LzEyLzIw
MTcKWyAgICAwLjAwMDAwMF0gSHlwZXJ2aXNvciBkZXRlY3RlZDogWGVuIFBWClsgICAgMC4wMDA2
NTBdIHRzYzogRGV0ZWN0ZWQgMjQ5Ni4xMTAgTUh6IHByb2Nlc3NvcgpbICAgIDAuMDEwNzMxXSBs
YXN0X3BmbiA9IDB4NDAwNjIgbWF4X2FyY2hfcGZuID0gMHg0MDAwMDAwMDAKWyAgICAwLjAxMDcz
Ml0gRGlzYWJsZWQKWyAgICAwLjAxMDczNF0geDg2L1BBVDogTVRSUnMgZGlzYWJsZWQsIHNraXBw
aW5nIFBBVCBpbml0aWFsaXphdGlvbiB0b28uClsgICAgMC4wMTA3MzddIHg4Ni9QQVQ6IENvbmZp
Z3VyYXRpb24gWzAtN106IFdCICBXVCAgVUMtIFVDICBXQyAgV1AgIFVDICBVQwpbICAgIDAuMDEw
NzY3XSBLZXJuZWwvVXNlciBwYWdlIHRhYmxlcyBpc29sYXRpb246IGRpc2FibGVkIG9uIFhFTiBQ
Vi4KWyAgICAwLjE4NTk5NV0gU2VjdXJlIGJvb3QgZGlzYWJsZWQKWyAgICAwLjE4NjAwOV0gQUNQ
STogRWFybHkgdGFibGUgY2hlY2tzdW0gdmVyaWZpY2F0aW9uIGRpc2FibGVkClsgICAgMC4xODYw
MTZdIEFDUEk6IFJTRFAgMHgwMDAwMDAwMDhDRTQ5MDAwIDAwMDAyNCAodjAyIEFMQVNLQSkKWyAg
ICAwLjE4NjAyNF0gQUNQSTogWFNEVCAweDAwMDAwMDAwOENFNDkwQTggMDAwMENDICh2MDEgQUxB
U0tBIEEgTSBJICAgIDAxMDcyMDA5IEFNSSAgMDAwMTAwMTMpClsgICAgMC4xODYwNTVdIEFDUEk6
IEZBQ1AgMHgwMDAwMDAwMDhDRTZDMzcwIDAwMDEwQyAodjA1IEFMQVNLQSBBIE0gSSAgICAwMTA3
MjAwOSBBTUkgIDAwMDEwMDEzKQpbICAgIDAuMTg2MTEwXSBBQ1BJOiBEU0RUIDB4MDAwMDAwMDA4
Q0U0OTIwOCAwMjMxNjcgKHYwMiBBTEFTS0EgQSBNIEkgICAgMDEwNzIwMDkgSU5UTCAyMDEyMDkx
MykKWyAgICAwLjE4NjEyMV0gQUNQSTogRkFDUyAweDAwMDAwMDAwOENFOEVGODAgMDAwMDQwClsg
ICAgMC4xODYxMzNdIEFDUEk6IEFQSUMgMHgwMDAwMDAwMDhDRTZDNDgwIDAwMDA4NCAodjAzIEFM
QVNLQSBBIE0gSSAgICAwMTA3MjAwOSBBTUkgIDAwMDEwMDEzKQpbICAgIDAuMTg2MTQ0XSBBQ1BJ
OiBGUERUIDB4MDAwMDAwMDA4Q0U2QzUwOCAwMDAwNDQgKHYwMSBBTEFTS0EgQSBNIEkgICAgMDEw
NzIwMDkgQU1JICAwMDAxMDAxMykKWyAgICAwLjE4NjE1Nl0gQUNQSTogRklEVCAweDAwMDAwMDAw
OENFNkM1NTAgMDAwMDlDICh2MDEgQUxBU0tBIEEgTSBJICAgIDAxMDcyMDA5IEFNSSAgMDAwMTAw
MTMpClsgICAgMC4xODYxNjddIEFDUEk6IE1DRkcgMHgwMDAwMDAwMDhDRTZDNUYwIDAwMDAzQyAo
djAxIEFMQVNLQSBBIE0gSSAgICAwMTA3MjAwOSBNU0ZUIDAwMDAwMDk3KQpbICAgIDAuMTg2MTc5
XSBBQ1BJOiBIUEVUIDB4MDAwMDAwMDA4Q0U2QzYzMCAwMDAwMzggKHYwMSBBTEFTS0EgQSBNIEkg
ICAgMDEwNzIwMDkgQU1JLiAwMDA1MDAwQikKWyAgICAwLjE4NjE5MF0gQUNQSTogTFBJVCAweDAw
MDAwMDAwOENFNkM2NjggMDAwMDk0ICh2MDEgSU5URUwgIFNLTC1VTFQgIDAwMDAwMDAwIE1TRlQg
MDAwMDAwNUYpClsgICAgMC4xODYyMDJdIEFDUEk6IFNTRFQgMHgwMDAwMDAwMDhDRTZDNzAwIDAw
MDI0OCAodjAyIElOVEVMICBzZW5zcmh1YiAwMDAwMDAwMCBJTlRMIDIwMTIwOTEzKQpbICAgIDAu
MTg2MjEzXSBBQ1BJOiBTU0RUIDB4MDAwMDAwMDA4Q0U2Qzk0OCAwMDJCQUUgKHYwMiBJTlRFTCAg
UHRpZERldmMgMDAwMDEwMDAgSU5UTCAyMDEyMDkxMykKWyAgICAwLjE4NjIyNV0gQUNQSTogU1NE
VCAweDAwMDAwMDAwOENFNkY0RjggMDAwQkUzICh2MDIgSU5URUwgIFRoZXJfUnZwIDAwMDAxMDAw
IElOVEwgMjAxMjA5MTMpClsgICAgMC4xODYyMzZdIEFDUEk6IFNTRFQgMHgwMDAwMDAwMDhDRTcw
MEUwIDAwMDRBMyAodjAyIElOVEVMICB6cG9kZCAgICAwMDAwMTAwMCBJTlRMIDIwMTIwOTEzKQpb
ICAgIDAuMTg2MjQ4XSBBQ1BJOiBEQkdQIDB4MDAwMDAwMDA4Q0U3MDU4OCAwMDAwMzQgKHYwMSBJ
TlRFTCAgICAgICAgICAgMDAwMDAwMDAgTVNGVCAwMDAwMDA1RikKWyAgICAwLjE4NjI1OV0gQUNQ
STogREJHMiAweDAwMDAwMDAwOENFNzA1QzAgMDAwMDU0ICh2MDAgSU5URUwgICAgICAgICAgIDAw
MDAwMDAwIE1TRlQgMDAwMDAwNUYpClsgICAgMC4xODYyNzFdIEFDUEk6IFNTRFQgMHgwMDAwMDAw
MDhDRTcwNjE4IDAwMDZFOSAodjAyIElOVEVMICB4aF9ydnAwNyAwMDAwMDAwMCBJTlRMIDIwMTIw
OTEzKQpbICAgIDAuMTg2MjgyXSBBQ1BJOiBTU0RUIDB4MDAwMDAwMDA4Q0U3MEQwOCAwMDU0N0Ug
KHYwMiBTYVNzZHQgU2FTc2R0ICAgMDAwMDMwMDAgSU5UTCAyMDEyMDkxMykKWyAgICAwLjE4NjI5
NF0gQUNQSTogVUVGSSAweDAwMDAwMDAwOENFNzYxODggMDAwMDQyICh2MDEgICAgICAgICAgICAg
ICAgIDAwMDAwMDAwICAgICAgMDAwMDAwMDApClsgICAgMC4xODYzMjZdIEFDUEk6IFNTRFQgMHgw
MDAwMDAwMDhDRTc2MUQwIDAwMEU3MyAodjAyIENwdVJlZiBDcHVTc2R0ICAwMDAwMzAwMCBJTlRM
IDIwMTIwOTEzKQpbICAgIDAuMTg2MzM3XSBBQ1BJOiBCR1JUIDB4MDAwMDAwMDA4Q0U3NzA0OCAw
MDAwMzggKHYwMSBBTEFTS0EgQSBNIEkgICAgMDEwNzIwMDkgQU1JICAwMDAxMDAxMykKWyAgICAw
LjE4NjM0OV0gQUNQSTogUk1BRCAweDAwMDAwMDAwOENFNzcwODAgMDAwMEE4ICh2MDEgSU5URUwg
IFNLTCAgICAgIDAwMDAwMDAxIElOVEwgMDAwMDAwMDEpClsgICAgMC4xODYzNjFdIEFDUEk6IFRQ
TTIgMHgwMDAwMDAwMDhDRTc3MTI4IDAwMDAzNCAodjAzICAgICAgICBUcG0yVGFibCAwMDAwMDAw
MSBBTUkgIDAwMDAwMDAwKQpbICAgIDAuMTg2MzcyXSBBQ1BJOiBBU0YhIDB4MDAwMDAwMDA4Q0U3
NzE2MCAwMDAwQTUgKHYzMiBJTlRFTCAgIEhDRyAgICAgMDAwMDAwMDEgVEZTTSAwMDBGNDI0MCkK
WyAgICAwLjE4NjQwM10gU2V0dGluZyBBUElDIHJvdXRpbmcgdG8gWGVuIFBWLgpbICAgIDAuMTkw
MDkxXSBab25lIHJhbmdlczoKWyAgICAwLjE5MDA5M10gICBETUEgICAgICBbbWVtIDB4MDAwMDAw
MDAwMDAwMTAwMC0weDAwMDAwMDAwMDBmZmZmZmZdClsgICAgMC4xOTAwOTVdICAgRE1BMzIgICAg
W21lbSAweDAwMDAwMDAwMDEwMDAwMDAtMHgwMDAwMDAwMDQwMDYxZmZmXQpbICAgIDAuMTkwMDk3
XSAgIE5vcm1hbCAgIGVtcHR5ClsgICAgMC4xOTAwOThdIE1vdmFibGUgem9uZSBzdGFydCBmb3Ig
ZWFjaCBub2RlClsgICAgMC4xOTAwOTldIEVhcmx5IG1lbW9yeSBub2RlIHJhbmdlcwpbICAgIDAu
MTkwMTAxXSAgIG5vZGUgICAwOiBbbWVtIDB4MDAwMDAwMDAwMDAwMTAwMC0weDAwMDAwMDAwMDAw
NTdmZmZdClsgICAgMC4xOTAxMDJdICAgbm9kZSAgIDA6IFttZW0gMHgwMDAwMDAwMDAwMDU5MDAw
LTB4MDAwMDAwMDAwMDA5ZWZmZl0KWyAgICAwLjE5MDEwM10gICBub2RlICAgMDogW21lbSAweDAw
MDAwMDAwMDAxMDAwMDAtMHgwMDAwMDAwMDQwMDYxZmZmXQpbICAgIDAuMTkwNjg5XSBSZXNlcnZl
ZCBidXQgdW5hdmFpbGFibGU6IDMyNzY5IHBhZ2VzClsgICAgMC4xOTA2OTFdIEluaXRtZW0gc2V0
dXAgbm9kZSAwIFttZW0gMHgwMDAwMDAwMDAwMDAxMDAwLTB4MDAwMDAwMDA0MDA2MWZmZl0KWyAg
ICAwLjE5NTc0Nl0gcDJtIHZpcnR1YWwgYXJlYSBhdCAoX19fX3B0cnZhbF9fX18pLCBzaXplIGlz
IDQwMDAwMDAwClsgICAgMC4zMDAyMDddIFJlbWFwcGVkIDk4IHBhZ2UocykKWyAgICAwLjMwMDI1
MF0gUmVzZXJ2aW5nIEludGVsIGdyYXBoaWNzIG1lbW9yeSBhdCBbbWVtIDB4OGUwMDAwMDAtMHg4
ZmZmZmZmZl0KWyAgICAwLjMwMDYwMF0gQUNQSTogUE0tVGltZXIgSU8gUG9ydDogMHgxODA4Clsg
ICAgMC4zMDA2MzNdIEFDUEk6IExBUElDX05NSSAoYWNwaV9pZFsweDAxXSBoaWdoIGVkZ2UgbGlu
dFsweDFdKQpbICAgIDAuMzAwNjM1XSBBQ1BJOiBMQVBJQ19OTUkgKGFjcGlfaWRbMHgwMl0gaGln
aCBlZGdlIGxpbnRbMHgxXSkKWyAgICAwLjMwMDYzN10gQUNQSTogTEFQSUNfTk1JIChhY3BpX2lk
WzB4MDNdIGhpZ2ggZWRnZSBsaW50WzB4MV0pClsgICAgMC4zMDA2MzldIEFDUEk6IExBUElDX05N
SSAoYWNwaV9pZFsweDA0XSBoaWdoIGVkZ2UgbGludFsweDFdKQpbICAgIDAuMzAwNjgxXSBJT0FQ
SUNbMF06IGFwaWNfaWQgMiwgdmVyc2lvbiAzMiwgYWRkcmVzcyAweGZlYzAwMDAwLCBHU0kgMC0x
MTkKWyAgICAwLjMwMDY4OV0gQUNQSTogSU5UX1NSQ19PVlIgKGJ1cyAwIGJ1c19pcnEgMCBnbG9i
YWxfaXJxIDIgZGZsIGRmbCkKWyAgICAwLjMwMDY5M10gQUNQSTogSU5UX1NSQ19PVlIgKGJ1cyAw
IGJ1c19pcnEgOSBnbG9iYWxfaXJxIDkgaGlnaCBsZXZlbCkKWyAgICAwLjMwMDcwNV0gVXNpbmcg
QUNQSSAoTUFEVCkgZm9yIFNNUCBjb25maWd1cmF0aW9uIGluZm9ybWF0aW9uClsgICAgMC4zMDA3
MTBdIEFDUEk6IEhQRVQgaWQ6IDB4ODA4NmE3MDEgYmFzZTogMHhmZWQwMDAwMApbICAgIDAuMzAw
NzE2XSBzbXBib290OiBBbGxvd2luZyA0IENQVXMsIDAgaG90cGx1ZyBDUFVzClsgICAgMC4zMDA3
MzddIFttZW0gMHg5MDAwMDAwMC0weGRmZmZmZmZmXSBhdmFpbGFibGUgZm9yIFBDSSBkZXZpY2Vz
ClsgICAgMC4zMDA3NDFdIEJvb3RpbmcgcGFyYXZpcnR1YWxpemVkIGtlcm5lbCBvbiBYZW4KWyAg
ICAwLjMwMDc0Ml0gWGVuIHZlcnNpb246IDQuMTIuMCAocHJlc2VydmUtQUQpClsgICAgMC4zMDA3
NDRdIGNsb2Nrc291cmNlOiByZWZpbmVkLWppZmZpZXM6IG1hc2s6IDB4ZmZmZmZmZmYgbWF4X2N5
Y2xlczogMHhmZmZmZmZmZiwgbWF4X2lkbGVfbnM6IDE5MTEyNjA0NDYyNzUwMDAwIG5zClsgICAg
MC40MjAyMzddIHJhbmRvbTogZ2V0X3JhbmRvbV9ieXRlcyBjYWxsZWQgZnJvbSBzdGFydF9rZXJu
ZWwrMHg5Mi8weDRiZSB3aXRoIGNybmdfaW5pdD0wClsgICAgMC40MjAyNDZdIHNldHVwX3BlcmNw
dTogTlJfQ1BVUzoxMjggbnJfY3B1bWFza19iaXRzOjEyOCBucl9jcHVfaWRzOjQgbnJfbm9kZV9p
ZHM6MQpbICAgIDAuNDIwNTEzXSBwZXJjcHU6IEVtYmVkZGVkIDQ1IHBhZ2VzL2NwdSBAKF9fX19w
dHJ2YWxfX19fKSBzMTQzNzY4IHI4MTkyIGQzMjM2MCB1NTI0Mjg4ClsgICAgMC40MjA1NzFdIEJ1
aWx0IDEgem9uZWxpc3RzLCBtb2JpbGl0eSBncm91cGluZyBvbi4gIFRvdGFsIHBhZ2VzOiAyNTgw
MjQKWyAgICAwLjQyMDU3NF0gS2VybmVsIGNvbW1hbmQgbGluZTogY29uc29sZT1odmMwIGVhcmx5
cHJpbnRrPXhlbiByb290ZGVsYXk9MyByb290PVBBUlRVVUlEPTYxZmY1YmE0LWFlYTMtNGMyMS1h
MTFjLWI4OTlhNmE4OGRlZiB0ZXh0ClsgICAgMC40MjA3ODBdIERlbnRyeSBjYWNoZSBoYXNoIHRh
YmxlIGVudHJpZXM6IDEzMTA3MiAob3JkZXI6IDgsIDEwNDg1NzYgYnl0ZXMpClsgICAgMC40MjA4
NTRdIElub2RlLWNhY2hlIGhhc2ggdGFibGUgZW50cmllczogNjU1MzYgKG9yZGVyOiA3LCA1MjQy
ODggYnl0ZXMpClsgICAgMC40MjEwMDJdIHgyYXBpYyBkaXNhYmxlZApbICAgIDAuNDUxMjA5XSBz
b2Z0d2FyZSBJTyBUTEI6IG1hcHBlZCBbbWVtIDB4M2E2MDAwMDAtMHgzZTYwMDAwMF0gKDY0TUIp
ClsgICAgMC40NjI0MjZdIE1lbW9yeTogOTMwOTQwSy8xMDQ4NTcySyBhdmFpbGFibGUgKDEyMzAw
SyBrZXJuZWwgY29kZSwgMTU5NUsgcndkYXRhLCAzMDY4SyByb2RhdGEsIDE1ODRLIGluaXQsIDE5
NTJLIGJzcywgMTE3NjMySyByZXNlcnZlZCwgMEsgY21hLXJlc2VydmVkKQpbICAgIDAuNDYyNDg4
XSBmdHJhY2U6IGFsbG9jYXRpbmcgNDM0OTcgZW50cmllcyBpbiAxNzAgcGFnZXMKWyAgICAwLjQ4
MDE1Ml0gcmN1OiBIaWVyYXJjaGljYWwgUkNVIGltcGxlbWVudGF0aW9uLgpbICAgIDAuNDgwMTU0
XSByY3U6IAlSQ1UgcmVzdHJpY3RpbmcgQ1BVcyBmcm9tIE5SX0NQVVM9MTI4IHRvIG5yX2NwdV9p
ZHM9MS4KWyAgICAwLjQ4MDE1Nl0gcmN1OiBBZGp1c3RpbmcgZ2VvbWV0cnkgZm9yIHJjdV9mYW5v
dXRfbGVhZj0xNiwgbnJfY3B1X2lkcz0xClsgICAgMC40ODMzNjJdIFVzaW5nIE5VTEwgbGVnYWN5
IFBJQwpbICAgIDAuNDgzMzY0XSBOUl9JUlFTOiA4NDQ4LCBucl9pcnFzOiAyNTYsIHByZWFsbG9j
YXRlZCBpcnFzOiAwClsgICAgMC40ODMzODFdIHhlbjpldmVudHM6IFVzaW5nIEZJRk8tYmFzZWQg
QUJJClsgICAgMC40ODM1NTVdIENvbnNvbGU6IGNvbG91ciBkdW1teSBkZXZpY2UgODB4MjUKWyAg
ICAwLjQ4MzczMl0gY29uc29sZSBbdHR5MF0gZW5hYmxlZApbICAgIDAuNDg0MjQ2XSBjb25zb2xl
IFtodmMwXSBlbmFibGVkClsgICAgMC40ODQyNTRdIEFDUEk6IENvcmUgcmV2aXNpb24gMjAxODA4
MTAKWyAgICAwLjQ5OTU5Ml0gQUNQSSBCSU9TIFdhcm5pbmcgKGJ1Zyk6IEluY29ycmVjdCBjaGVj
a3N1bSBpbiB0YWJsZSBbQkdSVF0gLSAweDk5LCBzaG91bGQgYmUgMHhBRiAoMjAxODA4MTAvdGJw
cmludC0xNzcpClsgICAgMC40OTk2ODVdIGNsb2Nrc291cmNlOiB4ZW46IG1hc2s6IDB4ZmZmZmZm
ZmZmZmZmZmZmZiBtYXhfY3ljbGVzOiAweDFjZDQyZTRkZmZiLCBtYXhfaWRsZV9uczogODgxNTkw
NTkxNDgzIG5zClsgICAgMC40OTk3MDVdIGluc3RhbGxpbmcgWGVuIHRpbWVyIGZvciBDUFUgMApb
ICAgIDAuNDk5NzkxXSBjbG9ja3NvdXJjZTogdHNjLWVhcmx5OiBtYXNrOiAweGZmZmZmZmZmZmZm
ZmZmZmYgbWF4X2N5Y2xlczogMHgyM2ZhZGYyNzFmOCwgbWF4X2lkbGVfbnM6IDQ0MDc5NTMyODI1
NyBucwpbICAgIDAuNDk5ODU1XSBDYWxpYnJhdGluZyBkZWxheSBsb29wIChza2lwcGVkKSwgdmFs
dWUgY2FsY3VsYXRlZCB1c2luZyB0aW1lciBmcmVxdWVuY3kuLiA0OTkyLjIyIEJvZ29NSVBTIChs
cGo9MjQ5NjExMDApClsgICAgMC40OTk4NjRdIHBpZF9tYXg6IGRlZmF1bHQ6IDMyNzY4IG1pbmlt
dW06IDMwMQpbICAgIDAuNDk5OTQxXSBTZWN1cml0eSBGcmFtZXdvcmsgaW5pdGlhbGl6ZWQKWyAg
ICAwLjQ5OTk0Nl0gWWFtYTogYmVjb21pbmcgbWluZGZ1bC4KWyAgICAwLjQ5OTk3Ml0gTW91bnQt
Y2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVzOiAyMDQ4IChvcmRlcjogMiwgMTYzODQgYnl0ZXMpClsg
ICAgMC40OTk5ODBdIE1vdW50cG9pbnQtY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVzOiAyMDQ4IChv
cmRlcjogMiwgMTYzODQgYnl0ZXMpClsgICAgMC41MDAyNjNdIExhc3QgbGV2ZWwgaVRMQiBlbnRy
aWVzOiA0S0IgNjQsIDJNQiA4LCA0TUIgOApbICAgIDAuNTAwMjY5XSBMYXN0IGxldmVsIGRUTEIg
ZW50cmllczogNEtCIDY0LCAyTUIgMCwgNE1CIDAsIDFHQiA0ClsgICAgMC41MDAyNzVdIFNwZWN0
cmUgVjIgOiBWdWxuZXJhYmxlOiBNaW5pbWFsIGdlbmVyaWMgQVNNIHJldHBvbGluZQpbICAgIDAu
NTAwMjgwXSBTcGVjdHJlIFYyIDogU3BlY3RyZSB2MiAvIFNwZWN0cmVSU0IgbWl0aWdhdGlvbjog
RmlsbGluZyBSU0Igb24gY29udGV4dCBzd2l0Y2gKWyAgICAwLjUwMDI4Nl0gU3BlY3VsYXRpdmUg
U3RvcmUgQnlwYXNzOiBWdWxuZXJhYmxlClsgICAgMC41NTE5MjBdIEZyZWVpbmcgU01QIGFsdGVy
bmF0aXZlcyBtZW1vcnk6IDI0SwpbICAgIDAuNTUzMzE4XSBWUE1VIGRpc2FibGVkIGJ5IGh5cGVy
dmlzb3IuClsgICAgMC41NTM0ODddIFBlcmZvcm1hbmNlIEV2ZW50czogdW5zdXBwb3J0ZWQgcDYg
Q1BVIG1vZGVsIDc4IG5vIFBNVSBkcml2ZXIsIHNvZnR3YXJlIGV2ZW50cyBvbmx5LgpbICAgIDAu
NTUzNTU0XSByY3U6IEhpZXJhcmNoaWNhbCBTUkNVIGltcGxlbWVudGF0aW9uLgpbICAgIDAuNTUz
NzE1XSBOTUkgd2F0Y2hkb2c6IFBlcmYgTk1JIHdhdGNoZG9nIHBlcm1hbmVudGx5IGRpc2FibGVk
ClsgICAgMC41NTM4MDhdIHNtcDogQnJpbmdpbmcgdXAgc2Vjb25kYXJ5IENQVXMgLi4uClsgICAg
MC41NTM4MTNdIHNtcDogQnJvdWdodCB1cCAxIG5vZGUsIDEgQ1BVClsgICAgMC41NTM4MTddIHNt
cGJvb3Q6IE1heCBsb2dpY2FsIHBhY2thZ2VzOiAxClsgICAgMC41NTM5NzhdIGRldnRtcGZzOiBp
bml0aWFsaXplZApbICAgIDAuNTU0MDMzXSB4ODYvbW06IE1lbW9yeSBibG9jayBzaXplOiAxMjhN
QgpbICAgIDAuNTU0NDU5XSBjbG9ja3NvdXJjZTogamlmZmllczogbWFzazogMHhmZmZmZmZmZiBt
YXhfY3ljbGVzOiAweGZmZmZmZmZmLCBtYXhfaWRsZV9uczogMTkxMTI2MDQ0NjI3NTAwMDAgbnMK
WyAgICAwLjU1NDQ3MF0gZnV0ZXggaGFzaCB0YWJsZSBlbnRyaWVzOiAyNTYgKG9yZGVyOiAyLCAx
NjM4NCBieXRlcykKWyAgICAwLjU1NDY2OF0gTkVUOiBSZWdpc3RlcmVkIHByb3RvY29sIGZhbWls
eSAxNgpbICAgIDAuNTU0Njg5XSB4ZW46Z3JhbnRfdGFibGU6IEdyYW50IHRhYmxlcyB1c2luZyB2
ZXJzaW9uIDEgbGF5b3V0ClsgICAgMC41NTQ3MDVdIEdyYW50IHRhYmxlIGluaXRpYWxpemVkClsg
ICAgMC41NTQ4ODhdIGF1ZGl0OiBpbml0aWFsaXppbmcgbmV0bGluayBzdWJzeXMgKGRpc2FibGVk
KQpbICAgIDAuNTU0OTg4XSBhdWRpdDogdHlwZT0yMDAwIGF1ZGl0KDE1NjM1NjA1OTUuODYyOjEp
OiBzdGF0ZT1pbml0aWFsaXplZCBhdWRpdF9lbmFibGVkPTAgcmVzPTEKWyAgICAwLjU1NTE0Nl0g
QUNQSSBGQURUIGRlY2xhcmVzIHRoZSBzeXN0ZW0gZG9lc24ndCBzdXBwb3J0IFBDSWUgQVNQTSwg
c28gZGlzYWJsZSBpdApbICAgIDAuNTU1MTU0XSBBQ1BJOiBidXMgdHlwZSBQQ0kgcmVnaXN0ZXJl
ZApbICAgIDAuNTU1MzEwXSBQQ0k6IE1NQ09ORklHIGZvciBkb21haW4gMDAwMCBbYnVzIDAwLWZm
XSBhdCBbbWVtIDB4ZTAwMDAwMDAtMHhlZmZmZmZmZl0gKGJhc2UgMHhlMDAwMDAwMCkKWyAgICAw
LjU1NTMxOV0gUENJOiBNTUNPTkZJRyBhdCBbbWVtIDB4ZTAwMDAwMDAtMHhlZmZmZmZmZl0gcmVz
ZXJ2ZWQgaW4gRTgyMApbICAgIDAuNjEyMDM2XSBQQ0k6IFVzaW5nIGNvbmZpZ3VyYXRpb24gdHlw
ZSAxIGZvciBiYXNlIGFjY2VzcwpbICAgIDAuNjE0MDY3XSBjcnlwdGQ6IG1heF9jcHVfcWxlbiBz
ZXQgdG8gMTAwMApbICAgIDAuNjE0MjM1XSBBQ1BJOiBBZGRlZCBfT1NJKE1vZHVsZSBEZXZpY2Up
ClsgICAgMC42MTQyNDBdIEFDUEk6IEFkZGVkIF9PU0koUHJvY2Vzc29yIERldmljZSkKWyAgICAw
LjYxNDI0NF0gQUNQSTogQWRkZWQgX09TSSgzLjAgX1NDUCBFeHRlbnNpb25zKQpbICAgIDAuNjE0
MjQ5XSBBQ1BJOiBBZGRlZCBfT1NJKFByb2Nlc3NvciBBZ2dyZWdhdG9yIERldmljZSkKWyAgICAw
LjYxNDI1NF0gQUNQSTogQWRkZWQgX09TSShMaW51eC1EZWxsLVZpZGVvKQpbICAgIDAuNjE0MjU4
XSBBQ1BJOiBBZGRlZCBfT1NJKExpbnV4LUxlbm92by1OVi1IRE1JLUF1ZGlvKQpbICAgIDAuNjYz
MTYwXSBBQ1BJOiA4IEFDUEkgQU1MIHRhYmxlcyBzdWNjZXNzZnVsbHkgYWNxdWlyZWQgYW5kIGxv
YWRlZApbICAgIDAuNjY5NzYwXSBBQ1BJOiBbRmlybXdhcmUgQnVnXTogQklPUyBfT1NJKExpbnV4
KSBxdWVyeSBpZ25vcmVkClsgICAgMC42NzQ4NjddIEFDUEk6IER5bmFtaWMgT0VNIFRhYmxlIExv
YWQ6ClsgICAgMC42NzQ4NzldIEFDUEk6IFNTRFQgMHhGRkZGODg4MDNBMzE2NDAwIDAwMDM3RiAo
djAyIFBtUmVmICBDcHUwQ3N0ICAwMDAwMzAwMSBJTlRMIDIwMTIwOTEzKQpbICAgIDAuNjc1NTE0
XSBBQ1BJOiBEeW5hbWljIE9FTSBUYWJsZSBMb2FkOgpbICAgIDAuNjc1NTIzXSBBQ1BJOiBTU0RU
IDB4RkZGRjg4ODAzOTgxMTgwMCAwMDA2M0YgKHYwMiBQbVJlZiAgQ3B1MElzdCAgMDAwMDMwMDAg
SU5UTCAyMDEyMDkxMykKWyAgICAwLjY3Nzc2M10gQUNQSTogRUM6IEVDIHN0YXJ0ZWQKWyAgICAw
LjY3Nzc2OV0gQUNQSTogRUM6IGludGVycnVwdCBibG9ja2VkClsgICAgMC42Nzc4MjRdIEFDUEk6
IFxfU0JfLlBDSTAuTFBDQi5FQzBfOiBVc2VkIGFzIGZpcnN0IEVDClsgICAgMC42Nzc4MjldIEFD
UEk6IFxfU0JfLlBDSTAuTFBDQi5FQzBfOiBHUEU9MHg1MCwgRUNfQ01EL0VDX1NDPTB4NjYsIEVD
X0RBVEE9MHg2MgpbICAgIDAuNjc3ODM2XSBBQ1BJOiBcX1NCXy5QQ0kwLkxQQ0IuRUMwXzogVXNl
ZCBhcyBib290IERTRFQgRUMgdG8gaGFuZGxlIHRyYW5zYWN0aW9ucwpbICAgIDAuNjc3ODkzXSBB
Q1BJOiBJbnRlcnByZXRlciBlbmFibGVkClsgICAgMC42Nzc5MDVdIEFDUEk6IChzdXBwb3J0cyBT
MCBTNSkKWyAgICAwLjY3NzkwOV0gQUNQSTogVXNpbmcgSU9BUElDIGZvciBpbnRlcnJ1cHQgcm91
dGluZwpbICAgIDAuNjc3OTgxXSBQQ0k6IFVzaW5nIGhvc3QgYnJpZGdlIHdpbmRvd3MgZnJvbSBB
Q1BJOyBpZiBuZWNlc3NhcnksIHVzZSAicGNpPW5vY3JzIiBhbmQgcmVwb3J0IGEgYnVnClsgICAg
MC42NzkzMzhdIEFDUEk6IEVuYWJsZWQgNyBHUEVzIGluIGJsb2NrIDAwIHRvIDdGClsgICAgMC42
ODI2NjBdIEFDUEk6IFBvd2VyIFJlc291cmNlIFtQRzAwXSAob24pClsgICAgMC42ODMxMTNdIEFD
UEk6IFBvd2VyIFJlc291cmNlIFtQRzAxXSAob24pClsgICAgMC42ODM1OTBdIEFDUEk6IFBvd2Vy
IFJlc291cmNlIFtQRzAyXSAob24pClsgICAgMC42OTA0MjFdIEFDUEk6IFBvd2VyIFJlc291cmNl
IFtXUlNUXSAob24pClsgICAgMC42OTA4NzVdIEFDUEk6IFBvd2VyIFJlc291cmNlIFtXUlNUXSAo
b24pClsgICAgMC42OTEzMjRdIEFDUEk6IFBvd2VyIFJlc291cmNlIFtXUlNUXSAob24pClsgICAg
MC42OTE4MzJdIEFDUEk6IFBvd2VyIFJlc291cmNlIFtXUlNUXSAob24pClsgICAgMC42OTIyODZd
IEFDUEk6IFBvd2VyIFJlc291cmNlIFtXUlNUXSAob24pClsgICAgMC42OTI3MzldIEFDUEk6IFBv
d2VyIFJlc291cmNlIFtXUlNUXSAob24pClsgICAgMC42OTMyMjddIEFDUEk6IFBvd2VyIFJlc291
cmNlIFtXUlNUXSAob24pClsgICAgMC42OTM2OTZdIEFDUEk6IFBvd2VyIFJlc291cmNlIFtXUlNU
XSAob24pClsgICAgMC42OTQxNDRdIEFDUEk6IFBvd2VyIFJlc291cmNlIFtXUlNUXSAob24pClsg
ICAgMC42OTQ2NTBdIEFDUEk6IFBvd2VyIFJlc291cmNlIFtXUlNUXSAob24pClsgICAgMC42OTUx
MzldIEFDUEk6IFBvd2VyIFJlc291cmNlIFtXUlNUXSAob24pClsgICAgMC42OTU1NzFdIEFDUEk6
IFBvd2VyIFJlc291cmNlIFtXUlNUXSAob24pClsgICAgMC42OTYwNzFdIEFDUEk6IFBvd2VyIFJl
c291cmNlIFtXUlNUXSAob24pClsgICAgMC42OTY1MTldIEFDUEk6IFBvd2VyIFJlc291cmNlIFtX
UlNUXSAob24pClsgICAgMC42OTY5NzRdIEFDUEk6IFBvd2VyIFJlc291cmNlIFtXUlNUXSAob24p
ClsgICAgMC42OTc0ODFdIEFDUEk6IFBvd2VyIFJlc291cmNlIFtXUlNUXSAob24pClsgICAgMC42
OTc5MzRdIEFDUEk6IFBvd2VyIFJlc291cmNlIFtXUlNUXSAob24pClsgICAgMC42OTgzODddIEFD
UEk6IFBvd2VyIFJlc291cmNlIFtXUlNUXSAob24pClsgICAgMC42OTg4OTVdIEFDUEk6IFBvd2Vy
IFJlc291cmNlIFtXUlNUXSAob24pClsgICAgMC42OTkzNDhdIEFDUEk6IFBvd2VyIFJlc291cmNl
IFtXUlNUXSAob24pClsgICAgMC43MTQ5MDFdIEFDUEk6IFBvd2VyIFJlc291cmNlIFtGTjAwXSAo
b2ZmKQpbICAgIDAuNzE1MDE2XSBBQ1BJOiBQb3dlciBSZXNvdXJjZSBbRk4wMV0gKG9mZikKWyAg
ICAwLjcxNTEyNl0gQUNQSTogUG93ZXIgUmVzb3VyY2UgW0ZOMDJdIChvZmYpClsgICAgMC43MTUy
MzVdIEFDUEk6IFBvd2VyIFJlc291cmNlIFtGTjAzXSAob2ZmKQpbICAgIDAuNzE1NDAzXSBBQ1BJ
OiBQb3dlciBSZXNvdXJjZSBbRk4wNF0gKG9mZikKWyAgICAwLjcxNjk5N10gQUNQSTogUENJIFJv
b3QgQnJpZGdlIFtQQ0kwXSAoZG9tYWluIDAwMDAgW2J1cyAwMC1mZV0pClsgICAgMC43MTcwMTBd
IGFjcGkgUE5QMEEwODowMDogX09TQzogT1Mgc3VwcG9ydHMgW0V4dGVuZGVkQ29uZmlnIEFTUE0g
Q2xvY2tQTSBTZWdtZW50cyBNU0ldClsgICAgMC43MjAyODFdIGFjcGkgUE5QMEEwODowMDogX09T
QzogT1Mgbm93IGNvbnRyb2xzIFtQQ0llSG90cGx1ZyBTSFBDSG90cGx1ZyBQTUUgUENJZUNhcGFi
aWxpdHkgTFRSXQpbICAgIDAuNzIwMjg5XSBhY3BpIFBOUDBBMDg6MDA6IEZBRFQgaW5kaWNhdGVz
IEFTUE0gaXMgdW5zdXBwb3J0ZWQsIHVzaW5nIEJJT1MgY29uZmlndXJhdGlvbgpbICAgIDAuNzIx
MDEzXSBQQ0kgaG9zdCBicmlkZ2UgdG8gYnVzIDAwMDA6MDAKWyAgICAwLjcyMTAyMF0gcGNpX2J1
cyAwMDAwOjAwOiByb290IGJ1cyByZXNvdXJjZSBbaW8gIDB4MDAwMC0weDBjZjcgd2luZG93XQpb
ICAgIDAuNzIxMDI2XSBwY2lfYnVzIDAwMDA6MDA6IHJvb3QgYnVzIHJlc291cmNlIFtpbyAgMHgw
ZDAwLTB4ZmZmZiB3aW5kb3ddClsgICAgMC43MjEwMzJdIHBjaV9idXMgMDAwMDowMDogcm9vdCBi
dXMgcmVzb3VyY2UgW21lbSAweDAwMGEwMDAwLTB4MDAwYmZmZmYgd2luZG93XQpbICAgIDAuNzIx
MDM4XSBwY2lfYnVzIDAwMDA6MDA6IHJvb3QgYnVzIHJlc291cmNlIFttZW0gMHg5MDAwMDAwMC0w
eGRmZmZmZmZmIHdpbmRvd10KWyAgICAwLjcyMTA0NF0gcGNpX2J1cyAwMDAwOjAwOiByb290IGJ1
cyByZXNvdXJjZSBbbWVtIDB4ZmQwMDAwMDAtMHhmZTdmZmZmZiB3aW5kb3ddClsgICAgMC43MjEw
NTFdIHBjaV9idXMgMDAwMDowMDogcm9vdCBidXMgcmVzb3VyY2UgW2J1cyAwMC1mZV0KKFhFTikg
Qm9ndXMgRE1JQkFSIDB4ZmVkMTgwMDEgb24gMDAwMDowMDowMC4wClsgICAgMC43MjE4NDJdIHBj
aSAwMDAwOjAwOjAyLjA6IEJBUiAyOiBhc3NpZ25lZCB0byBlZmlmYgpbICAgIDAuNzI1MjkxXSBw
Y2kgMDAwMDowMDoxYy4wOiBJbnRlbCBTUFQgUENIIHJvb3QgcG9ydCBBQ1Mgd29ya2Fyb3VuZCBl
bmFibGVkClsgICAgMC43MjU4ODBdIHBjaSAwMDAwOjAwOjFjLjU6IEludGVsIFNQVCBQQ0ggcm9v
dCBwb3J0IEFDUyB3b3JrYXJvdW5kIGVuYWJsZWQKWyAgICAwLjcyOTk0NF0gcGNpIDAwMDA6MDA6
MWMuMDogUENJIGJyaWRnZSB0byBbYnVzIDAxXQpbICAgIDAuNzMwNzcyXSBwY2kgMDAwMDowMjow
MC4wOiAyLjAwMCBHYi9zIGF2YWlsYWJsZSBQQ0llIGJhbmR3aWR0aCwgbGltaXRlZCBieSAyLjUg
R1QvcyB4MSBsaW5rIGF0IDAwMDA6MDA6MWMuNSAoY2FwYWJsZSBvZiA3Ljg3NiBHYi9zIHdpdGgg
OCBHVC9zIHgxIGxpbmspClsgICAgMC43MzEwMzhdIHBjaSAwMDAwOjAwOjFjLjU6IFBDSSBicmlk
Z2UgdG8gW2J1cyAwMl0KWyAgICAwLjczNTU4OF0gQUNQSTogUENJIEludGVycnVwdCBMaW5rIFtM
TktBXSAoSVJRcyAzIDQgNSA2IDEwICoxMSAxMiAxNCAxNSkKWyAgICAwLjczNTY4MF0gQUNQSTog
UENJIEludGVycnVwdCBMaW5rIFtMTktCXSAoSVJRcyAzIDQgNSA2ICoxMCAxMSAxMiAxNCAxNSkK
WyAgICAwLjczNTc3MF0gQUNQSTogUENJIEludGVycnVwdCBMaW5rIFtMTktDXSAoSVJRcyAzIDQg
NSA2IDEwICoxMSAxMiAxNCAxNSkKWyAgICAwLjczNTg1NV0gQUNQSTogUENJIEludGVycnVwdCBM
aW5rIFtMTktEXSAoSVJRcyAzIDQgNSA2IDEwICoxMSAxMiAxNCAxNSkKWyAgICAwLjczNTk0M10g
QUNQSTogUENJIEludGVycnVwdCBMaW5rIFtMTktFXSAoSVJRcyAzIDQgNSA2IDEwICoxMSAxMiAx
NCAxNSkKWyAgICAwLjczNjA4NF0gQUNQSTogUENJIEludGVycnVwdCBMaW5rIFtMTktGXSAoSVJR
cyAzIDQgNSA2IDEwICoxMSAxMiAxNCAxNSkKWyAgICAwLjczNjE3M10gQUNQSTogUENJIEludGVy
cnVwdCBMaW5rIFtMTktHXSAoSVJRcyAzIDQgNSA2IDEwICoxMSAxMiAxNCAxNSkKWyAgICAwLjcz
NjI2M10gQUNQSTogUENJIEludGVycnVwdCBMaW5rIFtMTktIXSAoSVJRcyAzIDQgNSA2IDEwICox
MSAxMiAxNCAxNSkKWyAgICAwLjczNjk4MF0gQUNQSTogRUM6IGludGVycnVwdCB1bmJsb2NrZWQK
WyAgICAwLjczNzAyMF0gQUNQSTogRUM6IGV2ZW50IHVuYmxvY2tlZApbICAgIDAuNzM3MDQwXSBB
Q1BJOiBcX1NCXy5QQ0kwLkxQQ0IuRUMwXzogR1BFPTB4NTAsIEVDX0NNRC9FQ19TQz0weDY2LCBF
Q19EQVRBPTB4NjIKWyAgICAwLjczNzA3Ml0gQUNQSTogXF9TQl8uUENJMC5MUENCLkVDMF86IFVz
ZWQgYXMgYm9vdCBEU0RUIEVDIHRvIGhhbmRsZSB0cmFuc2FjdGlvbnMgYW5kIGV2ZW50cwpbICAg
IDAuNzM3MTI1XSB4ZW46YmFsbG9vbjogSW5pdGlhbGlzaW5nIGJhbGxvb24gZHJpdmVyClsgICAg
MC43MzcyNzFdIFNDU0kgc3Vic3lzdGVtIGluaXRpYWxpemVkClsgICAgMC43MzczNDJdIEFDUEk6
IGJ1cyB0eXBlIFVTQiByZWdpc3RlcmVkClsgICAgMC43MzczNjddIHVzYmNvcmU6IHJlZ2lzdGVy
ZWQgbmV3IGludGVyZmFjZSBkcml2ZXIgdXNiZnMKWyAgICAwLjczNzM3OF0gdXNiY29yZTogcmVn
aXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZlciBodWIKWyAgICAwLjczNzM5N10gdXNiY29yZTog
cmVnaXN0ZXJlZCBuZXcgZGV2aWNlIGRyaXZlciB1c2IKWyAgICAwLjczNzQ2NV0gcHBzX2NvcmU6
IExpbnV4UFBTIEFQSSB2ZXIuIDEgcmVnaXN0ZXJlZApbICAgIDAuNzM3NDY5XSBwcHNfY29yZTog
U29mdHdhcmUgdmVyLiA1LjMuNiAtIENvcHlyaWdodCAyMDA1LTIwMDcgUm9kb2xmbyBHaW9tZXR0
aSA8Z2lvbWV0dGlAbGludXguaXQ+ClsgICAgMC43Mzc0NzhdIFBUUCBjbG9jayBzdXBwb3J0IHJl
Z2lzdGVyZWQKWyAgICAwLjczNzUxN10gUmVnaXN0ZXJlZCBlZml2YXJzIG9wZXJhdGlvbnMKWyAg
ICAwLjc0MjQ2Ml0gUENJOiBVc2luZyBBQ1BJIGZvciBJUlEgcm91dGluZwpbICAgIDAuNzgyMzc4
XSBOZXRMYWJlbDogSW5pdGlhbGl6aW5nClsgICAgMC43ODIzODNdIE5ldExhYmVsOiAgZG9tYWlu
IGhhc2ggc2l6ZSA9IDEyOApbICAgIDAuNzgyMzg3XSBOZXRMYWJlbDogIHByb3RvY29scyA9IFVO
TEFCRUxFRCBDSVBTT3Y0IENBTElQU08KWyAgICAwLjc4MjQwN10gTmV0TGFiZWw6ICB1bmxhYmVs
ZWQgdHJhZmZpYyBhbGxvd2VkIGJ5IGRlZmF1bHQKWyAgICAwLjc4MjU5OV0gY2xvY2tzb3VyY2U6
IFN3aXRjaGVkIHRvIGNsb2Nrc291cmNlIHRzYy1lYXJseQpbICAgIDAuNzk3MDE2XSBWRlM6IERp
c2sgcXVvdGFzIGRxdW90XzYuNi4wClsgICAgMC43OTcwMTZdIFZGUzogRHF1b3QtY2FjaGUgaGFz
aCB0YWJsZSBlbnRyaWVzOiA1MTIgKG9yZGVyIDAsIDQwOTYgYnl0ZXMpClsgICAgMC43OTcwMTZd
IEZTLUNhY2hlOiBMb2FkZWQKWyAgICAwLjc5NzAxNl0gaHVnZXRsYmZzOiBkaXNhYmxpbmcgYmVj
YXVzZSB0aGVyZSBhcmUgbm8gc3VwcG9ydGVkIGh1Z2VwYWdlIHNpemVzClsgICAgMC43OTcwMTZd
IENhY2hlRmlsZXM6IExvYWRlZApbICAgIDAuNzk3MDE2XSBwbnA6IFBuUCBBQ1BJIGluaXQKWyAg
ICAwLjc5NzAxNl0gc3lzdGVtIDAwOjAwOiBbaW8gIDB4MGEwMC0weDBhMmZdIGhhcyBiZWVuIHJl
c2VydmVkClsgICAgMC43OTcwMTZdIEFscmVhZHkgc2V0dXAgdGhlIEdTSSA6NApbICAgIDAuODAw
ODc0XSBzeXN0ZW0gMDA6MDU6IFtpbyAgMHgwMjAwLTB4MDI3Zl0gaGFzIGJlZW4gcmVzZXJ2ZWQK
WyAgICAwLjgwMTczOV0gc3lzdGVtIDAwOjA2OiBbaW8gIDB4MDI5Yy0weDAyOWRdIGhhcyBiZWVu
IHJlc2VydmVkClsgICAgMC44MDE5ODhdIHN5c3RlbSAwMDowNzogW2lvICAweDA2ODAtMHgwNjlm
XSBoYXMgYmVlbiByZXNlcnZlZApbICAgIDAuODAxOTk1XSBzeXN0ZW0gMDA6MDc6IFtpbyAgMHhm
ZmZmXSBoYXMgYmVlbiByZXNlcnZlZApbICAgIDAuODAyMDAwXSBzeXN0ZW0gMDA6MDc6IFtpbyAg
MHhmZmZmXSBoYXMgYmVlbiByZXNlcnZlZApbICAgIDAuODAyMDA1XSBzeXN0ZW0gMDA6MDc6IFtp
byAgMHhmZmZmXSBoYXMgYmVlbiByZXNlcnZlZApbICAgIDAuODAyMDEwXSBzeXN0ZW0gMDA6MDc6
IFtpbyAgMHgxODAwLTB4MThmZV0gaGFzIGJlZW4gcmVzZXJ2ZWQKWyAgICAwLjgwMjAxNl0gc3lz
dGVtIDAwOjA3OiBbaW8gIDB4MTY0ZS0weDE2NGZdIGhhcyBiZWVuIHJlc2VydmVkClsgICAgMC44
MDIyMTRdIHN5c3RlbSAwMDowOTogW2lvICAweDE4NTQtMHgxODU3XSBoYXMgYmVlbiByZXNlcnZl
ZApbICAgIDAuODAyNTkzXSBzeXN0ZW0gMDA6MGE6IFttZW0gMHhmZWQxMDAwMC0weGZlZDE3ZmZm
XSBoYXMgYmVlbiByZXNlcnZlZApbICAgIDAuODAyNjAwXSBzeXN0ZW0gMDA6MGE6IFttZW0gMHhm
ZWQxODAwMC0weGZlZDE4ZmZmXSBoYXMgYmVlbiByZXNlcnZlZApbICAgIDAuODAyNjA2XSBzeXN0
ZW0gMDA6MGE6IFttZW0gMHhmZWQxOTAwMC0weGZlZDE5ZmZmXSBoYXMgYmVlbiByZXNlcnZlZApb
ICAgIDAuODAyNjExXSBzeXN0ZW0gMDA6MGE6IFttZW0gMHhlMDAwMDAwMC0weGVmZmZmZmZmXSBo
YXMgYmVlbiByZXNlcnZlZApbICAgIDAuODAyNjE3XSBzeXN0ZW0gMDA6MGE6IFttZW0gMHhmZWQy
MDAwMC0weGZlZDNmZmZmXSBoYXMgYmVlbiByZXNlcnZlZApbICAgIDAuODAyNjIzXSBzeXN0ZW0g
MDA6MGE6IFttZW0gMHhmZWQ5MDAwMC0weGZlZDkzZmZmXSBjb3VsZCBub3QgYmUgcmVzZXJ2ZWQK
WyAgICAwLjgwMjYyOV0gc3lzdGVtIDAwOjBhOiBbbWVtIDB4ZmVkNDUwMDAtMHhmZWQ4ZmZmZl0g
aGFzIGJlZW4gcmVzZXJ2ZWQKWyAgICAwLjgwMjYzNV0gc3lzdGVtIDAwOjBhOiBbbWVtIDB4ZmYw
MDAwMDAtMHhmZmZmZmZmZl0gaGFzIGJlZW4gcmVzZXJ2ZWQKWyAgICAwLjgwMjY0MF0gc3lzdGVt
IDAwOjBhOiBbbWVtIDB4ZmVlMDAwMDAtMHhmZWVmZmZmZl0gaGFzIGJlZW4gcmVzZXJ2ZWQKWyAg
ICAwLjgwMjY0Nl0gc3lzdGVtIDAwOjBhOiBbbWVtIDB4ZGZmZTAwMDAtMHhkZmZmZmZmZl0gaGFz
IGJlZW4gcmVzZXJ2ZWQKWyAgICAwLjgwMjcwMl0gc3lzdGVtIDAwOjBiOiBbbWVtIDB4ZmQwMDAw
MDAtMHhmZGFiZmZmZl0gaGFzIGJlZW4gcmVzZXJ2ZWQKWyAgICAwLjgwMjcwOF0gc3lzdGVtIDAw
OjBiOiBbbWVtIDB4ZmRhZDAwMDAtMHhmZGFkZmZmZl0gaGFzIGJlZW4gcmVzZXJ2ZWQKWyAgICAw
LjgwMjcxNF0gc3lzdGVtIDAwOjBiOiBbbWVtIDB4ZmRiMDAwMDAtMHhmZGZmZmZmZl0gaGFzIGJl
ZW4gcmVzZXJ2ZWQKWyAgICAwLjgwMjcyMF0gc3lzdGVtIDAwOjBiOiBbbWVtIDB4ZmUwMDAwMDAt
MHhmZTAxZmZmZl0gY291bGQgbm90IGJlIHJlc2VydmVkClsgICAgMC44MDI3MjZdIHN5c3RlbSAw
MDowYjogW21lbSAweGZlMDM2MDAwLTB4ZmUwM2JmZmZdIGhhcyBiZWVuIHJlc2VydmVkClsgICAg
MC44MDJbICAgIDEuNTY0MDcyXSBsb29wOiBtb2R1bGUgbG9hZGVkClsgICAgMS41NjY4MjNdIElu
dmFsaWQgbWF4X3F1ZXVlcyAoNCksIHdpbGwgdXNlIGRlZmF1bHQgbWF4OiAxLgpbICAgIDEuNTY3
MzMyXSBWTXdhcmUgUFZTQ1NJIGRyaXZlciAtIHZlcnNpb24gMS4wLjcuMC1rClsgICAgMS41Njc3
MDNdIGh2X3ZtYnVzOiByZWdpc3RlcmluZyBkcml2ZXIgaHZfc3RvcnZzYwpbICAgIDEuNTY4NDc0
XSBBbHJlYWR5IHNldHVwIHRoZSBHU0kgOjE2ClsgICAgMS41Nzg5ODZdIGFoY2kgMDAwMDowMDox
Ny4wOiBBSENJIDAwMDEuMDMwMSAzMiBzbG90cyAyIHBvcnRzIDYgR2JwcyAweDMgaW1wbCBTQVRB
IG1vZGUKWyAgICAxLjU3OTYwNF0gYWhjaSAwMDAwOjAwOjE3LjA6IGZsYWdzOiA2NGJpdCBuY3Eg
cG0gbGVkIGNsbyBvbmx5IHBpbyBzbHVtIHBhcnQgZGVzbyBzYWRtIHNkcyBhcHN0ClsgICAgMS41
ODA2MDddIHNjc2kgaG9zdDA6IGFoY2kKWyAgICAxLjU4MDg5Nl0gc2NzaSBob3N0MTogYWhjaQpb
ICAgIDEuNTgxMTIxXSBhdGExOiBTQVRBIG1heCBVRE1BLzEzMyBhYmFyIG0yMDQ4QDB4ZGY0NGIw
MDAgcG9ydCAweGRmNDRiMTAwIGlycSAxMzEKWyAgICAxLjU4MTYzNl0gYXRhMjogU0FUQSBtYXgg
VURNQS8xMzMgYWJhciBtMjA0OEAweGRmNDRiMDAwIHBvcnQgMHhkZjQ0YjE4MCBpcnEgMTMxClsg
ICAgMS41ODI0NTFdIHR1bjogVW5pdmVyc2FsIFRVTi9UQVAgZGV2aWNlIGRyaXZlciwgMS42Clsg
ICAgMS41ODI4MzJdIFZNd2FyZSB2bXhuZXQzIHZpcnR1YWwgTklDIGRyaXZlciAtIHZlcnNpb24g
MS40LjE2LjAtay1OQVBJClsgICAgMS41ODMyNDZdIHhlbl9uZXRmcm9udDogSW5pdGlhbGlzaW5n
IFhlbiB2aXJ0dWFsIGV0aGVybmV0IGRyaXZlcgpbICAgIDEuNTgzNjA5XSBodl92bWJ1czogcmVn
aXN0ZXJpbmcgZHJpdmVyIGh2X25ldHZzYwpbICAgIDEuNTgzODc1XSBGdXNpb24gTVBUIGJhc2Ug
ZHJpdmVyIDMuMDQuMjAKWyAgICAxLjU4NDA5M10gQ29weXJpZ2h0IChjKSAxOTk5LTIwMDggTFNJ
IENvcnBvcmF0aW9uClsgICAgMS41ODQzODJdIEZ1c2lvbiBNUFQgU1BJIEhvc3QgZHJpdmVyIDMu
MDQuMjAKWyAgICAxLjYwMTk3NF0gZWhjaV9oY2Q6IFVTQiAyLjAgJ0VuaGFuY2VkJyBIb3N0IENv
bnRyb2xsZXIgKEVIQ0kpIERyaXZlcgpbICAgIDEuNjE5NjM3XSBlaGNpLXBjaTogRUhDSSBQQ0kg
cGxhdGZvcm0gZHJpdmVyClsgICAgMS42MzcxOTddIG9oY2lfaGNkOiBVU0IgMS4xICdPcGVuJyBI
b3N0IENvbnRyb2xsZXIgKE9IQ0kpIERyaXZlcgpbICAgIDEuNjU0OTQ0XSBvaGNpLXBjaTogT0hD
SSBQQ0kgcGxhdGZvcm0gZHJpdmVyClsgICAgMS42NzI3MTFdIHVoY2lfaGNkOiBVU0IgVW5pdmVy
c2FsIEhvc3QgQ29udHJvbGxlciBJbnRlcmZhY2UgZHJpdmVyClsgICAgMS42OTA3MDFdIEFscmVh
ZHkgc2V0dXAgdGhlIEdTSSA6MTYKWyAgICAxLjcwODU3Nl0geGhjaV9oY2QgMDAwMDowMDoxNC4w
OiB4SENJIEhvc3QgQ29udHJvbGxlcgpbICAgIDEuNzI2NDI3XSB4aGNpX2hjZCAwMDAwOjAwOjE0
LjA6IG5ldyBVU0IgYnVzIHJlZ2lzdGVyZWQsIGFzc2lnbmVkIGJ1cyBudW1iZXIgMQpbICAgIDEu
NzQ1Mjc1XSB4aGNpX2hjZCAwMDAwOjAwOjE0LjA6IGhjYyBwYXJhbXMgMHgyMDAwNzdjMSBoY2kg
dmVyc2lvbiAweDEwMCBxdWlya3MgMHgwMDAwMDAwMDAxMTA5ODEwClsgICAgMS43NjM4MTRdIGh1
YiAxLTA6MS4wOiBVU0IgaHViIGZvdW5kClsgICAgMS43ODE5MjVdIGh1YiAxLTA6MS4wOiAxMiBw
b3J0cyBkZXRlY3RlZApbICAgIDEuODAxMTI0XSB4aGNpX2hjZCAwMDAwOjAwOjE0LjA6IHhIQ0kg
SG9zdCBDb250cm9sbGVyClsgICAgMS44MTkzNTldIHhoY2lfaGNkIDAwMDA6MDA6MTQuMDogbmV3
IFVTQiBidXMgcmVnaXN0ZXJlZCwgYXNzaWduZWQgYnVzIG51bWJlciAyClsgICAgMS44Mzc3MzVd
IHhoY2lfaGNkIDAwMDA6MDA6MTQuMDogSG9zdCBzdXBwb3J0cyBVU0IgMy4wICBTdXBlclNwZWVk
ClsgICAgMS44NTYzMDBdIGh1YiAyLTA6MS4wOiBVU0IgaHViIGZvdW5kClsgICAgMS44NzQ3ODRd
IGNsb2Nrc291cmNlOiB0c2M6IG1hc2s6IDB4ZmZmZmZmZmZmZmZmZmZmZiBtYXhfY3ljbGVzOiAw
eDIzZmFkZjI3MWY4LCBtYXhfaWRsZV9uczogNDQwNzk1MzI4MjU3IG5zClsgICAgMS44OTM3MjJd
IGh1YiAyLTA6MS4wOiA2IHBvcnRzIGRldGVjdGVkClsgICAgMS45MTI1NTVdIGNsb2Nrc291cmNl
OiBTd2l0Y2hlZCB0byBjbG9ja3NvdXJjZSB0c2MKWyAgICAxLjkzMTc5M10gdXNiOiBwb3J0IHBv
d2VyIG1hbmFnZW1lbnQgbWF5IGJlIHVucmVsaWFibGUKWyAgICAxLjk1MDc5M10gYXRhMTogU0FU
QSBsaW5rIHVwIDYuMCBHYnBzIChTU3RhdHVzIDEzMyBTQ29udHJvbCAzMDApClsgICAgMS45NzA0
MDldIHVzYmNvcmU6IHJlZ2lzdGVyZWQgbmV3IGludGVyZmFjZSBkcml2ZXIgdXNiLXN0b3JhZ2UK
WyAgICAxLjk4ODIzOV0gaTgwNDI6IFBOUDogTm8gUFMvMiBjb250cm9sbGVyIGZvdW5kLgpbICAg
IDIuMDA3MTkzXSBpODA0MjogUHJvYmluZyBwb3J0cyBkaXJlY3RseS4KWyAgICAyLjAyNzQzMV0g
YXRhMS4wMDogQVRBLTk6IFNRRi1TMjVNOC02NEctU0FDLCBTQUZNMDJBMywgbWF4IFVETUEvMTMz
ClsgICAgMi4wNDY0NzJdIGF0YTEuMDA6IDEyNTA0NTQyNCBzZWN0b3JzLCBtdWx0aSAxNjogTEJB
NDggTkNRIChkZXB0aCAzMiksIEFBClsgICAgMi4wNjU2MTJdIGF0YTI6IFNBVEEgbGluayBkb3du
IChTU3RhdHVzIDQgU0NvbnRyb2wgMzAwKQpbICAgIDIuMDg3NTczXSBhdGExLjAwOiBjb25maWd1
cmVkIGZvciBVRE1BLzEzMwpbICAgIDIuMTA2NDU2XSBzY3NpIDA6MDowOjA6IERpcmVjdC1BY2Nl
c3MgICAgIEFUQSAgICAgIFNRRi1TMjVNOC02NEctU0EgMDJBMyBQUTogMCBBTlNJOiA1ClsgICAg
Mi4xMjc5ODRdIHNlcmlvOiBpODA0MiBLQkQgcG9ydCBhdCAweDYwLDB4NjQgaXJxIDEKWyAgICAy
LjE0NTQ1NV0gc2QgMDowOjA6MDogQXR0YWNoZWQgc2NzaSBnZW5lcmljIHNnMCB0eXBlIDAKWyAg
ICAyLjE2NDEwNV0gc2QgMDowOjA6MDogW3NkYV0gMTI1MDQ1NDI0IDUxMi1ieXRlIGxvZ2ljYWwg
YmxvY2tzOiAoNjQuMCBHQi81OS42IEdpQikKWyAgICAyLjE4Mjg3OF0gc2VyaW86IGk4MDQyIEFV
WCBwb3J0IGF0IDB4NjAsMHg2NCBpcnEgMTIKWyAgICAyLjIwMTU1MF0gc2QgMDowOjA6MDogW3Nk
YV0gV3JpdGUgUHJvdGVjdCBpcyBvZmYKWyAgICAyLjIyMDE4OV0gaHZfdm1idXM6IHJlZ2lzdGVy
aW5nIGRyaXZlciBoeXBlcnZfa2V5Ym9hcmQKWyAgICAyLjIzODc2Ml0gdXNiIDEtMTogbmV3IGxv
dy1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciAyIHVzaW5nIHhoY2lfaGNkClsgICAgMi4yNTc0NzZd
IHNkIDA6MDowOjA6IFtzZGFdIFdyaXRlIGNhY2hlOiBlbmFibGVkLCByZWFkIGNhY2hlOiBlbmFi
bGVkLCBkb2Vzbid0IHN1cHBvcnQgRFBPIG9yIEZVQQpbICAgIDIuMjc2NTE3XSBtb3VzZWRldjog
UFMvMiBtb3VzZSBkZXZpY2UgY29tbW9uIGZvciBhbGwgbWljZQpbICAgIDIuMjk1OTA0XSBpbnB1
dDogUEMgU3BlYWtlciBhcyAvZGV2aWNlcy9wbGF0Zm9ybS9wY3Nwa3IvaW5wdXQvaW5wdXQ0Clsg
ICAgMi4zMTIzOTddIHJ0Y19jbW9zIDAwOjA4OiBSVEMgY2FuIHdha2UgZnJvbSBTNApbICAgIDIu
MzMyMjcyXSBydGNfY21vcyAwMDowODogcmVnaXN0ZXJlZCBhcyBydGMwClsgICAgMi4zNDk3ODBd
IHJ0Y19jbW9zIDAwOjA4OiBhbGFybXMgdXAgdG8gb25lIG1vbnRoLCB5M2ssIDI0MiBieXRlcyBu
dnJhbQpbICAgIDIuMzY3NjU2XSBpMmMgL2RldiBlbnRyaWVzIGRyaXZlcgpbICAgIDIuMzg0MjY0
XSBkZXZpY2UtbWFwcGVyOiBpb2N0bDogNC4zOS4wLWlvY3RsICgyMDE4LTA0LTAzKSBpbml0aWFs
aXNlZDogZG0tZGV2ZWxAcmVkaGF0LmNvbQpbICAgIDIuNDAyNTgyXSAgc2RhOiBzZGExIHNkYTIg
c2RhMyBzZGE0IHNkYTkKWyAgICAyLjQyMjIzM10gaW5wdXQ6IEFUIFRyYW5zbGF0ZWQgU2V0IDIg
a2V5Ym9hcmQgYXMgL2RldmljZXMvcGxhdGZvcm0vaTgwNDIvc2VyaW8wL2lucHV0L2lucHV0Mwpb
ICAgIDIuNDQyMTY0XSBzZGhjaTogU2VjdXJlIERpZ2l0YWwgSG9zdCBDb250cm9sbGVyIEludGVy
ZmFjZSBkcml2ZXIKWyAgICAyLjQ2MTg1M10gc2RoY2k6IENvcHlyaWdodChjKSBQaWVycmUgT3Nz
bWFuClsgICAgMi40ODE1MjldIHNkIDA6MDowOjA6IFtzZGFdIEF0dGFjaGVkIFNDU0kgZGlzawpb
ICAgIDIuNTAxMjc3XSBzZGhjaS1wbHRmbTogU0RIQ0kgcGxhdGZvcm0gYW5kIE9GIGRyaXZlciBo
ZWxwZXIKWyAgICAyLjUyMjA3OV0gRUZJIFZhcmlhYmxlcyBGYWNpbGl0eSB2MC4wOCAyMDA0LU1h
eS0xNwpbICAgIDIuNTQ3MTI5XSBwc3RvcmU6IFJlZ2lzdGVyZWQgZWZpIGFzIHBlcnNpc3RlbnQg
c3RvcmUgYmFja2VuZApbICAgIDIuNTY1MzM4XSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRl
cmZhY2UgZHJpdmVyIHVzYmhpZApbICAgIDIuNTgzMzk2XSB1c2JoaWQ6IFVTQiBISUQgY29yZSBk
cml2ZXIKWyAgICAyLjYwMjYxMl0gaHZfdXRpbHM6IFJlZ2lzdGVyaW5nIEh5cGVyViBVdGlsaXR5
IERyaXZlcgpbICAgIDIuNjIwMjc0XSBodl92bWJ1czogcmVnaXN0ZXJpbmcgZHJpdmVyIGh2X3V0
aWwKWyAgICAyLjYzOTQyNl0gaHZfdm1idXM6IHJlZ2lzdGVyaW5nIGRyaXZlciBodl9iYWxsb29u
ClsgICAgMi42NTc5NDJdIG9wcm9maWxlOiB1c2luZyBOTUkgdGltZXIgaW50ZXJydXB0LgpbICAg
IDIuNjc1MzI4XSBHQUNUIHByb2JhYmlsaXR5IG9uClsgICAgMi42OTIzOThdIE1pcnJvci9yZWRp
cmVjdCBhY3Rpb24gb24KWyAgICAyLjcwOTI4N10gU2ltcGxlIFRDIGFjdGlvbiBMb2FkZWQKWyAg
ICAyLjcyNjE5NF0gdTMyIGNsYXNzaWZpZXIKWyAgICAyLjc0MjgzOV0gICAgIFBlcmZvcm1hbmNl
IGNvdW50ZXJzIG9uClsgICAgMi43NjA4OTVdICAgICBpbnB1dCBkZXZpY2UgY2hlY2sgb24KWyAg
ICAyLjc3ODc1NV0gICAgIEFjdGlvbnMgY29uZmlndXJlZApbICAgIDIuNzk2NjY4XSB4dF90aW1l
OiBrZXJuZWwgdGltZXpvbmUgaXMgLTAwMDAKWyAgICAyLjgxMzE3Nl0gSVBWUzogUmVnaXN0ZXJl
ZCBwcm90b2NvbHMgKFRDUCwgVURQLCBTQ1RQLCBBSCwgRVNQKQpbICAgIDIuODI5ODYyXSBpbnB1
dDogTG9naXRlY2ggVVNCIEtleWJvYXJkIGFzIC9kZXZpY2VzL3BjaTAwMDA6MDAvMDAwMDowMDox
NC4wL3VzYjEvMS0xLzEtMToxLjAvMDAwMzowNDZEOkMzMUMuMDAwMS9pbnB1dC9pbnB1dDYKWyAg
ICAyLjg0NzIzOV0gSVBWUzogQ29ubmVjdGlvbiBoYXNoIHRhYmxlIGNvbmZpZ3VyZWQgKHNpemU9
NDA5NiwgbWVtb3J5PTY0S2J5dGVzKQpbICAgIDIuODY1OTg3XSBJUFZTOiBpcHZzIGxvYWRlZC4K
WyAgICAyLjg4NDE3OF0gSVBWUzogW3JyXSBzY2hlZHVsZXIgcmVnaXN0ZXJlZC4KWyAgICAyLjkw
MjQwMV0gSVBWUzogW3dycl0gc2NoZWR1bGVyIHJlZ2lzdGVyZWQuClsgICAgMi45MjA1NDldIElQ
VlM6IFtsY10gc2NoZWR1bGVyIHJlZ2lzdGVyZWQuClsgICAgMi45Mzg2OTFdIGhpZC1nZW5lcmlj
IDAwMDM6MDQ2RDpDMzFDLjAwMDE6IGlucHV0OiBVU0IgSElEIHYxLjEwIEtleWJvYXJkIFtMb2dp
dGVjaCBVU0IgS2V5Ym9hcmRdIG9uIHVzYi0wMDAwOjAwOjE0LjAtMS9pbnB1dDAKWyAgICAyLjk1
NzYxOF0gSVBWUzogW3dsY10gc2NoZWR1bGVyIHJlZ2lzdGVyZWQuClsgICAgMi45NzYwOTZdIElQ
VlM6IFtmb10gc2NoZWR1bGVyIHJlZ2lzdGVyZWQuClsgICAgMi45OTMzMTJdIElQVlM6IFtvdmZd
IHNjaGVkdWxlciByZWdpc3RlcmVkLgpbICAgIDMuMDEwMzQyXSBJUFZTOiBbbGJsY10gc2NoZWR1
bGVyIHJlZ2lzdGVyZWQuClsgICAgMy4wMjc1MjldIGlucHV0OiBMb2dpdGVjaCBVU0IgS2V5Ym9h
cmQgQ29uc3VtZXIgQ29udHJvbCBhcyAvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MTQuMC91
c2IxLzEtMS8xLTE6MS4xLzAwMDM6MDQ2RDpDMzFDLjAwMDIvaW5wdXQvaW5wdXQ3ClsgICAgMy4w
NDcwOTRdIElQVlM6IFtsYmxjcl0gc2NoZWR1bGVyIHJlZ2lzdGVyZWQuClsgICAgMy4wNjYxOTRd
IElQVlM6IFtkaF0gc2NoZWR1bGVyIHJlZ2lzdGVyZWQuClsgICAgMy4wODQ5NDNdIElQVlM6IFtz
aF0gc2NoZWR1bGVyIHJlZ2lzdGVyZWQuClsgICAgMy4xMDMxNzBdIHJhbmRvbTogZmFzdCBpbml0
IGRvbmUKWyAgICAzLjEyMTM5M10gSVBWUzogW3NlZF0gc2NoZWR1bGVyIHJlZ2lzdGVyZWQuClsg
ICAgMy4xMzk2NTVdIGlucHV0OiBMb2dpdGVjaCBVU0IgS2V5Ym9hcmQgU3lzdGVtIENvbnRyb2wg
YXMgL2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjE0LjAvdXNiMS8xLTEvMS0xOjEuMS8wMDAz
OjA0NkQ6QzMxQy4wMDAyL2lucHV0L2lucHV0OApbICAgIDMuMTU4OTk5XSBJUFZTOiBbbnFdIHNj
aGVkdWxlciByZWdpc3RlcmVkLgpbICAgIDMuMTc3OTQ4XSBoaWQtZ2VuZXJpYyAwMDAzOjA0NkQ6
QzMxQy4wMDAyOiBpbnB1dDogVVNCIEhJRCB2MS4xMCBEZXZpY2UgW0xvZ2l0ZWNoIFVTQiBLZXli
b2FyZF0gb24gdXNiLTAwMDA6MDA6MTQuMC0xL2lucHV0MQpbICAgIDMuMTk3NjYzXSBJUFZTOiBm
dHA6IGxvYWRlZCBzdXBwb3J0IG9uIHBvcnRbMF0gPSAyMQpbICAgIDMuMjE3NDg1XSBpcGlwOiBJ
UHY0IGFuZCBNUExTIG92ZXIgSVB2NCB0dW5uZWxpbmcgZHJpdmVyClsgICAgMy4yMzcxNzVdIGdy
ZTogR1JFIG92ZXIgSVB2NCBkZW11bHRpcGxleG9yIGRyaXZlcgpbICAgIDMuMjU2NzkyXSBpcHRf
Q0xVU1RFUklQOiBDbHVzdGVySVAgVmVyc2lvbiAwLjggbG9hZGVkIHN1Y2Nlc3NmdWxseQpbICAg
IDMuMjc1NjkyXSBJbml0aWFsaXppbmcgWEZSTSBuZXRsaW5rIHNvY2tldApbICAgIDMuMjk1MjQx
XSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5IDEwClsgICAgMy4zMTQ4MDNdIFNlZ21l
bnQgUm91dGluZyB3aXRoIElQdjYKWyAgICAzLjMzNDEyOV0gTkVUOiBSZWdpc3RlcmVkIHByb3Rv
Y29sIGZhbWlseSAxNwpbICAgIDMuMzUzMzQ4XSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFt
aWx5IDE1ClsgICAgMy4zNzIyNDJdIHVzYiAxLTc6IG5ldyBmdWxsLXNwZWVkIFVTQiBkZXZpY2Ug
bnVtYmVyIDMgdXNpbmcgeGhjaV9oY2QKWyAgICAzLjM5MTI3MF0gQnJpZGdlIGZpcmV3YWxsaW5n
IHJlZ2lzdGVyZWQKWyAgICAzLjQxMDI0Nl0gODAyMXE6IDgwMi4xUSBWTEFOIFN1cHBvcnQgdjEu
OApbICAgIDMuNDI3ODEwXSA5cG5ldDogSW5zdGFsbGluZyA5UDIwMDAgc3VwcG9ydApbICAgIDMu
NDQ2NTg1XSBLZXkgdHlwZSBkbnNfcmVzb2x2ZXIgcmVnaXN0ZXJlZApbICAgIDMuNDY1MTkxXSBB
VlgyIHZlcnNpb24gb2YgZ2NtX2VuYy9kZWMgZW5nYWdlZC4KWyAgICAzLjQ4MzQ4N10gQUVTIENU
UiBtb2RlIGJ5OCBvcHRpbWl6YXRpb24gZW5hYmxlZApbICAgIDMuNTAwOTEwXSBzY2hlZF9jbG9j
azogTWFya2luZyBzdGFibGUgKDM0ODM5Nzk0ODIsIDE2MzI0MzkzKS0+KDM1MDMyOTAwMTYsIC0y
OTg2MTQxKQpbICAgIDMuNTE5NjE3XSByZWdpc3RlcmVkIHRhc2tzdGF0cyB2ZXJzaW9uIDEKWyAg
ICAzLjUzODA0Ml0gTG9hZGluZyBjb21waWxlZC1pbiBYLjUwOSBjZXJ0aWZpY2F0ZXMKWyAgICAz
LjU1Njc4NV0gS2V5IHR5cGUgYmlnX2tleSByZWdpc3RlcmVkClsgICAgMy41NzUzNDddIEtleSB0
eXBlIGVuY3J5cHRlZCByZWdpc3RlcmVkClsgICAgMy41OTQ1MjBdIHJ0Y19jbW9zIDAwOjA4OiBz
ZXR0aW5nIHN5c3RlbSBjbG9jayB0byAyMDE5LTA3LTE5IDE4OjIzOjE5IFVUQyAoMTU2MzU2MDU5
OSkKWyAgICAzLjYxMzEwNF0gV2FpdGluZyAzIHNlYyBiZWZvcmUgbW91bnRpbmcgcm9vdCBkZXZp
Y2UuLi4KKFhFTikgcHJpbnRrOiA0Njg2NjIgbWVzc2FnZXMgc3VwcHJlc3NlZC4KKFhFTikgW1ZU
LURdRE1BUjpbRE1BIFJlYWRdIFJlcXVlc3QgZGV2aWNlIFswMDAwOjAwOjAyLjBdIGZhdWx0IGFk
ZHIgOGUyOGUwMDAsIGlvbW11IHJlZyA9IGZmZmY4MmMwMDAyMWQwMDAKWyAgICA2LjY2NTUwN10g
VkZTOiBNb3VudGVkIHJvb3QgKHNxdWFzaGZzIGZpbGVzeXN0ZW0pIHJlYWRvbmx5IG9uIGRldmlj
ZSA4OjIuClsgICAgNi42ODc5MDddIEZyZWVpbmcgdW51c2VkIGtlcm5lbCBpbWFnZSBtZW1vcnk6
IDE1ODRLClsgICAgNi43MTk4NTBdIFdyaXRlIHByb3RlY3RpbmcgdGhlIGtlcm5lbCByZWFkLW9u
bHkgZGF0YTogMTg0MzJrClsgICAgNi43NDkxODJdIEZyZWVpbmcgdW51c2VkIGtlcm5lbCBpbWFn
ZSBtZW1vcnk6IDIwMjBLClsgICAgNi43Njc4ODldIEZyZWVpbmcgdW51c2VkIGtlcm5lbCBpbWFn
ZSBtZW1vcnk6IDEwMjhLClsgICAgNi43ODU4NDhdIFJ1biAvc2Jpbi9pbml0IGFzIGluaXQgcHJv
Y2VzcwpbICAgIDcuNDM3NjA1XSBlMTAwMGU6IEludGVsKFIpIFBSTy8xMDAwIE5ldHdvcmsgRHJp
dmVyIC0gMy4yLjYtawpbICAgIDcuNDU1NjczXSBlMTAwMGU6IENvcHlyaWdodChjKSAxOTk5IC0g
MjAxNSBJbnRlbCBDb3Jwb3JhdGlvbi4KWyAgICA3LjQ3NDQ3Ml0gQWxyZWFkeSBzZXR1cCB0aGUg
R1NJIDoxNgpbICAgIDcuNDkyNDU0XSBlMTAwMGUgMDAwMDowMDoxZi42OiBJbnRlcnJ1cHQgVGhy
b3R0bGluZyBSYXRlIChpbnRzL3NlYykgc2V0IHRvIGR5bmFtaWMgY29uc2VydmF0aXZlIG1vZGUK
WyAgICA3LjYxNjA2MV0gZTEwMDBlIDAwMDA6MDA6MWYuNiAwMDAwOjAwOjFmLjYgKHVuaW5pdGlh
bGl6ZWQpOiByZWdpc3RlcmVkIFBIQyBjbG9jawpbICAgIDcuNzI4MjI2XSBlMTAwMGUgMDAwMDow
MDoxZi42IGV0aDA6IChQQ0kgRXhwcmVzczoyLjVHVC9zOldpZHRoIHgxKSAwMDowYjphYjplNDpk
MDpjNQpbICAgIDcuNzQ5OTE2XSBlMTAwMGUgMDAwMDowMDoxZi42IGV0aDA6IEludGVsKFIpIFBS
Ty8xMDAwIE5ldHdvcmsgQ29ubmVjdGlvbgpbICAgIDcuNzcwMzMxXSBlMTAwMGUgMDAwMDowMDox
Zi42IGV0aDA6IE1BQzogMTIsIFBIWTogMTIsIFBCQSBObzogRkZGRkZGLTBGRgpbICAgIDcuODE5
MzE1XSBjZmc4MDIxMTogTG9hZGluZyBjb21waWxlZC1pbiBYLjUwOSBjZXJ0aWZpY2F0ZXMgZm9y
IHJlZ3VsYXRvcnkgZGF0YWJhc2UKWyAgICA3Ljg0NzUxOV0gY2ZnODAyMTE6IExvYWRlZCBYLjUw
OSBjZXJ0ICdzZm9yc2hlZTogMDBiMjhkZGY0N2FlZjljZWE3JwpbICAgIDcuODY3MzE1XSBwbGF0
Zm9ybSByZWd1bGF0b3J5LjA6IERpcmVjdCBmaXJtd2FyZSBsb2FkIGZvciByZWd1bGF0b3J5LmRi
IGZhaWxlZCB3aXRoIGVycm9yIC0yClsgICAgNy44ODc1MjBdIGNmZzgwMjExOiBmYWlsZWQgdG8g
bG9hZCByZWd1bGF0b3J5LmRiClsgICAgNy45NTczNDddIHJ0bDg3MjNiZSAwMDAwOjAxOjAwLjA6
IGVuYWJsaW5nIGRldmljZSAoMDAwMCAtPiAwMDAzKQpbICAgIDcuOTc3OTcyXSBBbHJlYWR5IHNl
dHVwIHRoZSBHU0kgOjE4ClsgICAgOC4wMjgzOTldIHJ0bDg3MjNiZTogVXNpbmcgZmlybXdhcmUg
cnRsd2lmaS9ydGw4NzIzYmVmd18zNi5iaW4KWyAgICA4LjA1MTAwN10gcnRsd2lmaTogcnRsd2lm
aTogd2lyZWxlc3Mgc3dpdGNoIGlzIG9uClsgICAgOC4wODc4NzJdIGlnYjogSW50ZWwoUikgR2ln
YWJpdCBFdGhlcm5ldCBOZXR3b3JrIERyaXZlciAtIHZlcnNpb24gNS40LjAtawpbICAgIDguMTA3
MzcwXSBpZ2I6IENvcHlyaWdodCAoYykgMjAwNy0yMDE0IEludGVsIENvcnBvcmF0aW9uLgpbICAg
IDguMTI3NDE1XSBBbHJlYWR5IHNldHVwIHRoZSBHU0kgOjE3ClsgICAgOC4xNzY3MzZdIHBwcyBw
cHMwOiBuZXcgUFBTIHNvdXJjZSBwdHAxClsgICAgOC4yMDcxNDFdIGlnYiAwMDAwOjAyOjAwLjA6
IGFkZGVkIFBIQyBvbiBldGgxClsgICAgOC4yMjY2NTFdIGlnYiAwMDAwOjAyOjAwLjA6IEludGVs
KFIpIEdpZ2FiaXQgRXRoZXJuZXQgTmV0d29yayBDb25uZWN0aW9uClsgICAgOC4yNDU5MDZdIGln
YiAwMDAwOjAyOjAwLjA6IGV0aDE6IChQQ0llOjIuNUdiL3M6V2lkdGggeDEpIDAwOjBiOmFiOmU0
OmQwOmM2ClsgICAgOC4yNjUwMTldIGlnYiAwMDAwOjAyOjAwLjA6IGV0aDE6IFBCQSBObzogMDAw
MjAwLTAwMApbICAgIDguMjgzOTQ2XSBpZ2IgMDAwMDowMjowMC4wOiBVc2luZyBNU0ktWCBpbnRl
cnJ1cHRzLiAxIHJ4IHF1ZXVlKHMpLCAxIHR4IHF1ZXVlKHMpCg==
--000000000000dac487058e0dc52e
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--000000000000dac487058e0dc52e--

