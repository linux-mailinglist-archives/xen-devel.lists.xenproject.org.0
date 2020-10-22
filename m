Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DCF29677A
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 00:59:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10659.28452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVjYM-0002f4-7m; Thu, 22 Oct 2020 22:59:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10659.28452; Thu, 22 Oct 2020 22:59:26 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVjYM-0002ee-41; Thu, 22 Oct 2020 22:59:26 +0000
Received: by outflank-mailman (input) for mailman id 10659;
 Thu, 22 Oct 2020 22:59:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iz3t=D5=nask.pl=michall@srs-us1.protection.inumbo.net>)
 id 1kVjYK-0002eY-DL
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 22:59:24 +0000
Received: from mx.nask.net.pl (unknown [195.187.55.89])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3cc0e301-ef09-4ff5-bb8f-a019eba50933;
 Thu, 22 Oct 2020 22:59:21 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=iz3t=D5=nask.pl=michall@srs-us1.protection.inumbo.net>)
	id 1kVjYK-0002eY-DL
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 22:59:24 +0000
X-Inumbo-ID: 3cc0e301-ef09-4ff5-bb8f-a019eba50933
Received: from mx.nask.net.pl (unknown [195.187.55.89])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3cc0e301-ef09-4ff5-bb8f-a019eba50933;
	Thu, 22 Oct 2020 22:59:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at 
Date: Fri, 23 Oct 2020 00:59:19 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Message-ID: <157653679.6164.1603407559737.JavaMail.zimbra@nask.pl>
Subject: BUG: credit=sched2 machine hang when using DRAKVUF
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.187.238.14]
X-Mailer: Zimbra 9.0.0_GA_3969 (ZimbraWebClient - GC86 (Win)/9.0.0_GA_3969)
Thread-Index: ER30NuT7OhIYTWnjxdfF+8Y02MLJ1Q==
Thread-Topic: credit=sched2 machine hang when using DRAKVUF

Hello,

when using DRAKVUF against a Windows 7 x64 DomU, the whole machine hangs af=
ter a few minutes.

The chance for a hang seems to be correlated with number of PCPUs, in this =
case we have 14 PCPUs and hang is very easily reproducible, while on other =
machines with 2-4 PCPUs it's very rare (but still occurring sometimes). The=
 issue is observed with the default sched=3Dcredit2 and is no longer reprod=
ucible once sched=3Dcredit is set.


Enclosed: panic log from my Dom0.

Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska


pa=C5=BA 22 12:20:50 hostname kernel: rcu: INFO: rcu_sched self-detected st=
all on CPU
pa=C5=BA 22 12:20:50 hostname kernel: rcu:         3-....: (21002 ticks thi=
s GP) idle=3D7e2/1/0x4000000000000002 softirq=3D61729/61729 fqs=3D10490
pa=C5=BA 22 12:20:50 hostname kernel: rcu:          (t=3D21003 jiffies g=3D=
36437 q=3D9406)
pa=C5=BA 22 12:20:50 hostname kernel: NMI backtrace for cpu 3
pa=C5=BA 22 12:20:50 hostname kernel: CPU: 3 PID: 4153 Comm: drakvuf Tainte=
d: P           OEL    4.19.0-6-amd64 #1 Debian 4.19.67-2+deb10u2
pa=C5=BA 22 12:20:50 hostname kernel: Hardware name: Dell Inc. PowerEdge R6=
40/08HT8T, BIOS 2.1.8 04/30/2019
pa=C5=BA 22 12:20:50 hostname kernel: Call Trace:
pa=C5=BA 22 12:20:50 hostname kernel:  <IRQ>
pa=C5=BA 22 12:20:50 hostname kernel:  dump_stack+0x5c/0x80
pa=C5=BA 22 12:20:50 hostname kernel:  nmi_cpu_backtrace.cold.4+0x13/0x50
pa=C5=BA 22 12:20:50 hostname kernel:  ? lapic_can_unplug_cpu.cold.29+0x3b/=
0x3b
pa=C5=BA 22 12:20:50 hostname kernel:  nmi_trigger_cpumask_backtrace+0xf9/0=
xfb
pa=C5=BA 22 12:20:50 hostname kernel:  rcu_dump_cpu_stacks+0x9b/0xcb
pa=C5=BA 22 12:20:50 hostname kernel:  rcu_check_callbacks.cold.81+0x1db/0x=
335
pa=C5=BA 22 12:20:50 hostname kernel:  ? tick_sched_do_timer+0x60/0x60
pa=C5=BA 22 12:20:50 hostname kernel:  update_process_times+0x28/0x60
pa=C5=BA 22 12:20:50 hostname kernel:  tick_sched_handle+0x22/0x60
pa=C5=BA 22 12:20:50 hostname kernel:  tick_sched_timer+0x37/0x70
pa=C5=BA 22 12:20:50 hostname kernel:  __hrtimer_run_queues+0x100/0x280
pa=C5=BA 22 12:20:50 hostname kernel:  hrtimer_interrupt+0x100/0x220
pa=C5=BA 22 12:20:50 hostname kernel:  xen_timer_interrupt+0x1e/0x30
pa=C5=BA 22 12:20:50 hostname kernel:  __handle_irq_event_percpu+0x46/0x190
pa=C5=BA 22 12:20:50 hostname kernel:  handle_irq_event_percpu+0x30/0x80
pa=C5=BA 22 12:20:50 hostname kernel:  handle_percpu_irq+0x40/0x60
pa=C5=BA 22 12:20:50 hostname kernel:  generic_handle_irq+0x27/0x30
pa=C5=BA 22 12:20:50 hostname kernel:  __evtchn_fifo_handle_events+0x17d/0x=
190
pa=C5=BA 22 12:20:50 hostname kernel:  __xen_evtchn_do_upcall+0x42/0x80
pa=C5=BA 22 12:20:50 hostname kernel:  xen_evtchn_do_upcall+0x27/0x40
pa=C5=BA 22 12:20:50 hostname kernel:  xen_do_hypervisor_callback+0x29/0x40
pa=C5=BA 22 12:20:50 hostname kernel:  </IRQ>
pa=C5=BA 22 12:20:50 hostname kernel: RIP: e030:smp_call_function_single+0x=
ce/0xf0
pa=C5=BA 22 12:20:50 hostname kernel: Code: 8b 4c 24 38 65 48 33 0c 25 28 0=
0 00 00 75 34 c9 c3 48 89 d1 48 89 f2 48 89 e6 e8 6d fe ff ff 8b 54 24 18 8=
3 e2 01 74 0b f3 90 <8b> 54 24 18 8
3 e2 01 75 f5 eb ca 8b 05 b9 99 4d 01 85 c0 75 88 0f
pa=C5=BA 22 12:20:50 hostname kernel: RSP: e02b:ffffc9004713bd00 EFLAGS: 00=
000202
pa=C5=BA 22 12:20:50 hostname kernel: RAX: 0000000000000000 RBX: ffff888b0b=
6eea40 RCX: 0000000000000200
pa=C5=BA 22 12:20:50 hostname kernel: RDX: 0000000000000001 RSI: ffffffff82=
12e4a0 RDI: ffffffff81c2dec0
pa=C5=BA 22 12:20:50 hostname kernel: RBP: ffffc9004713bd50 R08: 0000000000=
000000 R09: ffff888c54052480
pa=C5=BA 22 12:20:50 hostname kernel: R10: ffff888c540524a8 R11: 0000000000=
000000 R12: ffffc9004713bd60
pa=C5=BA 22 12:20:50 hostname kernel: R13: 0000000080000000 R14: ffffffff80=
000000 R15: ffff888b0b6eeab0
pa=C5=BA 22 12:20:50 hostname kernel:  ? xen_pgd_alloc+0x110/0x110
pa=C5=BA 22 12:20:50 hostname kernel:  xen_exit_mmap+0xaa/0x100
pa=C5=BA 22 12:20:50 hostname kernel:  exit_mmap+0x64/0x180
pa=C5=BA 22 12:20:50 hostname kernel:  ? __raw_spin_unlock+0x5/0x10
pa=C5=BA 22 12:20:50 hostname kernel:  ? __handle_mm_fault+0x1090/0x1270
pa=C5=BA 22 12:20:50 hostname kernel:  ? _raw_spin_unlock_irqrestore+0x14/0=
x20
pa=C5=BA 22 12:20:50 hostname kernel:  ? exit_robust_list+0x5b/0x130
pa=C5=BA 22 12:20:50 hostname kernel:  mmput+0x54/0x130
pa=C5=BA 22 12:20:50 hostname kernel:  do_exit+0x290/0xb90
pa=C5=BA 22 12:20:50 hostname kernel:  ? handle_mm_fault+0xd6/0x200
pa=C5=BA 22 12:20:50 hostname kernel:  do_group_exit+0x3a/0xa0
pa=C5=BA 22 12:20:50 hostname kernel:  __x64_sys_exit_group+0x14/0x20
pa=C5=BA 22 12:20:50 hostname kernel:  do_syscall_64+0x53/0x110
pa=C5=BA 22 12:20:50 hostname kernel:  entry_SYSCALL_64_after_hwframe+0x44/=
0xa9
pa=C5=BA 22 12:20:50 hostname kernel: RIP: 0033:0x7f98d23ec9d6
pa=C5=BA 22 12:20:50 hostname kernel: Code: Bad RIP value.
pa=C5=BA 22 12:20:50 hostname kernel: RSP: 002b:00007ffc4a0327f8 EFLAGS: 00=
000246 ORIG_RAX: 00000000000000e7
pa=C5=BA 22 12:20:50 hostname kernel: RAX: ffffffffffffffda RBX: 00007f98d2=
4dd760 RCX: 00007f98d23ec9d6
pa=C5=BA 22 12:20:50 hostname kernel: RDX: 0000000000000000 RSI: 0000000000=
00003c RDI: 0000000000000000
pa=C5=BA 22 12:20:50 hostname kernel: RBP: 0000000000000000 R08: 0000000000=
0000e7 R09: ffffffffffffff60
pa=C5=BA 22 12:20:50 hostname kernel: R10: 0000000000000000 R11: 0000000000=
000246 R12: 00007f98d24dd760
pa=C5=BA 22 12:20:50 hostname kernel: R13: 000000000000005a R14: 00007f98d2=
4e6428 R15: 0000000000000000

