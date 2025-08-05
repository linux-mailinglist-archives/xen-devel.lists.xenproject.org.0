Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D700B1BA62
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 20:41:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070874.1434505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujMau-0004DU-TD; Tue, 05 Aug 2025 18:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070874.1434505; Tue, 05 Aug 2025 18:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujMau-0004AH-PO; Tue, 05 Aug 2025 18:41:04 +0000
Received: by outflank-mailman (input) for mailman id 1070874;
 Tue, 05 Aug 2025 18:41:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kSf=2R=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ujMat-0003e3-7y
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 18:41:03 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc4ff72a-722b-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 20:41:01 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS2PR03MB9719.eurprd03.prod.outlook.com (2603:10a6:20b:60d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 18:40:22 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 18:40:22 +0000
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
X-Inumbo-ID: bc4ff72a-722b-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2qRbNHafGyOJ0Qq1wkrIAYreKAczjS10hTcwPHpbpUYWjrO552wIlpqMuTlRAxQKDAbOLjRrQFnThsWq/2vil6Vls3lbgMS+yw1MIM6RFkNawclUos20tHxImXc7lu+a2OqeGxhRoDlAlVIKSIo3FalWFprMWcr40PsZSp4Uj1tzBAK6tXMTDwBW31UZdoBQGrhbAVy1vo/l+Jibq9MyyaVQJ8zSFtRd6JQBmjE71VXLeMEBeZ0iYE+NsLTpVIWd4K4rWeymyNvKWAIZvqD8OAIfcl/DyX0/EoF8SaSNnlDh2oNOQRDwpdI/45utv4T+eSRoXv6/EqB6bySA9h/FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LElp82G94vVCAKhYOIMf2khf0EvixVKSB+1fEMlwrws=;
 b=ylQbQ180BSwSUwVqDDmgfRpo3EUdaD2Gvc1Q9HRJxnQXhc3I2DzWqPRQyLHmFw6kI5gnLrgib2jbAOlfRqeD97Eb4bq2DxgSd4ZTnDlSBGcukBGH/HnTKV4tDAsmZM34Xmx9Z6nwj3kqjOyqTlz/s6Lp3BpEr0ej6JAZwPiinGPJqwfwRxJrsT5azd8hyjGkogMdp3oOpwf+J56pYlj7qyAp9Y6itNHllnEWov4OZlKM2nRjh4+DhVeewbVD7ENxHg9nJImfXmJRPPjSKgyrhVm3/1STmAPgDaRc4OEnI6UojOgX/p/57oKIsSMYHEZhGBz77W9pyim6n5rDt7MI3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LElp82G94vVCAKhYOIMf2khf0EvixVKSB+1fEMlwrws=;
 b=BNV7USpeVO5SOqdmy+K6Pd8ZNsTipqfg8FY4WM44cXpM3hIJaGiuZQtnLl0kQO0vaizBFKN5QP8pB8iroZx5x3aOXc2wJR6J+uIVPznDJD8o6Y/5ejb6Y6/53TthqUIMfuay8MtlxsUV6GB1JNtFDucJBWuc9VIhotCgokfa/fzloiXgJCrGVrn4Wbq4mX5Junn7O29+LZbUV97EuF7UKq8V4/gSCBMSCVPRUZ7qhR8MA3Q4qShU7bI4l2m3KiLgYANC8Uj+bLuFCuIm7/yn4FKvKnGSK4sunnoQXl/uCUJZvyIYxIJ/30MKWRfR6FvivG8eblwoWLTbaXbtivqVrQ==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v2 3/3] xen/riscv: irq: drop unreachable pirq callbacks
Thread-Topic: [PATCH v2 3/3] xen/riscv: irq: drop unreachable pirq callbacks
Thread-Index: AQHcBjhlQO0OorApKE2GxdYJHoRWDg==
Date: Tue, 5 Aug 2025 18:40:21 +0000
Message-ID: <20250805184003.202839-4-grygorii_strashko@epam.com>
References: <20250805184003.202839-1-grygorii_strashko@epam.com>
In-Reply-To: <20250805184003.202839-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AS2PR03MB9719:EE_
x-ms-office365-filtering-correlation-id: 0cc8db13-9a66-4fa1-9cfc-08ddd44f88ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?t/yIeZC2UqE+W9xNyAsYEdXLQM3PLL507zjn3BVGCa7Jbb0jf5OTcR5Hyg?=
 =?iso-8859-1?Q?m4YDzVIRzZnAhCzotcA6PmsO+otsFefvxR4K/EYSTIIrhPLsNe6GyYv3ri?=
 =?iso-8859-1?Q?lh41yjtv7ycsQ1fNTpEtZhUhILxZ4oCyjl5PDuHa/EbbhFKGElzIivr2Jm?=
 =?iso-8859-1?Q?HqBSTT2Bt4QEtliPeWMWm9R7IuxApzGEuK3E9pOHOQn7BoZbjY9+ZYWezx?=
 =?iso-8859-1?Q?6koIbu3D37/93AmZkK57ua1dp9DzOXU+GoAwL9sPhTjvFmwyY2gOfwTWNG?=
 =?iso-8859-1?Q?WUNp+4/zsg7Xl/0nR938dnqSEtfI/t8Kv/pUcoJSri2bDBb46qHivyjLZt?=
 =?iso-8859-1?Q?NoI07dHrAb/NHL590VOmjjunS+GY3hoZeWw7SIA5BkoZkimeUAx+PbgiP/?=
 =?iso-8859-1?Q?c+cDUp/qS7VA1HieGKX+Zzc8i2sFdl4FG5XErg+7ReLcKS0wSgPTOi5Dqk?=
 =?iso-8859-1?Q?zIhUAMzLjpFfzHtgps0XO9DR381WXbg5xJKRjasT0EYrYXWxlMPAz/MKQx?=
 =?iso-8859-1?Q?WD/4TMB7+f5yaKqXiiG01LO0LSDd768QuAaU2em7rANCJcZOu83E3ObK7x?=
 =?iso-8859-1?Q?XCGS+SC4iAVCesfCv66tQKdutkBwLeUDpjQwmKYJg7BwvQr0l4QSsw+n+Q?=
 =?iso-8859-1?Q?FFGkOQoA6qeVT+8Olq/ijXIAGgmwjsjCqJUgmwtGN3Y4kPHhhAXZjKO0Mm?=
 =?iso-8859-1?Q?nCZiF5vBq5ou0AroyWZP7GufHNYEooIRoxvaBzOyYv47XQ+dNV84CgJTU1?=
 =?iso-8859-1?Q?LM8xd0ozp7IseRwN0PJH796LbXS+YtxDsbdeJTsaUlWjrVMH9PuP8YTyWm?=
 =?iso-8859-1?Q?K7bu48zRZXwMB9I6n02F5wCVQzzSMqlT5G0pBat+l9p8YrChXj6aI8XLWS?=
 =?iso-8859-1?Q?Z61v192JFluZelil5tTTIrOocLwcnjHN6JlMFAEHMIuzgEXBHMNNyQ03L/?=
 =?iso-8859-1?Q?iK9Gg/A+SYKjn4hrI4ySQD/rSTWEiT4cDCZ8jmAorTAIb3ogSgKgh+/yPJ?=
 =?iso-8859-1?Q?exmLhlsb2wNfj0uLwQFkKjTfoxYjziHvjmma5Ulc0YpHu1SbjX4UzaYeJ+?=
 =?iso-8859-1?Q?lyelFWh8MrF93ERlJcx9GVICNfUnY75sZvTQbSjftBIcR7muZ0W2BjY7PA?=
 =?iso-8859-1?Q?4rYq80QvH4obuE/xytDKwLD92BQ0eGmdRPulcfF2bIzpYsnTTyMMfD5I97?=
 =?iso-8859-1?Q?bS9EdAyDxwVxIjrbcEl6IPsC1agGVmH/9Jlrrev9B2EOQVknHa2E2f+MXx?=
 =?iso-8859-1?Q?NZ5EVrbRw7BDUWiLu6aO4/8nmge79dqqKeYRtHSmux8J0mWr9hkytktifW?=
 =?iso-8859-1?Q?IHGrs2wUpJMCo9U6PLnC8hl2FOk49RRhmP0QIUTWqcADUlqqoermCCYhMw?=
 =?iso-8859-1?Q?EDn424Y7Df1PnNPHYzQ+9V6ouDWufuFmy/qR0ZvxfZdEMw7lo3bHaXrcW8?=
 =?iso-8859-1?Q?VDfBAVK3yYDfHnhkC6ZWbuERabtCEk5Rs8fo+ydAuiS3WW+v4UBhRk2NfM?=
 =?iso-8859-1?Q?vrZJV8XeT6pKZElEtDO7kK6brwMgopoOsRq8Bo93ch1Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?cz1xjq1K1dkzChI5r1R61bVwzbGsQSprmCoJcD3wz6uFOjgOzAN+P9SUES?=
 =?iso-8859-1?Q?rD8lx0EK5Da9pGCarM84+lQwFxskrd3b2nv79TJZwW7OfajEqAjpoeunOm?=
 =?iso-8859-1?Q?1UcrrEKx42zwpsagsFCm5ELX94CQAUjUiCxa346J9Y0Ui+MPwmVwj+/WO0?=
 =?iso-8859-1?Q?es5DKg/ygEfn2AMAaEncNIHERPG4PtbKXQibA06iNVmSJJ30Fv/nlmXSS6?=
 =?iso-8859-1?Q?OcxTePJg8px2BfjJM6MGfYrLLn1nNsOJFSuS9e4kMmotRpinNiXaYevUTl?=
 =?iso-8859-1?Q?V2MjtJwtwSRYiotcNcrriT2ePZdRZ2d/lbj9Y4OjqeZbqtNsmbf27rlNPo?=
 =?iso-8859-1?Q?W1+mIbRHTptPhAR4A3Rop6UqhXUxzaNzTNhvw6ny7iTiDSA70CnfxvTbiI?=
 =?iso-8859-1?Q?mIvG4XQWzD3SgE0kzNXJTmXNHr1LWO25kKnJxHKce1V2N54mI9nMGtr4qD?=
 =?iso-8859-1?Q?vttnJhESKEFZrG2gEPbJ4lPOkE9x4CtzWdyuRTHeNrA5nP+rrdmp+pwxfL?=
 =?iso-8859-1?Q?oKzVaxDXotk/Yf9z1SX3P7fy6cDc+pnH0QGbjhrNpduLHJ80vQqrIm+Vzj?=
 =?iso-8859-1?Q?cvjqE4kyRetbGKCfj3lZ9l4Z8SGrg/+Fa5acwBKPdh9ya2+bQfTBwPeiB9?=
 =?iso-8859-1?Q?uwgT9vMC6jR+WuZlyX50/h/Fg6fSbNiDEgOQXLerYrCWQ3POzq/n0+hN/Y?=
 =?iso-8859-1?Q?eJlcQOiSYY6MmJBLfTU35FiKifyPc4nj4e0dlhK0n65s1s3LUhgJPukCRl?=
 =?iso-8859-1?Q?YIWcUc3I+QgYjr49+3mO9Vcau6ORBsFMabx5bpXzkmS1zywPMgEGHPRtjG?=
 =?iso-8859-1?Q?3NrzpY9u9+mT3ajHV1uQDJurnyRSkJq9OubZPIPm6CmhavvFyDXQdOUjoU?=
 =?iso-8859-1?Q?GyEK8pTIY72dM6npx+w8PwLrdUDzXN98+U2HQeXnGhAIbYdHWR2JvEffap?=
 =?iso-8859-1?Q?ZCr9PGu8ZoCFgL5/Ve7/ZjZhT+HDvguFV05vhB3O2PbTrNzI/O1Ro5WltM?=
 =?iso-8859-1?Q?gkfDocYLmfklQe8o0nz8Jq7wtnohtgrggJkLF6oM1E9weO0N3JcJjQKJLY?=
 =?iso-8859-1?Q?SrgRdjytkDUtTFyOEx+2RqvQeLP6/kWbWEWhunoN1+NNbcTFtFqhM5bQqk?=
 =?iso-8859-1?Q?cYqqt7MGykvbKnZhzMadEl6e+JxD3vH06FBtCrdZdIM0PXmONPUiFhb5DU?=
 =?iso-8859-1?Q?uIlQbz8yTCD4r20UyxkadTL8LJeNmNo7cHqWomXQnMy6EXrJeq4ZEI4f17?=
 =?iso-8859-1?Q?rwqW35T5+QxrpJfWR/qcAesvmRDhtLgxh5uM6ZxaORSlpjBJmcx69mto62?=
 =?iso-8859-1?Q?KojXEvvJoW3XjW7nqx/kiQ5cxOpqYuSWIbDY3TUnC3V93GqjAuQh8Yql/z?=
 =?iso-8859-1?Q?+qghs+O2ldOyRI4T7raMWTv/ae/DpUroZBAI1pJwxPi7qM1G1Rgk/ecV46?=
 =?iso-8859-1?Q?EE8XNWT7Hb3y7WdpjHSYDyid6lGXBF30Ej00Jrvyj7IBNivGZp0+A1/oeM?=
 =?iso-8859-1?Q?RGBqPupavGcyGasdaZK2Shdb9DucVFRVXQpX3rwI/2NjQybL6jrf3zagOT?=
 =?iso-8859-1?Q?IKW3BjKFS4ukSdHGnsqoNHqcC68zRhXMEtAGMtLuSzb0E5h/DDKFSfbPip?=
 =?iso-8859-1?Q?sc+nlmI7uIoicp1rC2JjrQWfdssO5QC6X7s2iMGLi1fYKCJvb43mv2Qg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc8db13-9a66-4fa1-9cfc-08ddd44f88ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2025 18:40:21.2865
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /c4annAsyGcyrfBdgHYHfh7OUPSahH6894Ke9kUaNM1Sk7LoyKgrXDjd8UG+Mq7i/ZHuXdG1oCKQH3bN7iSeBrBd7BfMMgr77Qe4f6tyyWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9719

From: Grygorii Strashko <grygorii_strashko@epam.com>

Since commit 341f271cf86f ("xen/evtchn: fully restrict concept of pIRQ for
arches with pIRQ support only"), the corresponding RISCV arch pIRQ
callbacks become unreachable, so drop them.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/riscv/stubs.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 8918cebf35c6..1a8c86cd8da2 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -82,26 +82,6 @@ void smp_send_call_function_mask(const cpumask_t *mask)
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

