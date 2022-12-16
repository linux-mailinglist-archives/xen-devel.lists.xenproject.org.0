Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C1064EDC4
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 16:22:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464803.723311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6CXO-00007z-U7; Fri, 16 Dec 2022 15:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464803.723311; Fri, 16 Dec 2022 15:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6CXO-000061-R0; Fri, 16 Dec 2022 15:22:14 +0000
Received: by outflank-mailman (input) for mailman id 464803;
 Fri, 16 Dec 2022 15:22:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bMOE=4O=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p6CXN-00005t-48
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 15:22:13 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6714d512-7d55-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 16:22:11 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 003C75C0093;
 Fri, 16 Dec 2022 10:22:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 16 Dec 2022 10:22:07 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Dec 2022 10:22:05 -0500 (EST)
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
X-Inumbo-ID: 6714d512-7d55-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1671204126; x=
	1671290526; bh=cg3e1JhPakqPDDWVBJqa7gwSnvn8AwA/Teo8gx46lCs=; b=I
	LsMHa1S2+2MuhY0Qh1sNOeasgTagSpOJbQXUo9o3fNBR8KuJqXvmYIDldBeyqefj
	Ojma9TnBmRmdemN4000FFHn9Sg54p9KWVkJpMV3mQILhoOLURlNjwWQXE0AAgA2H
	zfUFIP2Oj/lf4suWiTZqXIxoRqvOfvxZ4A8x7GEW5O6WHSoI6PT/LEQ4YCR7Ktek
	EX3SL8C/xRejh8PV0xL9m+SFId6CyMZz5ewl0jdvq+FUu5Vo1Tl1D6o9g1054Vrl
	KtPwQgKw+IiFLGu6FFNC3uE3QTsn7iSFiAZR5X9woZp2DApwm90A4JlxvJpkcOrO
	5I3PPDHzNk5e13msU/hjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1671204126; x=1671290526; bh=cg3e1JhPakqPDDWVBJqa7gwSnvn8
	AwA/Teo8gx46lCs=; b=xFfpqwFU/ERUSO5olRWKhxDkQ+Fw1SALNk5GAO0/mAXv
	ycMIX3GsKpiqYFTzdoZIzdohGv4Yg0yKV80zzrCEp0MfGD8fQTLYeqM2ofMZSkJb
	S2cEktIci8iqfGMST9wUx9+Ix6TFXngFuegWAPrpSgCna8aNaZpyV8d5eNHyOAuq
	YI+EwCxAYUyhgRFiZyBR16moAYeEUw7VgWaByhx6MB1t5Wk4GidI3Llr1/nBwBtT
	w+sM3wyni1+TxwldExUVpPVqOpn92j3gUVzGSl3zyfiBZJvRhgf0nrbqAYBYI8rI
	dHe6VqU+J6OeHQz8s0Fmc2vsgyGowcPSUieSbAustg==
X-ME-Sender: <xms:Ho2cYxgawSTYy9HFQke-K-oi7dwQVvlZ6ouOocvPn-slZSSC82kxJw>
    <xme:Ho2cY2DIv0lfACQNJCQVLbBkAIk37nDlSp5OWdGIw_dZkgijQ_wF1LErzSCv827oZ
    LM6PEyIU2mzb_o>
X-ME-Received: <xmr:Ho2cYxHpjqQlWVC5IIHlebb6bbrp9n1p0pMJy7MbtGQhBasTXBthXHcgQdGB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeejgdejfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffegfffg
    uddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:Ho2cY2TuzVTTbM_mtBIo3yoNc4nKPpw-cUPgtBXvlPoLf5e38NHMMg>
    <xmx:Ho2cY-wcUNjm2zRzzGFcaRsYrGnZp2KIsKY9dsh4zMo2uo31Z3-4TA>
    <xmx:Ho2cY870juYEiYYGwmxqw7mvv3YtXKpritkq70S7qSZuVohwpWEqjg>
    <xmx:Ho2cY5wqLPe_4vl5yecYQrBumdext6YjPfOmP3DqoH7ftNoMnQXsSQ>
Feedback-ID: iac594737:Fastmail
Date: Fri, 16 Dec 2022 10:21:59 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	"Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH v4 02/10] x86/mm: Avoid hard-coding PAT in
 get_page_from_l1e()
Message-ID: <Y5yNG6VuzuWDrWyk@itl-email>
References: <cover.1671139149.git.demi@invisiblethingslab.com>
 <8f0a2f4352bf6241e66f2fea1776d0c82a3c566d.1671139149.git.demi@invisiblethingslab.com>
 <41b74605-bf88-2f56-53f5-033b8934d757@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VUPkrtD6C/xQRGfQ"
Content-Disposition: inline
In-Reply-To: <41b74605-bf88-2f56-53f5-033b8934d757@citrix.com>


--VUPkrtD6C/xQRGfQ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Dec 2022 10:21:59 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	"Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH v4 02/10] x86/mm: Avoid hard-coding PAT in
 get_page_from_l1e()

On Fri, Dec 16, 2022 at 02:49:33AM +0000, Andrew Cooper wrote:
> On 15/12/2022 11:57 pm, Demi Marie Obenour wrote:
> > diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> > index 78b1972e4170cacccc9c37c6e64e76e66a7da87f..802073a01c5cf4dc3cf1d58=
d28ea4d4e9e8149c7 100644
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -959,15 +959,22 @@ get_page_from_l1e(
> >              flip =3D _PAGE_RW;
> >          }
> > =20
> > -        switch ( l1f & PAGE_CACHE_ATTRS )
> > +        /* Force cacheable memtypes to UC */
> > +        switch ( pte_flags_to_cacheability(l1f) )
> >          {
> > -        case 0: /* WB */
> > -            flip |=3D _PAGE_PWT | _PAGE_PCD;
> > +        case X86_MT_UC:
> > +        case X86_MT_UCM:
> > +        case X86_MT_WC:
> > +            /* not cached */
> >              break;
> > -        case _PAGE_PWT: /* WT */
> > -        case _PAGE_PWT | _PAGE_PAT: /* WP */
> > -            flip |=3D _PAGE_PCD | (l1f & _PAGE_PAT);
> > +        case X86_MT_WB:
> > +        case X86_MT_WT:
> > +        case X86_MT_WP:
> > +            /* cacheable, force to UC */
> > +            flip |=3D (l1f & PAGE_CACHE_ATTRS) ^ _PAGE_UC;
> >              break;
> > +        default:
> > +            BUG();
>=20
> This is guest reachable.

Proof that this is unreachable below.  Obviously, feel free to correct
me if the proof is wrong.

pte_flags_to_cacheability() is defined (in this patch) as:

    /* Convert from PAT/PCD/PWT embedded in PTE flags to actual cacheabilit=
y value */
    static inline unsigned int pte_flags_to_cacheability(unsigned int flags)
    {
        unsigned int pat_shift =3D ((flags & _PAGE_PAT) >> 2) |
                                 (flags & (_PAGE_PCD|_PAGE_PWT));
        return 0xFF & (XEN_MSR_PAT >> pat_shift);
    }

_PAGE_PAT is 0x80, so (flags & _PAGE_PAT) will either be 0x00 or 0x80,
and ((flags & _PAGE_PAT) >> 2) will either be 0x00 or 0x20.  _PAGE_PCD
is 0x10 and _PAGE_PWT ix 0x08, so (flags & (_PAGE_PCD|_PAGE_PWT)) will
either be 0x00, 0x08, 0x10, or 0x18.  Therefore, pat_shift will either
be 0x00, 0x08, 0x10, 0x18, 0x20, 0x28, 0x30, or 0x38.  This means that
(XEN_MSR_PAT >> pat_shift) is well-defined and will shift XEN_MSR_PAT by
an integer number of bytes, and so (0xFF & (XEN_MSR_PAT >> pat_shift))
(the return value of pte_flags_to_cacheability()) is a single byte
(entry) in XEN_MSR_PAT.  Each byte in XEN_MSR_PAT is one of the six
architectural x86 memory types, and there is a case entry in the switch
for each of those types.  Therefore, the default case is not reachable.
Q.E.D.

> But the more I think about it, the more I'm not sure this logic is
> appropriate to begin with.=C2=A0 I think it needs deleting for the same
> reasons as the directmap cacheability logic needed deleting in XSA-402.

I would prefer this to be in a separate patch series, not least because
I do not consider myself qualified to write a good commit message for it.
This patch series is purely about removing assumptions about Xen=E2=80=99s =
PAT,
except for the last patch, which I explicitly marked DO NOT MERGE as it
breaks PV guest migration from old Xen at a minimum.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--VUPkrtD6C/xQRGfQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOcjRsACgkQsoi1X/+c
IsEbvA//RoBqhiaRH/VitJ630j0qknPrGRtZlujDvlacjw6FF9CWEaNWAuM10kMq
wNAXdSH8YCvfBrN1Hq2bkzuyP5qBLJm7+4tAS01J9DhE5HpRqQzmpRNazqMxf5Tr
Ns+ZStIrzKTsgUkRo2NA6e8X/Jedo6ZoHe1YxZpV1/0U5kZ0cl0Duwx+1K0KpnqI
gkO/lkaUcMsu49CLf5lpieIYFOjS2oLX1rbVErojOEPoTSWANAeRYzbiwflodj6C
kzBPvd3MzHuEU3y9TfELE08pzpNkuiD+XQUDfF3uQAy/aWoCMnlFC767c+SxlG1r
zuNv6FYqGKaahABX0t/68VPbLSMdwjmAEwtmXAi0xslevxK0yR8BGVeRs11w8DBF
+6RUDA2fZFSkV2sV9454oPk/PpyCiUuYcNsJDVEGSL2jqdNXnZR02HDLaI5KeATu
P7vUes+CW+0d/YQTwct/CmFHCnL2GrBkvFhepfcWwbnWnuy2nL3uldRuBKW07G9E
6lPi5RhH46Dlu5yY/XzXbU+1MxQ0bDO1EZ/Sx0L1Bct5SnutU9XYpHJRla/hEW8i
rpxQJp6JUpTdkg6bw5E5X0S3uvqJz00EMVdvNePZNw+EOejdbWvy2HoRX5GszWav
nSBSHIlfL5Flu+4gBwZbjnVq4fGMrv64fBuJxd4LFMzqmNyH1ik=
=Xe3h
-----END PGP SIGNATURE-----

--VUPkrtD6C/xQRGfQ--

