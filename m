Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E12438838
	for <lists+xen-devel@lfdr.de>; Sun, 24 Oct 2021 12:13:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215504.374754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1meaV4-0008B6-Ud; Sun, 24 Oct 2021 10:13:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215504.374754; Sun, 24 Oct 2021 10:13:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1meaV4-000884-QA; Sun, 24 Oct 2021 10:13:10 +0000
Received: by outflank-mailman (input) for mailman id 215504;
 Sun, 24 Oct 2021 10:13:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lf0h=PM=oderland.se=josef@srs-us1.protection.inumbo.net>)
 id 1meaV3-00087y-9u
 for xen-devel@lists.xenproject.org; Sun, 24 Oct 2021 10:13:09 +0000
Received: from office.oderland.com (unknown [91.201.60.5])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10788d86-e798-4f5d-984b-cfe94b573988;
 Sun, 24 Oct 2021 10:12:58 +0000 (UTC)
Received: from [193.180.18.161] (port=49250 helo=[10.137.0.14])
 by office.oderland.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <josef@oderland.se>)
 id 1meaUr-00FRGh-9J; Sun, 24 Oct 2021 12:12:57 +0200
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
X-Inumbo-ID: 10788d86-e798-4f5d-984b-cfe94b573988
Message-ID: <72ede4f0-c043-0fa3-0e8b-e03b23b21a75@oderland.se>
Date: Sun, 24 Oct 2021 12:12:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:93.0) Gecko/20100101
 Thunderbird/93.0
From: Josef Johansson <josef@oderland.se>
To: open list <linux-kernel@vger.kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Language: en-US
Subject: Deadlock when CONFIG_LOCKDEP=y
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - office.oderland.com
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oderland.se
X-Get-Message-Sender-Via: office.oderland.com: authenticated_id: josjoh@oderland.se
X-Authenticated-Sender: office.oderland.com: josjoh@oderland.se

Hi!

I'm running Qubes OS R4.1 which uses Xen as arch. Xen should be masking all
MSI/MSI-X which is why I am running through rabbit holes trying to
understand
why my laptop gets odd errors while suspend/resume.

Thus I'm building the kernel (v5.15-rc6) with a couple of debug-flags:

CONFIG_PCI_DEBUG=y
CONFIG_LOCKDEP=y
CONFIG_PROVE_LOCKING=y
CONFIG_DEBUG_SPINLOCK=y

When I do I get a massive deadlock dump during suspend/resume with the
dmesg
below. Not sure if this deadlock actually does anything, but the laptop is
usable afterwards albeit I'm not sure it's affecting irq/msi errors inside
amdgpu afterwards.

I see that different arch have workarounds when LOCKDEP is enabled, but
not Xen
from what I can tell. Is something odd here or is it just me missing
something?

For refence this is running on a Lenovo P14s with AMD Ryzen 7 Pro 4750U
that
has a Renoir chipset which uses amdgpu drivers (lspci -vvnn is also added
below).

Please advise if you would be so kind!

Regards
- Josef


dom0 kernel: cpu 4 spinlock event irq 85
dom0 kernel: [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
dom0 kernel: ACPI: \_SB_.PLTF.C004: Found 3 idle states
dom0 kernel: ACPI: FW issue: working around C-state latencies out of order
dom0 kernel: CPU4 is up
dom0 kernel: installing Xen timer for CPU 5
dom0 kernel: cpu 5 spinlock event irq 91
dom0 kernel: [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
dom0 kernel: ACPI: \_SB_.PLTF.C005: Found 3 idle states
dom0 kernel: ACPI: FW issue: working around C-state latencies out of order
dom0 kernel: CPU5 is up
dom0 kernel: installing Xen timer for CPU 6
dom0 kernel: cpu 6 spinlock event irq 97
dom0 kernel: [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
dom0 kernel: ACPI: \_SB_.PLTF.C006: Found 3 idle states
dom0 kernel: ACPI: FW issue: working around C-state latencies out of order
dom0 kernel: CPU6 is up
dom0 kernel: ------------[ cut here ]------------
dom0 kernel: installing Xen timer for CPU 7
dom0 kernel:
dom0 kernel: ======================================================
dom0 kernel: WARNING: possible circular locking dependency detected
dom0 kernel: 5.15.0-0.rc6.0.fc32.qubes.x86_64 #1 Tainted: G       
W        --------- ---
dom0 kernel: ------------------------------------------------------
dom0 kernel: kworker/6:2/440 is trying to acquire lock:
dom0 kernel: ffffffff829628b8 ((console_sem).lock){-...}-{2:2}, at:
down_trylock+0xf/0x30
dom0 kernel:
                          but task is already holding lock:
dom0 kernel: ffff8881407ab558 (&rq->__lock){-.-.}-{2:2}, at:
raw_spin_rq_lock_nested+0x1e/0x80
dom0 kernel:
                          which lock already depends on the new lock.
dom0 kernel:
                          the existing dependency chain (in reverse
order) is:
dom0 kernel:
                          -> #2 (&rq->__lock){-.-.}-{2:2}:
dom0 kernel:        __lock_acquire+0x3a0/0x6b0
dom0 kernel:        lock_acquire+0xf5/0x300
dom0 kernel:        _raw_spin_lock_nested+0x2a/0x40
dom0 kernel:        raw_spin_rq_lock_nested+0x1e/0x80
dom0 kernel:        task_fork_fair+0x39/0x180
dom0 kernel:        sched_fork+0x115/0x290
dom0 kernel:        copy_process+0xd2a/0x2b70
dom0 kernel:        kernel_clone+0xa4/0x300
dom0 kernel:        kernel_thread+0x55/0x70
dom0 kernel:        rest_init+0x1e/0x280
dom0 kernel:        start_kernel+0x659/0x697
dom0 kernel:        xen_start_kernel+0x5fa/0x61b
dom0 kernel:        reset_early_page_tables+0x0/0x9d
dom0 kernel:
                          -> #1 (&p->pi_lock){-.-.}-{2:2}:
dom0 kernel:        __lock_acquire+0x3a0/0x6b0
dom0 kernel:        lock_acquire+0xf5/0x300
dom0 kernel:        _raw_spin_lock_irqsave+0x48/0x60
dom0 kernel:        try_to_wake_up+0x53/0x5f0
dom0 kernel:        up+0x40/0x60
dom0 kernel:        __up_console_sem+0x56/0x70
dom0 kernel:        console_unlock+0x2ae/0x3c0
dom0 kernel:        do_register_framebuffer+0x283/0x2f0
dom0 kernel:        register_framebuffer+0x20/0x40
dom0 kernel:        __drm_fb_helper_initial_config_and_unlock+0x94/0xc0
[drm_kms_helper]
dom0 kernel:        amdgpu_fbdev_init+0xc7/0x100 [amdgpu]
dom0 kernel:        amdgpu_device_init.cold+0x739/0xb0e [amdgpu]
dom0 kernel:        amdgpu_driver_load_kms+0x68/0x310 [amdgpu]
dom0 kernel:        amdgpu_pci_probe+0x116/0x1a0 [amdgpu]
dom0 kernel:        local_pci_probe+0x45/0x80
dom0 kernel:        pci_call_probe+0x51/0xf0
dom0 kernel:        pci_device_probe+0xa5/0xe0
dom0 kernel:        call_driver_probe+0x24/0xc0
dom0 kernel:        really_probe+0x1e7/0x310
dom0 kernel:        __driver_probe_device+0xfe/0x180
dom0 kernel:        driver_probe_device+0x1e/0x90
dom0 kernel:        __driver_attach+0xc4/0x1d0
dom0 kernel:        bus_for_each_dev+0x8c/0xd0
dom0 kernel:        bus_add_driver+0x12e/0x1f0
dom0 kernel:        driver_register+0x8f/0xe0
dom0 kernel:        do_one_initcall+0x6e/0x2f0
dom0 kernel:        do_init_module+0x5c/0x260
dom0 kernel:        __do_sys_finit_module+0xae/0x110
dom0 kernel:        do_syscall_64+0x3b/0x90
dom0 kernel:        entry_SYSCALL_64_after_hwframe+0x44/0xae
dom0 kernel:
                          -> #0 ((console_sem).lock){-...}-{2:2}:
dom0 kernel:        check_prev_add+0x8f/0xbf0
dom0 kernel:        validate_chain+0x38a/0x420
dom0 kernel:        __lock_acquire+0x3a0/0x6b0
dom0 kernel:        lock_acquire+0xf5/0x300
dom0 kernel:        _raw_spin_lock_irqsave+0x48/0x60
dom0 kernel:        down_trylock+0xf/0x30
dom0 kernel:        __down_trylock_console_sem+0x32/0xa0
dom0 kernel:        console_trylock_spinning+0x13/0x1e0
dom0 kernel:        vprintk_emit+0xa8/0x160
dom0 kernel:        _printk+0x68/0x7f
dom0 kernel:        __warn_printk+0x51/0x93
dom0 kernel:        __update_blocked_fair+0x4f4/0x510
dom0 kernel:        update_blocked_averages+0xe3/0x280
dom0 kernel:        newidle_balance+0x160/0x600
dom0 kernel:        pick_next_task_fair+0x39/0x3f0
dom0 kernel:        pick_next_task+0x4c/0xbb0
dom0 kernel:        __schedule+0x135/0x600
dom0 kernel:        schedule+0x59/0xc0
dom0 kernel:        worker_thread+0xb3/0x310
dom0 kernel:        kthread+0x120/0x140
dom0 kernel:        ret_from_fork+0x22/0x30
dom0 kernel:
                          other info that might help us debug this:
dom0 kernel: Chain exists of:
                            (console_sem).lock --> &p->pi_lock -->
&rq->__lock
dom0 kernel:  Possible unsafe locking scenario:
dom0 kernel:        CPU0                    CPU1
dom0 kernel:        ----                    ----
dom0 kernel:   lock(&rq->__lock);
dom0 kernel:                                lock(&p->pi_lock);
dom0 kernel:                                lock(&rq->__lock);
dom0 kernel:   lock((console_sem).lock);
dom0 kernel:
                           *** DEADLOCK ***
dom0 kernel: 1 lock held by kworker/6:2/440:
dom0 kernel:  #0: ffff8881407ab558 (&rq->__lock){-.-.}-{2:2}, at:
raw_spin_rq_lock_nested+0x1e/0x80
dom0 kernel:
                          stack backtrace:
dom0 kernel: CPU: 6 PID: 440 Comm: kworker/6:2 Tainted: G       
W        --------- ---  5.15.0-0.rc6.0.fc32.qubes.x86_64 #1
dom0 kernel: Hardware name: LENOVO 20Y1S02400/20Y1S02400, BIOS
R1BET65W(1.34 ) 06/17/2021
dom0 kernel: Workqueue:  0x0 (events)
dom0 kernel: Call Trace:
dom0 kernel:  dump_stack_lvl+0x57/0x72
dom0 kernel:  check_noncircular+0x10a/0x120
dom0 kernel:  check_prev_add+0x8f/0xbf0
dom0 kernel:  ? add_chain_cache+0x10d/0x2d0
dom0 kernel:  validate_chain+0x38a/0x420
dom0 kernel:  __lock_acquire+0x3a0/0x6b0
dom0 kernel:  lock_acquire+0xf5/0x300
dom0 kernel:  ? down_trylock+0xf/0x30
dom0 kernel:  ? vprintk_emit+0xa8/0x160
dom0 kernel:  _raw_spin_lock_irqsave+0x48/0x60
dom0 kernel:  ? down_trylock+0xf/0x30
dom0 kernel:  down_trylock+0xf/0x30
dom0 kernel:  ? vprintk_emit+0xa8/0x160
dom0 kernel:  __down_trylock_console_sem+0x32/0xa0
dom0 kernel:  console_trylock_spinning+0x13/0x1e0
dom0 kernel:  vprintk_emit+0xa8/0x160
dom0 kernel:  _printk+0x68/0x7f
dom0 kernel:  __warn_printk+0x51/0x93
dom0 kernel:  ? lock_is_held_type+0xa5/0x120
dom0 kernel:  __update_blocked_fair+0x4f4/0x510
dom0 kernel:  update_blocked_averages+0xe3/0x280
dom0 kernel:  newidle_balance+0x160/0x600
dom0 kernel:  pick_next_task_fair+0x39/0x3f0
dom0 kernel:  pick_next_task+0x4c/0xbb0
dom0 kernel:  ? dequeue_task_fair+0xd1/0x4a0
dom0 kernel:  __schedule+0x135/0x600
dom0 kernel:  schedule+0x59/0xc0
dom0 kernel:  worker_thread+0xb3/0x310
dom0 kernel:  ? process_one_work+0x590/0x590
dom0 kernel:  kthread+0x120/0x140
dom0 kernel:  ? set_kthread_struct+0x40/0x40
dom0 kernel:  ret_from_fork+0x22/0x30
dom0 kernel: cfs_rq->avg.load_avg || cfs_rq->avg.util_avg ||
cfs_rq->avg.runnable_avg
dom0 kernel: WARNING: CPU: 6 PID: 440 at kernel/sched/fair.c:3339
__update_blocked_fair+0x4f4/0x510
dom0 kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq
snd_seq_device snd_timer nf_tables nfnetlink vfat fat intel_rapl_msr
think_lmi wmi_bmof firmware_attributes_class intel_rapl_common pcspkr
uvcvideo joydev videobuf2_vmalloc videobuf2_memops videobuf2_v4l2
videobuf2_common k10temp videodev iwlwifi mc sp5100_tco i2c_piix4
cfg80211 ipmi_devintf ipmi_msghandler r8169 thinkpad_acpi
platform_profile ledtrig_audio rfkill snd soundcore video ucsi_acpi
typec_ucsi typec wmi i2c_scmi fuse xenfs ip_tables dm_thin_pool
dm_persistent_data dm_bio_prison dm_crypt trusted asn1_encoder
hid_multitouch amdgpu crct10dif_pclmul crc32_pclmul crc32c_intel
gpu_sched i2c_algo_bit drm_ttm_helper ghash_clmulni_intel ttm sdhci_pci
nvme cqhci serio_raw drm_kms_helper xhci_pci sdhci cec xhci_pci_renesas
ehci_pci mmc_core xhci_hcd drm ehci_hcd nvme_core xen_acpi_processor
xen_privcmd xen_pciback xen_blkback xen_gntalloc xen_gntdev xen_evtchn
uinput
dom0 kernel: CPU: 6 PID: 440 Comm: kworker/6:2 Tainted: G       
W        --------- ---  5.15.0-0.rc6.0.fc32.qubes.x86_64 #1
dom0 kernel: Hardware name: LENOVO 20Y1S02400/20Y1S02400, BIOS
R1BET65W(1.34 ) 06/17/2021
dom0 kernel: Workqueue:  0x0 (events)
dom0 kernel: RIP: e030:__update_blocked_fair+0x4f4/0x510
dom0 kernel: Code: 01 00 00 48 89 90 08 0a 00 00 e9 e6 fc ff ff 45 31 ff
e9 70 ff ff ff 48 c7 c7 48 dc 5f 82 c6 05 a7 5f ab 01 01 e8 93 19 c4 00
<0f> 0b 41 8b 86 78 01 00 00 e9 a5 fc ff ff 66 66 2e 0f 1f 84 00 00
dom0 kernel: RSP: e02b:ffffc900403f3cc0 EFLAGS: 00010082
dom0 kernel: RAX: 0000000000000000 RBX: ffff8881407abdb8 RCX:
ffff888140798dd8
dom0 kernel: RDX: 00000000ffffffd8 RSI: 0000000000000027 RDI:
ffff888140798dd0
dom0 kernel: RBP: ffff8881407ab780 R08: 0000000000000001 R09:
0000000000000000
dom0 kernel: R10: 0000000000000000 R11: ffffc900403f353d R12:
0000000000000030
dom0 kernel: R13: ffff8881407abf38 R14: ffff8881407ab600 R15:
0000000dfd9b4181
dom0 kernel: FS:  0000000000000000(0000) GS:ffff888140780000(0000)
knlGS:0000000000000000
dom0 kernel: CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
dom0 kernel: CR2: 000059eb0e9ecc36 CR3: 0000000002826000 CR4:
0000000000050660
dom0 kernel: Call Trace:
dom0 kernel:  update_blocked_averages+0xe3/0x280
dom0 kernel:  newidle_balance+0x160/0x600
dom0 kernel:  pick_next_task_fair+0x39/0x3f0
dom0 kernel:  pick_next_task+0x4c/0xbb0
dom0 kernel:  ? dequeue_task_fair+0xd1/0x4a0
dom0 kernel:  __schedule+0x135/0x600
dom0 kernel:  schedule+0x59/0xc0
dom0 kernel:  worker_thread+0xb3/0x310
dom0 kernel:  ? process_one_work+0x590/0x590
dom0 kernel:  kthread+0x120/0x140
dom0 kernel:  ? set_kthread_struct+0x40/0x40
dom0 kernel:  ret_from_fork+0x22/0x30
dom0 kernel: irq event stamp: 70
dom0 kernel: hardirqs last  enabled at (69): [<ffffffff81dfcdb4>]
_raw_spin_unlock_irq+0x24/0x40
dom0 kernel: hardirqs last disabled at (70): [<ffffffff81df4dea>]
__schedule+0x3aa/0x600
dom0 kernel: softirqs last  enabled at (0): [<ffffffff810f01a6>]
copy_process+0xc36/0x2b70
dom0 kernel: softirqs last disabled at (0): [<0000000000000000>] 0x0
dom0 kernel: ---[ end trace 7964a38470c363ee ]---
dom0 kernel: cpu 7 spinlock event irq 103
dom0 kernel: [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
dom0 kernel: ACPI: \_SB_.PLTF.C007: Found 3 idle states
dom0 kernel: ACPI: FW issue: working around C-state latencies out of order
dom0 kernel: CPU7 is up
dom0 kernel: ACPI: PM: Waking up from system sleep state S3
dom0 kernel: ACPI: EC: interrupt unblocked
dom0 kernel: pci 0000:00:00.2: restoring config space at offset 0x3c
(was 0x100, writing 0x1ff)
dom0 kernel: pci 0000:00:00.2: restoring config space at offset 0x4 (was
0x100004, writing 0x100000)
--
dom0 kernel: xen_acpi_processor: (_PXX): Hypervisor error (-19) for ACPI
CPU5
dom0 kernel: xen_acpi_processor: (_PXX): Hypervisor error (-19) for ACPI
CPU7
dom0 kernel: xen_acpi_processor: (_PXX): Hypervisor error (-19) for ACPI
CPU9
dom0 kernel: xen_acpi_processor: (_PXX): Hypervisor error (-19) for ACPI
CPU11
dom0 kernel: xen_acpi_processor: (_PXX): Hypervisor error (-19) for ACPI
CPU13
dom0 kernel: xen_acpi_processor: (_PXX): Hypervisor error (-19) for ACPI
CPU15
dom0 kernel: cpu 1 spinlock event irq 67
dom0 kernel: [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
dom0 kernel: ACPI: \_SB_.PLTF.C001: Found 3 idle states
dom0 kernel: ACPI: FW issue: working around C-state latencies out of order
dom0 kernel: CPU1 is up
dom0 kernel: installing Xen timer for CPU 2
dom0 kernel: cpu 2 spinlock event irq 73
dom0 kernel: [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
dom0 kernel: ACPI: \_SB_.PLTF.C002: Found 3 idle states
dom0 kernel: ACPI: FW issue: working around C-state latencies out of order
dom0 kernel: CPU2 is up
dom0 kernel: ------------[ cut here ]------------
dom0 kernel: installing Xen timer for CPU 3
dom0 kernel:
dom0 kernel: ======================================================
dom0 kernel: WARNING: possible circular locking dependency detected
dom0 kernel: 5.15.0-0.rc6.0.fc32.qubes.x86_64 #1 Tainted: G       
W        --------- ---
dom0 kernel: ------------------------------------------------------
dom0 kernel: kworker/2:2/600 is trying to acquire lock:
dom0 kernel: ffffffff829628b8 ((console_sem).lock){-...}-{2:2}, at:
down_trylock+0xf/0x30
dom0 kernel:
                          but task is already holding lock:
dom0 kernel: ffff8881406ab558 (&rq->__lock){-.-.}-{2:2}, at:
raw_spin_rq_lock_nested+0x1e/0x80
dom0 kernel:
                          which lock already depends on the new lock.
dom0 kernel:
                          the existing dependency chain (in reverse
order) is:
dom0 kernel:
                          -> #2 (&rq->__lock){-.-.}-{2:2}:
dom0 kernel:        __lock_acquire+0x3a0/0x6b0
dom0 kernel:        lock_acquire+0xf5/0x300
dom0 kernel:        _raw_spin_lock_nested+0x2a/0x40
dom0 kernel:        raw_spin_rq_lock_nested+0x1e/0x80
dom0 kernel:        task_fork_fair+0x39/0x180
dom0 kernel:        sched_fork+0x115/0x290
dom0 kernel:        copy_process+0xd2a/0x2b70
dom0 kernel:        kernel_clone+0xa4/0x300
dom0 kernel:        kernel_thread+0x55/0x70
dom0 kernel:        rest_init+0x1e/0x280
dom0 kernel:        start_kernel+0x659/0x697
dom0 kernel:        xen_start_kernel+0x5fa/0x61b
dom0 kernel:        reset_early_page_tables+0x0/0x9d
dom0 kernel:
                          -> #1 (&p->pi_lock){-.-.}-{2:2}:
dom0 kernel:        __lock_acquire+0x3a0/0x6b0
dom0 kernel:        lock_acquire+0xf5/0x300
dom0 kernel:        _raw_spin_lock_irqsave+0x48/0x60
dom0 kernel:        try_to_wake_up+0x53/0x5f0
dom0 kernel:        up+0x40/0x60
dom0 kernel:        __up_console_sem+0x56/0x70
dom0 kernel:        console_unlock+0x2ae/0x3c0
dom0 kernel:        do_con_write+0x28a/0x550
dom0 kernel:        con_write+0x10/0x30
dom0 kernel:        process_output_block+0x8b/0x1a0
dom0 kernel:        n_tty_write+0x194/0x3c0
dom0 kernel:        do_tty_write+0x137/0x270
dom0 kernel:        file_tty_write.constprop.0+0x8d/0xb0
dom0 kernel:        new_sync_write+0x15f/0x1f0
dom0 kernel:        vfs_write+0x243/0x350
dom0 kernel:        ksys_write+0x70/0xf0
dom0 kernel:        do_syscall_64+0x3b/0x90
dom0 kernel:        entry_SYSCALL_64_after_hwframe+0x44/0xae
dom0 kernel:
                          -> #0 ((console_sem).lock){-...}-{2:2}:
dom0 kernel:        check_prev_add+0x8f/0xbf0
dom0 kernel:        validate_chain+0x38a/0x420
dom0 kernel:        __lock_acquire+0x3a0/0x6b0
dom0 kernel:        lock_acquire+0xf5/0x300
dom0 kernel:        _raw_spin_lock_irqsave+0x48/0x60
dom0 kernel:        down_trylock+0xf/0x30
dom0 kernel:        __down_trylock_console_sem+0x32/0xa0
dom0 kernel:        console_trylock_spinning+0x13/0x1e0
dom0 kernel:        vprintk_emit+0xa8/0x160
dom0 kernel:        _printk+0x68/0x7f
dom0 kernel:        __warn_printk+0x51/0x93
dom0 kernel:        __update_blocked_fair+0x4f4/0x510
dom0 kernel:        update_blocked_averages+0xe3/0x280
dom0 kernel:        newidle_balance+0x160/0x600
dom0 kernel:        pick_next_task_fair+0x39/0x3f0
dom0 kernel:        pick_next_task+0x4c/0xbb0
dom0 kernel:        __schedule+0x135/0x600
dom0 kernel:        schedule+0x59/0xc0
dom0 kernel:        worker_thread+0xb3/0x310
dom0 kernel:        kthread+0x120/0x140
dom0 kernel:        ret_from_fork+0x22/0x30
dom0 kernel:
                          other info that might help us debug this:
dom0 kernel: Chain exists of:
                            (console_sem).lock --> &p->pi_lock -->
&rq->__lock
dom0 kernel:  Possible unsafe locking scenario:
dom0 kernel:        CPU0                    CPU1
dom0 kernel:        ----                    ----
dom0 kernel:   lock(&rq->__lock);
dom0 kernel:                                lock(&p->pi_lock);
dom0 kernel:                                lock(&rq->__lock);
dom0 kernel:   lock((console_sem).lock);
dom0 kernel:
                           *** DEADLOCK ***
dom0 kernel: 1 lock held by kworker/2:2/600:
dom0 kernel:  #0: ffff8881406ab558 (&rq->__lock){-.-.}-{2:2}, at:
raw_spin_rq_lock_nested+0x1e/0x80
dom0 kernel:
                          stack backtrace:
dom0 kernel: CPU: 2 PID: 600 Comm: kworker/2:2 Tainted: G       
W        --------- ---  5.15.0-0.rc6.0.fc32.qubes.x86_64 #1
dom0 kernel: Hardware name: LENOVO 20Y1S02400/20Y1S02400, BIOS
R1BET65W(1.34 ) 06/17/2021
dom0 kernel: Workqueue:  0x0 (events)
dom0 kernel: Call Trace:
dom0 kernel:  dump_stack_lvl+0x57/0x72
dom0 kernel:  check_noncircular+0x10a/0x120
dom0 kernel:  check_prev_add+0x8f/0xbf0
dom0 kernel:  ? add_chain_cache+0x10d/0x2d0
dom0 kernel:  validate_chain+0x38a/0x420
dom0 kernel:  __lock_acquire+0x3a0/0x6b0
dom0 kernel:  lock_acquire+0xf5/0x300
dom0 kernel:  ? down_trylock+0xf/0x30
dom0 kernel:  ? vprintk_emit+0xa8/0x160
dom0 kernel:  _raw_spin_lock_irqsave+0x48/0x60
dom0 kernel:  ? down_trylock+0xf/0x30
dom0 kernel:  down_trylock+0xf/0x30
dom0 kernel:  ? vprintk_emit+0xa8/0x160
dom0 kernel:  __down_trylock_console_sem+0x32/0xa0
dom0 kernel:  console_trylock_spinning+0x13/0x1e0
dom0 kernel:  vprintk_emit+0xa8/0x160
dom0 kernel:  _printk+0x68/0x7f
dom0 kernel:  __warn_printk+0x51/0x93
dom0 kernel:  ? lock_is_held_type+0xa5/0x120
dom0 kernel:  __update_blocked_fair+0x4f4/0x510
dom0 kernel:  update_blocked_averages+0xe3/0x280
dom0 kernel:  newidle_balance+0x160/0x600
dom0 kernel:  pick_next_task_fair+0x39/0x3f0
dom0 kernel:  pick_next_task+0x4c/0xbb0
dom0 kernel:  ? dequeue_task_fair+0xd1/0x4a0
dom0 kernel:  __schedule+0x135/0x600
dom0 kernel:  schedule+0x59/0xc0
dom0 kernel:  worker_thread+0xb3/0x310
dom0 kernel:  ? process_one_work+0x590/0x590
dom0 kernel:  kthread+0x120/0x140
dom0 kernel:  ? set_kthread_struct+0x40/0x40
dom0 kernel:  ret_from_fork+0x22/0x30
dom0 kernel: cfs_rq->avg.load_avg || cfs_rq->avg.util_avg ||
cfs_rq->avg.runnable_avg
dom0 kernel: WARNING: CPU: 2 PID: 600 at kernel/sched/fair.c:3339
__update_blocked_fair+0x4f4/0x510
dom0 kernel: Modules linked in: snd_seq_dummy snd_hrtimer snd_seq
snd_seq_device snd_timer nf_tables nfnetlink vfat fat intel_rapl_msr
think_lmi wmi_bmof firmware_attributes_class intel_rapl_common uvcvideo
pcspkr videobuf2_vmalloc videobuf2_memops videobuf2_v4l2
videobuf2_common joydev videodev k10temp mc iwlwifi sp5100_tco cfg80211
i2c_piix4 ipmi_devintf ipmi_msghandler r8169 thinkpad_acpi
platform_profile ledtrig_audio rfkill snd soundcore video ucsi_acpi
i2c_scmi typec_ucsi typec wmi fuse xenfs ip_tables dm_thin_pool
dm_persistent_data dm_bio_prison dm_crypt trusted asn1_encoder
hid_multitouch amdgpu crct10dif_pclmul crc32_pclmul crc32c_intel
gpu_sched i2c_algo_bit drm_ttm_helper ttm drm_kms_helper
ghash_clmulni_intel cec sdhci_pci cqhci xhci_pci drm sdhci ehci_pci
xhci_pci_renesas serio_raw mmc_core xhci_hcd ehci_hcd nvme nvme_core
xen_acpi_processor xen_privcmd xen_pciback xen_blkback xen_gntalloc
xen_gntdev xen_evtchn uinput
dom0 kernel: CPU: 2 PID: 600 Comm: kworker/2:2 Tainted: G       
W        --------- ---  5.15.0-0.rc6.0.fc32.qubes.x86_64 #1
dom0 kernel: Hardware name: LENOVO 20Y1S02400/20Y1S02400, BIOS
R1BET65W(1.34 ) 06/17/2021
dom0 kernel: Workqueue:  0x0 (events)
dom0 kernel: RIP: e030:__update_blocked_fair+0x4f4/0x510
dom0 kernel: Code: 01 00 00 48 89 90 08 0a 00 00 e9 e6 fc ff ff 45 31 ff
e9 70 ff ff ff 48 c7 c7 48 dc 5f 82 c6 05 a7 5f ab 01 01 e8 93 19 c4 00
<0f> 0b 41 8b 86 78 01 00 00 e9 a5 fc ff ff 66 66 2e 0f 1f 84 00 00
dom0 kernel: RSP: e02b:ffffc90041a5fcc0 EFLAGS: 00010082
dom0 kernel: RAX: 0000000000000000 RBX: ffff8881406abdb8 RCX:
ffff888140698dd8
dom0 kernel: RDX: 00000000ffffffd8 RSI: 0000000000000027 RDI:
ffff888140698dd0
dom0 kernel: RBP: ffff8881406ab780 R08: 0000000000000001 R09:
0000000000000000
dom0 kernel: R10: 0000000000000000 R11: ffffffffffffffff R12:
0000000000000010
dom0 kernel: R13: ffff8881406abf38 R14: ffff8881406ab600 R15:
0000003411f25932
dom0 kernel: FS:  0000000000000000(0000) GS:ffff888140680000(0000)
knlGS:0000000000000000
dom0 kernel: CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
dom0 kernel: CR2: 00005dd8d8bcb416 CR3: 0000000002826000 CR4:
0000000000050660
dom0 kernel: Call Trace:
dom0 kernel:  update_blocked_averages+0xe3/0x280
dom0 kernel:  newidle_balance+0x160/0x600
dom0 kernel:  pick_next_task_fair+0x39/0x3f0
dom0 kernel:  pick_next_task+0x4c/0xbb0
dom0 kernel:  ? dequeue_task_fair+0xd1/0x4a0
dom0 kernel:  __schedule+0x135/0x600
dom0 kernel:  schedule+0x59/0xc0
dom0 kernel:  worker_thread+0xb3/0x310
dom0 kernel:  ? process_one_work+0x590/0x590
dom0 kernel:  kthread+0x120/0x140
dom0 kernel:  ? set_kthread_struct+0x40/0x40
dom0 kernel:  ret_from_fork+0x22/0x30
dom0 kernel: irq event stamp: 3192
dom0 kernel: hardirqs last  enabled at (3191): [<ffffffff81dfcdb4>]
_raw_spin_unlock_irq+0x24/0x40
dom0 kernel: hardirqs last disabled at (3192): [<ffffffff81df4dea>]
__schedule+0x3aa/0x600
dom0 kernel: softirqs last  enabled at (1788): [<ffffffff811e69a1>]
css_free_rwork_fn+0x71/0x350
dom0 kernel: softirqs last disabled at (1786): [<ffffffff811e6986>]
css_free_rwork_fn+0x56/0x350
dom0 kernel: ---[ end trace de8eced9fef0f636 ]---
dom0 kernel: cpu 3 spinlock event irq 79
dom0 kernel: [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
dom0 kernel: ACPI: \_SB_.PLTF.C003: Found 3 idle states
dom0 kernel: ACPI: FW issue: working around C-state latencies out of order
dom0 kernel: CPU3 is up
dom0 kernel: installing Xen timer for CPU 4
dom0 kernel: cpu 4 spinlock event irq 85
dom0 kernel: [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
dom0 kernel: ACPI: \_SB_.PLTF.C004: Found 3 idle states
dom0 kernel: ACPI: FW issue: working around C-state latencies out of order
dom0 kernel: CPU4 is up
dom0 kernel: installing Xen timer for CPU 5
dom0 kernel: cpu 5 spinlock event irq 91
dom0 kernel: [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
dom0 kernel: ACPI: \_SB_.PLTF.C005: Found 3 idle states
dom0 kernel: ACPI: FW issue: working around C-state latencies out of order
dom0 kernel: CPU5 is up
dom0 kernel: installing Xen timer for CPU 6
dom0 kernel: cpu 6 spinlock event irq 97
dom0 kernel: [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
(0x0)
dom0 kernel: ACPI: \_SB_.PLTF.C006: Found 3 idle states

===================

lspci -vvnn

===================
00:00.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir
Root Complex [1022:1630]
    Subsystem: Lenovo Device [17aa:5081]
    Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

00:00.2 IOMMU [0806]: Advanced Micro Devices, Inc. [AMD] Renoir IOMMU
[1022:1631]
    Subsystem: Lenovo Device [17aa:5081]
    Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Interrupt: pin A routed to IRQ 255
    Capabilities: [40] Secure device <?>
    Capabilities: [64] MSI: Enable+ Count=1/4 Maskable- 64bit+
        Address: 00000000fee00000  Data: 4030
    Capabilities: [74] HyperTransport: MSI Mapping Enable+ Fixed+

00:01.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir
PCIe Dummy Host Bridge [1022:1632]
    Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

00:02.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir
PCIe Dummy Host Bridge [1022:1632]
    Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

00:02.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir
PCIe GPP Bridge [1022:1634] (prog-if 00 [Normal decode])
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 32 bytes
    Interrupt: pin ? routed to IRQ 106
    Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
    I/O behind bridge: [disabled]
    Memory behind bridge: fd900000-fd9fffff [size=1M]
    Prefetchable memory behind bridge: [disabled]
    Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort+ <SERR- <PERR-
    BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
        PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
    Capabilities: [50] Power Management version 3
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [58] Express (v2) Root Port (Slot+), MSI 00
        DevCap:    MaxPayload 512 bytes, PhantFunc 0
            ExtTag+ RBE+
        DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-
            RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 256 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr- NonFatalErr+ FatalErr- UnsupReq+ AuxPwr-
TransPend-
        LnkCap:    Port #0, Speed 8GT/s, Width x8, ASPM L1, Exit Latency
L1 <64us
            ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
        LnkCtl:    ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 8GT/s (ok), Width x4 (downgraded)
            TrErr- Train- SlotClk+ DLActive+ BWMgmt+ ABWMgmt-
        SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug-
Surprise-
            Slot #0, PowerLimit 0.000W; Interlock- NoCompl+
        SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt-
HPIrq- LinkChg-
            Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
        SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+
Interlock-
            Changed: MRL- PresDet- LinkState+
        RootCap: CRSVisible+
        RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+
CRSVisible+
        RootSta: PME ReqID 0000, PMEStatus- PMEPending-
        DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
             10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt+
EETLPPrefix+, MaxEETLPPrefixes 1
             EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
             FRS- LN System CLS Not Supported, TPHComp+ ExtTPHComp- ARIFwd+
             AtomicOpsCap: Routing- 32bit+ 64bit+ 128bitCAS-
        DevCtl2: Completion Timeout: 65ms to 210ms, TimeoutDis- LTR+
OBFF Disabled, ARIFwd-
             AtomicOpsCtl: ReqEn- EgressBlck-
        LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer-
2Retimers- DRS-
        LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete+ EqualizationPhase1+
             EqualizationPhase2+ EqualizationPhase3+
LinkEqualizationRequest-
             Retimer- 2Retimers- CrosslinkRes: unsupported
    Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 00000000fee00000  Data: 4000
    Capabilities: [c0] Subsystem: Lenovo Device [17aa:5081]
    Capabilities: [c8] HyperTransport: MSI Mapping Enable+ Fixed+
    Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
Len=010 <?>
    Capabilities: [270 v1] Secondary PCI Express
        LnkCtl3: LnkEquIntrruptEn- PerformEqu-
        LaneErrStat: 0
    Capabilities: [2a0 v1] Access Control Services
        ACSCap:    SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+
UpstreamFwd+ EgressCtrl- DirectTrans+
        ACSCtl:    SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
UpstreamFwd+ EgressCtrl- DirectTrans-
    Capabilities: [370 v1] L1 PM Substates
        L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
L1_PM_Substates+
              PortCommonModeRestoreTime=24us PortTPowerOnTime=150us
        L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
               T_CommonMode=24us LTR1.2_Threshold=163840ns
        L1SubCtl2: T_PwrOn=150us
    Capabilities: [380 v1] Downstream Port Containment
        DpcCap:    INT Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP PIO Log
6, DL_ActiveErr+
        DpcCtl:    Trigger:0 Cmpl- INT- ErrCor- PoisonedTLP- SwTrigger-
DL_ActiveErr-
        DpcSta:    Trigger- Reason:00 INT- RPBusy- TriggerExt:00 RP PIO
ErrPtr:1f
        Source:    0000
    Capabilities: [400 v1] Data Link Feature <?>
    Capabilities: [410 v1] Physical Layer 16.0 GT/s <?>
    Capabilities: [440 v1] Lane Margining at the Receiver <?>
    Kernel driver in use: pcieport

00:02.2 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir
PCIe GPP Bridge [1022:1634] (prog-if 00 [Normal decode])
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 32 bytes
    Interrupt: pin ? routed to IRQ 107
    Bus: primary=00, secondary=02, subordinate=02, sec-latency=0
    I/O behind bridge: 00003000-00003fff [size=4K]
    Memory behind bridge: fd800000-fd8fffff [size=1M]
    Prefetchable memory behind bridge: [disabled]
    Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort+ <SERR- <PERR-
    BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
        PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
    Capabilities: [50] Power Management version 3
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [58] Express (v2) Root Port (Slot+), MSI 00
        DevCap:    MaxPayload 512 bytes, PhantFunc 0
            ExtTag+ RBE+
        DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-
            RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
TransPend-
        LnkCap:    Port #5, Speed 8GT/s, Width x1, ASPM L1, Exit Latency
L1 <64us
            ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
        LnkCtl:    ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s (downgraded), Width x1 (ok)
            TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
        SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug-
Surprise-
            Slot #0, PowerLimit 0.000W; Interlock- NoCompl+
        SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt-
HPIrq- LinkChg-
            Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
        SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+
Interlock-
            Changed: MRL- PresDet- LinkState+
        RootCap: CRSVisible+
        RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+
CRSVisible+
        RootSta: PME ReqID 0000, PMEStatus- PMEPending-
        DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
             10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt+
EETLPPrefix+, MaxEETLPPrefixes 1
             EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
             FRS- LN System CLS Not Supported, TPHComp+ ExtTPHComp- ARIFwd+
             AtomicOpsCap: Routing- 32bit+ 64bit+ 128bitCAS-
        DevCtl2: Completion Timeout: 65ms to 210ms, TimeoutDis- LTR+
OBFF Disabled, ARIFwd-
             AtomicOpsCtl: ReqEn- EgressBlck-
        LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer-
2Retimers- DRS-
        LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete- EqualizationPhase1-
             EqualizationPhase2- EqualizationPhase3-
LinkEqualizationRequest-
             Retimer- 2Retimers- CrosslinkRes: unsupported
    Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 00000000fee00000  Data: 4000
    Capabilities: [c0] Subsystem: Lenovo Device [17aa:5081]
    Capabilities: [c8] HyperTransport: MSI Mapping Enable+ Fixed+
    Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
Len=010 <?>
    Capabilities: [270 v1] Secondary PCI Express
        LnkCtl3: LnkEquIntrruptEn- PerformEqu-
        LaneErrStat: 0
    Capabilities: [2a0 v1] Access Control Services
        ACSCap:    SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+
UpstreamFwd+ EgressCtrl- DirectTrans+
        ACSCtl:    SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
UpstreamFwd+ EgressCtrl- DirectTrans-
    Capabilities: [370 v1] L1 PM Substates
        L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
L1_PM_Substates+
              PortCommonModeRestoreTime=150us PortTPowerOnTime=150us
        L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
               T_CommonMode=150us LTR1.2_Threshold=294912ns
        L1SubCtl2: T_PwrOn=150us
    Capabilities: [380 v1] Downstream Port Containment
        DpcCap:    INT Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP PIO Log
6, DL_ActiveErr+
        DpcCtl:    Trigger:0 Cmpl- INT- ErrCor- PoisonedTLP- SwTrigger-
DL_ActiveErr-
        DpcSta:    Trigger- Reason:00 INT- RPBusy- TriggerExt:00 RP PIO
ErrPtr:1f
        Source:    0000
    Capabilities: [400 v1] Data Link Feature <?>
    Capabilities: [410 v1] Physical Layer 16.0 GT/s <?>
    Capabilities: [440 v1] Lane Margining at the Receiver <?>
    Kernel driver in use: pcieport

00:02.3 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir
PCIe GPP Bridge [1022:1634] (prog-if 00 [Normal decode])
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 32 bytes
    Interrupt: pin ? routed to IRQ 108
    Bus: primary=00, secondary=03, subordinate=03, sec-latency=0
    I/O behind bridge: 00004000-00004fff [size=4K]
    Memory behind bridge: fd700000-fd7fffff [size=1M]
    Prefetchable memory behind bridge: 0000000c30000000-0000000c301fffff
[size=2M]
    Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort+ <SERR- <PERR-
    BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
        PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
    Capabilities: [50] Power Management version 3
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [58] Express (v2) Root Port (Slot+), MSI 00
        DevCap:    MaxPayload 512 bytes, PhantFunc 0
            ExtTag+ RBE+
        DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-
            RlxdOrd- ExtTag+ PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr- NonFatalErr+ FatalErr- UnsupReq+ AuxPwr-
TransPend-
        LnkCap:    Port #6, Speed 8GT/s, Width x1, ASPM L1, Exit Latency
L1 <64us
            ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
        LnkCtl:    ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 5GT/s (downgraded), Width x1 (ok)
            TrErr- Train- SlotClk+ DLActive+ BWMgmt+ ABWMgmt-
        SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+
Surprise+
            Slot #0, PowerLimit 0.000W; Interlock- NoCompl+
        SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt-
HPIrq- LinkChg-
            Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
        SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+
Interlock-
            Changed: MRL- PresDet- LinkState+
        RootCap: CRSVisible+
        RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+
CRSVisible+
        RootSta: PME ReqID 0000, PMEStatus- PMEPending-
        DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
             10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt+
EETLPPrefix+, MaxEETLPPrefixes 1
             EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
             FRS- LN System CLS Not Supported, TPHComp+ ExtTPHComp- ARIFwd+
             AtomicOpsCap: Routing- 32bit+ 64bit+ 128bitCAS-
        DevCtl2: Completion Timeout: 65ms to 210ms, TimeoutDis- LTR+
OBFF Disabled, ARIFwd-
             AtomicOpsCtl: ReqEn- EgressBlck-
        LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer-
2Retimers- DRS-
        LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete- EqualizationPhase1-
             EqualizationPhase2- EqualizationPhase3-
LinkEqualizationRequest-
             Retimer- 2Retimers- CrosslinkRes: unsupported
    Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 00000000fee00000  Data: 4000
    Capabilities: [c0] Subsystem: Lenovo Device [17aa:5081]
    Capabilities: [c8] HyperTransport: MSI Mapping Enable+ Fixed+
    Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
Len=010 <?>
    Capabilities: [270 v1] Secondary PCI Express
        LnkCtl3: LnkEquIntrruptEn- PerformEqu-
        LaneErrStat: 0
    Capabilities: [2a0 v1] Access Control Services
        ACSCap:    SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+
UpstreamFwd+ EgressCtrl- DirectTrans+
        ACSCtl:    SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
UpstreamFwd+ EgressCtrl- DirectTrans-
    Capabilities: [370 v1] L1 PM Substates
        L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
L1_PM_Substates+
              PortCommonModeRestoreTime=30us PortTPowerOnTime=150us
        L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
               T_CommonMode=30us LTR1.2_Threshold=163840ns
        L1SubCtl2: T_PwrOn=150us
    Capabilities: [380 v1] Downstream Port Containment
        DpcCap:    INT Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP PIO Log
6, DL_ActiveErr+
        DpcCtl:    Trigger:0 Cmpl- INT- ErrCor- PoisonedTLP- SwTrigger-
DL_ActiveErr-
        DpcSta:    Trigger- Reason:00 INT- RPBusy- TriggerExt:00 RP PIO
ErrPtr:1f
        Source:    0000
    Capabilities: [400 v1] Data Link Feature <?>
    Capabilities: [410 v1] Physical Layer 16.0 GT/s <?>
    Capabilities: [440 v1] Lane Margining at the Receiver <?>
    Kernel driver in use: pcieport

00:02.4 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir
PCIe GPP Bridge [1022:1634] (prog-if 00 [Normal decode])
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 32 bytes
    Interrupt: pin ? routed to IRQ 109
    Bus: primary=00, secondary=04, subordinate=04, sec-latency=0
    I/O behind bridge: [disabled]
    Memory behind bridge: fd600000-fd6fffff [size=1M]
    Prefetchable memory behind bridge: [disabled]
    Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort+ <SERR- <PERR-
    BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
        PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
    Capabilities: [50] Power Management version 3
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [58] Express (v2) Root Port (Slot+), MSI 00
        DevCap:    MaxPayload 512 bytes, PhantFunc 0
            ExtTag+ RBE+
        DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-
            RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
TransPend-
        LnkCap:    Port #3, Speed 8GT/s, Width x1, ASPM L1, Exit Latency
L1 <64us
            ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
        LnkCtl:    ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s (downgraded), Width x1 (ok)
            TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
        SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug-
Surprise-
            Slot #0, PowerLimit 0.000W; Interlock- NoCompl+
        SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt-
HPIrq- LinkChg-
            Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
        SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+
Interlock-
            Changed: MRL- PresDet- LinkState+
        RootCap: CRSVisible+
        RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+
CRSVisible+
        RootSta: PME ReqID 0000, PMEStatus- PMEPending-
        DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
             10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt+
EETLPPrefix+, MaxEETLPPrefixes 1
             EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
             FRS- LN System CLS Not Supported, TPHComp+ ExtTPHComp- ARIFwd+
             AtomicOpsCap: Routing- 32bit+ 64bit+ 128bitCAS-
        DevCtl2: Completion Timeout: 65ms to 210ms, TimeoutDis- LTR+
OBFF Disabled, ARIFwd-
             AtomicOpsCtl: ReqEn- EgressBlck-
        LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer-
2Retimers- DRS-
        LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete- EqualizationPhase1-
             EqualizationPhase2- EqualizationPhase3-
LinkEqualizationRequest-
             Retimer- 2Retimers- CrosslinkRes: unsupported
    Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 00000000fee00000  Data: 4000
    Capabilities: [c0] Subsystem: Lenovo Device [17aa:5081]
    Capabilities: [c8] HyperTransport: MSI Mapping Enable+ Fixed+
    Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
Len=010 <?>
    Capabilities: [270 v1] Secondary PCI Express
        LnkCtl3: LnkEquIntrruptEn- PerformEqu-
        LaneErrStat: 0
    Capabilities: [2a0 v1] Access Control Services
        ACSCap:    SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+
UpstreamFwd+ EgressCtrl- DirectTrans+
        ACSCtl:    SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
UpstreamFwd+ EgressCtrl- DirectTrans-
    Capabilities: [370 v1] L1 PM Substates
        L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
L1_PM_Substates+
              PortCommonModeRestoreTime=255us PortTPowerOnTime=150us
        L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
               T_CommonMode=255us LTR1.2_Threshold=3145728ns
        L1SubCtl2: T_PwrOn=3100us
    Capabilities: [380 v1] Downstream Port Containment
        DpcCap:    INT Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP PIO Log
6, DL_ActiveErr+
        DpcCtl:    Trigger:0 Cmpl- INT- ErrCor- PoisonedTLP- SwTrigger-
DL_ActiveErr-
        DpcSta:    Trigger- Reason:00 INT- RPBusy- TriggerExt:00 RP PIO
ErrPtr:1f
        Source:    0000
    Capabilities: [400 v1] Data Link Feature <?>
    Capabilities: [410 v1] Physical Layer 16.0 GT/s <?>
    Capabilities: [440 v1] Lane Margining at the Receiver <?>
    Kernel driver in use: pcieport

00:02.6 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir
PCIe GPP Bridge [1022:1634] (prog-if 00 [Normal decode])
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 32 bytes
    Interrupt: pin ? routed to IRQ 110
    Bus: primary=00, secondary=05, subordinate=05, sec-latency=0
    I/O behind bridge: 00002000-00002fff [size=4K]
    Memory behind bridge: fd500000-fd5fffff [size=1M]
    Prefetchable memory behind bridge: [disabled]
    Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort+ <SERR- <PERR-
    BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
        PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
    Capabilities: [50] Power Management version 3
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [58] Express (v2) Root Port (Slot+), MSI 00
        DevCap:    MaxPayload 512 bytes, PhantFunc 0
            ExtTag+ RBE+
        DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-
            RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
TransPend-
        LnkCap:    Port #2, Speed 8GT/s, Width x2, ASPM L1, Exit Latency
L1 <64us
            ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
        LnkCtl:    ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s (downgraded), Width x1 (downgraded)
            TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
        SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug-
Surprise-
            Slot #0, PowerLimit 0.000W; Interlock- NoCompl+
        SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt-
HPIrq- LinkChg-
            Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
        SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+
Interlock-
            Changed: MRL- PresDet- LinkState+
        RootCap: CRSVisible+
        RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+
CRSVisible+
        RootSta: PME ReqID 0000, PMEStatus- PMEPending-
        DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
             10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt+
EETLPPrefix+, MaxEETLPPrefixes 1
             EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
             FRS- LN System CLS Not Supported, TPHComp+ ExtTPHComp- ARIFwd+
             AtomicOpsCap: Routing- 32bit+ 64bit+ 128bitCAS-
        DevCtl2: Completion Timeout: 65ms to 210ms, TimeoutDis- LTR-
OBFF Disabled, ARIFwd-
             AtomicOpsCtl: ReqEn- EgressBlck-
        LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer-
2Retimers- DRS-
        LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis+
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete- EqualizationPhase1-
             EqualizationPhase2- EqualizationPhase3-
LinkEqualizationRequest-
             Retimer- 2Retimers- CrosslinkRes: unsupported
    Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 00000000fee00000  Data: 4000
    Capabilities: [c0] Subsystem: Lenovo Device [17aa:5081]
    Capabilities: [c8] HyperTransport: MSI Mapping Enable+ Fixed+
    Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
Len=010 <?>
    Capabilities: [270 v1] Secondary PCI Express
        LnkCtl3: LnkEquIntrruptEn- PerformEqu-
        LaneErrStat: 0
    Capabilities: [2a0 v1] Access Control Services
        ACSCap:    SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+
UpstreamFwd+ EgressCtrl- DirectTrans+
        ACSCtl:    SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
UpstreamFwd+ EgressCtrl- DirectTrans-
    Capabilities: [370 v1] L1 PM Substates
        L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
L1_PM_Substates+
              PortCommonModeRestoreTime=150us PortTPowerOnTime=150us
        L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
               T_CommonMode=150us LTR1.2_Threshold=294912ns
        L1SubCtl2: T_PwrOn=150us
    Capabilities: [380 v1] Downstream Port Containment
        DpcCap:    INT Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP PIO Log
6, DL_ActiveErr+
        DpcCtl:    Trigger:0 Cmpl- INT- ErrCor- PoisonedTLP- SwTrigger-
DL_ActiveErr-
        DpcSta:    Trigger- Reason:00 INT- RPBusy- TriggerExt:00 RP PIO
ErrPtr:1f
        Source:    0000
    Capabilities: [400 v1] Data Link Feature <?>
    Capabilities: [410 v1] Physical Layer 16.0 GT/s <?>
    Capabilities: [440 v1] Lane Margining at the Receiver <?>
    Kernel driver in use: pcieport

00:02.7 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir
PCIe GPP Bridge [1022:1634] (prog-if 00 [Normal decode])
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 32 bytes
    Interrupt: pin ? routed to IRQ 111
    Bus: primary=00, secondary=06, subordinate=06, sec-latency=0
    I/O behind bridge: [disabled]
    Memory behind bridge: fd400000-fd4fffff [size=1M]
    Prefetchable memory behind bridge: [disabled]
    Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort+ <SERR- <PERR-
    BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
        PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
    Capabilities: [50] Power Management version 3
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [58] Express (v2) Root Port (Slot+), MSI 00
        DevCap:    MaxPayload 512 bytes, PhantFunc 0
            ExtTag+ RBE+
        DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-
            RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
TransPend-
        LnkCap:    Port #1, Speed 8GT/s, Width x2, ASPM not supported
            ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
        LnkCtl:    ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 5GT/s (downgraded), Width x1 (downgraded)
            TrErr- Train- SlotClk+ DLActive+ BWMgmt+ ABWMgmt+
        SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug-
Surprise-
            Slot #0, PowerLimit 0.000W; Interlock- NoCompl+
        SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt-
HPIrq- LinkChg-
            Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
        SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+
Interlock-
            Changed: MRL- PresDet- LinkState+
        RootCap: CRSVisible+
        RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+
CRSVisible+
        RootSta: PME ReqID 0000, PMEStatus- PMEPending-
        DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
             10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt+
EETLPPrefix+, MaxEETLPPrefixes 1
             EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
             FRS- LN System CLS Not Supported, TPHComp+ ExtTPHComp- ARIFwd+
             AtomicOpsCap: Routing- 32bit+ 64bit+ 128bitCAS-
        DevCtl2: Completion Timeout: 65ms to 210ms, TimeoutDis- LTR-
OBFF Disabled, ARIFwd-
             AtomicOpsCtl: ReqEn- EgressBlck-
        LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer-
2Retimers- DRS-
        LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete- EqualizationPhase1-
             EqualizationPhase2- EqualizationPhase3-
LinkEqualizationRequest-
             Retimer- 2Retimers- CrosslinkRes: unsupported
    Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 00000000fee00000  Data: 4000
    Capabilities: [c0] Subsystem: Lenovo Device [17aa:5081]
    Capabilities: [c8] HyperTransport: MSI Mapping Enable+ Fixed+
    Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
Len=010 <?>
    Capabilities: [270 v1] Secondary PCI Express
        LnkCtl3: LnkEquIntrruptEn- PerformEqu-
        LaneErrStat: 0
    Capabilities: [2a0 v1] Access Control Services
        ACSCap:    SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+
UpstreamFwd+ EgressCtrl- DirectTrans+
        ACSCtl:    SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
UpstreamFwd+ EgressCtrl- DirectTrans-
    Capabilities: [370 v1] L1 PM Substates
        L1SubCap: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
L1_PM_Substates+
        L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
        L1SubCtl2:
    Capabilities: [380 v1] Downstream Port Containment
        DpcCap:    INT Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP PIO Log
6, DL_ActiveErr+
        DpcCtl:    Trigger:0 Cmpl- INT- ErrCor- PoisonedTLP- SwTrigger-
DL_ActiveErr-
        DpcSta:    Trigger- Reason:00 INT- RPBusy- TriggerExt:00 RP PIO
ErrPtr:1f
        Source:    0000
    Capabilities: [400 v1] Data Link Feature <?>
    Capabilities: [410 v1] Physical Layer 16.0 GT/s <?>
    Capabilities: [440 v1] Lane Margining at the Receiver <?>
    Kernel driver in use: pcieport

00:08.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir
PCIe Dummy Host Bridge [1022:1632]
    Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

00:08.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir
Internal PCIe GPP Bridge to Bus [1022:1635] (prog-if 00 [Normal decode])
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 32 bytes
    Interrupt: pin A routed to IRQ 112
    Bus: primary=00, secondary=07, subordinate=07, sec-latency=0
    I/O behind bridge: 00001000-00001fff [size=4K]
    Memory behind bridge: fd000000-fd3fffff [size=4M]
    Prefetchable memory behind bridge: 0000000c60000000-0000000c701fffff
[size=258M]
    Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- <SERR- <PERR-
    BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
        PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
    Capabilities: [50] Power Management version 3
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [58] Express (v2) Root Port (Slot-), MSI 00
        DevCap:    MaxPayload 512 bytes, PhantFunc 0
            ExtTag+ RBE+
        DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-
            RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
TransPend-
        LnkCap:    Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s <64ns, L1 <1us
            ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
        LnkCtl:    ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 16GT/s (ok), Width x16 (ok)
            TrErr- Train- SlotClk+ DLActive+ BWMgmt+ ABWMgmt-
        RootCap: CRSVisible+
        RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+
CRSVisible+
        RootSta: PME ReqID 0000, PMEStatus- PMEPending-
        DevCap2: Completion Timeout: Not Supported, TimeoutDis-
NROPrPrP- LTR-
             10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt+
EETLPPrefix+, MaxEETLPPrefixes 4
             EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
             FRS- LN System CLS Not Supported, TPHComp- ExtTPHComp- ARIFwd-
             AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- OBFF
Disabled, ARIFwd-
             AtomicOpsCtl: ReqEn- EgressBlck-
        LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Retimer+
2Retimers+ DRS-
        LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedDis-
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete+ EqualizationPhase1+
             EqualizationPhase2+ EqualizationPhase3+
LinkEqualizationRequest-
             Retimer- 2Retimers- CrosslinkRes: unsupported
    Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 00000000fee00000  Data: 4000
    Capabilities: [c0] Subsystem: Device [5081:17aa]
    Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
Len=010 <?>
    Capabilities: [270 v1] Secondary PCI Express
        LnkCtl3: LnkEquIntrruptEn- PerformEqu-
        LaneErrStat: 0
    Capabilities: [400 v1] Data Link Feature <?>
    Capabilities: [410 v1] Physical Layer 16.0 GT/s <?>
    Capabilities: [440 v1] Lane Margining at the Receiver <?>
    Kernel driver in use: pcieport

00:14.0 SMBus [0c05]: Advanced Micro Devices, Inc. [AMD] FCH SMBus
Controller [1022:790b] (rev 51)
    Subsystem: Lenovo Device [17aa:5081]
    Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap- 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Kernel driver in use: piix4_smbus
    Kernel modules: i2c_piix4, sp5100_tco

00:14.3 ISA bridge [0601]: Advanced Micro Devices, Inc. [AMD] FCH LPC
Bridge [1022:790e] (rev 51)
    Subsystem: Lenovo Device [17aa:5081]
    Control: I/O+ Mem+ BusMaster+ SpecCycle+ MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap- 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0

00:18.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir
Device 24: Function 0 [1022:1448]
    Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

00:18.1 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir
Device 24: Function 1 [1022:1449]
    Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

00:18.2 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir
Device 24: Function 2 [1022:144a]
    Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

00:18.3 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir
Device 24: Function 3 [1022:144b]
    Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Kernel driver in use: k10temp
    Kernel modules: k10temp

00:18.4 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir
Device 24: Function 4 [1022:144c]
    Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

00:18.5 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir
Device 24: Function 5 [1022:144d]
    Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

00:18.6 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir
Device 24: Function 6 [1022:144e]
    Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

00:18.7 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir
Device 24: Function 7 [1022:144f]
    Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-

01:00.0 Non-Volatile memory controller [0108]: SK hynix Device
[1c5c:1639] (prog-if 02 [NVM Express])
    Subsystem: SK hynix Device [1c5c:1639]
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 32 bytes
    Interrupt: pin A routed to IRQ 36
    NUMA node: 0
    Region 0: Memory at fd900000 (64-bit, non-prefetchable) [size=16K]
    Region 2: Memory at fd905000 (32-bit, non-prefetchable) [size=4K]
    Region 3: Memory at fd904000 (32-bit, non-prefetchable) [size=4K]
    Capabilities: [80] Power Management version 3
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [90] MSI: Enable- Count=1/16 Maskable+ 64bit+
        Address: 0000000000000000  Data: 0000
        Masking: 00000000  Pending: 00000000
    Capabilities: [b0] MSI-X: Enable+ Count=17 Masked-
        Vector table: BAR=0 offset=00002000
        PBA: BAR=0 offset=00003000
    Capabilities: [c0] Express (v2) Endpoint, MSI 00
        DevCap:    MaxPayload 256 bytes, PhantFunc 0, Latency L0s
unlimited, L1 unlimited
            ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+
SlotPowerLimit 75.000W
        DevCtl:    CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
            RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+ FLReset-
            MaxPayload 256 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr-
TransPend-
        LnkCap:    Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency
L1 <64us
            ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
        LnkCtl:    ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 8GT/s (ok), Width x4 (ok)
            TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
        DevCap2: Completion Timeout: Range B, TimeoutDis+ NROPrPrP- LTR+
             10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt+
EETLPPrefix-
             EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
             FRS- TPHComp- ExtTPHComp-
             AtomicOpsCap: 32bit- 64bit- 128bitCAS-
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ OBFF
Disabled,
             AtomicOpsCtl: ReqEn-
        LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer-
2Retimers- DRS-
        LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete+ EqualizationPhase1+
             EqualizationPhase2+ EqualizationPhase3+
LinkEqualizationRequest-
             Retimer- 2Retimers- CrosslinkRes: unsupported
    Capabilities: [100 v2] Advanced Error Reporting
        UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
        CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
        CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
        AERCap:    First Error Pointer: 00, ECRCGenCap+ ECRCGenEn-
ECRCChkCap+ ECRCChkEn-
            MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
        HeaderLog: 04000001 0000210f 01010008 00000000
    Capabilities: [150 v1] Device Serial Number 00-00-00-00-00-00-00-00
    Capabilities: [160 v1] Power Budgeting <?>
    Capabilities: [1b8 v1] Latency Tolerance Reporting
        Max snoop latency: 1048576ns
        Max no snoop latency: 1048576ns
    Capabilities: [300 v1] Secondary PCI Express
        LnkCtl3: LnkEquIntrruptEn- PerformEqu-
        LaneErrStat: 0
    Capabilities: [400 v1] Vendor Specific Information: ID=0001 Rev=1
Len=010 <?>
    Capabilities: [900 v1] L1 PM Substates
        L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
L1_PM_Substates+
              PortCommonModeRestoreTime=24us PortTPowerOnTime=50us
        L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
               T_CommonMode=0us LTR1.2_Threshold=163840ns
        L1SubCtl2: T_PwrOn=150us
    Kernel driver in use: nvme
    Kernel modules: nvme

02:00.0 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd.
RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller [10ec:8168]
(rev 0e)
    Subsystem: Lenovo Device [17aa:5081]
    Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Interrupt: pin A routed to IRQ 40
    Region 0: I/O ports at 3400 [size=256]
    Region 2: Memory at fd814000 (64-bit, non-prefetchable) [size=4K]
    Region 4: Memory at fd800000 (64-bit, non-prefetchable) [size=16K]
    Capabilities: [40] Power Management version 3
        Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA
PME(D0+,D1+,D2+,D3hot+,D3cold+)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
        Address: 0000000000000000  Data: 0000
    Capabilities: [70] Express (v2) Endpoint, MSI 01
        DevCap:    MaxPayload 128 bytes, PhantFunc 0, Latency L0s
unlimited, L1 <64us
            ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
SlotPowerLimit 0.000W
        DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-
            RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr+
TransPend-
        LnkCap:    Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit
Latency L0s unlimited, L1 <64us
            ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
        LnkCtl:    ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
            ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s (ok), Width x1 (ok)
            TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
        DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
             10BitTagComp- 10BitTagReq- OBFF Via message/WAKE#, ExtFmt-
EETLPPrefix-
             EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
             FRS- TPHComp- ExtTPHComp-
             AtomicOpsCap: 32bit- 64bit- 128bitCAS-
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ OBFF
Disabled,
             AtomicOpsCtl: ReqEn-
        LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink- Retimer-
2Retimers- DRS-
        LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-
EqualizationPhase1-
             EqualizationPhase2- EqualizationPhase3-
LinkEqualizationRequest-
             Retimer- 2Retimers- CrosslinkRes: unsupported
    Capabilities: [b0] MSI-X: Enable- Count=4 Masked-
        Vector table: BAR=4 offset=00000000
        PBA: BAR=4 offset=00000800
    Capabilities: [d0] Vital Product Data
        Not readable
    Capabilities: [100 v2] Advanced Error Reporting
        UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
        CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
        CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
        AERCap:    First Error Pointer: 00, ECRCGenCap+ ECRCGenEn-
ECRCChkCap+ ECRCChkEn-
            MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
        HeaderLog: 00000000 00000000 00000000 00000000
    Capabilities: [140 v1] Virtual Channel
        Caps:    LPEVC=0 RefClk=100ns PATEntryBits=1
        Arb:    Fixed- WRR32- WRR64- WRR128-
        Ctrl:    ArbSelect=Fixed
        Status:    InProgress-
        VC0:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
            Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
            Ctrl:    Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
            Status:    NegoPending- InProgress-
    Capabilities: [160 v1] Device Serial Number 01-00-00-00-68-4c-e0-00
    Capabilities: [170 v1] Latency Tolerance Reporting
        Max snoop latency: 1048576ns
        Max no snoop latency: 1048576ns
    Capabilities: [178 v1] L1 PM Substates
        L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
L1_PM_Substates+
              PortCommonModeRestoreTime=150us PortTPowerOnTime=150us
        L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
               T_CommonMode=0us LTR1.2_Threshold=294912ns
        L1SubCtl2: T_PwrOn=150us
    Kernel driver in use: pciback
    Kernel modules: r8169

02:00.1 Serial controller [0700]: Realtek Semiconductor Co., Ltd.
RTL8111xP UART #1 [10ec:816a] (rev 0e) (prog-if 02 [16550])
    Subsystem: Lenovo Device [17aa:5081]
    Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Interrupt: pin B routed to IRQ 41
    Region 0: I/O ports at 3200 [size=256]
    Region 2: Memory at fd815000 (64-bit, non-prefetchable) [size=4K]
    Region 4: Memory at fd804000 (64-bit, non-prefetchable) [size=16K]
    Capabilities: [40] Power Management version 3
        Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA
PME(D0+,D1+,D2+,D3hot+,D3cold+)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
        Address: 0000000000000000  Data: 0000
    Capabilities: [70] Express (v2) Endpoint, MSI 01
        DevCap:    MaxPayload 128 bytes, PhantFunc 0, Latency L0s
unlimited, L1 <64us
            ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
SlotPowerLimit 0.000W
        DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-
            RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr+
TransPend-
        LnkCap:    Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit
Latency L0s unlimited, L1 <64us
            ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
        LnkCtl:    ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s (ok), Width x1 (ok)
            TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
        DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
             10BitTagComp- 10BitTagReq- OBFF Via message/WAKE#, ExtFmt-
EETLPPrefix-
             EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
             FRS- TPHComp- ExtTPHComp-
             AtomicOpsCap: 32bit- 64bit- 128bitCAS-
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- OBFF
Disabled,
             AtomicOpsCtl: ReqEn-
        LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-
EqualizationPhase1-
             EqualizationPhase2- EqualizationPhase3-
LinkEqualizationRequest-
             Retimer- 2Retimers- CrosslinkRes: unsupported
    Capabilities: [b0] MSI-X: Enable- Count=4 Masked-
        Vector table: BAR=4 offset=00000000
        PBA: BAR=4 offset=00000800
    Capabilities: [d0] Vital Product Data
        Not readable
    Capabilities: [100 v2] Advanced Error Reporting
        UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
        CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
        CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
        AERCap:    First Error Pointer: 00, ECRCGenCap+ ECRCGenEn-
ECRCChkCap+ ECRCChkEn-
            MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
        HeaderLog: 00000000 00000000 00000000 00000000
    Capabilities: [160 v1] Device Serial Number 00-00-00-00-00-00-00-00
    Capabilities: [170 v1] Latency Tolerance Reporting
        Max snoop latency: 1048576ns
        Max no snoop latency: 1048576ns
    Capabilities: [178 v1] L1 PM Substates
        L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
L1_PM_Substates+
              PortCommonModeRestoreTime=150us PortTPowerOnTime=150us
        L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
               T_CommonMode=0us LTR1.2_Threshold=294912ns
        L1SubCtl2: T_PwrOn=150us
    Kernel driver in use: serial

02:00.2 Serial controller [0700]: Realtek Semiconductor Co., Ltd.
RTL8111xP UART #2 [10ec:816b] (rev 0e) (prog-if 02 [16550])
    Subsystem: Lenovo Device [17aa:5081]
    Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Interrupt: pin C routed to IRQ 42
    Region 0: I/O ports at 3100 [size=256]
    Region 2: Memory at fd816000 (64-bit, non-prefetchable) [size=4K]
    Region 4: Memory at fd808000 (64-bit, non-prefetchable) [size=16K]
    Capabilities: [40] Power Management version 3
        Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA
PME(D0+,D1+,D2+,D3hot+,D3cold+)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
        Address: 0000000000000000  Data: 0000
    Capabilities: [70] Express (v2) Endpoint, MSI 01
        DevCap:    MaxPayload 128 bytes, PhantFunc 0, Latency L0s
unlimited, L1 <64us
            ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
SlotPowerLimit 0.000W
        DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-
            RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr+
TransPend-
        LnkCap:    Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit
Latency L0s unlimited, L1 <64us
            ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
        LnkCtl:    ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s (ok), Width x1 (ok)
            TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
        DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
             10BitTagComp- 10BitTagReq- OBFF Via message/WAKE#, ExtFmt-
EETLPPrefix-
             EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
             FRS- TPHComp- ExtTPHComp-
             AtomicOpsCap: 32bit- 64bit- 128bitCAS-
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- OBFF
Disabled,
             AtomicOpsCtl: ReqEn-
        LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-
EqualizationPhase1-
             EqualizationPhase2- EqualizationPhase3-
LinkEqualizationRequest-
             Retimer- 2Retimers- CrosslinkRes: unsupported
    Capabilities: [b0] MSI-X: Enable- Count=4 Masked-
        Vector table: BAR=4 offset=00000000
        PBA: BAR=4 offset=00000800
    Capabilities: [d0] Vital Product Data
        Not readable
    Capabilities: [100 v2] Advanced Error Reporting
        UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
        CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
        CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
        AERCap:    First Error Pointer: 00, ECRCGenCap+ ECRCGenEn-
ECRCChkCap+ ECRCChkEn-
            MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
        HeaderLog: 00000000 00000000 00000000 00000000
    Capabilities: [160 v1] Device Serial Number 00-00-00-00-00-00-00-00
    Capabilities: [170 v1] Latency Tolerance Reporting
        Max snoop latency: 1048576ns
        Max no snoop latency: 1048576ns
    Capabilities: [178 v1] L1 PM Substates
        L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
L1_PM_Substates+
              PortCommonModeRestoreTime=150us PortTPowerOnTime=150us
        L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
               T_CommonMode=0us LTR1.2_Threshold=294912ns
        L1SubCtl2: T_PwrOn=150us
    Kernel driver in use: serial

02:00.3 IPMI Interface [0c07]: Realtek Semiconductor Co., Ltd. RTL8111xP
IPMI interface [10ec:816c] (rev 0e) (prog-if 01 [KCS])
    Subsystem: Lenovo Device [17aa:5081]
    Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Interrupt: pin D routed to IRQ 255
    Region 0: I/O ports at 3000 [disabled] [size=256]
    Region 2: Memory at fd817000 (64-bit, non-prefetchable) [disabled]
[size=4K]
    Region 4: Memory at fd80c000 (64-bit, non-prefetchable) [disabled]
[size=16K]
    Capabilities: [40] Power Management version 3
        Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA
PME(D0+,D1+,D2+,D3hot+,D3cold+)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
        Address: 0000000000000000  Data: 0000
    Capabilities: [70] Express (v2) Endpoint, MSI 01
        DevCap:    MaxPayload 128 bytes, PhantFunc 0, Latency L0s
unlimited, L1 <64us
            ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
SlotPowerLimit 0.000W
        DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-
            RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr+
TransPend-
        LnkCap:    Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit
Latency L0s unlimited, L1 <64us
            ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
        LnkCtl:    ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s (ok), Width x1 (ok)
            TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
        DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
             10BitTagComp- 10BitTagReq- OBFF Via message/WAKE#, ExtFmt-
EETLPPrefix-
             EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
             FRS- TPHComp- ExtTPHComp-
             AtomicOpsCap: 32bit- 64bit- 128bitCAS-
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- OBFF
Disabled,
             AtomicOpsCtl: ReqEn-
        LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-
EqualizationPhase1-
             EqualizationPhase2- EqualizationPhase3-
LinkEqualizationRequest-
             Retimer- 2Retimers- CrosslinkRes: unsupported
    Capabilities: [b0] MSI-X: Enable- Count=4 Masked-
        Vector table: BAR=4 offset=00000000
        PBA: BAR=4 offset=00000800
    Capabilities: [d0] Vital Product Data
        Not readable
    Capabilities: [100 v2] Advanced Error Reporting
        UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
        CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
        CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
        AERCap:    First Error Pointer: 00, ECRCGenCap+ ECRCGenEn-
ECRCChkCap+ ECRCChkEn-
            MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
        HeaderLog: 00000000 00000000 00000000 00000000
    Capabilities: [160 v1] Device Serial Number 00-00-00-00-00-00-00-00
    Capabilities: [170 v1] Latency Tolerance Reporting
        Max snoop latency: 1048576ns
        Max no snoop latency: 1048576ns
    Capabilities: [178 v1] L1 PM Substates
        L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
L1_PM_Substates+
              PortCommonModeRestoreTime=150us PortTPowerOnTime=150us
        L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
               T_CommonMode=0us LTR1.2_Threshold=294912ns
        L1SubCtl2: T_PwrOn=150us
    Kernel modules: ipmi_si

02:00.4 USB controller [0c03]: Realtek Semiconductor Co., Ltd. RTL811x
EHCI host controller [10ec:816d] (rev 0e) (prog-if 20 [EHCI])
    Subsystem: Lenovo Device [17aa:5081]
    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 32 bytes
    Interrupt: pin D routed to IRQ 114
    Region 0: Memory at fd818000 (32-bit, non-prefetchable) [size=4K]
    Region 2: Memory at fd810000 (64-bit, non-prefetchable) [size=16K]
    Capabilities: [40] Power Management version 3
        Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA
PME(D0+,D1+,D2+,D3hot+,D3cold+)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [50] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 00000000fee00000  Data: 4000
    Capabilities: [70] Express (v2) Endpoint, MSI 01
        DevCap:    MaxPayload 128 bytes, PhantFunc 0, Latency L0s
unlimited, L1 <64us
            ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
SlotPowerLimit 0.000W
        DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-
            RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr+
TransPend-
        LnkCap:    Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit
Latency L0s unlimited, L1 <64us
            ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
        LnkCtl:    ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
            ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s (ok), Width x1 (ok)
            TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
        DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
             10BitTagComp- 10BitTagReq- OBFF Via message/WAKE#, ExtFmt-
EETLPPrefix-
             EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
             FRS- TPHComp- ExtTPHComp-
             AtomicOpsCap: 32bit- 64bit- 128bitCAS-
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- OBFF
Disabled,
             AtomicOpsCtl: ReqEn-
        LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-
EqualizationPhase1-
             EqualizationPhase2- EqualizationPhase3-
LinkEqualizationRequest-
             Retimer- 2Retimers- CrosslinkRes: unsupported
    Capabilities: [b0] MSI-X: Enable- Count=4 Masked-
        Vector table: BAR=2 offset=00000000
        PBA: BAR=2 offset=00000800
    Capabilities: [d0] Vital Product Data
        Not readable
    Capabilities: [100 v2] Advanced Error Reporting
        UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
        CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
        CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
        AERCap:    First Error Pointer: 00, ECRCGenCap+ ECRCGenEn-
ECRCChkCap+ ECRCChkEn-
            MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
        HeaderLog: 00000000 00000000 00000000 00000000
    Capabilities: [160 v1] Device Serial Number 00-00-00-00-00-00-00-00
    Capabilities: [170 v1] Latency Tolerance Reporting
        Max snoop latency: 1048576ns
        Max no snoop latency: 1048576ns
    Capabilities: [178 v1] L1 PM Substates
        L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
L1_PM_Substates+
              PortCommonModeRestoreTime=150us PortTPowerOnTime=150us
        L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
               T_CommonMode=0us LTR1.2_Threshold=294912ns
        L1SubCtl2: T_PwrOn=150us
    Kernel driver in use: ehci-pci
    Kernel modules: ehci_pci

03:00.0 Network controller [0280]: Intel Corporation Wi-Fi 6 AX200
[8086:2723] (rev 1a)
    Subsystem: Intel Corporation Device [8086:0080]
    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 32 bytes
    Interrupt: pin A routed to IRQ 44
    Region 0: Memory at fd700000 (64-bit, non-prefetchable) [size=16K]
    Capabilities: [c8] Power Management version 3
        Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [d0] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 00000000fee06000  Data: 4000
    Capabilities: [40] Express (v2) Endpoint, MSI 00
        DevCap:    MaxPayload 128 bytes, PhantFunc 0, Latency L0s
<512ns, L1 unlimited
            ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+
SlotPowerLimit 0.000W
        DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-
            RlxdOrd- ExtTag- PhantFunc- AuxPwr+ NoSnoop+ FLReset-
            MaxPayload 128 bytes, MaxReadReq 128 bytes
        DevSta:    CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+
TransPend-
        LnkCap:    Port #6, Speed 5GT/s, Width x1, ASPM L1, Exit Latency
L1 <8us
            ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
        LnkCtl:    ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
            ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 5GT/s (ok), Width x1 (ok)
            TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
        DevCap2: Completion Timeout: Range B, TimeoutDis+ NROPrPrP- LTR+
             10BitTagComp- 10BitTagReq- OBFF Via WAKE#, ExtFmt- EETLPPrefix-
             EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
             FRS- TPHComp- ExtTPHComp-
             AtomicOpsCap: 32bit- 64bit- 128bitCAS-
        DevCtl2: Completion Timeout: 16ms to 55ms, TimeoutDis- LTR+ OBFF
Disabled,
             AtomicOpsCtl: ReqEn-
        LnkCap2: Supported Link Speeds: 2.5-5GT/s, Crosslink- Retimer-
2Retimers- DRS-
        LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-
EqualizationPhase1-
             EqualizationPhase2- EqualizationPhase3-
LinkEqualizationRequest-
             Retimer- 2Retimers- CrosslinkRes: unsupported
    Capabilities: [80] MSI-X: Enable- Count=16 Masked-
        Vector table: BAR=0 offset=00002000
        PBA: BAR=0 offset=00003000
    Capabilities: [100 v1] Advanced Error Reporting
        UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
        CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
        CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
        AERCap:    First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
ECRCChkCap- ECRCChkEn-
            MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
        HeaderLog: 00000000 00000000 00000000 00000000
    Capabilities: [14c v1] Latency Tolerance Reporting
        Max snoop latency: 1048576ns
        Max no snoop latency: 1048576ns
    Capabilities: [154 v1] L1 PM Substates
        L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
L1_PM_Substates+
              PortCommonModeRestoreTime=30us PortTPowerOnTime=18us
        L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
               T_CommonMode=0us LTR1.2_Threshold=163840ns
        L1SubCtl2: T_PwrOn=150us
    Kernel driver in use: pciback
    Kernel modules: iwlwifi

04:00.0 SD Host controller [0805]: Genesys Logic, Inc GL9750 SD Host
Controller [17a0:9750] (rev 01) (prog-if 01)
    Subsystem: Lenovo Device [17aa:5082]
    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 32 bytes
    Interrupt: pin A routed to IRQ 119
    Region 0: Memory at fd600000 (32-bit, non-prefetchable) [size=4K]
    Capabilities: [80] Express (v2) Endpoint, MSI 00
        DevCap:    MaxPayload 128 bytes, PhantFunc 0, Latency L0s <4us,
L1 unlimited
            ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
SlotPowerLimit 0.000W
        DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-
            RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr+
TransPend-
        LnkCap:    Port #80, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit
Latency L0s <4us, L1 unlimited
            ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
        LnkCtl:    ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
            ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s (ok), Width x1 (ok)
            TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
        DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
             10BitTagComp- 10BitTagReq- OBFF Via message/WAKE#, ExtFmt-
EETLPPrefix-
             EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
             FRS- TPHComp- ExtTPHComp-
             AtomicOpsCap: 32bit- 64bit- 128bitCAS-
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ OBFF
Disabled,
             AtomicOpsCtl: ReqEn-
        LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink- Retimer-
2Retimers- DRS-
        LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-
EqualizationPhase1-
             EqualizationPhase2- EqualizationPhase3-
LinkEqualizationRequest-
             Retimer- 2Retimers- CrosslinkRes: unsupported
    Capabilities: [e0] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 00000000fee00000  Data: 4000
    Capabilities: [f8] Power Management version 3
        Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA
PME(D0-,D1+,D2+,D3hot+,D3cold+)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [100 v1] Vendor Specific Information: ID=17a0 Rev=1
Len=008 <?>
    Capabilities: [108 v1] Latency Tolerance Reporting
        Max snoop latency: 1048576ns
        Max no snoop latency: 1048576ns
    Capabilities: [110 v1] L1 PM Substates
        L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
L1_PM_Substates+
              PortCommonModeRestoreTime=255us PortTPowerOnTime=3100us
        L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
               T_CommonMode=0us LTR1.2_Threshold=3145728ns
        L1SubCtl2: T_PwrOn=3100us
    Capabilities: [200 v1] Advanced Error Reporting
        UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
        CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
        CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
        AERCap:    First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
ECRCChkCap- ECRCChkEn-
            MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
        HeaderLog: 04000001 0000200f 04010008 1c5ad006
    Kernel driver in use: sdhci-pci
    Kernel modules: sdhci_pci

05:00.0 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd.
RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller [10ec:8168]
(rev 15)
    Subsystem: Lenovo Device [17aa:5081]
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 32 bytes
    Interrupt: pin A routed to IRQ 46
    Region 0: I/O ports at 2000 [size=256]
    Region 2: Memory at fd504000 (64-bit, non-prefetchable) [size=4K]
    Region 4: Memory at fd500000 (64-bit, non-prefetchable) [size=16K]
    Capabilities: [40] Power Management version 3
        Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA
PME(D0+,D1+,D2+,D3hot+,D3cold+)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [50] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 00000000fee0a000  Data: 4000
    Capabilities: [70] Express (v2) Endpoint, MSI 01
        DevCap:    MaxPayload 128 bytes, PhantFunc 0, Latency L0s
<512ns, L1 <64us
            ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
SlotPowerLimit 0.000W
        DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-
            RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+
TransPend-
        LnkCap:    Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit
Latency L0s unlimited, L1 <64us
            ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
        LnkCtl:    ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
            ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s (ok), Width x1 (ok)
            TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
        DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
             10BitTagComp- 10BitTagReq- OBFF Via message/WAKE#, ExtFmt-
EETLPPrefix-
             EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
             FRS- TPHComp- ExtTPHComp-
             AtomicOpsCap: 32bit- 64bit- 128bitCAS-
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ OBFF
Disabled,
             AtomicOpsCtl: ReqEn-
        LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink- Retimer-
2Retimers- DRS-
        LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-
EqualizationPhase1-
             EqualizationPhase2- EqualizationPhase3-
LinkEqualizationRequest-
             Retimer- 2Retimers- CrosslinkRes: unsupported
    Capabilities: [b0] MSI-X: Enable- Count=4 Masked-
        Vector table: BAR=4 offset=00000000
        PBA: BAR=4 offset=00000800
    Capabilities: [100 v2] Advanced Error Reporting
        UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
        CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
        CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
        AERCap:    First Error Pointer: 00, ECRCGenCap+ ECRCGenEn-
ECRCChkCap+ ECRCChkEn-
            MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
        HeaderLog: 00000000 00000000 00000000 00000000
    Capabilities: [140 v1] Virtual Channel
        Caps:    LPEVC=0 RefClk=100ns PATEntryBits=1
        Arb:    Fixed- WRR32- WRR64- WRR128-
        Ctrl:    ArbSelect=Fixed
        Status:    InProgress-
        VC0:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
            Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
            Ctrl:    Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
            Status:    NegoPending- InProgress-
    Capabilities: [160 v1] Device Serial Number 01-00-00-00-68-4c-e0-00
    Capabilities: [170 v1] Latency Tolerance Reporting
        Max snoop latency: 1048576ns
        Max no snoop latency: 1048576ns
    Capabilities: [178 v1] L1 PM Substates
        L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
L1_PM_Substates+
              PortCommonModeRestoreTime=150us PortTPowerOnTime=150us
        L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
               T_CommonMode=0us LTR1.2_Threshold=294912ns
        L1SubCtl2: T_PwrOn=150us
    Kernel driver in use: pciback
    Kernel modules: r8169

06:00.0 USB controller [0c03]: Renesas Technology Corp. uPD720202 USB
3.0 Host Controller [1912:0015] (rev 02) (prog-if 30 [XHCI])
    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 32 bytes
    Interrupt: pin A routed to IRQ 42
    Region 0: Memory at fd400000 (64-bit, non-prefetchable) [size=8K]
    Capabilities: [50] Power Management version 3
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [70] MSI: Enable+ Count=1/8 Maskable- 64bit+
        Address: 00000000fee0c000  Data: 4000
    Capabilities: [90] MSI-X: Enable- Count=8 Masked-
        Vector table: BAR=0 offset=00001000
        PBA: BAR=0 offset=00001080
    Capabilities: [a0] Express (v2) Endpoint, MSI 00
        DevCap:    MaxPayload 128 bytes, PhantFunc 0, Latency L0s
unlimited, L1 unlimited
            ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
SlotPowerLimit 0.000W
        DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-
            RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+
TransPend-
        LnkCap:    Port #0, Speed 5GT/s, Width x1, ASPM L0s L1, Exit
Latency L0s <4us, L1 unlimited
            ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-
        LnkCtl:    ASPM L0s Enabled; RCB 64 bytes, Disabled- CommClk+
            ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 5GT/s (ok), Width x1 (ok)
            TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
        DevCap2: Completion Timeout: Not Supported, TimeoutDis+
NROPrPrP- LTR+
             10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt-
EETLPPrefix-
             EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
             FRS- TPHComp- ExtTPHComp-
             AtomicOpsCap: 32bit- 64bit- 128bitCAS-
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- OBFF
Disabled,
             AtomicOpsCtl: ReqEn-
        LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete- EqualizationPhase1-
             EqualizationPhase2- EqualizationPhase3-
LinkEqualizationRequest-
             Retimer- 2Retimers- CrosslinkRes: unsupported
    Capabilities: [100 v1] Advanced Error Reporting
        UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
        CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
        CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
        AERCap:    First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
ECRCChkCap- ECRCChkEn-
            MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
        HeaderLog: 00000000 00000000 00000000 00000000
    Capabilities: [150 v1] Latency Tolerance Reporting
        Max snoop latency: 0ns
        Max no snoop latency: 0ns
    Kernel driver in use: pciback
    Kernel modules: xhci_pci

07:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Renoir [1002:1636] (rev d1) (prog-if 00 [VGA controller])
    Subsystem: Lenovo Device [17aa:5099]
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort+
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 32 bytes
    Interrupt: pin A routed to IRQ 38
    Region 0: Memory at c60000000 (64-bit, prefetchable) [size=256M]
    Region 2: Memory at c70000000 (64-bit, prefetchable) [size=2M]
    Region 4: I/O ports at 1000 [size=256]
    Region 5: Memory at fd300000 (32-bit, non-prefetchable) [size=512K]
    Capabilities: [48] Vendor Specific Information: Len=08 <?>
    Capabilities: [50] Power Management version 3
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1+,D2+,D3hot+,D3cold+)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [64] Express (v2) Legacy Endpoint, MSI 00
        DevCap:    MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us,
L1 unlimited
            ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
        DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-
            RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr- NonFatalErr+ FatalErr- UnsupReq+ AuxPwr-
TransPend-
        LnkCap:    Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s <64ns, L1 <1us
            ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
        LnkCtl:    ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 16GT/s (ok), Width x16 (ok)
            TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
        DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR-
             10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt+
EETLPPrefix+, MaxEETLPPrefixes 1
             EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
             FRS-
             AtomicOpsCap: 32bit- 64bit- 128bitCAS-
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- OBFF
Disabled,
             AtomicOpsCtl: ReqEn-
        LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Retimer+
2Retimers+ DRS-
        LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedDis-
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete+ EqualizationPhase1+
             EqualizationPhase2+ EqualizationPhase3+
LinkEqualizationRequest-
             Retimer- 2Retimers- CrosslinkRes: unsupported
    Capabilities: [a0] MSI: Enable- Count=1/4 Maskable- 64bit+
        Address: 0000000000000000  Data: 0000
    Capabilities: [c0] MSI-X: Enable+ Count=4 Masked-
        Vector table: BAR=5 offset=00042000
        PBA: BAR=5 offset=00043000
    Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
Len=010 <?>
    Capabilities: [270 v1] Secondary PCI Express
        LnkCtl3: LnkEquIntrruptEn- PerformEqu-
        LaneErrStat: 0
    Capabilities: [2b0 v1] Address Translation Service (ATS)
        ATSCap:    Invalidate Queue Depth: 00
        ATSCtl:    Enable-, Smallest Translation Unit: 00
    Capabilities: [2c0 v1] Page Request Interface (PRI)
        PRICtl: Enable- Reset-
        PRISta: RF- UPRGI- Stopped+
        Page Request Capacity: 00000100, Page Request Allocation: 00000000
    Capabilities: [2d0 v1] Process Address Space ID (PASID)
        PASIDCap: Exec+ Priv+, Max PASID Width: 10
        PASIDCtl: Enable- Exec- Priv-
    Capabilities: [400 v1] Data Link Feature <?>
    Capabilities: [410 v1] Physical Layer 16.0 GT/s <?>
    Capabilities: [440 v1] Lane Margining at the Receiver <?>
    Kernel driver in use: amdgpu
    Kernel modules: amdgpu

07:00.2 Encryption controller [1080]: Advanced Micro Devices, Inc. [AMD]
Family 17h (Models 10h-1fh) Platform Security Processor [1022:15df]
    Subsystem: Lenovo Device [17aa:5081]
    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort+
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 32 bytes
    Interrupt: pin C routed to IRQ 36
    Region 2: Memory at fd200000 (32-bit, non-prefetchable) [size=1M]
    Region 5: Memory at fd380000 (32-bit, non-prefetchable) [size=8K]
    Capabilities: [48] Vendor Specific Information: Len=08 <?>
    Capabilities: [50] Power Management version 3
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [64] Express (v2) Endpoint, MSI 00
        DevCap:    MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us,
L1 unlimited
            ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
SlotPowerLimit 0.000W
        DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-
            RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
TransPend-
        LnkCap:    Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s <64ns, L1 <1us
            ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
        LnkCtl:    ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 16GT/s (ok), Width x16 (ok)
            TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
        DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR-
             10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt+
EETLPPrefix+, MaxEETLPPrefixes 1
             EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
             FRS- TPHComp- ExtTPHComp-
             AtomicOpsCap: 32bit- 64bit- 128bitCAS-
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- OBFF
Disabled,
             AtomicOpsCtl: ReqEn-
        LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete- EqualizationPhase1-
             EqualizationPhase2- EqualizationPhase3-
LinkEqualizationRequest-
             Retimer- 2Retimers- CrosslinkRes: unsupported
    Capabilities: [a0] MSI: Enable- Count=1/2 Maskable- 64bit+
        Address: 0000000000000000  Data: 0000
    Capabilities: [c0] MSI-X: Enable+ Count=2 Masked-
        Vector table: BAR=5 offset=00000000
        PBA: BAR=5 offset=00001000
    Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
Len=010 <?>
    Kernel driver in use: ccp
    Kernel modules: ccp

07:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Renoir
USB 3.1 [1022:1639] (prog-if 30 [XHCI])
    Subsystem: Lenovo Device [17aa:5081]
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 32 bytes
    Interrupt: pin D routed to IRQ 37
    Region 0: Memory at fd000000 (64-bit, non-prefetchable) [size=1M]
    Capabilities: [48] Vendor Specific Information: Len=08 <?>
    Capabilities: [50] Power Management version 3
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [64] Express (v2) Endpoint, MSI 00
        DevCap:    MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us,
L1 unlimited
            ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
SlotPowerLimit 0.000W
        DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-
            RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
TransPend-
        LnkCap:    Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s <64ns, L1 <1us
            ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
        LnkCtl:    ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 16GT/s (ok), Width x16 (ok)
            TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
        DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR-
             10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt+
EETLPPrefix+, MaxEETLPPrefixes 1
             EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
             FRS- TPHComp- ExtTPHComp-
             AtomicOpsCap: 32bit- 64bit- 128bitCAS-
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- OBFF
Disabled,
             AtomicOpsCtl: ReqEn-
        LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete- EqualizationPhase1-
             EqualizationPhase2- EqualizationPhase3-
LinkEqualizationRequest-
             Retimer- 2Retimers- CrosslinkRes: unsupported
    Capabilities: [a0] MSI: Enable+ Count=1/8 Maskable- 64bit+
        Address: 00000000fee06000  Data: 4000
    Capabilities: [c0] MSI-X: Enable- Count=8 Masked-
        Vector table: BAR=0 offset=000fe000
        PBA: BAR=0 offset=000ff000
    Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
Len=010 <?>
    Kernel driver in use: pciback
    Kernel modules: xhci_pci

07:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Renoir
USB 3.1 [1022:1639] (prog-if 30 [XHCI])
    Subsystem: Lenovo Device [17aa:5081]
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 32 bytes
    Interrupt: pin A routed to IRQ 38
    Region 0: Memory at fd100000 (64-bit, non-prefetchable) [size=1M]
    Capabilities: [48] Vendor Specific Information: Len=08 <?>
    Capabilities: [50] Power Management version 3
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [64] Express (v2) Endpoint, MSI 00
        DevCap:    MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us,
L1 unlimited
            ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
SlotPowerLimit 0.000W
        DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-
            RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
TransPend-
        LnkCap:    Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s <64ns, L1 <1us
            ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
        LnkCtl:    ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 16GT/s (ok), Width x16 (ok)
            TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
        DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR-
             10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt+
EETLPPrefix+, MaxEETLPPrefixes 1
             EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
             FRS- TPHComp- ExtTPHComp-
             AtomicOpsCap: 32bit- 64bit- 128bitCAS-
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- OBFF
Disabled,
             AtomicOpsCtl: ReqEn-
        LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete- EqualizationPhase1-
             EqualizationPhase2- EqualizationPhase3-
LinkEqualizationRequest-
             Retimer- 2Retimers- CrosslinkRes: unsupported
    Capabilities: [a0] MSI: Enable+ Count=1/8 Maskable- 64bit+
        Address: 00000000fee0a000  Data: 4000
    Capabilities: [c0] MSI-X: Enable- Count=8 Masked-
        Vector table: BAR=0 offset=000fe000
        PBA: BAR=0 offset=000ff000
    Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
Len=010 <?>
    Kernel driver in use: pciback
    Kernel modules: xhci_pci



