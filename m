Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ECF6F1796
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 14:21:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527276.819728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psN4f-00076g-AO; Fri, 28 Apr 2023 12:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527276.819728; Fri, 28 Apr 2023 12:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psN4f-00073b-6s; Fri, 28 Apr 2023 12:19:41 +0000
Received: by outflank-mailman (input) for mailman id 527276;
 Fri, 28 Apr 2023 12:19:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DSG/=AT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1psN4c-00073V-WC
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 12:19:39 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eeecb492-e5be-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 14:19:35 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 0A6FA5C0165;
 Fri, 28 Apr 2023 08:19:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 28 Apr 2023 08:19:33 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Apr 2023 08:19:31 -0400 (EDT)
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
X-Inumbo-ID: eeecb492-e5be-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1682684373; x=1682770773; bh=4T5RRApkW6b7ElBIKdGiQjp3SasNWBWNqmz
	TjiICWXg=; b=T3xgOfVCs2pthgRcV3Hw8hSW3plk0AFyYlJUMrsD8aHc7nmjbE5
	0EeU1hZzd0wfxs4oVsGDU9mCCwvgMrw/0aQbiEqaKNIBhWFh4eNnuTIjouHlAa6m
	Iq3FN2uqjwAudOkSYaDmWnJ0L0HvXRmLuz+SR88biz4jb15KbK4krQOjyr7LrYlx
	vK8VfavpEI/QxC00HmXpvGFHpae0lv/LfX+kzFXcxtvATkmzPZiROur3VcNB0mj1
	tVdd55Vk94ouz4gtGR1DtxYYdVwifWP8ZuCT4kURp+/RtwzyqSqCyKvoODhxeQ3k
	oBNxiLZ6rxJuPiQxsnF8vtV/9I157J5GLTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1682684373; x=1682770773; bh=4T5RRApkW6b7E
	lBIKdGiQjp3SasNWBWNqmzTjiICWXg=; b=G7+4qG8DzpAANK2InTztfHRCnqwji
	aFA2Q813N5xXKBzLLqcEuPPZyHy4d/9sC2c01uJsbAd3rQvhL+uINTHjyFr8h3jH
	cvYQ+6UQ/2qTIvlNTUw4kw3IT26RDaEPgXbxLKgyWLMq12RS28Ps092cZpMPwGSv
	cLeIOQcMSpicVOeBUuM82AC5x86L0Bhl0mbkzAR4eifmlgiY8UFjJYAuDjesMqmC
	km2hwmREQV9Be0/FS8+4vjWGbX3Y5Dscqqqb0Cf1VlyqDnpwhgkYS6MgfiInRRP7
	fZ7MOIRRYBY0P1Q/8HJnGJ6k0udsyn63W8YzaJJsu575Sid5BLqpEb0/g==
X-ME-Sender: <xms:1LlLZONhivo1dCZHWsDo27M6pj6LgG1Geagm5_6jKk-EFtw7L4_OpQ>
    <xme:1LlLZM-7F2BI8pTb_X1NJV0vBzz14369-O2K0pdr0_dyn4lzFvjgQi5ZFa766Koad
    CfG9hI7rNbAgQ>
X-ME-Received: <xmr:1LlLZFRJC9li75idbUBHX5BTBsNuTA7KLYO_JtUqQebNFJhtP7jvt7yhpzNXg3nQdpvaNi6wu76vhcA_QNpij_w44ogkgUPudiE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedukedghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:1LlLZOscA0TUWiiTguOVO8S8haIsKHUFXBkyb_HMQ5-NLAUKfU-MeA>
    <xmx:1LlLZGc2NnBYEUp0O1TaoSVCQdbWfzysjOKaa2ypdl4xwr-hx7ugSg>
    <xmx:1LlLZC1Q0HX3-hM1UQazHxSFGBlrn4w51tW5K_q0SNUjMZ_Q8-Bm9A>
    <xmx:1blLZG6uzwCyC8sXFLI52F4pB-JH9HVErpK5-eatHFax4WVgzE-N3g>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 28 Apr 2023 14:19:25 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/7] tools: Make some callers of xc_domain_getinfo()
 use xc_domain_getinfolist()
Message-ID: <ZEu5ziJNe6v80VE0@mail-itl>
References: <20230428104124.1044-1-alejandro.vallejo@cloud.com>
 <20230428104124.1044-2-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YAJPkbW/82GaqTzN"
Content-Disposition: inline
In-Reply-To: <20230428104124.1044-2-alejandro.vallejo@cloud.com>


--YAJPkbW/82GaqTzN
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Apr 2023 14:19:25 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/7] tools: Make some callers of xc_domain_getinfo()
 use xc_domain_getinfolist()

On Fri, Apr 28, 2023 at 11:41:18AM +0100, Alejandro Vallejo wrote:
> xc_domain_getinfo() is slow and prone to races because N hypercalls are
> needed to find information about N domains. xc_domain_getinfolist() finds
> the same information in a single hypercall as long as a big enough buffer
> is provided. Plus, xc_domain_getinfo() is disappearing on a future patch
> so migrate the callers interested in more than 1 domain to the the *list()
> version.
>=20
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

For the Python part:
Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Wei Liu <wl@xen.org>
> Cc: Anthony PERARD <anthony.perard@citrix.com>
> Cc: Juergen Gross <jgross@suse.com>
> ---
>  tools/include/xenctrl.h           | 12 ++++++++++++
>  tools/python/xen/lowlevel/xc/xc.c | 28 ++++++++++++++--------------
>  tools/xenmon/xenbaked.c           |  6 +++---
>  3 files changed, 29 insertions(+), 17 deletions(-)
>=20
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 05967ecc92..f5bc7f58b6 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -468,6 +468,18 @@ typedef struct xc_dominfo {
> =20
>  typedef xen_domctl_getdomaininfo_t xc_domaininfo_t;
> =20
> +static inline unsigned int dominfo_shutdown_reason(const xc_domaininfo_t=
 *info)
> +{
> +    return (info->flags >> XEN_DOMINF_shutdownshift) & XEN_DOMINF_shutdo=
wnmask;
> +}
> +
> +static inline bool dominfo_shutdown_with(xc_domaininfo_t *info, unsigned=
 int expected_reason)
> +{
> +    /* The reason doesn't make sense unless the domain is actually shutd=
own */
> +    return (info->flags & XEN_DOMINF_shutdown) &&
> +           (dominfo_shutdown_reason(info) =3D=3D expected_reason);
> +}
> +
>  typedef union=20
>  {
>  #if defined(__i386__) || defined(__x86_64__)
> diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowleve=
l/xc/xc.c
> index 35901c2d63..d7ce299650 100644
> --- a/tools/python/xen/lowlevel/xc/xc.c
> +++ b/tools/python/xen/lowlevel/xc/xc.c
> @@ -342,7 +342,7 @@ static PyObject *pyxc_domain_getinfo(XcObject *self,
>      uint32_t first_dom =3D 0;
>      int max_doms =3D 1024, nr_doms, i;
>      size_t j;
> -    xc_dominfo_t *info;
> +    xc_domaininfo_t *info;
> =20
>      static char *kwd_list[] =3D { "first_dom", "max_doms", NULL };
> =20
> @@ -350,11 +350,11 @@ static PyObject *pyxc_domain_getinfo(XcObject *self,
>                                        &first_dom, &max_doms) )
>          return NULL;
> =20
> -    info =3D calloc(max_doms, sizeof(xc_dominfo_t));
> +    info =3D calloc(max_doms, sizeof(*info));
>      if (info =3D=3D NULL)
>          return PyErr_NoMemory();
> =20
> -    nr_doms =3D xc_domain_getinfo(self->xc_handle, first_dom, max_doms, =
info);
> +    nr_doms =3D xc_domain_getinfolist(self->xc_handle, first_dom, max_do=
ms, info);
> =20
>      if (nr_doms < 0)
>      {
> @@ -368,21 +368,21 @@ static PyObject *pyxc_domain_getinfo(XcObject *self,
>          info_dict =3D Py_BuildValue(
>              "{s:i,s:i,s:i,s:i,s:i,s:i,s:i,s:i,s:i,s:i"
>              ",s:L,s:L,s:L,s:i,s:i,s:i}",
> -            "domid",           (int)info[i].domid,
> +            "domid",           (int)info[i].domain,
>              "online_vcpus",    info[i].nr_online_vcpus,
>              "max_vcpu_id",     info[i].max_vcpu_id,
> -            "hvm",             info[i].hvm,
> -            "dying",           info[i].dying,
> -            "crashed",         info[i].crashed,
> -            "shutdown",        info[i].shutdown,
> -            "paused",          info[i].paused,
> -            "blocked",         info[i].blocked,
> -            "running",         info[i].running,
> -            "mem_kb",          (long long)info[i].nr_pages*(XC_PAGE_SIZE=
/1024),
> +            "hvm",             !!(info[i].flags & XEN_DOMINF_hvm_guest),
> +            "dying",           !!(info[i].flags & XEN_DOMINF_dying),
> +            "crashed",         dominfo_shutdown_with(&info[i], SHUTDOWN_=
crash),
> +            "shutdown",        !!(info[i].flags & XEN_DOMINF_shutdown),
> +            "paused",          !!(info[i].flags & XEN_DOMINF_paused),
> +            "blocked",         !!(info[i].flags & XEN_DOMINF_blocked),
> +            "running",         !!(info[i].flags & XEN_DOMINF_running),
> +            "mem_kb",          (long long)info[i].tot_pages*(XC_PAGE_SIZ=
E/1024),
>              "cpu_time",        (long long)info[i].cpu_time,
> -            "maxmem_kb",       (long long)info[i].max_memkb,
> +            "maxmem_kb",       (long long)(info[i].max_pages << (XC_PAGE=
_SHIFT - 10)),
>              "ssidref",         (int)info[i].ssidref,
> -            "shutdown_reason", info[i].shutdown_reason,
> +            "shutdown_reason", dominfo_shutdown_reason(&info[i]),
>              "cpupool",         (int)info[i].cpupool);
>          pyhandle =3D PyList_New(sizeof(xen_domain_handle_t));
>          if ( (pyhandle =3D=3D NULL) || (info_dict =3D=3D NULL) )
> diff --git a/tools/xenmon/xenbaked.c b/tools/xenmon/xenbaked.c
> index 4dddbd20e2..8632b10ea4 100644
> --- a/tools/xenmon/xenbaked.c
> +++ b/tools/xenmon/xenbaked.c
> @@ -775,7 +775,7 @@ static void global_init_domain(int domid, int idx)
>  static int indexof(int domid)
>  {
>      int idx;
> -    xc_dominfo_t dominfo[NDOMAINS];
> +    xc_domaininfo_t dominfo[NDOMAINS];
>      xc_interface *xc_handle;
>      int ndomains;
>   =20
> @@ -797,7 +797,7 @@ static int indexof(int domid)
> =20
>      // call domaininfo hypercall to try and garbage collect unused entri=
es
>      xc_handle =3D xc_interface_open(0,0,0);
> -    ndomains =3D xc_domain_getinfo(xc_handle, 0, NDOMAINS, dominfo);
> +    ndomains =3D xc_domain_getinfolist(xc_handle, 0, NDOMAINS, dominfo);
>      xc_interface_close(xc_handle);
> =20
>      // for each domain in our data, look for it in the system dominfo st=
ructure
> @@ -808,7 +808,7 @@ static int indexof(int domid)
>          int jdx;
>     =20
>          for (jdx=3D0; jdx<ndomains; jdx++) {
> -            if (dominfo[jdx].domid =3D=3D domid)
> +            if (dominfo[jdx].domain =3D=3D domid)
>                  break;
>          }
>          if (jdx =3D=3D ndomains)        // we didn't find domid in the d=
ominfo struct
> --=20
> 2.34.1
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--YAJPkbW/82GaqTzN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmRLuc4ACgkQ24/THMrX
1ywZ9Qf+PLiM87ReV41LAFBAA6DWUKUf7OLSlOz4vi/2sX6ALcsNUH43j5qnJPvK
Ag4RQwt1hahx+lsBU2R+6USST3AErNlxeOS0G45Utw2QIQ3NazH7JT++8AbPCXC8
vv0qZ7cs4RQnbWAngiaR2MI5TjkCOGxICSMAGIySwGnntqwSsplQzw6E21oZYl9c
7jEChJ/TJWP/4AI5f0f1sIOkQo2pgo18bakzDuQwYcfKXc0q7D6vXVXErUm50gFt
oJI0l+51TwSGFlNUhaJirxu7UA4z13xPQFKCifuFnx9oT1V/b3Os4RRQ0nZz0YW9
FUYte/Kru5nVryuCcaMIcybnjI08zQ==
=9Uct
-----END PGP SIGNATURE-----

--YAJPkbW/82GaqTzN--

