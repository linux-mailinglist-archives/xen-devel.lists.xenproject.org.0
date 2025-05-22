Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA4FAC0929
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 11:57:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993481.1376819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI2fY-0006LC-JG; Thu, 22 May 2025 09:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993481.1376819; Thu, 22 May 2025 09:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI2fY-0006Iq-FI; Thu, 22 May 2025 09:56:56 +0000
Received: by outflank-mailman (input) for mailman id 993481;
 Thu, 22 May 2025 09:56:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yp15=YG=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uI2fW-0006HE-Mj
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 09:56:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20602.outbound.protection.outlook.com
 [2a01:111:f403:2613::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16832e5e-36f3-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 11:56:53 +0200 (CEST)
Received: from AS4PR10CA0029.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::18)
 by GV1PR08MB11165.eurprd08.prod.outlook.com (2603:10a6:150:1f3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 09:56:49 +0000
Received: from AMS0EPF0000019D.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::91) by AS4PR10CA0029.outlook.office365.com
 (2603:10a6:20b:5d8::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 22 May 2025 09:56:49 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019D.mail.protection.outlook.com (10.167.16.249) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 09:56:47 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 DB4PR08MB9190.eurprd08.prod.outlook.com (2603:10a6:10:3fd::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.21; Thu, 22 May 2025 09:56:12 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 09:56:12 +0000
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
X-Inumbo-ID: 16832e5e-36f3-11f0-a2fb-13f23c93f187
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=It9SQYTVbtPNz4JpCDorbMPX1eF2R5JBoQTQBokjsVOJ0rtiVDXADFkiQinS98oR6WW9kBOS4PfIMonfxqOUvv7D/5XMFCuc2r5lRw7VeKcPkBeRZjMtXzMZCg/35mxstdA5KZ6z+qq6lDX5apYirdnT/WGuJco6/VQa/+EvKWEUN8UACi0CJE0kDGHQO4BaHcz7Qw7BkB6uaMBWkZ6PhzLncF/XSHIlwD0/TFHHjxYYn2HA34OGm2o+yclOmpzc7ZrLFFD7QAgdQXGsoQrwnDD0E4VkggcZY4WCaNGF36lAhP/TD1f1wDrP0cbovUPTYacceGzjW3ur8KBlxh2Ecg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HX0ICNMa/FDROzjfi5n4RwjMAAbwXLqOf710uP5MNXw=;
 b=CWr2mug8LToXeXRkLt3Uoy923ap67BX8xrETFUbSfEkJaan8rSc9FgXOMalAaa5IbadClmUdT7R4yEsD8lxRDL9eNRk9dNgIiQU0LhA5N6IehmqI6AvbUqx7m6MCNaLwjiPhYpMayfOcJX2ar8Os3qmBUEXZhAg8qjGXM+R5W+83y0DaVmhxszYVyhFww4yvw41Oxbg9A92JGscijLFKp094n0XQWS4IbwV0xOHwtmHqYeNZNa4uYEGBvBRDX2DjbEaU/5gVobTJntkxq5WgPN9dkYY1uYIqhX3hGsO5stNVrNmIq6OKxz7nlPk/ICDBn7KLp1RXBYVeXxgxQDjrGg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HX0ICNMa/FDROzjfi5n4RwjMAAbwXLqOf710uP5MNXw=;
 b=Nrk9yTKjJlFiv4pLZuRSMZLyFlNGYfcZ8fBGdHOr7ChlOjLH9n8vKFOcoqptTDs5WIc4hvSmyjSjfe80ToDCpRDHmQznvxGdOIBvF6dW4DaiXRjR8VSivgp/u6Qx/ysJ5yW2pJbqEmx05Vh6MtkHdq4T8SAcqgQYw/kDQeEQJhc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6w3ea3NxzeLt8w3tqvtfAtKd9F+J0RgFyiqVOiMaaYDgzMCmWj6YsjSb9KiA8P/nhzwPa53qbb10QwSLzxKLCHq7Cs3KgO/nWMXmji0DU0zeFg3ltTzaqmpvP7yNMk+w/Auq1bOJ86nnJEwODv0ZQruQmZzuZ8AdErxl97lrgTqU6jEClL8WMtXhaXQ/sqgTxyqikOX+KcvdPsN0LSjRfGG4LLrKWzIEEZYwUK6yRfAG/iwGZpU8O+Q5q4BvccwbGmpcmlOf6C3ZvlqER7m0ujXpIa2H7BrSLUMUm1yNQ3OpxX1geHF+tQK2cH5TuwfqKHJFS0G7pMnzvKluIO18Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HX0ICNMa/FDROzjfi5n4RwjMAAbwXLqOf710uP5MNXw=;
 b=Zae72FQF7/o3pS+Dy33/VGetG+QKwK017/SE+LIEStXf1TcWtTMIAjBNjghdpxYB7+h1DUgTQ4KUeCNU1shXWNLuIE4+ZfIgGubXgETxHCEaJXaeOKSpiA4fz/AHGOVLT6EUFkd0bevsbi4++C2WA3z8s9VNnjTnuw+In+rPAbLxPm+u/6BWxsBA8WeeoL9E8uGhfXlcfRdU9X2wCq2Y/oLxEdkt4yOmmsrrGPR3gTcqXb16JMffrja+u4OnWFZs+sYcrl9PknouQfvuwWepbkcbRWl/SrGuwyQEjqAzzfl549aGwt8BZcHf+qYgaj4erzBn1tpvO/h4HF8T4B7d0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HX0ICNMa/FDROzjfi5n4RwjMAAbwXLqOf710uP5MNXw=;
 b=Nrk9yTKjJlFiv4pLZuRSMZLyFlNGYfcZ8fBGdHOr7ChlOjLH9n8vKFOcoqptTDs5WIc4hvSmyjSjfe80ToDCpRDHmQznvxGdOIBvF6dW4DaiXRjR8VSivgp/u6Qx/ysJ5yW2pJbqEmx05Vh6MtkHdq4T8SAcqgQYw/kDQeEQJhc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 5/6] arm/mpu: Introduce utility functions for the pr_t
 type
Thread-Topic: [PATCH v5 5/6] arm/mpu: Introduce utility functions for the pr_t
 type
Thread-Index: AQHbw+N8axomw5+oq0q6+Td9FW5OAbPeZN4AgAAStgA=
Date: Thu, 22 May 2025 09:56:12 +0000
Message-ID: <14A6545F-F7C5-412B-8A3D-9EFD293D69AE@arm.com>
References: <20250513084532.4059388-1-luca.fancellu@arm.com>
 <20250513084532.4059388-6-luca.fancellu@arm.com>
 <ddf26315-ff48-411d-a0ca-9a99867323a7@amd.com>
In-Reply-To: <ddf26315-ff48-411d-a0ca-9a99867323a7@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|DB4PR08MB9190:EE_|AMS0EPF0000019D:EE_|GV1PR08MB11165:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fcd523d-baa7-45e4-531c-08dd9916f756
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MlZNSHVRVmR6K1dFYXpTeExyK1RVd09QWUhyc1NnTXBuVmRnd1JxVUIyYTFS?=
 =?utf-8?B?VWl5RVBCaDlUY2sveTY2Vk1PVEpIYkFkR3VyNjg5T29lU0ZEUGdlSXFwYU5m?=
 =?utf-8?B?V3VVbnp3N0pWcG5pbGVWM1I5alIzeEJiYlRkUVhySGJ3QmJ2MkhqVHo3emJF?=
 =?utf-8?B?Z21ydnZ4cHlieTBuay84Yjg5c0dCbmY3ZGZRQkNQWkhDWk92TUdEWVcvS0lD?=
 =?utf-8?B?eWFaQ0dLMy9PaEk5UW5zaVZDTDlZUFRLTThNbTBIcndydnVLM1lodjdtSEtW?=
 =?utf-8?B?RVIweEpPSjlQdE4wZ0RSMHdUbzNlbXI3MWZ3cXJTOEFTcXpxdThjK04wTHAy?=
 =?utf-8?B?d3hURE1HVU1ZVUxoS3JoZGh3eVQ5OWxDSlp4M1MyVU5EOUxWZFR4ckJrTnl4?=
 =?utf-8?B?UW50YlRtenF5SEFxVFFxNXp5Q21RT2poVExuRXdhYnZCeTRwd1dHalpyODVQ?=
 =?utf-8?B?akFsejhXRC9RaS9SWnA3VkN3cytFQ0YvdGVMMm1PQWd0TU5PVmNZY09UK1NR?=
 =?utf-8?B?cUpCdlN3WW5wRWNhZUVla0oramd5WU9jSERRakNzYitNMUw3cGZFeDcra3Zl?=
 =?utf-8?B?UVVMNU5mb1AvZm9sUU5OTVd5YkxxbFVvd01FdjRTaVJneXNkdERpMXEzb05a?=
 =?utf-8?B?aEZxNjlNU0J4NVhVVzV4dnhHM3dZNUhaQkdSRWtja09oVEM0Q0hpdEYzQWlp?=
 =?utf-8?B?WGdxS29IYk5OQncvYld4ZWozczlaMlc4TkhpQVN5Slo0MmRnTnFibjZWUDYz?=
 =?utf-8?B?b09NaUs0KzhjMTFXUEI4anAzaldCMzZKNFI4aHFOOG5VODViWTRhb0FqaVRl?=
 =?utf-8?B?Y0w1VnZYTnk1VExEMGhLMEY2NzFDN2JSQ2tNL25TbTB5L2RaTzFhM2w2Wmc0?=
 =?utf-8?B?NmhOWEV4c1U0bHZKOWVEU01ieFZtM3VkRFdwRFRaZ1QrZUxadUpLdk8zb0xz?=
 =?utf-8?B?S2NuamJtVnJKbDVIV0V3Z2xxWk9iS2U2eG10ZkFnQXpCTVdhU0p2a1RvZFJW?=
 =?utf-8?B?akdKV1RUR1Y0OGNRTkxSUUV6aVpKTjZYSnpzOEVScTRlU1ptOXBIZ3ViWWQx?=
 =?utf-8?B?V3NRazB2VzJQWkNLbEczdi9LdWtuSkVVQ0JGM2ZaVmw5UE9OUi9zYzkzVXNN?=
 =?utf-8?B?cGgzNzliV1RrVmkyZ3loNkhrZGpiSTZQSEhmU09WUTFnT2t1MWlYSWpZcXBr?=
 =?utf-8?B?bE53TWJBRW8xbXJ5MmRoTHl6M0ltZWMzdVJ5ek1nMjJLVzhrRk9hUC9qWDJH?=
 =?utf-8?B?ZGRkUmNFdzkrN1V2dXVRSWdYcVRZVUhhaFdDSS9URDdlS1Riay9xK1lJYW1T?=
 =?utf-8?B?WDdHUkI3b25OWHluYThJbERqV3FRcEk3T3VTUVZ5eGdMNFlpTWp1RkkxNzRs?=
 =?utf-8?B?S0hJbmw3UXVEd2tiMnV3RGRMZnlyM1ZjTDZQc01nU3RQSU5FcTZ1QVVybm5U?=
 =?utf-8?B?bWZSU2VlNmM2THArRThQUElLcmxZRzgybmJuTWxYRm5EZ1ZQSnFPVnFRRkhi?=
 =?utf-8?B?bFU4cFpISm5MVEVuQVhDR2JjZkFJemtBYjg1ZmJtaFhHaVppMzhsR3EvTXdP?=
 =?utf-8?B?V2VmNUxYNEFKL1F3R1hzK0o3aGd6b0QvN2NQelNvangvdDNIZFNXZkdsK1JI?=
 =?utf-8?B?eWF3UWtWSFVZWEFmSm8yMVFVUXV6eU16TlVMVS9MSGc4VXhJS0JQbGxESmxJ?=
 =?utf-8?B?cHRVU0lOVUQrczVKVzg0Szd3MUtTbllCN0xjUWtrQllMaDQ3SHYxV2UwcGZi?=
 =?utf-8?B?MU8vOTNnVHAzQkJLRGx1dDFVbGN5WkZ1ZGJzSC9vUnorRDNOTFNETXJ5MEsr?=
 =?utf-8?B?cXpTV3Q2aVljVnpkeWpnUVZSZ2pDU0dHdVFuZFVkbDU2UVlMWTVKQTcyUGVP?=
 =?utf-8?B?ZzFXN2g1M2Fnd0J6aUo5YXNnUUJKc2p4MEJWZ0pxUnd5OUQxZnZ3WFlhL08z?=
 =?utf-8?B?bDBsMkRVV2srekYvZWNtZ2dlRkxsb3ZlM1pHdVZ5c1l1V1ZBQ3RVeEwvUXYy?=
 =?utf-8?B?b1hYTnRldTZBPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1E0C3A466F95948B432BE7CB8D48A13@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9190
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f3d418b1-19b5-44d8-2fd9-08dd9916e29b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|36860700013|82310400026|35042699022|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RUcwamcxbGZrclNScWMwTWxiNFhZM1ZnbkhuZVFRSDJPeUNvNjFxYXRIbUxm?=
 =?utf-8?B?bzBha2hPWm1pNUtFbDROK3hsSXd5b3k3MVhRa2ovZUVMaVVBOEcxQmo2cHZQ?=
 =?utf-8?B?c1M4b3phK29BRmJNaXNBeWpzVGo1TVkxOFVHNEttbVM4QmY1U0QxSy9aUmJj?=
 =?utf-8?B?OHZ5K2VRRkJSd1NFSmdneS95UmxsU2cxVGIvb21EL0FzMks1Q1pNb211Y0ly?=
 =?utf-8?B?WWR2RUFVUGFYMVVuTHd1cHBranZlMm14UktaWkNMMEZ5aWNDNFJxUWt5aTZM?=
 =?utf-8?B?R3ZQUy9lWkxHRG9MTHZrM0xkWkI4K1dJV2lRVjBNZXgzOXEyeDJScHJIS2RZ?=
 =?utf-8?B?NTRldi8xZGl5TldPUk1MTUdtTWJkMXVHU0dwQWhsWTlST0JqTjdtYkxaYS96?=
 =?utf-8?B?cno1VFZoeGF1czhRdjRKKzk2ODVxNWZoblJ0bjhaa0dMT3UvV3JMSDl2VzdF?=
 =?utf-8?B?NWlkeE5HdTVlZGhjSnhlTzdTNE5Id3QrUlpjby9KYzlNMGxVYzBCUC9CSHlU?=
 =?utf-8?B?V3hHZWJKNDY2Uld3ZjdWSlJNZ0I1c3pjdkc4SllpcklEamNudFBmSGJoaXJO?=
 =?utf-8?B?bDJqWjNHRGlFdHdJMnJ3cFR6NFNTL1ErUDd0WnB1WVdBMFVpaldLUTQ5UWwr?=
 =?utf-8?B?dzRqT3pjeGN1TktWUG53YnVtNWVRVHN1SmVhZDFWcWJvbjVJcC9XeXNFbUhT?=
 =?utf-8?B?RjJBSjhPSE9reWp1MVo0REF1dXVMaDh2WjZLMVdQUktVN0p4cUxXVHk4YUlO?=
 =?utf-8?B?eGJld2lkalZnQ1JzMWQ3SFlVbFlzbzVteUxNNWJuWDNKdFNFSnY4NVVaMHFm?=
 =?utf-8?B?QS9ZVkxobS9NSjNSNVpVZHJiWnpvK3RHeENvYmxBVjN1UmRiVG0zYXZrL3I5?=
 =?utf-8?B?WFlsWE1rL3JlVjRzQVpiZjd5bmc0UUVIUE1GUmdBZEtVZHNveXZ2NkIwVW93?=
 =?utf-8?B?anhOR29JTnU1VlMwVjkySFk5OUxHb0U1WmpLK0szK1ZYRUxacS96MkVPazIy?=
 =?utf-8?B?V21iOFBiU1J0ZHh6NUVra2ZhNDFUSkFibkxuMitreCt2QXc2ZDk3MTZwQTdM?=
 =?utf-8?B?WnZNZE9kanpSeXYzNDYxRUJzb2pKb0JBUmg2cXlUMVhZTG1OOGNVYlZvN2R3?=
 =?utf-8?B?aUg2ZGcxTE5rbncxallmRGd0SG0ybTQybnkwQWljRURwcVByWDJtVTE1V0p5?=
 =?utf-8?B?WnFtQ0Q5UWNpTFBtZ2dIcDl3R1dGTktDWXBGL3hRVFcxU3hCZjV3Q3ZXQXN6?=
 =?utf-8?B?anJJcjNDUFlWY2FaektTM0ZBYnl5TXU4MmZFZ2RrNU02TXhDZjhhTnYwMUN1?=
 =?utf-8?B?SkNKVkluYVRNemh2VUFMTDBoOG5qbVpqOGpkWS9QTGRmUEc3NTk4NllJOC9z?=
 =?utf-8?B?c0lTWEpZY2hxc2UvaW5EK3R3SnYzcS82cVRFNm94MHcrb09DcjFBbkJicEcr?=
 =?utf-8?B?SlhMQ2JuaVRzRXBvM1VxVFhaQWVQQVEranFRRFFXVkdmd0I3UnJHODBqbDl5?=
 =?utf-8?B?MkZ0WWJqTVNHV0xFZU8xK3QzSkYrTTBuV1Y2bDJEUWd3cDZ4aWJCM2V1WVZq?=
 =?utf-8?B?dnRPdTNZR1YzVjZ4YW16L3FJU0JCVFN3bmd1TXhFbG1GOU1wbTBOUHp3MDl3?=
 =?utf-8?B?YWcyU2JuZnVTa3JIb3hXSVh6bkxUQ0VoL3J5NXU0bkgxWUxHbkU5VjdLbThO?=
 =?utf-8?B?RWNhL0w2T3V1YytjTXdmTnRGWk9ySXBzOGoyZktTRmlrSGMrM1VZbXo0YlQ4?=
 =?utf-8?B?cU44R3JHVDdDdEZPbDAySjQzcXU4dnhESDNzN1E3cUpCQTNrb2pkaWdIY2Mw?=
 =?utf-8?B?b1NUdmpRSzE0RDZpY2dkcW12TDhkeG5YNTlVcFFqZnNqMjNIYjFUZmR5Rnh2?=
 =?utf-8?B?SGxUUXdBRXE4emgyVTRibkhxdWtLcjE1bXhFSEVhTjRLanhTQ1p3R1RIL0gr?=
 =?utf-8?B?L0VFV29xRk1CSmMvUXZscTVLclc2ei9yMS9tQ3JSSWZBRUwxT01lakV3d21H?=
 =?utf-8?B?NjdwR3kwOXFFOXo5QW5xV2JWV21Daks0cTVtZXZFVnh4VWRXWUpoM0ZkN1RY?=
 =?utf-8?Q?eOVLUw?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(36860700013)(82310400026)(35042699022)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 09:56:47.3394
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fcd523d-baa7-45e4-531c-08dd9916f756
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11165

SGkgTWljaGFsLA0KDQo+PiArDQo+PiArLyoNCj4+ICsgKiBTZXQgbGltaXQgYWRkcmVzcyBvZiBN
UFUgcHJvdGVjdGlvbiByZWdpb24uDQo+PiArICoNCj4+ICsgKiBAcHI6IHBvaW50ZXIgdG8gdGhl
IHByb3RlY3Rpb24gcmVnaW9uIHN0cnVjdHVyZS4NCj4+ICsgKiBAbGltaXQ6IGV4Y2x1c2l2ZSBh
ZGRyZXNzIGFzIGxpbWl0IG9mIHRoZSBwcm90ZWN0aW9uIHJlZ2lvbi4NCj4+ICsgKi8NCj4+ICtz
dGF0aWMgaW5saW5lIHZvaWQgcHJfc2V0X2xpbWl0KHByX3QgKnByLCBwYWRkcl90IGxpbWl0KQ0K
Pj4gK3sNCj4+ICsgICAgcHItPnBybGFyLnJlZy5saW1pdCA9ICgoKGxpbWl0IC0gMSkgJiB+TVBV
X1JFR0lPTl9SRVMwKQ0KPiBNaWdodCBiZSB3b3J0aCBhZGRpbmcgYSBjb21tZW50IHRoYXQgUFJM
QVIgZXhwZWN0cyBpbmNsdXNpdmUgbGltaXQgaGVuY2UgKGxpbWl0IC0xKS4NCg0KWW91IG1lYW4g
b24gdG9wIG9mIHRoZSBhc3NpZ25tZW50PyBJ4oCZdmUgcHJvYmFibHkgbWlzdW5kZXJzdG9vZCB5
b3UgY29tbWVudCBpbiB0aGUgcGFzdCB2ZXJzaW9uDQphbmQgdGhvdWdodCB0aGF0IHRoZSBAbGlt
aXQgZGVzY3JpcHRpb24gd2FzIGVub3VnaCwgSeKAmW0gb2sgdG8gYWRkIGFsc28gdGhpcyBjb21t
ZW50Lg0KDQpJ4oCZbGwgZml4IHlvdXIgb3RoZXIgZmluZGluZ3MuDQoNCkNoZWVycywNCkx1Y2EN
Cg0KDQo=

