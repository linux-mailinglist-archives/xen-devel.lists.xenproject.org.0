Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C08E653DC6
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 10:56:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468385.727476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8IIv-00058O-Tw; Thu, 22 Dec 2022 09:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468385.727476; Thu, 22 Dec 2022 09:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8IIv-00055q-R4; Thu, 22 Dec 2022 09:55:57 +0000
Received: by outflank-mailman (input) for mailman id 468385;
 Thu, 22 Dec 2022 09:55:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9VX=4U=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p8IIu-0004WL-Nd
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 09:55:56 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2f966b7-81de-11ed-8fd4-01056ac49cbb;
 Thu, 22 Dec 2022 10:55:55 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id EBCF93200063;
 Thu, 22 Dec 2022 04:55:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 22 Dec 2022 04:55:53 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Dec 2022 04:55:50 -0500 (EST)
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
X-Inumbo-ID: d2f966b7-81de-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1671702951; x=
	1671789351; bh=ixpX2ofHl7dFVdSOUFxFjuM7VHveX8sb32eS8sxWSAA=; b=E
	VQ0Vc7MovdaGZi2IYIrpIY+0mp7tj/4xdq/Sai8QPqErvGMI0LyQOezhKzwsUMqN
	bTW4rKU0ZJDLiS+WfBWdBj/fJAxa60P6sQWRmtHZCfS42/bxDAlvWbIpSwTziSpk
	wN5Wp4AGuJexEZ3AvYTg2voLsjy5IMZHiuASN90erSQqjvauTMoCSSRW4cQNnCTX
	gX6VJwqRFVeLTV2pSRw2zQWU9k8ScDVS1d5gTlFMo4YgpYBvGKfRKh1lA0o0aJhZ
	D/9D2/iLQyyyCI47BTWkKO0tcHUcYT5MqbSOzG4e8+W1bpUTJnle6dAZ7i+InYxu
	5uvk2wcy3on2NUoKgmn/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1671702951; x=1671789351; bh=ixpX2ofHl7dFVdSOUFxFjuM7VHve
	X8sb32eS8sxWSAA=; b=kdsi1rCifkLnmok9slTNc96BMBu1AFSP+zpR0aI9Sc79
	xtsPcW8XfNsZr0lsMhk/y2L0XvEgdUX5g4xMewLUNW79nrLPSrSoDMHEwI97Bsdk
	XHC40C9Q6zAWg/7izGocbn+hD/HaAP5KXGkJZDy3lGCalv+AH7h/ssfe3gX0QHB0
	JzMMSVF9AlXL2DBcmF1CG510YSiKbQ713lUz3r8lA8ihBuBhYpmUJLvocYbjdldL
	LVmgdbTsRFQuawI6z9VO1OKSy+xH67KPgGYaog7ouEo4dodryLeOY5XzJcmAYnno
	Xl79oXxXv4jNa9tovaTo3e3WE+FjdzY2tpQzdHxiSw==
X-ME-Sender: <xms:pymkY02p9mXsiVD8fyMTJ_rLlc-x_iz00WWykvn6KtTsE8P8GBWvAQ>
    <xme:pymkY_FfEye_fZuG6iV4vPwkQZK5rUnWQJKptVOH9eS8cdcckeuk-vQJh2Vwsrq9g
    ei7RASlwNRVYJw>
X-ME-Received: <xmr:pymkY863_nJ66tU0UUhnX_0ofYPzC0uA7TVe_Yhc8iXDgmcKvQbCAQiWv7fA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrhedtgddtlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduieelfeeutedvleehueetffejgeej
    geffkeelveeuleeukeejjeduffetjeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:pymkY93CYiqOZfA0LqCZRlE2m_1C5GplQa5rJR95M_ijvUHDAD79DA>
    <xmx:pymkY3FKH00gqceDAp8B3tEgMHUtzxwPgF1zf4mhkksUsM_HIlgZqA>
    <xmx:pymkY2_URhI3tBqqTJxbY3XYUXA1xlkWrOLPRpoubuj6lYjM7vS8EA>
    <xmx:pymkY23ISN4xenZ4cBcAwrtgbCere6lNS7SxOttJ0hyZ1MPS6s47Jg>
Feedback-ID: iac594737:Fastmail
Date: Thu, 22 Dec 2022 04:55:45 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 09/10] x86/mm: Reject invalid cacheability in PV
 guests by default
Message-ID: <Y6QppKYFkKqyo3cS@itl-email>
References: <cover.1671497984.git.demi@invisiblethingslab.com>
 <64d81a49e5e00527ae01b707080f6f0e14ee667c.1671497984.git.demi@invisiblethingslab.com>
 <a73a6829-5924-a98a-704b-c0111c16a3f1@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T7Pik+wH1fvE3R4Y"
Content-Disposition: inline
In-Reply-To: <a73a6829-5924-a98a-704b-c0111c16a3f1@suse.com>


--T7Pik+wH1fvE3R4Y
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Dec 2022 04:55:45 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 09/10] x86/mm: Reject invalid cacheability in PV
 guests by default

On Thu, Dec 22, 2022 at 10:48:02AM +0100, Jan Beulich wrote:
> On 20.12.2022 02:07, Demi Marie Obenour wrote:
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -145,6 +145,8 @@
> > =20
> >  #ifdef CONFIG_PV
> >  #include "pv/mm.h"
> > +bool allow_invalid_cacheability;
>=20
> static and __ro_after_init please (the former not the least with Misra
> in mind).

Will fix in v6.

> > +boolean_param("allow_invalid_cacheability", allow_invalid_cacheability=
);
> >  #endif
>=20
> Any new command line option will need to come with an entry in
> docs/misc/xen-command-line.pandoc. Furthermore we're trying to avoid
> underscores in command line option names, when dashes serve the
> purpose quite fine.

Will fix in v6.

> Also please add a blank line at least between #include and your
> addition. Personally I would find it more natural if such a single-use
> control was defined next to the place it is used, i.e.=20

Will fix in v6.

> > @@ -1343,7 +1345,33 @@ static int promote_l1_table(struct page_info *pa=
ge)
> >          }
> >          else
> >          {
>=20
> ... here.

Will move in v6.

> > -            switch ( ret =3D get_page_from_l1e(pl1e[i], d, d) )
> > +            l1_pgentry_t l1e =3D pl1e[i];
> > +
> > +            if ( !allow_invalid_cacheability )
> > +            {
> > +                switch ( l1e.l1 & PAGE_CACHE_ATTRS )
> > +                {
> > +                case _PAGE_WB:
> > +                case _PAGE_UC:
> > +                case _PAGE_UCM:
> > +                case _PAGE_WC:
> > +                case _PAGE_WT:
> > +                case _PAGE_WP:
> > +                    break;
> > +                default:
>=20
> Nit (style): Blank line please between non-fall-through case blocks.

Will fix in v6.

> > +                    /*
> > +                     * If we get here, a PV guest tried to use one of =
the
> > +                     * reserved values in Xen's PAT.  This indicates a=
 bug in
> > +                     * the guest, so inject #GP to cause the guest to =
log a
> > +                     * stack trace.
> > +                     */
>=20
> And likely make it die. Which, yes, ...
>=20
> > +                    pv_inject_hw_exception(TRAP_gp_fault, 0);
> > +                    ret =3D -EINVAL;
>=20
> ... also may or may not be the result of returning failure here (if the
> guest "checks" for errors by using a BUG()-like construct), but that's
> then more of its own fault than not coping with a non-architectural #GP.

Is there really any architectural behavior here?

> Also wasn't there talk of having this behavior in debug hypervisors
> only? Without that restriction I'm yet less happy with the change ...

My understanding was that Andrew preferred the behavior to be turned on
in release hypervisors too.  I am inclined to agree with Andrew, if for
no other reason than that those working on guest OSs do not generally
use debug hypervisors if they are not also working on Xen itself.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--T7Pik+wH1fvE3R4Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOkKaQACgkQsoi1X/+c
IsH4WxAAnZB7xpmQarYZ4pmmJW2ByOFwf7OL5w3RAIVQmFca+OrxdG94j9C1Ki5/
2f++8fJlgiQpCpgc+DQ6EVrHEXqTx6ztBhFrF8ILOivPYWnASu/0ZwuEKTQhjrSF
wnCcoVdhGckrPsOt7BreuJK5hJujbPozen2OiucOO0bNPIRHHZKhJRjReQMAveY/
s3cglaRLb8b1DoBbbW+OvxcoqOexk1bKrN1+vM9cejVxzieDUmPeLciaVrDnI/uQ
uY3URnTYuzXV3ZemEytPWqUTG4lvKKrYsg5Ey+PzPsQg/1bUZ56aL9pevPGz3SJr
B0sMI/PhlSmanQmOpbvpBSevVrKjP5719FYYMC6mAUeImv/x49hpJtAv3QJUwBGJ
NZfw363aqd4nm9q8z/13XeeQT+uIoOqqkKV7sl4OwVn4tM0J2ViPDq7U791ZZ9UU
BmYfpH0S/i1/RW+hLaxWY0ChmZlVgV5dPdaKANknUbEXo44h9IXzBYC9nZjbjV2T
QsaVAVHCoR/9PLswaqZwAJQiJURZDME8kufMfcg+Ua80+mSUCbZ5aIAQE30pqtjm
TcMhoWWzYZMuqjrpYboCO5cGidtnQON9zMXBzqpHsGtJQ4GNtWdQ8YvYNLs1HUWv
GcpYoktGcJHUaJVP5Iq92l7uhYpEcvE7kgZz6wPgn+sPepzxUuY=
=qp1A
-----END PGP SIGNATURE-----

--T7Pik+wH1fvE3R4Y--

