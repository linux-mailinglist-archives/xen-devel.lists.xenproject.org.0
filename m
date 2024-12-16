Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D8F9F2E3C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 11:36:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857684.1269900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN8SW-0006lK-Nh; Mon, 16 Dec 2024 10:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857684.1269900; Mon, 16 Dec 2024 10:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN8SW-0006jc-L1; Mon, 16 Dec 2024 10:36:16 +0000
Received: by outflank-mailman (input) for mailman id 857684;
 Mon, 16 Dec 2024 10:36:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nBMF=TJ=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tN8SU-0006jW-L2
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 10:36:15 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91ac66f0-bb99-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 11:36:12 +0100 (CET)
Received: from quovadis.eurecom.fr ([10.3.2.233])
 by drago1i.eurecom.fr with ESMTP; 16 Dec 2024 11:36:11 +0100
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
X-Inumbo-ID: 91ac66f0-bb99-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734345372; x=1765881372;
  h=from:in-reply-to:references:date:cc:to:mime-version:
   message-id:subject:content-transfer-encoding;
  bh=6BkxDGBDhRIHdzbtNISrCpFxTwW7OpUIXdcwz/X+9OM=;
  b=UihHuV2VwYb59vjnzVPGnBU9jMmGkH4TFJhm5WUFqXU01cI6jqmuhuZs
   vddoTK2pbHX/72I4FBxhvX5WOPww+dVKmVXphOvBza1D1KbboPh4HMZTU
   CKVs/u579YQYePWRwHQCHl5Sun77dMa1fwye5RlKvtce2ADua7Zg32kqy
   g=;
X-CSE-ConnectionGUID: NKqfWz8PQ36utQdF98QfKQ==
X-CSE-MsgGUID: veJrgUAIRk20q0EmLljYNw==
X-IronPort-AV: E=Sophos;i="6.12,238,1728943200"; 
   d="scan'208";a="28194969"
From: "Ariel Otilibili-Anieli" <Ariel.Otilibili-Anieli@eurecom.fr>
In-Reply-To: <5599dc89-0fa4-4255-b4a1-5b81e151d8c7@suse.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 149.5.228.1
References: <20241215154659.151158-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241215154659.151158-2-Ariel.Otilibili-Anieli@eurecom.fr> <5599dc89-0fa4-4255-b4a1-5b81e151d8c7@suse.com>
Date: Mon, 16 Dec 2024 11:36:11 +0100
Cc: xen-devel@lists.xenproject.org, "Anthony PERARD" <anthony.perard@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
MIME-Version: 1.0
Message-ID: <2f7a85-67600280-e411-38ee5c40@258420856>
Subject: =?utf-8?q?Re=3A?= [PATCH 1/1] =?utf-8?q?tools/libacpi=3A?= clear ASL 
 warning about PCI0
User-Agent: SOGoMail 5.11.1
Content-Transfer-Encoding: quoted-printable

On Monday, December 16, 2024 10:53 CET, Jan Beulich <jbeulich@suse.com>=
 wrote:

> On 15.12.2024 16:40, Ariel Otilibili wrote:
> > * iasl complains =5FHID and =5FADR cannot be used at the same time
> >=20
> > ```
> > /usr/bin/iasl -vs -p tools/firmware/hvmloader/dsdt=5Fanycpu.tmp -tc=
 tools/firmware/hvmloader/dsdt=5Fanycpu.asl 2>&1 | grep -B10 HID
> > tools/firmware/hvmloader/dsdt=5Fanycpu.asl     40:        Device (P=
CI0)
> > Warning  3073 -                                    Multiple types ^=
  (Device object requires either a =5FHID or =5FADR, but not both)
> > ```
> >=20
> > * generally =5FHID devices are enumerated and have their drivers lo=
aded by ACPI
> > * this is from "ASL 2.0 Introduction and Overview" (page 4).
> > * removing =5FADR, the warning is cleared out.
>=20
> Okay, that's the positive aspect. Yet what about the potential fallou=
t thereof?
> Can you confirm that there's no risk of regressions with older guest =
OSes, for
> example?

Hi Jan,

OSes that were released after ACPI 2.0 should work [1]; including WinXP=
:=20
The 2.0 specs says either =5FHID or =5FADR should be included [2], not =
both (Section 6.1, page 146).

I chose WinXP because, on another patch, it came up in the discussion [=
3].

Ariel

[1] https://uefi.org/acpi/specs
[2] https://uefi.org/sites/default/files/resources/ACPI=5F2.pdf
[3] https://lore.kernel.org/all/ed248424-00a2-44ab-a7cf-3f2197d589a1@ci=
trix.com/
>=20
> Jan


