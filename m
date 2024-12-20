Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA0A9F8E8D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 10:04:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861748.1273825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOYvL-0007xe-TE; Fri, 20 Dec 2024 09:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861748.1273825; Fri, 20 Dec 2024 09:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOYvL-0007vX-Qg; Fri, 20 Dec 2024 09:03:55 +0000
Received: by outflank-mailman (input) for mailman id 861748;
 Fri, 20 Dec 2024 09:03:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MWOG=TN=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tOYvK-0007vR-QZ
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 09:03:54 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55785b75-beb1-11ef-99a3-01e77a169b0f;
 Fri, 20 Dec 2024 10:03:52 +0100 (CET)
Received: from quovadis.eurecom.fr ([10.3.2.233])
 by drago1i.eurecom.fr with ESMTP; 20 Dec 2024 10:03:52 +0100
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
X-Inumbo-ID: 55785b75-beb1-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734685432; x=1766221432;
  h=from:in-reply-to:references:date:cc:to:mime-version:
   message-id:subject:content-transfer-encoding;
  bh=STwzG7BvSs4BgHI3CfMNlpUO8/6REUgVlfpM909l1YQ=;
  b=eppYADWhSnRBnKxp2Ij0IU98syDbXZKpRfHNW3nNzzp8B5kLeSloy4Q7
   lVn1mVl/1hgjeCnERiSTCG6wNQx3W21G/dtivm1RPhpvYphwFCiNkFz2H
   AW/H7DQxE2/+5buGe1omR/YQKOSkmR7qPVXHr6CcF+fzLZ9cWQYAmxiC5
   4=;
X-CSE-ConnectionGUID: Xba9ydXCSO+nBS2GlrY4MA==
X-CSE-MsgGUID: sdCdrdC0S0ytfhVkAl0/Ug==
X-IronPort-AV: E=Sophos;i="6.12,250,1728943200"; 
   d="scan'208";a="28266652"
From: "Ariel Otilibili-Anieli" <Ariel.Otilibili-Anieli@eurecom.fr>
In-Reply-To: <DD13CE2A-E113-4A60-A8BD-9BD3612CADD8@arm.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 88.183.119.157
References: <20241219181352.709315-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241219181352.709315-2-Ariel.Otilibili-Anieli@eurecom.fr> <DD13CE2A-E113-4A60-A8BD-9BD3612CADD8@arm.com>
Date: Fri, 20 Dec 2024 10:03:52 +0100
Cc: =?utf-8?q?xen-devel=40lists=2Exenproject=2Eorg?= <xen-devel@lists.xenproject.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
To: "Luca Fancellu" <Luca.Fancellu@arm.com>
MIME-Version: 1.0
Message-ID: <2f7a88-67653300-f333-208cdcc@256863547>
Subject: =?utf-8?q?Re=3A?= [PATCH 1/1] =?utf-8?q?xen/scripts=3A?= Fix regex syntax 
 warnings with Python =?utf-8?q?3=2E12?=
User-Agent: SOGoMail 5.11.1
Content-Transfer-Encoding: quoted-printable

On Friday, December 20, 2024 09:49 CET, Luca Fancellu <Luca.Fancellu@ar=
m.com> wrote:

> Hi Ariel,
>=20
> > On 19 Dec 2024, at 18:10, Ariel Otilibili <Ariel.Otilibili-Anieli@e=
urecom.fr> wrote:
> >=20
> > Same fix than commit 826a9eb072 (tools: Fix regex syntax warnings w=
ith Python 3.12).
> >=20
> > It clears out the warning:
> >=20
> > ```
> > $ xen/scripts/xen-analysis.py
> > xen/scripts/xen=5Fanalysis/cppcheck=5Fanalysis.py:94: SyntaxWarning=
: invalid escape sequence '\*'
> >  comment=5Fline=5Fstarts =3D re.match('^[ \t]*/\*.*$', line)
> > ```
> >=20
> > The  warning appears only the first time the command is run, then i=
t disappears.
> >=20
> > Fixes: 02b26c02c7 (xen/scripts: add cppcheck tool to the xen-analys=
is.py script)
> > Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
> > --
>=20
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Hi Luca; thanks for the feedback.
>=20
>


