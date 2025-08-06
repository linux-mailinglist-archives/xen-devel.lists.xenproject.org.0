Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CB4B1C203
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 10:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071412.1434869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujZMc-0001cU-LM; Wed, 06 Aug 2025 08:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071412.1434869; Wed, 06 Aug 2025 08:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujZMc-0001az-Ih; Wed, 06 Aug 2025 08:19:10 +0000
Received: by outflank-mailman (input) for mailman id 1071412;
 Wed, 06 Aug 2025 08:19:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i5Mu=2S=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ujZMb-0001at-13
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 08:19:09 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05fb2a57-729e-11f0-a322-13f23c93f187;
 Wed, 06 Aug 2025 10:19:08 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS8PR03MB7494.eurprd03.prod.outlook.com (2603:10a6:20b:2e2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 08:19:05 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 08:19:05 +0000
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
X-Inumbo-ID: 05fb2a57-729e-11f0-a322-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ooa35SPJscvg/Mtjpl90nQFoP6mp+AaXpKpBNJgZYW3yQ8ucsYi3BhEpic8tP5Tm7rpZUJi+IjsX3a/98YTVhGtyvdgjKGZdpEU0pmlrFIWHpDAgjSLu6LPzlJ2NriHg7MpUN2UgqbIpMPdfoT3uWKSzwCyBD3r2SkXt/EVAL7OV4MJJ8039y3q7gbq0GOQdBzp+yT+zw1bL8HpHJdlhNhD8UeXVubklLc4HX6q9/kQC3Ugw+Tv19Tje0ZQbzmeyfjOVrC4s/DcLl9+5X50dW2Rg10dRgHWdpFT/ZDVm80h8sdpvbtN/IEhZck7QdyLY4DlEMOGX4cvLMpGAQ6gTOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uvpL7XG2GprW38k8gYMIjil0wGmknDKbK+7V1fyoHCk=;
 b=PQq6mrXqJzDnGA7ikVHqvVBa+xF2r5Bo5LUNYHULFscdn8D2AtdyVkERoxXrusplsulZ/8s68GlEl2g/bj8UGIjOxiSTb2FLft7swOsVffCZkEMene80tYk3A+e3Ln7rlxCU3LuITdN/qmy1m1uQ9RUjAibur5Qzo2Irxw6WbHaDr5Ny3mtg5wqDS5bKhTxPOIlwoh1zmby7DoDxNZ1hl9JlTP2GKIduS8pNw3+Fl6hcW2xE2805KqMkXzxzBd53DNw37NM0k0+KzjNCSsU8sZtf2yvSjqBsAbcXNd0eicyQxziO7Ayje4zU4Q5RiBXNr5FHDFpvDsfPD/qyOxxpNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvpL7XG2GprW38k8gYMIjil0wGmknDKbK+7V1fyoHCk=;
 b=pURWkKTZG8gKhjg9uzhqgxPoktU0g2HAZfluj1Tt6reFqshpn7QiuxS/txlvkpOtxiijt4LfaeBoOydwjh+D/SztK71aLdceVP/bBprUHCdiwCN0uXe9ZpJeQNFkDjgCedyB5MUPDxFgUWwjfflN06VuCR/gT05qy9XUBsAfXdxkLkaTqX5wjJF0AKbAdJhrH7ofytDGzFYZok04OX3WXHwCW4aT17dUUAMzUbc2LFzVqL0oUYnDbjPKJEsvlBnVQZD5xF81rtESU/LO/OxMECnfNC0B3LYw1PkUWZcDtz+xacZbqK0uCc/mTG+MJ/KnLgaI6gk7SVw3f74QgiYUKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <5a33ddf2-716e-4fca-8764-760dec9944ce@epam.com>
Date: Wed, 6 Aug 2025 11:19:03 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/dom0less: arm: fix hwdom 1:1 low memory allocation
To: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Denis Mukhin <dmukhin@ford.com>, Jason Andryuk <jason.andryuk@amd.com>
References: <20250805190017.209711-1-grygorii_strashko@epam.com>
 <5807ed03-7db2-4ce6-9acf-c4d515fbd293@xen.org>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <5807ed03-7db2-4ce6-9acf-c4d515fbd293@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0308.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::12) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AS8PR03MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: bf840f2a-0996-48e1-21c5-08ddd4c1e884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1BuN3o2OUF4Y3ByV1BVVlkzMkl0SWp4enB0cWF5bkx6bVN2QWdaUzJUVUF2?=
 =?utf-8?B?dGZrMUVWc29tbmRTQlQ2aFpmdWo4WW1Rb2lNcVVra0dzQUo3NDllOWEwWEVX?=
 =?utf-8?B?alNGYS8xQXh1WkUvM21uL2FHd2VUeStxVEg5R3RVam5vcGQ3YkRVUkhFQkJj?=
 =?utf-8?B?VG1Lblk5bFZPR3lZSk9ablk1bjRMQnhFWFZNSU5PakJTN1pNQUJvc0MyVFB2?=
 =?utf-8?B?aFJqalVQZFk5LzZ4ei9iNTdFMTc5SnFGQmM1UVhpTlY2TkdZcEJuZ2VZeWhI?=
 =?utf-8?B?cTBlRThDZHlQZmViMllnOWR6MmVxY3EzOTNNTVh0SHluVy9nUUZpRysyNzgy?=
 =?utf-8?B?bWtWM0d1aU02T1pWRDNXVy9QN1ozSnM0WGJWQW00ZmZDVWpKa1o0S29ZYzdG?=
 =?utf-8?B?Ym01SnRzcS9GNFd4bDV1UkNhRHp4cTZFYTEzZENMUzVRR2RZcFZCUTRXMDhW?=
 =?utf-8?B?TXVXR21LVk1OUVlWbkU1WTJjNExSSWVsZlQwUGRGemp6NmtRRSttZzBsTTNo?=
 =?utf-8?B?dExwQS9PUzFFSXZKZmQvVVNFbEdiR1NXenhSanhVSWFpOThnVzJlemp1aWVM?=
 =?utf-8?B?QjFBSml0bDN5VDdnZkRGMjNiejdqVHZ1L1BVS2cxQklHS3ZvNUY0NDBMdHFx?=
 =?utf-8?B?RXY3cy85cm9vSGZ3ZVlJbnowaFpxVnI3Q1hCZXYxa1UwQXgwVzNkZUFobXVl?=
 =?utf-8?B?S2x4dXAzaWcyWndvd0lkYVNMZWFkSlUxTG9WUG03eFBFWnZoREhwakljV2ln?=
 =?utf-8?B?eUUwQ1B3a2JLL1RwaUVCWi8wN2prcjRJUEs0WXZxdlNjZ2lCaHpRcFlHUHYr?=
 =?utf-8?B?QmZKTlBMaytzSWZ0dGk1V0VrS2N2dFZrNElIMTVsOEdBMnUyK05xRTlhUXIw?=
 =?utf-8?B?Q2swKy9JV05NTWNpNjY2YkY4TjVNdFZPdTU3bGdRdDdLaXJjZFZoMkNxV3Va?=
 =?utf-8?B?Y2lwdG5zVUNkMzBnM2RyaFVEck5BQVV1RFF0TmhraTdjZXZ1VVZFbExjeW84?=
 =?utf-8?B?SFQ0eEd1Yk5ONzl6NGZkWTRvSk5icFNld1VsVWRQeGFWMkVudUdxMjA2cmlB?=
 =?utf-8?B?NnBtMzUzOTZNeFYvQ0g0cFZXdG5ERVNoOEFzT0JVRmtXMUlMUkF4VlFXSW8x?=
 =?utf-8?B?MzkyejBiM3lickJpTnVBYWdXMEpzeDJydExpUlM1Ky9saXMxTGpvek1wdkwv?=
 =?utf-8?B?a3d4L005Wi84ZkxKWFFFVnpZbk1Ea2dhdithQm5sRnpOempuTStUUk1yRW5E?=
 =?utf-8?B?enBlVzhZSDRJR0R0STV5dlV2MkpQVEtIY2pwRUo3Wi9LU05mbzhFbHladWda?=
 =?utf-8?B?R1I1alRzODF1bC9BK2FBMERJc2x1Nlk4VUFPTGFjNFBhSUdjdjFFdE44aWp2?=
 =?utf-8?B?ZVp2S0dsVUJFOStyR1pBTVRhY1N0Z0d4NE9FbmREWVBuMHBNNFlPTml4Smo5?=
 =?utf-8?B?UkFhQ2lQRTEwWUxaWm50Qk8vNEh4OWhOajhvUldLYW0wZCtpTHBzbG1kMmE1?=
 =?utf-8?B?N0xLaWM2OFpZdGxKMTdYbTc3STNYbVk0eDl1c0x6UXRDQjZwSkNBczU5emFZ?=
 =?utf-8?B?eHBXUUNveXdZUGJPTVF6YkliOTVBZzNSYU1vU3VCQlc2QURrZ2dncFBiRnFE?=
 =?utf-8?B?WTlZWDB5a3d6UUI3dnlwb01DL3V5OXNsUEk1cEl6M0oyUjAycEYxL1Q0bGtz?=
 =?utf-8?B?NFJBVDB2OCtFbHpETVdLYmg4bWxUZkg3Mm9aQld6Um4rMExERXhaVFNaOWNs?=
 =?utf-8?B?cXptMWdHUThiQURnT29ZclYwYnBqOU0vT09SQ3o2OXZYd2JBZFJKRDVjbEZy?=
 =?utf-8?B?L3Bpd0tGM2ZzU2FwZG45ZHFUWm1Yb0pxNHZqWVpPSFdma1RSYWMvb002M1Uz?=
 =?utf-8?B?bjh4ZXJEL01jdHR6bkY4WG93OXVQZ2pEekRPMlhnb1NNaG0yeWNialo4WGhm?=
 =?utf-8?Q?6ZJIUptx7YU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SC9kek56RDVaS2VxQ0VKTnZZRlROWHlPN1c0b2VsdDB4ay84NG80S0plV2Vn?=
 =?utf-8?B?Q20vTUtLR1JWS0RJYlM0UkFsWUJQS2Q0NEsxMFQvdjRWa2NuZjA0RmFrMzR5?=
 =?utf-8?B?dWFQVEdGUndvUkpDMlVHc0xtbytlNVBCeGRPakoySEdmcWYwOCt1R2M4NUJJ?=
 =?utf-8?B?WkFKU0ZlVTFPc0w4NjNqeXVLZkhMUU9vYmNpUDZxMGc2aGFJMnlNYVBtS1Fi?=
 =?utf-8?B?MXllYk1rMnhibUo5OGNOdUhNRk1qczJlT2pzMGFTcWtZYVpVYktUd0wrWjlZ?=
 =?utf-8?B?L0s2dVBzNll1U0pmSkprZU9xUC91UzlOelNxTXhFOXM3ZDVRaEptSG5EUzJp?=
 =?utf-8?B?VHZ3UjdPVUlOeFZZSGNQZ3pCL05DSHdGOUEwbnRvdTFCNE1KdDVYWFI5QVAv?=
 =?utf-8?B?VE9FQVd6WGFXT01kL3JXZVRneEUycUJGRUd6UTlmd2NZTVljSnZMQzF0c0x6?=
 =?utf-8?B?UmY3YXhnSEltUEpzZndlaDcvcVJZWlYvSmVTRGVOZVZocEhYUDZzRGZVOFYv?=
 =?utf-8?B?OVFuRTMzeUh2R2VzL0twbTdvNWdLOHRxcGQ2NE1xbEk2a25iN0pVbkZ0NkFE?=
 =?utf-8?B?TFoyN0NuU0VERENxSEVHYm1VYmNjSDgxRFJPYnluY2pyaXJnL3BYRU41REZr?=
 =?utf-8?B?TzQ0TWFuWmNDOGVGbktXK0gxYnBQcEtqQWR1anFLZ29Cd2YwN08vWHozWGZM?=
 =?utf-8?B?M1R6N0dHSHRJM3A4TE5XTU52c1NwNGxJTmJKZmVIc2ZHODFHZklyYWt0aVFH?=
 =?utf-8?B?SjlWUC9sVUtHbklHcXF4SEM4R3lOQlgyeHo5SUFZa1RuVmxLWUZzcUUxclAr?=
 =?utf-8?B?NGJlN2dZbWRBeStXKzdLSXAyVXhwTThvRWEyTlhIVG9LMlFiNVdhYU9pNFIr?=
 =?utf-8?B?UTN0NjM5YlpJa1ZmUTRPZkxMdGgvRFNya0ZNaUFCbzZxY2xtRXY5QjJQaFMz?=
 =?utf-8?B?NGxZWWcySER6MFRldjZsb1hhOE1iZHlzYXlyTE5xNU8vTmlRK3RzL2JXbm5P?=
 =?utf-8?B?cldrWGJvOXdMZUF6WUQrakdWYklicHl6azBFb2tEdGFSYkdhOGVUNE4yUDhR?=
 =?utf-8?B?Z0o0dUIwU1kzRUJpcEpUUkFHZDFKbk56elRLTFhRVVFEOGRNeHFDcW51VWxh?=
 =?utf-8?B?U2NTN2pLZ1FkWWExZ3Rjd3RwYkN0b1lvNmkwejB1RVZyR0I3SWp4NHB5VXQx?=
 =?utf-8?B?WnR0RUw0anFNZGpSdGFyTTYzTVBSVXZqZUc2bm9TTFFnNWQ5dXYzTnZFM0RY?=
 =?utf-8?B?MFVwVTg3NFNkM3VoQUQyZFhVdUpuVjAyY1JBMnA0NG5WM3BCUU1EeElwTHIr?=
 =?utf-8?B?YUlnNjd1cU5xcVp4aGFQbVBNS0lzeDFKSk9TNjVpWmlwYTBiMzZWQXVJNGth?=
 =?utf-8?B?QXc3b01VTC85aUJ4R1JNdlNFTVNxWHExbnczSWIxZkVtaGNLRGJ2Myt6L3F4?=
 =?utf-8?B?Vm5HckRyY1N2aWtxTlNocE10NytUZGxveGVJZ3BSUHREbUlBeXlBb0w5azF3?=
 =?utf-8?B?SXFNeGkwdTVFMjQrdkFnWXNoN01JRUgyN0w2YUcxRE9UdjFyazd5a2dvbTVW?=
 =?utf-8?B?Q1MxT3RJOFhPWVE4UlY4RHJDWHhtNUNrWDBESkhPRnZwK2t6amJ2VVd0ckMr?=
 =?utf-8?B?V2E5MTZGckFRM3UydGtkdlNqQkM2UnhXNk1Ic3FjMUYxT1EyREZMcDdzd1Jq?=
 =?utf-8?B?TTI5WHB1bThiUjlXWEtDTS94RVdwQXVmcUZPVUpRNGtIWEw5aVpPYUtFb2xE?=
 =?utf-8?B?aDE4Z0tHSDBoaTVuTVpFcWFxSXlZYnVoTnBIRTkzK3FJanRQZGtNWEJJUmQr?=
 =?utf-8?B?WUNKV1k5MG5IaWZwK2dJaXJHaG1LQmttbjltWm94eVdybHpONEhkOUgrTmE0?=
 =?utf-8?B?R0RNUHdjd0RMOVlVUjA1SHgrYUJTNWYvenBjWFZaa1NhRTR3Z21rOXIxREJB?=
 =?utf-8?B?R1pQYWw0QnNpcE1LZVM1bjFCcHA3b0xndkoxUDNwWUNPRGUyVEJva25zYlZu?=
 =?utf-8?B?Y1ByL2NCeS9ZVHEwd01sSDlFQkdMem1PblFDR2ZGVWJmWDNkbHNXMGgzaWV1?=
 =?utf-8?B?ZjdjOUFleCtkSDNBakc0ai93VlRqSlh3c3R1NWlMSDN2S2ExZjhMNW9DMEIr?=
 =?utf-8?B?cGtGVUtOQ0xIR2xGckF4Kzh6d0xvZEpvcFphSmw2SkladUpWOW51MmhRYnEy?=
 =?utf-8?B?aWc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf840f2a-0996-48e1-21c5-08ddd4c1e884
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 08:19:05.3168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Cb1hlvdBOJ3wPyjnMKvKGzrFkt8iA/CRdAd9IPj2P8Xi1EOdBIVRCi0Q2GeHdTkUFB50/tok3WSNstdZbG5P7ljFlfd60XuWgdnkgXiAsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7494

Hi Julien,

On 06.08.25 00:07, Julien Grall wrote:
> Hi Grygorii,
> 
> On 05/08/2025 20:00, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Call stack for dom0less hwdom case (1:1) memory:
>> create_domUs
>> |-construct_domU
>>    |-construct_hwdom()
>>      |-allocate_memory_11()
>>
>> And allocate_memory_11() uses "dom0_mem" as:
>> min_low_order =
>>    get_order_from_bytes(min_t(paddr_t, dom0_mem, MB(128)));
>>
>> In case of dom0less boot the "dom0_mem" is not used and defaulted to 0,
> 
>  From docs/mics/xen-command-linux.pandoc:
> 
> ---
> 
> ### dom0_mem (ARM)
>  > `= <size>`
> 
> Set the amount of memory for the initial domain (dom0). It must be
> greater than zero. This parameter is required.
> 
> ---
> 
> If dom0_mem is effectively optional, then shouldn't the doc be updated?

No. I think doc is correct because when regular Dom0(hwdom)(initial domain)
is created code goes through regular Dom0 path and "dom0_mem" is accounted for.

create_dom0()->construct_dom0()
       kinfo.unassigned_mem = dom0_mem;
       construct_hwdom()->allocate_memory_11()

The issue happens in dom0less mode when hwdom is created and domain's configuration parameters
are obtained from DT.

> 
>> which causes min_low_order to get high value > order and so no allocations
>> happens from low memory.
>  > > Fix it, by using kinfo->unassigned_mem instead of "dom0_mem" has correct

Right, it should be "which has"

>> memory size in both cases: regular dom0 boot and dom0less boot.
>>
>> Fixes: 52cb53f1816a ("xen/arm: dom0less hwdom construction")
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> Reviewed-by: Denis Mukhin <dmukhin@ford.com>
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> Cheers,
> 

-- 
Best regards,
-grygorii


