Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9CDB1204D
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 16:42:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058009.1425687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJcd-0005rC-T4; Fri, 25 Jul 2025 14:42:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058009.1425687; Fri, 25 Jul 2025 14:42:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJcd-0005pl-QA; Fri, 25 Jul 2025 14:42:07 +0000
Received: by outflank-mailman (input) for mailman id 1058009;
 Fri, 25 Jul 2025 14:42:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2f2K=2G=bounce.vates.tech=bounce-md_30504962.688397ba.v1-fd47771d7d17411d9542e2c1c7e55a5b@srs-se1.protection.inumbo.net>)
 id 1ufJcc-0005pf-FW
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 14:42:06 +0000
Received: from mail145-22.atl61.mandrillapp.com
 (mail145-22.atl61.mandrillapp.com [198.2.145.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8788fb12-6965-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 16:42:04 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-22.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4bpVvG3XJmzFCWYd2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 14:42:02 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 fd47771d7d17411d9542e2c1c7e55a5b; Fri, 25 Jul 2025 14:42:02 +0000
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
X-Inumbo-ID: 8788fb12-6965-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1753454522; x=1753724522;
	bh=sJeMobxdoGJqafWtyPbBQNtBPofdDd0sbKrSSYb2UrI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=aUho1gyp7NJNzRvG8nMZLr8reHvdtPMqG08B9lplezVJpvNdeTVx86Nu27PhfgoML
	 jXHfWQMTkNdsRfINRztahrM8sEX/khI3drUobwMhP33lliseGj9tHUSsH3/LBTVPj3
	 TrWccDGJdhac1vwunhifIHGr397rNGsdhssJWuTqpcPJRHHSxXsHPBs2BOd+AGavg/
	 2qD6ZvHknM4g+NogXw8rDfLieWvQmddzSj+XWG/cGss9IwwF5CO4KoVtxJe/6yIR6c
	 9HiBBhI7h9qyjxEyjVEa520ezEH/zmJoXu3xsrFtoXZlDZ2aHyVkX+q6vMDnDKfDdk
	 UP1mCQHTMLkNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1753454522; x=1753715022; i=teddy.astie@vates.tech;
	bh=sJeMobxdoGJqafWtyPbBQNtBPofdDd0sbKrSSYb2UrI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=iB/PIVv/W4/uOZUHLGf+4qiIqpq0c0Pdj+XAgRn/wRBHScUKYRN1jeXgXmuaaSiHc
	 jd0IJrXW3MFnEUuO6n2725kZ1IZ2BRkjH6M3uwvl43lWKjycQSpjRNcjeCBj3GMs8m
	 0Cuw3LAsIvOvcw/WR18Y7nnO78kqwMj203Gs0bVWuXFhk3Eguxg/LlUFoihKniiwbh
	 ao+VAONzaB43o1oV1izFgxB0fYDaYoHp51mVc9rcsPCo2hR1f6SXJUwSNaADlbJk4f
	 xlKxU8KLfz+UOXjBJVrfpYOgWpe0UKuycvDk1ow53Rc7aS8RPvifNKT5TW49/pXir7
	 ulcfhwJDBOY0g==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v1=201/6]=20vpci:=20rename=20and=20export=20vpci=5Fmodify=5Fbars?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1753454520796
Message-Id: <0368c524-7d4d-4c35-b37e-0ed7a41c7890@vates.tech>
To: "Mykyta Poturai" <Mykyta_Poturai@epam.com>, xen-devel@lists.xenproject.org
Cc: "Stewart Hildebrand" <stewart.hildebrand@amd.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <cover.1753450965.git.mykyta_poturai@epam.com> <d966c812dfa498db3a906c7ccbe0333d1833807e.1753450965.git.mykyta_poturai@epam.com>
In-Reply-To: <d966c812dfa498db3a906c7ccbe0333d1833807e.1753450965.git.mykyta_poturai@epam.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.fd47771d7d17411d9542e2c1c7e55a5b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250725:md
Date: Fri, 25 Jul 2025 14:42:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 25/07/2025 =C3=A0 16:26, Mykyta Poturai a =C3=A9crit=C2=A0:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Export functions required for SR-IOV support.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

Thanks


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



