Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0AAA2D051
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 23:11:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884073.1293881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgWYk-00075p-7v; Fri, 07 Feb 2025 22:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884073.1293881; Fri, 07 Feb 2025 22:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgWYk-00073K-4u; Fri, 07 Feb 2025 22:10:50 +0000
Received: by outflank-mailman (input) for mailman id 884073;
 Fri, 07 Feb 2025 22:10:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wvag=U6=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tgWYj-00073E-5i
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 22:10:49 +0000
Received: from fout-b1-smtp.messagingengine.com
 (fout-b1-smtp.messagingengine.com [202.12.124.144])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60901083-e5a0-11ef-a073-877d107080fb;
 Fri, 07 Feb 2025 23:10:46 +0100 (CET)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.stl.internal (Postfix) with ESMTP id 283911140184;
 Fri,  7 Feb 2025 17:10:44 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Fri, 07 Feb 2025 17:10:44 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Feb 2025 17:10:41 -0500 (EST)
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
X-Inumbo-ID: 60901083-e5a0-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1738966244;
	 x=1739052644; bh=mOuAnCq/d+soQH9X0u6CHB3Og/VXH4tA9zcHqIjk1Xg=; b=
	Lom9pLHd5TpxF+1XOVrO6rktAjkQW0dFPA8H1PpCV+/RrcOU2AUnJ5Y+oFeEKCG1
	a6V8rQuxCj2Rvh5za39xW7rrvd6cdlAElVW08JMvrks5kq3RAtt4vgHCk5tR3Uqu
	AlES0IsX5ilWvXWZyNchgAtgCA7ZxOW3Qdb+8tTqgVOXZ8F+hghOCTlZ4iA4kcb3
	xCCuQStTjHqYUTij5Ajb9Nufc32qoC1AnlppCH1zwhmibe8B5sOA7WhJzopi0cK3
	4ysB0hi8D88pEnuO9HANntXnwcWVHYiRwGJmlPW/xR1gZE/19UOdeKtEjmpov8F/
	iCcZ2Saw2nm+sr9ommhGSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1738966244; x=1739052644; bh=mOuAnCq/d+soQH9X0u6CHB3Og/VXH4tA9zc
	HqIjk1Xg=; b=Tw4zMr620wBjl60NvjSqjcbEGNvXwrtZd5/e7P4w/YeR+5QU78U
	qgARfb5o88jq1yG0fz3xn85P+87GX6o8Su+4B7AhpAh+ZEpeJOgh584ysQRw/Cro
	v6twKvyoMPJbO7T/TcYU5gqtlrQjdN+5qBZ6jcg4sfCw2z06J+bz8Wp3aFMAuxK2
	xh4jJRMLbUBOxiKf/gqYWSFTmq8sCjI468Ail0hc2x2UpOL8VuAI9dXKvAmzr37s
	cKDnwSEv2Yg5zuRhaMIBvb6RZ04Y7T1HnGoFtBbLpcHFAZqaiDqjgpbQCgx7Szq6
	0AUloVe7+F6dZjVlAQ5z10bJ/3Uasu6prpw==
X-ME-Sender: <xms:4oSmZ5JJdANsJbqeOxezxvl5FIuenGoxBYdtytyPLdl8SVAOwj71wA>
    <xme:4oSmZ1KbKqlXXQoGD_hGSpbgOur3Y5Zygs_A733iUjTqdW3LimMLPjbRJezE-J-e7
    QL4CvW9wmretw>
X-ME-Received: <xmr:4oSmZxsmqJGGOLEkKOJ_8WlGerZmeFXDFQ9gQ0MrEfuaBcoTEGnVPU2-8dLKNrQ_RyD6FVB8qzyAptyJY5KFEWZi83q7A98AIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpeeukeetteeggffgkeduheetgeeileejjeeiiefhjeegvefhtefggf
    etueetteeuteenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepuddvpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehhvghlghgrrghssehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtohepsghh
    vghlghgrrghssehgohhoghhlvgdrtghomhdprhgtphhtthhopehjghhrohhsshesshhush
    gvrdgtohhmpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpdhr
    tghpthhtohepsghorhhishdrohhsthhrohhvshhkhiesohhrrggtlhgvrdgtohhmpdhrtg
    hpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheprhgvghhrvghsshhiohhnsheslhhishhtshdrlhhinhhugidruggv
    vh
X-ME-Proxy: <xmx:4oSmZ6bnm-Z8ST4ZdAE5fxjnVR7Cuj0DuV0eGRzS_ciFoC1rr9R55w>
    <xmx:4oSmZwaKzP9qjkF9jPQYvFP0orDTU3BlkX4yO0zo8UJ5AuMmKNXLEQ>
    <xmx:4oSmZ-DEhqAFXQjTTok7yU8TiHhXKP12eeVD4cMAo-QgKcGZRSU9RA>
    <xmx:4oSmZ-akYJ9eYep4iftGO_RBxY1IGS3g4YuRY-28BWOb3H0D7t60Dg>
    <xmx:44SmZ8Sqt9fCjek51cx60kP7WzzzaLWStYe1vig11NzVmpvJv9YpqYqZ>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 7 Feb 2025 23:10:38 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)
Message-ID: <Z6aE3u6QM6-Gshj3@mail-itl>
References: <Z6PiuRDjml0UNWd_@mail-itl>
 <20250207220036.GA1018004@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="R0U1CtJmncLYxeho"
Content-Disposition: inline
In-Reply-To: <20250207220036.GA1018004@bhelgaas>


--R0U1CtJmncLYxeho
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 7 Feb 2025 23:10:38 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)

On Fri, Feb 07, 2025 at 04:00:36PM -0600, Bjorn Helgaas wrote:
> On Wed, Feb 05, 2025 at 11:14:17PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Thu, Jan 30, 2025 at 03:31:23PM -0600, Bjorn Helgaas wrote:
> > > On Thu, Jan 30, 2025 at 10:30:33AM +0100, Jan Beulich wrote:
> > > > On 30.01.2025 05:55, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > I've added logging of all config read/write to this device. Full =
log at
> > > > > [1].
> > > > ...
>=20
> > ... Generally it looks like this device has broken FLR, and the
> > reset works due to the fallback to the secondary bus reset on
> > timeout. I repeated the test with my additional "&&
> > !PCI_POSSIBLE_ERROR(id)" and I got this:
> > [2] https://gist.github.com/marmarek/db0808702131b69ea2f66f339a55d71b
> >=20
> > The first log is with xen, and the second with native linux (and
> > added PCI config space logging in drivers/pci/access.c).
>=20
> This is just to annotate these logs.  Correct me if you see something
> wrong.

I think you all of that correct, yes.

> Both logs include this patch:
>=20
>   @@ -1297,7 +1297,8 @@ static int pci_dev_wait(struct pci_dev *dev, char=
 *reset_type, int timeout)
>                   if (root && root->config_rrs_sv) {
>                           pci_read_config_dword(dev, PCI_VENDOR_ID, &id);
>   -                     if (!pci_bus_rrs_vendor_id(id))
>   +                     if (!pci_bus_rrs_vendor_id(id) &&
>   +                         !PCI_POSSIBLE_ERROR(id))
>                                   break;
>=20
> I think both logs show this sequence:
>=20
>   - Initiate FLR on 01:00.0
>=20
>   - In pci_dev_wait(), poll PCI_VENDOR_ID, looking for something other
>     than 0x0001 (which would indicate RRS response) or 0xffff (from
>     patch above).
>=20
>   - Time out after ~70 seconds and return -ENOTTY.
>=20
>   - Attempt Secondary Bus Reset using 00:02.2, the Root Port leading
>     to 01:00.0.
>=20
>   - Successfully read PCI_VENDOR_ID.
>=20
>   - Looks the same, whether linux is running natively or on top of
>     Xen.
>=20
> Relevant devices (from mediatek-debug-6.12-patch2+bridgelog.log):
>=20
>   00:02.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] Phoenix GPP Brid=
ge
>     Bus: primary=3D00, secondary=3D01, subordinate=3D01, sec-latency=3D0
>=20
>   01:00.0 Network controller: MEDIATEK Corp. MT7922 802.11ax PCI Express =
Wireless Network Adapter
>     Capabilities: [80] Express (v2) Endpoint, IntMsgNum 0
>=20
> From mediatek-debug-6.12-patch2+bridgelog.log (from [2] above):
>=20
>   [anaconda root@test-12 /]# time echo 1 > /sys/bus/pci/devices/0000:01:0=
0.0/reset
>   (XEN) d0v3 conf write cf8 0x80010088 bytes 2 offset 0 data 0xa910      =
<-- set 01:00.0 FLR
>   (XEN) d0v3 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
>   ...
>   (XEN) d0v4 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
>   ...
>   (XEN) d0v4 conf read cf8 0x8000123c bytes 2 offset 2 data 0x2          =
(0x3c + offset 2 =3D 0x3e)
>   (XEN) d0v4 conf write cf8 0x8000123c bytes 2 offset 2 data 0x42        =
<-- set 00:02.2 SBR
>   (XEN) d0v4 conf write cf8 0x8000123c bytes 2 offset 2 data 0x2
>   ...
>   (XEN) d0v4 conf read cf8 0x80010000 bytes 4 offset 0 data 0x61614c3    =
<-- 01:00.0 VID/DID
>   ...
>   real    1m10.825s
>=20
> From mediatek-debug-native-6.12-patch2+bridgelog.log (also from [2]
> above):
>=20
>   [anaconda root@test-12 ~]# time echo 1 > /sys/bus/pci/devices/0000:01:0=
0.0/reset
>   [  240.449215] pciback 0000:01:00.0: resetting
>   [  240.450709] PCI: write bus 0x1 devfn 0x0 pos 0x88 size 2 value 0xa91=
0   <-- set 01:00.0 FLR
>   [  240.553264] PCI: read bus 0x1 devfn 0x0 pos 0x0 size 4 value 0xfffff=
fff
>   ...
>   [  309.481728] PCI: read bus 0x1 devfn 0x0 pos 0x0 size 4 value 0xfffff=
fff
>   [  309.481747] pciback 0000:01:00.0: not ready 65535ms after FLR; givin=
g up
>   ...
>   [  309.482667] PCI: read bus 0x0 devfn 0x12 pos 0x3e size 2 value 0x2  =
    PCI_BRIDGE_CONTROL
>   [  309.482670] PCI: write bus 0x0 devfn 0x12 pos 0x3e size 2 value 0x42=
    <-- set 00:02.2 SBR
>   [  309.485184] PCI: write bus 0x0 devfn 0x12 pos 0x3e size 2 value 0x2
>=20
>   ...
>   [  309.617782] PCI: read bus 0x1 devfn 0x0 pos 0x0 size 4 value 0x61614=
c3  <-- 01:00.0 VID/DID
>   [  309.629234] pciback 0000:01:00.0: reset done

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--R0U1CtJmncLYxeho
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmemhN4ACgkQ24/THMrX
1ywpwgf/QgAhtwhcX7ssf7MhHjnkT9pEcr7Zwbb9ymTUnYV/2QSjhJnZeGWpMXhN
0HxMB3E2PZ/cW94kuKukd2JUpeH9DITkBHzpStVDWNnMiQVoEhH+EDvefRazPR2s
g0wHD1R1UX4V9SvSeJSbwF0iKDP/zmj7821vH79AFD/VO0qPRICREqAEuRqBNSxb
TkFdPyw0tQAOX5998LCRXVatZSwxs4CYwrocsBfAgDOC9RCJeGO8A27nLpTduzBq
gt94ETHz7N116iYrwBM5+nEuPA8E1Wdgrqf5/rF4BgToylRlWTqjEi0RHt+Z/fOd
qoD4pAluuhgbL1tysT7nyqh34i/50A==
=2n7Y
-----END PGP SIGNATURE-----

--R0U1CtJmncLYxeho--

