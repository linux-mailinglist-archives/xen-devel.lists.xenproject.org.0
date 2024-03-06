Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB96787421E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 22:42:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689529.1074605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhz1J-000270-MS; Wed, 06 Mar 2024 21:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689529.1074605; Wed, 06 Mar 2024 21:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhz1J-00024D-Jj; Wed, 06 Mar 2024 21:41:49 +0000
Received: by outflank-mailman (input) for mailman id 689529;
 Wed, 06 Mar 2024 21:41:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UuuL=KM=onlineschubla.de=paul@srs-se1.protection.inumbo.net>)
 id 1rhz1I-0001yh-2l
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 21:41:48 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5503f32f-dc02-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 22:41:47 +0100 (CET)
Received: from mail.onlineschubla.de by smtp.strato.de (RZmta 50.2.0 DYNA|AUTH)
 with ESMTPSA id Q6d30f026Lfif3M
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 6 Mar 2024 22:41:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.onlineschubla.de (Postfix) with ESMTP id 852762137F;
 Wed,  6 Mar 2024 22:41:43 +0100 (CET)
Received: from mail.onlineschubla.de ([127.0.0.1])
 by localhost (mail.onlineschubla.de [127.0.0.1]) (amavis, port 10024)
 with ESMTP id OfPODNHRmeaq; Wed,  6 Mar 2024 22:41:42 +0100 (CET)
Received: from [10.0.0.105] (unknown [10.0.0.105])
 by mail.onlineschubla.de (Postfix) with ESMTPA id B5AA52003F;
 Wed,  6 Mar 2024 22:41:42 +0100 (CET)
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
X-Inumbo-ID: 5503f32f-dc02-11ee-afda-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; t=1709761304; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=foCuluBHuJQHK+p9X7jWv05wVMJY2MUWCZ4qY1bbs32ruXYVXZhJ2B0oR9YtabOdS+
    O/IMHQEiqx9VGbqxd724YZ1BZ+AQZCZZFwa2l6XHv/O1kYSCwZPaV/IXVYEIZCvK87Os
    KDKcGFHGnFt3wvDY4YkLF3RF+V62vlLmtgf8hcyjS/G1ASrvvrg23awmmp28weGajDDy
    fS5vZYgNYZiS97xxgl46odTlHorDJHOsCd9jUkHd8c59rifwq7+vlL7KnXI7fvqp/rVP
    GtTLSxoa7Y6Min9x6G1V0oIloPMtNk8sSLZV/ipadr7Dr70PBIixWbRPTVLQL4Gxo/k0
    ToPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1709761304;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=rGB4GIoTsZOopZuUz/VCWygSuDvuwonXhHAwFJiy9tk=;
    b=R7thivFzXZaN+UbA8CpfFLg7wNrEH92C0t/du4+XS4DNdv1myBN7hh5tJagf74SSUg
    JA3CLhiwoXRfbSebpKrOfPS3w2iSJ8uSnc/i93pYkazHCNb5TbfvUHSdQv6bjP7z0T2i
    UYCeEkWRqOUHr4GV725sJvNtu/bdH+Z9jRC+zB7vrgLRwtBkmsq0t+/YTQ1hzEtV3yHp
    UhKPmys0b80khSTsW6KBOtEksy2BAl4NimpXjaVKoy1LjSXQbkfrtExhNxo9pN0OwpVo
    RquI0ZV99wI3JAAvH/x4C1fJHFXMBEBqGusKpczXl8jLlATzRLm/kGDfF0JGGiKIWG2M
    7Enw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1709761304;
    s=strato-dkim-0002; d=onlineschubla.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=rGB4GIoTsZOopZuUz/VCWygSuDvuwonXhHAwFJiy9tk=;
    b=iGgclRtTOvUa7WT+CGxNYd0LozMu78fl8x/UawY86SxEQmn+64jDU48QxZTFlZImbW
    5bZJFB/l7uEBCMu9TkAzycmHPAknI7IwaDyYAzyu5yCBuJfUnE+FRUclU0sN/om85jAg
    4wJ8RIULEwxP/UNMzLfjGLkbSazxi1Mmi0Kfftm9RJfNn1eyehvraRZ5eJR4CPT80d2I
    xacR73hBmDYYfAWvKRv/cXfy7ArvhcgbyQgHBdlAlhU3YWifK0sau3InWUUgJH6hQ7oE
    p+zOO5hSYgWUhhlTbdcJhqgWQ43gvsLaao4KWYZgLeQUYlpPFDUt/fuuy7r3dpxmLH9s
    DTzQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1709761304;
    s=strato-dkim-0003; d=onlineschubla.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=rGB4GIoTsZOopZuUz/VCWygSuDvuwonXhHAwFJiy9tk=;
    b=5SwiLbtP1EG7pZB6dq2e2wR5dwqAEuThIivBrUQCiCc9khK9HZSyBWLRk8tzQSKocc
    +pXkFngUupE3CEJntDAA==
X-RZG-AUTH: ":PG0ReWCndfO3rCSML4AvNaDxJ7WJyilEI/NMX3IPsStZLbcZC9mNZx0oO96cCwacwToyD+C58ign1Q=="
X-Virus-Scanned: Debian amavis at onlineschubla.de
Message-ID: <925354c7-dedf-44be-8d1c-8e426c35521d@onlineschubla.de>
Date: Wed, 6 Mar 2024 22:41:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.18rc/ARM64 on Raspberry Pi 4B: Traffic in DomU crashing
 Dom0 when using VLANs
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, george.dunlap@cloud.com,
 Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <838ff75f-1352-4d3c-9bc1-c7a57c828231@onlineschubla.de>
 <4cddfd89-f195-4a50-a14d-b86121414e56@onlineschubla.de>
 <f8f39239-ea95-4fc7-9abe-6ca005eb02d2@onlineschubla.de>
 <ZarcWQ6Ugwowy050@mattapan.m5p.com>
 <CA+zSX=Y=BsVEp3o6jRprn5sntWVA0Z6wNXUxtffDN+=fPv_Fzg@mail.gmail.com>
 <4d7dbce9-ef20-4702-8056-9d5ab8152721@onlineschubla.de>
 <a5ad8772-01eb-4a84-93e2-c96c3b72fa48@xen.org>
 <d99853d8-fae4-4710-87cb-d74fd1377a03@onlineschubla.de>
 <1aa294ec-704c-4370-94c5-54573ed82af6@xen.org>
From: Paul Leiber <paul@onlineschubla.de>
In-Reply-To: <1aa294ec-704c-4370-94c5-54573ed82af6@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Julien

Am 04.03.2024 um 23:15 schrieb Julien Grall:
> Hi Paul,
> 
> On 01/03/2024 19:37, Paul Leiber wrote:
>> Stopping xen-watchdog prevents the reboot. However, when triggering 
>> traffic on the VLAN, Dom0 and DomU become completely unresponsive. No 
>> error or kernel message is printed in the serial console.
> 
> Thanks for providing some logs. See some comments below. How long did 
> you wait before confirming dom0 is stucked?
> 
> IIRC, Linux may print some RCU stall logs after a few minutes.
> 
>>
>> Switching to Xen console works. Pressing '0' produces the following 
>> output:
>>
>> (XEN) '0' pressed -> dumping Dom0's registers
>> (XEN) *** Dumping Dom0 vcpu#0 state: ***
>> (XEN) ----[ Xen-4.19-unstable  arm64  debug=y  Tainted:   C    ]----
>> (XEN) CPU:    0
>> (XEN) PC:     ffff800008027e50
>> (XEN) LR:     ffff800008027e44
>> (XEN) SP_EL0: ffff800009c78f80
>> (XEN) SP_EL1: ffff800008003b60
>> (XEN) CPSR:   00000000000003c5 MODE:64-bit EL1h (Guest Kernel, handler)
> 
> [...]
> 
>> (XEN) *** Dumping Dom0 vcpu#1 state: ***
>> (XEN) ----[ Xen-4.19-unstable  arm64  debug=y  Tainted:   C    ]----
>> (XEN) CPU:    0
>> (XEN) PC:     ffff800008c5dc80
>> (XEN) LR:     ffff800008c5dc88
>> (XEN) SP_EL0: ffff000042272080
>> (XEN) SP_EL1: ffff80000800b0e0
>> (XEN) CPSR:   0000000080000305 MODE:64-bit EL1h (Guest Kernel, handler)
> 
> [...]
> 
>> (XEN) *** Dumping Dom0 vcpu#2 state: ***
>> (XEN) ----[ Xen-4.19-unstable  arm64  debug=y  Tainted:   C    ]----
>> (XEN) CPU:    0
>> (XEN) PC:     ffff800008027e50
>> (XEN) LR:     ffff800008027e44
>> (XEN) SP_EL0: ffff000042271040
>> (XEN) SP_EL1: ffff800009fcbf20
>> (XEN) CPSR:   00000000000003c5 MODE:64-bit EL1h (Guest Kernel, handler)
> 
> [...]
> 
>> (XEN) *** Dumping Dom0 vcpu#3 state: ***
>> (XEN) ----[ Xen-4.19-unstable  arm64  debug=y  Tainted:   C    ]----
>> (XEN) CPU:    0
>> (XEN) PC:     ffff800008027e50
>> (XEN) LR:     ffff800008027e44
>> (XEN) SP_EL0: ffff0000422730c0
>> (XEN) SP_EL1: ffff800009fd3f20
>> (XEN) CPSR:   00000000000003c5 MODE:64-bit EL1h (Guest Kernel, handler)
> 
> All the PCs but one (vcpu#1) are the same.
> 
>> (XEN) 'q' pressed -> dumping domain info (now = 727929105981)
>> (XEN) General information for domain 0:
>> (XEN)     refcnt=3 dying=0 pause_count=0
>> (XEN)     nr_pages=262144 xenheap_pages=2 dirty_cpus={} max_pages=262144
>> (XEN)     handle=00000000-0000-0000-0000-000000000000 vm_assist=00000020
>> (XEN) p2m mappings for domain 0 (vmid 1):
>> (XEN)   1G mappings: 0 (shattered 1)
>> (XEN)   2M mappings: 422 (shattered 90)
>> (XEN)   4K mappings: 45372
>> (XEN) Rangesets belonging to domain 0:
>> (XEN)     Interrupts { 32-152, 154-255 }
>> (XEN)     I/O Memory { 0-fe200, fe203-ff841, ff849-ffffffffffffffff }
>> (XEN) NODE affinity for domain 0: [0]
>> (XEN) VCPU information and callbacks for domain 0:
>> (XEN)   UNIT0 affinities: hard={0-3} soft={0-3}
>> (XEN)     VCPU0: CPU3 [has=F] poll=0 upcall_pend=01 upcall_mask=01
>> (XEN)     pause_count=0 pause_flags=1
> 
> The vCPU is blocked. But...
> 
>> (XEN) GICH_LRs (vcpu 0) mask=f
>> (XEN)    VCPU_LR[0]=2a000002
>> (XEN)    VCPU_LR[1]=1a00001b
>> (XEN)    VCPU_LR[2]=1a000001
>> (XEN)    VCPU_LR[3]=1a000010
> 
> ... it loosk like multiple IRQs are inflights. LR0 (holding IRQ2) is 
> active but the others are pending. This is the same for vCPU #2, #3. 
> vCPU #1 still seems to "work".
> 
> AFAICT, Linux is using IRQ2 for the IPI CPU_STOP. So it sounds like dom0 
> may have panicked.
> 
> Looking at the initial logs you posted. I see some messages from Xen but 
> no messages at all from dom0 (including boot). Can you check if you have 
> console=hvc0 on the Linux command line?
> 
> If not, please add it and retry.


*facepalm*

After activating Dom0 output in xen console with console=hvc0, Dom0 
messages appear in xen console.

Directly after triggering the crash, the following messages appear:

[   59.239150] ------------[ cut here ]------------
[   59.243691] kernel BUG at kernel/dma/swiotlb.c:666!
[   59.248640] Internal error: Oops - BUG: 00000000f2000800 [#1] SMP
[   59.254790] Modules linked in: bridge 8021q garp mrp stp llc 
binfmt_misc nls_ascii nls_cp437 vfat fat hci_uart btqca btrtl btbcm 
btintel btsdio bluetooth jitterentropy_rng sha512_generic sha512_arm64 
aes_neon_bs brcmfmac aes_neon_blk brcmutil drbg ansi_cprng cfg80211 
ecdh_generic rfkill ecc sg xen_pciback xen_netback xen_blkback 
xen_gntalloc xen_gntdev xen_evtchn loop fuse drm efi_pstore configfs 
xenfs xen_privcmd efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache 
jbd2 crc32c_generic dm_mod dax sd_mod t10_pi crc64_rocksoft crc64 
crc_t10dif crct10dif_generic uas usb_storage scsi_mod scsi_common 
broadcom bcm_phy_ptp bcm_phy_lib genet dwc2 mdio_bcm_unimac of_mdio 
udc_core fixed_phy xhci_plat_hcd roles fwnode_mdio xhci_hcd crct10dif_ce 
crct10dif_common sdhci_iproc sdhci_pltfm usbcore libphy sdhci usb_common
[   59.326308] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 6.1.0-17-arm64 
#1  Debian 6.1.69-1
[   59.334445] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[   59.341469] pc : swiotlb_tbl_map_single+0x420/0x6d0
[   59.346417] lr : 0x0
[   59.348669] sp : ffff80000800b4e0
[   59.352056] x29: ffff80000800b4e0 x28: 0000000000000000 x27: 
0000000000000000
[   59.359263] x26: 0000000000000000 x25: 0000000000000001 x24: 
ffff00004a2ca010
[   59.366461] x23: ffff800009f54688 x22: 0000000042800000 x21: 
0000000000000000
[   59.373665] x20: 0001000000000000 x19: 0020000000000000 x18: 
fffffc0000000000
[   59.380862] x17: 0000000000000119 x16: ffff800009c74560 x15: 
78e9d7c1ef2ec7fd
[   59.388065] x14: 0000000000000000 x13: 0000000000000000 x12: 
ffff000048142c10
[   59.395266] x11: ffff00004a2ca000 x10: 0000000000000002 x9 : 
ffff8000087ed3b4
[   59.402468] x8 : 0000000000000010 x7 : 0000000000000000 x6 : 
0000000000000000
[   59.409671] x5 : ffff000048142f10 x4 : 0000000000000000 x3 : 
0000000000000000
[   59.416872] x2 : 0000000000000001 x1 : 0000000000000003 x0 : 
0000000000000000
[   59.424075] Call trace:
[   59.426590]  swiotlb_tbl_map_single+0x420/0x6d0
[   59.431189]  xen_swiotlb_map_page+0xe4/0x440
[   59.435528]  dma_map_page_attrs+0x1e8/0x240
[   59.439779]  bcmgenet_xmit+0x194/0x7d0 [genet]
[   59.444292]  dev_hard_start_xmit+0xa8/0x1c0
[   59.448543]  sch_direct_xmit+0x98/0x314
[   59.452448]  __dev_queue_xmit+0x9bc/0xdd4
[   59.456526]  vlan_dev_hard_start_xmit+0xb4/0x17c [8021q]
[   59.461906]  dev_hard_start_xmit+0xa8/0x1c0
[   59.466158]  __dev_queue_xmit+0x254/0xdd4
[   59.470236]  br_dev_queue_push_xmit+0xd8/0x1f0 [bridge]
[   59.475529]  br_forward_finish+0x5c/0xd0 [bridge]
[   59.480301]  __br_forward+0x168/0x1d0 [bridge]
[   59.484814]  br_forward+0x120/0x13c [bridge]
[   59.489152]  br_handle_frame_finish+0x330/0x5c0 [bridge]
[   59.494533]  br_handle_frame+0x2cc/0x3c0 [bridge]
[   59.499304]  __netif_receive_skb_core.constprop.0+0x288/0xe70
[   59.505118]  __netif_receive_skb_one_core+0x44/0x90
[   59.510064]  __netif_receive_skb+0x20/0x70
[   59.514229]  netif_receive_skb+0x54/0x160
[   59.518307]  xenvif_tx_action+0x6b8/0x934 [xen_netback]
[   59.523608]  xenvif_poll+0x3c/0xc0 [xen_netback]
[   59.528286]  __napi_poll+0x40/0x1e0
[   59.531843]  net_rx_action+0x384/0x470
[   59.535661]  __do_softirq+0x120/0x338
[   59.539392]  ____do_softirq+0x18/0x24
[   59.543130]  call_on_irq_stack+0x24/0x50
[   59.547115]  do_softirq_own_stack+0x24/0x3c
[   59.551366]  __irq_exit_rcu+0x104/0x130
[   59.555271]  irq_exit_rcu+0x18/0x24
[   59.558829]  el1_interrupt+0x38/0x54
[   59.562473]  el1h_64_irq_handler+0x18/0x2c
[   59.566638]  el1h_64_irq+0x64/0x68
[   59.570109]  arch_cpu_idle+0x18/0x2c
[   59.573762]  default_idle_call+0x50/0x114
[   59.577831]  do_idle+0x24c/0x2c0
[   59.581129]  cpu_startup_entry+0x3c/0x4c
[   59.585121]  secondary_start_kernel+0x130/0x154
[   59.589719]  __secondary_switched+0xb0/0xb4
[   59.593983] Code: f9400c00 cb0002c0 8a130016 17ffffed (d4210000)
[   59.600135] ---[ end trace 0000000000000000 ]---
[   59.614441] Kernel panic - not syncing: Oops - BUG: Fatal exception 
in interrupt
[   59.621740] SMP: stopping secondary CPUs
[   59.625756] Kernel Offset: disabled
[   59.629283] CPU features: 0x80000,2002c080,0000421b
[   59.634230] Memory Limit: none
[   59.646915] ---[ end Kernel panic - not syncing: Oops - BUG: Fatal 
exception in interrupt ]---

I assume that this is the missing console output you were trying to get 
to. Just to make sure, I let the system wait for 15 minutes, but nothing 
happened anymore.

Am I right when assuming that I now need to debug this kernel panic? Any 
hints you can give me already?

Best regards,

Paul


