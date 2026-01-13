Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB08D1865E
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 12:15:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201474.1517101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfcMn-0000Mq-F2; Tue, 13 Jan 2026 11:15:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201474.1517101; Tue, 13 Jan 2026 11:15:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfcMn-0000Kv-CI; Tue, 13 Jan 2026 11:15:17 +0000
Received: by outflank-mailman (input) for mailman id 1201474;
 Tue, 13 Jan 2026 11:15:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W4/3=7S=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1vfcMl-0000Kp-SZ
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 11:15:16 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1de7170d-f071-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 12:15:07 +0100 (CET)
Received: from DB3PR08CA0010.eurprd08.prod.outlook.com (2603:10a6:8::23) by
 DU0PR08MB7691.eurprd08.prod.outlook.com (2603:10a6:10:3a5::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.2; Tue, 13 Jan 2026 11:15:03 +0000
Received: from DU6PEPF00009527.eurprd02.prod.outlook.com
 (2603:10a6:8:0:cafe::ed) by DB3PR08CA0010.outlook.office365.com
 (2603:10a6:8::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 11:14:57 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009527.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1 via
 Frontend Transport; Tue, 13 Jan 2026 11:15:03 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AM8PR08MB5698.eurprd08.prod.outlook.com (2603:10a6:20b:1c6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 11:13:59 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 11:13:59 +0000
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
X-Inumbo-ID: 1de7170d-f071-11f0-b15e-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=arwg0xz2NrZW1PCaZ3BiYEYDS8PlfavOOgCr5tTS4pyeLgkdIt1KPNQ5UVFkZ1eeAmV8gR5w/UyZSe9xyvqQzd9uzs0epKXZ8CgkZO2UXbYaLDwtNdmhsEECJLYnb58mgnDqooguXtNm81ZSvuRYWidZAHUq+hXkuVdRGUIJ/SGNfqPs9YL6ZZ+53Ri20qto37YePWRlWQgooVB8R144RPlLmxhNax/x5gNUZGCybCG9Y3W4xKjGYg5O+5n2ihAcT8ctoXJQWbi/jg3KdVCG+VKSbTDSKGaGg5aVhXMUV9NUnNnEo0NBmZhNm63HZav+aGF0IiEb8o9PLvqsLfYU7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPWre7sAnBTZifT2hNwGgG9mgoLyl51TBLLYiiBMSV0=;
 b=zMkATIw1TAF5py8loXQ/AGhl7Tce1XSPowWWcdpPpbxmSZiZv2cSSx5AZZY4AKeNitAXWr4PosPRvXnHsSAaLei30Hmo16U7x+PBJCbu7sTUVwsDlHvzIxJOS8gSmb1gG1XFS3mR73bufIi72sstD6V0VSV+qF+EQff8zOtIiLlEgLTp1fjzzRCz0odmgerBgMZMdUaxgwjNXCpbA8vfHrfr2qq4d/MUstEQroOn2DfWnzLflgN0irWaZrRI2nD8baMbw8Uw0eOez8EP5AEe4tyElw3a2OIFaIu655HOMbOQ9UdjSIRkQ/XT8RqgP1KpP1kaDZALEyqmliQC9x9q0A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPWre7sAnBTZifT2hNwGgG9mgoLyl51TBLLYiiBMSV0=;
 b=LhlrwdEI7mYHlmcpSVkJHgNp5rbvcx28z1AuvjgTA73no24zWHiVIyC1kulDoOQk8W+n/3twcssY4QzujbqzKjFmVttp8M5iYAqpqTUteDmm7C1Zv0eF48ZWSPvL2FFuGDmrCmkp9QQdvtkUAnOVG2XdEOVcaSVifUXdfYPICas=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPTfgCUCk4N0QZy8KhEAwPYE0nKwsevlt/bWmfjRmKlC3+nWKuMqwPMFlEcqQyZAi0RPzUZX8/lWgBTuBjqhLG9oHGsDC7KF0QRA9wP3hekR8s7p7InxA2Es1FCdGh7CqY+Y7hPE0CKsFmbWiWfVjDrqUwzNgcwsZ/uNXWIRmQp4oGYm9Asau4jGNQw3ncAhk9ktQAYd5jMGr7o4OwNAtWGlYN6tRJxPkupqHhofrlspa0uEeFzL4tYVy45uAbUrx+qz/A2T1vxUfawq8J/bU/pGfzXB4eOYJ0lfzJgxFjbCSZrZAqi2ifESVxqQbGuv68KVvPurq9ug2XtFiujJrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPWre7sAnBTZifT2hNwGgG9mgoLyl51TBLLYiiBMSV0=;
 b=GKCxTZj3cHIM3nRs21IAaL9HRI9D9Tt75SnhBXAjjOeh39fhSZYC9vknOHylAcBJmipv8j7fLvOcb9ZGVwywWRnyvW6osN2MT4xDUEi9A04gtzlBqXw6GpaZfYqptWSlEekhqqiZF9/B8vtDJzQ3Wxlu964S5P7OWJ1PA6icT5Cfo+Ht+53dSQcdpyGgVO/OCeWJ7dFH9wCtFi3zZnRT2L1m2lCxrTjN7CIoyN7knnlbOrkIKgzZalMthTK/055qmt6PZHZ8NDFLQJQAtxTpGCeLBVo9szMAG+bUlBfEodw7O+Hsd3RuDEVN87bEO48UeFKfvkSeEOoPkWwE/WNIPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPWre7sAnBTZifT2hNwGgG9mgoLyl51TBLLYiiBMSV0=;
 b=LhlrwdEI7mYHlmcpSVkJHgNp5rbvcx28z1AuvjgTA73no24zWHiVIyC1kulDoOQk8W+n/3twcssY4QzujbqzKjFmVttp8M5iYAqpqTUteDmm7C1Zv0eF48ZWSPvL2FFuGDmrCmkp9QQdvtkUAnOVG2XdEOVcaSVifUXdfYPICas=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: Harry Ramsey <Harry.Ramsey@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Penny Zheng <Penny.Zheng@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>, Hari Limaye
	<Hari.Limaye@arm.com>
Subject: Re: [PATCH v2 3/6] arm/mpu: Implement free_init_memory for MPU
 systems
Thread-Topic: [PATCH v2 3/6] arm/mpu: Implement free_init_memory for MPU
 systems
Thread-Index: AQHchHaKLhHT1ERV8EebnAsLklGjCrVP8l2A
Date: Tue, 13 Jan 2026 11:13:59 +0000
Message-ID: <BFDE011F-FFA8-411E-9459-595CA5C470F1@arm.com>
References: <20260105113503.2674777-1-harry.ramsey@arm.com>
 <20260105113503.2674777-4-harry.ramsey@arm.com>
 <d6fc338b-60ee-4d30-a69b-9da90059bbd5@amd.com>
In-Reply-To: <d6fc338b-60ee-4d30-a69b-9da90059bbd5@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AM8PR08MB5698:EE_|DU6PEPF00009527:EE_|DU0PR08MB7691:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ac5382c-fcca-42ce-9bcc-08de5294ffb0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?SUZUTkN1aVdrQ3g1NC9VK1VzY2J1T1JRZ0FqWEp4a3orVDFCRGd0TE5TMDJX?=
 =?utf-8?B?OE9EZHc4d0xieUp6Slc3VllHMUsrVStvMWhyTzArRGdZcWN4eDkyb3JxK3BX?=
 =?utf-8?B?dEdDazAvQURuQlFCN0NTK21NREgvd2JWR1Zqa1FCN1lFWmsrVTFkMnphbUFm?=
 =?utf-8?B?T1Bhc3R6RlRWbGpqNWFWOWdzQzZUUUFEVm12bzBZdExwbng0WkxTQ2NoWm53?=
 =?utf-8?B?WnBjdko4UWlSL3JFUW91dWd1OWJRVVlISTNVTjdhNElXNlhIMXEzeG1pZjJP?=
 =?utf-8?B?U2VSU3pZNWUrWmZySWhJVmZmck9XUVJmMTBIdkJTWFRWMjFKMGRZSHdRWXl3?=
 =?utf-8?B?Vkc2YSt6bkhrb1BoaFJYNnhXQVdjMkRucXNwVWpGOWc3encreUF0UGx3VVUv?=
 =?utf-8?B?MWZIQUg1SDVDN3hhYW92OHcrd1E4TXdFRE80aVp1Q0NDUnY1RDdRSEdQN3Qr?=
 =?utf-8?B?MUd2Ujl5OEZ5MXk1bDh3SnRYNDROampNNC8rKzFzWGxUK0ZLVjg3dGJNQnNJ?=
 =?utf-8?B?RVkycGhZd0N3a3VGY2RCT0l6UnFrT2hKNHhwUURUUTdrMUU2Qmh2cC8zak1K?=
 =?utf-8?B?b3ZJenFmMXBYb2VieTlXT21KRnoyVTVmNVlOakZJcHhsTnlWTHB3YklkT2F3?=
 =?utf-8?B?ZzFRbzZtL2RkZmxmelhJWU9hSTFZcU1meFhaa1N2NENFRURxYzhYR2dBazQz?=
 =?utf-8?B?UGwzWWptNnAxdkVyTHVmWE5GRXg4Zm1NRDk5RzdLQjIycnNsZHAwNDBHOEx3?=
 =?utf-8?B?UTdCU2J3c0tJNjFvSFg4enhRc1hCSzNoTTkreDJSTUkzWkJQeTl0NDg5RmI3?=
 =?utf-8?B?cGZ0QkszM0NUb3k5RWlJdCtwbzREMHF3ZElYbHhVL2dPREtyajA0U29DOHcw?=
 =?utf-8?B?QjdVNU1WeCsvZXo3OHp4L0NmbjlJSzJYd1BGSXBlT0p4SUF4NWJjYVFmWU12?=
 =?utf-8?B?OHNGZWNBZXM4RTJ2NTRPdmVFNC8rR0pxY3BKZnFHOGx3WnBMdjNteEJzT0k1?=
 =?utf-8?B?NHVVTisraEc1YkZ0WXBQaHhpUWc3L1V5NWpTRzdVeTFCRnpqSkpRMXd0SW16?=
 =?utf-8?B?VjJOU3ljOUlxb2hvRnJCK1lFWlpxd3E0WTRXVkRRWjhmeFVVL1hkZ1QyaFVR?=
 =?utf-8?B?UlYxanlMWVRiRTgrVXFBOXdZN1g5WEk5eUdFbUNkenZHbGlrRm5YKzFsRWpG?=
 =?utf-8?B?R0Fud253dnU1Uyt4ZXdvQWs1Z28vSXhxYU5hNHk2N3RUNmRSZnZkbFVDckh0?=
 =?utf-8?B?VWRFcW1vOTZ0N3l2Sy9HODNvRHdtclFvR21GdzFCaFdobERiS3ZMby9PZmRv?=
 =?utf-8?B?U0hvRFltNGRwaFRHeWxwTkp5UnRpcktNMFcwWGlXYXNmVittRk9aa0hJRHV3?=
 =?utf-8?B?SzJuQzNNT1c5czU0MUtUZWU0em1VTm1ibytlcFNIV2xDU3BOZWNTRnc2RUJJ?=
 =?utf-8?B?Q3paYmp6dmFDSUY5elRaSHZ2WUZ6SUVPQW5DcUdDMHVtSmZtUWRGNzhoZUQz?=
 =?utf-8?B?V01HNHJrVUZTS0lrc0tGK3F2M2QweDhHZnlwbENaREtvN28reW1UbEVkVTQx?=
 =?utf-8?B?WTFKQWhCaEZhQzNmQk50cTJVdVIyRVk2MCswUFdtYlcxSHdRaFF0OWoyZHAr?=
 =?utf-8?B?ZWZieE1vZlVMdUNXNVA4MkI1MlUxVThWQTlvekVmNGJXam13M0c5dHZVSEZj?=
 =?utf-8?B?eWdxY2k2R0VJTTNDci9oU1c0UXM5Q255ci9PZ3gvTy9mOStLVFlFdVA5TWZO?=
 =?utf-8?B?RFMwSk5IMU5jQjVyeGlyZEtUaXVFZG01MndtRElsc3llcWNBMWFHY0JrMngr?=
 =?utf-8?B?b0JBTHZUeEN3ZC96WHJyeXpsWlFqMzU5N2hyV0RmRXZhclNmSDg5ZU5maEtS?=
 =?utf-8?B?dWtHYzRzWVpGSC9aZVRBaGFZbUJJTXVlY2lrYzEyT05NeWNtYkpkNWZTN2VQ?=
 =?utf-8?B?NnZYcXVRRlNHNmdzQkcrNlRSVEp1WkM2NXk5Nm5PekV2S09BVVhHejNhaWF6?=
 =?utf-8?B?dHBKTitySnVGOWl0Q0Q1ekxMUTB2VDFrdDgvVkRZRFMyU1VpeSs4N04wbFMy?=
 =?utf-8?Q?JEAUYI?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFA481678B2AE14C83362192382E2708@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5698
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	393f8ac3-117a-4de4-71e7-08de5294d9e6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|35042699022|376014|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SllGWkZRanZLVXFXOXFnMStBaFFMN2YxcnlwL2ZpYkRCaEsraEo4Y3hoNUph?=
 =?utf-8?B?ZXladVZpa01HYm04QytyS1hPWWVtRUhIMXBuUUxBQmwxOFZIbUxlZFI3a0F1?=
 =?utf-8?B?M1FFbjhUOG9wZmZ6ZzJ1Zm0rY2IvQWdnU0htUEpZTXc0YkZ3NDlmWnh1Y24z?=
 =?utf-8?B?RnQ4WGZydXpnY2R2T1ArSTJNZXdxWUlIYjZGdFZLZUxuaVc3ayszUm9xYUJ0?=
 =?utf-8?B?Q3YwRmI4K05vWTdMeC9sSE52L084VjJDUktOZTNYR3dhWWxSamhxZGZkSXBl?=
 =?utf-8?B?YnBvdzZwamxzUkFsN0xhdG1ObDBTN2tTd0RLUFVTM1B6Q2drbmNwRkJWR3dC?=
 =?utf-8?B?eEhYblMvaGl2R3FhK3NSbTNzaStqVURreEp3enNzME50eDhhUWNGR00zTG9I?=
 =?utf-8?B?QmJsRFZpODR5Y3M2UjVFNXh6NnA5YXlUK3hiYUo1dDBFY1BpY2RBMmF2UnV2?=
 =?utf-8?B?QlBacHk3aXc3UW9FTlorTzZPUUQraCtqMm1Td0pqTEs2Ui9uUC9KVk5Eaytx?=
 =?utf-8?B?dWhzbXJNZmtRZ3FVaE5wWEtLYk1GSmd0RVNrMG5zdXVSdGRDVnRtS3B4RjFN?=
 =?utf-8?B?YWN2WUFSaTU5OGJXKzNYK20vZFh1SUtTV0ZpdG9LdVpTS2xrcFBrTjZ0UjJt?=
 =?utf-8?B?UVk1Q3E2ci9sclFQcnRHN2w5SjAwWUNiS0FnQWJjSnRJWC9CQUNTQjJMZC82?=
 =?utf-8?B?V0U3Z0MvVGI3UEMydmplTXh4RDcrVkhET0x1QlFaVWxFcnZ1VU9obFRVRWNT?=
 =?utf-8?B?Nk5hNUFnYkUvcTRWOFlSdGkvZ1RjdTRidUFsZ253RzJEcE92cjVkZis5S1pR?=
 =?utf-8?B?N1pzQy9YeU92RUROQjhpaEtMWGlhMmhweVlNUktFL2VlZmlVRVJUYUZjdDdt?=
 =?utf-8?B?UkEwL2JTK01aNThjT2p3dlFrK3FqUFdFQmhtbHdFNW5mNHhiUThEemVlWDlH?=
 =?utf-8?B?TDhvb0Q3NW5rc2N5M0Vsc3hHenZBQWtJRlc2ZFgzRlNKbEs3dTJLR0RYVEJu?=
 =?utf-8?B?dGRQbzhzb2RVYkZEOXdweXpCdUhBc1MwbTRmb2NGVU1lUC9rMUhENDFBRVkr?=
 =?utf-8?B?V0tzcDduRi9OOFJocjNrR0xidjlYRnJ6eVRtcGN4UDV2SGVGY0ZmTkpNb1lF?=
 =?utf-8?B?WXZNbEZ4VngvQ3VTbUJvWGxnYUJvS3A4K3RsRnFib09vNFgvSXBmb0VVdWxG?=
 =?utf-8?B?ZWdYYjZXUUpQcUVCcm5KdmgwQVRNZyswWkN2V005Wk81SVlva2M3Ylo0MC9G?=
 =?utf-8?B?dHozZTZ6M3YxbEI0YkxTREtZTURFeFowNlVDb3hqWFpTNWVialRtL1VqVFhz?=
 =?utf-8?B?Q2l0ZEJhK2tabWYvRUM3UWp5SzRJSjRjZGFKV0pmMXh6TmxFMkY0d1lQcnp2?=
 =?utf-8?B?WjE1Y3RHT29lczdVZzRxaUUzQ0VRSDJKR1BrNk5RSHdHSXJkSFJMc09abmRx?=
 =?utf-8?B?NXRFNUd5ZVBsN2dhOThCaCtiSmFOVzhjMGJsaGVoT0dMT05Sa2cvUVcwK3JL?=
 =?utf-8?B?dkdldXN3ZnVBa1NlZ0VYQ1NIWUhuTEpyMlZRdlppeGNYeFBkTlVocGVOQkRN?=
 =?utf-8?B?VElOd3RkYVJ5MmhqZUZQaDRJSXo2TWVBb0RLWW0wR3BXRlZmSlNTWkRtWTZx?=
 =?utf-8?B?KzdMU1JHdnc5bkh1aDlhamIzY05ZTzVRM1FwMzM2dExvc251dGttUmhKMmI1?=
 =?utf-8?B?Zm5zY1BDOHIyMlpWUXBYVTRQUE8xaE5NRGxadHBxU3A4WmRFbEE5aTlMSWpp?=
 =?utf-8?B?anRYVTBFUm9weVNta0N3aHlJZ2JsRjNUam9oZW1QRmZrVDQ1bnZ3MzlDL2dq?=
 =?utf-8?B?WHNYUk1VV1RPdEczN0N1OGxwSFI3REF6SmcvTnVicDdtTGZISHFJS3BvZ3Rq?=
 =?utf-8?B?RlQ2eDZyNVJ5ejhCa0h0OC83VjNjQ05qM1NGZ0FJV0RmVVliV1JGbmlZNlo0?=
 =?utf-8?B?L2ZWZEwwaGcrOURzSGxmRWRyZW9iZ1FILzBBeG5TNllYUnBXQ3R6LzFjendQ?=
 =?utf-8?B?QVZwbzZxZENQT240YTJqL25zSWRzMExpaURoQktzNG1nZUNNUk44OUI2OENB?=
 =?utf-8?B?c2YrZ3dSMVQ4akdHWGh4a3JvUGxCc1luTkQ2cW1zcTFZWXgxUkpHMmJZN2lm?=
 =?utf-8?Q?4KoQ=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(35042699022)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 11:15:03.0469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac5382c-fcca-42ce-9bcc-08de5294ffb0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7691

SGkgTWljaGFsLA0KDQo+PiANCj4+IC1zdGF0aWMgYm9vbCBpc19tbV9hdHRyX21hdGNoKHByX3Qg
KnJlZ2lvbiwgdW5zaWduZWQgaW50IGF0dHJpYnV0ZXMpDQo+PiArc3RhdGljIGludCBpc19tbV9h
dHRyX21hdGNoKHByX3QgKnJlZ2lvbiwgdW5zaWduZWQgaW50IGF0dHJpYnV0ZXMpDQo+PiB7DQo+
PiAgICAgaWYgKCByZWdpb24tPnByYmFyLnJlZy5ybyAhPSBQQUdFX1JPX01BU0soYXR0cmlidXRl
cykgKQ0KPj4gLSAgICB7DQo+PiAtICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcNCj4+IC0g
ICAgICAgICAgICAgICAiTWlzbWF0Y2hlZCBBY2Nlc3MgUGVybWlzc2lvbiBhdHRyaWJ1dGVzICgl
I3ggaW5zdGVhZCBvZiAlI3gpXG4iLA0KPj4gLSAgICAgICAgICAgICAgIHJlZ2lvbi0+cHJiYXIu
cmVnLnJvLCBQQUdFX1JPX01BU0soYXR0cmlidXRlcykpOw0KPj4gLSAgICAgICAgcmV0dXJuIGZh
bHNlOw0KPj4gLSAgICB9DQo+PiArICAgICAgICByZXR1cm4gTVBVX0FUVFJfUk9fTUlTTUFUQ0g7
DQo+PiANCj4+ICAgICBpZiAoIHJlZ2lvbi0+cHJiYXIucmVnLnhuICE9IFBBR0VfWE5fTUFTSyhh
dHRyaWJ1dGVzKSApDQo+PiAtICAgIHsNCj4+IC0gICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklO
Rw0KPj4gLSAgICAgICAgICAgICAgICJNaXNtYXRjaGVkIEV4ZWN1dGUgTmV2ZXIgYXR0cmlidXRl
cyAoJSN4IGluc3RlYWQgb2YgJSN4KVxuIiwNCj4+IC0gICAgICAgICAgICAgICByZWdpb24tPnBy
YmFyLnJlZy54biwgUEFHRV9YTl9NQVNLKGF0dHJpYnV0ZXMpKTsNCj4+IC0gICAgICAgIHJldHVy
biBmYWxzZTsNCj4+IC0gICAgfQ0KPj4gKyAgICAgICAgcmV0dXJuIE1QVV9BVFRSX1hOX01JU01B
VENIOw0KPiBMYXRlciBiZWxvdyB5b3UgZG9uJ3Qgc2VlbSB0byBkaWZmZXJlbnRpYXRlIGJldHdl
ZW4gTVBVX0FUVFJfUk9fTUlTTUFUQ0ggYW5kDQo+IE1QVV9BVFRSX1hOX01JU01BVENILiBUaGVy
ZWZvcmUgSSB3b3VsZCBzdWdnZXN0IHRvIGtlZXAgdGhlbSBhcyBvbmUgdG8gc2ltcGxpZnkNCj4g
dGhlIGNvZGUuDQo+IA0KPj4gDQo+PiAgICAgaWYgKCByZWdpb24tPnBybGFyLnJlZy5haSAhPSBQ
QUdFX0FJX01BU0soYXR0cmlidXRlcykgKQ0KPj4gLSAgICB7DQo+PiAtICAgICAgICBwcmludGso
WEVOTE9HX1dBUk5JTkcNCj4+IC0gICAgICAgICAgICAgICAiTWlzbWF0Y2hlZCBNZW1vcnkgQXR0
cmlidXRlIEluZGV4ICglI3ggaW5zdGVhZCBvZiAlI3gpXG4iLA0KPj4gLSAgICAgICAgICAgICAg
IHJlZ2lvbi0+cHJsYXIucmVnLmFpLCBQQUdFX0FJX01BU0soYXR0cmlidXRlcykpOw0KPj4gLSAg
ICAgICAgcmV0dXJuIGZhbHNlOw0KPj4gLSAgICB9DQo+PiArICAgICAgICByZXR1cm4gTVBVX0FU
VFJfQUlfTUlTTUFUQ0g7DQo+PiANCj4+IC0gICAgcmV0dXJuIHRydWU7DQo+PiArICAgIHJldHVy
biAwOw0KPj4gfQ0KPj4gDQo+PiAvKiBNYXAgYSBmcmFtZSB0YWJsZSB0byBjb3ZlciBwaHlzaWNh
bCBhZGRyZXNzZXMgcHMgdGhyb3VnaCBwZSAqLw0KPj4gQEAgLTM1NywxMiArMzQyLDQ1IEBAIHN0
YXRpYyBpbnQgeGVuX21wdW1hcF91cGRhdGVfZW50cnkocGFkZHJfdCBiYXNlLCBwYWRkcl90IGxp
bWl0LA0KPj4gICAgICovDQo+PiAgICAgaWYgKCBmbGFnc19oYXNfcGFnZV9wcmVzZW50ICYmIChy
YyA+PSBNUFVNQVBfUkVHSU9OX0ZPVU5EKSApDQo+PiAgICAgew0KPj4gLSAgICAgICAgaWYgKCAh
aXNfbW1fYXR0cl9tYXRjaCgmeGVuX21wdW1hcFtpZHhdLCBmbGFncykgKQ0KPj4gKyAgICAgICAg
aW50IGF0dHJfbWF0Y2ggPSBpc19tbV9hdHRyX21hdGNoKCZ4ZW5fbXB1bWFwW2lkeF0sIGZsYWdz
KTsNCj4+ICsNCj4+ICsgICAgICAgIC8qIFdlIGRvIG5vdCBzdXBwb3J0IG1vZGlmeWluZyBBSSBh
dHRyaWJ1dGUuICovDQo+PiArICAgICAgICBpZiAoIE1QVV9BVFRSX0FJX01JU01BVENIID09IGF0
dHJfbWF0Y2ggKQ0KPj4gICAgICAgICB7DQo+PiAtICAgICAgICAgICAgcHJpbnRrKCJNb2RpZnlp
bmcgYW4gZXhpc3RpbmcgZW50cnkgaXMgbm90IHN1cHBvcnRlZFxuIik7DQo+PiArICAgICAgICAg
ICAgcHJpbnRrKFhFTkxPR19FUlINCj4+ICsgICAgICAgICAgICAgICAgICAgIk1vZGlmeWluZyBt
ZW1vcnkgYXR0cmlidXRlIGlzIG5vdCBzdXBwb3J0ZWRcbiIpOw0KPj4gICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7DQo+PiAgICAgICAgIH0NCj4+IA0KPj4gKyAgICAgICAgLyoNCj4+ICsgICAg
ICAgICAqIFBlcm1pc3Npb25zIFJPIGFuZCBYTiBjYW4gYmUgY2hhbmdlZCBvbmx5IGJ5IHRoZSBm
dWxsIHJlZ2lvbi4NCj4+ICsgICAgICAgICAqIFBlcm1pc3Npb25zIHRoYXQgbWF0Y2ggY2FuIGNv
bnRpbnVlIGFuZCBqdXN0IGluY3JlbWVudCByZWZjb3VudC4NCj4+ICsgICAgICAgICAqLw0KPj4g
KyAgICAgICAgaWYgKCBNUFVfQVRUUl9ST19NSVNNQVRDSCA9PSBhdHRyX21hdGNoIHx8DQo+IEVu
bGNvc2UgaW4gYnJhY2tldHMgKCkgfHwgKCkNCj4gDQo+PiArICAgICAgICAgICAgIE1QVV9BVFRS
X1hOX01JU01BVENIID09IGF0dHJfbWF0Y2ggKQ0KPj4gKyAgICAgICAgew0KPj4gKyAgICAgICAg
ICAgIGlmICggcmMgPT0gTVBVTUFQX1JFR0lPTl9JTkNMVVNJVkUgKQ0KPj4gKyAgICAgICAgICAg
IHsNCj4+ICsgICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlINCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICJDYW5ub3QgbW9kaWZ5IHBhcnRpYWwgcmVnaW9uIHBlcm1pc3Npb25zXG4i
KTsNCj4+ICsgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+PiArICAgICAgICAgICAg
fQ0KPj4gKw0KPj4gKyAgICAgICAgICAgIGlmICggeGVuX21wdW1hcFtpZHhdLnJlZmNvdW50ICE9
IDAgKQ0KPj4gKyAgICAgICAgICAgIHsNCj4+ICsgICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxP
R19FUlINCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICJDYW5ub3QgbW9kaWZ5IG1lbW9yeSBw
ZXJtaXNzaW9ucyBmb3IgYSByZWdpb24gbWFwcGVkIG11bHRpcGxlIHRpbWVzXG4iKTsNCj4gTWVt
b3J5IHBlcm1pc3Npb24/IEhlcmUgeW91IGFyZSBjaGVja2luZyBmb3IgWE4vUk8uDQoNClJpZ2h0
LCBpcyBpdCBiZXR0ZXIg4oCcbWVtb3J5IGF0dHJpYnV0ZXPigJ0/DQoNCj4gDQo+PiArICAgICAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4gKyAgICAgICAgICAgIH0NCj4+ICsNCj4+ICsg
ICAgICAgICAgICAvKiBTZXQgbmV3IHBlcm1pc3Npb24gKi8NCj4+ICsgICAgICAgICAgICB4ZW5f
bXB1bWFwW2lkeF0ucHJiYXIucmVnLnJvID0gUEFHRV9ST19NQVNLKGZsYWdzKTsNCj4+ICsgICAg
ICAgICAgICB4ZW5fbXB1bWFwW2lkeF0ucHJiYXIucmVnLnhuID0gUEFHRV9YTl9NQVNLKGZsYWdz
KTsNCj4gSGVyZSB5b3UgYWx3YXlzIGNoYW5nZSBib3RoLCB0aGF0J3Mgd2h5IHRoZXJlIGlzIG5v
IG5lZWQgdG8gcHJvdmlkZSB0d28gc2VwYXJhdGUNCj4gbWFjcm9zIGFzIEkgbWVudGlvbmVkIGFi
b3ZlLg0KDQpnb29kIHBvaW50Lg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

