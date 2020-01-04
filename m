Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BE9130355
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2020 16:35:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inlO7-0000Mj-DE; Sat, 04 Jan 2020 15:30:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r6QG=2Z=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1inlO6-0000Me-DE
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2020 15:30:50 +0000
X-Inumbo-ID: 28d9514e-2f07-11ea-88e7-bc764e2007e4
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28d9514e-2f07-11ea-88e7-bc764e2007e4;
 Sat, 04 Jan 2020 15:30:38 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id DAD773FA;
 Sat,  4 Jan 2020 10:30:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Sat, 04 Jan 2020 10:30:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=oB5a2XV8bIwQHA0x2ypeLJPdGpWTZ
 32RAyQTJcc6MiM=; b=NSFWpxD1AL/qSn3fJHtp/6ArkesptY2jGzHN5t9pU/BPQ
 lrE1d8XIXYtmVx2s9znOuZSq8i1wT6CEDmLfksY5u2IpCx2dIOCrBPqoG0HM183e
 oO3D/6u7tATBdQixKHalQkgRXQzMmySRrVGeN74ersCwCOhaixtoVWRI0Z/Lthy9
 6HSUk326XxgVs3JSEv+6HAj2tF9432RNDFULn/UUuhuv+Qsfckhh5INQyTt8r9qZ
 3/8s0Rr0Gb5vvNBBAgsBoAfnwVqT9CdjPhozpAqCTa1XpO3tKnWgsENgNiacIEPJ
 zsG1xuyF64hH5GIWsp33xXZWDEfniOIUJXAcjyUFA==
X-ME-Sender: <xms:na8QXgQBcWM2xNLw6VhPA5vimuu6FfuZWhgcNIFG4MdYMRJzI4qigA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeghedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
 rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
 hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdeffeen
 ucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvth
 hhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:na8QXrXi-jCCfNhubhXJzO3omXHMG8ivrVM1g96GNpRaryAs-koNfA>
 <xmx:na8QXkSTDMYkUTvAaX_4_C7qD8_1Z5frk6yo2knX5mFAv8i4UJZP0w>
 <xmx:na8QXlmgDqLZHk2Btj00MKd_4Ck5AwXft-X_XxN9PuUcbY6yguo3rg>
 <xmx:na8QXhRRcrE4L-i22FWW6r0poZgiTAEbseqtgzCsfOQgHej1UB6hoQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7DF5480063;
 Sat,  4 Jan 2020 10:30:36 -0500 (EST)
Date: Sat, 4 Jan 2020 16:30:32 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <20200104153032.GA2995@mail-itl>
MIME-Version: 1.0
Subject: [Xen-devel] Xen crash on S3 resume on 4.13 and unstable if any CPU
 is re-offlined
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?utf-8?Q?Micha=C5=82?= Kowalczyk <mkow@invisiblethingslab.com>
Content-Type: multipart/mixed; boundary="===============6240709872821898356=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6240709872821898356==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0eh6TmSyL6TZE2Uz"
Content-Disposition: inline


--0eh6TmSyL6TZE2Uz
Content-Type: multipart/mixed; protected-headers=v1;
	boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline
Subject: Xen crash on S3 resume on 4.13 and unstable if any CPU is re-offlined


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I have a reliable crash on resume from S3. I can reproduce it on both
real hardware and nested within KVM, although call traces are different
between those platforms. In any case, it happens only if some CPU is to
be re-offlined after resume (smt=3Doff and/or maxcpus=3D... options).

I think the crash from the real hardware gives more clues, but the one
=66rom qemu may also be interesting, maybe it's even another bug?

The crash message (full console log attached):

(XEN) mce_intel.c:772: MCA Capability: firstbank 0, extended MCE MSR 0, BCA=
ST, CMCI
(XEN) CPU0 CMCI LVT vector (0xf2) already installed
(XEN) Finishing wakeup from ACPI S3 state.
(XEN) Enabling non-boot CPUs  ...
(XEN) ----[ Xen-4.14-unstable  x86_64  debug=3Dy   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d08023beb7>] schedule.c#cpu_schedule_callback+0x=
ea/0x1a1
(XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor
(XEN) rax: 0000000000000000   rbx: ffff82d080453348   rcx: ffff82d080584020
(XEN) rdx: 000000339b66e000   rsi: 0000000000008005   rdi: ffff82d080453340
(XEN) rbp: ffff8300ca45fd68   rsp: ffff8300ca45fd68   r8:  0000000000000004
(XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 8000000000000000
(XEN) r12: ffff82d080453340   r13: ffff82d080453200   r14: 0000000000008005
(XEN) r15: 0000000000008000   cr0: 000000008005003b   cr4: 00000000000426e0
(XEN) cr3: 00000000ca44f000   cr2: 0000000000000008
(XEN) fsb: 000079d5e4f9e740   gsb: ffff888135600000   gss: 0000000000000000
(XEN) ds: 0018   es: 0010   fs: b800   gs: 0010   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d08023beb7> (schedule.c#cpu_schedule_callback+=
0xea/0x1a1):
(XEN)  48 8b 14 d1 48 8b 04 02 <48> 8b 48 08 48 85 c9 74 64 48 8b 05 b9 c3 =
32 00
(XEN) Xen stack trace from rsp=3Dffff8300ca45fd68:
(XEN)    ffff8300ca45fdb0 ffff82d080221289 ffff8300ca45fdd8 0000000000000001
(XEN)    0000000000000000 00000000ffffffef ffff8300ca45fe00 0000000000000001
(XEN)    0000000000000200 ffff8300ca45fdc8 ffff82d080203476 0000000000000001
(XEN)    ffff8300ca45fdf0 ffff82d080203550 0000000000000000 0000000000000001
(XEN)    0000000000000000 ffff8300ca45fe20 ffff82d080203999 ffff8300ca45fef8
(XEN)    0000000000000000 0000000000000003 00000000000426e0 ffff8300ca45fe58
(XEN)    ffff82d0802e4240 ffff83042896c5f0 ffff83041bb4d000 0000000000000000
(XEN)    0000000000000000 ffff83041bb73000 ffff8300ca45fe78 ffff82d08020828f
(XEN)    ffff83041bb4d1b8 ffff82d080567210 ffff8300ca45fe90 ffff82d08023fd39
(XEN)    ffff82d080567200 ffff8300ca45fec0 ffff82d08024001a 0000000000000000
(XEN)    ffff82d080567210 ffff82d08056d980 ffff82d080584020 ffff8300ca45fef0
(XEN)    ffff82d08027247a ffff83041bbb2000 ffff83041bb4d000 ffff83041bbb3000
(XEN)    0000000000000000 ffff8300ca45fd98 0000000000000003 ffffffff820ae496
(XEN)    0000000000000003 0000000000000000 0000000000002003 ffffffff822c6868
(XEN)    0000000000000246 0000000000003403 00000000ffff0000 0000000000000000
(XEN)    0000000000000000 ffffffff810010ea 0000000000002003 0000000000000010
(XEN)    deadbeefdeadf00d 0000010000000000 ffffffff810010ea 000000000000e033
(XEN)    0000000000000246 ffffc900011abbe8 000000000000e02b 003b4a890045ffe0
(XEN)    003b4ddf00098fa8 003b4e0300000001 003b499d0045ffe0 0000e01000000000
(XEN)    ffff83041bbb2000 0000000000000000 00000000000426e0 0000000000000000
(XEN) Xen call trace:
(XEN)    [<ffff82d08023beb7>] R schedule.c#cpu_schedule_callback+0xea/0x1a1
(XEN)    [<ffff82d080221289>] F notifier_call_chain+0x6b/0x96
(XEN)    [<ffff82d080203476>] F cpu.c#cpu_notifier_call_chain+0x1b/0x33
(XEN)    [<ffff82d080203550>] F cpu_down+0x5e/0x15c
(XEN)    [<ffff82d080203999>] F enable_nonboot_cpus+0x113/0x1fb
(XEN)    [<ffff82d0802e4240>] F power.c#enter_state_helper+0x107/0x51b
(XEN)    [<ffff82d08020828f>] F domain.c#continue_hypercall_tasklet_handler=
+0x8b/0xb7
(XEN)    [<ffff82d08023fd39>] F tasklet.c#do_tasklet_work+0x76/0xa9
(XEN)    [<ffff82d08024001a>] F do_tasklet+0x58/0x8a
(XEN)    [<ffff82d08027247a>] F domain.c#idle_loop+0x40/0x96
(XEN)=20
(XEN) Pagetable walk from 0000000000000008:
(XEN)  L4[0x000] =3D 000000041bbff063 ffffffffffffffff
(XEN)  L3[0x000] =3D 000000041bbfe063 ffffffffffffffff
(XEN)  L2[0x000] =3D 000000041bbfd063 ffffffffffffffff
(XEN)  L1[0x000] =3D 0000000000000000 ffffffffffffffff
(XEN)=20
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) FATAL PAGE FAULT
(XEN) [error_code=3D0000]
(XEN) Faulting linear address: 0000000000000008
(XEN) ****************************************

And the one from qemu:

(XEN) mce_intel.c:772: MCA Capability: firstbank 1, extended MCE MSR 0, SER
(XEN) Finishing wakeup from ACPI S3 state.
(XEN) Enabling non-boot CPUs  ...
(XEN) Assertion 'c2rqd(ops, sched_unit_master(unit)) =3D=3D svc->rqd' faile=
d at sched_credit2.c:2137
(XEN) ----[ Xen-4.14-unstable  x86_64  debug=3Dy   Not tainted ]----
(XEN) CPU:    1
(XEN) RIP:    e008:[<ffff82d08022fe1a>] sched_credit2.c#csched2_unit_wake+0=
x174/0x176
(XEN) RFLAGS: 0000000000010097   CONTEXT: hypervisor (d0v0)
(XEN) rax: ffff83013a7313e8   rbx: ffff83013a6bdf40   rcx: 0000000000000051
(XEN) rdx: ffff83013a731160   rsi: ffff83013a7310e0   rdi: 0000000000000003
(XEN) rbp: ffff83013a6f7d98   rsp: ffff83013a6f7d78   r8:  deadbeefdeadf00d
(XEN) r9:  deadbeefdeadf00d   r10: 0000000000000000   r11: 0000000000000000
(XEN) r12: ffff83013a6bc7e0   r13: ffff82d08043e720   r14: 0000000000000003
(XEN) r15: 00000003c5ffecac   cr0: 0000000080050033   cr4: 0000000000000660
(XEN) cr3: 000000004b005000   cr2: 0000000000000000
(XEN) fsb: 00007751649f4740   gsb: ffff888134a00000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <ffff82d08022fe1a> (sched_credit2.c#csched2_unit_wake=
+0x174/0x176):
(XEN)  ef e8 1e c1 ff ff eb a7 <0f> 0b 55 48 89 e5 41 57 41 56 41 55 41 54 =
53 48
(XEN) Xen stack trace from rsp=3Dffff83013a6f7d78:
(XEN)    ffff83013a6a3000 ffff83013a6bdf40 ffff83013a6bdf40 ffff83013a7313e8
(XEN)    ffff83013a6f7de8 ffff82d0802391f8 0000000000000202 ffff83013a7313e8
(XEN)    ffff83013a6c1018 0000000000000001 0000000000000000 0000000000000000
(XEN)    ffff83013a6c1018 ffff83013a6a3000 ffff83013a6f7e58 ffff82d08020906c
(XEN)    ffff82d08035d3d4 ffff82d08035d3c8 ffff82d08035d3d4 ffff82d08035d3c8
(XEN)    ffff82d08035d3d4 ffff82d08035d3c8 ffff82d08035d3d4 ffff83013a6f7ef8
(XEN)    0000000000000180 ffff83013a6aa000 deadbeefdeadf00d 0000000000000003
(XEN)    ffff83013a6f7ee8 ffff82d0803570c7 0000000000000001 0000000000000001
(XEN)    0000000000000000 deadbeefdeadf00d deadbeefdeadf00d ffff82d08035d3c8
(XEN)    ffff82d08035d3d4 ffff82d08035d3c8 ffff82d08035d3d4 ffff82d08035d3c8
(XEN)    ffff82d08035d3d4 ffff83013a6aa000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 00007cfec59080e7 ffff82d08035d432
(XEN)    0000000000015120 0000000000000001 0000000000000000 ffff88813024a540
(XEN)    0000000000000000 0000000000000001 0000000000000246 0000000000140000
(XEN)    ffff8880bf7db000 ffffea0004be4508 0000000000000018 ffffffff8100130a
(XEN)    0000000000000000 0000000000000001 0000000000000001 0000010000000000
(XEN)    ffffffff8100130a 000000000000e033 0000000000000246 ffffc90000c97c98
(XEN)    000000000000e02b 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000e01000000001 ffff83013a6aa000 00000030ba196000
(XEN)    0000000000000660 0000000000000000 000000013a6e2000 0000040000000000
(XEN) Xen call trace:
(XEN)    [<ffff82d08022fe1a>] R sched_credit2.c#csched2_unit_wake+0x174/0x1=
76
(XEN)    [<ffff82d0802391f8>] F vcpu_wake+0xea/0x4d8
(XEN)    [<ffff82d08020906c>] F do_vcpu_op+0x36f/0x687
(XEN)    [<ffff82d0803570c7>] F pv_hypercall+0x28f/0x57d
(XEN)    [<ffff82d08035d432>] F lstar_enter+0x112/0x120
(XEN)=20
(XEN)=20
(XEN) ****************************************
(XEN) Panic on CPU 1:
(XEN) Assertion 'c2rqd(ops, sched_unit_master(unit)) =3D=3D svc->rqd' faile=
d at sched_credit2.c:2137
(XEN) ****************************************

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="xen-resume-crash.log"
Content-Transfer-Encoding: quoted-printable

=FF Xen 4.14-unstable
(XEN) Xen version 4.14-unstable (user@) (gcc (GCC) 9.2.1 20190827 (Red Hat =
9.2.1-1)) debug=3Dy  Sat Jan  4 03:56:05 CET 2020
(XEN) Latest ChangeSet: Wed Dec 25 10:40:50 2019 +0100 git:095af9793d-dirty
(XEN) build-id: 96f5872c8f7548a4944a09ac0458621de4ef4440
(XEN) Bootloader: iPXE 1.0.0+ (3fe68)
(XEN) Command line: iommu=3Dno-igfx smt=3Don loglvl=3Dall guest_loglvl=3Dal=
l reboot=3Dacpi dom0=3Dverbose console=3Dcom1 com1=3D115200,8n1 maxcpus=3D1
(XEN) Xen image load base address: 0
(XEN) Video information:
(XEN)  VGA is text mode 80x25, font 8x16
(XEN)  VBE/DDC methods: V2; EDID transfer time: 1 seconds
(XEN) Disc information:
(XEN)  Found 1 MBR signatures
(XEN)  Found 1 EDD information structures
(XEN) Xen-e820 RAM map:
(XEN)  0000000000000000 - 000000000009a800 (usable)
(XEN)  000000000009a800 - 00000000000a0000 (reserved)
(XEN)  00000000000e0000 - 0000000000100000 (reserved)
(XEN)  0000000000100000 - 0000000020000000 (usable)
(XEN)  0000000020000000 - 0000000020200000 (reserved)
(XEN)  0000000020200000 - 0000000040000000 (usable)
(XEN)  0000000040000000 - 0000000040200000 (reserved)
(XEN)  0000000040200000 - 00000000ca61f000 (usable)
(XEN)  00000000ca61f000 - 00000000ca663000 (reserved)
(XEN)  00000000ca663000 - 00000000ca9b7000 (usable)
(XEN)  00000000ca9b7000 - 00000000ca9e7000 (reserved)
(XEN)  00000000ca9e7000 - 00000000cabe7000 (ACPI NVS)
(XEN)  00000000cabe7000 - 00000000cabff000 (ACPI data)
(XEN)  00000000cabff000 - 00000000cac00000 (usable)
(XEN)  00000000cb800000 - 00000000cfa00000 (reserved)
(XEN)  00000000fed1c000 - 00000000fed20000 (reserved)
(XEN)  00000000ffc00000 - 00000000ffc20000 (reserved)
(XEN)  0000000100000000 - 000000042e000000 (usable)
(XEN) New Xen image base address: 0xca000000
(XEN) ACPI: RSDP 000FE300, 0024 (r2 DELL  )
(XEN) ACPI: XSDT CABFDE18, 007C (r1 DELL    CBX3     6222004 MSFT    10013)
(XEN) ACPI: FACP CAB87D98, 00F4 (r4 DELL    CBX3     6222004 MSFT    10013)
(XEN) ACPI: DSDT CAB55018, 885D (r2 INT430 SYSFexxx     1001 INTL 20090903)
(XEN) ACPI: FACS CABE4D40, 0040
(XEN) ACPI: APIC CABFCF18, 00CC (r2 DELL    CBX3     6222004 MSFT    10013)
(XEN) ACPI: TCPA CABE5D18, 0032 (r2                        0             0)
(XEN) ACPI: SSDT CAB88A98, 02F9 (r1 DELLTP      TPM     3000 INTL 20090903)
(XEN) ACPI: MCFG CABE5C98, 003C (r1 DELL   SNDYBRDG  6222004 MSFT       97)
(XEN) ACPI: HPET CABE5C18, 0038 (r1 A M I   PCHHPET  6222004 AMI.        3)
(XEN) ACPI: BOOT CABE5B98, 0028 (r1 DELL   CBX3      6222004 AMI     10013)
(XEN) ACPI: SSDT CAB6C018, 0804 (r1  PmRef  Cpu0Ist     3000 INTL 20090903)
(XEN) ACPI: SSDT CAB6B018, 0996 (r1  PmRef    CpuPm     3000 INTL 20090903)
(XEN) ACPI: DMAR CAB87C18, 00E8 (r1 INTEL      SNB         1 INTL        1)
(XEN) ACPI: SLIC CAB75C18, 0176 (r3 DELL    CBX3     6222004 MSFT    10013)
(XEN) System RAM: 16261MB (16651320kB)
(XEN) No NUMA configuration found
(XEN) Faking a node at 0000000000000000-000000042e000000
(XEN) Domain heap initialised
(XEN) CPU Vendor: Intel, Family 6 (0x6), Model 42 (0x2a), Stepping 7 (raw 0=
00206a7)
(XEN) found SMP MP-table at 000f1de0
(XEN) DMI 2.6 present.
(XEN) Using APIC driver default
(XEN) ACPI: PM-Timer IO Port: 0x408 (32 bits)
(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:404,1:0], pm1x_evt[1:400,1:0]
(XEN) ACPI: 32/64X FACS address mismatch in FADT - cabe4e40/00000000cabe4d4=
0, using 32
(XEN) ACPI:             wakeup_vec[cabe4e4c], vec_size[20]
(XEN) ACPI: Local APIC address 0xfee00000
(XEN) ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x02] lapic_id[0x02] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x03] lapic_id[0x01] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x04] lapic_id[0x03] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x05] lapic_id[0x04] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x06] lapic_id[0x05] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x07] lapic_id[0x06] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x08] lapic_id[0x07] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x09] lapic_id[0x08] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x0a] lapic_id[0x09] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x0b] lapic_id[0x0a] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x0c] lapic_id[0x0b] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x0d] lapic_id[0x0c] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x0e] lapic_id[0x0d] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x0f] lapic_id[0x0e] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x10] lapic_id[0x0f] disabled)
(XEN) ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[0])
(XEN) IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-23
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
(XEN) ACPI: IRQ0 used by override.
(XEN) ACPI: IRQ2 used by override.
(XEN) ACPI: IRQ9 used by override.
(XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs
(XEN) ACPI: HPET id: 0x8086a701 base: 0xfed00000
(XEN) PCI: MCFG configuration 0: base f8000000 segment 0000 buses 00 - 3f
(XEN) PCI: Not using MCFG for segment 0000 bus 00-3f
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) SMP: Allowing 1 CPUs (0 hotplug CPUs)
(XEN) IRQ limits: 24 GSI, 760 MSI/MSI-X
(XEN) Switched to APIC driver x2apic_cluster
(XEN) xstate: size: 0x340 and states: 0x7
(XEN) mce_intel.c:772: MCA Capability: firstbank 0, extended MCE MSR 0, BCA=
ST, CMCI
(XEN) CPU0: Intel machine check reporting enabled
(XEN) Speculative mitigation facilities:
(XEN)   Hardware features:
(XEN)   Compiled-in support: INDIRECT_THUNK
(XEN)   Xen settings: BTI-Thunk RETPOLINE, SPEC_CTRL: No, Other: BRANCH_HAR=
DEN
(XEN)   L1TF: believed vulnerable, maxphysaddr L1D 46, CPUID 36, Safe addre=
ss 1000000000
(XEN)   Support for HVM VMs: RSB EAGER_FPU
(XEN)   Support for PV VMs: RSB EAGER_FPU
(XEN)   XPTI (64-bit PV only): Dom0 enabled, DomU enabled (without PCID)
(XEN)   PV L1TF shadowing: Dom0 disabled, DomU enabled
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Initializing Credit2 scheduler
(XEN)  load_precision_shift: 18
(XEN)  load_window_shift: 30
(XEN)  underload_balance_tolerance: 0
(XEN)  overload_balance_tolerance: -3
(XEN)  runqueues arrangement: socket
(XEN)  cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Platform timer is 14.318MHz HPET
(XEN) Detected 2494.346 MHz processor.
(XEN) alt table ffff82d08042e1b0 -> ffff82d08043a4fa
(XEN) Intel VT-d iommu 0 supported page sizes: 4kB
(XEN) Intel VT-d iommu 1 supported page sizes: 4kB
(XEN) Intel VT-d Snoop Control not enabled.
(XEN) Intel VT-d Dom0 DMA Passthrough not enabled.
(XEN) Intel VT-d Queued Invalidation enabled.
(XEN) Intel VT-d Interrupt Remapping enabled.
(XEN) Intel VT-d Posted Interrupt not enabled.
(XEN) Intel VT-d Shared EPT tables not enabled.
(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) Interrupt remapping enabled
(XEN) nr_sockets: 2
(XEN) Enabled directed EOI with ioapic_ack_old on!
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using old ACK method
(XEN) ..TIMER: vector=3D0xF0 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-1
(XEN) TSC deadline timer enabled
(XEN) Allocated console ring of 32 KiB.
(XEN) mwait-idle: MWAIT substates: 0x21120
(XEN) mwait-idle: v0.4.1 model 0x2a
(XEN) mwait-idle: lapic_timer_reliable_states 0xffffffff
(XEN) VMX: Supported advanced features:
(XEN)  - APIC MMIO access virtualisation
(XEN)  - APIC TPR shadow
(XEN)  - Extended Page Tables (EPT)
(XEN)  - Virtual-Processor Identifiers (VPID)
(XEN)  - Virtual NMI
(XEN)  - MSR direct-access bitmap
(XEN)  - Unrestricted Guest
(XEN) HVM: ASIDs enabled.
(XEN) VMX: Disabling executable EPT superpages due to CVE-2018-12207
(XEN) HVM: VMX enabled
(XEN) HVM: Hardware Assisted Paging (HAP) detected
(XEN) HVM: HAP page sizes: 4kB, 2MB
(XEN) alt table ffff82d08042e1b0 -> ffff82d08043a4fa
(XEN) CPU 1 still not dead...
(XEN) Brought up 1 CPUs
(XEN) Parked 3 CPUs
(XEN) Adding cpu 0 to runqueue 0
(XEN)  First cpu on runqueue, activating
(XEN) Running stub recovery selftests...
(XEN) traps.c:1588: GPF (0000): ffff82d0bffff041 [ffff82d0bffff041] -> ffff=
82d08035f3ec
(XEN) traps.c:783: Trap 12: ffff82d0bffff040 [ffff82d0bffff040] -> ffff82d0=
8035f3ec
(XEN) traps.c:1122: Trap 3: ffff82d0bffff041 [ffff82d0bffff041] -> ffff82d0=
8035f3ec
(XEN) mcheck_poll: Machine check polling timer started.
(XEN) Dom0 has maximum 216 PIRQs
(XEN) NX (Execute Disable) protection active
(XEN) *** Building a PV Dom0 ***
(XEN) ELF: phdr: paddr=3D0x1000000 memsz=3D0x11c8000
(XEN) ELF: phdr: paddr=3D0x2200000 memsz=3D0x523000
(XEN) ELF: phdr: paddr=3D0x2723000 memsz=3D0x23000
(XEN) ELF: phdr: paddr=3D0x2746000 memsz=3D0x6e6000
(XEN) ELF: memory: 0x1000000 -> 0x2e2c000
(XEN) ELF: note: GUEST_OS =3D "linux"
(XEN) ELF: note: GUEST_VERSION =3D "2.6"
(XEN) ELF: note: XEN_VERSION =3D "xen-3.0"
(XEN) ELF: note: VIRT_BASE =3D 0xffffffff80000000
(XEN) ELF: note: INIT_P2M =3D 0x8000000000
(XEN) ELF: note: ENTRY =3D 0xffffffff82746180
(XEN) ELF: note: HYPERCALL_PAGE =3D 0xffffffff81001000
(XEN) ELF: note: FEATURES =3D "!writable_page_tables|pae_pgdir_above_4gb"
(XEN) ELF: note: SUPPORTED_FEATURES =3D 0x8801
(XEN) ELF: note: PAE_MODE =3D "yes"
(XEN) ELF: note: LOADER =3D "generic"
(XEN) ELF: note: unknown (0xd)
(XEN) ELF: note: SUSPEND_CANCEL =3D 0x1
(XEN) ELF: note: MOD_START_PFN =3D 0x1
(XEN) ELF: note: HV_START_LOW =3D 0xffff800000000000
(XEN) ELF: note: PADDR_OFFSET =3D 0
(XEN) ELF: note: PHYS32_ENTRY =3D 0x1000470
(XEN) ELF: Found PVH image
(XEN) ELF: addresses:
(XEN)     virt_base        =3D 0xffffffff80000000
(XEN)     elf_paddr_offset =3D 0x0
(XEN)     virt_offset      =3D 0xffffffff80000000
(XEN)     virt_kstart      =3D 0xffffffff81000000
(XEN)     virt_kend        =3D 0xffffffff82e2c000
(XEN)     virt_entry       =3D 0xffffffff82746180
(XEN)     p2m_base         =3D 0x8000000000
(XEN)  Xen  kernel: 64-bit, lsb, compat32
(XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x2e2c000
(XEN) PHYSICAL MEMORY ARRANGEMENT:
(XEN)  Dom0 alloc.:   0000000414000000->0000000418000000 (1014568 pages to =
be allocated)
(XEN)  Init. ramdisk: 0000000429b28000->000000042dfff5cc
(XEN) VIRTUAL MEMORY ARRANGEMENT:
(XEN)  Loaded kernel: ffffffff81000000->ffffffff82e2c000
(XEN)  Init. ramdisk: 0000000000000000->0000000000000000
(XEN)  Phys-Mach map: 0000008000000000->0000008000800000
(XEN)  Start info:    ffffffff82e2c000->ffffffff82e2c4b8
(XEN)  Xenstore ring: 0000000000000000->0000000000000000
(XEN)  Console ring:  0000000000000000->0000000000000000
(XEN)  Page tables:   ffffffff82e2d000->ffffffff82e48000
(XEN)  Boot stack:    ffffffff82e48000->ffffffff82e49000
(XEN)  TOTAL:         ffffffff80000000->ffffffff83000000
(XEN)  ENTRY ADDRESS: ffffffff82746180
(XEN) Dom0 has maximum 1 VCPUs
(XEN) ELF: phdr 0 at 0xffffffff81000000 -> 0xffffffff821c8000
(XEN) ELF: phdr 1 at 0xffffffff82200000 -> 0xffffffff82723000
(XEN) ELF: phdr 2 at 0xffffffff82723000 -> 0xffffffff82746000
(XEN) ELF: phdr 3 at 0xffffffff82746000 -> 0xffffffff829c2000
(XEN) Bogus DMIBAR 0xfed18001 on 0000:00:00.0
(XEN) [VT-D]Passed iommu=3Dno-igfx option.  Disabling IGD VT-d engine.
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 540kB init memory
mapping kernel into physical memory
about to get started...
[    0.000000] Linux version 4.19.86-1.pvops.qubes.x86_64 (mockbuild@) (gcc=
 version 9.2.1 20190827 (Red Hat 9.2.1-1) (GCC)) #1 SMP Wed Dec 18 03:07:43=
 CET 2019
[    0.000000] Command line: repo=3Dhttp://qb/qinstall/iso rhgb plymouth.ig=
nore-serial-consoles nouveau.runpm=3D0 rd.break=3Dcmdline
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
 registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 by=
tes, using 'standard' format.
[    0.000000] Released 0 page(s)
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] Xen: [mem 0x0000000000000000-0x0000000000099fff] usable
[    0.000000] Xen: [mem 0x000000000009a800-0x00000000000fffff] reserved
[    0.000000] Xen: [mem 0x0000000000100000-0x000000001fffffff] usable
[    0.000000] Xen: [mem 0x0000000020000000-0x00000000201fffff] reserved
[    0.000000] Xen: [mem 0x0000000020200000-0x000000003fffffff] usable
[    0.000000] Xen: [mem 0x0000000040000000-0x00000000401fffff] reserved
[    0.000000] Xen: [mem 0x0000000040200000-0x00000000ca61efff] usable
[    0.000000] Xen: [mem 0x00000000ca61f000-0x00000000ca662fff] reserved
[    0.000000] Xen: [mem 0x00000000ca663000-0x00000000ca9b6fff] usable
[    0.000000] Xen: [mem 0x00000000ca9b7000-0x00000000ca9e6fff] reserved
[    0.000000] Xen: [mem 0x00000000ca9e7000-0x00000000cabe6fff] ACPI NVS
[    0.000000] Xen: [mem 0x00000000cabe7000-0x00000000cabfefff] ACPI data
[    0.000000] Xen: [mem 0x00000000cabff000-0x00000000cabfffff] usable
[    0.000000] Xen: [mem 0x00000000cb800000-0x00000000cf9fffff] reserved
[    0.000000] Xen: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
[    0.000000] Xen: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
[    0.000000] Xen: [mem 0x00000000fed90000-0x00000000fed91fff] reserved
[    0.000000] Xen: [mem 0x00000000fee00000-0x00000000feefffff] reserved
[    0.000000] Xen: [mem 0x00000000ffc00000-0x00000000ffc1ffff] reserved
[    0.000000] Xen: [mem 0x0000000100000000-0x0000000135af1fff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] SMBIOS 2.6 present.
[    0.000000] DMI: Dell Inc. Latitude E6420/0X8R3Y, BIOS A21 11/14/2013
[    0.000000] Hypervisor detected: Xen PV
[    0.000465] tsc: Detected 2494.346 MHz processor
[    0.007302] last_pfn =3D 0x135af2 max_arch_pfn =3D 0x400000000
[    0.007304] Disabled
[    0.007306] x86/PAT: MTRRs disabled, skipping PAT initialization too.
[    0.007313] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP  UC  UC=
 =20
[    0.007316] last_pfn =3D 0xcac00 max_arch_pfn =3D 0x400000000
[    0.010050] Kernel/User page tables isolation: disabled on XEN PV.
[    1.503499] RAMDISK: [mem 0x04000000-0x084d7fff]
[    1.503515] ACPI: Early table checksum verification disabled
[    1.504354] ACPI: RSDP 0x00000000000FE300 000024 (v02 DELL  )
[    1.504366] ACPI: XSDT 0x00000000CABFDE18 00007C (v01 DELL   CBX3     06=
222004 MSFT 00010013)
[    1.504397] ACPI: FACP 0x00000000CAB87D98 0000F4 (v04 DELL   CBX3     06=
222004 MSFT 00010013)
[    1.504454] ACPI: DSDT 0x00000000CAB55018 00885D (v02 INT430 SYSFexxx 00=
001001 INTL 20090903)
[    1.504471] ACPI: FACS 0x00000000CABE4E40 000040
[    1.504486] ACPI: FACS 0x00000000CABE4D40 000040
[    1.504502] ACPI: APIC 0x00000000CABFCF18 0000CC (v02 DELL   CBX3     06=
222004 MSFT 00010013)
[    1.504519] ACPI: TCPA 0x00000000CABE5D18 000032 (v02                 00=
000000      00000000)
[    1.504536] ACPI: SSDT 0x00000000CAB88A98 0002F9 (v01 DELLTP TPM      00=
003000 INTL 20090903)
[    1.504553] ACPI: MCFG 0x00000000CABE5C98 00003C (v01 DELL   SNDYBRDG 06=
222004 MSFT 00000097)
[    1.504570] ACPI: HPET 0x00000000CABE5C18 000038 (v01 A M I   PCHHPET 06=
222004 AMI. 00000003)
[    1.504586] ACPI: BOOT 0x00000000CABE5B98 000028 (v01 DELL   CBX3     06=
222004 AMI  00010013)
[    1.504603] ACPI: SSDT 0x00000000CAB6C018 000804 (v01 PmRef  Cpu0Ist  00=
003000 INTL 20090903)
[    1.504620] ACPI: SSDT 0x00000000CAB6B018 000996 (v01 PmRef  CpuPm    00=
003000 INTL 20090903)
[    1.504637] ACPI: RMAD 0x00000000CAB87C18 0000E8 (v01 INTEL  SNB      00=
000001 INTL 00000001)
[    1.504654] ACPI: SLIC 0x00000000CAB75C18 000176 (v03 DELL   CBX3     06=
222004 MSFT 00010013)
[    1.504705] Setting APIC routing to Xen PV.
[    1.504759] NUMA turned off
[    1.504760] Faking a node at [mem 0x0000000000000000-0x0000000135af1fff]
[    1.504774] NODE_DATA(0) allocated [mem 0xca7dd000-0xca807fff]
[    1.537663] Zone ranges:
[    1.537667]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    1.537670]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    1.537672]   Normal   [mem 0x0000000100000000-0x0000000135af1fff]
[    1.537674]   Device   empty
[    1.537676] Movable zone start for each node
[    1.537680] Early memory node ranges
[    1.537682]   node   0: [mem 0x0000000000001000-0x0000000000099fff]
[    1.537684]   node   0: [mem 0x0000000000100000-0x000000001fffffff]
[    1.537685]   node   0: [mem 0x0000000020200000-0x000000003fffffff]
[    1.537687]   node   0: [mem 0x0000000040200000-0x00000000ca61efff]
[    1.537688]   node   0: [mem 0x00000000ca663000-0x00000000ca9b6fff]
[    1.537690]   node   0: [mem 0x00000000cabff000-0x00000000cabfffff]
[    1.537691]   node   0: [mem 0x0000000100000000-0x0000000135af1fff]
[    1.537697] Reserved but unavailable: 108 pages
[    1.537699] Initmem setup node 0 [mem 0x0000000000001000-0x0000000135af1=
fff]
[    1.572514] p2m virtual area at (____ptrval____), size is a00000
[    2.093956] Remapped 219890 page(s)
[    2.094013] Reserving Intel graphics memory at [mem 0xcba00000-0xcf9ffff=
f]
[    2.095121] ACPI: PM-Timer IO Port: 0x408
[    2.095206] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-=
23
[    2.095218] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    2.095222] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    2.095240] Using ACPI (MADT) for SMP configuration information
[    2.095246] ACPI: HPET id: 0x8086a701 base: 0xfed00000
[    2.095259] smpboot: Allowing 16 CPUs, 12 hotplug CPUs
[    2.095294] [mem 0xcfa00000-0xfebfffff] available for PCI devices
[    2.095298] Booting paravirtualized kernel on Xen
[    2.095300] Xen version: 4.14-unstable (preserve-AD)
[    2.095304] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 1910969940391419 ns
[    2.233561] random: get_random_bytes called from start_kernel+0xc1/0x756=
 with crng_init=3D0
[    2.233575] setup_percpu: NR_CPUS:64 nr_cpumask_bits:64 nr_cpu_ids:16 nr=
_node_ids:1
[    2.234049] percpu: Embedded 44 pages/cpu s143360 r8192 d28672 u262144
[    2.234155] Built 1 zonelists, mobility grouping on.  Total pages: 10320=
36
[    2.234157] Policy zone: Normal
[    2.234160] Kernel command line: repo=3Dhttp://qb/qinstall/iso rhgb plym=
outh.ignore-serial-consoles nouveau.runpm=3D0 rd.break=3Dcmdline
[    2.270006] software IO TLB: mapped [mem 0x131600000-0x135600000] (64MB)
[    2.284943] Memory: 3939256K/4194300K available (12300K kernel code, 148=
8K rwdata, 3872K rodata, 2656K init, 4344K bss, 255044K reserved, 0K cma-re=
served)
[    2.285192] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1, N=
odes=3D1
[    2.286087] ftrace: allocating 38497 entries in 151 pages
[    2.301861] rcu: Hierarchical RCU implementation.
[    2.301864] rcu: 	RCU restricting CPUs from NR_CPUS=3D64 to nr_cpu_ids=
=3D1.
[    2.301866] 	Tasks RCU enabled.
[    2.301867] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D1
[    2.307305] Using NULL legacy PIC
[    2.307307] NR_IRQS: 4352, nr_irqs: 256, preallocated irqs: 0
[    2.307353] xen:events: Using FIFO-based ABI
[    2.307538] rcu: 	Offload RCU callbacks from CPUs: (none).
[    2.309440] Console: colour VGA+ 80x25
[    2.318942] console [tty0] enabled
[    2.330932] console [hvc0] enabled
[    2.331047] ACPI: Core revision 20180810
[    2.334229] clocksource: xen: mask: 0xffffffffffffffff max_cycles: 0x1cd=
42e4dffb, max_idle_ns: 881590591483 ns
[    2.334374] installing Xen timer for CPU 0
[    2.334736] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:=
 0x23f45cd4443, max_idle_ns: 440795305613 ns
[    2.334950] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 4988.69 BogoMIPS (lpj=3D2494346)
[    2.335085] pid_max: default: 32768 minimum: 301
[    2.335274] Security Framework initialized
[    2.335365] Yama: becoming mindful.
[    2.335468] AppArmor: AppArmor disabled by boot time parameter
[    2.338026] Dentry cache hash table entries: 524288 (order: 10, 4194304 =
bytes)
[    2.339250] Inode-cache hash table entries: 262144 (order: 9, 2097152 by=
tes)
[    2.339411] Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)
[    2.339548] Mountpoint-cache hash table entries: 8192 (order: 4, 65536 b=
ytes)
[    2.340267] Last level iTLB entries: 4KB 512, 2MB 8, 4MB 8
[    2.340360] Last level dTLB entries: 4KB 512, 2MB 32, 4MB 32, 1GB 0
[    2.340454] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user=
 pointer sanitization
[    2.340583] Spectre V2 : Mitigation: Full generic retpoline
[    2.340674] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on context switch
[    2.340801] Speculative Store Bypass: Vulnerable
[    2.341150] MDS: Vulnerable: Clear CPU buffers attempted, no microcode
[    2.429848] Freeing SMP alternatives memory: 28K
[    2.433090] VPMU disabled by hypervisor.
[    2.433458] Performance Events: unsupported p6 CPU model 42 no PMU drive=
r, software events only.
[    2.433687] rcu: Hierarchical SRCU implementation.
[    2.434433] NMI watchdog: Perf NMI watchdog permanently disabled
[    2.434630] smp: Bringing up secondary CPUs ...
[    2.434723] smp: Brought up 1 node, 1 CPU
[    2.434812] smpboot: Max logical packages: 16
[    2.435159] devtmpfs: initialized
[    2.435299] x86/mm: Memory block size: 128MB
[    2.435908] PM: Registering ACPI NVS region [mem 0xca9e7000-0xcabe6fff] =
(2097152 bytes)
[    2.436076] reboot: Dell Latitude E6420 series board detected. Selecting=
 PCI-method for reboots.
[    2.436299] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 1911260446275000 ns
[    2.436446] futex hash table entries: 256 (order: 2, 16384 bytes)
[    2.436600] pinctrl core: initialized pinctrl subsystem
[    2.436838] RTC time: 15:10:56, date: 01/04/20
[    2.437077] NET: Registered protocol family 16
[    2.437187] xen:grant_table: Grant tables using version 1 layout
[    2.437296] Grant table initialized
[    2.437485] audit: initializing netlink subsys (disabled)
[    2.437716] audit: type=3D2000 audit(1578150656.913:1): state=3Dinitiali=
zed audit_enabled=3D0 res=3D1
[    2.438029] Simple Boot Flag at 0xf3 set to 0x80
[    2.438146] ACPI FADT declares the system doesn't support PCIe ASPM, so =
disable it
[    2.438274] ACPI: bus type PCI registered
[    2.438578] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem 0xf8000000=
-0xfbffffff] (base 0xf8000000)
[    2.438713] PCI: not using MMCONFIG
[    2.438801] PCI: Using configuration type 1 for base access
[    2.440696] cryptd: max_cpu_qlen set to 1000
[    2.440980] ACPI: Added _OSI(Module Device)
[    2.441126] ACPI: Added _OSI(Processor Device)
[    2.441216] ACPI: Added _OSI(3.0 _SCP Extensions)
[    2.441308] ACPI: Added _OSI(Processor Aggregator Device)
[    2.441400] ACPI: Added _OSI(Linux-Dell-Video)
[    2.441491] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    2.448850] ACPI: 4 ACPI AML tables successfully acquired and loaded
[    2.450113] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    2.455394] ACPI: Dynamic OEM Table Load:
[    2.455497] ACPI: SSDT 0xFFFF888130582000 000727 (v01 PmRef  Cpu0Cst  00=
003001 INTL 20090903)
[    2.456057] ACPI: EC: EC started
[    2.456199] ACPI: EC: interrupt blocked
[    2.457454] ACPI: \_SB_.PCI0.LPCB.ECDV: Used as first EC
[    2.457602] ACPI: \_SB_.PCI0.LPCB.ECDV: GPE=3D0x10, EC_CMD/EC_SC=3D0x934=
, EC_DATA=3D0x930
[    2.457730] ACPI: \_SB_.PCI0.LPCB.ECDV: Used as boot DSDT EC to handle t=
ransactions
[    2.457856] ACPI: Interpreter enabled
[    2.457897] ACPI: (supports S0 S3 S5)
[    2.457986] ACPI: Using IOAPIC for interrupt routing
[    2.458114] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem 0xf8000000=
-0xfbffffff] (base 0xf8000000)
[    2.458729] PCI: MMCONFIG at [mem 0xf8000000-0xfbffffff] reserved in ACP=
I motherboard resources
[    2.487672] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    2.488066] ACPI: Enabled 5 GPEs in block 00 to 3F
[    2.500488] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-3e])
[    2.500592] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI]
[    2.500765] acpi PNP0A08:00: _OSC failed (AE_ERROR); disabling ASPM
[    2.501485] PCI host bridge to bus 0000:00
[    2.501632] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    2.501728] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    2.501824] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bfff=
f window]
[    2.501879] pci_bus 0000:00: root bus resource [mem 0xcfa00000-0xfeaffff=
f window]
[    2.502007] pci_bus 0000:00: root bus resource [mem 0xfed40000-0xfed44ff=
f window]
[    2.502134] pci_bus 0000:00: root bus resource [bus 00-3e]
(XEN) PCI: Using MCFG for segment 0000 bus 00-3f
(XEN) Bogus DMIBAR 0xfed18001 on 0000:00:00.0
(XEN) PCI add device 0000:00:00.0
(XEN) PCI add device 0000:00:02.0
(XEN) PCI add device 0000:00:16.0
(XEN) PCI add device 0000:00:19.0
(XEN) PCI add device 0000:00:1a.0
(XEN) PCI add device 0000:00:1b.0
[    2.506550] pci 0000:00:1c.0: Enabling MPC IRBNCE
[    2.506650] pci 0000:00:1c.0: Intel PCH root port ACS workaround enabled
(XEN) PCI add device 0000:00:1c.0
[    2.507466] pci 0000:00:1c.1: Enabling MPC IRBNCE
[    2.507564] pci 0000:00:1c.1: Intel PCH root port ACS workaround enabled
(XEN) PCI add device 0000:00:1c.1
[    2.508378] pci 0000:00:1c.2: Enabling MPC IRBNCE
[    2.508476] pci 0000:00:1c.2: Intel PCH root port ACS workaround enabled
(XEN) PCI add device 0000:00:1c.2
[    2.509243] pci 0000:00:1c.3: Enabling MPC IRBNCE
[    2.509341] pci 0000:00:1c.3: Intel PCH root port ACS workaround enabled
(XEN) PCI add device 0000:00:1c.3
[    2.510147] pci 0000:00:1c.5: Enabling MPC IRBNCE
[    2.510245] pci 0000:00:1c.5: Intel PCH root port ACS workaround enabled
(XEN) PCI add device 0000:00:1c.5
(XEN) PCI add device 0000:00:1d.0
(XEN) PCI add device 0000:00:1f.0
(XEN) PCI add device 0000:00:1f.2
(XEN) PCI add device 0000:00:1f.3
[    2.513168] pci 0000:00:1c.0: PCI bridge to [bus 01]
(XEN) PCI add device 0000:02:00.0
[    2.517581] pci 0000:00:1c.1: PCI bridge to [bus 02]
[    2.518087] pci 0000:00:1c.2: PCI bridge to [bus 03-08]
[    2.518390] pci 0000:00:1c.3: PCI bridge to [bus 09]
(XEN) PCI add device 0000:0a:00.0
(XEN) PCI add device 0000:0a:00.1
[    2.521270] pci 0000:00:1c.5: PCI bridge to [bus 0a]
[    2.523474] ACPI: PCI Interrupt Link [LNKA] (IRQs 1 3 4 5 6 7 10 12 14 1=
5) *11
[    2.523690] ACPI: PCI Interrupt Link [LNKB] (IRQs 1 3 4 5 6 7 11 12 14 1=
5) *10
[    2.523908] ACPI: PCI Interrupt Link [LNKC] (IRQs 1 3 4 5 6 7 10 12 14 1=
5) *11
[    2.524119] ACPI: PCI Interrupt Link [LNKD] (IRQs 1 3 4 5 6 7 11 12 14 1=
5) *10
[    2.524329] ACPI: PCI Interrupt Link [LNKE] (IRQs 1 3 4 *5 6 7 10 12 14 =
15)
[    2.524561] ACPI: PCI Interrupt Link [LNKF] (IRQs 1 3 4 5 6 7 11 12 14 1=
5) *0, disabled.
[    2.524773] ACPI: PCI Interrupt Link [LNKG] (IRQs 1 *3 4 5 6 7 10 12 14 =
15)
[    2.524957] ACPI: PCI Interrupt Link [LNKH] (IRQs 1 3 4 5 6 7 11 12 14 1=
5) *0, disabled.
[    2.527372] ACPI: EC: interrupt unblocked
[    2.527491] ACPI: EC: event unblocked
[    2.527593] ACPI: \_SB_.PCI0.LPCB.ECDV: GPE=3D0x10, EC_CMD/EC_SC=3D0x934=
, EC_DATA=3D0x930
[    2.527721] ACPI: \_SB_.PCI0.LPCB.ECDV: Used as boot DSDT EC to handle t=
ransactions and events
[    2.527900] xen:balloon: Initialising balloon driver
[    2.528124] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    2.528220] pci 0000:00:02.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dio+mem,locks=3Dnone
[    2.528352] pci 0000:00:02.0: vgaarb: bridge control possible
[    2.528445] vgaarb: loaded
[    2.528693] SCSI subsystem initialized
[    2.528888] ACPI: bus type USB registered
[    2.528995] usbcore: registered new interface driver usbfs
[    2.529096] usbcore: registered new interface driver hub
[    2.529196] usbcore: registered new device driver usb
[    2.529316] pps_core: LinuxPPS API ver. 1 registered
[    2.529408] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    2.529543] PTP clock support registered
[    2.529716] EDAC MC: Ver: 3.0.0
[    2.530299] PCI: Using ACPI for IRQ routing
[    2.540686] NetLabel: Initializing
[    2.540776] NetLabel:  domain hash size =3D 128
[    2.540865] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    2.540897] NetLabel:  unlabeled traffic allowed by default
[    2.541142] clocksource: Switched to clocksource tsc-early
[    2.552889] VFS: Disk quotas dquot_6.6.0
[    2.553061] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    2.553187] hugetlbfs: disabling because there are no supported hugepage=
 sizes
[    2.553338] pnp: PnP ACPI init
[    2.553602] system 00:00: [mem 0xfed00000-0xfed003ff] has been reserved
[    2.553752] system 00:01: [io  0x0680-0x069f] has been reserved
[    2.553849] system 00:01: [io  0x1000-0x100f] has been reserved
[    2.553958] system 00:01: [io  0xffff] has been reserved
[    2.554051] system 00:01: [io  0xffff] has been reserved
[    2.554143] system 00:01: [io  0x0400-0x047f] has been reserved
[    2.554238] system 00:01: [io  0x0500-0x057f] has been reserved
[    2.554332] system 00:01: [io  0x164e-0x164f] has been reserved
[    2.555230] Already setup the GSI :4
[    2.556828] system 00:08: [mem 0xfed1c000-0xfed1ffff] has been reserved
[    2.556941] system 00:08: [mem 0xfed10000-0xfed17fff] has been reserved
[    2.557038] system 00:08: [mem 0xfed18000-0xfed18fff] has been reserved
[    2.557134] system 00:08: [mem 0xfed19000-0xfed19fff] has been reserved
[    2.557283] system 00:08: [mem 0xf8000000-0xfbffffff] has been reserved
[    2.557380] system 00:08: [mem 0xfed20000-0xfed3ffff] has been reserved
[    2.557476] system 00:08: [mem 0xfed90000-0xfed93fff] could not be reser=
ved
[    2.557573] system 00:08: [mem 0xfed45000-0xfed8ffff] has been reserved
[    2.557668] system 00:08: [mem 0xff000000-0xffffffff] could not be reser=
ved
[    2.557765] system 00:08[   10.543372] Freeing initrd memory: 70496K
[   10.544413] Initialise system trusted keyrings
[   10.544516] Key type blacklist registered
[   10.544682] workingset: timestamp_bits=3D36 max_order=3D20 bucket_order=
=3D0
[   10.546010] zbud: loaded
[   11.061347] alg: No test for 842 (842-generic)
[   11.061507] alg: No test for 842 (842-scomp)
[   11.085298] NET: Registered protocol family 38
[   11.085419] Key type asymmetric registered
[   11.085566] Asymmetric key parser 'x509' registered
[   11.085676] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 244)
[   11.085858] io scheduler noop registered
[   11.085970] io scheduler deadline registered
[   11.086100] io scheduler cfq registered (default)
[   11.086193] io scheduler mq-deadline registered
[   11.086345] atomic64_test: passed for x86-64 platform with CX8 and with =
SSE
[   11.086670] Already setup the GSI :16
[   11.087096] Already setup the GSI :17
[   11.088029] Already setup the GSI :17
[   11.089174] ACPI: AC Adapter [AC] (on-line)
[   11.089331] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0=
D:00/input/input0
[   11.089481] ACPI: Lid Switch [LID]
[   11.089654] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0C:00/input/input1
[   11.089798] ACPI: Power Button [PBTN]
[   11.089944] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0E:00/input/input2
[   11.090081] ACPI: Sleep Button [SBTN]
[   11.090199] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inpu=
t/input3
[   11.090342] ACPI: Power Button [PWRF]
[   11.091828] thermal LNXTHERM:00: registered as thermal_zone0
[   11.091939] ACPI: Thermal Zone [THM] (25 C)
[   11.092920] battery: ACPI: Battery Slot [BAT0] (battery absent)
[   11.094249] battery: ACPI: Battery Slot [BAT1] (battery absent)
[   11.095584] battery: ACPI: Battery Slot [BAT2] (battery absent)
[   11.096042] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
(XEN) d0: Forcing read-only access to MFN fed00
[   11.098134] hpet_acpi_add: no address or irqs in _CRS
[   11.098281] Non-volatile memory driver v1.3
[   11.098404] Linux agpgart interface v0.103
[   11.105920] tpm_tis 00:07: 1.2 TPM (device-id 0x2001, rev-id 32)
[   11.127863] tpm tpm0: TPM is disabled/deactivated (0x6)
[   11.127987] tpm tpm0: tpm_read_log_acpi: TCPA log area empty
[   11.128121] tpm_tis: probe of 00:07 failed with error -5
[   11.128642] Already setup the GSI :18
[   11.128915] ahci 0000:00:1f.2: SSS flag set, parallel bus scan disabled
[   11.139277] ahci 0000:00:1f.2: AHCI 0001.0300 32 slots 6 ports 6 Gbps 0x=
3b impl SATA mode
[   11.139415] ahci 0000:00:1f.2: flags: 64bit ncq sntf stag pm led clo pio=
 slum part ems sxs apst=20
[   11.151487] scsi host0: ahci
[   11.151733] scsi host1: ahci
[   11.151963] scsi host2: ahci
[   11.152220] scsi host3: ahci
[   11.152421] scsi host4: ahci
[   11.152625] scsi host5: ahci
[   11.152743] ata1: SATA max UDMA/133 abar m2048@0xe2e40000 port 0xe2e4010=
0 irq 33
[   11.152887] ata2: SATA max UDMA/133 abar m2048@0xe2e40000 port 0xe2e4018=
0 irq 33
[   11.153014] ata3: DUMMY
[   11.153100] ata4: SATA max UDMA/133 abar m2048@0xe2e40000 port 0xe2e4028=
0 irq 33
[   11.153229] ata5: SATA max UDMA/133 abar m2048@0xe2e40000 port 0xe2e4030=
0 irq 33
[   11.153358] ata6: SATA max UDMA/133 abar m2048@0xe2e40000 port 0xe2e4038=
0 irq 33
[   11.153630] libphy: Fixed MDIO Bus: probed
[   11.153911] usbcore: registered new interface driver usbserial_generic
[   11.154016] usbserial: USB Serial support registered for generic
[   11.154149] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0=
x60,0x64 irq 1,12
[   11.154861] i8042: Warning: Keylock active
[   11.156518] serio: i8042 KBD port at 0x60,0x64 irq 1
[   11.156615] serio: i8042 AUX port at 0x60,0x64 irq 12
[   11.157316] mousedev: PS/2 mouse device common for all mice
[   11.157775] rtc_cmos 00:02: RTC can wake from S4
[   11.158384] rtc_cmos 00:02: registered as rtc0
[   11.158494] rtc_cmos 00:02: alarms up to one year, y3k, 242 bytes nvram
[   11.158711] device-mapper: uevent: version 1.0.3
[   11.158857] input: AT Translated Set 2 keyboard as /devices/platform/i80=
42/serio0/input/input4
[   11.159289] device-mapper: ioctl: 4.39.0-ioctl (2018-04-03) initialised:=
 dm-devel@redhat.com
[   11.160071] hidraw: raw HID events driver (C) Jiri Kosina
[   11.160197] usbcore: registered new interface driver usbhid
[   11.160289] usbhid: USB HID core driver
[   11.160512] drop_monitor: Initializing network drop monitor service
[   11.160928] Initializing XFRM netlink socket
[   11.161129] NET: Registered protocol family 10
[   11.176643] Segment Routing with IPv6
[   11.176766] mip6: Mobile IPv6
[   11.176855] NET: Registered protocol family 17
[   11.177226] mce: Using 2 MCE banks
[   11.177330] RAS: Correctable Errors collector initialized.
[   11.177434] AVX version of gcm_enc/dec engaged.
[   11.177524] AES CTR mode by8 optimization enabled
[   11.246747] sched_clock: Marking stable (11218547929, 27331360)->(112560=
17101, -10137812)
[   11.247500] registered taskstats version 1
[   11.247601] Loading compiled-in X.509 certificates
[   11.247766] zswap: loaded using pool lzo/zbud
[   11.270626] Key type big_key registered
[   11.282047] Key type encrypted registered
[   11.282150] ima: No TPM chip found, activating TPM-bypass!
[   11.282248] ima: Allocated hash algorithm: sha1
[   11.282723]   Magic number: 4:475:183
[   11.282961] rtc_cmos 00:02: setting system clock to 2020-01-04 15:11:05 =
UTC (1578150665)
[   11.583046] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x23f=
45cd4443, max_idle_ns: 440795305613 ns
[   11.583236] clocksource: Switched to clocksource tsc
[   11.982054] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[   11.983190] ata1.00: ACPI cmd 00/00:00:00:00:00:a0 (NOP) rejected by dev=
ice (Stat=3D0x51 Err=3D0x04)
[   11.983498] ata1.00: ATA-9: KINGSTON SV200S3256G, E111008a, max UDMA/100
[   11.983596] ata1.00: 500118192 sectors, multi 16: LBA48 NCQ (depth 32), =
AA
[   11.984705] ata1.00: ACPI cmd 00/00:00:00:00:00:a0 (NOP) rejected by dev=
ice (Stat=3D0x51 Err=3D0x04)
[   11.984981] ata1.00: configured for UDMA/100
[   11.986592] scsi 0:0:0:0: Direct-Access     ATA      KINGSTON SV200S3 00=
8a PQ: 0 ANSI: 5
[   11.987076] sd 0:0:0:0: [sda] 500118192 512-byte logical blocks: (256 GB=
/238 GiB)
[   11.987226] sd 0:0:0:0: [sda] Write Protect is off
[   11.987361] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled,=
 doesn't support DPO or FUA
[   11.987516] sd 0:0:0:0: Attached scsi generic sg0 type 0
[   11.988483]  sda: sda1 sda2
[   11.988981] sd 0:0:0:0: [sda] Attached SCSI disk
[   12.295172] ata2: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[   12.298548] ata2.00: ATAPI: HL-DT-ST DVD+/-RW GU60N, A103, max UDMA/133
[   12.309059] ata2.00: configured for UDMA/133
[   12.328462] scsi 1:0:0:0: CD-ROM            HL-DT-ST DVD+-RW GU60N    A1=
03 PQ: 0 ANSI: 5
[   12.378762] sr 1:0:0:0: [sr0] scsi3-mmc drive: 24x/8x writer dvd-ram cd/=
rw xa/form2 cdda tray
[   12.378945] cdrom: Uniform CD-ROM driver Revision: 3.20
[   12.379329] sr 1:0:0:0: Attached scsi generic sg1 type 5
[   12.591905] input: AlpsPS/2 ALPS DualPoint Stick as /devices/platform/i8=
042/serio1/input/input7
[   12.605326] input: AlpsPS/2 ALPS DualPoint TouchPad as /devices/platform=
/i8042/serio1/input/input6
[   12.686911] ata4: SATA link down (SStatus 0 SControl 300)
[   12.999223] ata5: SATA link down (SStatus 0 SControl 300)
[   13.311354] ata6: SATA link down (SStatus 0 SControl 300)
[   13.313518] Freeing unused decrypted memory: 2040K
[   13.315286] Freeing unused kernel image memory: 2656K
[   13.315428] Write protecting the kernel read-only data: 18432k
[   13.333095] Freeing unused kernel image memory: 2024K
[   13.333443] Freeing unused kernel image memory: 224K
[   13.333547] rodata_test: all tests were successful
[   13.333640] Run /init as init process
[   13.359695] systemd[1]: systemd v243.5-1.fc31 running in system mode. (+=
PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +G=
CRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCR=
E2 default-hierarchy=3Dunified)
[   13.360214] systemd[1]: Detected architecture x86-64.
[   13.360314] systemd[1]: Running in initial RAM disk.
[   13.361131] systemd[1]: No hostname configured.
[   13.361237] systemd[1]: Set hostname to <localhost>.
[   13.361460] random: systemd: uninitialized urandom read (16 bytes read)
[   13.361568] systemd[1]: Initializing machine ID from random generator.
[   13.459363] random: ln: uninitialized urandom read (6 bytes read)
[   13.463364] random: ln: uninitialized urandom read (6 bytes read)
[   13.652130] systemd[1]: /usr/lib/systemd/system/iscsiuio.service:13: PID=
File=3D references a path below legacy directory /var/run/, updating /var/r=
un/iscsiuio.pid =E2=86=92 /run/iscsiuio.pid; please update the unit file ac=
cordingly.
[   13.653089] systemd[1]: /usr/lib/systemd/system/iscsid.service:11: PIDFi=
le=3D references a path below legacy directory /var/run/, updating /var/run=
/iscsid.pid =E2=86=92 /run/iscsid.pid; please update the unit file accordin=
gly.
[   13.663212] systemd[1]: Reached target Initrd Root Device.
[   13.664001] systemd[1]: Reached target Slices.
[   13.763133] xen:xen_evtchn: Event-channel device installed
[   13.777280] xen_pciback: backend is vpci
[   14.472265] audit: type=3D1130 audit(1578150668.687:2): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-journald comm=3D"s=
ystemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D?=
 res=3Dsuccess'
[   34.681658] random: crng init done
[   34.681789] random: 7 urandom warning(s) missed due to ratelimiting
[  651.641302] PM: suspend entry (deep)
[  651.641417] PM: Syncing filesystems ... done.
[  651.642955] Freezing user space processes ... (elapsed 0.001 seconds) do=
ne.
[  651.644059] OOM killer disabled.
[  651.644116] Freezing remaining freezable tasks ... (=E5(XEN) mce_intel.c=
:772: MCA Capability: firstbank 0, extended MCE MSR 0, BCAST, CMCI
(XEN) CPU0 CMCI LVT vector (0xf2) already installed
(XEN) Finishing wakeup from ACPI S3 state.
(XEN) Enabling non-boot CPUs  ...
(XEN) ----[ Xen-4.14-unstable  x86_64  debug=3Dy   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d08023beb7>] schedule.c#cpu_schedule_callback+0x=
ea/0x1a1
(XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor
(XEN) rax: 0000000000000000   rbx: ffff82d080453348   rcx: ffff82d080584020
(XEN) rdx: 000000339b66e000   rsi: 0000000000008005   rdi: ffff82d080453340
(XEN) rbp: ffff8300ca45fd68   rsp: ffff8300ca45fd68   r8:  0000000000000004
(XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 8000000000000000
(XEN) r12: ffff82d080453340   r13: ffff82d080453200   r14: 0000000000008005
(XEN) r15: 0000000000008000   cr0: 000000008005003b   cr4: 00000000000426e0
(XEN) cr3: 00000000ca44f000   cr2: 0000000000000008
(XEN) fsb: 000079d5e4f9e740   gsb: ffff888135600000   gss: 0000000000000000
(XEN) ds: 0018   es: 0010   fs: b800   gs: 0010   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d08023beb7> (schedule.c#cpu_schedule_callback+=
0xea/0x1a1):
(XEN)  48 8b 14 d1 48 8b 04 02 <48> 8b 48 08 48 85 c9 74 64 48 8b 05 b9 c3 =
32 00
(XEN) Xen stack trace from rsp=3Dffff8300ca45fd68:
(XEN)    ffff8300ca45fdb0 ffff82d080221289 ffff8300ca45fdd8 0000000000000001
(XEN)    0000000000000000 00000000ffffffef ffff8300ca45fe00 0000000000000001
(XEN)    0000000000000200 ffff8300ca45fdc8 ffff82d080203476 0000000000000001
(XEN)    ffff8300ca45fdf0 ffff82d080203550 0000000000000000 0000000000000001
(XEN)    0000000000000000 ffff8300ca45fe20 ffff82d080203999 ffff8300ca45fef8
(XEN)    0000000000000000 0000000000000003 00000000000426e0 ffff8300ca45fe58
(XEN)    ffff82d0802e4240 ffff83042896c5f0 ffff83041bb4d000 0000000000000000
(XEN)    0000000000000000 ffff83041bb73000 ffff8300ca45fe78 ffff82d08020828f
(XEN)    ffff83041bb4d1b8 ffff82d080567210 ffff8300ca45fe90 ffff82d08023fd39
(XEN)    ffff82d080567200 ffff8300ca45fec0 ffff82d08024001a 0000000000000000
(XEN)    ffff82d080567210 ffff82d08056d980 ffff82d080584020 ffff8300ca45fef0
(XEN)    ffff82d08027247a ffff83041bbb2000 ffff83041bb4d000 ffff83041bbb3000
(XEN)    0000000000000000 ffff8300ca45fd98 0000000000000003 ffffffff820ae496
(XEN)    0000000000000003 0000000000000000 0000000000002003 ffffffff822c6868
(XEN)    0000000000000246 0000000000003403 00000000ffff0000 0000000000000000
(XEN)    0000000000000000 ffffffff810010ea 0000000000002003 0000000000000010
(XEN)    deadbeefdeadf00d 0000010000000000 ffffffff810010ea 000000000000e033
(XEN)    0000000000000246 ffffc900011abbe8 000000000000e02b 003b4a890045ffe0
(XEN)    003b4ddf00098fa8 003b4e0300000001 003b499d0045ffe0 0000e01000000000
(XEN)    ffff83041bbb2000 0000000000000000 00000000000426e0 0000000000000000
(XEN) Xen call trace:
(XEN)    [<ffff82d08023beb7>] R schedule.c#cpu_schedule_callback+0xea/0x1a1
(XEN)    [<ffff82d080221289>] F notifier_call_chain+0x6b/0x96
(XEN)    [<ffff82d080203476>] F cpu.c#cpu_notifier_call_chain+0x1b/0x33
(XEN)    [<ffff82d080203550>] F cpu_down+0x5e/0x15c
(XEN)    [<ffff82d080203999>] F enable_nonboot_cpus+0x113/0x1fb
(XEN)    [<ffff82d0802e4240>] F power.c#enter_state_helper+0x107/0x51b
(XEN)    [<ffff82d08020828f>] F domain.c#continue_hypercall_tasklet_handler=
+0x8b/0xb7
(XEN)    [<ffff82d08023fd39>] F tasklet.c#do_tasklet_work+0x76/0xa9
(XEN)    [<ffff82d08024001a>] F do_tasklet+0x58/0x8a
(XEN)    [<ffff82d08027247a>] F domain.c#idle_loop+0x40/0x96
(XEN)=20
(XEN) Pagetable walk from 0000000000000008:
(XEN)  L4[0x000] =3D 000000041bbff063 ffffffffffffffff
(XEN)  L3[0x000] =3D 000000041bbfe063 ffffffffffffffff
(XEN)  L2[0x000] =3D 000000041bbfd063 ffffffffffffffff
(XEN)  L1[0x000] =3D 0000000000000000 ffffffffffffffff
(XEN)=20
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) FATAL PAGE FAULT
(XEN) [error_code=3D0000]
(XEN) Faulting linear address: 0000000000000008
(XEN) ****************************************
(XEN)=20
(XEN) Reboot in five seconds...
(XEN) Resetting with ACPI MEMORY or I/O RESET_REG.
 Xen 4.14-unstable

--fdj2RfSjLxBAspz7--

--0eh6TmSyL6TZE2Uz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4Qr5gACgkQ24/THMrX
1ywZqQgAgVXDJSWG0koxKlyklHI85wWCWvz+/CpvvHdFrDiOusFTeBifKKCR/nx8
dhpRMpZYnFi3A5iJiLZ7blVWnoGsiyXGetv4epROJE06cbtIyHFeQqmBmCk2TX+R
Z3cvJnl+eyK8Wpa95kyDyUTk2PxrHLpvnrNzCFBaMDwAwtKfzETA9dulJyLElyA5
INOVooWJpS46IlJj/RSJKkJKVH3i+uQ7rHSPmsoGTreFSbJc7XzSIEK5VQ/NKc0F
hXGG2iae0WgK3vZjwW3Mhmwh009qHAENeLbba2Op/XZ9a6AWfCpzHvKUy7/1sZOi
vgG3Y/J35KiZJc2FUPDwZxs5axcobg==
=gVux
-----END PGP SIGNATURE-----

--0eh6TmSyL6TZE2Uz--


--===============6240709872821898356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6240709872821898356==--

