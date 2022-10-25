Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0817360CE0A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 15:56:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429862.681141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onKOg-0005YK-IF; Tue, 25 Oct 2022 13:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429862.681141; Tue, 25 Oct 2022 13:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onKOg-0005Vn-ER; Tue, 25 Oct 2022 13:55:14 +0000
Received: by outflank-mailman (input) for mailman id 429862;
 Tue, 25 Oct 2022 13:55:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ubGb=22=arm.com=andre.przywara@srs-se1.protection.inumbo.net>)
 id 1onKOf-0005Sz-7I
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 13:55:13 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a4084b9d-546c-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 15:55:10 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3624023A;
 Tue, 25 Oct 2022 06:55:16 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1358F3F71A;
 Tue, 25 Oct 2022 06:55:08 -0700 (PDT)
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
X-Inumbo-ID: a4084b9d-546c-11ed-91b5-6bf2151ebd3b
Date: Tue, 25 Oct 2022 14:55:06 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: "stefanos@xilinx.com" <stefanos@xilinx.com>, Julien Grall
 <julien@xen.org>, bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: GICv3: Aarch32: Need guidance on the atomic access of "union
 host_lpi" or if ITS is supported on R52
Message-ID: <20221025145506.5708839c@donnerap.cambridge.arm.com>
In-Reply-To: <bedc03b9-e6b9-c85b-27d6-33860ba7bdd7@amd.com>
References: <bedc03b9-e6b9-c85b-27d6-33860ba7bdd7@amd.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 25 Oct 2022 13:25:52 +0100
Ayan Kumar Halder <ayankuma@amd.com> wrote:

Hi,

> Hi Andre/All,
>=20
> This came up while porting Xen on R52.
>=20
> Refer "ARM DDI 0568A.cID110520", B1.3.1
>=20
> "A Generic Interrupt Controller (GIC) implemented with an Armv8-R PE=20
> must not implement LPI support. "
>=20
> Does this mean ITS is not supported on R52 ? I am assuming yes, please=20
> correct me if mistaken.

An ITS relies on LPIs, so yes: no ITS on a v8-R32 system. I cannot find
this restriction anymore in the v8-R64 supplement, so it would only apply
to the R52/AArch32.

>=20
> If the answer is no, then my next query is follows :-

Answering to that anyway ...

>=20
> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> index 9ca74bc321..dea60aac0d 100644
> --- a/xen/arch/arm/gic-v3-lpi.c
> +++ b/xen/arch/arm/gic-v3-lpi.c
> @@ -423,7 +423,7 @@ int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bi=
ts)
>  =C2=A0=C2=A0=C2=A0=C2=A0 int rc;
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0 /* We rely on the data structure being atomical=
ly accessible. */
> -=C2=A0=C2=A0=C2=A0 BUILD_BUG_ON(sizeof(union host_lpi) > sizeof(unsigned=
 long));
> +=C2=A0=C2=A0=C2=A0 BUILD_BUG_ON(sizeof(union host_lpi) > sizeof(uint64_t=
));
>=20
> "unsigned long" on Aarch32 is 32 bits. So this bug gets triggered.
>=20
> Is it fine to change it as above ?
>=20
> Reading"ARM DDI 0487G.bID07202", E2.2.1, "Requirements for single-copy=20
> atomicity".
>=20
> "LDRD and STRD accesses to 64-bit aligned locations are 64-bit=20
> single-copy atomic as seen by translation table walks and accesses to=20
> translation tables"

This (and the explaining paragraph) indeed suggests that this should
work architecturally, if you use normal system memory (where you would
hold page tables). It would be confined to ARMv8 AArch32 and ARMv7 w/
LPAE, which matches Xen's requirements.

But it's only atomic if you are using ldrd/strd, which you cannot know for
sure in C, because it's up to the compiler to generate the instructions.

This is why we have that test. Changing the unsigned long to uint64_t
would make the check pointless, since the data structure is 64-bits long,
so it would always be true.

So given that you don't seem to need it, right now, it would leave the
test alone.

If you need that on AArch32 anyway, you would need to replace accesses to
the host_lpis array with inline assembly accessors, to ensure ldrd/strd
instructions. This seems doable (there are only so many places which
directly access the array members), but would need a good use case.

Cheers,
Andre

> Does this imply that atomicity will be retained (with the above change)=20
> ? Os will this require ldrexd/strexd as R52 supports MPU (not MMU, so=20
> translation tables are irrelevant).

>=20
> Kind regards,
> Ayan
>=20


