Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D9AB17FED
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 12:09:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1067067.1432047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhmhC-0005zU-Ka; Fri, 01 Aug 2025 10:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1067067.1432047; Fri, 01 Aug 2025 10:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhmhC-0005y7-FJ; Fri, 01 Aug 2025 10:09:02 +0000
Received: by outflank-mailman (input) for mailman id 1067067;
 Fri, 01 Aug 2025 10:09:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eZgs=2N=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uhmhA-0005WC-Vk
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 10:09:00 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a914b1f-6ebf-11f0-a320-13f23c93f187;
 Fri, 01 Aug 2025 12:08:59 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PR3PR03MB6604.eurprd03.prod.outlook.com (2603:10a6:102:7e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Fri, 1 Aug
 2025 10:08:55 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 10:08:55 +0000
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
X-Inumbo-ID: 8a914b1f-6ebf-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnzmmPibU4A3vpohfgHoCmw2j9zLQJ+PvcN1BSvmFhliTY04DWcGpwhfFcy1iuAIolzt9z0R9cFcRNOcFWFL35W64+TXBatuOTUlwba358cXj0WVqDROw7C3ZUuubeAme9cTrf/yhymcaymYme4uV3WFbbJMOkkLpLMJAEAFepZcLCexCIhTKRGzDMc6blhKBnxTyApbpimOSGM2UGXzFdIlthuwxmgxifmfkSEz9V2JZJOHx/1YsNywA2vJ19qcyCnhW7jAoOuWHIJDU1T/FnFyxOAYj/dARKDbo/HeYqnCNfVt9foSBdtOStBfjiUV6UYXrkWuTZq5ZO7munLk5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqUtdEBzonvA7w6wXArFRE0JOCfTp97yglL5Tec73yo=;
 b=pzeCOhjwSRt3QxFOJ9ElpbKk7NWATQL3tqpaNoD1jtVehazuzeed8xsT252tL2qySQcINX8BeVBAIIv4wF9ZreN8IU7JyxuHE4StKiL5IfIDExXAM+Gfn0yQfnh/O/g/GsP3w7UsvoM5H0hTDjzmhzyG395EcgTZCjorvEYMtUqJFiYeRG55W1y1iwDDVseABuukjV1ACPo4rPnYOJ3hq7K5+IBkf319mYCtIRhm0Kxu0j1SjprVQ7JwZVF0fHYOJHW/8TWQ9ha1z7w3La5e0ytY+xNrbJhmkr8y2k1rQZRkEeQi1Tafff1FF9t9AzaJ49qjlxVpiey3X2TZxqHxiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqUtdEBzonvA7w6wXArFRE0JOCfTp97yglL5Tec73yo=;
 b=RjAr+umqQVc8iw/+ZklHTKc5+C7WJaUwzClOlzsk88hpfuOB6n95ZlY/qFtDlOhdArd73v/QPzU4PsW/K8FO/0AC/hX8gvMVOi3uSiR36ZI10Op9Ol4AbfDNmL1uiKh5sYE7rKfkiCZVijra4DvJ9t9yBDPfme3KopNikUd9FfSjiP5wF46c4dVsAImFa6aSz0JQ59lzXKwmx3X9gSpfvLzGGLkbMGRiLupEJqa6M+a+FnP1gF/ZYILe9XCy8CPY8da0OrxtsIQtDxQ9feIkWGY7Wpad/hQ+kKqsut31LQO83tHbSyjqfAD51DY7PkAITOxKe/xNu0182ZlDVqw1dA==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>
Subject: [XEN][PATCH 2/3] xen/ppc: irq: drop unreachable pirq callbacks
Thread-Topic: [XEN][PATCH 2/3] xen/ppc: irq: drop unreachable pirq callbacks
Thread-Index: AQHcAsxKTnRncYzOaU+l30HRezRgVQ==
Date: Fri, 1 Aug 2025 10:08:55 +0000
Message-ID: <20250801100852.1260544-3-grygorii_strashko@epam.com>
References: <20250801100852.1260544-1-grygorii_strashko@epam.com>
In-Reply-To: <20250801100852.1260544-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|PR3PR03MB6604:EE_
x-ms-office365-filtering-correlation-id: 079e3fc7-c7bb-47b4-91ff-08ddd0e36cd5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?GjvjJS/Fssz5nWDZRBIL6IphhgiFdYab9xVPDXaoZXHmoqAQQC8cTTmxGS?=
 =?iso-8859-1?Q?kMGnrdW+jMOmLG5TsQzamwPveiqiuLa5CcrRlsjH9RN3tcRxkfqcx9lr2V?=
 =?iso-8859-1?Q?3mAlE87yipoKLYVm1YkX3U1QQfudBIECNKWzHw7I9+Mwx5o63YUUDbk3D0?=
 =?iso-8859-1?Q?BNOgsVv9/fCin9rNNGSABPXH0ycIww/W1E2gEkLjLKbPeFejfyGH2rpjdf?=
 =?iso-8859-1?Q?TK7IPvjuatco8ETeDc+qk3HtPynUEGzrCUN6OTZCpwQXXceTsYSPl00DA0?=
 =?iso-8859-1?Q?ftKHdpqCFmfhNFN/ZzHWCoTbJV5M5soAE9wUJrjgIThcQyTNG3LyR6uYb4?=
 =?iso-8859-1?Q?qwrmyrDABTLEK9T3RWLHC70k+X1OalfkY8XD8fkQ5w2W3LRqJkEbq+gzC6?=
 =?iso-8859-1?Q?MGFRHuxU8pmWFnzDJQ6ddUTinHXlEMlNd/QkI3f3pBatPS7mkD39AaANqS?=
 =?iso-8859-1?Q?r0E7gYj5OH3MCpMai12Il3CG/0dLM7bekgcYETogMHDX6bhUuEm+1za/Lr?=
 =?iso-8859-1?Q?BehpGtVCoMK7M/3YWu5iljJBsrDDyfbKjZmK3HaEYX6A8DGZv7tkcMmxOn?=
 =?iso-8859-1?Q?6WMuXq6wGzCgj3nA8niAGQxBvQG/RY70n3XKinD7XGLUkyiTsAZsdYx3s7?=
 =?iso-8859-1?Q?xH7DZSk9VYJnfzo62hHvJIiAWvxJmiSrC2qhBS8wat7fev6v+cpcEhe3Fn?=
 =?iso-8859-1?Q?xc/C3TQd1pSzp/otccRJltoJiNT9OvzX1ZaCscCFN19Hkza5OnVYIJmVJb?=
 =?iso-8859-1?Q?YGTTx+eVX1b32QCRDbJWu0OpjwqgmhkbFIVp+El40RYL5TGCvZeSRWfYBU?=
 =?iso-8859-1?Q?qEuD/eEiNQLVgmQyZQizjjnhDDPxVfX8yjSnpvwTh5XeScNYrH8N2AjQbr?=
 =?iso-8859-1?Q?50wS4/CERJd6t0MrAzYBBw9TxPsfjX4EtiFBKbzvBCnr0um68D2EnL0l1h?=
 =?iso-8859-1?Q?cRiTCmdOIJsttwadQyvb5u67djQle69+CbaelGAMq2paA6/5srxtJArouO?=
 =?iso-8859-1?Q?O32ZsrJPpJgiU3jmIn6OgCVGFD8v5fRHmAJXWE0y5Z+LTbWaK9ISaXQMQD?=
 =?iso-8859-1?Q?JWdmPWi82d72JuaogiMBO2deXbYl5t7fpAS+IF+X1NrT8Beves0SxwW+A6?=
 =?iso-8859-1?Q?LyY1l7itBOn3aBV8ddQkdXNeOe9wG9Gs4XYE9bbX142TDLUBd/kjiilxk1?=
 =?iso-8859-1?Q?VZHZte2mounfp2kcE1mUQ5S5tzNwgOtPC48gAptfpUozXNB0oU+pvjqfzQ?=
 =?iso-8859-1?Q?aZAFIH0gcNVUyUMUMa9bM/zESr5lJeXA7qYYsoQOEqoYUl2jVdCy58g/fA?=
 =?iso-8859-1?Q?pYxQqsV49SemF+S4mxXZFe+fzU1Zf9HzTIf3Rt9jxmBjTeM2NFDjJnrmtD?=
 =?iso-8859-1?Q?Bsh78C7iVT10mANIXCUCZGnFemg3Jodh+6gWRr0J+jUPrQQnkBx0bZ4TmF?=
 =?iso-8859-1?Q?KzyrvWQQjIwHfVfEc4UDyqHuskslm0kn5cm9maYMWn4T5OQ7fkQD8LGjiZ?=
 =?iso-8859-1?Q?/L/IWEycLJznNccpZEOP+dA20QvMK1mvN3RTi1QwfLRw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?WR+nd3+b+8W7Tqx+vlQ3/lQTdXcxAb8CPMElKQVwLweGzJBiHoNqwO4Op6?=
 =?iso-8859-1?Q?MXr+9DbgMLxwds8LEEP7ldA0PiCBvV7dPZlXC9ur5aeCIlpkLuNHZ6GWWn?=
 =?iso-8859-1?Q?k5zHk8mUK8Ws3/Z2CJZkSwTgLyuGhtgFY1PG4wLsk+JaqXWEatpiaH2PjY?=
 =?iso-8859-1?Q?W1CGbV0ua0pEepzPz+8UWTL93Arhh1D9m56zo5ef4YW6NeWZOU8bzjNwDY?=
 =?iso-8859-1?Q?Nn2PUDAVUom6H6lFJvsS+efhMMQGDWj0DKhlcIsvyvrLnpHg5ucKwXLQLm?=
 =?iso-8859-1?Q?K0dfpxn7Uvs74Q5rK3h+CmQhmk6/ImRDrIlLSXcgymQXzVk8ciQSd6WU3b?=
 =?iso-8859-1?Q?brRGlz4lElQ31tuhEbjBHeF7qKQgOdeV4JTQbwiLdakoKUU06y8kfEX61d?=
 =?iso-8859-1?Q?+H2evm7Wp8NDZM62HKnvjYfkgdZ6V5NOUMCrX4DWAmw7xz6IDtvU9NmQdH?=
 =?iso-8859-1?Q?d9T34R/mU4y8ph854RZPl9CLUC2QDkvEmi9cYSXyXgRvJgKfZ2PkLv+BRF?=
 =?iso-8859-1?Q?Sg0LAjFpTYoRMDl+68LicgVTFyPlWySDVmpvggtLBFk8vVfaEYfrS/CvZ8?=
 =?iso-8859-1?Q?3d8JR3H/Yh0PD8aWNZBA1VQRxBId2qDZKQ1xSW10qCCgTnkqUw2L07/lyF?=
 =?iso-8859-1?Q?Fid0wGPDouoLchs7NO04P1+8nYmamf/yVF3quRKM2Yv+Fx6XpQrfi+bVrl?=
 =?iso-8859-1?Q?d/xlhLO6ZJMFKymGkxL3ebpTtbRMn81YeZrn54GMVJTFl5AIaUXx4jCAGl?=
 =?iso-8859-1?Q?8dnbZw4+Wct4lTMreA9FhtgWRWUKQdaw+5ulGfsqy2ugGg5rlfbZH95oj8?=
 =?iso-8859-1?Q?awFmvICKOXkp9KePV8NPHnrcsxHfMUwDbdWdL1jOGxCHyg+lP2PRlKiP7E?=
 =?iso-8859-1?Q?NhKa02Q0w97UKbiAvDfFvBgrJRkN0Asqinlypx5TGEYblxye12tJlR47J0?=
 =?iso-8859-1?Q?gqRomR7SY1Xi2qrN7wVNOEI6BWZYquW6mxDE524hDsAZmDaDtc8+Q8MZld?=
 =?iso-8859-1?Q?UP7EXfv0+l4ZSK2cJgqhrpLTmjk6eRIhHk+b3sLR6pV6QLvTPdWcsQpM+t?=
 =?iso-8859-1?Q?et8wrvzDxD/zUtSwbS0XiOGT9vuCRsS29q+XLHvcX42cLqwMwFkWPkN3kH?=
 =?iso-8859-1?Q?jJ2QSHSFypD5IlGCwguF1ihe5lid4862k+pu40mDhOkrvDw7UU5kmxawB8?=
 =?iso-8859-1?Q?MISKP7lqfKBxnsoRZYjy90ZG1VDhONgz4LFJTLlWCPCR0nUcHkhZ/l+bCO?=
 =?iso-8859-1?Q?AdOjHqRzSgTJf+1HYuBNFXJ9uaseBLK710FyFqtqFdpLH/rfacFAHswBFV?=
 =?iso-8859-1?Q?WJJcBhMAQIHd0c1XX1NaLnQJ9PDgLNDoqg32Qt1wbP9/OD4HU6Oss1pVGN?=
 =?iso-8859-1?Q?BLJZxkqe7BF+bmvbgqisMlU4jlwuGclUwEIDdYhwkkniH3ReB9n10Iywdl?=
 =?iso-8859-1?Q?U8RR97YLUeAeKm9n29FJ/U4wCFqzuZxcY0Gudrm0oH528+NwZsDK1sRrYA?=
 =?iso-8859-1?Q?qvARYpWZADE1+Q6Anm6aqqDhJBsH9NCdQkXeaKBsjV2QHi2hlUOU0m4qOG?=
 =?iso-8859-1?Q?G83ZokEeHqAQFM48hfY0nU+wXNfkHsar5eFsqZIbyANNJETO642vqgoyLN?=
 =?iso-8859-1?Q?ieA5r3MUyi+SDxAM9Az1pLRcmssWuqjHxl5Ntil3uDjcThqJwkWfdDAw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 079e3fc7-c7bb-47b4-91ff-08ddd0e36cd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 10:08:55.3603
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WN29ZiglIWazQCgutMmdbt7H5DQQvpJXo49bYPREvmGkxAW3RWigJB5eu41c2tnTE+A+L7EZpnv/ZbsXz0kOmTLBi+0VcLq+l8IA6prngEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6604

From: Grygorii Strashko <grygorii_strashko@epam.com>

Hence all common pIRQ code is under CONFIG_HAS_PIRQ idefs corresponding PPC
arch pIRQ callbacks become unreachable, so drop them.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/ppc/stubs.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index 671e71aa0a60..bdaf474c5cc0 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -103,26 +103,6 @@ void smp_send_call_function_mask(const cpumask_t *mask=
)
=20
 /* irq.c */
=20
-struct pirq *alloc_pirq_struct(struct domain *d)
-{
-    BUG_ON("unimplemented");
-}
-
-int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
-{
-    BUG_ON("unimplemented");
-}
-
-void pirq_guest_unbind(struct domain *d, struct pirq *pirq)
-{
-    BUG_ON("unimplemented");
-}
-
-void pirq_set_affinity(struct domain *d, int pirq, const cpumask_t *mask)
-{
-    BUG_ON("unimplemented");
-}
-
 void irq_ack_none(struct irq_desc *desc)
 {
     BUG_ON("unimplemented");
--=20
2.34.1

