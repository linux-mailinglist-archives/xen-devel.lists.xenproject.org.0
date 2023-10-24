Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCED7D49EE
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 10:25:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621765.968549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvCj9-0002jd-JG; Tue, 24 Oct 2023 08:25:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621765.968549; Tue, 24 Oct 2023 08:25:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvCj9-0002h0-GV; Tue, 24 Oct 2023 08:25:27 +0000
Received: by outflank-mailman (input) for mailman id 621765;
 Tue, 24 Oct 2023 08:25:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jXWl=GG=casper.srs.infradead.org=BATV+e2898748ca55db067849+7366+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qvCj7-0002fe-VG
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 08:25:26 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0f4daac-7246-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 10:25:24 +0200 (CEST)
Received: from [2001:8b0:10b:5:545e:5208:5de0:9d33]
 (helo=u3832b3a9db3152.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qvCj3-001OnM-LC; Tue, 24 Oct 2023 08:25:21 +0000
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
X-Inumbo-ID: e0f4daac-7246-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SAPwQSpRolepOMH8U92ZJQFf2vr59yurhTZStDpT/Ew=; b=pZjMR+N4beQ3V9DcHNkpWLgSot
	2bBwppoI9t2RLFXI3vy+OcR2fCKjL3ES2KUd4apf0qJqC7Kf/XdlJPSh5bf92tA3O5LSxUZxJ2zjA
	sVijmsXdbmpoidpXWfSz+aGXTj6h/DzM45oJZkv5m/DBXmikc9dRMahxSAL688HToJ/zIW2oA5yeZ
	9vM+HKKNzQEdFw0G70JVolFu/KwyeC7bRC3+4ZTeFj4zqE+r8xxMmvF2Jymm4P+uOzt0TJD/oUoFA
	2jWqjVEEPk/0pGe9pekosyG+Twf7Yir6B+SPGKSgR/feSzV5Gs0SaC5PyApLVfKLTmwYUWmj7P+z+
	53RLqBsg==;
Message-ID: <721fdf434d4f03ae44965e4b2b6da5e04e85358a.camel@infradead.org>
Subject: Re: Lockdep show 6.6-rc regression in Xen HVM CPU hotplug
From: David Woodhouse <dwmw2@infradead.org>
To: Juergen Gross <jgross@suse.com>, xen-devel
 <xen-devel@lists.xenproject.org>,  paulmck <paulmck@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Rahul Singh <rahul.singh@arm.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
Date: Tue, 24 Oct 2023 09:25:21 +0100
In-Reply-To: <662772ec0d43cce9233680d67d7114bc8b0ed48d.camel@infradead.org>
References: <b28fff67f7501e4713af9b8c777f853cc44d6c6f.camel@infradead.org>
	 <c75a3d53-fc36-46a6-b781-f16e1e5c6226@suse.com>
	 <662772ec0d43cce9233680d67d7114bc8b0ed48d.camel@infradead.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-lqk5afWkZIU/xhDN86Y/"
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-lqk5afWkZIU/xhDN86Y/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2023-10-24 at 08:43 +0100, David Woodhouse wrote:
> On Tue, 2023-10-24 at 08:53 +0200, Juergen Gross wrote:
> >=20
> > I'm puzzled. This path doesn't contain any of the RCU usage I've added =
in
> > commit 87797fad6cce.
> >=20
> > Are you sure that with just reverting commit 87797fad6cce the issue doe=
sn't
> > manifest anymore? I'd rather expect commit 721255b9826b having caused t=
his
> > behavior, just telling from the messages above.
>=20
> Retesting in the cold light of day, yes. Using v6.6-rc5 which is the
> parent commit of the offending 87797fad6cce.

I don't know if this is relevant or just noise, but this only happens
under true Xen (I've only tested 4.17.1, as noted).

Under Qemu I get the same warning on offlining, but it does come back.

However, the reason I was looking at this in the first place was
because when I enable XEN_HVM_CPUID_UPCALL_VECTOR under Qemu=C2=B9 to make
the guest use the per-vCPU local APIC upcall, I get a different failure
mode on onlining.

=C2=B9 https://lore.kernel.org/qemu-devel/20231019154020.99080-10-dwmw2@inf=
radead.org/

I don't know if it's related to interrupts being enabled too early,
which is what some of the other warnings at *online* time in my first
email seemed to be complaining about? This one seems to be a timer IRQ
storm (or just never finishing processing the event bitmap?).=20

Not sure if this is just because Qemu manages to deliver the first
event channel a bit sooner than Xen, perhaps because it should have
cleared something in the vCPU state when offlining?

Maybe it's an additional clue... maybe just noise and my fault in Qemu or K=
VM.

[root@localhost cpu1]# echo 1 > online=20
kvm_xen_set_vcpu_callback callback vcpu 1 vector 243
[   33.451969] installing Xen timer for CPU 1
[   33.453547] smpboot: Booting Node 0 Processor 1 APIC 0x1
[   60.000948] watchdog: BUG: soft lockup - CPU#0 stuck for 26s! [khugepage=
d:37]
[   60.000985]=20
[   60.000987] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   60.000988] [ BUG: Invalid wait context ]
[   60.000989] 6.6.0-rc5+ #1376 Not tainted
[   60.000991] -----------------------------
[   60.000992] khugepaged/37 is trying to lock:
[   60.000993] ffffffff9841abd8 (&port_lock_key){-.-.}-{3:3}, at: serial825=
0_console_write+0x460/0x4e0
[   60.001016] other info that might help us debug this:
[   60.001016] context-{2:2}
[   60.001017] 6 locks held by khugepaged/37:
[   60.001019]  #0: ffff88f301c93620 (&mm->mmap_lock){++++}-{4:4}, at: coll=
apse_huge_page+0x2d1/0x890
[   60.001038]  #1: ffff88f3075aa8e8 (&anon_vma->rwsem){+.+.}-{4:4}, at: co=
llapse_huge_page+0x40a/0x890
[   60.001048]  #2: ffffffff96c03820 (rcu_read_lock){....}-{1:3}, at: xen_e=
vtchn_do_upcall+0x61/0x1b0
[   60.001062]  #3: ffffffff96c007e0 (console_lock){+.+.}-{0:0}, at: vprint=
k_emit+0x12e/0x1c0
[   60.001068]  #4: ffffffff96c00830 (console_srcu){....}-{0:0}, at: consol=
e_flush_all+0x21/0x260
[   60.001072]  #5: ffffffff96880420 (console_owner){-.-.}-{0:0}, at: conso=
le_emit_next_record+0x113/0x330
[   60.001078] stack backtrace:
[   60.001079] CPU: 0 PID: 37 Comm: khugepaged Not tainted 6.6.0-rc5+ #1376
[   60.001082] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
rel-1.16.2-14-g1e1da7a96300-prebuilt.qemu.org 04/01/2014
[   60.001084] Call Trace:
[   60.001086]  <IRQ>
[   60.001093]  dump_stack_lvl+0x57/0x90
[   60.001098]  __lock_acquire+0x7bb/0xbb0
[   60.001105]  lock_acquire.part.0+0xad/0x240
[   60.001108]  ? serial8250_console_write+0x460/0x4e0
[   60.001114]  ? rcu_is_watching+0xd/0x40
[   60.001123]  ? lock_acquire+0xf2/0x110
[   60.001128]  __raw_spin_lock_irqsave+0x42/0x60
[   60.001131]  ? serial8250_console_write+0x460/0x4e0
[   60.001135]  serial8250_console_write+0x460/0x4e0
[   60.001140]  ? lock_acquire.part.0+0xbd/0x240
[   60.001145]  ? rcu_is_watching+0xd/0x40
[   60.001148]  ? lock_acquire+0xf2/0x110
[   60.001155]  ? console_emit_next_record+0x113/0x330
[   60.001157]  console_emit_next_record+0x13c/0x330
[   60.001159]  ? console_emit_next_record+0x113/0x330
[   60.001165]  console_flush_all+0xed/0x260
[   60.001167]  ? console_flush_all+0x21/0x260
[   60.001170]  console_unlock+0x52/0xf0
[   60.001178]  vprintk_emit+0x173/0x1c0
[   60.001182]  _printk+0x60/0x80
[   60.001191]  watchdog_timer_fn+0x216/0x2a0
[   60.001205]  ? __pfx_watchdog_timer_fn+0x10/0x10
[   60.001209]  __hrtimer_run_queues+0x1b2/0x380
[   60.001217]  hrtimer_interrupt+0xfe/0x240
[   60.001222]  xen_timer_interrupt+0x29/0x40
[   60.001233]  __handle_irq_event_percpu+0x87/0x240
[   60.001238]  handle_irq_event_percpu+0xf/0x40
[   60.001242]  handle_percpu_irq+0x4f/0x70
[   60.001247]  handle_irq_desc+0x3a/0x50
[   60.001250]  evtchn_2l_handle_events+0x254/0x2a0
[   60.001254]  ? rcu_is_watching+0xd/0x40
[   60.001257]  ? lock_acquire+0xf2/0x110
[   60.001262]  xen_evtchn_do_upcall+0xa1/0x1b0
[   60.001266]  __sysvec_xen_hvm_callback+0x47/0x80
[   60.001271]  sysvec_xen_hvm_callback+0x99/0xc0
[   60.001283]  </IRQ>
[   60.001284]  <TASK>
[   60.001288]  asm_sysvec_xen_hvm_callback+0x16/0x20
[   60.001308] RIP: 0010:smp_call_function_many_cond+0x119/0x660
[   60.001312] Code: 7e 08 48 63 d0 e8 17 90 44 00 3b 05 e1 bf c5 01 73 25 =
48 63 d0 49 8b 36 48 03 34 d5 60 dc 55 96 8b 56 08 83 e2 01 74 0a f3 90 <8b=
> 4e 08 83 e1 01 75 f6 83 c0 01 eb c1 48 83 c4 38 5b 5d 41 5c 41
[   60.001315] RSP: 0018:ffffae458014fc00 EFLAGS: 00000202
[   60.001317] RAX: 0000000000000001 RBX: 0000000000000000 RCX: 00000000000=
00001
[   60.001319] RDX: 0000000000000001 RSI: ffff88f33ecb3e00 RDI: ffff88f3011=
12790
[   60.001320] RBP: 0000000000000000 R08: ffffffff96015000 R09: fffffffffff=
ffffc
[   60.001322] R10: ffffffff95cacbac R11: ffff88f301bd0d48 R12: 00000000000=
00000
[   60.001323] R13: 0000000000000001 R14: ffff88f33ec2f8c0 R15: 00000000000=
00001
[   60.001326]  ? mtree_load+0x8c/0x590
[   60.001333]  ? __pfx_tlb_remove_table_smp_sync+0x10/0x10
[   60.001346]  ? __pfx_tlb_remove_table_smp_sync+0x10/0x10
[   60.001350]  smp_call_function+0x39/0x70
[   60.001354]  collapse_huge_page+0x509/0x890
[   60.001361]  hpage_collapse_scan_pmd+0x376/0x8b0
[   60.001369]  khugepaged_scan_mm_slot.constprop.0+0x28e/0x500
[   60.001377]  khugepaged+0xd5/0x240
[   60.001380]  ? _raw_spin_unlock_irqrestore+0x4c/0x60
[   60.001388]  ? lockdep_hardirqs_on+0x7d/0x100
[   60.001396]  ? __pfx_khugepaged+0x10/0x10
[   60.001400]  kthread+0xf6/0x130
[   60.001405]  ? __pfx_kthread+0x10/0x10
[   60.001408]  ret_from_fork+0x30/0x50
[   60.001417]  ? __pfx_kthread+0x10/0x10
[   60.001419]  ret_from_fork_asm+0x1b/0x30
[   60.001427]  </TASK>
[   60.062651] Modules linked in:
[   60.063126] irq event stamp: 58300
[   60.063680] hardirqs last  enabled at (58299): [<ffffffff95e01046>] asm_=
sysvec_xen_hvm_callback+0x16/0x20
[   60.065189] hardirqs last disabled at (58300): [<ffffffff95ccc1ea>] sysv=
ec_xen_hvm_callback+0xa/0xc0
[   60.066633] softirqs last  enabled at (58098): [<ffffffff95cec89c>] __do=
_softirq+0x31c/0x423
[   60.067787] softirqs last disabled at (58089): [<ffffffff950bab91>] __ir=
q_exit_rcu+0x91/0x100
[   60.068928] CPU: 0 PID: 37 Comm: khugepaged Not tainted 6.6.0-rc5+ #1376
[   60.069786] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
rel-1.16.2-14-g1e1da7a96300-prebuilt.qemu.org 04/01/2014
[   60.071340] RIP: 0010:smp_call_function_many_cond+0x119/0x660
[   60.072100] Code: 7e 08 48 63 d0 e8 17 90 44 00 3b 05 e1 bf c5 01 73 25 =
48 63 d0 49 8b 36 48 03 34 d5 60 dc 55 96 8b 56 08 83 e2 01 74 0a f3 90 <8b=
> 4e 08 83 e1 01 75 f6 83 c0 01 eb c1 48 83 c4 38 5b 5d 41 5c 41
[   60.074795] RSP: 0018:ffffae458014fc00 EFLAGS: 00000202
[   60.075557] RAX: 0000000000000001 RBX: 0000000000000000 RCX: 00000000000=
00001
[   60.076509] RDX: 0000000000000001 RSI: ffff88f33ecb3e00 RDI: ffff88f3011=
12790
[   60.077465] RBP: 0000000000000000 R08: ffffffff96015000 R09: fffffffffff=
ffffc
[   60.078476] R10: ffffffff95cacbac R11: ffff88f301bd0d48 R12: 00000000000=
00000
[   60.079434] R13: 0000000000000001 R14: ffff88f33ec2f8c0 R15: 00000000000=
00001
[   60.080589] FS:  0000000000000000(0000) GS:ffff88f33ec00000(0000) knlGS:=
0000000000000000
[   60.081626] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   60.082459] CR2: 00007f4cceba6818 CR3: 00000000021ec000 CR4: 00000000000=
006f0
[   60.083672] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000=
00000
[   60.085047] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 00000000000=
00400
[   60.085994] Call Trace:
[   60.086283]  <IRQ>
[   60.086530]  ? watchdog_timer_fn+0x230/0x2a0
[   60.087084]  ? __pfx_watchdog_timer_fn+0x10/0x10
[   60.087603]  ? __hrtimer_run_queues+0x1b2/0x380
[   60.088307]  ? hrtimer_interrupt+0xfe/0x240
[   60.088931]  ? xen_timer_interrupt+0x29/0x40
[   60.089578]  ? __handle_irq_event_percpu+0x87/0x240
[   60.090420]  ? handle_irq_event_percpu+0xf/0x40
[   60.091083]  ? handle_percpu_irq+0x4f/0x70
[   60.091646]  ? handle_irq_desc+0x3a/0x50
[   60.092166]  ? evtchn_2l_handle_events+0x254/0x2a0
[   60.092716]  ? rcu_is_watching+0xd/0x40
[   60.093248]  ? lock_acquire+0xf2/0x110
[   60.093814]  ? xen_evtchn_do_upcall+0xa1/0x1b0
[   60.094482]  ? __sysvec_xen_hvm_callback+0x47/0x80
[   60.095262]  ? sysvec_xen_hvm_callback+0x99/0xc0
[   60.095978]  </IRQ>
[   60.096295]  <TASK>
[   60.096610]  ? asm_sysvec_xen_hvm_callback+0x16/0x20
[   60.097323]  ? mtree_load+0x8c/0x590
[   60.097872]  ? smp_call_function_many_cond+0x119/0x660
[   60.098796]  ? __pfx_tlb_remove_table_smp_sync+0x10/0x10
[   60.099599]  ? __pfx_tlb_remove_table_smp_sync+0x10/0x10
[   60.100515]  smp_call_function+0x39/0x70
[   60.101119]  collapse_huge_page+0x509/0x890
[   60.101920]  hpage_collapse_scan_pmd+0x376/0x8b0
[   60.102642]  khugepaged_scan_mm_slot.constprop.0+0x28e/0x500
[   60.103378]  khugepaged+0xd5/0x240
[   60.103884]  ? _raw_spin_unlock_irqrestore+0x4c/0x60
[   60.104659]  ? lockdep_hardirqs_on+0x7d/0x100
[   60.105364]  ? __pfx_khugepaged+0x10/0x10
[   60.105945]  kthread+0xf6/0x130
[   60.106363]  ? __pfx_kthread+0x10/0x10
[   60.106808]  ret_from_fork+0x30/0x50
[   60.107239]  ? __pfx_kthread+0x10/0x10
[   60.107769]  ret_from_fork_asm+0x1b/0x30
[   60.108430]  </TASK>


--=-lqk5afWkZIU/xhDN86Y/
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEkQw
ggYQMIID+KADAgECAhBNlCwQ1DvglAnFgS06KwZPMA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQG
EwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoT
FVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0
aW9uIEF1dGhvcml0eTAeFw0xODExMDIwMDAwMDBaFw0zMDEyMzEyMzU5NTlaMIGWMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAyjztlApB/975Rrno1jvm2pK/KxBOqhq8gr2+JhwpKirSzZxQgT9tlC7zl6hn1fXjSo5MqXUf
ItMltrMaXqcESJuK8dtK56NCSrq4iDKaKq9NxOXFmqXX2zN8HHGjQ2b2Xv0v1L5Nk1MQPKA19xeW
QcpGEGFUUd0kN+oHox+L9aV1rjfNiCj3bJk6kJaOPabPi2503nn/ITX5e8WfPnGw4VuZ79Khj1YB
rf24k5Ee1sLTHsLtpiK9OjG4iQRBdq6Z/TlVx/hGAez5h36bBJMxqdHLpdwIUkTqT8se3ed0PewD
ch/8kHPo5fZl5u1B0ecpq/sDN/5sCG52Ds+QU5O5EwIDAQABo4IBZDCCAWAwHwYDVR0jBBgwFoAU
U3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFAnA8vwL2pTbX/4r36iZQs/J4K0AMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEF
BQcDBDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2Vy
dHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMHYGCCsGAQUF
BwEBBGowaDA/BggrBgEFBQcwAoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJT
QUFkZFRydXN0Q0EuY3J0MCUGCCsGAQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0G
CSqGSIb3DQEBDAUAA4ICAQBBRHUAqznCFfXejpVtMnFojADdF9d6HBA4kMjjsb0XMZHztuOCtKF+
xswhh2GqkW5JQrM8zVlU+A2VP72Ky2nlRA1GwmIPgou74TZ/XTarHG8zdMSgaDrkVYzz1g3nIVO9
IHk96VwsacIvBF8JfqIs+8aWH2PfSUrNxP6Ys7U0sZYx4rXD6+cqFq/ZW5BUfClN/rhk2ddQXyn7
kkmka2RQb9d90nmNHdgKrwfQ49mQ2hWQNDkJJIXwKjYA6VUR/fZUFeCUisdDe/0ABLTI+jheXUV1
eoYV7lNwNBKpeHdNuO6Aacb533JlfeUHxvBz9OfYWUiXu09sMAviM11Q0DuMZ5760CdO2VnpsXP4
KxaYIhvqPqUMWqRdWyn7crItNkZeroXaecG03i3mM7dkiPaCkgocBg0EBYsbZDZ8bsG3a08LwEsL
1Ygz3SBsyECa0waq4hOf/Z85F2w2ZpXfP+w8q4ifwO90SGZZV+HR/Jh6rEaVPDRF/CEGVqR1hiuQ
OZ1YL5ezMTX0ZSLwrymUE0pwi/KDaiYB15uswgeIAcA6JzPFf9pLkAFFWs1QNyN++niFhsM47qod
x/PL+5jR87myx5uYdBEQkkDc+lKB1Wct6ucXqm2EmsaQ0M95QjTmy+rDWjkDYdw3Ms6mSWE3Bn7i
5ZgtwCLXgAIe5W8mybM2JzCCBhQwggT8oAMCAQICEQDGvhmWZ0DEAx0oURL6O6l+MA0GCSqGSIb3
DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYD
VQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28g
UlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIyMDEwNzAw
MDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9y
ZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3GpC2bomUqk+91wLYBzDMcCj5C9m6
oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZHh7htyAkWYVoFsFPrwHounto8xTsy
SSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT9YgcBqKCo65pTFmOnR/VVbjJk4K2
xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNjP+qDrh0db7PAjO1D4d5ftfrsf+kd
RR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy2U+eITZ5LLE5s45mX2oPFknWqxBo
bQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3BgBEmfsYWlBXO8rVXfvPgLs32VdV
NZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/7auNVRmPB3v5SWEsH8xi4Bez2V9U
KxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmdlFYhAflWKQ03Ufiu8t3iBE3VJbc2
5oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9aelIl6vtbhMA+l0nfrsORMa4kobqQ5
C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMBAAGjggHMMIIByDAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeDMcimo0oz8o1R1Nver3ZVpSkwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGln
by5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGln
b1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEB
BH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50
QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0cDovL29j
c3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5mcmFkZWFkLm9yZzANBgkqhkiG9w0B
AQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQvQ/fzPXmtR9t54rpmI2TfyvcKgOXp
qa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvIlSPrzIB4Z2wyIGQpaPLlYflrrVFK
v9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9ChWFfgSXvrWDZspnU3Gjw/rMHrGnql
Htlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0whpBtXdyDjzBtQTaZJ7zTT/vlehc/
tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9IzCCBhQwggT8oAMCAQICEQDGvhmW
Z0DEAx0oURL6O6l+MA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3Jl
YXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0
ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJl
IEVtYWlsIENBMB4XDTIyMDEwNzAwMDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJ
ARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3
GpC2bomUqk+91wLYBzDMcCj5C9m6oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZH
h7htyAkWYVoFsFPrwHounto8xTsySSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT
9YgcBqKCo65pTFmOnR/VVbjJk4K2xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNj
P+qDrh0db7PAjO1D4d5ftfrsf+kdRR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy
2U+eITZ5LLE5s45mX2oPFknWqxBobQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3
BgBEmfsYWlBXO8rVXfvPgLs32VdVNZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/
7auNVRmPB3v5SWEsH8xi4Bez2V9UKxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmd
lFYhAflWKQ03Ufiu8t3iBE3VJbc25oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9ae
lIl6vtbhMA+l0nfrsORMa4kobqQ5C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMB
AAGjggHMMIIByDAfBgNVHSMEGDAWgBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeD
Mcimo0oz8o1R1Nver3ZVpSkwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYw
FAYIKwYBBQUHAwQGCCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYB
BQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9j
cmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1h
aWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdv
LmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAj
BggrBgEFBQcwAYYXaHR0cDovL29jc3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQv
Q/fzPXmtR9t54rpmI2TfyvcKgOXpqa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvI
lSPrzIB4Z2wyIGQpaPLlYflrrVFKv9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9Ch
WFfgSXvrWDZspnU3Gjw/rMHrGnqlHtlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0w
hpBtXdyDjzBtQTaZJ7zTT/vlehc/tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9
IzGCBMcwggTDAgEBMIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVz
dGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMT
NVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA
xr4ZlmdAxAMdKFES+jupfjANBglghkgBZQMEAgEFAKCCAeswGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMxMDI0MDgyNTIxWjAvBgkqhkiG9w0BCQQxIgQgUieZcOP6
Wo1GwwWznniiJ6V+SAZJQ3QMgQCo3Gs462gwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgAlB3+373e0j9T6bvNiTKGlAFYbNUSQ2VsS
Bl+/BLnHUDyMzVlvRRe126FBYEnWJfc7sz6hgzzRpzYSUfrPNRURQ1xFN3Bn0FO61jEZEfUcNsaN
fyFuUkThPQyWGq/9G49qblPTZd2FmWqLpGsdmSKo68MeMaoPQfdAlHaqWueyPNzh3aOyJ9c8E6Ip
cHCZupEMeXDxl8MzysvfhuM4prIFumc4pmuVT+epvuwK8qDDLCYljf/cmnUmL1ddUftYsCOqXotP
RB+EEpp8eZw/ESACyGHBb+oVqhj2FETXSRoOvZ4XJxQuckYSFpPD55CjWpfHo+JLQJ6Yp+Fe2W29
mrniE4Kli0aPM0T0N4W1g84l+vTOMIeBeBYzdW1/ydqYtkwcGCUuqr++VDNa2ZW0oCIH7N6KiYR1
CM/MkkmENjo2lmAmouI+QawkBmza90HvkNwHBXTuahzeZTUQXzFs0pooZ1/SlVSiawqRxotct8NW
jdqAYonjKx4dlRCx+3BhQUK9VQ4dRXfYTKWnUeLS4s/7uekvWQY1qdTFE3KfMMACeaYpHmqAaRhs
3we14pQvT0yEVUQ3nCRz0ERNgnMiEeAUe4ktsk1/cmBP873gDJ7ezeaLptaStH0Zh/ZaLp0jA8YD
5k8oYdPxt1pjtkviXK4986nJhb5FMPV1RaAi/X8+kQAAAAAAAA==


--=-lqk5afWkZIU/xhDN86Y/--

