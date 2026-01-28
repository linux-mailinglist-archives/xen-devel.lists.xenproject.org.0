Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MSBEJBeemm35QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 20:08:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 973BBA80C6
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 20:07:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215947.1525988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlAsU-0005Ou-0G; Wed, 28 Jan 2026 19:06:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215947.1525988; Wed, 28 Jan 2026 19:06:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlAsT-0005Lx-Tq; Wed, 28 Jan 2026 19:06:57 +0000
Received: by outflank-mailman (input) for mailman id 1215947;
 Wed, 28 Jan 2026 19:06:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m4J3=AB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vlAsS-0005Lr-Ii
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 19:06:56 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79ea2eaf-fc7c-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 20:06:41 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6367.namprd03.prod.outlook.com (2603:10b6:510:a9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 19:06:37 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 19:06:37 +0000
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
X-Inumbo-ID: 79ea2eaf-fc7c-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ahL5/JMhe/u0moxpjoJTraJqVSi+k2NK0ZLZea07gzpkoU8suzvyd7XD3k9GeZybloY3CM+TukMEuBlYUQO+LiZNocK6nVKiG5P1kush424GUQ6lAUF5+BLRRhebubfVCzdrxmV7xvfQiR5kLmURYAEs/EVmKCPEe+04VydUmG3LH9TzEDECdJxeXj1q7zUqrzqJzleyGiRaB30MpayonXKlIbP8xqrVl66H2ypxgURNpXjkMAsa4kiR1s1d4U+sm8+f5+tJg8pSTNcF7GhDhzdSNVp0UlYJ36M7gxmTMy5mX4UPp2HbRoOrWgEhXl3FLoejA/mBQpncw8LrBhFpUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoeTR8czM06YUkBHxd75Edi46eWfXm2/ps5tFJAOOnE=;
 b=Z2dL/s2QzMQ+CjxEE4k0mmm4tTW9M3SJyBGhdx86PSW/KfdU7NL638FtV0RbwyXjPUMAA1GT4TI+jSnmNbKw2natCKetWflRHxflvJjqFlo1MgUYW88R/bJ4BTRXKZFL9aaK8iUGXRU/bO3wo+HsxDdVu/h9g2WKs2IHfpzD/ME6jBBbnbkA9dE4kzaTGi0EYRNmGrvY5pyu6JoMF6RvGQoTYuPnQlvp3BmGARI9lHUX2gHBoA2u0i4yL4TIS6UdpmXBNL6xoL7BvtrMhselsbQOZ+DWYmNmmxwlhVBrG7hAv4UnRw3eqGK+pvydF0HEnbMX65nS2iHb1GE+4KUZIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoeTR8czM06YUkBHxd75Edi46eWfXm2/ps5tFJAOOnE=;
 b=b0xL7xgd2NXZB/abSUNs3FpEcjY7XXVPd41sozEimluA5wgU8q1LlTdWkqFhBBpORnYTNxET3lrTGSXJ+rW6jbJTEn6DbmjVpOtG6SF/KiNnHk1efqmwbosWMyOnW7z+etQPRQsveOJqSiKJvtCZJF+FvzGe/7uDtuPHfitzE0A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 28 Jan 2026 20:06:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 2/3] xen/mm: allow deferred scrub of physmap populate
 allocated pages
Message-ID: <aXpeOocblPZtJW5Q@Mac.lan>
References: <20260128120339.47373-1-roger.pau@citrix.com>
 <20260128120339.47373-3-roger.pau@citrix.com>
 <6d7b74b6-1bab-427d-aa14-321f4761d9a0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6d7b74b6-1bab-427d-aa14-321f4761d9a0@suse.com>
X-ClientProxiedBy: MR1P264CA0211.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::13) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6367:EE_
X-MS-Office365-Filtering-Correlation-Id: f6dbe9ec-4537-4c93-8bfc-08de5ea05c94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZkZlSVhZd0o2UXAxQlNRcVRJRHpuRkhoVjhKWVJweVZpWDgxdXFvVzNySTFH?=
 =?utf-8?B?Vm1HL3JlaDcxTWZNckx1L3FPc3VHZ2FScGJCeDUwWGl5UlNqbUNaUTRhaG5m?=
 =?utf-8?B?cFRlM0FwTGF1SXNHeklVK0lwWDloR2dKNktQTFBnNy90VWVzYXFzMmQ3REIv?=
 =?utf-8?B?TmJhMWJrQUxOYzMyZGpYRGF0aTlqSWZqYmVKRk8yakRZR0JnUE52TkZIVkZq?=
 =?utf-8?B?ZVRwRUdYM2tLQmY5c1psVW1uWGhScDRZR3pLUmhueVdsT2RXL0s0N3d5cEll?=
 =?utf-8?B?aWloTmhSQ3VTUXRWUGk0QkdZUUZGY0F3RnpQZUx1aHFZVVdzT0pnbEdILyt3?=
 =?utf-8?B?bWgyTDJ6VCtFOXZMM0Y1Rnp3ZDdHZTJNalArdk5BNXdUZXBOQlROSWxkamRy?=
 =?utf-8?B?c0Y1WDVETmw0UnZkZ0EzNjFYYXU3NU1aR3pBVVBEdU5rQkdTVTNVMzZUcVAz?=
 =?utf-8?B?NFo3bUUyNFlkbzhaNXVHVmNLNGNTWHlORmNsbmdaRmRiNGtqaXBmYjdQeStk?=
 =?utf-8?B?bmtPenl2ZklsdGJqWUswUVZ3eVVvSERDTDAxcXVidlhVbUp1N3BaVnZybTEx?=
 =?utf-8?B?MDhmVktkUEF2b3hZb2dUNEdqUkpEeDVFVm1NcVI2VmUxVGpqdXcxb1hRSFlF?=
 =?utf-8?B?QnowT3JsS2tpMjVXejJCOXU3WDF6YlArSU9HWk9LckFJcGNrRmlweUZnQjNT?=
 =?utf-8?B?ZHpSU0RrM2NuZ2R2K04zb3dRZXhkaUNQVmErVVZnWnpWZWJ3R29rVlJCQUc3?=
 =?utf-8?B?ZGpBelhDK0oxS0pJZGtteVlDa2dJRzJvRHI2WlRvMjBTeUdQYk5PelR2NkUv?=
 =?utf-8?B?dy96U2Y3NENwUWtSU2xpZGU1U3plcWtJdTV1SDd2emxSbkl1eEZwclgzeVZr?=
 =?utf-8?B?ZURrbzVhV2dKODhOcGFnZnBDRG1KTUlJK056dStpQWVvT2E4MFp1WWxtdlE4?=
 =?utf-8?B?djdGQVVWQTZFU083UkhBcEVmbm9yN0dCL2xwSm1UYWpRY2JMOW04M1l1NjEv?=
 =?utf-8?B?VmRwUnFkWXhqT1pkM1JPNHVJcmNSeWZzcVZmWEVvRm1uNllzRzV3Q1VkVlA1?=
 =?utf-8?B?WFByR04xRnpZNTBLTTNqUmE3Wm9XZXdocVIyS1g2Ym9wOVJMQ1lwY0FXNGxH?=
 =?utf-8?B?SURlZ0ZhZ2Uxc0pvVkh1d3J5TVhHMkxMSUVpcmdvczBxdDljMFJnSFo1TGUv?=
 =?utf-8?B?aDFqalhjUWFzUmNSTUtMZWtJdXE1VC9NcWNBM21VOWtCQjVBNDJRdEZVNmty?=
 =?utf-8?B?anRXWUlsSHJvY0plNVpEdFg0VW44VWcyemVoSWhveEVPUDJ1c01wT1dHTnQx?=
 =?utf-8?B?ZENxUWZpdjd3VFhWTFJpWUd3YWw4M2kvZTUvbUthN3E1TkNPcEYrM2NzVlRT?=
 =?utf-8?B?QlZxeHFhazVxK2xPRjA0dUx3MkRpTFFwM1hRZktrKzJTck01R3pPazIzNGRR?=
 =?utf-8?B?dHdxN1RQUUo0ck5IU3ZhbmpQU2pzTWxITERISlVJSEg5bDNIeFUxeUpCZjZ5?=
 =?utf-8?B?TFdTa3pPUnc1M2lQUGRDK2JPaHJOdHd0OW16anQwZm1CN0JiNStTSUgyMEhm?=
 =?utf-8?B?S21XL0Zkem91UzliWjlseEJEb1ZibytFU2tCeVpnV1JhaUhsSmtOc0d0SmZn?=
 =?utf-8?B?Z0czRlBSbUFWeHJ3Q3ZyRVF5NjFtQnR3U3EvaDFmckhvVE9CQ0RFYkxIZzFI?=
 =?utf-8?B?bHBDNFE2MksyMlh5NXRMZmhraEg4S0JvcWFiNXBXdHNYaVRUckRXS0FacU05?=
 =?utf-8?B?MDJyMEFUUkRkOTFUK2RqVlE3djlFNU82Z0Fnb3Y1Yk4vUWJGZlF1QlNTZDNE?=
 =?utf-8?B?NnBCRmQrVW85Nm05eW9CaE1NZ0pEQnk0OTFMY2pYV0lzQ0xUNVBUWlFsdkRB?=
 =?utf-8?B?dEpWZkdiNStWUzBQQ3lDTjRQRXo5S1EzOGp4MmFlOXp6ZGFRZUFicVVxMkJp?=
 =?utf-8?B?QTRZMGpBakVldkFQYVZrR0d4TytJckZwZVNLa1JIdDFoZ2NDWXNDQTl0SFdM?=
 =?utf-8?B?eUphUTFGS0RyLzBQMTJQcVlWUkxUdUl4SUErSXE0RlRWT1ZPUWs3OG12N0Yv?=
 =?utf-8?B?MEVyZUlxTWIvanJ4MjJ0NXNyVm9DWXhiOW5IQ1EyaTNJTGEra0RJTXgvcWF4?=
 =?utf-8?Q?B7Cc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFo3WEpoeEFNcUVzTnRmK2sweVZVTVJBQ0xYRDhQRlJDY1dndzFIN2l1WDhG?=
 =?utf-8?B?Qm9JaVNHSHY1KzBEOUdZMFNjQ1c4cGVnZHFZdmNXVXBqb0o2aW04TUU2ejJD?=
 =?utf-8?B?V083bllGUldUYzlKTndBUTlETy8rMTE3QVduODl2NTNYdU9ZQ1d6ZklEWDVQ?=
 =?utf-8?B?d0pJYkprSG5QbEx6QXBvSmdCNlg5Rys0Nk5FcE5QbnJtR1Z3TmFvS0RJVkF6?=
 =?utf-8?B?NGtVN1IzYjJJVFdFanBpN2tGS1Z1aCtLY29wZWZaM1pwUXhNYlpodlNkSlYx?=
 =?utf-8?B?VTNjVllIZmJWRG0xemc3QkJMOHZEeWZrcVdwZ3M4OUxmM2U2SWdTazNBMENj?=
 =?utf-8?B?RHFVZnN6RTd3T25tYytURmZPNE90b05pTHhUaTNRbkpUL082Q1dKak95STRz?=
 =?utf-8?B?L3Q1SkNRdXBiTDc2QWhRbFd1am5FNTZSa3o5QkNuVHY1V2ZmRUd4dHUyT0VS?=
 =?utf-8?B?Ly9xODVuZ0Q2MWttRTRIYnpWTHYxUWc0NEQzblBqZmJ4Uk1aY1V1UTZWcUJN?=
 =?utf-8?B?TUMyeWw0QWJLQThMNUNaMjV6SXNRand5ZUhubEZNVVBWRFVxc0dHTEt6NnNj?=
 =?utf-8?B?b2g0aWl0TCtzRTVWbXlEbldnMEhpOGVnSE43cFBoTHdObUtKd2pqUllNSWlN?=
 =?utf-8?B?RnIrT1JWMjNkanNHTVBielY4RkIrakhralRyaWZ1OUtYZWlOM2lLUElHVERP?=
 =?utf-8?B?YmVYeUhSWUVmL0wrWjlxOUFYWTBTKzJnZjNUYjZNVWpKcXVVWnU5dVEvOGlG?=
 =?utf-8?B?eXpFSm41VWZ1azhEeGpxd1FMcW5ZNzMyS2VPbGwxSXppajRrRzJGWDNFZyti?=
 =?utf-8?B?VWtwUXA5cnRiQTBsV0dRcVdzUHNhNjQwZGNhbm9ndklOYU0wRmE1MkVIREtN?=
 =?utf-8?B?UEtib3N0Tm0wRXlabzJ4WGtTTUhqbzBYUis5dURsR2NubTJIT3owSXg2VUMx?=
 =?utf-8?B?L1dpWmxPbHZOYVBZbDFtTHRBZkRqRndXbkZvWGI3YmQ1MlpWZWpqc2h2QUda?=
 =?utf-8?B?NDNFWnUrTTVwdzhkTzVUdDNWSCtwMVltcFY4YzZ1ajB4Y0xEdWVnd1hlTlE3?=
 =?utf-8?B?cGQ1cHQ0UmoxNUhKWFFtWUM5dERUeXlIL0JZQnVvQkFEYk1WWHVrRmoySHpM?=
 =?utf-8?B?MzhHNXRERXE3bDQwdVhDWHQ0OUdPU200TGJkMHcyOS9LRm8yelhuMGZMNGt0?=
 =?utf-8?B?dWl1TGVCcE1mQWlWeE8weEhaM2hiNy9zbThYOURUWkptUE5hMSsyRkZ5dTJS?=
 =?utf-8?B?aFFMRXpWVUEyU1RpK0ZuWUhOZ2RoL1VDR01SUmRTQWl4a05rT3JYWGlQbEhs?=
 =?utf-8?B?T0NxRVRMNHFDdk1DTGRWOXdvTzBtY1hjWFJLdHYzWjdVV0FQb1BzdDJidm0r?=
 =?utf-8?B?UzFZRzd2Rlpvd2E2VXRiSFNLNGppQ0I0RUYyN3k5SE1YQ1pHQit4a0x6Z3Ja?=
 =?utf-8?B?OXlvNnRROXIwL1RrVEI4ZWdaQUFPNVlRWnU0Y1hZL0puMTFZVmhRVDJ6WjJv?=
 =?utf-8?B?eVBuRHRWVnZidFhzSGtrWTFsSW1KbUhjSWlaZjZrcmFKeDhzMmtFWXNQV2xl?=
 =?utf-8?B?WmU0QUZ2RkFhNTNxK2NwYTZVQ0hKV2xRVnpFalRWLzNKN1BWWG0vZWRMdU5R?=
 =?utf-8?B?NlMrTE1GQm5RMlB6T3RybThqcWhLV29BYzl2bjFsdFN1djZpVFhZOTBoSC9W?=
 =?utf-8?B?TGg5eDllLyswOEtWRkR2VEhvOWF4YkNLNDVKclVrMEUzT0Z3aW9RVW5Dd2I5?=
 =?utf-8?B?SXVTT0NBSlV4aWl5MzdmZjQ1aDloNzEvOXlRM3ROYUdmdUxiekd1eVpITUI0?=
 =?utf-8?B?Yi93Mm5CTlA1NDRzeEZQaXhzWUF0ZzlVR0hUUmNTbm9xbUZ6S2hwQ1h5RDkw?=
 =?utf-8?B?UEpUaXZ4RnMvQW9meEgyNjhGK3E2akQ1NTVwZmhSR2dHWmhjZmJ6cHlDbzFT?=
 =?utf-8?B?c28raktwVlpDdUhsd0lqVWlIbWY0VGYzODhvZjUrMkg5aEVvSGNWem5ocUsz?=
 =?utf-8?B?UGV0SzJQUFBmbW0xdncrcXAyQ0o2ZG5YNVB1VmRtUXd6aTRnUFdnWWtha1Bv?=
 =?utf-8?B?Vmp0UUduRFN4UDJpNkVUdHRYcHJSNklla1lweTlxd0tsdFMvMEZ2Wld5NFlo?=
 =?utf-8?B?NWVEL2hFVHlvcFJzZjY4MEtnd3VUVlp6TkMxbTE2UVRUOStHeWxiWGhLMys5?=
 =?utf-8?B?bWp0Rko1cGgwdk9xTlRCQWlMeGxJUDBPTmlmUnliZzdReEN1MGwxY3N4K3lU?=
 =?utf-8?B?RUFML1hnNEJyL1I3WWNTSWluNmcyMG1tZUErU2ltUzJkSWRSVi9DOVpSWENq?=
 =?utf-8?B?UTBOTXFUMEE3K1FKbGp6QnVvajdwandESHZsTVQzWDQrUklIb3FpQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6dbe9ec-4537-4c93-8bfc-08de5ea05c94
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 19:06:37.5745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iou4d4Q5pWp8wXTdtlmglaSrFsJVX3G9zl8+BsUK4nnfMDvwqzyLQgVrCr+q0wNOQq4p30sDlPjIXfkfx2cVrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6367
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 973BBA80C6
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 03:46:04PM +0100, Jan Beulich wrote:
> On 28.01.2026 13:03, Roger Pau Monne wrote:
> > @@ -275,7 +339,18 @@ static void populate_physmap(struct memop_args *a)
> >              }
> >              else
> >              {
> > -                page = alloc_domheap_pages(d, a->extent_order, a->memflags);
> > +                unsigned int scrub_start = 0;
> > +                nodeid_t node =
> > +                    (a->memflags & MEMF_exact_node) ? MEMF_get_node(a->memflags)
> > +                                                    : NUMA_NO_NODE;
> > +
> > +                page = get_stashed_allocation(d, a->extent_order, node,
> > +                                              &scrub_start);
> > +
> > +                if ( !page )
> > +                    page = alloc_domheap_pages(d, a->extent_order,
> > +                        a->memflags | (d->creation_finished ? 0
> > +                                                            : MEMF_no_scrub));
> 
> I fear there's a more basic issue here that so far we didn't pay attention to:
> alloc_domheap_pages() is what invokes assign_page(), which in turn resets
> ->count_info for each of the pages. This reset includes setting PGC_allocated,
> which ...
> 
> > @@ -286,6 +361,30 @@ static void populate_physmap(struct memop_args *a)
> >                      goto out;
> >                  }
> >  
> > +                if ( !d->creation_finished )
> > +                {
> > +                    unsigned int dirty_cnt = 0;
> > +
> > +                    /* Check if there's anything to scrub. */
> > +                    for ( j = scrub_start; j < (1U << a->extent_order); j++ )
> > +                    {
> > +                        if ( !test_and_clear_bit(_PGC_need_scrub,
> > +                                                 &page[j].count_info) )
> > +                            continue;
> 
> ... means we will now scrub every page in the block, not just those which weren't
> scrubbed yet, and we end up clearing PGC_allocated. All because of PGC_need_scrub
> aliasing PGC_allocated. I wonder how this didn't end up screwing any testing you
> surely will have done. Or maybe I'm completely off here?

Thanks for spotting this!  No, I didn't see any issues.  I don't see
any check for PGC_allocated in free_domheap_pages(), which could
explain the lack of failures?

I will have to allocate with MEMF_no_owner and then do the
assign_pages() call from populate_physmap() after the scrubbing is
done.  Maybe that would work.  Memory allocated using MEMF_no_owner
still consumes the claim pool if a domain parameter is passed to
alloc_heap_pages().

Roger.

