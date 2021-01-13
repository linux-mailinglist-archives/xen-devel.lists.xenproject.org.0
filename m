Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4082F4772
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 10:24:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66377.117851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzcMw-0003L3-G7; Wed, 13 Jan 2021 09:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66377.117851; Wed, 13 Jan 2021 09:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzcMw-0003Ke-Ct; Wed, 13 Jan 2021 09:23:10 +0000
Received: by outflank-mailman (input) for mailman id 66377;
 Wed, 13 Jan 2021 09:23:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YK7t=GQ=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1kzcMv-0003KZ-4O
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 09:23:09 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90b8998f-5bd9-4f1a-b910-fdf6a619cb88;
 Wed, 13 Jan 2021 09:23:07 +0000 (UTC)
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
X-Inumbo-ID: 90b8998f-5bd9-4f1a-b910-fdf6a619cb88
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610529787;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qVHCCItG1Vp2ekTJOI2xNHExp7Sc1DIzwREOijHHGx4=;
  b=EGEPUii5lrWNkljhOCQXDubKLDC5KuHlud40CL4QhgfpyDzSy47wPPsU
   +vtUuPOFlF2K0XrsCOW+vSSU4Ia+6ELOJ9jKnQ/yN0woOwfj8Wpq5qeme
   e0AiJ3QOQMW2gs4l97w3RNfvv9LYuyqCu8K8xfAxfAj2/2abNuYOd9q6p
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3KlmD9Fys7zV0VZ1dZhV/x4Gj1v9MxJp7Lc8ooiO2jULWpDj81apuXH/WEeWn2XGNkTUHticdz
 70MvQYrlbM64xrUJY5X9Xib0GsdEBsaeoAsbta7QCoIXjmL7FePiMj/F4oDVDgcGr84A5h4AJT
 h/4ClWHk1mtY4eNHSEXeZbDI84K87HVepis1QYyTvZZbKti+9tUoL9z2598igzmMo4D2dGI+vT
 hK1qXmYMS0s8Hzme4zOCKF6pWfmMpmdyE0gG8m1lIVVNab39xeDEzatk/zbN4CicbZXdSlmamf
 E+I=
X-SBRS: 5.2
X-MesageID: 35204706
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,344,1602561600"; 
   d="scan'208";a="35204706"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHy1QQhs0amE/G2f1pR+tL0J/uZHuxMcDhetjsLsbtNmhdSJD2qp0DBv6CEJgTFIInMs0htoFYs/ibCt9qCpDySmSqtwDfk104YeR7zRDSFg0gHs5mDMpJheE6z3YgjjlU0I7bNipHK3c1n4r2W2wYweNkkXEK86wJKj8laiiDauktNjPQT4Zf3JhoIuQ3Jqbe66Xhtt4Gg3KzaHn7Z24TJqC0GCW+xbBtFtvL7kMVTkficTVWzppTBaWlSeip1zfFhc7y7FrbKk9wFJ8NtbRIqgf/ArbQ3kccZfCfgxlA4D5dHyNATc8kk0llb9RKpMijHVBrbrXYuEBlqZL/eUkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVHCCItG1Vp2ekTJOI2xNHExp7Sc1DIzwREOijHHGx4=;
 b=Yvuuj4tDoNbH5Tp+TvCrTMWIhlqJinAoLBHmD1zwudWBIBVlFNc9kG6MUcMWetFgNEUDSl1xCWYjdCBZncGdKmjlLoEx6WfUOIDlo/yb5ap8tmP4FNocHjgm+mgltC9XXaIGctkSRJVHDCatvHJFJBVr/Bl6JUulyU7nx2nhr2drDM1RcY7IT8RpDgV0X0Xt2F/S0Y2LKpn9NaekodrO1oe2z+tuvV4inr9D+tOnh7tM7I5wgmJVTKP4IdOoTj9ospzTJbH1gknTluc61+oSXlsOtno3VY+kM6kQVCMiBJx+fgimkOp/e4BoZ1tQ5sfrB4wwv0VnauYXCptwF6YlXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVHCCItG1Vp2ekTJOI2xNHExp7Sc1DIzwREOijHHGx4=;
 b=huuwHSKV9UEQ1PxSPTW94q7wtz3la3SvR+CFHYlKQz4VWsGvnE1mVjviKOZ1qxbMRnqs69EQzYqT9Zq3aLNxQarZgb/Upy4dNbo6HjLLuUzFK7+qNJxPwNHoOJw5+dGe+RcZCMHiIpWL+Ymxxk5imtoVSgoLL7xluc4MeHvOw0k=
From: Christian Lindig <christian.lindig@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Manuel Bouyer <bouyer@netbsd.org>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] ocaml/libs/eventchn: drop unneeded evtchn.h
Thread-Topic: [PATCH] ocaml/libs/eventchn: drop unneeded evtchn.h
Thread-Index: AQHW6Q7Gy8MrL7BYI06CYZg89/lnX6olSQvH
Date: Wed, 13 Jan 2021 09:22:38 +0000
Message-ID: <MWHPR03MB244513C9BE100B2F07DF337BF6A90@MWHPR03MB2445.namprd03.prod.outlook.com>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>,<20210112181242.1570-19-bouyer@antioche.eu.org>
In-Reply-To: <20210112181242.1570-19-bouyer@antioche.eu.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1bc22dbf-9f6b-40d8-fddb-08d8b7a4c522
x-ms-traffictypediagnostic: MWHPR03MB2990:
x-microsoft-antispam-prvs: <MWHPR03MB299060BD7F3635D2154AFEF4F6A90@MWHPR03MB2990.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:765;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IrqCYNPVoulMQy72U558ldbp3/Kkzxx+gVkmZzuyRRhTCOXK8ZpkubZqWPNaqW66Qf5tGyKQtCpaRFdwU7L32GnQyP5ryOqysZkn9ohufW5UpKiSL5UQ7b8FIffrJCNi6fg4AhmXqUcKnHJljfRykk5u7p2wmWqir2+QI4NGjspOBttKStdsezXPyrqs85tkxyIp+IyJvKNz36s10stxkgMltWVxGzYdMHBMVqsbQpAefaJOEe20wv9ATexDUK8zeJLL6w2wBQXYX3RwC+Lyhig6sahV+GeAxSkBdNRGiQVUHSGAh51dmMAOT8dxRt3VHkqToIVBerVEX4CvOwL/svK8J8un96Dmh3QRrdQso/Qn+76K4iMdomo0Dtl1AyYJOvMF2pApCv7WN0UzRq+41g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR03MB2445.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(83380400001)(9686003)(52536014)(110136005)(91956017)(66476007)(55016002)(76116006)(2906002)(66946007)(8676002)(86362001)(54906003)(4326008)(44832011)(316002)(8936002)(53546011)(478600001)(6506007)(4744005)(66446008)(71200400001)(64756008)(7696005)(66556008)(26005)(5660300002)(186003)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?wbX00tf2QR/4OdPS6g+QkedwSswkyeVeRsI432a5HjIOmHXynaMPfrXnBF1M?=
 =?us-ascii?Q?6pr2PtRqIj0M7z6BHT7tA2d8FY3IrQuoPT2VhWkPZXCZbxxzX4U39IPQOeiG?=
 =?us-ascii?Q?9mwbl70HDwtW+5f9EXaC2UQouVyOLpylbWuQK0g+jfGeziL+aA/KvR7PkKph?=
 =?us-ascii?Q?1kuCdu5Efsp7Gk00j4LpfjmuaJbkp2l/l4Hd1JvX13+8BvkHa/e5+1EwRgj5?=
 =?us-ascii?Q?mHk5X/ohOsS+488iDJ24DFEHlHGK3e///3lSMaixKDchCDMU92lTOgYq6n9t?=
 =?us-ascii?Q?GsYKKOawQiMtFUEHjExGwpwyMKUOVCIDmX0bOXUUL0p2ImUarPE+hWQ8b2i5?=
 =?us-ascii?Q?D8AthMYf8B4tybr7M3vzGGKR4ihX0SmmyvmtCTMjzuHHOCSnxJBjcARD1ElF?=
 =?us-ascii?Q?sQ8fciydltXNYfMn6P38uAODcDo0N2IBVY8yErioDZ/Upm+bx7XQ+bEn7DGs?=
 =?us-ascii?Q?tY9djN+Gal6xht85lQtXOQ7u7xHLim9y76z2osVRuDolbVEHTyfzNhEuGg91?=
 =?us-ascii?Q?n2syXx0oy+kjzNjxd/CaotUpBjhyzQyCge1Q4TePvgxydV7tktKN6ZfsPK6Z?=
 =?us-ascii?Q?eHtvGh8+8xs2+n0ohm66Xm4+7Fhrs5dzVe2MhJQda484J11R7maGHnsyQtQv?=
 =?us-ascii?Q?9v+NrfoLVk5pweJwEO74qk5u70HoPoFXOMidXMSzx/rNN5i3Zv2OMZqEmilR?=
 =?us-ascii?Q?hA9BNaHRhGR/aJCJJtGuc/K5dWe9OhTk09YwCVXiUcK+y4HVF/Ny9BFLFDQE?=
 =?us-ascii?Q?SIDUXHtbT9dT8ZhpjNp3Nnuo1ZycpqgPLc6BRv35AQBhpY4Kb0DToQYXhfHG?=
 =?us-ascii?Q?ETyuJyNIOvFs10jfUsuWBLd3qyhK2TM7lXrTKgq2K8BhPd3X54+7i1R0n8/W?=
 =?us-ascii?Q?LBGJBR1PXhFjNWIACdmFA7gzRQYyprBFquVJa7cK3Lw9H3ejmffwMYlwYT+W?=
 =?us-ascii?Q?45j108Y7Xc8dvoBYARqMZOEvTOgUszpW25qeQey3uxo=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR03MB2445.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc22dbf-9f6b-40d8-fddb-08d8b7a4c522
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2021 09:22:38.2069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +UTLH5ZtSebBiuWG05oycD1SWgt5/qFkuUbHAtk5+7B/kZ4YMlZl3DylyNiHd6EP5KO9NOb44cyXI6xmRZt/os5KBFCK5haT6z2lpkhQB5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2990
X-OriginatorOrg: citrix.com

Acked-by: Christian Lindig <christian.lindig@citrix.com>

________________________________________
From: Manuel Bouyer <bouyer@antioche.eu.org>
Sent: 12 January 2021 18:12
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer; Christian Lindig; David Scott; Ian Jackson; Wei Liu
Subject: [PATCH] ocaml/libs/eventchn: drop unneeded evtchn.h

From: Manuel Bouyer <bouyer@netbsd.org>

On NetBSD xen/sys/evtchn.h is not available any more. Just remove it as it'=
s
not needed.

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>

---
 tools/ocaml/libs/eventchn/xeneventchn_stubs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/ocaml/libs/eventchn/xeneventchn_stubs.c b/tools/ocaml/li=
bs/eventchn/xeneventchn_stubs.c
index ba40078d09..f889a7a2e4 100644
--- a/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
+++ b/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
@@ -22,7 +22,6 @@
 #include <stdint.h>
 #include <sys/ioctl.h>
 #include <xen/xen.h>
-#include <xen/sys/evtchn.h>
 #include <xenevtchn.h>

 #define CAML_NAME_SPACE
--
2.29.2


