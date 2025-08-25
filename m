Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D36B345B0
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 17:26:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093456.1448965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqZ5g-0008Gh-ES; Mon, 25 Aug 2025 15:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093456.1448965; Mon, 25 Aug 2025 15:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqZ5g-0008E7-9p; Mon, 25 Aug 2025 15:26:36 +0000
Received: by outflank-mailman (input) for mailman id 1093456;
 Mon, 25 Aug 2025 15:26:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paQ2=3F=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uqZ5f-0007h0-EU
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 15:26:35 +0000
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1678031-81c7-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 17:26:33 +0200 (CEST)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 54F3E7A0103;
 Mon, 25 Aug 2025 11:26:32 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-10.internal (MEProxy); Mon, 25 Aug 2025 11:26:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Aug 2025 11:26:31 -0400 (EDT)
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
X-Inumbo-ID: e1678031-81c7-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756135592;
	 x=1756221992; bh=np5vJpyy7lDldFFcl5Vkfbhrix7UygfNpb87aMYXdMo=; b=
	ozkGZPmksdwqnN1Q3Cx0WqXg7kwWaYpvhTUqZoia19c6FbQMrakOokx4Z/PvZRao
	RErOI04YqTYbj4wWtxXyZRuzXFlWj3+B5SlGK+/4oQQWWYrRWECTHrXFaXufd62z
	Lc36PO6j+AVM/64QuhvMpNUUnpaXo/Vz9y3DKIpZqlzoX2yEJ7DOka4MXHvFA0jM
	RcXgmIsD2EtN6EQ/nDhMXorBEGlvdmDBPxIwdGU0zRzCaPPlxae3pDSNb5yu0L9R
	DClX8X8qnauYMmjVUnmSpFxGBKjdti5ZgpVYICms7Il4RvC2ybFE8WUQDVpEpyvr
	qTe20L+nieJMtcYJZOI6vQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1756135592; x=1756221992; bh=np5vJpyy7lDldFFcl5Vkfbhrix7UygfNpb8
	7aMYXdMo=; b=ELoQY7kboQdK8H59/9yQ9RJpSWu4pyR979niwhL7AiRYOgIKfjx
	vFKfUo686oqTcCVj0zMEprtDXCTlrXVEDi5HYJhElWn59ryHdrryKHGLtn1/cFu3
	j+Ligcjz9Lq9U9M+VqmOedVKGihdzcPyRscWK1X2N1lGODawYPczGu9xNqpzOlgt
	kqoORrOq0dVMttp3bPj9TxEA97FOqcUM0pcoc0BTEs3BySv7UEj0D8NttEc7kKal
	iXb4NuDpeXKwp/QjBlEO2vxvc8QNPn921gGRqEF613jSo7el6R+4CpaIBXNGaF6v
	GEUZ8I0KNo0uoIk1D4nXSzOnc/5ux1kVsdg==
X-ME-Sender: <xms:p4CsaJvynvCIhLEwYs6rXaYuekV5-D7YMld-5BYoL9tu4XA8i-UOJA>
    <xme:p4CsaNCbcsA9eZDIn5aOkil4dm4xZ1vgGZN-z_J4ViF4a0AZEnicS7JV0qpVl45cX
    8oVF52B0_a75Q>
X-ME-Received: <xmr:p4CsaJVFqcXKTQk5bn1uEHw6o2FQBFBdCNP6vJ7YOHjr05HzsJxqauepWHTCMJc2zQIdCqDUFYj88yJBEGMM7TDFkPya5Y8RI8E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujedvjeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptdetvdfh
    kedutedvleffgeeutdektefhtefhfffhfeetgefhieegledvtddtkedtnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihig
    rdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojh
    gvtghtrdhorhhgpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgt
    phhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:p4CsaDC0M0aziRQwd9-6PqFV24DaxitKyvlG3nWQ-I_HuxqEXNXSog>
    <xmx:p4CsaE8mvWLHyVsBmNN-L3NTegD1XKYduHk2lCkD74qT-qMg6ZkVng>
    <xmx:p4CsaCFds1WCqASemlrBh4aD9RjTXr898SNpxwO-D7yBzrTMI8B3NQ>
    <xmx:p4CsaKMzozZIrJid5PPxhp7-pVCg2w4SBs3RTMsKCrdviH2UIOw0HA>
    <xmx:qICsaPw6dspi-VPkOQ2-VtQb_h6Dd2bKPtJsAMwqkeJ0-4SxNk0I7dXr>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 25 Aug 2025 17:26:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/suspend: unconditionally raise a timer softirq on
 resume
Message-ID: <aKyApbxEHQcaKbYc@mail-itl>
References: <20250825151515.39177-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dhaSqA7pHatNiyyD"
Content-Disposition: inline
In-Reply-To: <20250825151515.39177-1-roger.pau@citrix.com>


--dhaSqA7pHatNiyyD
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 Aug 2025 17:26:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/suspend: unconditionally raise a timer softirq on
 resume

On Mon, Aug 25, 2025 at 05:15:15PM +0200, Roger Pau Monne wrote:
> The current code to restore the timer state on resume is incomplete.  Whi=
le
> the local APIC Initial Count Register is saved and restored across
> suspension (even if possibly no longer accurate since it's not adjusted to
> account for the time spent in suspension), the TSC deadline MSR is not
> saved and restored, hence hosts using the TSC deadline timer will likely
> get stuck when resuming from suspension.
>=20
> The lack of restoring of the TSC deadline MSR was mitigated by the raising
> of a timer softirq in mwait_idle_with_hints() if the timer had expired,
> previous to commit 3faf0866a33070b926ab78e6298290403f85e76c, which removed
> that logic.
>=20
> This patch fixes the usage of the TSC deadline timer with suspension, by
> unconditionally raising a timer softirq on resume, that will take care of
> rearming the hardware timer.  Given that a timer softirq will be
> unconditionally risen, there's no need to save and restore the APIC Initi=
al
> Count Register anymore either.
>=20
> Note that secondary processors don't need this special treatment when
> resuming, since they are offlined before suspension and brought back up
> during resume, the first timer that gets setup will trigger a timer softi=
rq
> unconditionally, for example from sched_migrate_timers() that gets called
> for each secondary processor.
>=20
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
> Fixes: fd1291a826e1 ('X86: Prefer TSC-deadline timer in Xen')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
>  xen/arch/x86/acpi/power.c | 2 ++
>  xen/arch/x86/apic.c       | 3 ---
>  2 files changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
> index 2ac162c997fe..27d672ad5dbb 100644
> --- a/xen/arch/x86/acpi/power.c
> +++ b/xen/arch/x86/acpi/power.c
> @@ -19,6 +19,7 @@
>  #include <xen/iommu.h>
>  #include <xen/param.h>
>  #include <xen/sched.h>
> +#include <xen/softirq.h>
>  #include <xen/spinlock.h>
>  #include <xen/watchdog.h>
> =20
> @@ -310,6 +311,7 @@ static int enter_state(u32 state)
>      thaw_domains();
>      system_state =3D SYS_STATE_active;
>      spin_unlock(&pm_lock);
> +    raise_softirq(TIMER_SOFTIRQ);
>      return error;
>  }
> =20
> diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
> index cac5ba39e615..e3a2b84f1aae 100644
> --- a/xen/arch/x86/apic.c
> +++ b/xen/arch/x86/apic.c
> @@ -65,7 +65,6 @@ static struct {
>      unsigned int apic_lvt0;
>      unsigned int apic_lvt1;
>      unsigned int apic_lvterr;
> -    unsigned int apic_tmict;
>      unsigned int apic_tdcr;
>      unsigned int apic_thmr;
>  } apic_pm_state;
> @@ -658,7 +657,6 @@ int lapic_suspend(void)
>      apic_pm_state.apic_lvt0 =3D apic_read(APIC_LVT0);
>      apic_pm_state.apic_lvt1 =3D apic_read(APIC_LVT1);
>      apic_pm_state.apic_lvterr =3D apic_read(APIC_LVTERR);
> -    apic_pm_state.apic_tmict =3D apic_read(APIC_TMICT);
>      apic_pm_state.apic_tdcr =3D apic_read(APIC_TDCR);
>      if (maxlvt >=3D 5)
>          apic_pm_state.apic_thmr =3D apic_read(APIC_LVTTHMR);
> @@ -718,7 +716,6 @@ int lapic_resume(void)
>          apic_write(APIC_LVTPC, apic_pm_state.apic_lvtpc);
>      apic_write(APIC_LVTT, apic_pm_state.apic_lvtt);
>      apic_write(APIC_TDCR, apic_pm_state.apic_tdcr);
> -    apic_write(APIC_TMICT, apic_pm_state.apic_tmict);
>      apic_write(APIC_ESR, 0);
>      apic_read(APIC_ESR);
>      apic_write(APIC_LVTERR, apic_pm_state.apic_lvterr);
> --=20
> 2.49.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--dhaSqA7pHatNiyyD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmisgKUACgkQ24/THMrX
1yxXLggAh/QGcZFt3gD5+dvWVvFQ6hgcfWSEXtZQg+7Fz90+6M//WyI0Hce1YubS
+iQewEatx7V0uR/g4gJBckINOhyvPIUKzxMzVWg9Kl2C7afgtc+yZcItE6hI+Ri8
fx465Ey5WOQ85C7L8BHnRZbv6PRbMi5OHDm/cmGfn/Dm6Gqq2W/Y8T6OIskiLnkd
6Gbk2YRyfMwQBFaOi2LYc5wCv+4luOud/ZMPi90gI8jRZiMt6qxFwl0VoojRiQVp
LR/hq+Ov/ZWNs2pi7ixpmlSIs5WrUwnCK5LgJ72MoQY6P9zWXOu1Uufqy4Yk/DiQ
IrlANsnukMYGn2jYe7zSxqNLwZYg9g==
=kAU8
-----END PGP SIGNATURE-----

--dhaSqA7pHatNiyyD--

