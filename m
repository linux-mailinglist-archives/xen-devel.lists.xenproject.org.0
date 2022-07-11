Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECAA571110
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 06:05:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365353.595622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oB77t-0001Hn-7u; Tue, 12 Jul 2022 04:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365353.595622; Tue, 12 Jul 2022 04:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oB77t-0001EK-4B; Tue, 12 Jul 2022 04:03:57 +0000
Received: by outflank-mailman (input) for mailman id 365353;
 Mon, 11 Jul 2022 18:38:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jQbn=XQ=cachengo.com=brad@srs-se1.protection.inumbo.net>)
 id 1oAyIY-0007Bg-47
 for xen-devel@lists.xen.org; Mon, 11 Jul 2022 18:38:22 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a02e9be4-0148-11ed-924f-1f966e50362f;
 Mon, 11 Jul 2022 20:38:16 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id sz17so10282307ejc.9
 for <xen-devel@lists.xen.org>; Mon, 11 Jul 2022 11:38:15 -0700 (PDT)
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
X-Inumbo-ID: a02e9be4-0148-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cachengo.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=awSft2fCUC2N8A6hETTYVWbslJCuFnmGc/IyfvOZRQ0=;
        b=JuTyK++NxpvVf3h0eMBYWMrlTpZdcFwAuff2pyxM6VOXNvMfEVObE/TKkwDuv2DikH
         A7dPYu9L0Lb6QqXml2J9e2xCEJtJsBnYg4XLwaxfwICvmCs6rLBOZOKDDIv/kf4qgPrj
         ssI4o8+VZlDSqondqysWHC358xU5efQK7IJhICSdEtnzN0zh6UT4r7P+D1VqEiWtZg0G
         iZmNGtafNGPVVgfdL4SeXncyKFVX5gmRBID3IMQwo1YFCS0hKlv9sd8L/nlq56SFCXbJ
         Tpyup8L5tF1RpdRrwjtgGD9aDp9D+ikTvsCNrHIiN4klOHjmRzJP4J4FuQLaf2aTuiug
         ijbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=awSft2fCUC2N8A6hETTYVWbslJCuFnmGc/IyfvOZRQ0=;
        b=kUTbwX/EoET5lZ/n98LxZuBzLlT68Uqx1qw2mGVJSjFfNgLIxhc1dGIHgWUzqUMZEh
         Dwbt7pebvY/IBszZvoGnrx6ZyRTz9NlvhNPfJUDuKaY8ZWzcW307Tck6gEslHQTV9V6d
         ZL/yF0hudYrHt1cZ78axB3ChAvNNaSElCerIPH02Pgart/BkRWAmJglhITsnPQI07iK4
         5ZqCqsVRC8HBntwZbGPLHUu+GPJe6JiLRCgHGmduAsKr7t4vtPUD7kvi+bQN2oKKTK/Y
         DrQWFO+9IMpmjSUMyWrSIfi0BMKuRUkWgmYTPTbhzC6Ttord8NJB8VmIR0sZX1sayjpA
         Rorg==
X-Gm-Message-State: AJIora+uyJUpet/Hl3wXTJFVcrWrTI7r4mzmSSzqC0Y4Gk5ccI9Zt1C4
	uP6imNAk0NTBmEo7PYDG+PCECaBNnjqvJNsjnLk+ZObmcpB0yw==
X-Google-Smtp-Source: AGRyM1uIyW97guWFVdSCcgK6dXn9gOzgA/ph67B/PAUsBjhJFvoEbx7aMN17mgkA5/mnvtPZKAdfUG9yI0baoLnPCAE=
X-Received: by 2002:a17:907:2d8a:b0:722:e35b:695 with SMTP id
 gt10-20020a1709072d8a00b00722e35b0695mr20491714ejc.470.1657564693524; Mon, 11
 Jul 2022 11:38:13 -0700 (PDT)
MIME-Version: 1.0
From: Brad Churchwell <brad@cachengo.com>
Date: Mon, 11 Jul 2022 13:38:02 -0500
Message-ID: <CAMdBLPN183W-t5bNJvxGb=t0kL4QHFQNQ7O3LZAd_yXUOrSStA@mail.gmail.com>
Subject: Xen on rk3399
To: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="000000000000c00fc105e38bdacc"

--000000000000c00fc105e38bdacc
Content-Type: text/plain; charset="UTF-8"

Hello,

I've been trying to get Xen to boot dom0 with my kernel for weeks on an
rk3399 based board and thought I'd reach out for help. It looks like either
Xen is not properly recreating the device tree or the interrupt controller
is just failing. The hypervisor boots but falls to initramfs because it
cannot find the root device (nvme on pcie). Any help would be greatly
appreciated. Here is the complete boot log

DDR Version 1.20 20190314
In
soft reset
SRX
channel 0
CS = 0
MR0=0x98
MR4=0x2
MR5=0xFF
MR8=0x10
MR12=0x72
MR14=0x72
MR18=0x0
MR19=0x0
MR24=0x8
MR25=0x0
channel 1
CS = 0
MR0=0x98
MR4=0x2
MR5=0xFF
MR8=0x10
MR12=0x72
MR14=0x72
MR18=0x0
MR19=0x0
MR24=0x8
MR25=0x0
channel 0 training pass!
channel 1 training pass!
change freq to 400MHz 0,1
channel 0
CS = 0
MR0=0x98
MR4=0x2
MR5=0xFF
MR8=0x10
MR12=0x72
MR14=0x72
MR18=0x0
MR19=0x0
MR24=0x8
MR25=0x0
channel 1
CS = 0
MR0=0x98
MR4=0x2
MR5=0xFF
MR8=0x10
MR12=0x72
MR14=0x72
MR18=0x0
MR19=0x0
MR24=0x8
MR25=0x0
channel 0 training pass!
channel 1 training pass!
change freq to 800MHz 1,0
Channel 0: LPDDR4,800MHz
Bus Width=32 Col=10 Bank=8 Row=16 CS=1 Die Bus-Width=16 Size=2048MB
Channel 1: LPDDR4,800MHz
Bus Width=32 Col=10 Bank=8 Row=16 CS=1 Die Bus-Width=16 Size=2048MB
256B stride
ch 0 ddrconfig = 0x101, ddrsize = 0x40
ch 1 ddrconfig = 0x101, ddrsize = 0x40
pmugrf_os_reg[2] = 0x32C1F2C1, stride = 0xD
OUT
Boot1: 2018-06-26, version: 1.14
CPUId = 0x0
ChipType = 0x10, 280
Spi_ChipId = ef6017
SpiBootInit:0
mmc0:cmd8,32
mmc0:cmd5,32
mmc0:cmd55,32
mmc0:cmd1,32
mmc0:cmd8,32
mmc0:cmd5,32
mmc0:cmd55,32
mmc0:cmd1,32
mmc0:cmd8,32
mmc0:cmd5,32
mmc0:cmd55,32
mmc0:cmd1,32
SdmmcInit=0 1
StorageInit ok = 23477
SecureMode = 0
SecureInit ret = 0, SecureMode = 0
GPT vendor signature is wrong
LoadTrust Addr:0x1800
No find bl30.bin
No find bl32.bin
Load uboot, ReadLba = 1000
Load OK, addr=0x200000, size=0xc3140
RunBL31 0x10000
NOTICE:  BL31: v1.3(debug):0e7a845
NOTICE:  BL31: Built : 16:13:46, Apr 17 2019
NOTICE:  BL31: Rockchip release version: v1.1
INFO:    GICv3 with legacy support detected. ARM GICV3 driver initialized
in EL3
INFO:    Using opteed sec cpu_context!
INFO:    boot cpu mask: 0
INFO:    plat_rockchip_pmu_init(1181): pd status 3e
INFO:    BL31: Initializing runtime services
WARNING: No OPTEE provided by BL2 boot loader, Booting device without OPTEE
initialization. SMC`s destined for OPTEE will return SMC_UNK
ERROR:   Error initializing runtime service opteed_fast
INFO:    BL31: Preparing for EL3 exit to normal world
INFO:    Entry point address = 0x200000
INFO:    SPSR = 0x3c9


U-Boot 2021.10 (Jul 11 2022 - 11:32:57 -0500)

SoC: Rockchip rk3399
Reset cause: RST
Model: Vamrs RK3399 ZAKU
DRAM:  3.9 GiB
PMIC:  RK808
MMC:   mmc@fe310000: 3, mmc@fe330000: 0
Loading Environment from FAT... In:    serial
Out:   serial
Err:   serial
Model: Vamrs RK3399 ZAKU
Net:   No ethernet found.
Hit any key to stop autoboot:  0
zaku =>
zaku => run boot_pci_enum; run nvme_init; fatload nvme 0:1 0x02000000
xen-uImage; fatload nvme 0:1 0x01f00000 rk3399-zaku.dtb;
1114184 bytes read in 8 ms (132.8 MiB/s)
57153 bytes read in 5 ms (10.9 MiB/s)
zaku => fatload nvme 0:1 0x03F80000 Image;fatload nvme 0:1 0x06000000
initrd.img-5.15.16-1-rockchip-g359ffc4bc727;bootm 0x02000000 - 0x00
27885576 bytes read in 75 ms (354.6 MiB/s)
8674182 bytes read in 28 ms (295.4 MiB/s)
## Booting kernel from Legacy Image at 02000000 ...
   Image Name:
   Image Type:   AArch64 Linux Kernel Image (uncompressed)
   Data Size:    1114120 Bytes = 1.1 MiB
   Load Address: 02000000
   Entry Point:  02000000
   Verifying Checksum ... OK
## Flattened Device Tree blob at 01f00000
   Booting using the fdt blob at 0x1f00000
   Loading Kernel Image
   Loading Device Tree to 00000000f1efd000, end 00000000f1f0df40 ... OK

Starting kernel ...

 Xen 4.17-unstable
(XEN) Xen version 4.17-unstable (root@) (aarch64-linux-gnu-gcc (Linaro GCC
7.3-2018.05) 7.3.1 20180425 [linaro-7.3-2018.05 revision d2912
(XEN) Latest ChangeSet:
(XEN) build-id: aaba62ac5bc435965722c47224a16d44f95847b9
(XEN) Processor: 00000000410fd034: "ARM Limited", variant: 0x0, part
0xd03,rev 0x4
(XEN) 64-bit Execution:
(XEN)   Processor Features: 0000000001002222 0000000000000000
(XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
(XEN)     Extensions: FloatingPoint AdvancedSIMD GICv3-SysReg
(XEN)   Debug Features: 0000000010305106 0000000000000000
(XEN)   Auxiliary Features: 0000000000000000 0000000000000000
(XEN)   Memory Model Features: 0000000000001122 0000000000000000
(XEN)   ISA Features:  0000000000011120 0000000000000000
(XEN) 32-bit Execution:
(XEN)   Processor Features: 0000000000000131:0000000010011011
(XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle
(XEN)     Extensions: GenericTimer Security
(XEN)   Debug Features: 0000000003010066
(XEN)   Auxiliary Features: 0000000000000000
(XEN)   Memory Model Features: 0000000010201105 0000000040000000
(XEN)                          0000000001260000 0000000002102211
(XEN)   ISA Features: 0000000002101110 0000000013112111 0000000021232042
(XEN)                 0000000001112131 0000000000011142 0000000000011121
(XEN) Using SMC Calling Convention v1.0
(XEN) Using PSCI v1.0
(XEN) SMP: Allowing 6 CPUs
(XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 24000 KHz
(XEN) GICv3 initialization:
(XEN)       gic_dist_addr=0x000000fee00000
(XEN)       gic_maintenance_irq=25
(XEN)       gic_rdist_stride=0
(XEN)       gic_rdist_regions=1
(XEN)       redistributor regions:
(XEN)         - region 0: 0x000000fef00000 - 0x000000fefc0000
(XEN) GICv3 compatible with GICv2 cbase 0x000000fff00000 vbase
0x000000fff20000
(XEN) GICv3: 288 lines, (IID 0001143b).
(XEN) GICv3: CPU0: Found redistributor in region 0 @000000004001c000
(XEN) XSM Framework v1.0.1 initialized
(XEN) Initialising XSM SILO mode
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Initializing Credit2 scheduler
(XEN)  load_precision_shift: 18
(XEN)  load_window_shift: 30
(XEN)  underload_balance_tolerance: 0
(XEN)  overload_balance_tolerance: -3
(XEN)  runqueues arrangement: socket
(XEN)  cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Allocated console ring of 64 KiB.
(XEN) CPU0: Guest atomics will try 2 times before pausing the domain
(XEN) Bringing up CPU1
(XEN) GICv3: CPU1: Found redistributor in region 0 @000000004003c000
(XEN) CPU1: Guest atomics will try 3 times before pausing the domain
(XEN) CPU 1 booted.
(XEN) Bringing up CPU2
(XEN) GICv3: CPU2: Found redistributor in region 0 @000000004005c000
(XEN) CPU2: Guest atomics will try 3 times before pausing the domain
(XEN) CPU 2 booted.
(XEN) Bringing up CPU3
(XEN) GICv3: CPU3: Found redistributor in region 0 @000000004007c000
(XEN) CPU3: Guest atomics will try 3 times before pausing the domain
(XEN) CPU 3 booted.
(XEN) Bringing up CPU4
(XEN) CPU4 MIDR (0x00000000410fd082) does not match boot CPU MIDR
(0x00000000410fd034),
(XEN) hmp-unsafe turned on so tainting Xen and keep core on!!
(XEN) SANITY DIF: aa64mmfr0 0x1122 -> 0x1124
(XEN) SANITY DIF: ctr 0x84448004 -> 0x8444c004
(XEN) GICv3: CPU4: Found redistributor in region 0 @000000004009c000
(XEN) CPU4: Guest atomics will try 1 times before pausing the domain
(XEN) enabled workaround for: ARM erratum 1319537
(XEN) CPU 4 booted.
(XEN) Bringing up CPU5
(XEN) CPU5 MIDR (0x00000000410fd082) does not match boot CPU MIDR
(0x00000000410fd034),
(XEN) hmp-unsafe turned on so tainting Xen and keep core on!!
(XEN) SANITY DIF: aa64mmfr0 0x1122 -> 0x1124
(XEN) SANITY DIF: ctr 0x84448004 -> 0x8444c004
(XEN) GICv3: CPU5: Found redistributor in region 0 @00000000400bc000
(XEN) CPU5: Guest atomics will try 1 times before pausing the domain
(XEN) Brought up 6 CPUs
(XEN) CPU 5 booted.
(XEN) I/O virtualisation disabled
(XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
(XEN) P2M: 3 levels with order-1 root, VTCR 0x0000000080023558
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) Initializing Credit2 scheduler
(XEN)  load_precision_shift: 18
(XEN)  load_window_shift: 30
(XEN)  underload_balance_tolerance: 0
(XEN)  overload_balance_tolerance: -3
(XEN)  runqueues arrangement: socket
(XEN)  cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Adding cpu 0 to runqueue 0
(XEN)  First cpu on runqueue, activating
(XEN) Adding cpu 1 to runqueue 0
(XEN) Adding cpu 2 to runqueue 0
(XEN) Adding cpu 3 to runqueue 0
(XEN) Adding cpu 4 to runqueue 0
(XEN) Adding cpu 5 to runqueue 0
(XEN) alternatives: Patching with alt table 00000000002e5388 ->
00000000002e5e74
(XEN) **** No support for ARM_SMCCC_ARCH_WORKAROUND_1. ****
(XEN) **** Please update your firmware.                ****
(XEN) *** LOADING DOMAIN 0 ***
(XEN) Loading d0 kernel from boot module @ 0000000003f80000
(XEN) Loading ramdisk from boot module @ 0000000006000000
(XEN) Allocating 1:1 mappings totalling 512MB for dom0:
(XEN) BANK[0] 0x00000020000000-0x00000040000000 (512MB)
(XEN) Grant table range: 0x00000002000000-0x00000002040000
(XEN) /pinctrl/pcie: Missing device_type
(XEN) /pinctrl/pcie: Missing device_type
(XEN) /pinctrl/pcie: Missing device_type
(XEN) Allocating PPI 16 for event channel interrupt
(XEN) d0: extended region 0: 0x2200000->0x20000000
(XEN) d0: extended region 1: 0x40000000->0xf8000000
(XEN) Loading zImage from 0000000003f80000 to
0000000020000000-0000000021aa8008
(XEN) Loading d0 initrd from 0000000006000000 to
0x0000000028200000-0x000000002a200000
(XEN) Loading d0 DTB to 0x0000000028000000-0x000000002800d5fb
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) ***************************************************
(XEN) WARNING: HMP COMPUTING HAS BEEN ENABLED.
(XEN) It has implications on the security and stability of the system,
(XEN) unless the cpu affinity of all domains is specified.
(XEN) ***************************************************
(XEN) PLEASE SPECIFY dom0_mem PARAMETER - USING 512M FOR NOW
(XEN) ***************************************************
(XEN) 3... 2... 1...
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 356kB init memory.
(XEN) d0v0 Unhandled SMC/HVC: 0x84000050
(XEN) d0v0 Unhandled SMC/HVC: 0x8600ff01
(XEN) d0v0: vGICD: RAZ on reserved register offset 0x00000c
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER4
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER8
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER12
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER16
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER20
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER24
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER28
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER32
(XEN) d0v0: vGICR: SGI: unhandled word write 0x000000ffffffff to ICACTIVER0
(XEN) d0v0 Unhandled SMC/HVC: 0x82000008
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
[    0.000000] Linux version 5.15.16-1-rockchip-g359ffc4bc727
(root@brad-ThinkCentre-M82) (aarch64-linux-gnu-gcc (Linaro GCC 7.3-2018.052
[    0.000000] Machine model: Vamrs RK3399 ZAKU
[    0.000000] printk: debug: ignoring loglevel setting.
[    0.000000] Xen 4.17 support found
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000020000000-0x000000003fffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000020000000-0x000000003fffffff]
[    0.000000] Initmem setup node 0 [mem
0x0000000020000000-0x000000003fffffff]
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] psci: SMC Calling Convention v1.1
[    0.000000] percpu: Embedded 27 pages/cpu s69672 r8192 d32728 u110592
[    0.000000] pcpu-alloc: s69672 r8192 d32728 u110592 alloc=27*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 [0] 4 [0] 5
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: detected: GIC system register CPU interface
[    0.000000] CPU features: detected: ARM erratum 845719
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 129024
[    0.000000] Kernel command line: console=hvc0 earlyprintk=xen
clk_ignore_unused root=/dev/nvme0n1p2 rw init=/sbin/init rootwait rootfl
[    0.000000] Unknown kernel command line parameters "earlyprintk=xen",
will be passed to user space.
[    0.000000] Dentry cache hash table entries: 65536 (order: 7, 524288
bytes, linear)
[    0.000000] Inode-cache hash table entries: 32768 (order: 6, 262144
bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 452668K/524288K available (14016K kernel code, 2720K
rwdata, 4856K rodata, 5504K init, 553K bss, 71620K reserved,)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=6, Nodes=1
[    0.000000] ftrace: allocating 54793 entries in 215 pages
[    0.000000] ftrace: allocated 215 pages with 6 groups
[    0.000000] trace event string verifier disabled
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu:     RCU event tracing is enabled.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=6.
[    0.000000]  Rude variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is
25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=6
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GICv3: 256 SPIs implemented
[    0.000000] GICv3: 0 Extended SPIs implemented
[    0.000000] GICv3: Distributor has no Range Selector support
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] GICv3: 16 PPIs implemented
[    0.000000] GICv3: CPU0: found redistributor 0 region
0:0x00000000fef00000
[    0.000000] random: get_random_bytes called from
start_kernel+0x44c/0x6bc with crng_init=0
[    0.000000] arch_timer: cp15 timer(s) running at 24.00MHz (virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff
max_cycles: 0x588fe9dc0, max_idle_ns: 440795202592 ns
[    0.000003] sched_clock: 56 bits at 24MHz, resolution 41ns, wraps every
4398046511097ns
[    0.004184] Console: colour dummy device 80x25
[    0.010034] printk: console [hvc0] enabled
[    0.010272] Calibrating delay loop (skipped), value calculated using
timer frequency.. 48.00 BogoMIPS (lpj=96000)
[    0.010509] pid_max: default: 32768 minimum: 301
[    0.011188] LSM: Security Framework initializing
[    0.011384] Yama: becoming mindful.
[    0.011799] Mount-cache hash table entries: 1024 (order: 1, 8192 bytes,
linear)
[    0.012105] Mountpoint-cache hash table entries: 1024 (order: 1, 8192
bytes, linear)
[    0.027498] xen:grant_table: Grant tables using version 1 layout
[    0.027843] Grant table initialized
[    0.028195] xen:events: Using FIFO-based ABI
[    0.028613] Xen: initializing cpu0
[    0.029559] rcu: Hierarchical SRCU implementation.
[    0.038337] smp: Bringing up secondary CPUs ...
(XEN) d0v1: vGICR: SGI: unhandled word write 0x000000ffffffff to ICACTIVER0
(XEN) d0v2: vGICR: SGI: unhandled word write 0x000000ffffffff to ICACTIVER0
(XEN) d0v3: vGICR: SGI: unhandled word write 0x000000ffffffff to ICACTIVER0
(XEN) d0v4: vGICR: SGI: unhandled word write 0x000000ffffffff to ICACTIVER0
(XEN) d0v5: vGICR: SGI: unhandled word write 0x000000ffffffff to ICACTIVER0
[    0.042396] Detected VIPT I-cache on CPU1
[    0.042606] GICv3: CPU1: found redistributor 1 region
0:0x00000000fef20000
[    0.043215] Xen: initializing cpu1
[    0.043511] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
[    0.047957] Detected VIPT I-cache on CPU2
[    0.048177] GICv3: CPU2: found redistributor 2 region
0:0x00000000fef40000
[    0.048778] Xen: initializing cpu2
[    0.049066] CPU2: Booted secondary processor 0x0000000002 [0x410fd034]
[    0.052901] Detected VIPT I-cache on CPU3
[    0.053120] GICv3: CPU3: found redistributor 3 region
0:0x00000000fef60000
[    0.053626] Xen: initializing cpu3
[    0.053907] CPU3: Booted secondary processor 0x0000000003 [0x410fd034]
[    0.062107] CPU features: detected: Spectre-v2
[    0.063039] CPU features: detected: Spectre-v4
[    0.063673] CPU features: detected: ARM errata 1165522, 1319367, or
1530923
[    0.067132] Detected PIPT I-cache on CPU4
[    0.072165] GICv3: CPU4: found redistributor 4 region
0:0x00000000fef80000
[    0.081044] Xen: initializing cpu4
[    0.086534] CPU4: Booted secondary processor 0x0000000004 [0x410fd082]
[    0.111175] Detected PIPT I-cache on CPU5
[    0.116450] GICv3: CPU5: found redistributor 5 region
0:0x00000000fefa0000
[    0.125174] Xen: initializing cpu5
[    0.130645] CPU5: Booted secondary processor 0x0000000005 [0x410fd082]
[    0.141980] smp: Brought up 1 node, 6 CPUs
[    0.144637] SMP: Total of 6 processors activated.
[    0.144881] CPU features: detected: 32-bit EL0 Support
[    0.145127] CPU features: detected: CRC32 instructions
[    0.151947] CPU: All CPU(s) started at EL1
[    0.155749] alternatives: patching kernel code
[    0.163024] devtmpfs: initialized
[    0.235277] Registered cp15_barrier emulation handler
[    0.238449] Registered setend emulation handler
[    0.239670] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.240040] futex hash table entries: 2048 (order: 5, 131072 bytes,
linear)
[    0.241754] pinctrl core: initialized pinctrl subsystem
[    0.243287] regulator-dummy: no parameters, enabled
[    0.246947] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.260401] DMA: preallocated 128 KiB GFP_KERNEL pool for atomic
allocations
[    0.260878] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA pool for atomic
allocations
[    0.261294] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA32 pool for
atomic allocations
[    0.261822] audit: initializing netlink subsys (disabled)
[    0.268125] audit: type=2000 audit(0.256:1): state=initialized
audit_enabled=0 res=1
[    0.278540] thermal_sys: Registered thermal governor 'fair_share'
[    0.278731] thermal_sys: Registered thermal governor 'step_wise'
[    0.279675] OF: /thermal-zones/cpu-thermal/cooling-maps/map0: could not
find phandle 6
[    0.280151] thermal_sys: Add a cooling_device property with at least one
device
[    0.280307] thermal_sys: failed to build thermal zone cpu-thermal: -2
[    0.283478] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.299995] ASID allocator initialised with 65536 entries
[    0.300424] xen:swiotlb_xen: Warning: only able to allocate 4 MB for
software IO TLB
[    0.303971] software IO TLB: mapped [mem
0x0000000022800000-0x0000000022c00000] (4MB)
[    0.310583] ------------[ cut here ]------------
[    0.310855] WARNING: CPU: 0 PID: 1 at drivers/irqchip/irq-gic-v3.c:1533
gic_irq_domain_select+0x70/0x12c
[    0.311156] Modules linked in:
[    0.311317] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
5.15.16-1-rockchip-g359ffc4bc727 #1
[    0.311536] Hardware name: Vamrs RK3399 ZAKU (DT)
[    0.311673] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS
BTYPE=--)
[    0.311890] pc : gic_irq_domain_select+0x70/0x12c
[    0.312063] lr : gic_irq_domain_select+0x6c/0x12c
[    0.312273] sp : ffffffc011b5b8c0
[    0.312385] x29: ffffffc011b5b8c0 x28: ffffff8021e37a80 x27:
ffffff8021e37a00
[    0.312634] x26: ffffff803feb92b0 x25: 0000000000000000 x24:
ffffffc011b5b9f8
[    0.312871] x23: ffffff8021c0c400 x22: ffffffc01120a000 x21:
ffffffc0118f6000
[    0.313111] x20: ffffffc011b5b9f8 x19: ffffff8021c0c400 x18:
000000000000000a
[    0.313350] x17: ffffffffffffffff x16: ffffffffffffffff x15:
ffffffffffffffff
[    0.313568] x14: ffffffffffffffff x13: ffffffffffffffff x12:
ffffffffffffffff
[    0.313805] x11: 0000000000000038 x10: 0101010101010101 x9 :
ffffffffffffffff
[    0.314042] x8 : 7f7f7f7f7f7f7f7f x7 : ff71646b6b6e7173 x6 :
0000000000000080
[    0.314278] x5 : 0000000000000000 x4 : 0000000000000000 x3 :
ffffffc011b5b90c
[    0.314515] x2 : ffffffc011b5b910 x1 : 00000000a110c8ee x0 :
00000000ffffffea
[    0.314752] Call trace:
[    0.314853]  gic_irq_domain_select+0x70/0x12c
[    0.315004]  irq_find_matching_fwspec+0x78/0xf4
[    0.315307]  irq_create_fwspec_mapping+0x4c/0x2d4
[    0.315476]  irq_create_of_mapping+0x6c/0xa4
[    0.315656]  of_irq_get+0x64/0xa4
[    0.315801]  of_irq_to_resource+0x48/0xfc
[    0.315953]  of_irq_to_resource_table+0x54/0x68
[    0.316166]  of_device_alloc+0x108/0x1b0
[    0.316316]  of_platform_device_create_pdata+0x7c/0xdc
[    0.316506]  of_platform_bus_create+0x3a0/0x468
[    0.316665]  of_platform_populate+0x100/0x118
[    0.316808]  of_platform_default_populate+0x40/0x50
[    0.316959]  of_platform_default_populate_init+0x7c/0xb4
[    0.317149]  do_one_initcall+0x94/0x1c4
[    0.317299]  kernel_init_freeable+0x2b0/0x2b8
[    0.317494]  kernel_init+0x28/0x120
[    0.317628]  ret_from_fork+0x10/0x20
[    0.317804] ---[ end trace 85c6a508ffafc11e ]---
[    0.318293] irq: no irq domain found for interrupt-controller !
[    0.390494] irq: type mismatch, failed to map hwirq-32 for
interrupt-controller!
[    0.401389] irq: type mismatch, failed to map hwirq-32 for
interrupt-controller!
[    0.403373] irq: type mismatch, failed to map hwirq-32 for
interrupt-controller!
[    0.413685] platform ff770000.syscon:phy@f780: Fixing up cyclic
dependency with fe330000.mmc
[    0.439170] platform ff940000.hdmi: Fixing up cyclic dependency with
ff8f0000.vop
[    0.440132] platform ff940000.hdmi: Fixing up cyclic dependency with
ff900000.vop
[    0.442114] irq: type mismatch, failed to map hwirq-32 for
interrupt-controller!
[    0.479376] rockchip-gpio ff720000.gpio0: probed /pinctrl/gpio0@ff720000
[    0.484466] rockchip-gpio ff730000.gpio1: probed /pinctrl/gpio1@ff730000
[    0.489044] rockchip-gpio ff780000.gpio2: probed /pinctrl/gpio2@ff780000
[    0.493295] rockchip-gpio ff788000.gpio3: probed /pinctrl/gpio3@ff788000
[    0.497205] rockchip-gpio ff790000.gpio4: probed /pinctrl/gpio4@ff790000
[    0.601234] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.602111] HugeTLB registered 32.0 MiB page size, pre-allocated 0 pages
[    0.602269] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.602440] HugeTLB registered 64.0 KiB page size, pre-allocated 0 pages
[    0.732446] cryptd: max_cpu_qlen set to 1000
[    0.965984] raid6: neonx8   gen()   343 MB/s
[    1.037514] raid6: neonx8   xor()   265 MB/s
[    1.108822] raid6: neonx4   gen()   358 MB/s
[    1.180595] raid6: neonx4   xor()   264 MB/s
[    1.251750] raid6: neonx2   gen()   332 MB/s
[    1.322968] raid6: neonx2   xor()   242 MB/s
[    1.394615] raid6: neonx1   gen()   289 MB/s
[    1.465958] raid6: neonx1   xor()   199 MB/s
[    1.537820] raid6: int64x8  gen()    87 MB/s
[    1.609578] raid6: int64x8  xor()    51 MB/s
[    1.681302] raid6: int64x4  gen()   107 MB/s
[    1.753475] raid6: int64x4  xor()    56 MB/s
[    1.824651] raid6: int64x2  gen()   182 MB/s
[    1.895619] raid6: int64x2  xor()   100 MB/s
[    1.966829] raid6: int64x1  gen()   136 MB/s
[    2.038152] raid6: int64x1  xor()    62 MB/s
[    2.038278] raid6: using algorithm neonx4 gen() 358 MB/s
[    2.038388] raid6: .... xor() 264 MB/s, rmw enabled
[    2.038485] raid6: using neon recovery algorithm
[    2.039515] xen:balloon: Initialising balloon driver
[    2.043846] vcc12v_dcin: 12000 mV, enabled
[    2.044876] reg-fixed-voltage vcc12v-dcin: vcc12v_dcin supplying
12000000uV
[    2.045966] vcc1v8_s0: 1800 mV, enabled
[    2.046981] reg-fixed-voltage vcc1v8-s0: vcc1v8_s0 supplying 1800000uV
[    2.047907] vcc5v0_sys: will resolve supply early: vin
[    2.048079] reg-fixed-voltage vcc5v0-sys: Looking up vin-supply from
device tree
[    2.048293] vcc5v0_sys: supplied by vcc12v_dcin
[    2.048447] vcc12v_dcin: could not add device link regulator.3: -ENOENT
[    2.048990] vcc5v0_sys: 5000 mV, enabled
[    2.049877] reg-fixed-voltage vcc5v0-sys: vcc5v0_sys supplying 5000000uV
[    2.051218] vcc_phy: no parameters, enabled
[    2.052029] reg-fixed-voltage vcc-phy-regulator: vcc_phy supplying 0uV
[    2.052969] vcc3v3_sys: will resolve supply early: vin
[    2.053173] reg-fixed-voltage vcc3v3-sys: Looking up vin-supply from
device tree
[    2.053379] vcc3v3_sys: supplied by vcc5v0_sys
[    2.053545] vcc5v0_sys: could not add device link regulator.5: -ENOENT
[    2.053932] vcc3v3_sys: 3300 mV, enabled
[    2.054924] reg-fixed-voltage vcc3v3-sys: vcc3v3_sys supplying 3300000uV
[    2.055842] rockchip-pinctrl pinctrl: unsupported driver strength 20
[    2.056049] rockchip-pinctrl pinctrl: pin_config_set op failed for pin
146
[    2.056203] reg-fixed-voltage vcc3v3-pcie-regulator: Error applying
setting, reverse things back
[    2.057192] vcc3v3_pcie: will resolve supply early: vin
[    2.057379] reg-fixed-voltage vcc3v3-pcie-regulator: Looking up
vin-supply from device tree
[    2.057575] vcc3v3_pcie: supplied by vcc3v3_sys
[    2.057760] vcc3v3_sys: could not add device link regulator.6: -ENOENT
[    2.058267] vcc3v3_pcie: 3300 mV, enabled
[    2.059496] reg-fixed-voltage vcc3v3-pcie-regulator: vcc3v3_pcie
supplying 3300000uV
[    2.061208] vcc5v0_usb: will resolve supply early: vin
[    2.061375] reg-fixed-voltage vcc5v0-usb-regulator: Looking up
vin-supply from device tree
[    2.061595] vcc5v0_usb: supplied by vcc5v0_sys
[    2.061736] vcc5v0_sys: could not add device link regulator.7: -ENOENT
[    2.062164] vcc5v0_usb: 5000 mV, enabled
[    2.063312] reg-fixed-voltage vcc5v0-usb-regulator: vcc5v0_usb supplying
5000000uV
[    2.064318] vcc_0v9: will resolve supply early: vin
[    2.064511] reg-fixed-voltage vcc-0v9: Looking up vin-supply from device
tree
[    2.064705] vcc_0v9: supplied by vcc3v3_sys
[    2.064902] vcc3v3_sys: could not add device link regulator.8: -ENOENT
[    2.065383] vcc_0v9: 900 mV, enabled
[    2.066280] reg-fixed-voltage vcc-0v9: vcc_0v9 supplying 900000uV
[    2.071921] iommu: Default domain type: Translated
[    2.072285] iommu: DMA domain TLB invalidation policy: strict mode
[    2.089090] SCSI subsystem initialized
[    2.097346] libata version 3.00 loaded.
[    2.098501] usbcore: registered new interface driver usbfs
[    2.098931] usbcore: registered new interface driver hub
[    2.099344] usbcore: registered new device driver usb
[    2.100020] mc: Linux media interface: v0.10
[    2.100319] videodev: Linux video capture interface: v2.00
[    2.100991] pps_core: LinuxPPS API ver. 1 registered
[    2.101145] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo
Giometti <giometti@linux.it>
[    2.101402] PTP clock support registered
[    2.107595] Advanced Linux Sound Architecture Driver Initialized.
[    2.111011] Bluetooth: Core ver 2.22
[    2.111358] NET: Registered PF_BLUETOOTH protocol family
[    2.111517] Bluetooth: HCI device and connection manager initialized
[    2.111680] Bluetooth: HCI socket layer initialized
[    2.111857] Bluetooth: L2CAP socket layer initialized
[    2.112069] Bluetooth: SCO socket layer initialized
[    2.112296] NetLabel: Initializing
[    2.112402] NetLabel:  domain hash size = 128
[    2.112517] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    2.113111] NetLabel:  unlabeled traffic allowed by default
[    2.122030] clocksource: Switched to clocksource arch_sys_counter
[    2.413055] VFS: Disk quotas dquot_6.6.0
[    2.414148] VFS: Dquot-cache hash table entries: 512 (order 0, 4096
bytes)
[    2.475712] NET: Registered PF_INET protocol family
[    2.476923] IP idents hash table entries: 8192 (order: 4, 65536 bytes,
linear)
[    2.482548] tcp_listen_portaddr_hash hash table entries: 256 (order: 1,
10240 bytes, linear)
[    2.483081] TCP established hash table entries: 4096 (order: 3, 32768
bytes, linear)
[    2.483542] TCP bind hash table entries: 4096 (order: 5, 131072 bytes,
linear)
[    2.484397] TCP: Hash tables configured (established 4096 bind 4096)
[    2.485284] UDP hash table entries: 256 (order: 2, 24576 bytes, linear)
[    2.485892] UDP-Lite hash table entries: 256 (order: 2, 24576 bytes,
linear)
[    2.487194] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    2.487492] PCI: CLS 0 bytes, default 64
[    2.490694] Trying to unpack rootfs image as initramfs...
[    3.097632] rootfs image is not initramfs (Decoding failed); looks like
an initrd
[    3.477246] Freeing initrd memory: 32768K
[    3.816771] Initialise system trusted keyrings
[    3.828487] workingset: timestamp_bits=46 max_order=17 bucket_order=0
[    4.594980] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    4.639877] fuse: init (API version 7.34)
[    4.692812] JFS: nTxBlock = 3790, nTxLock = 30323
[    4.875022] SGI XFS with ACLs, security attributes, realtime, verbose
warnings, quota, no debug enabled
[   10.116665] NET: Registered PF_ALG protocol family
[   10.117252] xor: measuring software checksum speed
[   10.145130]    8regs           :   361 MB/sec
[   10.165698]    32regs          :   482 MB/sec
[   10.191437]    arm64_neon      :   384 MB/sec
[   10.191569] xor: using function: 32regs (482 MB/sec)
[   10.192042] Key type asymmetric registered
[   10.192188] Asymmetric key parser 'x509' registered
[   10.194224] Block layer SCSI generic (bsg) driver version 0.4 loaded
(major 246)
[   10.200293] io scheduler mq-deadline registered
[   10.200447] io scheduler kyber registered
[   10.213640] phy phy-ff770000.syscon:phy@f780.0: Looking up phy-supply
from device tree
[   10.213957] phy phy-ff770000.syscon:phy@f780.0: Looking up phy-supply
property in node /syscon@ff770000/phy@f780 failed
[   10.222938] phy phy-ff770000.syscon:usb2phy@e450.1: Looking up
phy-supply from device tree
[   10.223420] vcc5v0_usb: could not add device link
phy-ff770000.syscon:usb2phy@e450.1: -ENOENT
[   10.228300] phy phy-ff770000.syscon:usb2phy@e450.2: Looking up
phy-supply from device tree
[   10.228648] phy phy-ff770000.syscon:usb2phy@e450.2: Looking up
phy-supply property in node /syscon@ff770000/usb2phy@e450/otg-port faid
[   10.237376] phy phy-ff770000.syscon:usb2phy@e460.3: Looking up
phy-supply from device tree
[   10.238041] vcc5v0_usb: could not add device link
phy-ff770000.syscon:usb2phy@e460.3: -ENOENT
[   10.242605] phy phy-ff770000.syscon:usb2phy@e460.4: Looking up
phy-supply from device tree
[   10.242946] phy phy-ff770000.syscon:usb2phy@e460.4: Looking up
phy-supply property in node /syscon@ff770000/usb2phy@e460/otg-port faid
[   10.247126] phy phy-ff770000.syscon:pcie-phy.5: Looking up phy-supply
from device tree
[   10.247400] phy phy-ff770000.syscon:pcie-phy.5: Looking up phy-supply
property in node /syscon@ff770000/pcie-phy failed
[   10.248209] phy phy-ff770000.syscon:pcie-phy.6: Looking up phy-supply
from device tree
[   10.248426] phy phy-ff770000.syscon:pcie-phy.6: Looking up phy-supply
property in node /syscon@ff770000/pcie-phy failed
[   10.249176] phy phy-ff770000.syscon:pcie-phy.7: Looking up phy-supply
from device tree
[   10.249393] phy phy-ff770000.syscon:pcie-phy.7: Looking up phy-supply
property in node /syscon@ff770000/pcie-phy failed
[   10.250343] phy phy-ff770000.syscon:pcie-phy.8: Looking up phy-supply
from device tree
[   10.250775] phy phy-ff770000.syscon:pcie-phy.8: Looking up phy-supply
property in node /syscon@ff770000/pcie-phy failed
[   10.254471] phy phy-ff7c0000.phy.9: Looking up phy-supply from device
tree
[   10.254748] phy phy-ff7c0000.phy.9: Looking up phy-supply property in
node /phy@ff7c0000/dp-port failed
[   10.255670] phy phy-ff7c0000.phy.10: Looking up phy-supply from device
tree
[   10.255872] phy phy-ff7c0000.phy.10: Looking up phy-supply property in
node /phy@ff7c0000/usb3-port failed
[   10.258831] phy phy-ff800000.phy.11: Looking up phy-supply from device
tree
[   10.259081] phy phy-ff800000.phy.11: Looking up phy-supply property in
node /phy@ff800000/dp-port failed
[   10.259972] phy phy-ff800000.phy.12: Looking up phy-supply from device
tree
[   10.260151] phy phy-ff800000.phy.12: Looking up phy-supply property in
node /phy@ff800000/usb3-port failed
[   10.282297] dma-pl330 ff6d0000.dma-controller: Loaded driver for PL330
DMAC-241330
[   10.282779] dma-pl330 ff6d0000.dma-controller:       DBUFF-32x8bytes
Num_Chans-6 Num_Peri-12 Num_Events-12
[   10.291532] dma-pl330 ff6e0000.dma-controller: Loaded driver for PL330
DMAC-241330
[   10.291829] dma-pl330 ff6e0000.dma-controller:       DBUFF-128x8bytes
Num_Chans-8 Num_Peri-20 Num_Events-16
[   10.300189] xen:xen_evtchn: Event-channel device installed
[   10.318364] Serial: 8250/16550 driver, 5 ports, IRQ sharing disabled
[   10.335497] rockchip-vop ff8f0000.vop: Adding to iommu group 2
[   10.340200] rockchip-vop ff900000.vop: Adding to iommu group 3
[   10.367059] rockchip-drm display-subsystem: bound ff8f0000.vop (ops
0xffffffc010e887e8)
[   10.367999] [drm] unsupported AFBC format[3231564e]
[   10.371622] rockchip-drm display-subsystem: bound ff900000.vop (ops
0xffffffc010e887e8)
[   10.394857] cacheinfo: Unable to detect cache hierarchy for CPU 0
[   10.400560] brd: module loaded
[   10.444804] loop: module loaded
[   10.448040] lkdtm: No crash points registered, enable through debugfs
[   10.481318] libphy: Fixed MDIO Bus: probed
[   10.482042] CAN device driver interface
[   10.484479] usbcore: registered new interface driver cdc_ether
[   10.484987] usbcore: registered new interface driver rndis_host
[   10.528254] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[   10.528704] ehci-pci: EHCI PCI platform driver
[   10.529176] ehci-platform: EHCI generic platform driver
[   10.533146] ehci-platform fe380000.usb: EHCI Host Controller
[   10.534559] ehci-platform fe380000.usb: new USB bus registered, assigned
bus number 1
[   10.535808] ehci-platform fe380000.usb: irq 19, io mem 0xfe380000
[   10.549833] ehci-platform fe380000.usb: USB 2.0 started, EHCI 1.00
[   10.551250] usb usb1: New USB device found, idVendor=1d6b,
idProduct=0002, bcdDevice= 5.15
[   10.551441] usb usb1: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[   10.551591] usb usb1: Product: EHCI Host Controller
[   10.551705] usb usb1: Manufacturer: Linux
5.15.16-1-rockchip-g359ffc4bc727 ehci_hcd
[   10.551860] usb usb1: SerialNumber: fe380000.usb
[   10.555156] hub 1-0:1.0: USB hub found
[   10.555443] hub 1-0:1.0: 1 port detected
[   10.561186] ehci-platform fe3c0000.usb: EHCI Host Controller
[   10.562763] ehci-platform fe3c0000.usb: new USB bus registered, assigned
bus number 2
[   10.563759] ehci-platform fe3c0000.usb: irq 21, io mem 0xfe3c0000
[   10.577817] ehci-platform fe3c0000.usb: USB 2.0 started, EHCI 1.00
[   10.579010] usb usb2: New USB device found, idVendor=1d6b,
idProduct=0002, bcdDevice= 5.15
[   10.579200] usb usb2: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[   10.579353] usb usb2: Product: EHCI Host Controller
[   10.579467] usb usb2: Manufacturer: Linux
5.15.16-1-rockchip-g359ffc4bc727 ehci_hcd
[   10.579619] usb usb2: SerialNumber: fe3c0000.usb
[   10.582596] hub 2-0:1.0: USB hub found
[   10.582872] hub 2-0:1.0: 1 port detected
[   10.586210] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[   10.586524] ohci-platform: OHCI generic platform driver
[   10.587848] ohci-platform fe3a0000.usb: Generic Platform OHCI controller
[   10.589672] ohci-platform fe3a0000.usb: new USB bus registered, assigned
bus number 3
[   10.590708] ohci-platform fe3a0000.usb: irq 20, io mem 0xfe3a0000
[   10.654476] usb usb3: New USB device found, idVendor=1d6b,
idProduct=0001, bcdDevice= 5.15
[   10.654689] usb usb3: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[   10.654841] usb usb3: Product: Generic Platform OHCI controller
[   10.654973] usb usb3: Manufacturer: Linux
5.15.16-1-rockchip-g359ffc4bc727 ohci_hcd
[   10.655120] usb usb3: SerialNumber: fe3a0000.usb
[   10.658033] hub 3-0:1.0: USB hub found
[   10.658329] hub 3-0:1.0: 1 port detected
[   10.661656] ohci-platform fe3e0000.usb: Generic Platform OHCI controller
[   10.663217] ohci-platform fe3e0000.usb: new USB bus registered, assigned
bus number 4
[   10.664185] ohci-platform fe3e0000.usb: irq 22, io mem 0xfe3e0000
[   10.726670] usb usb4: New USB device found, idVendor=1d6b,
idProduct=0001, bcdDevice= 5.15
[   10.726886] usb usb4: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[   10.727049] usb usb4: Product: Generic Platform OHCI controller
[   10.727181] usb usb4: Manufacturer: Linux
5.15.16-1-rockchip-g359ffc4bc727 ohci_hcd
[   10.727329] usb usb4: SerialNumber: fe3e0000.usb
[   10.730270] hub 4-0:1.0: USB hub found
[   10.730545] hub 4-0:1.0: 1 port detected
[   10.737209] xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
[   10.739611] xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned
bus number 5
[   10.740395] xhci-hcd xhci-hcd.0.auto: hcc params 0x0220fe64 hci version
0x110 quirks 0x0000000002010010
[   10.740805] xhci-hcd xhci-hcd.0.auto: irq 53, io mem 0xfe800000
[   10.742883] usb usb5: New USB device found, idVendor=1d6b,
idProduct=0002, bcdDevice= 5.15
[   10.743094] usb usb5: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[   10.743246] usb usb5: Product: xHCI Host Controller
[   10.743359] usb usb5: Manufacturer: Linux
5.15.16-1-rockchip-g359ffc4bc727 xhci-hcd
[   10.743512] usb usb5: SerialNumber: xhci-hcd.0.auto
[   10.746576] hub 5-0:1.0: USB hub found
[   10.746865] hub 5-0:1.0: 1 port detected
[   10.749054] xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
[   10.750454] xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned
bus number 6
[   10.750677] xhci-hcd xhci-hcd.0.auto: Host supports USB 3.0 SuperSpeed
[   10.751167] usb usb6: We don't know the algorithms for LPM for this
host, disabling LPM.
[   10.752007] usb usb6: New USB device found, idVendor=1d6b,
idProduct=0003, bcdDevice= 5.15
[   10.752187] usb usb6: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[   10.752337] usb usb6: Product: xHCI Host Controller
[   10.752451] usb usb6: Manufacturer: Linux
5.15.16-1-rockchip-g359ffc4bc727 xhci-hcd
[   10.752592] usb usb6: SerialNumber: xhci-hcd.0.auto
[   10.755365] hub 6-0:1.0: USB hub found
[   10.755669] hub 6-0:1.0: 1 port detected
[   10.758922] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
[   10.760343] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned
bus number 7
[   10.761128] xhci-hcd xhci-hcd.1.auto: hcc params 0x0220fe64 hci version
0x110 quirks 0x0000000002010010
[   10.762039] xhci-hcd xhci-hcd.1.auto: irq 54, io mem 0xfe900000
[   10.763994] usb usb7: New USB device found, idVendor=1d6b,
idProduct=0002, bcdDevice= 5.15
[   10.764191] usb usb7: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[   10.764342] usb usb7: Product: xHCI Host Controller
[   10.764455] usb usb7: Manufacturer: Linux
5.15.16-1-rockchip-g359ffc4bc727 xhci-hcd
[   10.764601] usb usb7: SerialNumber: xhci-hcd.1.auto
[   10.767411] hub 7-0:1.0: USB hub found
[   10.767696] hub 7-0:1.0: 1 port detected
[   10.769982] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
[   10.771168] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned
bus number 8
[   10.771384] xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed
[   10.771912] usb usb8: We don't know the algorithms for LPM for this
host, disabling LPM.
[   10.772717] usb usb8: New USB device found, idVendor=1d6b,
idProduct=0003, bcdDevice= 5.15
[   10.772896] usb usb8: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[   10.773046] usb usb8: Product: xHCI Host Controller
[   10.773160] usb usb8: Manufacturer: Linux
5.15.16-1-rockchip-g359ffc4bc727 xhci-hcd
[   10.773302] usb usb8: SerialNumber: xhci-hcd.1.auto
[   10.776389] hub 8-0:1.0: USB hub found
[   10.776678] hub 8-0:1.0: 1 port detected
[   10.784427] usbcore: registered new interface driver uas
[   10.785747] usbcore: registered new interface driver usb-storage
[   10.786109] usbcore: registered new interface driver ums-alauda
[   10.786423] usbcore: registered new interface driver ums-cypress
[   10.786758] usbcore: registered new interface driver ums-datafab
[   10.787095] usbcore: registered new interface driver ums_eneub6250
[   10.787409] usbcore: registered new interface driver ums-freecom
[   10.787719] usbcore: registered new interface driver ums-isd200
[   10.788017] usbcore: registered new interface driver ums-jumpshot
[   10.788326] usbcore: registered new interface driver ums-karma
[   10.788625] usbcore: registered new interface driver ums-onetouch
[   10.789023] usbcore: registered new interface driver ums-realtek
[   10.789333] usbcore: registered new interface driver ums-sddr09
[   10.789756] usbcore: registered new interface driver ums-sddr55
[   10.790070] usbcore: registered new interface driver ums-usbat
[   10.792802] usbcore: registered new interface driver iforce
[   10.793352] usbcore: registered new interface driver xpad
[   10.794485] usbcore: registered new interface driver usbtouchscreen
[   10.797315] i2c_dev: i2c /dev entries driver
[   10.816490] fan53555-regulator 0-0040: FAN53555 Option[8] Rev[1]
Detected!
[   10.818456] vdd_cpu_b: will resolve supply early: vin
[   10.818614] fan53555-regulator 0-0040: Looking up vin-supply from device
tree
[   10.818799] vdd_cpu_b: supplied by vcc5v0_sys
[   10.818944] vcc5v0_sys: could not add device link regulator.9: -ENOENT
[   10.822253] vdd_cpu_b: 712 <--> 1500 mV at 1000 mV, enabled
[   10.827044] fan53555-regulator 0-0041: FAN53555 Option[8] Rev[1]
Detected!
[   10.828780] vdd_gpu: will resolve supply early: vin
[   10.828939] fan53555-regulator 0-0041: Looking up vin-supply from device
tree
[   10.829117] vdd_gpu: supplied by vcc5v0_sys
[   10.829230] vcc5v0_sys: could not add device link regulator.10: -ENOENT
[   10.832556] vdd_gpu: 712 <--> 1500 mV at 1000 mV, enabled
[   10.841882] rk808 0-001b: chip id: 0x0
[   10.862081] rk808-regulator rk808-regulator: there is no dvs0 gpio
[   10.862548] rk808-regulator rk808-regulator: there is no dvs1 gpio
[   10.864173] vdd_center: will resolve supply early: vcc1
[   10.864337] rk808 0-001b: Looking up vcc1-supply from device tree
[   10.864503] vdd_center: supplied by vcc5v0_sys
[   10.864631] vcc5v0_sys: could not add device link regulator.11: -ENOENT
[   10.866313] vdd_center: 750 <--> 1350 mV at 900 mV, enabled
[   10.868084] vdd_cpu_l: will resolve supply early: vcc2
[   10.868241] rk808 0-001b: Looking up vcc2-supply from device tree
[   10.868402] vdd_cpu_l: supplied by vcc5v0_sys
[   10.868524] vcc5v0_sys: could not add device link regulator.12: -ENOENT
[   10.868888] vdd_cpu_l: 750 <--> 1350 mV at 900 mV, enabled
[   10.870335] vcc_ddr: will resolve supply early: vcc3
[   10.870485] rk808 0-001b: Looking up vcc3-supply from device tree
[   10.870646] vcc_ddr: supplied by vcc5v0_sys
[   10.870761] vcc5v0_sys: could not add device link regulator.13: -ENOENT
[   10.871149] vcc_ddr: at 5000 mV, enabled
[   10.873225] vcc_1v8: will resolve supply early: vcc4
[   10.873379] rk808 0-001b: Looking up vcc4-supply from device tree
[   10.873816] vcc_1v8: supplied by vcc5v0_sys
[   10.873940] vcc5v0_sys: could not add device link regulator.14: -ENOENT
[   10.874308] vcc_1v8: 1800 mV, enabled
[   10.876864] vcc1v8_dvp: will resolve supply early: vcc6
[   10.877025] rk808 0-001b: Looking up vcc6-supply from device tree
[   10.877180] vcc1v8_dvp: supplied by vcc5v0_sys
[   10.877300] vcc5v0_sys: could not add device link regulator.15: -ENOENT
[   10.878934] vcc1v8_dvp: 1800 mV, enabled
[   10.881114] vcca1v8_hdmi: will resolve supply early: vcc6
[   10.881268] rk808 0-001b: Looking up vcc6-supply from device tree
[   10.881721] vcca1v8_hdmi: supplied by vcc5v0_sys
[   10.881858] vcc5v0_sys: could not add device link regulator.16: -ENOENT
[   10.882897] vcca1v8_hdmi: 1800 mV, enabled
[   10.885121] vcca_1v8: will resolve supply early: vcc7
[   10.885284] rk808 0-001b: Looking up vcc7-supply from device tree
[   10.885610] vcca_1v8: supplied by vcc5v0_sys
[   10.885752] vcc5v0_sys: could not add device link regulator.17: -ENOENT
[   10.886785] vcca_1v8: 1800 mV, enabled
[   10.888911] vcc_sd: will resolve supply early: vcc9
[   10.889073] rk808 0-001b: Looking up vcc9-supply from device tree
[   10.889227] vcc_sd: supplied by vcc5v0_sys
[   10.889337] vcc5v0_sys: could not add device link regulator.18: -ENOENT
[   10.890587] vcc_sd: 1800 <--> 3300 mV at 3000 mV, enabled
[   10.892799] vcc3v0_sd: will resolve supply early: vcc9
[   10.892957] rk808 0-001b: Looking up vcc9-supply from device tree
[   10.893116] vcc3v0_sd: supplied by vcc5v0_sys
[   10.893261] vcc5v0_sys: could not add device link regulator.19: -ENOENT
[   10.894528] vcc3v0_sd: 3000 mV, enabled
[   10.896651] vcc_1v5: will resolve supply early: vcc10
[   10.896806] rk808 0-001b: Looking up vcc10-supply from device tree
[   10.896961] vcc_1v5: supplied by vcc5v0_sys
[   10.897073] vcc5v0_sys: could not add device link regulator.20: -ENOENT
[   10.898331] vcc_1v5: 1500 mV, enabled
[   10.900480] vcca0v9_hdmi: will resolve supply early: vcc7
[   10.900633] rk808 0-001b: Looking up vcc7-supply from device tree
[   10.900789] vcca0v9_hdmi: supplied by vcc5v0_sys
[   10.900910] vcc5v0_sys: could not add device link regulator.21: -ENOENT
[   10.901947] vcca0v9_hdmi: 900 mV, enabled
[   10.904130] vcc_3v0: will resolve supply early: vcc11
[   10.904283] rk808 0-001b: Looking up vcc11-supply from device tree
[   10.904440] vcc_3v0: supplied by vcc5v0_sys
[   10.904551] vcc5v0_sys: could not add device link regulator.22: -ENOENT
[   10.905603] vcc_3v0: 3000 mV, enabled
[   10.906825] vcc3v3_s3: will resolve supply early: vcc8
[   10.907071] rk808 0-001b: Looking up vcc8-supply from device tree
[   10.907238] vcc3v3_s3: supplied by vcc3v3_sys
[   10.907358] vcc3v3_sys: could not add device link regulator.23: -ENOENT
[   10.907702] vcc3v3_s3: at 3300 mV, enabled
[   10.908814] vcc3v3_s0: will resolve supply early: vcc12
[   10.908951] rk808 0-001b: Looking up vcc12-supply from device tree
[   10.909117] vcc3v3_s0: supplied by vcc3v3_sys
[   10.909238] vcc3v3_sys: could not add device link regulator.24: -ENOENT
[   10.909966] vcc3v3_s0: at 3300 mV, enabled
[   10.923748] rk808-rtc rk808-rtc: registered as rtc0
[   10.925890] rk808-rtc rk808-rtc: setting system clock to
2013-01-18T08:54:34 UTC (1358499274)
[   10.937312] rockchip-rga ff680000.rga: HW Version: 0x03.02
[   10.938723] rockchip-rga: probe of ff680000.rga failed with error -12
[   10.940550] usbcore: registered new interface driver uvcvideo
[   10.947281] rockchip-thermal ff260000.tsadc: failed to register sensor
0: -517
[   10.947553] rockchip-thermal ff260000.tsadc: failed to register
sensor[0] : error = -517
[   10.951347] dw_wdt ff848000.watchdog: No valid TOPs array specified
[   10.957666] device-mapper: ioctl: 4.45.0-ioctl (2021-03-22) initialised:
dm-devel@redhat.com
[   10.958918] Bluetooth: HCI UART driver ver 2.3
[   10.959059] Bluetooth: HCI UART protocol H4 registered
[   10.959172] Bluetooth: HCI UART protocol ATH3K registered
[   10.959600] usbcore: registered new interface driver bfusb
[   10.960069] usbcore: registered new interface driver btusb
[   10.960865] cpu cpu0: OPP table can't be empty
[   10.963410] sdhci: Secure Digital Host Controller Interface driver
[   10.963573] sdhci: Copyright(c) Pierre Ossman
[   10.963674] Synopsys Designware Multimedia Card Interface Driver
[   10.966723] sdhci-pltfm: SDHCI platform and OF driver helper
[   10.969834] dwmmc_rockchip fe310000.mmc: IDMAC supports 32-bit address
mode.
[   10.970158] dwmmc_rockchip fe310000.mmc: Using internal DMA controller.
[   10.970317] dwmmc_rockchip fe310000.mmc: Version ID is 270a
[   10.971055] dwmmc_rockchip fe310000.mmc: DW MMC controller at irq 17,32
bit host data width,256 deep fifo
[   10.972116] dwmmc_rockchip fe310000.mmc: Looking up vmmc-supply from
device tree
[   10.972318] dwmmc_rockchip fe310000.mmc: Looking up vmmc-supply property
in node /mmc@fe310000 failed
[   10.972647] dwmmc_rockchip fe310000.mmc: Looking up vqmmc-supply from
device tree
[   10.972823] dwmmc_rockchip fe310000.mmc: Looking up vqmmc-supply
property in node /mmc@fe310000 failed
[   10.989783] ledtrig-cpu: registered to indicate activity on CPUs
[   10.990632] hid: raw HID events driver (C) Jiri Kosina
[   11.018314] usbcore: registered new interface driver usbhid
[   11.018612] usbhid: USB HID core driver
[   11.020835] rkvdec ff660000.video-codec: Adding to iommu group 1
[   11.068158] hantro-vpu ff650000.video-codec: Adding to iommu group 0
[   11.072492] irq: type mismatch, failed to map hwirq-32 for
interrupt-controller!
[   11.072712] hantro-vpu ff650000.video-codec: IRQ vdpu not found
[   11.074844] Zoran MJPEG board driver version 0.10.1
[   11.075255] Linux video codec intermediate layer: v0.2
[   11.075418] saa7146: register extension 'av7110'
[   11.083859] sdhci-arasan fe330000.mmc: Looking up vmmc-supply from
device tree
[   11.091432] usbcore: registered new interface driver snd-usb-audio
[   11.099500] sdhci-arasan fe330000.mmc: Looking up vmmc-supply property
in node /mmc@fe330000 failed
[   11.112425] u32 classifier
[   11.112499] sdhci-arasan fe330000.mmc: Looking up vqmmc-supply from
device tree
[   11.113020]     input device check on
[   11.114266] Initializing XFRM netlink socket
[   11.120358] sdhci-arasan fe330000.mmc: Looking up vqmmc-supply property
in node /mmc@fe330000 failed
[   11.121602] NET: Registered PF_INET6 protocol family
[   11.123037] usb 8-1: new SuperSpeed USB device number 2 using xhci-hcd
[   11.134670] Segment Routing with IPv6
[   11.135294] In-situ OAM (IOAM) with IPv6
[   11.135867] NET: Registered PF_PACKET protocol family
[   11.136112] NET: Registered PF_KEY protocol family
[   11.136230] mmc2: CQHCI version 5.10
[   11.136568] Bridge firewalling registered
[   11.136633] can: controller area network core
[   11.138034] NET: Registered PF_CAN protocol family
[   11.141093] Bluetooth: RFCOMM socket layer initialized
[   11.141809] Bluetooth: RFCOMM ver 1.11
[   11.142039] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
[   11.142209] Bluetooth: HIDP socket layer initialized
[   11.142338] 8021q: 802.1Q VLAN Support v1.8
[   11.142653] Key type dns_resolver registered
[   11.149920] registered taskstats version 1
[   11.150671] Loading compiled-in X.509 certificates
[   11.151208] random: fast init done
[   11.155983] usb 8-1: New USB device found, idVendor=152d,
idProduct=0561, bcdDevice= 0.01
[   11.156263] usb 8-1: New USB device strings: Mfr=1, Product=2,
SerialNumber=5
[   11.156439] usb 8-1: Product: JMS56x Series
[   11.156545] usb 8-1: Manufacturer: JMicron
[   11.156646] usb 8-1: SerialNumber: RANDOM__A0840143833E
[   11.168652] usb-storage 8-1:1.0: USB Mass Storage device detected
[   11.178360] scsi host0: usb-storage 8-1:1.0
[   11.196406] Btrfs loaded, crc32c=crc32c-generic, integrity-checker=on,
zoned=no, fsverity=no
[   11.197865] BTRFS: selftest: sectorsize: 4096  nodesize: 4096
[   11.198037] BTRFS: selftest: running btrfs free space cache tests
[   11.198203] BTRFS: selftest: running extent only tests
[   11.198401] BTRFS: selftest: running bitmap only tests
[   11.198583] BTRFS: selftest: running bitmap and extent tests
[   11.198850] BTRFS: selftest: running space stealing from bitmap to
extent tests
[   11.202503] mmc2: SDHCI controller on fe330000.mmc [fe330000.mmc] using
ADMA
[   11.206911] BTRFS: selftest: running extent buffer operation tests
[   11.207131] BTRFS: selftest: running btrfs_split_item tests
[   11.207469] BTRFS: selftest: running extent I/O tests
[   11.207579] BTRFS: selftest: running find delalloc tests
[   13.247196] BTRFS: selftest: running find_first_clear_extent_bit test
[   13.247996] BTRFS: selftest: running extent buffer bitmap tests
[   13.436326] BTRFS: selftest: running inode tests
[   13.436468] BTRFS: selftest: running btrfs_get_extent tests
[   13.437811] BTRFS: selftest: running hole first btrfs_get_extent test
[   13.438152] BTRFS: selftest: running outstanding_extents tests
[   13.438630] BTRFS: selftest: running qgroup tests
[   13.438747] BTRFS: selftest: running qgroup add/remove tests
[   13.439210] BTRFS: selftest: running qgroup multiple refs test
[   13.440099] BTRFS: selftest: running free space tree tests
[   13.880122] BTRFS: selftest: sectorsize: 4096  nodesize: 8192
[   13.880446] BTRFS: selftest: running btrfs free space cache tests
[   13.880648] BTRFS: selftest: running extent only tests
[   13.880883] BTRFS: selftest: running bitmap only tests
[   13.881123] BTRFS: selftest: running bitmap and extent tests
[   13.881545] BTRFS: selftest: running space stealing from bitmap to
extent tests
[   13.889765] BTRFS: selftest: running extent buffer operation tests
[   13.889923] BTRFS: selftest: running btrfs_split_item tests
[   13.890241] BTRFS: selftest: running extent I/O tests
[   13.890369] BTRFS: selftest: running find delalloc tests
[   15.931291] BTRFS: selftest: running find_first_clear_extent_bit test
[   15.932162] BTRFS: selftest: running extent buffer bitmap tests
[   16.532870] BTRFS: selftest: running inode tests
[   16.533138] BTRFS: selftest: running btrfs_get_extent tests
[   16.534815] BTRFS: selftest: running hole first btrfs_get_extent test
[   16.535219] BTRFS: selftest: running outstanding_extents tests
[   16.535736] BTRFS: selftest: running qgroup tests
[   16.535846] BTRFS: selftest: running qgroup add/remove tests
[   16.536300] BTRFS: selftest: running qgroup multiple refs test
[   16.537056] BTRFS: selftest: running free space tree tests
[   16.977337] BTRFS: selftest: sectorsize: 4096  nodesize: 16384
[   16.977814] BTRFS: selftest: running btrfs free space cache tests
[   16.978018] BTRFS: selftest: running extent only tests
[   16.978279] BTRFS: selftest: running bitmap only tests
[   16.978513] BTRFS: selftest: running bitmap and extent tests
[   16.978842] BTRFS: selftest: running space stealing from bitmap to
extent tests
[   16.987056] BTRFS: selftest: running extent buffer operation tests
[   16.987214] BTRFS: selftest: running btrfs_split_item tests
[   16.987541] BTRFS: selftest: running extent I/O tests
[   16.987667] BTRFS: selftest: running find delalloc tests
[   19.025223] BTRFS: selftest: running find_first_clear_extent_bit test
[   19.026172] BTRFS: selftest: running extent buffer bitmap tests
[   20.225626] BTRFS: selftest: running inode tests
[   20.225841] BTRFS: selftest: running btrfs_get_extent tests
[   20.227444] BTRFS: selftest: running hole first btrfs_get_extent test
[   20.227818] BTRFS: selftest: running outstanding_extents tests
[   20.228276] BTRFS: selftest: running qgroup tests
[   20.228399] BTRFS: selftest: running qgroup add/remove tests
[   20.228834] BTRFS: selftest: running qgroup multiple refs test
[   20.229952] BTRFS: selftest: running free space tree tests
[   20.669501] BTRFS: selftest: sectorsize: 4096  nodesize: 32768
[   20.669747] BTRFS: selftest: running btrfs free space cache tests
[   20.669903] BTRFS: selftest: running extent only tests
[   20.670123] BTRFS: selftest: running bitmap only tests
[   20.670366] BTRFS: selftest: running bitmap and extent tests
[   20.670625] BTRFS: selftest: running space stealing from bitmap to
extent tests
[   20.678498] BTRFS: selftest: running extent buffer operation tests
[   20.678644] BTRFS: selftest: running btrfs_split_item tests
[   20.678971] BTRFS: selftest: running extent I/O tests
[   20.679083] BTRFS: selftest: running find delalloc tests
[   22.716824] BTRFS: selftest: running find_first_clear_extent_bit test
[   22.717705] BTRFS: selftest: running extent buffer bitmap tests
[   25.119619] BTRFS: selftest: running inode tests
[   25.119942] BTRFS: selftest: running btrfs_get_extent tests
[   25.121224] BTRFS: selftest: running hole first btrfs_get_extent test
[   25.121825] BTRFS: selftest: running outstanding_extents tests
[   25.122316] BTRFS: selftest: running qgroup tests
[   25.122425] BTRFS: selftest: running qgroup add/remove tests
[   25.122860] BTRFS: selftest: running qgroup multiple refs test
[   25.123715] BTRFS: selftest: running free space tree tests
[   25.564237] BTRFS: selftest: sectorsize: 4096  nodesize: 65536
[   25.564448] BTRFS: selftest: running btrfs free space cache tests
[   25.564600] BTRFS: selftest: running extent only tests
[   25.564762] BTRFS: selftest: running bitmap only tests
[   25.564946] BTRFS: selftest: running bitmap and extent tests
[   25.565204] BTRFS: selftest: running space stealing from bitmap to
extent tests
[   25.573041] BTRFS: selftest: running extent buffer operation tests
[   25.573167] BTRFS: selftest: running btrfs_split_item tests
[   25.573626] BTRFS: selftest: running extent I/O tests
[   25.573739] BTRFS: selftest: running find delalloc tests
[   27.608826] BTRFS: selftest: running find_first_clear_extent_bit test
[   27.609668] BTRFS: selftest: running extent buffer bitmap tests
[   32.430665] BTRFS: selftest: running inode tests
[   32.431202] BTRFS: selftest: running btrfs_get_extent tests
[   32.432886] BTRFS: selftest: running hole first btrfs_get_extent test
[   32.433377] BTRFS: selftest: running outstanding_extents tests
[   32.434257] BTRFS: selftest: running qgroup tests
[   32.434373] BTRFS: selftest: running qgroup add/remove tests
[   32.434818] BTRFS: selftest: running qgroup multiple refs test
[   32.435655] BTRFS: selftest: running free space tree tests
[   32.877773] BTRFS: selftest: running extent_map tests
[   32.878137] BTRFS: selftest: running rmap tests
[   33.072074] rockchip-pcie f8000000.pcie: host bridge /pcie@f8000000
ranges:
[   33.073026] rockchip-pcie f8000000.pcie:      MEM
0x00fa000000..0x00fbdfffff -> 0x00fa000000
[   33.073259] rockchip-pcie f8000000.pcie:       IO
0x00fbe00000..0x00fbefffff -> 0x00fbe00000
[   33.077844] rockchip-pcie f8000000.pcie: Looking up vpcie12v-supply from
device tree
[   33.078083] rockchip-pcie f8000000.pcie: Looking up vpcie12v-supply
property in node /pcie@f8000000 failed
[   33.078823] rockchip-pcie f8000000.pcie: no vpcie12v regulator found
[   33.079068] rockchip-pcie f8000000.pcie: Looking up vpcie3v3-supply from
device tree
[   33.080295] rockchip-pcie f8000000.pcie: Looking up vpcie1v8-supply from
device tree
[   33.081188] rockchip-pcie f8000000.pcie: Looking up vpcie0v9-supply from
device tree
[   33.122020] genirq: Setting trigger mode 2 for irq 15 failed
(gic_set_type+0x0/0x138)
[   33.122820] irq: no irq domain found for interrupt-controller !
[   33.122995] rockchip-pcie f8000000.pcie: IRQ client not found
[   33.132257] rockchip-iodomain ff320000.syscon:io-domains: Looking up
pmu1830-supply from device tree
[   33.135488] rockchip-iodomain ff770000.syscon:io-domains: Looking up
bt656-supply from device tree
[   33.136399] rockchip-iodomain ff770000.syscon:io-domains: Looking up
audio-supply from device tree
[   33.136825] rockchip-iodomain ff770000.syscon:io-domains: Looking up
sdmmc-supply from device tree
[   33.138130] rockchip-iodomain ff770000.syscon:io-domains: Looking up
gpio1830-supply from device tree
[   33.154798] rockchip-drm display-subsystem: bound ff8f0000.vop (ops
0xffffffc010e887e8)
[   33.159530] rockchip-drm display-subsystem: bound ff900000.vop (ops
0xffffffc010e887e8)
[   33.161342] dwhdmi-rockchip ff940000.hdmi: Detected HDMI TX controller
v2.11a with HDCP (DWC HDMI 2.0 TX PHY)
[   33.171366] rockchip-drm display-subsystem: bound ff940000.hdmi (ops
0xffffffc010e8c6c0)
[   33.180852] [drm] Initialized rockchip 1.0.0 20140818 for
display-subsystem on minor 0
[   33.183921] mali ff9a0000.gpu: No IRQ resource at index 1
[   33.184155] mali ff9a0000.gpu: IRQ search failed
[   33.184644] mali: probe of ff9a0000.gpu failed with error -2
[   33.190550] rockchip-thermal ff260000.tsadc: failed to register sensor
0: -517
[   33.190882] rockchip-thermal ff260000.tsadc: failed to register
sensor[0] : error = -517
[   33.200478] dwmmc_rockchip fe310000.mmc: IDMAC supports 32-bit address
mode.
[   33.201294] dwmmc_rockchip fe310000.mmc: Using internal DMA controller.
[   33.201673] dwmmc_rockchip fe310000.mmc: Version ID is 270a
[   33.202201] dwmmc_rockchip fe310000.mmc: DW MMC controller at irq 17,32
bit host data width,256 deep fifo
[   33.203308] dwmmc_rockchip fe310000.mmc: Looking up vmmc-supply from
device tree
[   33.203527] dwmmc_rockchip fe310000.mmc: Looking up vmmc-supply property
in node /mmc@fe310000 failed
[   33.204253] dwmmc_rockchip fe310000.mmc: Looking up vqmmc-supply from
device tree
[   33.204424] dwmmc_rockchip fe310000.mmc: Looking up vqmmc-supply
property in node /mmc@fe310000 failed
[   33.216884] rockchip-thermal ff260000.tsadc: failed to register sensor
0: -517
[   33.217686] rockchip-thermal ff260000.tsadc: failed to register
sensor[0] : error = -517
[   33.226865] dwmmc_rockchip fe310000.mmc: IDMAC supports 32-bit address
mode.
[   33.227549] dwmmc_rockchip fe310000.mmc: Using internal DMA controller.
[   33.227708] dwmmc_rockchip fe310000.mmc: Version ID is 270a
[   33.228322] dwmmc_rockchip fe310000.mmc: DW MMC controller at irq 17,32
bit host data width,256 deep fifo
[   33.229879] dwmmc_rockchip fe310000.mmc: Looking up vmmc-supply from
device tree
[   33.230089] dwmmc_rockchip fe310000.mmc: Looking up vmmc-supply property
in node /mmc@fe310000 failed
[   33.230767] dwmmc_rockchip fe310000.mmc: Looking up vqmmc-supply from
device tree
[   33.230963] dwmmc_rockchip fe310000.mmc: Looking up vqmmc-supply
property in node /mmc@fe310000 failed
[   33.268761] rockchip-thermal ff260000.tsadc: failed to register sensor
0: -517
[   33.274833] rockchip-thermal ff260000.tsadc: failed to register
sensor[0] : error = -517
[   33.299373] clk: Not disabling unused clocks
[   33.300367] ALSA device list:
[   33.300487]   #0: hdmi-sound
[   33.325969] Freeing unused kernel memory: 5504K
[   33.334276] Run /init as init process
[   33.334455]   with arguments:
[   33.334569]     /init
[   33.334643]   with environment:
[   33.334724]     HOME=/
[   33.334796]     TERM=linux
[   33.334872]     earlyprintk=xen
Loading, please wait...
Starting version 245.4-4ubuntu3
[   39.458844] rk_gmac-dwmac fe300000.ethernet: IRQ eth_wake_irq not found
[   39.459243] rk_gmac-dwmac fe300000.ethernet: IRQ eth_lpi not found
[   39.460311] rk_gmac-dwmac fe300000.ethernet: PTP uses main clock
[   39.460560] rk_gmac-dwmac fe300000.ethernet: Looking up phy-supply from
device tree
[   39.462867] rk_gmac-dwmac fe300000.ethernet: clock input or output?
(input).
[   39.463089] rk_gmac-dwmac fe300000.ethernet: TX delay(0x28).
[   39.463224] rk_gmac-dwmac fe300000.ethernet: RX delay(0x11).
[   39.463365] rk_gmac-dwmac fe300000.ethernet: integrated PHY? (no).
[   39.463717] rk_gmac-dwmac fe300000.ethernet: cannot get clock
clk_mac_speed
[   39.463995] rk_gmac-dwmac fe300000.ethernet: clock input from PHY
[   39.469266] rk_gmac-dwmac fe300000.ethernet: init for RGMII
[   39.531375] rk_gmac-dwmac fe300000.ethernet: User ID: 0x10, Synopsys ID:
0x35
[   39.540951] rk_gmac-dwmac fe300000.ethernet:         DWMAC1000
[   39.543024] rk_gmac-dwmac fe300000.ethernet: DMA HW capability register
supported
[   39.543220] rk_gmac-dwmac fe300000.ethernet: RX Checksum Offload Engine
supported
[   39.543358] rk_gmac-dwmac fe300000.ethernet: COE Type 2
[   39.543476] rk_gmac-dwmac fe300000.ethernet: TX Checksum insertion
supported
[   39.543614] rk_gmac-dwmac fe300000.ethernet: Wake-Up On Lan supported
[   39.544622] rk_gmac-dwmac fe300000.ethernet: Normal descriptors
[   39.545001] rk_gmac-dwmac fe300000.ethernet: Ring mode enabled
[   39.545138] rk_gmac-dwmac fe300000.ethernet: Enable RX Mitigation via HW
Watchdog Timer
[   39.545312] rk_gmac-dwmac fe300000.ethernet: device MAC address
6e:d0:b3:b7:fc:57
[   40.095457] libphy: stmmac: probed
[   40.096018] mdio_bus stmmac-0:00: attached PHY driver [unbound]
(mii_bus:phy_addr=stmmac-0:00, irq=POLL)
[   40.096233] mdio_bus stmmac-0:01: attached PHY driver [unbound]
(mii_bus:phy_addr=stmmac-0:01, irq=POLL)
[   40.338726] dwmmc_rockchip fe310000.mmc: IDMAC supports 32-bit address
mode.
[   40.339251] dwmmc_rockchip fe310000.mmc: Using internal DMA controller.
[   40.339415] dwmmc_rockchip fe310000.mmc: Version ID is 270a
[   40.339902] dwmmc_rockchip fe310000.mmc: DW MMC controller at irq 17,32
bit host data width,256 deep fifo
[   40.344800] dwmmc_rockchip fe310000.mmc: Looking up vmmc-supply from
device tree
[   40.345102] dwmmc_rockchip fe310000.mmc: Looking up vmmc-supply property
in node /mmc@fe310000 failed
[   40.345849] rockchip-thermal ff260000.tsadc: failed to register sensor
0: -517
[   40.345897] dwmmc_rockchip fe310000.mmc: Looking up vqmmc-supply from
device tree
[   40.346034] rockchip-thermal ff260000.tsadc: failed to register
sensor[0] : error = -517
[   40.346160] dwmmc_rockchip fe310000.mmc: Looking up vqmmc-supply
property in node /mmc@fe310000 failed

Begin: Loading essential drivers ... done.
Begin: Running /scripts/init-premount ... done.
Begin: Mounting root file system ... Begin: Running /scripts/local-top ...
done.
Begin: Running /scripts/local-premount ...
done.
[   64.586284] vcc3v3_pcie: disabling
Begin: Waiting for root file system ... Begin: Running /scripts/local-block
... done.
done.
Gave up waiting for root file system device.  Common problems:
 - Boot args (cat /proc/cmdline)
   - Check rootdelay= (did the system wait long enough?)
 - Missing modules (cat /proc/modules; ls /dev)
ALERT!  /dev/nvme0n1p2 does not exist.  Dropping to a shell!


BusyBox v1.30.1 (Ubuntu 1:1.30.1-4ubuntu6) built-in shell (ash)
Enter 'help' for a list of built-in commands.

(initramfs)



- Brad

--000000000000c00fc105e38bdacc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I&#39;ve been trying to get Xen =
to boot dom0 with my kernel for weeks on an rk3399 based board and thought =
I&#39;d reach out for help. It looks like either Xen is not properly recrea=
ting the device tree or the interrupt controller is just failing. The hyper=
visor boots but falls to initramfs because it cannot find the root device (=
nvme on pcie). Any help would be greatly appreciated. Here is the complete =
boot log</div><div><br></div><div>DDR Version 1.20 20190314<br>In<br>soft r=
eset<br>SRX<br>channel 0<br>CS =3D 0<br>MR0=3D0x98<br>MR4=3D0x2<br>MR5=3D0x=
FF<br>MR8=3D0x10<br>MR12=3D0x72<br>MR14=3D0x72<br>MR18=3D0x0<br>MR19=3D0x0<=
br>MR24=3D0x8<br>MR25=3D0x0<br>channel 1<br>CS =3D 0<br>MR0=3D0x98<br>MR4=
=3D0x2<br>MR5=3D0xFF<br>MR8=3D0x10<br>MR12=3D0x72<br>MR14=3D0x72<br>MR18=3D=
0x0<br>MR19=3D0x0<br>MR24=3D0x8<br>MR25=3D0x0<br>channel 0 training pass!<b=
r>channel 1 training pass!<br>change freq to 400MHz 0,1<br>channel 0<br>CS =
=3D 0<br>MR0=3D0x98<br>MR4=3D0x2<br>MR5=3D0xFF<br>MR8=3D0x10<br>MR12=3D0x72=
<br>MR14=3D0x72<br>MR18=3D0x0<br>MR19=3D0x0<br>MR24=3D0x8<br>MR25=3D0x0<br>=
channel 1<br>CS =3D 0<br>MR0=3D0x98<br>MR4=3D0x2<br>MR5=3D0xFF<br>MR8=3D0x1=
0<br>MR12=3D0x72<br>MR14=3D0x72<br>MR18=3D0x0<br>MR19=3D0x0<br>MR24=3D0x8<b=
r>MR25=3D0x0<br>channel 0 training pass!<br>channel 1 training pass!<br>cha=
nge freq to 800MHz 1,0<br>Channel 0: LPDDR4,800MHz<br>Bus Width=3D32 Col=3D=
10 Bank=3D8 Row=3D16 CS=3D1 Die Bus-Width=3D16 Size=3D2048MB<br>Channel 1: =
LPDDR4,800MHz<br>Bus Width=3D32 Col=3D10 Bank=3D8 Row=3D16 CS=3D1 Die Bus-W=
idth=3D16 Size=3D2048MB<br>256B stride<br>ch 0 ddrconfig =3D 0x101, ddrsize=
 =3D 0x40<br>ch 1 ddrconfig =3D 0x101, ddrsize =3D 0x40<br>pmugrf_os_reg[2]=
 =3D 0x32C1F2C1, stride =3D 0xD<br>OUT<br>Boot1: 2018-06-26, version: 1.14<=
br>CPUId =3D 0x0<br>ChipType =3D 0x10, 280<br>Spi_ChipId =3D ef6017<br>SpiB=
ootInit:0<br>mmc0:cmd8,32<br>mmc0:cmd5,32<br>mmc0:cmd55,32<br>mmc0:cmd1,32<=
br>mmc0:cmd8,32<br>mmc0:cmd5,32<br>mmc0:cmd55,32<br>mmc0:cmd1,32<br>mmc0:cm=
d8,32<br>mmc0:cmd5,32<br>mmc0:cmd55,32<br>mmc0:cmd1,32<br>SdmmcInit=3D0 1<b=
r>StorageInit ok =3D 23477<br>SecureMode =3D 0<br>SecureInit ret =3D 0, Sec=
ureMode =3D 0<br>GPT vendor signature is wrong<br>LoadTrust Addr:0x1800<br>=
No find bl30.bin<br>No find bl32.bin<br>Load uboot, ReadLba =3D 1000<br>Loa=
d OK, addr=3D0x200000, size=3D0xc3140<br>RunBL31 0x10000<br>NOTICE: =C2=A0B=
L31: v1.3(debug):0e7a845<br>NOTICE: =C2=A0BL31: Built : 16:13:46, Apr 17 20=
19<br>NOTICE: =C2=A0BL31: Rockchip release version: v1.1<br>INFO: =C2=A0 =
=C2=A0GICv3 with legacy support detected. ARM GICV3 driver initialized in E=
L3<br>INFO: =C2=A0 =C2=A0Using opteed sec cpu_context!<br>INFO: =C2=A0 =C2=
=A0boot cpu mask: 0<br>INFO: =C2=A0 =C2=A0plat_rockchip_pmu_init(1181): pd =
status 3e<br>INFO: =C2=A0 =C2=A0BL31: Initializing runtime services<br>WARN=
ING: No OPTEE provided by BL2 boot loader, Booting device without OPTEE ini=
tialization. SMC`s destined for OPTEE will return SMC_UNK<br>ERROR: =C2=A0 =
Error initializing runtime service opteed_fast<br>INFO: =C2=A0 =C2=A0BL31: =
Preparing for EL3 exit to normal world<br>INFO: =C2=A0 =C2=A0Entry point ad=
dress =3D 0x200000<br>INFO: =C2=A0 =C2=A0SPSR =3D 0x3c9<br><br><br>U-Boot 2=
021.10 (Jul 11 2022 - 11:32:57 -0500)<br><br>SoC: Rockchip rk3399<br>Reset =
cause: RST<br>Model: Vamrs RK3399 ZAKU<br>DRAM: =C2=A03.9 GiB<br>PMIC: =C2=
=A0RK808 <br>MMC: =C2=A0 mmc@fe310000: 3, mmc@fe330000: 0<br>Loading Enviro=
nment from FAT... In: =C2=A0 =C2=A0serial<br>Out: =C2=A0 serial<br>Err: =C2=
=A0 serial<br>Model: Vamrs RK3399 ZAKU<br>Net: =C2=A0 No ethernet found.<br=
>Hit any key to stop autoboot: =C2=A00 <br>zaku =3D&gt;<br>zaku =3D&gt; run=
 boot_pci_enum; run nvme_init; fatload nvme 0:1 0x02000000 xen-uImage; fatl=
oad nvme 0:1 0x01f00000 rk3399-zaku.dtb;<br>1114184 bytes read in 8 ms (132=
.8 MiB/s)<br>57153 bytes read in 5 ms (10.9 MiB/s)<br>zaku =3D&gt; fatload =
nvme 0:1 0x03F80000 Image;fatload nvme 0:1 0x06000000 initrd.img-5.15.16-1-=
rockchip-g359ffc4bc727;bootm 0x02000000 - 0x00<br>27885576 bytes read in 75=
 ms (354.6 MiB/s)<br>8674182 bytes read in 28 ms (295.4 MiB/s)<br>## Bootin=
g kernel from Legacy Image at 02000000 ...<br>=C2=A0 =C2=A0Image Name: =C2=
=A0 <br>=C2=A0 =C2=A0Image Type: =C2=A0 AArch64 Linux Kernel Image (uncompr=
essed)<br>=C2=A0 =C2=A0Data Size: =C2=A0 =C2=A01114120 Bytes =3D 1.1 MiB<br=
>=C2=A0 =C2=A0Load Address: 02000000<br>=C2=A0 =C2=A0Entry Point: =C2=A0020=
00000<br>=C2=A0 =C2=A0Verifying Checksum ... OK<br>## Flattened Device Tree=
 blob at 01f00000<br>=C2=A0 =C2=A0Booting using the fdt blob at 0x1f00000<b=
r>=C2=A0 =C2=A0Loading Kernel Image<br>=C2=A0 =C2=A0Loading Device Tree to =
00000000f1efd000, end 00000000f1f0df40 ... OK<br><br>Starting kernel ...<br=
><br>=C2=A0Xen 4.17-unstable<br>(XEN) Xen version 4.17-unstable (root@) (aa=
rch64-linux-gnu-gcc (Linaro GCC 7.3-2018.05) 7.3.1 20180425 [linaro-7.3-201=
8.05 revision d2912<br>(XEN) Latest ChangeSet: <br>(XEN) build-id: aaba62ac=
5bc435965722c47224a16d44f95847b9<br>(XEN) Processor: 00000000410fd034: &quo=
t;ARM Limited&quot;, variant: 0x0, part 0xd03,rev 0x4<br>(XEN) 64-bit Execu=
tion:<br>(XEN) =C2=A0 Processor Features: 0000000001002222 0000000000000000=
<br>(XEN) =C2=A0 =C2=A0 Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0=
:64+32<br>(XEN) =C2=A0 =C2=A0 Extensions: FloatingPoint AdvancedSIMD GICv3-=
SysReg<br>(XEN) =C2=A0 Debug Features: 0000000010305106 0000000000000000<br=
>(XEN) =C2=A0 Auxiliary Features: 0000000000000000 0000000000000000<br>(XEN=
) =C2=A0 Memory Model Features: 0000000000001122 0000000000000000<br>(XEN) =
=C2=A0 ISA Features: =C2=A00000000000011120 0000000000000000<br>(XEN) 32-bi=
t Execution:<br>(XEN) =C2=A0 Processor Features: 0000000000000131:000000001=
0011011<br>(XEN) =C2=A0 =C2=A0 Instruction Sets: AArch32 A32 Thumb Thumb-2 =
Jazelle<br>(XEN) =C2=A0 =C2=A0 Extensions: GenericTimer Security<br>(XEN) =
=C2=A0 Debug Features: 0000000003010066<br>(XEN) =C2=A0 Auxiliary Features:=
 0000000000000000<br>(XEN) =C2=A0 Memory Model Features: 0000000010201105 0=
000000040000000<br>(XEN) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000000001260000 0000000002102211<=
br>(XEN) =C2=A0 ISA Features: 0000000002101110 0000000013112111 00000000212=
32042<br>(XEN) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0000=
000001112131 0000000000011142 0000000000011121<br>(XEN) Using SMC Calling C=
onvention v1.0<br>(XEN) Using PSCI v1.0<br>(XEN) SMP: Allowing 6 CPUs<br>(X=
EN) Generic Timer IRQ: phys=3D30 hyp=3D26 virt=3D27 Freq: 24000 KHz<br>(XEN=
) GICv3 initialization:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 gic_dist_addr=3D0x000=
000fee00000<br>(XEN) =C2=A0 =C2=A0 =C2=A0 gic_maintenance_irq=3D25<br>(XEN)=
 =C2=A0 =C2=A0 =C2=A0 gic_rdist_stride=3D0<br>(XEN) =C2=A0 =C2=A0 =C2=A0 gi=
c_rdist_regions=3D1<br>(XEN) =C2=A0 =C2=A0 =C2=A0 redistributor regions:<br=
>(XEN) =C2=A0 =C2=A0 =C2=A0 =C2=A0 - region 0: 0x000000fef00000 - 0x000000f=
efc0000<br>(XEN) GICv3 compatible with GICv2 cbase 0x000000fff00000 vbase 0=
x000000fff20000<br>(XEN) GICv3: 288 lines, (IID 0001143b).<br>(XEN) GICv3: =
CPU0: Found redistributor in region 0 @000000004001c000<br>(XEN) XSM Framew=
ork v1.0.1 initialized<br>(XEN) Initialising XSM SILO mode<br>(XEN) Using s=
cheduler: SMP Credit Scheduler rev2 (credit2)<br>(XEN) Initializing Credit2=
 scheduler<br>(XEN) =C2=A0load_precision_shift: 18<br>(XEN) =C2=A0load_wind=
ow_shift: 30<br>(XEN) =C2=A0underload_balance_tolerance: 0<br>(XEN) =C2=A0o=
verload_balance_tolerance: -3<br>(XEN) =C2=A0runqueues arrangement: socket<=
br>(XEN) =C2=A0cap enforcement granularity: 10ms<br>(XEN) load tracking win=
dow length 1073741824 ns<br>(XEN) Allocated console ring of 64 KiB.<br>(XEN=
) CPU0: Guest atomics will try 2 times before pausing the domain<br>(XEN) B=
ringing up CPU1<br>(XEN) GICv3: CPU1: Found redistributor in region 0 @0000=
00004003c000<br>(XEN) CPU1: Guest atomics will try 3 times before pausing t=
he domain<br>(XEN) CPU 1 booted.<br>(XEN) Bringing up CPU2<br>(XEN) GICv3: =
CPU2: Found redistributor in region 0 @000000004005c000<br>(XEN) CPU2: Gues=
t atomics will try 3 times before pausing the domain<br>(XEN) CPU 2 booted.=
<br>(XEN) Bringing up CPU3<br>(XEN) GICv3: CPU3: Found redistributor in reg=
ion 0 @000000004007c000<br>(XEN) CPU3: Guest atomics will try 3 times befor=
e pausing the domain<br>(XEN) CPU 3 booted.<br>(XEN) Bringing up CPU4<br>(X=
EN) CPU4 MIDR (0x00000000410fd082) does not match boot CPU MIDR (0x00000000=
410fd034),<br>(XEN) hmp-unsafe turned on so tainting Xen and keep core on!!=
<br>(XEN) SANITY DIF: aa64mmfr0 0x1122 -&gt; 0x1124<br>(XEN) SANITY DIF: ct=
r 0x84448004 -&gt; 0x8444c004<br>(XEN) GICv3: CPU4: Found redistributor in =
region 0 @000000004009c000<br>(XEN) CPU4: Guest atomics will try 1 times be=
fore pausing the domain<br>(XEN) enabled workaround for: ARM erratum 131953=
7<br>(XEN) CPU 4 booted.<br>(XEN) Bringing up CPU5<br>(XEN) CPU5 MIDR (0x00=
000000410fd082) does not match boot CPU MIDR (0x00000000410fd034),<br>(XEN)=
 hmp-unsafe turned on so tainting Xen and keep core on!!<br>(XEN) SANITY DI=
F: aa64mmfr0 0x1122 -&gt; 0x1124<br>(XEN) SANITY DIF: ctr 0x84448004 -&gt; =
0x8444c004<br>(XEN) GICv3: CPU5: Found redistributor in region 0 @000000004=
00bc000<br>(XEN) CPU5: Guest atomics will try 1 times before pausing the do=
main<br>(XEN) Brought up 6 CPUs<br>(XEN) CPU 5 booted.<br>(XEN) I/O virtual=
isation disabled<br>(XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID<br>=
(XEN) P2M: 3 levels with order-1 root, VTCR 0x0000000080023558<br>(XEN) Sch=
eduling granularity: cpu, 1 CPU per sched-resource<br>(XEN) Initializing Cr=
edit2 scheduler<br>(XEN) =C2=A0load_precision_shift: 18<br>(XEN) =C2=A0load=
_window_shift: 30<br>(XEN) =C2=A0underload_balance_tolerance: 0<br>(XEN) =
=C2=A0overload_balance_tolerance: -3<br>(XEN) =C2=A0runqueues arrangement: =
socket<br>(XEN) =C2=A0cap enforcement granularity: 10ms<br>(XEN) load track=
ing window length 1073741824 ns<br>(XEN) Adding cpu 0 to runqueue 0<br>(XEN=
) =C2=A0First cpu on runqueue, activating<br>(XEN) Adding cpu 1 to runqueue=
 0<br>(XEN) Adding cpu 2 to runqueue 0<br>(XEN) Adding cpu 3 to runqueue 0<=
br>(XEN) Adding cpu 4 to runqueue 0<br>(XEN) Adding cpu 5 to runqueue 0<br>=
(XEN) alternatives: Patching with alt table 00000000002e5388 -&gt; 00000000=
002e5e74<br>(XEN) **** No support for ARM_SMCCC_ARCH_WORKAROUND_1. ****<br>=
(XEN) **** Please update your firmware. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0****<br>(XEN) *** LOADING DOMAIN 0 ***<br>(XEN) Loading=
 d0 kernel from boot module @ 0000000003f80000<br>(XEN) Loading ramdisk fro=
m boot module @ 0000000006000000<br>(XEN) Allocating 1:1 mappings totalling=
 512MB for dom0:<br>(XEN) BANK[0] 0x00000020000000-0x00000040000000 (512MB)=
<br>(XEN) Grant table range: 0x00000002000000-0x00000002040000<br>(XEN) /pi=
nctrl/pcie: Missing device_type<br>(XEN) /pinctrl/pcie: Missing device_type=
<br>(XEN) /pinctrl/pcie: Missing device_type<br>(XEN) Allocating PPI 16 for=
 event channel interrupt<br>(XEN) d0: extended region 0: 0x2200000-&gt;0x20=
000000<br>(XEN) d0: extended region 1: 0x40000000-&gt;0xf8000000<br>(XEN) L=
oading zImage from 0000000003f80000 to 0000000020000000-0000000021aa8008<br=
>(XEN) Loading d0 initrd from 0000000006000000 to 0x0000000028200000-0x0000=
00002a200000<br>(XEN) Loading d0 DTB to 0x0000000028000000-0x000000002800d5=
fb<br>(XEN) Initial low memory virq threshold set at 0x4000 pages.<br>(XEN)=
 Scrubbing Free RAM in background<br>(XEN) Std. Loglevel: All<br>(XEN) Gues=
t Loglevel: All<br>(XEN) **************************************************=
*<br>(XEN) WARNING: HMP COMPUTING HAS BEEN ENABLED.<br>(XEN) It has implica=
tions on the security and stability of the system,<br>(XEN) unless the cpu =
affinity of all domains is specified.<br>(XEN) ****************************=
***********************<br>(XEN) PLEASE SPECIFY dom0_mem PARAMETER - USING =
512M FOR NOW<br>(XEN) ***************************************************<b=
r>(XEN) 3... 2... 1... <br>(XEN) *** Serial input to DOM0 (type &#39;CTRL-a=
&#39; three times to switch input)<br>(XEN) Freed 356kB init memory.<br>(XE=
N) d0v0 Unhandled SMC/HVC: 0x84000050<br>(XEN) d0v0 Unhandled SMC/HVC: 0x86=
00ff01<br>(XEN) d0v0: vGICD: RAZ on reserved register offset 0x00000c<br>(X=
EN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER4<br>(XE=
N) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER8<br>(XEN=
) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER12<br>(XEN=
) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER16<br>(XEN=
) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER20<br>(XEN=
) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER24<br>(XEN=
) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER28<br>(XEN=
) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER32<br>(XEN=
) d0v0: vGICR: SGI: unhandled word write 0x000000ffffffff to ICACTIVER0<br>=
(XEN) d0v0 Unhandled SMC/HVC: 0x82000008<br>[ =C2=A0 =C2=A00.000000] Bootin=
g Linux on physical CPU 0x0000000000 [0x410fd034]<br>[ =C2=A0 =C2=A00.00000=
0] Linux version 5.15.16-1-rockchip-g359ffc4bc727 (root@brad-ThinkCentre-M8=
2) (aarch64-linux-gnu-gcc (Linaro GCC 7.3-2018.052<br>[ =C2=A0 =C2=A00.0000=
00] Machine model: Vamrs RK3399 ZAKU<br>[ =C2=A0 =C2=A00.000000] printk: de=
bug: ignoring loglevel setting.<br>[ =C2=A0 =C2=A00.000000] Xen 4.17 suppor=
t found<br>[ =C2=A0 =C2=A00.000000] Zone ranges:<br>[ =C2=A0 =C2=A00.000000=
] =C2=A0 DMA =C2=A0 =C2=A0 =C2=A0[mem 0x0000000020000000-0x000000003fffffff=
]<br>[ =C2=A0 =C2=A00.000000] =C2=A0 DMA32 =C2=A0 =C2=A0empty<br>[ =C2=A0 =
=C2=A00.000000] =C2=A0 Normal =C2=A0 empty<br>[ =C2=A0 =C2=A00.000000] Mova=
ble zone start for each node<br>[ =C2=A0 =C2=A00.000000] Early memory node =
ranges<br>[ =C2=A0 =C2=A00.000000] =C2=A0 node =C2=A0 0: [mem 0x00000000200=
00000-0x000000003fffffff]<br>[ =C2=A0 =C2=A00.000000] Initmem setup node 0 =
[mem 0x0000000020000000-0x000000003fffffff]<br>[ =C2=A0 =C2=A00.000000] psc=
i: probing for conduit method from DT.<br>[ =C2=A0 =C2=A00.000000] psci: PS=
CIv1.1 detected in firmware.<br>[ =C2=A0 =C2=A00.000000] psci: Using standa=
rd PSCI v0.2 function IDs<br>[ =C2=A0 =C2=A00.000000] psci: Trusted OS migr=
ation not required<br>[ =C2=A0 =C2=A00.000000] psci: SMC Calling Convention=
 v1.1<br>[ =C2=A0 =C2=A00.000000] percpu: Embedded 27 pages/cpu s69672 r819=
2 d32728 u110592<br>[ =C2=A0 =C2=A00.000000] pcpu-alloc: s69672 r8192 d3272=
8 u110592 alloc=3D27*4096<br>[ =C2=A0 =C2=A00.000000] pcpu-alloc: [0] 0 [0]=
 1 [0] 2 [0] 3 [0] 4 [0] 5 <br>[ =C2=A0 =C2=A00.000000] Detected VIPT I-cac=
he on CPU0<br>[ =C2=A0 =C2=A00.000000] CPU features: detected: GIC system r=
egister CPU interface<br>[ =C2=A0 =C2=A00.000000] CPU features: detected: A=
RM erratum 845719<br>[ =C2=A0 =C2=A00.000000] Built 1 zonelists, mobility g=
rouping on.=C2=A0 Total pages: 129024<br>[ =C2=A0 =C2=A00.000000] Kernel co=
mmand line: console=3Dhvc0 earlyprintk=3Dxen clk_ignore_unused root=3D/dev/=
nvme0n1p2 rw init=3D/sbin/init rootwait rootfl<br>[ =C2=A0 =C2=A00.000000] =
Unknown kernel command line parameters &quot;earlyprintk=3Dxen&quot;, will =
be passed to user space.<br>[ =C2=A0 =C2=A00.000000] Dentry cache hash tabl=
e entries: 65536 (order: 7, 524288 bytes, linear)<br>[ =C2=A0 =C2=A00.00000=
0] Inode-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)<b=
r>[ =C2=A0 =C2=A00.000000] mem auto-init: stack:off, heap alloc:off, heap f=
ree:off<br>[ =C2=A0 =C2=A00.000000] Memory: 452668K/524288K available (1401=
6K kernel code, 2720K rwdata, 4856K rodata, 5504K init, 553K bss, 71620K re=
served,)<br>[ =C2=A0 =C2=A00.000000] SLUB: HWalign=3D64, Order=3D0-3, MinOb=
jects=3D0, CPUs=3D6, Nodes=3D1<br>[ =C2=A0 =C2=A00.000000] ftrace: allocati=
ng 54793 entries in 215 pages<br>[ =C2=A0 =C2=A00.000000] ftrace: allocated=
 215 pages with 6 groups<br>[ =C2=A0 =C2=A00.000000] trace event string ver=
ifier disabled<br>[ =C2=A0 =C2=A00.000000] rcu: Hierarchical RCU implementa=
tion.<br>[ =C2=A0 =C2=A00.000000] rcu: =C2=A0 =C2=A0 RCU event tracing is e=
nabled.<br>[ =C2=A0 =C2=A00.000000] rcu: =C2=A0 =C2=A0 RCU restricting CPUs=
 from NR_CPUS=3D8 to nr_cpu_ids=3D6.<br>[ =C2=A0 =C2=A00.000000] =C2=A0Rude=
 variant of Tasks RCU enabled.<br>[ =C2=A0 =C2=A00.000000] rcu: RCU calcula=
ted value of scheduler-enlistment delay is 25 jiffies.<br>[ =C2=A0 =C2=A00.=
000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D6<br=
>[ =C2=A0 =C2=A00.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0<br=
>[ =C2=A0 =C2=A00.000000] GICv3: 256 SPIs implemented<br>[ =C2=A0 =C2=A00.0=
00000] GICv3: 0 Extended SPIs implemented<br>[ =C2=A0 =C2=A00.000000] GICv3=
: Distributor has no Range Selector support<br>[ =C2=A0 =C2=A00.000000] Roo=
t IRQ handler: gic_handle_irq<br>[ =C2=A0 =C2=A00.000000] GICv3: 16 PPIs im=
plemented<br>[ =C2=A0 =C2=A00.000000] GICv3: CPU0: found redistributor 0 re=
gion 0:0x00000000fef00000<br>[ =C2=A0 =C2=A00.000000] random: get_random_by=
tes called from start_kernel+0x44c/0x6bc with crng_init=3D0<br>[ =C2=A0 =C2=
=A00.000000] arch_timer: cp15 timer(s) running at 24.00MHz (virt).<br>[ =C2=
=A0 =C2=A00.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff m=
ax_cycles: 0x588fe9dc0, max_idle_ns: 440795202592 ns<br>[ =C2=A0 =C2=A00.00=
0003] sched_clock: 56 bits at 24MHz, resolution 41ns, wraps every 439804651=
1097ns<br>[ =C2=A0 =C2=A00.004184] Console: colour dummy device 80x25<br>[ =
=C2=A0 =C2=A00.010034] printk: console [hvc0] enabled<br>[ =C2=A0 =C2=A00.0=
10272] Calibrating delay loop (skipped), value calculated using timer frequ=
ency.. 48.00 BogoMIPS (lpj=3D96000)<br>[ =C2=A0 =C2=A00.010509] pid_max: de=
fault: 32768 minimum: 301<br>[ =C2=A0 =C2=A00.011188] LSM: Security Framewo=
rk initializing<br>[ =C2=A0 =C2=A00.011384] Yama: becoming mindful.<br>[ =
=C2=A0 =C2=A00.011799] Mount-cache hash table entries: 1024 (order: 1, 8192=
 bytes, linear)<br>[ =C2=A0 =C2=A00.012105] Mountpoint-cache hash table ent=
ries: 1024 (order: 1, 8192 bytes, linear)<br>[ =C2=A0 =C2=A00.027498] xen:g=
rant_table: Grant tables using version 1 layout<br>[ =C2=A0 =C2=A00.027843]=
 Grant table initialized<br>[ =C2=A0 =C2=A00.028195] xen:events: Using FIFO=
-based ABI<br>[ =C2=A0 =C2=A00.028613] Xen: initializing cpu0<br>[ =C2=A0 =
=C2=A00.029559] rcu: Hierarchical SRCU implementation.<br>[ =C2=A0 =C2=A00.=
038337] smp: Bringing up secondary CPUs ...<br>(XEN) d0v1: vGICR: SGI: unha=
ndled word write 0x000000ffffffff to ICACTIVER0<br>(XEN) d0v2: vGICR: SGI: =
unhandled word write 0x000000ffffffff to ICACTIVER0<br>(XEN) d0v3: vGICR: S=
GI: unhandled word write 0x000000ffffffff to ICACTIVER0<br>(XEN) d0v4: vGIC=
R: SGI: unhandled word write 0x000000ffffffff to ICACTIVER0<br>(XEN) d0v5: =
vGICR: SGI: unhandled word write 0x000000ffffffff to ICACTIVER0<br>[ =C2=A0=
 =C2=A00.042396] Detected VIPT I-cache on CPU1<br>[ =C2=A0 =C2=A00.042606] =
GICv3: CPU1: found redistributor 1 region 0:0x00000000fef20000<br>[ =C2=A0 =
=C2=A00.043215] Xen: initializing cpu1<br>[ =C2=A0 =C2=A00.043511] CPU1: Bo=
oted secondary processor 0x0000000001 [0x410fd034]<br>[ =C2=A0 =C2=A00.0479=
57] Detected VIPT I-cache on CPU2<br>[ =C2=A0 =C2=A00.048177] GICv3: CPU2: =
found redistributor 2 region 0:0x00000000fef40000<br>[ =C2=A0 =C2=A00.04877=
8] Xen: initializing cpu2<br>[ =C2=A0 =C2=A00.049066] CPU2: Booted secondar=
y processor 0x0000000002 [0x410fd034]<br>[ =C2=A0 =C2=A00.052901] Detected =
VIPT I-cache on CPU3<br>[ =C2=A0 =C2=A00.053120] GICv3: CPU3: found redistr=
ibutor 3 region 0:0x00000000fef60000<br>[ =C2=A0 =C2=A00.053626] Xen: initi=
alizing cpu3<br>[ =C2=A0 =C2=A00.053907] CPU3: Booted secondary processor 0=
x0000000003 [0x410fd034]<br>[ =C2=A0 =C2=A00.062107] CPU features: detected=
: Spectre-v2<br>[ =C2=A0 =C2=A00.063039] CPU features: detected: Spectre-v4=
<br>[ =C2=A0 =C2=A00.063673] CPU features: detected: ARM errata 1165522, 13=
19367, or 1530923<br>[ =C2=A0 =C2=A00.067132] Detected PIPT I-cache on CPU4=
<br>[ =C2=A0 =C2=A00.072165] GICv3: CPU4: found redistributor 4 region 0:0x=
00000000fef80000<br>[ =C2=A0 =C2=A00.081044] Xen: initializing cpu4<br>[ =
=C2=A0 =C2=A00.086534] CPU4: Booted secondary processor 0x0000000004 [0x410=
fd082]<br>[ =C2=A0 =C2=A00.111175] Detected PIPT I-cache on CPU5<br>[ =C2=
=A0 =C2=A00.116450] GICv3: CPU5: found redistributor 5 region 0:0x00000000f=
efa0000<br>[ =C2=A0 =C2=A00.125174] Xen: initializing cpu5<br>[ =C2=A0 =C2=
=A00.130645] CPU5: Booted secondary processor 0x0000000005 [0x410fd082]<br>=
[ =C2=A0 =C2=A00.141980] smp: Brought up 1 node, 6 CPUs<br>[ =C2=A0 =C2=A00=
.144637] SMP: Total of 6 processors activated.<br>[ =C2=A0 =C2=A00.144881] =
CPU features: detected: 32-bit EL0 Support<br>[ =C2=A0 =C2=A00.145127] CPU =
features: detected: CRC32 instructions<br>[ =C2=A0 =C2=A00.151947] CPU: All=
 CPU(s) started at EL1<br>[ =C2=A0 =C2=A00.155749] alternatives: patching k=
ernel code<br>[ =C2=A0 =C2=A00.163024] devtmpfs: initialized<br>[ =C2=A0 =
=C2=A00.235277] Registered cp15_barrier emulation handler<br>[ =C2=A0 =C2=
=A00.238449] Registered setend emulation handler<br>[ =C2=A0 =C2=A00.239670=
] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_n=
s: 7645041785100000 ns<br>[ =C2=A0 =C2=A00.240040] futex hash table entries=
: 2048 (order: 5, 131072 bytes, linear)<br>[ =C2=A0 =C2=A00.241754] pinctrl=
 core: initialized pinctrl subsystem<br>[ =C2=A0 =C2=A00.243287] regulator-=
dummy: no parameters, enabled<br>[ =C2=A0 =C2=A00.246947] NET: Registered P=
F_NETLINK/PF_ROUTE protocol family<br>[ =C2=A0 =C2=A00.260401] DMA: preallo=
cated 128 KiB GFP_KERNEL pool for atomic allocations<br>[ =C2=A0 =C2=A00.26=
0878] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA pool for atomic allocati=
ons<br>[ =C2=A0 =C2=A00.261294] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DM=
A32 pool for atomic allocations<br>[ =C2=A0 =C2=A00.261822] audit: initiali=
zing netlink subsys (disabled)<br>[ =C2=A0 =C2=A00.268125] audit: type=3D20=
00 audit(0.256:1): state=3Dinitialized audit_enabled=3D0 res=3D1<br>[ =C2=
=A0 =C2=A00.278540] thermal_sys: Registered thermal governor &#39;fair_shar=
e&#39;<br>[ =C2=A0 =C2=A00.278731] thermal_sys: Registered thermal governor=
 &#39;step_wise&#39;<br>[ =C2=A0 =C2=A00.279675] OF: /thermal-zones/cpu-the=
rmal/cooling-maps/map0: could not find phandle 6<br>[ =C2=A0 =C2=A00.280151=
] thermal_sys: Add a cooling_device property with at least one device<br>[ =
=C2=A0 =C2=A00.280307] thermal_sys: failed to build thermal zone cpu-therma=
l: -2<br>[ =C2=A0 =C2=A00.283478] hw-breakpoint: found 6 breakpoint and 4 w=
atchpoint registers.<br>[ =C2=A0 =C2=A00.299995] ASID allocator initialised=
 with 65536 entries<br>[ =C2=A0 =C2=A00.300424] xen:swiotlb_xen: Warning: o=
nly able to allocate 4 MB for software IO TLB<br>[ =C2=A0 =C2=A00.303971] s=
oftware IO TLB: mapped [mem 0x0000000022800000-0x0000000022c00000] (4MB)<br=
>[ =C2=A0 =C2=A00.310583] ------------[ cut here ]------------<br>[ =C2=A0 =
=C2=A00.310855] WARNING: CPU: 0 PID: 1 at drivers/irqchip/irq-gic-v3.c:1533=
 gic_irq_domain_select+0x70/0x12c<br>[ =C2=A0 =C2=A00.311156] Modules linke=
d in:<br>[ =C2=A0 =C2=A00.311317] CPU: 0 PID: 1 Comm: swapper/0 Not tainted=
 5.15.16-1-rockchip-g359ffc4bc727 #1<br>[ =C2=A0 =C2=A00.311536] Hardware n=
ame: Vamrs RK3399 ZAKU (DT)<br>[ =C2=A0 =C2=A00.311673] pstate: 20000005 (n=
zCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)<br>[ =C2=A0 =C2=A00.311890] =
pc : gic_irq_domain_select+0x70/0x12c<br>[ =C2=A0 =C2=A00.312063] lr : gic_=
irq_domain_select+0x6c/0x12c<br>[ =C2=A0 =C2=A00.312273] sp : ffffffc011b5b=
8c0<br>[ =C2=A0 =C2=A00.312385] x29: ffffffc011b5b8c0 x28: ffffff8021e37a80=
 x27: ffffff8021e37a00<br>[ =C2=A0 =C2=A00.312634] x26: ffffff803feb92b0 x2=
5: 0000000000000000 x24: ffffffc011b5b9f8<br>[ =C2=A0 =C2=A00.312871] x23: =
ffffff8021c0c400 x22: ffffffc01120a000 x21: ffffffc0118f6000<br>[ =C2=A0 =
=C2=A00.313111] x20: ffffffc011b5b9f8 x19: ffffff8021c0c400 x18: 0000000000=
00000a<br>[ =C2=A0 =C2=A00.313350] x17: ffffffffffffffff x16: fffffffffffff=
fff x15: ffffffffffffffff<br>[ =C2=A0 =C2=A00.313568] x14: ffffffffffffffff=
 x13: ffffffffffffffff x12: ffffffffffffffff<br>[ =C2=A0 =C2=A00.313805] x1=
1: 0000000000000038 x10: 0101010101010101 x9 : ffffffffffffffff<br>[ =C2=A0=
 =C2=A00.314042] x8 : 7f7f7f7f7f7f7f7f x7 : ff71646b6b6e7173 x6 : 000000000=
0000080<br>[ =C2=A0 =C2=A00.314278] x5 : 0000000000000000 x4 : 000000000000=
0000 x3 : ffffffc011b5b90c<br>[ =C2=A0 =C2=A00.314515] x2 : ffffffc011b5b91=
0 x1 : 00000000a110c8ee x0 : 00000000ffffffea<br>[ =C2=A0 =C2=A00.314752] C=
all trace:<br>[ =C2=A0 =C2=A00.314853] =C2=A0gic_irq_domain_select+0x70/0x1=
2c<br>[ =C2=A0 =C2=A00.315004] =C2=A0irq_find_matching_fwspec+0x78/0xf4<br>=
[ =C2=A0 =C2=A00.315307] =C2=A0irq_create_fwspec_mapping+0x4c/0x2d4<br>[ =
=C2=A0 =C2=A00.315476] =C2=A0irq_create_of_mapping+0x6c/0xa4<br>[ =C2=A0 =
=C2=A00.315656] =C2=A0of_irq_get+0x64/0xa4<br>[ =C2=A0 =C2=A00.315801] =C2=
=A0of_irq_to_resource+0x48/0xfc<br>[ =C2=A0 =C2=A00.315953] =C2=A0of_irq_to=
_resource_table+0x54/0x68<br>[ =C2=A0 =C2=A00.316166] =C2=A0of_device_alloc=
+0x108/0x1b0<br>[ =C2=A0 =C2=A00.316316] =C2=A0of_platform_device_create_pd=
ata+0x7c/0xdc<br>[ =C2=A0 =C2=A00.316506] =C2=A0of_platform_bus_create+0x3a=
0/0x468<br>[ =C2=A0 =C2=A00.316665] =C2=A0of_platform_populate+0x100/0x118<=
br>[ =C2=A0 =C2=A00.316808] =C2=A0of_platform_default_populate+0x40/0x50<br=
>[ =C2=A0 =C2=A00.316959] =C2=A0of_platform_default_populate_init+0x7c/0xb4=
<br>[ =C2=A0 =C2=A00.317149] =C2=A0do_one_initcall+0x94/0x1c4<br>[ =C2=A0 =
=C2=A00.317299] =C2=A0kernel_init_freeable+0x2b0/0x2b8<br>[ =C2=A0 =C2=A00.=
317494] =C2=A0kernel_init+0x28/0x120<br>[ =C2=A0 =C2=A00.317628] =C2=A0ret_=
from_fork+0x10/0x20<br>[ =C2=A0 =C2=A00.317804] ---[ end trace 85c6a508ffaf=
c11e ]---<br>[ =C2=A0 =C2=A00.318293] irq: no irq domain found for interrup=
t-controller !<br>[ =C2=A0 =C2=A00.390494] irq: type mismatch, failed to ma=
p hwirq-32 for interrupt-controller!<br>[ =C2=A0 =C2=A00.401389] irq: type =
mismatch, failed to map hwirq-32 for interrupt-controller!<br>[ =C2=A0 =C2=
=A00.403373] irq: type mismatch, failed to map hwirq-32 for interrupt-contr=
oller!<br>[ =C2=A0 =C2=A00.413685] platform ff770000.syscon:phy@f780: Fixin=
g up cyclic dependency with fe330000.mmc<br>[ =C2=A0 =C2=A00.439170] platfo=
rm ff940000.hdmi: Fixing up cyclic dependency with ff8f0000.vop<br>[ =C2=A0=
 =C2=A00.440132] platform ff940000.hdmi: Fixing up cyclic dependency with f=
f900000.vop<br>[ =C2=A0 =C2=A00.442114] irq: type mismatch, failed to map h=
wirq-32 for interrupt-controller!<br>[ =C2=A0 =C2=A00.479376] rockchip-gpio=
 ff720000.gpio0: probed /pinctrl/gpio0@ff720000<br>[ =C2=A0 =C2=A00.484466]=
 rockchip-gpio ff730000.gpio1: probed /pinctrl/gpio1@ff730000<br>[ =C2=A0 =
=C2=A00.489044] rockchip-gpio ff780000.gpio2: probed /pinctrl/gpio2@ff78000=
0<br>[ =C2=A0 =C2=A00.493295] rockchip-gpio ff788000.gpio3: probed /pinctrl=
/gpio3@ff788000<br>[ =C2=A0 =C2=A00.497205] rockchip-gpio ff790000.gpio4: p=
robed /pinctrl/gpio4@ff790000<br>[ =C2=A0 =C2=A00.601234] HugeTLB registere=
d 1.00 GiB page size, pre-allocated 0 pages<br>[ =C2=A0 =C2=A00.602111] Hug=
eTLB registered 32.0 MiB page size, pre-allocated 0 pages<br>[ =C2=A0 =C2=
=A00.602269] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages<b=
r>[ =C2=A0 =C2=A00.602440] HugeTLB registered 64.0 KiB page size, pre-alloc=
ated 0 pages<br>[ =C2=A0 =C2=A00.732446] cryptd: max_cpu_qlen set to 1000<b=
r>[ =C2=A0 =C2=A00.965984] raid6: neonx8 =C2=A0 gen() =C2=A0 343 MB/s<br>[ =
=C2=A0 =C2=A01.037514] raid6: neonx8 =C2=A0 xor() =C2=A0 265 MB/s<br>[ =C2=
=A0 =C2=A01.108822] raid6: neonx4 =C2=A0 gen() =C2=A0 358 MB/s<br>[ =C2=A0 =
=C2=A01.180595] raid6: neonx4 =C2=A0 xor() =C2=A0 264 MB/s<br>[ =C2=A0 =C2=
=A01.251750] raid6: neonx2 =C2=A0 gen() =C2=A0 332 MB/s<br>[ =C2=A0 =C2=A01=
.322968] raid6: neonx2 =C2=A0 xor() =C2=A0 242 MB/s<br>[ =C2=A0 =C2=A01.394=
615] raid6: neonx1 =C2=A0 gen() =C2=A0 289 MB/s<br>[ =C2=A0 =C2=A01.465958]=
 raid6: neonx1 =C2=A0 xor() =C2=A0 199 MB/s<br>[ =C2=A0 =C2=A01.537820] rai=
d6: int64x8 =C2=A0gen() =C2=A0 =C2=A087 MB/s<br>[ =C2=A0 =C2=A01.609578] ra=
id6: int64x8 =C2=A0xor() =C2=A0 =C2=A051 MB/s<br>[ =C2=A0 =C2=A01.681302] r=
aid6: int64x4 =C2=A0gen() =C2=A0 107 MB/s<br>[ =C2=A0 =C2=A01.753475] raid6=
: int64x4 =C2=A0xor() =C2=A0 =C2=A056 MB/s<br>[ =C2=A0 =C2=A01.824651] raid=
6: int64x2 =C2=A0gen() =C2=A0 182 MB/s<br>[ =C2=A0 =C2=A01.895619] raid6: i=
nt64x2 =C2=A0xor() =C2=A0 100 MB/s<br>[ =C2=A0 =C2=A01.966829] raid6: int64=
x1 =C2=A0gen() =C2=A0 136 MB/s<br>[ =C2=A0 =C2=A02.038152] raid6: int64x1 =
=C2=A0xor() =C2=A0 =C2=A062 MB/s<br>[ =C2=A0 =C2=A02.038278] raid6: using a=
lgorithm neonx4 gen() 358 MB/s<br>[ =C2=A0 =C2=A02.038388] raid6: .... xor(=
) 264 MB/s, rmw enabled<br>[ =C2=A0 =C2=A02.038485] raid6: using neon recov=
ery algorithm<br>[ =C2=A0 =C2=A02.039515] xen:balloon: Initialising balloon=
 driver<br>[ =C2=A0 =C2=A02.043846] vcc12v_dcin: 12000 mV, enabled<br>[ =C2=
=A0 =C2=A02.044876] reg-fixed-voltage vcc12v-dcin: vcc12v_dcin supplying 12=
000000uV<br>[ =C2=A0 =C2=A02.045966] vcc1v8_s0: 1800 mV, enabled<br>[ =C2=
=A0 =C2=A02.046981] reg-fixed-voltage vcc1v8-s0: vcc1v8_s0 supplying 180000=
0uV<br>[ =C2=A0 =C2=A02.047907] vcc5v0_sys: will resolve supply early: vin<=
br>[ =C2=A0 =C2=A02.048079] reg-fixed-voltage vcc5v0-sys: Looking up vin-su=
pply from device tree<br>[ =C2=A0 =C2=A02.048293] vcc5v0_sys: supplied by v=
cc12v_dcin<br>[ =C2=A0 =C2=A02.048447] vcc12v_dcin: could not add device li=
nk regulator.3: -ENOENT<br>[ =C2=A0 =C2=A02.048990] vcc5v0_sys: 5000 mV, en=
abled<br>[ =C2=A0 =C2=A02.049877] reg-fixed-voltage vcc5v0-sys: vcc5v0_sys =
supplying 5000000uV<br>[ =C2=A0 =C2=A02.051218] vcc_phy: no parameters, ena=
bled<br>[ =C2=A0 =C2=A02.052029] reg-fixed-voltage vcc-phy-regulator: vcc_p=
hy supplying 0uV<br>[ =C2=A0 =C2=A02.052969] vcc3v3_sys: will resolve suppl=
y early: vin<br>[ =C2=A0 =C2=A02.053173] reg-fixed-voltage vcc3v3-sys: Look=
ing up vin-supply from device tree<br>[ =C2=A0 =C2=A02.053379] vcc3v3_sys: =
supplied by vcc5v0_sys<br>[ =C2=A0 =C2=A02.053545] vcc5v0_sys: could not ad=
d device link regulator.5: -ENOENT<br>[ =C2=A0 =C2=A02.053932] vcc3v3_sys: =
3300 mV, enabled<br>[ =C2=A0 =C2=A02.054924] reg-fixed-voltage vcc3v3-sys: =
vcc3v3_sys supplying 3300000uV<br>[ =C2=A0 =C2=A02.055842] rockchip-pinctrl=
 pinctrl: unsupported driver strength 20<br>[ =C2=A0 =C2=A02.056049] rockch=
ip-pinctrl pinctrl: pin_config_set op failed for pin 146<br>[ =C2=A0 =C2=A0=
2.056203] reg-fixed-voltage vcc3v3-pcie-regulator: Error applying setting, =
reverse things back<br>[ =C2=A0 =C2=A02.057192] vcc3v3_pcie: will resolve s=
upply early: vin<br>[ =C2=A0 =C2=A02.057379] reg-fixed-voltage vcc3v3-pcie-=
regulator: Looking up vin-supply from device tree<br>[ =C2=A0 =C2=A02.05757=
5] vcc3v3_pcie: supplied by vcc3v3_sys<br>[ =C2=A0 =C2=A02.057760] vcc3v3_s=
ys: could not add device link regulator.6: -ENOENT<br>[ =C2=A0 =C2=A02.0582=
67] vcc3v3_pcie: 3300 mV, enabled<br>[ =C2=A0 =C2=A02.059496] reg-fixed-vol=
tage vcc3v3-pcie-regulator: vcc3v3_pcie supplying 3300000uV<br>[ =C2=A0 =C2=
=A02.061208] vcc5v0_usb: will resolve supply early: vin<br>[ =C2=A0 =C2=A02=
.061375] reg-fixed-voltage vcc5v0-usb-regulator: Looking up vin-supply from=
 device tree<br>[ =C2=A0 =C2=A02.061595] vcc5v0_usb: supplied by vcc5v0_sys=
<br>[ =C2=A0 =C2=A02.061736] vcc5v0_sys: could not add device link regulato=
r.7: -ENOENT<br>[ =C2=A0 =C2=A02.062164] vcc5v0_usb: 5000 mV, enabled<br>[ =
=C2=A0 =C2=A02.063312] reg-fixed-voltage vcc5v0-usb-regulator: vcc5v0_usb s=
upplying 5000000uV<br>[ =C2=A0 =C2=A02.064318] vcc_0v9: will resolve supply=
 early: vin<br>[ =C2=A0 =C2=A02.064511] reg-fixed-voltage vcc-0v9: Looking =
up vin-supply from device tree<br>[ =C2=A0 =C2=A02.064705] vcc_0v9: supplie=
d by vcc3v3_sys<br>[ =C2=A0 =C2=A02.064902] vcc3v3_sys: could not add devic=
e link regulator.8: -ENOENT<br>[ =C2=A0 =C2=A02.065383] vcc_0v9: 900 mV, en=
abled<br>[ =C2=A0 =C2=A02.066280] reg-fixed-voltage vcc-0v9: vcc_0v9 supply=
ing 900000uV<br>[ =C2=A0 =C2=A02.071921] iommu: Default domain type: Transl=
ated <br>[ =C2=A0 =C2=A02.072285] iommu: DMA domain TLB invalidation policy=
: strict mode <br>[ =C2=A0 =C2=A02.089090] SCSI subsystem initialized<br>[ =
=C2=A0 =C2=A02.097346] libata version 3.00 loaded.<br>[ =C2=A0 =C2=A02.0985=
01] usbcore: registered new interface driver usbfs<br>[ =C2=A0 =C2=A02.0989=
31] usbcore: registered new interface driver hub<br>[ =C2=A0 =C2=A02.099344=
] usbcore: registered new device driver usb<br>[ =C2=A0 =C2=A02.100020] mc:=
 Linux media interface: v0.10<br>[ =C2=A0 =C2=A02.100319] videodev: Linux v=
ideo capture interface: v2.00<br>[ =C2=A0 =C2=A02.100991] pps_core: LinuxPP=
S API ver. 1 registered<br>[ =C2=A0 =C2=A02.101145] pps_core: Software ver.=
 5.3.6 - Copyright 2005-2007 Rodolfo Giometti &lt;<a href=3D"mailto:giomett=
i@linux.it">giometti@linux.it</a>&gt;<br>[ =C2=A0 =C2=A02.101402] PTP clock=
 support registered<br>[ =C2=A0 =C2=A02.107595] Advanced Linux Sound Archit=
ecture Driver Initialized.<br>[ =C2=A0 =C2=A02.111011] Bluetooth: Core ver =
2.22<br>[ =C2=A0 =C2=A02.111358] NET: Registered PF_BLUETOOTH protocol fami=
ly<br>[ =C2=A0 =C2=A02.111517] Bluetooth: HCI device and connection manager=
 initialized<br>[ =C2=A0 =C2=A02.111680] Bluetooth: HCI socket layer initia=
lized<br>[ =C2=A0 =C2=A02.111857] Bluetooth: L2CAP socket layer initialized=
<br>[ =C2=A0 =C2=A02.112069] Bluetooth: SCO socket layer initialized<br>[ =
=C2=A0 =C2=A02.112296] NetLabel: Initializing<br>[ =C2=A0 =C2=A02.112402] N=
etLabel: =C2=A0domain hash size =3D 128<br>[ =C2=A0 =C2=A02.112517] NetLabe=
l: =C2=A0protocols =3D UNLABELED CIPSOv4 CALIPSO<br>[ =C2=A0 =C2=A02.113111=
] NetLabel: =C2=A0unlabeled traffic allowed by default<br>[ =C2=A0 =C2=A02.=
122030] clocksource: Switched to clocksource arch_sys_counter<br>[ =C2=A0 =
=C2=A02.413055] VFS: Disk quotas dquot_6.6.0<br>[ =C2=A0 =C2=A02.414148] VF=
S: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)<br>[ =C2=A0 =
=C2=A02.475712] NET: Registered PF_INET protocol family<br>[ =C2=A0 =C2=A02=
.476923] IP idents hash table entries: 8192 (order: 4, 65536 bytes, linear)=
<br>[ =C2=A0 =C2=A02.482548] tcp_listen_portaddr_hash hash table entries: 2=
56 (order: 1, 10240 bytes, linear)<br>[ =C2=A0 =C2=A02.483081] TCP establis=
hed hash table entries: 4096 (order: 3, 32768 bytes, linear)<br>[ =C2=A0 =
=C2=A02.483542] TCP bind hash table entries: 4096 (order: 5, 131072 bytes, =
linear)<br>[ =C2=A0 =C2=A02.484397] TCP: Hash tables configured (establishe=
d 4096 bind 4096)<br>[ =C2=A0 =C2=A02.485284] UDP hash table entries: 256 (=
order: 2, 24576 bytes, linear)<br>[ =C2=A0 =C2=A02.485892] UDP-Lite hash ta=
ble entries: 256 (order: 2, 24576 bytes, linear)<br>[ =C2=A0 =C2=A02.487194=
] NET: Registered PF_UNIX/PF_LOCAL protocol family<br>[ =C2=A0 =C2=A02.4874=
92] PCI: CLS 0 bytes, default 64<br>[ =C2=A0 =C2=A02.490694] Trying to unpa=
ck rootfs image as initramfs...<br>[ =C2=A0 =C2=A03.097632] rootfs image is=
 not initramfs (Decoding failed); looks like an initrd<br>[ =C2=A0 =C2=A03.=
477246] Freeing initrd memory: 32768K<br>[ =C2=A0 =C2=A03.816771] Initialis=
e system trusted keyrings<br>[ =C2=A0 =C2=A03.828487] workingset: timestamp=
_bits=3D46 max_order=3D17 bucket_order=3D0<br>[ =C2=A0 =C2=A04.594980] squa=
shfs: version 4.0 (2009/01/31) Phillip Lougher<br>[ =C2=A0 =C2=A04.639877] =
fuse: init (API version 7.34)<br>[ =C2=A0 =C2=A04.692812] JFS: nTxBlock =3D=
 3790, nTxLock =3D 30323<br>[ =C2=A0 =C2=A04.875022] SGI XFS with ACLs, sec=
urity attributes, realtime, verbose warnings, quota, no debug enabled<br>[ =
=C2=A0 10.116665] NET: Registered PF_ALG protocol family<br>[ =C2=A0 10.117=
252] xor: measuring software checksum speed<br>[ =C2=A0 10.145130] =C2=A0 =
=C2=A08regs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : =C2=A0 361 MB/sec<br>[ =C2=
=A0 10.165698] =C2=A0 =C2=A032regs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: =C2=
=A0 482 MB/sec<br>[ =C2=A0 10.191437] =C2=A0 =C2=A0arm64_neon =C2=A0 =C2=A0=
 =C2=A0: =C2=A0 384 MB/sec<br>[ =C2=A0 10.191569] xor: using function: 32re=
gs (482 MB/sec)<br>[ =C2=A0 10.192042] Key type asymmetric registered<br>[ =
=C2=A0 10.192188] Asymmetric key parser &#39;x509&#39; registered<br>[ =C2=
=A0 10.194224] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 246)<br>[ =C2=A0 10.200293] io scheduler mq-deadline registered<br>[ =
=C2=A0 10.200447] io scheduler kyber registered<br>[ =C2=A0 10.213640] phy =
phy-ff770000.syscon:phy@f780.0: Looking up phy-supply from device tree<br>[=
 =C2=A0 10.213957] phy phy-ff770000.syscon:phy@f780.0: Looking up phy-suppl=
y property in node /syscon@ff770000/phy@f780 failed<br>[ =C2=A0 10.222938] =
phy phy-ff770000.syscon:usb2phy@e450.1: Looking up phy-supply from device t=
ree<br>[ =C2=A0 10.223420] vcc5v0_usb: could not add device link phy-ff7700=
00.syscon:usb2phy@e450.1: -ENOENT<br>[ =C2=A0 10.228300] phy phy-ff770000.s=
yscon:usb2phy@e450.2: Looking up phy-supply from device tree<br>[ =C2=A0 10=
.228648] phy phy-ff770000.syscon:usb2phy@e450.2: Looking up phy-supply prop=
erty in node /syscon@ff770000/usb2phy@e450/otg-port faid<br>[ =C2=A0 10.237=
376] phy phy-ff770000.syscon:usb2phy@e460.3: Looking up phy-supply from dev=
ice tree<br>[ =C2=A0 10.238041] vcc5v0_usb: could not add device link phy-f=
f770000.syscon:usb2phy@e460.3: -ENOENT<br>[ =C2=A0 10.242605] phy phy-ff770=
000.syscon:usb2phy@e460.4: Looking up phy-supply from device tree<br>[ =C2=
=A0 10.242946] phy phy-ff770000.syscon:usb2phy@e460.4: Looking up phy-suppl=
y property in node /syscon@ff770000/usb2phy@e460/otg-port faid<br>[ =C2=A0 =
10.247126] phy phy-ff770000.syscon:pcie-phy.5: Looking up phy-supply from d=
evice tree<br>[ =C2=A0 10.247400] phy phy-ff770000.syscon:pcie-phy.5: Looki=
ng up phy-supply property in node /syscon@ff770000/pcie-phy failed<br>[ =C2=
=A0 10.248209] phy phy-ff770000.syscon:pcie-phy.6: Looking up phy-supply fr=
om device tree<br>[ =C2=A0 10.248426] phy phy-ff770000.syscon:pcie-phy.6: L=
ooking up phy-supply property in node /syscon@ff770000/pcie-phy failed<br>[=
 =C2=A0 10.249176] phy phy-ff770000.syscon:pcie-phy.7: Looking up phy-suppl=
y from device tree<br>[ =C2=A0 10.249393] phy phy-ff770000.syscon:pcie-phy.=
7: Looking up phy-supply property in node /syscon@ff770000/pcie-phy failed<=
br>[ =C2=A0 10.250343] phy phy-ff770000.syscon:pcie-phy.8: Looking up phy-s=
upply from device tree<br>[ =C2=A0 10.250775] phy phy-ff770000.syscon:pcie-=
phy.8: Looking up phy-supply property in node /syscon@ff770000/pcie-phy fai=
led<br>[ =C2=A0 10.254471] phy phy-ff7c0000.phy.9: Looking up phy-supply fr=
om device tree<br>[ =C2=A0 10.254748] phy phy-ff7c0000.phy.9: Looking up ph=
y-supply property in node /phy@ff7c0000/dp-port failed<br>[ =C2=A0 10.25567=
0] phy phy-ff7c0000.phy.10: Looking up phy-supply from device tree<br>[ =C2=
=A0 10.255872] phy phy-ff7c0000.phy.10: Looking up phy-supply property in n=
ode /phy@ff7c0000/usb3-port failed<br>[ =C2=A0 10.258831] phy phy-ff800000.=
phy.11: Looking up phy-supply from device tree<br>[ =C2=A0 10.259081] phy p=
hy-ff800000.phy.11: Looking up phy-supply property in node /phy@ff800000/dp=
-port failed<br>[ =C2=A0 10.259972] phy phy-ff800000.phy.12: Looking up phy=
-supply from device tree<br>[ =C2=A0 10.260151] phy phy-ff800000.phy.12: Lo=
oking up phy-supply property in node /phy@ff800000/usb3-port failed<br>[ =
=C2=A0 10.282297] dma-pl330 ff6d0000.dma-controller: Loaded driver for PL33=
0 DMAC-241330<br>[ =C2=A0 10.282779] dma-pl330 ff6d0000.dma-controller: =C2=
=A0 =C2=A0 =C2=A0 DBUFF-32x8bytes Num_Chans-6 Num_Peri-12 Num_Events-12<br>=
[ =C2=A0 10.291532] dma-pl330 ff6e0000.dma-controller: Loaded driver for PL=
330 DMAC-241330<br>[ =C2=A0 10.291829] dma-pl330 ff6e0000.dma-controller: =
=C2=A0 =C2=A0 =C2=A0 DBUFF-128x8bytes Num_Chans-8 Num_Peri-20 Num_Events-16=
<br>[ =C2=A0 10.300189] xen:xen_evtchn: Event-channel device installed<br>[=
 =C2=A0 10.318364] Serial: 8250/16550 driver, 5 ports, IRQ sharing disabled=
<br>[ =C2=A0 10.335497] rockchip-vop ff8f0000.vop: Adding to iommu group 2<=
br>[ =C2=A0 10.340200] rockchip-vop ff900000.vop: Adding to iommu group 3<b=
r>[ =C2=A0 10.367059] rockchip-drm display-subsystem: bound ff8f0000.vop (o=
ps 0xffffffc010e887e8)<br>[ =C2=A0 10.367999] [drm] unsupported AFBC format=
[3231564e]<br>[ =C2=A0 10.371622] rockchip-drm display-subsystem: bound ff9=
00000.vop (ops 0xffffffc010e887e8)<br>[ =C2=A0 10.394857] cacheinfo: Unable=
 to detect cache hierarchy for CPU 0<br>[ =C2=A0 10.400560] brd: module loa=
ded<br>[ =C2=A0 10.444804] loop: module loaded<br>[ =C2=A0 10.448040] lkdtm=
: No crash points registered, enable through debugfs<br>[ =C2=A0 10.481318]=
 libphy: Fixed MDIO Bus: probed<br>[ =C2=A0 10.482042] CAN device driver in=
terface<br>[ =C2=A0 10.484479] usbcore: registered new interface driver cdc=
_ether<br>[ =C2=A0 10.484987] usbcore: registered new interface driver rndi=
s_host<br>[ =C2=A0 10.528254] ehci_hcd: USB 2.0 &#39;Enhanced&#39; Host Con=
troller (EHCI) Driver<br>[ =C2=A0 10.528704] ehci-pci: EHCI PCI platform dr=
iver<br>[ =C2=A0 10.529176] ehci-platform: EHCI generic platform driver<br>=
[ =C2=A0 10.533146] ehci-platform fe380000.usb: EHCI Host Controller<br>[ =
=C2=A0 10.534559] ehci-platform fe380000.usb: new USB bus registered, assig=
ned bus number 1<br>[ =C2=A0 10.535808] ehci-platform fe380000.usb: irq 19,=
 io mem 0xfe380000<br>[ =C2=A0 10.549833] ehci-platform fe380000.usb: USB 2=
.0 started, EHCI 1.00<br>[ =C2=A0 10.551250] usb usb1: New USB device found=
, idVendor=3D1d6b, idProduct=3D0002, bcdDevice=3D 5.15<br>[ =C2=A0 10.55144=
1] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1=
<br>[ =C2=A0 10.551591] usb usb1: Product: EHCI Host Controller<br>[ =C2=A0=
 10.551705] usb usb1: Manufacturer: Linux 5.15.16-1-rockchip-g359ffc4bc727 =
ehci_hcd<br>[ =C2=A0 10.551860] usb usb1: SerialNumber: fe380000.usb<br>[ =
=C2=A0 10.555156] hub 1-0:1.0: USB hub found<br>[ =C2=A0 10.555443] hub 1-0=
:1.0: 1 port detected<br>[ =C2=A0 10.561186] ehci-platform fe3c0000.usb: EH=
CI Host Controller<br>[ =C2=A0 10.562763] ehci-platform fe3c0000.usb: new U=
SB bus registered, assigned bus number 2<br>[ =C2=A0 10.563759] ehci-platfo=
rm fe3c0000.usb: irq 21, io mem 0xfe3c0000<br>[ =C2=A0 10.577817] ehci-plat=
form fe3c0000.usb: USB 2.0 started, EHCI 1.00<br>[ =C2=A0 10.579010] usb us=
b2: New USB device found, idVendor=3D1d6b, idProduct=3D0002, bcdDevice=3D 5=
.15<br>[ =C2=A0 10.579200] usb usb2: New USB device strings: Mfr=3D3, Produ=
ct=3D2, SerialNumber=3D1<br>[ =C2=A0 10.579353] usb usb2: Product: EHCI Hos=
t Controller<br>[ =C2=A0 10.579467] usb usb2: Manufacturer: Linux 5.15.16-1=
-rockchip-g359ffc4bc727 ehci_hcd<br>[ =C2=A0 10.579619] usb usb2: SerialNum=
ber: fe3c0000.usb<br>[ =C2=A0 10.582596] hub 2-0:1.0: USB hub found<br>[ =
=C2=A0 10.582872] hub 2-0:1.0: 1 port detected<br>[ =C2=A0 10.586210] ohci_=
hcd: USB 1.1 &#39;Open&#39; Host Controller (OHCI) Driver<br>[ =C2=A0 10.58=
6524] ohci-platform: OHCI generic platform driver<br>[ =C2=A0 10.587848] oh=
ci-platform fe3a0000.usb: Generic Platform OHCI controller<br>[ =C2=A0 10.5=
89672] ohci-platform fe3a0000.usb: new USB bus registered, assigned bus num=
ber 3<br>[ =C2=A0 10.590708] ohci-platform fe3a0000.usb: irq 20, io mem 0xf=
e3a0000<br>[ =C2=A0 10.654476] usb usb3: New USB device found, idVendor=3D1=
d6b, idProduct=3D0001, bcdDevice=3D 5.15<br>[ =C2=A0 10.654689] usb usb3: N=
ew USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1<br>[ =C2=A0 1=
0.654841] usb usb3: Product: Generic Platform OHCI controller<br>[ =C2=A0 1=
0.654973] usb usb3: Manufacturer: Linux 5.15.16-1-rockchip-g359ffc4bc727 oh=
ci_hcd<br>[ =C2=A0 10.655120] usb usb3: SerialNumber: fe3a0000.usb<br>[ =C2=
=A0 10.658033] hub 3-0:1.0: USB hub found<br>[ =C2=A0 10.658329] hub 3-0:1.=
0: 1 port detected<br>[ =C2=A0 10.661656] ohci-platform fe3e0000.usb: Gener=
ic Platform OHCI controller<br>[ =C2=A0 10.663217] ohci-platform fe3e0000.u=
sb: new USB bus registered, assigned bus number 4<br>[ =C2=A0 10.664185] oh=
ci-platform fe3e0000.usb: irq 22, io mem 0xfe3e0000<br>[ =C2=A0 10.726670] =
usb usb4: New USB device found, idVendor=3D1d6b, idProduct=3D0001, bcdDevic=
e=3D 5.15<br>[ =C2=A0 10.726886] usb usb4: New USB device strings: Mfr=3D3,=
 Product=3D2, SerialNumber=3D1<br>[ =C2=A0 10.727049] usb usb4: Product: Ge=
neric Platform OHCI controller<br>[ =C2=A0 10.727181] usb usb4: Manufacture=
r: Linux 5.15.16-1-rockchip-g359ffc4bc727 ohci_hcd<br>[ =C2=A0 10.727329] u=
sb usb4: SerialNumber: fe3e0000.usb<br>[ =C2=A0 10.730270] hub 4-0:1.0: USB=
 hub found<br>[ =C2=A0 10.730545] hub 4-0:1.0: 1 port detected<br>[ =C2=A0 =
10.737209] xhci-hcd xhci-hcd.0.auto: xHCI Host Controller<br>[ =C2=A0 10.73=
9611] xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned bus number=
 5<br>[ =C2=A0 10.740395] xhci-hcd xhci-hcd.0.auto: hcc params 0x0220fe64 h=
ci version 0x110 quirks 0x0000000002010010<br>[ =C2=A0 10.740805] xhci-hcd =
xhci-hcd.0.auto: irq 53, io mem 0xfe800000<br>[ =C2=A0 10.742883] usb usb5:=
 New USB device found, idVendor=3D1d6b, idProduct=3D0002, bcdDevice=3D 5.15=
<br>[ =C2=A0 10.743094] usb usb5: New USB device strings: Mfr=3D3, Product=
=3D2, SerialNumber=3D1<br>[ =C2=A0 10.743246] usb usb5: Product: xHCI Host =
Controller<br>[ =C2=A0 10.743359] usb usb5: Manufacturer: Linux 5.15.16-1-r=
ockchip-g359ffc4bc727 xhci-hcd<br>[ =C2=A0 10.743512] usb usb5: SerialNumbe=
r: xhci-hcd.0.auto<br>[ =C2=A0 10.746576] hub 5-0:1.0: USB hub found<br>[ =
=C2=A0 10.746865] hub 5-0:1.0: 1 port detected<br>[ =C2=A0 10.749054] xhci-=
hcd xhci-hcd.0.auto: xHCI Host Controller<br>[ =C2=A0 10.750454] xhci-hcd x=
hci-hcd.0.auto: new USB bus registered, assigned bus number 6<br>[ =C2=A0 1=
0.750677] xhci-hcd xhci-hcd.0.auto: Host supports USB 3.0 SuperSpeed<br>[ =
=C2=A0 10.751167] usb usb6: We don&#39;t know the algorithms for LPM for th=
is host, disabling LPM.<br>[ =C2=A0 10.752007] usb usb6: New USB device fou=
nd, idVendor=3D1d6b, idProduct=3D0003, bcdDevice=3D 5.15<br>[ =C2=A0 10.752=
187] usb usb6: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=
=3D1<br>[ =C2=A0 10.752337] usb usb6: Product: xHCI Host Controller<br>[ =
=C2=A0 10.752451] usb usb6: Manufacturer: Linux 5.15.16-1-rockchip-g359ffc4=
bc727 xhci-hcd<br>[ =C2=A0 10.752592] usb usb6: SerialNumber: xhci-hcd.0.au=
to<br>[ =C2=A0 10.755365] hub 6-0:1.0: USB hub found<br>[ =C2=A0 10.755669]=
 hub 6-0:1.0: 1 port detected<br>[ =C2=A0 10.758922] xhci-hcd xhci-hcd.1.au=
to: xHCI Host Controller<br>[ =C2=A0 10.760343] xhci-hcd xhci-hcd.1.auto: n=
ew USB bus registered, assigned bus number 7<br>[ =C2=A0 10.761128] xhci-hc=
d xhci-hcd.1.auto: hcc params 0x0220fe64 hci version 0x110 quirks 0x0000000=
002010010<br>[ =C2=A0 10.762039] xhci-hcd xhci-hcd.1.auto: irq 54, io mem 0=
xfe900000<br>[ =C2=A0 10.763994] usb usb7: New USB device found, idVendor=
=3D1d6b, idProduct=3D0002, bcdDevice=3D 5.15<br>[ =C2=A0 10.764191] usb usb=
7: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1<br>[ =C2=
=A0 10.764342] usb usb7: Product: xHCI Host Controller<br>[ =C2=A0 10.76445=
5] usb usb7: Manufacturer: Linux 5.15.16-1-rockchip-g359ffc4bc727 xhci-hcd<=
br>[ =C2=A0 10.764601] usb usb7: SerialNumber: xhci-hcd.1.auto<br>[ =C2=A0 =
10.767411] hub 7-0:1.0: USB hub found<br>[ =C2=A0 10.767696] hub 7-0:1.0: 1=
 port detected<br>[ =C2=A0 10.769982] xhci-hcd xhci-hcd.1.auto: xHCI Host C=
ontroller<br>[ =C2=A0 10.771168] xhci-hcd xhci-hcd.1.auto: new USB bus regi=
stered, assigned bus number 8<br>[ =C2=A0 10.771384] xhci-hcd xhci-hcd.1.au=
to: Host supports USB 3.0 SuperSpeed<br>[ =C2=A0 10.771912] usb usb8: We do=
n&#39;t know the algorithms for LPM for this host, disabling LPM.<br>[ =C2=
=A0 10.772717] usb usb8: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 5.15<br>[ =C2=A0 10.772896] usb usb8: New USB device =
strings: Mfr=3D3, Product=3D2, SerialNumber=3D1<br>[ =C2=A0 10.773046] usb =
usb8: Product: xHCI Host Controller<br>[ =C2=A0 10.773160] usb usb8: Manufa=
cturer: Linux 5.15.16-1-rockchip-g359ffc4bc727 xhci-hcd<br>[ =C2=A0 10.7733=
02] usb usb8: SerialNumber: xhci-hcd.1.auto<br>[ =C2=A0 10.776389] hub 8-0:=
1.0: USB hub found<br>[ =C2=A0 10.776678] hub 8-0:1.0: 1 port detected<br>[=
 =C2=A0 10.784427] usbcore: registered new interface driver uas<br>[ =C2=A0=
 10.785747] usbcore: registered new interface driver usb-storage<br>[ =C2=
=A0 10.786109] usbcore: registered new interface driver ums-alauda<br>[ =C2=
=A0 10.786423] usbcore: registered new interface driver ums-cypress<br>[ =
=C2=A0 10.786758] usbcore: registered new interface driver ums-datafab<br>[=
 =C2=A0 10.787095] usbcore: registered new interface driver ums_eneub6250<b=
r>[ =C2=A0 10.787409] usbcore: registered new interface driver ums-freecom<=
br>[ =C2=A0 10.787719] usbcore: registered new interface driver ums-isd200<=
br>[ =C2=A0 10.788017] usbcore: registered new interface driver ums-jumpsho=
t<br>[ =C2=A0 10.788326] usbcore: registered new interface driver ums-karma=
<br>[ =C2=A0 10.788625] usbcore: registered new interface driver ums-onetou=
ch<br>[ =C2=A0 10.789023] usbcore: registered new interface driver ums-real=
tek<br>[ =C2=A0 10.789333] usbcore: registered new interface driver ums-sdd=
r09<br>[ =C2=A0 10.789756] usbcore: registered new interface driver ums-sdd=
r55<br>[ =C2=A0 10.790070] usbcore: registered new interface driver ums-usb=
at<br>[ =C2=A0 10.792802] usbcore: registered new interface driver iforce<b=
r>[ =C2=A0 10.793352] usbcore: registered new interface driver xpad<br>[ =
=C2=A0 10.794485] usbcore: registered new interface driver usbtouchscreen<b=
r>[ =C2=A0 10.797315] i2c_dev: i2c /dev entries driver<br>[ =C2=A0 10.81649=
0] fan53555-regulator 0-0040: FAN53555 Option[8] Rev[1] Detected!<br>[ =C2=
=A0 10.818456] vdd_cpu_b: will resolve supply early: vin<br>[ =C2=A0 10.818=
614] fan53555-regulator 0-0040: Looking up vin-supply from device tree<br>[=
 =C2=A0 10.818799] vdd_cpu_b: supplied by vcc5v0_sys<br>[ =C2=A0 10.818944]=
 vcc5v0_sys: could not add device link regulator.9: -ENOENT<br>[ =C2=A0 10.=
822253] vdd_cpu_b: 712 &lt;--&gt; 1500 mV at 1000 mV, enabled<br>[ =C2=A0 1=
0.827044] fan53555-regulator 0-0041: FAN53555 Option[8] Rev[1] Detected!<br=
>[ =C2=A0 10.828780] vdd_gpu: will resolve supply early: vin<br>[ =C2=A0 10=
.828939] fan53555-regulator 0-0041: Looking up vin-supply from device tree<=
br>[ =C2=A0 10.829117] vdd_gpu: supplied by vcc5v0_sys<br>[ =C2=A0 10.82923=
0] vcc5v0_sys: could not add device link regulator.10: -ENOENT<br>[ =C2=A0 =
10.832556] vdd_gpu: 712 &lt;--&gt; 1500 mV at 1000 mV, enabled<br>[ =C2=A0 =
10.841882] rk808 0-001b: chip id: 0x0<br>[ =C2=A0 10.862081] rk808-regulato=
r rk808-regulator: there is no dvs0 gpio<br>[ =C2=A0 10.862548] rk808-regul=
ator rk808-regulator: there is no dvs1 gpio<br>[ =C2=A0 10.864173] vdd_cent=
er: will resolve supply early: vcc1<br>[ =C2=A0 10.864337] rk808 0-001b: Lo=
oking up vcc1-supply from device tree<br>[ =C2=A0 10.864503] vdd_center: su=
pplied by vcc5v0_sys<br>[ =C2=A0 10.864631] vcc5v0_sys: could not add devic=
e link regulator.11: -ENOENT<br>[ =C2=A0 10.866313] vdd_center: 750 &lt;--&=
gt; 1350 mV at 900 mV, enabled<br>[ =C2=A0 10.868084] vdd_cpu_l: will resol=
ve supply early: vcc2<br>[ =C2=A0 10.868241] rk808 0-001b: Looking up vcc2-=
supply from device tree<br>[ =C2=A0 10.868402] vdd_cpu_l: supplied by vcc5v=
0_sys<br>[ =C2=A0 10.868524] vcc5v0_sys: could not add device link regulato=
r.12: -ENOENT<br>[ =C2=A0 10.868888] vdd_cpu_l: 750 &lt;--&gt; 1350 mV at 9=
00 mV, enabled<br>[ =C2=A0 10.870335] vcc_ddr: will resolve supply early: v=
cc3<br>[ =C2=A0 10.870485] rk808 0-001b: Looking up vcc3-supply from device=
 tree<br>[ =C2=A0 10.870646] vcc_ddr: supplied by vcc5v0_sys<br>[ =C2=A0 10=
.870761] vcc5v0_sys: could not add device link regulator.13: -ENOENT<br>[ =
=C2=A0 10.871149] vcc_ddr: at 5000 mV, enabled<br>[ =C2=A0 10.873225] vcc_1=
v8: will resolve supply early: vcc4<br>[ =C2=A0 10.873379] rk808 0-001b: Lo=
oking up vcc4-supply from device tree<br>[ =C2=A0 10.873816] vcc_1v8: suppl=
ied by vcc5v0_sys<br>[ =C2=A0 10.873940] vcc5v0_sys: could not add device l=
ink regulator.14: -ENOENT<br>[ =C2=A0 10.874308] vcc_1v8: 1800 mV, enabled<=
br>[ =C2=A0 10.876864] vcc1v8_dvp: will resolve supply early: vcc6<br>[ =C2=
=A0 10.877025] rk808 0-001b: Looking up vcc6-supply from device tree<br>[ =
=C2=A0 10.877180] vcc1v8_dvp: supplied by vcc5v0_sys<br>[ =C2=A0 10.877300]=
 vcc5v0_sys: could not add device link regulator.15: -ENOENT<br>[ =C2=A0 10=
.878934] vcc1v8_dvp: 1800 mV, enabled<br>[ =C2=A0 10.881114] vcca1v8_hdmi: =
will resolve supply early: vcc6<br>[ =C2=A0 10.881268] rk808 0-001b: Lookin=
g up vcc6-supply from device tree<br>[ =C2=A0 10.881721] vcca1v8_hdmi: supp=
lied by vcc5v0_sys<br>[ =C2=A0 10.881858] vcc5v0_sys: could not add device =
link regulator.16: -ENOENT<br>[ =C2=A0 10.882897] vcca1v8_hdmi: 1800 mV, en=
abled<br>[ =C2=A0 10.885121] vcca_1v8: will resolve supply early: vcc7<br>[=
 =C2=A0 10.885284] rk808 0-001b: Looking up vcc7-supply from device tree<br=
>[ =C2=A0 10.885610] vcca_1v8: supplied by vcc5v0_sys<br>[ =C2=A0 10.885752=
] vcc5v0_sys: could not add device link regulator.17: -ENOENT<br>[ =C2=A0 1=
0.886785] vcca_1v8: 1800 mV, enabled<br>[ =C2=A0 10.888911] vcc_sd: will re=
solve supply early: vcc9<br>[ =C2=A0 10.889073] rk808 0-001b: Looking up vc=
c9-supply from device tree<br>[ =C2=A0 10.889227] vcc_sd: supplied by vcc5v=
0_sys<br>[ =C2=A0 10.889337] vcc5v0_sys: could not add device link regulato=
r.18: -ENOENT<br>[ =C2=A0 10.890587] vcc_sd: 1800 &lt;--&gt; 3300 mV at 300=
0 mV, enabled<br>[ =C2=A0 10.892799] vcc3v0_sd: will resolve supply early: =
vcc9<br>[ =C2=A0 10.892957] rk808 0-001b: Looking up vcc9-supply from devic=
e tree<br>[ =C2=A0 10.893116] vcc3v0_sd: supplied by vcc5v0_sys<br>[ =C2=A0=
 10.893261] vcc5v0_sys: could not add device link regulator.19: -ENOENT<br>=
[ =C2=A0 10.894528] vcc3v0_sd: 3000 mV, enabled<br>[ =C2=A0 10.896651] vcc_=
1v5: will resolve supply early: vcc10<br>[ =C2=A0 10.896806] rk808 0-001b: =
Looking up vcc10-supply from device tree<br>[ =C2=A0 10.896961] vcc_1v5: su=
pplied by vcc5v0_sys<br>[ =C2=A0 10.897073] vcc5v0_sys: could not add devic=
e link regulator.20: -ENOENT<br>[ =C2=A0 10.898331] vcc_1v5: 1500 mV, enabl=
ed<br>[ =C2=A0 10.900480] vcca0v9_hdmi: will resolve supply early: vcc7<br>=
[ =C2=A0 10.900633] rk808 0-001b: Looking up vcc7-supply from device tree<b=
r>[ =C2=A0 10.900789] vcca0v9_hdmi: supplied by vcc5v0_sys<br>[ =C2=A0 10.9=
00910] vcc5v0_sys: could not add device link regulator.21: -ENOENT<br>[ =C2=
=A0 10.901947] vcca0v9_hdmi: 900 mV, enabled<br>[ =C2=A0 10.904130] vcc_3v0=
: will resolve supply early: vcc11<br>[ =C2=A0 10.904283] rk808 0-001b: Loo=
king up vcc11-supply from device tree<br>[ =C2=A0 10.904440] vcc_3v0: suppl=
ied by vcc5v0_sys<br>[ =C2=A0 10.904551] vcc5v0_sys: could not add device l=
ink regulator.22: -ENOENT<br>[ =C2=A0 10.905603] vcc_3v0: 3000 mV, enabled<=
br>[ =C2=A0 10.906825] vcc3v3_s3: will resolve supply early: vcc8<br>[ =C2=
=A0 10.907071] rk808 0-001b: Looking up vcc8-supply from device tree<br>[ =
=C2=A0 10.907238] vcc3v3_s3: supplied by vcc3v3_sys<br>[ =C2=A0 10.907358] =
vcc3v3_sys: could not add device link regulator.23: -ENOENT<br>[ =C2=A0 10.=
907702] vcc3v3_s3: at 3300 mV, enabled<br>[ =C2=A0 10.908814] vcc3v3_s0: wi=
ll resolve supply early: vcc12<br>[ =C2=A0 10.908951] rk808 0-001b: Looking=
 up vcc12-supply from device tree<br>[ =C2=A0 10.909117] vcc3v3_s0: supplie=
d by vcc3v3_sys<br>[ =C2=A0 10.909238] vcc3v3_sys: could not add device lin=
k regulator.24: -ENOENT<br>[ =C2=A0 10.909966] vcc3v3_s0: at 3300 mV, enabl=
ed<br>[ =C2=A0 10.923748] rk808-rtc rk808-rtc: registered as rtc0<br>[ =C2=
=A0 10.925890] rk808-rtc rk808-rtc: setting system clock to 2013-01-18T08:5=
4:34 UTC (1358499274)<br>[ =C2=A0 10.937312] rockchip-rga ff680000.rga: HW =
Version: 0x03.02<br>[ =C2=A0 10.938723] rockchip-rga: probe of ff680000.rga=
 failed with error -12<br>[ =C2=A0 10.940550] usbcore: registered new inter=
face driver uvcvideo<br>[ =C2=A0 10.947281] rockchip-thermal ff260000.tsadc=
: failed to register sensor 0: -517<br>[ =C2=A0 10.947553] rockchip-thermal=
 ff260000.tsadc: failed to register sensor[0] : error =3D -517<br>[ =C2=A0 =
10.951347] dw_wdt ff848000.watchdog: No valid TOPs array specified<br>[ =C2=
=A0 10.957666] device-mapper: ioctl: 4.45.0-ioctl (2021-03-22) initialised:=
 <a href=3D"mailto:dm-devel@redhat.com">dm-devel@redhat.com</a><br>[ =C2=A0=
 10.958918] Bluetooth: HCI UART driver ver 2.3<br>[ =C2=A0 10.959059] Bluet=
ooth: HCI UART protocol H4 registered<br>[ =C2=A0 10.959172] Bluetooth: HCI=
 UART protocol ATH3K registered<br>[ =C2=A0 10.959600] usbcore: registered =
new interface driver bfusb<br>[ =C2=A0 10.960069] usbcore: registered new i=
nterface driver btusb<br>[ =C2=A0 10.960865] cpu cpu0: OPP table can&#39;t =
be empty<br>[ =C2=A0 10.963410] sdhci: Secure Digital Host Controller Inter=
face driver<br>[ =C2=A0 10.963573] sdhci: Copyright(c) Pierre Ossman<br>[ =
=C2=A0 10.963674] Synopsys Designware Multimedia Card Interface Driver<br>[=
 =C2=A0 10.966723] sdhci-pltfm: SDHCI platform and OF driver helper<br>[ =
=C2=A0 10.969834] dwmmc_rockchip fe310000.mmc: IDMAC supports 32-bit addres=
s mode.<br>[ =C2=A0 10.970158] dwmmc_rockchip fe310000.mmc: Using internal =
DMA controller.<br>[ =C2=A0 10.970317] dwmmc_rockchip fe310000.mmc: Version=
 ID is 270a<br>[ =C2=A0 10.971055] dwmmc_rockchip fe310000.mmc: DW MMC cont=
roller at irq 17,32 bit host data width,256 deep fifo<br>[ =C2=A0 10.972116=
] dwmmc_rockchip fe310000.mmc: Looking up vmmc-supply from device tree<br>[=
 =C2=A0 10.972318] dwmmc_rockchip fe310000.mmc: Looking up vmmc-supply prop=
erty in node /mmc@fe310000 failed<br>[ =C2=A0 10.972647] dwmmc_rockchip fe3=
10000.mmc: Looking up vqmmc-supply from device tree<br>[ =C2=A0 10.972823] =
dwmmc_rockchip fe310000.mmc: Looking up vqmmc-supply property in node /mmc@=
fe310000 failed<br>[ =C2=A0 10.989783] ledtrig-cpu: registered to indicate =
activity on CPUs<br>[ =C2=A0 10.990632] hid: raw HID events driver (C) Jiri=
 Kosina<br>[ =C2=A0 11.018314] usbcore: registered new interface driver usb=
hid<br>[ =C2=A0 11.018612] usbhid: USB HID core driver<br>[ =C2=A0 11.02083=
5] rkvdec ff660000.video-codec: Adding to iommu group 1<br>[ =C2=A0 11.0681=
58] hantro-vpu ff650000.video-codec: Adding to iommu group 0<br>[ =C2=A0 11=
.072492] irq: type mismatch, failed to map hwirq-32 for interrupt-controlle=
r!<br>[ =C2=A0 11.072712] hantro-vpu ff650000.video-codec: IRQ vdpu not fou=
nd<br>[ =C2=A0 11.074844] Zoran MJPEG board driver version 0.10.1<br>[ =C2=
=A0 11.075255] Linux video codec intermediate layer: v0.2<br>[ =C2=A0 11.07=
5418] saa7146: register extension &#39;av7110&#39;<br>[ =C2=A0 11.083859] s=
dhci-arasan fe330000.mmc: Looking up vmmc-supply from device tree<br>[ =C2=
=A0 11.091432] usbcore: registered new interface driver snd-usb-audio<br>[ =
=C2=A0 11.099500] sdhci-arasan fe330000.mmc: Looking up vmmc-supply propert=
y in node /mmc@fe330000 failed<br>[ =C2=A0 11.112425] u32 classifier<br>[ =
=C2=A0 11.112499] sdhci-arasan fe330000.mmc: Looking up vqmmc-supply from d=
evice tree<br>[ =C2=A0 11.113020] =C2=A0 =C2=A0 input device check on<br>[ =
=C2=A0 11.114266] Initializing XFRM netlink socket<br>[ =C2=A0 11.120358] s=
dhci-arasan fe330000.mmc: Looking up vqmmc-supply property in node /mmc@fe3=
30000 failed<br>[ =C2=A0 11.121602] NET: Registered PF_INET6 protocol famil=
y<br>[ =C2=A0 11.123037] usb 8-1: new SuperSpeed USB device number 2 using =
xhci-hcd<br>[ =C2=A0 11.134670] Segment Routing with IPv6<br>[ =C2=A0 11.13=
5294] In-situ OAM (IOAM) with IPv6<br>[ =C2=A0 11.135867] NET: Registered P=
F_PACKET protocol family<br>[ =C2=A0 11.136112] NET: Registered PF_KEY prot=
ocol family<br>[ =C2=A0 11.136230] mmc2: CQHCI version 5.10<br>[ =C2=A0 11.=
136568] Bridge firewalling registered<br>[ =C2=A0 11.136633] can: controlle=
r area network core<br>[ =C2=A0 11.138034] NET: Registered PF_CAN protocol =
family<br>[ =C2=A0 11.141093] Bluetooth: RFCOMM socket layer initialized<br=
>[ =C2=A0 11.141809] Bluetooth: RFCOMM ver 1.11<br>[ =C2=A0 11.142039] Blue=
tooth: HIDP (Human Interface Emulation) ver 1.2<br>[ =C2=A0 11.142209] Blue=
tooth: HIDP socket layer initialized<br>[ =C2=A0 11.142338] 8021q: 802.1Q V=
LAN Support v1.8<br>[ =C2=A0 11.142653] Key type dns_resolver registered<br=
>[ =C2=A0 11.149920] registered taskstats version 1<br>[ =C2=A0 11.150671] =
Loading compiled-in X.509 certificates<br>[ =C2=A0 11.151208] random: fast =
init done<br>[ =C2=A0 11.155983] usb 8-1: New USB device found, idVendor=3D=
152d, idProduct=3D0561, bcdDevice=3D 0.01<br>[ =C2=A0 11.156263] usb 8-1: N=
ew USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D5<br>[ =C2=A0 1=
1.156439] usb 8-1: Product: JMS56x Series<br>[ =C2=A0 11.156545] usb 8-1: M=
anufacturer: JMicron<br>[ =C2=A0 11.156646] usb 8-1: SerialNumber: RANDOM__=
A0840143833E<br>[ =C2=A0 11.168652] usb-storage 8-1:1.0: USB Mass Storage d=
evice detected<br>[ =C2=A0 11.178360] scsi host0: usb-storage 8-1:1.0<br>[ =
=C2=A0 11.196406] Btrfs loaded, crc32c=3Dcrc32c-generic, integrity-checker=
=3Don, zoned=3Dno, fsverity=3Dno<br>[ =C2=A0 11.197865] BTRFS: selftest: se=
ctorsize: 4096 =C2=A0nodesize: 4096<br>[ =C2=A0 11.198037] BTRFS: selftest:=
 running btrfs free space cache tests<br>[ =C2=A0 11.198203] BTRFS: selftes=
t: running extent only tests<br>[ =C2=A0 11.198401] BTRFS: selftest: runnin=
g bitmap only tests<br>[ =C2=A0 11.198583] BTRFS: selftest: running bitmap =
and extent tests<br>[ =C2=A0 11.198850] BTRFS: selftest: running space stea=
ling from bitmap to extent tests<br>[ =C2=A0 11.202503] mmc2: SDHCI control=
ler on fe330000.mmc [fe330000.mmc] using ADMA<br>[ =C2=A0 11.206911] BTRFS:=
 selftest: running extent buffer operation tests<br>[ =C2=A0 11.207131] BTR=
FS: selftest: running btrfs_split_item tests<br>[ =C2=A0 11.207469] BTRFS: =
selftest: running extent I/O tests<br>[ =C2=A0 11.207579] BTRFS: selftest: =
running find delalloc tests<br>[ =C2=A0 13.247196] BTRFS: selftest: running=
 find_first_clear_extent_bit test<br>[ =C2=A0 13.247996] BTRFS: selftest: r=
unning extent buffer bitmap tests<br>[ =C2=A0 13.436326] BTRFS: selftest: r=
unning inode tests<br>[ =C2=A0 13.436468] BTRFS: selftest: running btrfs_ge=
t_extent tests<br>[ =C2=A0 13.437811] BTRFS: selftest: running hole first b=
trfs_get_extent test<br>[ =C2=A0 13.438152] BTRFS: selftest: running outsta=
nding_extents tests<br>[ =C2=A0 13.438630] BTRFS: selftest: running qgroup =
tests<br>[ =C2=A0 13.438747] BTRFS: selftest: running qgroup add/remove tes=
ts<br>[ =C2=A0 13.439210] BTRFS: selftest: running qgroup multiple refs tes=
t<br>[ =C2=A0 13.440099] BTRFS: selftest: running free space tree tests<br>=
[ =C2=A0 13.880122] BTRFS: selftest: sectorsize: 4096 =C2=A0nodesize: 8192<=
br>[ =C2=A0 13.880446] BTRFS: selftest: running btrfs free space cache test=
s<br>[ =C2=A0 13.880648] BTRFS: selftest: running extent only tests<br>[ =
=C2=A0 13.880883] BTRFS: selftest: running bitmap only tests<br>[ =C2=A0 13=
.881123] BTRFS: selftest: running bitmap and extent tests<br>[ =C2=A0 13.88=
1545] BTRFS: selftest: running space stealing from bitmap to extent tests<b=
r>[ =C2=A0 13.889765] BTRFS: selftest: running extent buffer operation test=
s<br>[ =C2=A0 13.889923] BTRFS: selftest: running btrfs_split_item tests<br=
>[ =C2=A0 13.890241] BTRFS: selftest: running extent I/O tests<br>[ =C2=A0 =
13.890369] BTRFS: selftest: running find delalloc tests<br>[ =C2=A0 15.9312=
91] BTRFS: selftest: running find_first_clear_extent_bit test<br>[ =C2=A0 1=
5.932162] BTRFS: selftest: running extent buffer bitmap tests<br>[ =C2=A0 1=
6.532870] BTRFS: selftest: running inode tests<br>[ =C2=A0 16.533138] BTRFS=
: selftest: running btrfs_get_extent tests<br>[ =C2=A0 16.534815] BTRFS: se=
lftest: running hole first btrfs_get_extent test<br>[ =C2=A0 16.535219] BTR=
FS: selftest: running outstanding_extents tests<br>[ =C2=A0 16.535736] BTRF=
S: selftest: running qgroup tests<br>[ =C2=A0 16.535846] BTRFS: selftest: r=
unning qgroup add/remove tests<br>[ =C2=A0 16.536300] BTRFS: selftest: runn=
ing qgroup multiple refs test<br>[ =C2=A0 16.537056] BTRFS: selftest: runni=
ng free space tree tests<br>[ =C2=A0 16.977337] BTRFS: selftest: sectorsize=
: 4096 =C2=A0nodesize: 16384<br>[ =C2=A0 16.977814] BTRFS: selftest: runnin=
g btrfs free space cache tests<br>[ =C2=A0 16.978018] BTRFS: selftest: runn=
ing extent only tests<br>[ =C2=A0 16.978279] BTRFS: selftest: running bitma=
p only tests<br>[ =C2=A0 16.978513] BTRFS: selftest: running bitmap and ext=
ent tests<br>[ =C2=A0 16.978842] BTRFS: selftest: running space stealing fr=
om bitmap to extent tests<br>[ =C2=A0 16.987056] BTRFS: selftest: running e=
xtent buffer operation tests<br>[ =C2=A0 16.987214] BTRFS: selftest: runnin=
g btrfs_split_item tests<br>[ =C2=A0 16.987541] BTRFS: selftest: running ex=
tent I/O tests<br>[ =C2=A0 16.987667] BTRFS: selftest: running find delallo=
c tests<br>[ =C2=A0 19.025223] BTRFS: selftest: running find_first_clear_ex=
tent_bit test<br>[ =C2=A0 19.026172] BTRFS: selftest: running extent buffer=
 bitmap tests<br>[ =C2=A0 20.225626] BTRFS: selftest: running inode tests<b=
r>[ =C2=A0 20.225841] BTRFS: selftest: running btrfs_get_extent tests<br>[ =
=C2=A0 20.227444] BTRFS: selftest: running hole first btrfs_get_extent test=
<br>[ =C2=A0 20.227818] BTRFS: selftest: running outstanding_extents tests<=
br>[ =C2=A0 20.228276] BTRFS: selftest: running qgroup tests<br>[ =C2=A0 20=
.228399] BTRFS: selftest: running qgroup add/remove tests<br>[ =C2=A0 20.22=
8834] BTRFS: selftest: running qgroup multiple refs test<br>[ =C2=A0 20.229=
952] BTRFS: selftest: running free space tree tests<br>[ =C2=A0 20.669501] =
BTRFS: selftest: sectorsize: 4096 =C2=A0nodesize: 32768<br>[ =C2=A0 20.6697=
47] BTRFS: selftest: running btrfs free space cache tests<br>[ =C2=A0 20.66=
9903] BTRFS: selftest: running extent only tests<br>[ =C2=A0 20.670123] BTR=
FS: selftest: running bitmap only tests<br>[ =C2=A0 20.670366] BTRFS: selft=
est: running bitmap and extent tests<br>[ =C2=A0 20.670625] BTRFS: selftest=
: running space stealing from bitmap to extent tests<br>[ =C2=A0 20.678498]=
 BTRFS: selftest: running extent buffer operation tests<br>[ =C2=A0 20.6786=
44] BTRFS: selftest: running btrfs_split_item tests<br>[ =C2=A0 20.678971] =
BTRFS: selftest: running extent I/O tests<br>[ =C2=A0 20.679083] BTRFS: sel=
ftest: running find delalloc tests<br>[ =C2=A0 22.716824] BTRFS: selftest: =
running find_first_clear_extent_bit test<br>[ =C2=A0 22.717705] BTRFS: self=
test: running extent buffer bitmap tests<br>[ =C2=A0 25.119619] BTRFS: self=
test: running inode tests<br>[ =C2=A0 25.119942] BTRFS: selftest: running b=
trfs_get_extent tests<br>[ =C2=A0 25.121224] BTRFS: selftest: running hole =
first btrfs_get_extent test<br>[ =C2=A0 25.121825] BTRFS: selftest: running=
 outstanding_extents tests<br>[ =C2=A0 25.122316] BTRFS: selftest: running =
qgroup tests<br>[ =C2=A0 25.122425] BTRFS: selftest: running qgroup add/rem=
ove tests<br>[ =C2=A0 25.122860] BTRFS: selftest: running qgroup multiple r=
efs test<br>[ =C2=A0 25.123715] BTRFS: selftest: running free space tree te=
sts<br>[ =C2=A0 25.564237] BTRFS: selftest: sectorsize: 4096 =C2=A0nodesize=
: 65536<br>[ =C2=A0 25.564448] BTRFS: selftest: running btrfs free space ca=
che tests<br>[ =C2=A0 25.564600] BTRFS: selftest: running extent only tests=
<br>[ =C2=A0 25.564762] BTRFS: selftest: running bitmap only tests<br>[ =C2=
=A0 25.564946] BTRFS: selftest: running bitmap and extent tests<br>[ =C2=A0=
 25.565204] BTRFS: selftest: running space stealing from bitmap to extent t=
ests<br>[ =C2=A0 25.573041] BTRFS: selftest: running extent buffer operatio=
n tests<br>[ =C2=A0 25.573167] BTRFS: selftest: running btrfs_split_item te=
sts<br>[ =C2=A0 25.573626] BTRFS: selftest: running extent I/O tests<br>[ =
=C2=A0 25.573739] BTRFS: selftest: running find delalloc tests<br>[ =C2=A0 =
27.608826] BTRFS: selftest: running find_first_clear_extent_bit test<br>[ =
=C2=A0 27.609668] BTRFS: selftest: running extent buffer bitmap tests<br>[ =
=C2=A0 32.430665] BTRFS: selftest: running inode tests<br>[ =C2=A0 32.43120=
2] BTRFS: selftest: running btrfs_get_extent tests<br>[ =C2=A0 32.432886] B=
TRFS: selftest: running hole first btrfs_get_extent test<br>[ =C2=A0 32.433=
377] BTRFS: selftest: running outstanding_extents tests<br>[ =C2=A0 32.4342=
57] BTRFS: selftest: running qgroup tests<br>[ =C2=A0 32.434373] BTRFS: sel=
ftest: running qgroup add/remove tests<br>[ =C2=A0 32.434818] BTRFS: selfte=
st: running qgroup multiple refs test<br>[ =C2=A0 32.435655] BTRFS: selftes=
t: running free space tree tests<br>[ =C2=A0 32.877773] BTRFS: selftest: ru=
nning extent_map tests<br>[ =C2=A0 32.878137] BTRFS: selftest: running rmap=
 tests<br>[ =C2=A0 33.072074] rockchip-pcie f8000000.pcie: host bridge /pci=
e@f8000000 ranges:<br>[ =C2=A0 33.073026] rockchip-pcie f8000000.pcie: =C2=
=A0 =C2=A0 =C2=A0MEM 0x00fa000000..0x00fbdfffff -&gt; 0x00fa000000<br>[ =C2=
=A0 33.073259] rockchip-pcie f8000000.pcie: =C2=A0 =C2=A0 =C2=A0 IO 0x00fbe=
00000..0x00fbefffff -&gt; 0x00fbe00000<br>[ =C2=A0 33.077844] rockchip-pcie=
 f8000000.pcie: Looking up vpcie12v-supply from device tree<br>[ =C2=A0 33.=
078083] rockchip-pcie f8000000.pcie: Looking up vpcie12v-supply property in=
 node /pcie@f8000000 failed<br>[ =C2=A0 33.078823] rockchip-pcie f8000000.p=
cie: no vpcie12v regulator found<br>[ =C2=A0 33.079068] rockchip-pcie f8000=
000.pcie: Looking up vpcie3v3-supply from device tree<br>[ =C2=A0 33.080295=
] rockchip-pcie f8000000.pcie: Looking up vpcie1v8-supply from device tree<=
br>[ =C2=A0 33.081188] rockchip-pcie f8000000.pcie: Looking up vpcie0v9-sup=
ply from device tree<br>[ =C2=A0 33.122020] genirq: Setting trigger mode 2 =
for irq 15 failed (gic_set_type+0x0/0x138)<br>[ =C2=A0 33.122820] irq: no i=
rq domain found for interrupt-controller !<br>[ =C2=A0 33.122995] rockchip-=
pcie f8000000.pcie: IRQ client not found<br>[ =C2=A0 33.132257] rockchip-io=
domain ff320000.syscon:io-domains: Looking up pmu1830-supply from device tr=
ee<br>[ =C2=A0 33.135488] rockchip-iodomain ff770000.syscon:io-domains: Loo=
king up bt656-supply from device tree<br>[ =C2=A0 33.136399] rockchip-iodom=
ain ff770000.syscon:io-domains: Looking up audio-supply from device tree<br=
>[ =C2=A0 33.136825] rockchip-iodomain ff770000.syscon:io-domains: Looking =
up sdmmc-supply from device tree<br>[ =C2=A0 33.138130] rockchip-iodomain f=
f770000.syscon:io-domains: Looking up gpio1830-supply from device tree<br>[=
 =C2=A0 33.154798] rockchip-drm display-subsystem: bound ff8f0000.vop (ops =
0xffffffc010e887e8)<br>[ =C2=A0 33.159530] rockchip-drm display-subsystem: =
bound ff900000.vop (ops 0xffffffc010e887e8)<br>[ =C2=A0 33.161342] dwhdmi-r=
ockchip ff940000.hdmi: Detected HDMI TX controller v2.11a with HDCP (DWC HD=
MI 2.0 TX PHY)<br>[ =C2=A0 33.171366] rockchip-drm display-subsystem: bound=
 ff940000.hdmi (ops 0xffffffc010e8c6c0)<br>[ =C2=A0 33.180852] [drm] Initia=
lized rockchip 1.0.0 20140818 for display-subsystem on minor 0<br>[ =C2=A0 =
33.183921] mali ff9a0000.gpu: No IRQ resource at index 1<br>[ =C2=A0 33.184=
155] mali ff9a0000.gpu: IRQ search failed<br>[ =C2=A0 33.184644] mali: prob=
e of ff9a0000.gpu failed with error -2<br>[ =C2=A0 33.190550] rockchip-ther=
mal ff260000.tsadc: failed to register sensor 0: -517<br>[ =C2=A0 33.190882=
] rockchip-thermal ff260000.tsadc: failed to register sensor[0] : error =3D=
 -517<br>[ =C2=A0 33.200478] dwmmc_rockchip fe310000.mmc: IDMAC supports 32=
-bit address mode.<br>[ =C2=A0 33.201294] dwmmc_rockchip fe310000.mmc: Usin=
g internal DMA controller.<br>[ =C2=A0 33.201673] dwmmc_rockchip fe310000.m=
mc: Version ID is 270a<br>[ =C2=A0 33.202201] dwmmc_rockchip fe310000.mmc: =
DW MMC controller at irq 17,32 bit host data width,256 deep fifo<br>[ =C2=
=A0 33.203308] dwmmc_rockchip fe310000.mmc: Looking up vmmc-supply from dev=
ice tree<br>[ =C2=A0 33.203527] dwmmc_rockchip fe310000.mmc: Looking up vmm=
c-supply property in node /mmc@fe310000 failed<br>[ =C2=A0 33.204253] dwmmc=
_rockchip fe310000.mmc: Looking up vqmmc-supply from device tree<br>[ =C2=
=A0 33.204424] dwmmc_rockchip fe310000.mmc: Looking up vqmmc-supply propert=
y in node /mmc@fe310000 failed<br>[ =C2=A0 33.216884] rockchip-thermal ff26=
0000.tsadc: failed to register sensor 0: -517<br>[ =C2=A0 33.217686] rockch=
ip-thermal ff260000.tsadc: failed to register sensor[0] : error =3D -517<br=
>[ =C2=A0 33.226865] dwmmc_rockchip fe310000.mmc: IDMAC supports 32-bit add=
ress mode.<br>[ =C2=A0 33.227549] dwmmc_rockchip fe310000.mmc: Using intern=
al DMA controller.<br>[ =C2=A0 33.227708] dwmmc_rockchip fe310000.mmc: Vers=
ion ID is 270a<br>[ =C2=A0 33.228322] dwmmc_rockchip fe310000.mmc: DW MMC c=
ontroller at irq 17,32 bit host data width,256 deep fifo<br>[ =C2=A0 33.229=
879] dwmmc_rockchip fe310000.mmc: Looking up vmmc-supply from device tree<b=
r>[ =C2=A0 33.230089] dwmmc_rockchip fe310000.mmc: Looking up vmmc-supply p=
roperty in node /mmc@fe310000 failed<br>[ =C2=A0 33.230767] dwmmc_rockchip =
fe310000.mmc: Looking up vqmmc-supply from device tree<br>[ =C2=A0 33.23096=
3] dwmmc_rockchip fe310000.mmc: Looking up vqmmc-supply property in node /m=
mc@fe310000 failed<br>[ =C2=A0 33.268761] rockchip-thermal ff260000.tsadc: =
failed to register sensor 0: -517<br>[ =C2=A0 33.274833] rockchip-thermal f=
f260000.tsadc: failed to register sensor[0] : error =3D -517<br>[ =C2=A0 33=
.299373] clk: Not disabling unused clocks<br>[ =C2=A0 33.300367] ALSA devic=
e list:<br>[ =C2=A0 33.300487] =C2=A0 #0: hdmi-sound<br>[ =C2=A0 33.325969]=
 Freeing unused kernel memory: 5504K<br>[ =C2=A0 33.334276] Run /init as in=
it process<br>[ =C2=A0 33.334455] =C2=A0 with arguments:<br>[ =C2=A0 33.334=
569] =C2=A0 =C2=A0 /init<br>[ =C2=A0 33.334643] =C2=A0 with environment:<br=
>[ =C2=A0 33.334724] =C2=A0 =C2=A0 HOME=3D/<br>[ =C2=A0 33.334796] =C2=A0 =
=C2=A0 TERM=3Dlinux<br>[ =C2=A0 33.334872] =C2=A0 =C2=A0 earlyprintk=3Dxen<=
br>Loading, please wait...<br>Starting version 245.4-4ubuntu3<br>[ =C2=A0 3=
9.458844] rk_gmac-dwmac fe300000.ethernet: IRQ eth_wake_irq not found<br>[ =
=C2=A0 39.459243] rk_gmac-dwmac fe300000.ethernet: IRQ eth_lpi not found<br=
>[ =C2=A0 39.460311] rk_gmac-dwmac fe300000.ethernet: PTP uses main clock<b=
r>[ =C2=A0 39.460560] rk_gmac-dwmac fe300000.ethernet: Looking up phy-suppl=
y from device tree<br>[ =C2=A0 39.462867] rk_gmac-dwmac fe300000.ethernet: =
clock input or output? (input).<br>[ =C2=A0 39.463089] rk_gmac-dwmac fe3000=
00.ethernet: TX delay(0x28).<br>[ =C2=A0 39.463224] rk_gmac-dwmac fe300000.=
ethernet: RX delay(0x11).<br>[ =C2=A0 39.463365] rk_gmac-dwmac fe300000.eth=
ernet: integrated PHY? (no).<br>[ =C2=A0 39.463717] rk_gmac-dwmac fe300000.=
ethernet: cannot get clock clk_mac_speed<br>[ =C2=A0 39.463995] rk_gmac-dwm=
ac fe300000.ethernet: clock input from PHY<br>[ =C2=A0 39.469266] rk_gmac-d=
wmac fe300000.ethernet: init for RGMII<br>[ =C2=A0 39.531375] rk_gmac-dwmac=
 fe300000.ethernet: User ID: 0x10, Synopsys ID: 0x35<br>[ =C2=A0 39.540951]=
 rk_gmac-dwmac fe300000.ethernet: =C2=A0 =C2=A0 =C2=A0 =C2=A0 DWMAC1000<br>=
[ =C2=A0 39.543024] rk_gmac-dwmac fe300000.ethernet: DMA HW capability regi=
ster supported<br>[ =C2=A0 39.543220] rk_gmac-dwmac fe300000.ethernet: RX C=
hecksum Offload Engine supported<br>[ =C2=A0 39.543358] rk_gmac-dwmac fe300=
000.ethernet: COE Type 2<br>[ =C2=A0 39.543476] rk_gmac-dwmac fe300000.ethe=
rnet: TX Checksum insertion supported<br>[ =C2=A0 39.543614] rk_gmac-dwmac =
fe300000.ethernet: Wake-Up On Lan supported<br>[ =C2=A0 39.544622] rk_gmac-=
dwmac fe300000.ethernet: Normal descriptors<br>[ =C2=A0 39.545001] rk_gmac-=
dwmac fe300000.ethernet: Ring mode enabled<br>[ =C2=A0 39.545138] rk_gmac-d=
wmac fe300000.ethernet: Enable RX Mitigation via HW Watchdog Timer<br>[ =C2=
=A0 39.545312] rk_gmac-dwmac fe300000.ethernet: device MAC address 6e:d0:b3=
:b7:fc:57<br>[ =C2=A0 40.095457] libphy: stmmac: probed<br>[ =C2=A0 40.0960=
18] mdio_bus stmmac-0:00: attached PHY driver [unbound] (mii_bus:phy_addr=
=3Dstmmac-0:00, irq=3DPOLL)<br>[ =C2=A0 40.096233] mdio_bus stmmac-0:01: at=
tached PHY driver [unbound] (mii_bus:phy_addr=3Dstmmac-0:01, irq=3DPOLL)<br=
>[ =C2=A0 40.338726] dwmmc_rockchip fe310000.mmc: IDMAC supports 32-bit add=
ress mode.<br>[ =C2=A0 40.339251] dwmmc_rockchip fe310000.mmc: Using intern=
al DMA controller.<br>[ =C2=A0 40.339415] dwmmc_rockchip fe310000.mmc: Vers=
ion ID is 270a<br>[ =C2=A0 40.339902] dwmmc_rockchip fe310000.mmc: DW MMC c=
ontroller at irq 17,32 bit host data width,256 deep fifo<br>[ =C2=A0 40.344=
800] dwmmc_rockchip fe310000.mmc: Looking up vmmc-supply from device tree<b=
r>[ =C2=A0 40.345102] dwmmc_rockchip fe310000.mmc: Looking up vmmc-supply p=
roperty in node /mmc@fe310000 failed<br>[ =C2=A0 40.345849] rockchip-therma=
l ff260000.tsadc: failed to register sensor 0: -517<br>[ =C2=A0 40.345897] =
dwmmc_rockchip fe310000.mmc: Looking up vqmmc-supply from device tree<br>[ =
=C2=A0 40.346034] rockchip-thermal ff260000.tsadc: failed to register senso=
r[0] : error =3D -517<br>[ =C2=A0 40.346160] dwmmc_rockchip fe310000.mmc: L=
ooking up vqmmc-supply property in node /mmc@fe310000 failed<br><br>Begin: =
Loading essential drivers ... done.<br>Begin: Running /scripts/init-premoun=
t ... done.<br>Begin: Mounting root file system ... Begin: Running /scripts=
/local-top ... done.<br>Begin: Running /scripts/local-premount ... <br>done=
.<br>[ =C2=A0 64.586284] vcc3v3_pcie: disabling<br>Begin: Waiting for root =
file system ... Begin: Running /scripts/local-block ... done.<br>done.<br>G=
ave up waiting for root file system device.=C2=A0 Common problems:<br>=C2=
=A0- Boot args (cat /proc/cmdline)<br>=C2=A0 =C2=A0- Check rootdelay=3D (di=
d the system wait long enough?)<br>=C2=A0- Missing modules (cat /proc/modul=
es; ls /dev)<br>ALERT! =C2=A0/dev/nvme0n1p2 does not exist.=C2=A0 Dropping =
to a shell!<br><br><br>BusyBox v1.30.1 (Ubuntu 1:1.30.1-4ubuntu6) built-in =
shell (ash)<br>Enter &#39;help&#39; for a list of built-in commands.<br><br=
>(initramfs)=C2=A0<br></div><div><br></div><div><br></div><div><br></div><d=
iv>- Brad=C2=A0</div></div>

--000000000000c00fc105e38bdacc--

