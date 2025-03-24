Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B2CA6E0C6
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 18:26:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925923.1328795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twlZA-0005pu-AC; Mon, 24 Mar 2025 17:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925923.1328795; Mon, 24 Mar 2025 17:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twlZA-0005oP-6p; Mon, 24 Mar 2025 17:26:24 +0000
Received: by outflank-mailman (input) for mailman id 925923;
 Mon, 24 Mar 2025 17:26:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OLEh=WL=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1twlZ9-0005P9-59
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 17:26:23 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b276167-08d5-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 18:26:22 +0100 (CET)
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
X-Inumbo-ID: 1b276167-08d5-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=zktyu76lpzhbxfsxahcfn5qo2a.protonmail; t=1742837182; x=1743096382;
	bh=rmExc1DZJ2+nMHuwZPtsCKQTDLq0BinAvS7f/QkTRpw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=kSgiGRFQp8CjyIcLapfipQVAjbTtxHAjLSbISLdNryzcUeKlGa3Gdyez+1ZvMfJYQ
	 KmXTqfEputxKQaajCxd4HXZqITCF6ugAhxiPFowdCOX9cCzN7VOug6PjV/2pr4mIw8
	 L94tycCDAsFVn+LvOWkR09H7IPJpAZfRcEsCyWJbt/WEP7+27jH82od04XGBTNlAUz
	 g2n0Te7x3FcF9nJPt8Ljo5BAkh5JN4ieXB7CQM2M+Wm9mqtYkD33Cyh/ODOzwoR3XA
	 gCfyBmrN4aZhJOZ4VSUKHoe9ZKIwW3im3/eDqI8XlTp5l70CMh1s3S3RitVUywS6+H
	 tGlGDULe9PKKA==
Date: Mon, 24 Mar 2025 17:26:16 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/irq: introduce APIC_VECTOR_VALID()
Message-ID: <AJWzttjLNwVoP8lUoDoGYJukQqS65S45ijFB2SiBbQsNcjjqxCnvVnagCzsj7mBQ5YDN14kteRfizkknx7GQF_sKN1uvF9fo07Lq1YvOsEo=@proton.me>
In-Reply-To: <e24ec8f4-3320-4978-8deb-cefc3380a0ed@suse.com>
References: <20250320230339.3897874-1-dmukhin@ford.com> <e24ec8f4-3320-4978-8deb-cefc3380a0ed@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: dfc96b73330a73be7c853a8cf32a1425d855e02d
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, March 24th, 2025 at 5:36 AM, Jan Beulich <jbeulich@suse.com> wro=
te:

>=20
>=20
> On 21.03.2025 00:05, dmkhn@proton.me wrote:
>=20
> > Add new macro APIC_VECTOR_VALID() to validate the interrupt vector
> > range as per [1]. This macro replaces hardcoded checks against the
> > open-coded value 16 in LAPIC and virtual LAPIC code and simplifies
> > the code a bit.
> >=20
> > [1] Intel SDM volume 3A
> > Chapter "ADVANCED PROGRAMMABLE INTERRUPT CONTROLLER"
> > Section "Valid Interrupt Vectors"
> >=20
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
>=20
>=20
> Reviewed-by: Jan Beulich jbeulich@suse.com
>=20
> with ...
>=20
> > --- a/xen/arch/x86/include/asm/apicdef.h
> > +++ b/xen/arch/x86/include/asm/apicdef.h
> > @@ -78,6 +78,7 @@
> > #define APIC_DM_STARTUP 0x00600
> > #define APIC_DM_EXTINT 0x00700
> > #define APIC_VECTOR_MASK 0x000FF
> > +#define APIC_VECTOR_VALID(x) (((x) & APIC_VECTOR_MASK) >=3D 16)
>=20
>=20
> ... line length restrictions respected here. I'll see about taking care o=
f
> this while committing, provided other x86 maintainers wouldn't prefer thi=
s
> to not go in in the first place (so I'll also give it another day or two)=
.

Thanks!

>=20
> Jan

