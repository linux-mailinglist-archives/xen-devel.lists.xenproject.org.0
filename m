Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A98393D04B1
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 00:33:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159043.292585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5yI9-0005RF-AO; Tue, 20 Jul 2021 22:32:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159043.292585; Tue, 20 Jul 2021 22:32:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5yI9-0005Ol-71; Tue, 20 Jul 2021 22:32:45 +0000
Received: by outflank-mailman (input) for mailman id 159043;
 Tue, 20 Jul 2021 22:32:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V9Cx=MM=strugglers.net=andy@srs-us1.protection.inumbo.net>)
 id 1m5yI6-0005Of-Rd
 for xen-devel@lists.xenproject.org; Tue, 20 Jul 2021 22:32:43 +0000
Received: from mail.bitfolk.com (unknown [2001:ba8:1f1:f019::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b763996-cb2f-4a58-9ccf-57d080d63f38;
 Tue, 20 Jul 2021 22:32:41 +0000 (UTC)
Received: from andy by mail.bitfolk.com with local (Exim 4.89)
 (envelope-from <andy@strugglers.net>) id 1m5yI4-000612-3a
 for xen-devel@lists.xenproject.org; Tue, 20 Jul 2021 22:32:40 +0000
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
X-Inumbo-ID: 2b763996-cb2f-4a58-9ccf-57d080d63f38
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitfolk.com
	; s=alpha; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=xZjCvomNRV+S69mtg3aozbfw59iofkFy/0X8SHEF85A=; b=rT6bmVpH774UWzoJIswDLdNwNN
	X2/ls2Dm0muMEXNkmiYVpSgMUpgLiptz+7luiu0USJgpOCHA9y3DPpUGU/L6fwm9DLotYBhsnQII3
	qis3UQVnJOPApvlEhS3DH5SCJInD6D8FcbVPt3F6TbimV4lzsSDU3p0zxwo2qxDV2M8nUC7UTQXON
	3FQ4sJtgbcQK4F/rJnoljG18I2d7C2D+n0ca9zH/1/7dJf2YWcGNHp/PZPR4R7nv5QwnMAEzCLdrZ
	CIT5/OYp2DbFIsNLKASBKX59yzupNYhYcwvdPefSt4iqgjehvklVq090m+ifXuvLqVSdNG2kc5sga
	9oeQBZ1g==;
Date: Tue, 20 Jul 2021 22:32:39 +0000
From: Andy Smith <andy@strugglers.net>
To: xen-devel@lists.xenproject.org
Subject: 5.10.40 dom0 kernel - nvme: Invalid SGL for payload:131072 nents:13
Message-ID: <20210720223239.fqbwj3escedolaqa@bitfolk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
OpenPGP: id=BF15490B; url=http://strugglers.net/~andy/pubkey.asc
X-URL: http://strugglers.net/wiki/User:Andy
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: andy@strugglers.net
X-SA-Exim-Scanned: No (on mail.bitfolk.com); SAEximRunCond expanded to false

Hi,

I have a Debian 10 (buster/stable) dom0 running hypervisor 4.14.2.
For almost 2 years it's been using the packaged Debian stable kernel
which is 4.19.x.

Last night I upgraded the kernel to the buster-backports package
which is based on 5.10.40 and about 4 hours later got this:

Jul 20 02:17:54 lamb kernel: [21061.388607] sg[0] phys_addr:0x00000015eb803=
000 offset:0 length:4096 dma_address:0x000000209e7b7000 dma_length:4096
Jul 20 02:17:54 lamb kernel: [21061.389775] sg[1] phys_addr:0x00000015eb7bc=
000 offset:0 length:4096 dma_address:0x000000209e7b8000 dma_length:4096
Jul 20 02:17:54 lamb kernel: [21061.390874] sg[2] phys_addr:0x00000015eb809=
000 offset:0 length:4096 dma_address:0x000000209e7b9000 dma_length:4096
Jul 20 02:17:54 lamb kernel: [21061.391974] sg[3] phys_addr:0x00000015eb766=
000 offset:0 length:4096 dma_address:0x000000209e7ba000 dma_length:4096
Jul 20 02:17:54 lamb kernel: [21061.393042] sg[4] phys_addr:0x00000015eb7a3=
000 offset:0 length:4096 dma_address:0x000000209e7bb000 dma_length:4096
Jul 20 02:17:54 lamb kernel: [21061.394086] sg[5] phys_addr:0x00000015eb7c6=
000 offset:0 length:4096 dma_address:0x000000209e7bc000 dma_length:4096
Jul 20 02:17:54 lamb kernel: [21061.395078] sg[6] phys_addr:0x00000015eb7c2=
000 offset:0 length:4096 dma_address:0x000000209e7bd000 dma_length:4096
Jul 20 02:17:54 lamb kernel: [21061.396042] sg[7] phys_addr:0x00000015eb7a9=
000 offset:0 length:4096 dma_address:0x000000209e7be000 dma_length:4096
Jul 20 02:17:54 lamb kernel: [21061.397004] sg[8] phys_addr:0x00000015eb775=
000 offset:0 length:4096 dma_address:0x000000209e7bf000 dma_length:4096
Jul 20 02:17:54 lamb kernel: [21061.397971] sg[9] phys_addr:0x00000015eb7c7=
000 offset:0 length:4096 dma_address:0x00000020ff520000 dma_length:4096
Jul 20 02:17:54 lamb kernel: [21061.398889] sg[10] phys_addr:0x00000015eb7c=
b000 offset:0 length:4096 dma_address:0x00000020ff521000 dma_length:4096
Jul 20 02:17:54 lamb kernel: [21061.399814] sg[11] phys_addr:0x00000015eb7e=
3000 offset:0 length:61952 dma_address:0x00000020ff522000 dma_length:61952
Jul 20 02:17:54 lamb kernel: [21061.400754] sg[12] phys_addr:0x00000015eb7f=
2200 offset:512 length:24064 dma_address:0x00000020ff531200 dma_length:24064
Jul 20 02:17:54 lamb kernel: [21061.401781] ------------[ cut here ]-------=
-----
Jul 20 02:17:54 lamb kernel: [21061.402738] Invalid SGL for payload:131072 =
nents:13
Jul 20 02:17:54 lamb kernel: [21061.403724] WARNING: CPU: 1 PID: 12669 at d=
rivers/nvme/host/pci.c:716 nvme_map_data+0x7e0/0x820 [nvme]
Jul 20 02:17:54 lamb kernel: [21061.404728] Modules linked in: binfmt_misc =
ip6t_REJECT nf_reject_ipv6 ipt_REJECT nf_reject_ipv4 xt_tcpmss nf_log_ipv6 =
nf_log_ipv4 nf_log_common xt_LOG xt_limit nfnetlink_log nfnetlink xt_NFLOG =
xt_multiport xt_tcpudp ip6table_filter ip6_tables iptable_filter bonding bt=
rfs blake2b_generic dm_snapshot dm_bufio intel_rapl_msr intel_rapl_common s=
kx_edac nfit libnvdimm intel_powerclamp crc32_pclmul ghash_clmulni_intel ip=
mi_ssif aesni_intel libaes crypto_simd cryptd glue_helper snd_hda_intel snd=
_intel_dspcfg mei_wdt soundwire_intel soundwire_generic_allocation nvme wda=
t_wdt snd_soc_core ast snd_compress watchdog drm_vram_helper drm_ttm_helper=
 soundwire_cadence pcspkr nvme_core ttm snd_hda_codec drm_kms_helper snd_hd=
a_core i2c_i801 snd_hwdep i2c_smbus cec soundwire_bus snd_pcm drm snd_timer=
 snd soundcore igb ptp pps_core i2c_algo_bit joydev mei_me sg mei intel_lps=
s_pci intel_lpss idma64 acpi_ipmi ipmi_si ipmi_devintf ioatdma dca wmi ipmi=
_msghandler button dm_mod xenfs xen_acpi_processor
Jul 20 02:17:54 lamb kernel: [21061.404831]  xen_privcmd xen_pciback xen_ne=
tback xen_blkback xen_gntalloc xen_gntdev xen_evtchn ip_tables x_tables aut=
ofs4 ext4 crc16 mbcache jbd2 raid456 libcrc32c crc32c_generic async_raid6_r=
ecov async_memcpy async_pq async_xor xor async_tx evdev hid_generic usbhid =
hid raid6_pq raid0 multipath linear raid10 raid1 md_mod sd_mod t10_pi crc_t=
10dif crct10dif_generic crct10dif_pclmul crct10dif_common xhci_pci ahci lib=
ahci crc32c_intel xhci_hcd libata usbcore scsi_mod usb_common
Jul 20 02:17:54 lamb kernel: [21061.417998] CPU: 1 PID: 12669 Comm: 62.xvda=
-0 Not tainted 5.10.0-0.bpo.7-amd64 #1 Debian 5.10.40-1~bpo10+1
Jul 20 02:17:54 lamb kernel: [21061.418459] Hardware name: Supermicro Super=
 Server/X11SRM-VF, BIOS 1.2a 02/18/2019
Jul 20 02:17:54 lamb kernel: [21061.418922] RIP: e030:nvme_map_data+0x7e0/0=
x820 [nvme]
Jul 20 02:17:54 lamb kernel: [21061.419354] Code: d0 7b c0 48 c7 c7 40 d6 7=
b c0 e8 5b 44 c9 c0 8b 93 4c 01 00 00 f6 43 1e 04 75 36 8b 73 28 48 c7 c7 2=
0 9c 7b c0 e8 8b 71 09 c1 <0f> 0b 41 bd 0a 00 00 00 e9 f7 fe ff ff 48 8d bd=
 68 02 00 00 48 89
Jul 20 02:17:54 lamb kernel: [21061.420271] RSP: e02b:ffffc90044797930 EFLA=
GS: 00010286
Jul 20 02:17:54 lamb kernel: [21061.420727] RAX: 0000000000000000 RBX: ffff=
888157db4200 RCX: 0000000000000027
Jul 20 02:17:54 lamb kernel: [21061.421186] RDX: 0000000000000027 RSI: ffff=
888292858a00 RDI: ffff888292858a08
Jul 20 02:17:54 lamb kernel: [21061.421639] RBP: ffff888103243000 R08: 0000=
000000000000 R09: c00000010000118b
Jul 20 02:17:54 lamb kernel: [21061.422090] R10: 0000000000165920 R11: ffff=
c90044797738 R12: ffffffffc07b9bd0
Jul 20 02:17:54 lamb kernel: [21061.422583] R13: 000000000000000d R14: 0000=
000000000000 R15: 000000000000000d
Jul 20 02:17:54 lamb kernel: [21061.423052] FS:  0000000000000000(0000) GS:=
ffff888292840000(0000) knlGS:0000000000000000
Jul 20 02:17:54 lamb kernel: [21061.423518] CS:  e030 DS: 0000 ES: 0000 CR0=
: 0000000080050033
Jul 20 02:17:54 lamb kernel: [21061.423986] CR2: 00007f909a037c30 CR3: 0000=
00010d2dc000 CR4: 0000000000050660
Jul 20 02:17:54 lamb kernel: [21061.424472] Call Trace:
Jul 20 02:17:54 lamb kernel: [21061.424943]  nvme_queue_rq+0x98/0x190 [nvme]
Jul 20 02:17:54 lamb kernel: [21061.425425]  blk_mq_dispatch_rq_list+0x123/=
0x7d0
Jul 20 02:17:54 lamb kernel: [21061.425904]  ? sbitmap_get+0x66/0x140
Jul 20 02:17:54 lamb kernel: [21061.426385]  ? elv_rb_del+0x1f/0x30
Jul 20 02:17:54 lamb kernel: [21061.426909]  ? deadline_remove_request+0x55=
/0xc0
Jul 20 02:17:54 lamb kernel: [21061.427373]  __blk_mq_do_dispatch_sched+0x1=
64/0x2d0
Jul 20 02:17:54 lamb kernel: [21061.427843]  __blk_mq_sched_dispatch_reques=
ts+0x135/0x170
Jul 20 02:17:54 lamb kernel: [21061.428310]  blk_mq_sched_dispatch_requests=
+0x30/0x60
Jul 20 02:17:54 lamb kernel: [21061.428795]  __blk_mq_run_hw_queue+0x51/0xd0
Jul 20 02:17:54 lamb kernel: [21061.429269]  __blk_mq_delay_run_hw_queue+0x=
141/0x160
Jul 20 02:17:54 lamb kernel: [21061.429752]  blk_mq_sched_insert_requests+0=
x6a/0xf0
Jul 20 02:17:54 lamb kernel: [21061.430233]  blk_mq_flush_plug_list+0x119/0=
x1b0
Jul 20 02:17:54 lamb kernel: [21061.430756]  blk_flush_plug_list+0xd7/0x100
Jul 20 02:17:54 lamb kernel: [21061.431241]  blk_finish_plug+0x21/0x30
Jul 20 02:17:54 lamb kernel: [21061.431734]  dispatch_rw_block_io+0x6a5/0x9=
a0 [xen_blkback]
Jul 20 02:17:54 lamb kernel: [21061.432220]  __do_block_io_op+0x31d/0x620 [=
xen_blkback]
Jul 20 02:17:54 lamb kernel: [21061.432714]  ? _raw_spin_unlock_irqrestore+=
0x14/0x20
Jul 20 02:17:54 lamb kernel: [21061.433193]  ? try_to_del_timer_sync+0x4d/0=
x80
Jul 20 02:17:54 lamb kernel: [21061.433680]  xen_blkif_schedule+0xda/0x670 =
[xen_blkback]
Jul 20 02:17:54 lamb kernel: [21061.434160]  ? __schedule+0x2c6/0x770
Jul 20 02:17:54 lamb kernel: [21061.434679]  ? finish_wait+0x80/0x80
Jul 20 02:17:54 lamb kernel: [21061.435129]  ? xen_blkif_be_int+0x30/0x30 [=
xen_blkback]
Jul 20 02:17:54 lamb kernel: [21061.435571]  kthread+0x116/0x130
Jul 20 02:17:54 lamb kernel: [21061.436002]  ? kthread_park+0x80/0x80
Jul 20 02:17:54 lamb kernel: [21061.436422]  ret_from_fork+0x22/0x30
Jul 20 02:17:54 lamb kernel: [21061.436846] ---[ end trace 1d90be7aea2d9148=
 ]---
Jul 20 02:17:54 lamb kernel: [21061.437250] blk_update_request: I/O error, =
dev nvme0n1, sector 912000815 op 0x1:(WRITE) flags 0x800 phys_seg 13 prio c=
lass 0
Jul 20 02:17:54 lamb kernel: [21061.446344] md/raid1:md4: Disk failure on n=
vme0n1, disabling device.
Jul 20 02:17:54 lamb kernel: [21061.446344] md/raid1:md4: Operation continu=
ing on 1 devices.

I was able to fail and then re-add nvme0n1 to the MD array, which
resynced successfullyi, so no reboot needed. But then later:

Jul 20 20:43:23 lamb kernel: [87388.876154] blk_update_request: I/O error, =
dev nvme0n1, sector 916064223 op 0x1:(WRITE) flags 0x800 phys_seg 28 prio c=
lass 0
Jul 20 20:43:23 lamb kernel: [87388.877750] md/raid1:md4: Disk failure on n=
vme0n1, disabling device.
Jul 20 20:43:23 lamb kernel: [87388.877750] md/raid1:md4: Operation continu=
ing on 1 devices.

So had to do a re-add again. No call trace this time because this
code path seems to be a WARN(DO_ONCE()).

I do not suspect NVMe device failure because of how this happened so
quickly after changing the kernel. I am wondering if there is some
bug that was fixed and backported by Debian for 4.19.x but not for
the buster-backports kernel?

I've reported this to linux-nvme as well, but I did find this thread
=66rom 2017 with a similar warning:

    http://lists.infradead.org/pipermail/linux-nvme/2017-July/012055.html

In it Christoph Hellwig says, "Given that this is a Xen system I
wonder if swiotlb-xen is involved here, which does some odd chunking
of DMA translations?" so I thought I'd ask here as well in case
anyone is aware of something like this. Unfortunately that thread
ends without confirmed resolution.

If you are aware of any such issue+fix I will check if it got into
Debian's 4.19.x.

I haven't yet just tested latest mainline kernel because this is a
production machine and I'll need to schedule downtime, which I'd
rather not do unless there is a known issue and fix.

If you need any additional info or have any other ideas please do
let me know.

Thanks!
Andy

