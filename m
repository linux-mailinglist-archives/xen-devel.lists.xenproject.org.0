Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8523BF5A84
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 11:56:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146943.1479279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vB96f-0003qV-1r; Tue, 21 Oct 2025 09:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146943.1479279; Tue, 21 Oct 2025 09:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vB96e-0003nc-VG; Tue, 21 Oct 2025 09:56:40 +0000
Received: by outflank-mailman (input) for mailman id 1146943;
 Tue, 21 Oct 2025 09:56:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5X6=46=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vB96e-0003nW-6q
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 09:56:40 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c60b6ca-ae64-11f0-9d15-b5c5bf9af7f9;
 Tue, 21 Oct 2025 11:56:39 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by CH2PR03MB8057.namprd03.prod.outlook.com (2603:10b6:610:27c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 09:56:33 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 09:56:33 +0000
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
X-Inumbo-ID: 3c60b6ca-ae64-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQf5vRR7BBJUcxELEbjWDWuI4zmALUDZRpX7EQ/w2tu5lqbdSlG9A8u/bfW8xSKlYjBr74TlmCiWtMAH2kVrB0LGl+Rmeemxz2ZDQbHO+YbwYV+2ogDyud1rSFVZHfZvxxqHqPMLRz1/HcvdAeGQ7wy/rpMnhbBJf9DowK8EVD66/ss1tSmk3J15XfsZyGxM0lww2ekLJvwEzHjiOkYwGo+7hv3kYobxtE2tEf3FdwFIN6ybkO8Bk69LVx5nbgckfKljECQMK+dMA5F7nXB3RNR5r0VwFejUI5pmq81wzMQZjRaiH8MfypZHKqM/UQmDHlriopGxY1oqZUhm+Lkseg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6Rf6PVv7a2t+qr29NjigOfDiFIdJWfUU2V1r+0wO38=;
 b=vl55A6+50Fti/ElxQat23RljlSbfURcyGilm1ZeMGRd9vsb4Mk7QamkcW6FzRWyPFfe0vFFQCXupcayAJOXNI1uVX15yEx+2gg1z/ADSQ6dI1VWv/CSmMlOR8C3JkPSNqWvXYW4Y0usd0IyvuEer+0Gw2XZQTgTslv+q7KeW83+Qe6itPtM6Vd1JFHRWrGVjJ0uUTMOafhBomt+v9nsyICPwVOG/wj/uDITqXdwvT+o/AoCdLAFLFjJRDD2eBTeMIIs7boArXPh+NKPXx5sFNFXtxeCYykqGR9XvvC5J0ZqaeM2vhGMF44NdTioWdzhaalBDi3zQS/vuU8226dfTHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6Rf6PVv7a2t+qr29NjigOfDiFIdJWfUU2V1r+0wO38=;
 b=N84q0eR/plaGL8jxWGfyRQtCKvnwcqZydbpPWD3ZDEcq2bJDF3AUzRFsJUYekIekdRP2YBQDC/ekKbKZ4TqVfBGmfWM72V1a7/GeE6eueE4AMrmfCt0g+3Jjwv8AE+7hSWFRgnlIidTPR3DsBHXkiOF7E5w4IVKRVdP3bvvH4yc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 21 Oct 2025 10:56:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] symbols: discard stray file symbols
Message-ID: <aPdYzDVniMV6-bHd@Mac.lan>
References: <2412a7a0-bdcd-4647-8ea2-8d2a927dcde3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2412a7a0-bdcd-4647-8ea2-8d2a927dcde3@suse.com>
X-ClientProxiedBy: MA2P292CA0017.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::20)
 To DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|CH2PR03MB8057:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f84b4f1-788f-40c2-4222-08de10881dae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bm9URjFnZWFEcExxTHYwcEh5YUEraEQvRXV3S0s0Q3V5MUJqRUlLVlp1NzN5?=
 =?utf-8?B?bGsyM1UzeS9DdVdZMjRBZ0hlSm5qMklQRkRUQ3dtNy95OGNNSU5vWnFUWm81?=
 =?utf-8?B?NnhCcnV3NUZ6TG1FaStMdGQxY0tKUU9BTExWM2hWd1NFVi9JVHZVcFhtZ0di?=
 =?utf-8?B?eFFQTUl6NmNsaHNSb3lkL2ptZEg4UXhJbFV1a25jOVRnaExhbzBzb1BpSE1K?=
 =?utf-8?B?UlJFeDBZV2c1Qi82S0VKNjliYkgxNS81S2FZZExsUkxIcXJxNElPUER5bnRH?=
 =?utf-8?B?MDJ6TVRYZWtoTG1NOTJXTDNCOTR5eFVpSVpQbUhyRWVFQ3ZJM2Y5TFhJRmRU?=
 =?utf-8?B?Ri9iekpnZWJYRVBQYy8weUhpTkVkbVJYbVBNS3VIaVQvb3N0QlBWY2p0bWlT?=
 =?utf-8?B?U0t4ZGIzZVc5bkFkRU5xTzJ4Z045bnZyc0VZdEJLZGhrZnpGUVBHb1RWNWhH?=
 =?utf-8?B?VkRVdVZMUUMxYkluMnJtNEdxWml0RUFWcVJoZi9YMEtWN2VlNTFDTDhBSlRI?=
 =?utf-8?B?WDMwVXpCZmxJUlp5ZWRLS1IxSDF6VVRHc2ZOV25tOHd6RkR6N2I4NTFVbjRE?=
 =?utf-8?B?VHRHUTJuVUUwM3RrSnBiQkVhOGd3Q0xjZWd1aDVnZXdTNlZHZFpGUXhNVmk1?=
 =?utf-8?B?WDFnQkE2R3hkZHdiTmJ0Y2pCaGhBZ3A4OFJPb0hNQ0J2QzdieFFOZFhpeU1h?=
 =?utf-8?B?eDNRS3puQklmb21jeDNKUXgvbG1sVUdqV2RXc0svcGRaaEhBMlBBRTg5SVIz?=
 =?utf-8?B?MjRhWHN0NHVZK2p0bzRra2toMUxvWmRlN216MUNuS3lqaFNEL2tiRy9hN3pu?=
 =?utf-8?B?c1prMzZyMnZQdTV3L2tnc2tMdTR2NG8xWGdXdUJzTm9kTE10YVdPeENaZDZH?=
 =?utf-8?B?QytRelRlclExOG9OZVc2Y1dobFJkV0duQzlNWVo0YVRKK3ZiSHFaZVU5ZWRt?=
 =?utf-8?B?L0tkV2JqVXZLdWpJRytYRVJFY3RpdjZ4bS93NFBnOU9DYnF6NmYwOWp1QlU4?=
 =?utf-8?B?WXllMVUzTnJEOVlaZksxWW1KOWJDb0tydjN1eVRTNGQ2NEtjL1p0N1Y2MzRJ?=
 =?utf-8?B?NzRDMWNQWGhVTmVFemZsYkNxaHR2WW5lMFBQcGhsZURiVlRKemVOSUZQYVhO?=
 =?utf-8?B?NmhnU3RtV0o0MUwyWEozVnJyandKVWlFSHJ3eUJLWWVuYkJnSDRRRGNyc1Ro?=
 =?utf-8?B?SnZUa2lONklVU3B0S0k5Y1RzWlZ6eDVjajNkdnVYenRZNmtRNjU5RTR0NzJz?=
 =?utf-8?B?TWRjcEtXUmZyOUZNV3J1RFNnNVI5bk1pNGZ3anBsckNsY2tVYmFWd1N6MEFD?=
 =?utf-8?B?b29TeUNwNDhLWDhDakxrRThTYUNoejNoeDJpK0E4SGozeStPamNZM085MHl4?=
 =?utf-8?B?cW4ySmdKZzhXeVVCeFFoaUtESS9FejBHZjhNTEpmajRiaEhOdFFoSWxnMGRN?=
 =?utf-8?B?aXdWYkIzU2t4K2ljRDNCQit5ek5ZOWMzaGcxOEJDRmtLZlNuRmU3NUxFbDdY?=
 =?utf-8?B?NDQwNkNWYVFwWE9TYVFmbnFndUdVQzZUays2ZVI4S2ZGZTRXSE1Va2hsN1ZW?=
 =?utf-8?B?cjVBamgrcTJiNHpHS1U3NUFJU2hSS3hnMmlRMWM5em1QR3BBR0w4M3c0ZVlm?=
 =?utf-8?B?bnhnOTRiazQ5cHFnczFhS1dJVXhNSVBVU04wVVhBNWNLN0puc1NtbWs3MkVm?=
 =?utf-8?B?NzBpOUdrR0xsaUNZSVlobnAzWGVoQ0c5OXJPd0N2TlByQndtUyt1MDVCVGJt?=
 =?utf-8?B?cytoQnREK05lS041NjBWV3RKNEp5d0Yxa0xFVmkyWUNJV0lPcU4rSzJSR0ZM?=
 =?utf-8?B?RXBLbUI0Q0h4cEpoVkw2TXB3SFhKL0V3YXlkVTczOXFNU0lBQ1E5Um45dkE5?=
 =?utf-8?B?Qm81ZDZsVWZLYVZ6UHNrQ2pxNjBBSzc5RVRhZkl3Zks1RlBnNVpqZlpVbXkz?=
 =?utf-8?Q?5vF2Pv8iEKTT1mLx/c9VwvE6dadWE+yL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTY3NlJpd2tjaFlWVjJCekpKaHNxWU56SE0yU2xsdEltYm54Yy81NUlVLzhP?=
 =?utf-8?B?SmF2eThQUnV1WU5hSXp1TVh5NHYvVGVrUTAxYytyZkNXM1ZKWDVZTGMzUlFP?=
 =?utf-8?B?Q1lUQzRmODRXdEtCeVkxTVdpdjR0SjlMdStqQ0tQWlFZaGV4UE9CZm12YTF5?=
 =?utf-8?B?aWthdlZibkZTVmhoenIvSUhrNURjb1BSNzlwRTBaejc3VTh6dFI4UkFnQ1lx?=
 =?utf-8?B?UGZ5VkhXejZ4ZENuOW5tSDdCWGY4emxhNHQvRXNSQnVNMXI0U0VxNVFVNWQ0?=
 =?utf-8?B?anBMYXhHZmtYcCs2dVdxeXEvQVF0YndxY3drdEQ1dmFObDl2OTZGOHNYZThU?=
 =?utf-8?B?RnQrR0lTTWd4am1lNmVGaXhPVXlzdkw4bHVQUXhkV2ErUkF4ZkJxVHhNcDVl?=
 =?utf-8?B?elN6YTltOFZ5T2toejFsaXlDdTRHdlkyT0ZyeFQzcEp1RHhoRE5Vc2ZDMzBF?=
 =?utf-8?B?aXpuLzByNWFUbFBXTWYycUpJa0hqd21ydittcVhLZ2NXVlk3bHhoUUV0VWlF?=
 =?utf-8?B?Tml1azd4aXJ3ZVBFRG1YRTZBajBLNXhtdE9IVVBCSHlvc2lXQmw4d2pMYWZn?=
 =?utf-8?B?czVqTDBRSXhVZjZ0WkZVMU02YTN5MzZtQUtlaHAwMmhVM3AzbklBZ2wwTWxv?=
 =?utf-8?B?WVJDMzRMQ3VkNU9zVDhKU1hXeG5Md09HbXp0SFg1MjZTbDA5S2pVVTkxbVg1?=
 =?utf-8?B?RUs5c0IrWC9WS2FrTnUxNDc1Y1BTYjlrNTZmRkFUcGJZWE0xVjltUHlRZXEr?=
 =?utf-8?B?RHptcjQrbGo2UjFicGJaaUxBSllVRXljK2lPU0l4MjBrZDRPUFp4dllhTDlh?=
 =?utf-8?B?RE9rMWJqS2diOXEzNUpBQk8rSk04SVJWdWw0a3ZPOGJyK1ZwRlFKenlEQ2tJ?=
 =?utf-8?B?WXozdVdxcnFERE5vbnNMY0tUaHQybTNNdUZZTzZUYitiTWJSNjFBczI2bzcw?=
 =?utf-8?B?UU82N2JtOUJIbTFMMUg0dmpURG10alFJNG9nRk1RbS9OaFgwblIrQmlXcmU2?=
 =?utf-8?B?SFdpb01wa2EweDdVcnRTRWFkU0R6RjF1MTNMdUJ4OWE3eklRSHd2dXhBampO?=
 =?utf-8?B?T2gxWEVLZHpwdDNxNU1wdG81ZmdObzFaYTFPTWhKN3VCU3VtaytCTk1zeEIr?=
 =?utf-8?B?dnFzRDdHeXNIL0NXYmc3NUgzVHFhbm4rU2FzMFpaYlpmUVZ1THlET20wSTF0?=
 =?utf-8?B?MkNiazF0SkU4Q3psc2lFNEI3NzlZYWRoai9xTy8rYzl6bmk4N0tJMzBuS3kw?=
 =?utf-8?B?dEF3emkzNHJLdnVNSTliY1RGbGtoeU1TTW1RY1p5czQvQ1N2Wjh3UThuTXJG?=
 =?utf-8?B?a2ZGWkhUTUlQZm8yT0hid01KZ0h1Rkd2a3M1eDJSYy9ObkpMVVk5QTFUUVlU?=
 =?utf-8?B?d0VjeHMyQTJmSEx6aXJJcmROVlk0VUYyYU1VUHQzakp1UEhNeXNkcm0xUWdU?=
 =?utf-8?B?RitDb3NSZWg5YXBielo5czFzT1pCTVpLNDQ4U3pJaUdTWUhMVXdOU2hTRTds?=
 =?utf-8?B?TkR6K29UM1ppZ3BiU0NKMGM1V1lkc003RjVRYTk4bnBOZ0gwVVdQOFY0VzZo?=
 =?utf-8?B?ejd4N2czbTVlUlVtbWFkU3FEUk40TlpzajZYNW4vSGhqMy9zWW10RzlrNDhz?=
 =?utf-8?B?VlhEazhxdUxBTmhmWlg5NXkxYWVoT0lnbytzVE9ydU5zNk5pdW93L0tIcnVz?=
 =?utf-8?B?VmZ2ZjlBc0IzNVhBNDIrQ1pseWlBTEhBTzBrT0xDTEgxelk0akJwczNHb0I0?=
 =?utf-8?B?alV3UEp2NkJ6UTB6UGJQWHNUUXNqK0sycm5KSVlVSUFIeHZwZGxFUWJvMWdj?=
 =?utf-8?B?TTN6YkMwaHYveEVXUXhZbnFoTWl4NVFkQnJsNEc5VWkxaXcreEt6d00yTUtD?=
 =?utf-8?B?QTkvUFJsRHNQUTJjdUEzZ0lWQTdIeDFteGdiaGhxVG5UNVo4a1NoaUh2b0Nk?=
 =?utf-8?B?UFNXR0tNd3VyZFFKa1BmM1o4TDNWbnpiWUpaSUxVZi9nRktwOVJXN0sxR0dU?=
 =?utf-8?B?REEyK05hUGxVazUySFFsVmQ3YVA5WTBPK0cxT3dFL1Z3WTdmQjBWUGpNNVZE?=
 =?utf-8?B?SXNWbE44UHovc0VicEp0Y1dGbU56OTFQMGVqZE5XeDNQN24rR25ndjlPNmxV?=
 =?utf-8?Q?5JYQqxKHrJUoKlJlfKrEOHJxG?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f84b4f1-788f-40c2-4222-08de10881dae
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 09:56:33.6442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /wsjGtJdVUOsq5qHuln+HTzAbmYR4eIH571WzSU57M1uNx1NTpPPjTubx8jzsTcgLuQqIWrzyeOP/YYTxgRuNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB8057

On Wed, Apr 16, 2025 at 11:00:57AM +0200, Jan Beulich wrote:
> By observation GNU ld 2.25 may emit file symbols for .data.read_mostly
> when linking xen.efi. Due to the nature of file symbols in COFF symbol
> tables (see the code comment) the symbols_offsets[] entries for such
> symbols would cause assembler warnings regarding value truncation. Of
> course the resulting entries would also be both meaningless and useless.
> Add a heuristic to get rid of them, really taking effect only when
> --all-symbols is specified (otherwise these symbols are discarded
> anyway).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Factor 2 may in principle still be too small: We zap what looks like
> real file symbols already in read_symbol(), so table_cnt doesn't really
> reflect the number of symbol table entries encountered. It has proven to
> work for me in practice though, with still some leeway left.
> 
> --- a/xen/tools/symbols.c
> +++ b/xen/tools/symbols.c
> @@ -213,6 +213,16 @@ static int symbol_valid(struct sym_entry
>  	if (strstr((char *)s->sym + offset, "_compiled."))
>  		return 0;
>  
> +	/* At least GNU ld 2.25 may emit bogus file symbols referencing a
> +	 * section name while linking xen.efi. In COFF symbol tables the
> +	 * "value" of file symbols is a link (symbol table index) to the next
> +	 * file symbol. Since file (and other) symbols (can) come with one
> +	 * (or in principle more) auxiliary symbol table entries, the value in
> +	 * this heuristic is bounded to twice the number of symbols we have
> +	 * found. See also read_symbol() as to the '?' checked for here. */
> +	if (s->sym[0] == '?' && s->sym[1] == '.' && s->addr < table_cnt * 2)

Maybe a naive question, but couldn't you drop everything below
__XEN_VIRT_START, as we shouldn't have any symbols below that
address?

Thanks, Roger.

