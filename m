Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6D2B33D9E
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 13:05:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092962.1448560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqV0b-0005yV-Ha; Mon, 25 Aug 2025 11:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092962.1448560; Mon, 25 Aug 2025 11:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqV0b-0005wC-Er; Mon, 25 Aug 2025 11:05:05 +0000
Received: by outflank-mailman (input) for mailman id 1092962;
 Mon, 25 Aug 2025 11:05:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qZ/=3F=bounce.vates.tech=bounce-md_30504962.68ac4359.v1-3ab6877779b843d59553f79dcf58f529@srs-se1.protection.inumbo.net>)
 id 1uqV0a-0005w6-39
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 11:05:04 +0000
Received: from mail137-3.atl71.mandrillapp.com
 (mail137-3.atl71.mandrillapp.com [198.2.137.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 568b6dd0-81a3-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 13:04:58 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-3.atl71.mandrillapp.com (Mailchimp) with ESMTP id 4c9ScT1N69zBsVD81
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 11:04:57 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 3ab6877779b843d59553f79dcf58f529; Mon, 25 Aug 2025 11:04:57 +0000
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
X-Inumbo-ID: 568b6dd0-81a3-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1756119897; x=1756389897;
	bh=cUw53GTmkr3H+kCu2COqegNGDYK6OjdOIUD65Xzi6qw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=LgWeDi4RKC+mAK/CvE9f6i35EKICrEerD4gPEO1M86pTE2Uvlwq0/RMfWqNDXnBxB
	 PtJTMvDHrzUWXAzJo3JldbRzntaa/yd4tb6YxMl2LUoFOThevo+zOCb90deXggWqQV
	 VupaOP1K6ulOZ4EajOe94h5jKMfAeJw4rJQMFE0Mnt5Jaat8Ewf6ibjzYHomFRoTKN
	 3PBbTbNW4ntFU9BEWbVdyQmmusyqoRs0VvJt9G3tyjCgqMw01dOd8EwYbmO/fTlAZa
	 wdIQmjrA8FI5q5JtO37iD4dogoVG1Rtvn6yS8e0HrAs5mbJSKnWcj0lrB1zDPFkj28
	 aNXzf7h65VVWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1756119897; x=1756380397; i=teddy.astie@vates.tech;
	bh=cUw53GTmkr3H+kCu2COqegNGDYK6OjdOIUD65Xzi6qw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=pocKmL9+t7QkJzspfAvN7uONcw3fJ7bd8hEUs93UTpy7CXhO3kgmjwbQDUMnql0D8
	 AmuSVivlYE08X7hkI5L5GTR32Qd87/kA+qM50ZfhmabFmg6tFRjqt3WzbaOTuAQ+ja
	 bxepGol87quM/My0drq725cZsj8D6iOvpkIZZ2h/ezvziFO8L6aGmN8BkxGizeW3Sm
	 FFYfYeWfQQdwZLwYdPE9as8d0sFDrvxN0PQnl1idRIEGDFyB8Dpsdn4Qrh6lDzrFGZ
	 Ta/kCyDplRaqIkwxikAkdJZEwAPtT3Caw76Bk4uh3DeeuEj9BrsR4pDQpI2bh98edj
	 rF9TtjNtcoJuA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v5=203/4]=20hvmloader:=20add=20new=20SMBIOS=20tables=20(7,=208,=209,=2026,=2027,=2028)?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1756119896003
Message-Id: <5bc3f55c-ccfe-4dcb-9efa-a0d94d0fe92e@vates.tech>
To: "=?utf-8?Q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>
References: <cover.1755987697.git.w1benny@gmail.com> <4ecd33acd8bdf629e9103e97ff271150541e7415.1755987697.git.w1benny@gmail.com>
In-Reply-To: <4ecd33acd8bdf629e9103e97ff271150541e7415.1755987697.git.w1benny@gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.3ab6877779b843d59553f79dcf58f529?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250825:md
Date: Mon, 25 Aug 2025 11:04:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Le 24/08/2025 =C3=A0 00:29, Petr Bene=C5=A1 a =C3=A9crit=C2=A0:
> +/* Type 7 -- Cache Information */
> +static void *
> +smbios_type_7_init(void *start)
> +{
> +    /* Specification says Type 7 table has length of 13h for v2.1+. */
> +    BUILD_BUG_ON(sizeof(struct smbios_type_7) !=3D 19);
> +

I would prefer having hex constants (so that it matches the number 
format the specification gives).

e.g
BUILD_BUG_ON(sizeof(struct smbios_type_7) !=3D 0x13);

(same for other checks)

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



