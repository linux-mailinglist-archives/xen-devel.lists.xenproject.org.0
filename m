Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8AF9F2F4F
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 12:31:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857787.1269995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9K0-0003MW-OL; Mon, 16 Dec 2024 11:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857787.1269995; Mon, 16 Dec 2024 11:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9K0-0003KV-L0; Mon, 16 Dec 2024 11:31:32 +0000
Received: by outflank-mailman (input) for mailman id 857787;
 Mon, 16 Dec 2024 11:31:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nBMF=TJ=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tN9Jy-0003Ib-UO
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 11:31:30 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4adc3f82-bba1-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 12:31:29 +0100 (CET)
Received: from quovadis.eurecom.fr ([10.3.2.233])
 by drago1i.eurecom.fr with ESMTP; 16 Dec 2024 12:31:28 +0100
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
X-Inumbo-ID: 4adc3f82-bba1-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734348689; x=1765884689;
  h=from:in-reply-to:references:date:cc:to:mime-version:
   message-id:subject:content-transfer-encoding;
  bh=jpjwLZOUhm3SnCDbRSSKNMJd+vdvvzdaNgDO2bNHUQ8=;
  b=pecQKPOE01dFqO3ZjelFXlCaTo69c5smV0r+5HngVhzBENcupyzZGbA9
   bPaMOliNZpWCX+MCp7NW05v2AsndolK9fmSLn9opH4aiorTVtGPvq9yOC
   daxpwWCfgNSl0Yf8dJjt0DJGI3/IjI1Ukc/19Ei51vwpZLRFBSCXlVimn
   g=;
X-CSE-ConnectionGUID: MeeKheEbToiZWXZSm/sv1g==
X-CSE-MsgGUID: ejIzTYT5QxuK3p/3K59WuQ==
X-IronPort-AV: E=Sophos;i="6.12,238,1728943200"; 
   d="scan'208";a="28195530"
From: "Ariel Otilibili-Anieli" <Ariel.Otilibili-Anieli@eurecom.fr>
In-Reply-To: <c484d9e6-62a4-4575-8cf1-93603533fd49@suse.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 149.5.228.1
References: <20241215154659.151158-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241215154659.151158-2-Ariel.Otilibili-Anieli@eurecom.fr>
 <5599dc89-0fa4-4255-b4a1-5b81e151d8c7@suse.com>
 <2f7a85-67600280-e411-38ee5c40@258420856> <c484d9e6-62a4-4575-8cf1-93603533fd49@suse.com>
Date: Mon, 16 Dec 2024 12:31:28 +0100
Cc: xen-devel@lists.xenproject.org, "Anthony PERARD" <anthony.perard@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
MIME-Version: 1.0
Message-ID: <2f7a86-67600f80-8b81-26131fc0@216081513>
Subject: =?utf-8?q?Re=3A?= [PATCH 1/1] =?utf-8?q?tools/libacpi=3A?= clear ASL 
 warning about PCI0
User-Agent: SOGoMail 5.11.1
Content-Transfer-Encoding: quoted-printable

On Monday, December 16, 2024 12:01 CET, Jan Beulich <jbeulich@suse.com>=
 wrote:

> On 16.12.2024 11:36, Ariel Otilibili-Anieli wrote:
> > On Monday, December 16, 2024 10:53 CET, Jan Beulich <jbeulich@suse.=
com> wrote:
> >=20
> >> On 15.12.2024 16:40, Ariel Otilibili wrote:
> >>> * iasl complains =5FHID and =5FADR cannot be used at the same tim=
e
> >>>
> >>> ```
> >>> /usr/bin/iasl -vs -p tools/firmware/hvmloader/dsdt=5Fanycpu.tmp -=
tc tools/firmware/hvmloader/dsdt=5Fanycpu.asl 2>&1 | grep -B10 HID
> >>> tools/firmware/hvmloader/dsdt=5Fanycpu.asl     40:        Device =
(PCI0)
> >>> Warning  3073 -                                    Multiple types=
 ^  (Device object requires either a =5FHID or =5FADR, but not both)
> >>> ```
> >>>
> >>> * generally =5FHID devices are enumerated and have their drivers =
loaded by ACPI
> >>> * this is from "ASL 2.0 Introduction and Overview" (page 4).
> >>> * removing =5FADR, the warning is cleared out.
> >>
> >> Okay, that's the positive aspect. Yet what about the potential fal=
lout thereof?
> >> Can you confirm that there's no risk of regressions with older gue=
st OSes, for
> >> example?
> >=20
> > OSes that were released after ACPI 2.0 should work [1]; including W=
inXP:=20
> > The 2.0 specs says either =5FHID or =5FADR should be included [2], =
not both (Section 6.1, page 146).
>=20
> We must be looking at two different variants of the spec then. My cop=
y says
> "device object must contain either an =5FHID object or an =5FADR obje=
ct, but can
> contain both." Also still in 2.0c. I agree that in e.g. 6.5 the wordi=
ng has
> changed. I also agree that the use of "either" doesn't help clarity.

I looked up 2.0 (July 2000); indeed, it said "can contain both". My bad=
.
>=20
> > I chose WinXP because, on another patch, it came up in the discussi=
on [3].

The change should work down to WinXP: the name =5FHID is kept.

```
$ git grep -B2 -A2 -n PNP0A03
tools/libacpi/dsdt.asl-40-       Device (PCI0)
tools/libacpi/dsdt.asl-41-       {
tools/libacpi/dsdt.asl:42:           Name (=5FHID, EisaId ("PNP0A03"))
tools/libacpi/dsdt.asl-43-           Name (=5FUID, 0x00)
tools/libacpi/dsdt.asl-44-           Name (=5FADR, 0x00)
```

Its EISA ID is "PNP0A03"; the namespace is reserved for Microsoft. Micr=
osoft identifies "PNP0A03" as PCI devices [1].

```
$ curl -k -s https://download.microsoft.com/download/1/6/1/161ba512-40e=
2-4cc9-843a-923143f3456c/devids.txt | grep PNP0A03
PNP0A03         PCI Bus
```
Linux displays PCI devices with =5FHID and no =5FHID [2].

[1] https://download.microsoft.com/download/1/6/1/161ba512-40e2-4cc9-84=
3a-923143f3456c/devids.txt
[2] https://www.infradead.org/~mchehab/kernel=5Fdocs/firmware-guide/acp=
i/namespace.html
>=20
> And indeed appropriately so.
>=20
> Jan


