Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2359A21670
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 03:11:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878839.1289038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcxXg-0002Xo-Po; Wed, 29 Jan 2025 02:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878839.1289038; Wed, 29 Jan 2025 02:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcxXg-0002Vl-Mo; Wed, 29 Jan 2025 02:11:00 +0000
Received: by outflank-mailman (input) for mailman id 878839;
 Wed, 29 Jan 2025 02:10:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ri1h=UV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tcxXf-0002Ve-FX
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 02:10:59 +0000
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 457bcbea-dde6-11ef-99a4-01e77a169b0f;
 Wed, 29 Jan 2025 03:10:55 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 61FB7114020C;
 Tue, 28 Jan 2025 21:10:54 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Tue, 28 Jan 2025 21:10:54 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Jan 2025 21:10:51 -0500 (EST)
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
X-Inumbo-ID: 457bcbea-dde6-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1738116654;
	 x=1738203054; bh=UDmOJyg+nL9Ca/RFMJDJEHp0m/pv9KGep56/AvkHabk=; b=
	AHI8iyx2AWznrww/J+SAe0RvMYDPbKYZJVaZYgL/4cs6XZeOmBRJ9FruEWMXQ/7W
	B2ulpXoq2JGNaYzHuLpq1UULLWVoXMn/81e1ANKHDZbKwqQV4rrXwJJvd6lG5wxz
	emK1vGP0LIp75KKKefblSxt774t6sl80S5r7JwLTEWz61T5jAEFEGpoetf4pSwzo
	bjV3CgCC7jQ4sc/mxnR5SYAVcV5F9mhNW8c5DzhmcrnZOtuZoD2ELZtKXAa8maqs
	n/EayzFCAUwmhX4X8xQlKSgEWgU0fJC1Y6yh6vR1OZpFsv+kJAqmQoKnG3u99G/8
	ESrxLfA2AHX+sPr1ItFItg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1738116654; x=1738203054; bh=UDmOJyg+nL9Ca/RFMJDJEHp0m/pv9KGep56
	/AvkHabk=; b=LjCkuUNxymlnQ4xsQXdzIPIs7D0NORJbqALtjk8EmvDuqD/H/Bc
	GmvEpfeZmMjvWzrb5r77pVYZ7FouRIihJRdQnwfdLdv2vibfdzA+C3vj+Mthd8xW
	dyv/DBS5chI0IONUm1uHC05MwnTgGqvSvGMvoyQrLHxTXDIC7giOfHslJzJL5ChO
	CNgqxtYXXtEWm/jMrVoKpO3MgQIKkQw1mQqgXpUGTaDGlcmBIO+PzJUcEzc620Jc
	b8EKAomEV7fmiEgqvlmz0R6xvY7uNGJE8pica/0KNo9eyJQM0PwOnQF5ubnGud2o
	OnaHhk0OWnIHB4jTJ0YG5rac+Ad4AEUe8nw==
X-ME-Sender: <xms:LY6ZZxCgUZGLz1x3xDkyotEexAnfnWLi_TKxVEwQh2bUaLFb2dSYxA>
    <xme:LY6ZZ_iiReyzZqJGQ1WoBwMOlQlCty7Mu-YSWXu7fYLEv5ZIlUJ-4Qe2p286T6Q6P
    EcK4yHY3hLY5Q>
X-ME-Received: <xmr:LY6ZZ8mLEW5emnrpwsc3g3w6eNNFD_KXwcyWoMSo0WDG9roI650oR0f6RCp76QC2-NtxUe0ROKTA4fqi5ibpHOHtvPE5t4UnVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepueekteetgefggfekudehteegieeljeejieeihfejgeevhfetgffgte
    euteetueetnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeduuddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohephhgvlhhgrggrsheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepsghhvghlghgrrghssehgohhoghhlvgdrtghomhdprhgtphhtthhopehj
    ghhrohhsshesshhushgvrdgtohhmpdhrtghpthhtoheprhhoghgvrhdrphgruhestghith
    hrihigrdgtohhmpdhrtghpthhtohepsghorhhishdrohhsthhrohhvshhkhiesohhrrggt
    lhgvrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprh
    hojhgvtghtrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgvghhrvghsshhiohhnsheslhhishhtsh
    drlhhinhhugidruggvvhdprhgtphhtthhopehnsggusehnsggurdhnrghmvg
X-ME-Proxy: <xmx:LY6ZZ7yGPhExS5Ev7OuQAXEfkGBAA7LKI5TSAjBrYa6lVDpQgYQ_Lw>
    <xmx:LY6ZZ2QKQP6XjMrpgJVjjJ14xzk8cpvhYSCIENpibCMUF5redAREKg>
    <xmx:LY6ZZ-bgsJc5rtqllxai9aR6w7W4ajdyugpt7N-grba-VDXvtw26lg>
    <xmx:LY6ZZ3T3A7stPPAunUzU0wljatnHj3rsdVts71XlAAHioPYaeVGACA>
    <xmx:Lo6ZZyb5eEwAl4IeYVLlgxl9eFZ6lFr8FY5AjDe_kCkwfUN5a0sm_YAI>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 29 Jan 2025 03:10:49 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)
Message-ID: <Z5mOKQUrgeF_r6te@mail-itl>
References: <Z4pHll_6GX7OUBzQ@mail-itl>
 <20250129011526.GA184585@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6QJZaJl0dNJK9bmo"
Content-Disposition: inline
In-Reply-To: <20250129011526.GA184585@bhelgaas>


--6QJZaJl0dNJK9bmo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jan 2025 03:10:49 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)

On Tue, Jan 28, 2025 at 07:15:26PM -0600, Bjorn Helgaas wrote:
> On Fri, Jan 17, 2025 at 01:05:30PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > After updating PV dom0 to Linux 6.12, The Mediatek MT7922 device reports
> > all 0xff when accessing its config space. This happens only after device
> > reset (which is also triggered when binding the device to the
> > xen-pciback driver).
>=20
> Thanks for the report and for all the debugging you've already done!
>=20
> > Reproducer:
> >=20
> >     # lspci -xs 01:00.0
> >     01:00.0 Network controller: MEDIATEK Corp. MT7922 802.11ax PCI Expr=
ess Wireless Network Adapter
> >     00: c3 14 16 06 00 00 10 00 00 00 80 02 10 00 00 00
> >     ...
> >     # echo 1 > /sys/bus/pci/devices/0000:01:00.0/reset
> >     # lspci -xs 01:00.0
> >     01:00.0 Network controller: MEDIATEK Corp. MT7922 802.11ax PCI Expr=
ess Wireless Network Adapter
> >     00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> >
> > The same operation done on Linux 6.12 running without Xen works fine.
> >=20
> > git bisect points at:
> >=20
> >     commit d591f6804e7e1310881c9224d72247a2b65039af
> >     Author: Bjorn Helgaas <bhelgaas@google.com>
> >     Date:   Tue Aug 27 18:48:46 2024 -0500
> >=20
> >     PCI: Wait for device readiness with Configuration RRS
> >=20
> > part of that commit:
> > @@ -1311,9 +1320,15 @@ static int pci_dev_wait(struct pci_dev *dev, cha=
r *reset_type, int timeout)
> >                         return -ENOTTY;
> >                 }
> > =20
> > -               pci_read_config_dword(dev, PCI_COMMAND, &id);
> > -               if (!PCI_POSSIBLE_ERROR(id))
> > -                       break;
> > +               if (root && root->config_crs_sv) {
> > +                       pci_read_config_dword(dev, PCI_VENDOR_ID, &id);
> > +                       if (!pci_bus_crs_vendor_id(id))
> > +                               break;
> > +               } else {
> > +                       pci_read_config_dword(dev, PCI_COMMAND, &id);
> > +                       if (!PCI_POSSIBLE_ERROR(id))
> > +                               break;
> > +               }
> > =20
> >    =20
> > Adding some debugging, the PCI_VENDOR_ID read in pci_dev_wait() returns
> > initially 0xffffffff. If I extend the condition with
> > "&& !PCI_POSSIBLE_ERROR(id)", then the issue disappear. But reading the
> > patch description, it would break VF.
> > I'm not sure where the issue is, but given it breaks only when running
> > with Xen, I guess something is wrong with "Configuration RRS Software
> > Visibility" in that case.
>=20
> I'm missing something.  If you get 0xffffffff, that is not the 0x0001
> Vendor ID, so pci_dev_wait() should exit immediately. =20

I'm not sure what is going on there either, but my _guess_ is that the
loop exits too early due to the above. And it makes some further actions
to fail.

> But the log at
> https://github.com/QubesOS/qubes-issues/issues/9689#issuecomment-25829271=
49
> says it *doesn't* exit and eventually times out.

Note this log is from "working" kernel, so that timeout must be
something else.

> And the lspci above shows ~0 data for much of the header, even though
> the device must be ready by then.
>=20
> I don't have any good ideas, but since the problem only happens with
> Xen, and it seems to affect more than just the Vendor ID, maybe you
> could instrument xen_pcibk_config_read() and see if there's something
> wonky going on there?

This one is used when pcifront (from a different PV VM) is asking pciback
to read something. I see the issue even before starting any other VM and
not even attaching the device to the xen-pciback driver...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--6QJZaJl0dNJK9bmo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmeZjikACgkQ24/THMrX
1yxAJgf+NiqMfF+ZZtj2paTgrsdwIeiDCWn9FCSBOq8E/MXmGaks7bDMFDMHmvos
Djuv7l+ToHkUmUmVGp0Qzl7DmBHawouf9wzy93WF6tm6PsaxrAxDgGPF3lLjYiDf
j2rlkqLK9Uykbl/SluEW8TRh4+nXLuVlmyWdzTEQ1EdehXNG7/2ZV1HLaq+GFgGC
ZGdQZLHE1QapVphEcazlc3y+vp+wRkWLVXeJ1w6FibzO9fWAZjbkaQsUsvkFNnr5
vrsZutGko4ZKD0FJTHw0RsnzhI/WlKIm1ScuR6TPZXvdCVFFtRMMr2rNWAzuU6MG
s5lMTZ/0jY3sDyoz7PwXqXGXVe7/yw==
=qrsQ
-----END PGP SIGNATURE-----

--6QJZaJl0dNJK9bmo--

