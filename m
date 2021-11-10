Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EE944CAA8
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 21:31:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224447.387718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkuFL-0001Wd-S6; Wed, 10 Nov 2021 20:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224447.387718; Wed, 10 Nov 2021 20:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkuFL-0001TS-Of; Wed, 10 Nov 2021 20:31:03 +0000
Received: by outflank-mailman (input) for mailman id 224447;
 Wed, 10 Nov 2021 20:31:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ssld=P5=oderland.se=josef@srs-se1.protection.inumbo.net>)
 id 1mkuFK-0001TM-G7
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 20:31:02 +0000
Received: from office.oderland.com (office.oderland.com [91.201.60.5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e63a258-4265-11ec-a9d2-d9f7a1cc8784;
 Wed, 10 Nov 2021 21:31:01 +0100 (CET)
Received: from [155.4.220.82] (port=44276 helo=[10.137.0.14])
 by office.oderland.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <josef@oderland.se>)
 id 1mkuFI-0024jk-5i; Wed, 10 Nov 2021 21:31:00 +0100
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
X-Inumbo-ID: 1e63a258-4265-11ec-a9d2-d9f7a1cc8784
Message-ID: <19176a3c-e554-0ff4-2e0b-5813d353d15e@oderland.se>
Date: Wed, 10 Nov 2021 21:30:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:93.0) Gecko/20100101
 Thunderbird/93.0
Subject: Re: [PATCH] PCI/MSI: Move non-mask check back into low level
 accessors
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>
Cc: boris.ostrovsky@oracle.com, helgaas@kernel.org, jgross@suse.com,
 linux-pci@vger.kernel.org, maz@kernel.org, xen-devel@lists.xenproject.org,
 Jason Andryuk <jandryuk@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Peter Jones <pjones@redhat.com>, linux-fbdev@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 x86@kernel.org
References: <90277228-cf14-0cfa-c95e-d42e7d533353@oderland.se>
 <20211025012503.33172-1-jandryuk@gmail.com> <87fssmg8k4.ffs@tglx>
 <87cznqg5k8.ffs@tglx> <d1cc20aa-5c5c-6c7b-2e5d-bc31362ad891@oderland.se>
 <89d6c2f4-4d00-972f-e434-cb1839e78598@oderland.se>
 <5b3d4653-0cdf-e098-0a4a-3c5c3ae3977b@oderland.se> <87ee7w6bxi.ffs@tglx>
From: Josef Johansson <josef@oderland.se>
In-Reply-To: <87ee7w6bxi.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - office.oderland.com
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oderland.se
X-Get-Message-Sender-Via: office.oderland.com: authenticated_id: josjoh@oderland.se
X-Authenticated-Sender: office.oderland.com: josjoh@oderland.se

On 11/4/21 00:45, Thomas Gleixner wrote:
> On Wed, Oct 27 2021 at 17:29, Josef Johansson wrote:
>
> CC+: EFIFB and scheduler folks
>
>> On 10/27/21 14:01, Josef Johansson wrote:
>>
>> printk: Suspending console(s) (use no_console_suspend to debug)
>> [drm] free PSP TMR buffer
>> PM: suspend devices took 0.428 seconds
>> ACPI: EC: interrupt blocked
>> ACPI: PM: Preparing to enter system sleep state S3
>> ACPI: EC: event blocked
>> ACPI: EC: EC stopped
>> ACPI: PM: Saving platform NVS memory
>> Disabling non-boot CPUs ...
>> ------------[ cut here ]------------
>> WARNING: CPU: 1 PID: 0 at arch/x86/mm/tlb.c:522  switch_mm_irqs_off+0x3c5/0x400
> 	if (WARN_ON_ONCE(__read_cr3() != build_cr3(real_prev->pgd, prev_asid))) {
>
>> Modules linked in: snd_seq_dummy snd_hrtimer snd_seq snd_seq_device snd_timer nf_tables nfnetlink vfat fat intel_rapl_msr think_lmi firmware_attributes_class wmi_bmof intel_rapl_common pcspkr uvcvideo videobuf2_vmalloc videobuf2_memops joydev videobuf2_v4l2 sp5100_tco k10temp videobuf2_common i2c_piix4 iwlwifi videodev mc cfg80211 thinkpad_acpi ipmi_devintf ucsi_acpi platform_profile typec_ucsi ledtrig_audio ipmi_msghandler r8169 rfkill typec snd wmi soundcore video i2c_scmi fuse xenfs ip_tables dm_thin_pool dm_persistent_data dm_bio_prison dm_crypt trusted asn1_encoder hid_multitouch amdgpu crct10dif_pclmul crc32_pclmul crc32c_intel gpu_sched i2c_algo_bit drm_ttm_helper ghash_clmulni_intel ttm serio_raw drm_kms_helper cec sdhci_pci cqhci sdhci xhci_pci drm xhci_pci_renesas nvme xhci_hcd ehci_pci mmc_core ehci_hcd nvme_core xen_acpi_processor xen_privcmd xen_pciback xen_blkback xen_gntalloc xen_gntdev xen_evtchn uinput
>> CPU: 1 PID: 0 Comm: swapper/1 Tainted: G        W        --------- ---  5.15.0-0.rc7.0.fc32.qubes.x86_64 #1
>> Hardware name: LENOVO 20Y1S02400/20Y1S02400, BIOS R1BET65W(1.34 ) 06/17/2021
>> RIP: e030:switch_mm_irqs_off+0x3c5/0x400
>> Code: f0 41 80 65 01 fb ba 01 00 00 00 49 8d b5 60 23 00 00 4c 89 ef 49 c7 85 68 23 00 00 60 1d 08 81 e8 a0 f3 08 00 e9 15 fd ff ff <0f> 0b e8 34 fa ff ff e9 ad fc ff ff 0f 0b e9 31 fe ff ff 0f 0b e9
>> RSP: e02b:ffffc900400f3eb0 EFLAGS: 00010006
>> RAX: 00000001336c6000 RBX: ffff888140660000 RCX: 0000000000000040
>> RDX: ffff8881003027c0 RSI: 0000000000000000 RDI: ffff8881b36c6000
>> RBP: ffffffff829d91c0 R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000008 R11: 0000000000000000 R12: ffff888104e88440
>> R13: ffff8881003027c0 R14: 0000000000000000 R15: 0000000000000001
>> FS:  0000000000000000(0000) GS:ffff888140640000(0000) knlGS:0000000000000000
>> CS:  10000e030 DS: 002b ES: 002b CR0: 0000000080050033
>> CR2: 000060b7d78bf198 CR3: 0000000002810000 CR4: 0000000000050660
>> Call Trace:
>>  switch_mm+0x1c/0x30
>>  idle_task_exit+0x55/0x60
>>  play_dead_common+0xa/0x20
>>  xen_pv_play_dead+0xa/0x60
> So this is when bringing the non boot CPUs down and the switch_mm() code
> discovers inconsistency between CR3 and the expected value.
>
> Would probably be interesting to print the actual values, but XEN folks
> might have an idea.
I can install some print-statements showing some more info here.
I guess I will be getting memory addresses, we already know that CR3 is
0000000002810000

If you have any hints on how to do an effective print statement for this
please do say so :)
I'll try though and see what I find out.
>>  do_idle+0xd1/0xe0
>>  cpu_startup_entry+0x19/0x20
>>  asm_cpu_bringup_and_idle+0x5/0x1000
>> ---[ end trace b068d3cd1b7f5f4b ]---
>> smpboot: CPU 1 is now offline
>> smpboot: CPU 2 is now offline
>> smpboot: CPU 3 is now offline
>> smpboot: CPU 4 is now offline
>> smpboot: CPU 5 is now offline
>> smpboot: CPU 6 is now offline
>> smpboot: CPU 7 is now offline
>> ACPI: PM: Low-level resume complete
>> ACPI: EC: EC started
>> ACPI: PM: Restoring platform NVS memory
>> xen_acpi_processor: Uploading Xen processor PM info
>> xen_acpi_processor: (_PXX): Hypervisor error (-19) for ACPI CPU1
>> xen_acpi_processor: (_PXX): Hypervisor error (-19) for ACPI CPU3
>> xen_acpi_processor: (_PXX): Hypervisor error (-19) for ACPI CPU5
>> xen_acpi_processor: (_PXX): Hypervisor error (-19) for ACPI CPU7
>> xen_acpi_processor: (_PXX): Hypervisor error (-19) for ACPI CPU9
>>


