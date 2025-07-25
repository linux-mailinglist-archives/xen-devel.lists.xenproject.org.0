Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 705BAB1205C
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 16:51:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058039.1425698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJlu-00085V-NG; Fri, 25 Jul 2025 14:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058039.1425698; Fri, 25 Jul 2025 14:51:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJlu-00083B-KB; Fri, 25 Jul 2025 14:51:42 +0000
Received: by outflank-mailman (input) for mailman id 1058039;
 Fri, 25 Jul 2025 14:51:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0WUh=2G=bounce.vates.tech=bounce-md_30504962.688399fa.v1-5deaf56d48394b5990f26caab2fa90c4@srs-se1.protection.inumbo.net>)
 id 1ufJlt-00082z-5B
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 14:51:41 +0000
Received: from mail145-22.atl61.mandrillapp.com
 (mail145-22.atl61.mandrillapp.com [198.2.145.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id decb3010-6966-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 16:51:40 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-22.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4bpW6L5HBCzFCWd2d
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 14:51:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5deaf56d48394b5990f26caab2fa90c4; Fri, 25 Jul 2025 14:51:38 +0000
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
X-Inumbo-ID: decb3010-6966-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1753455098; x=1753725098;
	bh=YhXzUl6druImlPOGaD1X+2tvwOgeWTG9+v80K7aFHHQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=DJ+FOiHDEGzQtaSNdoMkq5+4LS9VSpTt/5sfSj/0jw39UGpGDBbfJ17jp5mxSL0vV
	 r51Se/x5kFXEX7ZEU6a0QV8Roj7Ntl1IVFBQ+uL2EqQHBCSnjO9o0a77FefUdLmDva
	 3dYukOy/JcQf/DUUoU8lqdtL8gva6Qa1aDPs/TFFCQ40BQhP3Lqd4ShJWBcb3tPpXv
	 GCdTgUTfd8t1YZVtPYFZcsgoutll7RCAkfDPy7q5zpaIMY/ofBG1DOU2g93j93OHpH
	 RSAE6knxXjfVZqqW9KOwRil/baDiBNILVMo6vHcrRCAw8Edka4IldpgXY7mP4Op2UB
	 0aFugS0JvKanQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1753455098; x=1753715598; i=teddy.astie@vates.tech;
	bh=YhXzUl6druImlPOGaD1X+2tvwOgeWTG9+v80K7aFHHQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Tg0kV3G0ANFxWZOOI21nXQTx/EjclvBKiZNNI69JKL5HPf/J8A2LsnJFzEzNwDxJ0
	 s/zEME9CChvH2fNmrJ23ppEOudLze54nKGT6wNPZhHaPMkB8g2E6fAZxNBc19+vhTC
	 7bpWnRfJIR0lPJqBJcmfRZDKvGL/DM93dJkWEz4YsYNRgSFa9MDOu26FQOO+u0/xBN
	 St2RgHReGlDRFySSinGyYL2VIvdJByzy0rbkdnbvuaJLzMvEkwe0n5b62FTQkdzF0l
	 L/nkEiFi6abgBmHJuMIH/K+Vgfeco3rz7+h6CSdYqYUjW3jHFl/4V0jKvxkgmdfL3F
	 G8R5SPDbIppZg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v1=202/6]=20vpci:=20rename=20and=20export=20vpci=5Fguest=5Fmem=5Fbar=5F{read,write}?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1753455097377
Message-Id: <105d202b-ebba-40ed-bc73-522886b24a04@vates.tech>
To: "Mykyta Poturai" <Mykyta_Poturai@epam.com>, xen-devel@lists.xenproject.org
Cc: "Stewart Hildebrand" <stewart.hildebrand@amd.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <cover.1753450965.git.mykyta_poturai@epam.com> <94524317cf2a8719053fe1038bf39c30c99c280e.1753450965.git.mykyta_poturai@epam.com>
In-Reply-To: <94524317cf2a8719053fe1038bf39c30c99c280e.1753450965.git.mykyta_poturai@epam.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5deaf56d48394b5990f26caab2fa90c4?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250725:md
Date: Fri, 25 Jul 2025 14:51:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 25/07/2025 =C3=A0 16:26, Mykyta Poturai a =C3=A9crit=C2=A0:
> From: Stewart Hildebrand<stewart.hildebrand@amd.com>
> 
> Export functions required for SR-IOV support.
> 
> Signed-off-by: Stewart Hildebrand<stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai<mykyta_poturai@epam.com>

Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

Thanks


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



