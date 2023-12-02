Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFB8801EDF
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 22:47:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646258.1008658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9Xp3-0001w8-MV; Sat, 02 Dec 2023 21:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646258.1008658; Sat, 02 Dec 2023 21:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9Xp3-0001u1-Ju; Sat, 02 Dec 2023 21:46:49 +0000
Received: by outflank-mailman (input) for mailman id 646258;
 Sat, 02 Dec 2023 21:46:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pE22=HN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1r9Xp1-0001tv-LU
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 21:46:47 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 482a6787-915c-11ee-98e5-6d05b1d4d9a1;
 Sat, 02 Dec 2023 22:46:44 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4F3AD5C00B3;
 Sat,  2 Dec 2023 16:46:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 02 Dec 2023 16:46:42 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 2 Dec 2023 16:46:41 -0500 (EST)
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
X-Inumbo-ID: 482a6787-915c-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1701553602; x=1701640002; bh=SUki6GjD0JpSAb3vZ0SSAXCuM0HuNlOTJMe
	KHt4lqV0=; b=BdBmSz/L8KFt8vwkM+g505ziRyssjI7gciiK/4mjBvHcK2RsbxD
	634fwXPtFBlllpoeIAZIgplq9Dn0MhvyU+YGaR4PQI+xgMPjj+KovjP++VKykGta
	g5Kn6qXgsY7H5dnikY09iC7upDxznNJfY9vWnMqhr2w/oShO6irZVWH/8PVBKeor
	lQAWFlTA+kQqW+LLh7J6IrK6VZOfkNAlvg2SdGlsqujN/ZtkokjgnyRoPT7O0vlX
	1lxIhE5aOn0znuiwxFprUDQQ9hU59dlbtVIHGdLDn/jSQ23kUlQA7KT7pVwyql0j
	dnCu5HkF7BftEVVfBhZNMDEG8lTDNKSwmLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701553602; x=1701640002; bh=SUki6GjD0JpSA
	b3vZ0SSAXCuM0HuNlOTJMeKHt4lqV0=; b=PMUL3AclGsCP3aQZUNaK1Srx8rtm7
	ViEi5Vl9RxIt4IxxKEm6o3C3MOAVH0LzHcDEixYJ88sXGLtLiWsV8duTWn/7k3DQ
	mjR70FQWXXM1vz5F4/3iZdOvAbc4gil0D4YFOTVL76X9xsS4mQ+QZLL3xRdPLkue
	OvWa3yKnarHFY10Fj+M4LYW6xCALSc6pWK8HRfDT6hxodMdb3VTV5rSfrFE+sY8g
	j8YVMvCjKsopb30NsS25rxkaCGarDF9FMz7kh/WCi3dltfit50BzuYt36xs7gAK1
	eubSSWX77NrSZOaiJL0/JcEq6NY+9UpoSFOH0TtZ+hVnrV2rdAp5fZz+A==
X-ME-Sender: <xms:wqVrZU3UedjdP769zrFw4b5J3HcRDY1XsqjPqVKiBZ8EHgDrixnW1A>
    <xme:wqVrZfGujmWxqbCHWQiK9uu0N0MOSEGYqW1aP5n1kuUfP4o2iESXxXpQwHSSKU6LK
    DhbbXGnvdJErQ>
X-ME-Received: <xmr:wqVrZc5aearkNa4gkWIASk4ZOKo0Oc0rADPNff6BM-UMbXb66ad85t58L13DjBWxyWPWTCfzI6q7ihmloTimUoKPVGfYEjCLcVk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudejuddgudehfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    udelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:wqVrZd0pDDxcbGigki61MJ83f30WXHm7BL5aMdR9_Am42uajeoVVfQ>
    <xmx:wqVrZXElyvjJl6ff2QKTPdGi3KZWrd3nYJJ8NmprRsK0i4Az62rfzg>
    <xmx:wqVrZW8TyI4hAkcf5bIBb4t_mETN3K5ZcLxw8AsWx5T_Kz513QC2Gw>
    <xmx:wqVrZexupR1qgd16cPXTSQngWZYw8HY_D2MzhJVTuG9otmx7rMlf8Q>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 2 Dec 2023 22:46:38 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Linux 6.7-rc1+: WARNING at drivers/xen/evtchn.c:167
 evtchn_interrupt
Message-ID: <ZWulvo8Frbm2WNEk@mail-itl>
References: <ZWf0sWey05VnpH7X@mail-itl>
 <258abfda-5f71-4e75-a3a5-abdad85a85f3@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Rr1ym04J3vGeYfwG"
Content-Disposition: inline
In-Reply-To: <258abfda-5f71-4e75-a3a5-abdad85a85f3@suse.com>


--Rr1ym04J3vGeYfwG
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 2 Dec 2023 22:46:38 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Linux 6.7-rc1+: WARNING at drivers/xen/evtchn.c:167
 evtchn_interrupt

On Fri, Dec 01, 2023 at 09:29:30AM +0100, Juergen Gross wrote:
> Hi Marek,
>=20
> On 30.11.23 03:34, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >=20
> > While testing 6.7-rc3 on Qubes OS I found several warning like in the
> > subject in dom0 log. I see them when running 6.7-rc1 too. I'm not sure
> > what exactly triggers the issue, but my guess would be unbinding an
> > event channel from userspace (closing vchan connection).
> >=20
> > Specific message:
> >=20
> > [   83.973377] ------------[ cut here ]------------
> > [   83.975523] Interrupt for port 77, but apparently not enabled; per-u=
ser 00000000a0e9f1d1
>=20
> Just a guess, but I think this might happen when the vchan connection
> is closed while there is still some traffic. This could result in events
> triggering in parallel to unbinding the event channel.
>=20
> Could you please test the attached patch (only compile tested)?

Unfortunately that doesn't help, I get exactly the same traceback.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Rr1ym04J3vGeYfwG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmVrpb4ACgkQ24/THMrX
1ywpMwf/Zezy87gjaRQddAkK1AEyoFPk7kSEuGbSdUxC3HZumzXkkisRRFgnTAm3
OEk+vb0uZYO2ooSzzHGSWdRtMHWLXrPU8R/nnWcwuxN3BJd1mKXg4jgN7qWEcBoo
UgtPhzzrIcorc4U36NkiFeYgU/5x+3znJ3/KTlMhUuKxztewsR1f1R2jp77NkHIy
m2Vpk7vTYe/sfVHLzrbT4dRdLOj6ALIC+nCTCkxyp92AP95ciCw3YY1lWNZxTA0a
FZsks5sVJJyi9+h4gk6bl39ymSnx5+N0/oHajDL9rJh4OjsKVreT3m2KXJlDoLu5
GL6/NoYevgznZXxOEoz+DghSTPjFwQ==
=lqOa
-----END PGP SIGNATURE-----

--Rr1ym04J3vGeYfwG--

