Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7936CB365E
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 16:58:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183037.1505834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTMZz-0005iU-Lc; Wed, 10 Dec 2025 15:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183037.1505834; Wed, 10 Dec 2025 15:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTMZz-0005g8-Is; Wed, 10 Dec 2025 15:58:15 +0000
Received: by outflank-mailman (input) for mailman id 1183037;
 Wed, 10 Dec 2025 15:58:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r+Mb=6Q=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1vTMZy-0005g2-8N
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 15:58:14 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0748e9a9-d5e1-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 16:58:11 +0100 (CET)
Received: from CWLP123CA0234.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19f::9)
 by PA4PR08MB6093.eurprd08.prod.outlook.com (2603:10a6:102:e8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 15:58:08 +0000
Received: from AM2PEPF0001C711.eurprd05.prod.outlook.com
 (2603:10a6:400:19f:cafe::97) by CWLP123CA0234.outlook.office365.com
 (2603:10a6:400:19f::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.8 via Frontend Transport; Wed,
 10 Dec 2025 15:58:08 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C711.mail.protection.outlook.com (10.167.16.181) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Wed, 10 Dec 2025 15:58:07 +0000
Received: from AS8PR08MB7265.eurprd08.prod.outlook.com (2603:10a6:20b:420::10)
 by DU5PR08MB10413.eurprd08.prod.outlook.com (2603:10a6:10:518::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 15:57:05 +0000
Received: from AS8PR08MB7265.eurprd08.prod.outlook.com
 ([fe80::b001:5eea:7c3e:1a31]) by AS8PR08MB7265.eurprd08.prod.outlook.com
 ([fe80::b001:5eea:7c3e:1a31%6]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 15:57:05 +0000
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
X-Inumbo-ID: 0748e9a9-d5e1-11f0-b15b-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=k1k/V1/wfXWA/hn6tKdePLXkXKQpCQFPJEVqpCME7fZnhcsZwK5PNnvwF5rF2pEJ3fhciJzJp9vDvX2bGwKxjUzL4SD8yEMVgW3FhwDpNe2sWyH9p34+4LQV7Y8wa3Lc3eXAP6J12Z4LiB6qXZgaL+zF6YFPZF9ZXeGa7TcE/UxNhGcqd9AcnVMNz4MaNwEWa242FPTxAqd/Rk0YiGM/btaby1Qnyuz0X9lFz/wnlEw/2jY31pGAdRfg3QlT5WDtJREdNt9cOs17NlmtMDsG8QYgmRkTWCvDNtoKcG4ooapgP5sykZUmhcx87NofhHKrLI0lQSRxuzYx1AoWAFw1gg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nd8KM9uqGWlultqrBoskUBUiANqLPkl4tKOsv50iwXY=;
 b=JCnOsOwAuqs7HC8y6IWDrEbnka9NiY0OeTEjag+vwNixfI9/o1hkqWtTFyNzEpuS4wQh2hP1E6Nkx8r6/Aq0+iR+ZNl39lpwc1Ecyz3mgxpNUB/GP6IJ0MQs824USOUlMSalSfQoQBptXn4r+tXXyCeAD3/TlSBPMO8A02gLGUoPZOlPn5GMX2rrkjsX/B8C8W9NjMbtr9ysrf7cRnH13kG2dSEC5HmvTSefQR5erAlOnDLbYk/0oCXyQrB2CvPHazady0oO3GUr+/lZeVStpwsI0df0P6kz4aWfW4dhcqZSEGMk0qovTTWExj1ZCJBpk69xchqtmPCK1qVbzhR0uA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nd8KM9uqGWlultqrBoskUBUiANqLPkl4tKOsv50iwXY=;
 b=eN2jRMF13WwJanbAnlP0XIGfsgSGQQQiaxEDnIWTPImw8rcfW8NiArip7UcOyUZR72W3n1Yr+YLTVDBnW+rp69zAnDhRrjntqXavO8CrNlz5uNOz2qKiHmK45B4I1EkBGTrBiIyTkCZnko9hoVyGYaOkrwq23O9MT5QVn9wpu30=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R85r/rODdknlabBUsx8awOy72GlnRBiPZQomGkgHtTk+r8JS65mmI8WUwGEfRnV3wNXTITttj3Yx22uG2MrKMv7M1460ZM57jVDYDB42yPXiYGMEdr7Xrdidg3AgIxOC+3KkgIomVEQ/hAoV+GuG6cpirG0A6atkMa6Bhui50SqedYZMQaGcsBqbho+4aRqPDCqpe1c+OoVf1xXH4zyH7PXG1inn3sJjCtWuDFEqTo4FD3KNMElmuUy0hNxCAY+w5aQZ6HorLWY/0ol++Kx8WcABZMTp/5zSc6GehOmqbEJjd6OWHUttaRZEnOL3oWAah/0tHpdC4b3RVYC8eYlSZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nd8KM9uqGWlultqrBoskUBUiANqLPkl4tKOsv50iwXY=;
 b=N6GA4OyobRWIi+Zq8wUvUActS1etFkSyxTxJlCJ+XoQVx+qfdM7YfifunVPuh5ftPXZeNWVY8a229Ce7FuERuUJF54GwWtgtuIa3QB9Qg40YVQyU3b4dWDD5b1sNpzPQDduVSnsmVaGI5CzW3JDkvL5au4SGOmgPjf37yj6QHH8FHgL8s0aIV39/cx960cbqo6YL208K0LYZiiMEpeoA8bx78hkjS1vHPHQ4e5lmrKrWEvrmlbzL+qhats3Wc3WeSxyyYP8hC1cm9vh1e6nlyEgv47jkObT7sgbuxUg8BHkjTHL610ygs7ybZ0EydzJFl5wV29VejhSHs8bCwUvt4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nd8KM9uqGWlultqrBoskUBUiANqLPkl4tKOsv50iwXY=;
 b=eN2jRMF13WwJanbAnlP0XIGfsgSGQQQiaxEDnIWTPImw8rcfW8NiArip7UcOyUZR72W3n1Yr+YLTVDBnW+rp69zAnDhRrjntqXavO8CrNlz5uNOz2qKiHmK45B4I1EkBGTrBiIyTkCZnko9hoVyGYaOkrwq23O9MT5QVn9wpu30=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Set ThumbEE as not present in PFR0
Thread-Topic: [PATCH] xen/arm: Set ThumbEE as not present in PFR0
Thread-Index: AQHcaPf50ZeGSKmclk2/0HK7x9tq5LUbCS+A
Date: Wed, 10 Dec 2025 15:57:05 +0000
Message-ID: <E21ECF40-6A78-4847-A351-04C035B86406@arm.com>
References:
 <b9e9ec4a393b34b8872a87335db2bde707973c0c.1765276607.git.bertrand.marquis@arm.com>
In-Reply-To:
 <b9e9ec4a393b34b8872a87335db2bde707973c0c.1765276607.git.bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7265:EE_|DU5PR08MB10413:EE_|AM2PEPF0001C711:EE_|PA4PR08MB6093:EE_
X-MS-Office365-Filtering-Correlation-Id: b94af109-5433-4480-b486-08de3804e96c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?LAbShm4Humv/uWhb2f2dwUuAHJWBH/rYeC4Ng+Al/kBbm2LIPdMWvaRjgp01?=
 =?us-ascii?Q?Qstu6ashvZQymykgDfAea9ytU1Orl8+/BNczu4jYKX12ul/UQ5+v0aVQ+L9N?=
 =?us-ascii?Q?9Oo0tg6oCk25uWUecwc60ORlUWWLYykV2yY3w0X0YdzsKHRQWW8vk6HK9elQ?=
 =?us-ascii?Q?zcufh10pMVkrdQ75StcDjPST+bBLvdnL+o8UwEro083tVrI3NP8Isq7Bovp+?=
 =?us-ascii?Q?H341xW4L5LZbUFOA/TZwtre/FdI7l7W/NFTkgn1gBdZrjnuuoiBRwtmY0EEl?=
 =?us-ascii?Q?VZxM+a1Bg7PJGxZTLa5a+1a2+e0FsEBuHZrgHTkbcrmjsMAmLiA6ZtImbR2V?=
 =?us-ascii?Q?CV12LRhhZNI3burNdZQrTOXTJqTcX5BBjFUAQowFoDoFJtbfY93zHCqad28Z?=
 =?us-ascii?Q?vYNjIdkqUtbr+RWDybcW+dDh9OuXjjiR/iNrlEzsWz8RwtGykO2FcaOxaytj?=
 =?us-ascii?Q?DXoMt/fCGNZyhLkrhQwkyiiZqJsCkS/0OI39gJwJKAYEusZDCOQHjtQXu44m?=
 =?us-ascii?Q?vuhQgkoKT8xvIIvcAV6R8P/UCEXeGPdxR7/ImkOU5tPGVqKQIB48dm1Y5/2G?=
 =?us-ascii?Q?MK166YcKSwee0sKdKdUxFRfGgRSEyD3zqjWnIWzkJR8ZR+10AjRQFPEOfyef?=
 =?us-ascii?Q?MpU8bfLiEUVmLD4RbvKcX+y+naFYwEC7+LeVhhdzZT9G+4evKGX+D5yLqiWW?=
 =?us-ascii?Q?jLdhe/8JviP8etvIgmjq3vckQ91TDwrlTryEmEtvRxFi4xe1CUDznHuUvKtM?=
 =?us-ascii?Q?ACnl56fFpJAiS0rTx2rNC5zZEf3Wt4SHK4uXZRs18+fy18vqX5lpb8eq1zO5?=
 =?us-ascii?Q?YPlGaNU3GQbyttWX16u27UQkOx38qem451wBO8wdOpBprX3IO87xk5NdTtqX?=
 =?us-ascii?Q?ru1BWrFxa4W1FhTeXpyzxeF5g89i4aoZzlDvzjPx6kVxMiaV+zHbf32HyqV8?=
 =?us-ascii?Q?DiZUG99+SjuVLLPGpfLNHtV7kTMUVKx59EoKiu7xHBHcVJXVE3cX/QsotljJ?=
 =?us-ascii?Q?aXFEH737LaB07EwnWm4kD7AX/JXQ3c88sXhuj3uJJiE2KqFcEroI3l04l3fn?=
 =?us-ascii?Q?becMOkRAunAuvnDDxVHZp/V/I9KGTcUazkpX22jyBHMWuiQB2462Qqy/jlc6?=
 =?us-ascii?Q?hpYDnb4jD+KSvn0fNXETdZN0b+WkdDLj+unQ38pe2to9RBW3NSD2sum7ufzN?=
 =?us-ascii?Q?CXQnWKr4HzhERgPBPrcWYTyD58nBCGyiryUqDrPS+4yPlxt7vQBx/lIOqRMI?=
 =?us-ascii?Q?ZX3tLrXSVcLFBaobgPweQRwYbsMaVpdIKeweA5SsR13irCHf5HphszUxGxf/?=
 =?us-ascii?Q?Q5CiWAm3Hicg9IgTUokoq4766jVeUkyb25gu1X3UhHaeA8T83++Lf9/0mAmT?=
 =?us-ascii?Q?4u4yo7fMIBZ71e+m/iPTSNh4PkGQlSckj/UrQYdVnLOwbdLMM/8nDSx8A/vO?=
 =?us-ascii?Q?BuFqwW82dEp4kU0HlIc3AGga5MW8HgrqTgArloNrVVhZnTo6Ws2/kFHPNiMs?=
 =?us-ascii?Q?GIz39t3Tt3A5+dVjLLiWy87I+ht+nq0ng57Y?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7265.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A166E219CF5D1E45A8B55F22946D43C6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10413
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	35f1b61a-c097-449e-c14d-08de3804c413
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|35042699022|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2MZY0/C1gtX/vNJFs1k3nUKCUIDcQgvzagwiQyYsYky+A6qW/k3TAGpPQjkI?=
 =?us-ascii?Q?73zugnlMQe++aXkRecGQFcy7MgRtRCHk06BQzwF1MLRtvei78IQrfA9aQD4g?=
 =?us-ascii?Q?B4qQYJLaTRCaNgG8N1B/DTFNVLm+n1Q/RPcxKshIggGt2taeRpHLNy24ptQk?=
 =?us-ascii?Q?DU6VMjX9ddEQ1AoGBYF+bS4ab3+2nWtjGreB5P3couQSMGAHig9cPks3KfH9?=
 =?us-ascii?Q?YGDjtQYOhrZ/7EPUCm/BO5p3ir8RyBBTACb6UUzKjioPXHBS3KG0Igy899Hp?=
 =?us-ascii?Q?N8q/1LrMGBofgrvH2GeFnmQRs58xZ8aAyTheazmXDSD/37wEj3bT0pAqKNqe?=
 =?us-ascii?Q?9CNoUjxmqLdTNNCAzVV2QHNTChZPSicWTSQcH0B40KIVkw/TvcdQZ0z6sDrR?=
 =?us-ascii?Q?At87SoPs816iTLWdfWqrbcu6vaNGSsOMKlIVREp+TX+Dm6cu9HiK59NRK4fW?=
 =?us-ascii?Q?HyfYY2C9n/fXMMnAPZ2IvN+dKMNOKZRUCBmC0vUCe5UtJvgWh4eT5+3cXZmp?=
 =?us-ascii?Q?tviwLtEVP2JcizateH7QplTcR+FgrwnSt6Mit8PaGpOBmpMf4mzioKGbbPJF?=
 =?us-ascii?Q?AiOzlAIaf/X7ILYeQSAiibRmUC/TtzQdV7zMKkjoupyWWb34zAYyXcOQLJPD?=
 =?us-ascii?Q?17Iq72b9MyRzSjdR+Pky/qvyiQ+D8+O26w6DEX95BSvdcYlWN94Xu1Y+Flev?=
 =?us-ascii?Q?R9DGxMeKlPdgmkiPNI9J/l5nH3OGymx6orEGzFF4AtiqKeNP2NZmXMz894xW?=
 =?us-ascii?Q?W0e+DggwjOeBrrH9Gvh9cp2FVn9kjvCZEwZyniULD8ZIUMP1nkuzXoCLpx+O?=
 =?us-ascii?Q?nZK4aQ5cxhohSX3xcQ1wibJpypWdcTw7k4y0VZHzkBInpVfGJH+wTxtfOmbY?=
 =?us-ascii?Q?2HSr4hRhlFX22HBe7cnIPA9YshDB7fTbZ601kMKTLBH7HKCaKKQB9nGKyeH2?=
 =?us-ascii?Q?sR6FUpBHxD02NVXzWtMJ71jZRXr8RSxjYmbbaxZABOnqq+Pwz+Fzg64zjg8D?=
 =?us-ascii?Q?UNMFaxmTYGOI/JaklxsdVdRcX9lr1eZVrlq6wJbGbhbd9qnMRKgzxMAMKo+S?=
 =?us-ascii?Q?KWNFKcmeJGk6htISv7aN18Fz1FmZTpMTXdU7oF5PZZT87IyskZPHjEIlr7LR?=
 =?us-ascii?Q?VAygddgHr8LTXUSZieQKaK4LWXr+iG1SAEBYxNtVmW8jTJdvcTXSsM6MjC4h?=
 =?us-ascii?Q?xo+gLhE9YdMBDW75I0IVSij9Z7gJ2pG0pjf7Ljrj24vwVjHKf6ExWs5hZ75k?=
 =?us-ascii?Q?3fyI+oVjsAZ9j1KV/kVHTdD2q7dj7Eu5LoCuOS17uFpmbIy5sxv5x9uI5CBD?=
 =?us-ascii?Q?K3ETtnAz3WsrfyTExLSIJUCPGCTERvR2qZFLDVXcfPZWk0Kopy8McpmTL4WF?=
 =?us-ascii?Q?ABCY8TELpF5tUG+9QVb2KkXGADsnPN/vR6pNL5uD7AYuvXkVOmlEAzxpecs2?=
 =?us-ascii?Q?IjU2v2J6UDNzAGLPD05J9CcMwjVKIgowtQgy9o+F5WUt1WPq+V/y2hOtgOvB?=
 =?us-ascii?Q?lSVR1/tO+tXMmJuLaEcuHeRwRrps5GdGY2SqJ4r4cl9aVuE0xy8MWS2SG/Ec?=
 =?us-ascii?Q?a0eehYqoMKTPCe7y3qc=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(35042699022)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 15:58:07.9568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b94af109-5433-4480-b486-08de3804e96c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6093

Hi Bertrand,

> On 9 Dec 2025, at 10:37, Bertrand Marquis <Bertrand.Marquis@arm.com> wrot=
e:
>=20
> Force ThumbEE support to not available in the version of the PFR0
> register value we present to guest.
> Xen does not support ThumbEE and will trap all access to ThumbEE
> registers so do not report it being supported if the hardware supports
> it.
>=20
> Fixes: 5bbe1fe413f9 ("ARM: Drop ThumbEE support")
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> xen/arch/arm/cpufeature.c | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index 1a80738571e3..4cde208e721a 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -225,6 +225,7 @@ static int __init create_domain_cpuinfo(void)
> #ifdef CONFIG_ARM_64
>     domain_cpuinfo.pfr64.amu =3D 0;
> #endif
> +    domain_cpuinfo.pfr32.thumbee =3D 0;
>     domain_cpuinfo.pfr32.amu =3D 0;
>=20
>     /* Hide RAS support as Xen does not support it */
> --=20
> 2.51.2
>=20
>=20

This solves the issue I observed.

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Tested-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca


