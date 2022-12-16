Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 293D364E5F9
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 03:26:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464088.722425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p60PW-0006UK-MU; Fri, 16 Dec 2022 02:25:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464088.722425; Fri, 16 Dec 2022 02:25:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p60PW-0006RB-Je; Fri, 16 Dec 2022 02:25:18 +0000
Received: by outflank-mailman (input) for mailman id 464088;
 Fri, 16 Dec 2022 02:25:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bMOE=4O=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p60PU-0006R5-FT
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 02:25:16 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de1daa36-7ce8-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 03:25:13 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 6790E5C015C;
 Thu, 15 Dec 2022 21:25:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 15 Dec 2022 21:25:12 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Dec 2022 21:25:11 -0500 (EST)
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
X-Inumbo-ID: de1daa36-7ce8-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1671157512; x=
	1671243912; bh=JZ6qP9lzy+XAV25krpF2Mc78zdtJMeBz/437xbweQcs=; b=f
	mqUEkf/bMgpE5PSrXtcdqHOwXtIi1V8bNt/gcuv6pP7E7c9kHgYFSibmVCQYRPZP
	ZC//VmztO84WTFbPSrePHxuEOX2ak0arg7CNZFM56BFcrrGBhsTaF/2Q/mU3gPtT
	R6FWCotWBUre5X9ToZP+5M23l4MgTIceWCGWQv2Kc1hiZ7IQ+VGMupWGGAZXcKq3
	XXTI5xsfISuTmPMj3SA8CbPX+3vPIT7+L+DXm/Mns86YELfP1Nf+r+5odcBBEbjo
	zP6j8101IzurycVbxV4d79qkbScE8Yce7qtIsW/d/5A+O1RVFOmB4UQheNixrKO6
	oipbqq4QLtFsaetQsE7uQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1671157512; x=1671243912; bh=JZ6qP9lzy+XAV25krpF2Mc78zdtJ
	MeBz/437xbweQcs=; b=dYrPt48OmAupWbVX8VfPY2U5FakLHP74V6YZR7Mot2hl
	wm/8cgzLGUu+O2KR+mjueXM6cuDtx5jDpnBiifd/95PUhwgC+WUKCWzqxgVaB9yK
	dCBosF1aAPPrcmuZ+u/KzqBkx2u6GKNexZZDFuRFll0etwhLvs+Xu/+pXZgazjzV
	+CKC66C+uPeMv0DyzTGP4726xo+qajYlOZilOnkEb2eHYXx5wC6bXgC5MF8LrYnh
	wsTeMeCfA0h/3E5wI2Ff8BT9goGttNjMa1ieQ46KeiuYhJXP83xzuGUx6d3pQZC4
	pNsSWFiaUpZAAWjPA0dYPm/YeQ3njL+OBlI/DBuf0w==
X-ME-Sender: <xms:CNebY_xnWP0nhLej3Aov4dCSuHAoIBgdvtJR8Qq8xD7gTmMIZiiU_Q>
    <xme:CNebY3TKVvjZvryAaUh2hy9sQ1dMMU6AooGXWYzbaqkjUKgQxGJeRR5QshB00Kacw
    nms3nhZEvCNMl8>
X-ME-Received: <xmr:CNebY5XDKOkSKDc4gphHUzYv0vItZ8DIe9DwsYQiZME37JeoIqRQysOi5E1Z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeigdegfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffegfffg
    uddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:CNebY5iQUq72CC1SlEVO6f-v-8h2HPGh0WxsPA2PaNZCZPULQKSlXQ>
    <xmx:CNebYxDlc7-RvaEJxDdUrkzGUelgiBTMNe2oEdvPxYDbMe2Z-zd8IQ>
    <xmx:CNebYyKEyy8CJ_DJZ1eLZ1hSDU4zjMH6tNvkrWv0oC_0rKw0PqxYtg>
    <xmx:CNebY7DZl-oB3T-ahgBkU5NQgOOwcUVs_NSlRKjClye5SZQ3GCcHtw>
Feedback-ID: iac594737:Fastmail
Date: Thu, 15 Dec 2022 21:25:07 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v4 02/10] x86/mm: Avoid hard-coding PAT in
 get_page_from_l1e()
Message-ID: <Y5vXBTH3x8ugZtgn@itl-email>
References: <cover.1671139149.git.demi@invisiblethingslab.com>
 <8f0a2f4352bf6241e66f2fea1776d0c82a3c566d.1671139149.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FPfXQgFjcws9KP6z"
Content-Disposition: inline
In-Reply-To: <8f0a2f4352bf6241e66f2fea1776d0c82a3c566d.1671139149.git.demi@invisiblethingslab.com>


--FPfXQgFjcws9KP6z
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Dec 2022 21:25:07 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v4 02/10] x86/mm: Avoid hard-coding PAT in
 get_page_from_l1e()

On Thu, Dec 15, 2022 at 06:57:44PM -0500, Demi Marie Obenour wrote:
> get_page_from_l1e() relied on Xen's choice of PAT, which is brittle in
> the face of future PAT changes.  Instead, compute the actual cacheability
> used by the CPU and switch on that, as this will work no matter what PAT
> Xen uses.
>=20
> No functional change intended.
>=20
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> ---
> Changes since v3:
> - Compute and use the actual cacheability as seen by the processor.
>=20
> Changes since v2:
> - Improve commit message.
> ---
>  xen/arch/x86/include/asm/processor.h |  8 ++++++++
>  xen/arch/x86/mm.c                    | 19 +++++++++++++------
>  2 files changed, 21 insertions(+), 6 deletions(-)
>=20
> diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/=
asm/processor.h
> index 8e2816fae9b97bd4e153a30cc3802971fe0355af..c3205ed9e10c1a57d23c5ecea=
d66bebd82d87d06 100644
> --- a/xen/arch/x86/include/asm/processor.h
> +++ b/xen/arch/x86/include/asm/processor.h
> @@ -100,6 +100,14 @@
> =20
>  #ifndef __ASSEMBLY__
> =20
> +/* Convert from PAT/PCD/PWT embedded in PTE flags to actual cacheability=
 value */
> +static inline unsigned int pte_flags_to_cacheability(unsigned int flags)
> +{
> +    unsigned int pat_shift =3D ((flags & _PAGE_PAT) >> 2) |
> +                             (flags & (_PAGE_PCD|_PAGE_PWT));

This could also be written as

    unsigned int pat_shift =3D pte_flags_to_cacheattr(flags) << 3;

which might be easiser to read.

> +    return 0xFF & (XEN_MSR_PAT >> pat_shift);
> +}
> +
>  struct domain;
>  struct vcpu;
> =20
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 78b1972e4170cacccc9c37c6e64e76e66a7da87f..802073a01c5cf4dc3cf1d58d2=
8ea4d4e9e8149c7 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -959,15 +959,22 @@ get_page_from_l1e(
>              flip =3D _PAGE_RW;
>          }
> =20
> -        switch ( l1f & PAGE_CACHE_ATTRS )
> +        /* Force cacheable memtypes to UC */
> +        switch ( pte_flags_to_cacheability(l1f) )
>          {
> -        case 0: /* WB */
> -            flip |=3D _PAGE_PWT | _PAGE_PCD;
> +        case X86_MT_UC:
> +        case X86_MT_UCM:
> +        case X86_MT_WC:
> +            /* not cached */
>              break;
> -        case _PAGE_PWT: /* WT */
> -        case _PAGE_PWT | _PAGE_PAT: /* WP */
> -            flip |=3D _PAGE_PCD | (l1f & _PAGE_PAT);
> +        case X86_MT_WB:
> +        case X86_MT_WT:
> +        case X86_MT_WP:
> +            /* cacheable, force to UC */
> +            flip |=3D (l1f & PAGE_CACHE_ATTRS) ^ _PAGE_UC;
>              break;
> +        default:
> +            BUG();

Question for future reference: is this an appropriate use of BUG()?  The
default case is clearly unreachable, and I actually considered using
unreachable() here, but this isn=E2=80=99t performance-critical code from w=
hat I
can tell.  If execution *does* reach here something is seriously wrong.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--FPfXQgFjcws9KP6z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOb1wQACgkQsoi1X/+c
IsHiKg/7BhWIj/lezXge/YjXtz/ov1OqeWYtIUZ/994cUUhJ7/nFKQFU0QjyIggE
Ie6Gvy8ECrMoeq1TYQ561AXHK7PYwVjCa16Oq2QNXNsVl9zPDfu3/vk3nVF+zE8k
NM7WVyHydFcaB10J726O4fGaLlMjMxQmbIm+w4KUIVwJYLEhHLnXiPTQ19Muz0Ag
a8yRIKRy8c+3EjZp8AR24NVTi2j6wDb6oG9hbDYU5MY/gSHpCfstW1Z8qI+Wm6jy
3r6ZIR1ZyMQwPYZ8phUQOkqaFj5VIis9uG7M7E6en02B79dKs1tB1IlkRxvqH6yB
033ebYTh3K+GVjHAEGdtnPiDq7e6S46EHmwde3fVZgjZYzAOhVMisWSeyyF01V62
CGz4Gr7TgTZtqBcISkD01N7sGM0RgKmbsFyeY0NDLtfn/p+nOxQkwIiTEeeRNql2
mcZ5uen6FlAHymqXoPGzqAxP40vnRTdHYTZ6ShwWjRJGp8s6Txtb8VJRiMgOhG+u
FIwHA/e4GnB0MAfS+GIfGa0eMBH90vDuNVe8AzcJTcsk2GcXBi8q+mZwXT4ARkVd
uu7E1D8tbLEZ+mi+Yw78gaIG4N2QecX4fMbj1c3hGh3pTp2/1ScDuwQAb+WbH5kE
et0nfZGWHtoKbYv1hmZe0kcHs58K9jgiLQEu+lSpNvyZURgEdN8=
=LXTa
-----END PGP SIGNATURE-----

--FPfXQgFjcws9KP6z--

