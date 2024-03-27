Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 142F488D3A0
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 02:14:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698278.1089768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpHqr-0004V9-SE; Wed, 27 Mar 2024 01:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698278.1089768; Wed, 27 Mar 2024 01:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpHqr-0004SJ-Oo; Wed, 27 Mar 2024 01:13:13 +0000
Received: by outflank-mailman (input) for mailman id 698278;
 Wed, 27 Mar 2024 01:13:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Klda=LB=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rpHqp-0004Qf-Eq
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 01:13:11 +0000
Received: from fhigh5-smtp.messagingengine.com
 (fhigh5-smtp.messagingengine.com [103.168.172.156])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2adcace1-ebd7-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 02:13:07 +0100 (CET)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 1315D11400F5;
 Tue, 26 Mar 2024 21:13:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 26 Mar 2024 21:13:06 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Mar 2024 21:13:04 -0400 (EDT)
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
X-Inumbo-ID: 2adcace1-ebd7-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1711501986;
	 x=1711588386; bh=duPM4l7vESI6W2wpgUYG6yFDLRrQw0j3QbzzhqkGPoI=; b=
	XUMS7BfJqc1oRqz15fu7rAlbhGdaGgYiIB/JyZRGJCsA/fCdYy2xLCGKHw4WHi3p
	5abMFAq+Ztstn7j1G3hfI4d06Me4Gqshv0M4d8MAkOJzCmLMCyqLnrSj1+5S1nis
	r4mIKk/q9HAEIz3I6lWgbSiWuZ+Dh1pOSphUL1fnE2ZagS8n6ZwoDOXydPCVcOVv
	A08Q7UpzIrTBi+QnYK20IkG2YIJhHYcVKr8IkYet6hWKVcEE/TLzzx4Y1D4SwtuN
	pYWbUBOkOcvVj17EqkZDtrsbiNw0POofGB/VH8BmlA79Wlg8thLxs3QxvkZBJjq4
	eX+aROXwf7wAJOzhHX4jcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711501986; x=1711588386; bh=duPM4l7vESI6W2wpgUYG6yFDLRrQ
	w0j3QbzzhqkGPoI=; b=rNV+BPWovfV2TSrKVM0JPoIY3AdEdAEUBOnw434PCKG8
	hF2R4TnNDJXZ8qgqsCXOqMychXD0VZ/ZCsMRTwGngjBPY1N9b7EjPioZaZrU4vM8
	VOKXQgT8P12SSLysjy4BWXoYlXtKRIthjDJhXPN5I0Km8KC9GVBBDYYf4WfnJ4rl
	feW5DjbiwA3LCvIJGXp0FCPuhmMbK78JX3lResk3anZI0mL7XtqVHqX8wdWxYRzC
	aI5lY8qHkHwmD1V8RGtS1XFlBfoAV+MkV3C19okIMAG0lCf7gzEVWobUQnai4T/Z
	oGEdZ8gyvOnjdAR4Fx7bc909mThk4BRZuucHTNHVFg==
X-ME-Sender: <xms:oXIDZgatEUoV61h3-u018HcyIEzG_ZmOll4ij3m4oDvc_mgp7gKrKQ>
    <xme:oXIDZrYreGi78Adqr8rNNaz2kLY8kBuzfj7YTL_tDCJutM7REQBPXndx8pGibgBHp
    Jdzu8maCQLnqA>
X-ME-Received: <xmr:oXIDZq94mIn3YI-U6iJLJZ0n_GEc2HIh_7khCgIogPxwbiuJx9nN7vtOFEV77-FZkuJRxoWwkNfOgx_Bi8T5jtZeGN6ZhrUExw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddugedgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:oXIDZqoIkNqMIvbnSF-p6uZ204bNYJjxVREhCSf4cYx16_wzXN3sHQ>
    <xmx:oXIDZrowGBwHXlwODyHLjRpSMxFD10CWA0vtB3Q_GSmrh2_G04qGaw>
    <xmx:oXIDZoR3cmpnX-u5o4ALpmwcbpbNKkaHJdjLvzHnfyHlKcnn1Y3Kbg>
    <xmx:oXIDZroMa0Kqhs5oxoYxuLtDcSlsuuTYdVl31UNzWLTnVnSsD3FoZw>
    <xmx:onIDZsdf_ENd3LGlxPLKhdn50VAIrSBClrGhXlYGEqyMCGysHii6CQ>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 27 Mar 2024 02:13:02 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: qemu-devel@nongnu.org, Jason Andryuk <jandryuk@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/2] hw/xen: detect when running inside stubdomain
Message-ID: <ZgNynlHAAuFA1vTy@mail-itl>
References: <20240305191312.321127-1-marmarek@invisiblethingslab.com>
 <a6345b81-5c67-4c05-acff-f73ceea904ad@perard>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L+9mmUR3Q4Dfquvs"
Content-Disposition: inline
In-Reply-To: <a6345b81-5c67-4c05-acff-f73ceea904ad@perard>


--L+9mmUR3Q4Dfquvs
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 Mar 2024 02:13:02 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: qemu-devel@nongnu.org, Jason Andryuk <jandryuk@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/2] hw/xen: detect when running inside stubdomain

On Tue, Mar 26, 2024 at 05:06:50PM +0000, Anthony PERARD wrote:
> On Tue, Mar 05, 2024 at 08:12:29PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
> > index 124dd5f3d6..6bd4e6eb2f 100644
> > --- a/hw/xen/xen-legacy-backend.c
> > +++ b/hw/xen/xen-legacy-backend.c
> > @@ -603,6 +603,20 @@ static void xen_set_dynamic_sysbus(void)
> >      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_XENSYSDEV);
> >  }
> > =20
> > +static bool xen_check_stubdomain(void)
> > +{
> > +    char *dm_path =3D g_strdup_printf("/local/domain/%d/image", xen_do=
mid);
> > +    int32_t dm_domid;
> > +    bool is_stubdom =3D false;
> > +
> > +    if (!xenstore_read_int(dm_path, "device-model-domid", &dm_domid)) {
> > +        is_stubdom =3D dm_domid !=3D 0;
> > +    }
> > +
> > +    g_free(dm_path);
> > +    return is_stubdom;
> > +}
> > +
> >  void xen_be_init(void)
> >  {
> >      xenstore =3D qemu_xen_xs_open();
> > @@ -616,6 +630,8 @@ void xen_be_init(void)
> >          exit(1);
> >      }
> > =20
> > +    xen_is_stubdomain =3D xen_check_stubdomain();
>=20
> This isn't really a backend specific information, and xen_be_init() is
> all about old backend implementation support. (qdisk which have been the
> first to be rewritten doesn't need xen_be_init(), or shouldn't). Could
> we move the initialisation elsewhere?

I can try to move it, sure.

> Is this relevant PV guests? If not, we could move the initialisation to
> xen_hvm_init_pc().
>=20
> Also, avoid having xen_check_stubdomain() depending on
> "xen-legacy-backend", if possible.
>=20
> (In xen_hvm_init_pc(), a call to xen_register_ioreq() opens another
> xenstore, as `state->xenstore`.)

And xen_register_ioreq() calls xen_be_init() anyway, so it wouldn't
change much in practice (at least for now)...

> (There's already been effort to build QEMU without legacy backends, that
> stubdom check would break in this scenario.)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--L+9mmUR3Q4Dfquvs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmYDcp4ACgkQ24/THMrX
1yxUTwf9GlCojUIfNlirgs+bpCQz7TgUrggQ4b7Pspee9vb/Eer1+K6qseZ9wyNj
s15Pjnp+BjHBeisOJ1a5QP0JZ/eqzm1ygdRDzkNgLjLUn0SwT+v1BqWSgGLGDIFg
l28LFGFWaWwauzehqi8v8uoQxJrlGksAEpHZaKumd2DniCw1TJHX832oz5Nlxhhx
ND1OkAQYDyf6VpW8VpJP7R+eM/A6sMGCkDRaoQGmRNeszAsEaM5vXYb9I1A5mKAR
S+Hjp4GF4mSshXfKQozp92CCjIF+rOFaDeaMUsyuNQybtHWVxVFFAmPSW0xpecDq
Jz49s+i/TPT79jUnVWmkMfpng6x4dg==
=kQYH
-----END PGP SIGNATURE-----

--L+9mmUR3Q4Dfquvs--

