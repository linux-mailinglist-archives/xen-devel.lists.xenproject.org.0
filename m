Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8B8B2F98B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 15:10:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088670.1446413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up52t-0007Hr-3v; Thu, 21 Aug 2025 13:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088670.1446413; Thu, 21 Aug 2025 13:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up52t-0007Fa-1B; Thu, 21 Aug 2025 13:09:35 +0000
Received: by outflank-mailman (input) for mailman id 1088670;
 Thu, 21 Aug 2025 13:09:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m+ul=3B=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1up52r-0007FU-KV
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 13:09:33 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14378f12-7e90-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 15:09:32 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB9PR03MB8799.eurprd03.prod.outlook.com
 (2603:10a6:10:3c4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 13:09:29 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 13:09:29 +0000
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
X-Inumbo-ID: 14378f12-7e90-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IPEO0lPyZmF7Z0ES2fihZ/TqlozBZkZl5TjK/BlHcjU8fxAFQjEsA/G+WfMKtNvnzP92w1vTJ+nZypLd0nhjyqfZ1w5EIPCgkL9YMT7hEuf4DT/sjMUKpDi3jFiyxbNGBFtEYr4gIcnSf3gflFvwNIU/2WvyyxJABYXrUzM1kXnb0vPHOr0vu9qW7mqp9AaXXjFKm87OhvGzxoBMf82ZwA+lX0OIjlt3eQ3cXoqE7NR1FESnMWCq7qKwqY7qreKLcDp5mDu/1QJq9Bo/KXh8vmxpmXvsvYDT88jZ8v6mPEvAsLjXnV8jczYmEMfwtpskxvPvroZJv6QNqDHVvqsmYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AD2V5cMbk2gvlu7Wf4VjpePQ/aX+IIavPijQQGOzWvc=;
 b=bFxkFvY0ylhRZhvJ3Lo5ZRa+RBFBPqzIqpnPtq/x5jX2tRObxITifxd87IjieYgyBdsd3I+wakDx/csoioSE+P8Dve3fE41+nIMCbS+SUznsHmQmQFkO/7Sck7MGq04U0mztofGKG0tXOFdCpQoLMG6mwxCVfgGlFvjoPbXLmszO71j3i/Umor6W85atQN1TkSs/Sw7gdBrCggDBiT9LwGZ7mE7PoiLMZlbuOy9Wl1ChkTtUUc3JGg4PAShg4i8v4sHwaH8Qep5ZjvJsyQym/6OXbzezhX/Sz8RjaomeEIf8QdfbR3ndsMQqJQ7VKgtUBMKUlqtsQpslRE8AjxP7IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AD2V5cMbk2gvlu7Wf4VjpePQ/aX+IIavPijQQGOzWvc=;
 b=Acyy/uCr2L3hkZ6/h5XXV91M+QJXhAPRSanvymJ6MwsuHTwVPRaRzi+UNwF5op+23zhyoC/aSeHulMC1gVuCvqe/9fwRdu1GsF5piLcQ1yEZUQXZEXrHZSEeiZX98iaxcmaikk0vHsX1GCXLtULhrFt8WSDS4CGEedpIIqWbtqYkhaEuMBs0NGLeSb9THSqQfc9AlgwOHnUgH07ichlNyUXgGFFur7bSjOlrPLRsIUJk80mC9U84Sc2TZHvVhYceawHjDsDX0hix5XJJ63o0YWHwFZH+vPmUzkfW7gsuWppALYWFYKFesTXI0pcE5YppZbfBUSvhVDF498JM1gu2og==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1] iommu/ipmmu-vmsa: Fix build with HAS_PCI=n
Thread-Topic: [PATCH v1] iommu/ipmmu-vmsa: Fix build with HAS_PCI=n
Thread-Index: AQHcEol6WY2CZ9Gyh0KXEcdKpt6HNrRtAhqAgAASeQA=
Date: Thu, 21 Aug 2025 13:09:29 +0000
Message-ID: <4e658c8d-3cac-481b-a153-2a8189550a13@epam.com>
References:
 <f6a8095483ba54e1eabeca5e4b08138312fa822b.1755773176.git.mykyta_poturai@epam.com>
 <CAGeoDV8UBv9g3x_AunwoyZg5eQDWNkCHoXNz2_tJKrJYWeYAWg@mail.gmail.com>
In-Reply-To:
 <CAGeoDV8UBv9g3x_AunwoyZg5eQDWNkCHoXNz2_tJKrJYWeYAWg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB9PR03MB8799:EE_
x-ms-office365-filtering-correlation-id: 520e9838-922b-4d02-a577-08dde0b3f685
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dHk4QnB5NkRrMmVmRlpQN0RBWmlDS2NETGNWS3FZUHg0OTN3c1NSWXFOanhT?=
 =?utf-8?B?WW9PcVBWSjhJWUZ4c2QrSlIrdlJobTZjTE56TmM2NEFMb1NZbnFkK01PWlIx?=
 =?utf-8?B?emFyYTBSUzhRS3pWUjQ3T21JWlpjeEJpdSthMlZRQkhPVHJVTDVSOTUvVitu?=
 =?utf-8?B?WFUvUitRUldjVk9iMDFhcmdFd3I5ekR5cmlERW5UaDNHMy9HM201ZXZpa3U5?=
 =?utf-8?B?ckxQZzMyTnpvbXNFcGpKT1V2a1ZuR1Q2SWo3dmtLWnJ5NDhQdGQ3VFF6bjM1?=
 =?utf-8?B?VmdHWHBZYzc4SUZpcTc5eU1uSnJ0UjloSklFQU9hOGFSQnlhdE1MNlVzdWRS?=
 =?utf-8?B?RW9vb29WMjZxWFo4VEl5eTFqS2pKRlJXL1FCZ2RXZmk4VFduOVhiN3AvM3NX?=
 =?utf-8?B?bWlXTEp6TGNHRkpkV3l0WnQzZEs4MFdMNUMwcGhWK0ovZGROb2U5d011Q3VO?=
 =?utf-8?B?VWlna0dNcHcvd3lSOTI0WnV4V3l3TmJOcXZaTkh5RFFNbnF1Wmo3clNObXRQ?=
 =?utf-8?B?Tjc0WktZNHFSZjhRa1VKdUNsOWpKYnVDaW9Ga3RpNWw1MVBNdlBGQlg1WU5F?=
 =?utf-8?B?SkZqTnF6REcyQlduQmNJaWs1bFd4aHVnMEIrMm9waisrZUY5OEpHaC9UczBs?=
 =?utf-8?B?UXk4YjdsWmhsdjQzdXBub3RYbXNjQmNpMjR1Zzlpbzg4OUFwczZ3WUdOcjdI?=
 =?utf-8?B?OVNGNFFsRzVtZGt2dmVCSVJIOHZNcHRhZ1ZHb0thZmt2Q0paWHlTOWpjNy84?=
 =?utf-8?B?aEZIc1libEFVRG5HeUhUWnNUY3hFUGJxM0tzR3hGUVorUm55OUlwdW02WVRa?=
 =?utf-8?B?S0NwVEExMU5VOFNMWG9rcElkamdXeFgrbzZxclhYejBxbysrOFZ0QnpFdFZG?=
 =?utf-8?B?T3Q3VkwxUGZvRUs2NktqSDRWZThFRG9aNHd2UHZHODZhbzFzbm4vNDlKS0Nm?=
 =?utf-8?B?aHVvKysvRWMxOUZJa1U3QmxMNm1QdU1CQVVnMjR4dlB1MUhMWVRRT2ZtV05S?=
 =?utf-8?B?OExlWkNid3JyM0dnb3FieEpJOHpwV0lUanVWTHhPSmRBNUhmMEIzQjY0YWYz?=
 =?utf-8?B?MHlCbjZBZDI2bkRmSFUrNmN3ZFBrRDZ3M005SGo0Q04zV3MwNFdUWjR3c0o3?=
 =?utf-8?B?ZGhSRXVNUERGNDlCZlBHNFIyTW1GKzcwTDNDWnZkdzc5akViN3pLN0RxU01F?=
 =?utf-8?B?dEkzU2h4VkJoZHFBVVRSZkdXSXRxNDM0WUhWM2JJRXRUc0xZdENtU3Z1K1Fy?=
 =?utf-8?B?RW5LY0VWTW9rUGtwVlByRzVQcUdWeGRDKy8zZEFMNlE0ODRMSGVqQzFVSWFL?=
 =?utf-8?B?Y3dvOTduRzZjdDhKYW00VHR1NmczVTRuR0JyNnFINU9qZTFWaWJmSUttblU1?=
 =?utf-8?B?dGlydEFrd09WR0U5VFU1SnhFYUJqN3lkaGlXRUlha0g4dGpuOUFFc1NhNDhK?=
 =?utf-8?B?TmVlbjBJSDUzOC9qZEIvSzVUOXdTV2NPbTFyR0JqelF0eU1qNjdTKzdvWWUx?=
 =?utf-8?B?Wm1sd0ZjNFg4QkNlYVdacWRpMVQxdFVkVXhYMHNCaFdVNThBa1ZKbXZkcVpO?=
 =?utf-8?B?R00xVE5kUGVXN0Y3ckd0UjVXRWFEOE13Q2YxVTRNZnRwamk1WUh4d25OUzFK?=
 =?utf-8?B?ek9Ea0VVYmlYMzVWV0xHb0c0QU9hQm1pL0x5dnpmdzI1SUM3YUZ2R052OURa?=
 =?utf-8?B?TXVkZ2srSnlJYk1FV1JXbnVQR3FnalYxT3F3c0VBYldrMHU2eElYWXpDZ2lI?=
 =?utf-8?B?cm44QUxLMzNhRXpvNHREY2VxR3dMMDQwS2NneWJRSTVnRDVLTW1iNXBuQ2Z5?=
 =?utf-8?B?c1JYU05hbTJ4cXBOVHlxeW43SldEZFJkMmxTR1dDOWc1aHlTdy9UbEpWem9s?=
 =?utf-8?B?Rk1QVnVMUk9aZkcwS0pkb3BRVjlPTzBvNEQyV012V1pEaGZhSDFwYVBReTBG?=
 =?utf-8?B?OTRjTHpwRGhmNzZtNWgrK3dNYUt2MHB3Uy9sR0Z3UE5CbWt1U2EveHE4MmFO?=
 =?utf-8?B?SzVjV2Q1LzhBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QnMxZWlsclFxRU1rZjZZQU5wam9nZGFLdlN2QWdDRmkxOTg5Uk5NcWFyZzBD?=
 =?utf-8?B?NStrT3k5cE1CQ2RLTzIrMzJhZzI2QzlSUkdNbG9IYitQQ0hUQ2lOU29Tb1Z6?=
 =?utf-8?B?NUdxd1o1ZFRYdlpFMzhUMkJ6QlJ4MkhSSzlhUjRyUFY1RzR3aUFncDcrS1Z5?=
 =?utf-8?B?SlFHMXhUZDRaU2JTR3BtOEJvUU9TMWxHWHVhdGxvRXUzM29EUHVlempCZ1pi?=
 =?utf-8?B?dVh1SmpiYnpCUnV5L3orTHBKKy9zQ0s2b2FVak9UMzFJL1BnYWpiRVhqSmY4?=
 =?utf-8?B?cHMyOVJqTTM3ZG5qY0RKME8wMWRTQ1N2ZWVNb0YzUEYzb1ErcFVDVC9PcGwz?=
 =?utf-8?B?QUY2eHA0QlkwckRua3hnWHBKSHptU0Y4UnpKTUhUaC9lKysxTWZpMEFTdy8v?=
 =?utf-8?B?eElBczhLcFJhdmNMSDlTWW1ocEtpSVdiVk5XbGVRbS94N0d2RE8xTDZ6d0ZO?=
 =?utf-8?B?TDEwaEdDMUQ1WkdIMk04OFFTYTI0ZHAwQkU4SkV3Nm01UTN0VGc2SHozTWJR?=
 =?utf-8?B?eGNzRGNxMStzamdULzNDOFVyZUNmTkF5ZmFkQXVhdjloQkxheDV5Uk4vK3RM?=
 =?utf-8?B?SzJOd3ZiU29Dd2hCenJUOGhSNDJMazluR1dGekJqMHBtU0QrRE56SkFxNGJD?=
 =?utf-8?B?K3l1K2xoUTVpWVR5ZE4wdGVwNFc4MWlSak1XUnpna2tFK2t5bVhQNnU2QzBK?=
 =?utf-8?B?ak1aUHpFSVdNajlQaUREQ3g3bG1aWDZWbVNQN3p3WXdDOFJwZFd4UnRPbUlu?=
 =?utf-8?B?UXlEcjBxMlBOVVVUSVk4MmY4RHFKbW9JM2dpTW0zTVVNc2cwcUVYcUZWQnFS?=
 =?utf-8?B?VllQQ25QOTJPNEw3aEkwK0RpbHVqVjVsTG5oZXhLZGlja2JFSnF3N3lQV285?=
 =?utf-8?B?VXAwNWFYWTJaOFczSXFyckRnZkphQ2dDMjZHblB4c1lmOVJMcVFYcXBEaGR4?=
 =?utf-8?B?elJqS0xSdXpEZ1psNkU2UXNodUQzMzQvVUZYWUpJNVFsamx6S0Z0c1J1RFFX?=
 =?utf-8?B?QUFOMkNyb2kveHZKMTgrcXZJSkZhY2J0RzJYWGhFK3MvT0FUbXgrTmliZTNo?=
 =?utf-8?B?TVpDZWgrMzJSUXVEL0FxNU1kSmdQM0QrMEdHOW9XWWtHdkVZTnc4Z0plcEZU?=
 =?utf-8?B?TFd0ZXFGbHU3aFNJUFhYdC80VC9TRGhBN2pqMmRBdG5LV2FveGs5WXRMS3pQ?=
 =?utf-8?B?YXNXTHBUcVVOVDBkb0hDREFrdkpnZ2NLbnlCVm5NY3VLVTJQdm96ZHlrdi9o?=
 =?utf-8?B?enJjMHdFckhrb0R1ZDdiWkxTcmc1VVRlbFRNc1AwU1BMaW1HVjVjbi81L3Fn?=
 =?utf-8?B?WDQyQUE5ZEJCNHJYYWlKaVMyVGJQK1EzaDh3Rk5teGJDSXB5OU5ET0NaL1B5?=
 =?utf-8?B?emowSVp0SXU3V0VoY3I5azgyZk1DYjZOMXhZK09aR2J0dnhWQjF6aHM5bEk0?=
 =?utf-8?B?UXNCSWx0Ym4xVmwzUVRieW9FTzljMkRUSWFUcEd6MVlBSjZRMzBrdHR5WDBI?=
 =?utf-8?B?RFFjSzRTL0pxKzFvcVo0QUVlK2x3elRjdWN2Sm5SNy9IT2M3dEQ4elozWTN5?=
 =?utf-8?B?N0oraGR3V1U1c3VudlBaSUdUR09PSjZCQStBYmdHcG9xNFlGSzB4eVhqSklq?=
 =?utf-8?B?bGJScEhFd1l5WGlkYkErVDhuSmlWWG9jQlE5Q3F4a2FaSUlLdTJxUkN6cWow?=
 =?utf-8?B?bVlPKytoTllPSUJ2NVo2cG0zdnVDZzJaK0hRWFowbkxSU0QwTWhQcGdwYnRO?=
 =?utf-8?B?QUJLdUtEYUE1cC93dmwvdDJ6TWYwaXJQTFRlMklzWWp2M1lsNkxjcHYva1BX?=
 =?utf-8?B?ZzJZb0c2dStGUEtRM3FHNzMweDUwNHdjSkNKL0hGVHVqUlZaVVBQVTlLclR6?=
 =?utf-8?B?Vm55MzVlTjJnYi9xLzRKa0RDaHdMeFpNZVowV2hBMVgzcWRFdVJOZ3hmUGp1?=
 =?utf-8?B?eFU0VHVGOS94ckQrVERBeTBHSXJqRElUS1VpVmpmeGoybmErQjZmRk1IVnVM?=
 =?utf-8?B?QWIwVmNSL2h6UlBlKzVreUN5SmFHd1lYakZqQnpGUFl3VXFuK1krVjcycnZM?=
 =?utf-8?B?UTNNZ0trS0N0T08wTDRGQ01aYkxoRTA4WTdGNDQzRmYzeThUYlgrS0tvSkxN?=
 =?utf-8?B?a1NqK3NLYThnRS9WT0NtbU44bDlCSFlzckxHSmxZcEtDK2I1UUFYcG01U0Zm?=
 =?utf-8?B?UUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3AAB1D7205AAEE48805E9EE8B3C8263E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 520e9838-922b-4d02-a577-08dde0b3f685
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 13:09:29.5845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w7UKEuMwKylfygORwhAGhcJd5jBQU+pBaflSfU3Ty7RdN16thaTIkpJIqJqwT5uAJvmcbKq9eZZ+nkc51kdLVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8799

T24gMjEuMDguMjUgMTU6MDMsIE15a29sYSBLdmFjaCB3cm90ZToNCj4gSGkgTXlreXRhLA0KPiAN
Cj4gT24gVGh1LCBBdWcgMjEsIDIwMjUgYXQgMTo1MeKAr1BNIE15a3l0YSBQb3R1cmFpIDxNeWt5
dGFfUG90dXJhaUBlcGFtLmNvbT4gd3JvdGU6DQo+Pg0KPj4gV2l0aCBQQ0kgZGlzYWJsZWQgdGhl
IGJ1aWxkIGZhaWxzIGR1ZSB0byB1bmRlZmluZWQgc3RydWN0DQo+PiBwY2lfaG9zdF9icmlkZ2Uu
DQo+Pg0KPj4gQWRkIGlmZGVmIGd1YXJkIGFyb3VuZCBwY2ktaG9zdC1yY2FyNC5oIHRvIG5vdCBp
bmNsdWRlIGl0IHdoZW4gUENJDQo+PiBzdXBwb3J0IGlzIGRpc2FibGVkLg0KPj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IE15a3l0YSBQb3R1cmFpIDxteWt5dGFfcG90dXJhaUBlcGFtLmNvbT4NCj4+IC0t
LQ0KPj4gVGhpcyBwYXRjaCBjYW4gYmUgc3F1YXNoZWQgd2l0aCBpb21tdS9pcG1tdS12bXNhOiBJ
bXBsZW1lbnQgYmFzaWMgUENJRS1JUE1NVSBPU0lEIHN1cHBvcnQNCj4+IC0tLQ0KPj4gICB4ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaXBtbXUtdm1zYS5jIHwgMiArKw0KPj4gICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2FybS9pcG1tdS12bXNhLmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9h
cm0vaXBtbXUtdm1zYS5jDQo+PiBpbmRleCBlYTlmYTlkZGYzLi40OWYxNDllMjIyIDEwMDY0NA0K
Pj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lwbW11LXZtc2EuYw0KPj4gKysr
IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lwbW11LXZtc2EuYw0KPj4gQEAgLTUxLDcg
KzUxLDkgQEANCj4+ICAgI2luY2x1ZGUgPGFzbS9kZXZpY2UuaD4NCj4+ICAgI2luY2x1ZGUgPGFz
bS9pby5oPg0KPj4gICAjaW5jbHVkZSA8YXNtL2lvbW11X2Z3c3BlYy5oPg0KPj4gKyNpZmRlZiBD
T05GSUdfSEFTX1BDSQ0KPj4gICAjaW5jbHVkZSAiLi4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0LXJj
YXI0LmgiDQo+PiArI2VuZGlmDQo+IA0KPiBBcyBmYXIgYXMgSSBrbm93LCB0aGUgSVBNTVUgVk1T
QSBkcml2ZXIgY2FuIGFsc28gYmUgdXNlZCBvbiBvdGhlcg0KPiBSLUNhciBwbGF0Zm9ybXMuIElz
IHRoZXJlIGEgY2hhbmNlIHdlIGNvdWxkIGhhdmUgSEFTX1BDSSBlbmFibGVkDQo+IHRvZ2V0aGVy
IHdpdGggSVBNTVUgVk1TQSwgYnV0IG5vdCBiZSBvbiBhbiBSLUNhciBHZW40IHBsYXRmb3JtLA0K
PiBmb3IgZXhhbXBsZSwgb24gUi1DYXIzIG9yIHBvc3NpYmx5IHNvbWUgZnV0dXJlIFItQ2FyIHZh
cmlhbnRzPw0KPiANCj4gV291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIHVzZToNCj4gI2lmZGVmIENP
TkZJR19SQ0FSNA0KPiA/DQoNCkdlbjUgYm9hcmRzIHdpbGwgdXNlIFNNTVUsIHNvIHRoaXMgd2ls
bCBub3QgYmUgYXBwbGljYWJsZSB0byB0aGVtLiBJbiANCmFueSBjYXNlLCBjaGVja2luZyBmb3Ig
UkNBUjQgd2lsbCBub3QgaGVscCBoZXJlLCBhcyBQQ0kgY2FuIGJlIGRpc2FibGVkIA0KcmVnYXJk
bGVzcyBvZiB0aGUgcGxhdGZvcm0gcmV2aXNpb24uDQoNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4g
TXlrb2xhDQoNCi0tIA0KTXlreXRh

