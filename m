Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC41BAE3D1
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 19:45:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134393.1472296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3eOx-0005x1-Bd; Tue, 30 Sep 2025 17:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134393.1472296; Tue, 30 Sep 2025 17:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3eOx-0005uy-8x; Tue, 30 Sep 2025 17:44:35 +0000
Received: by outflank-mailman (input) for mailman id 1134393;
 Tue, 30 Sep 2025 17:44:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Niv=4J=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1v3eOv-0005ur-TK
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 17:44:34 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e90c530-9e25-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 19:44:31 +0200 (CEST)
Received: from AM9PR03MB7025.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::20)
 by VI1PR03MB6269.eurprd03.prod.outlook.com (2603:10a6:800:13c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 17:44:24 +0000
Received: from AM9PR03MB7025.eurprd03.prod.outlook.com
 ([fe80::bdd:3097:e48c:6c4b]) by AM9PR03MB7025.eurprd03.prod.outlook.com
 ([fe80::bdd:3097:e48c:6c4b%5]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 17:44:24 +0000
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
X-Inumbo-ID: 1e90c530-9e25-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EaeKvMcYk+RttFjx6vdlsKRn9ng2n949mWuLDIwYOGh1R300L6DLtl8oOLvCkAKu/AVfpMidiy9RP+putACDt+AQVNBWPfIVtoiwaSSHtnVpkafGuDZTwTyevG2S5Gd+eK9EAcY/ATLBpawYj+9b4SHHlWAlM/8gtPS/ry39eCHPa5c/ErDEFwg0HWgC20gchPzucTqm+YqOK1VYwtmvretdOhnJexXsNkFQ1ajItut6spH5LfyyskeXRCQcXfHyw4ULdvZqAWTl/Pm1+fl+p/XxkutCTX4AJGN5e7Ror3xbU4Jc5crsPCge0hBxdZTfXl/l3FnQ33wxDaYkzklhDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=detDOakbFZyYY+f8Axm7fNQyZuXhP3koC2LbQJDRUq8=;
 b=dNs+K+yWFp7wLxtcnFj15IZj38R/QO/vQ5w6fycZN6OEUolfLmWU8mm0AP8GX/PO9aNfzkvf7j891kL+79/k5jQcen+23juNAD7r1/dRX18CBf7dNki7c4+Xl9UmBYV4gKqjLMTPL0JqiT0//Mr7hf4EwyQXKGJjitzs8MXamS5Z+JZzLolm6aB7EMvg/FST0SeXr/9mGjJg3m7VDCUFJZ5Ni8vO7L4oYEQlTDadoOTV9hDTOyqC5tVJz6/JREgGP9jxkDv9PLlyaY/OXw87nUtzIZSI+I4VjGimEGL5kp3iqeKQcSVivHbnSZoeTmMyiYfsjysBBw9Bg93VheeOxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=detDOakbFZyYY+f8Axm7fNQyZuXhP3koC2LbQJDRUq8=;
 b=PkMUYpyxQdtDAkiYgSOHI6Df/Ukju1lWDUxpzufhxyCVSCVsRlFyoZB35tdMfUs+rx0kqGya1okhBQbrfCe5Xo8GohjjiRQ9SWA/ANsN13OWuVVo5fgHQRqjmbMRCfoHrfbLnNthCID3e50kile0+9ehQmaBw+acG9gAAtZpV6UjEnv0Jj95nl5sUwDCKFKYBHoIDOvlX0nicap+wvYRRbMcFuYMIq5AdrsH4BVXVJBpzgDhzBnlMEHaiIaGx6CmX02azoBWQH65t+V3rlOeBEIwEuEE2pPh5/iaydIhH+chBDGJ+fi9gNqTgSIPZNyoEncJjkOuMeSn73wIe5REyg==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Ayan Kumar Halder <ayankuma@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [ImageBuilder][PATCH V2] uboot-script-gen: Add ability to configure
 static event channels
Thread-Topic: [ImageBuilder][PATCH V2] uboot-script-gen: Add ability to
 configure static event channels
Thread-Index: AQHcMjHccr4/QgJ2+kWZ37s9cExJRg==
Date: Tue, 30 Sep 2025 17:44:24 +0000
Message-ID: <20250930174421.2329608-1-oleksandr_tyshchenko@epam.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7025:EE_|VI1PR03MB6269:EE_
x-ms-office365-filtering-correlation-id: 4696c420-4b99-4ccd-c987-08de0048fea3
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|42112799006|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?bx87LPqElIoclIcw8H9E0cAyS6ezoNZKsWhx8BKv4AuNB5TeZlWNzSb0e0?=
 =?iso-8859-1?Q?fjC8EUeWcPWDv5zu8wnRt8zOBKzH9k+TUiXCmQf9v1uck0pzvVEGqP5wsQ?=
 =?iso-8859-1?Q?qCLhK7B0WzqniAitBbIhQIH10FRIAFXW9e2B9vQCYNoGypuswi8jZ/EBdy?=
 =?iso-8859-1?Q?B9dnfxfdyG8EcZOZJOJ34wg3edGOYh4+/gKRZpGeSmm7GuE+kImN5D3e1f?=
 =?iso-8859-1?Q?2iWMK52L85DnYC8Cn1bNLcnfl1+xScFANFBoAOT/e2Zl1AKeVGyIjE3XWY?=
 =?iso-8859-1?Q?1YzuZe0GrJkbsYJNEhZRY9U6es67g/L0CBXu/Nv4EiQH3YlGR8QzxSsGZ6?=
 =?iso-8859-1?Q?43+6ix3rW2RlGVlBpD83k5zlYZ1Lx/qgLZ59dhkXwQrDJqPrgiQIjDpYbY?=
 =?iso-8859-1?Q?8IRngDQ3Y6l0B7TLhUgkM+LDrNGMh1KZp4lVL9wCcS9Bjeki0NmtaXa1bh?=
 =?iso-8859-1?Q?6wDtORYUdp3pvg+Gy5Qab330QWcxnPuxxYD3u4zjyRyYrPPftitJBIjOQF?=
 =?iso-8859-1?Q?hRqZwu4grMCzS2nIFnN8skukSVvw0JTBtKSv4ciFwCf91weMgGpSOyA3BN?=
 =?iso-8859-1?Q?JSv16FHq6r1WSQwMuZzzV+/d1twB4gKaurD7isC0wilxDQq7fbCnwYphNZ?=
 =?iso-8859-1?Q?u/tQY6thH132egUCSW9hFuxuIiz6HtpWinx03OJW/AxsB7PHZTvsK8mbuE?=
 =?iso-8859-1?Q?nIg7yw1wBz5fPA7/xCfoeFOoco1p9pDUKiv1X9LwFccEqQaUtczo51YSUb?=
 =?iso-8859-1?Q?Py6ZxaG7N1+AO7ruUuAEgtn1CRZfEzBFkRYuV/YXoJZzv0nRAiF9ElRhf7?=
 =?iso-8859-1?Q?vdMio/dauI5NjNJznp35Kyfi6LGv9RQkjNm13s71GBaQukH3rOc0XR88of?=
 =?iso-8859-1?Q?hTRbH2otCKQPSa1tTCdEn7SfjSFBwnff77zspjFq2B6vsEcCApOdwYKfOH?=
 =?iso-8859-1?Q?1kMChppXywGokYAfkx454CoLE74HiATPWiFRDsNesjedI8xilDxh5tARFN?=
 =?iso-8859-1?Q?r4AKhEyO8/T4tB2EyIAOG+UA+EWhPEGTXSucaLRytAH8t0Jd2+D0z2+tst?=
 =?iso-8859-1?Q?C/9FKfTaklTvRzMsr/pGiuC6ixhFmNRrE9hXwx7E35wR8tN/M9rctVzoI4?=
 =?iso-8859-1?Q?JjBHdRu8z7kvljxo4lMG1C4FqV1O2e7Qj5wKVXW2MP7KI2V8E1n84x7mjl?=
 =?iso-8859-1?Q?cK6ro4IbQUbY4ipEn5qAOApJ2a7XauZlhTVhTyyhF48Y7UBmzF96L3UoB0?=
 =?iso-8859-1?Q?93rxFxZfbMeBI9HDCU8MHWtADZfAa/JkzJtRkOVmK29tjcYsLsPOZlgp6z?=
 =?iso-8859-1?Q?jJkPGUmbdg9CS3gfPirys993q5rMv9nWLynxJToUVcRWkRFtLxbtyczVtz?=
 =?iso-8859-1?Q?ZlCfxdg+pza3ycQePSNFuOBcEmTtgomHroI7RYAcO9KLvk2dDXHqcai2Xk?=
 =?iso-8859-1?Q?fY5dN+FyIDeUGN2wnIHHg4J2ulQrqJ5gStXa1s3VBK8rrIfr3cem0XapwZ?=
 =?iso-8859-1?Q?jE9DCK2AkjUA4G/Oq073QMUp31R1Kxo5eVRkgX1StsDA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7025.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(42112799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?AeIg3I8uwG+4Cx/zItwahrFMbMC2pzntXTn7Gzs2Fgln2OkkwqZANRyG5c?=
 =?iso-8859-1?Q?LdJ6BKcCx+J/7uCmKP6JeozWvVbSqITkmDzHRdK0TrkMdW7/R28U06LK4V?=
 =?iso-8859-1?Q?LbZ0CS8C7dGaSK3rUhLU7H5xUeU3czKmQ5wNzfcwSO02Z/j8WTynwlQMZK?=
 =?iso-8859-1?Q?r8rwAcbj/HaReHp6TORTNljdZ3+OEPRdeB2jbGiS7mCcEaMThhQfGnrQMJ?=
 =?iso-8859-1?Q?821WaHs8MJfzfxzHANf6fY0shuBQGniYtFYIk+0cZQ1W8vl0n0ta3i+57U?=
 =?iso-8859-1?Q?t/BGig939D8J1jkflF1Awh46K73X6iEmYm5QV6E6bQWFdb2fX60RjRYyTD?=
 =?iso-8859-1?Q?ITo5hABdMZXu+VqssiZJZl5U1RsqXZ4U5wAZ8bReeibGBAS344r3zZLDxf?=
 =?iso-8859-1?Q?Be+jQTW2T4nJ/hUg0+spfbSEAYNtC645WZHlHzrEvDjx6/wQxAO1HeUVVG?=
 =?iso-8859-1?Q?5ZT7gxO+oia3E+TDjsrbihldlcL/hY2ynRrk3KjRNQPTTdJBEnHrUZsgPR?=
 =?iso-8859-1?Q?EKbYbgB5xz0XVCdm/fhTWdA0Ad4X1FmPjyQiJYNmbe6IlKL42jQUF34Z+w?=
 =?iso-8859-1?Q?lnbzqDBoyrFErapsR0S4WZyNxSiKOy0gIuh22+eLk2fF8jZMgqCs+OEuZh?=
 =?iso-8859-1?Q?mZ3/Hfnbw/jvKZ8ApN01wkaWFXypYgYwBSVpOMvDz1Qde16NBhjmlPxeOy?=
 =?iso-8859-1?Q?GqYnbhqKM0mn9XrUF/CXqyhFZteo5FkbZtd6ZqaphIi5R1ywK4kCSGGRSP?=
 =?iso-8859-1?Q?/VYw4gVN/CMTGTwZSNBeKN0NlX6fVumBg3quU3TbNvzO99gCpVHB8oPdx5?=
 =?iso-8859-1?Q?Azedj2D3N5i4iakwDfo5Sb0m4cx5q7SxhqGTvfGi9fTJYVwfjQzP/Bzl+l?=
 =?iso-8859-1?Q?7ga4jIJCZIdJPhuhqa+22uMyWsTDaBjaU5om28/bYwU5JWRUMW69Z3ngtt?=
 =?iso-8859-1?Q?rMGOpDWZT/RPjqPYMREOgDuPXpR0bKpC17sbkqlDlOMqXc68U96N/0nSvs?=
 =?iso-8859-1?Q?0k5vYdBOQ9a9MIQePXp6uHkRJkbGyNkcX0LMguuc+Jm+Xau41dYpPvPo8F?=
 =?iso-8859-1?Q?AT+5i47baOoTbVGuvch8eXhtou51Ba+khs7sJ0caD4Chgfv5eAEWDW/Dcy?=
 =?iso-8859-1?Q?2Ma3GIqKh6K9kScoydBlPx3+m1PZdXfN0UwnpjlTpbfYM4DbJ/X9bGxq8+?=
 =?iso-8859-1?Q?CPNLpuhL3Bi3SruSuQ3u+xDMLkJv8n6TtIwCAUrku/oZb6881L7ZXLI4Ta?=
 =?iso-8859-1?Q?Lz2QCYV4YVWGhAMoHZ3nRFcsFAhl8QCdYrJ5hxsXU6xVNPUWC/MdkOM5xR?=
 =?iso-8859-1?Q?w0Z7Z9UcN5Ebyxx/1SGEBG6AH+Kxhk3ffBuA9tiKpjHdicZnSm8B9J0s4K?=
 =?iso-8859-1?Q?d8ceNpcEp4anIk6zL+LiwtOKNuGGOx1CwLuaNalE8DaTLH/2A4Qeg/NDuv?=
 =?iso-8859-1?Q?L8NjVl9L37h1PrXuNBIFygfMkpH0kLlzmjcwhbHSR0EI4wtYrigaWSoJwJ?=
 =?iso-8859-1?Q?re0cZq2hTQO1kXLgIjhhkx9DwVMBZrTrqKsrzqoxCPYh+mLr3uQjCA8jga?=
 =?iso-8859-1?Q?QwFGrY2gMi9YkZXz+zuxmN5ZafRpbRx8OJRwHmtsAGBv1AOJPSYP874pHH?=
 =?iso-8859-1?Q?aAgI9H/UjV6w+yIIBduQBLFWhRRRzNbx6ph7TQg/of3YmbpsMgJZjcaqVS?=
 =?iso-8859-1?Q?UpFod9YyUB6X/gNbnR4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7025.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4696c420-4b99-4ccd-c987-08de0048fea3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 17:44:24.2309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A5zNPwW5EuHdkdbZ83xNpVatyLJody826OF5sTmkowo/pTKd7dW40hGCWf3YKmhbAb3O8Z5g6iC1LOOYz5tgN5+UZl3CKncb8vUxDEElnrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6269

Add DOMU_STATIC_EVTCHNS[number]=3D"local_port remote_dom_idx remote_port; .=
.."
configuration file string option specifying the static event channel
definitions for domain.

For the following example:
DOMU_STATIC_EVTCHNS[0]=3D"10 1 11; 12 1 13"
DOMU_STATIC_EVTCHNS[1]=3D"11 0 10; 13 0 12"

it generates:
fdt mknod /chosen/domU0 evtchn@10
fdt set /chosen/domU0/evtchn@10 phandle <0xfffffffe>
fdt set /chosen/domU0/evtchn@10 compatible "xen,evtchn-v1"
fdt set /chosen/domU0/evtchn@10 xen,evtchn <10 0xfffffffd>
fdt mknod /chosen/domU0 evtchn@12
fdt set /chosen/domU0/evtchn@12 phandle <0xfffffffc>
fdt set /chosen/domU0/evtchn@12 compatible "xen,evtchn-v1"
fdt set /chosen/domU0/evtchn@12 xen,evtchn <12 0xfffffffb>
...
fdt mknod /chosen/domU1 evtchn@11
fdt set /chosen/domU1/evtchn@11 phandle <0xfffffffd>
fdt set /chosen/domU1/evtchn@11 compatible "xen,evtchn-v1"
fdt set /chosen/domU1/evtchn@11 xen,evtchn <11 0xfffffffe>
fdt mknod /chosen/domU1 evtchn@13
fdt set /chosen/domU1/evtchn@13 phandle <0xfffffffb>
fdt set /chosen/domU1/evtchn@13 compatible "xen,evtchn-v1"
fdt set /chosen/domU1/evtchn@13 xen,evtchn <13 0xfffffffc>

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
  V2:
   - completely rework based on Stefano-s suggestion at:
     https://patchew.org/Xen/20250929180746.1881872-1-oleksandr._5Ftyshchen=
ko@epam.com/
---
---
 README.md                |  21 ++++++++
 scripts/uboot-script-gen |   7 +++
 scripts/xen_dt_domu      | 103 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 131 insertions(+)

diff --git a/README.md b/README.md
index 7b68cf5..2efac97 100644
--- a/README.md
+++ b/README.md
@@ -218,6 +218,27 @@ Where:
       DOMU_VCPU_HARD_AFFINITY[number,1]=3D"3"
 ```
=20
+- DOMU_STATIC_EVTCHNS[number]=3D"local_port remote_dom_idx remote_port; ..=
."
+  if specified, this parameter allows the configuration of static event ch=
annels
+  for inter-domain communication. Each entry in DOMU_STATIC_EVTCHNS[number=
]
+  specifies one or more event channels for a particular domain.
+  The configuration format for each event channel definition is a set of
+  three values:
+    - local_port: The numeric port number for the local domain's endpoint.
+      This value must be unique within current domain.
+    - remote_dom_idx: The array index of the remote domain (e.g., if
+      connecting to DomU1, this would be `1`).
+    - remote_port: The numeric port number for the remote domain's endpoin=
t.
+
+  Multiple event channel definitions for a single domain can be provided b=
y
+  separating them with a semicolon (;).
+
+  Below is an example that creates two pairs of bidirectional channels bet=
ween
+  two domains:
+  NUM_DOMUS=3D2
+  DOMU_STATIC_EVTCHNS[0]=3D"10 1 11; 12 1 13"
+  DOMU_STATIC_EVTCHNS[1]=3D"11 0 10; 13 0 12"
+
 - DOMU_COLORS[number] specifies the colors (cache coloring) to be used
   for the domain and is in the format startcolor-endcolor
=20
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 4f92610..e319de8 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -428,6 +428,8 @@ function xen_device_tree_editing()
         fi
     fi
=20
+    xen_dt_build_evtchns_map
+
     i=3D0
     while test $i -lt $NUM_DOMUS
     do
@@ -512,6 +514,11 @@ function xen_device_tree_editing()
=20
         xen_dt_domu_add_vcpu_nodes "/chosen/domU$i" $i ${DOMU_VCPUS[$i]}
=20
+        if test "${DOMU_STATIC_EVTCHNS[$i]}"
+        then
+            xen_dt_domu_add_evtchns "/chosen/domU$i" "$i" "${DOMU_STATIC_E=
VTCHNS[$i]}"
+        fi
+
         add_device_tree_kernel "/chosen/domU$i" "domU${i}_kernel" ${domU_k=
ernel_addr[$i]} ${domU_kernel_size[$i]} "${DOMU_CMD[$i]}"
         if test "${domU_ramdisk_addr[$i]}"
         then
diff --git a/scripts/xen_dt_domu b/scripts/xen_dt_domu
index 8134896..45891b3 100644
--- a/scripts/xen_dt_domu
+++ b/scripts/xen_dt_domu
@@ -37,3 +37,106 @@ function xen_dt_domu_add_vcpu_nodes()
         fi
     done
 }
+
+declare -A EVTCHN_ENDPOINT_TO_PHANDLE_MAP
+
+function xen_dt_build_evtchns_map()
+{
+    local def
+    local local_dom_idx
+    local local_port remote_dom_idx remote_port
+    local new_phandle
+    local local_key remote_key
+
+    for (( local_dom_idx=3D0; local_dom_idx<$NUM_DOMUS; local_dom_idx++ ))
+    do
+        local evtchn_str=3D${DOMU_STATIC_EVTCHNS[$local_dom_idx]}
+        if test -z "$evtchn_str"
+        then
+            continue
+        fi
+
+        IFS=3D';' read -ra evtchn_defs <<< "$evtchn_str"
+
+        # Loop over each definition and process both endpoints of the conn=
ection
+        for def in "${evtchn_defs[@]}"
+        do
+            read -r local_port remote_dom_idx remote_port <<< "$def"
+            if test -z "$local_port" || test -z "$remote_dom_idx" || test =
-z "$remote_port"
+            then
+                echo "Malformed evtchn definition: '$def' in DOMU_STATIC_E=
VTCHNS[$local_dom_idx]"
+                cleanup_and_return_err
+            fi
+
+            # Define keys for both endpoints of the connection
+            local_key=3D"$local_dom_idx,$local_port"
+            remote_key=3D"$remote_dom_idx,$remote_port"
+
+            if [[ "$local_key" =3D=3D "$remote_key" ]]; then
+                echo "Invalid evtchn definition: '$def' in DOMU_STATIC_EVT=
CHNS[$local_dom_idx]"
+                cleanup_and_return_err
+            fi
+
+            # For each key, if it is not already in our map, assign it a n=
ew phandle
+            if [[ ! -v EVTCHN_ENDPOINT_TO_PHANDLE_MAP[$local_key] ]]
+            then
+                get_next_phandle new_phandle
+                EVTCHN_ENDPOINT_TO_PHANDLE_MAP[$local_key]=3D$new_phandle
+                echo "Local endpoint '$local_key' is assigned phandle '$ne=
w_phandle'"
+            fi
+
+            if [[ ! -v EVTCHN_ENDPOINT_TO_PHANDLE_MAP[$remote_key] ]]
+            then
+                get_next_phandle new_phandle
+                EVTCHN_ENDPOINT_TO_PHANDLE_MAP[$remote_key]=3D$new_phandle
+                echo "Remote endpoint '$remote_key' is assigned phandle '$=
new_phandle'"
+            fi
+        done
+    done
+}
+
+function xen_dt_domu_add_evtchns()
+{
+    # $1 - dt path
+    local path=3D$1
+    # $2 - index of the current domain
+    local local_dom_idx=3D$2
+    # $3 - full event channel definition string
+    local evtchn_str=3D$3
+
+    local def
+    local local_port remote_dom_idx remote_port
+    local local_phandle remote_phandle
+    local local_key remote_key
+
+    IFS=3D';' read -ra evtchn_defs <<< "$evtchn_str"
+
+    # Loop over each definition and create a node for it
+    for def in "${evtchn_defs[@]}"
+    do
+        read -r local_port remote_dom_idx remote_port <<< "$def"
+        if test -z "$local_port" || test -z "$remote_dom_idx" || test -z "=
$remote_port"
+        then
+            echo "Malformed evtchn definition: '$def' in DOMU_STATIC_EVTCH=
NS[$local_dom_idx]"
+            cleanup_and_return_err
+        fi
+
+        # Re-create the keys for both endpoints of the connection to look =
up the phandles
+        local_key=3D"$local_dom_idx,$local_port"
+        remote_key=3D"$remote_dom_idx,$remote_port"
+
+        local_phandle=3D${EVTCHN_ENDPOINT_TO_PHANDLE_MAP[$local_key]}
+        remote_phandle=3D${EVTCHN_ENDPOINT_TO_PHANDLE_MAP[$remote_key]}
+
+        if test -z "$local_phandle" || test -z "$remote_phandle"
+        then
+            echo "Could not find phandle for endpoint '$local_key' or '$re=
mote_key'"
+            cleanup_and_return_err
+        fi
+
+        dt_mknode "${path}" "evtchn@$local_port"
+        dt_set "${path}/evtchn@$local_port" "phandle" "hex" "$local_phandl=
e"
+        dt_set "${path}/evtchn@$local_port" "compatible" "str" "xen,evtchn=
-v1"
+        dt_set "${path}/evtchn@$local_port" "xen,evtchn" "hex" "$local_por=
t $remote_phandle"
+    done
+}
--=20
2.34.1

