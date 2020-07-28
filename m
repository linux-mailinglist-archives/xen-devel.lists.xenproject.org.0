Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E81A2310B8
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 19:18:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0TF4-0003IT-Ih; Tue, 28 Jul 2020 17:18:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UTyt=BH=yujala.com=srini@srs-us1.protection.inumbo.net>)
 id 1k0TF3-0003IO-6X
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 17:18:17 +0000
X-Inumbo-ID: 52a5df10-d0f6-11ea-a91d-12813bfff9fa
Received: from gproxy8-pub.mail.unifiedlayer.com (unknown [67.222.33.93])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 52a5df10-d0f6-11ea-a91d-12813bfff9fa;
 Tue, 28 Jul 2020 17:18:15 +0000 (UTC)
Received: from cmgw12.unifiedlayer.com (unknown [10.9.0.12])
 by gproxy8.mail.unifiedlayer.com (Postfix) with ESMTP id 0EBD01AB207
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2020 11:18:13 -0600 (MDT)
Received: from md-71.webhostbox.net ([204.11.58.143]) by cmsmtp with ESMTP
 id 0TEykTrfGWYdh0TEykGdC9; Tue, 28 Jul 2020 11:18:13 -0600
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=XYinMrx5 c=1 sm=1 tr=0
 a=yS0qNmEK8ed8yKyeR8R6rg==:117 a=yS0qNmEK8ed8yKyeR8R6rg==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10:nop_charset_1
 a=_RQrkK6FrEwA:10:nop_rcvd_month_year
 a=o-A10e_uY_YA:10:endurance_base64_authed_username_1 a=Dvu1CkYPihaQVThZ2xYA:9
 a=QEXdDO2ut3YA:10:nop_charset_2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=yujala.com; 
 s=default;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:In-Reply-To:References:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nr81cWo7PvcaFT6hx2wfxGYolQs3JoHlEmFOEpv77N4=; b=jQiatLthwg2MqmuAaQCDa1M2yW
 QqN2t95kN9qnxxBKxgxWNi8MMopBhpbV1Tm0XMEl9LH04ofVMGauzXDNhQkeBJWaXYOqG40zNa9/c
 f15qj0iGot6jA45Mb765IottS9uJwLMoO6stf/+qsrPF+t7h+dPKYHWxYYRRondDT9zsNMyF8tqPv
 9Rp48vrchjI+0ZgSqa5HXHstfwvCTvX4m388qRjMIzZAsTW61kwPILJCDLlcf2Jqvbx7C24J9ONDy
 8AsO+8hsuoKUqoGq1rUO2cVujY5U34KA/p/vTOzLNNY8tkafpMZSTB2KBG2FwE1HhG14akCpcHd9a
 QKefgG3g==;
Received: from 162-231-240-210.lightspeed.sntcca.sbcglobal.net
 ([162.231.240.210]:57263 helo=SRINIASUSLAPTOP)
 by md-71.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <srini@yujala.com>)
 id 1k0TEx-003F2G-V5; Tue, 28 Jul 2020 17:18:12 +0000
From: "Srinivas Bangalore" <srini@yujala.com>
To: "'Julien Grall'" <julien@xen.org>, <xen-devel@lists.xenproject.org>,
 "'Christopher Clark'" <christopher.w.clark@gmail.com>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>
References: <002801d66051$90fe2300$b2fa6900$@yujala.com>
 <9736680b-1c81-652b-552b-4103341bad50@xen.org>
 <000001d661cb$45cdaa10$d168fe30$@yujala.com>
 <5f985a6a-1bd6-9e68-f35f-b0b665688cee@xen.org>
 <002901d66462$a1dff530$e59fdf90$@yujala.com>
 <f8de3b17-d8bd-884d-a37f-6e6d58bcab8c@xen.org>
In-Reply-To: <f8de3b17-d8bd-884d-a37f-6e6d58bcab8c@xen.org>
Subject: RE: Porting Xen to Jetson Nano
Date: Tue, 28 Jul 2020 10:18:11 -0700
Message-ID: <003501d66503$125388e0$36fa9aa0$@yujala.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQIl7jaf5+ZLFToUYJ/P44Ycp83hwAFkmiVWAaCz0KsBnyrDOQIUsjAOAt+hgOCoMWHSIA==
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-71.webhostbox.net
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - yujala.com
X-BWhitelist: no
X-Source-IP: 162.231.240.210
X-Source-L: No
X-Exim-ID: 1k0TEx-003F2G-V5
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 162-231-240-210.lightspeed.sntcca.sbcglobal.net
 (SRINIASUSLAPTOP) [162.231.240.210]:57263
X-Source-Auth: srini@yujala.com
X-Email-Count: 1
X-Source-Cap: c3JpbmlxbGw7c3JpbmlxbGw7bWQtNzEud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> I struggled to find your comment inline as your e-mail client doesn't=20
> quote my answer. Please configure your e-mail client to use some form=20
> of quoting (the usual is '>').
>=20
> [<SB>] Done! Sorry about that.

Thanks this is a good start. Unfortunately, it doesn't fully help it =
when you have a reply split accross multiple line. This is become more =
proeminent after a few back and forth. Which e-mail client are you =
using?

[<SB>] I'm using Microsoft Outlook

> [<SB>] OK, I started porting the patch series to 4.14, but it is=20
> definitely not straightforward ;) Will take some time to do this. BTW, =

> I was looking at xen/arch/arm/Rules.mk in 4.14 and it is blank. The=20
> previous releases had some board-specific stuff in this file - esp the =
EARLY_PRINTK definitions.
> Has this changed in 4.14?

earlyprintk can now be configured using Kconfig. This should be easier =
to configure as you can do it the same way as you would for other =
options.

[<SB>] Thanks. Yes, I noticed this change. I'm working on applying the =
patches and will get back with an update in a day or two.

Thanks,
Srini



