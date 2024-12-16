Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A49E59F3053
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 13:20:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857945.1270155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNA4R-0001C0-DP; Mon, 16 Dec 2024 12:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857945.1270155; Mon, 16 Dec 2024 12:19:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNA4R-0001A1-9p; Mon, 16 Dec 2024 12:19:31 +0000
Received: by outflank-mailman (input) for mailman id 857945;
 Mon, 16 Dec 2024 12:19:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nBMF=TJ=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tNA4P-00019c-Ms
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 12:19:29 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdfa2978-bba7-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 13:19:27 +0100 (CET)
Received: from quovadis.eurecom.fr ([10.3.2.233])
 by drago1i.eurecom.fr with ESMTP; 16 Dec 2024 13:19:26 +0100
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
X-Inumbo-ID: fdfa2978-bba7-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734351567; x=1765887567;
  h=from:in-reply-to:references:date:cc:to:mime-version:
   message-id:subject:content-transfer-encoding;
  bh=Ph989u006BDdQWYK2SGOsfoX14BuAnh6WrlmLplCcGM=;
  b=STCm6dSU6TkyupcdKpAcaIhKvNb4z2D6hQGLmHppcTna9BYobU1kZ5ja
   OKKRHq28V6Fm0wRkBeTQYCtFqM7JagsCak3zeVeWif4KRbY62xIbB/m+z
   63SW7f0Ak21nUbB9JJ6MPxAdJSt8fv0b+nXu+pDW7YCeNPUBbafOg0FnR
   o=;
X-CSE-ConnectionGUID: GPYmMVXFRJqJqD7wRLk8Gg==
X-CSE-MsgGUID: A+l9iTLMTwiswfry1jlgEw==
X-IronPort-AV: E=Sophos;i="6.12,238,1728943200"; 
   d="scan'208";a="28195922"
From: "Ariel Otilibili-Anieli" <Ariel.Otilibili-Anieli@eurecom.fr>
In-Reply-To: <3f3e9a77-5695-4c91-9fc2-11a3c21605c5@suse.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 149.5.228.1
References: <20241215154659.151158-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241215154659.151158-2-Ariel.Otilibili-Anieli@eurecom.fr>
 <5599dc89-0fa4-4255-b4a1-5b81e151d8c7@suse.com>
 <2f7a85-67600280-e411-38ee5c40@258420856>
 <c484d9e6-62a4-4575-8cf1-93603533fd49@suse.com>
 <2f7a86-67600f80-8b81-26131fc0@216081513> <3f3e9a77-5695-4c91-9fc2-11a3c21605c5@suse.com>
Date: Mon, 16 Dec 2024 13:19:26 +0100
Cc: xen-devel@lists.xenproject.org, "Anthony PERARD" <anthony.perard@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
MIME-Version: 1.0
Message-ID: <2f7a86-67601b00-8b99-26131fc0@216117285>
Subject: =?utf-8?q?Re=3A?= [PATCH 1/1] =?utf-8?q?tools/libacpi=3A?= clear ASL 
 warning about PCI0
User-Agent: SOGoMail 5.11.1
Content-Transfer-Encoding: quoted-printable

On Monday, December 16, 2024 12:38 CET, Jan Beulich <jbeulich@suse.com>=
 wrote:

> On 16.12.2024 12:31, Ariel Otilibili-Anieli wrote:
> > On Monday, December 16, 2024 12:01 CET, Jan Beulich <jbeulich@suse.=
com> wrote:
> >=20
> >> On 16.12.2024 11:36, Ariel Otilibili-Anieli wrote:
> >>> On Monday, December 16, 2024 10:53 CET, Jan Beulich <jbeulich@sus=
e.com> wrote:
> >>>
> >>>> On 15.12.2024 16:40, Ariel Otilibili wrote:
> >>>>> * iasl complains =5FHID and =5FADR cannot be used at the same t=
ime
> >>>>>
> >>>>> ```
> >>>>> /usr/bin/iasl -vs -p tools/firmware/hvmloader/dsdt=5Fanycpu.tmp=
 -tc tools/firmware/hvmloader/dsdt=5Fanycpu.asl 2>&1 | grep -B10 HID
> >>>>> tools/firmware/hvmloader/dsdt=5Fanycpu.asl     40:        Devic=
e (PCI0)
> >>>>> Warning  3073 -                                    Multiple typ=
es ^  (Device object requires either a =5FHID or =5FADR, but not both)
> >>>>> ```
> >>>>>
> >>>>> * generally =5FHID devices are enumerated and have their driver=
s loaded by ACPI
> >>>>> * this is from "ASL 2.0 Introduction and Overview" (page 4).
> >>>>> * removing =5FADR, the warning is cleared out.
> >>>>
> >>>> Okay, that's the positive aspect. Yet what about the potential f=
allout thereof?
> >>>> Can you confirm that there's no risk of regressions with older g=
uest OSes, for
> >>>> example?
> >>>
> >>> OSes that were released after ACPI 2.0 should work [1]; including=
 WinXP:=20
> >>> The 2.0 specs says either =5FHID or =5FADR should be included [2]=
, not both (Section 6.1, page 146).
> >>
> >> We must be looking at two different variants of the spec then. My =
copy says
> >> "device object must contain either an =5FHID object or an =5FADR o=
bject, but can
> >> contain both." Also still in 2.0c. I agree that in e.g. 6.5 the wo=
rding has
> >> changed. I also agree that the use of "either" doesn't help clarit=
y.
> >=20
> > I looked up 2.0 (July 2000); indeed, it said "can contain both". My=
 bad.
> >>
> >>> I chose WinXP because, on another patch, it came up in the discus=
sion [3].
> >=20
> > The change should work down to WinXP: the name =5FHID is kept.
> >=20
> > ```
> > $ git grep -B2 -A2 -n PNP0A03
> > tools/libacpi/dsdt.asl-40-       Device (PCI0)
> > tools/libacpi/dsdt.asl-41-       {
> > tools/libacpi/dsdt.asl:42:           Name (=5FHID, EisaId ("PNP0A03=
"))
> > tools/libacpi/dsdt.asl-43-           Name (=5FUID, 0x00)
> > tools/libacpi/dsdt.asl-44-           Name (=5FADR, 0x00)
> > ```
> >=20
> > Its EISA ID is "PNP0A03"; the namespace is reserved for Microsoft. =
Microsoft identifies "PNP0A03" as PCI devices [1].
>=20
> You again say "should" without explaining what you derive this from. =
Is it
> written down somewhere that no OS we (remotely) care about ever evalu=
ated
> =5FADR when =5FHID was there? As before, along side mentioning the be=
nefits of
> the change, I'd like to also see a discussion of risks.
>=20

I derive this knowledge only from the APCI specs. Indeed, I've not rese=
arched how every OS interprets =5FHID and =5FADR.

From your answer, I see you would like to be sure the change will intro=
duce no regression. I do understand you point of view; keeping the back=
ward compatibility.=20

The benefit is that the warning will be cleared. We agree on that.

The risk is that, if ever any OS relies on =5FADR, and cannot read =5FH=
ID; it would break.

After thinking about it, the other way is less risky: this =5FHID name =
is only recognized by Windows. Every OS should (I did say it again, sho=
uld) understand =5FADR.

If you think the change makes sense, I can remove =5FHID instead of =5F=
ADR.

Otherwise, I think we should end the discussion.

Ariel
> Jan


