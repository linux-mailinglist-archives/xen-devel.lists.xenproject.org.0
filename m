Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F4D68F83B
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 20:42:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491969.761349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPqJe-0007Cs-Sf; Wed, 08 Feb 2023 19:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491969.761349; Wed, 08 Feb 2023 19:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPqJe-00079q-PZ; Wed, 08 Feb 2023 19:41:14 +0000
Received: by outflank-mailman (input) for mailman id 491969;
 Wed, 08 Feb 2023 19:41:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mMba=6E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pPqJc-00079e-IW
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 19:41:12 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84984beb-a7e8-11ed-933c-83870f6b2ba8;
 Wed, 08 Feb 2023 20:41:04 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id D89465C0056;
 Wed,  8 Feb 2023 14:41:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 08 Feb 2023 14:41:01 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Feb 2023 14:40:58 -0500 (EST)
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
X-Inumbo-ID: 84984beb-a7e8-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1675885261; x=
	1675971661; bh=tSC+d5CSw18yD+fR/I858Vj+qQlU6DNIY9nwulJK/Po=; b=t
	+Ah9UYYIaK3ZiIav0B2AlPaS/8zSPUQdL+O9HINaX7oV3hIPAD/cPhM/jArFwYHP
	BtRtvv/t7X+2TDP+PgNsppc7LpycL0R9ZiDRXx7dpxnzoNWVhFwcQXQdt6hvU4nQ
	HPLegS+XLzCyvfDCjxSvsgAGt5LIrnDWcy2LYiv+zVuJXK2fe/7Mv192nV1ULqPU
	QewruBqpSkHY+V8C9GErelUvhg7c5m+2sIXtUtvk5TMZWwlt4Hmj750WAtqOifh8
	luvsjcqNECAb2DoikQubMMOAJ9waGwv/D7nlxjMIP4n6dIIuo9W7LiKSYPn8G3jb
	m+1jAg1RtiUzqK2s6uHfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1675885261; x=1675971661; bh=tSC+d5CSw18yD+fR/I858Vj+qQlU
	6DNIY9nwulJK/Po=; b=aPigWqCpUD8CMnMH655bc7WKkpHCXwZ04SZsMglyNVTD
	q4ppWg48QYtafTj3t7x1iVllRzEC0n3StvK6Vl+w29aNPdfqOYRxsUcFWazjS6Wt
	InwuiFMFWEyKHoxGYmvkRCFG/vZXlAGlAUshHs07svAXOSdVpU8cZd9Dxgc2a2y9
	mTRzaJuAfEUQZ3szytKlCiiBoiUC8oz7vVOjCn+nk7SFF/rpfFNOJk+QW4XlmXsY
	AXnZLeCHtAdjM0b1/H1A7UwXsJYUe6mtvSQtfhkOW1eVsL5aHFIieDEvX9s0eU9B
	vswbju3/60QYcrrzN8N/E++UBq3IT4ol5Q1+I6weGQ==
X-ME-Sender: <xms:zfrjY4U3aHx_uCZfkwOOZ16TVD6_HZRc96ZCPhc9V4ZfB6OJpLluvg>
    <xme:zfrjY8k902ZYiTwC0qcF6701HIKaBsVb0AiXbJ0ZpdDF50R4oGszxhU4ZQaIFjBCY
    2LH6_K5p8npaHA>
X-ME-Received: <xmr:zfrjY8Y8IMxSQAB6KOW1xz5V2ux4BERtgXIcOKYnjm6McQAion4WArEVM8c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehuddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptdeugffgteevffevkeefveekfeet
    heefteffgefgvdekgfefgeelveetteffveefnecuffhomhgrihhnpehgnhhurdhorhhgpd
    hinhhtvghlrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:zfrjY3Uwv99MdAw-0MiBGWEoNvI1Ywv4P2IQowa_wx2LMtR_irWuuw>
    <xmx:zfrjYymEEGiuJHCbX4kpi807NT54KiX5__h2zke3Xf-tWUr3_5CwRw>
    <xmx:zfrjY8e3dwqI1u8uXhUeUj990VnbirqUkxZ6VzTBTU-RohtY2Uitog>
    <xmx:zfrjY-y4UEJhyU8M6XvNQ2OYpEAXV6tr0x3uCGrLYSVX1IiO0O-dAw>
Feedback-ID: iac594737:Fastmail
Date: Wed, 8 Feb 2023 14:19:46 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,	Quan Xu <quan.xu0@gmail.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jun Nakajima <jun.nakajima@intel.com>,	Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>,	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,	Tim Deegan <tim@xen.org>,
	Christopher Clark <christopher.w.clark@gmail.com>,
	Dario Faggioli <dfaggioli@suse.com>,	Rahul Singh <rahul.singh@arm.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 4/4] GPL License Boilerplate: Switch from HTTP to HTTPS
Message-ID: <Y+P6yJw2qWgMrSUi@itl-email>
References: <cover.1675829866.git.demi@invisiblethingslab.com>
 <32fae62c9eb9e9536d49fdd28e1bf54430842023.1675829867.git.demi@invisiblethingslab.com>
 <3f3c358e-02b9-94e0-0b06-8a96ff92519b@suse.com>
 <1770bab7-3e25-d611-1d3f-58c02a2f7492@xen.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i88wNZm7oENdIBvm"
Content-Disposition: inline
In-Reply-To: <1770bab7-3e25-d611-1d3f-58c02a2f7492@xen.org>


--i88wNZm7oENdIBvm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 8 Feb 2023 14:19:46 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,	Quan Xu <quan.xu0@gmail.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jun Nakajima <jun.nakajima@intel.com>,	Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>,	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,	Tim Deegan <tim@xen.org>,
	Christopher Clark <christopher.w.clark@gmail.com>,
	Dario Faggioli <dfaggioli@suse.com>,	Rahul Singh <rahul.singh@arm.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 4/4] GPL License Boilerplate: Switch from HTTP to HTTPS

On Wed, Feb 08, 2023 at 08:26:37AM +0000, Julien Grall wrote:
> Hi,
>=20
> On 08/02/2023 07:40, Jan Beulich wrote:
> > On 08.02.2023 05:51, Demi Marie Obenour wrote:
> > > --- a/xen/drivers/passthrough/pci.c
> > > +++ b/xen/drivers/passthrough/pci.c
> > > @@ -11,7 +11,7 @@
> > >    * more details.
> > >    *
> > >    * You should have received a copy of the GNU General Public Licens=
e along with
> > > - * this program; If not, see <http://www.gnu.org/licenses/>.
> > > + * this program; If not, see <https://www.gnu.org/licenses/>.
> > >    */
> > >   #include <xen/sched.h>
> >=20
> > At the example of this file: While the above matches $subject, ...
> >=20
> > > @@ -285,14 +285,14 @@ static void apply_quirks(struct pci_dev *pdev)
> > >            * Device [8086:2fc0]
> > >            * Erratum HSE43
> > >            * CONFIG_TDP_NOMINAL CSR Implemented at Incorrect Offset
> > > -         * https://www.intel.com/content/www/us/en/processors/xeon/x=
eon-e5-v3-spec-update.html
> > > +         * https://www.intel.com/content/www/us/en/processors/xeon/x=
eon-e5-v3-spec-update.html
> > >            */
> > >           { PCI_VENDOR_ID_INTEL, 0x2fc0 },
> > >           /*
> > >            * Devices [8086:6f60,6fa0,6fc0]
> > >            * Errata BDF2 / BDX2
> > >            * PCI BARs in the Home Agent Will Return Non-Zero Values D=
uring Enumeration
> > > -         * https://www.intel.com/content/www/us/en/processors/xeon/x=
eon-e5-v4-spec-update.html
> > > +         * https://www.intel.com/content/www/us/en/processors/xeon/x=
eon-e5-v4-spec-update.html
> > >           */
> > >           { PCI_VENDOR_ID_INTEL, 0x6f60 },
> > >           { PCI_VENDOR_ID_INTEL, 0x6fa0 },
> >=20
> > ... this doesn't (and would rather belong in the earlier patch).
> >=20
> > As to $subject: Wouldn't it be more logical to replace the license boil=
er
> > plates by SPDX headers instead? This was done to some degree on Arm
> > already, but I haven't gone check why it was done incompletely there.
>=20
> Skimming through xen-devel, it sounds like it was most likely a lack of
> time. I think it would be a good idea here to switch to SPDX.
>=20
> That said, I can appreciate that Demi may not want to take on that works.=
 So
> I would be happy to give a try if no-one else wants to.

Should I drop this patch then?  I don=E2=80=99t have time for the SPDX chan=
ge,
sorry.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--i88wNZm7oENdIBvm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmPj+sgACgkQsoi1X/+c
IsHZKQ/9GRm4WqJ9yhAkeDjsG/vAOsGx71MMKrZK7IBB6rbCuuJK0PK2cOnt6ldu
zcmeUDPFcFKaMMIZQOskTMiahbTDECW5k19swgyF9shX6PFmxPur4sGuneJ0NzUv
4qzrM/OzCnNygNlp8YAyOxmJlwVSAv9nm1dMArupnGiWhNRDBbO2cYY2KtLWOM6y
tHQduBcDg0cmJqj3/h/P+fYggamvKzXFBRgcyldvxa2DS+6tlHWKqWxIdnaaoTnR
3Q8kOXPiWc0fEZIEfR/5j2T02Gg9M4/gNfL5AXZXFTZUdfWhtjiArjcOFZjYLxD1
X8Aym5hCE4ntmFrNO0t6rj1+ylstXRIC6TC1mOk0ZVPMijVMSVuK+9YdgsB62jyy
qAuG0K9Ej0v6Vgd6Plb3PzvEyQVxxP8qGyoKHjZoq1xYaCNJ8eAbqcB0eh1fR+8E
o0RHPJOtXmZ1XELOTYxXHuMTpaa1+7fpWrjB3gCRICeG9NSvyj/IB/kXgjB0w/os
Gh+TQRKSbvucaISxb3Bd/XNXEE2McD3k2+uiJpKJqMPnjUyImCrN9fZI4/jstb8j
LQTRiNiL+MEjwTx1nV1aFmKaSO0J5dLo4kKKzf5UUZ6YgBDqvEU9rzYNooW9gDcQ
gMqkeerUC8Jlhy3XLWbzBuekVqO8RT/peCHQoApEx4XGLAMT1o0=
=Y2dQ
-----END PGP SIGNATURE-----

--i88wNZm7oENdIBvm--

