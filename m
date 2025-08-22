Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 436B1B30A82
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 02:54:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089417.1447010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upG2R-00014U-I6; Fri, 22 Aug 2025 00:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089417.1447010; Fri, 22 Aug 2025 00:53:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upG2R-00011L-FK; Fri, 22 Aug 2025 00:53:51 +0000
Received: by outflank-mailman (input) for mailman id 1089417;
 Fri, 22 Aug 2025 00:53:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RLTp=3C=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1upG2Q-00011F-A8
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 00:53:50 +0000
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75cb0c8c-7ef2-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 02:53:48 +0200 (CEST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id 9D44FEC085D;
 Thu, 21 Aug 2025 20:53:46 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Thu, 21 Aug 2025 20:53:46 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Aug 2025 20:53:45 -0400 (EDT)
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
X-Inumbo-ID: 75cb0c8c-7ef2-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1755824026;
	 x=1755910426; bh=xiR7dnO12e//LZ6ciVJEt7B13MyFzf4nwxTto02TC5E=; b=
	gEIKn3zWO+4a8GmjG6zWCWv1XjfI1kxDizUDC8KQxcdOiME8oJQPJcGFAzeU/TBY
	K24lLKulgnQHVlZkMUzPdbgbymzX2CrQwHCbHuAQeso0On53+8CLVUvA3Wp9ddG3
	EcDFmPy7DTSNBwlBwwtQ0KhBzg7lgZE3jhZktJt4z837rWg0dHMoo7SQhfwHH+Jx
	ESUkXcWzPnjba9uRYhOZT3EqUQ8VcO/c2kg6ARdWyl8DedLQ+2KDnCvHXaxxa/Aa
	dSxVofT+ufTB/qPMxuUHHpzyp/T+Jzw7UuEznS9hzGe/NTl62YId1K8ICMbk7dk1
	/hCYZ2S69dUUIceixIGN8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1755824026; x=1755910426; bh=xiR7dnO12e//LZ6ciVJEt7B13MyFzf4nwxT
	to02TC5E=; b=kSZRpcbUcn3WQNsropDDfe2tjZkKnQVtiWP8SEROEPZ0d+Kekca
	mRZBq/T1UGAxegr8Qo7gZIaszxHMoteNHrSkiyfU3HcJ+39BurcMdz5ctdDHcmNA
	t5dw8Or2AFkU04KyiKnfU+vz7bKrMdVTwU1BJkG0sv++mGkVL1q6zzn9bRm0YqlQ
	CnryZZ2UC1s8Rrk+9GhmF9OqeRqBQevvBjpbTBize5fS3FedEdwYZdVxsgoyZQnv
	/jeHfWgMenRns+pFZMJvsHXcyfe+c2InNZnDpiWNlb7PJKFKlrMwgajf6gmQAou9
	0i4A609q4OLAEtSy+mQg6iLb5IUh+RSqnWA==
X-ME-Sender: <xms:mr-naPEkEe0HCFuX_Uud5XND9xItEDEE6v3BY-YY70kxIhFZk-sDZg>
    <xme:mr-naG5Ok9GHaPQG-VUH3u5-E6E6e8y-hM5ZE_fanzzqe-B6k21JKN1R5u4JVyyfd
    pLAr8iKpcjuMA>
X-ME-Received: <xmr:mr-naNtGtx4_0lHBgTM9xWXorGw1RewbKLXgmn6w23sRWNcJtda0U_aGjcvfgmfnnDhjQ7vlP_BGe5PNTfydAFfhPkRYGzwtoso>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduiedvheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueekteet
    gefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomhgrih
    hnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopegrnhgurh
    gvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepjhgsvghulhhi
    tghhsehsuhhsvgdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrd
    igvghnphhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:mr-naP4i16ZU6Y5OZ5X_5yyW0SICgZKg460Qsr5kzWB2XsUMptKZRg>
    <xmx:mr-naAVoyCd91m23-BfqDgWueqLQEf6Q0SBpPorPqq5rWqL2UsAZuA>
    <xmx:mr-naJ_bT8DJ_C-ZbrCXEkxv87J_iglyCTdBv56MWuFbjWn5YXyGbQ>
    <xmx:mr-naElDEhXYJTlGiT2kMPwD1yjUCaOZ0S4TipxsZDudcM5Fhv9CDg>
    <xmx:mr-naCIWEQEQoM-uRFSvykt7PAK7rhKmpKCU0ykKcz87WwOPfMjeD0wA>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 22 Aug 2025 02:53:33 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: S3 regression related to XSA-471 patches
Message-ID: <aKe_jgWBiwqPqt7i@mail-itl>
References: <aJMtPLNqQFbGg5cs@mail-itl>
 <f971f8a8-487e-4b9f-8c75-80ebfe70c3b6@suse.com>
 <aJMyjYfeTL5uPRtk@mail-itl>
 <aJTilUXpchmRq2Ng@mail-itl>
 <4fb544d7-fede-46b8-950e-f9c4af1cb04f@citrix.com>
 <B667172D-84FA-488D-98F9-0D7D34402EF7@invisiblethingslab.com>
 <aJw98srxJKZ2msct@macbook.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+YUKd5AKKhh94ji1"
Content-Disposition: inline
In-Reply-To: <aJw98srxJKZ2msct@macbook.local>


--+YUKd5AKKhh94ji1
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 Aug 2025 02:53:33 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: S3 regression related to XSA-471 patches

On Wed, Aug 13, 2025 at 09:26:09AM +0200, Roger Pau Monn=C3=A9 wrote:
> On Wed, Aug 13, 2025 at 04:53:53AM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> >=20
> >=20
> > On August 11, 2025 3:16:46 PM GMT+02:00, Andrew Cooper <andrew.cooper3@=
citrix.com> wrote:
> > >On 07/08/2025 6:29 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > >> On Wed, Aug 06, 2025 at 12:46:36PM +0200, Marek Marczykowski-G=C3=B3=
recki wrote:
> > >>> On Wed, Aug 06, 2025 at 12:36:56PM +0200, Jan Beulich wrote:
> > >>>> On 06.08.2025 12:23, Marek Marczykowski-G=C3=B3recki wrote:
> > >>>>> We've got several reports that S3 reliability recently regressed.=
 We
> > >>>>> identified it's definitely related to XSA-471 patches, and bisect=
ion
> > >>>>> points at "x86/idle: Remove broken MWAIT implementation". I don't=
 have
> > >>>>> reliable reproduction steps, so I'm not 100% sure if it's really =
this
> > >>>>> patch, or maybe an earlier one - but it's definitely already brok=
en at
> > >>>>> this point in the series. Most reports are about Xen 4.17 (as tha=
t's
> > >>>>> what stable Qubes OS version currently use), but I think I've seen
> > >>>>> somebody reporting the issue on 4.19 too (but I don't have clear
> > >>>>> evidence, especially if it's the same issue).
> > >>>> At the time we've been discussing the explicit raising of TIMER_SO=
FTIRQ
> > >>>> in mwait_idle_with_hints() a lot. If it was now truly missing, tha=
t imo
> > >>>> shouldn't cause problems only after resume, but then it may have c=
overed
> > >>>> for some omission during resume. As a far-fetched experiment, coul=
d you
> > >>>> try putting that back (including the calculation of the "expires" =
local
> > >>>> variable)?
> > >>> Sure, I'll try.
> > >> It appears this fixes the issue, at least in ~10 attempts so far
> > >> (usually I could reproduce the issue after 2-3 attempts).
> > >>
> > >
> > >Can you show the exact code which seems to have made this stable?
> >=20
> > This patch: https://github.com/marmarek/qubes-vmm-xen/blob/7c9e9e312948=
c772d9a68090109964121c1d16fe/0001-DEBUG-S3.patch
>=20
> Hello,
>=20
> Can you test if the patch below in isolation makes any difference?

Seems to help too. At least a test similar as before did not hit the
issue anymore.

> Thanks, Roger.
> ---
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
> index 0fd8bdba7067..9d66db861b74 100644
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
> @@ -718,7 +716,7 @@ int lapic_resume(void)
>          apic_write(APIC_LVTPC, apic_pm_state.apic_lvtpc);
>      apic_write(APIC_LVTT, apic_pm_state.apic_lvtt);
>      apic_write(APIC_TDCR, apic_pm_state.apic_tdcr);
> -    apic_write(APIC_TMICT, apic_pm_state.apic_tmict);
> +    apic_write(APIC_TMICT, 0);
>      apic_write(APIC_ESR, 0);
>      apic_read(APIC_ESR);
>      apic_write(APIC_LVTERR, apic_pm_state.apic_lvterr);
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--+YUKd5AKKhh94ji1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAminv44ACgkQ24/THMrX
1yyseQf9HRRygCMKb1QbMpEg9cCdBsgdMqPc+tedaVvTNfIJa7HrtqNZnBVFf3X5
l250+Cp37M+frqbgw2FVNxUSC31Xb5EivFjath5+d5l1BDKEXRa13kYRNxz4t3Ze
t65Ft0ENoWiA1+pgOEm6dnO5tUH8uJ8XwvUP7/sXhPxfO/ekJGTMULEri9MjJj5f
ZFvinVwXRyJ/C2vHDVjHhSVcau12Mw+UOBoJBw+aRUdkNDgmsYMDZiiLuiJGzyhV
gAWkUtXjoPgTQ4d5Ut8hba48r3Yv0VoDvu9V+3vOqNbcgMi9eVjb9SkOg/3wIssi
hRa4qNCBGQC7MxKRf1C3ILuBHoaM8Q==
=PgF0
-----END PGP SIGNATURE-----

--+YUKd5AKKhh94ji1--

