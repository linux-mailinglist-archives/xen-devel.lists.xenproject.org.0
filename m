Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B480A8B216
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 09:27:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955138.1348962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4xAT-0001eY-Fe; Wed, 16 Apr 2025 07:26:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955138.1348962; Wed, 16 Apr 2025 07:26:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4xAT-0001c5-C6; Wed, 16 Apr 2025 07:26:45 +0000
Received: by outflank-mailman (input) for mailman id 955138;
 Wed, 16 Apr 2025 07:26:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hq9D=XC=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u4xAR-0001by-Ln
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 07:26:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2614::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21018973-1a94-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 09:26:37 +0200 (CEST)
Received: from DU2PR04CA0320.eurprd04.prod.outlook.com (2603:10a6:10:2b5::25)
 by AS4PR08MB8021.eurprd08.prod.outlook.com (2603:10a6:20b:584::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Wed, 16 Apr
 2025 07:26:32 +0000
Received: from DB1PEPF000509F6.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::5c) by DU2PR04CA0320.outlook.office365.com
 (2603:10a6:10:2b5::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Wed,
 16 Apr 2025 07:26:32 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F6.mail.protection.outlook.com (10.167.242.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Wed, 16 Apr 2025 07:26:31 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 DB9PR08MB6444.eurprd08.prod.outlook.com (2603:10a6:10:23c::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.22; Wed, 16 Apr 2025 07:25:59 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 07:25:59 +0000
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
X-Inumbo-ID: 21018973-1a94-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VOLmA+OjJ0QerOtlULZHCvahBovzcdEfajl6La6e1ILml2RPQ6I5OgGvQ3TBKErFMQfkKuGgLTTXInemcG78dPzLelvG5hoLMcUdcmRs3vub0th86BSnWBtOnHoFvGBPaq2hWzTz7yLVd+bf+2XXmNnbDHUxeDTLQMMuF3QloVUsvo5GfT8NjxqvfMuWb5zH+ISV1De2ya009BVBmCFaUDDaVG09nm9ddMYH17A6tY4NtE3b47OxF++QkSbhB1YrnOIuDsBMvsLZbLA4FZL07gnwEACmTPxGL7/7watmwnsxgtRQX6Wi046F3tnPqaI51Y7x8gAWX8AQjluMKT3bUA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuI2wRuC1L4mvTSJZz/28Ip8Jy+iZsfcTR5uf1mCbIE=;
 b=dhuTqHVA2ifJCkoYLMH+Y9SPHQo4Q63qC/CK7hOt/Yh0zPA2SLxwrZYYZL8DIoMdYT+jbBS/U/ekr7PWsD/bx8lr8qUgX2n8rvM2e2jlueU8MG4zPRK32rVXBuqJliX0yuPPeCEaieVLe5WaQpCRvxTQU9Y9bmWx+mkxcQ25rGuDHN8RLqOEODtlcQEwkQZ5BKk0ec2WxITzrqweGfK2zQpsl4asg3G4wWX11zPBkRseUqvF66EhgaIGo4kv7jBGQwVpXdHH86Ugqk/HQt+b5wRHwkP1CfJTzDY4V/dfVBMSIhLB2kCXO6D2+1ugcehsgd9cMIRYsLrp/5cjiD9TkQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuI2wRuC1L4mvTSJZz/28Ip8Jy+iZsfcTR5uf1mCbIE=;
 b=M9TaSCS6YC9JKdCjVdikXK3Odz+8cbAmK9CfNww3a0QB+9Eg04oOlhkSnJqDNz1P0NWZBX+o8GhM8TJMgc5JQPH99P8ipzmQ3+NBxTZVUWYFHQkGRoRIOJXbe0/GOp6MqSIFlS47RdiE6azF40Gc2ICztte7rxsqgR/+Gn9H+Hs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmVlRMR6vaXD2A+JAPWNdlcO3eGTQi2toqUCOHmqCxGl+p/bzVpy3o7LK1U/jLVn7K/zlrDBsSjF47tkoaSijEBtskusLjDqF5vypoNjKGzYNEQO84HPXbfJ94ouORJ0f9jLtgQR3lwKnebnYd4IHyR2uoIZi2CLE+EY6InvZY7jCHUbklTIBxjGMIeTnIBfBetc5gjurHWSuu9/AVZDJvgEvHJrI/3srWNscHZlRsH/f/HDCbTSQXKT7/5o/udlA9vhMOJ8RAT0cdxxU6bPaGQpRlrVu57U66UxMRz6PY+YphibKeO720ec6KVhQ4d+yAZ7W3uTdsYXTBCgE1w7nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuI2wRuC1L4mvTSJZz/28Ip8Jy+iZsfcTR5uf1mCbIE=;
 b=sdqatJTkptIxDnYo6LTUOaK57fyfToArsd4sGX+ywgxDh0ZE1c+WNQnyqkvhiVqRhIocv3rXB00QHeuh87TXBRe4V0CLJod25xDgHCwFp1mzb3wt6wda3MnINm3WM98DddVrs3IS7fJItrG6EBwmyLfEeYxSh2Jsn9kZm5wrjumTo87XCd66JfF0beBkGwx62qnuCCwQOA1pkfYycHKl3JkBl/YkO9jF7+iSw3ZSd00HdUTOsDHpv1cx4sH1MP+VNMQhLInMDeYbHQCCQgjgpBDQeMjZlte2xIr7msKgoBhBxAbP0LvjjwtBGBmOvXlkIsAALaStsAbaTScy4WNJdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuI2wRuC1L4mvTSJZz/28Ip8Jy+iZsfcTR5uf1mCbIE=;
 b=M9TaSCS6YC9JKdCjVdikXK3Odz+8cbAmK9CfNww3a0QB+9Eg04oOlhkSnJqDNz1P0NWZBX+o8GhM8TJMgc5JQPH99P8ipzmQ3+NBxTZVUWYFHQkGRoRIOJXbe0/GOp6MqSIFlS47RdiE6azF40Gc2ICztte7rxsqgR/+Gn9H+Hs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 6/7] arm/mpu: Implement early_fdt_map support in MPU
 systems
Thread-Topic: [PATCH v3 6/7] arm/mpu: Implement early_fdt_map support in MPU
 systems
Thread-Index: AQHbqvINbdgv2Gjl9Uy6CHqPPhTkQbOjEuwAgALYpYA=
Date: Wed, 16 Apr 2025 07:25:59 +0000
Message-ID: <DA4D2124-A78B-4D5E-B7C1-8396F90DB92A@arm.com>
References: <20250411145655.140667-1-luca.fancellu@arm.com>
 <20250411145655.140667-7-luca.fancellu@arm.com>
 <4f95b625-3013-4750-a5c9-67d346ee8c3b@xen.org>
In-Reply-To: <4f95b625-3013-4750-a5c9-67d346ee8c3b@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|DB9PR08MB6444:EE_|DB1PEPF000509F6:EE_|AS4PR08MB8021:EE_
X-MS-Office365-Filtering-Correlation-Id: f2ea2a71-7960-4bd1-059c-08dd7cb802e0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?rTJHK98L9imM3m6f/0JrGb07Zfclyj3a4DIXxYlEGPBYHNWIVTz4jjBOLsTY?=
 =?us-ascii?Q?kD/UBQjndh7Wtmi+mZBp87rIcN5t4hzBObd3wOmatRQjk2ev0gECXbZ8LDSO?=
 =?us-ascii?Q?kZA5InSF9TqRJ78Ov1xG9kuypqVTsMWrRz74QJS4VhDz9gJnWIZ4vKf3bo9Y?=
 =?us-ascii?Q?Lu851VAqkoXyFYMiV+aT4xNWWqYjxruODhVpenZbmtc2ok5N8POAkFMXJ6Gw?=
 =?us-ascii?Q?TiSJPL3Y1syhlPj0dJc6npPdj+I80byFTD3Rq9mjDNh1IfeYXG1sRIfjCUqo?=
 =?us-ascii?Q?ISPTLBhRJefxi+rdmluBH2B+1kjdBWCbtMZgs19WUKVrt41UCWhaTYkVknvd?=
 =?us-ascii?Q?5pqv6C+Wws7axN+AXM1z2PK4UNurK1eNgEUqkgYtPLtMdTlzcwWEYVWu3sci?=
 =?us-ascii?Q?GDbSdOlwNNUjqIM1UoBx4CwOrtPXX57PZ3OZEd7+WiNcTXE5tHpLVv5aho50?=
 =?us-ascii?Q?90L+Q+txMpXEnIuzGA7kQv1oTSezzOsq1bs24kKGEIeOQSEtlrfmoAM81/rn?=
 =?us-ascii?Q?eh4lW7GEiqC6gEcZqJ04Q/IdwlOdcrGJZbdjcg+sj87AcE4148urFQXlDGmz?=
 =?us-ascii?Q?MEUhOjqe/CdToyWgyM/zcsqBM04v58m6+jmb0GfOS1tZbtjpQCulpp+yXd4h?=
 =?us-ascii?Q?f+VksvoQ4yCB0a7/pakJwX1jaLvVilH7GG4mUV6g6FDymGxItVQCJWqbP3WC?=
 =?us-ascii?Q?AFA4cXI56gaRGeMvYpOXX96RVF/bT/m2wpE8qvK3Y/eyTNHynj74hq5d6aaq?=
 =?us-ascii?Q?XhFJzNxcQXuegd6asNZ/UskuDrVJRESw4XPE12Is+VU0IOOriM3FXpRHn0Em?=
 =?us-ascii?Q?7HOn5xfHxBOz/wBhfzIvBj1LJX6+Jarq7NooG++cMDWSELNKC5zcDOKqmytq?=
 =?us-ascii?Q?qYPJSAImMbAUiO8MVuEq+EVGg8/RkRCjVnxQUCfG1xtLZo8DYhHFbnl3UH0Z?=
 =?us-ascii?Q?F8pwE04rwAtBe0jchQefgBXnPxaTaOqzsFI0ImFCQBd+UbOKPOo9p33UlKlm?=
 =?us-ascii?Q?HpWzRFk3Iff7scMsylNit1MyHdvv4uVazVj55BvsjkxU9VDQXS96dTXNNNG/?=
 =?us-ascii?Q?I5mKb2vdoJPkvqZhL8G0Ah7IP7siPeQkM3ZL0Ly/EHQ7vphJrmj1vKkYslKR?=
 =?us-ascii?Q?Y+4lEXeODzkmAPRcwzoorB9LRMgjclgsp324e/H1m1qeWf4ZKcVtYGQwaiwD?=
 =?us-ascii?Q?NltlN3yFPiIG9YJh6WDOb60V/rFE6CRPEnrS6dx4Ke1O4P46dr76o6uTLBEK?=
 =?us-ascii?Q?C7MSA9ycV6icz/LgAapYFvPXBTvD9nZzJJTD9CnaTORtxBW6JWyWl0mCrCNI?=
 =?us-ascii?Q?djVu0p4dQa3Pb24tj7oT8qnEvdULxTSnC8RyMr7GKPEuWo9L/YepZrJhtSat?=
 =?us-ascii?Q?xY3psjXMcZCFjnikTjfUFGdBPxaaQPO5i1aNyoi+O5emfTjTPjoYwQuvdse2?=
 =?us-ascii?Q?MriknAOI6LNnWh1eSLT0ldeuGY0VAM8zo/WhU1KDxx6RfeB/GP2rRQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9C8BC5E6ABDCC5458709E4106BD0EB14@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6444
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4a4cfa14-ea03-4034-9bc9-08dd7cb7ef98
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7sV9KMaYAfRBBBL5fOe4Gg993Gte6Ww7LtH91bUL4Cwt9H0hbDoAgzK1UA1E?=
 =?us-ascii?Q?zSUkRlJJ4R0EdxXZmLdKIM1EHiUsDAIZbHH7W3G0O+PWFN9oMxx0B0taD2pI?=
 =?us-ascii?Q?0PGAJoYj6aNa+3APbjhAMC9C29BW9W74mGZr+Y0MasRXTtLAC4UgNMvLKJmz?=
 =?us-ascii?Q?w/asKiyqmzuHOu5SAT93gpnZ1ZnuRhuqMPZy3XmAXsglrTypBrRjn1bMVPgw?=
 =?us-ascii?Q?J1MD4uOU/As8zz5AeWpZ0EkSVfj2sG6r4Cogtn2aehYwVbwUcvjaDn9zIWSY?=
 =?us-ascii?Q?9Garh77juJHnQdMt5ZUTLAWiFo8yLhN87dC/diQMh8b5nD0dyxun7hna861V?=
 =?us-ascii?Q?Tqhm6tY+1xHI+D/08ufnO+qSeDaXPzrjJTSp+uOVZg3HR33XohnvFN4yN4cA?=
 =?us-ascii?Q?ETaOCQxpnNH+5VEbbrtVDFIky1PmRLFloko+Y7A4vhJtHTGHo30JfdMw7yIL?=
 =?us-ascii?Q?EDqFkGgXwuq5rQVMBaOvdJdIGvUvtOHoDuTk5qb0kcvuxvZmOXlOjn76wlR/?=
 =?us-ascii?Q?X+fSyO6E/AKVB+B759jxW5Bs34vFA4dzQHIA9iBZj51T4zMxpUB3Z6NycoW3?=
 =?us-ascii?Q?WvM6jz1jfoh5SClXvBGxaEp/G5rW4fQkAfAd7uy3/4LOzO1D43XPEbUNzCBM?=
 =?us-ascii?Q?ah4UvsyFLvHrDo5OyRgDVz1StO04eR7pY7AMqisfspEumBboA6WbLSyrKR2x?=
 =?us-ascii?Q?Kdw0qrSpWU7kqztl8YCyq+IgmDsnw+lT7nuqokE3WiorxYX+5qpbkwNiXJa8?=
 =?us-ascii?Q?7fZciXQsjCQ+Mu8SasEgxIEJtt3t9kUpVbZwUu8spC32QNYVbhAdi6Sv3CSr?=
 =?us-ascii?Q?8wOd7OeFtJYaMrcgrAWP559hkBmXxXaqYDvH+wpk4ECYpoPISzAPOLC0/O5A?=
 =?us-ascii?Q?qa46clgFDo16iqBPbW8Epp0hr8rp1rPYlra9DnCUPIHyR2JOWc7o5nbcEEY+?=
 =?us-ascii?Q?hHMtExb2Wkzt/zJM19uDCD9vwtbNY5ePSOGu9kRxLnLXFgqLSj9vsQcFXDIw?=
 =?us-ascii?Q?QVnctnXAl4S31YjOeba0z3+liwfW57Oa+0O891cWMPUfDgw0hE4nfliGo4kC?=
 =?us-ascii?Q?9ABpgcuTDNES097oISufUzOIheNz7rIDE47hQDhchYiDTbSTAIgXbYy16nY+?=
 =?us-ascii?Q?swDFnbk82M5aJ8fH5yTLnGagEb2prmduHTZEuyVKH9zYfK9yxZNIauR+HXGY?=
 =?us-ascii?Q?KmLRuB7k0YXOhRF/U3ejWq6n1bthonELJZbLWD2WlOtgFLcULqGPCg/kY3xu?=
 =?us-ascii?Q?omZTqDMr2peoi6P8z9owXoEje5ZsXOeOifRtbt7tWD3Wd6UisvNt08m8+VHg?=
 =?us-ascii?Q?TvqNXoWF8d5KrhFS039EmZbpTBq408jbGtZJDUETE4+DX/K37L6CQ//aT9dT?=
 =?us-ascii?Q?3gZBGFw3wUWvueoQ216ThkOzC8/Z99UYM1HprNEQhVo39gVbxGqG0ZCCELJz?=
 =?us-ascii?Q?j0xPRGo3wJJ4VpUoaA+A4fcI7vdc90bnIxvu7wKlkw2bKLdpAiy86qq6o5XU?=
 =?us-ascii?Q?gJcHN7pjyk/uMk3w71Ajokp86I0X63YVKevI?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 07:26:31.9603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ea2a71-7960-4bd1-059c-08dd7cb802e0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8021

Hi Julien,

>=20
>> +
>>  void __init setup_pagetables(void) {}
>>    void * __init early_fdt_map(paddr_t fdt_paddr)
>>  {
>> -    BUG_ON("unimplemented");
>> -    return NULL;
>> +    /* Map at least a page containing the DTB address, exclusive range =
*/
>> +    paddr_t base_paddr =3D round_pgdown(fdt_paddr);
>=20
> NIT:  IIRC, the minimum for the MPU is 64-byte. So is there any reason we=
 are enforcing a bigger alignment?

So the original work starts from the assumption that we would like to reuse
some of the helper used for MMU, so everything is developed to work on
pages of 4kb, do you think it should change?

Cheers,
Luca


