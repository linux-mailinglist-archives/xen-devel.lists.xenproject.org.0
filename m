Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB335802545
	for <lists+xen-devel@lfdr.de>; Sun,  3 Dec 2023 16:53:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646355.1008735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9olR-0006ot-A6; Sun, 03 Dec 2023 15:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646355.1008735; Sun, 03 Dec 2023 15:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9olR-0006mS-6U; Sun, 03 Dec 2023 15:52:13 +0000
Received: by outflank-mailman (input) for mailman id 646355;
 Sun, 03 Dec 2023 09:56:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7la4=HO=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1r9jD8-0005Y5-Dp
 for xen-devel@lists.xenproject.org; Sun, 03 Dec 2023 09:56:26 +0000
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [2607:f8b0:4864:20::c29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35989358-91c2-11ee-9b0f-b553b5be7939;
 Sun, 03 Dec 2023 10:56:21 +0100 (CET)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-58d3c9badf5so2480486eaf.1
 for <xen-devel@lists.xenproject.org>; Sun, 03 Dec 2023 01:56:21 -0800 (PST)
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
X-Inumbo-ID: 35989358-91c2-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701597379; x=1702202179; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mGJ3yZsGs1MFG7BrUM8YKKYWJWsKOJNVUcdh1HBEF9A=;
        b=Swq+ckriopO3z0P/tCT6ufcTC+iZOhBzgbIzP91Bp6q/hmuAn4mga0RrJF4LHAkE+C
         GsDCLEOF9I7pKfRhvIR9Km+49azvOdQ7+XbKzsB3tE456HpGsuiTg5H+u+K5PqKCFpFG
         3PdiPSOpTmCENhUQwPlqVOE00esqFkmZtDTOyXQ4ZM5yVyxU52JEk0R9tIfEMN7Emn1L
         d502tXDEyPfh9hHNpG7z+ZHPg4KzGO/gFlhF4S79UErzDOMSZR+bwJjEv0afNhJ5qLlL
         hqlzH+B8bei+6xVRG8PpiLFICp1kX2ffU/sJ6k2ltwANuP99elBNQxNFJ6jtWxWMmMON
         VNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701597379; x=1702202179;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mGJ3yZsGs1MFG7BrUM8YKKYWJWsKOJNVUcdh1HBEF9A=;
        b=KC34Mk0FBWO+L9pELzvnd2ZF7ppt9WqpsN/kk9BZqDHy0bZZhjtF5yHvSiHSh1Klya
         1PQaVX3zIW5vPsOczARoDs+G/oV0xZoH2ESV1B82upXMC8Q/nn2nYi86kbIghS71VaST
         qTbZ9LeodIVDOanbbaa+DXaaRxRC4M2i1rQ61vElIi2lYZbnHrnSoB28VTAdITHrFfCf
         df70YZrWcKTbYjGH0GC6jgb2U2msYxXibOkX3eQJflyVBEQZSv6tP91Peo7cc8osh7LO
         VrRqcMNzcgEGdqeKRmfq7W/Z0Yl+B1IzjRaSx85t2URPXPRlih0IoCiIVVZIeis7RHSM
         7lNw==
X-Gm-Message-State: AOJu0YwVgcDBMmAGCsdVgT1mh1nTjywzr+BXtlVkR1tNDb0+bs3wgNtf
	TUH/C0LXhSFVXVbm5Y2JivhJ3p5AzdoVbPVc3ElOd7F2T0M=
X-Google-Smtp-Source: AGHT+IEMzxSnbHcBAd4JO8MSf0lge+LXga8ZqeuuTQE/jhmXxP+dj0ZC7S1xtazj+AifDgz9e+F4ggWMiNEe2oJTmm8=
X-Received: by 2002:a05:6358:cb1a:b0:170:17eb:2057 with SMTP id
 gr26-20020a056358cb1a00b0017017eb2057mr2092732rwb.64.1701597379205; Sun, 03
 Dec 2023 01:56:19 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Sun, 3 Dec 2023 10:56:08 +0100
Message-ID: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
Subject: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000569c7d060b98038f"

--000000000000569c7d060b98038f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

 Trying to get the Framework Laptop 13 AMD to work with QubesOS I hit the
following Xen issue :

Xen version : 4.17.2
Kernel : 6.5.12-300.fc39.x86_64
CPU  model name : AMD Ryzen 7 7840U w/ Radeon  780M Graphics

The touchpad is not working (not detected by evtest) because ( see below
for XXXXXXX values) :
[   10.215870] i2c_hid_acpi i2c-FRMXXXXXXX: failed to reset device: -61

which is maybe related to the previous messages :

[    2.065750] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
...
[    2.464598] amd_gpio AMDI0030:00: failed to enable wake-up interrupt

QubesOS issue : https://github.com/QubesOS/qubes-issues/issues/8734

Possibly related issues :

 https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1971597

Here's the complete diff of dmesg with and without xen loaded up to the
failed i2c_hid_acpi init :

[    0.000000] Command line: placeholder
root=3DUUID=3D71b1dc59-ea00-484c-b5e4-ee77ede771db ro rhgb quiet
[    0.000000] Released 0 page(s)
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] efi: ACPI=3D0x5affe000 ACPI 2.0=3D0x5affe014
TPMFinalLog=3D0x5af3f000 SMBIOS=3D0x51677000 SMBIOS 3.0=3D0x51674000
(MEMATTR=3D0x4b719018 unusable) ESRT=3D0x5af9b018 MOKvar=3D0x5187c000
[    0.000000] Hypervisor detected: Xen PV
[    0.026644] tsc: Detected 3294.105 MHz processor
[    0.026645] tsc: Detected 3293.856 MHz TSC
[    0.026732] MTRR map: 3 entries (0 fixed + 3 variable; max 16), built
from 8 variable MTRRs
[    0.026733] MTRRs set to read-only
[    0.026735] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP  UC  UC

[    0.026753] esrt: Reserving ESRT space from 0x000000005af9b018 to
0x000000005af9b050.
[    1.042047] ACPI: BGRT 0x000000005AFB8000 000038 (v01 INSYDE EDK2
00000002 ACPI 00040000)
[    1.042095] Setting APIC routing to Xen PV.
[    1.042116] NUMA turned off
[    1.101730] On node 0, zone DMA: 128 pages in unavailable ranges
[    1.136828] p2m virtual area at (____ptrval____), size is 40000000
[    1.401457] Remapped 728641 page(s)
[    1.402499] Booting kernel on Xen
[    1.402500] Xen version: 4.17.2 (preserve-AD)
[    1.406607] xen: PV spinlocks enabled
[    1.406609] PV qspinlock hash table entries: 256 (order: 0, 4096 bytes,
linear)
[    1.406610] Kernel command line: placeholder
root=3DUUID=3D71b1dc59-ea00-484c-b5e4-ee77ede771db ro rhgb quiet
[    1.406661] Unknown kernel command line parameters "placeholder rhgb",
will be passed to user space.
[    1.406867] random: crng init done
[    1.411447] Built 1 zonelists, mobility grouping on.  Total pages:
15403418
[    1.497107] Memory: 60184272K/62591736K available (18432K kernel code,
3267K rwdata, 14476K rodata, 4532K init, 17364K bss, 2407212K reserved, 0K
cma-reserved)
[    1.508627] xen:events: Using FIFO-based ABI
[    1.508634] xen: --> pirq=3D1 -> irq=3D1 (gsi=3D1)
[    1.508636] xen: --> pirq=3D2 -> irq=3D2 (gsi=3D2)
[    1.508638] xen: --> pirq=3D3 -> irq=3D3 (gsi=3D3)
[    1.508639] xen: --> pirq=3D4 -> irq=3D4 (gsi=3D4)
[    1.508640] xen: --> pirq=3D5 -> irq=3D5 (gsi=3D5)
[    1.508642] xen: --> pirq=3D6 -> irq=3D6 (gsi=3D6)
[    1.508643] xen: --> pirq=3D7 -> irq=3D7 (gsi=3D7)
[    1.508644] xen: --> pirq=3D8 -> irq=3D8 (gsi=3D8)
[    1.508646] xen: --> pirq=3D9 -> irq=3D9 (gsi=3D9)
[    1.508647] xen: --> pirq=3D10 -> irq=3D10 (gsi=3D10)
[    1.508649] xen: --> pirq=3D11 -> irq=3D11 (gsi=3D11)
[    1.508650] xen: --> pirq=3D12 -> irq=3D12 (gsi=3D12)
[    1.508652] xen: --> pirq=3D13 -> irq=3D13 (gsi=3D13)
[    1.508653] xen: --> pirq=3D14 -> irq=3D14 (gsi=3D14)
[    1.508654] xen: --> pirq=3D15 -> irq=3D15 (gsi=3D15)
[    1.508913] printk: console [hvc0] enabled
[    1.543395] ACPI BIOS Warning (bug): Incorrect checksum in table [BGRT]
- 0xC1, should be 0x4C (20230331/utcksum-58)
[    1.543432] clocksource: xen: mask: 0xffffffffffffffff max_cycles:
0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[    1.543434] Xen: using vcpuop timer interface
[    1.543436] installing Xen timer for CPU 0
[    1.543449] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:
0x2f7aa0787ee, max_idle_ns: 440795321263 ns
[    1.543452] Calibrating delay loop (skipped), value calculated using
timer frequency.. 6587.71 BogoMIPS (lpj=3D3293856)
[    1.543485] Spectre V2 : Mitigation: Retpolines
[    1.543487] Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEXIT
[    1.543489] Speculative Store Bypass: Vulnerable
[    1.543505] x86/fpu: Enabled xstate features 0xe7, context size is 2432
bytes, using 'compacted' format.
[    1.556516] cpu 0 spinlock event irq 57
[    1.556526] VPMU disabled by hypervisor.
[    1.556812] Performance Events: PMU not available due to virtualization,
using software events only.
[    1.559433] NMI watchdog: Perf NMI watchdog permanently disabled
[    1.559727] installing Xen timer for CPU 1
[    1.559965] installing Xen timer for CPU 2
[    1.560180] installing Xen timer for CPU 3
[    1.560396] installing Xen timer for CPU 4
[    1.560599] installing Xen timer for CPU 5
[    1.560813] installing Xen timer for CPU 6
[    1.561021] installing Xen timer for CPU 7
[    1.561230] installing Xen timer for CPU 8
[    1.561420] installing Xen timer for CPU 9
[    1.561597] installing Xen timer for CPU 10
[    1.561783] installing Xen timer for CPU 11
[    1.561980] installing Xen timer for CPU 12
[    1.562155] installing Xen timer for CPU 13
[    1.562327] installing Xen timer for CPU 14
[    1.562503] installing Xen timer for CPU 15
[    1.562551] cpu 1 spinlock event irq 137
[    1.562551] cpu 2 spinlock event irq 138
[    1.562551] cpu 3 spinlock event irq 139
[    1.562551] cpu 4 spinlock event irq 140
[    1.562551] cpu 5 spinlock event irq 141
[    1.562551] cpu 6 spinlock event irq 142
[    1.562551] cpu 7 spinlock event irq 143
[    1.562551] cpu 8 spinlock event irq 144
[    1.563499] cpu 9 spinlock event irq 145
[    1.563502] cpu 10 spinlock event irq 146
[    1.563502] cpu 11 spinlock event irq 147
[    1.563502] cpu 12 spinlock event irq 148
[    1.563502] cpu 13 spinlock event irq 149
[    1.563502] cpu 14 spinlock event irq 150
[    1.563502] cpu 15 spinlock event irq 151
[    1.573211] PM: RTC time: 09:08:20, date: 2023-12-03
[    1.573947] xen:grant_table: Grant tables using version 1 layout
[    1.573958] Grant table initialized
[    1.574502] audit: type=3D2000 audit(1701594499.512:1): state=3Dinitiali=
zed
audit_enabled=3D0 res=3D1
[    1.606054] xen: registering gsi 9 triggering 0 polarity 1
[    1.697597] xen: registering gsi 8 triggering 1 polarity 0
[    1.697705] xen: registering gsi 13 triggering 1 polarity 0
[    1.700360] xen: registering gsi 7 triggering 0 polarity 1
[    1.700819] xen: registering gsi 10 triggering 1 polarity 0
[    1.701110] xen: registering gsi 6 triggering 1 polarity 0
[    1.701690] xen: registering gsi 50 triggering 0 polarity 1
[    1.701706] xen: --> pirq=3D50 -> irq=3D50 (gsi=3D50)
[    1.701757] xen: registering gsi 51 triggering 0 polarity 1
[    1.701768] xen: --> pirq=3D51 -> irq=3D51 (gsi=3D51)
[    1.701810] xen: registering gsi 52 triggering 0 polarity 1
[    1.701818] xen: --> pirq=3D52 -> irq=3D52 (gsi=3D52)
[    1.701860] xen: registering gsi 53 triggering 0 polarity 1
[    1.701869] xen: --> pirq=3D53 -> irq=3D53 (gsi=3D53)
[    1.707071] xen:balloon: Initialising balloon driver
[    1.743187] resource: Expanded resource Reserved due to conflict with
PCI Bus 0000:00
[    1.743524] sysfb: VRAM smaller than advertised
[    1.759417] hugetlbfs: disabling because there are no supported hugepage
sizes
[    1.765826] xen: registering gsi 1 triggering 1 polarity 0
[    1.771944] PM-Timer failed consistency check  (0xffffff) - aborting.
[    1.775360] xen: registering gsi 40 triggering 0 polarity 1
[    1.775387] xen: --> pirq=3D40 -> irq=3D40 (gsi=3D40)
[    1.775481] xen: registering gsi 37 triggering 0 polarity 1
[    1.775494] xen: --> pirq=3D37 -> irq=3D37 (gsi=3D37)
[    1.775841] xen: registering gsi 38 triggering 0 polarity 1
[    1.775855] xen: --> pirq=3D38 -> irq=3D38 (gsi=3D38)
[    1.776235] xen: registering gsi 40 triggering 0 polarity 1
[    1.776238] Already setup the GSI :40
[    1.776281] xen: registering gsi 46 triggering 0 polarity 1
[    1.776293] xen: --> pirq=3D46 -> irq=3D46 (gsi=3D46)
[    1.776646] xen: registering gsi 47 triggering 0 polarity 1
[    1.776656] xen: --> pirq=3D47 -> irq=3D47 (gsi=3D47)
[    1.777614] clocksource: tsc: mask: 0xffffffffffffffff max_cycles:
0x2f7aa0787ee, max_idle_ns: 440795321263 ns
[    1.777677] clocksource: Switched to clocksource tsc
[    2.061207] pcieport 0000:00:02.2: PME: Signaling with IRQ 162
[    2.061369] pcieport 0000:00:02.4: PME: Signaling with IRQ 163
[    2.061604] pcieport 0000:00:03.1: PME: Signaling with IRQ 164
[    2.062263] pcieport 0000:00:04.1: PME: Signaling with IRQ 165
[    2.062813] pcieport 0000:00:08.1: PME: Signaling with IRQ 166
[    2.062953] xen: registering gsi 40 triggering 0 polarity 1
[    2.062967] Already setup the GSI :40
[    2.063063] pcieport 0000:00:08.2: PME: Signaling with IRQ 167
[    2.063213] pcieport 0000:00:08.3: PME: Signaling with IRQ 168
[    2.063345] efifb: probing for efifb
[    2.063985] efifb: No BGRT, not showing boot graphics
[    2.063986] efifb: framebuffer at 0x8800000000, using 13536k, total
13536k
[    2.063988] efifb: mode is 2256x1504x32, linelength=3D9216, pages=3D1
[    2.063989] efifb: scrolling: redraw
[    2.063990] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
[    2.064032] fbcon: Deferring console take-over
[    2.064033] fb0: EFI VGA frame buffer device
[    2.065750] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
[    2.065860] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
[    2.066008] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
[    2.066140] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
[    2.066370] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
[    2.066586] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
[    2.066818] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
[    2.066923] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
[    2.067082] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
[    2.067170] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
[    2.067296] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
[    2.067473] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
[    2.067669] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
[    2.067973] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
[    2.068215] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
[    2.068522] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
[    2.068923] ACPI: thermal: Thermal Zone [TZ00] (26 C)
[    2.069085] ACPI: thermal: Thermal Zone [TZ01] (30 C)
[    2.069242] ACPI: thermal: Thermal Zone [TZ02] (28 C)
[    2.069402] ACPI: thermal: Thermal Zone [TZ03] (46 C)
[    2.072038] hpet_acpi_add: no address or irqs in _CRS
[    2.092763] xen: registering gsi 37 triggering 0 polarity 1
[    2.092769] Already setup the GSI :37
[    2.101751] xen: registering gsi 38 triggering 0 polarity 1
[    2.101755] Already setup the GSI :38
[    2.105493] xen: registering gsi 46 triggering 0 polarity 1
[    2.105496] Already setup the GSI :46
[    2.109521] xen: registering gsi 47 triggering 0 polarity 1
[    2.109525] Already setup the GSI :47
[    2.116721] rtc_cmos 00:01: setting system clock to 2023-12-03T09:08:21
UTC (1701594501)
[    2.117134] amd_pstate: driver load is disabled, boot with specific mode
to enable this
[    2.130271] input: AT Translated Set 2 keyboard as
/devices/platform/i8042/serio0/input/input2
[    2.138905] sched_clock: Marking stable (2104001974,
34790120)->(2142780210, -3988116)
[    2.464598] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
[    2.465229] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
[    2.465462] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
[    2.465694] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
[    2.466003] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
[    2.466189] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
[    2.466387] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
[    2.466584] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
[    3.790268]     placeholder
[    3.809946] usb 1-2: New USB device found, idVendor=3D1e7d,
idProduct=3D2e22, bcdDevice=3D 1.01
[    3.809950] usb 1-2: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D0
[    3.809952] usb 1-2: Product: ROCCAT Kone XTD
[    3.809953] usb 1-2: Manufacturer: ROCCAT
[    3.826019] systemd[1]: Detected virtualization vm-other.
[    3.941883] usb 1-4: new full-speed USB device number 3 using xhci_hcd
[    4.099853] usb 1-4: New USB device found, idVendor=3D27c6,
idProduct=3D609c, bcdDevice=3D 1.00
[    4.099862] usb 1-4: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[    4.099866] usb 1-4: Product: Goodix USB2.0 MISC
[    4.099869] usb 1-4: Manufacturer: Goodix Technology Co., Ltd.
[    4.099873] usb 1-4: SerialNumber: UIDD5F04A7B_XXXX_MOC_B0
[    4.193119] systemd[1]: Finished kmod-static-nodes.service - Create List
of Static Device Nodes.
[    4.221808] usb 1-5: new high-speed USB device number 4 using xhci_hcd
[    4.936497] xen: registering gsi 36 triggering 0 polarity 1
[    4.936543] xen: --> pirq=3D36 -> irq=3D36 (gsi=3D36)
[    4.948276] ccp 0000:c1:00.2: tee: ring init command failed (0x00000005)
[    4.948285] ccp 0000:c1:00.2: tee: failed to init ring buffer
[    4.948287] ccp 0000:c1:00.2: tee initialization failed
[    4.948302] ccp 0000:c1:00.2: psp initialization failed
[    5.018031] fbcon: Taking over console
[    5.018181] Console: switching to colour frame buffer device 282x94
[   10.215870] i2c_hid_acpi i2c-FRMW0005:00: failed to reset device: -61
[   10.215917] i2c_hid_acpi i2c-PIXA3854:00: failed to reset device: -61
[   10.215950] i2c_hid_acpi i2c-FRMW0004:00: failed to reset device: -61
[   10.220217] i2c_hid_acpi i2c-FRMW0004:00: failed to change power setting=
.
[   16.359856] i2c_hid_acpi i2c-PIXA3854:00: failed to reset device: -61
[   16.359856] i2c_hid_acpi i2c-FRMW0004:00: failed to reset device: -61
[   16.359871] i2c_hid_acpi i2c-FRMW0005:00: failed to reset device: -61
[   22.503879] i2c_hid_acpi i2c-FRMW0005:00: failed to reset device: -61
[   22.503915] i2c_hid_acpi i2c-PIXA3854:00: failed to reset device: -61
[   22.503921] i2c_hid_acpi i2c-FRMW0004:00: failed to reset device: -61
[   28.647874] i2c_hid_acpi i2c-FRMW0005:00: failed to reset device: -61
[   28.647879] i2c_hid_acpi i2c-PIXA3854:00: failed to reset device: -61
[   28.647910] i2c_hid_acpi i2c-FRMW0004:00: failed to reset device: -61
[   29.671873] i2c_hid_acpi i2c-FRMW0005:00: can't add hid device: -61
[   29.671874] i2c_hid_acpi i2c-FRMW0004:00: can't add hid device: -61
[   29.671874] i2c_hid_acpi i2c-PIXA3854:00: can't add hid device: -61
[   29.686460] i2c_hid_acpi: probe of i2c-FRMW0005:00 failed with error -61
[   29.686492] i2c_hid_acpi: probe of i2c-PIXA3854:00 failed with error -61
[   29.686683] i2c_hid_acpi: probe of i2c-FRMW0004:00 failed with error -61

Thanks
S=C3=A9bastien

--000000000000569c7d060b98038f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>=C2=A0Trying to get t=
he Framework Laptop 13 AMD to work with QubesOS I hit the following Xen iss=
ue :</div><div><br></div><div>Xen version : 4.17.2</div><div>Kernel : 6.5.1=
2-300.fc39.x86_64</div><div>CPU=C2=A0 model name	: AMD Ryzen 7 7840U w/ Rad=
eon =C2=A0780M Graphics</div><div><br></div><div>The touchpad is not workin=
g (not detected by evtest) because ( see below for=C2=A0XXXXXXX values) : <=
br></div><div>[ =C2=A0 10.215870] i2c_hid_acpi i2c-FRMXXXXXXX: failed to re=
set device: -61</div><div><br></div><div>which is maybe related to the prev=
ious messages :</div><div><br></div><div>[ =C2=A0 =C2=A02.065750] [Firmware=
 Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)</div><div>...<br></=
div><div>[ =C2=A0 =C2=A02.464598] amd_gpio AMDI0030:00: failed to enable wa=
ke-up interrupt</div><div><br></div><div>QubesOS issue : <a href=3D"https:/=
/github.com/QubesOS/qubes-issues/issues/8734">https://github.com/QubesOS/qu=
bes-issues/issues/8734</a></div><div><br></div><div>Possibly related issues=
 :=C2=A0=C2=A0</div><div>=C2=A0=C2=A0</div><div>=C2=A0<a href=3D"https://bu=
gs.launchpad.net/ubuntu/+source/linux/+bug/1971597">https://bugs.launchpad.=
net/ubuntu/+source/linux/+bug/1971597</a></div><div><br></div><div>Here&#39=
;s the complete diff of dmesg with and without xen loaded up to the failed =
i2c_hid_acpi init :</div><div><br></div><div>[ =C2=A0 =C2=A00.000000] Comma=
nd line: placeholder root=3DUUID=3D71b1dc59-ea00-484c-b5e4-ee77ede771db ro =
rhgb quiet<br>[ =C2=A0 =C2=A00.000000] Released 0 page(s)<br>[ =C2=A0 =C2=
=A00.000000] NX (Execute Disable) protection: active<br>[ =C2=A0 =C2=A00.00=
0000] efi: ACPI=3D0x5affe000 ACPI 2.0=3D0x5affe014 TPMFinalLog=3D0x5af3f000=
 SMBIOS=3D0x51677000 SMBIOS 3.0=3D0x51674000 (MEMATTR=3D0x4b719018 unusable=
) ESRT=3D0x5af9b018 MOKvar=3D0x5187c000 <br>[ =C2=A0 =C2=A00.000000] Hyperv=
isor detected: Xen PV<br>[ =C2=A0 =C2=A00.026644] tsc: Detected 3294.105 MH=
z processor<br>[ =C2=A0 =C2=A00.026645] tsc: Detected 3293.856 MHz TSC<br>[=
 =C2=A0 =C2=A00.026732] MTRR map: 3 entries (0 fixed + 3 variable; max 16),=
 built from 8 variable MTRRs<br>[ =C2=A0 =C2=A00.026733] MTRRs set to read-=
only<br>[ =C2=A0 =C2=A00.026735] x86/PAT: Configuration [0-7]: WB =C2=A0WT =
=C2=A0UC- UC =C2=A0WC =C2=A0WP =C2=A0UC =C2=A0UC =C2=A0<br>[ =C2=A0 =C2=A00=
.026753] esrt: Reserving ESRT space from 0x000000005af9b018 to 0x000000005a=
f9b050.<br>[ =C2=A0 =C2=A01.042047] ACPI: BGRT 0x000000005AFB8000 000038 (v=
01 INSYDE EDK2 =C2=A0 =C2=A0 00000002 ACPI 00040000)<br>[ =C2=A0 =C2=A01.04=
2095] Setting APIC routing to Xen PV.<br>[ =C2=A0 =C2=A01.042116] NUMA turn=
ed off<br>[ =C2=A0 =C2=A01.101730] On node 0, zone DMA: 128 pages in unavai=
lable ranges<br>[ =C2=A0 =C2=A01.136828] p2m virtual area at (____ptrval___=
_), size is 40000000<br>[ =C2=A0 =C2=A01.401457] Remapped 728641 page(s)<br=
>[ =C2=A0 =C2=A01.402499] Booting kernel on Xen<br>[ =C2=A0 =C2=A01.402500]=
 Xen version: 4.17.2 (preserve-AD)<br>[ =C2=A0 =C2=A01.406607] xen: PV spin=
locks enabled<br>[ =C2=A0 =C2=A01.406609] PV qspinlock hash table entries: =
256 (order: 0, 4096 bytes, linear)<br>[ =C2=A0 =C2=A01.406610] Kernel comma=
nd line: placeholder root=3DUUID=3D71b1dc59-ea00-484c-b5e4-ee77ede771db ro =
rhgb quiet<br>[ =C2=A0 =C2=A01.406661] Unknown kernel command line paramete=
rs &quot;placeholder rhgb&quot;, will be passed to user space.<br>[ =C2=A0 =
=C2=A01.406867] random: crng init done<br>[ =C2=A0 =C2=A01.411447] Built 1 =
zonelists, mobility grouping on.=C2=A0 Total pages: 15403418<br>[ =C2=A0 =
=C2=A01.497107] Memory: 60184272K/62591736K available (18432K kernel code, =
3267K rwdata, 14476K rodata, 4532K init, 17364K bss, 2407212K reserved, 0K =
cma-reserved)<br>[ =C2=A0 =C2=A01.508627] xen:events: Using FIFO-based ABI<=
br>[ =C2=A0 =C2=A01.508634] xen: --&gt; pirq=3D1 -&gt; irq=3D1 (gsi=3D1)<br=
>[ =C2=A0 =C2=A01.508636] xen: --&gt; pirq=3D2 -&gt; irq=3D2 (gsi=3D2)<br>[=
 =C2=A0 =C2=A01.508638] xen: --&gt; pirq=3D3 -&gt; irq=3D3 (gsi=3D3)<br>[ =
=C2=A0 =C2=A01.508639] xen: --&gt; pirq=3D4 -&gt; irq=3D4 (gsi=3D4)<br>[ =
=C2=A0 =C2=A01.508640] xen: --&gt; pirq=3D5 -&gt; irq=3D5 (gsi=3D5)<br>[ =
=C2=A0 =C2=A01.508642] xen: --&gt; pirq=3D6 -&gt; irq=3D6 (gsi=3D6)<br>[ =
=C2=A0 =C2=A01.508643] xen: --&gt; pirq=3D7 -&gt; irq=3D7 (gsi=3D7)<br>[ =
=C2=A0 =C2=A01.508644] xen: --&gt; pirq=3D8 -&gt; irq=3D8 (gsi=3D8)<br>[ =
=C2=A0 =C2=A01.508646] xen: --&gt; pirq=3D9 -&gt; irq=3D9 (gsi=3D9)<br>[ =
=C2=A0 =C2=A01.508647] xen: --&gt; pirq=3D10 -&gt; irq=3D10 (gsi=3D10)<br>[=
 =C2=A0 =C2=A01.508649] xen: --&gt; pirq=3D11 -&gt; irq=3D11 (gsi=3D11)<br>=
[ =C2=A0 =C2=A01.508650] xen: --&gt; pirq=3D12 -&gt; irq=3D12 (gsi=3D12)<br=
>[ =C2=A0 =C2=A01.508652] xen: --&gt; pirq=3D13 -&gt; irq=3D13 (gsi=3D13)<b=
r>[ =C2=A0 =C2=A01.508653] xen: --&gt; pirq=3D14 -&gt; irq=3D14 (gsi=3D14)<=
br>[ =C2=A0 =C2=A01.508654] xen: --&gt; pirq=3D15 -&gt; irq=3D15 (gsi=3D15)=
<br>[ =C2=A0 =C2=A01.508913] printk: console [hvc0] enabled<br>[ =C2=A0 =C2=
=A01.543395] ACPI BIOS Warning (bug): Incorrect checksum in table [BGRT] - =
0xC1, should be 0x4C (20230331/utcksum-58)<br>[ =C2=A0 =C2=A01.543432] cloc=
ksource: xen: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_=
ns: 881590591483 ns<br>[ =C2=A0 =C2=A01.543434] Xen: using vcpuop timer int=
erface<br>[ =C2=A0 =C2=A01.543436] installing Xen timer for CPU 0<br>[ =C2=
=A0 =C2=A01.543449] clocksource: tsc-early: mask: 0xffffffffffffffff max_cy=
cles: 0x2f7aa0787ee, max_idle_ns: 440795321263 ns<br>[ =C2=A0 =C2=A01.54345=
2] Calibrating delay loop (skipped), value calculated using timer frequency=
.. 6587.71 BogoMIPS (lpj=3D3293856)<br>[ =C2=A0 =C2=A01.543485] Spectre V2 =
: Mitigation: Retpolines<br>[ =C2=A0 =C2=A01.543487] Spectre V2 : Spectre v=
2 / SpectreRSB : Filling RSB on VMEXIT<br>[ =C2=A0 =C2=A01.543489] Speculat=
ive Store Bypass: Vulnerable<br>[ =C2=A0 =C2=A01.543505] x86/fpu: Enabled x=
state features 0xe7, context size is 2432 bytes, using &#39;compacted&#39; =
format.<br>[ =C2=A0 =C2=A01.556516] cpu 0 spinlock event irq 57<br>[ =C2=A0=
 =C2=A01.556526] VPMU disabled by hypervisor.<br>[ =C2=A0 =C2=A01.556812] P=
erformance Events: PMU not available due to virtualization, using software =
events only.<br>[ =C2=A0 =C2=A01.559433] NMI watchdog: Perf NMI watchdog pe=
rmanently disabled<br>[ =C2=A0 =C2=A01.559727] installing Xen timer for CPU=
 1<br>[ =C2=A0 =C2=A01.559965] installing Xen timer for CPU 2<br>[ =C2=A0 =
=C2=A01.560180] installing Xen timer for CPU 3<br>[ =C2=A0 =C2=A01.560396] =
installing Xen timer for CPU 4<br>[ =C2=A0 =C2=A01.560599] installing Xen t=
imer for CPU 5<br>[ =C2=A0 =C2=A01.560813] installing Xen timer for CPU 6<b=
r>[ =C2=A0 =C2=A01.561021] installing Xen timer for CPU 7<br>[ =C2=A0 =C2=
=A01.561230] installing Xen timer for CPU 8<br>[ =C2=A0 =C2=A01.561420] ins=
talling Xen timer for CPU 9<br>[ =C2=A0 =C2=A01.561597] installing Xen time=
r for CPU 10<br>[ =C2=A0 =C2=A01.561783] installing Xen timer for CPU 11<br=
>[ =C2=A0 =C2=A01.561980] installing Xen timer for CPU 12<br>[ =C2=A0 =C2=
=A01.562155] installing Xen timer for CPU 13<br>[ =C2=A0 =C2=A01.562327] in=
stalling Xen timer for CPU 14<br>[ =C2=A0 =C2=A01.562503] installing Xen ti=
mer for CPU 15<br>[ =C2=A0 =C2=A01.562551] cpu 1 spinlock event irq 137<br>=
[ =C2=A0 =C2=A01.562551] cpu 2 spinlock event irq 138<br>[ =C2=A0 =C2=A01.5=
62551] cpu 3 spinlock event irq 139<br>[ =C2=A0 =C2=A01.562551] cpu 4 spinl=
ock event irq 140<br>[ =C2=A0 =C2=A01.562551] cpu 5 spinlock event irq 141<=
br>[ =C2=A0 =C2=A01.562551] cpu 6 spinlock event irq 142<br>[ =C2=A0 =C2=A0=
1.562551] cpu 7 spinlock event irq 143<br>[ =C2=A0 =C2=A01.562551] cpu 8 sp=
inlock event irq 144<br>[ =C2=A0 =C2=A01.563499] cpu 9 spinlock event irq 1=
45<br>[ =C2=A0 =C2=A01.563502] cpu 10 spinlock event irq 146<br>[ =C2=A0 =
=C2=A01.563502] cpu 11 spinlock event irq 147<br>[ =C2=A0 =C2=A01.563502] c=
pu 12 spinlock event irq 148<br>[ =C2=A0 =C2=A01.563502] cpu 13 spinlock ev=
ent irq 149<br>[ =C2=A0 =C2=A01.563502] cpu 14 spinlock event irq 150<br>[ =
=C2=A0 =C2=A01.563502] cpu 15 spinlock event irq 151<br>[ =C2=A0 =C2=A01.57=
3211] PM: RTC time: 09:08:20, date: 2023-12-03<br>[ =C2=A0 =C2=A01.573947] =
xen:grant_table: Grant tables using version 1 layout<br>[ =C2=A0 =C2=A01.57=
3958] Grant table initialized<br>[ =C2=A0 =C2=A01.574502] audit: type=3D200=
0 audit(1701594499.512:1): state=3Dinitialized audit_enabled=3D0 res=3D1<br=
>[ =C2=A0 =C2=A01.606054] xen: registering gsi 9 triggering 0 polarity 1<br=
>[ =C2=A0 =C2=A01.697597] xen: registering gsi 8 triggering 1 polarity 0<br=
>[ =C2=A0 =C2=A01.697705] xen: registering gsi 13 triggering 1 polarity 0<b=
r>[ =C2=A0 =C2=A01.700360] xen: registering gsi 7 triggering 0 polarity 1<b=
r>[ =C2=A0 =C2=A01.700819] xen: registering gsi 10 triggering 1 polarity 0<=
br>[ =C2=A0 =C2=A01.701110] xen: registering gsi 6 triggering 1 polarity 0<=
br>[ =C2=A0 =C2=A01.701690] xen: registering gsi 50 triggering 0 polarity 1=
<br>[ =C2=A0 =C2=A01.701706] xen: --&gt; pirq=3D50 -&gt; irq=3D50 (gsi=3D50=
)<br>[ =C2=A0 =C2=A01.701757] xen: registering gsi 51 triggering 0 polarity=
 1<br>[ =C2=A0 =C2=A01.701768] xen: --&gt; pirq=3D51 -&gt; irq=3D51 (gsi=3D=
51)<br>[ =C2=A0 =C2=A01.701810] xen: registering gsi 52 triggering 0 polari=
ty 1<br>[ =C2=A0 =C2=A01.701818] xen: --&gt; pirq=3D52 -&gt; irq=3D52 (gsi=
=3D52)<br>[ =C2=A0 =C2=A01.701860] xen: registering gsi 53 triggering 0 pol=
arity 1<br>[ =C2=A0 =C2=A01.701869] xen: --&gt; pirq=3D53 -&gt; irq=3D53 (g=
si=3D53)<br>[ =C2=A0 =C2=A01.707071] xen:balloon: Initialising balloon driv=
er<br>[ =C2=A0 =C2=A01.743187] resource: Expanded resource Reserved due to =
conflict with PCI Bus 0000:00<br>[ =C2=A0 =C2=A01.743524] sysfb: VRAM small=
er than advertised<br>[ =C2=A0 =C2=A01.759417] hugetlbfs: disabling because=
 there are no supported hugepage sizes<br>[ =C2=A0 =C2=A01.765826] xen: reg=
istering gsi 1 triggering 1 polarity 0<br>[ =C2=A0 =C2=A01.771944] PM-Timer=
 failed consistency check =C2=A0(0xffffff) - aborting.<br>[ =C2=A0 =C2=A01.=
775360] xen: registering gsi 40 triggering 0 polarity 1<br>[ =C2=A0 =C2=A01=
.775387] xen: --&gt; pirq=3D40 -&gt; irq=3D40 (gsi=3D40)<br>[ =C2=A0 =C2=A0=
1.775481] xen: registering gsi 37 triggering 0 polarity 1<br>[ =C2=A0 =C2=
=A01.775494] xen: --&gt; pirq=3D37 -&gt; irq=3D37 (gsi=3D37)<br>[ =C2=A0 =
=C2=A01.775841] xen: registering gsi 38 triggering 0 polarity 1<br>[ =C2=A0=
 =C2=A01.775855] xen: --&gt; pirq=3D38 -&gt; irq=3D38 (gsi=3D38)<br>[ =C2=
=A0 =C2=A01.776235] xen: registering gsi 40 triggering 0 polarity 1<br>[ =
=C2=A0 =C2=A01.776238] Already setup the GSI :40<br>[ =C2=A0 =C2=A01.776281=
] xen: registering gsi 46 triggering 0 polarity 1<br>[ =C2=A0 =C2=A01.77629=
3] xen: --&gt; pirq=3D46 -&gt; irq=3D46 (gsi=3D46)<br>[ =C2=A0 =C2=A01.7766=
46] xen: registering gsi 47 triggering 0 polarity 1<br>[ =C2=A0 =C2=A01.776=
656] xen: --&gt; pirq=3D47 -&gt; irq=3D47 (gsi=3D47)<br>[ =C2=A0 =C2=A01.77=
7614] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2f7aa0787ee,=
 max_idle_ns: 440795321263 ns<br>[ =C2=A0 =C2=A01.777677] clocksource: Swit=
ched to clocksource tsc<br>[ =C2=A0 =C2=A02.061207] pcieport 0000:00:02.2: =
PME: Signaling with IRQ 162<br>[ =C2=A0 =C2=A02.061369] pcieport 0000:00:02=
.4: PME: Signaling with IRQ 163<br>[ =C2=A0 =C2=A02.061604] pcieport 0000:0=
0:03.1: PME: Signaling with IRQ 164<br>[ =C2=A0 =C2=A02.062263] pcieport 00=
00:00:04.1: PME: Signaling with IRQ 165<br>[ =C2=A0 =C2=A02.062813] pciepor=
t 0000:00:08.1: PME: Signaling with IRQ 166<br>[ =C2=A0 =C2=A02.062953] xen=
: registering gsi 40 triggering 0 polarity 1<br>[ =C2=A0 =C2=A02.062967] Al=
ready setup the GSI :40<br>[ =C2=A0 =C2=A02.063063] pcieport 0000:00:08.2: =
PME: Signaling with IRQ 167<br>[ =C2=A0 =C2=A02.063213] pcieport 0000:00:08=
.3: PME: Signaling with IRQ 168<br>[ =C2=A0 =C2=A02.063345] efifb: probing =
for efifb<br>[ =C2=A0 =C2=A02.063985] efifb: No BGRT, not showing boot grap=
hics<br>[ =C2=A0 =C2=A02.063986] efifb: framebuffer at 0x8800000000, using =
13536k, total 13536k<br>[ =C2=A0 =C2=A02.063988] efifb: mode is 2256x1504x3=
2, linelength=3D9216, pages=3D1<br>[ =C2=A0 =C2=A02.063989] efifb: scrollin=
g: redraw<br>[ =C2=A0 =C2=A02.063990] efifb: Truecolor: size=3D8:8:8:8, shi=
ft=3D24:16:8:0<br>[ =C2=A0 =C2=A02.064032] fbcon: Deferring console take-ov=
er<br>[ =C2=A0 =C2=A02.064033] fb0: EFI VGA frame buffer device<br>[ =C2=A0=
 =C2=A02.065750] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW=
 (0x0)<br>[ =C2=A0 =C2=A02.065860] [Firmware Bug]: ACPI MWAIT C-state 0x0 n=
ot supported by HW (0x0)<br>[ =C2=A0 =C2=A02.066008] [Firmware Bug]: ACPI M=
WAIT C-state 0x0 not supported by HW (0x0)<br>[ =C2=A0 =C2=A02.066140] [Fir=
mware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)<br>[ =C2=A0 =
=C2=A02.066370] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW =
(0x0)<br>[ =C2=A0 =C2=A02.066586] [Firmware Bug]: ACPI MWAIT C-state 0x0 no=
t supported by HW (0x0)<br>[ =C2=A0 =C2=A02.066818] [Firmware Bug]: ACPI MW=
AIT C-state 0x0 not supported by HW (0x0)<br>[ =C2=A0 =C2=A02.066923] [Firm=
ware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)<br>[ =C2=A0 =C2=
=A02.067082] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x=
0)<br>[ =C2=A0 =C2=A02.067170] [Firmware Bug]: ACPI MWAIT C-state 0x0 not s=
upported by HW (0x0)<br>[ =C2=A0 =C2=A02.067296] [Firmware Bug]: ACPI MWAIT=
 C-state 0x0 not supported by HW (0x0)<br>[ =C2=A0 =C2=A02.067473] [Firmwar=
e Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)<br>[ =C2=A0 =C2=A0=
2.067669] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)<=
br>[ =C2=A0 =C2=A02.067973] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supp=
orted by HW (0x0)<br>[ =C2=A0 =C2=A02.068215] [Firmware Bug]: ACPI MWAIT C-=
state 0x0 not supported by HW (0x0)<br>[ =C2=A0 =C2=A02.068522] [Firmware B=
ug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)<br>[ =C2=A0 =C2=A02.0=
68923] ACPI: thermal: Thermal Zone [TZ00] (26 C)<br>[ =C2=A0 =C2=A02.069085=
] ACPI: thermal: Thermal Zone [TZ01] (30 C)<br>[ =C2=A0 =C2=A02.069242] ACP=
I: thermal: Thermal Zone [TZ02] (28 C)<br>[ =C2=A0 =C2=A02.069402] ACPI: th=
ermal: Thermal Zone [TZ03] (46 C)<br>[ =C2=A0 =C2=A02.072038] hpet_acpi_add=
: no address or irqs in _CRS<br>[ =C2=A0 =C2=A02.092763] xen: registering g=
si 37 triggering 0 polarity 1<br>[ =C2=A0 =C2=A02.092769] Already setup the=
 GSI :37<br>[ =C2=A0 =C2=A02.101751] xen: registering gsi 38 triggering 0 p=
olarity 1<br>[ =C2=A0 =C2=A02.101755] Already setup the GSI :38<br>[ =C2=A0=
 =C2=A02.105493] xen: registering gsi 46 triggering 0 polarity 1<br>[ =C2=
=A0 =C2=A02.105496] Already setup the GSI :46<br>[ =C2=A0 =C2=A02.109521] x=
en: registering gsi 47 triggering 0 polarity 1<br>[ =C2=A0 =C2=A02.109525] =
Already setup the GSI :47<br>[ =C2=A0 =C2=A02.116721] rtc_cmos 00:01: setti=
ng system clock to 2023-12-03T09:08:21 UTC (1701594501)<br>[ =C2=A0 =C2=A02=
.117134] amd_pstate: driver load is disabled, boot with specific mode to en=
able this<br>[ =C2=A0 =C2=A02.130271] input: AT Translated Set 2 keyboard a=
s /devices/platform/i8042/serio0/input/input2<br>[ =C2=A0 =C2=A02.138905] s=
ched_clock: Marking stable (2104001974, 34790120)-&gt;(2142780210, -3988116=
)<br>[ =C2=A0 =C2=A02.464598] amd_gpio AMDI0030:00: failed to enable wake-u=
p interrupt<br>[ =C2=A0 =C2=A02.465229] amd_gpio AMDI0030:00: failed to ena=
ble wake-up interrupt<br>[ =C2=A0 =C2=A02.465462] amd_gpio AMDI0030:00: fai=
led to enable wake-up interrupt<br>[ =C2=A0 =C2=A02.465694] amd_gpio AMDI00=
30:00: failed to enable wake-up interrupt<br>[ =C2=A0 =C2=A02.466003] amd_g=
pio AMDI0030:00: failed to enable wake-up interrupt<br>[ =C2=A0 =C2=A02.466=
189] amd_gpio AMDI0030:00: failed to enable wake-up interrupt<br>[ =C2=A0 =
=C2=A02.466387] amd_gpio AMDI0030:00: failed to enable wake-up interrupt<br=
>[ =C2=A0 =C2=A02.466584] amd_gpio AMDI0030:00: failed to enable wake-up in=
terrupt<br>[ =C2=A0 =C2=A03.790268] =C2=A0 =C2=A0 placeholder<br>[ =C2=A0 =
=C2=A03.809946] usb 1-2: New USB device found, idVendor=3D1e7d, idProduct=
=3D2e22, bcdDevice=3D 1.01<br>[ =C2=A0 =C2=A03.809950] usb 1-2: New USB dev=
ice strings: Mfr=3D1, Product=3D2, SerialNumber=3D0<br>[ =C2=A0 =C2=A03.809=
952] usb 1-2: Product: ROCCAT Kone XTD<br>[ =C2=A0 =C2=A03.809953] usb 1-2:=
 Manufacturer: ROCCAT<br>[ =C2=A0 =C2=A03.826019] systemd[1]: Detected virt=
ualization vm-other.<br>[ =C2=A0 =C2=A03.941883] usb 1-4: new full-speed US=
B device number 3 using xhci_hcd<br>[ =C2=A0 =C2=A04.099853] usb 1-4: New U=
SB device found, idVendor=3D27c6, idProduct=3D609c, bcdDevice=3D 1.00<br>[ =
=C2=A0 =C2=A04.099862] usb 1-4: New USB device strings: Mfr=3D1, Product=3D=
2, SerialNumber=3D3<br>[ =C2=A0 =C2=A04.099866] usb 1-4: Product: Goodix US=
B2.0 MISC<br>[ =C2=A0 =C2=A04.099869] usb 1-4: Manufacturer: Goodix Technol=
ogy Co., Ltd.<br>[ =C2=A0 =C2=A04.099873] usb 1-4: SerialNumber: UIDD5F04A7=
B_XXXX_MOC_B0<br>[ =C2=A0 =C2=A04.193119] systemd[1]: Finished kmod-static-=
nodes.service - Create List of Static Device Nodes.<br>[ =C2=A0 =C2=A04.221=
808] usb 1-5: new high-speed USB device number 4 using xhci_hcd<br>[ =C2=A0=
 =C2=A04.936497] xen: registering gsi 36 triggering 0 polarity 1<br>[ =C2=
=A0 =C2=A04.936543] xen: --&gt; pirq=3D36 -&gt; irq=3D36 (gsi=3D36)<br>[ =
=C2=A0 =C2=A04.948276] ccp 0000:c1:00.2: tee: ring init command failed (0x0=
0000005)<br>[ =C2=A0 =C2=A04.948285] ccp 0000:c1:00.2: tee: failed to init =
ring buffer<br>[ =C2=A0 =C2=A04.948287] ccp 0000:c1:00.2: tee initializatio=
n failed<br>[ =C2=A0 =C2=A04.948302] ccp 0000:c1:00.2: psp initialization f=
ailed<br>[ =C2=A0 =C2=A05.018031] fbcon: Taking over console<br>[ =C2=A0 =
=C2=A05.018181] Console: switching to colour frame buffer device 282x94<br>=
[ =C2=A0 10.215870] i2c_hid_acpi i2c-FRMW0005:00: failed to reset device: -=
61<br>[ =C2=A0 10.215917] i2c_hid_acpi i2c-PIXA3854:00: failed to reset dev=
ice: -61<br>[ =C2=A0 10.215950] i2c_hid_acpi i2c-FRMW0004:00: failed to res=
et device: -61<br>[ =C2=A0 10.220217] i2c_hid_acpi i2c-FRMW0004:00: failed =
to change power setting.<br>[ =C2=A0 16.359856] i2c_hid_acpi i2c-PIXA3854:0=
0: failed to reset device: -61<br>[ =C2=A0 16.359856] i2c_hid_acpi i2c-FRMW=
0004:00: failed to reset device: -61<br>[ =C2=A0 16.359871] i2c_hid_acpi i2=
c-FRMW0005:00: failed to reset device: -61<br>[ =C2=A0 22.503879] i2c_hid_a=
cpi i2c-FRMW0005:00: failed to reset device: -61<br>[ =C2=A0 22.503915] i2c=
_hid_acpi i2c-PIXA3854:00: failed to reset device: -61<br>[ =C2=A0 22.50392=
1] i2c_hid_acpi i2c-FRMW0004:00: failed to reset device: -61<br>[ =C2=A0 28=
.647874] i2c_hid_acpi i2c-FRMW0005:00: failed to reset device: -61<br>[ =C2=
=A0 28.647879] i2c_hid_acpi i2c-PIXA3854:00: failed to reset device: -61<br=
>[ =C2=A0 28.647910] i2c_hid_acpi i2c-FRMW0004:00: failed to reset device: =
-61<br>[ =C2=A0 29.671873] i2c_hid_acpi i2c-FRMW0005:00: can&#39;t add hid =
device: -61<br>[ =C2=A0 29.671874] i2c_hid_acpi i2c-FRMW0004:00: can&#39;t =
add hid device: -61<br>[ =C2=A0 29.671874] i2c_hid_acpi i2c-PIXA3854:00: ca=
n&#39;t add hid device: -61<br>[ =C2=A0 29.686460] i2c_hid_acpi: probe of i=
2c-FRMW0005:00 failed with error -61<br>[ =C2=A0 29.686492] i2c_hid_acpi: p=
robe of i2c-PIXA3854:00 failed with error -61<br>[ =C2=A0 29.686683] i2c_hi=
d_acpi: probe of i2c-FRMW0004:00 failed with error -61</div><div><br></div>=
Thanks<br><div><div>S=C3=A9bastien<br></div></div></div>

--000000000000569c7d060b98038f--

