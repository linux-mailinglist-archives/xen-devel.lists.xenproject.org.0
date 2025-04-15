Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F18BA89F0D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 15:11:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953918.1348309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4g4J-00056d-AV; Tue, 15 Apr 2025 13:11:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953918.1348309; Tue, 15 Apr 2025 13:11:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4g4J-00053K-71; Tue, 15 Apr 2025 13:11:15 +0000
Received: by outflank-mailman (input) for mailman id 953918;
 Tue, 15 Apr 2025 13:11:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JN3i=XB=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u4g4H-0004Z7-Eb
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 13:11:13 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 190d980e-19fb-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 15:11:11 +0200 (CEST)
Received: from DU2PR04CA0302.eurprd04.prod.outlook.com (2603:10a6:10:2b5::7)
 by DU0PR08MB9462.eurprd08.prod.outlook.com (2603:10a6:10:42e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 13:10:59 +0000
Received: from DB5PEPF00014B9C.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::93) by DU2PR04CA0302.outlook.office365.com
 (2603:10a6:10:2b5::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Tue,
 15 Apr 2025 13:10:59 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9C.mail.protection.outlook.com (10.167.8.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Tue, 15 Apr 2025 13:10:59 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 DU0PR08MB7640.eurprd08.prod.outlook.com (2603:10a6:10:31b::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.36; Tue, 15 Apr 2025 13:10:26 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 13:10:25 +0000
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
X-Inumbo-ID: 190d980e-19fb-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=y3SgDthTN8yHp4UGMmp7KDUX38w2CFuW4/n7uAiqeHwzmj91XuYI7a/HTmQXH2FEgPBl5LAqtc3S3PlBJacZdof30UVz0G3OqMVm/A6V1narFmNZfudXLZgH/69IsbjkgJooGZ0gT4OsQ0dWVrutB7K0+oy15wRvmIq4h0pdQFlIypUnqnf1mxUvTTSHakeGfDlcyymYsqVx4dRhsAICk/kkH3TAIoOJuSxcvKPYbdULLRaI/+/ZaT8K/hx1za9/BO2hQvFdOIa8oz2kQNfUJaph7U7AvvzxuviqoJmIH7wA+MN8tSrdRdXcLKnRhJRyo/hsZA5uWwplZPA3GgEMvA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHGK4CiB/aVaVHQboabuIt3SWAUuYctdwyk/zvUe9T8=;
 b=ADMFRoCIcgKG4Dwv82/Kgu5b2LMzBd6rFt9zUU2w/RbSKR8mMMqEOaFIUaIFgDo3IZXFXRft9x255PlU3dZRuUG7WPyHID86znWoKiHF6RkwUKmm1eyndcmwx+QkSQ9Z4pjiOmje9tRKE9TfElZV6PtRhIYaCKFwSidRIbhfadQ6h27U1VGg/XcX0QS6Y4mimuf9lS1dmeL5dhYS5w/zvVrd2WWA8s22B524BdxbdDbmf4SsrRwIrQ6lndgflyxB8aQNIeI2pAtXbaQ0ZC5zMK1GtmiEJz9cV9fiq6/3c7JfmVTpejw8qmodTCFaCEKLQYnKADpnaPj5NfU8vMHjZA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHGK4CiB/aVaVHQboabuIt3SWAUuYctdwyk/zvUe9T8=;
 b=BClhY4OFDQWpNhg/Npz3trv/tqmarW1gb26EBdlRxNuyKk8LXQqvTa6OZB6r4QCnZtP2XLf66+VRD3QOOo3DZDlkkOcDJL0pYceRjlr04FCGgun+1h6MDTlZFP/HU/+zIk/k5HynoEH+nTU+2Dmadtm+eoZCUda7CLdZWWt69/w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tsSOeCGVk1LDfSoffxwlE7v/Qty+5hcQLmguyilrNFKmwHIFaelMe7Hx6czwgiisLX7lzqhlf0p5ZMGd3kE7r3hXiuikRVMSN5yiYdym0g9+It5euKyIPU82G36bCU7ZLEzeXKJ87Vm5dKii1UG2kErVfCaQxAC3/ZHnrjoQAMK9uZWxmvfNQQL0p4511QA14Mn4M3oftdXWclVCwXQXpYwbqJUib9zGLIX/DGl1erhLygD5Lgjt33N5UlBk+zlUQ/88yRjwuHCigWIZ24Dg7DWBOFHSfE88NBHSDkZxoXySLRy6wBnq5ptt9Copj72FEJYrMV9gNL15VhgjEfJGyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHGK4CiB/aVaVHQboabuIt3SWAUuYctdwyk/zvUe9T8=;
 b=AFliD+wcdhQwBvU6oE/GGhI+eXx4yqrynTGU4Z1IinI/bx1ujZ/FM6NCO9ko6Jo7PRhHyKSrUgjKembkJU08HZh/vecxznAh0s6/xM8H3We64I3OWeWPf5xVdlYsbCMdBOuXySQwRVUvARAIaayQyS3F6yI0C5zToCej0msKwyQI1SqJ01MP3Edi/tRol1UvBeD7rQBwGKZ/MO9WzMsxBMfyid0qPFM0FuM08/zQ6AlswSw2w4DLKX7IY2Vzz68Yet+ty2dIqoRL+5qF2xqIoKNXYgbItr1nI0FGsFzlMEq47pT0IuxKesKN/1w+iqeCVIuIpLp++iC7rrUdWqF0Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHGK4CiB/aVaVHQboabuIt3SWAUuYctdwyk/zvUe9T8=;
 b=BClhY4OFDQWpNhg/Npz3trv/tqmarW1gb26EBdlRxNuyKk8LXQqvTa6OZB6r4QCnZtP2XLf66+VRD3QOOo3DZDlkkOcDJL0pYceRjlr04FCGgun+1h6MDTlZFP/HU/+zIk/k5HynoEH+nTU+2Dmadtm+eoZCUda7CLdZWWt69/w=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, "Orzel, Michal"
	<michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: Xen Armv8-R booting protocol
Thread-Topic: Xen Armv8-R booting protocol
Thread-Index: AQHbrf9eNLQ3I8ChLUu7y92fKMnf87OksnaAgAAA54A=
Date: Tue, 15 Apr 2025 13:10:25 +0000
Message-ID: <A2ADAFDE-5936-4F87-9D71-549D68256AA4@arm.com>
References: <F10A37DE-4F3B-4A18-BAB7-B95616516A2A@arm.com>
 <181e7bd1-c286-4e81-ad34-d7c048497d0c@amd.com>
In-Reply-To: <181e7bd1-c286-4e81-ad34-d7c048497d0c@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|DU0PR08MB7640:EE_|DB5PEPF00014B9C:EE_|DU0PR08MB9462:EE_
X-MS-Office365-Filtering-Correlation-Id: eba16644-ea85-434e-3f87-08dd7c1ef702
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?eDdsR0FXNFFVbXl1Z1Rtbk5WUDlkZjNBNmMvR0dUZ0VQMktBYlVndG1LcVhS?=
 =?utf-8?B?V2Z4b1FTMkNseVpjV05wRkhwdXNlblVoWkFJSXVibGlCZi9YN0RwQ0VoRWhD?=
 =?utf-8?B?bUhXbjk0dWFGbjFZdlpDTGlDL0w2Q3hDSHBHajN0YTAxOWZFUmdxdDBhYXJ0?=
 =?utf-8?B?UFlyQW1pRWRWQXlMV3dNMWNLY2krMGFjUXp4bTcxdUJXbUc3K1VlUVhGRWNI?=
 =?utf-8?B?bUxWekljcHB4eml1eFpVWnFCV0ZZOGR0M1JIaFg3ekVOQU9ydjJjbE9tWjRR?=
 =?utf-8?B?OXZ4c1VpZnd3UnhEVDZWZHFyZDVqNmtIZlcyQUgrWFRScmlLVzlQU08zb1NH?=
 =?utf-8?B?TGw0WlpCVjlGZ3dKZGRRQzFGeUgzWGFWbFhHV1hqZEMwdkJiUWJKNWRwWHZj?=
 =?utf-8?B?RFYxd3pHVldIUnQyTWYrc0drYXg0WHBHbHpiTmR3bzNKMnh0cy9LWWlpdXlF?=
 =?utf-8?B?S09vZ1JFN1FoRTN5aExXNS9jYUptMHY1RVdicHlVazNQaXhDU3d3dk9aaVhy?=
 =?utf-8?B?STE3a0c4ZWt0UCt6ZE13aExBT2tUOE4vTGQzd1ozdWUrMjRseUdpSWJHMkZk?=
 =?utf-8?B?bWY5cEloeVJFclVtSEUya0FPWVdqTjQrSDVDYXJ5dy9MNGJXOHdwdWI0NE91?=
 =?utf-8?B?NnhhV1JHZTNlYm1xaGxjcVJIaDR1bXFGTUNuZHdOWkdLMFA3Wlp3R1ZBZDZL?=
 =?utf-8?B?U2QwbkRRQ0RlOEdXdlduTDhtUzA2NUY5eUc2VmIwcXh6dUVqMEJNMWhaNEpE?=
 =?utf-8?B?OGlaUmVYK1NjOEhJUE1zakpwaGF1aVhXS2liSXlYT1FtNDFadzdwcXdHRFly?=
 =?utf-8?B?c0laWlA4MWpZUFdMWWZXcittN0JMZ1ZWRDhscDd1MlhHOUFMR3Nhb1c3NmJG?=
 =?utf-8?B?UWdINWVBTFg3TXhxR3hjemR1VWhIVDRQY0hrNk9XNnRPQ3lPdGMxTjFKcXJS?=
 =?utf-8?B?cWJKWWJLN2JIRjh4bDE5QXp3UjVrS1ZoaWluRm5oR1Q3UUM2Z21hV1lCNDZz?=
 =?utf-8?B?T3doRExUZ3RCMUt2czBYVnAvZmV0NUUyY3dRbXRQajhGTmF3TWVSZXhheVcv?=
 =?utf-8?B?WlFBNisvS2FYK2VRZGd1STlKUlVydkhYSytuUEU4NTh0aFd3R0ZkdkMwWTlo?=
 =?utf-8?B?VkJzNExhV3NOK1JJNFpZZVlONDQySkZjRzFkd1h1YkJtWFU1b1RyU0UxYU9T?=
 =?utf-8?B?bGcwR25nQUZNZ29JQ0wwS0pvY0NwQ1ZLYk5seFllUUNnbG5Dc0UvTitzVW0v?=
 =?utf-8?B?eTZrUVROVFpKd3BzS3BaTUU0bG80aEt6TkFIKzNnOENUejZFbkE4dk52KzNZ?=
 =?utf-8?B?d1hwU3RoT3BVZ3VhdzZGZlBRcHBpSE5UUTE1cTdlYkd5RkpIRmlHOGNjRVh1?=
 =?utf-8?B?VnZQUzBQSFFtSVI2MTE1dndqWlM5eTE2V3VZenAvWjlnSUg3MHpQOGtXbDUz?=
 =?utf-8?B?b3pWU1NuK0hCMW0yZmlrOU1Bd2hZaVJKYWMyZE5taUdmUUplZWxJamw2clNX?=
 =?utf-8?B?SmVQaERuMkVVcnBlUDFGUTRWa0JhVmlpRWhGdTFzaWVDenZCSC92WS8ydmNz?=
 =?utf-8?B?MElXZFFuMzMzQmt6SkU1STl5NC9nUm1xZ0ZjQ1NvUlhkZzMzb2tLL3MyNXZS?=
 =?utf-8?B?N0p6Z3NUd25wTTFZU0RNY3RXN2RNd1J6ajdXZm85Z0cxdVF4R0NseUt4WHJ0?=
 =?utf-8?B?WUVHbllLM1AyZm5IMkIvMnQ5NjNzMlJkMUZ0QmNCeFJJWTVXa2V6dzVQWUYx?=
 =?utf-8?B?bmt0Q0RGMUJqRkdKNk95WmREazE3VmZoOEs3bFZBK1FNY3VGNVBBY2MzOWU4?=
 =?utf-8?B?aUI1SWVORG1odDhjbThCMHZ4aXplYkYrbEVzajZVaCtqMWY1ZGNIa0dUMjlX?=
 =?utf-8?B?U2VtZnlTeUxaSTVaMHJiNW9OUi9YZ3NCaFpCcFZkZHUxRHh4WVF5TTlMSSt0?=
 =?utf-8?B?WENZTmhYTjhNd2dQVlZQOXZxdkhPZzkyWVRkZVBVQzZkZjBrVWNKTlhGQzNN?=
 =?utf-8?Q?zjnHATHEdazlXoFE3bUe110ECqTZYw=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D6F2E26A3199B43B405B65444DF1F3E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7640
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	92e66cf7-3123-4ada-970b-08dd7c1ee332
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|35042699022|36860700013|82310400026|14060799003|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UVpjcUlyR0FPSnpLaVBIQVEvNHk5Wlk1K01OSDVkM3FJKzlMTHVCUDV5U0du?=
 =?utf-8?B?Y3IxVUpVN1ZpMlNvcDZkaXhBaDBEL0JSV3IwNVFBNU0rZmUyaVBGbU1lR3RD?=
 =?utf-8?B?OVNHR0tPYlF4ejk3WCtmNEdmek1OTDA4eU4vaUNNVStWZTJQRXhJZCtlRU45?=
 =?utf-8?B?L05Ga0htREYvOTF5dXJVM2RxQStFSnNjZEZyR01MeThkZy9ZYVkvK3BLdklN?=
 =?utf-8?B?UDZ3bUJPSjNDTkRIbXFVVWl5dWlLMHJsS2VnRlpTbXVWQnBSd3h1LzRqY1lp?=
 =?utf-8?B?ekxCeSt3Wkt3aG11NU5DVitEOVpyQWtxQlRHNkp2Q0M0dW9adGhmYy9pVktW?=
 =?utf-8?B?Z0s5bDZUQzd1SlZ0ZnpiQXFncWk3MlF6QnF4UzRhUlhQNTNnOUZBZVBvQzcv?=
 =?utf-8?B?Z2NRWC9BNUYxYnFPL3ZzV2VGZ29TWU50QjZCK1BBSGorYmxpbEtXeStzMzlu?=
 =?utf-8?B?QVhCMyszNVBoKzJhekd5TXE0cUhnY0hxSll4d0x0aVlGaXZQc2tVL25lT3Na?=
 =?utf-8?B?bTlTcEdBL0FnWVN1TzN2aElvdmNJT29zWmxsWDlubmVtMVZCWkRkN0k2NzFJ?=
 =?utf-8?B?bnhpQXFWejVhYlFvdlFRSnZBa2hkdkUwWTFFS2JkU1dHRnNNUGFhVkYrUkJF?=
 =?utf-8?B?VjdpN1pJYm16a09kNGYySWo4SUFjR3lFbG1Ea0dYNDEwNDdSa0VUWER2VmZj?=
 =?utf-8?B?MkxoSC9CaDMyU05DYVJSZXJzbk5UVEE3ZWZraWRkUDFnSlpxaTluT2dGc0dD?=
 =?utf-8?B?c3VZN1c1S3dRcjRONjArbngxNWw1T2UzbllDRmRwS3hjeElwbDdFcVkxRUhW?=
 =?utf-8?B?eVF5WWs4QS9ZOXl3elFQRHo1VlM4YnlGc2xnOHFwMDlFRjZFN0ZCeGVJVjBC?=
 =?utf-8?B?am5mNDFWaTRuejl1a0VYTGJQVEFKaXMzUnBBMndBaEl6ZjRVZDU0K0U2b1FM?=
 =?utf-8?B?cStyWFo3SkZpSi9HbytGa2hRVTFRNTk1VjJHeTNTNDdXVEdGQVM3TXgydnE0?=
 =?utf-8?B?UWVkMHpNQzU5THhMOCtGdE4xUWxWMGlRS2hMa0Z0eCs1UEtnRWJaK0R4MGFU?=
 =?utf-8?B?QTloQVlERVFNSnZkNVRwaExqMFZIU3NSWlJnS3dCcm1EWloxNmZZTkQ5ZGdQ?=
 =?utf-8?B?cnV4VkgxeE9PRmlGcVdpclJHeVY2bGVnMEZaS2duUnAwTmN4TjcyZSt1RFRP?=
 =?utf-8?B?N0RPbGJYVDNLQVZKdmlFQ29JcnUySGllZkpiK2RzQXB1KzVDSlpjN25mTGts?=
 =?utf-8?B?UDVWc21abzF5d1EvV29VbEtCMVNoSWxmM0NhL3c2Wm5XNi9xM1VkSnNRTkZl?=
 =?utf-8?B?bWpGKzRmR2VqMVZiV2h5U3R2NTlNcmluZFdjaXdhYlZiZ1BQaThUYmtJbktB?=
 =?utf-8?B?L3lKKzRBcjZhakdOQXBPZC9EYmlYRm1YRjJWSmVZWFVqRzMrbllqeDE4eFVi?=
 =?utf-8?B?YXljdlRHQmlWdnVJNGZtbHV3R1JjaHZ5cFkzaUJNWVU4TWlYRmdWeHhwbmg1?=
 =?utf-8?B?bzQ1djBuYklIUXAyaWpnZUlWc1FpR1ZNK2hyeGQzMVBjeXZMYUxBUE83T1k2?=
 =?utf-8?B?UGlPS0VQZEpCcHBMQVByVEhLS0tVNEpMV040c0hlaDlPWDZhdUJhWFFGYTZz?=
 =?utf-8?B?S3NLeExwYWRVNDlrekhQOVMwRGhhNmlVNmJ5Y0h1ekpVZFlzNGFQdUo1RGVv?=
 =?utf-8?B?MnVZWFh0TVQyYmNoTmdVb0w5Qkg5Q2lMNEJKL3ZSbW5LaEw1TUlZaDVZSGtk?=
 =?utf-8?B?N0RoVGp4ck1UdEN3Z1pWZlpLcFBDVkE1RkJGM21nNFFEYWtiNXMyTmYxdVRJ?=
 =?utf-8?B?WXdaMGVPUFhZaHc5NFl1ZmtlT3cvMUF4cisydkpXK2owSDBsb1VHTWVPdEd3?=
 =?utf-8?B?YWpHb0k1WW1SWDI2WVlTVzh3Y3RSdkI1MHJmQlI2Ty9mTmhhTHptalpEUTBi?=
 =?utf-8?B?bWdYblV2YzkrSkRvOHc1aUVMcXNDM083SmNvM2pHMUJvb2VJL0R6TEorY0Jh?=
 =?utf-8?B?R0JDYTM1UXBGMkxmbUcybjRjVmg3QjFoNEowQmJFdGhxeEtUNFh3dGYvdm96?=
 =?utf-8?B?WWpQbG1qdGtuSUFWZUxuNjJKei9oYzQ2R2FIUT09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(35042699022)(36860700013)(82310400026)(14060799003)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 13:10:59.0523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eba16644-ea85-434e-3f87-08dd7c1ef702
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9462

SGkgQXlhbiwNCg0KPiBPbiAxNSBBcHIgMjAyNSwgYXQgMTQ6MDYsIEF5YW4gS3VtYXIgSGFsZGVy
IDxheWFua3VtYUBhbWQuY29tPiB3cm90ZToNCj4gDQo+IA0KPiBPbiAxNS8wNC8yMDI1IDEzOjEw
LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gSGkgYWxsLA0KPiBIaSBMdWNhLA0KPj4gDQo+PiBJ
4oCZdmUgc3RhcnRlZCB0aGlzIHRocmVhZCB0byB0YWxrIGFib3V0IGEgcG9zc2libGUgWGVuIGJv
b3RpbmcgcHJvdG9jb2wgd2hlbiBydW5uaW5nIG9uIEFybXY4LVIsDQo+PiBjdXJyZW50bHkgWGVu
IHVzZXMgdGhlIExpbnV4IGJvb3QgcHJvdG9jb2wgYW5kIHNvbWUgb3RoZXIgcmVxdWlyZW1lbnRz
IHN0YXRlZCBpbiBkb2NzL21pc2MvYXJtL2Jvb3RpbmcudHh0Lg0KPj4gDQo+PiBVbmZvcnR1bmF0
ZWx5IHdlIGRvbuKAmXQgaGF2ZSBhbnl0aGluZyBhbHJlYWR5IGF2YWlsYWJsZSBmb3IgQXJtdjgt
UiwgdGhlIG9ubHkgaW1wbGVtZW50YXRpb24gb2YgYSBib290bG9hZGVyDQo+PiBpcyB0aGUgYm9v
dC13cmFwcGVyLWFhcmNoNjQgd2hpY2gga2VlcHMgdGhlIE1QVSBvZmYsIEkvRCBjYWNoZSBvZmYu
DQo+PiANCj4+IFNvIG15IHByb3Bvc2FsIGlzIHRvIGFkZCBhZGRpdGlvbmFsIHJlcXVpcmVtZW50
cyBpbiBvdXIgZG9jcy9taXNjL2FybS9ib290aW5nLnR4dCBmb3IgdGhlIGNhc2Ugd2hlcmUgWGVu
IGlzDQo+PiBzdGFydGVkIG9uIEFybXY4LVIsIHVuZGVyICJGaXJtd2FyZS9ib290bG9hZGVyIHJl
cXVpcmVtZW50c+KAnS4NCj4gVGhpcyBtYWtlcyBzZW5zZS4NCj4+IA0KPj4gZGlmZiAtLWdpdCBh
L2RvY3MvbWlzYy9hcm0vYm9vdGluZy50eHQgYi9kb2NzL21pc2MvYXJtL2Jvb3RpbmcudHh0DQo+
PiBpbmRleCAyMWFlNzQ4MzdkY2MuLjM5ZjAyOTE1M2UzOCAxMDA2NDQNCj4+IC0tLSBhL2RvY3Mv
bWlzYy9hcm0vYm9vdGluZy50eHQNCj4+ICsrKyBiL2RvY3MvbWlzYy9hcm0vYm9vdGluZy50eHQN
Cj4+IEBAIC02Miw2ICs2MiwxNCBAQCBYZW4gcmVsaWVzIG9uIHNvbWUgc2V0dGluZ3MgdGhlIGZp
cm13YXJlIGhhcyB0byBjb25maWd1cmUgaW4gRUwzIGJlZm9yZSBzdGFydGluZw0KPj4gICAgKiBU
aGUgYml0IFNDUl9FTDMuSENFIChyZXNwLiBTQ1IuSENFIGZvciAzMi1iaXQgQVJNKSBtdXN0IGJl
IHNldCB0byAxLg0KPj4gICtXaGVuIFhlbiBydW5zIG9uIEFybXY4LVIsIHRoZSBoaWdoZXN0IGV4
Y2VwdGlvbiBsZXZlbCBpcyBFTDIgYW5kIHRoZSBvbmx5DQo+PiArYXZhaWxhYmxlIG1vZGUgaXMg
c2VjdXJlLCBoZW5jZSB0aGUgYWJvdmUgcmVxdWlyZW1lbnRzIG5lZWRzIHRvIGJlIGFkanVzdGVk
IHRvDQo+PiArdGhpcyBjYXNlOg0KPj4gKw0KPj4gKyogWGVuIG11c3QgYmUgZW50ZXJlZCBpbiBT
IEVMMiBtb2RlLg0KPiANCj4gUmVmZXIgQVJNIERESSAwNTY4QS5jIElEMTEwNTIwIEExLjMuMQ0K
PiANCj4gQXJtdjgtUiAoQUFyY2gzMikgb25seSBzdXBwb3J0cyBhIHNpbmdsZSBTZWN1cml0eSBz
dGF0ZSwgTm9uLXNlY3VyZS4NCj4gDQo+IEkgc2VlIHRoYXQgaXQgZGlmZmVycyBmcm9tIEFybXY4
LVIgKEFBcmNoNjQpIEFSTSBEREkgMDYwMEEuZCBJRDEyMDgyMSwgQTEuMw0KPiANCj4gVGhlIFBF
IGlzIGFsd2F5cyBpbiBTZWN1cmUgc3RhdGUuDQo+IA0KPiBQcm9iYWJseSB5b3UgY2FuIG1lbnRp
b24gYm90aC4NCg0Kb2ssIHRoZW4gaXQgc2hvdWxkIGJlIFMvTlMgRUwyLg0KDQo+IA0KPj4gKw0K
Pj4gKyogWGVuIG11c3QgYmUgZW50ZXJlZCB3aXRoIE1QVSBvZmYgYW5kIGRhdGEgY2FjaGUgZGlz
YWJsZWQgKFNDVExSX0VMMi5NIGJpdCBhbmQNCj4+ICsgIFNDVExSX0VMMi5DIHNldCB0byAwKS4N
Cj4+ICAgIFsxXSBsaW51eC9Eb2N1bWVudGF0aW9uL2FybS9ib290aW5nLnJzdA0KPj4gIExhdGVz
dCB2ZXJzaW9uOiBodHRwOi8vZ2l0Lmtlcm5lbC5vcmcvY2dpdC9saW51eC9rZXJuZWwvZ2l0L3Rv
cnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vYXJjaC9hcm0vYm9vdGluZy5yc3QN
Cj4+IA0KPj4gUGxlYXNlIGxldCBtZSBrbm93IHlvdXIgdGhvdWdodHMuDQo+IA0KPiBBIHF1ZXN0
aW9uLCBEbyB5b3Uga25vdyBpZiB1LWJvb3QgKG9yIGFueSBvdGhlciBib290bG9hZGVyKSBpcyBz
dXBwb3J0ZWQgb24gQXJtdjgtUiA/IEJlY2F1c2Ugc29tZW9uZSBuZWVkcyB0byBwYXNzIHRoZSBE
VEIgYWRkcmVzcyBpbiByMi94MC4NCg0KQXMgZmFyIGFzIEkga25vdywgbm8gb3RoZXIgYm9vdCBs
b2FkZXIgaXMgc3VwcG9ydGVkLCB3ZSBoYWQgcGF0Y2hlcyBmb3IgdS1ib290IGVuYWJsaW5nIE1Q
VSBhdCBFTDIgYnV0IHRoZXkgd2VyZSBub3QgbWVyZ2VkLg0KDQpJ4oCZbSBjdXJyZW50bHkgYnVp
bGRpbmcgWGVuIHdpdGggdGhlIGRldmljZSB0cmVlIGVtYmVkZGVkLg0KDQpDaGVlcnMsDQpMdWNh
DQoNCg==

