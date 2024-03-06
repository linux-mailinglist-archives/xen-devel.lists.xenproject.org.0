Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 970B18741FF
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 22:32:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689522.1074594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhyrS-0008Bi-Mp; Wed, 06 Mar 2024 21:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689522.1074594; Wed, 06 Mar 2024 21:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhyrS-0008AD-KB; Wed, 06 Mar 2024 21:31:38 +0000
Received: by outflank-mailman (input) for mailman id 689522;
 Wed, 06 Mar 2024 21:31:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qOHf=KM=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rhyrQ-0008A2-ND
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 21:31:37 +0000
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com
 [103.168.172.150]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6cff01e-dc00-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 22:31:33 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfout.nyi.internal (Postfix) with ESMTP id 004B71380101;
 Wed,  6 Mar 2024 16:31:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 06 Mar 2024 16:31:32 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Mar 2024 16:31:30 -0500 (EST)
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
X-Inumbo-ID: e6cff01e-dc00-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1709760691;
	 x=1709847091; bh=DORPyG1rT9K1X/ITePyxsRS31apnbdqz9ZRD2mr6WPw=; b=
	JHJW5n6L9szrMIB1x645aoVbBPtDKERwhzqvofA43FAt7lmETdc0QstN840ZMzgz
	RF155ngC6cDMOYAuvtZJXhcg8ot5+bId5oQQDJQd91wTL8qk2s/P4WwsG+33uM54
	eiEex9XuBE563MfD7mSzZPW1e+3JR2qgzRU4YmNPsTrbrmeymsZEg6e4UDupezle
	Hvdmqp49GPw+/iv8JkS1XzSnIcdn8q4kS2QjOuS2Fgzj3SggqDsWpaJAd2bt39WW
	ZNdsyS6aS8X0L4QZMImctJIUyTUhie86CgdzaBUNN6ocCYAysBREZj6rbcQhYMGB
	Ezplcle3ESJjtU1L+4MVfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709760691; x=1709847091; bh=DORPyG1rT9K1X/ITePyxsRS31apn
	bdqz9ZRD2mr6WPw=; b=GPZZavt90866rF1elW2YKSy3FVp8i3W/Ep4vxBh+6yAC
	APjNJZnRN2mGpYuREc9JS3rMNI4gNew4KVBtqSMRLOPoQNaxJ+8IZPUYOaXsTMaF
	Tw7WHmG5VAgmU0Kp2Q/ydiQt8GB1fdR47gZfBkkcUjXQ4nlLu+i+Ika9d2s6ZyfV
	/I1Ho9h2pqbnco6S8qYe4mb+UixPGx/ajipApzE5eGFg7i6SY9Zc6TUH1vtEwtbE
	kaZLyDFUO2o3bAJtultbAeEKfxsuklAhN2vo0xxNxMPBiQsoQA1cZy2Tn9Z5NveY
	wT3UxHTMbYxDrkItgaxjIqT52AhMBlYP0kGi6CZVLg==
X-ME-Sender: <xms:s-DoZQ1IrEgCRhr3CtM5oSZICxeN3usHMT0FR5hDZPmIZMPu9GzLjg>
    <xme:s-DoZbF3CLT_P6Er2eUIC94mQakwuS-wlavuK6nAOrZB4lbNMzk-t6FbIhRV_Zqqh
    _e8X7otMXONxQ>
X-ME-Received: <xmr:s-DoZY5UsA8rgMeNms9c_5NAZfRemeVCoJNrv5Qri-Bc_O_7f8heqc9JvLpFpZgs2froLhert35cZbpR9n5dUDrUP_SAjZrFeA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledriedugddugeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepfeek
    hfeffeegjeduleetffejtedtjeeuvdekgedtvdfgleekveehjeeuveehhedvnecuffhomh
    grihhnpehfrhgvvgguvghskhhtohhprdhorhhgpdgrmhgupghsvdhiughlvgdrphihnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrg
    hrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:s-DoZZ0A13Xhd_jpm6fAkExD-rIp4ZFHjmIQeBAOuoaCBM_8WxclGA>
    <xmx:s-DoZTEVGEo72uObdrKkCmOK_dMNrVHwPbbNlHrKE-y0mHqy_Cn6bQ>
    <xmx:s-DoZS-oXbcnx1iNEVXHvKUfSbUAuYRv_UnMJR6WjJhCo8EEnsyEdQ>
    <xmx:s-DoZXj-hazmnsH5r7KZ3H1p5Yp6b3kWmlWLQoNxd4w6IKIl2pGAOg>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 6 Mar 2024 22:31:28 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: =?utf-8?Q?S=C3=A9bastien?= Chaumat <euidzero@gmail.com>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
Message-ID: <ZejgsTDBmsnmKeiG@mail-itl>
References: <CAKm-Umb=kGFqc5je9E3bbfQ0bcbZeY_Ntv5JDmO-vXj3N0MvPg@mail.gmail.com>
 <CAKm-UmZ113q-a8wEE5yo0OPPM3JpNqJzKaU1eNiCzT2YkGU0pQ@mail.gmail.com>
 <CAKm-UmaG3KRtDkrEH7cNgLkRkRs2HG357S=BUjomhN6Ad-AkCQ@mail.gmail.com>
 <a3472888-7bfb-4889-8ccb-58384afff324@amd.com>
 <CAKm-UmYyxC5SrqdW3MYj326J7CCGRHZpc1+D0Dezd27z++3JJg@mail.gmail.com>
 <19852f4d-fbeb-4314-a2cb-ab3f05da13ba@amd.com>
 <CAKm-UmZm1d8Ehusoh5HNOST+0Dek7+vLQSKbVduz40BdHueiDA@mail.gmail.com>
 <7c2f9983-a0b5-41f7-81cb-f196787f3dfb@amd.com>
 <CAKm-UmaHA5Xgmneqv9zgEUN1eejqB_1aZ4Kd5MxWttoyVLThwA@mail.gmail.com>
 <2a609713-3eec-438e-80af-c1dfcfe598c4@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HT33YYw7sRW++IZl"
Content-Disposition: inline
In-Reply-To: <2a609713-3eec-438e-80af-c1dfcfe598c4@amd.com>


--HT33YYw7sRW++IZl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 6 Mar 2024 22:31:28 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: =?utf-8?Q?S=C3=A9bastien?= Chaumat <euidzero@gmail.com>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD

On Wed, Mar 06, 2024 at 02:37:20PM -0600, Mario Limonciello wrote:
> On 3/6/2024 14:34, S=C3=A9bastien Chaumat wrote:
> >=20
> >=20
> > Le=C2=A0mer. 6 mars 2024 =C3=A0=C2=A019:51, Mario Limonciello
> > <mario.limonciello@amd.com <mailto:mario.limonciello@amd.com>> a =C3=A9=
crit=C2=A0:
> >=20
> >     On 3/6/2024 12:49, S=C3=A9bastien Chaumat wrote:
> >      >
> >      >
> >      > Le=C2=A0mer. 6 mars 2024 =C3=A0=C2=A019:08, Mario Limonciello
> >      > <mario.limonciello@amd.com <mailto:mario.limonciello@amd.com>
> >     <mailto:mario.limonciello@amd.com
> >     <mailto:mario.limonciello@amd.com>>> a =C3=A9crit=C2=A0:
> >      >
> >      >=C2=A0 =C2=A0 =C2=A0On 3/6/2024 12:05, S=C3=A9bastien Chaumat wro=
te:
> >      >=C2=A0 =C2=A0 =C2=A0 >
> >      >=C2=A0 =C2=A0 =C2=A0 >
> >      >=C2=A0 =C2=A0 =C2=A0 > Le=C2=A0mer. 6 mars 2024 =C3=A0=C2=A018:33=
, Mario Limonciello
> >      >=C2=A0 =C2=A0 =C2=A0 > <mario.limonciello@amd.com
> >      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0Also; I'd be really int=
erested to hear what happens with
> >      >=C2=A0 =C2=A0 =C2=A0s2idle with
> >      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0Xen
> >      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0now (if it works).
> >      >=C2=A0 =C2=A0 =C2=A0 >
> >      >=C2=A0 =C2=A0 =C2=A0 >
> >      >=C2=A0 =C2=A0 =C2=A0 > suspend to RAM now works :)
> >      >
> >      >=C2=A0 =C2=A0 =C2=A0Do you see /sys/power/suspend_stats/last_hw_s=
leep increasing
> >     with your
> >      >=C2=A0 =C2=A0 =C2=A0suspend cycle?
> >      >
> >      >
> >      > No,=C2=A0 it does not increase (0).
> >      >
> >=20
> >     OK, then in that case I suggest you run
> >     https://gitlab.freedesktop.org/drm/amd/-/blob/master/scripts/amd_s2=
idle.py <https://gitlab.freedesktop.org/drm/amd/-/blob/master/scripts/amd_s=
2idle.py>
> >     in the hypervisor to find out what's wrong.
> >=20
> >=20
> > It fails with xen (not bare metal) during the prerequisite tests :
> >=20
>=20
> The script might need some modifications for tests that don't make sense =
in
> the context of Xen.
>=20
> > =E2=9C=85 GPIO driver `pinctrl_amd` available
> > Traceback (most recent call last):
> >  =C2=A0 File "/home/sch/Downloads/amd_s2idle.py", line 2447, in <module>
> >  =C2=A0 =C2=A0 test =3D app.prerequisites()
> >  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^^^^
> >  =C2=A0 File "/home/sch/Downloads/amd_s2idle.py", line 1938, in prerequ=
isites
> >  =C2=A0 =C2=A0 if not check():
> >  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^
> >  =C2=A0 File "/home/sch/Downloads/amd_s2idle.py", line 826, in check_msr
> >  =C2=A0 =C2=A0 val =3D read_msr(reg, 0)
> >  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^^^^^^
> >  =C2=A0 File "/home/sch/Downloads/amd_s2idle.py", line 813, in read_msr
> >  =C2=A0 =C2=A0 val =3D struct.unpack("Q", os.read(f, 8))[0]
> >  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^
> > OSError: [Errno 5] Input/output error
> >=20
> > Last line in the log is :
> > 2024-03-06 21:29:33,146 DEBUG: Lockdown: [none] integrity confidentiali=
ty
> >=20
>=20
> Do you have userspace MSR support compiled in?  If not; that could explain
> that problem.  But it's very unlikely you changed the MSRs.
> For the purpose of finding where the suspend problem is, I'd comment out
> that specific check for now.

The s2idle isn't supported in Xen yet. Only S3 is. In fact, I have some
work-in-progress patches for that, I may try testing them on this
system.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--HT33YYw7sRW++IZl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmXo4LEACgkQ24/THMrX
1yx74wgAiyFwN0neiD07/K9M1vgr92W7f1Sr/u3jmLZl1/OM2eHti44gl4G4ClEP
le7TWLJw65QNKIAWnaHJuQdzTpm8+Xw5b5mQVnl9bKI9ixvC/H+WycuW25EQtv3z
fykNDxvmz5x+hPY4hM+64jPTD0RcVmgkqrPFXUEkonPHjAiHiGUp9J2gmu9KcFDW
cwUk5l7znUZdPC9SvUpTgJKVGf9wcmZCg5rXycij8Jvgp7d4SYlL2YmO5NrJC8E8
iFE7USj6sYLiJIWPki3Gmy2AC540lA/GeXBlcrtOaZHXZxv3bYzQiEi7Xuylfewi
G4odHBLab4gkG/YtQnujTj7GIJhOGw==
=MmtC
-----END PGP SIGNATURE-----

--HT33YYw7sRW++IZl--

