Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D78A70C940
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 21:46:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538098.837872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1BTi-0006wz-ND; Mon, 22 May 2023 19:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538098.837872; Mon, 22 May 2023 19:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1BTi-0006uu-KR; Mon, 22 May 2023 19:45:58 +0000
Received: by outflank-mailman (input) for mailman id 538098;
 Mon, 22 May 2023 19:45:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y+KS=BL=kernel.org=broonie@srs-se1.protection.inumbo.net>)
 id 1q1BTg-0006uo-Oj
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 19:45:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4311c0dc-f8d9-11ed-8611-37d641c3527e;
 Mon, 22 May 2023 21:45:54 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0318B62A8F;
 Mon, 22 May 2023 19:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1426CC433D2;
 Mon, 22 May 2023 19:45:44 +0000 (UTC)
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
X-Inumbo-ID: 4311c0dc-f8d9-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684784752;
	bh=hjg+nEkGnT5wX4cHznoLQRDdNnOeCH9yJ5NNOV5v5V8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hA34ih2YynFmHhjBrG8aSg5C3lBqNWxO+7zUy6BcX+aQ+XsHNhgCm4xunK35wUfDJ
	 04AL6sb9/gUSPWXOZMaAq5Y7JIXyvMtkGkZMTG9vTCt4A8+skUC7ElqxtgBp2x2krK
	 KXPIKvhskol6TlkDwgxlGGlJ5y2FCniz+hQ98V0mD9bUkw4wvKfKbmP/xvUTM9q8Ve
	 fONIqzl3Sgg70s+V3M83exiIb/68r7UKMiD+x7d50jdm3a/1eRP+3d2dz9MSWt954u
	 vNN+OVP0DZVxqN+BeDQuT8WJBBnv0iFmhuwNmLFk5+EAJ8WntO0QmIY8JmuCh+aiqH
	 WbAh9K2p4Y8cA==
Date: Mon, 22 May 2023 20:45:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Brian Gerst <brgerst@gmail.com>,
	Arjan van de Veen <arjan@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul McKenney <paulmck@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	Oleksandr Natalenko <oleksandr@natalenko.name>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Piotr Gorski <lucjan.lucjanov@gmail.com>,
	Usama Arif <usama.arif@bytedance.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	linux-csky@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Sabin Rapan <sabrapan@amazon.com>,
	"Michael Kelley (LINUX)" <mikelley@microsoft.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [patch V4 33/37] cpu/hotplug: Allow "parallel" bringup up to
 CPUHP_BP_KICK_AP_STATE
Message-ID: <4ca39e58-055f-432c-8124-7c747fa4e85b@sirena.org.uk>
References: <20230512203426.452963764@linutronix.de>
 <20230512205257.240231377@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nxuSzC5SBKt722Ku"
Content-Disposition: inline
In-Reply-To: <20230512205257.240231377@linutronix.de>
X-Cookie: Even bytes get lonely for a little bit.


--nxuSzC5SBKt722Ku
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 12, 2023 at 11:07:50PM +0200, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
>=20
> There is often significant latency in the early stages of CPU bringup, and
> time is wasted by waking each CPU (e.g. with SIPI/INIT/INIT on x86) and
> then waiting for it to respond before moving on to the next.
>=20
> Allow a platform to enable parallel setup which brings all to be onlined
> CPUs up to the CPUHP_BP_KICK_AP state. While this state advancement on the
> control CPU (BP) is single-threaded the important part is the last state
> CPUHP_BP_KICK_AP which wakes the to be onlined CPUs up.

We're seeing a regression on ThunderX2 systems with 256 CPUs with an
arm64 defconfig running -next which I've bisected to this patch.  Before
this commit we bring up 256 CPUs:

[   29.137225] GICv3: CPU254: found redistributor 11e03 region 1:0x00000004=
41f60000
[   29.137238] GICv3: CPU254: using allocated LPI pending table @0x00000008=
818e0000
[   29.137305] CPU254: Booted secondary processor 0x0000011e03 [0x431f0af1]
[   29.292421] Detected PIPT I-cache on CPU255
[   29.292635] GICv3: CPU255: found redistributor 11f03 region 1:0x00000004=
41fe0000
[   29.292648] GICv3: CPU255: using allocated LPI pending table @0x00000008=
818f0000
[   29.292715] CPU255: Booted secondary processor 0x0000011f03 [0x431f0af1]
[   29.292859] smp: Brought up 2 nodes, 256 CPUs
[   29.292864] SMP: Total of 256 processors activated.

but after we only bring up 255, missing the 256th:

[   29.165888] GICv3: CPU254: found redistributor 11e03 region 1:0x00000004=
41f60000
[   29.165901] GICv3: CPU254: using allocated LPI pending table @0x00000008=
818e0000
[   29.165968] CPU254: Booted secondary processor 0x0000011e03 [0x431f0af1]
[   29.166120] smp: Brought up 2 nodes, 255 CPUs
[   29.166125] SMP: Total of 255 processors activated.

I can't immediately see an issue with the patch itself, for systems
without CONFIG_HOTPLUG_PARALLEL=3Dy it should replace the loop over
cpu_present_mask done by for_each_present_cpu() with an open coded one.
I didn't check the rest of the series yet.

The KernelCI bisection bot also isolated an issue on Odroid XU3 (a 32
bit arm system) with the final CPU of the 8 on the system not coming up
to the same patch:

  https://groups.io/g/kernelci-results/message/42480?p=3D%2C%2C%2C20%2C0%2C=
0%2C0%3A%3Acreated%2C0%2Call-cpus%2C20%2C2%2C0%2C99054444

Other boards I've checked (including some with multiple CPU clusters)
seem to be bringing up all their CPUs so it doesn't seem to just be
general breakage.

Log from my bisect:

git bisect start
# bad: [9f258af06b6268be8e960f63c3f66e88bdbbbdb0] Add linux-next specific f=
iles for 20230522
git bisect bad 9f258af06b6268be8e960f63c3f66e88bdbbbdb0
# good: [44c026a73be8038f03dbdeef028b642880cf1511] Linux 6.4-rc3
git bisect good 44c026a73be8038f03dbdeef028b642880cf1511
# good: [914db90ee0172753ab5298a48c63ac4f1fe089cf] Merge branch 'for-linux-=
next' of git://anongit.freedesktop.org/drm/drm-misc
git bisect good 914db90ee0172753ab5298a48c63ac4f1fe089cf
# good: [4624865b65777295cbe97cf1b98e6e49d81119d3] Merge branch 'next' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git
git bisect good 4624865b65777295cbe97cf1b98e6e49d81119d3
# bad: [be7220c44fbc06825f7f122d06051630e1bf51e4] Merge branch 'for-next' o=
f git://github.com/cminyard/linux-ipmi.git
git bisect bad be7220c44fbc06825f7f122d06051630e1bf51e4
# good: [cc677f7bec0da862a93d176524cdad5f416d58ef] Merge branch 'for-next' =
of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git
git bisect good cc677f7bec0da862a93d176524cdad5f416d58ef
# bad: [cdcc744aee1b886cbe4737798c0b8178b9ba5ae5] next-20230518/rcu
git bisect bad cdcc744aee1b886cbe4737798c0b8178b9ba5ae5
# bad: [8397dce1586a35af63fe9ea3e8fb3344758e55b5] Merge branch into tip/mas=
ter: 'x86/mm'
git bisect bad 8397dce1586a35af63fe9ea3e8fb3344758e55b5
# bad: [0c7ffa32dbd6b09a87fea4ad1de8b27145dfd9a6] x86/smpboot/64: Implement=
 arch_cpuhp_init_parallel_bringup() and enable it
git bisect bad 0c7ffa32dbd6b09a87fea4ad1de8b27145dfd9a6
# good: [ab24eb9abb9c60c45119370731735b79ed79f36c] x86/xen/hvm: Get rid of =
DEAD_FROZEN handling
git bisect good ab24eb9abb9c60c45119370731735b79ed79f36c
# good: [72b11aa7f8f93449141544cecb21b2963416902d] riscv: Switch to hotplug=
 core state synchronization
git bisect good 72b11aa7f8f93449141544cecb21b2963416902d
# good: [f54d4434c281f38b975d58de47adeca671beff4f] x86/apic: Provide cpu_pr=
imary_thread mask
git bisect good f54d4434c281f38b975d58de47adeca671beff4f
# bad: [bea629d57d006733d155bdb65ba4867788da69b6] x86/apic: Save the APIC v=
irtual base address
git bisect bad bea629d57d006733d155bdb65ba4867788da69b6
# bad: [18415f33e2ac4ab382cbca8b5ff82a9036b5bd49] cpu/hotplug: Allow "paral=
lel" bringup up to CPUHP_BP_KICK_AP_STATE
git bisect bad 18415f33e2ac4ab382cbca8b5ff82a9036b5bd49
# first bad commit: [18415f33e2ac4ab382cbca8b5ff82a9036b5bd49] cpu/hotplug:=
 Allow "parallel" bringup up to CPUHP_BP_KICK_AP_STATE

--nxuSzC5SBKt722Ku
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRrxmQACgkQJNaLcl1U
h9CiKAf8DZMz9GmmJSE2csjdGdRu7caRKW0Tt5rUN3Rk8slC+Fb2FYWsc6BSJXU7
bN4/F3Oie4ukVf5oamB42/30Iemh8OdOE3aC/ceb9n2OmF9rKnQHIrC8q2xZo5S/
jZDRUq5Y91IMU6dsMy8Teoctmt4UCyXbSm6r5hA2hfepTZnZ0MszdpwdkfKTtb2h
nXXb54WH18u/i1vmPWTNpfHfTXXhKPSkRJ4NcJWt6NaRINld+kJBqdU1usQBnxG3
mn4C2p3YYPtd0fv66x2tPLxbXyjmGYv0/fsSg1INqS0A8Jq/piohEK9rqAeBi6BD
BEFqLrxN7XtuQjD2ksUH5UcvrDWwVw==
=FllZ
-----END PGP SIGNATURE-----

--nxuSzC5SBKt722Ku--

