Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ADA363E6B
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 11:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112755.215049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYQ6D-0004g9-5J; Mon, 19 Apr 2021 09:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112755.215049; Mon, 19 Apr 2021 09:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYQ6D-0004fk-2C; Mon, 19 Apr 2021 09:21:45 +0000
Received: by outflank-mailman (input) for mailman id 112755;
 Mon, 19 Apr 2021 09:21:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Een=JQ=alstadheim.priv.no=hakon@srs-us1.protection.inumbo.net>)
 id 1lYQ6B-0004fd-Ef
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 09:21:43 +0000
Received: from asav21.altibox.net (unknown [109.247.116.8])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8a92f5e-cac7-4a65-ab37-564368d7b05c;
 Mon, 19 Apr 2021 09:21:37 +0000 (UTC)
Received: from postfix-relay.alstadheim.priv.no
 (148-252-98.210.3p.ntebredband.no [148.252.98.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: hakon.alstadheim@ntebb.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id CA3B8800AA
 for <xen-devel@lists.xenproject.org>; Mon, 19 Apr 2021 11:21:36 +0200 (CEST)
Received: from smtps.alstadheim.priv.no (localhost [127.0.0.1])
 by postfix-relay.alstadheim.priv.no (Postfix) with ESMTP id 55DBA7AD0A00
 for <xen-devel@lists.xenproject.org>; Mon, 19 Apr 2021 11:21:36 +0200 (CEST)
Received: from [192.168.2.201] (unknown [192.168.2.201])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: hakon)
 by smtps.alstadheim.priv.no (Postfix) with ESMTPSA id 2D98E7AD09DF
 for <xen-devel@lists.xenproject.org>; Mon, 19 Apr 2021 11:21:36 +0200 (CEST)
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
X-Inumbo-ID: d8a92f5e-cac7-4a65-ab37-564368d7b05c
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alstadheim.priv.no;
	s=smtp; t=1618824096;
	bh=A+MwSe9ceK/L9ZbSNXj5UgRsVT3kU2mZXKSPM3y05oo=;
	h=To:From:Subject:Date:From;
	b=mD+/Mxp3i5R+DL31LCWULmIldiO/adQEyD1UJUNJ5C1CTUHl/uyyCeV07R58EIFKJ
	 tGuXLzc4Czdzv6zKNCVQzlwG8vKOqSD/2ZXHHZZCoVJlGJ3KFvfKgkeKIkv3l3COTk
	 Lr8yzOunCXo0OW+lPiVdGAa6VToRPsqGNJCa9+2k=
To: xen-devel@lists.xenproject.org
From: =?UTF-8?Q?H=c3=a5kon_Alstadheim?= <hakon@alstadheim.priv.no>
Subject: [BUG] pv on hvm, possibly xen net , current master versions.
Message-ID: <ccd93fd0-769f-8ffd-100f-704a7e1ac9d6@alstadheim.priv.no>
Date: Mon, 19 Apr 2021 11:21:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=PJ4hB8iC c=1 sm=1 tr=0
	a=Ln9STfmRvcQJFdEeVvPm9g==:117 a=Ln9STfmRvcQJFdEeVvPm9g==:17
	a=IkcTkHD0fZMA:10 a=3YhXtTcJ-WEA:10 a=M51BFTxLslgA:10 a=JqEG_dyiAAAA:8
	a=1LAGLpD2db2b__W52wUA:9 a=MLYMDZ-2A5Aj8NF2:21 a=dONGFr-RRhtEa6FM:21
	a=QEXdDO2ut3YA:10

I follow the bleeding edge on Dom0 kernels and Xen pretty closely, and 
for the past 6 months I have been encountering increasingly frequent 
hangs&crashes in the most heavily used domUs. I have tried downgrading 
both dom0 kernel and xen, but can't seem to find any where the bug does 
not materialize.

The final domU crash varies, but always involves skb. If I disable 
xen_platform_pci in domU, I do not get theese crashes. My most heavily 
used domUs all involve pcie cards passed through to guest, and various 
insanitary practices to ignore the cards stepping where they should not, 
but this feels like something else.

Currently I mostly run Xen 4.15 (stable-4.15 from git)  and 
linux-5.11.14 (gentoo-sources latest testing), but I have dom0 kernels 
back to linux-5.4.8 able to boot and run. Not, alas the exact ones I 
used to run back then. I have recently started using f2fs in dom0, and I 
don't know which version of gcc I ran at the time linux-5.4.8 was 
current, but I am fairly sure that this did not happen back then. Either 
because of dumb luck, or because something running on the system is 
stressing it more now.

My easiest way to reproduce is to start a world build in the domU, wait 
for load to reach 3 and fire up thunderbird and "firefox 
http://twitter.com/"

Logs show:

--dom0, times in UTC,----

(XEN) [2021-04-19 07:08:10] grant_table.c:1861:d7v2 Expanding d7 grant 
table from 6 to 7 frames
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v3 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:24] grant_table.c:803:d0v5 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:25] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:26] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:27] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:31] grant_table.c:803:d0v2 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:37] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
(XEN) [2021-04-19 07:21:51] grant_table.c:803:d0v6 Bad flags (0) or dom 
(0); expected d0
-------

---domU, times in UTC+2---

april 19 09:21:24 gt kernel: net eth0: rx->offset: 0, size: -1
april 19 09:21:24 gt kernel: net eth0: rx->offset: 0, size: -1
april 19 09:21:24 gt kernel: net eth0: rx->offset: 0, size: -1
april 19 09:21:24 gt kernel: net eth0: rx->offset: 0, size: -1
april 19 09:21:24 gt kernel: net eth0: rx->offset: 0, size: -1
april 19 09:21:24 gt kernel: net eth0: rx->offset: 0, size: -1
april 19 09:21:24 gt kernel: net eth0: rx->offset: 0, size: -1
april 19 09:21:24 gt kernel: net eth0: rx->offset: 0, size: -1
april 19 09:21:24 gt kernel: net eth0: rx->offset: 0, size: -1
april 19 09:21:24 gt kernel: net eth0: rx->offset: 0, size: -1
april 19 09:21:31 gt kernel: net_ratelimit: 14 callbacks suppressed
april 19 09:21:31 gt kernel: net eth0: rx->offset: 0, size: -1
0:root@gt ~ #

--- jounald logs end here--

Same crash from console log from domU, captured in dom0, so the actual 
crash is captured. I believe I tried to shut down the vm after the hang, 
hence the hci disconnects. Does not prevent the crash however :-(

---domU console log: ---

[  803.886272] net eth0: rx->offset: 0, size: -1
[  803.890313] net eth0: rx->offset: 0, size: -1
[  803.894102] net eth0: rx->offset: 0, size: -1
[  803.897930] net eth0: rx->offset: 0, size: -1
[  803.901969] net eth0: rx->offset: 0, size: -1
[  803.905799] net eth0: rx->offset: 0, size: -1
[  803.909465] net eth0: rx->offset: 0, size: -1
[  803.913490] net eth0: rx->offset: 0, size: -1
[  803.917935] net eth0: rx->offset: 0, size: -1
[  803.921962] net eth0: rx->offset: 0, size: -1
[  810.814568] net_ratelimit: 14 callbacks suppressed
[  810.814576] net eth0: rx->offset: 0, size: -1
[  817.470513] net eth0: rx->offset: 0, size: -1
[  830.782419] net eth0: rx->offset: 0, size: -1
[  856.960323] vhci_hcd vhci_hcd.0: remove, state 4
[  856.967407] usb usb4: USB disconnect, device number 1
[  856.975816] vhci_hcd: stop threads
[  856.981073] vhci_hcd: release socket
[  856.985665] vhci_hcd: disconnect device
[  856.991283] vhci_hcd: stop threads
[  856.995670] vhci_hcd: release socket
[  857.000261] vhci_hcd: disconnect device
[  857.006147] vhci_hcd: stop threads
[  857.011314] vhci_hcd: release socket
[  857.017048] vhci_hcd: disconnect device
[  857.023417] vhci_hcd: stop threads
[  857.028090] vhci_hcd: release socket
[  857.034141] vhci_hcd: disconnect device
[  857.039998] vhci_hcd: stop threads
[  857.045146] vhci_hcd: release socket
[  857.050833] vhci_hcd: disconnect device
[  857.057291] vhci_hcd: stop threads
[  857.063897] vhci_hcd: release socket
[  857.072376] vhci_hcd: disconnect device
[  857.082009] vhci_hcd: stop threads
[  857.088005] vhci_hcd: release socket
[  857.097783] vhci_hcd: disconnect device
[  857.106913] vhci_hcd: stop threads
[  857.111278] vhci_hcd: release socket
[  857.116596] vhci_hcd: disconnect device
[  857.124270] vhci_hcd vhci_hcd.0: USB bus 4 deregistered
[  857.132600] vhci_hcd vhci_hcd.0: remove, state 4
[  857.138275] usb usb3: USB disconnect, device number 1
[  857.147421] vhci_hcd: stop threads
[  857.152899] vhci_hcd: release socket
[  857.156908] vhci_hcd: disconnect device
[  857.162545] vhci_hcd: stop threads
[  857.167551] vhci_hcd: release socket
[  857.171597] vhci_hcd: disconnect device
[  857.175772] vhci_hcd: stop threads
[  857.179275] vhci_hcd: release socket
[  857.183213] vhci_hcd: disconnect device
[  857.187729] vhci_hcd: stop threads
[  857.191459] vhci_hcd: release socket
[  857.195862] vhci_hcd: disconnect device
[  857.200532] vhci_hcd: stop threads
[  857.205231] vhci_hcd: release socket
[  857.210515] vhci_hcd: disconnect device
[  857.214987] vhci_hcd: stop threads
[  857.218180] vhci_hcd: release socket
[  857.221749] vhci_hcd: disconnect device
[  857.225507] vhci_hcd: stop threads
[  857.229364] vhci_hcd: release socket
[  857.233023] vhci_hcd: disconnect device
[  857.236829] vhci_hcd: stop threads
[  857.240090] vhci_hcd: release socket
[  857.243346] vhci_hcd: disconnect device
[  857.247099] vhci_hcd vhci_hcd.0: USB bus 3 deregistered
[  857.432952] BUG: kernel NULL pointer dereference, address: 
0000000000000000
[  857.445411] #PF: supervisor read access in kernel mode
[  857.451705] #PF: error_code(0x0000) - not-present page
[  857.456703] PGD 0 P4D 0
[  857.459369] Oops: 0000 [#1] SMP NOPTI
[  857.463253] CPU: 2 PID: 0 Comm: swapper/2 Not tainted 
5.11.15-gentoo-x86_64 #1
[  857.471047] Hardware name: Xen HVM domU, BIOS 4.15.0-rc 03/28/2021
[  857.477482] RIP: 0010:__skb_ext_put+0x5/0x40
[  857.481762] Code: dc 5b 5d c3 be 01 00 00 00 e8 97 fd bd ff eb e9 be 
02 00 00 00 e8 8b fd bd ff eb dd 66 0f 1f 84 00 00 00 00 00 0f 1f 44 00 
00 <8b> 07 83 f8 01 74 13 b8 ff ff ff ff f0 0f c1 07 83 f8 01 74 05 85
[  857.501888] RSP: 0018:ffffc90000128cf8 EFLAGS: 00010282
[  857.507714] RAX: 0000000000000000 RBX: ffff888132af9800 RCX: 
dead0000000000ff
[  857.515513] RDX: ffffffffa00a0ab5 RSI: 0000000000000003 RDI: 
0000000000000000
[  857.523113] RBP: ffff88810647fa00 R08: 0000000000001000 R09: 
0000000000001000
[  857.530366] R10: 00000000000002c0 R11: 0000000000000001 R12: 
0000000000000372
[  857.540094] R13: 0000000000000072 R14: ffff8881064d16c0 R15: 
ffff888106d14730
[  857.551126] FS:  0000000000000000(0000) GS:ffff88856c480000(0000) 
knlGS:0000000000000000
[  857.563423] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  857.570698] CR2: 0000000000000000 CR3: 0000000113e50002 CR4: 
00000000001706e0
[  857.578138] Call Trace:
[  857.580733]  <IRQ>
[  857.582858]  kfree_skb+0x49/0xc0
[  857.586930]  xennet_poll+0x9d5/0x11a0 [xen_netfront]
[  857.596853]  ? find_held_lock+0x2b/0x80
[  857.603096]  net_rx_action+0xfd/0x400
[  857.608844]  __do_softirq+0xe3/0x2b1
[  857.615134]  asm_call_irq_on_stack+0x12/0x20
[  857.621888]  </IRQ>
[  857.624585]  do_softirq_own_stack+0x37/0x40
[  857.629326]  irq_exit_rcu+0x8e/0xc0
[  857.633122]  sysvec_xen_hvm_callback+0x36/0x80
[  857.637877]  asm_sysvec_xen_hvm_callback+0x12/0x20
[  857.642360] RIP: 0010:native_safe_halt+0xe/0x20
[  857.646527] Code: 02 20 48 8b 00 a8 08 75 c4 e9 7b ff ff ff cc cc cc 
cc cc cc cc cc cc cc cc cc cc cc e9 07 00 00 00 0f 00 2d d6 97 55 00 fb 
f4 <c3> 66 66 2e 0f 1f 84 00 00 00 00 00 66 0f 1f 44 00 00 e9 07 00 00
[  857.665573] RSP: 0018:ffffc9000009fe80 EFLAGS: 00000246
[  857.670324] RAX: 0000000000004000 RBX: 0000000000000001 RCX: 
ffff88856c4aea00
[  857.676811] RDX: ffff88856c480000 RSI: ffff888100b9c400 RDI: 
ffff888100b9c464
[  857.685222] RBP: ffff888100b9c464 R08: ffffffff8329d1a0 R09: 
0000000000000001
[  857.693682] R10: 0000000000080000 R11: 0000000000000001 R12: 
0000000000000001
[  857.703029] R13: ffffffff8329d220 R14: 0000000000000001 R15: 
0000000000000000
[  857.709627]  acpi_idle_do_entry+0x46/0x60
[  857.713661]  acpi_idle_enter+0x86/0xc0
[  857.717210]  cpuidle_enter_state+0x9b/0x360
[  857.722055]  cpuidle_enter+0x29/0x40
[  857.727651]  do_idle+0x1ef/0x2c0
[  857.732383]  cpu_startup_entry+0x19/0x20
[  857.736064]  secondary_startup_64_no_verify+0xb0/0xbb
[  857.740756] Modules linked in: xen_front_pgdir_shbuf xenfs 
xen_privcmd xen_scsifront snd_hda_codec_hdmi snd_hda_intel 
snd_intel_dspcfg snd_hda_codec snd_hda_core snd_hwdep hid_generic 
snd_pcm snd_timer usbhid hid xen_kbdfront snd atkbd soundcore amdgpu 
drm_ttm_helper ttm gpu_sched xhci_pci xhci_pci_renesas xhci_hcd 
xen_netfront xen_blkfront usbcore [last unloaded: usbip_core]
[  857.781302] CR2: 0000000000000000
[  857.784927] BUG: unable to handle page fault for address: 
ffff888135bf20e8
[  857.784931] ---[ end trace b17114bccdbf02ab ]---
[  857.784934] RIP: 0010:__skb_ext_put+0x5/0x40
[  857.794195] #PF: supervisor read access in kernel mode
[  857.798850] Code: dc 5b 5d c3 be 01 00 00 00 e8 97 fd bd ff eb e9 be 
02 00 00 00 e8 8b fd bd ff eb dd 66 0f 1f 84 00 00 00 00 00 0f 1f 44 00 
00 <8b> 07 83 f8 01 74 13 b8 ff ff ff ff f0 0f c1 07 83 f8 01 74 05 85
[  857.798854] RSP: 0018:ffffc90000128cf8 EFLAGS: 00010282
[  857.803619] #PF: error_code(0x0009) - reserved bit violation
[  857.803622] PGD 4201067
[  857.808423]
[  857.808425] RAX: 0000000000000000 RBX: ffff888132af9800 RCX: 
dead0000000000ff
[  857.829492] P4D 4201067
[  857.835931] RDX: ffffffffa00a0ab5 RSI: 0000000000000003 RDI: 
0000000000000000
[  857.843234] PUD 100ad6063
[  857.846921] RBP: ffff88810647fa00 R08: 0000000000001000 R09: 
0000000000001000
[  857.848756] PMD 1064af063 PTE 322d5b20200a5d29
[  857.848761] Oops: 0009 [#2] SMP NOPTI
[  857.848765] CPU: 3 PID: 2997 Comm: accounts-daemon Tainted: G      
D           5.11.15-gentoo-x86_64 #1
[  857.848768] Hardware name: Xen HVM domU, BIOS 4.15.0-rc 03/28/2021
[  857.860911] R10: 00000000000002c0 R11: 0000000000000001 R12: 
0000000000000372
[  857.863855] RIP: 0010:___slab_alloc+0x8f/0x600
[  857.875714] R13: 0000000000000072 R14: ffff8881064d16c0 R15: 
ffff888106d14730
[  857.878777] Code: 44 c7 48 8b 00 a8 20 0f 85 07 01 00 00 4d 8b 04 24 
4d 85 c0 74 53 41 8b 56 28 4c 01 c2 48 89 d0 48 0f c8 49 33 86 b8 00 00 
00 <48> 33 02 49 83 44 24 08 01 49 89 04 24 48 8d 65 d0 4c 89 c0 5b 41
[  857.878781] RSP: 0018:ffffc9000168bbf0 EFLAGS: 00010002
[  857.878785] RAX: 552237ab89cb40a4 RBX: 0000000000000002 RCX: 
0000000080100010
[  857.878786] RDX: ffff888135bf20e8 RSI: ffffffff813a1600 RDI: 
ffff888100215980
[  857.878788] RBP: ffffc9000168bca0 R08: ffff888135bf2000 R09: 
0000000000000000
[  857.878789] R10: ffffea0004d6fc88 R11: 0000000000000000 R12: 
ffff88856c4f2680
[  857.878791] R13: 0000000000000dc0 R14: ffff888100214100 R15: 
ffffea0004d6fc80
[  857.890376] FS:  0000000000000000(0000) GS:ffff88856c480000(0000) 
knlGS:0000000000000000
[  857.895071] FS:  00007f11f985d7c0(0000) GS:ffff88856c4c0000(0000) 
knlGS:0000000000000000
[  857.895075] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  857.895076] CR2: ffff888135bf20e8 CR3: 0000000113eb0003 CR4: 
00000000001706e0
[  857.895080] Call Trace:
[  857.895087]  ? __alloc_file+0x23/0x120
[  857.900731] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  857.909423]  ? __alloc_file+0x23/0x120
[  857.918831] CR2: 0000000000000000 CR3: 0000000113e50002 CR4: 
00000000001706e0
[  857.926389]  ? __slab_alloc+0x1c/0x40
[  857.926396]  __slab_alloc+0x1c/0x40
[  857.926399]  kmem_cache_alloc+0x286/0x2e0
[  857.926402]  __alloc_file+0x23/0x120
[  857.926405]  alloc_empty_file+0x41/0xc0
[  857.926408]  path_openat+0x49/0xa40
[  857.926415]  do_filp_open+0x88/0x140
[  857.926419]  ? getname_flags.part.0+0x29/0x1a0
[  857.926422]  ? do_raw_spin_unlock+0x4b/0xa0
[  857.926428]  ? _raw_spin_unlock+0x1f/0x40
[  857.926434]  do_sys_openat2+0x97/0x160
[  857.932852] Kernel panic - not syncing: Fatal exception in interrupt
[  857.944180]  __x64_sys_openat+0x54/0xa0
[  858.143313]  do_syscall_64+0x33/0x80
[  858.146814]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  858.151276] RIP: 0033:0x7f11f9da9dc8
[  858.154919] Code: 24 18 31 c0 41 83 e2 40 75 40 89 f0 25 00 00 41 00 
3d 00 00 41 00 74 32 44 89 c2 4c 89 ce bf 9c ff ff ff b8 01 01 00 00 0f 
05 <48> 3d 00 f0 ff ff 77 40 48 8b 4c 24 18 64 48 2b 0c 25 28 00 00 00
[  858.172336] RSP: 002b:00007ffe8ca24ce0 EFLAGS: 00000287 ORIG_RAX: 
0000000000000101
[  858.178817] RAX: ffffffffffffffda RBX: 0000565116fc4200 RCX: 
00007f11f9da9dc8
[  858.184885] RDX: 0000000000080000 RSI: 00007f11f869017e RDI: 
00000000ffffff9c
[  858.190930] RBP: 0000000000000008 R08: 0000000000080000 R09: 
00007f11f869017e
[  858.196936] R10: 0000000000000000 R11: 0000000000000287 R12: 
0000565116fc4200
[  858.203248] R13: 00007f11f9e44e96 R14: 0000000000000400 R15: 
0000565116e885a5
[  858.209544] Modules linked in: xen_front_pgdir_shbuf xenfs 
xen_privcmd xen_scsifront snd_hda_codec_hdmi snd_hda_intel 
snd_intel_dspcfg snd_hda_codec snd_hda_core snd_hwdep hid_generic 
snd_pcm snd_timer usbhid hid xen_kbdfront snd atkbd soundcore amdgpu 
drm_ttm_helper ttm gpu_sched xhci_pci xhci_pci_renesas xhci_hcd 
xen_netfront xen_blkfront usbcore [last unloaded: usbip_core]
[  858.240109] CR2: ffff888135bf20e8
[  858.243629] ---[ end trace b17114bccdbf02ac ]---
[  858.243633] BUG: unable to handle page fault for address: 
ffff888135a5ee80
[  858.248174] RIP: 0010:__skb_ext_put+0x5/0x40
[  858.259898] #PF: supervisor read access in kernel mode
[  858.264602] Code: dc 5b 5d c3 be 01 00 00 00 e8 97 fd bd ff eb e9 be 
02 00 00 00 e8 8b fd bd ff eb dd 66 0f 1f 84 00 00 00 00 00 0f 1f 44 00 
00 <8b> 07 83 f8 01 74 13 b8 ff ff ff ff f0 0f c1 07 83 f8 01 74 05 85
[  858.271910] #PF: error_code(0x0000) - not-present page
[  858.271913] PGD 4201067
[  858.296011] RSP: 0018:ffffc90000128cf8 EFLAGS: 00010282
[  858.296018] RAX: 0000000000000000 RBX: ffff888132af9800 RCX: 
dead0000000000ff
[  858.296020] RDX: ffffffffa00a0ab5 RSI: 0000000000000003 RDI: 
0000000000000000
[  858.296021] RBP: ffff88810647fa00 R08: 0000000000001000 R09: 
0000000000001000
[  858.296023] R10: 00000000000002c0 R11: 0000000000000001 R12: 
0000000000000372
[  858.296024] R13: 0000000000000072 R14: ffff8881064d16c0 R15: 
ffff888106d14730
[  858.296026] FS:  00007f11f985d7c0(0000) GS:ffff88856c4c0000(0000) 
knlGS:0000000000000000
[  858.296028] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  858.296029] CR2: ffff888135bf20e8 CR3: 0000000113eb0003 CR4: 
00000000001706e0
[  858.415544] P4D 4201067 PUD 100ad6063 PMD 1064af063 PTE 5e282935435e3538
[  858.430590] Oops: 0000 [#3] SMP NOPTI
[  858.435244] CPU: 4 PID: 3279 Comm: thunderbird Tainted: G D           
5.11.15-gentoo-x86_64 #1
[  858.450079] Hardware name: Xen HVM domU, BIOS 4.15.0-rc 03/28/2021
[  858.462333] RIP: 0010:__kmalloc+0xad/0x280
[  858.469631] Code: e8 c6 7e 49 8b 00 49 83 78 10 00 48 89 04 24 0f 84 
b4 01 00 00 48 85 c0 0f 84 ab 01 00 00 41 8b 4c 24 28 49 8b 3c 24 48 01 
c1 <48> 8b 19 48 89 ce 49 33 9c 24 b8 00 00 00 48 0f ce 48 8d 4a 01 48
[  858.515667] RSP: 0018:ffffc900016eb958 EFLAGS: 00010282
[  858.523681] RAX: ffff888135a5ee00 RBX: ffffc900016ebb10 RCX: 
ffff888135a5ee80
[  858.533780] RDX: 000000000000067b RSI: 0000000000000dc0 RDI: 
00000000000311b0
[  858.543968] RBP: 0000000000000dc0 R08: ffff88856c5311b0 R09: 
0000000000000000
[  858.558046] R10: 0000000000000014 R11: 0000000000000001 R12: 
ffff888100041700
[  858.566724] R13: ffff888100041700 R14: 0000000000000100 R15: 
ffffffff8155ce19
[  858.574967] FS:  00007f936125d780(0000) GS:ffff88856c500000(0000) 
knlGS:0000000000000000
[  858.584880] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  858.591405] CR2: ffff888135a5ee80 CR3: 0000000113d8c003 CR4: 
00000000001706e0
[  858.599914] Call Trace:
[  858.603362]  nfs_generic_pgio+0x299/0x380
[  858.607950]  ? nfs_readhdr_alloc+0x16/0x40
[  858.611649]  ? kmem_cache_alloc+0x17d/0x2e0
[  858.615543]  nfs_generic_pg_pgios+0x4e/0xc0
[  858.619448]  nfs_pageio_doio+0x3d/0x80
[  858.622883]  nfs_pageio_complete+0x79/0x140
[  858.627471]  nfs_readpages+0x120/0x1e0
[  858.630958]  read_pages+0x1b7/0x200
[  858.634170]  page_cache_ra_unbounded+0x199/0x1e0
[  858.638185]  generic_file_buffered_read_get_pages+0x1ac/0x780
[  858.643158]  generic_file_buffered_read+0xf9/0x3a0
[  858.647767]  ? do_raw_spin_unlock+0x4b/0xa0
[  858.654527]  ? _raw_spin_unlock+0x1f/0x40
[  858.658387]  nfs_file_read+0x6d/0xa0
[  858.661903]  new_sync_read+0x118/0x1a0
[  858.666579]  vfs_read+0xfa/0x180
[  858.670349]  ksys_read+0x68/0xe0
[  858.673861]  do_syscall_64+0x33/0x80
[  858.677965]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  858.684324] RIP: 0033:0x7f936136c5cc
[  858.688496] Code: ec 28 48 89 54 24 18 48 89 74 24 10 89 7c 24 08 e8 
a9 72 f8 ff 48 8b 54 24 18 48 8b 74 24 10 41 89 c0 8b 7c 24 08 31 c0 0f 
05 <48> 3d 00 f0 ff ff 77 34 44 89 c7 48 89 44 24 08 e8 ff 72 f8 ff 48
[  858.714230] RSP: 002b:00007ffc4ccb5830 EFLAGS: 00000246 ORIG_RAX: 
0000000000000000
[  858.721429] RAX: ffffffffffffffda RBX: 00007f934a848020 RCX: 
00007f936136c5cc
[  858.729338] RDX: 0000000000002000 RSI: 00007f93433fd000 RDI: 
000000000000002a
[  858.737584] RBP: 00007ffc4ccb58b0 R08: 0000000000000000 R09: 
00007f93433ff000
[  858.743835] R10: 0000000000000000 R11: 0000000000000246 R12: 
00007f936143f340
[  858.750273] R13: 00007f934345c325 R14: 00007f936143e740 R15: 
0000000000000d68
[  858.757015] Modules linked in: xen_front_pgdir_shbuf xenfs 
xen_privcmd xen_scsifront snd_hda_codec_hdmi snd_hda_intel 
snd_intel_dspcfg snd_hda_codec snd_hda_core snd_hwdep hid_generic 
snd_pcm snd_timer usbhid hid xen_kbdfront snd atkbd soundcore amdgpu 
drm_ttm_helper ttm gpu_sched xhci_pci xhci_pci_renesas xhci_hcd 
xen_netfront xen_blkfront usbcore [last unloaded: usbip_core]
[  858.788555] CR2: ffff888135a5ee80
[  858.791475] ---[ end trace b17114bccdbf02ad ]---
[  858.791503] BUG: unable to handle page fault for address: 
ffff888135b1add0
[  858.795691] RIP: 0010:__skb_ext_put+0x5/0x40
[  858.807456] #PF: supervisor read access in kernel mode
[  858.807461] #PF: error_code(0x0000) - not-present page
[  858.807464] PGD 4201067 P4D 4201067 PUD 100ad6063 PMD 1064af063 PTE 
202020200a294544
[  858.807471] Oops: 0000 [#4] SMP NOPTI
[  858.807475] CPU: 0 PID: 3283 Comm: firefox Tainted: G D           
5.11.15-gentoo-x86_64 #1
[  858.807477] Hardware name: Xen HVM domU, BIOS 4.15.0-rc 03/28/2021
[  858.807479] RIP: 0010:__list_add_valid+0x10/0x40
[  858.807492] Code: 80 68 00 49 c7 07 00 00 00 00 41 c7 47 08 00 00 00 
00 e9 60 ff ff ff cc cc cc 49 89 d0 48 8b 52 08 48 39 f2 0f 85 c0 71 64 
00 <4c> 8b 0a 4d 39 c1 0f 85 dc 71 64 00 48 39 d7 0f 84 bc 71 64 00 4c
[  858.807495] RSP: 0018:ffffc90001803d68 EFLAGS: 00010046
[  858.807497] RAX: ffff888108b70000 RBX: ffff8881464155d0 RCX: 
ffff888120785000
[  858.807499] RDX: ffff888135b1add0 RSI: ffff888135b1add0 RDI: 
ffff8881464155d0
[  858.807500] RBP: ffff888108b705d0 R08: ffff888108b705d0 R09: 
0000000000000000
[  858.807501] R10: ffff8881342b6260 R11: ffffc90001803d00 R12: 
ffff888135b1add0
[  858.807503] R13: ffffc90001803ed0 R14: ffff88810326f600 R15: 
ffff888146415000
[  858.817577] Code: dc 5b 5d c3 be 01 00 00 00 e8 97 fd bd ff eb e9 be 
02 00 00 00 e8 8b fd bd ff eb dd 66 0f 1f 84 00 00 00 00 00 0f 1f 44 00 
00 <8b> 07 83 f8 01 74 13 b8 ff ff ff ff f0 0f c1 07 83 f8 01 74 05 85
[  858.817584] RSP: 0018:ffffc90000128cf8 EFLAGS: 00010282
[  858.817586] RAX: 0000000000000000 RBX: ffff888132af9800 RCX: 
dead0000000000ff
[  858.817588] RDX: ffffffffa00a0ab5 RSI: 0000000000000003 RDI: 
0000000000000000
[  858.817589] RBP: ffff88810647fa00 R08: 0000000000001000 R09: 
0000000000001000
[  858.817591] R10: 00000000000002c0 R11: 0000000000000001 R12: 
0000000000000372
[  858.828621] FS:  00007f761a2a9780(0000) GS:ffff88856c400000(0000) 
knlGS:0000000000000000
[  858.835801] R13: 0000000000000072 R14: ffff8881064d16c0 R15: 
ffff888106d14730
[  858.835805] FS:  00007f936125d780(0000) GS:ffff88856c500000(0000) 
knlGS:0000000000000000
[  858.835807] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  858.835809] CR2: ffff888135a5ee80 CR3: 0000000113d8c003 CR4: 
00000000001706e0
[  859.101108] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  859.109060] CR2: ffff888135b1add0 CR3: 000000012436e001 CR4: 
00000000001706f0
[  859.119030] Call Trace:
[  859.122595]  __list_add_rcu+0x12/0x40
[  859.128085] Shutting down cpus with NMI
----

Other recent test-runs ended like:

---

# grep 'BUG\|Oops' gt.*

gt-crash.1.log:[ 4488.233093] BUG: kernel NULL pointer dereference, 
address: 0000000000000000
gt-crash.1.log:[ 4488.249659] Oops: 0000 [#1] SMP NOPTI
gt.1.log:[  857.432952] BUG: kernel NULL pointer dereference, address: 
0000000000000000
gt.1.log:[  857.459369] Oops: 0000 [#1] SMP NOPTI
gt.1.log:[  857.784927] BUG: unable to handle page fault for address: 
ffff888135bf20e8
gt.1.log:[  857.848761] Oops: 0009 [#2] SMP NOPTI
gt.1.log:[  858.243633] BUG: unable to handle page fault for address: 
ffff888135a5ee80
gt.1.log:[  858.430590] Oops: 0000 [#3] SMP NOPTI
gt.1.log:[  858.791503] BUG: unable to handle page fault for address: 
ffff888135b1add0
gt.1.log:[  858.807471] Oops: 0000 [#4] SMP NOPTI
gt.4.log:[  393.847136] BUG: kernel NULL pointer dereference, address: 
0000000000000000
gt.4.log:[  393.872365] Oops: 0000 [#1] SMP NOPTI
0:root@gentoo xen-consoles #

-----

For completeness (I don't normally run the dom0 on linux-5.12) :

xl info
host                   : gentoo
release                : 5.12.0-rc8-x86_64
version                : #1 SMP Mon Apr 19 03:23:10 CEST 2021
machine                : x86_64
nr_cpus                : 12
max_cpu_id             : 11
nr_nodes               : 2
cores_per_socket       : 6
threads_per_core       : 1
cpu_mhz                : 2471.974
hw_caps                : 
bfebfbff:77fef3ff:2c100800:00000021:00000001:000037ab:00000000:00000100
virt_caps              : pv hvm hvm_directio pv_directio hap 
iommu_hap_pt_share
total_memory           : 130953
free_memory            : 9990
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 15
xen_extra              : .0-rc
xen_version            : 4.15.0-rc
xen_caps               : xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p 
hvm-3.0-x86_64
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=0xffff800000000000
xen_changeset          : Wed Mar 24 11:34:32 2021 +0100 git:7fa14f3f52-dirty
xen_commandline        : xen.cfg xen-marker-135 console_timestamps=date 
iommu=1 com1=115200,8n1 console=com1 conswitch=lx 
cpufreq=xen:performance,verbose smt=0 core_parking=power nmi=dom0 
gnttab_max_frames=512 gnttab_max_maptrack_frames=1024 
vcpu_migration_delay=2000 tickle_one_idle_cpu=1 spec-ctrl=no-xen 
sched=credit2 timer_slop=5000 max_cstate=2 dom0=msr-relaxed=1 
loglvl=warning/all guest_loglvl=warning/all dom0_mem=16G,max:16G 
dom0_max_vcpus=8 ept=exec_sp=1
cc_compiler            : gcc (Gentoo 10.2.0-r5 p6) 10.2.0
cc_compile_by          : hakon
cc_compile_domain      : alstadheim.priv.no
cc_compile_date        : Mon Mar 29 23:39:11 CEST 2021
build_id               : 6bf2f3c9ede45631d9f7d5201b1472a0
xend_config_format     : 4
0:root@gentoo xen-consoles #

---



