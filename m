Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2329293A2BE
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 16:29:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763299.1173559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWGVn-0000Qv-Cr; Tue, 23 Jul 2024 14:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763299.1173559; Tue, 23 Jul 2024 14:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWGVn-0000P7-8s; Tue, 23 Jul 2024 14:29:07 +0000
Received: by outflank-mailman (input) for mailman id 763299;
 Tue, 23 Jul 2024 14:29:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xgPy=OX=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sWGVl-0000OU-Dt
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 14:29:05 +0000
Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com
 [103.168.172.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e75f12f6-48ff-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 16:29:02 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfout.nyi.internal (Postfix) with ESMTP id 13EED1380340
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 10:29:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 23 Jul 2024 10:29:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 10:28:59 -0400 (EDT)
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
X-Inumbo-ID: e75f12f6-48ff-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1721744940; x=1721831340; bh=YgfT7mscqH
	S498jIZyCl52XDbsmT1MApm9rfgZLU06I=; b=MAmkHJ+QxtVFm+jLrwOVp7rwJU
	n1TSa+zBFy1Xhfh8GgIJ6yvG161A/ZmG1lJu2/+qvsEmPwD4E4f23FIOPj3S17pC
	ZMotn526PZ/zwfeG4kRHZQPX4Ko0prPoGEPn+ZEt/LoXJS9z6nPVMpMic4vwAkKO
	HJeuT0oHgV7IKaofNOZM9EzGKS+6PaW2i5WXyeuAalkfwBEAcPWQDDvV/Ob9AYSH
	aBBcZG8oh80nRZU8DcQkhToKb2yjh/E7cXJhnIHQhqo9GryRE+mma3Sg1QmZ8SOi
	wvYShJv8SCfoY6Ua4YBucRULYWofkNPpH7wB6gn104YdrL7HE+ZcI1jGft7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1721744940; x=1721831340; bh=YgfT7mscqHS498jIZyCl52XDbsmT1MApm9r
	fgZLU06I=; b=CYcDTvG2GF9t+w6hAAqeH3lNXyFeO9Jwm31DKSCVig8KLiMX3nq
	39ZSlg2fS4GwQCXYXJ2RzGqhc9Zdsxzi6fw4mlf1wBW4bBJaPUE2oYJcrRWGj1ZX
	fuwp44JC+cwChNS2yGU7+aA6Ehm9u1b2Y62Y86NVEWxJb2OtauGKLNnxC4z3F9PN
	z1V7MaqtTmWnwsJUpI+N4y1pmheklLa7To2Jv1+gqNuo00cCwTytqPWM+leBqu8R
	dUkHWC+yf7beujh5XATLBfsQx72/3zbwdOLW05UsTpsB9v7nsCfBsrlXXbCEjhBk
	wy1QsYPPD7o/HEa4tcV93I3h0nwRfiwKvyw==
X-ME-Sender: <xms:K76fZh_DQl0nj6URxKlBqt42MUU6BEDDquz9ZAOys4yui3O85cp5eA>
    <xme:K76fZlsKRbuqAM-_KS7meyyy_WrItZz98TxVM4qIChRZ-BHrOdtUS8XMNNYfte-U7
    D3vJnqPhbQ48Q>
X-ME-Received: <xmr:K76fZvCC9zACRmWCFqMSCTZnJM1jOl_ru5WTV-cQKUzSszKdHRocIcmk060QpFKA8G9jdgIdyZkzpvtsW6BlPbdNh4bDEt8v8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrheelgdejiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggusehgtderredttd
    ejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcu
    oehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedtudfgteduveduieevvefgteeujeelgffggffhhffhhedtffef
    fefgudeugeefhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
    pdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:K76fZlfMKVM_fV-oNg-fS4sNFPihKFjd5mi_cR3I4rQBM6gd-X14Zg>
    <xmx:K76fZmPv2QQ1Ik_pA-eNyQvOKq9RHg1byX3Y8M2tdtJJpT8OT6wkAg>
    <xmx:K76fZnl7COiBudj-IsVEMLRxbfSflDjRMg-EHFUbQ0LBZttTq2JQ0w>
    <xmx:K76fZgvatJ51tZOKdKr62MLQFDruf1p2vSo-qJ71WFW2hpavZILGvw>
    <xmx:LL6fZgUOOC_g4cRGlWWX4UwljWAFBOOqoFQK91753bxDwAryHzfeRy8b>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 23 Jul 2024 16:28:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Assertion failed at arch/x86/genapic/x2apic.c:38 on S3 resume nested
 in KVM on AMD
Message-ID: <Zp--KHAFuDVnH1Oq@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PgnEH3+1U+YAOMDK"
Content-Disposition: inline


--PgnEH3+1U+YAOMDK
Content-Type: multipart/mixed; protected-headers=v1;
	boundary="RVpJQbIQ0wZipRE6"
Content-Disposition: inline
Date: Tue, 23 Jul 2024 16:28:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Assertion failed at arch/x86/genapic/x2apic.c:38 on S3 resume nested
 in KVM on AMD


--RVpJQbIQ0wZipRE6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I'm observing a crash like the one below when trying to resume from S3.
It happens on Xen nested in KVM (QEMU 9.0, Linux 6.9.3) but only on AMD.
The very same software stack on Intel works just fine. QEMU is running
with "-cpu host,+svm,+invtsc -machine q35,kernel-irqchip=3Dsplit -device
amd-iommu,intremap=3Don -smp 2" among others.

    (XEN) Preparing system for ACPI S3 state.
    (XEN) Disabling non-boot CPUs ...
    (XEN) Broke affinity for IRQ1, new: {0-1}
    (XEN) Broke affinity for IRQ20, new: {0-1}
    (XEN) Broke affinity for IRQ22, new: {0-1}
    (XEN) Entering ACPI S3 state.
    (XEN) Finishing wakeup from ACPI S3 state.
    (XEN) Enabling non-boot CPUs  ...
    (XEN) Assertion 'cpumask_test_cpu(this_cpu, per_cpu(cluster_cpus, this_=
cpu))' failed at arch/x86/genapic/x2apic.c:38
    (XEN) ----[ Xen-4.20  x86_64  debug=3Dy  Not tainted ]----
    (XEN) CPU:    1
    (XEN) RIP:    e008:[<ffff82d04028862b>] x2apic.c#init_apic_ldr_x2apic_c=
luster+0x8a/0x1b9
    (XEN) RFLAGS: 0000000000010096   CONTEXT: hypervisor
    (XEN) rax: ffff830278a25f50   rbx: 0000000000000001   rcx: ffff82d0405e=
1700
    (XEN) rdx: 0000003233412000   rsi: ffff8302739da2d8   rdi: 000000000000=
0000
    (XEN) rbp: 00000000000000c8   rsp: ffff8302739d7e78   r8:  000000000000=
0001
    (XEN) r9:  ffff8302739d7fa0   r10: 0000000000000001   r11: 000000000000=
0000
    (XEN) r12: 0000000000000001   r13: 0000000000000001   r14: 000000000000=
0000
    (XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 000000000075=
06e0
    (XEN) cr3: 000000007fa7a000   cr2: 0000000000000000
    (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 000000000000=
0000
    (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
    (XEN) Xen code around <ffff82d04028862b> (x2apic.c#init_apic_ldr_x2apic=
_cluster+0x8a/0x1b9):
    (XEN)  cf 82 ff ff eb b7 0f 0b <0f> 0b 48 8d 05 9c fc 33 00 48 8b 0d a5=
 0a 35 00
    (XEN) Xen stack trace from rsp=3Dffff8302739d7e78:
    (XEN)    0000000000000000 00000000000000c8 0000000000000001 00000000000=
00001
    (XEN)    0000000000000000 ffff82d0402f1d83 ffff8302739d7fff 00000000000=
000c8
    (XEN)    0000000000000001 0000000000000001 ffff82d04031adb9 00000000000=
00001
    (XEN)    0000000000000000 0000000000000000 0000000000000000 ffff82d0402=
76677
    (XEN)    0000000000000000 0000000000000000 0000000000000000 00000000000=
00000
    (XEN)    ffff88810037c000 0000000000000001 0000000000000246 deadbeefdea=
df00d
    (XEN)    0000000000000001 aaaaaaaaaaaaaaaa 0000000000000000 ffffffff811=
d130a
    (XEN)    deadbeefdeadf00d deadbeefdeadf00d deadbeefdeadf00d 00000100000=
00000
    (XEN)    ffffffff811d130a 000000000000e033 0000000000000246 ffffc900400=
b3ef8
    (XEN)    000000000000e02b 000000000000beef 000000000000beef 00000000000=
0beef
    (XEN)    000000000000beef 0000e01000000001 ffff8302739de000 00000032334=
12000
    (XEN)    00000000007506e0 0000000000000000 0000000000000000 00000002000=
00000
    (XEN)    0000000000000002
    (XEN) Xen call trace:
    (XEN)    [<ffff82d04028862b>] R x2apic.c#init_apic_ldr_x2apic_cluster+0=
x8a/0x1b9
    (XEN)    [<ffff82d0402f1d83>] S setup_local_APIC+0x26/0x449
    (XEN)    [<ffff82d04031adb9>] S start_secondary+0x1c4/0x37a
    (XEN)    [<ffff82d040276677>] S __high_start+0x87/0xd0
    (XEN)=20
    (XEN)=20
    (XEN) ****************************************
    (XEN) Panic on CPU 1:
    (XEN) Assertion 'cpumask_test_cpu(this_cpu, per_cpu(cluster_cpus, this_=
cpu))' failed at arch/x86/genapic/x2apic.c:38
    (XEN) ****************************************

On a release build, it hits "BUG" later on in the same file.

I've tested the attached patch from Roger, but that assertion didn't
fail (or it crashed before reaching that part).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--RVpJQbIQ0wZipRE6
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="debug-amd-suspend.patch"
Content-Transfer-Encoding: quoted-printable

diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
index 371dd100c742..fe8e664e1b63 100644
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -30,8 +30,11 @@ static inline u32 x2apic_cluster(unsigned int cpu)
 static void cf_check init_apic_ldr_x2apic_cluster(void)
 {
     unsigned int cpu, this_cpu =3D smp_processor_id();
+    uint32_t id =3D apic_read(APIC_ID);
+    uint32_t ldr =3D apic_read(APIC_LDR);
=20
-    per_cpu(cpu_2_logical_apicid, this_cpu) =3D apic_read(APIC_LDR);
+    ASSERT(x2apic_ldr_from_id(id) =3D=3D ldr);
+    per_cpu(cpu_2_logical_apicid, this_cpu) =3D ldr;
=20
     if ( per_cpu(cluster_cpus, this_cpu) )
     {
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 9cfc82666ae5..2a010a6363b7 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1064,11 +1064,6 @@ static const struct hvm_mmio_ops vlapic_mmio_ops =3D=
 {
     .write =3D vlapic_mmio_write,
 };
=20
-static uint32_t x2apic_ldr_from_id(uint32_t id)
-{
-    return ((id & ~0xf) << 12) | (1 << (id & 0xf));
-}
-
 static void set_x2apic_id(struct vlapic *vlapic)
 {
     const struct vcpu *v =3D vlapic_vcpu(vlapic);
diff --git a/xen/arch/x86/include/asm/apic.h b/xen/arch/x86/include/asm/api=
c.h
index 7b5a0832c05e..8a892fa2fa5b 100644
--- a/xen/arch/x86/include/asm/apic.h
+++ b/xen/arch/x86/include/asm/apic.h
@@ -148,6 +148,11 @@ static inline void ack_APIC_irq(void)
 	apic_write(APIC_EOI, 0);
 }
=20
+static inline uint32_t x2apic_ldr_from_id(uint32_t id)
+{
+    return ((id & ~0xf) << 12) | (1 << (id & 0xf));
+}
+
 extern int get_maxlvt(void);
 extern void clear_local_APIC(void);
 extern void connect_bsp_APIC (void);


--RVpJQbIQ0wZipRE6--

--PgnEH3+1U+YAOMDK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmafvigACgkQ24/THMrX
1yxa1AgAi9fZo7ap/6FN8R2gaH4mbqwE7pLJHxCat0qoNyG+9U4rNOTbUOMjSFfD
IwgNlOKCYYqddniExdejKt7KLREsBhr8SHgg1/IPd/e85Lfzg8Nx9KT0hoTr71EG
Hb2SVao150m41SuWOJtRHlmyI9yZ4iLfl+6STFkzx+MWnW/amk6OGMKhg3k1vxU8
CknvFSnqpisEHeF8DN7P2eywnpt+Adb4/67YYypgVhU3AFDD5erJH0+HX841W1OR
WvslzihfXoNH6NabL1m/OXB0Y5ySOTMiwjHCER+9cBYW1hJePUy8mItry7FQ4F08
6/fE+hP+bQ7VQ02NkWHqNwCush0zxw==
=9cM8
-----END PGP SIGNATURE-----

--PgnEH3+1U+YAOMDK--

