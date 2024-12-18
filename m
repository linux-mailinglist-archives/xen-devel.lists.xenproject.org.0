Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D05929F69E4
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 16:20:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860558.1272578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNvqV-0008KC-3U; Wed, 18 Dec 2024 15:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860558.1272578; Wed, 18 Dec 2024 15:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNvqV-0008Gv-0O; Wed, 18 Dec 2024 15:20:19 +0000
Received: by outflank-mailman (input) for mailman id 860558;
 Wed, 18 Dec 2024 15:20:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v9KU=TL=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tNvqS-0006zz-Ak
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 15:20:16 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94463b92-bd53-11ef-a0d7-8be0dac302b0;
 Wed, 18 Dec 2024 16:20:14 +0100 (CET)
Received: from quovadis.eurecom.fr ([10.3.2.233])
 by drago1i.eurecom.fr with ESMTP; 18 Dec 2024 16:20:13 +0100
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
X-Inumbo-ID: 94463b92-bd53-11ef-a0d7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734535214; x=1766071214;
  h=from:in-reply-to:references:date:cc:to:mime-version:
   message-id:subject:content-transfer-encoding;
  bh=5ZU7nivsx9rGmY87ls5w7v67pilxaQJXCsAGiyJzFhg=;
  b=m8r3ZjXYLJBj9mnk7WsINJWBR0uVeIwVBgiPffFgWafbFDcrXdt22ehS
   H5Gw92LCXO2Zy5UmmzqBmx8nN6mLlf7R09LFp+tkIQAQ8anLEve3dUoxz
   DvwshZkMKMsoUvzuJaowt9YX7cdP75/xow1mfXiagTZpWQT/PRByWX3lb
   w=;
X-CSE-ConnectionGUID: 9uTemquwRyWonSnk91icPQ==
X-CSE-MsgGUID: XwhabISzQgOr5jHEwoJx7Q==
X-IronPort-AV: E=Sophos;i="6.12,244,1728943200"; 
   d="scan'208";a="28234079"
From: "Ariel Otilibili-Anieli" <Ariel.Otilibili-Anieli@eurecom.fr>
In-Reply-To: <e4f30083-67f0-4eab-92a8-bab717a4ba16@citrix.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 149.5.228.1
References: <20241214161350.70515-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241216231128.211648-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241216231128.211648-2-Ariel.Otilibili-Anieli@eurecom.fr>
 <fe201e59-beb0-4134-abbb-13a55a4ec987@citrix.com>
 <2f7a8a-6761b180-9a89-1d1363a0@43143421> <e4f30083-67f0-4eab-92a8-bab717a4ba16@citrix.com>
Date: Wed, 18 Dec 2024 16:20:13 +0100
Cc: xen-devel@lists.xenproject.org, "Jan Beulich" <jbeulich@suse.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Luca Fancellu" <luca.fancellu@arm.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
MIME-Version: 1.0
Message-ID: <2f7a8a-6762e800-9b0f-1d1363a0@43215295>
Subject: =?utf-8?q?Re=3A?= [PATCH v2 1/1] =?utf-8?q?tools=2C?=
 =?utf-8?q?_xen/scripts=3A?= clear out Python syntax warnings
User-Agent: SOGoMail 5.11.1
Content-Transfer-Encoding: quoted-printable

On Wednesday, December 18, 2024 15:21 CET, Andrew Cooper <andrew.cooper=
3@citrix.com> wrote:

> On 17/12/2024 5:13 pm, Ariel Otilibili-Anieli wrote:
> > On Tuesday, December 17, 2024 17:26 CET, Andrew Cooper <andrew.coop=
er3@citrix.com> wrote:
> >
> >> On 16/12/2024 11:07 pm, Ariel Otilibili wrote:
> >>> * since 3.12 invalid escape sequences generate SyntaxWarning
> >>> * in the future, these invalid sequences will generate SyntaxErro=
r
> >>> * therefore changed syntax to raw string notation.
> >>>
> >>> Link: https://docs.python.org/3/whatsnew/3.12.html#other-language=
-changes
> >>> Fixes: d8f3a67bf98 ("pygrub: further improve grub2 support")
> >>> Fixes: dd03048708a ("xen/pygrub: grub2/grub.cfg from RHEL 7 has n=
ew commands in menuentry")
> >>> Fixes: d1b93ea2615 ("tools/pygrub: Make pygrub understand default=
 entry in string format")
> >>> Fixes: 622e368758b ("Add ZFS libfsimage support patch")
> >>> Fixes: 02b26c02c7c ("xen/scripts: add cppcheck tool to the xen-an=
alysis.py script")
> >>> Fixes: 56c0063f4e7 ("xen/misra: xen-analysis.py: Improve the cppc=
heck version check")
> >>>
> >>> Cc: Anthony PERARD <anthony.perard@vates.tech>
> >>> Cc: Luca Fancellu <luca.fancellu@arm.com>
> >>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> >>> Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr=
>
> >> Having poked about a bit more, this is all a big mess, but these d=
o now
> >> work with Py3.12.
> >>
> >> leading \ for non-special characters are ignored in [], which is w=
hy ...
> >>
> >>> ---
> >>>  tools/pygrub/src/GrubConf.py                  | 4 ++--
> >>>  tools/pygrub/src/pygrub                       | 6 +++---
> >>>  xen/scripts/xen=5Fanalysis/cppcheck=5Fanalysis.py | 4 ++--
> >>>  3 files changed, 7 insertions(+), 7 deletions(-)
> >>>
> >>> diff --git a/tools/pygrub/src/GrubConf.py b/tools/pygrub/src/Grub=
Conf.py
> >>> index 580c9628ca..904e7d5567 100644
> >>> --- a/tools/pygrub/src/GrubConf.py
> >>> +++ b/tools/pygrub/src/GrubConf.py
> >>> @@ -320,7 +320,7 @@ class GrubConfigFile(=5FGrubConfigFile):
> >>>  def grub2=5Fhandle=5Fset(arg):
> >>>      (com,arg) =3D grub=5Fsplit(arg,2)
> >>>      com=3D"set:" + com
> >>> -    m =3D re.match("([\"\'])(.*)\\1", arg)
> >>> +    m =3D re.match(r"([\"\'])(.*)\1", arg)
> >> ... the \' works here.
> >>
> >> Anyway, I've checked the others and they seem to work, so I sugges=
t
> >> taking this roughly this form.
> >>
> >> Some notes about the commit message.=C2=A0 The subject ought to be=
:
> >>
> >> tools: Fix syntax warnings with Python 3.12
> >>
> >> The text should be a regular paragraph, rather than bullet points =
like this.
> >>
> >> I can fix this all on commit if you're happy.
> > Thanks for the feedback, Andrew; I'm happy with your changes.
>=20
> And committed.

Awesome, Andrew! Thanks to you!=20
>=20
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommitdiff;h=3D826a9e=
b072d449cb777d71f52923e6f5f20cefbe
>=20
> Thankyou for your patch.
>=20
> ~Andrew


