Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE8AC5F037
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 20:19:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162857.1490346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJzJJ-0004gO-VF; Fri, 14 Nov 2025 19:18:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162857.1490346; Fri, 14 Nov 2025 19:18:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJzJJ-0004ex-SO; Fri, 14 Nov 2025 19:18:17 +0000
Received: by outflank-mailman (input) for mailman id 1162857;
 Fri, 14 Nov 2025 19:18:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Irg0=5W=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vJzJI-0004er-MC
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 19:18:16 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9ff3338-c18e-11f0-980a-7dc792cee155;
 Fri, 14 Nov 2025 20:18:14 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ2PR03MB7109.namprd03.prod.outlook.com (2603:10b6:a03:4f6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 19:18:10 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 19:18:10 +0000
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
X-Inumbo-ID: a9ff3338-c18e-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NiYVIT1OIl0wu3A0Lqe0tZsDuHCq/N1oZDgkM6SBb9gOWla1XXpZKBhCnKBTwibsS6mjWuBMzJxpIs5daDwDWa7A3lMIFJ8FmXc3uNr5KQ1lov19tU6upDQkja9YqyG+SWyrjzG+t1PFMt45sCbkgLZ9cthoocTk8Nd7e3gMdrdkZqUDDuWg+SKL+kzLvgwJAgMZHPztQJEF85PVtIc1igvUY6vsHzWbFsvm8pm5VWdpOP8XBl52bF3nzxe/khMWbXR+hYPTtocxk9Owh6hWgeXynOJtRNVA3sTGq6lk1azpv7wFrGh92V82HlfdMfqqb1jRLy5tY+Ls8pN6JEhe7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQEvbcXV8VoeazPVCg/5qsZe8BLzxALytFzqYmqOnWk=;
 b=gUK0Dnn2bjJNNGA3tYrR2cEq8Dpwyqz601c9k1Pm2Hn7XPiMXeE4w2r1YmUFGA9ERJldXV4bxuRwcInbYOnvlxwA1TKi1R/WFlLVWK79VqICb8gNZDeYWCCUNwp7z+Px/TlwEBfFVVZ/8SBm+Sl4eVIggBTPlxzoGjVzL0lWsk2PHzSFjQNkSPWizoapiHYcfulZUYdBSgJqwX3uXHQNbATHzn4qlQoXktD2RjI/dFLkB52IJQG+j2vsPCEdNc4ZPi16dFW+OEQhLsMJ4LRPitEUxN9ozYS66QLxUCXQ6o/ECKCnymVarS1WwulYAnNQQ+vIm2eG4aVleP+c1zQ3og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQEvbcXV8VoeazPVCg/5qsZe8BLzxALytFzqYmqOnWk=;
 b=OvwzpsktgbuGyLOvOi+egxtLefSXlpK84H5+mpEQvHupz4au8TReS21zcbhkO5ezv07ewRtPlcqf0+Sqjd8O1TZt8bqVnZoll5TqGfB7UhQxiVh0eHdt9ylEo+TnPZ8sF8qrZ+1edoLrJhsf+3Uga41L6GkQ6WoMUxCdbGUAguY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8f8a769d-95ea-4554-8ee0-d6247f583e37@citrix.com>
Date: Fri, 14 Nov 2025 19:18:05 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] xen: Strip xen.efi by default
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Frediano Ziglio <freddy77@gmail.com>,
 Demi Marie Obenour <demiobenour@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20251113154358.28704-1-frediano.ziglio@citrix.com>
 <6729f3d9-618c-4dcd-93f8-d02ca7cea017@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <6729f3d9-618c-4dcd-93f8-d02ca7cea017@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ2PR03MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f98cc58-a421-4982-732d-08de23b28c84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVhIMTJWcTlWQm9ERjRuUDR2blU2Rmo0MUtqdmpGRDZtQXdJUmZXYVNIRkFp?=
 =?utf-8?B?THVHUEVTdkMxV3dFOXh0YkVuM1hHd0lRL3R2UnVsQlNCL1pxVWdLSmZwZ2NY?=
 =?utf-8?B?OUFPYUlabWxNNFd2aGJ2bFRkQ0ZqbWVIUHVkcGNMODAxOUlFelViUTNqNWhJ?=
 =?utf-8?B?dTYxTFdzRXI0bzByS0pnRTdnSXYzOExSTUIrMW1wYWI1YklGT3ExK0twcWxH?=
 =?utf-8?B?Y3dvNkZFSW1SeVQrbHo0blhxdUlWRDFxNEE4VlZTSHZOaTlEaEhzYXNHNmsw?=
 =?utf-8?B?b2hjdjM1UmRXbDlidTl5aE9UZUVrVmVDWkhJMmVueFdGT0Y2WWNibExaeS9Y?=
 =?utf-8?B?aFpITlN5VVFWdGxFUjBLY1pTdWIzQ20zSFNzREVIbVZORTJET205VVp5QWNR?=
 =?utf-8?B?S0NRdk5JNFZ2QlhXRWtaNnZWekFtM01pVkpUeXVldmFCT0RqNEpDNTVyRURK?=
 =?utf-8?B?dWZmK0VQenU2bDVNd0ZlZ0ZIOGpMQ01OOTBuVDczSFFMTDBadlJ1bk5MWXJa?=
 =?utf-8?B?ZEdnNTlpWjFmdFV1NWduUWJIUWtFbi9xK1F4bk91eXdLRDE1b0o0T0Z6NGI2?=
 =?utf-8?B?NVA1elhwaXI4VndlQUYvVTZCdHlTMnRTSXR5ZU9kMFRpc21vNXdzSTBUL2g0?=
 =?utf-8?B?d2d2QWU5eWprR0N4MWxFK2ZGdkZSK21HZWlzU0k5Z3pFbjc4WDJYM21ra1kr?=
 =?utf-8?B?VFJMWUlPZkpiRjhSVnF5UFVyKzBLZEg5RitZVGhUTEVkdVJFbXFxdW9rUkpK?=
 =?utf-8?B?cFI4MGh0OUlvaXlVcDNzRTJYa21YOWxTU1poY1VtZDh5dmJ4SFR3cnFEalRy?=
 =?utf-8?B?anVSK1ZJRkIxaU1RZDF2cGVLc2k0Sm9OMHBWT0FTUE9ocVNETlQyMUhBU2N5?=
 =?utf-8?B?eXdBTkxiVEMvZWQrcTNUaDF6S3lndXY5U3NJU0RGZFNNUExqUmJKTmp3cmN3?=
 =?utf-8?B?OG9pZ1hHd3BnSTQrWEE3ZE5aREZqbjBNOWhSTnU0d1R6cEVJRkxLZjd2bnRH?=
 =?utf-8?B?alVqV2dzRXdNWjVjNGduckdJcEJyT0JXRnpkY2M2Y1VSbUhQeWJZM3p4OTkz?=
 =?utf-8?B?ZzNMTHVOVWRUM3BvY2ptZFpYY0c5WmNIcSt1Ym1QVEZ3R0g3NTZlcDJ2NS9K?=
 =?utf-8?B?SU1XMzl4ejZ3ZDIyaXFKN2l5NDVMZDRRdTBHTnc5TmZEK09FbjNNT3JZU1hF?=
 =?utf-8?B?YTZtWEJGTG1RMlVhRStLK0ZKSlpUWUw2OWszbFV3amhBVm5ablY1ME5jU1hO?=
 =?utf-8?B?ajNzYU5pa3J4clZjbTBLRW15aGxOYXVDOTd6SitieWEwQTloSGR1YnVhL0Vh?=
 =?utf-8?B?U0tNSUJKMyszbGFqd0svSHFVVzJ3SG9zZ25FR0NVUVNnQktpSSs2WU00WDEr?=
 =?utf-8?B?OGxzQ0Uvc1JvdE8vWVZuWGpRRnBIS1dmNWVQSDV5V3BlVDJhTlFDRi8yUlFE?=
 =?utf-8?B?VlZEWGdMcjdFNVl5QnZYL0JSNzNvbTBQbHA1OVc2SHgzNjcxOVNzdk9zazlV?=
 =?utf-8?B?ZCt2Sytyem9GZVk4SnFDUlFPdUd3OFgxSCtzdzFoWnhzMEIvUlBGRnk0Vzkx?=
 =?utf-8?B?WlRoTkd3U25PVnA1ekdIa0JFajNGK3R1VzVoSDBVSUROVEx6dTZmZEVON1lT?=
 =?utf-8?B?dy9ua2FwRDBZdFhnSEpMTndIN2Fkc3MrS3pNa3hEVDhQSFVPMFQxWks4ZXFF?=
 =?utf-8?B?M3NyUkg2bGo0NHRrMmp5MjFIdG9OeHd0bHF5TDQ2UGJia29GWEp3RHExTUFD?=
 =?utf-8?B?d2xxbFE3SUMrcjVNQzJJR3NtNVRhZDJZcDN0MXU3RzBSK2xoNEU5U21BL0NX?=
 =?utf-8?B?Z1FMZiszbGFoNkJQWGNkQ2ZzM1VsTzVUYlVZeUMyNFBkd3FXMG1VRU9pbWFI?=
 =?utf-8?B?ZFFIYnVBYW1tUXJ0REk3SlR3UnVHTk0zc1Z4bEx0aEFmOXY2VUtJRVJCTU5F?=
 =?utf-8?Q?S0tqrbBvpAVdp1ldxKYElvuHj1b9wcay?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2tRaFVKSkxhNENTa2ZDVC9NR0FwT2FxcGEyMGJqOHNVOUV6UlZHQXJ5bWIr?=
 =?utf-8?B?WjJYQ1ppeEZTc2FIWjhhTU9WbEYrRUs4ajRrRWxyVi90ODk2WkFUUThmOEtS?=
 =?utf-8?B?UTZtUU9EVHhpK1pFV3pVSEJiM1VsaWJPMUZCU2E2YUVESk15d24vTHcxWkJL?=
 =?utf-8?B?TnkrK0hCeUdkNDFZM0ozdWVnc2tNSy9Pd1FwUGlDU0FXcnJYOGlFdCt1dTVQ?=
 =?utf-8?B?bnQwWjl5bWNRTzREY2ZGQ0ZzWEIxZXF4MVorOE1heWMxWUw2ajZkUmZHaGJQ?=
 =?utf-8?B?ZzNtMDJnTnFjNWZBUWE2bVFZcEVIbExtQVhGaWlNWkxrVnVNR3pOZWF6Zmh3?=
 =?utf-8?B?aDk5WnBaamxObHhmbzNBLzNyd0FheXNDZ2xtWS9WcDFKTDA3UEVRV1ZBUG5S?=
 =?utf-8?B?aHJQMzNQcUpXT2VJMmQ2a3dwclJ1VWw2bWVpbFNGemsyeTE0aytyZ2ZSQUw0?=
 =?utf-8?B?eW1XTUFWMUlFSmtaVkpMSkNUV1RGT0V3SUxMUGpWQUw3OXd5YTNtZmVKWUM0?=
 =?utf-8?B?MGF2YkhVTkdqbnZrQ3J6Smk2cUZPcWJNODRZQzRCVEdQS2cwbTA4QndQWmFr?=
 =?utf-8?B?bUNJTjRGd2Z0Sk9NSzdtUU8zSHF3amFvRmg1dThiOHVNbXJFU0xQelVxeFA3?=
 =?utf-8?B?ZWRVaUxML3ZZWTlZQ3JBaVY5cW5iS09aODE1NkRuVy93YjFuNjJUUGFFV1Bh?=
 =?utf-8?B?SFdBWmlWUE9KUW1WUHJJRGpQSVdmeUlvaDgzcWNQVXJ5Y3RDNUJpVFh5aC83?=
 =?utf-8?B?dW0ySWowVHR3WjFGY1VyMkdiL3FRdmVqWUdNa2xDMUNDQVpqakpZYm1DanBB?=
 =?utf-8?B?OEdyeCtyZyswRVFQWk1VMkhMQU02enBpN1ZUQTZSZGZMd1ZTcmZhTEFTWmZV?=
 =?utf-8?B?SUFvUFJxemlVS2l1V1dHeWJxOTYwYjZib3hWS3Z2TXlVSDhWNm9OR2JIR1pT?=
 =?utf-8?B?alI4bngrbnkxZGpDamd1WjRKZzF2dTBpY2llNUYwaU5hSy9oNUhHSHF2VFJs?=
 =?utf-8?B?SFNyZHZXcjZHWjhwZmtKMjZFMFd3dUtqZ3RISHE5dW0wUlNGQjF1ektVbHly?=
 =?utf-8?B?cE03dGxpaVFFdFM5N0s0L08wYU5lMFVjTC80cmJTcGFyY1VZNWQ0aHViMkZK?=
 =?utf-8?B?OEVQK0NWV1pZdHVpR0dnWjY4bDErTkFsMDJOT2l2MjdrK3NuVjZTTDV3cUw3?=
 =?utf-8?B?YlBDVkZjWlk1d0QvSjczazZYVkZ0VDlvOTA5U1FXaERtd3RIcm16UkpPRmxP?=
 =?utf-8?B?dG1IWTBhR0ZaeVNlS24rZEJPU3Z1ZXMyRWU5VFBpcHJPUE8raVI2YzdDaFR6?=
 =?utf-8?B?OWhyOUtnT1BBMi8wUXNQa2MzQXNESFV3SHZON1Rpd2x6QUEwTkFQQ05VRHVz?=
 =?utf-8?B?RWRZT3U0K20xR0Q2ZWhPTFNYakVIZVVtM3FHUGdyVy9VYWF0K0FXMTdPaXlk?=
 =?utf-8?B?TjBTa2tBVVp5MitYUGI1WXQ5SDZ1Z1ZmUnlPZEx6ajNBM2NTRXk0b3NxM2Vx?=
 =?utf-8?B?U01CRUJLMVcxd2JOQUNvV0txS0ZkaGJjNHBJREhsWCs2dXdqdkJFMXFueDFX?=
 =?utf-8?B?ZlEvb3RKRW43eU5wV2hXLzBieW9OVGVvYVdqcUs5eU1rcFF2OTFBV01ndFNr?=
 =?utf-8?B?SnNwc1RvSW15WGxVQzRKYzBocHNzY3diWFduRDdBT2pnaTFRZEJDakthNFgw?=
 =?utf-8?B?bkRkQ1h2K2FnNml4T09oV0Fsc3FxRDZqOUxvbEtDbkhzTjhjRlRRd2diVEF4?=
 =?utf-8?B?UktUNm5jaGhtSjM1eXU5SWx2dlNGTGtxUzlIZndzWWw3NzRwblBBaGZyelBU?=
 =?utf-8?B?Z0J6M2g3N3lTeDU1dUcvN28vbkszZ2Zma05FbDBLOTdlc2JyUlFIM2lqQXpr?=
 =?utf-8?B?eUJUdUtuYjIrVDY3QTAvNjJ6VDBVSlhLNkplc2hOeTVnRW1xUC9pSzFQNEk2?=
 =?utf-8?B?UzJud0hlb3FDeFQ5V055RjdZYmIyTFpmTUVGWC83c3k4WHc2VGd5U2g2RDBV?=
 =?utf-8?B?K0xtZHhFbUZWWWl2R2orWmJIdCtRYnBxbnNCTCtKRmJ6WkJmanNMUm5McENF?=
 =?utf-8?B?TkI1TDhEV1NnQkN2Y3lNSlBMTlFsUUtwOUV3UkpaL2FuZ2NKdlJ3clg4Y1h4?=
 =?utf-8?B?SjFWRFE1ZWQxNDhoVVYySFlJWjc5a3pkSVN1SWtESFppdlNlemg0ekxNcW9V?=
 =?utf-8?B?OHc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f98cc58-a421-4982-732d-08de23b28c84
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:18:10.3533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10sgUmrnJaiBR8iC42TBFhEmSleKtaP87WLPDi/OXd3efV/wm0MUz5hq6iDN84JzmNQjd/QfTmtf6hqs5ZOPA8zovyHpAYN9hKE7mdKatIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7109

On 14/11/2025 3:40 pm, Oleksii Kurochko wrote:
>
>
> On 11/13/25 4:43 PM, Frediano Ziglio wrote:
>> From: Frediano Ziglio <frediano.ziglio@cloud.com>
>>
>> For xen.gz file we strip all symbols and have an additional
>> xen-syms.efi file version with all symbols.
>> Make xen.efi more coherent stripping all symbols too.
>> xen-syms.efi can be used for debugging.
>>
>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> Thanks.

Thanks.  Unfortunately CI says no.

Ubuntu's 20.04, 18.04 and 16.04 all fail: 
https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2159622869

From 16.04:

2025-11-14T18:01:51.192964Z 01O strip xen-syms.efi -o xen.efi
2025-11-14T18:01:51.198151Z 01O strip:xen-syms.efi[.init]: relocation count is negative: File truncated
2025-11-14T18:01:51.198166Z 01O strip: xen.efi: Failed to read debug data section
2025-11-14T18:01:51.198169Z 01O strip:xen.efi: error copying private BFD data: File truncated
2025-11-14T18:01:51.198932Z 01O arch/x86/Makefile:207: recipe for target 'xen.efi' failed
2025-11-14T18:01:51.198937Z 01O make[3]: *** [xen.efi] Error 1
2025-11-14T18:01:51.199616Z 01O build.mk:90: recipe for target 'xen' failed
2025-11-14T18:01:51.199619Z 01O make[2]: *** [xen] Error 2
2025-11-14T18:01:51.200402Z 01O Makefile:600: recipe for target 'xen' failed
2025-11-14T18:01:51.200409Z 01O make[1]: *** [xen] Error 2


I find it hard to believe that the relocation count is really negative,
and given that newer binuitls works, I expect this is a binutils bug.

Nevertheless, we need some workaround.  Given that the previous
behaviour was not to strip, I think we can reuse that for broken toolchains?

~Andrew

