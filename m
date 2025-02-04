Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D11A27365
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 14:54:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881479.1291622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJNO-0007Rc-Rb; Tue, 04 Feb 2025 13:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881479.1291622; Tue, 04 Feb 2025 13:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJNO-0007PE-O9; Tue, 04 Feb 2025 13:54:06 +0000
Received: by outflank-mailman (input) for mailman id 881479;
 Tue, 04 Feb 2025 13:54:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jloo=U3=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tfJNN-0007P3-IB
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 13:54:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20616.outbound.protection.outlook.com
 [2a01:111:f403:2612::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7eaf51cf-e2ff-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 14:54:04 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB7494.eurprd03.prod.outlook.com
 (2603:10a6:20b:2e2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 13:54:02 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%7]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 13:54:02 +0000
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
X-Inumbo-ID: 7eaf51cf-e2ff-11ef-a0e7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1xk/Csr6sWrFaz1ZuFj7M1r3OPxnOeA4y4DWtnXfdYlWH8Hh/b7hfdFvzhAG6NhJJGMAgF1Ssk75omx39HCw09X18o6Lyi49dBMjGTaKiiAlhKwhT9crfROFThD5sRyax0m/xNzjaiZuPKAcPX1K3YLSnkZLJlNqf3wWqmIBeSyX62aQQjYkzkPtlM9xbuMCfhuuwibFsCxiacDtyVOqn12eIPNg999z8t+4qLj1II9M9g36PubTjyYCfwBNXEAMY73fXTCC4nO4Akuqui2y6+huVnhv+bA5eWguc7YPZ95I0JNEzEWsNMpoct3K4cP8/AHAv6zZumMf6Zyk/N71Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cG1gEnUonuBncBYKrYEztMAxoL05fqUpUbEmPaIDu84=;
 b=D45u3CuYof50S+pCZXoauGq32PHotBXtTOozqB3PpBfjAk+mS5CzXTAIR+aoYLP9s3hv8HKL4W51RRyBdGGYfm/sIUUd0XlGkRBkFAwNJVNp/hwkmI+SfMGcOVc0XGiG9PsbH56N01wnQKCCEmPJK3Sjg2c+6L0SgTwQRz3HIs6Q5oZbMx51gQ59DjgcOLtaVlX7HCkxvsp/oh602kdUqKEmcXkbGeV2OBObi3mcvJi3WEELdOYo5dF+ORYazKzjFy5ptrztuEJ6w7/S5/774raU2fThRclxIiZjkasGHCzZVSHHGAW/KBhKoN+NIH3zWHYXBzczOvU+Sa/j7uJzNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cG1gEnUonuBncBYKrYEztMAxoL05fqUpUbEmPaIDu84=;
 b=qvCWW6XfaENNulsfC8H/a4tjfBjBQSaGwlqpKC/EsF/W5n4VyR2AUF1skx53+KIFT5qvzj/xn77uPjQA/CXu87WpCvgPXylOmcUO/XNo0ePRqehnjswNupoUUFtdwOVY8nNRdItwqpjJwJliyOHnpnDMwLE8FIv/UcwdOMIl0O+EN93jp3Ux2MH6IhwO8SWGgG4SZ5peVfwaLwWCAXPERUJ6TEqhNgffoWj8tBlXwhgWumekrIR8f51A/ItRRfJkI9ScqUECG9d2gJZ0xMnkjDnKJgbwrNClVoTGw1fb3iRFx0mmM1ANV4GujfdS51M2+F4i6c8LYchkQV95HSGqhg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v7 1/8] iommu/arm: Add iommu_dt_xlate()
Thread-Topic: [PATCH v7 1/8] iommu/arm: Add iommu_dt_xlate()
Thread-Index: AQHbdww/QlqQCIk8+U+5HZnqhslnRw==
Date: Tue, 4 Feb 2025 13:54:02 +0000
Message-ID:
 <224570237ae19d10c554a14c6d8e34f171a3ce11.1738665272.git.mykyta_poturai@epam.com>
References: <cover.1738665272.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1738665272.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB7494:EE_
x-ms-office365-filtering-correlation-id: 8df5758f-b041-49c4-7b8c-08dd452361f1
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?FBBWtVf4zCCWncNK/VbblfduCf5yS3/KZQEMyhRUEAS5DJo1OUXJWbaaPu?=
 =?iso-8859-1?Q?3EolhS0ETLtTBMl80Vd++iA55IrsxX8JwPxm/wjhfl0iQ4tU/pjjrxqRVr?=
 =?iso-8859-1?Q?vja5f4j4LyAkU0vtp23QvYQLEF6uwujXSo+jGfrK179zK7IR6JAd9e497J?=
 =?iso-8859-1?Q?6alexrSb5zevQHq5wAu6ySq2Ejx0KnOhGLKRFQPlWnU1H11HaWGOlQbHOK?=
 =?iso-8859-1?Q?/e2/4YcxWTUgLSa8lOTpMk20qqvr6VI77N2yCMMmDuQjh+FWM1da+/MNN4?=
 =?iso-8859-1?Q?q73Z//4s+i0myltOUrJtpWr4+jsKavjo/CXROG9UmHPhdyLqaT81RaqpiH?=
 =?iso-8859-1?Q?lcm7ooHeSCEvGkoFZ/QSb5wtd+4AcKzj1C4qzNcD+7+XtwkIOdqsG6vh+s?=
 =?iso-8859-1?Q?o0kdUQ/8SVNt2QhBIgntRRTOFQa1kb5wgJpDJwqZIzENgZXul2tZisDeBb?=
 =?iso-8859-1?Q?hhmGNeevgehGqawqUEgKhy10bXr9Z9vt7qpUEWnX+einoyAH3eGMA1U0Ul?=
 =?iso-8859-1?Q?SAi1mE8yWPrhEMnoECtY/RekzNDz1Ks8Rf/XwnAXtnFyrvdgP+VrT7zXRp?=
 =?iso-8859-1?Q?oMR48dWvChO3O8Me2Ia13/BtQzM/XaAab7AvkbeGCc6lzC1l9QxfcW3LF5?=
 =?iso-8859-1?Q?rL3/1N1uePE8DpPZnJ/950upFE6pvQ2We2Cog6QmAcFq9KVrQuGDu+hxZr?=
 =?iso-8859-1?Q?w/GadoR7G84PA8J06zcxNm61fuqw3QrU4a7ZZZt2gVsUjXaQDTgVk13gyw?=
 =?iso-8859-1?Q?APw0SmRNOQSytYtzrEDCRD85oL3PawnRtCDC3mdemAVnZFiDFEbjTrklsp?=
 =?iso-8859-1?Q?t+OPRqpj9lIJ9mb5O2egSYtQuUdaSo94uYkdDVODZsnz783eaf8YVg0xLK?=
 =?iso-8859-1?Q?Cqfqx2Msxqr2nzVj4tgBsjmNH9ZIZSqbP2Pl2LUnb0DIOU8e5yeGT8V7fg?=
 =?iso-8859-1?Q?fp+zKODnDM2k34kRCdzyFC+COU4qLLZKTxMB1YT3CzOOOV2puH67Jk4fdR?=
 =?iso-8859-1?Q?UNjzFDIxWt6WKTPCOIMVYtMTuM9eXZmXCfzuTbSWkGgWSCDYmEyNKsz81g?=
 =?iso-8859-1?Q?UKuqHHvPRQj1xgbI1Wa9pltN0dOn+5OQTSEhYlw7el4YJyoRYvMm3zb01K?=
 =?iso-8859-1?Q?JU6aZz354qpTh7VPKdxBfEgLMqRcdUUgWRKemzh6hqOQmMxwqbTRUfyUGu?=
 =?iso-8859-1?Q?AtfTWWYu2qDqORjLYwZT2KjZod6DtV4JNaHttJ5x6qtkjNdDW3YiW7oOUK?=
 =?iso-8859-1?Q?P5qyWUnsKVRMtZg6heGvbKGk8JUC7d7cj80InEr6bD4PxJiMjw/6y8cJ0n?=
 =?iso-8859-1?Q?Yq86PFspzUNHEWpG8kWrviAL/8Hcy2Js7PgFpC3F69O8I56JolRA4+DQM6?=
 =?iso-8859-1?Q?/Ej9mXNH2GhQ7MKN0vw0Bmjkak+07TnfAzL6jftzH3uo9eYUkUK6zd2MLW?=
 =?iso-8859-1?Q?+Dyrep0QZN7jw+/TW4yBBp9XRjViYvmqwf0oOF82cHU/85Qf5l1iAlFOit?=
 =?iso-8859-1?Q?G4v2ARJrSXzyIWW+4jTV5A?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?NL7/SRBF5PudTIAEeMRenpRR05DnKPfYexVg8J9XHJU8yTMf6LUVHzswTI?=
 =?iso-8859-1?Q?q6+n+v1qaFCQebKoOOic6nh8oYcaQ/elGuL7JNaAfRuyA7yOxwqzxy1E6Q?=
 =?iso-8859-1?Q?nR76z1sC6eJzCZLReELi7pLvnU/+O7OcbjJN0fU1MZiNbNieJmamKZ80xT?=
 =?iso-8859-1?Q?qtbk3fj4s7kQHjTUA7qwpfCEJBTXSYmBmnExARj13dZn0dbEseogNaAYMF?=
 =?iso-8859-1?Q?1FSxW56hIvTP4xzl08AOhgzQ86mUjrdyUC2ap2j2qzcm/DATh70gYdB2u9?=
 =?iso-8859-1?Q?89PIYrTzr3OvcoGGR/P/sOoDgMqEynsRqqZjZ4RrNqsFZI+pO8x4owuadq?=
 =?iso-8859-1?Q?USk8DeAj3zUuUzCOf3WGSreGdP/Q7OZDIhTUsIKiYnhnv+LNJS/PrLq0WB?=
 =?iso-8859-1?Q?tqKbk99uyJ5j8NpayJ23GJ84fkh4Tmhfic4p1Kj59eL/eSS38NlDUtfkAi?=
 =?iso-8859-1?Q?HR5AOMr52AixosTGLCDaEb9CG3XK8QaS24GaiCzYZwtYOxY3qylcjdrowW?=
 =?iso-8859-1?Q?gF5YzfJmr4oTSwOlvGHuVSQ9A7nNDhezcvz4iAfxb7VUj1OToQrQcGT5zD?=
 =?iso-8859-1?Q?rjnrliFZBsJ7SJrqq1ZwvV1OP5RHJq5apXedZ+WdCpVjZ1DHG6yrm0KEMH?=
 =?iso-8859-1?Q?OKn5+1ZQdz2FVhtjryXOi0JaWkceIfilM/GtKy3DjwgrJyfWbvdCpSyF/j?=
 =?iso-8859-1?Q?wO5RVoDLHooIZNiJwz20jhNSLz7JFI4U0MH7IPEv4SoVITpeB5GzQUsdRi?=
 =?iso-8859-1?Q?iIlZ5l33wavtY8zWFsoOmiDXu4iOoe6upg2BiU1Wrm3iGZw78yiRamLn1s?=
 =?iso-8859-1?Q?wPZqpRPdh2bemW2ODDivvB/WcWhln69GbEwuaJL24jRpGxModsIjsUD1dK?=
 =?iso-8859-1?Q?ZMH81IkMwlZ8CQXUFjYEX5/4jSF7SomzQm4/moi6JNLxUeSAYz+Q/mZKL2?=
 =?iso-8859-1?Q?MXTgCa1EupX3VFRrK5mBOJTU4jFrVwfwEZ9Hx/2zPKTlv3OL7hxXaK8BOr?=
 =?iso-8859-1?Q?S1Z0elHX0RobsbSqyQhS8vtPYGj6bcK5pA6ZNHkWUoMMalDu45MjPIhkuP?=
 =?iso-8859-1?Q?WjSfYFF717DFObNgWt5q20W0nvACfr4dyjpywuzHE9T7VMSj31nHl4NH8f?=
 =?iso-8859-1?Q?j65QkIc3IaccgoLy9MMt2ioUjcex8fjuBbvLpZQK1/jbGVTPU/zJU2mT8D?=
 =?iso-8859-1?Q?XWLbhJFQAr5BzSA87jislZHQ2QBHuCA9ywGSNOLGO9io7d0q/pls6NHKwC?=
 =?iso-8859-1?Q?KI71V0jhCrk4St7wH5I1Vn5WG8Xtjv6oDSW+h8gFTJnX/cPo4rx6gCaGdQ?=
 =?iso-8859-1?Q?KSooxbO6niRy38U7mfSju8Hy+Y/UO9LJBl2c+JDjMKsGPlM6+2nLf7eiqA?=
 =?iso-8859-1?Q?X7Lw0y10z5POeKXWmDQX7IN1P0f9pSgj6hDkGTRwVh+lBPOT8FTuzYAZr9?=
 =?iso-8859-1?Q?0QP1QGeI0NPXGK1n3V1Mikin1/MeAGn6qF9cYYaiqOLJUYldyDsSFYsQNn?=
 =?iso-8859-1?Q?uyn8rrbXoHAbDKppj6yWr+Z92PySvgVoCP0E6f9tsCezzuxPaz8EIPQcYd?=
 =?iso-8859-1?Q?TxmTBnEZcBxhUQRZ1Ve4T/j4dQY7k2rWbckg49AXR61IarlqvhQ6vDyCnD?=
 =?iso-8859-1?Q?nLNYBcpmd04ewuy0Rlza/KqJX4xZpYVQxcj5mMZgtWjErm1zASDTT0kA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df5758f-b041-49c4-7b8c-08dd452361f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 13:54:02.5186
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2ym0NX/LFE8q+kkmk49bPfXHvCdF9qSGWoAxGD7pQRYRKWA+hFE17h7qUjcb1gfCLAt8ipuDizZQqz73lf/hcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7494

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Move code for processing DT IOMMU specifier to a separate helper.
This helper will be re-used for adding PCI devices by the subsequent
patches as we will need exact the same actions for processing
DT PCI-IOMMU specifier.

While at it introduce NO_IOMMU to avoid magic "1".

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
v6->v7:
* explained NO_IOMMU in comments

v5->v6:
* pass ops parameter to iommu_dt_xlate()
* add Julien's R-b

v4->v5:
* rebase on top of "dynamic node programming using overlay dtbo" series
* move #define NO_IOMMU 1 to header
* s/these/this/ inside comment

v3->v4:
* make dt_phandle_args *iommu_spec const
* move !ops->add_device check to helper

v2->v3:
* no change

v1->v2:
* no change

downstream->v1:
* trivial rebase
* s/dt_iommu_xlate/iommu_dt_xlate/

(cherry picked from commit c26bab0415ca303df86aba1d06ef8edc713734d3 from
 the downstream branch poc/pci-passthrough from
 https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
---
 xen/drivers/passthrough/device_tree.c | 48 +++++++++++++++++----------
 xen/include/xen/iommu.h               |  3 ++
 2 files changed, 33 insertions(+), 18 deletions(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthroug=
h/device_tree.c
index 075fb25a37..4c35281d98 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -137,6 +137,30 @@ int iommu_release_dt_devices(struct domain *d)
     return 0;
 }
=20
+static int iommu_dt_xlate(struct device *dev,
+                          const struct dt_phandle_args *iommu_spec,
+                          const struct iommu_ops *ops)
+{
+    int rc;
+
+    if ( !ops->dt_xlate )
+        return -EINVAL;
+
+    if ( !dt_device_is_available(iommu_spec->np) )
+        return NO_IOMMU;
+
+    rc =3D iommu_fwspec_init(dev, &iommu_spec->np->dev);
+    if ( rc )
+        return rc;
+
+    /*
+     * Provide DT IOMMU specifier which describes the IOMMU master
+     * interfaces of that device (device IDs, etc) to the driver.
+     * The driver is responsible to decide how to interpret them.
+     */
+    return ops->dt_xlate(dev, iommu_spec);
+}
+
 int iommu_remove_dt_device(struct dt_device_node *np)
 {
     const struct iommu_ops *ops =3D iommu_get_ops();
@@ -146,7 +170,7 @@ int iommu_remove_dt_device(struct dt_device_node *np)
     ASSERT(rw_is_locked(&dt_host_lock));
=20
     if ( !iommu_enabled )
-        return 1;
+        return NO_IOMMU;
=20
     if ( !ops )
         return -EOPNOTSUPP;
@@ -187,12 +211,12 @@ int iommu_add_dt_device(struct dt_device_node *np)
     const struct iommu_ops *ops =3D iommu_get_ops();
     struct dt_phandle_args iommu_spec;
     struct device *dev =3D dt_to_dev(np);
-    int rc =3D 1, index =3D 0;
+    int rc =3D NO_IOMMU, index =3D 0;
=20
     ASSERT(system_state < SYS_STATE_active || rw_is_locked(&dt_host_lock))=
;
=20
     if ( !iommu_enabled )
-        return 1;
+        return NO_IOMMU;
=20
     if ( !ops )
         return -EINVAL;
@@ -215,27 +239,15 @@ int iommu_add_dt_device(struct dt_device_node *np)
     {
         /*
          * The driver which supports generic IOMMU DT bindings must have
-         * these callback implemented.
+         * this callback implemented.
          */
-        if ( !ops->add_device || !ops->dt_xlate )
+        if ( !ops->add_device )
         {
             rc =3D -EINVAL;
             goto fail;
         }
=20
-        if ( !dt_device_is_available(iommu_spec.np) )
-            break;
-
-        rc =3D iommu_fwspec_init(dev, &iommu_spec.np->dev);
-        if ( rc )
-            break;
-
-        /*
-         * Provide DT IOMMU specifier which describes the IOMMU master
-         * interfaces of that device (device IDs, etc) to the driver.
-         * The driver is responsible to decide how to interpret them.
-         */
-        rc =3D ops->dt_xlate(dev, &iommu_spec);
+        rc =3D iommu_dt_xlate(dev, &iommu_spec, ops);
         if ( rc )
             break;
=20
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index b928c67e19..c3b8df9815 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -238,6 +238,9 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struc=
t domain *d,
  */
 int iommu_remove_dt_device(struct dt_device_node *np);
=20
+/* Error code for reporting no IOMMU is present */
+#define NO_IOMMU    1
+
 #endif /* HAS_DEVICE_TREE */
=20
 struct page_info;
--=20
2.34.1

