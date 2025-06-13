Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D01AD8383
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 09:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013827.1392037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPyPw-0006gX-5v; Fri, 13 Jun 2025 07:01:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013827.1392037; Fri, 13 Jun 2025 07:01:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPyPw-0006g5-2U; Fri, 13 Jun 2025 07:01:36 +0000
Received: by outflank-mailman (input) for mailman id 1013827;
 Fri, 13 Jun 2025 07:01:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jsFi=Y4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uPyPu-0006fs-C7
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 07:01:34 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20623.outbound.protection.outlook.com
 [2a01:111:f403:2418::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2feaacb6-4824-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 09:01:12 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SA3PR12MB7951.namprd12.prod.outlook.com (2603:10b6:806:318::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Fri, 13 Jun
 2025 07:00:59 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Fri, 13 Jun 2025
 07:00:59 +0000
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
X-Inumbo-ID: 2feaacb6-4824-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wAUNYDVJfP+mDHFI4HNkKUDaTTtcYVQ2ZxK1gSl11fgL8TyFx7qmE4IuBzuyxuLhFJ6TXiBTkdFBps7x7ToMab/lzx4lZ8nZVBiauSP4FiXcw9l33EJNVy4+jh5pidkHUvM/lEOXwXOO7og7wkySC8aQCBnqB1aW9ElCEgC9m4pPuTm36abJdbUChyTaRJrxQzuKb/n55OWFPQAnzUOAWHjXLZfAP/I+dj6cg6r5fsBIS0dYr7XkGp60zph3YfKESvQp3x84OR2sg7cQC7ECJi9rS5b1nB+XNp6YYibL3MdZ6jKNYArtbE3ASkbQ0+w+nmR5A0bvfSxG9gkZIwvSbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpBJDW7E0xQHEKHrzpv/PEO5+ab0kS0fFWVIyzAsoZs=;
 b=r1vPnK9P89ddFs+IztUE+SaQH3LwQvnQGTl5gH9osnEbnY8Joka9lkWiqNb9yUKQLsznUsb4YxjF4uc79SX5aOOGMpkZCHySumbKwOGJFpmo9XuZl58jqdPqdZT9bRUPJi3p9hnjIIwldvPVUVWfSej8q2vzYFzvcAqlYR2A3nLQ+cADuOsEn/6k9xDBrdfUs+5XhV4s3i4anF3oIf7SmAjNDbDzovqKSrlVJQLC0CF0yQpysl0OI8QHQhmdJ87IoCaZmHdu55aElUITNecspW9M4LBeAAqkggPVyltufJ+xiKODH89NTUyqDZUIXIC9upB8DPi+m3twwRBDBkpnYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpBJDW7E0xQHEKHrzpv/PEO5+ab0kS0fFWVIyzAsoZs=;
 b=pOQIUvgGH5ywKz/D5us0o43RjmuDvchno0VD4dvfQRKEaRxPNc6/onNvFqWUaf+4Eac0Wy4ntE9ugvOdW5vIP7TQ/6EqepjEWN/9jyu9RTnWGQoCERFdF3/lBN7wo+tW6MT9ygqv64p3BXEfkZaSGGHE8wmA4+3sbfeDmMUK4/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d6d2fca1-e348-4e6b-b3a4-51abc932b7de@amd.com>
Date: Fri, 13 Jun 2025 09:00:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] arm/mpu: Enable read/write to protection regions
 for arm32
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
 <20250611143544.3453532-7-ayan.kumar.halder@amd.com>
 <43768317-3409-46EA-B545-C78937EF42DC@arm.com>
 <9105e7c1-da96-4bf9-9de8-d397712b68f2@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <9105e7c1-da96-4bf9-9de8-d397712b68f2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0429.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::10) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SA3PR12MB7951:EE_
X-MS-Office365-Filtering-Correlation-Id: e580123c-c577-4d9e-8277-08ddaa480d1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MStobThBOE90eFlyZXY1K1FnSGNvdkJ6M2VQdUFlSnhYR204d0o2V3pPQ0Np?=
 =?utf-8?B?WGZEK0Q3Y2tjNHpPaVJLZk1vUUhDQ003cDRSTHRZTEQydFNQT1U2bW1XNm9a?=
 =?utf-8?B?QTVzVURkL3Z1Z0pWV050L3I5WjAzVTFVNjRUdWorcm8rbkZVditTempVQ3E5?=
 =?utf-8?B?L0N1M05Vekp6UmxpUlJHTTIrODVJV0NmTDVXSFlVVTJSYVQrWHJNM3pxaGRu?=
 =?utf-8?B?YWN0MklwSlVScHREdWFzZXZ6YUcyZjRYN2RZN25pdWM5RVl4SDdaYkNqOS9T?=
 =?utf-8?B?MXVJejRXK0lsakIzK3A5dForRzFGNjNIaVF5ZXhLYW1mTHQrSlZFa0FSZW5t?=
 =?utf-8?B?UGY1UC8zeVFLQTR2L1l0bzVxVG92dGNjN0FVbnFLcGZKWG9JS0dycm9Tblhz?=
 =?utf-8?B?MzFYdHliaGo1alVMejcyVDUveHhBcjViRWJiSHNkWVlkME1MRGRLWFZKQjI3?=
 =?utf-8?B?c29BN2FseVR5Z1hENThhVTRoYlMwL1lMUldrMU1zQkdmMkcyTHVHWjhOVDQy?=
 =?utf-8?B?QS9zYnpUanN4TUN6RE1VV0RZc2dFQlpraGN5TjFWd2grQllGYTR1YWJ5eWxl?=
 =?utf-8?B?SmpDMjZGd252MlN3eEhXTWE4L25NdHp5WjAwMzVYWHJ6cHVnak1mMGY0VFBZ?=
 =?utf-8?B?ektXM3c1ZGFzM0RMSlhEMDZVVHA1MGZGa212UUtpVU1Wd2hyTVpzaFdXMUM3?=
 =?utf-8?B?ZGFYZ3krVTAwOE5xVTZ2cTJrS2xpZkE3TWVsN1ZUamxhUEsvMFk4REREWnZP?=
 =?utf-8?B?eWs0bmM0VjNHN0pPUjlWc3ozYTNuT2lkN25WQk4wc21vV1lwU3NISlJWelpS?=
 =?utf-8?B?TldQVjR4SjJVWGJoQllGZ3hFNEZwT0t5UDVXS0U1SDJ4U1ZPL1dyQnhJaTRP?=
 =?utf-8?B?ekg4L2t0RDFVOW1ZUE1IekQxbWVNQ1JlZlRUaVBMZytESjBYNXhSejAzeEVr?=
 =?utf-8?B?MGlSMXBTMFM2dyt1NmU5MnNQNXJvSnhNb3JPWGJvR1ZUY2ZrYndIZ3BpdUho?=
 =?utf-8?B?d29LT1NORThMcUNFSzI4VDRGZHRCWVNUYjZrUDZrdTdDOVJpR2ZjL29SSTVU?=
 =?utf-8?B?S1poWkJNenl3UVJoSEtaeVRITXRDajhvUlViVFYrZjhRZVZCYytYRm5DQmx6?=
 =?utf-8?B?N3JmU245MmhLSTI3NU10NDlFS0Y3OXhBR0ZDV1d6d1NKU3JhMXpxTHZYNmpa?=
 =?utf-8?B?emcxVWJka2VLTE04amJjMnY2RTZKNktQYUZFWDNhV1dDWVczQ3dFMUVVaW00?=
 =?utf-8?B?MWloNW1FRmFWYlVDbEFKK3RoQTJaeUlRNXgwMWxwcHl3aHpWT212YmJ2cFZm?=
 =?utf-8?B?cnREUU1Ma1Y1R253bEVnSUY1aTI4UnpvV2xFU2xLK0VYZ2U2blV4VHlzak5D?=
 =?utf-8?B?VDk0OGtlSCtjT1pIbm10YkowZittdG5JcForZlgwRUlEcEU0ZjVrY3RyQWtN?=
 =?utf-8?B?UnVPRDdxWUtrUGFhWW1ZK0EwSWhLWDh4OHArKytUd0R1dkFlNTdPdDMxU25L?=
 =?utf-8?B?QWF2WjhkMWl3ZjhxelBSSVRuWldMWkRVNFhQNGFZa0w5dTZRQW1NaXBLdGRa?=
 =?utf-8?B?TlVrNUFiRWdpN0JJMVQza2pTTzBXYW82TDdpMFdIVHdBZktxakplMzFGYkpI?=
 =?utf-8?B?S3MwQ3RHNS9hT0JhMEpGTnFQT1dOb1gxYmk2MWR1UDdZWWZRSGFoUUkrd1pP?=
 =?utf-8?B?ZmdKL2NoZjJjdDBhSzd1SFNxZEZoS2VZN0VCMDArMXIrYnNac3JQUHl0YWlz?=
 =?utf-8?B?NitLQUJvVUEwa0RNci8yRWFaQnBmcm15OTg5N3d0b2F1VmI4VG5RdzdvZEJH?=
 =?utf-8?B?VzR1czhvRGEveG1BZ1gwaTEreWhjSkRDUzQ0NFM1aFYwenFOcE03VmZ2Vlkz?=
 =?utf-8?B?WEwrbGd1bENOWXh6ZlZQdkJaTXZ4M1ZzUEN5SmhmckNKcjdtWm1kcndUT0Fn?=
 =?utf-8?Q?ktrloWa4Zys=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnMvdGdiM1Vqb0l5WGRiUnl2cG5OMU03d0tHVmJCWm9oZkhBcDhmV01jcnk4?=
 =?utf-8?B?SWFDWktKQm1LOTkxR2t5aHdoMXdmZVdiQ2Y0YzRvRktnamF0bXRjSkRYN0k3?=
 =?utf-8?B?LzJJY05jVFhsemgxd0VpTTJDZmFieHRCWEdHVWR6NGd4UkZrV2RKMUYvek1h?=
 =?utf-8?B?S21QWEh6bjFxL2Vqb2Z4b0svd3ZObHN1N1FnS1daN0NMQ3FhQ0xLQUJlQUNs?=
 =?utf-8?B?alM0OUsxanpkRGVVVkwxRDZtTFFEQmVUMEFLdTF6Mmk0WDJYSmxUTGJIaFFy?=
 =?utf-8?B?ME95QlQ5S2ZTRVNRdnhvVVczaGkrZW9nYjRPcU5ldTdDVGVSUWtlN3ozdFFP?=
 =?utf-8?B?WGdzM1piZitTclpvNDJKNDJIditMN2czYVVncWZXQ2d0QXVQT3BFQmphZUM0?=
 =?utf-8?B?RFl5Uk1xbWJiT3Q5RnRZWS9pOG0zT2dWRVF3QmY0OWhmRnJwSmg2blVaeWk3?=
 =?utf-8?B?QWh4aE5CZjJEY3MxTGRSa2pTelZBakJVbEtRSVhlQU5uTUV6Nmd1UFdabkRm?=
 =?utf-8?B?UmhOQXRHQmZkRmd6WlV5OGMyT0w5TzJWSFA5ZGFUTkdWT3hrUDFoSU9aWlk3?=
 =?utf-8?B?SmU5dXdxZXpMYkxrKzJLbjg1WVV2SEcyQjFVWWVGU1NUWXBkNkM4cXY2K1pD?=
 =?utf-8?B?dEo0M0NJZm9wczAvZkVxbGk0RnlHOXVtVjFJaXB5MjFYY0R2QmQrcjVDbTFO?=
 =?utf-8?B?QW9NMzdKTncxM0lLTkVYdUh3eGgwc0hjREpsN3dBNHZWc1hIQndWWklsOXdW?=
 =?utf-8?B?WXN1akJ1d3lWK2JTU01GY1NnaG0vbzZDRUlhS0xOZFp4aXRSODJpUHVuWUJy?=
 =?utf-8?B?cDBYSmtibUE3dHB2NDlMNGMxT1lFWnRyRGRkOWFHb29CNDBoUnZ6UjFLUVhk?=
 =?utf-8?B?NlVzQ2lGYWtvdXhOTWxVWTdWV1ZwYitka2YrOXE4eEVaZG1DMk1aVXBaSlV0?=
 =?utf-8?B?TWFrQ3R5Z1I3d2ljVlZFbU5wQk8vVGk2emJ1cWVqMS8xSVVhSlRDMldRaEl1?=
 =?utf-8?B?QVhsU0VSSTE2YlJZWitLNlFSZGl2dXVlYSs5RU5WeWc2TmQvUDRWenNVRjJG?=
 =?utf-8?B?RUhscDhGVkt3MjhnQldHbUZVRG9Sb3prMDE4czdIM3g0Tklub0R4UjcrSXNv?=
 =?utf-8?B?ZmdWT0h6aVFVTFZaK20vV3ZJMXBzVTVRMFY4OUo3aEVKR2VTTnYwWnA4eXJJ?=
 =?utf-8?B?eUhkakNtWmtCNFJ5dFlIZzF4NDNhTnZnTGVhK1d6UkFld0F5N1B6aEpCS2tG?=
 =?utf-8?B?dDBSVWVCRWI2M25mTndNQy9uOEpvSUlHR1E0Tno2TWZrMUtqR3k2dXlydnZG?=
 =?utf-8?B?d1VhcUZlU0E3RUdpL1FyVkZZM3ZPZnNoNVZBZDZhVDZKSkRUalJmZ1pCaTd1?=
 =?utf-8?B?RUtPcTJiME9PT0hyZHRKbzFNTnZzQUJZNHRrQ3BSWjhIOFpMK0ZwQW9GeXpY?=
 =?utf-8?B?SWtZS0szSllqdGFmTDNocWJBRDIwMlVBd0Q2eXR1SEl2ODBKaEF0YjFUNW9Z?=
 =?utf-8?B?Zko1OGFkaEc1c21GbE9ZdlhzOWJCajhCZURTcWRrWE1jR2dPdUlSZ2ZESHBH?=
 =?utf-8?B?UGRQOUh6RGYzUXFaUUxXMXBiSHRUSWFCQk5xTFhnQmxmY3hVTU1rMFdidHZU?=
 =?utf-8?B?d3g4WjBkaHk5ZElJUm1TY2kxUzN3NGhCNU55UGdOVzNrNEZKSnU0SXJ2ZXZV?=
 =?utf-8?B?SHVreU8vVThnVUxyaGM5ZUNsVkg0MFdJeTJnVW5DcGdsbFJRbG1iNGlhYmNK?=
 =?utf-8?B?SXZDeDE1SFEreTk1VDVtSlpDcWx0ZG9Za2JDOWt2eFdkL1ArSHcyUnJTYXZ3?=
 =?utf-8?B?V0VZUWtwZnVnRU5GMlFBZlVnTHVaZ3A4Sm5McFlZZXhGOUdiRlp3akJ1dVM2?=
 =?utf-8?B?YVQvU3NmSklGR3hQNDdSbFZFVTVvdHl4WmJsK3hicGZxYks2Q0xvWTlwZTVp?=
 =?utf-8?B?dEI3MlZhQWQ2RTV5TWZjb0dyRXQ0TjRNdHFQNzNIZHd3bnB4SXZOZmJ6VU5S?=
 =?utf-8?B?NHduckFqT1hrU043a1B5TWRCMldDWFpGQTRBbmtWdWJVRW9ISmZxUlp4VkJk?=
 =?utf-8?B?MnorbVFycXEzeWFQcS9CSmF6clR1bU1obWpCOUNFaS9ZNkl2YlFRRmVwam1L?=
 =?utf-8?Q?TGYc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e580123c-c577-4d9e-8277-08ddaa480d1a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 07:00:59.2670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWVpZjXyAaIPiDnsF4za50pkCRn0Xjq54cfOA0zlTK0K1BmYiZER03SCZllfmbyk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7951



On 12/06/2025 12:37, Ayan Kumar Halder wrote:
> 
> On 12/06/2025 10:35, Luca Fancellu wrote:
>> Hi Ayan,
> Hi Luca,
>>
>>> On 11 Jun 2025, at 15:35, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>>
>>> Define prepare_selector(), read_protection_region() and
>>> write_protection_region() for arm32. Also, define
>>> GENERATE_{READ/WRITE}_PR_REG_OTHERS to access MPU regions from 32 to 255.
>>>
>>> Enable pr_{get/set}_{base/limit}(), region_is_valid() for arm32.
>>> Enable pr_of_addr() for arm32.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>> Based on your v2 (https://patchwork.kernel.org/project/xen-devel/patch/20250606164854.1551148-4-ayan.kumar.halder@amd.com/) I was imaging something like this:
>>
>> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
>> index 74e96ca57137..5d324b2d4ca5 100644
>> --- a/xen/arch/arm/mpu/mm.c
>> +++ b/xen/arch/arm/mpu/mm.c
>> @@ -87,20 +87,28 @@ static void __init __maybe_unused build_assertions(void)
>>    */
>>   static void prepare_selector(uint8_t *sel)
>>   {
>> -#ifdef CONFIG_ARM_64
>>       uint8_t cur_sel = *sel;
>>   
>> +#ifdef CONFIG_ARM_64
>>       /*
>> -     * {read,write}_protection_region works using the direct access to the 0..15
>> -     * regions, so in order to save the isb() overhead, change the PRSELR_EL2
>> -     * only when needed, so when the upper 4 bits of the selector will change.
>> +     * {read,write}_protection_region works using the Arm64 direct access to the
>> +     * 0..15 regions, so in order to save the isb() overhead, change the
>> +     * PRSELR_EL2 only when needed, so when the upper 4 bits of the selector
>> +     * will change.
>>        */
>>       cur_sel &= 0xF0U;
>> +#else
>> +    /* Arm32 MPU can use direct access for 0-31 */
>> +    if ( cur_sel > 31 )
>> +        cur_sel = 0;
>> +#endif
>>       if ( READ_SYSREG(PRSELR_EL2) != cur_sel )
>>       {
>>           WRITE_SYSREG(cur_sel, PRSELR_EL2);
>>           isb();
>>       }
>> +
>> +#ifdef CONFIG_ARM_64
>>       *sel = *sel & 0xFU;
>>   #endif
>>   }
>> @@ -144,6 +152,12 @@ void read_protection_region(pr_t *pr_read, uint8_t sel)
>>           GENERATE_READ_PR_REG_CASE(29, pr_read);
>>           GENERATE_READ_PR_REG_CASE(30, pr_read);
>>           GENERATE_READ_PR_REG_CASE(31, pr_read);
>> +        case 32 ... 255:
>> +        {
>> +            pr->prbar.bits = READ_SYSREG(PRBAR_EL2);
>> +            pr->prlar.bits = READ_SYSREG(PRLAR_EL2);
>> +            break;
>> +        }
>>   #endif
>>       default:
>>           BUG(); /* Can't happen */
>> @@ -190,6 +204,12 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel)
>>           GENERATE_WRITE_PR_REG_CASE(29, pr_write);
>>           GENERATE_WRITE_PR_REG_CASE(30, pr_write);
>>           GENERATE_WRITE_PR_REG_CASE(31, pr_write);
>> +        case 32 ... 255:
>> +        {
>> +            WRITE_SYSREG(pr->prbar.bits & ~MPU_REGION_RES0, PRBAR_EL2);
>> +            WRITE_SYSREG(pr->prlar.bits & ~MPU_REGION_RES0, PRLAR_EL2);
>> +            break;
>> +        }
>>   #endif
>>       default:
>>           BUG(); /* Can't happen */
>>
>>
>> Is it using too ifdefs in your opinion that would benefit the split you do in v3?
> 
> Yes. However, I understand that this is subjective. I need your and 
> Michal/Julien to have an opinion here whether to go with the split 
> (which means some amount of code duplication) or introduce if-defs. I 
> will be happy to proceed as per your opinions.
I don't have a strong opinion here. Maybe I slightly prefer the split to avoid
ifdefery.

~Michal


