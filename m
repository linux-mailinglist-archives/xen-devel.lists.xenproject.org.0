Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36168C40838
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 16:05:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157665.1486380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHO1S-00081L-AK; Fri, 07 Nov 2025 15:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157665.1486380; Fri, 07 Nov 2025 15:05:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHO1S-0007ys-5r; Fri, 07 Nov 2025 15:05:06 +0000
Received: by outflank-mailman (input) for mailman id 1157665;
 Fri, 07 Nov 2025 15:05:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qRNH=5P=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vHO1Q-0007Wa-UH
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 15:05:04 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 235932d9-bbeb-11f0-9d17-b5c5bf9af7f9;
 Fri, 07 Nov 2025 16:05:03 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AM9PR03MB7605.eurprd03.prod.outlook.com (2603:10a6:20b:419::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 15:05:00 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 15:05:00 +0000
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
X-Inumbo-ID: 235932d9-bbeb-11f0-9d17-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZU7OdoNyvhtAmfYIR6tkC6ZzRfysvZmsUe4PHlI93rBdlwmFv6LKjzo2Wk6utWybVYO+2CE19PCOCdza0LB9ZU9GFgDNCJ8pXA9Uwe+Sjpe5bZYkWiGLbMSNUHLLAf6EOpeFtJDapclU0g7Uhmtzc48IR0e2GEkVPcWowxYuzsaD9CBSyNtTxNDT7v8Fsey1dEZXe0KTEpCa2KFw3Tw/9SM2QGY/esqZcaLUC0xCEelFGExVUHj9dazMEQDazcVdLVtGWi0mJkVO8c2433Aw3Tt6ClZScfiw9Ckx+y8w1kBZZwRm983/oSHDNZUHEc8PPYeBvFrzu4/3P3WjISgNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgVfk4FXoNNmttOjLxewhjRJ89Pbkd84LjmcffM1nvg=;
 b=hb9DFirdVutGj2eSfnGkxIT4cIpseWv2+Jn2XiCRFObznNOwr+MHZapSEhGCXm8ESrDZF3bY1tYpOnW+bZtYgrl3mues8H4z/7CYV4MAgIWhJXL9i/pF+uvvVNIwb6ZMtQXTx4Z4+6Z4e7sh70e+2lsUmLsJ5UqMBxdXVfxmJ+60JUjgMybsAxv6g9w/BsluldkbhArVpu5I37OQBOt+zUGYlBmli8ih9ud9lyBdw/ePodtVsUg9Iiy+WANufrtBWpHtuddUDeieUS4yd1TUYEORF9tJFVovmhEvC7QlgwL0uU+W8ASFMNVq4ub3cWi35ALjS+eIIqVhKBA57rQfUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgVfk4FXoNNmttOjLxewhjRJ89Pbkd84LjmcffM1nvg=;
 b=dd8ikIcitqCHcp92ek/OzzzI9hgzYTlFLI3KIEtDPafK6580/mPbAPcSEVny6XlMiCkkS+s9rwquW4Wn52bGG5BwclLKvHyBpOY62w8OE4LAp/gBbU8Rtht9Tiii1MHZeoUGkiCJMrco89JzaJhhiarFQ62ypgVjMKBdJ+LwuCxtbRsBAbfuFm/1aBslbQGRTFhh24StNfKeFpdGopOxB0UPwK0NHyQCeXj3ncJeVeqiGp267QBg8VL4g5vS7NQ+eWY0nx3kHbHrU+/235wZLZzF9oHRC1O2jfQclpxsE5JCvcYrxYmJI7HTFj9QWyfxdto4lDKvHKh33Y4duSifjg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: [XEN][PATCH v2 2/3] x86/hvm: vmx: account for SHADOW_PAGING when use
 hvm_shadow_handle_cd()
Thread-Topic: [XEN][PATCH v2 2/3] x86/hvm: vmx: account for SHADOW_PAGING when
 use hvm_shadow_handle_cd()
Thread-Index: AQHcT/fjhmbe8yBr3kSMWLJqeXgjQQ==
Date: Fri, 7 Nov 2025 15:05:00 +0000
Message-ID: <20251107150456.2965906-3-grygorii_strashko@epam.com>
References: <20251107150456.2965906-1-grygorii_strashko@epam.com>
In-Reply-To: <20251107150456.2965906-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AM9PR03MB7605:EE_
x-ms-office365-filtering-correlation-id: 6910e75e-7cf2-43b0-f84a-08de1e0f060f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?XzC8mEYbw91clCZbWK/9CyBUmG+JRJVujQLxhHzt25OEyPNnDHvCOXFbAf?=
 =?iso-8859-1?Q?so7C9m1U3uGX/kznXHHT9AVOajK1GA/mORemy0Cxj0gGbsraBYqPlhw4P7?=
 =?iso-8859-1?Q?BaKKSRx1u+byh8QCFLRUFgB3Siey4Q7tc/n9Wi7mPByGCGWcf4JRtQY5uG?=
 =?iso-8859-1?Q?qzayTS9SXxX0fzMTCx5JZnK/VP0JpCmqpKjN0KKuLKGrmJb3X3vPFw/dLp?=
 =?iso-8859-1?Q?KJCetc/KnYrvodG4QIvuG2Lk6HiUaiDrAf+NuX/eoANak9cgiFYJpgKc/5?=
 =?iso-8859-1?Q?ueI/51iMiwcTu0Pw9o/ODY4WMy5TVDu1WSDlK35jKw1F2+Zq8PI2F5cWCW?=
 =?iso-8859-1?Q?I9UM8eNSAc7ar8yZ76WzvuFsLN0kb5gR9lHbiQQR2LhplBvt3RCxrffbWQ?=
 =?iso-8859-1?Q?dilYhaq2cvAA3nue72YPXd/nEIsH20UskCKK0HsUGoWcViwt+my9axU9zY?=
 =?iso-8859-1?Q?jUIiC3sTCXvoh3DQVnGZ5UPgLgrg+QYrBMUErFgLntYqgKtdMFYag7JRRT?=
 =?iso-8859-1?Q?ZaIs4wOjMR04J84/4Ku3zdZJcrxvfrOurPn1x+sS5LGVwkedrF1/SV3K9D?=
 =?iso-8859-1?Q?9zHxY7viahDSxHWN0MzX7jjDPB1HFXT8iIGbJOImVF14xqNtlXu5uayJwq?=
 =?iso-8859-1?Q?ngVhsXwLRdSZnC+0irxOqDG7cPy9X7ZBXNz08oqpADqXObGPwzzx58eLvk?=
 =?iso-8859-1?Q?PAsQhbwnk6gOnL+hccnMTyAmUqvEm9vm0Ok86wp4ZeLV9yfSZe9m8fgR8c?=
 =?iso-8859-1?Q?UKZGilhewQ604U1S4QaX/Gstimkdvu+i29QgEr8KqFAQDAGQJvQeMAspGH?=
 =?iso-8859-1?Q?UtnQDVID0fEjjOxasuVY7CCda4+c0b7N9LUJoSpmddNiq+SV8DoWc60gTx?=
 =?iso-8859-1?Q?Fw/AHN01/lGOvDM38NUvCS2VxBV1HAF1L7lGJvNxzX9AeGo55C15/q5P5V?=
 =?iso-8859-1?Q?+6Xhwg0cVl9+fR46xd2RkPI8PCCJenT8AdKl8mU39j+OR4isQxq4IImNqt?=
 =?iso-8859-1?Q?dKW+SGTYVzlj5neCgbnBm8JeKr3GOXfPiS6OYIrLJE4J3+ScIEI9E9eWnN?=
 =?iso-8859-1?Q?lgYpekiJiCE+yUxDd1Aw7dvhfiQEMGUYIah8Sm2bBvBUre7oqw4NVgsx+R?=
 =?iso-8859-1?Q?r0GlClXyZHxFFUbpbUTxiQheryKrKYPjddcgP2dCLJyYysY7ekw0ycJfdY?=
 =?iso-8859-1?Q?VfC1lIiAJCa81i85v6GIjCavi8/Vr3gtFI0Fyvy05VPi2qlWdFTZ0m+QXx?=
 =?iso-8859-1?Q?RUYIRyBdbIBTfzXry4o49FNNJ4Ftq9ylOz8/sBVG9wfE6XsY1g9eob1xVH?=
 =?iso-8859-1?Q?ppjSOgqJyrAgzCsBOBayeFhynZ3IB+aF6tnEmLOyQhxFX+Q4vFEb2a8MCS?=
 =?iso-8859-1?Q?EuPcvf0AWOUJKhPpkjb5KzXQ+3A3lHZwAJnILe2v/GIj9Zdb2lV//HMSs2?=
 =?iso-8859-1?Q?DKdkS7gA9Z5NuzKDa04LIOjXcoxz9nshrrW+nAes9dW1dASucQKUL6FcC2?=
 =?iso-8859-1?Q?cFG8iQbp0Cn/q7x9StHtbptLcsWEX4xHrexIna4FYfDQVtdxXlqOGwUwZb?=
 =?iso-8859-1?Q?t9r4q7vaXV1qfLr41tnyVmfvpzp7?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?xBpM3rx9fMYrvLGEsBSmZB7YprYzZnd0/3sIt3Vd+D0bm3Qc0Bhj1rTIIM?=
 =?iso-8859-1?Q?l2Ottg6+bCp2Kp1pSi4kFZ5m2ZjVkENrMkGMFNkYp/cy0b6kmR1jrVPFvi?=
 =?iso-8859-1?Q?WxHxIeNkjSIJ6XhY0DhTkuAKLJsYlLqoBy2q6wsQeawZ6shrfE64MLSIXq?=
 =?iso-8859-1?Q?T1MkBDjzectQ2Tk3HgjgcSFNju/M41UinT99mF0VBSm8sfADZheocxtqAs?=
 =?iso-8859-1?Q?E951yjY/AyyT1Z4vGHfoSrDGS79LGskFiKjVhVX1AD7e44fA0IjWhEpE1k?=
 =?iso-8859-1?Q?bktFo8OF4Ke+khKAdxGXhJiiO0a2/xS6FjR0MojtisJK/1o7fU9PH5sg69?=
 =?iso-8859-1?Q?F+TuTPunGLBI6QRkLQF1FYL4ErC6mf0kYdF5FkAJiob4wRgzcAAklKybTS?=
 =?iso-8859-1?Q?8QZtO1UBvUGkjYy/igMKOiNtS1+pvGkJTImcGcudxakBGuXpGl0Ly8SYnW?=
 =?iso-8859-1?Q?69mylV8gI1ZYSs2yKlzGgtyrFjM4PqzlL3Sf/40whJ+MdlJ5ouGwl25CYf?=
 =?iso-8859-1?Q?J2X/YiUd0BODaUrc4N40/oATJlz/3xrzENz+nKOSoUd1YiufLphhAuiEgo?=
 =?iso-8859-1?Q?6/ruCs3jEfn0kZBkh6ras9wvjTqNXpbLKm/plQgpIclfCsH2eUXvBh1ADY?=
 =?iso-8859-1?Q?B27AKETUxaa9uIIbOrHlL02CUB84U+UQatBv3h5Pyt+KuI0GpJP3gX+v+Q?=
 =?iso-8859-1?Q?nLyTwVT/mowX245Q1N7RxdE2mar5STZwCfoY3ZGpUv1e++WR25/4uGJCIP?=
 =?iso-8859-1?Q?EnAROKSe63de5X7+qM307lf16WQWzxqbBkDIAy5fOEdsqlW6KwZnCNj61m?=
 =?iso-8859-1?Q?/Q19DJP42nn6r/9zXAXryOu9McxM0ukixHflIXV9fD7c27C8dKpi78F2D8?=
 =?iso-8859-1?Q?Uto4LB/aryw3p6dyWX5cvqoTgY0PPTHyKfsMFzSKWCqWLVhVI1Q6/1MX0a?=
 =?iso-8859-1?Q?kjt8wrqrJuvMhwTfNRu74f28DoY3TRXoKVvHgq5XgFLs7PxXOWer2B9Ukl?=
 =?iso-8859-1?Q?3usZBZLGwmrT0nGdV6vqDCuqIUxYxcax7tn8qZbpjCyT4/xQLWhkOXpkyJ?=
 =?iso-8859-1?Q?akJUe6enDlegx+4J6MyOf3/xRGQIr2ow35pHpFOt3SCR1MG+7x5shR9u/t?=
 =?iso-8859-1?Q?94L7McW19stQXzDBCP4qB4gp94bqLdWUDlXaQ8FMmdxsBiLECObQYT+fhu?=
 =?iso-8859-1?Q?323be9SMPuIZapz8e7kfs0fs0Y3SIRarlDI39WG2lAN+nsAh1LiDHvG7S6?=
 =?iso-8859-1?Q?yBA1PSaZjiRndlEIPnwzKIPp2qecRAO4e0uwMkSZHwpLPdx+wgl0Lkarfj?=
 =?iso-8859-1?Q?U3Etnb4kvCzICtOGpAL5ojAYQ508VIKvLmLKStx0JQjTZVVm+efxBeGhta?=
 =?iso-8859-1?Q?h7558IXQ3VWqVwY+xR/wvxx/w7oUff7LElPkRUOja5o0ZTUbNNNoUd32JL?=
 =?iso-8859-1?Q?a4ghe3Gy3i97S7gWVICu/6UKkKYjMTvU+RMErPamoE5eWMewvRUpEaRhjK?=
 =?iso-8859-1?Q?KAp/yzec0wqY0l8gQEeTEJRiIbevpOJg1NNL1EspXRNUMs63Kqjf51MRT6?=
 =?iso-8859-1?Q?+YA6ktlcMKpYkkPF3LvgUprpFYOdx119VQFag/CZCq9A/BDtH6mZ7YB4Bz?=
 =?iso-8859-1?Q?7ib32q09gQN3XBH0B042LOK3jl8MCY16jg1dsNH0MNIHkkcl6DVcUklg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6910e75e-7cf2-43b0-f84a-08de1e0f060f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 15:05:00.7626
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GGN+D6o6oXz8Pt4VTrjdqJTPvQEVS/Bo8KS9iRWvL8uX86aYVuLfe8FrOJ4U0Oy4z4Gh3+tH6r0lhpDzB5iMxplmaIRTzTZbBJvAhxpvahM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7605

From: Grygorii Strashko <grygorii_strashko@epam.com>

The hvm_shadow_handle_cd() can be used only with SHADOW_PAGING=3Dy, so guar=
d
hvm_shadow_handle_cd() call with paging_mode_shadow() which accounts for
SHADOW_PAGING state.

bloat-o-meter
 add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-290 (-290)

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
changes in v2:
- s/!paging_mode_hap()/paging_mode_shadow()

 xen/arch/x86/hvm/vmx/vmx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index d7efd0a73add..67861bc8bccf 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1514,7 +1514,7 @@ static void hvm_shadow_handle_cd(struct vcpu *v, unsi=
gned long value)
=20
 static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
 {
-    if ( !paging_mode_hap(v->domain) )
+    if ( paging_mode_shadow(v->domain) )
     {
         /*
          * For shadow, 'load IA32_PAT' VM-entry control is 0, so it cannot
--=20
2.34.1

