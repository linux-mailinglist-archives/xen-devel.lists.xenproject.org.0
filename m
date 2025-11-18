Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1BBC699E8
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 14:37:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164705.1491657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLLsz-0005nR-El; Tue, 18 Nov 2025 13:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164705.1491657; Tue, 18 Nov 2025 13:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLLsz-0005lU-B3; Tue, 18 Nov 2025 13:36:45 +0000
Received: by outflank-mailman (input) for mailman id 1164705;
 Tue, 18 Nov 2025 13:36:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ey2=52=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vLLsx-0004PV-QP
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 13:36:43 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9db4274b-c483-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 14:36:41 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AM9PR03MB7217.eurprd03.prod.outlook.com
 (2603:10a6:20b:26d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 13:36:34 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9320.013; Tue, 18 Nov 2025
 13:36:34 +0000
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
X-Inumbo-ID: 9db4274b-c483-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eie4zLhrAkOdIAk1eUdnJIzOmlattSEw10nMlBUtYKc2+8XKqze9TRUtnrOnFoBMiGBJZSCx7I0EB99j/iDYOHinZcf8OHCVOcpK0WxA2w6wzysKQJM3of6Fg8BUQTwjcabq7FIHOekmNdR7crQo6kR+y+RnbH+HgQbdr+ueOajZ3OcFUV7kWdZUAww/T9xFIxMyKOKVbKInbGJoXNkdLxB1fZ+VYWtysFGXrvfUvM3+5HDf9/4OyGHOkUSGHhLifuK8KRKHMt8wQ7jhBcxISOhvezXxBDsKTsSt9dGNqTdQZM8vS9mXpzEApXxeV+mu8ztFMXD8Qmyy4bATQbEZHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3gUrZvavUMAU8h5VSMZBDp0633KA1vXEfAJbZw9Jiw=;
 b=EBYDNCPG3AXzybmXTXOWfOTX0ObrBcqXWB7xVXDRI+UZ1jYKar/45sCofxaY+1mqwTVTT1uN5Zh1z2XH1b31xYLm4JQnzkuW7UPzBd9F8lkss0E9UyyZ90bXRHCoUhFalYHp/tn1p7ZKq8JqkZRLuEuZLrEYeBJOlfGPwX9nbZ0bjKaZStbZk+gc+Ux7cQ+XWcdKYLpe5XcdlH7kahvD/qmSsbJ8XMqw0dAs2ypIW1lnzfbj7mek/e9TGSHp4iifCPMgWj+0/uesGldTCLrlVFYVTK3G3Q8jqGb8OcWKsOLN0lFH27EEVDIpFxtIEI8LL9BUzlMLlFqz7vJx2krLsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3gUrZvavUMAU8h5VSMZBDp0633KA1vXEfAJbZw9Jiw=;
 b=IAekcQqfIZDoWZNpk6/N58dJ6MM+gwEfQ3flRYA2Wb07WvZCidT+D50bVAjT3i64UYI3n+q4kOWNVW/qSefZPY68StNsAAQo4q8lDzw+QafBxpg5WX1p8bTJ4yoMFrlAmbNWGuQ3tW+LCXDLp/s/UOm+NjJmzjDmH8kt4j8CqxkCDik0NKwCYrpHrTSJ7asGEIS6Moa8Hi+Qwd/eUkWJ1Jixf8O/7dcK4NCFiu8uNstvrFKalQaazyGPkxyJM0yqyA9sC2vGmpFgbShijPj0/aPOI9OeRcryFitwW1yCmYAzN9a9SqRPyXxahSq9OSYmavzura4scYWKYQMNjjPjmw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 5/8] arm/pci: Mark pci_host_common_probe as init
Thread-Topic: [PATCH v3 5/8] arm/pci: Mark pci_host_common_probe as init
Thread-Index: AQHcWJBbQ2jIUgN/N0aOfhp6b7S6kA==
Date: Tue, 18 Nov 2025 13:36:34 +0000
Message-ID:
 <fbee017c9eb8317bcff7cc309c8ccc8305021ac7.1763462211.git.mykyta_poturai@epam.com>
References: <cover.1763462211.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1763462211.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AM9PR03MB7217:EE_
x-ms-office365-filtering-correlation-id: 2d89d1dd-2a2b-423e-4097-08de26a77dfb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?+NzbDBxNv2zGlnj4ZHGvFR+CPe97rZ3hMui3rB1AaOGNTnvLVmn013FKZU?=
 =?iso-8859-1?Q?B9Z4oFb/6O7KsdzQtRIk+ct4hTyJPZwSR8OxRxN96g1xLsqQYxYuckuViO?=
 =?iso-8859-1?Q?tEvVhSDVj8PtRgDn0/LtDPg3TcwgqBq7xFSV8KpZYpEdU8iRzgq9NcA2yU?=
 =?iso-8859-1?Q?TZ4Uib1+1L8TgX2x7VDJxAqM8ycV4IAaNQMaN8oxTBACRKAqft6qviB3AL?=
 =?iso-8859-1?Q?73o0fnTYh5gySuZzrfT0ti9nd7nn2/n/7GRXT/AIACTTo1nwJPgP8Ut8NH?=
 =?iso-8859-1?Q?VivwNylCSEb11JAhlGRBllB2MnU06FHo1MBbTcG7fn8sC67rsCDxiAUZJZ?=
 =?iso-8859-1?Q?yZhYy/VOaJjY3QpwTx1jJxTkACbVlAjmJXpTsNvRCty9qHRF9IbUr0Q1Q/?=
 =?iso-8859-1?Q?bVMfoFYLakkqW8KNSn90iVDI+/BgePSrNtyiCK65X/KMj6OOI11O869kBu?=
 =?iso-8859-1?Q?ALoreYoUWu9rkRGR8ufGsnODpgL27XciVtDMRyoqog1S1IokEDT39NOiN8?=
 =?iso-8859-1?Q?lMr0jZTijSCL2UTKlRr2f/lYSsiD0xEiYyp+3UYyL24NJ8MRcpDcv66Ssj?=
 =?iso-8859-1?Q?AJQ+jthaRYmkAFxMKxiTHI8BZuovIfEKu0LiXatpVLgFisOTn1XWqmDoCi?=
 =?iso-8859-1?Q?+gaZ4wUnP898IFu5OFNzMnkVMWbrtSTHceXnu11pOHOs5KnXd4NdFzLAkh?=
 =?iso-8859-1?Q?SDQIJi+SZ8Blz98iqXHY3HAZh9PZLXJV4AZKezxs0Bqy6EjHiTGMW5kBsR?=
 =?iso-8859-1?Q?Pc38ltz2Cjt+BaeeQ8j4mR7C+N2chmqrJp21Z4UH3LLbCrklVUEaT7k4oo?=
 =?iso-8859-1?Q?+xGW0vXObn2ufLRFjWBNGVOP6cJdLOK5drZTYpeHwTn5M0pSvzzyj5aPSY?=
 =?iso-8859-1?Q?T6KWkJ3BLyyYR6cBn+qAnqauGog/07cqPTg4hmpAb2i4XAMxWjvEh8mEmS?=
 =?iso-8859-1?Q?fWbdsV78O0zpm2P4AvrXTGP78JkJ5mFR+cgmfO8nXV+m5o1wInH+itYn9x?=
 =?iso-8859-1?Q?gQ6qW9r8UvvM7fRQ1sAUvRq2n0vOM0JBXdLvkKMshfR0k+RxSVG5wC+C0e?=
 =?iso-8859-1?Q?qzng89OXxxYLCb67b6czQQnYZK5QtD4fRIjyL6lK1TIYJLx2SfOSqYNZIX?=
 =?iso-8859-1?Q?lRZfvsLNbXG62Sadmq+7bUziLXBXEyf60EMuvx0eAr7d8vzdx11s0eZE8d?=
 =?iso-8859-1?Q?XKclhYaUmVsGEElKWbsook6RMsqGYSVCEPfLCcopK8NHLKYDrH3zJAcL0T?=
 =?iso-8859-1?Q?3b6Cy7p2ZEhiT1Omw1kWlNmD9VqRfdif7v9o8QqDpi5FkB+swfUYNG2Wwv?=
 =?iso-8859-1?Q?+HNIg8ChEROQ+r8BP3/0JfdSBg3RiU0VO4pUfZ2ZbVy41ltWLXYRkfzwjp?=
 =?iso-8859-1?Q?3A7icrJtk/sCxpjaRPbcVC2cpfV99QxpSyho4JalzG+ijzxygAWWTROTIL?=
 =?iso-8859-1?Q?q652AlRIIFX6bVMTxwyh6N3+MU818xf5kYkCmi6MZmRTBMUQmWz4rLoDR4?=
 =?iso-8859-1?Q?L5LuFTyebd3sL7E0hHgV4JHJpXtSUDdeJNszwD91IlqBl3HnMF//J5RN1I?=
 =?iso-8859-1?Q?51GZqoiFvAxd8QG4oBBrAMFM5GcD?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?G2fMD2WEbWmxTTJQnm9wJ2rCHlxFwRlor1laHmuF77xo8FGQsv/emRiZu6?=
 =?iso-8859-1?Q?4G49YmTEqXEkAYL+/SLCg04giEZiKhaM+rJQwcjJo3jcFqFY9Vf4zW12ny?=
 =?iso-8859-1?Q?OYtfNtcBrSKGwXPfBra+PJwNaWLvEN6Us9RJ3sO3+VgV8niD5+9r1o1Vo8?=
 =?iso-8859-1?Q?Xl/l1eAU7iWuxEaC5rObkfRhz8ghe+/HaL32e7JAbydYnaA6Xy9znWlmjA?=
 =?iso-8859-1?Q?tzsZqNmblyZf2IVQgQXG2+MaWTXAdexud+/DYEIQqabmajBkzX3oBX5EwV?=
 =?iso-8859-1?Q?tKOb9l8n8wOp+iF2qEpsjgG9+y3ZEWAO5pDHwfWcVq/Etqz91DS0JOH/oi?=
 =?iso-8859-1?Q?5tjDGchKF/jfDRMUMLBr9XUbEfpp4oNiw5PYyg4sUUYltEkB5TrVOgq6xi?=
 =?iso-8859-1?Q?CONMrSwu/nCcSN4wjYk9N9I1MGyppOg+Dz9Ku4ffGtB1ozrYL/koZU6nRZ?=
 =?iso-8859-1?Q?Q/jgX/RCekxhHkuLKAJcxBmf6l/yKLipQ6lbWcLgIHrtq9y4KFSrGzSQk2?=
 =?iso-8859-1?Q?QVezshN1bxvIdjEq1ANZIxfUHb4EFrB1KGVUPU0BJuazce+/mCr/L/RuU9?=
 =?iso-8859-1?Q?0AX5c/pbhW6KFnS1l5heo6Ik9YSWg9ECl/kfUjXJ2g3zb9eawpYE6vb2OD?=
 =?iso-8859-1?Q?Jk4ISFKMV+sK9QjnWu5u0WjWoAzrExBn/vuNe14UD8UoVdlf563isScr8t?=
 =?iso-8859-1?Q?3Ho6/2UkxsZAZ3Wru37GXgbMABvj2BjPZiOvmxxTUTLqlzD4RH6egPVZSL?=
 =?iso-8859-1?Q?jBR4/bmNEuVb779Lx5x/Tyc/VC4VaQZM8zOOtM4wnb0nA1ZonuS+jbT8LS?=
 =?iso-8859-1?Q?X7J/BKSYn2AL3EXfTuaMqZUZ5/SfrRq/nZahi26bBNYa6NhjS/Jxf5O5ll?=
 =?iso-8859-1?Q?32EtOERKEQguG0nV9WB52S/WpsHuYs2l2AP3Wo7Ic1L9XWlfM+zc4080hF?=
 =?iso-8859-1?Q?/5HS66hwhTxamwZdPeE5khLzJpkXsFVuDtmk/GEnkcPo99Gr/tdY0n0fhF?=
 =?iso-8859-1?Q?L1mMdUvSqj3vCDAKMoc723PMAtdjK+B6UklRLNCAH7r+mtyIWF+CDqMH4q?=
 =?iso-8859-1?Q?FXHQdLkhmbwBC5UBWS//LlpJyKFmz27GcqwoEeJDt2/meyqmi4+4hxIH29?=
 =?iso-8859-1?Q?aAMfrNHT768FkM4nriED6swgHtN9GVUz+RDKbIoS7YvN4Hr3Hm8Pb7/V9x?=
 =?iso-8859-1?Q?vkS3yF1wm1v/VbjqpqDvjuileGIcSCXIo0jzTybLN8wsW7PYEoCNjhgcMc?=
 =?iso-8859-1?Q?jSmrKzhdvV+DkYUataTQ818w1BQeb9X/Q7Q/C/V//B9VpCL4OsgBU6MMdT?=
 =?iso-8859-1?Q?VP3Ls84TVov/apBj4G4u91IUVHHV3svfUGMeDaneiEUl+pzAq5KQDEYSAa?=
 =?iso-8859-1?Q?wkPTJ4peB4qKdfNNhZsmlZQuZrBrCl/KwFRB4A6u23/Hv4jMmEVS3xLluI?=
 =?iso-8859-1?Q?MDAX8/IFd9TlWfUJA9FUTQa57Q6fiaLAOd74F9eQkcrxS2YXE0uVWBVNb/?=
 =?iso-8859-1?Q?ieHhpVnMsS+fmAy5eu5f8Gcy6TU7wHyEuQHWZWWXF4BPXA+V6VB8BR9h66?=
 =?iso-8859-1?Q?ViAtTtW++NMwz6dZMy0SpKg0i3R9bNVb8Vndg4Xb29g8+9x4Zg5ZiVfb63?=
 =?iso-8859-1?Q?6D6BkgEIx9eH9qAV8oHt4uMZK7KLOG07hdbYY8g0nFCSvXcnHUoHgsbg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d89d1dd-2a2b-423e-4097-08de26a77dfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 13:36:34.7912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PRhkZhm/EF4hsEjXepal5bicSRyAALransVPn+Is0JLDa+u2hHbv2iuFrOlvvhqVUNNAcbtpHWGpcL/6a7El7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7217

pci_host_common_probe is only ever called from init context so mark it
as such.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v2->v3:
* patch introduced
---
 xen/arch/arm/pci/pci-host-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host=
-common.c
index 46e7e3b707..de30fb0aec 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -232,7 +232,7 @@ static int pci_bus_find_domain_nr(struct dt_device_node=
 *dev)
     return domain;
 }
=20
-struct pci_host_bridge *
+struct pci_host_bridge * __init
 pci_host_common_probe(struct dt_device_node *dev,
                       const struct pci_ecam_ops *ops,
                       const struct pci_ecam_ops *child_ops)
--=20
2.51.2

