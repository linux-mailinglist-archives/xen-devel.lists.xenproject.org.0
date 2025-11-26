Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BF8C892E4
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 11:06:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172460.1497527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOCPV-00005J-1N; Wed, 26 Nov 2025 10:06:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172460.1497527; Wed, 26 Nov 2025 10:06:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOCPU-0008VG-Us; Wed, 26 Nov 2025 10:06:04 +0000
Received: by outflank-mailman (input) for mailman id 1172460;
 Wed, 26 Nov 2025 10:06:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GqHT=6C=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vOCPT-0008VA-Kx
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 10:06:03 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fa31f7a-caaf-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 11:05:57 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by DB3PR0302MB9207.eurprd03.prod.outlook.com (2603:10a6:10:436::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 10:05:51 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 10:05:51 +0000
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
X-Inumbo-ID: 7fa31f7a-caaf-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+mvPaqvYUw5Itm473q69nL+pfmmPPEPPhwOGl07SIjgrLwwqrMxPBv+6WIliU1AG5my3N/GQ1bjGmmb2WgNuLVN98W2qOLwPZCTzpozBCUG4Y6tZawydPYSulaqYE2JMjdgPmPMkxUtDHz5/hUf4s9DLvJXEfdwMtp7PkE4CsTJWq14Bi9A/eCSsNqOT6ii4KBPJ4CiIW5Q/ZMnRSS+3TsXgamSUaM5XjuvTIjN2OjoCbuXk4p9xdgRIVKOHVi+Us65HKfJYL7qTiju8Hzh1W40FddlA6sCBR6q1KSdaCHWJ2WZ0+NVVRArX/NMa0iQzfGmk+bQfK+S8/SpOFreFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1q5MDWGIp02fWIKSB6gChHTHQNtLxslvJQ5/PK5LAg=;
 b=L/ynRHMYM7LSi6PeUpOMSCiE9oI8JDkXaZ5ykvHObq8BdHGsbUo+5VdmcBCaOERv9MSCdoukdA1zAic7k9C8wR8Nm1xSLzzPnk9RsRhdCc0+N3xvNANrjvmuQqj0UHoH9Ah2wbV7YII1e4uuX5rfNEHiuQ3dYkaTd4JaQXLU2UqdcI46L6SJ9jI6LCa94vcRB70HlaxwWIyYDAVkTXGRYTzo5H2DJrnE6N92Dy3Ws5a6AqqtfpH2YBBjT2+AebgCxEVQMgljxajBtbPDAXiGrQ1mkL0wzSfTO4DJWQT0E4Q1Rh1ulDuXFRh4xE5732c3IcjE3/x+m6VsX4HwlJ/XCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1q5MDWGIp02fWIKSB6gChHTHQNtLxslvJQ5/PK5LAg=;
 b=YQJyCOvadYUkzRPS4Xu1le+YZxS2Na0CiOncLByNF9eQXoGlIrXZJcIRxH4MiKMYR82OR04ZWbEa3D0nwB8CdcNVMq7wJXaz8HaQcyFNfqfmlFiQPF/4rQ73k+QjyevIsaF46ydesFcTBitZGKH5t3KIV/HDL+sUFdhtjfnrPs4krt5B+ePL+mLBVCsc4ENNQHx+aFfEke2KWxyJfKIsge9Yl170+ld7cyyIf0k9ECFMmIwTyTEwAsQcLP6sMAvEou4/W/QjKV02qJDCzjdSKpsSbqkVqIvXtbAVUEUx0dquqBaK+NBdQFHHRoZAYy1tKmaX52/qnDy55BCze+ZFQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <7d5c75ab-3d7e-4f00-ad4a-0af9d4327994@epam.com>
Date: Wed, 26 Nov 2025 12:05:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/24] xen/sysctl: replace CONFIG_SYSCTL with
 CONFIG_MGMT_HYPERCALLS
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <Penny.Zheng@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 Alistair Francis <alistair.francis@wdc.com>, xen-devel@lists.xenproject.org
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-4-Penny.Zheng@amd.com>
 <5050db49-8581-499b-93bb-98c0f084d071@epam.com>
 <dd78860b-7829-4eb5-a26b-71e133df5d81@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <dd78860b-7829-4eb5-a26b-71e133df5d81@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::11) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|DB3PR0302MB9207:EE_
X-MS-Office365-Filtering-Correlation-Id: 1774a7bb-6bb2-4f1d-2375-08de2cd360dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVg4R1l0Mm1oL3R5a3pWeXhIN0pNRDRJYVZ3QW5HRWNRTlFkVTQ4Vi9wb1lt?=
 =?utf-8?B?QUYzdXhnQTlrWEluYi9kRTN2SmFlOGdQeDRYM3dOc1JaYkV3ZFhpVURGSWN5?=
 =?utf-8?B?ZnNLY3hoVjRHSTB1WERLQnliRGlYM1ZINlpwSUpCZkJHU2llbVVzdDROUDV5?=
 =?utf-8?B?clVrekRkSmZuK21OTHhkclpmYVZIQUJrRTN5RXlJTWEra0hGZW1aTWhuNFE3?=
 =?utf-8?B?L1BudTYyYlRyRW9vbnRhdDAyNmIrUmVBUHdGc1pHSWpyeURxeStidEpES1Bk?=
 =?utf-8?B?QzZrV3pRWVl2TEtRU1IxNjlFd0xtZUk0Z0tPeG1OMXJ6dE1FdDZjRERhUDBi?=
 =?utf-8?B?OHJtMHNXMFFqTlBnT0R0ZVlDRXFxclFUQ0E5MUhDcFZFYkZoY1hBbmNicnV2?=
 =?utf-8?B?aFJ4MkFSTXNPSXFDaTloYzdtb2xNa2tGMDJZRlBmcUNvd2h0bVZoWWlZS2xE?=
 =?utf-8?B?U1lkVGpleUxRSlZZWUcvNTlxM0srQXVZcTRjTldIeURWVVh2YXhUR1hTRWFq?=
 =?utf-8?B?UVZKSjFzTUdFSDE0K2hESGx5SUUzcDAxOWlPQ25VcmpNR05GMVRLRXg4bzls?=
 =?utf-8?B?aTBSNlUrc1JkTTBtQUhhL2RDc0VpQy9ERmswdGxrM2JHZ3UxYXpYYUtCb056?=
 =?utf-8?B?UGxxL3pyY3JKQzBUVzVrNGlDNmtDRk1RM0cxK0thOGhPTW9DUzRBanZtam1L?=
 =?utf-8?B?aHBONERpSVFGa3BCUm1wS3JCdzg0b0RqZEgzNENLRVVFaWdhdmcyN1FlMlNv?=
 =?utf-8?B?TXNOZExtaE5TMHNhWGlwWjJSQS9rTTdFL0xzYS8yWjNqVXgzRkZjd2VNbVMx?=
 =?utf-8?B?UWpibENBZlc4L2IwN1JtVXNQNnFERFlDaHdNcjJIUmVvWDF0eWwwS0crY1Bh?=
 =?utf-8?B?YTZKTjZEMG1uTy92NGxKV2llVTZIeW5hVVBnVmNQcEpRcHhUempLcERTY0Y5?=
 =?utf-8?B?UW9aNDBzM01aZ1FWVG8vRjBJMkZMRHVBTGs5bW5lNVkvNS9aWFpVenEwT0E0?=
 =?utf-8?B?QlFLVTVyTXMxcWRVOTVwYnRDNFN6czhOL1ZBcHFicXVzSzZTWHVQV0pJd1hi?=
 =?utf-8?B?MHZ2T3pwcUVOSzdlcEtqZmE5RTVRMzExSFROZmdTeDlPTmovcXgwWDBHbkZM?=
 =?utf-8?B?T1RWM0QvS1lXMTlEdWZIRXdRaWtXd0JyMFdTOUk0QVhwbWlwTUZxUklvdloz?=
 =?utf-8?B?MyszenNyL3NrZytMU0VCZWVkU2Z4QWR1WFNTZnBWS1Q5NzZ0bWwwSTZZWkxs?=
 =?utf-8?B?T0FMeTJDZjhXWFhadmU1NkhTZkliWVFueFBmZzJuSHRRcGlxSGh6eDZHcFdj?=
 =?utf-8?B?bWx6b3NSTTVqRkNHdzhkTGFxZkIzYmhvQ09VVks4ditHREhZcTBrWXJvQnJj?=
 =?utf-8?B?MFBnRG5oMWNPYXk1b0dkN05VNUp2Viswenl5T0RIMDRHQ3B5dkRuWmFuQXRl?=
 =?utf-8?B?Ty9jaDk2NzBja29FMG5SSEhpbnFtWW9icFpkSkZ0R1NHY3ZZNkZnOEtzK3JE?=
 =?utf-8?B?TEU5TEJzWXBEVFkyZkQ5YndUK3JyUG5CNFg4SEljQ3lHcVNURHNjWmtTcWFT?=
 =?utf-8?B?bXBMZ0p0bmw3OTBmTnczQzBINEtKTFl1MXAvaTM0L3kwQjRLMkdaMkNQTkQz?=
 =?utf-8?B?TW9EbEkzWUtzNFl4RDYzbEdIZjV2eW9HcjNoNlJaSThlWUp2MzB6WVczM2ti?=
 =?utf-8?B?WmdGVVcwc0xPT3czSXB3a3ByYWJvVFd3Vm40V0FKcitpbnVrVTd1TmlHV3FP?=
 =?utf-8?B?THB0L09qUCs4QVBxTWQwSy9GKytwS3J0L1RkdzEzZ3haK3lURG5vZkNmU1Qx?=
 =?utf-8?B?amVjT09FMkF4SVhtcDJLVWZDT1J3U3NpMXRDb2FKeTZZNit6VkwzUGl2cUdL?=
 =?utf-8?B?WW52cVlvRlpCSWFNR2FhTTNjT3RQWGFaR3JiSjlZMkliMnM5OHZDeWowVnZP?=
 =?utf-8?Q?SF04hSg9KpwRrgY4xSPRmkUdKgjqS7U0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K25BSnhrTUVpeXZTZGpyQ2FZZ1MzMURIV0VWUjZWRU1KSTI3em5odXBOQnJy?=
 =?utf-8?B?KzI3b0UzM2NMYmh2dkJqYmZ3aDRtYTZaQ3N4bDI5NWY5bEt5N0MyK0VhKzB5?=
 =?utf-8?B?QVdIc05ERENxWTNxbWpCdDZGV0NDU1ZXZXhSZE8yeThhZnJjbzFheUQrMGNV?=
 =?utf-8?B?amVrblBidVN6WTRzZ2hXREVIU1N0Y2ZPWWlYc3RPK3Z0Q0d4b29Ea0ZuZitG?=
 =?utf-8?B?NEpBT0ZvSlBldUdmQ2xjRnZFSHhkV0pSOE1pUTBFSit0TGNVZ0RsVytvZkZr?=
 =?utf-8?B?V0EyamxDTC9VU1ljeWUwdndhWmRld24rbTN6eEpJeDBNS283SjRiNG9lOHg1?=
 =?utf-8?B?bDhiOFVSS2ZLNWJMb2VMQTd5eHV3N1c4V0RyVkw5WkNPQVRNNDJBb1MxVlIw?=
 =?utf-8?B?elA0emVCdFMyMDJ4OFhwRkNhWXlUcjI0dGNzMklpblpLTGsrZDljYmYvMlZ5?=
 =?utf-8?B?aGsrM1ZQNzd1VTZ4KzU3clVSTzhYazJiUUkyVTlMZ2o3TG8vTStFVytrNkhR?=
 =?utf-8?B?ejVpVklPZDhjNEVoRC84c3FzS3hQODNhQitHa25IUVV0VVFkVFFzeUVxcWJu?=
 =?utf-8?B?RC9KOVBuVHVkSTMwK3poUDBRRmJRZEg5eHFaZEtEdS85NGZNL2F6dkhIaklu?=
 =?utf-8?B?VDd2QkdENy9EOFlrTlNSeWE5R1AyNkd5dEVvQXdJRTEzTm9lMUlKR2ZEYWNN?=
 =?utf-8?B?OFdqM1E0SytCeVdUeXowRFJiNTE0TlhZM3d3empxSmRSRzMvc1FUc0pkL0dN?=
 =?utf-8?B?YkxtNWhVd3VVSkJQaVlxdjhHWVhnU1RnTnZBaEYwWFpabFlBQ1h5c2Zac0ln?=
 =?utf-8?B?QjR2VVFHV3FoTjRnNHBHclE1cjI2T2xldjdEdlA3ZVZvSTdvTUV5L1NkbStw?=
 =?utf-8?B?UGhkYUtON0NmRkdXN05CUDRlK29WeTdDZTV0bE9SOWI1bUJ6ZVJtQWIrSm95?=
 =?utf-8?B?N2szbXdtQ0hVUEdYamtDZXhjMkcyMDR1MHZYY3ljQnJGVGFkalp4aEQ1R2lw?=
 =?utf-8?B?a2lqUEduU2k4QVJNaURlWjUzMXRBN1k5Rlc4cEhJMVFxbVNnejlyT2d3SENy?=
 =?utf-8?B?dENhRHlxY3ZHdWhIUVFYSTRMdVN6bktDQ0FrMkMzeG9kRmU0VlQxcUtGcmZG?=
 =?utf-8?B?S3c0N3pZdDBhZmZNTzFoTnJZUE5SVUZrd2FxUU9Jc2RQazR5U3RGcktNWGk3?=
 =?utf-8?B?aEVPSm52NjZ5Yk9EZnpQYXpjMExHemV2MnFOWWNIanMxTzdVcG9TaWkxdzZz?=
 =?utf-8?B?V0dvNzdjYk9iVDdpVVpub1dYb08xNjJ1NWZWT0w2b01SN3REemM5ME95K1NF?=
 =?utf-8?B?YUoyWmJqSlEvTU9VUVlPNThJYmo5cjlGb3ZRVzJXYnIwTEQ1NHlQQlpoTWFx?=
 =?utf-8?B?MW1FUWJQUkNuTUtWYmJYTnJZWUxQOTVpblBqbmVNaXh5bzFPWVFNNWNsOE5T?=
 =?utf-8?B?SWUrSmpXbGhvdVJnMDZkRVN0ZDk2a1lIMGZwejlkZGExNHN4cVNCY0tCQllE?=
 =?utf-8?B?M0hqLzFUakxEMHd0UU5RcnhGdkwxT215NEZIWWVkbXFEL1NwN2thUkswYk9a?=
 =?utf-8?B?ZzVqZ293Q2RQZVVnamQrVHdHRGsyS2c3eWZpRkkxRFlITVJKM1E2UVorcmhD?=
 =?utf-8?B?dVRkclJOdXJnZWlNRUV0NStPNjZwbDhRYWUrM0hXekhjTVh6OFVncktwRWtF?=
 =?utf-8?B?MENrMFI3MWpGcXQvQjI2WGJYYW9WdXVpMEZZRWlJaE9hUy9qdlJyL1hCa0tH?=
 =?utf-8?B?MEpEQkJwZmZhVmhZNGJKSXpWUUU4cEs1N1JydCt5cFRzZ0tTQWJsZnFaL2x0?=
 =?utf-8?B?bGd6ZzRxdVNxSFJOaE80YzczUENFczUvemFnckZCRVhYK1p2eDJmTjNCUU1a?=
 =?utf-8?B?WDJ4V09RZFAwazQ3UlNvc3c4b3B5S0ZaUVB4Wmg5MDlEaGZrTmhCbWt5Vkxj?=
 =?utf-8?B?MGhKMXFmZ0hteXc0R3JOcmsvSlQzQWRYdVlhMVQzVDJNQ0pWR1U0ODBLYkJm?=
 =?utf-8?B?MWYySDd3dVdkSkZ6c081YVkzTytnekhpai9CQjczblZsRWt1OEJzSy9yaGli?=
 =?utf-8?B?Ym1kMTlaWk9zaUQ3TFpraTMzTm5zamdkUDJjUzdkekd6dkFkUDEwMUNDRnNI?=
 =?utf-8?B?RTNKNHRUanF6ZzlhN1krdHZBNHk4S1U5WUpVRTRVSUZVK3JhTDdoWkRnWFR4?=
 =?utf-8?B?elE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1774a7bb-6bb2-4f1d-2375-08de2cd360dc
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 10:05:51.0272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OtsmlvBWGLwFicSU96ady99M2QaMyD8oJGcVx8ip8E1z4tTM4QNDI27WP4/3Sx53iPxaNh8R80EaPFRxaXw4cFkfujs3EGbGR56i5FM4Z5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9207



On 26.11.25 08:35, Jan Beulich wrote:
> On 26.11.2025 00:02, Grygorii Strashko wrote:
>> Hi
>>
>> On 21.11.25 12:57, Penny Zheng wrote:
>>> Rename all the CONFIG_SYSCTL into CONFIG_MGMT_HYPERCALLS to help provide a
>>> single option to manage all unnecessary hypercalls, including
>>> sysctl, domctl, etc, in dom0less system and PV shim mode, which could also
>>> make it easier to support randconfigs.
>>> While doing the replacement, we fix some bugs on xsm system:
>>> - wrap the whole xsm function to avoid bringing unreachable codes when
>>> MGMT_DOMCTL=n
>>> - add missing wrapping in include/xsm/dummy.h
>>>
>>> Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
>>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>> Reviewed-by: Juergen Gross <jgross@suse.com>
>>> Acked-by: Stewart Hildebrand <stewart@stew.dk> #ARINC 653
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>> Cc: Alistair Francis <alistair.francis@wdc.com>
>>> ---
>>> v2 -> v3:
>>> - wrap the whole xsm function
>>> - add missing wrapping in include/xsm/dummy.h
>>> - refine kconfig description
>>> ---
>>
>> With below diff..
>>
>> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
>> index 6709c3c95c53..f478adffff9c 100644
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -652,9 +652,8 @@ menu "Supported hypercall interfaces"
>>          visible if EXPERT
>>   
>>   config MGMT_HYPERCALLS
>> -       bool "Enable privileged hypercalls for system management"
>>          depends on !PV_SHIM_EXCLUSIVE
>> -       default y
>> +       def_bool y
>>          help
>>            This option shall only be disabled on some dom0less systems, or
>>            PV shim on x86, to reduce Xen footprint via managing unnessary
>>
>> It could be very helpful to consider this patch to be applied first.
> 
> It doesn't need the change above, does it? It (aiui) deliberately sits
> ahead of the patch (supposedly) doing the above. While (once again) 

Understood.

>it is not being said anywhere that it's independent of patches 01 and 02,
> I expect it really is.

I do not see any dependencies.

> In which case all that looks to prevent it from
> having gone in already is the lack of an ack for the XSM changes.

:(


>> - number of tags indicates that it's the way to move forward
>> - with above diff patch 4 can be dropped
> 
> Except that imo really wants to be separate. And that could have gone
> in already as well, if only it had been done correctly.
> 
> Jan
> 
>> - it is mechanical change, but it's big and constant source of rebase/merge/cherry-pick conflicts
>> - once applied it will allow, actually, parallel development of this feature as MGMT_HYPERCALLS will
>>    be defined while build not broken.
>>
> 

-- 
Best regards,
-grygorii


