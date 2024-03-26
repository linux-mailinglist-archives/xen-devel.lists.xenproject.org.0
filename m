Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 135CB88C017
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 12:01:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698022.1089337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp4Y3-00058o-7E; Tue, 26 Mar 2024 11:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698022.1089337; Tue, 26 Mar 2024 11:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp4Y3-00055a-3t; Tue, 26 Mar 2024 11:00:55 +0000
Received: by outflank-mailman (input) for mailman id 698022;
 Tue, 26 Mar 2024 11:00:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rp4Y1-00055Q-2j
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 11:00:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rp4Y0-0002UI-Kc; Tue, 26 Mar 2024 11:00:52 +0000
Received: from [15.248.2.236] (helo=[10.24.67.40])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rp4Y0-0006D0-DW; Tue, 26 Mar 2024 11:00:52 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=QWZofwvmlVWbl5uv5eb9W6/ukSSMKSt7x/77RKFCzpE=; b=bYMz4l5YHYh1WXqnDJJDTNSFTi
	TSAyyiEDGhkPszNy/708sipL7Yb3xPxxkgaBEFmRcshEmYz6YLpEnvMea85U+cA/fKYqvrAmQ27Ns
	qJb3mdyadBab6leB93uDIs+nYxSDadZ5DT7cH3kX9xvpiY9pbiQzvR7ABHfsJ/eW6PGo=;
Message-ID: <0f8c0e27-e60d-4e64-bc8a-6cb407c67ab2@xen.org>
Date: Tue, 26 Mar 2024 11:00:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: NULL pointer dereference in xenbus_thread->...
Content-Language: en-GB
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <ZO0WrR5J0xuwDIxW@mail-itl> <ZTUuRj6e5x5xFVqb@mail-itl>
 <ZgGjf3hpLHXXtb8z@mail-itl>
Cc: Juergen Gross <jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ZgGjf3hpLHXXtb8z@mail-itl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Marek,

+Juergen for visibility

When sending a bug report, I would suggest to CC relevant people as 
otherwise it can get lost (not may people monitors Xen devel if they are 
not CCed).

Cheers,

On 25/03/2024 16:17, Marek Marczykowski-Górecki wrote:
> On Sun, Oct 22, 2023 at 04:14:30PM +0200, Marek Marczykowski-Górecki wrote:
>> On Mon, Aug 28, 2023 at 11:50:36PM +0200, Marek Marczykowski-Górecki wrote:
>>> Hi,
>>>
>>> I've noticed in Qubes's CI failure like this:
>>>
>>> [  871.271292] BUG: kernel NULL pointer dereference, address: 0000000000000000
>>> [  871.275290] #PF: supervisor read access in kernel mode
>>> [  871.277282] #PF: error_code(0x0000) - not-present page
>>> [  871.279182] PGD 106fdb067 P4D 106fdb067 PUD 106fdc067 PMD 0
>>> [  871.281071] Oops: 0000 [#1] PREEMPT SMP NOPTI
>>> [  871.282698] CPU: 1 PID: 28 Comm: xenbus Not tainted 6.1.43-1.qubes.fc37.x86_64 #1
>>> [  871.285222] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552-rebuilt.opensuse.org 04/01/2014
>>> [  871.288883] RIP: e030:__wake_up_common+0x4c/0x180
>>> [  871.292838] Code: 24 0c 89 4c 24 08 4d 85 c9 74 0a 41 f6 01 04 0f 85 a3 00 00 00 48 8b 43 08 4c 8d 40 e8 48 83 c3 08 49 8d 40 18 48 39 c3 74 5b <49> 8b 40 18 31 ed 4c 8d 70 e8 45 8b 28 41 f6 c5 04 75 5f 49 8b 40
>>> [  871.299776] RSP: e02b:ffffc900400f7e10 EFLAGS: 00010082
>>> [  871.301656] RAX: 0000000000000000 RBX: ffff88810541ce98 RCX: 0000000000000000
>>> [  871.304255] RDX: 0000000000000001 RSI: 0000000000000003 RDI: ffff88810541ce90
>>> [  871.306714] RBP: ffffc900400f0280 R08: ffffffffffffffe8 R09: ffffc900400f7e68
>>> [  871.309937] R10: 0000000000007ff0 R11: ffff888100ad3000 R12: ffffc900400f7e68
>>> [  871.312326] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
>>> [  871.314647] FS:  0000000000000000(0000) GS:ffff88813ff00000(0000) knlGS:0000000000000000
>>> [  871.317677] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [  871.319644] CR2: 0000000000000000 CR3: 00000001067fe000 CR4: 0000000000040660
>>> [  871.321973] Call Trace:
>>> [  871.322782]  <TASK>
>>> [  871.323494]  ? show_trace_log_lvl+0x1d3/0x2ef
>>> [  871.324901]  ? show_trace_log_lvl+0x1d3/0x2ef
>>> [  871.326310]  ? show_trace_log_lvl+0x1d3/0x2ef
>>> [  871.327721]  ? __wake_up_common_lock+0x82/0xd0
>>> [  871.329147]  ? __die_body.cold+0x8/0xd
>>> [  871.330378]  ? page_fault_oops+0x163/0x1a0
>>> [  871.331691]  ? exc_page_fault+0x70/0x170
>>> [  871.332946]  ? asm_exc_page_fault+0x22/0x30
>>> [  871.334454]  ? __wake_up_common+0x4c/0x180
>>> [  871.335777]  __wake_up_common_lock+0x82/0xd0
>>> [  871.337183]  ? process_writes+0x240/0x240
>>> [  871.338461]  process_msg+0x18e/0x2f0
>>> [  871.339627]  xenbus_thread+0x165/0x1c0
>>> [  871.340830]  ? cpuusage_read+0x10/0x10
>>> [  871.342032]  kthread+0xe9/0x110
>>> [  871.343317]  ? kthread_complete_and_exit+0x20/0x20
>>> [  871.345020]  ret_from_fork+0x22/0x30
>>> [  871.346239]  </TASK>
>>> [  871.347060] Modules linked in: snd_hda_codec_generic ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec snd_hda_core snd_hwdep snd_seq snd_seq_device joydev snd_pcm intel_rapl_msr ppdev intel_rapl_common snd_timer pcspkr e1000e snd soundcore i2c_piix4 parport_pc parport loop fuse xenfs dm_crypt crct10dif_pclmul crc32_pclmul crc32c_intel polyval_clmulni polyval_generic floppy ghash_clmulni_intel sha512_ssse3 serio_raw virtio_scsi virtio_console bochs xhci_pci xhci_pci_renesas xhci_hcd qemu_fw_cfg drm_vram_helper drm_ttm_helper ttm ata_generic pata_acpi xen_privcmd xen_pciback xen_blkback xen_gntalloc xen_gntdev xen_evtchn scsi_dh_rdac scsi_dh_emc scsi_dh_alua uinput dm_multipath
>>> [  871.368892] CR2: 0000000000000000
>>> [  871.370160] ---[ end trace 0000000000000000 ]---
>>> [  871.371719] RIP: e030:__wake_up_common+0x4c/0x180
>>> [  871.373273] Code: 24 0c 89 4c 24 08 4d 85 c9 74 0a 41 f6 01 04 0f 85 a3 00 00 00 48 8b 43 08 4c 8d 40 e8 48 83 c3 08 49 8d 40 18 48 39 c3 74 5b <49> 8b 40 18 31 ed 4c 8d 70 e8 45 8b 28 41 f6 c5 04 75 5f 49 8b 40
>>> [  871.379866] RSP: e02b:ffffc900400f7e10 EFLAGS: 00010082
>>> [  871.381689] RAX: 0000000000000000 RBX: ffff88810541ce98 RCX: 0000000000000000
>>> [  871.383971] RDX: 0000000000000001 RSI: 0000000000000003 RDI: ffff88810541ce90
>>> [  871.386235] RBP: ffffc900400f0280 R08: ffffffffffffffe8 R09: ffffc900400f7e68
>>> [  871.388521] R10: 0000000000007ff0 R11: ffff888100ad3000 R12: ffffc900400f7e68
>>> [  871.390789] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
>>> [  871.393101] FS:  0000000000000000(0000) GS:ffff88813ff00000(0000) knlGS:0000000000000000
>>> [  871.395671] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [  871.397863] CR2: 0000000000000000 CR3: 00000001067fe000 CR4: 0000000000040660
>>> [  871.400441] Kernel panic - not syncing: Fatal exception
>>> [  871.402171] Kernel Offset: disabled
>>> (XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.
>>>
>>> It isn't the first time I see similar crash, but I can't really
>>> reproduce it reliably. Restarted test usually passes.
>>> Note this is Xen nested in KVM, so it could very well be some oddity
>>> about nested virt, although looking at the stack trace, it's unlikely
>>> and more likely some race condition hit only on slower system.
>>
>> Recently I've got the same crash on a real system in domU too. And also
>> on nested on newer kernel 6.1.57 (here it happened in dom0). So, this is
>> still an issue and affects not only nested case :/
>>
>>> Unfortunately I don't have symbols for this kernel handy, but there is a
>>> single wake_up() call in process_writes(), so it shouldn't be an issue.
>>>
>>> Any ideas?
>>>
>>> Full log at https://openqa.qubes-os.org/tests/80779/logfile?filename=serial0.txt
>>
>> More links at https://github.com/QubesOS/qubes-issues/issues/8638,
>> including more recent stack trace.
> 
> Happens on 6.1.75 too (new stack trace I've added to the issue above,
> but it's pretty similar).
> 

-- 
Julien Grall

