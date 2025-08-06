Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB5EB1C3CB
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 11:49:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071507.1434981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujamN-00011g-LS; Wed, 06 Aug 2025 09:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071507.1434981; Wed, 06 Aug 2025 09:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujamN-0000xq-Hs; Wed, 06 Aug 2025 09:49:51 +0000
Received: by outflank-mailman (input) for mailman id 1071507;
 Wed, 06 Aug 2025 09:49:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i5Mu=2S=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ujamL-0008SJ-Df
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 09:49:49 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b01754f3-72aa-11f0-a322-13f23c93f187;
 Wed, 06 Aug 2025 11:49:47 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU4PR03MB10887.eurprd03.prod.outlook.com (2603:10a6:10:592::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 09:49:44 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 09:49:44 +0000
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
X-Inumbo-ID: b01754f3-72aa-11f0-a322-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FrKvARamhpWaK/GuwKFvHi3QQzTAZgxvhgqzY9oYIJSyLoOLmF9fDSx/uZ7S763HN35XS/QJlk2EwAJ5SMlgW7LQvAP+ZzXWLwAAM73Pt5bvdDagP17hI0Af8PFQ68NpNgjxw23aS/Pok20zLN3P+GQxg1EYsi4NeTK9ixTHmu9FvFT6TqQ22pMQJQ0u1pEgj6ptnJOAamcBHGnAIVwLGW83jAiNR+gaBBTKd70EmePrmRVgLoZlO84C8AbnYnb3XDy53M1uXiHBjsj7g8Hk/83kDqRCRjo/PAUbXZMu0ndgGl5I7VKnj6kyAo53bJQULVVXL3L1LnY35cZowN/dVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0D42NaQ22SnU+YB/Vaz0V7f4mHN2J4eKpExRSGw99cI=;
 b=hME1lmkOkXcRWJsj+21oAJ+pEt7XJKUXRRNc4uGA+XJcRtIr+SF/6qoZpgPbe3WirDiHGwOTgXqPUafIJkOjTu3QE5sOWOYFFzzoWGwc+gssOdX63UvC7+e+iiU/awk1lOp3KiCTgOf2EIGq7lFc4UMahpvfrTEoyjvDes5bjX3ebN4X47uma61HvA12G9Ixl5fAJ5q0CgRuV1MDfu5Ad6L2ohOtQLe6nv1jKvux7HFBAAm5MpMxWDpUw/O5GQBojI88Njlx5m69zLWENSQctMrNgy4W1eBwBiqnWzSkrRdsOvYbYpSksc3GCZ9hqFvlW6OexqnaBHPXGGRQOmOC9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0D42NaQ22SnU+YB/Vaz0V7f4mHN2J4eKpExRSGw99cI=;
 b=fb6hU8oU/kvjX9IbC5Z3Z7Au5N5zOKdLJcw9S+iEaBLN/GMa3x4YHou/0+u27jv89rpNc/O+cVCyYN0s9bRGlqMl7KMgBt93hAt5MkkXGax1BxuridZsFhPmQrcX/IjWgUvYtzAbahupG9K52MgNU6u2zgj1TTeatyFTspcrUPSSe1YtuQPA0D6jWPAE/9q+oIPnCjBnjFqDpMxA4ukoG8Grme+naGV5Tflsa0q3hgXu3yykNcflP+dMBuiEgbSGNlcnljpseS6gKY7WvKvvA8wL9FDt+qRb7RQMHHsXvEVSjUdSHlgJFk2lVSAPYnXC4GKJlC5AeK3cpapKUzDOkg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 4/4] xen/arm64: constify is_32/64bit_domain() macro for
 CONFIG_ARM64_AARCH32=n
Thread-Topic: [PATCH v2 4/4] xen/arm64: constify is_32/64bit_domain() macro
 for CONFIG_ARM64_AARCH32=n
Thread-Index: AQHcBrdvUZwhp6UiF0OIwSDs4YZpHA==
Date: Wed, 6 Aug 2025 09:49:43 +0000
Message-ID: <20250806094929.293658-5-grygorii_strashko@epam.com>
References: <20250806094929.293658-1-grygorii_strashko@epam.com>
In-Reply-To: <20250806094929.293658-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|DU4PR03MB10887:EE_
x-ms-office365-filtering-correlation-id: af9560bb-b8c0-42cd-379f-08ddd4ce928d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?qA18s132kDUe1dk071uLh94f8CuOkqrJg5dv56o8nNt2jadMbcfKKJJhnL?=
 =?iso-8859-1?Q?3Z0n92QtWe9M2K7vSYKwjgAlnd7I+NA0zxsZiSh3PkwADWcz6JFn3SZk2T?=
 =?iso-8859-1?Q?8qh+kjbE7bNNsaXjgFO1t6rDrzl1hOYcSSCbSM6/Q3aBpfn5AJ9YnD2k3m?=
 =?iso-8859-1?Q?5uBxm20vJZxjbFh+mkxDl1U+jTxSkad3mmvjCtaBlrto0XT40BkJ+mZ/HL?=
 =?iso-8859-1?Q?OR0HjBNz5FgFle7sQPZvLGq188GVmkYJmxJ7Ha+1+9qAS6O9mqek//P57/?=
 =?iso-8859-1?Q?bgSdyG1ig/pk3oWoINwbF9C1ulcKCK4WMeBX/zY6pPgpE9qHh6NRqeunGT?=
 =?iso-8859-1?Q?6orXGR4RycwxXBuau7IJt0uWXzkdVrFaLliuLLwkDUGU9lxCQ7dtP2XdDm?=
 =?iso-8859-1?Q?SlwUQqVH06u/DtCfTsv1RtE7l/uwbSJWE+qB1s4DL0mlzpB4BJgh8ifUPn?=
 =?iso-8859-1?Q?yuZjLRXDbvvssHVV3o3f12pqIqLm9WPBMjJechF9PLBaDUNyxCHe0N4yCk?=
 =?iso-8859-1?Q?h7KSFEX7xJDZ1AAwM9kW9K5PonEbI7Hug0lCGuPcy6jT5qgvZ/0Rg38ZnM?=
 =?iso-8859-1?Q?30y532+PPy8nzlaH8RiZZ0VEhd135FXS/lhEyyqCCwPyIbMp/KFDFu/Wgb?=
 =?iso-8859-1?Q?tseU7XnOR97pDSfrwy5aNzO8pioVPJCLBSx2bOaSWOuAu2DA3+bHTzvyI3?=
 =?iso-8859-1?Q?4knfa8t3mXZDx2NbzJdIfSZycasOTIm+il8ZBhlrNarkor1+oaRtVzsb6H?=
 =?iso-8859-1?Q?/IPPsAKOSbKAaTLWQGK/TZE0jqQsbmkhCgaikcagr4bJiInsMi87O6FmVJ?=
 =?iso-8859-1?Q?zHjTdGKjT0T9ymGjNCzZcehVImb7AijHaz2A0G8VZG1hlaGFhuEu27AzXj?=
 =?iso-8859-1?Q?Yea71b+2P5pUDwaSDqyMi8AxbLyvZpZcn/ofFOyeQvxW/lNwahimw59rz6?=
 =?iso-8859-1?Q?GCkKLMM/2/7aRHQeDjZ9NoPbETTkrps/7onP9YRfs0typ1do2w50AbP3U5?=
 =?iso-8859-1?Q?xRhwMBMYzrXeVLaEiNw76lKCjJV8mITlTjHRMYTLbQlpb4W7g+EVZrQy9C?=
 =?iso-8859-1?Q?29KDAze30fWP7EmIgH4i7d72DalVY5xW89WyETpiUYnxpR4VJrOCPN6W/x?=
 =?iso-8859-1?Q?7nRKDe76Xnkutrocx5axkpOyTnlICoNJW8BRT6gTZXjvhpFNK70zPnXuws?=
 =?iso-8859-1?Q?wRklEZgaxCoFi/X20JXju6jef2wELDfP0lrmX8bHy8tNxGI+b3Il/Wk7kt?=
 =?iso-8859-1?Q?0i9RH3286ae56+rm5WbE909GOE688SEIg12gtQuLAR1PUP2EK50AFJyGHm?=
 =?iso-8859-1?Q?2SorqJ339UJdIgV2KESBb3M2pbh6O9F4JcYSrtYn+yXw+11o8iMnjHaBAH?=
 =?iso-8859-1?Q?hPuv8MkzAOKEymqlyRmasVsHnHIbjvKRTfXBMFatbMmcIinY6VIIGdcEg1?=
 =?iso-8859-1?Q?OpTRwpBzLKHqqK0FH9hifWINJ4QEwd0TeAxf6k3jYy5TVtGE6Ow9ZF2ojR?=
 =?iso-8859-1?Q?uAq+Fjow3nh6Lf20jwBWnJ9NTDV/h0u/eSLVpCKHLang=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?EHbgh6rIXnaJjZxKIH9qtjvjyFvzgpqpY+l+onEwUwltP5cT8CW4Gd+3Fl?=
 =?iso-8859-1?Q?FA14Qn1OgbZTNM4qC0b+n1rfSdRnmsJv/NgGYyZ7+0uHOarYuIhLE5AaYF?=
 =?iso-8859-1?Q?nl0pJdX2nm1HwNBtRslMu3rECQzTY/A/bwQ5ob1Av9wA5EAJ8VEVEiI8A9?=
 =?iso-8859-1?Q?GIWn+i5q6xMS3XOJ2766oQ3EM+nAY8ZDsQTZyLZCt3RKINyQlJKboDES8w?=
 =?iso-8859-1?Q?knBZTF26OyXj1dARwWcXVC3OLxo8S8Asaf9wFicp2fz1GreHtwauXmzGHW?=
 =?iso-8859-1?Q?WdvtWlDydstpOgf/3xF0w1xc+KyTxckn1DWN11Oi6Qvi0CePxPBc7KEIz7?=
 =?iso-8859-1?Q?+wiFPJjHkOASc1MPFkotUBJ0rC+zUqsylMGtFnywn7RqLKopaTi3sBQqmA?=
 =?iso-8859-1?Q?0M3lC2sM8x5zSUZN2qyYPyJq1UMwu27thjHamAnsK5AKieIjica6d0LdAI?=
 =?iso-8859-1?Q?NkeSPPqlzNo31ysLUqxkks8fDVxoY6qquxL9L2wGVaqXAmJIJE2UBveuSP?=
 =?iso-8859-1?Q?doFeL9gNGfwqiNFUAJgsQA6G0qc2C2FxODjNvu3KHp7m9hEDN6EtsC5Llt?=
 =?iso-8859-1?Q?iCcZ+nPtZmgiz0MoiS0OCiF7Q4RVvspVInibxpWRvtU4yTWiBSjExWB3mv?=
 =?iso-8859-1?Q?kclztKBHUKN9zKI3/FBcjGWpyZtHJarkraeC/BYvzylkSy3gE51IMZ9YJF?=
 =?iso-8859-1?Q?hShUz+kWcOqysJCy2r0vaaPRHWyVwBdrfLsV+BwnaeOQ1OYX6doJ2Ht6zw?=
 =?iso-8859-1?Q?s8WuOhfDCkclJk05Drl6soql2XDIbZUub4Hx/x6XnU5VXqRN3sf10rTW2k?=
 =?iso-8859-1?Q?QxooPNe/zP8e+pR1uROvsaYvmccssyh0vmfKCD0ledID8nOjPOFUEHKcfn?=
 =?iso-8859-1?Q?6GbWgwkVbf7yXxaWYFsR980H/GxDRMRP/tl52CxZqr7wAJYqZZtVyq+gHg?=
 =?iso-8859-1?Q?OkRe9J6uyc8vJZGbfL8WY1vm/pcvZZZqRi0O6ta6IXM25nZSD51v/q3Gle?=
 =?iso-8859-1?Q?YsBUewTEqKG+9DIDiVDL6pS3uNrUSWkGK4Wb291bgWPV+RwF6nByfNop4V?=
 =?iso-8859-1?Q?4gDoHcTvS72gG8YPc1aXIrGqeKThml99xraPANSnmcE/Ei2o1j0B9B6LvJ?=
 =?iso-8859-1?Q?aRN8HF4St6ymV1CMOcGMI+Wpy6bNg6V8eE6eHEjTDMB3WnZRMvN9mVMoAo?=
 =?iso-8859-1?Q?jqCBUfxX3sas8v8KvJCOEHyOgxlqRPR1QwNn3OnK1ErvbbAvjy5CUJFoMy?=
 =?iso-8859-1?Q?KFjR4DK09h4F5XtCxZXlTUVI39bt/zC9ehFBCqXuE7TFC4g4MOCLB//nJp?=
 =?iso-8859-1?Q?0PnFZCfRGbDPzgdPHbhHG/hviEc3cAg7nRXvdR1HFNyku4iVPtB7i5CMM8?=
 =?iso-8859-1?Q?fLim1DhQWhIjYz59j1JZaWOuMBWVQgh2DuamrFMkS3dKU5QLI+182lUfcn?=
 =?iso-8859-1?Q?1HpIpo2FkuK2Qw6nuH0At9EwxEZeCnvrdAgcYH8S2bIhKlNrzhAyNATPxk?=
 =?iso-8859-1?Q?q+7llOq3WBN7Oy/IDVfbGbddDouvfyqD0tCXR4p94Y69E3Y8CKCUh/lgxU?=
 =?iso-8859-1?Q?4dthz6uebwc4riPP7kmNZbpKwEOZqmwj2DTixAIIckkvEqvejVYvInMGjc?=
 =?iso-8859-1?Q?5eYfqp/bACTTrdlvF4pNXuwWS0DFrPPXATVmAWccl35Y2Y9Q0FGhvNMQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af9560bb-b8c0-42cd-379f-08ddd4ce928d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 09:49:43.3659
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iQYCecNOL7gKww2YDeHXnPElgz/ZFMitLExzchWKDuEfVrqJck8bq0cn7UOWKN99hgktIbvCTWxb0wkC+8c5r9Ot25LlGH4AXg1erKBwe70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10887

From: Grygorii Strashko <grygorii_strashko@epam.com>

Constify is_32/64bit_domain() macro for the case CONFIG_ARM64_AARCH32=3Dn a=
nd
so allow compiler to opt out Aarch32 specific code.

Before (CONFIG_ARM64_AARCH32=3Dy):
   text	   data	    bss	    dec	    hex	filename
 859212	 322404	 270880	1452496	 1629d0	xen-syms-before

After (CONFIG_ARM64_AARCH32=3Dn):
   text	   data	    bss	    dec	    hex	filename
 851256	 322404	 270880	1444540	 160abc	xen-syms-after

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
v2:
- use IS_ENABLED(CONFIG_ARM64_AARCH32) instead of ifdefs

 xen/arch/arm/include/asm/arm64/domain.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm64/domain.h b/xen/arch/arm/include=
/asm/arm64/domain.h
index bebcbc582f97..70dfbeac7443 100644
--- a/xen/arch/arm/include/asm/arm64/domain.h
+++ b/xen/arch/arm/include/asm/arm64/domain.h
@@ -12,14 +12,16 @@ struct kernel_info;
  *
  * @d: pointer to the domain structure
  */
-#define is_32bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_32BIT)
+#define is_32bit_domain(d)                                                =
     \
+        (IS_ENABLED(CONFIG_ARM64_AARCH32) && (d)->arch.type =3D=3D DOMAIN_=
32BIT)
=20
 /*
  * Returns true if guest execution state is AArch64
  *
  * @d: pointer to the domain structure
  */
-#define is_64bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_64BIT)
+#define is_64bit_domain(d)                                                =
     \
+        (!IS_ENABLED(CONFIG_ARM64_AARCH32) || (d)->arch.type =3D=3D DOMAIN=
_64BIT)
=20
 /*
  * Arm64 declares AArch32 (32bit) Execution State support in the
--=20
2.34.1

