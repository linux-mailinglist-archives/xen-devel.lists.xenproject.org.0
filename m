Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 715AD9E7EA0
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2024 08:05:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.850524.1264967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJorL-0003UX-Tf; Sat, 07 Dec 2024 07:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 850524.1264967; Sat, 07 Dec 2024 07:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJorL-0003Ph-OC; Sat, 07 Dec 2024 07:04:11 +0000
Received: by outflank-mailman (input) for mailman id 850524;
 Fri, 06 Dec 2024 21:41:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gq+l=S7=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tJg5D-00054E-MF
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 21:41:55 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e884606d-b41a-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 22:41:53 +0100 (CET)
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
X-Inumbo-ID: e884606d-b41a-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1733521312; x=1733780512;
	bh=BwyTENd53pWG9rVYikh7s1bzM6k0q6lHb4xRAhQc3nI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=N9xYdg3CL0IGQsaFolGGKSJIjPQiztU+euwsA/KyL+GKhGjbJ876VFk6/Mr7RjBgr
	 SPVN+eOKhZ6rfKpxlA08mT6MjfX8iJN8mGt5MzIgF9PKk7AIq/bBxAHuoLp3BMZ4iq
	 /DRVjJmMWLthVKVA1r3UKhh2JJB2K8i899rg+kLSpBMwmZmIOPk2tW9SeUCSkWZqWs
	 w9JlpXdIOEwB81mwzj0PhwxHUT/6GOdzaPxXRjazPL0l+cMVQ4/hahll7xC15E14+6
	 CC9UXITh1ivm7U9BehTvQAM9nRuzRhaSiuvrh2tHgwdQG2znuJTehdXqX//ac33pG9
	 I77iBFHItoKwA==
Date: Fri, 06 Dec 2024 21:41:48 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 00/36] Introduce NS8250 UART emulator
Message-ID: <oSVgzehUK8Ofem4R-GCu1TM8b5ENCdfPjCj9-9b8nXQcMb75lLB7gAfq3po-fbXLWDrd0aimaZ_UAvMuNIRZDjIHbye7YHCNDFxW81T7qjo=@proton.me>
In-Reply-To: <298c4fb8-4879-4471-90c0-3a4aa0151686@suse.com>
References: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com> <c08bd940-a2eb-4fb8-9f8d-2c5f3f1fab54@citrix.com> <298c4fb8-4879-4471-90c0-3a4aa0151686@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: e24b58036d791da080486844b71cbec556946bc6
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Tuesday, November 26th, 2024 at 11:26 PM, Jan Beulich <jbeulich@suse.com=
> wrote:

>=20
>=20
> On 27.11.2024 00:57, Andrew Cooper wrote:
>=20
> > On 26/11/2024 11:21 pm, Denis Mukhin via B4 Relay wrote:
> >=20
> > > The patch series introduces initial in-hypervisor emulator for
> > > NS8250/NS16x50-compatible UARTs under CONFIG_HAS_VUART_NS8250.
> > >=20
> > > In parallel domain creation scenario (hyperlaunch), NS8520 emulator h=
elps
> > > early guest OS bringup debugging, because it eliminates dependency on=
 the
> > > external emulator being operational by the time domains are created. =
Also,
> > > there's no early console facility similar to vpl011 to support x86 gu=
est OS
> > > bring up.
> > >=20
> > > The NS8250 emulator is disabled by default.
> > >=20
> > > Series
> > > =3D=3D=3D=3D=3D=3D
> > > - patches 1-2: some miscellaneous random fixes, added into the series
> > > because I stepped into those while debugging NS8250 emulator.
> > >=20
> > > - patches 3-14: preparation fixes for xen console and NS8250 emulator=
.
> > >=20
> > > - patches 15-29: xen console driver cleanup and preparation for enabl=
ing
> > > physical serial console focus assignment to the guest VM w/ virtual N=
S8250.
> > >=20
> > > - patches 30-36: initial NS8250 emulator. That adds the I/O port emul=
ator
> > > for legacy PC COM UARTs, Kconfig option, enabling emulator and libxl
> > > plumbing.
> > >=20
> > > Limitations
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > - Only x86;
> > > - Only Linux guest tested so far;
> > > - Only legacy COM{1,2,3,4} resources, no customization;
> > > - Only Xen console as a backend, no inter-domain communication (simil=
ar to
> > > vpl011 on Arm);
> > > - Only 8-bit characters;
> > > - Baud rate is not emulated;
> > > - FIFO-less mode is not emulated properly;
> > > - RX FIFO interrupt moderation (FCR) is not emulated properly, TL16C7=
50
> > > has special FCR handling;
> > > - No integration w/ VM snapshotting (HVM_REGISTER_SAVE_RESTORE() and
> > > friends);
> > > - Assumes no ISA-device IRQ sharing;
> > > - MMIO-based UART is not supported.
> > >=20
> > > Testing
> > > =3D=3D=3D=3D=3D=3D=3D
> > >=20
> > > I tested boot of HVM linux guest w/ OVMF as the virtual firmware.
> > >=20
> > > The emulator, if enabled via CONFIG_HAS_VUART_NS8250=3Dy, will use CO=
M1 (0x3f8)
> > > resources by default.
> > >=20
> > > To test w/ virtual COM1, the guest kernel parameters should contain
> > > earlycon=3Duart,io,0x3f8,115200n8 console=3Duart,io,0x3f8,115200n8
> > >=20
> > > Xen is able to forward physical console input to the domain w/ virtua=
l NS8250.
> > > To switch the console focus press Ctrl+aaa. If console=3D is given to=
 the HVM
> > > kernel, then the user shall be able to see the login prompt on xen co=
nsole once
> > > console focus is switched to the HVM guest.
> > >=20
> > > Signed-off-by: Denis Mukhin dmukhin@ford.com
> >=20
> > Hello,
> >=20
> > Thankyou for this. It's an excellent start for first posting to the lis=
t.
>=20
>=20
> +1
>=20
> > Two things stand out at a glance.
> >=20
> > First, xmalloc/free are the expected functions to use,
>=20
>=20
> Small correction - as of their introduction, it's xvmalloc() etc and xvfr=
ee()
> which are to be used in new code.

Addressed in v2.

>=20
> One other, more general remark: Please send patches To: the list, with
> maintainers Cc-ed. And please compose the Cc: lists per-patch - looking a=
t
> patch 2, there should really have been just a single person (Daniel) on C=
c.
>=20
> Jan



