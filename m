Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F38AC98B6
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 03:05:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001790.1381914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLAfK-0002ak-9u; Sat, 31 May 2025 01:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001790.1381914; Sat, 31 May 2025 01:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLAfK-0002Yn-78; Sat, 31 May 2025 01:05:38 +0000
Received: by outflank-mailman (input) for mailman id 1001790;
 Sat, 31 May 2025 01:05:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pvzm=YP=bounce.vates.tech=bounce-md_30504962.683a55dc.v1-36efcc3b3419410d97b76d54f7f62a87@srs-se1.protection.inumbo.net>)
 id 1uLAfI-0002Yh-Jg
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 01:05:37 +0000
Received: from mail137-30.atl71.mandrillapp.com
 (mail137-30.atl71.mandrillapp.com [198.2.137.30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ab61e7c-3dbb-11f0-a300-13f23c93f187;
 Sat, 31 May 2025 03:05:34 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-30.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4b8MNY0CRfzMQxcv7
 for <xen-devel@lists.xenproject.org>; Sat, 31 May 2025 01:05:33 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 36efcc3b3419410d97b76d54f7f62a87; Sat, 31 May 2025 01:05:32 +0000
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
X-Inumbo-ID: 5ab61e7c-3dbb-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1748653533; x=1748923533;
	bh=iJOS3XVceWrZrrVbRKdBo+cD1yHkTmRhyARazJoTzPs=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mRZ1/95hQzLdsEAWkJZwpflihFija+Zi0JtMfvRBJM29AGAyIs5fRYVhZHmf/Nz+4
	 DcU31eb1dnISEsdhS6RpqNVu8aiw6Rn84Y7lFRRK8MUpyHd5Mh1yxYicjC6AzaOo2l
	 KvSien8lRWADYpfgSr37crevjXOX8yGqD3KP/KOLgpJ20Sy44bp695Y+lZQqInV/th
	 bMMlHQ0dISBQrOw6uI3uZHoPQonL77H9bW4FWXYiPK/+ymTdoB4ntb67cPTgFiOGv1
	 8btWL65DaytXfkB8n8HPppjen0JX50AO0uYla/yY0Q6uC4ZPexs8Ni3Ms+9TUtqbad
	 inS10odfJ1ygA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1748653533; x=1748914033; i=teddy.astie@vates.tech;
	bh=iJOS3XVceWrZrrVbRKdBo+cD1yHkTmRhyARazJoTzPs=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=jdVDY7D0bou0Q4DA4o0/atx/th1z0Jydq1mCiWppZrfNbupLRczsSXKGqTxVffyRC
	 B6B1p7gcHuNL64TNbW8p42sR7pf7pjQPwfSFfgeRHK/IBmXQSC5Vn53X3eg31ujp7K
	 +C+KaKQc4RHX9ZUBhQ6g7NrVKlWTLRHL6q4FZB11vNygMRotaZML/+Gv7tySCOik2Y
	 pPBc+Gor6S35eLe+ryvgc5B+1No4aX1omYZo4jRzvcoVPCfppdWo47A6z1wkkz1SuI
	 cUgxnMsWEuDTA2F1cKgv2DQoyOht8N7T+7Ep1SOXYmQqylD8icrWgFb+gog5SRfrQa
	 0v1CnfVzrMebA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v4=202/2]=20xen/domain:=20rewrite=20emulation=5Fflags=5Fok()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1748653531438
Message-Id: <ba511826-ec6a-4886-bbcb-ee68d96424b0@vates.tech>
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
References: <20250530220242.63175-1-dmukhin@ford.com> <20250530220242.63175-3-dmukhin@ford.com>
In-Reply-To: <20250530220242.63175-3-dmukhin@ford.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.36efcc3b3419410d97b76d54f7f62a87?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250531:md
Date: Sat, 31 May 2025 01:05:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Le 31/05/2025 =C3=A0 00:05, dmkhn@proton.me a =C3=A9crit=C2=A0:
> +        /* PVH dom0/domU or HVM domU */

This one is actually PVH dom0.

> +        {
> +            .caps   =3D CAP_HVM | CAP_HWDOM,
> +            .min    =3D X86_EMU_LAPIC | X86_EMU_IOAPIC | X86_EMU_VPCI,
> +            .opt    =3D 0,
> +        },
> +
> +        /* HVM domU */
> +        {
> +            .caps   =3D CAP_HVM | CAP_DOMU,
> +            .min    =3D X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ)=
,
> +            /* HVM PIRQ feature is user-selectable. */
> +            .opt    =3D X86_EMU_USE_PIRQ,
> +        },
> +
> +        /* PVH */

And this one being PVH domU.

> +        {
> +            .caps   =3D CAP_HVM | CAP_DOMU,
> +            .min    =3D X86_EMU_LAPIC,
> +            .opt    =3D 0,
> +        },

With that

Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



