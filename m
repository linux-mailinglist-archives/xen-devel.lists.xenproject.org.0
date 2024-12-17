Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE929F4C02
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 14:24:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859135.1271280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNXYy-0001Ya-Ut; Tue, 17 Dec 2024 13:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859135.1271280; Tue, 17 Dec 2024 13:24:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNXYy-0001WX-RS; Tue, 17 Dec 2024 13:24:36 +0000
Received: by outflank-mailman (input) for mailman id 859135;
 Tue, 17 Dec 2024 13:24:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y98y=TK=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tNXYw-0001WN-Vl
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 13:24:35 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fabdf2e-bc7a-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 14:24:32 +0100 (CET)
Received: from quovadis.eurecom.fr ([10.3.2.233])
 by drago1i.eurecom.fr with ESMTP; 17 Dec 2024 14:24:30 +0100
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
X-Inumbo-ID: 3fabdf2e-bc7a-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734441872; x=1765977872;
  h=from:in-reply-to:references:date:cc:to:mime-version:
   message-id:subject:content-transfer-encoding;
  bh=ZyXk/w6y7ozH21PqsR1QHKdKBhbv+9EmZViDXilyPrs=;
  b=JLkm2as8vUTY2Jx/ExnOVCg05y5axdtedY5H2AOz1aruxw41F4QBsnOV
   gnl4g10Dq2/0W8Y1qcFMQIMrrUXPB5EL+2x24t4aqm6qhUmMZnnyiE6AC
   qM0RD53sPs48f8Xd92il/K3d7h9g2z5yrr+4B1OxdHjKNsl+6FAQdVusm
   g=;
X-CSE-ConnectionGUID: AloIgMv7QPik1gFWDtDlrg==
X-CSE-MsgGUID: XkJt4LddRyOi8d6RFuqrQQ==
X-IronPort-AV: E=Sophos;i="6.12,241,1728943200"; 
   d="scan'208";a="28218447"
From: "Ariel Otilibili-Anieli" <Ariel.Otilibili-Anieli@eurecom.fr>
In-Reply-To: <cf8d3ff6-b72d-468e-a14f-1dfbc741f376@suse.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 149.5.228.1
References: <20241215154659.151158-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241216235241.217642-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241216235241.217642-2-Ariel.Otilibili-Anieli@eurecom.fr> <cf8d3ff6-b72d-468e-a14f-1dfbc741f376@suse.com>
Date: Tue, 17 Dec 2024 14:24:30 +0100
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
To: "Jan Beulich" <jbeulich@suse.com>
MIME-Version: 1.0
Message-ID: <2f7a89-67617b80-bf75-70827e80@196856502>
Subject: =?utf-8?q?Re=3A?= [PATCH v2 1/1] =?utf-8?q?tools/libacpi=3A?= clear ASL 
 warning about PCI0
User-Agent: SOGoMail 5.11.1
Content-Transfer-Encoding: quoted-printable

On Tuesday, December 17, 2024 10:29 CET, Jan Beulich <jbeulich@suse.com=
> wrote:

> On 17.12.2024 00:50, Ariel Otilibili wrote:
> > iasl complains =5FHID and =5FADR cannot be used at the same time:
> >=20
> > ```
> > /usr/bin/iasl -vs -p tools/firmware/hvmloader/dsdt=5Fanycpu.tmp -tc=
 tools/firmware/hvmloader/dsdt=5Fanycpu.asl 2>&1 | grep -B10 HID
> >=20
> > tools/firmware/hvmloader/dsdt=5Fanycpu.asl     40:        Device (P=
CI0)
> > Warning  3073 -                                    Multiple types ^=
  (Device object requires either a =5FHID or =5FADR, but not both)
> > ```
> >=20
> > Per ACPI 2.0 (Jul. 27, 2000; Section 6.1, page 146), the configurat=
ion was legit:
> >=20
> > "A device object must contain either an =5FHID object or an =5FADR =
object,
> > but can contain both." [1]
> >=20
> > But, per ACPI 6.5 (Aug. 2022), this is no more legit:
> >=20
> > "A device object must contain either an =5FHID object or an =5FADR =
object,
> > but must not contain both." [2]
> >=20
> > Generally =5FHID devices are enumerated and have their drivers load=
ed
> > by ACPI ("ASL 2.0 Introduction and Overview", page 4).
> >=20
> > Removing =5FADR, the warning is cleared out.
> >=20
> > The change should be compatible down to OSes released after ACPI 2.=
0,
> > including Windows XP:
>=20
> So my earlier hint apparently wasn't clear enough. I really would hav=
e
> expected you to determine in what version the wording changed. Even 5=
.1
> still has the old wording, and that's more than 10 years newer than 2=
.0.
> And then in 6.0 the wording first changed to "but should not contain
> both."

I can do that, Jan; I'll research from where did the wording changed.
>=20
> With this I'm afraid considering just WinXP is insufficient. May I al=
so
> point you at a Win2K related comment in acpi=5Fbuild=5Ftables(), seem=
ingly
> suggesting that that still was a "ACPI 1.0 operating system"? Further
> in that function you'll find that apparently, besides the 1.0 special
> case, we only support ACPI revisions 4 and 5. Therefore the spec chan=
ge
> in v6 would become relevant only once we actually supported (and
> surfaced to guests) v6. At that point I'd further be of the opinion t=
hat
> unless it can be proven that =5FADR is unused by any OS we (ever) car=
e(d)
> about, we'd need to further split the set of DSDTs we may make use of=
.
> One (pair) for up to 5.x with =5FADR present, and another (pair) for =
6.0
> and newer with =5FADR absent.

Let me look into acpi=5Fbuild=5Ftables(). Thanks for the hints.
>=20
> I'm further afraid that ...
>=20
> > 1. The =5FHID kept in the DSDT files is the EISA ID "PNP0A03",
> > Microsoft recognizes it as PCI bus:
> >=20
> > ```
> > $ curl -k -s https://download.microsoft.com/download/1/6/1/161ba512=
-40e2-4cc9-843a-923143f3456c/devids.txt | grep PNP0A
> >=20
> > PNP0A00         ISA Bus
> > PNP0A01         EISA Bus
> > PNP0A02         MCA Bus
> > PNP0A03         PCI Bus
> > PNP0A04         VESA/VL Bus
> > PNP0A05         Generic ACPI Bus
> > PNP0A06         Generic ACPI Extended-IO Bus (EIO bus)
> > ```
> >=20
> > 2. Linux 6.12 uses also =5FHID for identifying PCI devices [3]:
>=20
> ... this fact alone means very little here. The more important questi=
on is
> whether there are / were OSes which use(d) =5FADR for any purpose eve=
n when
> =5FHID is there. With just looking at the surface of just Linux, I fi=
nd e.g.
> a library-like function acpi=5Fget=5Flocal=5Fu64=5Faddress(), all use=
rs of which
> would need auditing. Plus, once done, we'd then still only know the s=
tate
> of things in one specific Linux version.
>=20
> Bottom line: I wonder whether iasl has an option to suppress that war=
ning.
> Sadly I can't find a new enough iasl anywhere on the systems I have e=
asy
> access to, so I can't check myself. If there was no way to suppress t=
his
> warning, I'd wonder whether this wasn't a shortcoming of the tool, as=
 the
> warning is clearly inappropriate when dealing with tables for pre-v6
> configurations.

There are flags to remove warnings:

```
$ iasl -h | grep -i warn
Errors, Warnings, and Remarks:
  -va                 Disable all errors/warnings/remarks
  -ve                 Report only errors (ignore warnings and remarks)
  -vi                 Less verbose errors and warnings for use with IDE=
s
  -vw <messageid>     Ignore specific error, warning or remark
  -vx <messageid>     Expect a specific warning, remark, or error
  -w <1|2|3>          Set warning reporting level
  -we                 Report warnings as errors
  -ww <messageid>     Report specific warning or remark as error

$ iasl -v=20

Intel ACPI Component Architecture
ASL+ Optimizing Compiler/Disassembler version 20240927
Copyright (c) 2000 - 2023 Intel Corporation
```

I am keeping you posted; I am compiling with warnings disabled.
Ariel
>=20
> Jan


