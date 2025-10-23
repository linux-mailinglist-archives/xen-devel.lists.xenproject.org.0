Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A58C002BB
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 11:15:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148890.1480729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBrQ8-0006rH-H0; Thu, 23 Oct 2025 09:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148890.1480729; Thu, 23 Oct 2025 09:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBrQ8-0006oK-E4; Thu, 23 Oct 2025 09:15:44 +0000
Received: by outflank-mailman (input) for mailman id 1148890;
 Thu, 23 Oct 2025 09:15:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aoY3=5A=bounce.vates.tech=bounce-md_30504962.68f9f23c.v1-858fa44fa26d4ebc8231ce3432493985@srs-se1.protection.inumbo.net>)
 id 1vBrQ6-0006nt-JL
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 09:15:42 +0000
Received: from mail187-3.suw11.mandrillapp.com
 (mail187-3.suw11.mandrillapp.com [198.2.187.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d883c527-aff0-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 11:15:41 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-3.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4csgP84770zDRHxn2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 09:15:40 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 858fa44fa26d4ebc8231ce3432493985; Thu, 23 Oct 2025 09:15:40 +0000
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
X-Inumbo-ID: d883c527-aff0-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761210940; x=1761480940;
	bh=fS2nYPg56uNxja9sxFpyEUA5FhMOkr+Zpgx1j4cWTmk=;
	h=From:Subject:Message-Id:To:References:Cc:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Kc4zE1a3vu55fVyn4jA27Ola9tu9nqvBxADJze+A9QDYoNgkbXCU6kuyVGaBG56j3
	 oAlIAiv6GK/iU91m7jvy8PfTU1Ko1vHWEvl70K8qn/ead7WLiZ8QDeWuw3wumWbYb+
	 g1/JbFzGCOopbzJ08eH1jkWwc3AUgzTF4qdno/+derpyisjnhy9Xs5pvJ0Ovj82nmz
	 bp90+gpw2sba2tPwHVqqXZUxcK5zn+XUEbjO/GrzV7U/wrGWtvR7jLlcangO10HAiv
	 HUwFx0gzL95Q7zowMiNBUDWJbJ8lY8T9hs/uvc2+qE0cNz1Yzd7XqIC2+PVYYp5kwu
	 KX80G5mjXLzAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761210940; x=1761471440; i=teddy.astie@vates.tech;
	bh=fS2nYPg56uNxja9sxFpyEUA5FhMOkr+Zpgx1j4cWTmk=;
	h=From:Subject:Message-Id:To:References:Cc:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=S07eKaYOyxxub7xwC4eBf8mRGY5/WdgOPK3Mv1A9enHI1nwotyTzY/LRUHvqlUAW/
	 zmidJzW2m+khDbWfN6nOnb6ui13YmQhQ/t5CJRmOwa0klL/5dOk7c7czeU39efrgPP
	 ei6dQEhimHZX7x4eIiY55E+EcRfQAeTuyXTxF7j8EZ6CjZ+BkI+2P5AhQ7TzECrcf4
	 RrT0DrCvn/HxB5IsF5DBOHLBJ19M1nTsaJoLJLG6VoA9GMUgi8dUCNchi40UcP48LL
	 PkKzUP2SknOD2aUH/hEwQSc6iPaE/aK6Yy7SonNyT5whAogbu/DiVKPi7qeEM2JcUK
	 MZeFnujtt+uDQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=200/5]=20Various=20IOMMU=20related=20simplifications?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761210939064
Message-Id: <b9baa995-da2c-49d9-844c-6b4c625721c0@vates.tech>
To: "Teddy Astie" <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1761209564.git.teddy.astie@vates.tech>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>
In-Reply-To: <cover.1761209564.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.858fa44fa26d4ebc8231ce3432493985?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251023:md
Date: Thu, 23 Oct 2025 09:15:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 23/10/2025 =C3=A0 11:12, Teddy Astie a =C3=A9crit=C2=A0:
> Various simplifications in the VT-d and IO-APIC code (mostly related to l=
egacy ia64 code).
> 
> No functional change intended.
> 
> Changed in v2 :
>   - drop (un)map_vtd_domain_page wrapper instead of moving it
>   - drop deprecated and Intel-exclusive iommu_inclusive_mapping=3D<boolea=
n>
>   - description and formatting changes
> 
> Teddy Astie (5):
>    vtd: Drop (un)map_vtd_domain_page wrapper
>    vtd: Drop "iommu_inclusive_mapping" command-line option
>    vtd: Collapse x86 subdirectory
>    vtd: Remove IO_xAPIC_route_entry macro
>    x86/ioapic: Don't open-code 32-bits rte reads
> 
>   CHANGELOG.md                                |  2 +
>   docs/misc/xen-command-line.pandoc           |  6 --
>   xen/arch/x86/include/asm/io_apic.h          |  1 +
>   xen/arch/x86/io_apic.c                      | 29 +++----
>   xen/drivers/passthrough/vtd/Makefile        |  3 +-
>   xen/drivers/passthrough/vtd/{x86 =3D> }/ats.c | 21 ++---
>   xen/drivers/passthrough/vtd/dmar.c          |  2 +-
>   xen/drivers/passthrough/vtd/extern.h        |  3 -
>   xen/drivers/passthrough/vtd/intremap.c      | 34 ++++----
>   xen/drivers/passthrough/vtd/iommu.c         | 88 ++++++++++-----------
>   xen/drivers/passthrough/vtd/iommu.h         |  7 +-
>   xen/drivers/passthrough/vtd/qinval.c        | 13 +--
>   xen/drivers/passthrough/vtd/utils.c         | 25 +++---
>   xen/drivers/passthrough/vtd/vtd.h           |  3 -
>   xen/drivers/passthrough/vtd/x86/Makefile    |  2 -
>   xen/drivers/passthrough/vtd/x86/vtd.c       | 48 -----------
>   16 files changed, 108 insertions(+), 179 deletions(-)
>   rename xen/drivers/passthrough/vtd/{x86 =3D> }/ats.c (92%)
>   delete mode 100644 xen/drivers/passthrough/vtd/x86/Makefile
>   delete mode 100644 xen/drivers/passthrough/vtd/x86/vtd.c
> 

I forgot to add the CC-ed people


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



