Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D518AE71C7
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 23:56:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024151.1400171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUBd7-0003MO-C8; Tue, 24 Jun 2025 21:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024151.1400171; Tue, 24 Jun 2025 21:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUBd7-0003K9-9J; Tue, 24 Jun 2025 21:56:37 +0000
Received: by outflank-mailman (input) for mailman id 1024151;
 Tue, 24 Jun 2025 21:56:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1A0Y=ZH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uUBd6-0003K3-NR
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 21:56:36 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18c0a8c6-5146-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 23:56:35 +0200 (CEST)
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
X-Inumbo-ID: 18c0a8c6-5146-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750802194; x=1751061394;
	bh=mzYTxXFIDk3ifXUaCRYvp8lsFAcbodVaahIFNCfLVfQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hptgjXimAW6+TedYonRPMILzVI3wY1HeZn2a3cbWKKphYpZFX9Pf/EXS2XiyV3bkN
	 oLAkkbkCXtplWRZ91rqrGq9EecJhFfGEgJl+MzGnHp+vwpU6bpN4BnlQcX7Xvn7m2v
	 5fumYXhJCACzyQ02olotc2Cw3MBuGxq4mfx6aSrTmD483QsnEYVLdezj2nvJkiiKoF
	 szQqHZXZoVMYJa6HwtPo7R0MCn3W6dFBKt6OIX2P4FkLmKQ7vZkKFsKiiW3N3BPaBZ
	 bhnfNmaJqlsRJEEg9C7QlK+T6erf4tIzFJWKJu6eTb7hmuBCw/jMLFLZvT8HpnGCv2
	 KUHvS+5onc+zQ==
Date: Tue, 24 Jun 2025 21:56:30 +0000
To: "Orzel, Michal" <michal.orzel@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v1 02/16] arm/vpl011: move DT node parsing to PL011 emulator code
Message-ID: <aFsfCuh9Xrkgxmml@kraken>
In-Reply-To: <c0b76bb4-9330-4f54-8314-fa2c2efa8ee8@amd.com>
References: <20250624035443.344099-1-dmukhin@ford.com> <20250624035443.344099-3-dmukhin@ford.com> <c0b76bb4-9330-4f54-8314-fa2c2efa8ee8@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 8767df20f3d77c07f604a503425281a7665f5384
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 09:49:39AM +0200, Orzel, Michal wrote:
>=20
>=20
> On 24/06/2025 05:55, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Move vpl011 DT node parsing from common Arm code to PL011 emulator code=
.
> It's not parsing, it's DT node generation.

Oh, that's right, overlooked.
Thanks, will update.

>=20
> We usually keep all the DT node generation functions in one place. I'm no=
t sure
> if we want to move them to respective drivers (i.e. vpl011 to vpl011.c, g=
icv3 to
> gicv3.c, etc.). Not sure what other maintainers think.
>=20
> >
> > While doing it pick the generic name vuart_add_fwnode() for DT parser f=
unction
> What 'fw' stands for? Firmware? This function creates DT node for domU, s=
o it
> should better be sth like vuart_add_dt_node().

'fw' stands for 'firmware'.

It should be some generic name because the function will be used on x86 to
generate to generate the guest ACPI tables.

>=20
> ~Michal
>=20
>=20


