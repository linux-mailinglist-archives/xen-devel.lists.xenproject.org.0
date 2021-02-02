Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6784930B540
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 03:29:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80289.146762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6lRJ-000373-Jo; Tue, 02 Feb 2021 02:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80289.146762; Tue, 02 Feb 2021 02:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6lRJ-00036e-G8; Tue, 02 Feb 2021 02:29:13 +0000
Received: by outflank-mailman (input) for mailman id 80289;
 Tue, 02 Feb 2021 02:29:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=33Vw=HE=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1l6lRH-00036Z-T5
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 02:29:12 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 829d8355-4b57-4e84-93de-54556559ae70;
 Tue, 02 Feb 2021 02:29:11 +0000 (UTC)
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
X-Inumbo-ID: 829d8355-4b57-4e84-93de-54556559ae70
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612232950;
  h=to:from:subject:message-id:date:mime-version:
   content-transfer-encoding;
  bh=aBk6kPNay1v13xNGzgI3rqpwZ9zBuxanpuYIpdG7v2o=;
  b=IFb3NqLY6NlTm8wRTui7yuoYJOm5izWUF9rMpQ4+ew1elPhGEiKFhAIO
   AqTVO9fYz4pEhUJ41Sf1szPqb9mSCY5WI35EQMAoaVI8LSWLqSU7Y5g1W
   f+FeKDnKI/jQyDix1x92WN1wcZV7emyZfxRA6wmI4PAPmScJ+3du4cC7e
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: vTLfqJPo0/XPxXfapal6Ck3ylc+JRO1WtY0vx9VD1dVhk+tIP2Hphd1efDgvBFRQrK9A71HzBw
 vPe48PhqjnWxI5pV/7EpgfdF9kNSN5Q8q0dGMZLixw7xaCIkKKqwhaTI3rKLWgcMX+tbdllHWl
 uVtIym+DRFRpJPtjlw5OTRy14IsOm7Vda/nYXOvtDwG9yT3EVzeB5qwOQ3nfDxqJ8Wwu5tq18w
 /N6adRS31X+ZcksZUNpADtsWp4DkpKYJNRmbUs+kRVXTXhCE/demms8wB4TBUMks2R4h6B9egZ
 iUw=
X-SBRS: 5.1
X-MesageID: 37661405
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,393,1602561600"; 
   d="scan'208";a="37661405"
To: 'Juergen Gross' <jgross@suse.com>, xen-devel
	<xen-devel@lists.xenproject.org>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: dom0 crash in xenvif_rx_ring_slots_available
Message-ID: <c7dea44e-8e6d-1b98-b2a4-7e9623a8e3fb@citrix.com>
Date: Tue, 2 Feb 2021 02:29:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Juergen,

We've got a crash report from one of our customers (see below) running 4.4 kernel.
The functions seem to be the new that came with XSA-332 and nothing like that has been
reported before in their cloud. It appears there is some use-after-free happening on skb
in the following code fragment:

static bool xenvif_rx_ring_slots_available(struct xenvif_queue *queue)
{
        RING_IDX prod, cons;
        struct sk_buff *skb;
        int needed;

        skb = skb_peek(&queue->rx_queue);
        if (!skb)
                return false;

        needed = DIV_ROUND_UP(skb->len, XEN_PAGE_SIZE);
        if (skb_is_gso(skb))  <== skb points to 0-ed memory
                needed++;

Has something similar been reported before? Any ideas?

Igor


[2721961.681180]  ALERT: BUG: unable to handle kernel NULL pointer dereference at 0000000000000002
[2721961.681222]  ALERT: IP: [<ffffffff8146c4da>] xenvif_rx_ring_slots_available+0x4a/0xa0
[2721961.681252]   WARN: PGD 121cf5067 PUD 10095a067 PMD 0 
[2721961.681274]   WARN: Oops: 0000 [#1] SMP 
[2721961.681291]   WARN: Modules linked in: iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi vport_vxlan(O) vport_stt(O) tun sch_sfq sch_htb 8021q garp mrp stp llc openvswitch(O) tunnel6 nf_conntrack_ipv6 nf_nat_ipv6 nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_defrag_ipv6 nf_nat nf_conntrack libcrc32c xt_tcpudp iptable_filter dm_multipath ipmi_devintf dm_mod x86_pkg_temp_thermal coretemp crc32_pclmul aesni_intel aes_x86_64 ablk_helper cryptd lrw gf128mul glue_helper psmouse sb_edac sg edac_core lpc_ich mfd_core hpilo shpchp wmi tpm_tis tpm nls_utf8 isofs ipmi_si ipmi_msghandler ip_tables x_tables sd_mod uhci_hcd serio_raw ehci_pci ehci_hcd ixgbe(O) hpsa(O) vxlan scsi_transport_sas ip6_udp_tunnel udp_tunnel ptp pps_core scsi_dh_rdac scsi_dh_hp_sw scsi_dh_emc scsi_dh_alua scsi_mod ipv6 autofs4
[2721961.681538]   WARN: CPU: 12 PID: 0 Comm: swapper/12 Tainted: G           O    4.4.0+2 #1
[2721961.681551]   WARN: Hardware name: HP ProLiant DL380p Gen8, BIOS P70 05/21/2018
[2721961.681562]   WARN: task: ffff880149231c00 ti: ffff880149238000 task.ti: ffff880149238000
[2721961.681574]   WARN: RIP: e030:[<ffffffff8146c4da>]  [<ffffffff8146c4da>] xenvif_rx_ring_slots_available+0x4a/0xa0
[2721961.681591]   WARN: RSP: e02b:ffff880149b83db8  EFLAGS: 00010002
[2721961.681601]   WARN: RAX: 0000000000000000 RBX: ffffc90040a0e000 RCX: 0000000000000000
[2721961.681615]   WARN: RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffffc90040a0e000
[2721961.681629]   WARN: RBP: ffff880149b83db8 R08: 0000000000000000 R09: ffff880057bcc000
[2721961.681647]   WARN: R10: ffff880057bcc0e0 R11: 0000000000000000 R12: 0000000000000000
[2721961.681671]   WARN: R13: 0000000000000157 R14: 0000000000000001 R15: 0000000000000000
[2721961.681742]   WARN: FS:  00007f5cc4c98780(0000) GS:ffff880149b80000(0000) knlGS:0000000000000000
[2721961.681762]   WARN: CS:  e033 DS: 002b ES: 002b CR0: 0000000080050033
[2721961.681777]   WARN: CR2: 0000000000000002 CR3: 0000000101006000 CR4: 0000000000040660
[2721961.681802]   WARN: Stack:
[2721961.681812]   WARN:  ffff880149b83dd8 ffffffff8146cdf7 ffffc90040a0e000 ffffc90040a0e028
[2721961.681878]   WARN:  ffff880149b83e08 ffffffff8146aa71 ffff88009ca7ca80 0000000000000157
[2721961.681911]   WARN:  ffff88006315c020 0000000000000000 ffff880149b83e58 ffffffff810c046f
[2721961.681971]   WARN: Call Trace:
[2721961.681981]   WARN:  <IRQ> 
[2721961.681994]   WARN:  [<ffffffff8146cdf7>] xenvif_have_rx_work+0x17/0x80
[2721961.682044]   WARN:  [<ffffffff8146aa71>] xenvif_interrupt+0x61/0xb0
[2721961.682065]   WARN:  [<ffffffff810c046f>] handle_irq_event_percpu+0x7f/0x1e0
[2721961.682108]   WARN:  [<ffffffff810c060b>] handle_irq_event+0x3b/0x60
[2721961.682125]   WARN:  [<ffffffff810c35ef>] handle_edge_irq+0xff/0x130
[2721961.682178]   WARN:  [<ffffffff810bfc72>] generic_handle_irq+0x22/0x30
[2721961.682196]   WARN:  [<ffffffff813c6a0d>] handle_irq_for_port+0xbd/0xd0
[2721961.682248]   WARN:  [<ffffffff813c7c23>] __evtchn_fifo_handle_events+0x143/0x170
[2721961.682266]   WARN:  [<ffffffff813c7c7e>] evtchn_fifo_handle_events+0xe/0x10
[2721961.682285]   WARN:  [<ffffffff813c4af0>] __xen_evtchn_do_upcall+0x50/0x90
[2721961.682339]   WARN:  [<ffffffff813c6a50>] xen_evtchn_do_upcall+0x30/0x50
[2721961.682359]   WARN:  [<ffffffff815a456e>] xen_do_hypervisor_callback+0x1e/0x40
[2721961.682414]   WARN:  <EOI> 
[2721961.682425]   WARN:  [<ffffffff810013aa>] ? xen_hypercall_sched_op+0xa/0x20
[2721961.682443]   WARN:  [<ffffffff810013aa>] ? xen_hypercall_sched_op+0xa/0x20
[2721961.682492]   WARN:  [<ffffffff8100c570>] ? xen_safe_halt+0x10/0x20
[2721961.682506]   WARN:  [<ffffffff81020d27>] ? default_idle+0x57/0xf0
[2721961.682518]   WARN:  [<ffffffff8102145f>] ? arch_cpu_idle+0xf/0x20
[2721961.682569]   WARN:  [<ffffffff810ab292>] ? default_idle_call+0x32/0x40
[2721961.682582]   WARN:  [<ffffffff810ab4ec>] ? cpu_startup_entry+0x1ec/0x330
[2721961.682633]   WARN:  [<ffffffff81013dd8>] ? cpu_bringup_and_idle+0x18/0x20
[2721961.682645]   WARN: Code: 73 48 85 c0 74 f7 8b 90 80 00 00 00 8b 88 cc 00 00 00 4c 8b 80 d0 00 00 00 0f b6 80 91 00 00 00 48 81 c2 ff 0f 00 00 48 c1 ea 0c <66> 41 83 7c 08 02 00 8d 72 01 0f 44 f2 48 8b 97 d8 a9 00 00 83 
[2721961.682944]  ALERT: RIP  [<ffffffff8146c4da>] xenvif_rx_ring_slots_available+0x4a/0xa0
[2721961.682998]   WARN:  RSP <ffff880149b83db8>
[2721961.683006]   WARN: CR2: 0000000000000002
[2721961.683808]   WARN: ---[ end trace b82c754a03a6c6e8 ]---
[2721961.683830]  EMERG: Kernel panic - not syncing: Fatal exception in interrupt

