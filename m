Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LJbLD6EcUWob/gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 18:24:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8072473C8D9
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 18:24:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm2 header.b=c4XGO8aQ;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b=BdFRIVFL;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1359639.1613132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiE0q-0006F8-Lc; Fri, 10 Jul 2026 16:23:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359639.1613132; Fri, 10 Jul 2026 16:23:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiE0q-0006CQ-Ir; Fri, 10 Jul 2026 16:23:40 +0000
Received: by outflank-mailman (input) for mailman id 1359639;
 Fri, 10 Jul 2026 16:23:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wiE0o-0006CF-IO
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 16:23:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiE0n-00023n-Fc
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 18:23:37 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a511c6b-2eae-0a2a0a5409dd-0a2a450cdb76-30
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 18:23:37 +0200
Received: from [202.12.124.158] (helo=fhigh-b7-smtp.messagingengine.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a511c87-e897-0a2a450c0019-ca0c7c9ed811-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 18:23:36 +0200
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id E9A947A0118;
 Fri, 10 Jul 2026 12:23:34 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Fri, 10 Jul 2026 12:23:35 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jul 2026 12:23:33 -0400 (EDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1783700614;
	 x=1783787014; bh=MmR78G3T+lvBwHqODoEmdnObjKdvoJoWCRwBlQzeBhs=; b=
	c4XGO8aQSYRrJmiior7VnvVVi2Wx0jXHlJTcyxScxtpDqhRkroeOnDR/YBUeNCxV
	2atweWl7Trr491QeSg2fb44ppc+yaTjzeJj9Oi1bIUxJ/vvJLYFmPcTOcSSuqrsp
	dkPir3byOGSPdIiUTlcId4Z80X6hGtuYRqTQgarqfcXrl621NcAi+s2qHkTKo2dT
	9bjOc8vchlMuARRaoeQ7/453rOGlrwwDoQv2OQl66skMzZrvX8oEzheB0uOeMRKp
	weUeHgDp7A4P1FfpT2z+6hmMNj6eBaieIQY/JJB7ZKcoSpXW9SU1luodgUlqJUHP
	cCcqWL0l8C2qvusdUgEJfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1783700614; x=1783787014; bh=MmR78G3T+lvBwHqODoEmdnObjKdvoJoWCRw
	BlQzeBhs=; b=BdFRIVFLDfKxHsXmRNIhUWb4jJ2xHz/GZVD47tH09Pciv+Kjj13
	A6nd2P4vv/zVnYkk2EbDfLuzGHdO9SA0ncbh7hA6cE3hMlpJq3IbT9DEFMLpQZtl
	ENJaKq4FAYZJ+jaTkcMiFBCmtLuxV+lVAl1e09UphRjZaLFfwXfiH58LxeoH060b
	1HzZT3/NeBrc8CD5hI4+BmHA5BsfSErENRMPnGjb0+Vvctomg5Ooj7KZ1FTRtaS2
	PmJWZIBn/469RuKC3xlhPkJgzNnb9qp6+Y6gkNFh1Q/vdUmAu6x+IbDRKrXvZ55P
	J3zsTYzp7JqpLpt5yACqM5zDHWAXiFWImTw==
X-ME-Sender: <xms:hhxRar23egHFMr9glz7UoEB2VcUJ4Pkrz5mssSXDYM6HleAw4ld6Cw>
    <xme:hhxRahHKvo0AXXeIX1sMq7gHNggx1lz5HCVwVxIyPBIr_5BKzJ3XNtBw6vcQP-QUw
    JouqHZVTC8GVY2gkrr4y0Vabt9Pe86KP8ZjK888k2_d8lrN>
X-ME-Received: <xmr:hhxRag5dXTcFMRmfm_zW-yG8lM9hhzT_lj0KBJkIGCrnGrw_srY8m_HMgrUr1ZZ6edOM0-nbMfnYCE1zCXVuNXUt0B82o4V8CGQ>
X-ME-Proxy-Cause: dmFkZTGo7G38IFv8/Lv8cP2oRxGJ4HQZ/2jElO3cuPpGGE8ZxY4aOMunllKuOtIgoM90i4
    1SfJNpfSHsQkbv1YkSdXVgu5dwluneVmjBIyTLs1zbB1P6G0AOkU6zMJaOJdS6Xj+JwbWZ
    8uAjmLOhAJeFNjDbwvbLfez5dwtNldP/pP49FqIJ6W4klhE1A94DHgahOZxRE+N5OgbBD7
    Y2ncwd3f6jQPPYVIEIVkYJGouCzMwkX3YLOHC0x+Gmu3Hu4M2J07h650sGlj0w69zzh+Xj
    9MoMnM5KOM8CbT2PFW9yZFXuyZlZ7s7mTwUdmT4OgrtNBhZoba29wEO3f8HreeI09dMHif
    p95ArYWP1A/gNjy1er9Zhs7hUyzPoF5FhCdf8HVkNfOfhZP3zupjAFFgOJMO2q56tBjjIX
    JTkYIFSddJku1JCRGQeVi9VP7e1WHFvpk9tk142m/hIAIFruF4hQknyqB/hfWd8dBDAXFE
    6IeSqkwr6zFKUnRMcIGBekTiedxfHA6lAJzqmpcFXaqQR3WKBOlJFu98uH1MccCX9iuT/2
    CrVjZxpunosFrGipkZ4XgGeMQ6fNF5CLQSMFjAxKZxmj73SLXoQYsP2QWfi5sTPtQPcllQ
    raYiv071RyiQrgtVd1qhCOCzvAxWgvWKmftwWJdrLF/ufHZ/ms5hu7aGVAMg
X-ME-Proxy: <xmx:hhxRavtAYzok_6zd4-kgUUPnJZrqOP6rzqt99NzIP967tCXg2sgZSQ>
    <xmx:hhxRap5iSUcxz6Kd4hgbd6anVP_u2BXJJL4SPoQEMVgZMyZQpM8Gag>
    <xmx:hhxRaiU_F4W5z2idRyn688vqiITiegBCBGTP09g65aj8F87thU25xQ>
    <xmx:hhxRaj80qGFAtvhBUNQeo70teM4QtQFpeaMNzRDireoqFaN8fO5VOg>
    <xmx:hhxRalDED-LYJaLtUeeYJ5NVekDv-pwOeXUcdrYLCNCk5k6fh31DZbKB>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 10 Jul 2026 18:23:31 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/2] CI: enable FRED on PTL runner
Message-ID: <alEcgxY6fioaJFts@mail-itl>
References: <cover.2e3d53e8679d3686e3f6579df0c7acb781c92701.1783626895.git-series.marmarek@invisiblethingslab.com>
 <6f41b87651f282ac118c17b1562251f7d74c9496.1783626895.git-series.marmarek@invisiblethingslab.com>
 <ccc8ef59-d956-4a70-9fb9-bba241087c16@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x+4OZEirrDOOzs7q"
Content-Disposition: inline
In-Reply-To: <ccc8ef59-d956-4a70-9fb9-bba241087c16@citrix.com>
X-purgate-ID: tlsNG-d25034/1783700617-577676B2-02089C4A/0/0
X-purgate-type: clean
X-purgate-size: 4830
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm2];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:cardoe@cardoe.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:from_mime,invisiblethingslab.com:email,invisiblethingslab.com:dkim];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8072473C8D9


--x+4OZEirrDOOzs7q
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 18:23:31 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/2] CI: enable FRED on PTL runner

On Fri, Jul 10, 2026 at 05:15:17PM +0100, Andrew Cooper wrote:
> On 09/07/2026 8:57 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > Add new job-level EXTRA_XEN_OPTS variable, in addition to CONSOLE_OPTS.
>=20
> This is stale, but easy to adjust.

What do you mean stale? It is yet another job variable for adding Xen
options (previously it was only CONSOLE_OPTS).

> > For now, add "fred" to all jobs running on PTL, but separate variable
> > allows customizing it later on per-job basis.
>=20
> "FRED is not yet enabled by default on Intel systems, but is expected to
> function.=C2=A0 Explicitly turn it on for added test coverage in the shor=
t term."
>=20
> The final task is to make MSR_SPEC_CTRL virtualisation for PV guests
> work under FRED.=C2=A0 Right now, PV guests will lose speculation settings
> they believe they have set, hence why FRED isn't supported on Intel yet.
>=20
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> >  automation/gitlab-ci/test.yaml     | 1 +
> >  automation/scripts/qubes-x86_64.sh | 4 ++--
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test=
=2Eyaml
> > index 7cc52146304e..61adc1baff30 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -177,6 +177,7 @@
> >      PCIDEV: "56:00.0"
> >      PCIDEV_INTR: "MSI-X"
> >      CONSOLE_OPTS: "console=3Dcom1 com1=3D115200,8n1"
> > +    EXTRA_XEN_OPTS: "fred"
> >      SUT_ADDR: test-22.testnet
> >    tags:
> >      - qubes-hw22
> > diff --git a/automation/scripts/qubes-x86_64.sh b/automation/scripts/qu=
bes-x86_64.sh
> > index 7a59fa5f1116..065f03931bea 100755
> > --- a/automation/scripts/qubes-x86_64.sh
> > +++ b/automation/scripts/qubes-x86_64.sh
> > @@ -260,14 +260,14 @@ TFTP=3D/scratch/gitlab-runner/tftp
> >  CONTROLLER=3Dcontrol@thor.testnet
> > =20
> >  echo "
> > -multiboot2 (http)/gitlab-ci/xen $CONSOLE_OPTS loglvl=3Dall guest_loglv=
l=3Dall dom0_mem=3D4G console_timestamps=3Dboot watchdog $extra_xen_opts
> > +multiboot2 (http)/gitlab-ci/xen $CONSOLE_OPTS loglvl=3Dall guest_loglv=
l=3Dall dom0_mem=3D4G console_timestamps=3Dboot watchdog ${EXTRA_XEN_OPTS-}=
 $extra_xen_opts
> >  module2 (http)/gitlab-ci/vmlinuz console=3Dhvc0 root=3D/dev/ram0 early=
printk=3Dxen
> >  module2 --nounzip (http)/gitlab-ci/initrd-dom0
> >  " > $TFTP/grub.cfg
> > =20
> >  echo "#!ipxe
> > =20
> > -kernel /gitlab-ci/xen $CONSOLE_OPTS loglvl=3Dall guest_loglvl=3Dall do=
m0_mem=3D4G console_timestamps=3Dboot watchdog $extra_xen_opts || reboot
> > +kernel /gitlab-ci/xen $CONSOLE_OPTS loglvl=3Dall guest_loglvl=3Dall do=
m0_mem=3D4G console_timestamps=3Dboot watchdog ${EXTRA_XEN_OPTS-} $extra_xe=
n_opts || reboot
> >  module /gitlab-ci/vmlinuz console=3Dhvc0 root=3D/dev/ram0 earlyprintk=
=3Dxen || reboot
> >  module /gitlab-ci/initrd-dom0 || reboot
> >  boot
>=20
> Wouldn't this be better?
>=20
> diff --git a/automation/scripts/qubes-x86_64.sh
> b/automation/scripts/qubes-x86_64.sh
> index 065f03931bea..9f8288cc02e3 100755
> --- a/automation/scripts/qubes-x86_64.sh
> +++ b/automation/scripts/qubes-x86_64.sh
> @@ -15,7 +15,7 @@ set -ex -o pipefail
> =C2=A0test_variant=3D$1
> =C2=A0
> =C2=A0### defaults
> -extra_xen_opts=3D
> +extra_xen_opts=3D"${EXTRA_XEN_OPTS-}"
> =C2=A0wait_and_wakeup=3D
> =C2=A0timeout=3D120
> =C2=A0domU_type=3D"pvh"
>=20
>=20
> Everything is expected to append to this variable.

Well, currently nothing appends to it, all tests override it...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--x+4OZEirrDOOzs7q
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmpRHIMACgkQ24/THMrX
1yyz3gf9EIA1xx+cwmPl2uaoC0FkxlYgMrDmZ8aexVJc9BdB0NhOvgFMR4sqNrKq
TdEMJcJ7KmOj9xWuWA6Wut5X55EBQ5/6EMUFlqhzK3/5frb+YMB/WFF61+kOyVKp
L6lFnn9IzZdRHN84EDVt2Z/yz605tDvKk/I3MPlIyTUL34Wf6WhFDxK2uaA1qZEY
Z5vd4u6BECEh2ZTrtRAU68ntiqB5Z5IvcGR39B/RYINeY9ovh5vX6DSVDzA26/pD
WQNQDteGmW3WaFcOpyl9W20zgLTwU4JjJOhucCvrqEI9LzI5sHPeYWVLD4noxMtr
3vJKODGmrsrpI8mSwCvtHGtxhBGviw==
=KvsM
-----END PGP SIGNATURE-----

--x+4OZEirrDOOzs7q--

