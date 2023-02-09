Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21807690F91
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 18:52:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492875.762636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQB5K-0003e8-8q; Thu, 09 Feb 2023 17:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492875.762636; Thu, 09 Feb 2023 17:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQB5K-0003cR-5y; Thu, 09 Feb 2023 17:51:50 +0000
Received: by outflank-mailman (input) for mailman id 492875;
 Thu, 09 Feb 2023 17:51:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TKJk=6F=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pQB5I-0003cL-AH
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 17:51:48 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6aec5190-a8a2-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 18:51:46 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0C6723200952;
 Thu,  9 Feb 2023 12:51:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 09 Feb 2023 12:51:43 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Feb 2023 12:51:38 -0500 (EST)
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
X-Inumbo-ID: 6aec5190-a8a2-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1675965101; x=
	1676051501; bh=diSmzBlF2MmmtyrCfWIQfmZm5ZWHPl8mbWdnYSJQ94g=; b=F
	SGsov8/Se26hQx6HOVKDHV4eOHChCyg24KLpSrZyoz062+AvpnuvYtf7LCgM2arL
	fBj0C0yPpYL8ZelQK8wEvwTCbjw96/neRs1TQ4nGcKqnDH6TM0e9/G3sg6Up9Nbj
	diL78dv3ldk5zoz8iV1AYtjwkhc2wNysoT6+51uR60cWF6l2Ebo5HtiZqCJbcC0i
	TM0JsRAxOdkr/EBHUrMbhx/ZvDrjD4mFFNdvyPQGU/V7OdHuej//wnW+wPwQwMq1
	vW22GmD9dgOqRj9Cl62CWd/4154uW5QzUejKu8+e3Nby9+gagrEIX6ilECRVI6Z4
	6e8H5KB1qmXc/VnFQEkYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1675965101; x=1676051501; bh=diSmzBlF2MmmtyrCfWIQfmZm5ZWH
	Pl8mbWdnYSJQ94g=; b=pJrkdrQpVkjxT90+gF/1bhkEMz2risLYS9HU8bfvOJrS
	xi3GKnXAYxQFRCTLMl5bnjJx0WENpAAvEzM25VwcY2X396iLwnAP3NX+7EIIZ2mb
	uY8t89hKC4jykhFMukgt8DORYeH1R7f0FtydZad4g3EIPEBjDl9S+bZBjnt0DgYM
	/TnXROpLbdE9wxrBntSStHNFgHYMkTBoq56iUi65tcJv5NjSZL/qabjN37KmO9Jc
	pKRvFwMs6LM6TrSnk+nxVLJU/XVjefTYL1nkzOqo8o5+QHgfgl7iJICpUriqSGK/
	M1mEUOqoBnkQbg9DrE8BENdUiWiMCRbKeJaYsnai4Q==
X-ME-Sender: <xms:rDLlYwJP9nYwXUe50wcRz3qhRz-UdwwvsvMgMee2erpb6RMQgF3dnQ>
    <xme:rDLlYwKMqctUGh2yrpnZA-ARj03rtWyxIjGP444bmEs_79hema2W_8XaXuWQt3q4K
    mAiLc-NmEXp_h4>
X-ME-Received: <xmr:rDLlYwvBMtAkJ5qEGJs7GG9SqFjDI951phv9TUTiyatQFVixyFvB7XMl9l0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehfedguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetieelleffffdtudffvddugfel
    feejtdektdfghfefgfejteeutddvfffgieegjeenucffohhmrghinhepgigvnhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghm
    ihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:rDLlY9Z_EwR8InEUD9PFgbC3lq0o2mj0JH_1w7JrwWnCWLxS2nKiPw>
    <xmx:rDLlY3Z2s-qFPR4EwhaNSoo0DGKEen1ldA0PBCi-Uf8dGn0G188Y6A>
    <xmx:rDLlY5AQhjTNlhIwZ4ax6kra91iX2HsXYWxtGBncPOccHtHP_6kQtQ>
    <xmx:rTLlY7PSQe_8vPL_V42w189RbbYuT_G3cdEONZCECkzY0qQota8G4A>
Feedback-ID: iac594737:Fastmail
Date: Thu, 9 Feb 2023 12:51:16 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 3/4] Miscellaneous and documentation: Only use
 TLS-protected transports
Message-ID: <Y+UyqCITWks0I4AU@itl-email>
References: <cover.1675889601.git.demi@invisiblethingslab.com>
 <8c476ad1d36919f31c3d37edc813182e8f1489e8.1675889602.git.demi@invisiblethingslab.com>
 <CA+zSX=Z+Vg0xBb9Ww-iSSUQGp+oyoGFuY_cKMfQs_9epsRFUkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3twc6P7aNkhOC967"
Content-Disposition: inline
In-Reply-To: <CA+zSX=Z+Vg0xBb9Ww-iSSUQGp+oyoGFuY_cKMfQs_9epsRFUkg@mail.gmail.com>


--3twc6P7aNkhOC967
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 9 Feb 2023 12:51:16 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 3/4] Miscellaneous and documentation: Only use
 TLS-protected transports

On Thu, Feb 09, 2023 at 02:25:07PM +0000, George Dunlap wrote:
> On Wed, Feb 8, 2023 at 8:59 PM Demi Marie Obenour <
> demi@invisiblethingslab.com> wrote:
>=20
> > Obtaining code over an insecure transport is a terrible idea for
> > blatently obvious reasons.  Even for non-executable data, insecure
> > transports are considered deprecated.
> >
> > This patch changes miscellaneous links that are not used by any
> > automated tool.  Some of these links are dead anyway.
> >
>=20
> As I said in response to patch 4, I appreciate the goal and the effort
> here.  But I'd rather not replace a working link with a broken link, or a
> broken link with another broken link.
>=20
> If we want to make this change, I think we're going to have to be creative
> with how the link replacement is done, as well as in how it's demonstrated
> to reviewers that the new URLs are valid.
>=20
> One option, for instance, could be writing a small script that would check
> the link validity first and only make the change if the link was valid; a=
nd
> then including that script in the commit message.  The reviewer could then
> convince themselves that the script was correct, and give an Ack or R-b on
> that basis.  There are probably other ideas as well.
>=20
> Any thoughts?
>=20
>  -George

What about breaking the patch up into smaller ones?  One could change
all of the xenbits.xen.org links in one patch, since those are known to
support HTTPS.  Then keep going for other domains.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--3twc6P7aNkhOC967
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmPlMqkACgkQsoi1X/+c
IsFAyw/+Izax+D9FitbxfFeROnthD+Z5oe7M22tfYjEI/Ks6aZ6cyM+ocBmxvFAA
sikXezwoElWO2HmNpVmECyvBBQ1NwrmptQJg975l+zSSkoHYmRT0DBc+4AIDx8Ye
OQXRz72byi5V8GbWjkH1w7BrSw+BzdvXzoZuw+gv/OllhV0STr1YADvLSOtjG0cV
PTY+DM77lpR4PNhPVh8HYgb9wM33/yx3CoR3pyrsKCkqay7OOw1rL3oiapPIQQbc
pJ+iTJzNOF2Dr+Iw4ClpM5y3OUEFZQfoGhursHFoXpRUWXv2EyVTPBUOOX5AmbQQ
1hFQ35nYT5PpHhQWVsW4zdFZK2VFHrlsg7RG4/P58nH3C1zcDxDE6X2FHSnOKR+K
NYhD4GxAi02yRQfuEQYHmAVGPySjpnjuCPG+OOam/z65FmphXGEsxiMBwf/EGXO3
RhSZwFzkolx/qmP832De7lgI4/VimCeQbSvb72UXqGX+UcMPNN/GdD3jhxZ6yGA8
Y1gDpMXkFsUDKR09BoVS8fnuVlSuHe4n+dw6ydz2JFq5loDG2TRd8L2EOzXgT2to
6lAqTKsFKsXu8/cX1jkEPgYLWBOY9wQg7OFwLESixvILYtGXyNX9C0e7Gk68pJ7p
9pn7dJVRBHxBmAOKnMNcHOxbMpzne1ye2znmQUQfC45TdDUFQjU=
=lVv4
-----END PGP SIGNATURE-----

--3twc6P7aNkhOC967--

