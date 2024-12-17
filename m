Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E65E9F520A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 18:14:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859684.1271811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNb8g-00062p-4L; Tue, 17 Dec 2024 17:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859684.1271811; Tue, 17 Dec 2024 17:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNb8g-00060B-0v; Tue, 17 Dec 2024 17:13:42 +0000
Received: by outflank-mailman (input) for mailman id 859684;
 Tue, 17 Dec 2024 17:13:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y98y=TK=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tNb8d-0005xd-ND
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 17:13:40 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40e298da-bc9a-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 18:13:37 +0100 (CET)
Received: from quovadis.eurecom.fr ([10.3.2.233])
 by drago1i.eurecom.fr with ESMTP; 17 Dec 2024 18:13:36 +0100
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
X-Inumbo-ID: 40e298da-bc9a-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734455617; x=1765991617;
  h=from:in-reply-to:references:date:cc:to:mime-version:
   message-id:subject:content-transfer-encoding;
  bh=FHWLiL11Zy6rSHgq+17T9boY/iUnomWJT6OT7/T4izs=;
  b=spiXS77tc6lRQmU21He6KOUSX1BVryTzfJcOi1FZDAE+1JSSOsmElYUJ
   iiOn09CtbwqqdxBR6ZsHuau7eMlj6J/j5d+EbG24aH4XIMXSFE22ErL3L
   zDNBLl2O8eUTz5Bbxvzq4h/aeQ1uDXwjITq5hyUe/h9FR69Cb7Hm/k4E4
   Y=;
X-CSE-ConnectionGUID: drW2AnqKROCPqSL3KZcewg==
X-CSE-MsgGUID: Eo+ffri8TIutMV2To6zqbg==
X-IronPort-AV: E=Sophos;i="6.12,242,1728943200"; 
   d="scan'208";a="28222177"
From: "Ariel Otilibili-Anieli" <Ariel.Otilibili-Anieli@eurecom.fr>
In-Reply-To: <fe201e59-beb0-4134-abbb-13a55a4ec987@citrix.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 149.5.228.1
References: <20241214161350.70515-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241216231128.211648-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241216231128.211648-2-Ariel.Otilibili-Anieli@eurecom.fr> <fe201e59-beb0-4134-abbb-13a55a4ec987@citrix.com>
Date: Tue, 17 Dec 2024 18:13:36 +0100
Cc: xen-devel@lists.xenproject.org, "Jan Beulich" <jbeulich@suse.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Luca Fancellu" <luca.fancellu@arm.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
MIME-Version: 1.0
Message-ID: <2f7a8a-6761b180-9a89-1d1363a0@43143421>
Subject: =?utf-8?q?Re=3A?= [PATCH v2 1/1] =?utf-8?q?tools=2C?=
 =?utf-8?q?_xen/scripts=3A?= clear out Python syntax warnings
User-Agent: SOGoMail 5.11.1
Content-Transfer-Encoding: quoted-printable

On Tuesday, December 17, 2024 17:26 CET, Andrew Cooper <andrew.cooper3@=
citrix.com> wrote:

> On 16/12/2024 11:07 pm, Ariel Otilibili wrote:
> > * since 3.12 invalid escape sequences generate SyntaxWarning
> > * in the future, these invalid sequences will generate SyntaxError
> > * therefore changed syntax to raw string notation.
> >
> > Link: https://docs.python.org/3/whatsnew/3.12.html#other-language-c=
hanges
> > Fixes: d8f3a67bf98 ("pygrub: further improve grub2 support")
> > Fixes: dd03048708a ("xen/pygrub: grub2/grub.cfg from RHEL 7 has new=
 commands in menuentry")
> > Fixes: d1b93ea2615 ("tools/pygrub: Make pygrub understand default e=
ntry in string format")
> > Fixes: 622e368758b ("Add ZFS libfsimage support patch")
> > Fixes: 02b26c02c7c ("xen/scripts: add cppcheck tool to the xen-anal=
ysis.py script")
> > Fixes: 56c0063f4e7 ("xen/misra: xen-analysis.py: Improve the cppche=
ck version check")
> >
> > Cc: Anthony PERARD <anthony.perard@vates.tech>
> > Cc: Luca Fancellu <luca.fancellu@arm.com>
> > Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
>=20
> Having poked about a bit more, this is all a big mess, but these do n=
ow
> work with Py3.12.
>=20
> leading \ for non-special characters are ignored in [], which is why =
...
>=20
> > ---
> >  tools/pygrub/src/GrubConf.py                  | 4 ++--
> >  tools/pygrub/src/pygrub                       | 6 +++---
> >  xen/scripts/xen=5Fanalysis/cppcheck=5Fanalysis.py | 4 ++--
> >  3 files changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/tools/pygrub/src/GrubConf.py b/tools/pygrub/src/GrubCo=
nf.py
> > index 580c9628ca..904e7d5567 100644
> > --- a/tools/pygrub/src/GrubConf.py
> > +++ b/tools/pygrub/src/GrubConf.py
> > @@ -320,7 +320,7 @@ class GrubConfigFile(=5FGrubConfigFile):
> >  def grub2=5Fhandle=5Fset(arg):
> >      (com,arg) =3D grub=5Fsplit(arg,2)
> >      com=3D"set:" + com
> > -    m =3D re.match("([\"\'])(.*)\\1", arg)
> > +    m =3D re.match(r"([\"\'])(.*)\1", arg)
>=20
> ... the \' works here.
>=20
> Anyway, I've checked the others and they seem to work, so I suggest
> taking this roughly this form.
>=20
> Some notes about the commit message.=C2=A0 The subject ought to be:
>=20
> tools: Fix syntax warnings with Python 3.12
>=20
> The text should be a regular paragraph, rather than bullet points lik=
e this.
>=20
> I can fix this all on commit if you're happy.

Thanks for the feedback, Andrew; I'm happy with your changes.
>=20
> ~Andrew


