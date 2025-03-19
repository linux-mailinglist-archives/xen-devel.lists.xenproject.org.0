Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89586A68F7B
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 15:38:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920826.1324878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuuYL-0005YP-II; Wed, 19 Mar 2025 14:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920826.1324878; Wed, 19 Mar 2025 14:37:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuuYL-0005Ww-F8; Wed, 19 Mar 2025 14:37:53 +0000
Received: by outflank-mailman (input) for mailman id 920826;
 Wed, 19 Mar 2025 14:37:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bCaf=WG=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tuuYK-0005Wq-8O
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 14:37:52 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20623.outbound.protection.outlook.com
 [2a01:111:f403:2417::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b97bd385-04cf-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 15:37:49 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CY8PR12MB8314.namprd12.prod.outlook.com (2603:10b6:930:7b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 14:37:44 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 14:37:43 +0000
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
X-Inumbo-ID: b97bd385-04cf-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCBqJ5x4eAH6H/gYThCYexoo5VfLDoStFdHF2ph+hcCOMLRxoQP7Lmt5rg2MIN3qhOjHUXgDPm5nKv7S6nXUqwuYPPxQKmrFXm8fqOVv+NxBHheX76YTBEdPSCZ55xan6yI2S2AReCoArpvXEj3HI3Rr1MvkHzsXRyr3wkJ5vN7sYwBOeUILkh6o6P5CT+OnhdiOIET6GnKoTS2k8LlQc3ltNPef2MtHX8luTRFuRAhoVnTtr08VC8X1cCYpwalvg5M4aQ02FP76MkYHibaDnmT7IdoXIP4VwZ4NAHrrlMer/LMjnv2HZ0VlkMCgezEN3canODS0Q3EUmeIi/GJ2MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V561ibfyU5XpB6hqyTUnsZDQ7bN8IiD5uvJxFDkjtjs=;
 b=Od+hWrFy7dS4LjwwynTg3mUpI3+LwwOx9rMECGPfVYBVxPJKP8WROdvGjrQuQws/hLkLiBwa181vuyS5hxaiMgKgc5wjfXLHInxsmjkZz7cBBrT6n4gV7zLBNomrit04XbGVYtERR0vZmUMZDnipF0lOuSOYtOucv+bhXZbGHbU/JgKQtFEwjRDPrKflEWnvy7ASBFnUCtDclkzTp4Gw9GIA51LsTIVsj2zCGVHioF2GU0NsxqjLwHB8JK4dgYv10H2AVkLhJkCV2nUWRr/bMj7AL+FkwO0VrZ66b62izuzFuRemeF0vQ6Hdtzi+kSA2CL33TNo3vDKeoNHsja4gTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V561ibfyU5XpB6hqyTUnsZDQ7bN8IiD5uvJxFDkjtjs=;
 b=LqBWRvVKtrXXWrawrcJKBhjX9z964Q9PPs7OqG1zOcl8c0ue+yozY+vEPszJRGBHySWxn372Qw3N5rq1EDDtkqlAT+qfX44vvlp+joXI7oP7KFtU1o+Iq1tT0x6sUTXuo3R4Q6JK4s7WQio1X/LWStEahVPhTu1sVn/mOr272dg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <0c50e383-841d-4dca-bde7-80f02ad6044c@amd.com>
Date: Wed, 19 Mar 2025 15:37:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/arm: Fix nr_spis handling v2
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Luca Fancellu <luca.fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250318090013.100823-1-michal.orzel@amd.com>
 <D8KAQ3MH52YA.1G12M32NDFRJW@cloud.com>
 <1f3c9275-14da-4baa-a0e1-e092d0d606b5@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1f3c9275-14da-4baa-a0e1-e092d0d606b5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0254.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::9) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CY8PR12MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c441b17-1f6a-4d7a-c1fd-08dd66f39b1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aS9pVFJ1emVKQW9pTEZTYzRyL3VPRm1ERlMra0xRU1F2ZFMrd1BNbFY4bWxm?=
 =?utf-8?B?NDVGQW02NXBzTE1MdWk4NzZoQ2htSVRRd2xacm5VQkRuZnFiV2xpVHphOWEz?=
 =?utf-8?B?ODZnYTZzdWJBcG8zTUJhaEZjL1BrenpLUzUxR1FDbjVvZ3JacnU2b3RDdXJs?=
 =?utf-8?B?UkFnUWx5Vnd5bzdtUTZ6WXhvOTJzWnR5RHBlWm15M1RjMFR1eU0wUHNkYi94?=
 =?utf-8?B?VW1PMkIzNGV5ODVSQXJreTRGdFZzL3poZExSY054aWxQelAxVm9kaHU3ZW83?=
 =?utf-8?B?WGpJZmhIWG9iaU0wZWxtN0ZVSTdLWXNNNndSSU11QkJLZnNTYUZvLzRFa1NV?=
 =?utf-8?B?aG8wdVd2ODc0RGxqWnlSZ2JIZUxzZHZzZHdLM3E4MTJoYTB4Rk84eFc5VS8v?=
 =?utf-8?B?clQ2WXRjdGk2SDRGdndaWTFISkpvMTZmbnBGb2xqSWtZSjhZTUVFMFQ3dE9s?=
 =?utf-8?B?dzByYUg2RGhKQWp3bjlTWDBLekp5S0lOaWx4Nkw4NVNoSU1IeXN4VlVDdjV5?=
 =?utf-8?B?aGhtNzJaN1VLanNRcVFxVkRTeFhyYlRKQVZSQnJvVTBsdW5BdkRHcEpJSVkv?=
 =?utf-8?B?RU1xYURFcmNWaXBxeDNrNHd6T25QeGFUaDRSNXZWbitkcmQzbW42ZFZsZ3Bu?=
 =?utf-8?B?S2pSNVpITDB1U0lwdG10MGVIaFM3TVg2Ukx1UG0rdGQrSlBWNGZock1zU3Ay?=
 =?utf-8?B?YkJLaFlQZVJaZ044ZmtROFRENzlkZ1o4TWxNa2g3dTNrc3pmV0JKWWI4d2dV?=
 =?utf-8?B?M0c5czhPaDBIRDFWblV6ZDYwV0RoLzl5WUJsdlluMVNnbGRKRTYrSklPSmtV?=
 =?utf-8?B?NTNPQWthazdSY2YxWE1BRXhIYmV0c0ZHVnFFOTVRS0lNaEpVbW5lTU12cEZ5?=
 =?utf-8?B?MkM3dGFlaGtycDlkazNFUGV6TjJtdWhPa1dCd0RkZTRPZGxSbmZnVUxRNGV6?=
 =?utf-8?B?VGJqK0hQK3NwcHBldC9vTWVrSms3ZUlqK2hKNjI1Mm4xSE1xOVU0a0UxTnFv?=
 =?utf-8?B?VWtUSVlvVUx4YXRSL1NoNm9hTUlYMkRQN0ZXMEh2UzVmWEdqRVZKVEJUT2p6?=
 =?utf-8?B?QjI5ZnNoQkhoOHJtMHp4cWpzUXU5V1FWSkxVWmxsWG9xUkZSbVBrRVp3My9D?=
 =?utf-8?B?dDZhUHYwVHlFckVuTGoxaVlCVnFkVkQveDc0dURGUUtSM0xhNFNXRGk1RkZa?=
 =?utf-8?B?WFVxQjR0dG5idzh5N1N0SjlBZ2JpM0hZYWs0NWdTek4yeThWUzIrVVY4STJm?=
 =?utf-8?B?RDVVUnIrK3ZPMGJLZmlQVjJML3dOdWxtSHRwZ3hSOUtOWU4wOTVMQ0pSZUhz?=
 =?utf-8?B?cXNIT3BHQ2FyUzJJQjdsUjRJTWlIRHZzTXNhOCtTSHFsL20xWVB4WkQ2OVcv?=
 =?utf-8?B?aUdqTlgvS01KRlpTcFFjS1FVU0x3MzlBU2Q5dlc3SThvRktrZ0NWUUlENTVJ?=
 =?utf-8?B?Y092MThRTC9iaTl2YzZialpXVUd2RnhaL1pVaEtNZUFiOUlFT040Z2k4N2hN?=
 =?utf-8?B?VUZKWVFhTkhWYXRvZXNRaVBEWU1RWHRGT2VoTlBoaEw1NTRNeWQvaG9KYkRW?=
 =?utf-8?B?dXFXb3FpbnE3Ykt6cHlxNnV5K0hFNTVyd1J6b2FHY3FEdEw4WkxVYk9qbE1E?=
 =?utf-8?B?c1ZJQlp5bm1namtvd2VSRG52ZXB0bTd4dlQvSVhjV2JDdWJrSnRiTCtGQlJv?=
 =?utf-8?B?dkg4SDFzVFJiLzZyVFhCSWxnYTRSNXNwcW1xM21mRjZGOW1yVGJlK0RDcFdw?=
 =?utf-8?B?Wk1OR0tDM2RKdTZVakdINVVtaTUzeFlGNEJlQ3NEZUp4cjE1ejVISy9qZ3Fr?=
 =?utf-8?B?YzlNbi83TGpzc3N3Q3VTS2NMWEw2N0VNdi9rY2QyektuV1lwV2o1eTlEWW9W?=
 =?utf-8?Q?2OZBWmRMkkR/j?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzNINE0wMDVYK3o4by9iV2lOUmtsRlYzMmxhK3V4SXJhUEoxVWpoaHJQdmJi?=
 =?utf-8?B?WVBJK2E0TGVBbHRiUVpxZE1Ka2M2L2MwVjUyYkR5QTliS1YvKy9MWmJoNkh4?=
 =?utf-8?B?b3J5blVGSzhOanZURUliMTJjSVA1WWhCOUVqRHJvcmhNNGdGMTFGOUFNVFV0?=
 =?utf-8?B?OS9qWFVheTdyV1ZWbFlxQVpRTEFmdWNENzlHaHZkUU9UTzhUMTZTT2lHcmZQ?=
 =?utf-8?B?QUN6cjBCZWpUaDc5SENmRnNHNEJodDc4TjFIN29XTUk3cG84SXk3TzZkWCt5?=
 =?utf-8?B?WTRGcXlUa09BTnc4OU5KYjFLak8xVTlBT2RhL1BlZUMzVjc5ZmNSV3M4WVlI?=
 =?utf-8?B?RWM5ZTQybDhEQ3JDTEdaL1JIWXRXa0RNbitPU0xydWlUWU5SQkp2YnhlOUJJ?=
 =?utf-8?B?K1RFY2t3QmZSUkE5dkpONFdJU1MzWStrN1RmVDZ4YiswdC80YU81bWM3SG5W?=
 =?utf-8?B?T2VsQjMycTZXU0F1SHlhSnQzZXBOVVdzRFU2SmwrSk55RU05UVF4SklsdHZS?=
 =?utf-8?B?NUxURWFRcGNBUzdDM01sRzVpTkVid0RnV2U1SDZPNUYrcEtvRTBhaS9DZFhw?=
 =?utf-8?B?YWMvM3U0czVURCtCTlNaSWFrYVdVb241dHJPeGxGMlVDZzVMQk5LWDlkL2tu?=
 =?utf-8?B?ZjJpWU1CeS9SdXVaZitzUWJieXlhTTl1UjBPcnZqT0pkdWZTUk1SOUtEVnNM?=
 =?utf-8?B?YWVZdEMwMXRFV29hSDNUcDF2OWVVRDZPMjA4Q25mQVlVdU1YMFpQNmQxK1pO?=
 =?utf-8?B?OWhqdXRUUGV0allxOGVBZzl6MGl4ZG0xMUE3dmRSdDlyWGVPSW5HcmVWNVho?=
 =?utf-8?B?OWo5eTQ3MGMrQzA0OFY0M0YxZFlGSVJLM1RsRHJETkFKWjNZNmg5VmtYekhl?=
 =?utf-8?B?NW9XaG85YU0zZjZnNDQzMzRKZENUM1M3NkNhWWpOamIwVmJHYWVkQTVUOVRM?=
 =?utf-8?B?UkNZbFlWNVZDTnhCOVhlOTBiYUdjbytaV3ZqVFVDOFQyMEhCNWMwRmYzZjIr?=
 =?utf-8?B?Q29Mb2xwejdkeHlMQS9hOWFIMXJxOXlRYTRIbWdYL2E2KzFtQnZ5QXhTM0VP?=
 =?utf-8?B?NXIyMktwUmt1U1lBSkFxRUZzNk14NmpCbGxsVk9Va2xabDdIa3JlUUlNMjdZ?=
 =?utf-8?B?dkhzMHRxb1RUQ292VFFzU1F0RTVQckQ1MC93UUgzbDZvaXpyck1VNFJZUGNQ?=
 =?utf-8?B?Q3BXbVM0ZUhpbjhKR3ZYRXdZMEtzSGZLbkswVUlDTy9FQTQ4OE91U3Rtcnla?=
 =?utf-8?B?M1VLNW1oUWhtbTNUTURIeVZaZDFSemppUzMvNWcvZWNHVFlTcnE0VGVsNk5a?=
 =?utf-8?B?ay9TenJpNDZtaERGOCtFTjFCUGRtREdPckVtdU5aQjBneURzS3hDRm5ZbkhF?=
 =?utf-8?B?TUpHcFlXVTRYcUVlaHVJQWlaTlR4UldldHVubTFWZGVpMENzTzQ5cWphTENk?=
 =?utf-8?B?dmZISHBHWjRDV0FDL3NGRmpFVzdFSWIyTUwvMFZsOVRpa1JCOElWUTlzSFNF?=
 =?utf-8?B?QmllM05RbC9CZmMzaXY3YnNCZjVDeGNXeHk1ZVlYM25lNkYwSk4xZUJXL2M4?=
 =?utf-8?B?LzhxYnpjZnlXbmdocE02Qmp2YlhBdVdnVHJTMWt5S24rcHhvNnY1UTVVZWlw?=
 =?utf-8?B?YTAzc0daV1h5cWt6bjBUSHNhYlNnVGVoNUoxYVlpdThtcmZhamdrdVpvSmcx?=
 =?utf-8?B?YXcxYWRIQnZnaVRtL05NZ1ViQnltK0FSWVpPeTJ1c2lzYndDWWttM0R3V3hV?=
 =?utf-8?B?OVpqYXdCQm9xZldlMDhuK1BjclZSaGphL0hDM0wzd2dLM3JqQjY0ZGxQLzRl?=
 =?utf-8?B?MUk5MjhhUTVTWW80ck8ycnpXdnF5UjlzNVFPODlMeGZSZFlJTlZ0RnkyQVdV?=
 =?utf-8?B?VERuMjVWd0VROHZWSWpLdmVVWENESTFvcTVNY3RmN3AyeEVWdEVXKy9ZbkZR?=
 =?utf-8?B?ZTdub01LK3daY1pEYWl4RHpzWjJXRGdyM3JLMFVSMk85Vmw5TEJuQ2ttWmRZ?=
 =?utf-8?B?Qjg2eXJqc01XLzQ1OWIram05aU8yNzBTNHpGbnBoNGV3RGxNa0dYOSs5ZzVm?=
 =?utf-8?B?TWtWRmtWZXBTWXdpelVGSTZ3c0hQVktXRVVnYzNoVUNIMzhVNDQ3ZVdjUDJx?=
 =?utf-8?Q?+Aio=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c441b17-1f6a-4d7a-c1fd-08dd66f39b1b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 14:37:42.9723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqsNq2HdAC9s9Mb81D8dDGmKBYQxhQxNhvWzebgf+vksNraCRK1iImz9ckbAKdXV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8314



On 19/03/2025 15:05, Andrew Cooper wrote:
> 
> 
> On 19/03/2025 2:01 pm, Alejandro Vallejo wrote:
>> On Tue Mar 18, 2025 at 9:00 AM GMT, Michal Orzel wrote:
>>> We are missing a way to detect whether a user provided a value for
>>> nr_spis equal to 0 or did not provide any value (default is also 0) which
>>> can cause issues when calculated nr_spis is > 0 and the value from domain
>>> config is 0. Fix it by setting default value for nr_spis to UINT32_MAX
>>> (max supported nr of SPIs is 960 anyway).
>>>
>>> Fixes: 55d62b8d4636 ("tools/arm: Reject configuration with incorrect nr_spis value")
>>> Reported-by: Luca Fancellu <luca.fancellu@arm.com>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>>  tools/libs/light/libxl_arm.c     | 7 ++++---
>>>  tools/libs/light/libxl_types.idl | 2 +-
>>>  2 files changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>>> index 2d895408cac3..5bb5bac61def 100644
>>> --- a/tools/libs/light/libxl_arm.c
>>> +++ b/tools/libs/light/libxl_arm.c
>>> @@ -84,7 +84,7 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>>>                                        libxl_domain_config *d_config,
>>>                                        struct xen_domctl_createdomain *config)
>>>  {
>>> -    uint32_t nr_spis = 0;
>>> +    uint32_t nr_spis = 0, cfg_nr_spis = d_config->b_info.arch_arm.nr_spis;
>>>      unsigned int i;
>>>      uint32_t vuart_irq, virtio_irq = 0;
>>>      bool vuart_enabled = false, virtio_enabled = false;
>>> @@ -181,13 +181,14 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>>>
>>>      LOG(DEBUG, "Configure the domain");
>>>
>>> -    if (nr_spis > d_config->b_info.arch_arm.nr_spis) {
>>> +    /* We use UINT32_MAX to denote if a user provided a value or not */
>>> +    if ((cfg_nr_spis != UINT32_MAX) && (nr_spis > cfg_nr_spis)) {
>>>          LOG(ERROR, "Provided nr_spis value is too small (minimum required %u)\n",
>>>              nr_spis);
>>>          return ERROR_FAIL;
>>>      }
>>>
>>> -    config->arch.nr_spis = max(nr_spis, d_config->b_info.arch_arm.nr_spis);
>>> +    config->arch.nr_spis = (cfg_nr_spis != UINT32_MAX) ? cfg_nr_spis : nr_spis;
>>>      LOG(DEBUG, " - Allocate %u SPIs", config->arch.nr_spis);
>>>
>>>      switch (d_config->b_info.arch_arm.gic_version) {
>>> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
>>> index bd4b8721ff19..129c00ce929c 100644
>>> --- a/tools/libs/light/libxl_types.idl
>>> +++ b/tools/libs/light/libxl_types.idl
>>> @@ -723,7 +723,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>>>      ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
>>>                                 ("vuart", libxl_vuart_type),
>>>                                 ("sve_vl", libxl_sve_type),
>>> -                               ("nr_spis", uint32),
>>> +                               ("nr_spis", uint32, {'init_val': 'UINT32_MAX'}),
>>>                                ])),
>>>      ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
>>>                                ])),
>> Doesn't this regenerate the golang bindings?
> 
> You need a build environment with golang for that to happen.  It's easy
> to miss.
> 
> In this case, best to ask the committer to regen.
This patch is already waiting for tools Ab, so maybe @Anthony could do that on
commit?

~Michal


