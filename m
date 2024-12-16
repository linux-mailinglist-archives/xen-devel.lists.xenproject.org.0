Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA40E9F343C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 16:17:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858291.1270540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNCqV-0002L4-BU; Mon, 16 Dec 2024 15:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858291.1270540; Mon, 16 Dec 2024 15:17:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNCqV-0002IL-7n; Mon, 16 Dec 2024 15:17:19 +0000
Received: by outflank-mailman (input) for mailman id 858291;
 Mon, 16 Dec 2024 15:17:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nBMF=TJ=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tNCqT-0002IF-7b
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 15:17:17 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4eb097c-bbc0-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 16:17:15 +0100 (CET)
Received: from quovadis.eurecom.fr ([10.3.2.233])
 by drago1i.eurecom.fr with ESMTP; 16 Dec 2024 16:17:15 +0100
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
X-Inumbo-ID: d4eb097c-bbc0-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734362236; x=1765898236;
  h=from:in-reply-to:references:date:cc:to:mime-version:
   message-id:subject:content-transfer-encoding;
  bh=vjwrwN1TSV0GR+T4z0725EGrHDxuHqB8DXkEpEdQfLU=;
  b=QNAh8UDhcg7w2X24E2fGMFIzPSW+JRoCiPJ6ahCryKBDdJ7wTKjRsKyA
   o/dq+caZu1X8phR5zwllMg7XSekr/1bfvBZu07sLTH//pbb/C8WEGxCyF
   uaev/U7TeQ8PgvkN2Bds/YVNDVQxkKNYGMqpOpVNL+48ZZD1dcs9fTWwF
   U=;
X-CSE-ConnectionGUID: LmttF90qTg+ntKxtF+lw+g==
X-CSE-MsgGUID: Pym3MY4DSkemchtvzdOiyw==
X-IronPort-AV: E=Sophos;i="6.12,238,1728943200"; 
   d="scan'208";a="28199345"
From: "Ariel Otilibili-Anieli" <Ariel.Otilibili-Anieli@eurecom.fr>
In-Reply-To: <7f30f105-e13e-4e41-b432-82f9c12760d9@suse.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 149.5.228.1
References: <20241215154659.151158-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241215154659.151158-2-Ariel.Otilibili-Anieli@eurecom.fr>
 <5599dc89-0fa4-4255-b4a1-5b81e151d8c7@suse.com>
 <2f7a85-67600280-e411-38ee5c40@258420856>
 <c484d9e6-62a4-4575-8cf1-93603533fd49@suse.com>
 <2f7a86-67600f80-8b81-26131fc0@216081513>
 <3f3e9a77-5695-4c91-9fc2-11a3c21605c5@suse.com>
 <2f7a86-67601b00-8b99-26131fc0@216117285> <7f30f105-e13e-4e41-b432-82f9c12760d9@suse.com>
Date: Mon, 16 Dec 2024 16:17:15 +0100
Cc: xen-devel@lists.xenproject.org, "Anthony PERARD" <anthony.perard@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
MIME-Version: 1.0
Message-ID: <2f7a84-67604480-4bc5-4ac1e700@168713693>
Subject: =?utf-8?q?Re=3A?= [PATCH 1/1] =?utf-8?q?tools/libacpi=3A?= clear ASL 
 warning about PCI0
User-Agent: SOGoMail 5.11.1
Content-Transfer-Encoding: quoted-printable

On Monday, December 16, 2024 13:39 CET, Jan Beulich <jbeulich@suse.com>=
 wrote:

> On 16.12.2024 13:19, Ariel Otilibili-Anieli wrote:
> > On Monday, December 16, 2024 12:38 CET, Jan Beulich <jbeulich@suse.=
com> wrote:
> >=20
> >> On 16.12.2024 12:31, Ariel Otilibili-Anieli wrote:
> >>> On Monday, December 16, 2024 12:01 CET, Jan Beulich <jbeulich@sus=
e.com> wrote:
> >>>
> >>>> On 16.12.2024 11:36, Ariel Otilibili-Anieli wrote:
> >>>>> On Monday, December 16, 2024 10:53 CET, Jan Beulich <jbeulich@s=
use.com> wrote:
> >>>>>
> >>>>>> On 15.12.2024 16:40, Ariel Otilibili wrote:
> >>>>>>> * iasl complains =5FHID and =5FADR cannot be used at the same=
 time
> >>>>>>>
> >>>>>>> ```
> >>>>>>> /usr/bin/iasl -vs -p tools/firmware/hvmloader/dsdt=5Fanycpu.t=
mp -tc tools/firmware/hvmloader/dsdt=5Fanycpu.asl 2>&1 | grep -B10 HID
> >>>>>>> tools/firmware/hvmloader/dsdt=5Fanycpu.asl     40:        Dev=
ice (PCI0)
> >>>>>>> Warning  3073 -                                    Multiple t=
ypes ^  (Device object requires either a =5FHID or =5FADR, but not both=
)
> >>>>>>> ```
> >>>>>>>
> >>>>>>> * generally =5FHID devices are enumerated and have their driv=
ers loaded by ACPI
> >>>>>>> * this is from "ASL 2.0 Introduction and Overview" (page 4).
> >>>>>>> * removing =5FADR, the warning is cleared out.
> >>>>>>
> >>>>>> Okay, that's the positive aspect. Yet what about the potential=
 fallout thereof?
> >>>>>> Can you confirm that there's no risk of regressions with older=
 guest OSes, for
> >>>>>> example?
> >>>>>
> >>>>> OSes that were released after ACPI 2.0 should work [1]; includi=
ng WinXP:=20
> >>>>> The 2.0 specs says either =5FHID or =5FADR should be included [=
2], not both (Section 6.1, page 146).
> >>>>
> >>>> We must be looking at two different variants of the spec then. M=
y copy says
> >>>> "device object must contain either an =5FHID object or an =5FADR=
 object, but can
> >>>> contain both." Also still in 2.0c. I agree that in e.g. 6.5 the =
wording has
> >>>> changed. I also agree that the use of "either" doesn't help clar=
ity.
> >>>
> >>> I looked up 2.0 (July 2000); indeed, it said "can contain both". =
My bad.
> >>>>
> >>>>> I chose WinXP because, on another patch, it came up in the disc=
ussion [3].
> >>>
> >>> The change should work down to WinXP: the name =5FHID is kept.
> >>>
> >>> ```
> >>> $ git grep -B2 -A2 -n PNP0A03
> >>> tools/libacpi/dsdt.asl-40-       Device (PCI0)
> >>> tools/libacpi/dsdt.asl-41-       {
> >>> tools/libacpi/dsdt.asl:42:           Name (=5FHID, EisaId ("PNP0A=
03"))
> >>> tools/libacpi/dsdt.asl-43-           Name (=5FUID, 0x00)
> >>> tools/libacpi/dsdt.asl-44-           Name (=5FADR, 0x00)
> >>> ```
> >>>
> >>> Its EISA ID is "PNP0A03"; the namespace is reserved for Microsoft=
. Microsoft identifies "PNP0A03" as PCI devices [1].
> >>
> >> You again say "should" without explaining what you derive this fro=
m. Is it
> >> written down somewhere that no OS we (remotely) care about ever ev=
aluated
> >> =5FADR when =5FHID was there? As before, along side mentioning the=
 benefits of
> >> the change, I'd like to also see a discussion of risks.
> >>
> >=20
> > I derive this knowledge only from the APCI specs. Indeed, I've not =
researched how every OS interprets =5FHID and =5FADR.
> >=20
> > From your answer, I see you would like to be sure the change will i=
ntroduce no regression. I do understand you point of view; keeping the =
backward compatibility.=20
> >=20
> > The benefit is that the warning will be cleared. We agree on that.
> >=20
> > The risk is that, if ever any OS relies on =5FADR, and cannot read =
=5FHID; it would break.
> >=20
> > After thinking about it, the other way is less risky: this =5FHID n=
ame is only recognized by Windows. Every OS should (I did say it again,=
 should) understand =5FADR.
> >=20
> > If you think the change makes sense, I can remove =5FHID instead of=
 =5FADR.
>=20
> But that would remove relevant information, the the PNP ID serves a p=
urpose.

You are right, I dumped the DSDT tables of my Linux, and the PCI object=
 does use it:

```
# cat /sys/firmware/acpi/tables/DSDT > dsdt.dat=20
# iasl -e dsdt.dat -d dsdt.dsl
# grep PNP0A03 -B3 dsdt.dsl=20
        Device (PC00)
        {
            Name (=5FHID, EisaId ("PNP0A08") /* PCI Express Bus */)  //=
 =5FHID: Hardware ID
            Name (=5FCID, EisaId ("PNP0A03") /* PCI Bus */)  // =5FCID:=
 Compatible ID
```
>=20
> > Otherwise, I think we should end the discussion.
>=20
> Well, you may decide to withdraw / abandon the patch, or you may deci=
de to
> re-submit with an extended description, clarifying why the removal is
> expected to be safe. Even if - obviously - you can't inspect e.g. Win=
dows
> sources.

Thanks for the feedback, Jan; I am pushing another patch series. Docume=
nting all the findings.

I'll keep you posted,
Ariel
>=20
> Jan


