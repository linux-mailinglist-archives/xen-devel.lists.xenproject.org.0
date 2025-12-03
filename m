Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C826CA0A99
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 18:50:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177028.1501451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQqyy-00056B-Oy; Wed, 03 Dec 2025 17:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177028.1501451; Wed, 03 Dec 2025 17:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQqyy-00053l-Lm; Wed, 03 Dec 2025 17:49:40 +0000
Received: by outflank-mailman (input) for mailman id 1177028;
 Wed, 03 Dec 2025 17:49:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh3s=6J=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vQqyx-00053b-P8
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 17:49:39 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f0d7449-d070-11f0-980a-7dc792cee155;
 Wed, 03 Dec 2025 18:49:37 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH5PR03MB7960.namprd03.prod.outlook.com (2603:10b6:610:215::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 17:49:33 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 17:49:33 +0000
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
X-Inumbo-ID: 6f0d7449-d070-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VKLyx5WI5Ck2QHe7CG6YC2EFMsNuTvnQ2KWch3GY446y03ONVK3CH119gnHSzJejbwPFSpY5fH3+roNEHXfk+9pwwZoJs0HJCN7Ogf6RVzN1BtgdhdtWlXjThHdP1ROjbmqHkg6OuiyhO7VaH6AyCB1LMs2T3qo1A5R5lBMo/Aspi0w6Xk7IdlL6dSR6SqBO3y1zUhimHzGzDjY3cgRhYRN3R24k/9H7wXuYthpXP6YNOz2zllWiXJGfivBFD2zZSCafwTt0As+aXPLam34yAcmxuhJOJ2P/MFqVrTrQMCNrccq7jCOou+c+ndiDgfXjDXBH0wawX7bq2vj4EM+wog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foZ3tpcWSFQ8NDKcbPcOkWJbgdFpk0NfMwdqJKiO1r4=;
 b=LQNLhdw0cER+Wqy0ZxakoFRyyDh6lJQamWAQf4iCBndkolDBa+9kV7RjsKe4SWGC5ykMchzqPCEKz7aa6yqhqw3dUIpayuUdjM/TtpDnqV9xuJ3AGyCtAXGe6z+hAB77yT3STUoyEBldZ0WXHCU29mPOPjPkrbIypTceWl+Cf1MGqVAZ7sCup24Dan2lRwjf3BpgX1DNYrgWpN9p/4W05wHF9JLTkqfApeUm+VwdWr6nXLoP0bnPgoCnG0MPPUR2pqjIs5Tglz5S35iH0HNcArbrVUCUxcmljZvskBhQyR8kOSyEa7A6/5byU8W0WYWHHyFQq1fMqkq1CQjZIjroEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=foZ3tpcWSFQ8NDKcbPcOkWJbgdFpk0NfMwdqJKiO1r4=;
 b=o+Sim4yk7l4DowomDxMaabvq/6lmSJb0WjWjDUDXP6dKFesfYVuZ924Kthrpefo7uMJnJ/EiCguYtwO/vHdMJX4MGOnVT3sflLA9QvAuVPHBy12cKUdaDdtOn8BPs72T139e1drQpX6qe+JJLM7w7yjWRu1XeN/sqbrNautDlfA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e5ca01e0-bcd3-4fdc-8136-8b62baa3e8c2@citrix.com>
Date: Wed, 3 Dec 2025 17:49:30 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <JBeulich@suse.com>,
 Maximilian Engelhardt <maxi@daemonizer.de>
Subject: Re: [PATCH] ARM: Drop ThumbEE support
To: Hans van Kranenburg <hans@knorrie.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251203171608.1714964-1-andrew.cooper3@citrix.com>
 <a7f28465-e068-4250-873a-42e6cce71a04@knorrie.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <a7f28465-e068-4250-873a-42e6cce71a04@knorrie.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0556.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH5PR03MB7960:EE_
X-MS-Office365-Filtering-Correlation-Id: c1cc4d54-c18d-45b2-604f-08de3294516e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXpqaEM5cGVDOEwzWDdBTHF6MlVTOXczaDY3bjhiNjhmT0VSczR6ZEsrK245?=
 =?utf-8?B?bXNOY29RcUN0Ymg3bFI5UmRrS3FJRkpNbVQzTnRWc2R6WkN4b21Cc3dNK0ZC?=
 =?utf-8?B?WWYrRVdsM293R21PT1BKL21yZWZTYzYvekN6dmxjYVZoZ3hEdWlTQi9yNVVO?=
 =?utf-8?B?V2x2ZEdTb1BCZmgwRGZSRDYrbFZoaHgwODhtcFgydDJMMFN1N2lDOWFsc0R3?=
 =?utf-8?B?VW1kbXBLWldhdkhsaXJXcDJjRGJReGFRK2xFMWVQeVQ0bTJudTRzV0tGQW8v?=
 =?utf-8?B?aExJK0ZYZWp3d2FLN0hSVmN1YUdpQUU0T0lRTncvcG81cnlralZPeGkzSGla?=
 =?utf-8?B?TlJFNHVkTW41NXgzdkc0RExMazBqWU8vQjNkUm50ZjJUMFV6YnVYUTlOVVgy?=
 =?utf-8?B?SFhXS1NxK3RFWkFLV0xacVgwRDlkZDl6ZG9qenRmVEppZU4yQXZ1S0lDQSty?=
 =?utf-8?B?b0UyQi9rd1grR21mMWlVaHNZTXRuNTcyczFyWTUzdDNQdEJlTGxiSGt0Ni9x?=
 =?utf-8?B?bGtXaVNFdHcyRFhTNFpzQmIvVGNOWGpRcWoxRnlpKzNBSnI2YVd5UHVzUFBu?=
 =?utf-8?B?aEg0TGxqc2hxcEQ0UFQ5TExjazhxNS9wbnF1VS9EZldxQU5Ld0hPOWlVUGVI?=
 =?utf-8?B?VytmdXR6UXhMeTJWYnNaWWVSZTRXRy9EZTRTVVJMR29ES2FXeTdjYkMyc1Qy?=
 =?utf-8?B?M3pkb09jVmdCZ1RYeHZ6L0x5R1E3Vkw4WG1BYjlWTjV1Z01KS2VNVWdlVEJW?=
 =?utf-8?B?eE5GNVZpYnlWY1p0SDA0bVROZ0MweU84THlzMDVhZUY4L0xMZUZ6MytLNDZV?=
 =?utf-8?B?WTFTMUp4SkJ4SXdWeWlXcHIvd0trSXlTdFZRVkR1S2trZmRHalRMODBzZ0M3?=
 =?utf-8?B?ay9jcVhKNTk4WEc4YVJndCtlQkpBUXpTNi91RVRJcXFzWHBQeGNmN3dZZXFQ?=
 =?utf-8?B?cFZwN2I2Y1AxZmxDbW9QWnFUUjFXM0M0T1RqK29seUhCSGpyVVBsOGZmZFRS?=
 =?utf-8?B?c0crRHdmdHBwUUJ2MkNPQ3NQdURhbWtpWjJ3bFg0eE5XMWpocE9VK1F0b3l4?=
 =?utf-8?B?dEpjYjZaSy94NWFLMXcwZTEySmlqZXlhY3ZzQ0ttaDBWUmtQM1MraXZDdDhv?=
 =?utf-8?B?N0xCNDE5NWlpMnlsQzhBRkUxTkt0ZVV5Y05FbEFrMitrQ1lDbThpUzN6aTN1?=
 =?utf-8?B?SDh2WklaMzJQV2JQWks0aXUzaEVIZXNESEVRS3B2VVB6bWVtbWpISWZLcEc1?=
 =?utf-8?B?MWFleVRDcndpbHduUnJiMDVBQ215M05SUDhtSEdMTWpVSmhHWWRuQ2lSVGRW?=
 =?utf-8?B?OGhhZjAvT2ZBVDZIeVZVY0lVQ2RaVXBIRTF6aFFJUWx1ZkJ3NktaVGN0dEFh?=
 =?utf-8?B?eFZ4dnQ1NWUrWjN2MGRoZnN6NUNIU3ZNK1pQdkRDbkRFMFBudEMvWi9CZ0Z0?=
 =?utf-8?B?SkZYZGhiY1hxL0NIZ3kvWHZSL3dlTk1oaWd6VDlpYnpJTklScmR5R2RCU0Zv?=
 =?utf-8?B?Z3oycU1rTE90UG1SaXNuNUhNMW9vRnFDN1ZRVUNDS2JmenN0UVhYWTd0UHQy?=
 =?utf-8?B?SGEyUEVUTUF0T09HR0tmRVZtTXg5NGV4TEZBWHlTQnBwaUNoWTZITjIvYWhw?=
 =?utf-8?B?bHhEQ3g0b0djeW1LalJHSDlHanVkUTdOR2tCYnhYN080T3Vsb2VySU9mdkRL?=
 =?utf-8?B?enZaOFg3ZFliT3NnQ0s3bTVJNUw1eDBwZ2xHVzdFUStwSlpJdzJQbFNoOFFL?=
 =?utf-8?B?ZFpqcWUrU2pNUENYaDBqWDBrV2ZndjBvNnRHODF1ZjBkSkQ1aEgwL2FNZC9v?=
 =?utf-8?B?L0NneHdJV0xaOXhab0VJRFJHUS80Z0psc0F2Z2lBMEw1MnlHcWt2WGZqb3M0?=
 =?utf-8?B?RjA3QzhobGxCemFnS1hReEgzOS9qTkYzejVxYWxoN3RmbEUvaEt0YlRCUGpB?=
 =?utf-8?Q?xJtbukeQLa/TQKa01tXk7FgEralm6RHK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NERSRE5wamFmWFk4YllWR2IxYVI4d1VFQ3RXcEpMSDhObUQ3WVJwQzZ6cnVw?=
 =?utf-8?B?Y0dYU2grNFd5MFZWekxjUGEzWTFiV0RUanBicDdlcEtkVkxkKzNRN3cvWXg5?=
 =?utf-8?B?SVpsR3JoU3pTZEFrRzlib2tJVWZOWEowblQ0RS81blhad0dkQnc0U3cvMzZy?=
 =?utf-8?B?ejVXczBSZmJrU2EzU1dMWWM1RDRGSUNXczYrMUJmSEhUSm1zY3l6TnZFbzRU?=
 =?utf-8?B?TWtTR1Z4MUR6OGloUXY1YXJNK1lDU1g0bURiOG9CL1lqRE1mQ0JhKzFlTkxX?=
 =?utf-8?B?ZEJURlROR0pQNU9ld3IvUlNQZHdCc0N5NmlsY0RTV29WL2YwaTlRZUpISURl?=
 =?utf-8?B?VjNNNVVlTEtOUkF4YS8yMmVIM1hmSExySmlpMU5hWGVxYUV3V0Z0RFZaVXox?=
 =?utf-8?B?QTh2ZWk1VlBlZW1pS0VIeGtwN0oxWHVJejdBZVdiajJqWWYwVmVGSThqVTQ4?=
 =?utf-8?B?eDJKcHEzV1ExZHgrY2ExV29RQmdYYUlVcE1ySkxUbFEyS1prcWY2MW1DU0xx?=
 =?utf-8?B?MVpNckJDb0ZFblk1WWUyY0dnQUl2UURxZGUrN1c5TDZjNXFKQ21pY0R0UWt2?=
 =?utf-8?B?Rk9qSkVHTHFjZm9nYVVHT0l0dzhLcGhsWTFMYlZ1dW55RDlVM1BzNXZBcmdr?=
 =?utf-8?B?cExEdHZMbExpTlZoWjRKYSt0dkpqU2pueWlVTEtOY1ZsOGcxRHd5ZzNEWkZQ?=
 =?utf-8?B?cWVJM1N2RTB3bTRtWWlHbWxQTVIvcklnRitpUk1uM2xVUkk2YlkwUDlicEk2?=
 =?utf-8?B?UUZyOXhFZVpYNnY3anJLczE5MFd2TWJiWDF2bW5sa2tCVzJ6Q3lQa0tLRy9R?=
 =?utf-8?B?RC96TFNHVGdIRnAyYjhmYmxPS0FxNzc3RkJMamVyZWp2RENXRklMNVZaZWl3?=
 =?utf-8?B?QkROWGt4YmFCRSsrYk1sR1lwRGFPL0h5K0E1dzhQalJvb05ibkhGb0pUcWoz?=
 =?utf-8?B?dXQxY2tJQTVmMEtCWng2MU9vblVzY1R3eVFsZE9ZSW5EU1laMkVXZlVpZkts?=
 =?utf-8?B?SHVBanpmaGl0NERIakZGMmVsbStnMk14WjJEZDU1RFBCMU5QeDZuUzdDM0My?=
 =?utf-8?B?NmxGRUxmSGY1VjFUa0NKbHdaK0I3Qjl4MUc5NzVkajlKTXFVUzdVUGFuMU0x?=
 =?utf-8?B?cUZQRDNJdkJxQjBGZlkyMVN6TEV6SldNcnltMkFtQlpiUHpUQ1BKbXRaTTJZ?=
 =?utf-8?B?dnBvMUZkWHNPTVBpWlcwcy9kOEJKRkpOT0ZrL1lUeTErQVBSaVRqdjFrVlBO?=
 =?utf-8?B?Zkc4SXF1Tzc0ZG1FUjlRdzN5bFBsZUxicE93T1c3TmdIcWZNZkdnMkMvZlRF?=
 =?utf-8?B?bDkwU1gxZDFjN2x0TmdVZk4yNUxzc240STNhL2IrekZQeDhUNC92TDVjbEJF?=
 =?utf-8?B?WHl0VndHdlVabHRkQXJFWXpoM3dYVTRrUVlRZFRrWTBDZkt5Q2o3Zlh6cnp1?=
 =?utf-8?B?ckRlSHczSVdIYTBwa1BCUGxPZG1mdXpnTmNGYkdQcVBOdWg1NDNvT25VRTQ0?=
 =?utf-8?B?UlFRZWQ3Ni8zK2VtOEl5ZmtDOUJJSlp6UVlxSWhKaTFMcWZVN3J0SlhZdGw2?=
 =?utf-8?B?cGx1S0lnZytPYTJCZGZjY0tYTDVTTGVQMnkyWWt1Sm1vejNKUjQ2WExpa3Uw?=
 =?utf-8?B?NGl2aWl4Y05EelpWOGhHeVdoSVBlTVo5eHJRbXMvNWZXOUVMNjFiWmsxeHly?=
 =?utf-8?B?TGpDcG1CdVA5QW1yaFhRTTNYNFpvMzZCVXBYelV5YkZma2xBQ3RINnYxYWZS?=
 =?utf-8?B?d1h1WVR6MzRMOThXYVVGN1BuVExVck9nRHU5QjJmdHcrWUJrNDJJbWtoalB2?=
 =?utf-8?B?SWpKcWZqSFFhbEVJMFI4aDRRcGUyZE80R2JLUFN1bEtSUnF5Wk8yK3VLVTNw?=
 =?utf-8?B?RTlMRUNJc0swTHZkZjlqby83d0lybUlzS1hJM2UxZG52dytyOVZwVjIzdGtS?=
 =?utf-8?B?Vkw2WjNlY0o5OHk3UXhNdHVmOGhYblI4VTVkek80UlpuQUpYb3YyUkZlNFlp?=
 =?utf-8?B?bEZVbkx6WnRmQWtSMFdqU1dYUHBxQmtsQitNQ0xoa0ltaVVtV1NnZ1p5SkRG?=
 =?utf-8?B?Uk9NZytaNXBlUUpIckU0YXhLZ1RueVg5V0NLcXhDTnhVb1YxdUFhZS8rUUpj?=
 =?utf-8?B?Z2Y3SVROcEJsS3A1SG1BUE5FRVl1WXNUS0JCYzF6bGxtNGh0UzNkenZNTHFL?=
 =?utf-8?B?OGc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1cc4d54-c18d-45b2-604f-08de3294516e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 17:49:33.7508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SM/74TZ5IZ0OFX27xCM3V9MQCYfz+2K5I7K4Syv3h928e7vbxYIHGUQKqRQTqC6rPhQRGfd+vw3FEyUxu0GkEaBSny4tGuZE6hMr0cbCiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7960

On 03/12/2025 5:47 pm, Hans van Kranenburg wrote:
> Hi Andrew,
>
> On 12/3/25 6:16 PM, Andrew Cooper wrote:
>> It was reported that Xen no longer builds on Debian Trixie:
> The FTBFS is on Debian *unstable/sid*.
>
> The build on Debian 13 Trixie is OK.

Ah ok.  I can tweak that.

>
>>   Assembler messages:
>>   {standard input}:474: Error: unknown or missing system register name at operand 1 -- `msr TEECR32_EL1,x0'
>>   {standard input}:480: Error: unknown or missing system register name at operand 1 -- `msr TEEHBR32_EL1,x0'
>>   {standard input}:488: Error: unknown or missing system register name at operand 2 -- `mrs x0,TEECR32_EL1'
>>   {standard input}:494: Error: unknown or missing system register name at operand 2 -- `mrs x0,TEEHBR32_EL1'
>>   make[5]: *** [Rules.mk:249: arch/arm/domain.o] Error 1
>>
>> This turns out to be an intentional change in bintuils.  ThumbEE was dropped
>> from the architecture and doesn't exist in v8 (i.e. AArch64).
>>
>> Xen supports v7+virt extentions so in principle we could #ifdef CONFIG_ARM_32
>> to keep it working, but there was apparently no use of ThumbEE outside of demo
>> code, so simply drop it.
>>
>> Reported-by: Hans van Kranenburg <hans@knorrie.org>
> Thanks!
>
> I have just applied the patch here and have now successfully built the
> Debian Xen packages using Debian unstable/sid build chroot on the arm64
> Debian VM that I have here on my work macbook.

Assuming that the maintainers are happy, can I translate this into a
Tested-by tag?

~Andrew

