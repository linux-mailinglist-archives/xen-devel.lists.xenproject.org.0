Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFF5433FB5
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 22:15:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213458.371668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcvVv-0001zR-DP; Tue, 19 Oct 2021 20:15:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213458.371668; Tue, 19 Oct 2021 20:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcvVv-0001wl-A4; Tue, 19 Oct 2021 20:15:11 +0000
Received: by outflank-mailman (input) for mailman id 213458;
 Tue, 19 Oct 2021 20:15:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v1Hv=PH=oderland.se=josef@srs-us1.protection.inumbo.net>)
 id 1mcvVt-0001vs-Qk
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 20:15:09 +0000
Received: from office.oderland.com (unknown [91.201.60.5])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40b7ce9c-3119-11ec-8325-12813bfff9fa;
 Tue, 19 Oct 2021 20:15:07 +0000 (UTC)
Received: from [193.180.18.161] (port=58516 helo=[10.137.0.14])
 by office.oderland.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <josef@oderland.se>)
 id 1mcvVq-002OOE-Nu; Tue, 19 Oct 2021 22:15:06 +0200
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
X-Inumbo-ID: 40b7ce9c-3119-11ec-8325-12813bfff9fa
Message-ID: <906d370d-5023-e856-4ead-f0b499aded53@oderland.se>
Date: Tue, 19 Oct 2021 22:15:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:93.0) Gecko/20100101
 Thunderbird/93.0
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jandryuk@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>
References: <20211019195742.GA2394472@bhelgaas>
From: Josef Johansson <josef@oderland.se>
Subject: Re: [PATCH] PCI/MSI: Re-add checks for skip masking MSI-X on Xen PV
In-Reply-To: <20211019195742.GA2394472@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - office.oderland.com
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oderland.se
X-Get-Message-Sender-Via: office.oderland.com: authenticated_id: josjoh@oderland.se
X-Authenticated-Sender: office.oderland.com: josjoh@oderland.se

On 10/19/21 21:57, Bjorn Helgaas wrote:
> [+cc Marc]
>
> On Mon, Oct 18, 2021 at 08:22:32AM +0200, Josef Johansson wrote:
>> From: Josef Johansson <josef@oderland.se>
>>
>>
>> PCI/MSI: Re-add checks for skip masking MSI-X on Xen PV
>>     
>> 'commit fcacdfbef5a1 ("PCI/MSI: Provide a new set of mask and unmask
>> functions")' introduced functions pci_msi_update_mask() and 
>> pci_msix_write_vector_ctrl() that were missing checks for
>> pci_msi_ignore_mask that existed in 'commit 446a98b19fd6 ("PCI/MSI: Use
>> new mask/unmask functions")'. This patch adds them back since it was
>> causing softlocks in amdgpu drivers under Xen.
>>
>> As explained in 'commit 1a519dc7a73c ("PCI/MSI: Skip masking MSI-X
>> on Xen PV")', when running as Xen PV guest, masking MSI-X is a 
>> responsibility of the hypervisor.
>>
>> Fixes: fcacdfbef5a1 ("PCI/MSI: Provide a new set of mask and unmask
>> functions")
>> Suggested-by: Jason Andryuk <jandryuk@gmail.com>
>> Signed-off-by: Josef Johansson <josef@oderland.se>
> fcacdfbef5a1 appeared in v5.15-rc1, and we should try to get this
> fixed before v5.15.
>
> I could merge it but would like an ack from Thomas since he wrote
> fcacdfbef5a1.  He merged fcacdfbef5a1, so I wouldn't complain if the
> fix followed the same path.
>
> If I merged it (or if you were to repost it), I would drop the single
> quotes around the commit citations and write the commit log in
> imperative mood, as you did for the subject
> (https://chris.beams.io/posts/git-commit/)

I'll make an effort to do a better commit log. Thanks for reviewing the
entry!

What is the time frame for v5.15?

>> ---
>>
>> This patch solves a major issue with booting 5.15-rc1 under Xen
>> with amdgpu drivers. Specifically Lenovo P14s Gen 1, AMD 4750U.
>>
>> The softlock below takes about ~2-3 minutes to release, and will
>> lock again if I switch between X and console, when staying in
>> X I can do things without it softlock.
> I don't actually see a softlock mentioned below; am I missing
> something?  It's nice to include a couple lines of dmesg log to help
> people connect the issue with the fix, but most of the below is not
> relevant and can be easily found from the Link: tag.  Also, some of
> the lines seem to be wrapped.  They're more useful when not wrapped
> because grep can find them.

Sorry for my lack of words here. I used deadlock when I first described
it, but since

it was released after a while, I thought softlock would be more fitting.

I'll dig a bit to try to get a better dmesg around the stacktrace. Sorry
about the wrapping,

I'm trying hard to keep those 80 chars ;-)

>> I have to note that this is my first commit and PCI/MSI area is
>> not my area of expertise. I tried to mimic what was
>> obviously missing between the aforementioned commits. There may be
>> better ways to solve this problem, or other places to put the checks.
>> Should desc->msi_attrib.is_virtual be checked? It is not checked in
>> 'commit 1a519dc7a73c ("PCI/MSI: Skip masking MSI-X on Xen PV")'
>>
>> I should also note that my original problem with *flip done timeout*
>> inside drm during suspend/resume is not solved, but with this patch
>> at least the kernel boots properly.
>>
>> The kernel is much more stable not running inside Xen, and much 
>> more stable running pci=nomsi (under Xen). Are we missing something
>> more regarding masking?
> It does sound like something else is broken as well, but I have no
> idea what that would be.

Should I take a stab at describing the issue better at hand or should we
focus on getting this

specific patch out of the way?

I have 'solved' my current problems a bit by kernel flags right now, but
I would be happy to

share my story so far.

>> The error that occurs is:
>>
>> kernel: ------------[ cut here ]------------
>> kernel: WARNING: CPU: 6 PID: 3754 at
>> drivers/gpu/drm/amd/amdgpu/../display/amdgp
>> u_dm/amdgpu_dm.c:8630 amdgpu_dm_commit_planes+0x9b4/0x9c0 [amdgpu]
>> kernel: Modules linked in: nf_tables nfnetlink vfat fat intel_rapl_msr wmi_bmof
>> intel_rapl_common pcspkr joydev uvcvideo k10temp sp5100_tco videobuf2_vmalloc vi
>> deobuf2_memops i2c_piix4 videobuf2_v4l2 videobuf2_common videodev mc iwlwifi thi
>> nkpad_acpi platform_profile ipmi_devintf ledtrig_audio ucsi_acpi cfg80211 ipmi_m
>> sghandler r8169 snd typec_ucsi soundcore typec rfkill wmi video amd_pmc i2c_scmi
>>  fuse xenfs ip_tables dm_thin_pool dm_persistent_data dm_bio_prison dm_crypt tru
>> sted asn1_encoder hid_multitouch amdgpu crct10dif_pclmul iommu_v2 crc32_pclmul c
>> rc32c_intel gpu_sched i2c_algo_bit drm_ttm_helper ttm drm_kms_helper ccp cec gha
>> sh_clmulni_intel sdhci_pci xhci_pci xhci_pci_renesas serio_raw cqhci drm sdhci x
>> hci_hcd mmc_core nvme ehci_pci ehci_hcd nvme_core xen_acpi_processor xen_privcmd
>>  xen_pciback xen_blkback xen_gntalloc xen_gntdev xen_evtchn uinput
>> kernel: CPU: 6 PID: 3754 Comm: Xorg Tainted: G   W 5.15.0-1.fc32.qubes.x86_64 #1
>> kernel: Hardware name: LENOVO 20Y1S02400/20Y1S02400, BIOS R1BET61W(1.30) 12/21/
>> 2020
>> kernel: RIP: e030:amdgpu_dm_commit_planes+0x9b4/0x9c0 [amdgpu]
>> kernel: Code: 8b 45 b0 48 c7 c7 4b fc 90 c0 4c 89 55 88 8b b0 f0 03 00 00 e8 6d
>> cb ca ff 4c 8b 55 88 0f b6 55 ab 49 8b 72 08 e9 2b fa ff ff <0f> 0b e9 fa fe ff
>> ff e8 40 2f 6e c1 0f 1f 44 00 00 55 b9 27 00 00
>> kernel: RSP: e02b:ffffc90042d93638 EFLAGS: 00010002
>> kernel: RAX: ffff888110840210 RBX: 00000000000083c1 RCX: 0000000000000466
>> kernel: RDX: 0000000000000001 RSI: 0000000000000204 RDI: ffff888110840170
>> kernel: RBP: ffffc90042d936f8 R08: 0000000000000002 R09: 0000000000000001
>> kernel: R10: 0000000000000000 R11: ffff88810cb2e118 R12: ffff888110840210
>> kernel: R13: ffff88810cb2e000 R14: ffff888103d50400 R15: ffff888103bb2c00
>> kernel: FS:  0000718c6de4da40(0000) GS:ffff888140780000(0000)
>> knlGS:000000000000
>> 0000
>> kernel: CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
>> kernel: CR2: 0000726ada294000 CR3: 0000000103f0e000 CR4: 0000000000050660
>> kernel: Call Trace:
>> kernel:  amdgpu_dm_atomic_commit_tail+0xc3e/0x1360 [amdgpu]
>> kernel:  commit_tail+0x94/0x130 [drm_kms_helper]
>> kernel:  drm_atomic_helper_commit+0x113/0x140 [drm_kms_helper]
>> kernel:  drm_client_modeset_commit_atomic+0x1fc/0x240 [drm]
>> kernel:  drm_client_modeset_commit_locked+0x53/0x80 [drm]
>> kernel:  drm_fb_helper_pan_display+0xdc/0x210 [drm_kms_helper]
>> kernel:  fb_pan_display+0x83/0x100
>> kernel:  fb_set_var+0x200/0x3b0
>> kernel:  fbcon_blank+0x186/0x280
>> kernel:  do_unblank_screen+0xaa/0x150
>> kernel:  complete_change_console+0x54/0x120
>> kernel:  vt_ioctl+0x31d/0x5f0
>> kernel:  tty_ioctl+0x312/0x780
>> kernel:  __x64_sys_ioctl+0x83/0xb0
>> kernel:  do_syscall_64+0x3b/0x90
>> kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xae
>> kernel: RIP: 0033:0x718c6e33217b
>> kernel: Code: 0f 1e fa 48 8b 05 1d ad 0c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff
>> ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff
>> 73 01 c3 48 8b 0d ed ac 0c 00 f7 d8 64 89 01 48
>> kernel: RSP: 002b:00007ffd5c6157c8 EFLAGS: 00000246 ORIG_RAX:
>> 0000000000000010
>> kernel: RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 0000718c6e33217b
>> kernel: RDX: 0000000000000001 RSI: 0000000000005605 RDI: 0000000000000014
>> kernel: RBP: 000057b9b2aa93f4 R08: 0000000000000000 R09: 0000000000000001
>> kernel: R10: fffffffffffff9ce R11: 0000000000000246 R12: 000057b9b2aa94b0
>> kernel: R13: 000057b9b2aa94a0 R14: 000057b9b2aa93f0 R15: 00007ffd5c615844
>> kernel: ---[ end trace 2c3e3998803422cb ]---
>> kernel: ------------[ cut here ]------------
>> kernel: WARNING: CPU: 6 PID: 3754 at
>> drivers/gpu/drm/amd/amdgpu/../display/amdgp
>> u_dm/amdgpu_dm.c:8217 prepare_flip_isr+0x64/0x70 [amdgpu]
>> kernel: Modules linked in: nf_tables nfnetlink vfat fat intel_rapl_msr wmi_bmof
>> intel_rapl_common pcspkr joydev uvcvideo k10temp sp5100_tco videobuf2_vmalloc vi
>> deobuf2_memops i2c_piix4 videobuf2_v4l2 videobuf2_common videodev mc iwlwifi thi
>> nkpad_acpi platform_profile ipmi_devintf ledtrig_audio ucsi_acpi cfg80211 ipmi_m
>> sghandler r8169 snd typec_ucsi soundcore typec rfkill wmi video amd_pmc i2c_scmi
>>  fuse xenfs ip_tables dm_thin_pool dm_persistent_data dm_bio_prison dm_crypt tru
>> sted asn1_encoder hid_multitouch amdgpu crct10dif_pclmul iommu_v2 crc32_pclmul c
>> rc32c_intel gpu_sched i2c_algo_bit drm_ttm_helper ttm drm_kms_helper ccp cec gha
>> sh_clmulni_intel sdhci_pci xhci_pci xhci_pci_renesas serio_raw cqhci drm sdhci x
>> hci_hcd mmc_core nvme ehci_pci ehci_hcd nvme_core xen_acpi_processor xen_privcmd
>>  xen_pciback xen_blkback xen_gntalloc xen_gntdev xen_evtchn uinput
>> kernel: CPU: 6 PID: 3754 Comm: Xorg Tainted: G W 5.15.0-1.fc32.qubes.x86_64 #1
>> kernel: Hardware name: LENOVO 20Y1S02400/20Y1S02400, BIOS R1BET61W(1.30) 12/21/
>> 2020
>> kernel: RIP: e030:prepare_flip_isr+0x64/0x70 [amdgpu]
>> kernel: Code: 00 48 c7 80 38 01 00 00 00 00 00 00 66 90 c3 8b 97 f0 03 00 00 48
>> c7 c6 18 72 8d c0 48 c7 c7 90 5b a7 c0 e9 7e 6e 13 c1 0f 0b <0f> 0b eb b4 0f 1f
>> 84 00 00 00 00 00 0f 1f 44 00 00 41 57 41 56 41
>> kernel: RSP: e02b:ffffc90042d93630 EFLAGS: 00010086
>> kernel: RAX: 0000000000000001 RBX: 00000000000083c1 RCX: 0000000000000466
>> kernel: RDX: 0000000000000001 RSI: 0000000000000204 RDI: ffff88810cb2e000
>> kernel: RBP: ffffc90042d936f8 R08: 0000000000000002 R09: 0000000000000001
>> kernel: R10: 0000000000000000 R11: ffff88810cb2e118 R12: ffff888110840210
>> kernel: R13: ffff88810cb2e000 R14: ffff888103d50400 R15: ffff888103bb2c00
>> kernel: FS:  0000718c6de4da40(0000) GS:ffff888140780000(0000) knlGS:000000000000
>> 0000
>> kernel: CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
>> kernel: CR2: 0000726ada294000 CR3: 0000000103f0e000 CR4: 0000000000050660
>> kernel: Call Trace:
>> kernel:  amdgpu_dm_commit_planes+0x8bd/0x9c0 [amdgpu]
>> kernel:  amdgpu_dm_atomic_commit_tail+0xc3e/0x1360 [amdgpu]
>> kernel:  commit_tail+0x94/0x130 [drm_kms_helper]
>> kernel:  drm_atomic_helper_commit+0x113/0x140 [drm_kms_helper]
>> kernel:  drm_client_modeset_commit_atomic+0x1fc/0x240 [drm]
>> kernel:  drm_client_modeset_commit_locked+0x53/0x80 [drm]
>> kernel:  drm_fb_helper_pan_display+0xdc/0x210 [drm_kms_helper]
>> kernel:  fb_pan_display+0x83/0x100
>> kernel:  fb_set_var+0x200/0x3b0
>> kernel:  fbcon_blank+0x186/0x280
>> kernel:  do_unblank_screen+0xaa/0x150
>> kernel:  complete_change_console+0x54/0x120
>> kernel:  vt_ioctl+0x31d/0x5f0
>> kernel:  tty_ioctl+0x312/0x780
>> kernel:  __x64_sys_ioctl+0x83/0xb0
>> kernel:  do_syscall_64+0x3b/0x90
>> kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xae
>> kernel: RIP: 0033:0x718c6e33217b
>> kernel: Code: 0f 1e fa 48 8b 05 1d ad 0c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff
>> ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff
>> 73 01 c3 48 8b 0d ed ac 0c 00 f7 d8 64 89 01 48
>> kernel: RSP: 002b:00007ffd5c6157c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>> kernel: RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 0000718c6e33217b
>> kernel: RDX: 0000000000000001 RSI: 0000000000005605 RDI: 0000000000000014
>> kernel: RBP: 000057b9b2aa93f4 R08: 0000000000000000 R09: 0000000000000001
>> kernel: R10: fffffffffffff9ce R11: 0000000000000246 R12: 000057b9b2aa94b0
>> kernel: R13: 000057b9b2aa94a0 R14: 000057b9b2aa93f0 R15: 00007ffd5c615844
>> kernel: ---[ end trace 2c3e3998803422cc ]---
>>
>> It is discussed briefly at:
>> https://lore.kernel.org/linux-pci/CAKf6xpvGyCKVHsvauP54=0j10fxis4XiiqBNWH+1cpkbtt_QJw@mail.gmail.com/
>>
>>
>> diff --git a/drivers/pci/msi.c b/drivers/pci/msi.c
>> index 0099a00af361..355b791e382f 100644
>> --- a/drivers/pci/msi.c
>> +++ b/drivers/pci/msi.c
>> @@ -148,6 +148,9 @@ static noinline void pci_msi_update_mask(struct msi_desc *desc, u32 clear, u32 s
>>  	raw_spinlock_t *lock = &desc->dev->msi_lock;
>>  	unsigned long flags;
>>  
>> +	if (pci_msi_ignore_mask || desc->msi_attrib.is_virtual)
>> +		return;
>> +
>>  	raw_spin_lock_irqsave(lock, flags);
>>  	desc->msi_mask &= ~clear;
>>  	desc->msi_mask |= set;
>> @@ -181,6 +184,9 @@ static void pci_msix_write_vector_ctrl(struct msi_desc *desc, u32 ctrl)
>>  {
>>  	void __iomem *desc_addr = pci_msix_desc_addr(desc);
>>  
>> +	if (pci_msi_ignore_mask || desc->msi_attrib.is_virtual)
>> +		return;
>> +
>>  	writel(ctrl, desc_addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
>>  }
>>
>> --
>> 2.31.1
>>

