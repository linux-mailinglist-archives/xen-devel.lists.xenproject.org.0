Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBCC43D64C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 00:09:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217497.377583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfr6l-000671-Dx; Wed, 27 Oct 2021 22:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217497.377583; Wed, 27 Oct 2021 22:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfr6l-00065F-Ag; Wed, 27 Oct 2021 22:09:19 +0000
Received: by outflank-mailman (input) for mailman id 217497;
 Wed, 27 Oct 2021 22:09:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EkRf=PP=oderland.se=josef@srs-us1.protection.inumbo.net>)
 id 1mfr6k-000658-9u
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 22:09:18 +0000
Received: from office.oderland.com (unknown [91.201.60.5])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd4105ae-b34a-4ea5-8d56-5b94d6000d0a;
 Wed, 27 Oct 2021 22:09:16 +0000 (UTC)
Received: from [193.180.18.161] (port=35522 helo=[10.137.0.14])
 by office.oderland.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <josef@oderland.se>) id 1mfr6h-00A1Pm-Db
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 00:09:15 +0200
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
X-Inumbo-ID: bd4105ae-b34a-4ea5-8d56-5b94d6000d0a
Message-ID: <085f23da-3eed-d446-3b9b-ec655db1d3df@oderland.se>
Date: Thu, 28 Oct 2021 00:09:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:93.0) Gecko/20100101
 Thunderbird/93.0
Content-Language: en-US
To: xen-devel <xen-devel@lists.xenproject.org>
From: Josef Johansson <josef@oderland.se>
Subject: BUG: arch/x86/mm/tlb.c:522 CR3 is not what we think
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - office.oderland.com
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oderland.se
X-Get-Message-Sender-Via: office.oderland.com: authenticated_id: josjoh@oderland.se
X-Authenticated-Sender: office.oderland.com: josjoh@oderland.se

Hi,

During suspend my kernel (v5.15-rc7) tries to disable non-boot CPUs, as it
should. The first time the CPUs are offlined I get a BUG (it's WARN but it
should be BUG if it could). The second time I suspend I get a WARN.

I tried my very best to track what is happening during the first suspend
and my
diagnosis is that:

 * xen is hooking in xen_pv_cpu_disable, when it runs it
load_cr3(swapper_pg_dir)
 * when do_idle is called xen runs play_dead on it, which in turn runs
switch_mm(current->active_mm, &init_mm)
    with the assumption that  active_mm == init_mm.
 * since xen_pv_cpu_disable did not run leave_mm / switch_mm_irqs_off
before
load_cr3
    cr3 is now the disabled CPUs mm and not init_mm.

But obviously there needs to be something specific to my setup here
that's causing these issues. I'm running Ryzen 7 with 8 cores and smt=off.

I've tried to look around for a existing bug about this to no avail.

This bug is for PV (dom0).

My fear is this BUG later lead to problems inside amdgpu
which then effectively kills the screen output during third suspend.

A thought is that the first BUG leads to the next WARN.

Please advise on how I can debug this further
since I'm at my wits end here.

Regards
- Josef

# First suspend
printk: Suspending console(s) (use no_console_suspend to debug)
[drm] free PSP TMR buffer
PM: suspend devices took 0.428 seconds
ACPI: EC: interrupt blocked
ACPI: PM: Preparing to enter system sleep state S3
ACPI: EC: event blocked
ACPI: EC: EC stopped
ACPI: PM: Saving platform NVS memory
Disabling non-boot CPUs ...
------------[ cut here ]------------
WARNING: CPU: 1 PID: 0 at arch/x86/mm/tlb.c:522 switch_mm_irqs_off+0x3c5/0x400
Modules linked in: snd_seq_dummy snd_hrtimer snd_seq snd_seq_device snd_timer nf_tables nfnetlink vfat fat intel_rapl_msr think_lmi firmware_attributes_class wmi_bmof intel_rapl_common pcspkr uvcvideo videobuf2_vmalloc videobuf2_memops joydev videobuf2_v4l2 sp5100_tco k10temp videobuf2_common i2c_piix4 iwlwifi videodev mc cfg80211 thinkpad_acpi ipmi_devintf ucsi_acpi platform_profile typec_ucsi ledtrig_audio ipmi_msghandler r8169 rfkill typec snd wmi soundcore video i2c_scmi fuse xenfs ip_tables dm_thin_pool dm_persistent_data dm_bio_prison dm_crypt trusted asn1_encoder hid_multitouch amdgpu crct10dif_pclmul crc32_pclmul crc32c_intel gpu_sched i2c_algo_bit drm_ttm_helper ghash_clmulni_intel ttm serio_raw drm_kms_helper cec sdhci_pci cqhci sdhci xhci_pci drm xhci_pci_renesas nvme xhci_hcd ehci_pci mmc_core ehci_hcd nvme_core xen_acpi_processor xen_privcmd xen_pciback xen_blkback xen_gntalloc xen_gntdev xen_evtchn uinput
CPU: 1 PID: 0 Comm: swapper/1 Tainted: G        W        --------- ---  5.15.0-0.rc7.0.fc32.qubes.x86_64 #1
Hardware name: LENOVO 20Y1S02400/20Y1S02400, BIOS R1BET65W(1.34 ) 06/17/2021
RIP: e030:switch_mm_irqs_off+0x3c5/0x400
Code: f0 41 80 65 01 fb ba 01 00 00 00 49 8d b5 60 23 00 00 4c 89 ef 49 c7 85 68 23 00 00 60 1d 08 81 e8 a0 f3 08 00 e9 15 fd ff ff <0f> 0b e8 34 fa ff ff e9 ad fc ff ff 0f 0b e9 31 fe ff ff 0f 0b e9
RSP: e02b:ffffc900400f3eb0 EFLAGS: 00010006
RAX: 00000001336c6000 RBX: ffff888140660000 RCX: 0000000000000040
RDX: ffff8881003027c0 RSI: 0000000000000000 RDI: ffff8881b36c6000
RBP: ffffffff829d91c0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000008 R11: 0000000000000000 R12: ffff888104e88440
R13: ffff8881003027c0 R14: 0000000000000000 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ffff888140640000(0000) knlGS:0000000000000000
CS:  10000e030 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 000060b7d78bf198 CR3: 0000000002810000 CR4: 0000000000050660
Call Trace:
 switch_mm+0x1c/0x30
 idle_task_exit+0x55/0x60
 play_dead_common+0xa/0x20
 xen_pv_play_dead+0xa/0x60
 do_idle+0xd1/0xe0
 cpu_startup_entry+0x19/0x20
 asm_cpu_bringup_and_idle+0x5/0x1000
---[ end trace b068d3cd1b7f5f4b ]---
smpboot: CPU 1 is now offline
smpboot: CPU 2 is now offline
smpboot: CPU 3 is now offline
smpboot: CPU 4 is now offline
smpboot: CPU 5 is now offline
smpboot: CPU 6 is now offline
smpboot: CPU 7 is now offline
ACPI: PM: Low-level resume complete
ACPI: EC: EC started
ACPI: PM: Restoring platform NVS memory
xen_acpi_processor: Uploading Xen processor PM info
xen_acpi_processor: (_PXX): Hypervisor error (-19) for ACPI CPU1
xen_acpi_processor: (_PXX): Hypervisor error (-19) for ACPI CPU3
xen_acpi_processor: (_PXX): Hypervisor error (-19) for ACPI CPU5
xen_acpi_processor: (_PXX): Hypervisor error (-19) for ACPI CPU7
xen_acpi_processor: (_PXX): Hypervisor error (-19) for ACPI CPU9
xen_acpi_processor: (_PXX): Hypervisor error (-19) for ACPI CPU11


# Second suspend
CPU2 is up
installing Xen timer for CPU 3
cpu 3 spinlock event irq 79
[Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
ACPI: \_SB_.PLTF.C003: Found 3 idle states
ACPI: FW issue: working around C-state latencies out of order
CPU3 is up
------------[ cut here ]------------
cfs_rq->avg.load_avg || cfs_rq->avg.util_avg || cfs_rq->avg.runnable_avg
installing Xen timer for CPU 4
WARNING: CPU: 3 PID: 455 at kernel/sched/fair.c:3339 __update_blocked_fair+0x49b/0x4b0
Modules linked in: snd_seq_dummy snd_hrtimer snd_seq snd_seq_device snd_timer nf_tables nfnetlink vfat fat intel_rapl_msr think_lmi firmware_attributes_class wmi_bmof intel_rapl_common pcspkr uvcvideo videobuf2_vmalloc videobuf2_memops joydev videobuf2_v4l2 sp5100_tco k10temp videobuf2_common i2c_piix4 iwlwifi videodev mc cfg80211 thinkpad_acpi ipmi_devintf ucsi_acpi platform_profile typec_ucsi ledtrig_audio ipmi_msghandler r8169 rfkill typec snd wmi soundcore video i2c_scmi fuse xenfs ip_tables dm_thin_pool dm_persistent_data dm_bio_prison dm_crypt trusted asn1_encoder hid_multitouch amdgpu crct10dif_pclmul crc32_pclmul crc32c_intel gpu_sched i2c_algo_bit drm_ttm_helper ghash_clmulni_intel ttm serio_raw drm_kms_helper cec sdhci_pci cqhci sdhci xhci_pci drm xhci_pci_renesas nvme xhci_hcd ehci_pci mmc_core ehci_hcd nvme_core xen_acpi_processor xen_privcmd xen_pciback xen_blkback xen_gntalloc xen_gntdev xen_evtchn uinput
CPU: 3 PID: 455 Comm: kworker/3:2 Tainted: G        W        --------- ---  5.15.0-0.rc7.0.fc32.qubes.x86_64 #1
Hardware name: LENOVO 20Y1S02400/20Y1S02400, BIOS R1BET65W(1.34 ) 06/17/2021
Workqueue:  0x0 (events)
RIP: e030:__update_blocked_fair+0x49b/0x4b0
Code: 6b fd ff ff 49 8b 96 48 01 00 00 48 89 90 50 09 00 00 e9 ff fc ff ff 48 c7 c7 10 7a 5e 82 c6 05 f3 35 9e 01 01 e8 1f f3 b2 00 <0f> 0b 41 8b 86 38 01 00 00 e9 c6 fc ff ff 0f 1f 80 00 00 00 00 0f
RSP: e02b:ffffc900410d7ce0 EFLAGS: 00010082
RAX: 0000000000000000 RBX: 0000000000000018 RCX: ffff8881406d8a08
RDX: 00000000ffffffd8 RSI: 0000000000000027 RDI: ffff8881406d8a00
RBP: ffff8881406e9800 R08: 0000000000000048 R09: ffffc900410d7c78
R10: 0000000000000049 R11: 000000002d2d2d2d R12: ffff8881406e9f80
R13: ffff8881406e9e40 R14: ffff8881406e96c0 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8881406c0000(0000) knlGS:0000000000000000
CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000782e51820000 CR3: 0000000002810000 CR4: 0000000000050660
Call Trace:
 update_blocked_averages+0xa8/0x180
 newidle_balance+0x175/0x380
 pick_next_task_fair+0x39/0x3e0
 pick_next_task+0x4c/0xbd0
 ? dequeue_task_fair+0xba/0x390
 __schedule+0x13a/0x570
 schedule+0x44/0xa0
 worker_thread+0xc0/0x320
 ? process_one_work+0x390/0x390
 kthread+0x10f/0x130
 ? set_kthread_struct+0x40/0x40
 ret_from_fork+0x22/0x30
---[ end trace b068d3cd1b7f5f4c ]---
cpu 4 spinlock event irq 85
[Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
ACPI: \_SB_.PLTF.C004: Found 3 idle states
ACPI: FW issue: working around C-state latencies out of order
CPU4 is up
installing Xen timer for CPU 5
cpu 5 spinlock event irq 91
[Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW (0x0)
ACPI: \_SB_.PLTF.C005: Found 3 idle states
ACPI: FW issue: working around C-state latencies out of order
CPU5 is up


