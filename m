Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5EEA22854
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 05:57:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879370.1289579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdMb3-0004u3-VE; Thu, 30 Jan 2025 04:56:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879370.1289579; Thu, 30 Jan 2025 04:56:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdMb3-0004sd-Rb; Thu, 30 Jan 2025 04:56:09 +0000
Received: by outflank-mailman (input) for mailman id 879370;
 Thu, 30 Jan 2025 04:56:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WYlJ=UW=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tdMb2-0004sU-Eh
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 04:56:08 +0000
Received: from fhigh-b8-smtp.messagingengine.com
 (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fde40bc-dec6-11ef-99a4-01e77a169b0f;
 Thu, 30 Jan 2025 05:56:01 +0100 (CET)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 6C032254015B;
 Wed, 29 Jan 2025 23:55:59 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-10.internal (MEProxy); Wed, 29 Jan 2025 23:55:59 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jan 2025 23:55:56 -0500 (EST)
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
X-Inumbo-ID: 7fde40bc-dec6-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1738212959;
	 x=1738299359; bh=WcWEhE8zpmeG9E46SMEpHiqP+tJawc+Geu7OtXAUW+s=; b=
	Fv1sqzjAA3y2QqTzLmcwn0ZV/hZXeiILMJ2jRhgy+NfQoq+98A9q+8sX8mV2amEe
	ufbxtoVlpvv5Oy7jrSHqyRYvm0xbpjSj2XG9DBCtOsdZ4BOCCM7J2F5Q951nyG2Z
	SrHKMP5PGtzdF2WheJP/oTD3aJwCKLvVA2xs1KGY6o1F6k8r5fKW085luN/6mRR+
	GC8cyDm12tkwp28YsKFZ+bvoBHArOJaYJ9DFt45Sd0iAu3WBhoznnXUTd9dV26We
	I4U3W7X82Pw1bS4k0MyMKh9NfZMU6Pnp9nn6EcFVSQJSdfrlH27MxPa4gFqD6IIc
	RARaKan1EVl1ohOP9M52aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1738212959; x=1738299359; bh=WcWEhE8zpmeG9E46SMEpHiqP+tJawc+Geu7
	OtXAUW+s=; b=a2pEFFSbVnK71YCxy8suDB0XaatF027xIOnZl0EqQOpsBMB1hZG
	6P0MgfiZ2HmnqeWMz2d7JvGht38XV3lYpSd1hvVPwy54EztpFf1xWsvEkxuYSlcC
	emZSeDYSqk0ya/jywiyCKd+P1S7HO0cskJVxnU9SWzkxkhTKTlm1OJzyeYSMueOM
	bCSrw4IY0bITyICu0iwb3c3pm0mhmpCaO3rFfDNTMb4OeisC0oneGEkPuGsgpgQl
	IX4tsYP9jfK8fTrZs38un1dNfFV23+72+d8lqrFe9mrr3G+UuDIcysdqYZDucrIO
	DiTtTAKJP80pI0RVqbhCk0sokSSlSlRkPjg==
X-ME-Sender: <xms:XgabZ09sH-wC86UC0nxZnJgvrD2akNsfY-SM2vF8CSfKTXUUf__mvg>
    <xme:XgabZ8szemd9P9hLTSx0xIvf81lkAS8rmgir-UcoVu5ir0iViaUb_kF6yt0BassAa
    pad5lwd47rJ8g>
X-ME-Received: <xmr:XgabZ6DHFJqtlKsOGc3eNO1of70hOnKQLbA90kugaGJUh54cpaskb-akK_m7AnskS1XVuRBywKFFKym2Rw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepuddufedvieeiteeivedvfeelfedvudegveffledvleegudeiveffle
    eitefhfeejnecuffhomhgrihhnpeigvghnrdhorhhgpdhgihhthhhusgdrtghomhenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrh
    gvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthho
    peduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephhgvlhhgrggrsheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepsghhvghlghgrrghssehgohhoghhlvgdrtghomhdp
    rhgtphhtthhopehjghhrohhsshesshhushgvrdgtohhmpdhrtghpthhtoheprhhoghgvrh
    drphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepsghorhhishdrohhsthhrohhv
    shhkhiesohhrrggtlhgvrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhish
    htshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
    vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgvghhrvghsshhioh
    hnsheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehnsggusehnsggurdhn
    rghmvg
X-ME-Proxy: <xmx:XgabZ0crllJAlgvCGhF2V_oLwcdrgd3Vy_rLNOzQ18bjfflXca1iow>
    <xmx:XgabZ5P7icjw1tz-tKm4hnfvCTXIUAJjZFyY_JjBRxvgRuDEdvrKgg>
    <xmx:XgabZ-nLMEGsyUP-LmXCSMCblZQQ5NS0gamuVDfMeennnnGAVeUxYQ>
    <xmx:XgabZ7u5YxT4Z9kWRpmmvebwyy_KIBYnJggJz4jhdOfesY8ahA5EVA>
    <xmx:XwabZ-mqJfPjcyQ-_mB7ksK07xwyBhfw4VnhkFG8wB2FzVC41Y0-mR2Q>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 30 Jan 2025 05:55:55 +0100
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
Message-ID: <Z5sGW4b0pMtm38Y-@mail-itl>
References: <Z5mOKQUrgeF_r6te@mail-itl>
 <20250129184825.GA484760@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J/cW/5xtZf/8V1JK"
Content-Disposition: inline
In-Reply-To: <20250129184825.GA484760@bhelgaas>


--J/cW/5xtZf/8V1JK
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jan 2025 05:55:55 +0100
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

On Wed, Jan 29, 2025 at 12:48:25PM -0600, Bjorn Helgaas wrote:
> On Wed, Jan 29, 2025 at 03:10:49AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Tue, Jan 28, 2025 at 07:15:26PM -0600, Bjorn Helgaas wrote:
> > > On Fri, Jan 17, 2025 at 01:05:30PM +0100, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > After updating PV dom0 to Linux 6.12, The Mediatek MT7922 device re=
ports
> > > > all 0xff when accessing its config space. This happens only after d=
evice
> > > > reset (which is also triggered when binding the device to the
> > > > xen-pciback driver).
> > >=20
> > > Thanks for the report and for all the debugging you've already done!
> > >=20
> > > > Reproducer:
> > > >=20
> > > >     # lspci -xs 01:00.0
> > > >     01:00.0 Network controller: MEDIATEK Corp. MT7922 802.11ax PCI =
Express Wireless Network Adapter
> > > >     00: c3 14 16 06 00 00 10 00 00 00 80 02 10 00 00 00
> > > >     ...
> > > >     # echo 1 > /sys/bus/pci/devices/0000:01:00.0/reset
> > > >     # lspci -xs 01:00.0
> > > >     01:00.0 Network controller: MEDIATEK Corp. MT7922 802.11ax PCI =
Express Wireless Network Adapter
> > > >     00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> > > >
> > > > The same operation done on Linux 6.12 running without Xen works fin=
e.
> > > >=20
> > > > git bisect points at:
> > > >=20
> > > >     commit d591f6804e7e1310881c9224d72247a2b65039af
> > > >     Author: Bjorn Helgaas <bhelgaas@google.com>
> > > >     Date:   Tue Aug 27 18:48:46 2024 -0500
> > > >=20
> > > >     PCI: Wait for device readiness with Configuration RRS
> > > >=20
> > > > part of that commit:
> > > > @@ -1311,9 +1320,15 @@ static int pci_dev_wait(struct pci_dev *dev,=
 char *reset_type, int timeout)
> > > >                         return -ENOTTY;
> > > >                 }
> > > > =20
> > > > -               pci_read_config_dword(dev, PCI_COMMAND, &id);
> > > > -               if (!PCI_POSSIBLE_ERROR(id))
> > > > -                       break;
> > > > +               if (root && root->config_crs_sv) {
> > > > +                       pci_read_config_dword(dev, PCI_VENDOR_ID, &=
id);
> > > > +                       if (!pci_bus_crs_vendor_id(id))
> > > > +                               break;
> > > > +               } else {
> > > > +                       pci_read_config_dword(dev, PCI_COMMAND, &id=
);
> > > > +                       if (!PCI_POSSIBLE_ERROR(id))
> > > > +                               break;
> > > > +               }
> > > > =20
> > > >    =20
> > > > Adding some debugging, the PCI_VENDOR_ID read in pci_dev_wait() ret=
urns
> > > > initially 0xffffffff. If I extend the condition with
> > > > "&& !PCI_POSSIBLE_ERROR(id)", then the issue disappear. But reading=
 the
> > > > patch description, it would break VF.
> > > > I'm not sure where the issue is, but given it breaks only when runn=
ing
> > > > with Xen, I guess something is wrong with "Configuration RRS Softwa=
re
> > > > Visibility" in that case.
> > >=20
> > > I'm missing something.  If you get 0xffffffff, that is not the 0x0001
> > > Vendor ID, so pci_dev_wait() should exit immediately. =20
> >=20
> > I'm not sure what is going on there either, but my _guess_ is that the
> > loop exits too early due to the above. And it makes some further actions
> > to fail.
>=20
> Seems like a good guess worth investigating.  Maybe log all config
> accesses to this device after the FLR and see what we're doing?

I've added logging of all config read/write to this device. Full log at
[1].

A little explanation:
- it's done in pci_conf_read/pci_conf_write in https://xenbits.xen.org/gitw=
eb/?p=3Dxen.git;a=3Dblob;f=3Dxen/arch/x86/pci.c;h=3D97b792e578f109319446608=
1ad3651ade21cae7d;hb=3DHEAD
- cf8 means cf8 port value (BDF + register)
- bytes is read/write size (1/2/4)
- offset is the offset in the register (on top of cf8), but not in data
- data is either retrieved value, or written value, depending on
  function
- it's logging only accesses to 01:00.0

interesting part:

lspci before reset:
(XEN) d0v3 conf read cf8 0x80010000 bytes 4 offset 0 data 0x61614c3
(XEN) d0v3 conf read cf8 0x80010004 bytes 4 offset 0 data 0x100000
(XEN) d0v3 conf read cf8 0x80010008 bytes 4 offset 0 data 0x2800000
(XEN) d0v3 conf read cf8 0x8001000c bytes 4 offset 0 data 0x10
(XEN) d0v3 conf read cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
(XEN) d0v3 conf read cf8 0x80010014 bytes 4 offset 0 data 0x80
(XEN) d0v3 conf read cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
(XEN) d0v3 conf read cf8 0x8001001c bytes 4 offset 0 data 0
(XEN) d0v3 conf read cf8 0x80010020 bytes 4 offset 0 data 0
(XEN) d0v3 conf read cf8 0x80010024 bytes 4 offset 0 data 0
(XEN) d0v3 conf read cf8 0x80010028 bytes 4 offset 0 data 0
(XEN) d0v3 conf read cf8 0x8001002c bytes 4 offset 0 data 0xe61614c3
(XEN) d0v3 conf read cf8 0x80010030 bytes 4 offset 0 data 0
(XEN) d0v3 conf read cf8 0x80010034 bytes 4 offset 0 data 0x80
(XEN) d0v3 conf read cf8 0x80010038 bytes 4 offset 0 data 0
(XEN) d0v3 conf read cf8 0x8001003c bytes 4 offset 0 data 0x1ff
(XEN) d0v3 conf read cf8 0x80010080 bytes 4 offset 0 data 0x2e010
(XEN) d0v3 conf read cf8 0x800100e0 bytes 4 offset 0 data 0x18af805
(XEN) d0v3 conf read cf8 0x800100f8 bytes 4 offset 0 data 0xc8030001

reset:
(XEN) d0v1 conf read cf8 0x800100fc bytes 2 offset 0 data 0x8
(XEN) d0v1 conf read cf8 0x800100fc bytes 2 offset 0 data 0x8
(XEN) d0v1 conf read cf8 0x8001008c bytes 4 offset 0 data 0x145dc12
(XEN) d0v1 conf read cf8 0x80010000 bytes 4 offset 0 data 0x61614c3
(XEN) d0v1 conf read cf8 0x80010004 bytes 4 offset 0 data 0x100000
(XEN) d0v1 conf read cf8 0x80010008 bytes 4 offset 0 data 0x2800000
(XEN) d0v1 conf read cf8 0x8001000c bytes 4 offset 0 data 0x10
(XEN) d0v1 conf read cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
(XEN) d0v1 conf read cf8 0x80010014 bytes 4 offset 0 data 0x80
(XEN) d0v1 conf read cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
(XEN) d0v1 conf read cf8 0x8001001c bytes 4 offset 0 data 0
(XEN) d0v1 conf read cf8 0x80010020 bytes 4 offset 0 data 0
(XEN) d0v1 conf read cf8 0x80010024 bytes 4 offset 0 data 0
(XEN) d0v1 conf read cf8 0x80010028 bytes 4 offset 0 data 0
(XEN) d0v1 conf read cf8 0x8001002c bytes 4 offset 0 data 0xe61614c3
(XEN) d0v1 conf read cf8 0x80010030 bytes 4 offset 0 data 0
(XEN) d0v1 conf read cf8 0x80010034 bytes 4 offset 0 data 0x80
(XEN) d0v1 conf read cf8 0x80010038 bytes 4 offset 0 data 0
(XEN) d0v1 conf read cf8 0x8001003c bytes 4 offset 0 data 0x1ff
(XEN) d0v1 conf read cf8 0x80010088 bytes 2 offset 0 data 0x2910
(XEN) d0v1 conf read cf8 0x80010090 bytes 2 offset 0 data 0x1c2
(XEN) d0v1 conf read cf8 0x800100a8 bytes 2 offset 0 data 0x400
(XEN) d0v1 conf read cf8 0x800100b0 bytes 2 offset 0 data 0x2
(XEN) d0v1 conf read cf8 0x80010004 bytes 2 offset 2 data 0x10
(XEN) d0v1 conf read cf8 0x80010034 bytes 1 offset 0 data 0x80
(XEN) d0v1 conf read cf8 0x80010080 bytes 2 offset 0 data 0xe010
(XEN) d0v1 conf read cf8 0x800100e0 bytes 2 offset 0 data 0xf805
(XEN) d0v1 conf read cf8 0x800100f8 bytes 2 offset 0 data 0x1
(XEN) d0v1 conf write cf8 0x80010004 bytes 2 offset 0 data 0x400
(XEN) d0v1 conf read cf8 0x80010088 bytes 2 offset 2 data 0x9
(XEN) d0v1 conf read cf8 0x80010088 bytes 2 offset 0 data 0x2910
(XEN) d0v1 conf write cf8 0x80010088 bytes 2 offset 0 data 0xa910
(XEN) d0v2 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf read cf8 0x80010090 bytes 2 offset 0 data 0xffff
(XEN) d0v2 conf write cf8 0x80010090 bytes 2 offset 0 data 0xfffc
(XEN) d0v2 conf write cf8 0x80010090 bytes 2 offset 0 data 0xffff
(XEN) d0v2 conf write cf8 0x80010088 bytes 2 offset 0 data 0x2910
(XEN) d0v2 conf write cf8 0x80010090 bytes 2 offset 0 data 0x1c2
(XEN) d0v2 conf write cf8 0x800100a8 bytes 2 offset 0 data 0x400
(XEN) d0v2 conf write cf8 0x800100b0 bytes 2 offset 0 data 0x2
(XEN) d0v2 conf read cf8 0x8001003c bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x8001003c bytes 4 offset 0 data 0x1ff
(XEN) d0v2 conf read cf8 0x80010038 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010038 bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x80010034 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010034 bytes 4 offset 0 data 0x80
(XEN) d0v2 conf read cf8 0x80010030 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010030 bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x8001002c bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x8001002c bytes 4 offset 0 data 0xe61614c3
(XEN) d0v2 conf read cf8 0x80010028 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010028 bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
(XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
(XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
(XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
(XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
(XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
(XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
(XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
(XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
(XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
(XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
(XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
(XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
(XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
(XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
(XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
(XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
(XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
(XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
(XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
(XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
(XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
(XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
(XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
(XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
(XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
(XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
(XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
(XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
(XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
(XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
(XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
(XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
(XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
(XEN) d0v2 conf read cf8 0x8001000c bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x8001000c bytes 4 offset 0 data 0x10
(XEN) d0v2 conf read cf8 0x80010008 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010008 bytes 4 offset 0 data 0x2800000
(XEN) d0v2 conf read cf8 0x80010004 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010004 bytes 4 offset 0 data 0x100000
(XEN) d0v2 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
(XEN) d0v2 conf write cf8 0x80010000 bytes 4 offset 0 data 0x61614c3
(XEN) d0v2 conf read cf8 0x80010004 bytes 2 offset 2 data 0xffff
(XEN) d0v2 conf read cf8 0x80010034 bytes 1 offset 0 data 0xff
(XEN) d0v2 conf read cf8 0x800100fc bytes 2 offset 0 data 0xffff


[1] https://gist.github.com/marmarek/b4391c71801145e52590e877c559c5e0

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--J/cW/5xtZf/8V1JK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmebBlsACgkQ24/THMrX
1yyn3Af7BrI+9JP20AopXgQiUzuBTfGkVg1dJCDcGt5VcGlj2MKaWKDWz/5RHlmZ
lokPGFHb/IVaLk7VQVTmFEtjoVuL65KUFS7yfLsnPGwTIQ708p0P9KG8LJM0jQF7
QbQ7kGmkUsXcemvw+RGgxpbT6s7UggPMGD+xguJlKw4TiMbo+sdxcIHE1iMX7zeD
val/Cc3Z8brc08I+l8cn6Hl7T1dJhXrCnHXH+a2NHijzCslYcP2YGnR2j0R8+rl2
5agqXNGhRvakDUDcodasD2VdEzb/f2YW4YmERn5AsVFWABek46o2LoFBS5PWgqbY
dQAI1RYFaeSGyny5q3djqSAeZCAL5Q==
=uBH5
-----END PGP SIGNATURE-----

--J/cW/5xtZf/8V1JK--

