Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 876D4BDED38
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 15:48:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143609.1477279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v91rG-0002JT-1k; Wed, 15 Oct 2025 13:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143609.1477279; Wed, 15 Oct 2025 13:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v91rF-0002DJ-UW; Wed, 15 Oct 2025 13:48:01 +0000
Received: by outflank-mailman (input) for mailman id 1143609;
 Wed, 15 Oct 2025 13:48:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pY79=4Y=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v91rE-0002AF-Mu
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 13:48:00 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f2c3831-a9cd-11f0-9d15-b5c5bf9af7f9;
 Wed, 15 Oct 2025 15:47:59 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by LV3PR03MB7405.namprd03.prod.outlook.com (2603:10b6:408:19c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 13:47:51 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 13:47:51 +0000
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
X-Inumbo-ID: 8f2c3831-a9cd-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSprgw8AU74Um6zKwGb672hideHVXO1HLQvccHpfbl8lo+yqiIalObeWuPhTG/qvLM/dshlwE7YuIBXfmkuYb/hUCGF5waPG6ZJZ2Xg2mTUPZHdKqpulRY2wXt6CMRe2aymyfWCPaNzGuy/xQ2FxtIvYNdshBs75paB6868XmmTZBqmey+D0mSz8KJjl0TBXN2auEUKJerrvhn1/f6djI2kNN/F1jJo9pK+6CrosnuYo7Nm5XXqjILUjKmImYbKJ+TUS2Owok7MCCSX12043xFyrcrC3uhTYloqGXK4Y6sgJk0xJ+POtzQuubA1etpjWzjxcRQ7HEKLbUuqQ9Wf2UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q29izXHyRSte5iNMe6CTe20Q42kKGGqV3Ib1XaTtUcA=;
 b=nnSKnbFlya3OHuqGNfLOQByNQitck9pDMeay9pUEpzpF7rvpoynQF/6EzIS72258XP5F6iBfCzXoPGPBM0KV8KwaSVbqVg30eKKzLstcJ9G/7NwOa7+R+25aDhDsCH3Vu70/LjbMcCER+CTZ67Y/zCtdGjjWBX8WfuhQY+dmjPMGyIEzzPb8GcYmY6j5UFIVcl15LvYdbAqM4okf6a5PXb1nFM768hXzRHZxw+tnRPqZEqM6ok3f25k8EGmOGOs1AxUKzkTU4tVTgxP0iKwYFKMC5e5KR4Rj9NGlnH/I1dfs33/zylMOuvbU49mZsrFX+tx0oAUQqD+QFTQPuS+CyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q29izXHyRSte5iNMe6CTe20Q42kKGGqV3Ib1XaTtUcA=;
 b=MvlrejGzg/jkq+ZCyzKxyDAuBRKXrJXg2Ewuqkzi5aw9ayjuhvYvlYAyHOHTaP3G6Ng9DD50f+EB9/yGptPzwWsvk5YE3D4S7fp15t0Rt6DkN6ReuSEGmz36ijKv6PMFSA2u6jNqYomrPAthW53uh2APcIy9+bZzJTIyu+o2HE8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.21 0/6] tools/{lib,}xl: Coverity falllout from the json-c switch
Date: Wed, 15 Oct 2025 15:40:37 +0200
Message-ID: <20251015134043.72316-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0029.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::16) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|LV3PR03MB7405:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e42031e-7d97-4923-2387-08de0bf16f38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bkptSHJ4MGJSYTNPWWt5TXpiaUt5b0JoRDBDaFpZV1JMMzFWVG9QN0prQVNj?=
 =?utf-8?B?ZE1oLzNzR2hWN2RGeEVwL2tjUklUNGJoK2FRaDM3eXhNZko4Y0hiWDhDUVVB?=
 =?utf-8?B?TlVSU2VOOXRaYVBKM3hZcERSd2xGR2NNT045VUs3a1JFKzZzWVBVdVQ4L1Br?=
 =?utf-8?B?OUl1NHBNald5REdrM2Z2aVZSNHJZczFQamQ3NlhkQUtSOVgvREhZZ1cvT1RC?=
 =?utf-8?B?Q1lla0YxWC92ZVk3dzBZdGFPZDM3ZS9xZlRyd3ZjUmgrRW9IUVpKL2Z5MXBZ?=
 =?utf-8?B?T1d1T0hCQmNFTGJObTJOU2Qxemt0bzk2TXJwTmVRRXo0ZjQ0MkMrYzdIVm9j?=
 =?utf-8?B?cmk0eVZpNzVGYzkxUFdMUEFoRlBSUHBEU0Jhd0I0WjRBcGZWYVd4ZmRQaFZR?=
 =?utf-8?B?RVBHK2lkNC9TTEEzZ05LQ2pnVm5aY2RHbS9URGNCTEtnYUxnSnZHZmV2NTRu?=
 =?utf-8?B?RENzcCtsRUpWNDY1Zm9YaXpReTJuU0ZlT3dUM0srM1lmNnZQamtwcTNwQlVo?=
 =?utf-8?B?ZHl5K1EwQ3lqbHhuR3pwZGZVNjgzYW5DbEY2Vms0TTU2VlcvbGZoRlJVV2Vn?=
 =?utf-8?B?b2hUKzVOMVFBNVBxWHVtWmVZeEJyRGh6VTV3bnFpZ29MczJoc0RFUW1Eb0pB?=
 =?utf-8?B?VjFqNnRXY2FxM2MzUkloVDBXcDdGSTB3NmVVVllqLzEyL01qa3BnTXRncDlW?=
 =?utf-8?B?bTBpbnRaMXF1dW5CZ1luSk1rSnA1WGU5VzNVd1hDeTZTR0xTeEZpN2FhTEFF?=
 =?utf-8?B?K3V2V2graUpIdno3RTlTQ2NYNjdKZzQwYS95UzY2blhIYUQyd1FLb3B6T0sr?=
 =?utf-8?B?cG1BTlA4MUptcFhQUWRZWmozdnJySG9DNlBwN0Q3RGJaU3lPQlVJOUU0UXU3?=
 =?utf-8?B?VTZMQTdhNVMrN3ZVeWRiR0xhUlZOdDRreDlXMzkwU3BrN3U4SXk5ejgzcVBj?=
 =?utf-8?B?NDV4bmFsZFdqKzl2NlZxQnRBSUsxcTJsdVFOWmIvUStYSzB4ZUQ3STJMcTNt?=
 =?utf-8?B?T0NWc056QTArTWRTN0xJY3ZHTjdvV2xQbWVrbnFTRWRqR2Q0ZnZCdjdNKytZ?=
 =?utf-8?B?YWRMOEgvMjFTdTl1SDVpYTRBd2lOUFRXUTN5bUxTUHhtb1l5ZFpITTBGRHVU?=
 =?utf-8?B?Y3NpUWtMUkVXNFdpV0VkdGJlZXMxOG5wV0V1RlNoVjVwY3lKWmpicnZqMVZB?=
 =?utf-8?B?L1RvMzQyVDJUdzhRK05aWUJyVnN6VkJQZXU3WVI1MzV1eEdmN1ZJdWxLMzZO?=
 =?utf-8?B?aW16c1IxN29WdmNvemdnd2tUbWRxYXFlNmljOTFwcXRJanJzSXhWbVYwcHFC?=
 =?utf-8?B?bGF6SE56N3VXMktXUlA4MTN6dDlEVkFjSlY1bFArZXpyL2I1djhlME5QSWYw?=
 =?utf-8?B?UGphZ2JSeVBuOFNuc2ExcWdBNjZSeGZpNFV4Z21UNm9JaGJZNmhlR2VFRHQ1?=
 =?utf-8?B?L3Buc2ZSTkxUQ1NYR2FmYXR0cDRQR0s3Y0hYM1hZSWZtZzZoenZLMC9Xb2Ux?=
 =?utf-8?B?VnpJeHA2MDZlVzhGR05mcmJkSmxaVWNEM1dVdER6SUJkV09tNWU0SWV3SENh?=
 =?utf-8?B?SW5lZTBwUk1INEpTYnR4RzRQYnhlblhDNCswZzVLd2Z2TGdOSEFUdjljL2xy?=
 =?utf-8?B?anRTaFRsa1U1c21YY2lrUmtiZjJHbXV1Wjd5NXVYMHEvL2Z3L2ZoTkVjRkN2?=
 =?utf-8?B?S0V0RDlLQm9MKzRXVnNsL2ZVTUVwZ0tNRTF0d054akZoc0RONFFwTXdISzha?=
 =?utf-8?B?RS9pOEZ3eEJGU0ZxSGZTdEErK0FVUm92YXpGOTNTOHYxSC9yeE41di9nQWlL?=
 =?utf-8?B?UDQ5TldqOUdIa2VYamxGR2RnUmpFUEtOcXd6dm1WMm45c2tHUTNEZHNyNEVU?=
 =?utf-8?B?NGtuenRBSlZwdkNmNFdCcjFXbGQ0ZFBqcXM0a0N5VmdUZkVKSkNjQk4ycXh1?=
 =?utf-8?Q?46J/WjGEmJbZjTbsDNJQ0HK97+kVEriL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1NveGZocmxiUXBFKzVpOFc2Q2QxdjY2NG9aajFFalEySTZWcHJrN2NPeTd1?=
 =?utf-8?B?Qmk1REJVK3lmNlBqUVNnNjBoVDY2Tkk0bTdoUUtadVVXUUswNXBYMFRxSjZq?=
 =?utf-8?B?bEE2RDF1aUptUnRSK0VkWmhEQjJmM2N6NEtnQWw3UU1tU0I2am1JREM2emxo?=
 =?utf-8?B?b0QyQy9mQjVqUkVCdHVVZ1prSWNlTlcveDJ5RVF4R0I0a1FGc2s3d05nZFVJ?=
 =?utf-8?B?cnI0eGZNRlROQjlGeENVTS9IVGsvT2VkWGZqdkMzY005V3lDWXIrM0ExTVlN?=
 =?utf-8?B?eGtsb2cyQTZhZ0pYcHZNRnVCYjNzM01qSVA2VTkyeFVOYWprYkdhQVRzZ3dE?=
 =?utf-8?B?L0FMLzdGSEIxWExyWXR2NHZhRDhBNVJOV2YvV0hZbnN5bTZTMXFHNTRGZ1Zr?=
 =?utf-8?B?WTMrbjNHZCtLOGpwLzNPWFZuYVBZT3dPcDJwK2hCWjhGYVRVKy9lamZBWTJE?=
 =?utf-8?B?U0pYVmJSb0JxVEUwZk4vdmt3c2dFRkVIL2lqVXJkMWdpUTQ5SFFmSWY1dENv?=
 =?utf-8?B?VTErajkzWU5Fdi9QQ2I4VGRvVmhOYkVkbDNIKytTZzdvNkQ3VkRmazJoOW9G?=
 =?utf-8?B?SkNaTEtQeVRxZ2Z2NFE3cjR1NSsxZG5nVXZYRUZkRmhxVlcyOXltMzVPNElO?=
 =?utf-8?B?RXI5S0hJNW5CU0FETG5CeVBRd0ZWajhLTGtkNVNxVzlrZmxiZDcvKzN1SkRt?=
 =?utf-8?B?bHUxeElmYUJxNXB3Z1VNUWNKNythMmFoemhPWDE1amwxYUxzRnQ5VUpMcU1q?=
 =?utf-8?B?ams3OFRWSDVob2xjLzJYMzFwTnFqNXoydUhxNmExbVdwSmRvRkVhcHZFN2c1?=
 =?utf-8?B?OE9VQnJKWm9ySFN3Vm4zT0w1SFJ6djFoa0FyaHJmUmxFTDNWMGErYnp6d2to?=
 =?utf-8?B?dFJGaUFtRWRJSXJhQkNTTUM1Z1hGTXBlTVJQSlIyeU43OHpqQ2sreDJpaE5W?=
 =?utf-8?B?dFNXRUtQZTFCOXFDY1IvL1NpcDhtYzJYQTFMcTROMFA3QzdiQzVCWS9tNzEr?=
 =?utf-8?B?RWNKeDM1MUF5YVpSZUEwckdzZWc3VHVNcHlzN1F6Nk0wWDRTcXBMUUo0WjRO?=
 =?utf-8?B?eEFpRTd1YzhoOXg3MGdsenlhc3VjQVZCbk9rSCtyT3ZnQnlyU01sa3JXY0Jz?=
 =?utf-8?B?cnlxTTNYenhEckd5V1Z4dTY0Q0VCZXhFUXpob0NpUHNzMzBTYkNYU0hmdytW?=
 =?utf-8?B?VlROSEg5TU5NcFM5TFArdFRTV2NXc2s2MjN5bXJ6c2tKTTR0ZmtWaVZyNVNC?=
 =?utf-8?B?YTBZaWVNV0xURDMrRjRwNE5XRWdQQTRaYkxGWHJnd0IrdWQ0SHlldXcxTnZW?=
 =?utf-8?B?VlA2Q3diMk1HRXh5d1dQd3gyZkNlL1djTlRzK3lGeTVOUkQzSEJTUFd4UXNv?=
 =?utf-8?B?dVdvdzQ2Q3lNbXRVUm1BRDgrTzdQMUhGOEsyTld3bkVNdGtxS0Y1SEhDQzIw?=
 =?utf-8?B?NXBEMHBYTTE2Q3ZoUkwvak1mWUhuU0NLOStGMWVHY3lGODJYcWttUWJpdk8w?=
 =?utf-8?B?WU1iSW83TDQyT0ZySnd2bFhBcm9vbW85dUN2eXhQUUt1eWlzWmxrQjFhWWdv?=
 =?utf-8?B?K1hNKzBKWUwrK1dvY2JWVkNrSWNiMWlKTE9uWG5ONEJZWHFSdDVvbTRldHU5?=
 =?utf-8?B?U0tZUTJQNUlUbERMdFNFSlVvSkU3TEZhMlhybTRzeDZMQzZYOHRVSUJkYUpB?=
 =?utf-8?B?MnhRQW0rQ1RHRk1RdW44ZElqTjZsLysxTTcybmhWczVUVFJxL1ZDRTFSbXJH?=
 =?utf-8?B?UUFreEluQXBoRGNWVUFKSG91YmZoZGk1eUtEdWVJU3JJUXp3MzRNTEYzSlY0?=
 =?utf-8?B?Y3JidmlrMVFQUUFCZEZmdDhIUVo0RFN1Y3dueXRuZUZEMCtPMVlONEkzbUI5?=
 =?utf-8?B?WGJKZ1ZiRXJSNXFJcG5sRERiU3NzYlN4NE9SUzhIQ3lRVGduREFqWFNnTW5x?=
 =?utf-8?B?ZER2b0o5RGwwV1Flbm9HYisySVNGbjRTSXljWkUzYWZqajI5QkdOS3MwQk5u?=
 =?utf-8?B?UjRiVEtpSktYTEVLMldhQjlFOGY3eUxUUVorQzY3ZUd6VEhqYVRpMTRzajlv?=
 =?utf-8?B?bjdmaExmVWVEZ3VXL1R2ZEtoc2hrV3JhY1JaVkJ1cjlOaTRFVXZSdzMrYVZv?=
 =?utf-8?Q?LLQ2ZUc4r0qG05hHRYL0aeRob?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e42031e-7d97-4923-2387-08de0bf16f38
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 13:47:51.7080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STAhvjrLKrcHQcByGfJCVsRpJzMfz6Z2WaYOZ9s4ODi9JAYGnGtDSJVH4R7wt5nOrK/QqinXKxj1IooGsx35xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7405

Hello,

The following series contains fixes for Coverity reported issues after
the switch from YAJL to json-c.  Those reports are from the internal
XenServer Coverity instance, as the project one hasn't been switched to
use json-c yet, last patch in the series switches thegithub triggered
Coverity build to use json-c.

All should be considered for 4.21.

Thanks, Roger.

Roger Pau Monne (6):
  tools/{lib,}xl: fix usage of error return from
    json_tokener_parse_verbose()
  tools/libxl: avoid freeing stack rubble in
    libxl__json_object_to_json()
  tools/xl: check return of json_object_object_add()
  tools/xl: check return value of printf_info_one_json() in
    list_domains_details()
  tools/xl: fix possible uninitialized usage in printf_info()
  github/coverity: switch to building with json-c instead of yajl

 .github/workflows/coverity.yml |  2 +-
 tools/libs/light/libxl_json.c  |  8 +++++---
 tools/xl/xl_info.c             | 22 +++++++++++++++-------
 3 files changed, 21 insertions(+), 11 deletions(-)

-- 
2.51.0


