Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC9FB16ED9
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:42:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065253.1430655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPoE-00028T-8z; Thu, 31 Jul 2025 09:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065253.1430655; Thu, 31 Jul 2025 09:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPoE-00025m-5P; Thu, 31 Jul 2025 09:42:46 +0000
Received: by outflank-mailman (input) for mailman id 1065253;
 Thu, 31 Jul 2025 09:42:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XXc8=2M=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uhPoC-00025Y-Ro
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:42:44 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4f48267-6df2-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 11:42:43 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU5PR03MB10524.eurprd03.prod.outlook.com (2603:10a6:10:526::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Thu, 31 Jul
 2025 09:42:37 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.010; Thu, 31 Jul 2025
 09:42:37 +0000
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
X-Inumbo-ID: b4f48267-6df2-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpCXId7WFtYd48esdnLl/gsBZY4f4m78VyB6fjSafmSDjdqxkqAGRsbR5HXNBHGXg07lo1D2t3xBSPaAOf2YDLX7gja2s4ApG91nMKY7EoUn7myalYn/4wd47iWGoPTO4y13B3aDRAkoa0JTuJJiwRT2cYrXC3NPtNfIy3hchf6HThVG2ozg353gis73qrePrA4sRlhw1R5QjDeMCHYQ5DVtYlxqmct356hyyCDs+CUqGuKm3DsFk1azowEc4pqhTRFKe0/bjOLMPOV3IaFMjqA6AzvebYIExoLfg3FD/hQVnHZF/RVJUdL4Lph9pf7j2H+KcDbvGjWozi50MPaGfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fioyZWFcXMIEFPbcuYZDTxSLNStujdo6wFiNN5v4AGo=;
 b=edpOhnt+fXZ0vToi2dlUqoy7K81TNHpcIgQD15NIx9aB3fyp1faQeQdQefRvlsVoZUUMxh1i24jstPoxI3UjXC7TUDNieNvwASGw8SROP5opULiIifG7xpEZiv+AoFR4ea2oiWft2n3wEwTRZBQnx0iTl1xCkIrp9yhc/Hq/pcSV8RJA49viQj/vTupA4Ul/1lXSB+WLn8JGGLRe6BLnXhmCDL9E32M3H/bC/ikyHh6pUWWsNECLApOfLgOFSsocyobjrw66UjisSsWmZB9hodkYwI9Z/lfQX+T4NrxxAfTIZPKRqDlIrLf1C9YwyMAFCeUEDyTnbYayYQ6xx0R6Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fioyZWFcXMIEFPbcuYZDTxSLNStujdo6wFiNN5v4AGo=;
 b=YbA476QUZRJrMYO3TmAmYJ8+gX8snNaGclfhRmfijsotSPTMcn/+6SCc/cz45uxrIoihpL9E1aIMqhrsweC6OgcUawhwwL6QsrQPGeQKqYF9E5J/iB0Tf+d5uN0qL5FolgP+2fGDmBZZZdLkF2j0TXbfsJ++HyEgdVR4jo5HWUuiEMoWdWrceuerVdHjAbwI24uuwrOerAGJCJTMk9QOLkhCx+wkTVy/QhLQBW5WiJ6sLzaeq5CdDuviEH3F7P9yKWEbz76cRTlzhmsm5i4MnBUE9/lvmV89/pUiITnp/hFPQm00rrPvgaMeAgKmE0fQjf54MV8slAFqtqpHdPL95A==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH 1/7] xen/arm64: domctl: set_address_size add check for
 vcpus not initialized
Thread-Topic: [XEN][PATCH 1/7] xen/arm64: domctl: set_address_size add check
 for vcpus not initialized
Thread-Index: AQHcAf9z+cgJcZklCkuBKcN3O427bQ==
Date: Thu, 31 Jul 2025 09:42:37 +0000
Message-ID: <20250731094234.996684-2-grygorii_strashko@epam.com>
References: <20250731094234.996684-1-grygorii_strashko@epam.com>
In-Reply-To: <20250731094234.996684-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|DU5PR03MB10524:EE_
x-ms-office365-filtering-correlation-id: 45cd3d56-08ed-480e-73c8-08ddd01695a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?JlP63jJUn9UYxLDUE8YY07w7MgXD0rSvq4KgGG8t0D3IV+u+ebiPxAXcfW?=
 =?iso-8859-1?Q?5S99TbATisbo56+0MBZ0pS7tk9tgyiPrtoWCYwP9yMCcJS0sCMVCoDYBjp?=
 =?iso-8859-1?Q?aMAWSjlGmprJOJwoNL6yr3jvm/mBSiK+H9138XgLyXvp1S9FTOebZSPUsU?=
 =?iso-8859-1?Q?JlAWfnZh3R50DriD75dcERblZxR3vQVh81ad6M73POd5W2ve6SL0lNZcvX?=
 =?iso-8859-1?Q?CgHx8aWbj9bh5BtG0KmjfPHeWwO3iSile63ll7eR3nsN3uASOK1Qy3GFO1?=
 =?iso-8859-1?Q?oKIKnWb1fmgwApDdQ0H7kClGpp8cECf1vDIlLCRU3jIdYnxqbDcb4ejkwA?=
 =?iso-8859-1?Q?I4Q9ns3kFgZGqpSxc3ODsXoyzZ22ZcL9pzJMz+VQTv1T5poJKUXA9DfwKx?=
 =?iso-8859-1?Q?uv1NwRj/SSFXrwsLsmdzwwaTCbJzuGZcPG95sIFuN3m7LIJ+H6IwtSMk4l?=
 =?iso-8859-1?Q?FU1uaGmTXt2vUG2M5nEPjI86bYpOpQNKMESbCWEUKx73GWVFRe7bCxGcLD?=
 =?iso-8859-1?Q?xWJi9CiAuwEpTt6F6cjgbHH+mWJu9weldzkFr7Rt6nCQqIDWkiwsPCgn1m?=
 =?iso-8859-1?Q?InTIXXQDWtO0P/kkDTXGl4YWRGZNTkK49bY0f7HYNhEQfy6zqNeL3ZURjj?=
 =?iso-8859-1?Q?NIfXpnpsDxTd3o6QvtwpC0PtNveKOvwRqTH/J6p8ZF3qw+HKtDXoM2zZP+?=
 =?iso-8859-1?Q?08R7FSZTYnx3YtPg2HuuoGrrE8mWxYOLoyXgzi6P6jDfCPYSY6e84ePQLP?=
 =?iso-8859-1?Q?k1qv/4Go7bmFYeb6wEFPntqY+t2DD5rQ0lzz1+27NbG44UYXSJW6QpYbhn?=
 =?iso-8859-1?Q?47VnaVHpFKERAfEsOgAqQ3HzjlIXDd3P5NMs4Dz/BqX343T75pUXn8q20b?=
 =?iso-8859-1?Q?9FfFu/rc7ddtdR65S5PibyyBM7ZwyS1eG2JFY9mV9mghB4a3W7zkz6QEK7?=
 =?iso-8859-1?Q?Q40dEld4waTYZ6vFqYj6bj22m7+fcirtqzFBta+ihdq3ziBW8pi2VXal/6?=
 =?iso-8859-1?Q?hGdPhR7v/x3+UpReTW2DS8Jg/21Um+O5Sda+qGG1oJa8NNXOKvtcUS/LOq?=
 =?iso-8859-1?Q?RKkv1bvxj1nLelRPUlbRLPafn23M8lyMhOF/9q8bzexNG27tBQjemw5kpq?=
 =?iso-8859-1?Q?nklZpCaRZIg3o4ZrTdQ6g1mSNWrCruVJCHb87PRuSMo7auIyM6zii7GgoZ?=
 =?iso-8859-1?Q?MtQkpu03Gs/eKV3RiVAzWep+1k5cDzS0/H+ezi+rMb+ck/tRsdLoABJc7l?=
 =?iso-8859-1?Q?B8IxS+gOCIs81kN6USVQGvM10qLMsqBHZV580znTGIEGpumxKXz9dtJR+9?=
 =?iso-8859-1?Q?09yfKgfQdDVedRqgSWpYDOQotFD3ILnvSmFORHQS+2LQ81MwtO6ejr9y0u?=
 =?iso-8859-1?Q?PEhy5Gwgv9vPLzhKPr/K4Nx2BrEE8j0GVHNf2hpeCqgqqlLBh//Ls4SW8O?=
 =?iso-8859-1?Q?cImotizJmAgozjEFgJDDtWUgcjWhxHq5zr20fJF4+HMo0/IYlE+FCXhPYW?=
 =?iso-8859-1?Q?CUE7Z52j0QkDgdupZ+eZQi9ysC0V0B0eIlmcZMv3J5wg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?td33fAaEwBOPOjqs2cM51HPJJ92uG3hncCzRpgASJ5HLnP1VUpQkLfrN3E?=
 =?iso-8859-1?Q?RrxZYaXMNOexVvPK4i75CtUOBC4CXH5ydfmQC7MpXjh4RuIafb5PVgVTsN?=
 =?iso-8859-1?Q?NmXxs5J+RUTBPw1Mor5fGsCxtpdnA/Crz65vPixqYPuyNSmBy+4f5Awaz/?=
 =?iso-8859-1?Q?odPSUrEDTZHmHYojAXAbX2SfUI1LS2w6Etegxk1XsvQXJYnN8+ToSdD74T?=
 =?iso-8859-1?Q?TtZhXsY9/LkjR9a+gUgIRZmIALXWVSYr3z1oWiv3uC4Ge+x1paYS+i50sR?=
 =?iso-8859-1?Q?aK50cNTyjJD2EcPlb9IS1PJPYs9cTvotpZueSbrtEyITOWesyEn8YtwJrS?=
 =?iso-8859-1?Q?I3zleY09S9HQ7+neeirJD4VJ1eNmq7aE/v1FCdTFSY6WnpIJ4haEjM1lM/?=
 =?iso-8859-1?Q?pEyQx7BSc+BIx7i6KUHIa4KqHi9stZ5H6YUw5yRGN792K8TXPtatfG4agx?=
 =?iso-8859-1?Q?oQIf2DNE77sKiHUS3P9Xtpa5x3XyfD6KPn3w5BDYF8k63QNCfTfsLNkEy7?=
 =?iso-8859-1?Q?z3GufAMu5Ffn3ImwIlCjigd3oO+qRsRMqW42t0bATqiqHXIDT0ittiRLxg?=
 =?iso-8859-1?Q?ycjIrX9AI3viiNLR5w5/fZGmmiczchSuOkrbnGAjF+YZeH7gI7Ya/FVNKL?=
 =?iso-8859-1?Q?GB9JkTqHExanY5bJRYMDkIZTsRZQa10gUorEnhuA7yBvIpFLjcDZjyPxuG?=
 =?iso-8859-1?Q?3X0SDheKYulCSvlY74GWrU/Ks5qBti3VRm9CLFqnlxth1MG/iNaFYJjWiT?=
 =?iso-8859-1?Q?/I8opSzgJDZYdljPkTUw7BmVTW/TDlquyIR5wjI4+kGOavFGthUVT3rnjc?=
 =?iso-8859-1?Q?x7xY9zpke8VNi1O8o99SuHHEfrC6wK9TvO4JvATO10QYe5gAlj3K+a6KI9?=
 =?iso-8859-1?Q?kRxBEH4R1Ki5BHDGsUPKlAZHiJkjEbIrqL5FBXCSIOL72c6ztOMrwAQOlp?=
 =?iso-8859-1?Q?hq1ZoI/czSfFSQVB18b8lcDB42tJ74620MkJ0Z7D/3D9J9jC0AvJ4KMGv5?=
 =?iso-8859-1?Q?IDietC7sBC0chsBZFAWoth93tnCjgpVNj6Tw4DP7Z+JkkiSXSeah8O0lys?=
 =?iso-8859-1?Q?oZNM0QO/HkqOR6ncoHtQLCAmSZjmHeMPpvsrT/VcZ+wyfR5X4x1w45OGVN?=
 =?iso-8859-1?Q?Pa7wpR8XQ9nwpF8+ld89nyd1kY2rulxoCIn3MUx5KvaBUhd5J5+0Pn8akr?=
 =?iso-8859-1?Q?57VZ4fkpTbRs4xLByvHW6LiUW7Z0iSh+zzbQ+hN7oIObyCexBwYeD0mHr4?=
 =?iso-8859-1?Q?BiMJwLl0qexmkOIixrASeri8jGdJIeK3m2UbxqrJGMAQxZsAQnMEP0axDr?=
 =?iso-8859-1?Q?4xEVXKYpygNpF794HwX5GIJuT1ftFlo/8+zooTcGjssP2dI44+XmPEF9pg?=
 =?iso-8859-1?Q?/WiYI1bwsqNPyaj42od0LqMU6rP4SOT65G6hp1/M9VVklVYAsOdt6G8f1a?=
 =?iso-8859-1?Q?UdPJkCUMmujWCBdzG06mlgtfjN4uII77fNBxVcoWGQI+3MJ5j/zrjCNMc9?=
 =?iso-8859-1?Q?OyzMWlrCX3syljC20kAIcEet//y57cMyNP2XY7D1aeMpkYblWTxghSF02V?=
 =?iso-8859-1?Q?LvJU1g3eGy+YKPTeKdMXVH68WF3mBLvP3xztztW1Jsu6Bal56CTiV+lt95?=
 =?iso-8859-1?Q?0xznRTuCBucrjvShVfx4BkDGAMLlQ+uotSTS+T7Climd8Wc1m5SvgtIw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45cd3d56-08ed-480e-73c8-08ddd01695a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 09:42:37.2713
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rAyHc84OsCIBBi33Q4G8tzpbYeslbqBCGweEScydJqYnDf2JvWEHCyBi1QPTVN5GzWcl2WwAPtTvxjpS1d3rq+5G3XA7fdoE1sVYheErZPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10524

From: Grygorii Strashko <grygorii_strashko@epam.com>

The vcpu ctx initialization (arch_set_info_guest()) is depends on proper
domain type (32/64bit) configuration, so check that vcpus are not
initialized when toolstack issues XEN_DOMCTL_set_address_size hypercall.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/arm/arm64/domctl.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/xen/arch/arm/arm64/domctl.c b/xen/arch/arm/arm64/domctl.c
index 8720d126c97d..82eff26fb0d1 100644
--- a/xen/arch/arm/arm64/domctl.c
+++ b/xen/arch/arm/arm64/domctl.c
@@ -13,6 +13,19 @@
 #include <asm/arm64/sve.h>
 #include <asm/cpufeature.h>
=20
+static bool vcpus_check_initialised(struct domain *d)
+{
+    struct vcpu *v;
+
+    for_each_vcpu(d, v)
+    {
+        if ( v->is_initialised )
+            return true;
+    }
+
+    return false;
+}
+
 static long switch_mode(struct domain *d, enum domain_type type)
 {
     struct vcpu *v;
@@ -21,6 +34,8 @@ static long switch_mode(struct domain *d, enum domain_typ=
e type)
         return -EINVAL;
     if ( domain_tot_pages(d) !=3D 0 )
         return -EBUSY;
+    if ( vcpus_check_initialised(d) )
+        return -EBUSY;
     if ( d->arch.type =3D=3D type )
         return 0;
=20
--=20
2.34.1

