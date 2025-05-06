Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF26CAABDA0
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 10:46:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976856.1363975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCDwe-0002KP-Vs; Tue, 06 May 2025 08:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976856.1363975; Tue, 06 May 2025 08:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCDwe-0002Hq-Sc; Tue, 06 May 2025 08:46:32 +0000
Received: by outflank-mailman (input) for mailman id 976856;
 Tue, 06 May 2025 08:46:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+p1E=XW=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uCDwd-0002Hf-6r
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 08:46:31 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82bbc6df-2a56-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 10:45:50 +0200 (CEST)
Received: from DUZPR01CA0321.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::15) by AS8PR08MB7815.eurprd08.prod.outlook.com
 (2603:10a6:20b:529::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 08:45:46 +0000
Received: from DB1PEPF000509F7.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::27) by DUZPR01CA0321.outlook.office365.com
 (2603:10a6:10:4ba::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.32 via Frontend Transport; Tue,
 6 May 2025 08:45:48 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F7.mail.protection.outlook.com (10.167.242.153) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Tue, 6 May 2025 08:45:46 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 DB9PR08MB9684.eurprd08.prod.outlook.com (2603:10a6:10:460::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.21; Tue, 6 May 2025 08:45:10 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 08:45:10 +0000
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
X-Inumbo-ID: 82bbc6df-2a56-11f0-9eb4-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ls37upRf30SHWYX3Ae5mQN5UTsqis5ywK1bZocZ6RdePav/XMQilX213qKIXjaVZ5VFh5ActA5oIftnPo9xyPUHQnJ+jAPKC0KWlBqrPu+r9cfTFupgzfoCaJyoGPh30wWNFv1Hlx093iCK23V8Y4dbGK58XJ7ugOxBTWtl9iiu1kaJYbLfHKghO8wFnx6z0rT+Vb77UbnSh+Vhfl4gCapeD7gJvYSLVwXMURzEtw++VzzCW0GyBHc1sG6w9Fx1B58IB8vj0p22vbE0bSyYiftJBuoilP7vpfsSzDw9DxdywIKkEQwgBGQv/Scb5FDOXpZjJIycfKBdCC1zfYZiXnA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ky/vAF+1Bjeyis2x8vdk9xTxAD3UbJzPp2bnjUseFU=;
 b=w10mMxh+I6Nx9XVZOC3ddiH4HFrqee4cEyEMpqXXX4ymyqED+Vm8d7DbGSCyjsnySg8YZAMcCXZFAeyZpfomeTDnn9XQFagvREovp+1Ix01ajh2Nnd7oeIKO4YUA66kHHoH3174z2pLrYyI6YHNKUSlkhxQknlUFppgu3BUSiHexR/E6uw4W4HEhJXjpwcnMAnwr/NQouQmCXHRcnV0IeGmavzD9LCzErKokqhB+i02H/wqBYcRrgpf8/N3Zlv4e2VeoYevXWnc4D5ahdz3VzzPYaGP4yriJBdoNyosJ/TqrD2MElojywkl44L1OOhSr9Wg9DWAEaiDfWgwsPMIVzg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ky/vAF+1Bjeyis2x8vdk9xTxAD3UbJzPp2bnjUseFU=;
 b=lVe0t2+fp+OZNsWz1k4+WSvJdidtsAiyquttz3YomtvYiQOLcd1VlwA9XsWU9ouxZ8C9HtQpznkKzduLA3C8pDCyNn6DkEekcxwKX5k8E3cRywbFHiXiB8T6jTqTlD9JPUkJF6LpwjHk/ZIKF/RfsQj9PbRJmg9Qm7r1/J3XgeY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXpUJaACgdRTGXbpBkw/0X0GaqFUIvReSdFB9WlCPG5NkI4gpHwfNt7scW+G1xmLu64N3iTM4mlUhRQn08s5rsRijJ950jlS+rNoTra6sd31y0a9ZPSgpq9HI7ERvE7hq0jtu8x+2aNiAQ8ZvOPaiS4O3nHqf/+RuowgspfZ4ShBpeIG6Cy65kAZ6KxtAEPqcVLbweoBoVRqykXk+0HYrZwo+C22tfkbhS9FJDSZ3T8kOASXuBfc9Cgku/3SgXaJR47lnctFyNrHnAJIhOzze1ZapopSVum8DPTTo6ZiHojL27MHIY2vY75638nal6IlM8bvY3yeCW6A173nKnlBFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ky/vAF+1Bjeyis2x8vdk9xTxAD3UbJzPp2bnjUseFU=;
 b=Inl7HnorQsNiSPTN67DBRyHtPAzihQWV1msh2mebRKYxcEp6YOPg24pVI6dyyQx9sQWeTpLRL/oLDyvEYtkPAwD4XE7LZelqXAk1Lvpl4EhaUYYlV1phXcQF9V/O4jfDKeU/RW1owwtAL6l/GD4HQDmRfshKl0s3GEeNTgVtZiqGZ1/cApUJc47/rutm3QIK0W6M6qjkYz+8Z8y8auOT0zHvJHHq2CPMsvqndGQT7WJQR+AEaqOEXJZs0VWjoaQqIYfyxlUt7mKbf+iUKjsgf/5zC07RjYk8QEtngWHMpcTgSej97DYkkVSQ74Se4fhO/esJImPeTwKTCIePevZArA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ky/vAF+1Bjeyis2x8vdk9xTxAD3UbJzPp2bnjUseFU=;
 b=lVe0t2+fp+OZNsWz1k4+WSvJdidtsAiyquttz3YomtvYiQOLcd1VlwA9XsWU9ouxZ8C9HtQpznkKzduLA3C8pDCyNn6DkEekcxwKX5k8E3cRywbFHiXiB8T6jTqTlD9JPUkJF6LpwjHk/ZIKF/RfsQj9PbRJmg9Qm7r1/J3XgeY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 4/7] arm/mpu: Provide access to the MPU region from the
 C code
Thread-Topic: [PATCH v4 4/7] arm/mpu: Provide access to the MPU region from
 the C code
Thread-Index: AQHbuRpwLITrbiULPkuuL8oh5S0krbPD902AgAFcswA=
Date: Tue, 6 May 2025 08:45:10 +0000
Message-ID: <AA7E55D7-FD24-4F41-BC1E-9BED42F7FAA0@arm.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
 <20250429152057.2380536-5-luca.fancellu@arm.com>
 <e42080c1-495c-406d-b1a3-8af2db8fb22d@amd.com>
In-Reply-To: <e42080c1-495c-406d-b1a3-8af2db8fb22d@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|DB9PR08MB9684:EE_|DB1PEPF000509F7:EE_|AS8PR08MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d5912bf-2a32-44d8-b23b-08dd8c7a651e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?NTVKaWJjaDhMZTAxWlBsbUE2SDhHMGF0NnZyUTdGUnVrSi9xSVEyVU5nV25E?=
 =?utf-8?B?eUVtQW5JTUlPcE1vTW5MQWVGSmJHdFdoOUVUQ0gyTjFnbkk5VFM1QjE0WUZm?=
 =?utf-8?B?NjFNcWx3UnBiKzUycC8za3lTMEpsQm5kNjVrcHNKR084U3BET1N2cVh1T2xn?=
 =?utf-8?B?dklDc08yeFZ3ZTlJQUJ2VzExVmU1MXhCaXZxWXJ2bFFGVnVrRmFiWnpZcDBS?=
 =?utf-8?B?N1BmdkZyMU5jUk0vbUtGNlQ2NG9DMldUNWxhcEdwK1FnU3VMR3cvbDE5RThJ?=
 =?utf-8?B?NUY1UVhmVkhiUmpsTnRLd2dONzRxcjdZQ3p6dzJDeUVtZ09nR3UzVkdNRzMz?=
 =?utf-8?B?UWRVUDV4dDNRVFJTdkNXUXJ2NFZWcFI0ZUk0Z2xtOGlRSzB5dlFJZ05qWUds?=
 =?utf-8?B?TEF1VmlKLzVqdUxEZmVuSzBxb2hhdlc5YVZDbDFRUm04Ukh3ZDZ0ZzZJTC91?=
 =?utf-8?B?ZG5xZjFDbEZpMlNPdHVwYTBSdEltS0pQMkgvZE5aZ05wT25yWXQ2M0Y0YlMw?=
 =?utf-8?B?cTRoMDNTcXI2c1RJVjhMakpKU3l2Z1pQWDc1ZmdzTkdpSWJ2dUFhdHJTRGhZ?=
 =?utf-8?B?NDFpQnhtRWxmYVVoeFVtWk83Z1VseERtWGhTY3pRSG1qT1hqNGVzRi9XS05T?=
 =?utf-8?B?QjhYTmxCVzJuUlpPWnJIenZBM3FPMnlWRUVtSFB0NVh0YmtjY1J5bXhBR0U4?=
 =?utf-8?B?cDNkck5TeHdKVE9CY2p0Rkc4VHJjczdWMHNSYVg3N0xDWnNUdnhqKzhLWUxT?=
 =?utf-8?B?VDFscmdVbG5DWGRZQVNyQnpod21ueG43NWdzbUlub2w3Z1hJY3hGajdoNnRB?=
 =?utf-8?B?SGRIek5JSjUzQ3FwT1FsOEZrdVdmN01jV1hhQjNVbVZCSjFLSkY0WjFnT1hE?=
 =?utf-8?B?R0NWY3d0OVlETWtBVjJuVWlHLzIyZ3BsaDliRHFSbnBkdzlOdkxRSm4zbEJY?=
 =?utf-8?B?Y1FtRytRZC80bnl0WW0xZCs4c0lna2w5N3BwMkhpSis0VVBEQXQxcDkzYi9o?=
 =?utf-8?B?QTVTZG5pcGMxQnJ1UC82V1AzbmJPeXBlaFVkWWVuVGM0Mk04YmFMR2tHbnZM?=
 =?utf-8?B?ckxFTEROcEh0RmMyc3RobktXN29GUGJFcXBOZWpQMzdqeThIVDdKSlhKcmJW?=
 =?utf-8?B?b1BxZlBmRTBoYmU4OEIvbk9pb1lEbjRicU8rbWp2MnJ2R3NCSGwvcDlTeTRq?=
 =?utf-8?B?K25GcFBGeG5PZmRwL0o4ZTNYRGFCbEhONElNdFZIOW5IcDBuQm1oRTg3bGZQ?=
 =?utf-8?B?dkR6dm9adVFJbDZvQ1pvRlhXK1VtbUdjSmNIeUZtTVdJbXduMEwrbXhheGNn?=
 =?utf-8?B?Q2QxaDEwYlRpRmdmZU9TVzFyYStPUlVtekRCcGhNV01pbWpISDJuc2U5Yjkw?=
 =?utf-8?B?d2kxYkx5REdYWGZsZE53cFp0U3NSVDRkbnpnSnFpYTRIUFhIaHlCVHFFOEh2?=
 =?utf-8?B?UHhBSEV6bkpJOVJjeUthS3BoQ1NPanM3bm85NmtISWtVTzdtSE1sWFB1UlFp?=
 =?utf-8?B?NmtZTFhKMnlnZWlLQ3BUbDM3VVRBVzFnSUxiVC9KZ2hISllMdmZGSHIrR1JQ?=
 =?utf-8?B?ME1jM0dvaGNZSzAvcWxBQ0s4ZUxzdTdRNzk4cmRkcnAweVEzVDE5azg2N1ZH?=
 =?utf-8?B?dzhjZEN0MUQ5MTYzZmdVM081TDRhWVErc0xrWWVTbWdXeGw4WEZmSlBTN0JX?=
 =?utf-8?B?QVdVNXJyajlrT2RIeDlWTEM3aDdMKzNZUDMySHFoN2VNNnZ0UVd4bHdLS1Nv?=
 =?utf-8?B?dUpxa0kwWlBHeWgvZ3FHSGdjamUvQmtDREJBSW9ZUEZqUndJblpLdVVpZWFH?=
 =?utf-8?B?QWlnSytkQXZrWHcxSTVvWjNmRmRrODRiQU9ZWjdHVVpuTDNaLzBOQnNwUEFO?=
 =?utf-8?B?ZFBHNEttRlJOeWRlKzNTQk5SeE9MVDRiSkc3Q3Jnb0hyeHNNekxBTkE5eDZY?=
 =?utf-8?B?VExYbG1WTFVENEswQ1Q1TitDK0hWdzdrOUFBZFgvNERkNUJuaUNsRC9SZ3N2?=
 =?utf-8?B?M1dhL21DQklnPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2AA491D54744341823860DAA6CF4E46@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9684
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bda6d37e-fa5a-48d4-fe5d-08dd8c7a4fb5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|376014|36860700013|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MU1kNCsySVF1YmtqZjU3VUxlSHVJeVdsR01SN2RqS1pEY1RHeEZRKzZqV1pE?=
 =?utf-8?B?UlFXWlFPRnVqa3BlTVNOcURwYVVBbzB4VUdxQWI1QjRFcEhBbS9kVkU4MVBE?=
 =?utf-8?B?N2tmWDRXWmhMUEhpZnBVUHZSd2hzN09yQ29qRzFhQWlSdmhFeVY5cmphOHlN?=
 =?utf-8?B?S0tWcFBIWTNUU3FoSHJzYVo5ZFowMzZCOGVSekpkZW9BZElqYkxHN1ArRWxG?=
 =?utf-8?B?d0tCZXhWRyt1UVZVOXBNeXczVlNISC9HaWpCMlVXOGYxMGdEWWx3QnFyYVBo?=
 =?utf-8?B?MDNBNW5iM3JLSXArZkNSdmRSRmdiNnZKd08vMG1nUWwzOUlxMytOTk5KdHda?=
 =?utf-8?B?R2ZzakFCbmljRng4RExxMEtQbDRXcUJaVU03bUJvamRxU1kwLy9NUjlBZG92?=
 =?utf-8?B?T3FUWXgyYy9ldlFXL2Z3SFlhcmFlMjFCM3dBU0hqVStsQnNqNE83cFlXRWdF?=
 =?utf-8?B?MDBpYXBEZlQzcVFLdmM1OTlLc0ZHUUJIamY1eDJMek9COG81dlFCZ253UDRP?=
 =?utf-8?B?aWNnQXp4MWl0UUZzSzJqTzJrNnVyZUFuWEJDNjY0TFBNaS9xRlAzYml1V0xV?=
 =?utf-8?B?dHhUOElBaVdPZ0VvVW1FSGhMbHI1cldEOXk5eWlZNFoxV1JNbVRKbHBRK3Zp?=
 =?utf-8?B?T09XV1lYYnNHS1FIN1Zqd0pyRTY3T0s5TU1vSFVrUmlQWTZMakxRaG9VK1ZS?=
 =?utf-8?B?UUxwTDNZazlBdjdaU2hRQWJ1dWpzWG5vcHhoUnN4NHZLM2RzUUhNSWdTZ2hq?=
 =?utf-8?B?NVdUdlhiSXphMU9VZkVmWUQ0MHVmYTQ5emtzMEs4RXdrTTk1TmF6bFVFMHJw?=
 =?utf-8?B?M2ZieExLVHJSb284c2NoTkpRZUIwZDVsczRPY1FBVng5L0oweTRRckR5b1Vn?=
 =?utf-8?B?K3F0YXFYRjRocjMrNzRSMWRhdDRtUE5MM2xGd1RCN01WV1MxTy9KdGJuejVI?=
 =?utf-8?B?MHV1Z1o3eGFNVlRpSUtnMFdUdHFBc3Q3d3Z4cUZYS1FMNm0xOHdrTlRyemtm?=
 =?utf-8?B?L2VDOXFxMVFNNkRWdUQ3M0NjUXY2VS9rZDYzdEpyT0l4UHUvbkRTU1RuVzBm?=
 =?utf-8?B?a0ZZOVEzZFo4azdLU1loNzRRVDQyNEJybnlCSTJacHNoMXd0VHRFMWZxclRZ?=
 =?utf-8?B?ZkM2S1V0WFEyZmlrVENwUXhSdy9TcElCdEpwbk9wYUNOWUtMMTVEajVzRjFG?=
 =?utf-8?B?cFBJMzhnQkFINnFtbW4rUDhLN2VpcExpemlwVVIzcm0weTgxRDRqbjBCSnBF?=
 =?utf-8?B?azFqYjFITlB3cVpBNUpiSGRkM1JuYnlRZ2VGcnhidnVCbnRjUThRVS9DTjVk?=
 =?utf-8?B?SjYwdUU0anB0VVRXZzVWbFU4UDFBSW5aQVJkK09rc3RBMFh4Y2Zuc1JxZER6?=
 =?utf-8?B?Z21kdy9FNGZKU0NPaVlBdUVQUTArNHpLc0h3aFNlT0thc0lXVUJzS2FQQm5a?=
 =?utf-8?B?VU5LTUlIWTk5enBsS3V1RThKYUUvb2FUN3J0MEc5emJ6OVBWSk5uRXYxTHRB?=
 =?utf-8?B?MnkvYmNWUVdGNUtZaFhPeVN3SC9QRHM3aEFQNGRLQ2hxV3BuS1lvZTZyb2FP?=
 =?utf-8?B?ZWxRNGtTNnh4WllxbkVzNHM5bFpMYWozMEM3M29OOUVhTXRSR2NEL3hsVHFk?=
 =?utf-8?B?YVYxZGFLcHN5KzBsd1NVaVFwSFdrMldzWWdmU2lFMFpqbmZINDFZVW5UaHJ0?=
 =?utf-8?B?Mmc4cElpaUo2NTVjcGhqSWc4UHUxR08rU0ozYzd3K21CVmZ3eFIxQjlJR1py?=
 =?utf-8?B?RE5YVTJ2SExsZkV4YkUrN3RUcmIrMzBlRGcvNHVZSHVvdC9ISXlQMVZVaGI4?=
 =?utf-8?B?bFJCMmhTRnpUNGo2S2xEOXlETWN2VmpMZnc5dHRxY2VhMXpZaVVjQ2ZTdDBR?=
 =?utf-8?B?YWYyMjJHN1FlNS9lbk1Ga0xHT05DcTlnZE9vYTF0LzB0S0lDRms2SXNaTlNH?=
 =?utf-8?B?WUtYa0EvNldVNFhqSFBieEJnbUNzWHhXTzlkV2JjVVo1dWdTYm54Q2dUZmRn?=
 =?utf-8?B?d08wVkJZZHRpZnk5VVFmWkdneGVVbXRReVNBZkJwRmtEK3pDWWFiTXZtSUNv?=
 =?utf-8?Q?naDfzw?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(376014)(36860700013)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 08:45:46.5675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5912bf-2a32-44d8-b23b-08dd8c7a651e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7815

SGkgTWljaGFsLA0KDQo+PiANCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9h
c20vbXB1LmggYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbXB1LmgNCj4+IGluZGV4IDEzNjhi
MmViOTkwZi4uNDBhODYxNDBiNmNjIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL2luY2x1
ZGUvYXNtL21wdS5oDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbXB1LmgNCj4+
IEBAIC0xNyw2ICsxNyw3IEBADQo+PiAjZGVmaW5lIE1QVV9SRUdJT05fU0hJRlQgIDYNCj4+ICNk
ZWZpbmUgTVBVX1JFR0lPTl9BTElHTiAgKF9BQygxLCBVTCkgPDwgTVBVX1JFR0lPTl9TSElGVCkN
Cj4+ICNkZWZpbmUgTVBVX1JFR0lPTl9NQVNLICAgKH4oTVBVX1JFR0lPTl9BTElHTiAtIDEpKQ0K
Pj4gKyNkZWZpbmUgTVBVX1JFR0lPTl9SRVMwICAgKDB4RkZGRlVMTCA8PCA0OCkNCj4gVGhpcyBk
b2VzIG5vdCBsb29rIGxpa2UgYSBjb21tb24gbWFjcm8uIEl0J3MgYXJtNjQgc3BlY2lmaWMuDQo+
IEFsc28sIGl0IGxvb2tzIGxpa2UgeW91IHVzZSBpdCBpbiBtYWNyb3MgdGhhdCBhcmUgY29tbW9u
IHRvby4NCg0KWWVzIHJpZ2h0LCBJ4oCZbGwgbW92ZSB0aGF0IGludG8gYXNtL2FybTY0L21wdS5o
DQoNCj4+IA0KPj4gKy8qDQo+PiArICogUmVhZHMgdGhlIE1QVSByZWdpb24gd2l0aCBpbmRleCAn
c2VsJyBmcm9tIHRoZSBIVy4NCj4gSWYgeW91IHVzZSBAZm9vIHN0eWxlLCB5b3Ugc2hvdWxkIHVz
ZSBAc2VsIGhlcmUuDQo+IEJ1dCBJTU8gdGhpcyBjb21tZW50IGRvZXMgbm90IGJyaW5nIGFueSB1
c2VmdWxuZXNzLg0KPiBUaGUgbmFtZSBvZiB0aGUgaGVscGVyIGFuZCBwYXJhbWV0ZXIgZGVzY3Jp
cHRpb24gaXMgZW5vdWdoLg0KPiANCj4+ICsgKg0KPj4gKyAqIEBwcl9yZWFkOiBtcHUgcHJvdGVj
dGlvbiByZWdpb24gcmV0dXJuZWQgYnkgcmVhZCBvcC4NCj4+ICsgKiBAc2VsOiBtcHUgcHJvdGVj
dGlvbiByZWdpb24gc2VsZWN0b3INCj4+ICsgKi8NCj4+ICtleHRlcm4gdm9pZCByZWFkX3Byb3Rl
Y3Rpb25fcmVnaW9uKHByX3QgKnByX3JlYWQsIHVpbnQ4X3Qgc2VsKTsNCj4+ICsNCj4+ICsvKg0K
Pj4gKyAqIFdyaXRlcyB0aGUgTVBVIHJlZ2lvbiB3aXRoIGluZGV4ICdzZWwnIHRvIHRoZSBIVy4N
Cj4+ICsgKg0KPj4gKyAqIEBwcl93cml0ZTogY29uc3QgbXB1IHByb3RlY3Rpb24gcmVnaW9uIHBh
c3NlZCB0aHJvdWdoIHdyaXRlIG9wLg0KPiBObyBuZWVkIHRvIHNheSBjb25zdCBpbiBwYXJhbWV0
ZXIgZGVzY3JpcHRpb24NCj4gDQo+PiArICogQHNlbDogbXB1IHByb3RlY3Rpb24gcmVnaW9uIHNl
bGVjdG9yDQo+IFNhbWUgaGVyZS4NCg0KSeKAmWxsIG1vZGlmeSB0aGVzZSBhYm92ZQ0KDQo+PiAN
Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbXB1L21tLmMgYi94ZW4vYXJjaC9hcm0vbXB1
L21tLmMNCj4+IGluZGV4IDllYWIwOWZmMjA0NC4uNDBjY2Y5OWFkYzk0IDEwMDY0NA0KPj4gLS0t
IGEveGVuL2FyY2gvYXJtL21wdS9tbS5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vbXB1L21tLmMN
Cj4+IEBAIC04LDYgKzgsOCBAQA0KPj4gI2luY2x1ZGUgPHhlbi9zaXplcy5oPg0KPj4gI2luY2x1
ZGUgPHhlbi90eXBlcy5oPg0KPj4gI2luY2x1ZGUgPGFzbS9tcHUuaD4NCj4+ICsjaW5jbHVkZSA8
YXNtL21wdS9tbS5oPg0KPj4gKyNpbmNsdWRlIDxhc20vc3lzcmVncy5oPg0KPj4gDQo+PiBzdHJ1
Y3QgcGFnZV9pbmZvICpmcmFtZV90YWJsZTsNCj4+IA0KPj4gQEAgLTI2LDYgKzI4LDM1IEBAIERF
Q0xBUkVfQklUTUFQKHhlbl9tcHVtYXBfbWFzaywgTUFYX01QVV9SRUdJT05fTlIpIFwNCj4+IC8q
IEVMMiBYZW4gTVBVIG1lbW9yeSByZWdpb24gbWFwcGluZyB0YWJsZS4gKi8NCj4+IHByX3QgX19z
ZWN0aW9uKCIuZGF0YS5wYWdlX2FsaWduZWQiKSB4ZW5fbXB1bWFwW01BWF9NUFVfUkVHSU9OX05S
XTsNCj4+IA0KPj4gKyNpZmRlZiBDT05GSUdfQVJNXzY0DQo+PiArLyoNCj4+ICsgKiBUaGUgZm9s
bG93aW5nIGFyZSBuZWVkZWQgZm9yIHRoZSBjYXNlIGdlbmVyYXRvcnMgR0VORVJBVEVfV1JJVEVf
UFJfUkVHX0NBU0UNCj4gSXQncyByZWFkIGEgYml0IG9kZC4gUGVyaGFwcyByZW1vdmUgJ2dlbmVy
YXRvcnMnIHdvcmQgYW5kIHVzZSAnY2FzZXM6Jw0KDQpvaw0KDQo+PiANCj4+IA0KPj4gKyNpZmRl
ZiBDT05GSUdfQVJNXzY0DQo+PiArLyoNCj4+ICsgKiBBcm12OC1SIHN1cHBvcnRzIGRpcmVjdCBh
Y2Nlc3MgYW5kIGluZGlyZWN0IGFjY2VzcyB0byB0aGUgTVBVIHJlZ2lvbnMgdGhyb3VnaA0KPj4g
KyAqIHJlZ2lzdGVycywgaW5kaXJlY3QgYWNjZXNzIGludm9sdmVzIGNoYW5naW5nIHRoZSBNUFUg
cmVnaW9uIHNlbGVjdG9yLCBpc3N1aW5nDQo+IHMvcmVnaXN0ZXJzLC9yZWdpc3RlcnM6LyBhbmQg
cGVyaGFwcyB1c2UgYnVsbGV0IHBvaW50cw0KPiANCj4+ICsgKiBhbiBpc2IgYmFycmllciBhbmQg
YWNjZXNzaW5nIHRoZSBzZWxlY3RlZCByZWdpb24gdGhyb3VnaCBzcGVjaWZpYyByZWdpc3RlcnM7
DQo+PiArICogaW5zdGVhZCBkaXJlY3QgYWNjZXNzIGludm9sdmVzIGFjY2Vzc2luZyBzcGVjaWZp
YyByZWdpc3RlcnMgdGhhdCBwb2ludHMgdG8NCj4+ICsgKiBhIHNwZWNpZmljIE1QVSByZWdpb24s
IHdpdGhvdXQgY2hhbmdpbmcgdGhlIHNlbGVjdG9yIChpbiBzb21lIGNhc2VzKSBhbmQNCj4gV2hh
dCBkbyB5b3UgbWVhbiBieSAiaW4gc29tZSBjYXNlcyI/DQoNCndoYXQgSSBoYWQgaW4gbWluZCB3
YXMgdGhhdCBldmVudHVhbGx5IHlvdeKAmWxsIG5lZWQgdG8gY2hhbmdlIHRoZSBzZWxlY3RvciBh
dCBzb21lIHBvaW50LA0KbGlrZSBhcm02NCBldmVyeSAxNiByZWdpb25zIG9yIG9uIGFybTMyIGZy
b20gcmVnaW9uIDMyIG9ud2FyZHMsIGJ1dCBtYXliZSBJIGNhbiBzaW1wbGlmeQ0KYW5kIHJlbW92
ZSB0aGlzIHBhcnQuDQoNCj4gDQo+PiArICogaXNzdWluZyBiYXJyaWVycyBiZWNhdXNlIG9mIHRo
YXQuDQo+PiArICogRm9yIEFybTY0IHRoZSBQUntCLEx9QVJfRUx4IChmb3Igbj0wKSBhbmQgUFJ7
QixMfUFSPG4+X0VMeCwgbj0xLi4xNSwgYXJlIHVzZWQNCj4gSWYgZm9yIG49PTAgeW91IHVzZWQg
KCksIHdoeSBub3QgZm9sbG93aW5nIHRoZSBzYW1lIHN0eWxlIGZvciAxLi4xNT8NCj4gSXQgYWxs
IGltcHJvdmVzIHJlYWRhYmlsaXR5IG9mIHN1Y2ggbG9uZyBjb21tZW50cy4NCj4gDQo+PiArICog
Zm9yIHRoZSBkaXJlY3QgYWNjZXNzIHRvIHRoZSByZWdpb25zIHNlbGVjdGVkIGJ5IFBSU0VMUl9F
TDIuUkVHSU9OPDc6ND46biwgc28NCj4+ICsgKiAxNiByZWdpb25zIGNhbiBiZSBkaXJlY3RseSBh
Y2Nlc3Mgd2hlbiB0aGUgc2VsZWN0b3IgaXMgbXVsdGlwbGUgb2YgMTYsIGdpdmluZw0KPiBzL2Fj
Y2Vzcy9hY2Nlc3NlZC8NCj4gcy9pcyBtdWx0aXBsZS9pcyBhIG11bHRpcGxlLw0KDQpvayBhbGwg
dGhlIGFib3ZlDQoNCkNoZWVycywNCkx1Y2E=

