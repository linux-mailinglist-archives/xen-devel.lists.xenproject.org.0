Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF52BDED4D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 15:48:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143622.1477333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v91rY-00042L-K5; Wed, 15 Oct 2025 13:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143622.1477333; Wed, 15 Oct 2025 13:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v91rY-000403-E3; Wed, 15 Oct 2025 13:48:20 +0000
Received: by outflank-mailman (input) for mailman id 1143622;
 Wed, 15 Oct 2025 13:48:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pY79=4Y=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v91rW-0002AF-Pc
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 13:48:18 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9aa4074e-a9cd-11f0-9d15-b5c5bf9af7f9;
 Wed, 15 Oct 2025 15:48:18 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by CH2PR03MB5176.namprd03.prod.outlook.com (2603:10b6:610:97::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 13:48:15 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 13:48:15 +0000
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
X-Inumbo-ID: 9aa4074e-a9cd-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtGd03Tg07zBTGw4RZ5REucuXaHIFf2aHMQxpq1dqtTYDIiIum7ebUpWtj5auj6f6i+gW3ih/QFDjdHT4p08brERvUAhjAL9MzjLCoWceIHNqGsJ1h47T7M+QWwn7XKmmspZmyJ3QA7BdgrqUajMAqHhU3EfWaUCGDh9/0SUXymjNKnFVDGXnsTH1Xuely6H9HAcB/zj5yvPywjD5g/JrTu8b81QX92vSkpjswJQeNvCaI57LPC82CdT2Jf4XPzPg0ZtfwbyewRzJNuOI3ERds62veHZoxB/xm5Mw5wnhtOgRF8UYVtl2FZU4xywbzrLAhWsKPpmqXZatGxa7/FaiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4ISnr9KPhzDl9r+JqhO5V5YHuJZe//Ip5X1jvyo0Sw=;
 b=f2T9LdamLEsTArjCLFIJnreEvivzK4ADFzt/l6lLtt0AzV57+gOAQOby2BMwWuQdm4J5C78N/bwoYdm/LzewX0y5lf9zhTI+oIII5vUE7At8IrVJSmDrWwsTMBB+opbp/DwC3DYXBs7FL9o8XAz2QCl6DXLM88KUbP8m0we5cUHSGPk2D+xzRT4BMBnC6yO4oRX0gilVOOdzXbm7eodgX8OL/QRhZyJBfMUWESPouAzAINzqxWEp0vevxwuFbiZZRR+pMSKL8in3ZW5te7PlERtEALSIWv4Am8WZ+bNyGoWPT4SaqTPdDoEnYfonTplmKUPvOiank2f0yxKDe4cLIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4ISnr9KPhzDl9r+JqhO5V5YHuJZe//Ip5X1jvyo0Sw=;
 b=G2bU7O9w5+HHo0ckjwxJ2O7R5Nc5bY5790WJCGecYUayLPhOqUzuFTyUdMUCkT5r2N7KdAnxPFsr9xGsP0b08fufJ1f/Tom1Ng3IWFoKW/F64CG0U9H7ce+AABzP2g9V+N85rHLhJPxRJKKkO8iAxiJW+2nU6uLV0kyuzjo3AdM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.21 6/6] github/coverity: switch to building with json-c instead of yajl
Date: Wed, 15 Oct 2025 15:40:43 +0200
Message-ID: <20251015134043.72316-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015134043.72316-1-roger.pau@citrix.com>
References: <20251015134043.72316-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0179.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36f::11) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|CH2PR03MB5176:EE_
X-MS-Office365-Filtering-Correlation-Id: a0ad7add-996f-40d8-c213-08de0bf17d48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZENQNnhlUS9XbWVBWUlHQ2szbzc2aXpIWmlsbHdnTHViSk5uS2lsVTJrczVW?=
 =?utf-8?B?U1NSQnFIcjE5MVZOc2ozN3JjNjlSZzRDQlJ5S1RyeGdwNmMrVGxYWG1RbEQ3?=
 =?utf-8?B?Z2ZuRUIzWCtERHpqMHRRVVl5czZhSTVCNGRxYUhzMCtBSDdiWWJpNVE1aUxt?=
 =?utf-8?B?UWVNOUtjLzRPckdlei9xMGVyQThDN3VIWXFSQWJKQmR2SXhBamZ0WHlMWm0r?=
 =?utf-8?B?YTlXMFJUR2J0Sk1WUU82eUdPTlRZSUtqWFhrYkRtWThJb01qMSs5d1BCcEpz?=
 =?utf-8?B?NHBBV0hDd1RVS2FuRmtxekQ3anJhYzJUSzFmVGpPNktXV1VvNjNwa1cyZi9E?=
 =?utf-8?B?SzN4c01VMjU5OGlUQlBObkFMaERIUXZvZXp6aU9uZytTeCtKSUZkV2VOVjQz?=
 =?utf-8?B?RVRMUVp1QzVITDhneVZUejk0VjhPRTlkMXhyS0hRUTlUalFwSGtBSk9FYWMr?=
 =?utf-8?B?ZjVUWnZGOTZZVWthNXNxc1RIQ0g3VnpiaC8rU0FMTkpsS3lwblJsbE5pL1Fa?=
 =?utf-8?B?Ymd6c2dzc3JDTzF4ZTRBeVhMVXMrdm1GVHVnblo0Qi94YVFWUkd2SUxLSDV6?=
 =?utf-8?B?T1FKaXNIQXpWa0d6YUZ6aHVuRU9LbTU1V0M0Vi95UWxGWTlxMnFWQmNWcG9H?=
 =?utf-8?B?V0VWTUszUllsdWcxVnV1VnZ6dUVIWkxBa29sQ1dYaE5GVm0xVVJjZU9QYlg5?=
 =?utf-8?B?aHFQcmZTMGExMTh5OEoyUmNGeVFyYXVtcU5Dalc2aDljdzFMRkphaVh5ZzVG?=
 =?utf-8?B?TE5SWjRKNkVYN1p0eVU4TlROY2hwQktadDU4MVVRdUxTekNVMmYvbGJNMUVO?=
 =?utf-8?B?Y05helRaVVhpajl2NkVlK0kvZVlxUkgrNy9uWXRWbU1DNHZVTlo5eVFuRENK?=
 =?utf-8?B?eXNPc051UU5hbHprWDRCVmErT1pBcFNkcDdXbUxGK0QxM1NuSGZxLzMxTXRm?=
 =?utf-8?B?aCtsbW9UT012Z0JnaWtaelE2RzJ0RzljU2w4cW5wOW9jUlVTaW5oNnRtRUk2?=
 =?utf-8?B?WEZIUGgwSm1MUVNRNFlYUzF1MkozOTV2ekhOWm9oWHdxSnNWc05sWHZuZ0xE?=
 =?utf-8?B?Tm1QaXdFTFZmWjZWMms1RjhVUGU0NEJ6OVFvM3E3bkJGT3lpcGFNQmlWQmtR?=
 =?utf-8?B?VEFnMkVoNGROQU9DQ2Y0TFB6T1R3OVNDR1YvWGVBVkZ5UUNuNEl1Q3JwUGJ2?=
 =?utf-8?B?aWJHLzc1WCtYSkUwNEJSQUZHY1BOUUpNNDd0UDJQNnRlMXdHVkU3RmJvTnFp?=
 =?utf-8?B?RUFrVXBySWRlSEcyRmdiVlJqNGRESmtIVm1VN3FqNENoNHJzMTNxUC82dFcw?=
 =?utf-8?B?dnBkZmpjbC9FblAvTjFVOWI4K2NJUm9yNytyTTRMOFZma2VieWZINm9ZMkdv?=
 =?utf-8?B?TUVxeCtCc3NmUjJiOE53MHdENThQclpDZmlIaFM3NmovbUhFN3NDRTY0R2VQ?=
 =?utf-8?B?UGE1QlJBcjg2OEFxaU03b0lDKzRrM2hUWDkrcW8vaVZFZ0U2bTFuVFdYQWUw?=
 =?utf-8?B?QTkycDJ0bkgvaVdteGhNOHhkYjdQVXgvY0xMWTZVdEhTSFY0U0FJM2grNXhh?=
 =?utf-8?B?NURUUEIvdG1WNHVvQjIvQ1dDTEhGa1dqYnVIamVJcHdjT3ltM01TNUxqdzZ2?=
 =?utf-8?B?QWxWS1U4UnhRRFV5SHBkZ1ZOd3FPb0tnUWkxdmRGUm9nYkRGQjZpU04veGFE?=
 =?utf-8?B?MS9CcTJiM3FvT1p5U0x6aVVVSnZUZVlQN3o3a1hEbUZYUnZ1TVFmMlV1OTJW?=
 =?utf-8?B?bitUM01hOXZleS9udmw4MjBDYTVKQkl6UnBHODZEVENHaEhmMjJxMnpLRjZt?=
 =?utf-8?B?SnNZMlI4Q1JiMjBwelV2Q1c5Q3VqU1RTY3ZGKzVXb21rR3dXVDg4eFBmcFpU?=
 =?utf-8?B?L2E2VDBCVFJRY2pJNnVYaWExNmJ2NDZFcWR3RlpYMkN4elN1UEUzNkhjVVlm?=
 =?utf-8?Q?rq8PBuV4TCMsfyU68IWTGeXrUxv1e98+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sm5tYTZQS3AwLzNOZzdJQU9WV21yVWdkczUwa1YzTlhvM0pRR0hKa3NKOGRN?=
 =?utf-8?B?UXFpQmtYY1VxT2FrUnRhVkVoMUVPa1B4cm8rekdVcTZmTUZQVmJNcnRSTjMw?=
 =?utf-8?B?ckg1emx3RWlDd1NQcEFpZDhjY0J3bGx1bC80bk5aTytaOWdOczNRVFdkWUJo?=
 =?utf-8?B?NmVOK0hlSVRkaHMrMG9CMkVqdzJCNnJidTQrb25kU2txZ3FOZ29YNkFuMklU?=
 =?utf-8?B?R3pQY3ZZVytsSW5lUDNYTitLdjNRSitwWU5xSmMrM1EyeUJSYkhPcDFIKzNS?=
 =?utf-8?B?Qkthb1lCRGljbDJNSFlZQ1Z4Z2ZNTHFIdTBScFUrcnNteGFWVCtnODhITENY?=
 =?utf-8?B?SThiV1ZweDJYa3RsalNUUVVjVW5OSXNqUEFQT05Bc1lrb1dUdmtOejdsQlh6?=
 =?utf-8?B?VElzK1pUK3BTUzBRK1J2V0kraGVvN2tEeWNBaFVIOHMwYnlUeFNJNHk4SGYz?=
 =?utf-8?B?cmlQZ243YlpZNEU3K0dILzhaUm9qZ3I1YlplUFVGV042RUdWanJ3QXNYWlhx?=
 =?utf-8?B?WWNpWEdNcWNEQi9NbjVoVUJjdW1MN0xXS1A1VWRZTVZJdllhLzJlVEJENWVQ?=
 =?utf-8?B?WnpTZVlKeXVOT0F1OENCTHBtbVhNNkZLQlR5WkFsMGx1NFJhZFZlTzM3bkdF?=
 =?utf-8?B?aklGNnJiQWp5N3EvTWhLSklpdmxLcWN6RjZ4RXMvbWxNUVJuMXE3cG9EMGNP?=
 =?utf-8?B?UmFlbi9vcXJMZFFzMnBhWjc5TnJEUEZiTUxGbEtNckhoaW5aV3VrM3hPS0Mr?=
 =?utf-8?B?RHI1NWJLVzVMcVZ3b0sreGhobUpWK1Z3dkRuaEY1NkNSd2hXVEd0MVpvUTRP?=
 =?utf-8?B?TEE0TmwyUTZzVnBmb0hXZ1BHMUt6dlp4RzFvV05TK3VQd0Z3SVB4cWlRN0cw?=
 =?utf-8?B?OWcrbkFDcFI2NWxDTFhFVzhqb0s4YnlEa3NobERMRUM0Yjk4ei9CWHlMM0Ni?=
 =?utf-8?B?OE1LNzI1SEJTR3Z3b21LYTVtMXJiem00RUtaczFXUVI3NzhOcWN6ekJlcXhq?=
 =?utf-8?B?Ynk2S1liRVdsSm1jcFFUeGk2ZHBnWU10N2hCbGpqWWNRamNrL0JDZWphZVUw?=
 =?utf-8?B?clRZZXZNRmFnNFJDamFIQTcrVGt3ZnErVFJvVUxWaWc3TmwxWWhmaUtybFh0?=
 =?utf-8?B?dUtyc0V5cFVnWWVHazhBZERLYnpYc2JTU1hBenI1N1lLc0RNOHByVFYzM3Bq?=
 =?utf-8?B?MnU2ellXdWgzK29DVWFqY0VpMGZTbXRqY3VmbTVCWERaUlB2cGR6a05QNnND?=
 =?utf-8?B?VFg2eTFLZlBraHdhUXV3NVlKWTcxT3dRb1F5TzBFUlREMFVJN3FoSTY5UWhx?=
 =?utf-8?B?eHltWlRBTGxzdSsyVFRjWmQ2VHJPOFRicTk1OE1CUEpqbHdHYXlPZk5obGE0?=
 =?utf-8?B?cEkwZE1CNTNHK05jUCtFbTRwSno0QkphMnpnQlZDaCthbzlaNHRISG5uWTlF?=
 =?utf-8?B?R1RWczl3NWNCTHlvUitoZkxPTnlTNVZTQ040VnI0MWU3UWY5ZXRsUXVSYzR1?=
 =?utf-8?B?RGVzdWdwQ3AwV0VnVmFoellvQUxzZGk3WFZhQVhXcUVkTXJZRXl1MDVqVVdJ?=
 =?utf-8?B?d3JaM3FmNDU4Y0xIQnhRVkdyWFFMYjJ2eENPRkx2SDlqbHBOY3N5MFczM2JH?=
 =?utf-8?B?WXpaRnhObGo5ZkhYNi9zLy9zbm5Jcm1sbzVQZXpkclNoeGdpdGsxN3lJbCti?=
 =?utf-8?B?SjhnU3A2WnRtcXFmN2lhMUczUlpLN0tSSWFQQkxiZXAvbEgxcm1OVWdPVXdu?=
 =?utf-8?B?cnRLSkRzOXprekVLaFJRNG5aNEdTZnJHdUxDdFNOUFJPRngwQVFVNmhlYzR4?=
 =?utf-8?B?Z2Irb1ZYL01YVWxuaUdKUTlabFZZMk8wN0gwL01qdVBLa1NkQ1BCVWdoSktP?=
 =?utf-8?B?OWF0N1VUTVE0S3JWK1J1R29MeEF2V3ZBNmRZUkZMcDFZRlE4R1JGa1h2NzlU?=
 =?utf-8?B?U2RReG1hbm5nNm1zeXVLa25oVVMvNTM5bU9rbzNaM3JtYlFjb3JnWTdVbUZN?=
 =?utf-8?B?MFlaaDU3OUk2anJJS1NEU1kzeWhuWll6SzhyeEE2cWpCbE9tUnc4dnlrTW1O?=
 =?utf-8?B?ZlRJbGcvN3FST25yd0ZsRjJxVTQ5elljTFBOR3UwL2hGTGJLOVFCaEE2Nk8r?=
 =?utf-8?Q?afC0s807WiLygpskbB5a3SmfK?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ad7add-996f-40d8-c213-08de0bf17d48
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 13:48:15.1300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8VGxbYYIcliSOtGZPamznn+r8GZoWGER4LfUbQtLUMOWXhbv8958SJQxXfBHKwOh7V32WzTmPXHvmtJKsNBZ5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5176

Switch the json library used by the Coverity runs.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 .github/workflows/coverity.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.github/workflows/coverity.yml b/.github/workflows/coverity.yml
index a6c2819b0a24..a9a971f6a1e5 100644
--- a/.github/workflows/coverity.yml
+++ b/.github/workflows/coverity.yml
@@ -20,9 +20,9 @@ jobs:
           iasl \
           libbz2-dev \
           libext2fs-dev \
+          libjson-c-dev \
           liblzma-dev \
           libncurses5-dev \
-          libyajl-dev \
           libzstd-dev \
           ocaml \
           ocaml-findlib \
-- 
2.51.0


