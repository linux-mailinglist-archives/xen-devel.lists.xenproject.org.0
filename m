Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2D6C8F6FE
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 17:06:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174198.1499164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOeVZ-0003QZ-VZ; Thu, 27 Nov 2025 16:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174198.1499164; Thu, 27 Nov 2025 16:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOeVZ-0003Or-SO; Thu, 27 Nov 2025 16:06:13 +0000
Received: by outflank-mailman (input) for mailman id 1174198;
 Thu, 27 Nov 2025 16:06:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gQU=6D=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vOeVX-0003OQ-53
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 16:06:11 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id faddbdcd-cbaa-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 17:06:07 +0100 (CET)
Received: from DU6P191CA0023.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::17)
 by AS8PR08MB8109.eurprd08.prod.outlook.com (2603:10a6:20b:54b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 16:06:00 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:540:cafe::d) by DU6P191CA0023.outlook.office365.com
 (2603:10a6:10:540::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.14 via Frontend Transport; Thu,
 27 Nov 2025 16:05:57 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Thu, 27 Nov 2025 16:05:59 +0000
Received: from DBAPR08MB5590.eurprd08.prod.outlook.com (2603:10a6:10:1aa::17)
 by VI1PR08MB5325.eurprd08.prod.outlook.com (2603:10a6:803:13e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 16:05:24 +0000
Received: from DBAPR08MB5590.eurprd08.prod.outlook.com
 ([fe80::288a:2f8:39b8:a2f4]) by DBAPR08MB5590.eurprd08.prod.outlook.com
 ([fe80::288a:2f8:39b8:a2f4%3]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 16:05:24 +0000
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
X-Inumbo-ID: faddbdcd-cbaa-11f0-980a-7dc792cee155
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LWMFgpmicNvU08ORktcK9W21/pkWYPSvvU71p4mRiZAE0KnAC6N3C7tUYhSq2kW7T/9+KTQJy+Dt1NLT3x2vLiqr7v5eVvc9U0v2MDTqVmsARG6YK8uY6AXLNt3QPZ8FkTwUg7D6EfWierjVW8UutfQ54vppffxSmYlNO4zXXCxVjcI9Vv+iN+PEJuxVxIrkX2OAOyIs7uhXdINZUomOmN6m/fu2XpZjbW4FU6K3uLE8yy4Oj5SZGsLXjrlJFCn0xnsiHAn/l/sx0ZEEG+om4nDJfUYNHOSpeTGfZ3QwKkInmGgF/pCJxHmwOB414H96f3CoOAfATRVY/v0zNneHBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2ZuVNG0mRES/L4SKb92v1pwTUxvfEudGX8ifhsFe7A=;
 b=dKPnKpzhISbAI2f+jiA4TBrT4Qt8KHb3q6+wVD3bW554i5/9KiEEk9h1wp9gU2O5yagnbuo8EzF2dWiW0RbjTOdaqmIJ5nJ5J1Gz7lcls0Qwcpn8N+zMEmExZx7v+7iraUmmXnBualM6JB51QollerzOLIu6FVhO1m2VIzZrrTNIE5J9ZDeZwBXKiAqyp8yqMnvKtESMRvRJ/9uvKm4RjaGKbeDpOBHpJaVegSC8syB3NYs7pPu7rLC0vurj/3q8Z/nmPD5A7/Dk98hUERoMGPGfgzvjqjGLweiv6h3zGGpnO70W/OL4da+CUg70/tJO6Fg1M2UXbU0j+lrk7R8wpA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2ZuVNG0mRES/L4SKb92v1pwTUxvfEudGX8ifhsFe7A=;
 b=RZ05ChlZlsBa04DmmWS7xojiDT0tnBkBdEYeAtBnhRxk/jRFbKchd+K0Nv+fuGqZeNKhN/WdZDZ/pzMj4zjkPzJfDjA7Dt5dKdkZRrUxxK+ZyA9DFQbWIQDV2ZvEufZJlCV25Zmw5OUVK7RCROs0V698pUInEQWIgxZvQ4bwnXQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQnbtJw0C10RUUGg4uT13cpdDgJ4xPDZ8BLEU41LLb4xV77LSvYcpSirHwu3UZMqOPFWTr+AzVXcGSLGS1OohH5Sdakv6BpdfBt9T+zwcxuEzwa44sWNUI06nsx1pkGdxW7qL2E6wW7x1ml3ealdnw39MmmfMekHau9SkvgKOTnAYrWLpbS+Ow5NhzfrVpQGxIH7iNeupiov/Cu60sl1zpHKMbISbx5jtIFEVjTH0iIjkATremabPUq+EvEIFUuFIk52Pg7HPm5upHPoOQKT7Gw34d24CYvvAX7+nxAPjZC/yvSWzPbw9oUeH3ExjJERahzaAEiyA6JafilT2pVrkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2ZuVNG0mRES/L4SKb92v1pwTUxvfEudGX8ifhsFe7A=;
 b=dm3b2dlpPgApyXlCfTRQRnRqvAs5ePGFJgkzQ3/U+IywAUznu73kJ/FmIrBeSvVWvAgW1C6MCHPk0kMBYac4LoYAdKZS9/VH1fA3VNESeF7nSXWQcwyHUxIZg7hpZL3MZu184iSl0PTHxI6DKCC16LvPPLsbD4rRynAsqf9Wf5VSN1kkFjViNHzywcnOlD/Xk9o0Y/aYEJqW0nIEHVDyj9cP2Vg+XX/x+Mi/FehpxWrNX6X+v8wGRSE5W40lKCkcdM6D9pF5vqGkGXqb0nqXPxlXpoxRqhyIHTeYiH8EmcdBhFRyyHLOXOmFiuso/50y4FjAYrgwWtRSFQCO9Mt1LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2ZuVNG0mRES/L4SKb92v1pwTUxvfEudGX8ifhsFe7A=;
 b=RZ05ChlZlsBa04DmmWS7xojiDT0tnBkBdEYeAtBnhRxk/jRFbKchd+K0Nv+fuGqZeNKhN/WdZDZ/pzMj4zjkPzJfDjA7Dt5dKdkZRrUxxK+ZyA9DFQbWIQDV2ZvEufZJlCV25Zmw5OUVK7RCROs0V698pUInEQWIgxZvQ4bwnXQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>
Subject: Re: [PATCH 00/10] xen/arm: ffa: FF-A v1.2 support
Thread-Topic: [PATCH 00/10] xen/arm: ffa: FF-A v1.2 support
Thread-Index: AQHcX7XaOBZxRtacxUWP+aUgGBDI37UGrAcAgAADxIA=
Date: Thu, 27 Nov 2025 16:05:23 +0000
Message-ID: <2DA14F49-DC82-44E8-B265-265BD0439879@arm.com>
References: <cover.1764254975.git.bertrand.marquis@arm.com>
 <cover.1764241336.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1764241336.git.bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.200.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5590:EE_|VI1PR08MB5325:EE_|DB1PEPF000509E4:EE_|AS8PR08MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: 780e5fb1-785b-413d-b4c3-08de2dcedb2d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TzVSZE8xWGx6RTd3dnNPK0lPSWRRanFXaWxLVHNiOFhMUUs3MlVRTlplMDBj?=
 =?utf-8?B?U3FJZnVQNDQ1Qlo1eUdMMS96RDVZVzAwd1cxMnV6NnBVWVpVY005dXgyRjB5?=
 =?utf-8?B?cHVURjZyblR1MUl0eDN2aXV2NHlIZ295YTR4RjhWNWRSOU41aXlnekRFSVVW?=
 =?utf-8?B?ZkNvbG9DWHNMNnVWaHg5R0Vvc0tmcFc1V3lqbmp5dGRaTDJzTGRSU3psRWpL?=
 =?utf-8?B?ZFhIRGxmcnFMbGdvWFNDWTI2dVVIbzNOWnI3UktoVUJhb2E4WTdBWnZSaUN0?=
 =?utf-8?B?OW9zcTY2WE9ScWVXR0gwTTgxN3J6OGc4ejJ4eEg2cEVGcU1BOFRMRktCeVBU?=
 =?utf-8?B?Y0IyZ0N6VnZDVjlrenlYSUJvdVZzZHdSTSt5SlBkZXFHYkZ6ZzIySUtJNFNl?=
 =?utf-8?B?SENVRlM2cmpqU01wUkkwK2VUNGNKT0hiTkxqOFkvRFJRZXFTdzBHQXhMM1VV?=
 =?utf-8?B?T09wbHVEUlBwN2xrWUUxTWhsd2ZrZ0VTT1N2YnFQQTY5a1ZsYUo2RXVHNVB0?=
 =?utf-8?B?NlNhZ3lWU2orcXdFYTVIeHFkdTh4MlBZeC96RHNGTEhsTUFrTnFFbWFqSEtO?=
 =?utf-8?B?SDhDOUhYR1lWVTByNDNQRVlVQ3hlODd5RFlKbXZ5aXRzTUpMeTV4TUZaLzV5?=
 =?utf-8?B?Z1JIWHVsRW5BSWxVOHNVYmZsdE9MNmp4aTBSRERrdkZKd3F3MFJQV2lKbWdL?=
 =?utf-8?B?bE5rVndwNE9iZjRJelBYc2VzVGNMN3NFQmYzdy9VNENrZjFQRnpLanB6RjYw?=
 =?utf-8?B?N2lGT2hkektuam9EZWVlUjI3L1ZwL1IyVkZnVkgvVklGU3FodXhzN0dGbEVl?=
 =?utf-8?B?M3FKVTdzSGVSMURyVHI1NG1HOWRqQm5GV3hLSnplVlM5MTJFVVY0TzdHSlhx?=
 =?utf-8?B?ZHdrak51VUpGcXJ1aXFmbVVKL29UVVZnN216UklrQjdzUWtMSEdOaTkrK1Rk?=
 =?utf-8?B?NWxERnl0YTBSaU42amY2c29wdE9meENhazdxVE5IVDJiNEl6VFUxKzJuUTEr?=
 =?utf-8?B?VngyWWQvVDRFMDZFdG1PajdBNS84SWMwa3FLSEpmaTNWeTVRcC9ySGdmN1oy?=
 =?utf-8?B?bjFkWjg0c0FxOE1SVDM4VFF4QTFGZDEyZkpUeHp4UTFtMmZjTlZxY3pRL2ZH?=
 =?utf-8?B?SWc1WDBEeDVFSHBuZ1d0QVFSV3cvdUVTQVZsMmRHaERXM3BZeVZhWmV3cW1m?=
 =?utf-8?B?Z0FTdS8wYXhGTVVOWklJcWVrSUVUMkZLUkx5blY0NGJrNjRPaE1yS1BxTkZS?=
 =?utf-8?B?N2F5VTc3Z1NhcnU5ZU9BQlRZNDlJU3pTS2xMZjYrclhsdVJpVC9PWFRDNlJ0?=
 =?utf-8?B?VEVjaHprMHh6ZVN3aEpURk5ZaWdVRTkrL05MWEZmUytkUnB4eEtZakdPRmsz?=
 =?utf-8?B?NWFOR0Z2OVBjRkY4MWdGL0hqTExyeUpsa2t1cEtJTU4rb2dYYnVGb0V4cVJM?=
 =?utf-8?B?T29SdWdXK3ZWUGZJelJSZkczbEI0TzFhOHFnS2pQR1U2MDJydW0vb2ZtS1Bz?=
 =?utf-8?B?TytISnRLbVB2VVljUzlJN0swemtaVFIrZHY4MjRUTnlpSkU3TVQzS0tiSU5P?=
 =?utf-8?B?dTlObC9UZHR0d3NwZCtsRHhRWWl5aTA2cXk2ZUZRQ1piSVR5V3F1Tm1DR1px?=
 =?utf-8?B?T2JxMUZlZ29IL0ZZZWdUd2x2YkJkQ0lqdjRheVdsQ1FGY2c2ZGNJY291Y0hV?=
 =?utf-8?B?TlR1Vnh0WGFjTURTNjhVV1B0U1dxbGpyVjIrUVppdGJVd2s3cjl1YkN4QUdq?=
 =?utf-8?B?U3hvUWJjT3QvU0xhb1RyMnFORW1GTTFKT2w3d0gyenlER1VZSnRTbmRndmor?=
 =?utf-8?B?OHV6V2xOMFZFVkM3d2JleVVsVkEwMzhHUldvcGhWOEVONGNBMUZldEhsZzhE?=
 =?utf-8?B?QXgyZHBDeDdFaTRjVW9jS0gwN0NFQnd1b2ZoL0RLa1JlcGZBbHozSllFMFVH?=
 =?utf-8?B?ZTZheWYzWURJeDU2cERuRGdSaWdiVWYycytyV3BJQ1VuanR3aWtJQXZWYk9m?=
 =?utf-8?B?RW9HV1hsYUZzV0NmNk1TYlZyb2JvMkhCa250WkpVTEs0dWdxYTY5SXF3YXFi?=
 =?utf-8?Q?hsZwsv?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5590.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5EBED686A150FE4385634B593C3D897A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5325
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	87cbc026-3e67-40d9-52b0-08de2dcec5e5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|36860700013|82310400026|35042699022|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z3BXZldXMERHSS9nVEVCempXdnRtd2ZMOFNkWlBoeTcyaitMbVh1bEQ2WDBj?=
 =?utf-8?B?eEtjd1lQeXFKQjExb2hOK2xxQ3g1S0t3K3dtMlZpSmppVU9ieE1pNlVTWTVE?=
 =?utf-8?B?Z3dMaXFuUTgvT0Npc0tqdlZSd29MdGlsK1A2ZzdpNS9uUkd6bGlTQTJBa3Zm?=
 =?utf-8?B?Qzh4cmdWTnNETmJSL0FBKy8vZ3VVN205N1lJYTVDR1QyY2xpaGJPVThnMGZn?=
 =?utf-8?B?VkM1YzdNTFViUG82bzY5N1Q0aFV4YUR1Z2hnMkgwZHh3ZHpoWnJHRnd4Mk0v?=
 =?utf-8?B?UG55dXpjVG12YlFuNVA1SjlacEYrazdYZGlwREhaZjhPV3pyWVp5ZzJETTQv?=
 =?utf-8?B?Z3dEaGJqTUZOVG5yZFZiRDlBNC9qdlVmdEh0cXlkbW9mc2ZPcXpJSVBDU2V4?=
 =?utf-8?B?Ri9FR3RnN0ovSzVZK2M2c0hmZ01KaTFqWW9tcTU2TmtWM3g4c1BCTnc1ckRB?=
 =?utf-8?B?OW80ckp1clZjVmt5UzdrSVFiVXlJZ241c0ZyeVJVYTdZY2JwaEpReHU3WVg1?=
 =?utf-8?B?d3VjTmVJWlBnUWRZUXp2eVdKTHVIbHpmdTJwQ2toeUpSdCtkZzFoR2VDQ3hP?=
 =?utf-8?B?N1gwdFdmc2tEQnJVUWdNYW9vV0dUeU1heGh4QSt3SmhNSWF2TFNUbGMyc0Rt?=
 =?utf-8?B?alprK2FORTVqQ2c4L3lKQmtsZWd4NUZNRVZyRUNMM2g2OEVkK0FhcE5HbDZP?=
 =?utf-8?B?Q3cySG1zMEZXVUd6akROdVo1VlhNK3RDSGZvMUJiS29HMndvcDczdk42MEpF?=
 =?utf-8?B?OXVIN2tJYjV4QXJ3MUFOSFNEZHJoTHBxWldmZ0UxaFp0QTkzL3oyU1lrbER2?=
 =?utf-8?B?dldsTU1adEppK2F5Z3ZrWjQyeVJtNitlTzVyaTQwZjNjdWhoY2VuUlRtSldG?=
 =?utf-8?B?bW9DWkZXZHZwYnZCNzZkTStNTlVOdlcrMHdKRHRJMFd3QjljWEpXcVE5WlFT?=
 =?utf-8?B?ajVpWk44YW84bUZNUUdyZWgzaklRMmdzWXI2NmVFd3hCTUJBQXAzck9BMzJQ?=
 =?utf-8?B?MU1TajZuN1RwZHRnUDA1cFNaejlVRW10amxHQ0hGMm1SNmlyc2V0ZytLYWdv?=
 =?utf-8?B?cUdRbWhwT0c3dUxEK2RMcUg2cnZHKzIyVHFOUjRZMGZTalJVY2NSUmJweW5P?=
 =?utf-8?B?RnNvdENaTkxQU3U4Mlg2Q3dhRDR0dUw1bTNpeGhXaFRLTUtTVzJPcDluWDFF?=
 =?utf-8?B?ZFZ0MHpjM0ttem55V2VFdUxIdldBK2NnSG9xWW8rTzkrWXpsYnFNWlhiSHhu?=
 =?utf-8?B?cys3QmZmcVoyRjlGWXZUZC9QOFhPSUlxMHRjYkxuUkNCQ0ZlbGJnRUhham9G?=
 =?utf-8?B?SjNNeDdJOStINnNQbTkwT0kyQVpzd0NzYzJxMnREUGFZb3RZOEpMTXNkYW0r?=
 =?utf-8?B?eFJNUzQ5bmFWN2ljWFFSVEg3ejVRR2tLTXp1bXhxYXkvcm1JZWk2dWM3d1Ju?=
 =?utf-8?B?MkhMSnFMRGZNNG9TbHNreWlLd2REMDBhK004VlY4MmVyVkRsbjQ5WGU0enow?=
 =?utf-8?B?aFJRUVVnMTdVVjFhTjVVSHVTakYwK0ZROStzMGRXMnlSdkk3dWRoWXJnQjJ4?=
 =?utf-8?B?SnVJUG1iK3R1dW5tTHVGQWcxZUttNE9hK3F3M09pcHd2MXBvWUF2TXVjRm1X?=
 =?utf-8?B?cXE3L05Nb3ptSTNJUEVCWFdaTEUyK2hjcDVRdTFmMjR2bVM4NklXV0VxZk84?=
 =?utf-8?B?ZFRIT0xqeUJTU2ZGVmhVUitNN3diWk1wYlFNTU01SkZaRzJyVUNYc3ViNVo1?=
 =?utf-8?B?TlZpZm91NUN3R3RJMEdOcnpEM01lWEd0eDZ4M2hZekUxamE1TEhkOGFRWXps?=
 =?utf-8?B?K0VYRUxNTC9ocGF6ZDVtVENOUzhjMEpjWjdhaUNUQ1NibzhubEg2bG9LRkxq?=
 =?utf-8?B?Vzh0c0NRZlBLckJxSE4xSC9uZWNQaHRHMVpqQndMcDZkNjFiaWFOVDRPRjhN?=
 =?utf-8?B?YmlqclZvWnR6TmI1MEJDa2dUQnp5QWtCVHQ1amtVdHl0T1RwbGlGZjkxNXhm?=
 =?utf-8?B?UmlTWFkwbWoyOVEyQmNzSUgwMHBEYWt2WFlHNmJ3alZibkJKc3phL05yNldk?=
 =?utf-8?B?UDBCdFZkS2pSZWVpSk5MTjNwMHJQMkYrd3lkdk8yZEhaVnJjWDF2ZmM0WkNF?=
 =?utf-8?Q?khvs=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(36860700013)(82310400026)(35042699022)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 16:05:59.6330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 780e5fb1-785b-413d-b4c3-08de2dcedb2d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8109

SGksDQoNClBsZWFzZSBpZ25vcmUgdGhpcyBtYWlsLCBjb3ZlciBsZXR0ZXIgd2FzIHNlbnQgaW4g
ZHVwbGljYXRlIHdpdGgNCm15IHNlcmllIGFuZCB0aGlzIG9uZSBpcyBhbiBvbGQgdmVyc2lvbiBt
aXNzaW5nIHRoZSBwaXBlbGluZSBsaW5rLg0KDQpSZXN0IG9mIHRoZSBzZXJpZSBpcyBvay4NCg0K
U29ycnkgZm9yIHRoYXQuDQoNCkJlcnRyYW5kDQoNCj4gT24gMjcgTm92IDIwMjUsIGF0IDE2OjUx
LCBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPiAN
Cj4gVGhpcyBzZXJpZXMgdXBkYXRlcyBYZW7igJlzIEZGLUEgbWVkaWF0b3Igb24gQXJtIHRvIGlt
cGxlbWVudCB0aGUgRkYtQQ0KPiB2MS4yIGludGVyZmFjZSB3aGlsZSBrZWVwaW5nIGV4aXN0aW5n
IHYxLjAvdjEuMSBndWVzdHMgd29ya2luZy4NCj4gDQo+IFBhdGNoZXMgMeKAkzUgcmV3b3JrIHRo
ZSBsb3ctbGV2ZWwgcGx1bWJpbmc6DQo+IA0KPiAgMSkgYWRkIHRoZSBGRi1BIHYxLjIgZnVuY3Rp
b24gSURzIGFuZCBwcm9iZSB0aGUgbmV3IEFCSXMNCj4gIDIpIHRyYWNrIHBlci1WTSBGRkFfVkVS
U0lPTiBzdGF0ZSBhbmQgZW5mb3JjZSBuZWdvdGlhdGlvbg0KPiAgMykgaGFyZGVuIFJYL1RYIG1h
cHBpbmcgYW5kIHZhbGlkYXRpb24NCj4gIDQpIHJld29yayBTUE1DIFJYL1RYIGJ1ZmZlciBtYW5h
Z2VtZW50IHNvIGFjY2VzcyBpcyBzZXJpYWxpemVkIGFuZA0KPiAgICAgUlggYnVmZmVycyBhcmUg
YWx3YXlzIHJlbGVhc2VkIGJhY2sgdG8gdGhlIFNQTUMNCj4gIDUpIHN3aXRjaCB0aGUgbWVkaWF0
b3IgdG8gc3BlYy1jb21wbGlhbnQgc2lnbmVkIDMyLWJpdCBzdGF0dXMgY29kZXMNCj4gDQo+IFBh
dGNoZXMgNuKAkzkgdXBkYXRlIHRoZSBkYXRhIHN0cnVjdHVyZXMgYW5kIGRpcmVjdC1jYWxsIHBh
dGhzOg0KPiANCj4gIDYpIGFkZCBmZmFfdXVpZCBoZWxwZXJzIGFuZCByZXdvcmsgcGFydGl0aW9u
LWluZm8gaGFuZGxpbmcNCj4gIDcpIHJlZmFjdG9yIGRpcmVjdCByZXF1ZXN0cyB2aWEgYSBjb21t
b24gUlVOL2RpcmVjdCBjb21wbGV0aW9uIGhlbHBlcg0KPiAgOCkgYWRkIHRoZSB2MS4xL3YxLjIg
U0VORDIgaGVhZGVyIGxheW91dA0KPiAgOSkgYWRkIE1TR19TRU5EX0RJUkVDVF9SRVEyL1JFU1Ay
IHN1cHBvcnQgYW5kIG1hcnNoYWwgdGhlIGV4dGVuZGVkDQo+ICAgICByZWdpc3RlciBzZXQgZm9y
IHYxLjIgZ3Vlc3RzDQo+IA0KPiBQYXRjaCAxMCB0aWdodGVucyB0aGUgZGlzcGF0Y2hlciBhbmQg
YWR2ZXJ0aXNlcyBGRi1BIHYxLjIgb25seSB0byBndWVzdHMNCj4gdGhhdCBuZWdvdGlhdGVkIHYx
LjI6DQo+IA0KPiAgLSByZWplY3QgU01DQ0M2NCBjYWxscyBmcm9tIEFBcmNoMzIgZ3Vlc3RzDQo+
ICAtIGV4cG9zZSB0aGUgbmV3IEZJRHMgYW5kIFJYL1RYIGNhcGFjaXR5IGZpZWxkcw0KPiAgLSBi
dW1wIFhlbidzIEZGLUEgdmVyc2lvbiB0byAxLjIgb25jZSB0aGUgaW1wbGVtZW50YXRpb24gaXMg
Y29tcGxldGUNCj4gDQo+IHYxLjAvdjEuMSBndWVzdHMgY29udGludWUgdG8gdXNlIHRoZSB2MS4x
IEFCSSB3aXRob3V0IGJlaGF2aW91ciBjaGFuZ2VzLA0KPiB3aGlsZSB2MS4yIGd1ZXN0cyBjYW4g
bmVnb3RpYXRlIHRoZSB3aWRlciBBQkkgYW5kIHVzZSBSVU4sIFNFTkQyLCBhbmQNCj4gRElSRUNU
X1JFUTIvUkVTUDIgd2l0aCB0aGUgZXh0ZW5kZWQgcmVnaXN0ZXIgc2V0Lg0KPiANCj4gVGhpcyBz
ZXJpZSB3YXMgdmFsaWRhdGVkIHRocm91Z2ggZ2l0bGFiLWNpIGhlcmU6DQo+IGh0dHBzOi8vZ2l0
bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvYm1hcnF1aXMveGVuLWZmYS1yZXNlYXJjaC8tL3Ry
ZWUvZmZhLXYxLjIvdjA/cmVmX3R5cGU9aGVhZHMNCj4gDQo+IEJlcnRyYW5kIE1hcnF1aXMgKDEw
KToNCj4gIHhlbi9hcm06IGZmYTogYWRkIEZGLUEgdjEuMiBmdW5jdGlvbiBJRHMNCj4gIHhlbi9h
cm06IGZmYTogcGVyLVZNIEZGQV9WRVJTSU9OIG5lZ290aWF0aW9uIHN0YXRlDQo+ICB4ZW4vYXJt
OiBmZmE6IGhhcmRlbiBSWC9UWCBtYXBwaW5nDQo+ICB4ZW4vYXJtOiBmZmE6IHJld29yayBTUE1D
IFJYL1RYIGJ1ZmZlciBtYW5hZ2VtZW50DQo+ICB4ZW4vYXJtOiBmZmE6IHVzZSBzaWduZWQgMzIt
Yml0IHN0YXR1cyBjb2Rlcw0KPiAgeGVuL2FybTogZmZhOiBhZGQgVVVJRCBoZWxwZXJzIGZvciBw
YXJ0aXRpb24gaW5mbw0KPiAgeGVuL2FybTogZmZhOiByZWZhY3RvciBkaXJlY3QgcmVxdWVzdHMg
dmlhIFJVTiBoZWxwZXINCj4gIHhlbi9hcm06IGZmYTogYWRkIHYxLjIgU0VORDIgaGVhZGVyIGxh
eW91dA0KPiAgeGVuL2FybTogZmZhOiBhZGQgTVNHX1NFTkRfRElSRUNUX1JFUTIgc3VwcG9ydA0K
PiAgeGVuL2FybTogZmZhOiBhZHZlcnRpc2UgRkYtQSB2MS4yDQo+IA0KPiB4ZW4vYXJjaC9hcm0v
aW5jbHVkZS9hc20vdGVlL2ZmYS5oIHwgICAyICstDQo+IHhlbi9hcmNoL2FybS90ZWUvZmZhLmMg
ICAgICAgICAgICAgfCAyMDUgKysrKysrKysrKysrKysrKystLS0tLS0tDQo+IHhlbi9hcmNoL2Fy
bS90ZWUvZmZhX21zZy5jICAgICAgICAgfCAyMDMgKysrKysrKysrKysrKysrKysrLS0tLS0NCj4g
eGVuL2FyY2gvYXJtL3RlZS9mZmFfbm90aWYuYyAgICAgICB8ICAgNiArLQ0KPiB4ZW4vYXJjaC9h
cm0vdGVlL2ZmYV9wYXJ0aW5mby5jICAgIHwgMjQ4ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tDQo+IHhlbi9hcmNoL2FybS90ZWUvZmZhX3ByaXZhdGUuaCAgICAgfCAxMjkgKysrKysrKysr
Ky0tLS0tDQo+IHhlbi9hcmNoL2FybS90ZWUvZmZhX3J4dHguYyAgICAgICAgfCAxNjAgKysrKysr
KysrKysrKysrLS0tLQ0KPiB4ZW4vYXJjaC9hcm0vdGVlL2ZmYV9zaG0uYyAgICAgICAgIHwgIDMw
ICsrLS0NCj4gOCBmaWxlcyBjaGFuZ2VkLCA2OTcgaW5zZXJ0aW9ucygrKSwgMjg2IGRlbGV0aW9u
cygtKQ0KPiANCj4gLS0gDQo+IDIuNTEuMg0KPiANCj4gDQoNCg==

