Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B200AEDBEE
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 13:53:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029071.1402813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWD4g-00032h-4L; Mon, 30 Jun 2025 11:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029071.1402813; Mon, 30 Jun 2025 11:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWD4g-00030z-0e; Mon, 30 Jun 2025 11:53:26 +0000
Received: by outflank-mailman (input) for mailman id 1029071;
 Mon, 30 Jun 2025 11:45:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k/9V=ZN=arm.com=Hari.Limaye@srs-se1.protection.inumbo.net>)
 id 1uWCxJ-0001NX-59
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 11:45:49 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2bd5343-55a7-11f0-b894-0df219b8e170;
 Mon, 30 Jun 2025 13:45:46 +0200 (CEST)
Received: from AM0PR08CA0024.eurprd08.prod.outlook.com (2603:10a6:208:d2::37)
 by GVXPR08MB11036.eurprd08.prod.outlook.com (2603:10a6:150:1f6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Mon, 30 Jun
 2025 11:45:44 +0000
Received: from AM3PEPF00009B9D.eurprd04.prod.outlook.com
 (2603:10a6:208:d2:cafe::67) by AM0PR08CA0024.outlook.office365.com
 (2603:10a6:208:d2::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.30 via Frontend Transport; Mon,
 30 Jun 2025 11:45:43 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9D.mail.protection.outlook.com (10.167.16.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Mon, 30 Jun 2025 11:45:42 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com (2603:10a6:20b:55d::22)
 by DB9PR08MB9756.eurprd08.prod.outlook.com (2603:10a6:10:45f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.24; Mon, 30 Jun
 2025 11:45:08 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5]) by AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5%4]) with mapi id 15.20.8857.026; Mon, 30 Jun 2025
 11:45:07 +0000
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
X-Inumbo-ID: c2bd5343-55a7-11f0-b894-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FmP8akNDuz6bZDwOqNVmlx3pyPz5u4/Kb3mEiW/7fETw/CqY71XL9JlnnmGcE/P9DZ3b7g9T4o5WCpnjE9AIh3V6b1oalsfFSDswxojDR05wBLZvhp+tt6P4xwZbxV3bByPlM0DSzYg3q8te+9RTfHKryHjp5SdCNb8Cj357IjN1dsmaW//1LMYZwocD5gi9ESAOk2oA0aUw3Fel9PAr2DvSqFgA4+fL8eJbZUjd9QLtY/gbdQzgzG6IGvvAOgzY5UJUc/TRODsN10/uUj7uhVlVVbSrkR8K4qQizIejpg55MUBH2bAna6K4EL/fCFRJ1VWs8f3xPz/2HrPcxElveA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xn2ZK+VqFiaGG5mPNYYMsu2lmvc7VsqR/hcsBw+qkpQ=;
 b=H/eIu8RDRwMYTpsqNQ/AmN++xzu/sG55eZxMoZqo97ouOIjkmN7+V6GhEFzvX2URxXUpq7o3ujDkr2DOxuYewmXEUh/sOoTyK6e6UQEiqc5OUBCh8wL0NXEG6PJI13UVtpAWmmW3VuSxfstviH0+7DTDrx0h8dAuNc8dOH6X+wxIbYeOcQTabpPLd3fk4/JWLTonYt2tm+K5bXUPufAqQOmunJcGPnIXzFX2sgtkZwzNtQMr8uPOF+dOl19Z/UpWLFTO6SahC/PIgwXiypV5/bdO1tXdsVInSjc91yTp+sZzGcEDI8fQmE+g7cVrW2Q3EhNnvtzgdqWwWWSFFmCS7g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xn2ZK+VqFiaGG5mPNYYMsu2lmvc7VsqR/hcsBw+qkpQ=;
 b=k1Hmws9ZtEB2+7+7Cu18aqruh5Mqruybk5OPN2okzF+n/ZBPRXCsM21nvv2D90Bq04v/gH08Jg5tsCGwSSZtM6szkTNAVwvJj67jVhhhD0ITJjUr99Ww+IQw1pPtJ83c5wpy1Wb4GXrYFPnKYswnU7+XnPUMi++2fEpXsdy0j3I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PL/lUDKxqlZ0EqrEBjhF8IuQzEMMkbP+JMYCZwfo393EXYbp9BjcjD1vh+xu/unqjcwZF1YCFXJ3WHSjyEaH5ptm2SsiZZu94M10ddwSEj9dyljBq8t/wmIrKbzzJgi54ksPHH48/b4AAR9DiV5EenIikD0KfdnTxjNWfoBB/w9tcWRQtNV6rQR4we0rEWeECFulXiiEOXI4z7wbN/Bk221QnvstXK0GaljD2zDAfWMUvCGyyLCqyyQnFF91QQwU95HPYlGB1t5Ht0nBOv19awCIb9YNAlzN6OAJPgMCVHKSlC3YMNEcJy9VyVy8JZ3y5G8DbF6eNItmdCifk1ilXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xn2ZK+VqFiaGG5mPNYYMsu2lmvc7VsqR/hcsBw+qkpQ=;
 b=VP9yfUyjT6WubT/vB4109cn2iiDSEeTmyvsiMFkTyorMGYtQdYNZ4TfeEfLbDz2C8rj9yj45fXKUz+cmaiaR42JUohzZ7I58/jYsEsMVebOkmCA0yTKYX3B3gLdX/EaLhUde/J56UmGApmV3S36WJrP2XYY4xx6AsN/zcaK3vq01Zm5pasf2rr16j144YCqUVZprETLrYoDBCBCh8MhMFyg1vAxGBdExCOUWLxnioSliuTlFxuz5Ob7paA4adnY57aiQW7jZFCKPa7pWvZ9bJwRkkmN/s5FuKRl9I460bRaqt0E/sL5R8gmL5mUPqJBw74t+Szz+AdvqX9h4cS5ntA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xn2ZK+VqFiaGG5mPNYYMsu2lmvc7VsqR/hcsBw+qkpQ=;
 b=k1Hmws9ZtEB2+7+7Cu18aqruh5Mqruybk5OPN2okzF+n/ZBPRXCsM21nvv2D90Bq04v/gH08Jg5tsCGwSSZtM6szkTNAVwvJj67jVhhhD0ITJjUr99Ww+IQw1pPtJ83c5wpy1Wb4GXrYFPnKYswnU7+XnPUMi++2fEpXsdy0j3I=
From: Hari Limaye <Hari.Limaye@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/6] arm/mpu: Find MPU region by range
Thread-Topic: [PATCH 1/6] arm/mpu: Find MPU region by range
Thread-Index: AQHb4cjCVnITZP0lYkm5xkhDeTI89bQW6EcAgAS2Gww=
Date: Mon, 30 Jun 2025 11:45:07 +0000
Message-ID:
 <AS2PR08MB87459E5BFB3D0CF492FF6E47E246A@AS2PR08MB8745.eurprd08.prod.outlook.com>
References: <cover.1750411205.git.hari.limaye@arm.com>
 <e4d628ea02af087c4a299de0b16c75a9e0c6c17f.1750411205.git.hari.limaye@arm.com>
 <bdbf558e-c574-47b9-86fa-b9e54a759f9d@amd.com>
In-Reply-To: <bdbf558e-c574-47b9-86fa-b9e54a759f9d@amd.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS2PR08MB8745:EE_|DB9PR08MB9756:EE_|AM3PEPF00009B9D:EE_|GVXPR08MB11036:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b2d4f07-29a7-40f2-2940-08ddb7cba4a4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|8096899003|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?/qnYdGZv2GUszyKpGAoZLSDLXXM7q8OJFGlLxQoaqkdi0H87GmaS1yizgaVK?=
 =?us-ascii?Q?U66GLFfvafQQb+hamKqIgg81TsVNTAYDTFOVBcXXy3qxbM8psjavDL+hmwE7?=
 =?us-ascii?Q?WlDU5DSPmFlIpclff8A+mmY8szH+j41eyH+HkUc09angjZUbyCnbQml1jrBE?=
 =?us-ascii?Q?XnMSrUX1cbThANpfcc0Q9r+HqnqIwPRxSXgycOo19iz6hDsG0s7/tNct+Wpa?=
 =?us-ascii?Q?b8FAaBQoEptSTO19yTaRTmmuLyNAyC4PTNWSsrhdKXIQ722/bLhWmFJpF19N?=
 =?us-ascii?Q?ekWu6NzX7Ret34X+uj1yNfT5BVb89alwfnDPC06WnYz2J0Y8aiPafL5YnHoC?=
 =?us-ascii?Q?Vi7KOydrPtda8t3W/ZchTIy3dgoX5yBFP2cryrh9kafiaQlASnyXiNS8j9gF?=
 =?us-ascii?Q?U8lAjr4YokIn9R4mwXMHjWsFLQBFCFU4XiAAPCQs5r/17Ylk460VFC0QYKRe?=
 =?us-ascii?Q?r6A99tTwEXtIJdIUlEkN71lFYDCIDYyuc5oFL0nx0KRDexkBIj0K1Gge2GmO?=
 =?us-ascii?Q?8gO2XtWkxnDhGUATf5hamY+MoLBnuGu2gP5ydtB5ngWGKw8JdnYcIIGhlKsf?=
 =?us-ascii?Q?PtrfOCk32VMoI2KW2u88qdByM7eKXSczcAW1/wboBTSVMMTItdHkSnkQZjQw?=
 =?us-ascii?Q?ZM+aP67gOdq6t+tTWfxjoc5XE7LvwIcJtaHyAm87WOcjhHsuC6Htida0gXgG?=
 =?us-ascii?Q?31DKF1oo2DY7ei6LFfHUYpqiosOb/Olh925AEYY5doxbXLLHPhxpfZkEUeBA?=
 =?us-ascii?Q?E7MTvrRf5r8qbSEr3MQ5ztLVYa1QtMsmISVIrZlO00yRwani8uUd4TqW7RER?=
 =?us-ascii?Q?xYaAtrOQs3X5pHrBvfu32fYS1NS6YUtwrIg2BbDhCS83NpCw2UYzFYb+eRot?=
 =?us-ascii?Q?pneAX0JDnXQ6Cu0g5fE0a5bWc2xhAWiMes8DCvyGrfmTLMwQ26tVCaXvY0Jb?=
 =?us-ascii?Q?+XzYIeF1ovS1QpFvJRoG5xt4x/J/ux+a/2Qx5qjAQJxIs3T1jKDsQ2V4XbFc?=
 =?us-ascii?Q?jXVm0uU1eMJOtJZyi+0scDTFo7jf293VhNndQuH/gNtLIm8aKYoIrc9Ytk+j?=
 =?us-ascii?Q?Fmp8RcCOpqVTPFsRInJESy6pDh13OlMwogTDMoL1WTDRsL6KChBvfGSwGwIm?=
 =?us-ascii?Q?WNp/F9F7uafLa37aay7pD9qr2w4fcuCXk5563DfC/wxq46F0FRjajpgh67S7?=
 =?us-ascii?Q?HEAJF5gNTkAL4n1yBrnlD1LcBeV74WAlpnGge29UIEaQtzcwuwuIUopx0lYc?=
 =?us-ascii?Q?LMMbSbihN4MDwIj5Ysk3li2+rXNBbkc+cglL9WU7iaikd6jmX2ZlWljW+dUR?=
 =?us-ascii?Q?30EUnHAdj2x3z2zDT1Zw1FOxFW7jZnVvfa4/aUUelCzGTan4HjBXuwCDHNts?=
 =?us-ascii?Q?ndlg8zETl1kuh7QgRQokR4bpdFJo5uutaj5QdVblR6I7m/GKnkEZNHXK+hCv?=
 =?us-ascii?Q?iyBP3FHZ9dBYNB8p/CuBJf5gIelu07VbbA1iSeJ8HrFv10NkfuyeWw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AS2PR08MB87459E5BFB3D0CF492FF6E47E246AAS2PR08MB8745eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9756
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	474c81f2-d736-4697-2be0-08ddb7cb8fab
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|82310400026|14060799003|36860700013|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info:
	=?Windows-1252?Q?bMlNERPWZ1NFGGvp/Woe3rPND+eq1tJKdB7fhM5mG56FZKjmMqSiw0EX?=
 =?Windows-1252?Q?r++TH3qmDfWfHAkrCKnmkAi2FuN5B1v3PhYHnXRhLMdaJFshUBhCNmss?=
 =?Windows-1252?Q?QNQbPUSI6RCd5S2gu6hQEoEqeV6plR2bMoJ2EphCg/iskFHbkyxykn3U?=
 =?Windows-1252?Q?7PC78SjSiBWqGXnoxV+fHFmZrFi5RNbAotgN6EBW/0lVXsOyWoTezQ1Z?=
 =?Windows-1252?Q?WtmukMtHlJm4aI6wmt+E90xT+cJSygP5xfswL7F6awLr0drvDTVUJwNZ?=
 =?Windows-1252?Q?KPshM23RJVScn69QjbvLlg6wfOEFULX8lVYYEXZ1p+uSJFHa/3yUvinL?=
 =?Windows-1252?Q?WtA14t7EO3xP0vRLCt/tu6zFBKBrNyLqKAy/86Pfo/4gLWAPrNMENaL9?=
 =?Windows-1252?Q?5HhXou+9GHEq9j+f466gMcp+lNoIljVfw7egQOfkVJ30DmNNQhD+Gx13?=
 =?Windows-1252?Q?eJeZZ7q34aKbeAz3XyEw7O7GE+j8XHlykpTSmJx0+rxcDhmuatAtCEGI?=
 =?Windows-1252?Q?oGM+LZr8Mr4ug4zkkggIjNq2BOoSlp0yiJ+SvoPw7C0biplv775PPvjF?=
 =?Windows-1252?Q?QfFUeXob8oJxnspUB95iuhajtRVnWpQ48J7H6aPIhoYvrFbeWs7BQdun?=
 =?Windows-1252?Q?SGEy2njDnanLUxsl2oh9GkrF+2N3gt9w7uCosoqtIOUNgDZsao1HKTbO?=
 =?Windows-1252?Q?ltgjqy2WJgwLsfB1vXKaLwVFWjfoD6O1PMe2UmNOIS5StMHU66Hs08EQ?=
 =?Windows-1252?Q?1kNpfiPISJnwfnXIPyXlWeBCfHFtHKlHdxm1FYV/r9mk2HfMGoRzyCts?=
 =?Windows-1252?Q?HjwHQoqwrKRQK8F4+pOd4w0U543MLN3Qt7UjhHIpVKhHvFyWTVwoQK7Z?=
 =?Windows-1252?Q?VJLYWVhsCdNwZJ7FBEQhiJ2rCN+PbR6kMkN6QhOcVfHDbEn0yOBCqVfk?=
 =?Windows-1252?Q?Qf+dZAvAysO11w/MmypGBdRfQtXsTEUaiYAUKTwHP6TzzDfmcly1kqvJ?=
 =?Windows-1252?Q?zAa8xe6B8tUzvG770gaNy6mp++7pfQ5Z6PB65v4WKSivzVP9xlitcx6o?=
 =?Windows-1252?Q?my3alxvmd0uZbDx+2jVwrWM7+Sv7e6b2NI3IoqMcFH0e0FJBJAzHSfus?=
 =?Windows-1252?Q?nZH1GDECSJE+XiGA74N4cc9aoQHXgnlDgmX5DjvPHlqIDT8FTpSgfiHc?=
 =?Windows-1252?Q?EGwVcjSJlYmsGvUy69dscQdB4CjsDRtd7doGJ7RXCTRLk/mw5v8X2Cvk?=
 =?Windows-1252?Q?uKxBH2qHxrI0bafRK/pEX4FkEuk/tsf2jOmTfPpGDXsEfklQUUOFA6eA?=
 =?Windows-1252?Q?EZHj9ZLqfQD29MTkz1IYRbASOBkMnWLQJytsxyV0xkOSdcs4n/pmLIMv?=
 =?Windows-1252?Q?yoNJaVp7Hwzp9NjoNIfV8Am1Qj7AOavvllaP9u9Z1sQ4L4B6YqAGMJwH?=
 =?Windows-1252?Q?pc3BRWfpdFZH/bF98AL/L3aktivkCX77rWiV4VFdaNBmOCs0lyxVlIuD?=
 =?Windows-1252?Q?l4vPWAGEK8xY/k6+GMAphkYHaa2NJwUG/hrkm1IsrWSKPAo7GlgXRSd1?=
 =?Windows-1252?Q?aLp9q8dfe2dZshxdeEDByfS50CKmg6BXMCdsNEmU5/PCmSTjM7oSTSVg?=
 =?Windows-1252?Q?39q/czkzMyZKLd9jRfC0k1Hm?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(82310400026)(14060799003)(36860700013)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 11:45:42.3744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2d4f07-29a7-40f2-2940-08ddb7cba4a4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11036

--_000_AS2PR08MB87459E5BFB3D0CF492FF6E47E246AAS2PR08MB8745eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

Thank you very much for the review.

I just had a small clarification regarding the following comment:
>> +
> +    /* Allow index to be NULL */
> +    index =3D index ? index : &_index;
>If index argument is NULL, why bother setting this internal variable _inde=
x?

This assignment is intended to support `index` as an optional output parame=
ter: callers can pass NULL if they only care about the return value. This a=
pproach avoids repeated `if (index)` checks by aliasing to a local dummy va=
riable upfront.
Would you be happy for me to retain this pattern, renaming the dummy variab=
le to make it clearer, e.g.:
```
uint8_t dummy_index;
index =3D index ? index : &dummy_index;
```
I would also update the documentation to clarify that index is optional.

Alternatively, if you=92d prefer to disallow NULL for index and require the=
 caller to always provide a valid pointer, I=92m happy to change it accordi=
ngly.

Many thanks,
Hari

--_000_AS2PR08MB87459E5BFB3D0CF492FF6E47E246AAS2PR08MB8745eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;
	panose-1:2 11 0 4 2 2 2 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Hi Michal,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Thank you very much for the review.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">I just had a small clarification regarding the following comment:<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&gt;&gt; +<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&gt; +&nbsp; &nbsp; /* Allow index to be NULL */<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&gt; +&nbsp; &nbsp; index =3D index ? index : &amp;_index;<o:p></o:=
p></span></p>
<div id=3D"mail-editor-reference-message-container">
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&gt;If index argument is NULL, why bother setting this internal var=
iable _index?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">This assignment is intended to support `index` as an optional outpu=
t parameter: callers can pass NULL if they only care about the return value=
. This approach avoids repeated `if
 (index)` checks by aliasing to a local dummy variable upfront.<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Would you be happy for me to retain this pattern, renaming the dumm=
y variable to make it clearer, e.g.:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">```<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">uint8_t dummy_index;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">index =3D index ? index : &amp;dummy_index;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">```<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">I would also update the documentation to clarify that index is opti=
onal.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Alternatively, if you=92d prefer to disallow NULL for index and req=
uire the caller to always provide a valid pointer, I=92m happy to change it=
 accordingly.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Many thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Hari<o:p></o:p></span></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_AS2PR08MB87459E5BFB3D0CF492FF6E47E246AAS2PR08MB8745eurp_--

