Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0974F3C9D
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 18:25:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299212.509732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nblyu-0003CN-1u; Tue, 05 Apr 2022 16:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299212.509732; Tue, 05 Apr 2022 16:24:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nblyt-00039E-Um; Tue, 05 Apr 2022 16:24:35 +0000
Received: by outflank-mailman (input) for mailman id 299212;
 Tue, 05 Apr 2022 16:24:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AE9i=UP=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nblyr-000398-OH
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 16:24:33 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df8cbe73-b4fc-11ec-8fbc-03012f2f19d4;
 Tue, 05 Apr 2022 18:24:32 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 5A95A5C012B;
 Tue,  5 Apr 2022 12:24:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 05 Apr 2022 12:24:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Apr 2022 12:24:30 -0400 (EDT)
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
X-Inumbo-ID: df8cbe73-b4fc-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=yAcmsz2yWk9FuhEPI
	uoEqnL5whJEgeRmlp0ZgN3Xy94=; b=aGgpcVvJKsUizAhL57akxTzQSAyg/yfsK
	wKhbfPzbtGuKiVMKutmDi+yoAWDo73Ut3cb0Q9yIKaybRy5WYG+bnm3MuDIIm8J7
	usgxAAJF3hoorjwjv+0cFGnMl6DHVsX3Qk3zQKK3tU4JZRW1Lj3e/CdXHMl3mkau
	24rRNF4d3ZAlGarEoW7RYNNSP7L4+fbcGRrgjlCcIFlgfX8axtdH1g3OUJ6UuFfq
	7gpkfnFYif1wYWJSwvTnTdQrVZ98Hs40R8kZtG6CLw2spY3xhzkXTx3nMD/7s/Xf
	HoLKErr2aD/wWssHvhvJbh2/l4dO1kpAfH8y/jvrVF6gNN6mz9uxg==
X-ME-Sender: <xms:P21MYuTkDgVIK-EURPa7XfzD4zw8R_ezI0cTC1GQOU2BeRs_UkAzAw>
    <xme:P21MYjxpIotcqhpkq34l_FHFzEwPSUbs2EXODjT7GDTrCUI5odQZb8tiOf3OCmNQJ
    Wj5AzaWh8dfXA>
X-ME-Received: <xmr:P21MYr0O4yrhtgDsK6iXA45GYZyUYjgY6C1c9OraAhH2WCNPFMMVvvGdfFWK_PYDABn8KWZye5sw1JNHaO52ThehfxIgS06cPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejgedgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:P21MYqCACgOLMwYK-rrStXDMI_50t-lMogVrOPKRQ-3BgV84x0R4iw>
    <xmx:P21MYnhIzEpT-BFagczzlemtSnTHUCYyxre5CBv9fTuOpQeIVnHKCg>
    <xmx:P21MYmpHncHQxhfGJQFQ3hoYEIBD8TVadNt0l386WxwiODBbtGqaSw>
    <xmx:P21MYpcHPDj8ArB7UaUHQbmhWQAMdb-sfU3Crp7keRxpyB6m4QikKA>
Date: Tue, 5 Apr 2022 18:24:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Increasing domain memory beyond initial maxmem
Message-ID: <YkxtOxOCY8nxy0Gt@mail-itl>
References: <YkUlLvnEDdc5hwN4@mail-itl>
 <2684376b-3ae6-a2b7-581f-2bd38ab6056b@suse.com>
 <YkWYGFJ/Cl+B2C37@mail-itl>
 <362b6115-e296-e01e-520f-31a0826426eb@suse.com>
 <YkWgQNKK7SarjKDN@mail-itl>
 <a9325c01-f6bd-46e8-d730-3f18b71b9969@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BsNsRvDM3yT93dYZ"
Content-Disposition: inline
In-Reply-To: <a9325c01-f6bd-46e8-d730-3f18b71b9969@suse.com>


--BsNsRvDM3yT93dYZ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 5 Apr 2022 18:24:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Increasing domain memory beyond initial maxmem

On Tue, Apr 05, 2022 at 01:03:57PM +0200, Juergen Gross wrote:
> Hi Marek,
>=20
> On 31.03.22 14:36, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Mar 31, 2022 at 02:22:03PM +0200, Juergen Gross wrote:
> > > Maybe some kernel config differences, or other udev rules (memory onl=
ining
> > > is done via udev in my guest)?
> > >=20
> > > I'm seeing:
> > >=20
> > > # zgrep MEMORY_HOTPLUG /proc/config.gz
> > > CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> > > CONFIG_MEMORY_HOTPLUG=3Dy
> > > # CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
> > > CONFIG_XEN_BALLOON_MEMORY_HOTPLUG=3Dy
> > > CONFIG_XEN_MEMORY_HOTPLUG_LIMIT=3D512
> >=20
> > I have:
> > # zgrep MEMORY_HOTPLUG /proc/config.gz
> > CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> > CONFIG_MEMORY_HOTPLUG=3Dy
> > CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=3Dy
> > CONFIG_XEN_BALLOON_MEMORY_HOTPLUG=3Dy
> > CONFIG_XEN_MEMORY_HOTPLUG_LIMIT=3D512
> >=20
> > Not sure if relevant, but I also have:
> > CONFIG_XEN_UNPOPULATED_ALLOC=3Dy
> >=20
> > on top of that, I have a similar udev rule too:
> >=20
> > SUBSYSTEM=3D=3D"memory", ACTION=3D=3D"add", ATTR{state}=3D=3D"offline",=
 ATTR{state}=3D"online"
> >=20
> > But I don't think they are conflicting.
> >=20
> > > What type of guest are you using? Mine was a PVH guest.
> >=20
> > PVH here too.
>=20
> Would you like to try the attached patch? It seemed to work for me.

Unfortunately it doesn't help, now the behavior is different:

Initially guest started with 800M:

    [root@personal ~]# free -m
                  total        used        free      shared  buff/cache   a=
vailable
    Mem:            740         223         272           2         243    =
     401
    Swap:          1023           0        1023

Then increased:

    [root@dom0 ~]$ xl mem-max personal 2048
    [root@dom0 ~]$ xenstore-write /local/domain/$(xl domid personal)/memory=
/static-max $((2048*1024))
    [root@dom0 ~]$ xl mem-set personal 2000

And guest shows now only a little more memory, but not full 2000M:

    [root@personal ~]# [   37.657046] xen:balloon: Populating new zone
    [   37.658206] Fallback order for Node 0: 0=20
    [   37.658219] Built 1 zonelists, mobility grouping on.  Total pages: 1=
75889
    [   37.658233] Policy zone: Normal

    [root@personal ~]#=20
    [root@personal ~]# free -m
                  total        used        free      shared  buff/cache   a=
vailable
    Mem:            826         245         337           2         244    =
     462
    Swap:          1023           0        1023


I've applied the patch on top of 5.16.18. If you think 5.17 would make a
difference, I can try that too.


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--BsNsRvDM3yT93dYZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmJMbTsACgkQ24/THMrX
1yxiHQf9FmmIf90+d5o+tImIdROhgp1rah+u3l/dgD4YZMT0qU+mzBSgcm2Wkqou
rM6FwhhoaPN7kBbNBlwrYRS50OO7lEE//S9uinQZw6Fqp5hWOyMNGjbN3hFqd1qe
FiN8accuLlAoKzAGlkoiFD4WMuQfVwxDAH08F7NDXMEeoO0Fm/5T2gaCVT81DAbv
JaLGeBZ09TAyZAPLrxdCmLUZXDh4xsXREi8cQ32U0ZBSM/r1PMEZ5SNz3tYaswK+
DOMHEEbfSpZUEnqLqah+bLBOp3KM38CIoGNPRZ+IT+oYKb01dnSgHHXLfUnTYi8t
AdmI2t8bSKhzokOKhD1htdA+b3fqPQ==
=jmLo
-----END PGP SIGNATURE-----

--BsNsRvDM3yT93dYZ--

