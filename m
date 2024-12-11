Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 910D59EC1EA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 03:05:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853576.1267006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLC5f-00054H-Kw; Wed, 11 Dec 2024 02:04:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853576.1267006; Wed, 11 Dec 2024 02:04:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLC5f-00052b-Gz; Wed, 11 Dec 2024 02:04:39 +0000
Received: by outflank-mailman (input) for mailman id 853576;
 Wed, 11 Dec 2024 02:04:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tZaY=TE=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tLC5e-0004a4-9E
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 02:04:38 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2607::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45c0db06-b764-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 03:04:36 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB9365.eurprd03.prod.outlook.com
 (2603:10a6:20b:57d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 02:04:32 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 02:04:32 +0000
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
X-Inumbo-ID: 45c0db06-b764-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ge1XlQbgH1UdvXJE/zBdwMM2tr9pint8/IVqDbnY23Vuc2xRCSaSH/mcrW1GSGysffF99uWSk4PDlRnXeKD6lVFgbuRCyNzrnd+xmCtAvb+TSmHgjz4r6JTZqPVtNjOt0+7mHAHNKCuti40MUM2phKD9Lrhf4atS6ggaqMIIAZX6QMa7gTPcPJ0eKQR3cMf7UVZQTnxEhGj/IrGPkRr7ti87mVehX+8vLpy54caluz2bLNzn49skrcQM9JD1egXOdl9/xmrX1iJzJfMDaryFugzAuF7xyPEitUqEVOMB+PaLjPX5DOiEn6jNxEz78/38sMfZiZgFf/iYniGSEHcBqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7IPKT9OsPoDBg5bm90YN85uCTHQcge+IDT3Vd6o2ITA=;
 b=kfdsdpr1YmBYed+3+BE0uKapBXpbhffr3W5CNd6dCGqrreqdWdxrrFWkDpRf1DWv+2lSWhR5rjRtu9m/tAEfCJ5qj9spQ4o6P3vGC5HlwJEtqji3vij/XkZuDkfpeynhNBx4BYlQUy0BIM+kg8TJQPFOAsJmaOQ4uW0ukRI2B0liQWyGZtdgKpaDzdknKAb6r8VBQaO6K5EBLD4FG8p5880w1n9+vO5yghBrVTOANrN91H0y8Moyx8LLrOrcGg4L190522IkmNccS+ItTYKUysXcnwstYiNUe8euND81/6ja76Pose3sTR7AfN0c7ojDnBs70/sCzqkXacTW14YjLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7IPKT9OsPoDBg5bm90YN85uCTHQcge+IDT3Vd6o2ITA=;
 b=Md2K9cE77jlIxbt/OCJj1y8uelR4NjHUlqevPKRQ+vu2sNlDKg09O/RH93HYfhIW8pXHQ8if3cvKYui2w4SxuuzHZZ0MlHEXUGG1PWLhgGs9eKh10YV+SoRtOc6qPcJREQoiwrlE9y2ZLQ94Iu6fdaHOga10DSU6BU+Q2TdCR+4BOLfj1U1uad/a5uvk80fewSfZCOfSWJQUNDmMZ6ztLcjlSUR6HSRoNWzr+PfHBHmE/6dOnID516fvbvxxAVlGPt0EQox5aEMssaGMbRleWLRpOzft0X1wD98+EeMWW3dmQ36Lcwc4jjbwYWnBl8iq34ccDmD7iA9lxqnP0vIoFQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 3/3] xen: arm: enable stack protector feature
Thread-Topic: [PATCH v3 3/3] xen: arm: enable stack protector feature
Thread-Index: AQHbS3EEEJvy+ytb5UyNE3P+n1UzAQ==
Date: Wed, 11 Dec 2024 02:04:30 +0000
Message-ID: <20241211020424.401614-4-volodymyr_babchuk@epam.com>
References: <20241211020424.401614-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20241211020424.401614-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB9365:EE_
x-ms-office365-filtering-correlation-id: 6e5c4183-8777-428b-92d9-08dd19882762
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?hVPl6/Ig6716rtq6aoGkm0navVKZuwGYQAQfGQDQ5qvOEGDaEHdMqHJgeF?=
 =?iso-8859-1?Q?GPwI8OLIkbc+jkWs99X2LjPtj9KOnKhmDReD8mexFAWRMuwDbG9jeGYS+0?=
 =?iso-8859-1?Q?cJA78ULyDF40yh9Dcsv0cpb41ee/S26kbdzDr5BpBC3c8hmWFKS94Hg/SX?=
 =?iso-8859-1?Q?CB/pMjexRwzfWwcCUgET/8rX+LUPnYFjNTNdBDtTb0pWjYm0dlZ/SWBePL?=
 =?iso-8859-1?Q?n0xq+kpmxOjVcBMqyfDnePdccZ3gHJVAY/HRP1LmL8ctHUU9geD1xU8df7?=
 =?iso-8859-1?Q?GejT7VZD3FherS5mvtsTUentO+RuP/aORLyVlQwYlsEH0bkxOFAImXJL+a?=
 =?iso-8859-1?Q?koEkHml2Nnm+9Zx1EoIno50k+GNO/91Nh4h5n7ri2cdIKBJSnmWZOzPHt8?=
 =?iso-8859-1?Q?cJx+FO5MO6Pny89Jvml5cK8hvUcL++3XuyNXAxCWQqg8eyyJvX/qawRTET?=
 =?iso-8859-1?Q?my66BXEV00n0mDv5YyPk5HAS4FxxBXzWJ2btBPL3zJyEXhGh8T9GxSVI5e?=
 =?iso-8859-1?Q?b0dnnkyLYrvTlEw0Hl7+WYOyNHukMvJaHfhZQ6R2huvzelWFEzZRMAiQag?=
 =?iso-8859-1?Q?TNB4JWNn2bj2oE1/MBXOJI84RV+lqsFhajtmPvrRnonUITPY0sI2bpnDNX?=
 =?iso-8859-1?Q?npXzGPryn9POE/xaOBNa+9XGyDnxcSDv5GDJ69jJ0DYGjguNDHc5J4DFcc?=
 =?iso-8859-1?Q?o+4Rau2wDWauLH4MokpkIm0nI9vdbuCOUfb8HQoZhp2LXwONm+1GusTnKa?=
 =?iso-8859-1?Q?1yj82dhoDojS/sJRM5P68+MNZEhOPVaEDv6dyP4rL2/n8yHKPCtmecvCTF?=
 =?iso-8859-1?Q?5jmW1eAOjIlLCcKvzYYqZWJpv8Vz9ZGWfPiuB381N15lDgf39Z7zuLGlXg?=
 =?iso-8859-1?Q?+FG8R4rz7kE+kS1NT1uvYn177uxMRQfwVKVoF7mbJbV6D59o+E7xXX9HKa?=
 =?iso-8859-1?Q?VH+41C4hatC8ijX1bW/0W936H9UmhvzPHswOUddDRnZIvL/3aGQCro9bYb?=
 =?iso-8859-1?Q?86kSI2sC58dKtxay67zGN+pj1HqsDellkizvjlaVvXgoT0BiBrWtJZc/Tn?=
 =?iso-8859-1?Q?kZesuD0ANdGWmj0tjszUWJyfn7O8Rfob1mTKmk0+PWCvDvSR522K7+2Lhg?=
 =?iso-8859-1?Q?IYYXH9XqAZ/4uIjZd9f0ukTwUZxbf2kLSJSqkmCvOchzq4rjVlZVrAmj6S?=
 =?iso-8859-1?Q?nH+sAfjwHVhyJSFqhFiXIyyqLX1Dpf8lcyRVpkTSugA+lT7WYbZcT9xQtW?=
 =?iso-8859-1?Q?eyFX+eAo5zrJ5J2FKxqQGVrf2yIKRaBWo3KRTaqYaxoLX19pcaS+seFaq1?=
 =?iso-8859-1?Q?euQdQQMpK4YeUy7bMFQYk1wyx70OaaKIhrEY4tmqFxcKZF7ipPWn6xJO76?=
 =?iso-8859-1?Q?qWr46nsWzWfMcV1xyT6zeGIxcAjB37U/JfEJ+mkXNaVydVmLWU/kEMOOZT?=
 =?iso-8859-1?Q?ZQ3WpXEjXtduOGbkYdu0DDUSNuE/YCn5rN5APA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pD0sBpJOYKmmehoupz++PSwernoJYdJl7f/12ljuTNjBL+cCWLEbiaOyKp?=
 =?iso-8859-1?Q?fX06RlqffU1/UaP68ZmOTRB4Agc1ch0p05s5tQl6xe70h8z6/7CJhPxyQu?=
 =?iso-8859-1?Q?hu3duBBbcSVLPklkSIZu/tc3O03RFQwldGryTUc+rcMUbEAkMQ5yKa3twr?=
 =?iso-8859-1?Q?QJoLg7HhH8gGM4+S4ZyDfJH+iQSN3N7XCTWFBPKZqxVKTvQBJvtEogFbfU?=
 =?iso-8859-1?Q?LXGJ56YeqgBTy32d4r+UmMR3mhEyMoqA9a+1lgm0Rr5ShNij1ZbnAUhs+F?=
 =?iso-8859-1?Q?RYyBYuLdHMgeBSC5h3DNmD0Kg5ArgwrmwlV6gCKXaN7+isJTDlKfh2l6B+?=
 =?iso-8859-1?Q?x9npubACfSUhveIil+IkOfbVN5umiMzX6riSFER6Gv5xMzntFBObOoU/SX?=
 =?iso-8859-1?Q?An8WdFiIoLINJJ+A4YOMUjazPLqLLpwwNVKFoxn2o1k8KbadQjdEGUuEQ7?=
 =?iso-8859-1?Q?sHe8RQ42/O50vR/bMuLgUIpF4sae6ctA47VgflV55or4/4fTo1Fs0E+oDw?=
 =?iso-8859-1?Q?dKnwnE9RTXbwSD3a2WBDWv5nAedQKpiRnJ2MTujH1LG3qw4KKx5CBW57Ga?=
 =?iso-8859-1?Q?hHTWE244AM0dGByes6WWbqwrcPlx7KEUCphNWkIWlyZnPohnnYHV44DjEj?=
 =?iso-8859-1?Q?jJ06UOZum0iJSEiCMRIHZfz0rlEyEWVzjVQK/Ws40PXYjpifCLXBr4X1+X?=
 =?iso-8859-1?Q?jp2N1UtS89JK+3kfcQk31KTXOsmjXyOvQgEV/wvz56f9fM9y+JB5gzogOy?=
 =?iso-8859-1?Q?zzmBChNnfUh1DsQ/0r02u659H6/Jnmm2SS+qUxcbKUp83zhpjIq9jK0Puz?=
 =?iso-8859-1?Q?aRXAnG5p/urHoSqtl3cF/Ai+z6s4FP2YdEiJq/HnlKyvnY3LLt16/v/jOK?=
 =?iso-8859-1?Q?JpklWDpqF3uqlNm9gRTPglx/TQc94r73z7frM26fHxqomk4Chj0ESzpfDT?=
 =?iso-8859-1?Q?/mbloAXkKTV2V9biRHNxpZysk72ZVyLJjFQj7aAML7EPuQrpCu7nVdZ7wU?=
 =?iso-8859-1?Q?Z0IThgRIMWckp63z9BTkq3/dr5txWbldybmo+pd4/UGEes9rPjCmt0mIrn?=
 =?iso-8859-1?Q?s++oFlwZIAXJW2QPQm/rMR/FS6VkVlNJpAX5Pn8OpJ7XMAOjLcMMWLicVj?=
 =?iso-8859-1?Q?8WOIhv85orc2eAT4joa3//8ORPPmCA9h7O9xYP+Ct4ZLvBEIFJKfQjIj9w?=
 =?iso-8859-1?Q?kCbKZYHECQ/wTAH8UuJp5KZt/D80bz/Mf2PQrKfv/FjSjZwH8P0u1NX561?=
 =?iso-8859-1?Q?1CZP5WBTtgFVChVWpedM6Co/jUK3M5Bqs6u12yk0x3QcTLW+OwktJzo3H0?=
 =?iso-8859-1?Q?QEQDGYr04MGs9R4JAf7Y1wntO9GJ54gmgPttKQL4a3TD0W34Q7sXIpSpst?=
 =?iso-8859-1?Q?sLhGenk1BNKW/X1KxJlGlUSF9uN7OlcOEma4q8cs+uUiP1sl/Xq0whhu/S?=
 =?iso-8859-1?Q?TxmrGqFaRTScndeTVWSCAI4GkrkMf3jRLpPa8gBu/qvm10iVn5ErQgcWYw?=
 =?iso-8859-1?Q?K9kLYrCf5CJHrs6XED0ASphsFNSGa0szWyrpnCst4/h2V/cE1o35c36L9Y?=
 =?iso-8859-1?Q?rvC6Xv9Uzx607aiukzwQALs+H6nnfSaU7E6DXCtTbp7yk8kTxqbz1+IvdF?=
 =?iso-8859-1?Q?G8iipinlU8vMiNvrWeM+NDvheWs2gikKki4GK9E8ueN/hIX9u8NM7VCw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5c4183-8777-428b-92d9-08dd19882762
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 02:04:30.8888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ABwBQlfrdAtLHOy924ucylAJfEmT8zySnjxFlbC8bJt3K7r+4+xW0i5gchVFJoI04RqNInswVjiYE0mHdZ1PSH6gRGOIrfa2w0LwCkX89Es=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9365

Enable previously added CONFIG_STACK_PROTECTOR feature for ARM
platform. We initialize stack protector in two stages: from head.S
using boot_stack_chk_guard_setup_early() function and from start_xen()
using  boot_stack_chk_guard_setup(). This ensures that all C code from
the very beginning can use stack protector.

We call boot_stack_chk_guard_setup() only after time subsystem was
initialized to make sure that generic random number generator will
be working properly.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

In v3:
 - Call boot_stack_chk_guard_setup_early from head.S to ensure
   that stack is protected from early boot stages
 - Call boot_stack_chk_guard_setup() later, when time subsystem is
   sufficiently initialized to provide values for the random number
   generator.
In v2:
 - Reordered Kconfig entry
---
 xen/arch/arm/Kconfig      | 1 +
 xen/arch/arm/arm64/head.S | 3 +++
 xen/arch/arm/setup.c      | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 23bbc91aad..a24c88c327 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -16,6 +16,7 @@ config ARM
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE
 	select HAS_PASSTHROUGH
+	select HAS_STACK_PROTECTOR
 	select HAS_UBSAN
 	select IOMMU_FORCE_PT_SHARE
=20
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 72c7b24498..535969e9c0 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -250,6 +250,9 @@ real_start_efi:
 #endif
         PRINT("- Boot CPU booting -\r\n")
=20
+#ifdef CONFIG_STACK_PROTECTOR
+        bl    boot_stack_chk_guard_setup_early
+#endif
         bl    check_cpu_mode
         bl    cpu_init
=20
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 2e27af4560..3587baab21 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -13,6 +13,7 @@
 #include <xen/domain_page.h>
 #include <xen/grant_table.h>
 #include <xen/types.h>
+#include <xen/stack-protector.h>
 #include <xen/string.h>
 #include <xen/serial.h>
 #include <xen/sched.h>
@@ -359,6 +360,8 @@ void asmlinkage __init start_xen(unsigned long fdt_padd=
r)
=20
     preinit_xen_time();
=20
+    boot_stack_chk_guard_setup();
+
     gic_preinit();
=20
     uart_init();
--=20
2.47.1

