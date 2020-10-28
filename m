Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A6D29CD7B
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 03:04:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13280.33832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXaoz-0007hS-Ps; Wed, 28 Oct 2020 02:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13280.33832; Wed, 28 Oct 2020 02:04:17 +0000
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
	id 1kXaoz-0007h3-M1; Wed, 28 Oct 2020 02:04:17 +0000
Received: by outflank-mailman (input) for mailman id 13280;
 Wed, 28 Oct 2020 02:04:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Dss=ED=nask.pl=michall@srs-us1.protection.inumbo.net>)
 id 1kXaoy-0007gy-T2
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 02:04:16 +0000
Received: from mx.nask.net.pl (unknown [195.187.55.89])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e70213dc-1873-4526-9f07-ac349ce562f7;
 Wed, 28 Oct 2020 02:04:14 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=8Dss=ED=nask.pl=michall@srs-us1.protection.inumbo.net>)
	id 1kXaoy-0007gy-T2
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 02:04:16 +0000
X-Inumbo-ID: e70213dc-1873-4526-9f07-ac349ce562f7
Received: from mx.nask.net.pl (unknown [195.187.55.89])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e70213dc-1873-4526-9f07-ac349ce562f7;
	Wed, 28 Oct 2020 02:04:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at 
Date: Wed, 28 Oct 2020 03:04:12 +0100 (CET)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: =?utf-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Message-ID: <1747162107.4472424.1603850652584.JavaMail.zimbra@nask.pl>
In-Reply-To: <a80f05ac-bd18-563e-12f7-1a0f9f0d4f6b@suse.com>
References: <157653679.6164.1603407559737.JavaMail.zimbra@nask.pl> <a80f05ac-bd18-563e-12f7-1a0f9f0d4f6b@suse.com>
Subject: Re: BUG: credit=sched2 machine hang when using DRAKVUF
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.187.238.14]
X-Mailer: Zimbra 9.0.0_GA_3969 (ZimbraWebClient - GC86 (Win)/9.0.0_GA_3969)
Thread-Topic: credit=sched2 machine hang when using DRAKVUF
Thread-Index: BnNcHQLsrjmQr0BXl+REe3376mCu2Q==

----- 23 pa=C5=BA, 2020 o 6:47, J=C3=BCrgen Gro=C3=9F jgross@suse.com napis=
a=C5=82(a):

> On 23.10.20 00:59, Micha=C5=82 Leszczy=C5=84ski wrote:
>> Hello,
>>=20
>> when using DRAKVUF against a Windows 7 x64 DomU, the whole machine hangs=
 after a
>> few minutes.
>>=20
>> The chance for a hang seems to be correlated with number of PCPUs, in th=
is case
>> we have 14 PCPUs and hang is very easily reproducible, while on other ma=
chines
>> with 2-4 PCPUs it's very rare (but still occurring sometimes). The issue=
 is
>> observed with the default sched=3Dcredit2 and is no longer reproducible =
once
>> sched=3Dcredit is set.
>=20
> Interesting. Can you please share some more information?
>=20
> Which Xen version are you using?
>=20
> Is there any additional information in the dom0 log which could be
> related to the hang (earlier WARN() splats, Oopses, Xen related
> messages, hardware failure messages, ...?
>=20
> Can you please try to get backtraces of all cpus at the time of the
> hang?
>=20
> It would help to know which cpu was the target of the call of
> smp_call_function_single(), so a disassembly of that function would
> be needed to find that information from the dumped registers.
>=20
> I'm asking because I've seen a similar problem recently and I was
> rather suspecting a fifo event channel issue than the Xen scheduler,
> but your data suggests it could be the scheduler after all (if it is
> the same issue, of course).
>=20
>=20
> Juergen


As I've said before, I'm using RELEASE-4.14.0, this is DELL PowerEdge R640 =
with 14 PCPUs.

I have the following additional pieces of log (enclosed below). As you coul=
d see, the issue is about particular vCPUs of Dom0 not being scheduled for =
a long time, which really decreases stability of the host system.

Hope this helps somehow.



Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

---

[  313.730969] rcu: INFO: rcu_sched self-detected stall on CPU
[  313.731154] rcu:     5-....: (5249 ticks this GP) idle=3Dc6e/1/0x4000000=
000000002 softirq=3D4625/4625 fqs=3D2624
[  313.731474] rcu:      (t=3D5250 jiffies g=3D10309 q=3D220)
[  338.968676] watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [sshd:5991=
]
[  346.963959] watchdog: BUG: soft lockup - CPU#2 stuck for 23s! [xenconsol=
ed:2747]
(XEN) *** Serial input to Xen (type 'CTRL-a' three times to switch input)
(XEN) sched_smt_power_savings: disabled
(XEN) NOW=3D384307105230
(XEN) Online Cpus: 0,2,4,6,8,10,12,14,16,18,20,22,24,26
(XEN) Cpupool 0:
(XEN) Cpus: 0,2,4,6,8,10,12,14,16,18,20,22,24,26
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) Scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Active queues: 2
(XEN)   default-weight     =3D 256
(XEN) Runqueue 0:
(XEN)   ncpus              =3D 7
(XEN)   cpus               =3D 0,2,4,6,8,10,12
(XEN)   max_weight         =3D 256
(XEN)   pick_bias          =3D 10
(XEN)   instload           =3D 3
(XEN)   aveload            =3D 805194 (~307%)
(XEN)   idlers: 00000000,00000000,00000000,00000000,00000000,00000000,00001=
145
(XEN)   tickled: 00000000,00000000,00000000,00000000,00000000,00000000,0000=
0000
(XEN)   fully idle cores: 00000000,00000000,00000000,00000000,00000000,0000=
0000,00001145
(XEN) Runqueue 1:
(XEN)   ncpus              =3D 7
(XEN)   cpus               =3D 14,16,18,20,22,24,26
(XEN)   max_weight         =3D 256
(XEN)   pick_bias          =3D 22
(XEN)   instload           =3D 0
(XEN)   aveload            =3D 51211 (~19%)
(XEN)   idlers: 00000000,00000000,00000000,00000000,00000000,00000000,05454=
000
(XEN)   tickled: 00000000,00000000,00000000,00000000,00000000,00000000,0000=
0000
(XEN)   fully idle cores: 00000000,00000000,00000000,00000000,00000000,0000=
0000,05454000
(XEN) Domain info:
(XEN)   Domain: 0 w 256 c 0 v 14
(XEN)     1: [0.0] flags=3D20 cpu=3D0 credit=3D-10000000 [w=3D256] load=3D4=
594 (~1%)
(XEN)     2: [0.1] flags=3D20 cpu=3D2 credit=3D9134904 [w=3D256] load=3D262=
144 (~100%)
(XEN)     3: [0.2] flags=3D22 cpu=3D4 credit=3D-10000000 [w=3D256] load=3D2=
62144 (~100%)
(XEN)     4: [0.3] flags=3D20 cpu=3D6 credit=3D-10000000 [w=3D256] load=3D4=
299 (~1%)
(XEN)     5: [0.4] flags=3D20 cpu=3D8 credit=3D-10000000 [w=3D256] load=3D4=
537 (~1%)
(XEN)     6: [0.5] flags=3D22 cpu=3D10 credit=3D-10000000 [w=3D256] load=3D=
262144 (~100%)
(XEN)     7: [0.6] flags=3D20 cpu=3D12 credit=3D-10000000 [w=3D256] load=3D=
5158 (~1%)
(XEN)     8: [0.7] flags=3D20 cpu=3D14 credit=3D10053352 [w=3D256] load=3D5=
150 (~1%)
(XEN)     9: [0.8] flags=3D20 cpu=3D16 credit=3D10200526 [w=3D256] load=3D5=
155 (~1%)
(XEN)    10: [0.9] flags=3D20 cpu=3D18 credit=3D10207025 [w=3D256] load=3D4=
939 (~1%)
(XEN)    11: [0.10] flags=3D20 cpu=3D20 credit=3D10131199 [w=3D256] load=3D=
5753 (~2%)
(XEN)    12: [0.11] flags=3D20 cpu=3D22 credit=3D8103663 [w=3D256] load=3D2=
2544 (~8%)
(XEN)    13: [0.12] flags=3D20 cpu=3D24 credit=3D10213151 [w=3D256] load=3D=
4905 (~1%)
(XEN)    14: [0.13] flags=3D20 cpu=3D26 credit=3D10235821 [w=3D256] load=3D=
4858 (~1%)
(XEN)   Domain: 29 w 256 c 0 v 4
(XEN)    15: [29.0] flags=3D0 cpu=3D16 credit=3D10500000 [w=3D256] load=3D0=
 (~0%)
(XEN)    16: [29.1] flags=3D0 cpu=3D26 credit=3D10500000 [w=3D256] load=3D0=
 (~0%)
(XEN)    17: [29.2] flags=3D0 cpu=3D10 credit=3D8294046 [w=3D256] load=3D0 =
(~0%)
(XEN)    18: [29.3] flags=3D0 cpu=3D12 credit=3D9009727 [w=3D256] load=3D0 =
(~0%)
(XEN)   Domain: 30 w 256 c 0 v 4
(XEN)    19: [30.0] flags=3D0 cpu=3D26 credit=3D10500000 [w=3D256] load=3D0=
 (~0%)
(XEN)    20: [30.1] flags=3D0 cpu=3D16 credit=3D10500000 [w=3D256] load=3D0=
 (~0%)
(XEN)    21: [30.2] flags=3D0 cpu=3D18 credit=3D10500000 [w=3D256] load=3D0=
 (~0%)
(XEN)    22: [30.3] flags=3D0 cpu=3D22 credit=3D10500000 [w=3D256] load=3D0=
 (~0%)
(XEN) Runqueue 0:
(XEN) CPU[00] runq=3D0, sibling=3D{0}, core=3D{0,2,4,6,8,10,12,14,16,18,20,=
22,24,26}
(XEN) CPU[02] runq=3D0, sibling=3D{2}, core=3D{0,2,4,6,8,10,12,14,16,18,20,=
22,24,26}
(XEN) CPU[04] runq=3D0, sibling=3D{4}, core=3D{0,2,4,6,8,10,12,14,16,18,20,=
22,24,26}
(XEN)   run: [0.2] flags=3D22 cpu=3D4 credit=3D-10000000 [w=3D256] load=3D2=
62144 (~100%)
(XEN) CPU[06] runq=3D0, sibling=3D{6}, core=3D{0,2,4,6,8,10,12,14,16,18,20,=
22,24,26}
(XEN) CPU[08] runq=3D0, sibling=3D{8}, core=3D{0,2,4,6,8,10,12,14,16,18,20,=
22,24,26}
(XEN) CPU[10] runq=3D0, sibling=3D{10}, core=3D{0,2,4,6,8,10,12,14,16,18,20=
,22,24,26}
(XEN)   run: [0.5] flags=3D22 cpu=3D10 credit=3D-10000000 [w=3D256] load=3D=
262144 (~100%)
(XEN) CPU[12] runq=3D0, sibling=3D{12}, core=3D{0,2,4,6,8,10,12,14,16,18,20=
,22,24,26}
(XEN) RUNQ:
(XEN)     0: [0.1] flags=3D20 cpu=3D2 credit=3D9134904 [w=3D256] load=3D262=
144 (~100%)
(XEN) Runqueue 1:
(XEN) CPU[14] runq=3D1, sibling=3D{14}, core=3D{0,2,4,6,8,10,12,14,16,18,20=
,22,24,26}
(XEN) CPU[16] runq=3D1, sibling=3D{16}, core=3D{0,2,4,6,8,10,12,14,16,18,20=
,22,24,26}
(XEN) CPU[18] runq=3D1, sibling=3D{18}, core=3D{0,2,4,6,8,10,12,14,16,18,20=
,22,24,26}
(XEN) CPU[20] runq=3D1, sibling=3D{20}, core=3D{0,2,4,6,8,10,12,14,16,18,20=
,22,24,26}
(XEN) CPU[22] runq=3D1, sibling=3D{22}, core=3D{0,2,4,6,8,10,12,14,16,18,20=
,22,24,26}
(XEN) CPU[24] runq=3D1, sibling=3D{24}, core=3D{0,2,4,6,8,10,12,14,16,18,20=
,22,24,26}
(XEN) CPU[26] runq=3D1, sibling=3D{26}, core=3D{0,2,4,6,8,10,12,14,16,18,20=
,22,24,26}
(XEN) RUNQ:
(XEN) CPUs info:
(XEN) CPU[00] current=3Dd[IDLE]v0, curr=3Dd[IDLE]v0, prev=3DNULL
(XEN) CPU[02] current=3Dd[IDLE]v2, curr=3Dd[IDLE]v2, prev=3DNULL
(XEN) CPU[04] current=3Dd0v2, curr=3Dd0v2, prev=3DNULL
(XEN) CPU[06] current=3Dd[IDLE]v6, curr=3Dd[IDLE]v6, prev=3DNULL
(XEN) CPU[08] current=3Dd[IDLE]v8, curr=3Dd[IDLE]v8, prev=3DNULL
(XEN) CPU[10] current=3Dd0v5, curr=3Dd0v5, prev=3DNULL
(XEN) CPU[12] current=3Dd[IDLE]v12, curr=3Dd[IDLE]v12, prev=3DNULL
(XEN) CPU[14] current=3Dd[IDLE]v14, curr=3Dd[IDLE]v14, prev=3DNULL
(XEN) CPU[16] current=3Dd[IDLE]v16, curr=3Dd[IDLE]v16, prev=3DNULL
(XEN) CPU[18] current=3Dd[IDLE]v18, curr=3Dd[IDLE]v18, prev=3DNULL
(XEN) CPU[20] current=3Dd[IDLE]v20, curr=3Dd[IDLE]v20, prev=3DNULL
(XEN) CPU[22] current=3Dd[IDLE]v22, curr=3Dd[IDLE]v22, prev=3DNULL
(XEN) CPU[24] current=3Dd[IDLE]v24, curr=3Dd[IDLE]v24, prev=3DNULL
(XEN) CPU[26] current=3Dd[IDLE]v26, curr=3Dd[IDLE]v26, prev=3DNULL
[  366.966158] watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [sshd:5991=
]
[  374.961437] watchdog: BUG: soft lockup - CPU#2 stuck for 23s! [xenconsol=
ed:2747]
[  376.737277] rcu: INFO: rcu_sched self-detected stall on CPU
[  376.737457] rcu:     5-....: (21002 ticks this GP) idle=3Dc6e/1/0x400000=
0000000002 softirq=3D4625/4630 fqs=3D10491
[  376.737773] rcu:      (t=3D21003 jiffies g=3D10309 q=3D4631)
[  402.958905] watchdog: BUG: soft lockup - CPU#2 stuck for 23s! [xenconsol=
ed:2747]
[  402.962904] watchdog: BUG: soft lockup - CPU#5 stuck for 23s! [sshd:5991=
]
[  413.434099] rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks=
: { 2-... 5-... } 5657 jiffies s: 57 root: 0x24/.
[  413.434470] rcu: blocking rcu_node structures:
[  430.956362] watchdog: BUG: soft lockup - CPU#2 stuck for 22s! [xenconsol=
ed:2747]
[  430.960361] watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [sshd:5991=
]
[  439.743562] rcu: INFO: rcu_sched self-detected stall on CPU
[  439.743741] rcu:     5-....: (36755 ticks this GP) idle=3Dc6e/1/0x400000=
0000000002 softirq=3D4625/4630 fqs=3D18363
[  439.744060] rcu:      (t=3D36756 jiffies g=3D10309 q=3D8837)
[  458.953810] watchdog: BUG: soft lockup - CPU#2 stuck for 22s! [xenconsol=
ed:2747]
[  466.957079] watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [sshd:5991=
]
[  476.916310] rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks=
: { 2-... 5-... } 21529 jiffies s: 57 root: 0x24/.
[  476.916712] rcu: blocking rcu_node structures:
[  486.951250] watchdog: BUG: soft lockup - CPU#2 stuck for 22s! [xenconsol=
ed:2747]
[  491.251030] INFO: task sshd:5993 blocked for more than 120 seconds.
[  491.251249]       Tainted: P           OEL    4.19.0-6-amd64 #1 Debian 4=
.19.67-2+deb10u2
[  491.251535] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables =
this message.
[  491.251891] INFO: task sshd:5995 blocked for more than 120 seconds.
[  491.252078]       Tainted: P           OEL    4.19.0-6-amd64 #1 Debian 4=
.19.67-2+deb10u2
[  491.252321] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables =
this message.
[  491.252657] INFO: task qemu-system-i38:6011 blocked for more than 120 se=
conds.
[  491.252924]       Tainted: P           OEL    4.19.0-6-amd64 #1 Debian 4=
.19.67-2+deb10u2
[  491.253167] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables =
this message.
[  491.253512] INFO: task sshd:6056 blocked for more than 120 seconds.
[  491.253703]       Tainted: P           OEL    4.19.0-6-amd64 #1 Debian 4=
.19.67-2+deb10u2
[  491.253947] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables =
this message.
[  494.954517] watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [sshd:5991=
]
[  502.749802] rcu: INFO: rcu_sched self-detected stall on CPU
[  502.749981] rcu:     5-....: (52508 ticks this GP) idle=3Dc6e/1/0x400000=
0000000002 softirq=3D4625/4630 fqs=3D26225
[  502.750307] rcu:      (t=3D52509 jiffies g=3D10309 q=3D12321)
[  514.948683] watchdog: BUG: soft lockup - CPU#2 stuck for 22s! [xenconsol=
ed:2747]
[  526.951580] watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [sshd:5991=
]
[  540.398469] rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks=
: { 2-... 5-... } 37401 jiffies s: 57 root: 0x24/.
[  540.398843] rcu: blocking rcu_node structures:
[  542.946109] watchdog: BUG: soft lockup - CPU#2 stuck for 22s! [xenconsol=
ed:2747]
[  554.949003] watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [sshd:5991=
]
[  565.756021] rcu: INFO: rcu_sched self-detected stall on CPU
[  565.756203] rcu:     5-....: (68261 ticks this GP) idle=3Dc6e/1/0x400000=
0000000002 softirq=3D4625/4630 fqs=3D34096
[  565.756521] rcu:      (t=3D68262 jiffies g=3D10309 q=3D14838)
[  570.943529] watchdog: BUG: soft lockup - CPU#2 stuck for 22s! [xenconsol=
ed:2747]
[  590.945683] watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [sshd:5991=
]
[  598.940945] watchdog: BUG: soft lockup - CPU#2 stuck for 22s! [xenconsol=
ed:2747]
[  603.880631] rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks=
: { 2-... 5-... } 53273 jiffies s: 57 root: 0x24/.
[  603.881006] rcu: blocking rcu_node structures:
[  612.071898] INFO: task ntpd:2726 blocked for more than 120 seconds.
[  612.072120]       Tainted: P           OEL    4.19.0-6-amd64 #1 Debian 4=
.19.67-2+deb10u2
[  612.072409] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables =
this message.
[  612.072806] INFO: task sshd:5993 blocked for more than 120 seconds.
[  612.073016]       Tainted: P           OEL    4.19.0-6-amd64 #1 Debian 4=
.19.67-2+deb10u2
[  612.073258] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables =
this message.
[  612.073605] INFO: task sshd:5995 blocked for more than 120 seconds.
[  612.085380]       Tainted: P           OEL    4.19.0-6-amd64 #1 Debian 4=
.19.67-2+deb10u2
[  612.097439] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables =
this message.
[  612.109691] INFO: task qemu-system-i38:6011 blocked for more than 120 se=
conds.
[  612.121877]       Tainted: P           OEL    4.19.0-6-amd64 #1 Debian 4=
.19.67-2+deb10u2
[  612.134123] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables =
this message.
[  612.146501] INFO: task sshd:6056 blocked for more than 120 seconds.
[  612.158836]       Tainted: P           OEL    4.19.0-6-amd64 #1 Debian 4=
.19.67-2+deb10u2
[  612.171134] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables =
this message.
[  612.183643] INFO: task qemu-system-i38:6105 blocked for more than 120 se=
conds.
[  612.196174]       Tainted: P           OEL    4.19.0-6-amd64 #1 Debian 4=
.19.67-2+deb10u2
[  612.208899] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables =
this message.
[  618.943102] watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [sshd:5991=
]
[  626.938354] watchdog: BUG: soft lockup - CPU#2 stuck for 22s! [xenconsol=
ed:2747]
[  628.762185] rcu: INFO: rcu_sched self-detected stall on CPU
[  628.774574] rcu:     5-....: (84011 ticks this GP) idle=3Dc6e/1/0x400000=
0000000002 softirq=3D4625/4630 fqs=3D41964
[  628.787208] rcu:      (t=3D84015 jiffies g=3D10309 q=3D21278)
[  654.935761] watchdog: BUG: soft lockup - CPU#2 stuck for 22s! [xenconsol=
ed:2747]
[  654.939869] watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [sshd:5991=
]

