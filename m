Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 667BB94BE76
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 15:20:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774115.1184607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc33n-0005Kh-Kf; Thu, 08 Aug 2024 13:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774115.1184607; Thu, 08 Aug 2024 13:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc33n-0005J9-Hk; Thu, 08 Aug 2024 13:20:07 +0000
Received: by outflank-mailman (input) for mailman id 774115;
 Thu, 08 Aug 2024 13:20:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6I4s=PH=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sc33l-00053o-GG
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 13:20:05 +0000
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com
 [103.168.172.150]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb692b5e-5588-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 15:20:03 +0200 (CEST)
Received: from compute8.internal (compute8.nyi.internal [10.202.2.227])
 by mailfout.nyi.internal (Postfix) with ESMTP id 24D75138FCE4;
 Thu,  8 Aug 2024 09:20:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute8.internal (MEProxy); Thu, 08 Aug 2024 09:20:02 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Aug 2024 09:20:01 -0400 (EDT)
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
X-Inumbo-ID: eb692b5e-5588-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1723123202;
	 x=1723209602; bh=cWGrgl5FGkOpZf+r63CqwvJvu4/37TZjtbNVyIWg0To=; b=
	JKOjTZ4u/YUECYEtNtouI0M35TkLbRCbSihXcCGLSzARNW4WffQwoe5aynw+Cuay
	UJT0lWjBV0Fuy+WOYqHvWipdAx4YidOHMa0hwWBgcQFhhQJgDYbJOeI5p6VGuWIK
	NZTOi1dUlgtbiDZtL1jPoM+USw4u5ixGpjrhfrBMGCuEvHL/PogqvJwSpYjJpTAA
	zed8YCwHFdjEo3DdY0u66pxPMC9T3vqaN7/SEpgRNZWRSWfroQeywzaBvN3gJ7Ff
	u5sVIGLXSsBJSfb/D0B1F4WqlIVVN8Dl7+eQtjcEAGtVDsu4xHppLeswLsucmYd9
	vpTUi8AIZsqwfF0iMsueCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1723123202; x=1723209602; bh=cWGrgl5FGkOpZf+r63CqwvJvu4/3
	7TZjtbNVyIWg0To=; b=q10wdtnM6SF2s/y/a/SIwYTQRpbKU8hpJ2RDIizdW+tp
	73t39l4i4g++aY+kcxf9jtROOx2Y7eMXjZl15vsAFfCiYdTgPCzQDkjq+70rHkHx
	agDiHPiS/nj366VGVaeRxvTFegoJe5wLb2q3+ywjn2JFsKRIpBavZC3x4j/Zi69a
	7numRBtGGaDfxFQ47Qh1ZfceoKxjgG2fUiTRwUswon6/oera9Yu17j03FXl2HJ/Y
	mtOBru8M9UJX0yyZ6NuPnM75fkJOPK2fPvshushJyHJl+tvzsDtnzWSEWgvrobtg
	T1yun+VbTVNMLlVkh+QOatrmmLM8wiWeZFybBi3HTw==
X-ME-Sender: <xms:Aca0Zj4nXGS7bQ-zuoCu7Sp-eCpAEVSYcjouhldwUJQjMePbJ7ZOlQ>
    <xme:Aca0Zo6FnL8fUsEILLSjz_2e33eeZNPBxBS6PowNsy2Gat6U88QoMG87mokbNIklt
    yxCmsYcHEztyA>
X-ME-Received: <xmr:Aca0ZqfJ6m9DLGVIBlmeK6NuSMKPALAK5tIDnavJgq5gCenV47Ro-4X5air9dEf_EsvZ9fTCvlRibgLwLvIyWhW_28Jxhg2OOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrledvgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecu
    hfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrg
    hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffr
    rghtthgvrhhnpefgudelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegue
    etfeejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsg
    gprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjsggvuhhl
    ihgthhesshhushgvrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtsh
    drgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:Aca0ZkJS-5RkJ5ciyoUfDCzHo8zKaT-OsjamG5CjEBh5abPOwRwyVA>
    <xmx:Aca0ZnIWBYj3uwi-HDo9lDgzv_GuwuhD8E13GpNU4aVbi9RnqIqn3g>
    <xmx:Aca0ZtyWU4qOBFhxUyt8-9_LZRJLflGPzW6aafJtElu0eBYJeTwiVA>
    <xmx:Aca0ZjJ1jkygZ_muHpR2sGQ_iy0AzmkRcWlypr6AD8txNa0tu6m2zw>
    <xmx:Asa0ZtijXUlVnLBOQRnAkyFbncwEVwqFHO6PHf26s1tmHTej53v1XD8i>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 8 Aug 2024 15:19:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Assertion failed at arch/x86/genapic/x2apic.c:38 on S3 resume
 nested in KVM on AMD
Message-ID: <ZrTF_28uPHjPabn2@mail-itl>
References: <Zp--KHAFuDVnH1Oq@mail-itl>
 <579fd84d-0a31-43b3-8ce1-f826134cd8a2@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CJd+PFfbWa/s+trf"
Content-Disposition: inline
In-Reply-To: <579fd84d-0a31-43b3-8ce1-f826134cd8a2@suse.com>


--CJd+PFfbWa/s+trf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 8 Aug 2024 15:19:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Assertion failed at arch/x86/genapic/x2apic.c:38 on S3 resume
 nested in KVM on AMD

On Thu, Aug 08, 2024 at 01:22:30PM +0200, Jan Beulich wrote:
> On 23.07.2024 16:28, Marek Marczykowski-G=C3=B3recki wrote:
> > I'm observing a crash like the one below when trying to resume from S3.
> > It happens on Xen nested in KVM (QEMU 9.0, Linux 6.9.3) but only on AMD.
> > The very same software stack on Intel works just fine. QEMU is running
> > with "-cpu host,+svm,+invtsc -machine q35,kernel-irqchip=3Dsplit -device
> > amd-iommu,intremap=3Don -smp 2" among others.
> >=20
> >     (XEN) Preparing system for ACPI S3 state.
> >     (XEN) Disabling non-boot CPUs ...
> >     (XEN) Broke affinity for IRQ1, new: {0-1}
> >     (XEN) Broke affinity for IRQ20, new: {0-1}
> >     (XEN) Broke affinity for IRQ22, new: {0-1}
> >     (XEN) Entering ACPI S3 state.
> >     (XEN) Finishing wakeup from ACPI S3 state.
> >     (XEN) Enabling non-boot CPUs  ...
> >     (XEN) Assertion 'cpumask_test_cpu(this_cpu, per_cpu(cluster_cpus, t=
his_cpu))' failed at arch/x86/genapic/x2apic.c:38
> >     (XEN) ----[ Xen-4.20  x86_64  debug=3Dy  Not tainted ]----
> >     (XEN) CPU:    1
> >     (XEN) RIP:    e008:[<ffff82d04028862b>] x2apic.c#init_apic_ldr_x2ap=
ic_cluster+0x8a/0x1b9
> >     (XEN) RFLAGS: 0000000000010096   CONTEXT: hypervisor
> >     (XEN) rax: ffff830278a25f50   rbx: 0000000000000001   rcx: ffff82d0=
405e1700
> >     (XEN) rdx: 0000003233412000   rsi: ffff8302739da2d8   rdi: 00000000=
00000000
> >     (XEN) rbp: 00000000000000c8   rsp: ffff8302739d7e78   r8:  00000000=
00000001
> >     (XEN) r9:  ffff8302739d7fa0   r10: 0000000000000001   r11: 00000000=
00000000
> >     (XEN) r12: 0000000000000001   r13: 0000000000000001   r14: 00000000=
00000000
> >     (XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 00000000=
007506e0
> >     (XEN) cr3: 000000007fa7a000   cr2: 0000000000000000
> >     (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 00000000=
00000000
> >     (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e0=
08
> >     (XEN) Xen code around <ffff82d04028862b> (x2apic.c#init_apic_ldr_x2=
apic_cluster+0x8a/0x1b9):
> >     (XEN)  cf 82 ff ff eb b7 0f 0b <0f> 0b 48 8d 05 9c fc 33 00 48 8b 0=
d a5 0a 35 00
> >     (XEN) Xen stack trace from rsp=3Dffff8302739d7e78:
> >     (XEN)    0000000000000000 00000000000000c8 0000000000000001 0000000=
000000001
> >     (XEN)    0000000000000000 ffff82d0402f1d83 ffff8302739d7fff 0000000=
0000000c8
> >     (XEN)    0000000000000001 0000000000000001 ffff82d04031adb9 0000000=
000000001
> >     (XEN)    0000000000000000 0000000000000000 0000000000000000 ffff82d=
040276677
> >     (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000=
000000000
> >     (XEN)    ffff88810037c000 0000000000000001 0000000000000246 deadbee=
fdeadf00d
> >     (XEN)    0000000000000001 aaaaaaaaaaaaaaaa 0000000000000000 fffffff=
f811d130a
> >     (XEN)    deadbeefdeadf00d deadbeefdeadf00d deadbeefdeadf00d 0000010=
000000000
> >     (XEN)    ffffffff811d130a 000000000000e033 0000000000000246 ffffc90=
0400b3ef8
> >     (XEN)    000000000000e02b 000000000000beef 000000000000beef 0000000=
00000beef
> >     (XEN)    000000000000beef 0000e01000000001 ffff8302739de000 0000003=
233412000
> >     (XEN)    00000000007506e0 0000000000000000 0000000000000000 0000000=
200000000
> >     (XEN)    0000000000000002
> >     (XEN) Xen call trace:
> >     (XEN)    [<ffff82d04028862b>] R x2apic.c#init_apic_ldr_x2apic_clust=
er+0x8a/0x1b9
> >     (XEN)    [<ffff82d0402f1d83>] S setup_local_APIC+0x26/0x449
> >     (XEN)    [<ffff82d04031adb9>] S start_secondary+0x1c4/0x37a
> >     (XEN)    [<ffff82d040276677>] S __high_start+0x87/0xd0
> >     (XEN)=20
> >     (XEN)=20
> >     (XEN) ****************************************
> >     (XEN) Panic on CPU 1:
> >     (XEN) Assertion 'cpumask_test_cpu(this_cpu, per_cpu(cluster_cpus, t=
his_cpu))' failed at arch/x86/genapic/x2apic.c:38
> >     (XEN) ****************************************
>=20
> Would you mind giving the patch below a try?

Yes, this seems to fix the issue, thanks!

> Jan
>=20
> x86/x2APIC: correct cluster tracking upon CPUs going down for S3
>=20
> Downing CPUs for S3 is somewhat special: Since we can expect the system
> to come back up in exactly the same hardware configuration, per-CPU data
> for the secondary CPUs isn't de-allocated (and then cleared upon re-
> allocation when the CPUs are being brought back up). Therefore the
> cluster_cpus per-CPU pointer will retain its value for all CPUs other
> than the final one in a cluster (i.e. in particular for all CPUs in the
> same cluster as CPU0). That, however, is in conflict with the assertion
> early in init_apic_ldr_x2apic_cluster().
>=20
> Note that the issue is avoided on Intel hardware, where we park CPUs
> instead of bringing them down.

I wonder why I don't hit this issue on baremetal AMD, only on nested.
Anyway,

Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> Extend the bypassing of the freeing to the suspend case, thus making
> suspend/resume also a tiny bit faster.
>=20
> Fixes: 2e6c8f182c9c ("x86: distinguish CPU offlining from CPU removal")
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> --- a/xen/arch/x86/genapic/x2apic.c
> +++ b/xen/arch/x86/genapic/x2apic.c
> @@ -228,7 +228,8 @@ static int cf_check update_clusterinfo(
>      case CPU_UP_CANCELED:
>      case CPU_DEAD:
>      case CPU_REMOVE:
> -        if ( park_offline_cpus =3D=3D (action !=3D CPU_REMOVE) )
> +        if ( park_offline_cpus =3D=3D (action !=3D CPU_REMOVE) ||
> +             system_state =3D=3D SYS_STATE_suspend )
>              break;
>          if ( per_cpu(cluster_cpus, cpu) )
>          {
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--CJd+PFfbWa/s+trf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAma0xf8ACgkQ24/THMrX
1yyKrAf8Cf2bkeX0TG+0HmYpuJRkvV+kEQzoaJVu7s/pQ8FsheUNvE+U1bFLs7DG
/OvJQ2sfbIcMIeSmQ0TOHbuYSJUcRGB9vaFqilSY+oEddRHEdKTDFS0r8eOHk8JN
1Ipr8LlIeuqGulxsoNI+u2O/FeCExnyNri7Aszq8UqpmXPLkSQ+qthups/KRi/oa
7c4qhzdTjb6kGGy8qO7gamMWkMJYxaIhBaOXPisP0x/VGLs9qOB/jhkm9BB6PsLI
FFOfhdx1By6oIFDFYzdKnp68QCKaD5ORvu/WwP8vbK5d8juDJ+09aqG6P7l6gZsw
d6Xkf2dO2f9o4gNkdNFPvyo2Jyh/QA==
=eIeI
-----END PGP SIGNATURE-----

--CJd+PFfbWa/s+trf--

