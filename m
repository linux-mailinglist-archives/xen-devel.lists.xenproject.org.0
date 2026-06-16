Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZZ70MmMkMWoqcgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:24:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DB368E342
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:24:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm1 header.b=kz7Sr84x;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b=jWT3nbuh;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com
Received: from list by lists.xenproject.org with outflank-mailman.1339080.1600200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQxp-0000QG-Nr; Tue, 16 Jun 2026 10:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339080.1600200; Tue, 16 Jun 2026 10:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQxp-0000NU-LJ; Tue, 16 Jun 2026 10:24:13 +0000
Received: by outflank-mailman (input) for mailman id 1339080;
 Tue, 16 Jun 2026 10:24:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wZQxo-0000NO-R3
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 10:24:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZQxn-009bH1-MO
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 12:24:11 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a312444-2eae-0a2a0a5409dd-0a2a450ac122-20
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:24:11 +0200
Received: from [103.168.172.145] (helo=fout-a2-smtp.messagingengine.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a31244a-56b3-0a2a450a0019-67a8ac91a8dd-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:24:10 +0200
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id C0B9FEC02AA;
 Tue, 16 Jun 2026 06:24:09 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Tue, 16 Jun 2026 06:24:09 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Jun 2026 06:24:08 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm1; t=1781605449;
	 x=1781691849; bh=NDrfnXg4kuYNI1VTBK+a4tJclYivziyYYIL+1ScUoc4=; b=
	kz7Sr84x/q2m8GD3+LH1bHbcA9T4GaYOgCzm0smPM6pjSG5WGuWIUFld/qhFmZA9
	a2MpO+gsgxGXw1qfOB7SMjvnheeHuEL8AGXWiV9HNEPQauA8i7fxQM6+aFkb2Cy9
	E79O8c16SzC9AegC58YZRvaqUetbGfdhAnjnUoW5U2XDFwbqEl8IfABQ3ORTwDtB
	g5a9ENErYkGMSJD/K0mmLVlTzkGX2egCrmpD5ZX27TNrMRmucy1EIaHt3E7ThXIe
	DdY+bOdM3FbxSSJa4td/sPiblPqoa7f93FZvmZhzHsjO7sFIAvKtqZZyGN+HidVX
	Gm/eo2wVTCQh+FjcxL+xhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781605449; x=1781691849; bh=NDrfnXg4kuYNI1VTBK+a4tJclYivziyYYIL
	+1ScUoc4=; b=jWT3nbuhXzgUQG5tjuPlNWkXqMqKKpr/evIowY5v3JCYVYGORSn
	sA7CXeX7Blq0SS1eCD7gXwSVJYIToN7GCOYReQIFUfu9lVYKyvaRH9uqxg5W1Rwb
	cQyrKfA82RxrLieLK7Z/YY/jgYXPwNwYifck/zpqN51bk1SjT+bmAvBqLh6TthOD
	Vre4yaceo4Vcao0TiWQGWZsM7Qk9I/Cv7pwftVuw//EP2jrG0QERVKML73rUcabc
	gKEUnhT5l7QVBzx7Dzm2IHNkh/aN0fMPaFrNaji7A5hi0bz6dilZRcubq4I7Z50M
	7ChaTFfhtarYOLEpQMThX+bvwgu7p4oa4yw==
X-ME-Sender: <xms:SSQxarLKGT2nIxITfhYRyFK8jhwbJhx8ytiN3ZdZpsvwmfyT2wCvpg>
    <xme:SSQxamAgXINr2tmTNJ8_byHZ1X2_2o-4UqOIVyb7buPxNLcL5CSKYJBhRRRrYtCxP
    AfmiD9vz7OXv40WswfdyANLi_J3GBhAyLmtvvz1hCb2CT4Z9g>
X-ME-Received: <xmr:SSQxasCb4m5X8cU3XrQxZA7kZgOPvJts9NrruQw05-SkuSIZZX1UUvOOY_aHa_9k0rzhPoNgLcVJ55dPbZ4w3lilUL35e8yNhNA>
X-ME-Proxy-Cause: dmFkZTFzBA7nbk1GoxURcsKyH++nA2FUP/i83NFOyq66aS4MA68xkKspu3zjtVm8EVClCk
    zbgqJrFIuBqrDvtmVuZxznTfyfTDD9duPeVOrJBgAyuiwK8huU6NuZeptAAz4QhrJ5mlwX
    5xx4Xoi9EOsq7k85NA+NFX9Uk05mE21vnCG9E+hXUN5677F02+vZrYEyzHtBnAN2uT3Xhs
    GI+ArXw9YD8tu1EViVnUxpcWLn4SJWvECze8sKPqlCE/RRSpURsOsgkUYkmK4/YF5lLbrs
    gG3D6QZmjovF0C8pz5LQkmkruXaPD0RSM/96Z+Bnf8WBX+TSNRpE2EoLAxyFW0tPzay7K8
    pnYaNJsjLLl2JNGofoC/rawrdTfe6A3qmnZDOqIqoqrzR4nIyOiVZx2UDFnUmXR5tr8nBk
    8TpYtJeijEsfmCYP2DdJKL64gVJTXfyPQzykWHvuxdbUI2XVLVt4eUnO1Je3I79IfY2suK
    ff6qoMiABQ/7uYGmZw+Lk+YPL6auhGkhxu6l84PFgSessYjuvAO7qUrqypw/nAcd0vBD5s
    vQO0v6XOHP+EkK2ilsyPYmH58aLa/Y5qMxU1C/zdhO3IVjWS+D7XGHJ2vLrgvGPhm2nJwz
    akzc4HtXYXtWTgBolwyOieuAXbhfYmVO/zlHk1FVIrIFiAvYIu4UvZ+Aj2kA
X-ME-Proxy: <xmx:SSQxagD7C2n63RWdvmGugnDNtV6PTxla74jiXKJckxh00HDY37mU_g>
    <xmx:SSQxavqbsRbOGc-zT1WdpOxyiR9TtRmjPvk5E71YXzSYwf7AKcuxiA>
    <xmx:SSQxailfNtbgWdF2hO2GGSVHONTYYdz3aXejCM72fk2FTbfRp40NiQ>
    <xmx:SSQxanyiqqyET32-HoKfSxFPGi4YXBXh6WNM7bMCBD8NwOq_ZFu1pg>
    <xmx:SSQxanGT0xAh6hxyGT-jO6RzJtErlWd26-2YE5BJT_0xh2gMIkyoeE6a>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 16 Jun 2026 12:24:06 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 2/4] libxc: drop size parameter from
 xc_flask_context_to_sid()
Message-ID: <ajEkRh6nQCWekq0o@mail-itl>
References: <5d242cad-d907-4321-8ac1-363c0f9b623d@suse.com>
 <e2d95536-655d-4ce4-8170-e5be8f5baa99@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3z89l/g/r3RAFLJO"
Content-Disposition: inline
In-Reply-To: <e2d95536-655d-4ce4-8170-e5be8f5baa99@suse.com>
X-purgate-ID: tlsNG-4011c0/1781605451-6F55C8B7-DC03AD9C/0/0
X-purgate-type: clean
X-purgate-size: 5269
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email,messagingengine.com:dkim,mail-itl:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0DB368E342


--3z89l/g/r3RAFLJO
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 12:24:06 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 2/4] libxc: drop size parameter from
 xc_flask_context_to_sid()

On Tue, Jun 16, 2026 at 11:01:41AM +0200, Jan Beulich wrote:
> Nul-terminated strings are passed in all cases, so the strlen() can very
> well be invoked by the function itself. In preparation for a hypervisor
> change also include the nul terminator in the size calculation.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

for the python part:
Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> Ideally libxl_flask_context_to_sid() would follow suit, but aiui doing so
> would break its (stable) ABI.
>=20
> Of course the casts in xc_flask_access() are suspicious.
>=20
> --- a/tools/helpers/init-xenstore-domain.c
> +++ b/tools/helpers/init-xenstore-domain.c
> @@ -108,7 +108,7 @@ static int build(xc_interface *xch)
> =20
>      if ( flask )
>      {
> -        rv =3D xc_flask_context_to_sid(xch, flask, strlen(flask), &confi=
g.ssidref);
> +        rv =3D xc_flask_context_to_sid(xch, flask, &config.ssidref);
>          if ( rv )
>          {
>              fprintf(stderr, "xc_flask_context_to_sid failed\n");
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -2372,7 +2372,7 @@ long xc_sharing_used_frames(xc_interface
>  /*** End sharing interface ***/
> =20
>  int xc_flask_load(xc_interface *xc_handle, char *buf, uint32_t size);
> -int xc_flask_context_to_sid(xc_interface *xc_handle, char *buf, uint32_t=
 size, uint32_t *sid);
> +int xc_flask_context_to_sid(xc_interface *xc_handle, char *buf, uint32_t=
 *sid);
>  int xc_flask_sid_to_context(xc_interface *xc_handle, int sid, char *buf,=
 uint32_t size);
>  int xc_flask_getenforce(xc_interface *xc_handle);
>  int xc_flask_setenforce(xc_interface *xc_handle, int mode);
> --- a/tools/libs/ctrl/xc_flask.c
> +++ b/tools/libs/ctrl/xc_flask.c
> @@ -83,10 +83,11 @@ int xc_flask_load(xc_interface *xch, cha
>      return err;
>  }
> =20
> -int xc_flask_context_to_sid(xc_interface *xch, char *buf, uint32_t size,=
 uint32_t *sid)
> +int xc_flask_context_to_sid(xc_interface *xch, char *buf, uint32_t *sid)
>  {
>      int err;
>      struct xen_flask_op op =3D {};
> +    size_t size =3D strlen(buf) + 1;
>      DECLARE_HYPERCALL_BOUNCE(buf, size, XC_HYPERCALL_BUFFER_BOUNCE_IN);
> =20
>      if ( xc_hypercall_bounce_pre(xch, buf) )
> @@ -247,7 +248,7 @@ static int xc_flask_add(xc_interface *xc
>      int err;
>      struct xen_flask_op op =3D {};
> =20
> -    err =3D xc_flask_context_to_sid(xch, scontext, strlen(scontext), &si=
d);
> +    err =3D xc_flask_context_to_sid(xch, scontext, &sid);
>      if ( err )
>          return err;
> =20
> @@ -323,10 +324,10 @@ int xc_flask_access(xc_interface *xch, c
>      struct xen_flask_op op =3D {};
>      int err;
> =20
> -    err =3D xc_flask_context_to_sid(xch, (char*)scon, strlen(scon), &op.=
u.access.ssid);
> +    err =3D xc_flask_context_to_sid(xch, (char*)scon, &op.u.access.ssid);
>      if ( err )
>          return err;
> -    err =3D xc_flask_context_to_sid(xch, (char*)tcon, strlen(tcon), &op.=
u.access.tsid);
> +    err =3D xc_flask_context_to_sid(xch, (char*)tcon, &op.u.access.tsid);
>      if ( err )
>          return err;
> =20
> --- a/tools/libs/light/libxl_flask.c
> +++ b/tools/libs/light/libxl_flask.c
> @@ -21,7 +21,8 @@ int libxl_flask_context_to_sid(libxl_ctx
>  {
>      int rc;
> =20
> -    rc =3D xc_flask_context_to_sid(ctx->xch, buf, len, ssidref);
> +    assert(len =3D=3D strlen(buf));
> +    rc =3D xc_flask_context_to_sid(ctx->xch, buf, ssidref);
> =20
>      return rc;
>  }
> --- a/tools/python/xen/lowlevel/xc/xc.c
> +++ b/tools/python/xen/lowlevel/xc/xc.c
> @@ -1754,7 +1754,7 @@ static PyObject *pyflask_context_to_sid(
>          return PyErr_SetFromErrno(xc_error_obj);
>      }
> =20
> -    ret =3D xc_flask_context_to_sid(xc_handle, ctx, strlen(ctx), &sid);
> +    ret =3D xc_flask_context_to_sid(xc_handle, ctx, &sid);
> =20
>      xc_interface_close(xc_handle);
> =20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--3z89l/g/r3RAFLJO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmoxJEYACgkQ24/THMrX
1yy2Fgf+KaLYyyjUAdwsINqBYAZzsJlD0VJNCJhkFWAH2aTzKWhyEXJ0+eo+NIzD
hrtDKq8Fc4yNIBXz2AUn2jbVArwZp9njlCbS90t4+o58dS3PSsuU6/LpABx5C7Yr
HvVlrAxqFknwWHyYwZu1N+2JGqK3LZh33fkIOadXpBA0/H+oiW8LoJTlIwv0yNv7
hHVtdRyAcbeyo5RT8Z97RAv4Ln2Iw96L1gRFHcJ7UuO9XjNaky5rrJ/0AHb2bFH0
PXIjwAIKcOrHcnDK99tats4XutEL+drllzhHGk1Sn2dATpwGTArGlZpakpPSUmJn
uT1/mgFhlZGi2OrImtGDN+fCR2jdWA==
=1yAW
-----END PGP SIGNATURE-----

--3z89l/g/r3RAFLJO--

