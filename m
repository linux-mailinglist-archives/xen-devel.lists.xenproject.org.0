Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A86EC9EF3A
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 13:16:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176710.1501172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQlmR-00012N-VY; Wed, 03 Dec 2025 12:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176710.1501172; Wed, 03 Dec 2025 12:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQlmR-0000zu-SW; Wed, 03 Dec 2025 12:16:23 +0000
Received: by outflank-mailman (input) for mailman id 1176710;
 Wed, 03 Dec 2025 12:16:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PcFb=6J=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vQlmQ-0000zo-Ch
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 12:16:22 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddf6d0bf-d041-11f0-980a-7dc792cee155;
 Wed, 03 Dec 2025 13:16:16 +0100 (CET)
Received: from AS4P191CA0047.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::22)
 by PAWPR08MB10044.eurprd08.prod.outlook.com (2603:10a6:102:362::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 12:16:09 +0000
Received: from AM1PEPF000252DD.eurprd07.prod.outlook.com
 (2603:10a6:20b:657:cafe::f0) by AS4P191CA0047.outlook.office365.com
 (2603:10a6:20b:657::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Wed, 3
 Dec 2025 12:16:07 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DD.mail.protection.outlook.com (10.167.16.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Wed, 3 Dec 2025 12:16:09 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by GV2PR08MB9253.eurprd08.prod.outlook.com (2603:10a6:150:e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 12:15:06 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::b27c:9593:1074:949d]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::b27c:9593:1074:949d%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 12:15:06 +0000
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
X-Inumbo-ID: ddf6d0bf-d041-11f0-980a-7dc792cee155
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=P9bd6RMf6CJWWTb/K3WSObgs/u4nBU/sfaNGpwqq+/pBqeBaNPPF4+CA0LUm/u77gTzP2X1EcDJQqQG1+LXPO6Zwv1teVmBj9yXxyPmQTQyU9Gw2aGBGn9Oa5pDbrnF3T8y2bUpIf+5/L2vouqaSPZlk3P7UO2OvF7P+KMaa2zyvbqUvlqvopZSiKheK9zd+bTCgH/k/TyJqXYe3byPYKs58NQHfUYjm44p28HVBzYfbddLq+ewAgsMThihaMUhPH+pMwroyRDXlzOUfqTFdujNNya6wvXojCQl+8801NgSFOQSEThZPmDo9AaZqdIALUUFOO18MQQvEutMgFwUvYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VB7UskeVf7o5DRGGKZLrZbXEy/iwTjAcQ0qV6s8fwfI=;
 b=OHRU/5bJnSdyr2eE1WvUQ/GkuxIozN+VU9Eg8Ebb3LWwYtyDqPFR678EGTY2rEMmdUuSchzVa2gsGWeF6TkfiFxYusVbzyhRrH8zll2NkbhSW8Af8muWP/Q7r1vamFe9+hPQS2Ux8LV1jjQ8TcQSGcPT51PZpe5ge4k96g3jxX3fiRSKq8TruU3Fv6jAq9BVR+B7zN+EoauxZsYSRvpyRlmpncB9hvi9XKhXPMoIP/MnvuvN4dSz28HW9ZcmDqvdBC69bSBMXjQKtHS2Hfl9vZtHqRk3XxMt/MspwBXQZ+DLiKpFO6bftWmqEUh6F75Mx602U5sRtBtqx6s6apowWg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VB7UskeVf7o5DRGGKZLrZbXEy/iwTjAcQ0qV6s8fwfI=;
 b=aZoc+fIG767HaOvEhaqJEaPmSAOMqBrZjQ8mm5VNjkO8XmdWsC0Q8HcPUsJN8rsziRF6OusIi9LUqr5FLM+WlNXl2sdZi1pkh/GK5URNwWF0jM01TC/fGNPjcc8RenoGBB+lkrGo3vUNiBR2vdik3D0cdwSLt1LBcEbdBDllJz4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSaP4j6V2Q6cbrP+eRYD6Hgh1LnqJ4YSyUOvzKoFYXNZy7D+VWlXDEuNJYz+9pVtEV6+/k/jiycdxxIpq+YnQDFElqvRTanp44/MHdDTJSgHMuHQnBmSTUIWB30wJOmPrqPJRnY6U4n1cJ1RB30gw0ONK5TOXQ9aUxt/Rex7WArv9QFGaRONDghW/a7x0+CdjOnfc2bA7oFV2YGLN6nPM8j7Fy/ygHEhGOzA88E05kG6l4C8N4ONDBqe+nD993YVmNE/L93vQf047lPPbJeocbYNRDvF+yr/Vs2Pv9jT5SPHc9wXeCSIKlousGWkaFt7MHhrwMxjGQ5QpgIfQTmv4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VB7UskeVf7o5DRGGKZLrZbXEy/iwTjAcQ0qV6s8fwfI=;
 b=Jeve7LKw0+xtFxQ6fqzRysUszS0MvR9NZXcKt21X+JqDgnFRjf7hpuoWQ02hnpGtJLypZq2tY8UJjI4kTq6ra3Qday29UZUdydFUo2yS/ZFAXjuku0uE5tl61wr92ips720Tf9rhRHMiDagVq4HfK7Vus0u9+9OrJ8RQEVDwu41xU77JaSil93ruTJ5nn5BfG6Ctw8doXVp4P9FcKMpbTJUXwDSGkzI3KVWN3BCYRj/IkqOwQ9Bs0zSTxxJbCH6nU1sBFwAFosRPHvw7wttKOdrmOWvk4+Bx9xi6ph1o+w54kc7Bz+8I9hqUvjK+EC2JxY1dKB2csR+Tvtk+OENgcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VB7UskeVf7o5DRGGKZLrZbXEy/iwTjAcQ0qV6s8fwfI=;
 b=aZoc+fIG767HaOvEhaqJEaPmSAOMqBrZjQ8mm5VNjkO8XmdWsC0Q8HcPUsJN8rsziRF6OusIi9LUqr5FLM+WlNXl2sdZi1pkh/GK5URNwWF0jM01TC/fGNPjcc8RenoGBB+lkrGo3vUNiBR2vdik3D0cdwSLt1LBcEbdBDllJz4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH 04/10] xen/arm: ffa: rework SPMC RX/TX buffer management
Thread-Topic: [PATCH 04/10] xen/arm: ffa: rework SPMC RX/TX buffer management
Thread-Index:
 AQHcX7XuY/AW54zALEuMn1h4iIrvHbUOavEAgAAsagCAAQzjgIAADJGAgAAQAoCAAByhgA==
Date: Wed, 3 Dec 2025 12:15:06 +0000
Message-ID: <928FFDB0-3341-468A-9E0B-0578E3B4BA7C@arm.com>
References: <cover.1764254975.git.bertrand.marquis@arm.com>
 <72d6592157a9ec15d4b5de19751186e0ca1680ba.1764254975.git.bertrand.marquis@arm.com>
 <CAHUa44Gq4L95i3wTMEVRoFNFt2PzPCKGAuF4KT3YL9mfmT2FRA@mail.gmail.com>
 <33EF4249-1F82-4DF5-BCCE-0BCBB0F3D157@arm.com>
 <CAHUa44FQ8bCo5cuVR-JW9om+jEqUA8uZAPAmic9GkwnG-OeE7A@mail.gmail.com>
 <4E39091E-8EFB-4C80-8A1C-FB37B07B8AA3@arm.com>
 <CAHUa44H_nD2ep+q1b2sZy-hJXAtbSmoHCNtaR0ASs1=JoRY2jg@mail.gmail.com>
In-Reply-To:
 <CAHUa44H_nD2ep+q1b2sZy-hJXAtbSmoHCNtaR0ASs1=JoRY2jg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.200.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|GV2PR08MB9253:EE_|AM1PEPF000252DD:EE_|PAWPR08MB10044:EE_
X-MS-Office365-Filtering-Correlation-Id: 5814c906-098f-418a-c3c2-08de3265be08
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?N3ZVT0dSVS9sT3ZXTEo5NWgxTTZZUXBkOHFnbmplOVd2ZDZPVU1UNXBwUHpt?=
 =?utf-8?B?bXpTdmU3YUtNK3ZLeEtKaWloTVhGSTdNT2dDK25RTm1qRGFrRU1kcnhpSm50?=
 =?utf-8?B?aiszWVJWcmNMajA1cHFtb3IxK0VvYkhyZ29YZUdwTUtZNFVCR3FGTkRsZHFW?=
 =?utf-8?B?ZVNxcDhHYTBKVEJmTjBwWlJYeHRSZFBZYWVFT1pVZDI3VGhWeVd1ejZLN3gy?=
 =?utf-8?B?YkkzR3g0ZHc2c1owb08xUHJ0WTVncXZyWTg5RmRJNmFrMW4wdWt2dlBJdEFR?=
 =?utf-8?B?NnBlZnpsR0Fqei92TUNHcXVwVmkwdkVSOUk1Zkt4QUxCZDgvWGN5NkNBYmt4?=
 =?utf-8?B?ck9nenB2cVQ5VGs2RGZ0UGZwNmlQOEVkd3BnckVYbUQ5ekFkRmQzODJHNElB?=
 =?utf-8?B?M2pTYVBCTkdDTWN1aEN0NU5Ca1V6VWhkRmNRNWNZbHNHSDc0eFdFb0xDOW1M?=
 =?utf-8?B?cG1ieXFrRVhVWjVqQ1NMTzRQck9sVitscTlqWTVnRUUySGFLVDM5RGU1bUVI?=
 =?utf-8?B?cjJ0T3A1UTBrKzViTUdnakY5UUFySnQvNnBUUlBpYzZlRWZzREg1RC80UFlY?=
 =?utf-8?B?aFlQRXdPQXZRZVJFQWg1YU1MSlhDVkFQR05pYW4waGc4ZnNHamQvNkpRdTZ1?=
 =?utf-8?B?YXRsenNIa3RKaUJzSW5oNW5kQmZOdnB2U0RQcVJjK0owNHhQMSs5VGdLNkRI?=
 =?utf-8?B?bUlLay9LWGtaQ0RZQmhLUUEvSW4rVjZrcDNJS0tkckE2OUkzMWZOcS9Md0M1?=
 =?utf-8?B?ZURpd2lzVWRLcDhqNTE1SHA4bEcwQnR0UkhZYW1ndUdrV29hdEdHNnRpaEZS?=
 =?utf-8?B?QjdaWmUwQm5tR0pBWmZRMENtMVJ4WFQ5dEVWR0dabU11cVREUFN6aEVZTjE3?=
 =?utf-8?B?MnQybFZwckNTdzFrb3VmbW5UOHE4WS93MDB2MDRSUkQ2OStMeGtESUlFd3lK?=
 =?utf-8?B?eWNSa3ovL2w3ZXJ3NEFVZFhNaGt0RjhVdExBNUVLaUM2R0VsQW9aU1BsL1ZG?=
 =?utf-8?B?a3VjT20wUFRhQ2YybzlndXJZY0Z2UEV3dXdJY1BCZ0hKRStJR2gvSE1kMHdU?=
 =?utf-8?B?RzlxS2I4cWJUdmZLSWxyWjUxWG8xblJZMU81b2dKVHdLZU1wbFYxK1YwcVN0?=
 =?utf-8?B?ckZvV1NBU2RFVzhyRzNtNjUzcG9HMmt2SzBPT3RoYU9HYTRXU0JOd3BpNkRM?=
 =?utf-8?B?cTRBQlIxUkhDR3RCOUhLWEtWcG1yd2R1K1hsVUZlN3BCWmxhWTBiWUJkVjhT?=
 =?utf-8?B?aS9Ba0NaczVsQUptb3Q1VWJwVkM1dW1sbWFCSmp2Uy8xNjBWMTV4dW51UjRO?=
 =?utf-8?B?Mmh4VUpPMm56b29VaHBuZHEwd28wWjQ0Unp4c1RYbDMyaGluUWtaOG1ISDRW?=
 =?utf-8?B?emRhTU1VNW9LVTFwbCtuelBodXBCVUNncTZaQWQ4amh3UWNuakd1OWV2T1JX?=
 =?utf-8?B?azVDTmZ3RVFGajFOQ2tIejU3UnhnS3A5WkMxSi9wNTNDOXYrS1JGTzdRSlFz?=
 =?utf-8?B?ZkIvL0wvQktDalp4TU1zQWhBay9VUFgxOUZjWEJtVFlzbHpoTXZFaWI2UWM3?=
 =?utf-8?B?OHRScXZhY1k1L3FLR2F5N3NhbDlENVVkYi9aMDRBNUFKL3B6elBTTHVDOGkz?=
 =?utf-8?B?dE16QWkxMzBHRWFvMnhpTXY4UlhxQjY2c0g2bTMvOHpQd2dndG51OUlHYStI?=
 =?utf-8?B?MUlKUjMrZEVLVHZCYVU1WGRjZjNkdnlUVE4zbjQwMnpGRUNmRFQzcHJubEV1?=
 =?utf-8?B?SWFRdi8rS3RmYVJHSHQ3ampuZ1FOVks3RVV1MzhGQko4K1V2UTZQRmtQOEo4?=
 =?utf-8?B?MlBZY0hUaUlXRDBOandpWlQ2QmV0Q1lmM1pWTG44U2hkR1FDcGtuY1IzSlNX?=
 =?utf-8?B?djR6a25mYnJpOXFMVXJEQkZZcjlhalJtM2EzN0trakZKR2I1NG0rSTcwdDRu?=
 =?utf-8?B?R2dDSHovUzVxMC9NNFVzTVhSc1BEYmFYSzZ1Tm16RERJc2pock9yVkFQSTVC?=
 =?utf-8?B?S2NTT0Z5aW9OVWZvdmdRbjVNWWFsWmpQQXU2SmN5aU0yS1VQajVxVVppbTg2?=
 =?utf-8?Q?DmvvN6?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D66B00230BAF84B8C6F416E8AB241AD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9253
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6870fb1d-7bdd-4573-c211-08de3265985d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|35042699022|36860700013|1800799024|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1g3MkE3ekhVYVhaK0NhaHdZS2R5dGdOSFJ5cmR0ZWY5RHZiejEvaDRvaUk1?=
 =?utf-8?B?TzlEVUxvVUFLTVBUMkx2WEw1Q3ZiY2U4S2taS0dpbWtzK1ZmZys4NWY0WC9I?=
 =?utf-8?B?TnFidXpMVEFISnhwbGczNmpvZzI5ejc4S2ptbFZEQ2p5QUtiOHVHUGphc1Bn?=
 =?utf-8?B?bkJGUDRLWG9VMVcwN3c1OVB6ZVpKREFlb2Z3VkQvMG9UMmgzVFNESXFHOHV1?=
 =?utf-8?B?Z3d3czZmL0VLNVoybEFEUGx0N2MvRm1CeURUNGxnYVVIYkJmK3pXL2pOdlNr?=
 =?utf-8?B?U1htZnpxV0NiS3l5RkR2WjU5Y3VNekhORnZzZHI2ZGN3enpvK2FoYXJoT0d0?=
 =?utf-8?B?bWZMY1RyN3ZxSzJheTNxL3VlWVZiNnF5VEpRQzhiU2N3VTNkVnExeGppaUl0?=
 =?utf-8?B?eGpwdks5N1JOWXozbUtBSHFJUzJvcWNFTFIwU2NWSlAxYVR3aW5oT2VNejR4?=
 =?utf-8?B?ZHpadDE2SnkrVS95R0xFTC9ZdXJ0NXY4TnhtdHB0M0wyVlVaMEIyVU9zRlk3?=
 =?utf-8?B?VllPUVhMazhNZ0QvU1A4OFlhemgzNDI3SnZjUVE3UUFUb0djWW1jOWh1YXc4?=
 =?utf-8?B?dlVMT1JnSW5hcVNjbHNoV2d2UUNkSlNQTERIOGZlQzBYTGR0STg0a0NyeXJl?=
 =?utf-8?B?dWFHRkQ5MmJrV0JNbU90RnZmMTdramhEUndZYXJQNDFEOEt0TnduaW5NUTkz?=
 =?utf-8?B?WGxnRnpvT2hVeityaHNoUU51U1hzaGpSK0lqTmduaDd2K1llc1MrbnZKMUtq?=
 =?utf-8?B?NWE3ck51dHVsWEZWM3Jya1hwaVZxTTRBYzYwVWpOeUlqWldnUGZwN3BiSFVY?=
 =?utf-8?B?Z0tTSTJRc21vb3BVdW9IZkZGRW9rU0t0TmFhRmRDM004N2hLR3g5Y244RUdp?=
 =?utf-8?B?VDFKRHQ2WE5YREQwWm1kSS9xZUxLK3NZQUhENEMyRmJtRTMxa0VMdEV1VnVi?=
 =?utf-8?B?bWxZQXIxK01pMDM1VjhUYXdlamg3V1VkMzFaWE4xeVd1cW1rQ2k1Q0hSaG90?=
 =?utf-8?B?N2FmN1ZhaDNhZStNSldsWHpVbXdHMStzeXRSNi9rQVRPdVFOZC8rcVlhNEs4?=
 =?utf-8?B?QWEzMmYyOXVocStwSlR2STJGTlYwUVpSTlVLVEhzYklSdi9MdjgxZmwwTSt3?=
 =?utf-8?B?U2tBamJjK2dqWkoxc3pWN1BacXNicEg5MTA0d3pOelZVNm1JbkxWbVpSZ1BS?=
 =?utf-8?B?WldPSHVMZTBqYUVEOHFqU0JSUVF4eW85RFREWUc4VzFuYnkvbWpzWHAyQ3lN?=
 =?utf-8?B?emNUQ05yVTdXRzJiUFNOSEpZZ0JBemsrTytDVFlzSElqa0lCWmVaTHVvbXlZ?=
 =?utf-8?B?Z0d6TXFMRjVCVDhOM0YvYldUdzhmRnNONnJnOUF1OEJFZ0tNSm9yb0lHdWpz?=
 =?utf-8?B?ZnJEUmRKdHJicGgrR0REdWdGWTlDMCtOeGJ5dXJmbk54UHAyZmd3bVkwRUVG?=
 =?utf-8?B?MFhPdWNrZU11N3dmazk0UDIvaFBtWWdPVHNTTU5sVXJ4eVlrUHlROE5pVjNW?=
 =?utf-8?B?YnFjelBlTkZUU2JqS2tsQWE3emNYQUJvVzJ0NUVycHVvWmJOMi91VU9BQzJZ?=
 =?utf-8?B?bkhzRUhhVGZURHF0SkJKMlhYTXBBRU9mRWRCQTM1TWdSM2NleFd2aFA2eFZE?=
 =?utf-8?B?cS9KWUNkWWNFS2p5VEE0Qk5ZYy9qYnpZNzg2L0V5dTdaOWwzQlM3dEJib2FT?=
 =?utf-8?B?b0g4WXV6Y3pqT0d6b0JIMnBNR3dZWElLc0tpMjJCRndqVG9NZmpMTmp3enBG?=
 =?utf-8?B?aGE3amhDQWo1Ymo0SndRY0daYzl5WnNiL0M5TWRyUVlreWdCTjg2ZWVPUTFx?=
 =?utf-8?B?RloxM3NidWF2R2twQjQyb29mblhDOGhFUGduRzBtUDNYZUJObTZ6b2ZHOERY?=
 =?utf-8?B?UGdsTU15NENKeTF4czIxOVJTR0RndHdXZkZYSGhLSEo4aUt1cFMvYTh3NGpU?=
 =?utf-8?B?TTgxRFFrR1NYNG1yajBlRFNodUNpVFppU21vRElOUDFaYXI3aDF2NmlFMmNB?=
 =?utf-8?B?ZmRXQ1ZTNUdHb3lxVy9qWVppMjdyMi93Ynl0ajhCV3FhL05ZS24vclVuWVk4?=
 =?utf-8?B?b2VVaThPZ1crRmtON2ZiaHRoNU9JYkErMWhtbHNYRU1JYVlSaE80V1R2WHBB?=
 =?utf-8?Q?s9g8=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(36860700013)(1800799024)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 12:16:09.3530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5814c906-098f-418a-c3c2-08de3265be08
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10044

SGkgSmVucywNCg0KPiBPbiAzIERlYyAyMDI1LCBhdCAxMTozMiwgSmVucyBXaWtsYW5kZXIgPGpl
bnMud2lrbGFuZGVyQGxpbmFyby5vcmc+IHdyb3RlOg0KPiANCj4gSGksDQo+IA0KPiBPbiBXZWQs
IERlYyAzLCAyMDI1IGF0IDEwOjM24oCvQU0gQmVydHJhbmQgTWFycXVpcw0KPiA8QmVydHJhbmQu
TWFycXVpc0Bhcm0uY29tPiB3cm90ZToNCj4+IA0KPj4gSGkgSmVucywNCj4+IA0KPj4+IE9uIDMg
RGVjIDIwMjUsIGF0IDA5OjUwLCBKZW5zIFdpa2xhbmRlciA8amVucy53aWtsYW5kZXJAbGluYXJv
Lm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gSGkgQmVydHJhbmQsDQo+Pj4gDQo+Pj4gT24gVHVlLCBE
ZWMgMiwgMjAyNSBhdCA1OjUw4oCvUE0gQmVydHJhbmQgTWFycXVpcw0KPj4+IDxCZXJ0cmFuZC5N
YXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4+PiANCj4+Pj4gSGkgSmVucywNCj4+Pj4gDQo+Pj4+
PiBPbiAyIERlYyAyMDI1LCBhdCAxNTowOCwgSmVucyBXaWtsYW5kZXIgPGplbnMud2lrbGFuZGVy
QGxpbmFyby5vcmc+IHdyb3RlOg0KPj4+Pj4gDQo+Pj4+PiBIaSBCZXJ0cmFuZCwNCj4+Pj4+IA0K
Pj4+Pj4gT24gVGh1LCBOb3YgMjcsIDIwMjUgYXQgNDo1MuKAr1BNIEJlcnRyYW5kIE1hcnF1aXMN
Cj4+Pj4+IDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4+Pj4+IA0KPj4+Pj4+
IFJld29yayBob3cgWGVuIGFjY2Vzc2VzIHRoZSBSWC9UWCBidWZmZXJzIHNoYXJlZCB3aXRoIHRo
ZSBTUE1DIHNvIHRoYXQNCj4+Pj4+PiBvd25lcnNoaXAgYW5kIGxvY2tpbmcgYXJlIGhhbmRsZWQg
Y2VudHJhbGx5Lg0KPj4+Pj4+IA0KPj4+Pj4+IE1vdmUgdGhlIFNQTUMgUlgvVFggYnVmZmVyIGJh
c2VzIGludG8gZmZhX3J4dHguYyBhcyBmZmFfc3BtY19yeC9mZmFfc3BtY190eCwNCj4+Pj4+PiBw
cm90ZWN0IHRoZW0gd2l0aCBkZWRpY2F0ZWQgZmZhX3NwbWNfe3J4LHR4fV9sb2NrIHNwaW5sb2Nr
cyBhbmQgZXhwb3NlDQo+Pj4+Pj4gZmZhX3J4dHhfc3BtY197cngsdHh9X3thY3F1aXJlLHJlbGVh
c2V9KCkgaGVscGVycyBpbnN0ZWFkIG9mIHRoZSBnbG9iYWwNCj4+Pj4+PiBmZmFfcngvZmZhX3R4
IHBvaW50ZXJzIGFuZCBmZmFfe3J4LHR4fV9idWZmZXJfbG9jay4NCj4+Pj4+PiANCj4+Pj4+PiBU
aGUgUlggaGVscGVycyBub3cgYWx3YXlzIGlzc3VlIEZGQV9SWF9SRUxFQVNFIHdoZW4gd2UgYXJl
IGRvbmUNCj4+Pj4+PiBjb25zdW1pbmcgZGF0YSBmcm9tIHRoZSBTUE1DLCBzbyBwYXJ0aXRpb24t
aW5mbyBlbnVtZXJhdGlvbiBhbmQgc2hhcmVkDQo+Pj4+Pj4gbWVtb3J5IHBhdGhzIHJlbGVhc2Ug
dGhlIFJYIGJ1ZmZlciBvbiBhbGwgZXhpdCBwYXRocy4gVGhlIFJYL1RYIG1hcHBpbmcNCj4+Pj4+
PiBjb2RlIGlzIHVwZGF0ZWQgdG8gdXNlIHRoZSBkZXNjcmlwdG9yIG9mZnNldHMgKHJ4X3JlZ2lv
bl9vZmZzIGFuZA0KPj4+Pj4+IHR4X3JlZ2lvbl9vZmZzKSByYXRoZXIgdGhhbiBoYXJkLWNvZGVk
IHN0cnVjdHVyZSBsYXlvdXQsIGFuZCB0byB1c2UgdGhlDQo+Pj4+Pj4gVFggYWNxdWlyZS9yZWxl
YXNlIGhlbHBlcnMgaW5zdGVhZCBvZiB0b3VjaGluZyB0aGUgVFggYnVmZmVyIGRpcmVjdGx5Lg0K
Pj4+Pj4+IA0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5k
Lm1hcnF1aXNAYXJtLmNvbT4NCj4+Pj4+PiAtLS0NCj4+Pj4+PiB4ZW4vYXJjaC9hcm0vdGVlL2Zm
YS5jICAgICAgICAgIHwgIDIyICstLS0tLQ0KPj4+Pj4+IHhlbi9hcmNoL2FybS90ZWUvZmZhX3Bh
cnRpbmZvLmMgfCAgNDAgKysrKystLS0tLQ0KPj4+Pj4+IHhlbi9hcmNoL2FybS90ZWUvZmZhX3By
aXZhdGUuaCAgfCAgMTggKystLS0NCj4+Pj4+PiB4ZW4vYXJjaC9hcm0vdGVlL2ZmYV9yeHR4LmMg
ICAgIHwgMTMyICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tDQo+Pj4+Pj4geGVuL2Fy
Y2gvYXJtL3RlZS9mZmFfc2htLmMgICAgICB8ICAyNiArKysrLS0tDQo+Pj4gDQo+Pj4gW3NuaXBd
DQo+Pj4gDQo+Pj4+Pj4gDQo+Pj4+Pj4gLXZvaWQgZmZhX3J4dHhfZGVzdHJveSh2b2lkKQ0KPj4+
Pj4+ICt2b2lkICpmZmFfcnh0eF9zcG1jX3J4X2FjcXVpcmUodm9pZCkNCj4+Pj4+PiArew0KPj4+
Pj4+ICsgICAgQVNTRVJUKCFzcGluX2lzX2xvY2tlZCgmZmZhX3NwbWNfcnhfbG9jaykpOw0KPj4+
Pj4gDQo+Pj4+PiBJcyBpdCBpbnZhbGlkIGZvciB0d28gQ1BVcyB0byBjb25jdXJyZW50bHkgdHJ5
IHRvIGFjcXVpcmUgdGhlIFJYIGJ1ZmZlcj8NCj4+Pj4gDQo+Pj4+IE5vIHRoZSBSWCBidWZmZXIg
b3IgdGhlIFRYIGJ1ZmZlciB3aXRoIHRoZSBTUE1DIHNob3VsZCBvbmx5IGJlIHVzZWQgYnkNCj4+
Pj4gb25lIENQVSBhdCBhIHRpbWUgYXMgdGhlcmUgY2Fubm90IGJlIGFueSBjb25jdXJyZW50IG9w
ZXJhdGlvbnMgdXNpbmcgaXQuDQo+Pj4gDQo+Pj4gV2hhdCBpZiB0d28gZ3Vlc3RzIGNhbGwgRkZB
X1BBUlRJVElPTl9JTkZPX0dFVCBjb25jdXJyZW50bHk/IEJvdGggY2FuDQo+Pj4gc3VjY2VlZCBp
biBhY3F1aXJpbmcgdGhlaXIgUlggYnVmZmVyIHNvIHRoZXkgY2FuIGNhbGwNCj4+PiBmZmFfZ2V0
X3NwX3BhcnRpbmZvKCkgY29uY3VycmVudGx5LCBhbmQgdGhlIGFzc2VydCBtaWdodCBiZSB0cmln
Z2VyZWQuDQo+Pj4gV2UgaGF2ZSBhIHNpbWlsYXIgcHJvYmxlbSB3aXRoIEZGQV9SWFRYX01BUF82
NCBhbmQNCj4+PiBmZmFfcnh0eF9zcG1jX3R4X2FjcXVpcmUoKS4gQ29udGVudGlvbiBvbiB0aGUg
c3BpbmxvY2tzIGZvciB0aGUgcnggYW5kDQo+Pj4gdHggYnVmZmVycyBzaG91bGQgYmUgdmFsaWQu
IElmIHdlIGNhbid0IGFsbG93IGEgZ3Vlc3QgdG8gYmxvY2sgaGVyZSwNCj4+PiB3ZSBzaG91bGQg
cmV0dXJuIGFuIGVycm9yIGFuZCBsZXQgdGhlIGd1ZXN0IHJldHJ5Lg0KPj4gDQo+PiBpIGFtIG5v
dCBzdXJlIGkgYW0gZm9sbG93aW5nIGFueW1vcmUuDQo+PiBUaGUgYXNzZXJ0IGlzIGp1c3QgdGhl
cmUgdG8gZW5zdXJlIHRoYXQgdGhlIGxvY2sgaXMgbm90IGFscmVhZHkgdGFrZW4uDQo+IA0KPiBC
dXQgaXQgY291bGQgYWxyZWFkeSBiZSB0YWtlbiBieSBhbm90aGVyIENQVS4NCj4gDQo+PiBUaGUg
ZnVuY3Rpb24gaXMgdGhlbiB0YWtpbmcgdGhlIGxvY2sgYW5kIG5vdCByZWxlYXNpbmcgaXQgdW50
aWwgcmVsZWFzZQ0KPj4gaXMgY2FsbGVkIHdoaWNoIGlzIGVuc3VyaW5nIHRoYXQgb25seSBvbmUg
dmNwdSBhdCBhIHRpbWUgaXMgdXNpbmcgdGhlDQo+PiByeCBidWZmZXIuIERpZCBpIG1pc3Mgc29t
ZXRoaW5nIGhlcmUgPw0KPiANCj4gT25seSBvbmUgQ1BVIGF0IGEgdGltZSBzaG91bGQgdXNlIHRo
ZSBzcG1jIHJ4IGJ1ZmZlciwgYnV0IG90aGVycyBtaWdodA0KPiB0cnkgYW5kIHNob3VsZCBiZSBi
bG9ja2VkIGluIHNwaW5fbG9jaygpIHJhdGhlciB0aGFuIEFTU0VSVC4NCj4gDQo+PiANCj4+IGZv
ciByeHR4IG1hcCB3ZSBkbyBjYWxsIHR4X2FjcXVpcmUgc28gd2UgbG9jayB0aGUgYnVmZmVyLg0K
Pj4gDQo+PiBOb3cgd2UgbWlnaHQgaGF2ZSBhIHJhY2UgY29uZGl0aW9uIGJldHdlZW4gaW4gcnh0
eF9tYXAgYW5kIHVubWFwDQo+PiB3aGVyZSBpIHNob3VsZCB0YWtlIHRoZSByeF9sb2NrIGFuZCB0
aGUgdHhfbG9jayBvZiB0aGUgZ3Vlc3QgdG8gcHJldmVudA0KPj4gY29uY3VycmVudCB1c2FnZSBv
ZiB0aGUgdm0gcnh0eCBidWZmZXIuIEkgd2lsbCBmaXggdGhhdCBvbmUuDQo+IA0KPiBZZXMsIHlv
dSdyZSByaWdodCwgZ29vZCBjYXRjaC4NCj4gDQo+PiANCj4+IFBsZWFzZSB0ZWxsIG1lIGZvciB0
aGUgc3BtYyByeHR4IGJ1ZmZlcnMgYXMgaSBhbSBub3Qgc3VyZSBpIGFtIGZvbGxvd2luZw0KPj4g
d2hhdCB5b3UgbWVhbiB0aGVyZSA6LSkNCj4gDQo+IEVhY2ggZ3Vlc3QgaGFzIGl0cyBvd24gcnh0
eCBidWZmZXIsIHNvIHRoZSBzcGlubG9jayBoZXJlIGlzIGp1c3QgaW4NCj4gY2FzZSB0aGUgZ3Vl
c3QgZGlkbid0IHN5bmNocm9uaXplIGl0cyBDUFVzIGJlZm9yZSBjYWxsaW5nLiBCdXQgdGhlDQo+
IFNQTUMgcnh0eCBidWZmZXJzIGFyZSBmb3IgWGVuLCBzbyBhIGd1ZXN0IGNhbid0IGJlIHN1cmUg
dGhhdCBubyBvdGhlcg0KPiBndWVzdCBpcyBob2xkaW5nIHRoZSBzcGlubG9jay4NCg0KSW4gZmFj
dCBpIGp1c3Qgc2F3IHdoeSB0aGlzIGlzIHdyb25nLiBJIG11c3Qgbm90IHVubG9jayBhdCB0aGUg
ZW5kIG9mIA0Kc3BtY19yeC90eF9hY3F1aXJlIHNvIHRoYXQgb25seSBvbmUgYXQgYSB0aW1lIGlz
IHRha2luZyB0aGUgcnh0eCBidWZmZXJzDQp3aXRoIHRoZSBzcG1jIGFuZCB0aGV5IGJlY29tZSBh
dmFpbGFibGUgb25seSB3aGVuIGN1cnJlbnQgdXNlciBpcyBkb25lLg0KDQo+IA0KPiBUd28gZ3Vl
c3RzIGNhbiBpbmRlcGVuZGVudGx5IGNhbGwgRkZBX1JYVFhfTUFQXzY0IGFuZCB0aGVuIGNhbGwN
Cj4gZmZhX3J4dHhfc3BtY190eF9hY3F1aXJlKCkgbW9yZSBvciBsZXNzIGF0IHRoZSBzYW1lIHRp
bWUuDQo+IA0KPiBJIHlvdSByZW1vdmUgdGhlICJBU1NFUlQoIXNwaW5faXNfbG9ja2VkKC4uLikp
OyIgZnJvbQ0KPiBmZmFfcnh0eF9zcG1jX3R4X2FjcXVpcmUoKSBhbmQgZmZhX3J4dHhfc3BtY19y
eF9hY3F1aXJlKCkgaXQgc2hvdWxkIGJlDQo+IE9LLg0KDQpNeSBjdXJyZW50IGNvbmNsdXNpb24g
d2FzIHRoYXQgaSBuZWVkIHRvIHJlbW92ZSB0aGUgdW5sb2NrIGluIGFjcXVpcmUgc28NCnRoYXQg
aSBzcGluX2xvY2sgaW4gYWNxdWlyZSBhbmQgc3Bpbl91bmxvY2sgaW4gcmVsZWFzZS4NCg0KSW4g
ZmFjdCB0byBwcmV2ZW50IGlzc3VlcyB3aXRoIHJ4dHggdm0gYnVmZmVycywgSSB3aWxsIGFkZCB0
eF9hY3F1aXJlIGFuZCB0eF9yZWxlYXNlDQpmdW5jdGlvbnMgZm9yIHRoZSB2bSB0eCBidWZmZXIg
YW5kIGdpdmUgdGhlIGJ1ZmZlciBhZGRyZXNzIGFuZCBzaXplIGFzIHJldHVybiB0bw0KdGhlIGNh
bGxlci4NClRoaXMgd2lsbCBwcmV2ZW50IGFueSBhY2Nlc3MgdG8gdHggb3IgcGFnZV9jb3VudCBv
dXRzaWRlIG9mIGEgbG9ja2VkIHNlY3Rpb24gYW5kDQpyZW1vdmUgcG90ZW50aWFsIHJhY2UgY29u
ZGl0aW9ucy4NCg0KSSB3aWxsIHJld29yayB0aGlzIHBhdGNoIGFuZCB0aGUgbmV4dCBvbmUgdG8g
ZW5kIHVwIHdpdGggYSBjbGVhbmVyIGhhbmRsaW5nIG9mIHZtDQphbmQgc3BtYyByeHR4IGJ1ZmZl
cnMuDQoNCkNoZWVycw0KQmVydHJhbmQNCg0KDQo+IA0KPiBDaGVlcnMsDQo+IEplbnMNCg0KDQo=

