Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B73ABF3A4
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 14:03:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991748.1375569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHi9r-0004if-4x; Wed, 21 May 2025 12:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991748.1375569; Wed, 21 May 2025 12:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHi9r-0004gZ-2I; Wed, 21 May 2025 12:02:51 +0000
Received: by outflank-mailman (input) for mailman id 991748;
 Wed, 21 May 2025 12:02:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aEeW=YF=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1uHi9p-0004gQ-2p
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 12:02:49 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81f913ba-363b-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 14:02:46 +0200 (CEST)
Received: from DB3PR06CA0030.eurprd06.prod.outlook.com (2603:10a6:8:1::43) by
 AM9PR08MB5972.eurprd08.prod.outlook.com (2603:10a6:20b:280::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Wed, 21 May
 2025 12:02:44 +0000
Received: from DU6PEPF0000B61E.eurprd02.prod.outlook.com
 (2603:10a6:8:1:cafe::b4) by DB3PR06CA0030.outlook.office365.com
 (2603:10a6:8:1::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Wed,
 21 May 2025 12:02:44 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61E.mail.protection.outlook.com (10.167.8.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Wed, 21 May 2025 12:02:43 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS2PR08MB8746.eurprd08.prod.outlook.com (2603:10a6:20b:55e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Wed, 21 May
 2025 12:02:09 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%3]) with mapi id 15.20.8699.022; Wed, 21 May 2025
 12:02:09 +0000
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
X-Inumbo-ID: 81f913ba-363b-11f0-b892-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Yorev5a9wW0TFMwcld0RsP8P+JK+yrDMyX8uNcmDNPkxYGNflTKft3hNjxfbpQX1IOtVzAN1c3IL21dfF/3+eYYPD+wz8Eb+bgPyINip9WPfsM444jP7gXkIk3BcdAa20DFw1gc7O9p0AxD/6x1Ivu712uL3lOxhKMO6nH03AEy0zJRv1KxSU7qjRV1vSRQ/QWboFHpYt4VOg6GZCLNWoeVj8VUls7sf9nZ4qrZrC11quOINMoNAcb2NP0sSbLnGfwuAkAiE40ugoeU/hBf3Bmyz1ZH2Kd+MvUQgBPjLX5pwl9ctfgBYCTe1K7/GNJXJaaYaeLan1+dKis9Tv7QBGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOEPHl1FhvYGERFHBgtJVoJZVRe0UGt8udpoGR2MPAk=;
 b=tjgz1KtO0RsUpubXKr1HSOmYxTD9bEA/8c9ienXwST/oXuoa09uUfb1phtDuozKuKEfXyQbBtrrNLj0TBoOuxE1g8dmkL3Un2IawNVw4SodNCNKHfouea1QIhie5SrMLimpC+k6Wtq2VBuatSnkU9UBIh+UO2D9ttWBPQI081knl0pRG7ekHfG9n5l/pfUSEuyNKxZCmy/LhalCrnA8+QaTPsJYfp4ppF3vg7AnzALCd7u/5ZdkqKPZoUVmvpTODnY1idOgfo79/2eG4ahXquERNWRy4NnDA9DrlhEx6iCf7NzyAVHVLDYpB3u/ZpAAZPLefMjCc010pg1Eyxq4gsA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOEPHl1FhvYGERFHBgtJVoJZVRe0UGt8udpoGR2MPAk=;
 b=BTvmyXtVh5sOf8aLgUku4XSQAswMD6Q/1cifWvmZXkVioSoNZ708h0UjLWZjNTrRlWO1S4tdqLiuKsly/Qf4P+jrgSkp/Ae8rDPpvnEloebbP+YZoRcPduVP0BkUyS+OpucDB4c01JkYv0ChMC3BFm4U4GhMbI1DInr3dkjqtpE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjjWOjvDqJh/Mc+dnV+Yw9bnFKBP6h2bkyitQHjN+ljeUCpwBoYgu10bkbl63y7i7DxVUG7nkqH2lTFQr2NYH8LPO/Gj14q0aru6nXzyf4yDJ8I55XlCHdKe0o6y+UeB4HhEOCBxZt2ohbIqaME6PJ4oi78gs67kI+OdwxftFYn1gjHY4OglmfbYmtIaL9s//JZDX0ACPIRuwftyziXoPhElhwN2ll5rKZb/Zt1eJKsMk3u5lveY6h6cK59JSJ6BoPt6uDkTQExkGyu3Jzwrrjv8mMJr2sZiL2v3O1HhUwEa7U4W/my64xwio7hhn9jBQrRyN1qKNo9jhoLDuL2MnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOEPHl1FhvYGERFHBgtJVoJZVRe0UGt8udpoGR2MPAk=;
 b=FjETdrnivfLyzPoTPO77GfmAGgm4YhPl3VImWmr1iZuuxlSQ8LB3YVCKbKgYg3NCIKXz/22kZKiD18ZKbPaGW2ODwJl+CC1QYfPGTECctzZtRB/S6jL9n89lDauROH5QQi4utu347clYUWImT5YjRmwcXtq5LUL0OMbprp1j6MVs/W4S1qSriR7QsElsY4bQ3TiPlSZLTekqSNwpiLo8UIRM6er+FZJ0OdyZZZ0r+kvwF11L7x/S1wgkaMa6HFtutFcqau4/0BbUhHnsWjHMCtXAJfS2JxcwkzOWJy7S+AilH9TuYAAl4r795YvtmCOhwONWTVW6VP2MXt9gFX0dDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOEPHl1FhvYGERFHBgtJVoJZVRe0UGt8udpoGR2MPAk=;
 b=BTvmyXtVh5sOf8aLgUku4XSQAswMD6Q/1cifWvmZXkVioSoNZ708h0UjLWZjNTrRlWO1S4tdqLiuKsly/Qf4P+jrgSkp/Ae8rDPpvnEloebbP+YZoRcPduVP0BkUyS+OpucDB4c01JkYv0ChMC3BFm4U4GhMbI1DInr3dkjqtpE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH v3 1/2] docs: fusa: Define the requirements for
 XEN_VERSION hypercall.
Thread-Topic: [PATCH v3 1/2] docs: fusa: Define the requirements for
 XEN_VERSION hypercall.
Thread-Index: AQHbwNT/SvCvWvdWh0CT9yLy3QlhobPdDqQA
Date: Wed, 21 May 2025 12:02:09 +0000
Message-ID: <2040B386-299A-4BC5-BC59-7D3F58835A2B@arm.com>
References: <20250509112447.2931909-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20250509112447.2931909-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS2PR08MB8746:EE_|DU6PEPF0000B61E:EE_|AM9PR08MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ba22844-57e6-4726-40d6-08dd985f648e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?7ootux0WZKMkYdA0JHKL6/ImrZ0KiMwfpBAq/u7ukReJiMECRqBu9HZ9T38V?=
 =?us-ascii?Q?kqQmv7SVV6QST8eSL8Pxz5CJ3RxyKjRNGRZemIn5/pqNFOaqfELz6r7iZvUV?=
 =?us-ascii?Q?p+UqF1y98hP/ojeGwdD0ZuEyqLhERXGGfIDwtl3G5e9rUPZPDjRSUdj+ApgM?=
 =?us-ascii?Q?iE0cAs9Mug0JkQdHd6LhnDxUgzgQux4Pk9I7VKd9Inxg77xhlemnpC3EvB4T?=
 =?us-ascii?Q?SHHmorKqncfhVblrVjv2JtcDmBqzWV9+pa3KVFOlosVtRAYirSCHQvWGiiT1?=
 =?us-ascii?Q?I9HD+mzb6jTQ0FgaF7JTXAQW9corV75v7/JmE0W+TWS/K01CTjUNg8yWOYte?=
 =?us-ascii?Q?TK61/SSnytwPqXzeg5BvNOEUh0sehq/EjX5B1872dd1mJ4uCi/o6sk0FmKp+?=
 =?us-ascii?Q?YT07PSZD44YtftRyaaUgaffa1tPg7V+/lQeDL/M9bfCx/JUGzOED8Ik1s8c/?=
 =?us-ascii?Q?X2UBBEAdkCd4fB0bdP0t9WHkiOnqsntX+ui+aX+jQoeFYx1S2OvYSFATV196?=
 =?us-ascii?Q?N3pB9O98ZCXORPuHbKxY/2S05c63S36gUDEzWDi0jh7mTATGUCJu7F93qmCu?=
 =?us-ascii?Q?wsT+c7/h8pJHW6IfYJhR7zde8+KHI72VIp771jXzcletWPKkNmZLlOwfgoQx?=
 =?us-ascii?Q?lpXqP/QJf0+9N8SdjakOe1Z/6oM1YWjc/3Z4f6s+M7GF5JPw2xhAUqJbll/l?=
 =?us-ascii?Q?yWsiqkK9KyL+1ywaB6SjMTtWFayMKkQMIXuOJKl5CMk5IzXGQE8qYb0fN7Rl?=
 =?us-ascii?Q?EVPrU6beDJTh5urAaNuSbdv1mqxQt+CadQalDt6goyM1rYQ9YHUKfRKMyl6S?=
 =?us-ascii?Q?ApeV0PNKM1gLmkNjCUjJZbBiINiFzkPGOcfi/dLtulgIyXCKMGt2p/CjOmm2?=
 =?us-ascii?Q?PoW4wSszQkcoHWvAoMhXFRQf2ZGynSzz22oGrjzDQ5y4K5TVM/5WDSQg54vr?=
 =?us-ascii?Q?mgyqjR/KfA4J6NdJ/giSV1C6auWEpnIv3FpRqFtE+jQGcum3vEhGvDMtSCer?=
 =?us-ascii?Q?3Xeo8jl1tbMNiXQlMTpxSRQkerOjL0XlwdsxwKsR+9eD0AQVz1z9TTE1KRI1?=
 =?us-ascii?Q?oyMJPtcfQIpIUPVCO5mcba5YvdHYXG0y7rTjUfT/4zK7lEf9CVBeeUKgOmqV?=
 =?us-ascii?Q?KnNesUfY+H0qL8WvE7mmL/EiPI0pwGj5y7ns/nneIfVerRRw3BME9hN0T+yl?=
 =?us-ascii?Q?PBBo4wVIJ6A+pMfWclKnwpDflV0wU2WCOOo14qKeR2jVK7s5/2htTKmegSxt?=
 =?us-ascii?Q?Q5gMbdezbOCKMKOgM1dgiH0PFO+6YIAgwlZU5DNrLHtjIg1jbIOzYKOiAW+8?=
 =?us-ascii?Q?ntp4+65GFtb2cS9U5R+8/U2m3beptVV7h77vGcsaDiTcclL7SCMutwCr7Zpf?=
 =?us-ascii?Q?fnQRAe5jm/m3eK0M6zbWEqrH3G1RfJ36DMy/DN72PiDB9aM+ie7gquVlXW3/?=
 =?us-ascii?Q?3DaQXQkb9EOjX1CD4oFdeOLFZCIUvoghGp+kCaPlBd+Oxu4wuGh+NgavUQqv?=
 =?us-ascii?Q?19667XbfkzvlFCU=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <69C09579A1433D4FA10EAEFC781653FA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8746
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7087ad02-9ede-44d6-42ab-08dd985f5038
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|36860700013|376014|35042699022|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r7ddajqGLD5/ujZprCsu57pKyWz4pGj3JqIKR6BaLecqsbIlht3oNNjvpENP?=
 =?us-ascii?Q?9dZtBWZ0O1N2FsAm41Xckq/pOQl27Cy1aOS+SkucECO/zxmveaXOnF/LmQRH?=
 =?us-ascii?Q?utTqdBXSkiI+3g19to5gs6rv0DwS4hQHon1AnjwiWSUX2E7tsZ7Mhk5F3yrY?=
 =?us-ascii?Q?ZWtTiTs99o8Rat/rThUR+Rz8DV3zEM1Jd3ewv1DJ5/22gd+t6R5Q42GH3sKW?=
 =?us-ascii?Q?gBHa77h1zGj9cWtu6Vp/S631a1nNE87HcIj0fFFTjo5YJiXoddVV//TTLg3L?=
 =?us-ascii?Q?qSyRz23oDBjj7e262C0YJXc6Kk2Xk2JxzUZ5XhBsQ9LiCKLgioUZyw9GCZRU?=
 =?us-ascii?Q?vy36myF9kowwJhYDNwWQ+NyCKwSZc2yGX9zGg28zmMIrqLuOcaWGDDSpPLRY?=
 =?us-ascii?Q?diP77rXvCQHzvreu84b2sDlHz99a3wZOQGA+p6HDE+Dzi+CMIMSLwAMLbVga?=
 =?us-ascii?Q?VrSw/JRBOAihh51x0mT8WEcLkmJkl6BHsor/lcyoBrPh7/Obf4vMyb4MPTlp?=
 =?us-ascii?Q?wu4D388jg1Ya3PUx9Cq4Rmd9lYAwz9bVCg750lEboXSnjQLdeGMDJapZHmV2?=
 =?us-ascii?Q?Ph02Q9vWPFms/W/gPPYH22l9L1AeXHgvS/PCflRddpm9I02u+D6rDrnb7ZVj?=
 =?us-ascii?Q?p1DzQRS1eSatc8bSH0mKaapZKGbk68z4or2qloUgnAyF5t93qCxhdOXi6ejm?=
 =?us-ascii?Q?OlyeHbsDkudue4YYlc/ZzDS4t4h5wXjbtSYH24hOoIIpLYxGiQT4i+FK6xqg?=
 =?us-ascii?Q?zpoN4eopCqXO0e9AHhaUYUlRNr/ylR7UuS4WAE5nSS/0oxdanNe6kZeJxx4g?=
 =?us-ascii?Q?AhwF/XdAf4BBMHFt9I7BFuRiX2YM4gT5/GdnxSQtDg4QXjS5UwBBtB2kU926?=
 =?us-ascii?Q?8PbHr9YCI2T8QwgD40IeaeCGOFoV2cTukbFdrbzdu/6493FAGcBKyt+QkKUJ?=
 =?us-ascii?Q?thnMgrJsA0yEhfsEo6xrTiEizRZMNz95PxaePg5hx+x8tY8cLdCFazUFqwpR?=
 =?us-ascii?Q?rs38qD/w7g+AXiUYouLcru6XErijP4wuuOKpcF/DfdTxxisJ8P5snhGznSI3?=
 =?us-ascii?Q?y5HSzIOYgWfd0P7eel3YCrybAaYNN/bsVhcvc+yjL+/by//fW2O/8mroh6FE?=
 =?us-ascii?Q?fgywOhH01HDA0JdWicDAseLgdutLz/hrUXpmtn4UsX0HwYa5TXfrBqvsM3CF?=
 =?us-ascii?Q?yxpvvFxpbNSp0daCM/LwEZoPoXtQPMzBmnK2GZNzF52ZoBu8Q9dgEE6vzDrx?=
 =?us-ascii?Q?fBy+5XOByU0FSergC/IboPkIBJcfUxNwR8xpSdLWt6wFUk4NihdZoAe4RKF8?=
 =?us-ascii?Q?djwcbj4B1xFcLWicP9RiOt5PiPlzn7piDX2d3lqz5S4xdGUJ8ntTbJbfUcdz?=
 =?us-ascii?Q?ruc68w35m082xVp9q0thnxu0s5UVoJwVxovPjJSxmzwLfWtXh7H1pLoY48x+?=
 =?us-ascii?Q?wpqEplfTnjyguZq4yE9lGg7KAeyN3zZfCN26S426rxlnI4AGbcpbUkvsfZsj?=
 =?us-ascii?Q?CiC4LazrCKqlgOrP2K5wyCnZfCMaNYUhxyQ3?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700013)(376014)(35042699022)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 12:02:43.1726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba22844-57e6-4726-40d6-08dd985f648e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5972

Hi Ayan,

> On 9 May 2025, at 13:24, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wr=
ote:
>=20
> Define the requirements which are common for all the commands for XEN_VER=
SION
> hypercall.
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from -
>=20
> v1 - 1. Fixed `XenProd~version_hyp_ret_val~1` requirement as Xen does not=
 return
> 0 for success in all the cases.
> 2. Reworded the requirements so as to write them from Xen's perspective (=
not
> domain's perspective).
>=20
> v2 - 1. Specified the register details.
> 2. Specified the type of buffer.=20
>=20
> .../fusa/reqs/design-reqs/arm64/hypercall.rst | 58 +++++++++++++++++++
> docs/fusa/reqs/index.rst                      |  2 +
> docs/fusa/reqs/market-reqs/reqs.rst           | 16 +++++
> .../reqs/product-reqs/version_hypercall.rst   | 43 ++++++++++++++
> 4 files changed, 119 insertions(+)
> create mode 100644 docs/fusa/reqs/design-reqs/arm64/hypercall.rst
> create mode 100644 docs/fusa/reqs/product-reqs/version_hypercall.rst
>=20
> diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst b/docs/fusa/r=
eqs/design-reqs/arm64/hypercall.rst
> new file mode 100644
> index 0000000000..f00b0b00f9
> --- /dev/null
> +++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
> @@ -0,0 +1,58 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Hypercall
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Instruction
> +-----------
> +
> +`XenSwdgn~arm64_hyp_instr~1`
> +
> +Description:
> +Xen shall treat domain hypercall exception as hypercall requests.

This really reads weirdly.
Maybe: Xen shall treat domain hvc instruction execution as hypercall reques=
ts.

Then you can add a comment to explain that this is detected through a speci=
fic exception.

Also this is not completely true as hvc is also used in other scenarios:
- PSCI calls
- Firmware calls

So i would put the 0xEA1 value as part of the requirement.

> +
> +Rationale:
> +
> +Comments:
> +Hypercall is one of the communication mechanism between Xen and domains.
> +Domains use hypercalls for various requests to Xen.
> +Domains use 'hvc #0xEA1' instruction to invoke hypercalls.
> +
> +Covers:
> + - `XenProd~version_hyp_first_param~1`
> + - `XenProd~version_hyp_second_param~1`
> +
> +Parameters
> +----------
> +
> +`XenSwdgn~arm64_hyp_param~1`
> +
> +Description:
> +Xen shall use the first five cpu core registers to obtain the arguments =
for
> +domain hypercall requests.

Why not say x0 to x4 registers instead ? You use x16 after anyway

> +
> +Rationale:
> +
> +Comments:
> +Xen shall read the first register for the first argument, second registe=
r for
> +the second argument and so on.
> +
> +Covers:
> + - `XenProd~version_hyp_first_param~1`
> + - `XenProd~version_hyp_second_param~1`
> +
> +Hypercall number
> +----------------
> +
> +`XenSwdgn~arm64_hyp_num~1`
> +
> +Description:
> +Xen shall read x16 to obtain the hypercall number.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_first_param~1`
> + - `XenProd~version_hyp_second_param~1`
> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
> index 1088a51d52..d8683edce7 100644
> --- a/docs/fusa/reqs/index.rst
> +++ b/docs/fusa/reqs/index.rst
> @@ -10,5 +10,7 @@ Requirements documentation
>    market-reqs/reqs
>    product-reqs/reqs
>    product-reqs/arm64/reqs
> +   product-reqs/version_hypercall
>    design-reqs/arm64/generic-timer
>    design-reqs/arm64/sbsa-uart
> +   design-reqs/arm64/hypercall
> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-=
reqs/reqs.rst
> index 2d297ecc13..0e29fe5362 100644
> --- a/docs/fusa/reqs/market-reqs/reqs.rst
> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
> @@ -79,3 +79,19 @@ Comments:
>=20
> Needs:
>  - XenProd
> +
> +Version hypercall
> +-----------------
> +
> +`XenMkt~version_hypercall~1`
> +
> +Description:
> +Xen shall provide an interface for the domains to retrieve Xen's version=
, type
> +and compilation information.

I would say hypercall instead of interface here

> +
> +Rationale:
> +
> +Comments:
> +
> +Needs:
> + - XenProd
> diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/fus=
a/reqs/product-reqs/version_hypercall.rst
> new file mode 100644
> index 0000000000..400d51bbeb
> --- /dev/null
> +++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
> @@ -0,0 +1,43 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Version hypercall
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +First Parameter
> +---------------
> +
> +`XenProd~version_hyp_first_param~1`
> +
> +Description:
> +Xen shall treat the first argument (as an integer) to denote the command=
 number
> +for the hypercall.

I would be more precise and say x0 value.

Also "integer" is unspecified, use a more specific type definition (32/64 b=
it signed/unsigned integer).

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Second Parameter
> +----------------
> +
> +`XenProd~version_hyp_second_param~1`
> +
> +Description:
> +Xen shall treat the second argument as a virtual address (mapped as Norm=
al
> +Inner Write-Back Outer Write-Back Inner-Shareable) to buffer in domain's
> +memory.

You should say "guest virtual address" to be more precise.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> --=20
> 2.25.1
>=20

Cheers
Bertrand


