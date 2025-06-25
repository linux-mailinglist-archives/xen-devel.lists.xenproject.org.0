Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F8CAE778D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 08:52:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024348.1400241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUK00-0007rv-Ob; Wed, 25 Jun 2025 06:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024348.1400241; Wed, 25 Jun 2025 06:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUK00-0007q0-Lg; Wed, 25 Jun 2025 06:52:48 +0000
Received: by outflank-mailman (input) for mailman id 1024348;
 Wed, 25 Jun 2025 06:52:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxbR=ZI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uUK00-0007J0-13
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 06:52:48 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2418::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0036a381-5191-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 08:52:47 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS7PR12MB5790.namprd12.prod.outlook.com (2603:10b6:8:75::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 06:52:43 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 06:52:43 +0000
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
X-Inumbo-ID: 0036a381-5191-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWwfDRPYh2wnT3c4AGVgZXWNttULiz57/YTKvEepFjTD5jetWYATqaK341si17ia9o/E7lsYJDfWOQmkuqfEfhR2MNLNvhgShsbEVMVOE8AgWz9IOfbhpnX7+PiohCDg3Tb/FvPxdoiYWgwvZssoIH4shVGpB4HN+asFWKZwSAfxp6VSiVzaIkc3UZ/SFieyf9UEx6Iijf+udvb2KqbhRTNtf+zfIs+Wle9j/U4QnaPqbBDj6SYyVUfXETY6IBoNGtf1EnsXtJ/dhWMYB1FA+9spuIOnKI27TNKEcBEhSVi68SwIi3nvN9txj43cBQwr45uwWE4+bZMS1KBou25HHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKXHAIGeMQ7sxRSWLLIKNAIWYJaNR/hChrkaKJBDn14=;
 b=ix8D9vLr4BFD3Rbm+cDF4DcTpwAnzGYYb6Dn5+oIqcIobjgxvuro/l/7OnPWGU5E29t+cNI9PXDDVNwvTTl59+NnjsenyzI54+0Xnlc4VLgQW5XP4fyTUAwH4ug9hikt60R9RM/ohiwLQHKU3tk+U8W8ffBDVjkSXj4NBwh6nS5jhAkCMXvE1M/6rmQ4bSZB46FS9SYRjh4vDC2FSej/3tcyX51Olu4MLTXFv67s+I4eQ09lNfogrHDucwpRyoKevCfU2WViV2lyMCHbTvAeIDseEMOqWcJ+0HWMkrvdOtF0wPrvL2fHAgJ4uQlvka1H+TF7yDIDMGMF/2N2/N3J2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKXHAIGeMQ7sxRSWLLIKNAIWYJaNR/hChrkaKJBDn14=;
 b=lfCZUJP9ymyvAhypiB7ynZO6RKaeNK0ViFlaUEDeEPjKY1JPWjPeFgshOOBtc9j5h61TVVWd+HT7SR9eBZVgYaKuUbGW+WR32wA3TyqrVJylhtN2TkVi7E4JqRWSa5No8ocwVf1ZpG5I9TOHbF2Zo9+KdlJme/6x/NfluXu6aHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <096ba4c4-16eb-43cd-ae4a-6ef654f08ccf@amd.com>
Date: Wed, 25 Jun 2025 08:52:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/16] arm/vpl011: use raw
 spin_lock_{irqrestore,irqsave}
To: dmkhn@proton.me
Cc: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, oleksii.kurochko@gmail.com,
 roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com,
 xen-devel@lists.xenproject.org
References: <20250624035443.344099-1-dmukhin@ford.com>
 <20250624035443.344099-5-dmukhin@ford.com>
 <08cb7878-fad7-47f4-9c91-5f866c54b1df@suse.com>
 <0cfc9465-90d5-46db-88a7-ed47d0809b60@amd.com> <aFscml2vxO1sLzoR@kraken>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <aFscml2vxO1sLzoR@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::28) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS7PR12MB5790:EE_
X-MS-Office365-Filtering-Correlation-Id: 13b5271b-4a27-4aac-7e0a-08ddb3b4e217
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czNqYlA3N29MUWw1blZCZXVmaDhOK21weDZFRFVsbnQvS3lTSHgrclI0NHB6?=
 =?utf-8?B?Wm5scFk2ZVlQcXBsQ1Y5SGFZb01tVkM2UHRuWG90Ynk1QkpacmNrZHF2K01W?=
 =?utf-8?B?Y3R1NjRPWkI3eXZCek5LOWdobXgxMmFycGE4eUZUVHdaMk10RmQxWEhEL0Yv?=
 =?utf-8?B?Si9ldzhGOW5OemU4eC8rQ3c4OXF0djNlb00vSTBqK1RIM2V5am5QSXMwVk11?=
 =?utf-8?B?aU1HcWNXT2E4QmRsMy9SL2ZiQnJjQ2ZYYUgwaTIyNjdCajhiWUNqaWRpVnVL?=
 =?utf-8?B?RGtzdVZLRThUTXdldnY3WmVlNURYRWhCbWR1U2Q5RUh6U3QrdEYvQnh5Umt1?=
 =?utf-8?B?eXpla25xSEIwazF0bWErenltQ1BXSk96L2hWd045RUg5WG5PdWllTzlIQzNs?=
 =?utf-8?B?K1VCcUtDNzJYeUpUaFp5LzYxaEd5SkpPOHpTVUNJR29mcVhjVG40ZzQ1eU1U?=
 =?utf-8?B?RTdGQy9xVlJoRk9wMjJOS2ZzOVBMTXBmQnQvTmVjWXp2K0VZRXNtZEx3TUR1?=
 =?utf-8?B?cUIzbnh0Q2VJV2c2cnZaZzBLVVhNMzloSFRpWC9zdmp5THJSUHlGOElTZCto?=
 =?utf-8?B?TjQ3SEFScXpBU3JTa2FURWZzVTZxcW9ud0UwNUV3UUxSRCt0OFZCTThjTnFQ?=
 =?utf-8?B?YXVBcHgwZ0ltQjgwL25XYlZ0aTZRcElSS3NPQk1TOU8wVVNBWkFIb0k4emFS?=
 =?utf-8?B?L3Z6aDgvOGg5ajN6VU1ybExrOFdjQTNSZUswaTAzQ0hydVF4T1JvaE5ncWdh?=
 =?utf-8?B?U2J3bzZQbXl6REo4bG43a09ZUVZqczlndk9VTEtIWEw3SFh5UllHcXNKVmxC?=
 =?utf-8?B?ZXh2VjJRTW1BdDhENEFNZEJUeDNHRDJ2R0xYME9KNW02QVQzVXRxTER1ZlZC?=
 =?utf-8?B?R2tHaWFxT3o1T25rUnZDalRSRm9hdHN5WTliZHVDeVU0SElDWWMyaUZiVHNa?=
 =?utf-8?B?R21VV3JESHVLbm8rUng1SlZTVldIOFhiUTQxdG1CYkp3S2x1RnNxWXczL1Mw?=
 =?utf-8?B?VzVZSnh6eWRtRDlkRnIyeGpMNXFoaW9SN0QzbGgxY05ETFRHMHVKdTdPTi9R?=
 =?utf-8?B?N3J0TVNLbXBxVi9ENFBjNnJrcG9sMTZQTHdsZC9UZUw4SzZrQ0VubjFnSnJG?=
 =?utf-8?B?Z2I2SnQ1VzdEUVFDU2hPcjRwQXVrV0N3eUJQOXBnWVV2aVJnamtQK3V4aHo3?=
 =?utf-8?B?V3dpckFZVURZMGs5azZ4UkhvY01IZWdnNU1VTlJ2VGpGcXJlOExDQ09RN2RS?=
 =?utf-8?B?TlJWdGROcW9pc3dkWjFhcmtuTXEyVEVlZGVRdDVIelk0NktiVG90MktJemVL?=
 =?utf-8?B?WTBDdCtSUWdwanNFdnJLWXN1ZUIxTjdRZ2x3WTRqTFp2QzZReDN1dWs2aWdY?=
 =?utf-8?B?NytOUXllRk1sM1VwMG0yMkZOV0JPQlE4TFV0WWJkcFpKOFZKOXNSKzhZRFZN?=
 =?utf-8?B?ejVYR2FBSEpBVmZoVDlXL3hJeTY0TGN6TEl4SEVQeThNeU13eDFSQU1KNmZ6?=
 =?utf-8?B?T2F1ZEpwNk1vTTkramkvVVlCNnNJUmlBWGhJYkFHZ0hLL2Y3WUpZZVFJRUcv?=
 =?utf-8?B?RnJKZk05dm5MeDI1Si9ZdEZxQlVEaEtRL1R0MzBtaEl2V1RIdjV4bXpkQThK?=
 =?utf-8?B?WW82SjZQcy9ub21SNjJjVzN4cXVqdkwyRUVTSWNrZVV2OW5Hby9SV0JUaUpY?=
 =?utf-8?B?RW4rbklYUUZDSE5sQXpVaWFSMnpMSVBka2l4enIwTEdNSDJIVUR0Nm5LdUZF?=
 =?utf-8?B?MXRJRHN4cWZXUTAycFlZMUl2a21nTXZ6OHpaTjV2Q3NhRnBEdHpYV0ZBZzFG?=
 =?utf-8?B?OU5pdHlsMHVsdjZkdEVOVWdreE1Kb09WcGdYait0SXFUMi92T0pLL0IrMFJv?=
 =?utf-8?B?cVhhWWU0ams2RWUyVms2NS8vWmxNWndrOFQxYld3Vm5ydnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUgvQmllenJEN0JlMGVIVXdDa25hMEZKWnA3YWtkNlpEL0NIaU5ScHFDUmlT?=
 =?utf-8?B?akNhMkJpL0ZyaVJtNUtzLzFYVlVMcHhCZUJhL1JtbWMrUTUvcllHVWlOQm9s?=
 =?utf-8?B?eDJOSEI4WWFUdjZFeHdFcmYxL2t2d2lLUURNUHlKdy90WUxab3QzMGlLL3pZ?=
 =?utf-8?B?WlA1REo1WDU0azllcGVOdjN3VkhnMTNZR0hHZHlMQzc0VlFUU2xGdllERjZo?=
 =?utf-8?B?N1gwdFcyY1hqWWNZYkEyQjV0bjBSSnpVdG8xTjBVRHpoY0ptQ1ZoSkRlcmhh?=
 =?utf-8?B?R0V5TGIxOUk2UE5ueHZnMWR0eVh3bmlNNFYxVUdKNlkzamxydlhMZnlMbGFO?=
 =?utf-8?B?d2NKcHBjSGZmWTFwVXpUQjNqS3ppZyt0SDN0cnVNMTh0WUdyUTF6cXBEekg0?=
 =?utf-8?B?cFFDYjExWmxCdVYvV0UzNmt4QlI3TjByUTQvdVE1MDRid2I1MWNPdWVIRjV0?=
 =?utf-8?B?VlhGMTlkNnNRKzNhYzFVekdGV3plMVNXbzRqaWQwL1dRQ3VPNU1VMCtOSmdi?=
 =?utf-8?B?WEdYbHRBdklwbXZGbEJyNm8zYlJqZkxyaGtYcEZ1S1JOMENDVGRVMDBaR1NU?=
 =?utf-8?B?aUZldzFmWERWVWtuNHZKQzZZeTRGSmFhb3ppelU1M2JXMEdXKzhNaW5NOEhz?=
 =?utf-8?B?bVNSdUM2a2wyczVueElXeVJJcTJCREZ3clVvRjRESnVtZ2lBbnhxVGJLOGF1?=
 =?utf-8?B?SFVPMm1UdEJqMmhpeTc4TjFIZ09kTzE0T24rL20rQXBBbzA5bVVDNk8rRFlX?=
 =?utf-8?B?SHB1ZXE5RDByTG1kNC9MTEgxdktjcHJjdXM3cDkvTHlRczVhcnZiTjArdVlM?=
 =?utf-8?B?MkJQOE5WQitBeFhXMzEzem40U3I5a3JQaEFvc1pLbkpodnd5akwzek5PcStm?=
 =?utf-8?B?YXlqSlRMZ0FhWTJtazZKNm5zMG91aS90ZEp6NFg0TG15ZmI5SnA3S2NLcGlz?=
 =?utf-8?B?RVNoMlc2eENSbG9HMmowRU9LZ096TFBXelpnNHVLbkVDTlc3alppSHZUN2l3?=
 =?utf-8?B?bWZoaytMeFB4ZVREWE55Y3VzZklYNjdjdktqSUZaaE1JQkxaMkR1OURoYURt?=
 =?utf-8?B?UjhSNE9va3cwV0tWM2o1VlRITlFTQjFVQ2svTzNRWDBndWlQTGNvTG1yOU9h?=
 =?utf-8?B?djhlelVzQUNQeFVGZDE3OVRWK3NjSXdJWXVrMU84K2NRNjV0UFdHbUpacEFG?=
 =?utf-8?B?Nlh1RVJ5bXFHTzhKYWplVGlSZG1oSm9UemlBZGJSSDJzNzRnaVdFU1lVS2ZQ?=
 =?utf-8?B?MnNWSldOODB6NVBxS214Kyt1SkZsVlZCeHBJNXVMVlc0MFR5WEdRU1ZFTHE5?=
 =?utf-8?B?WUlCL0JJa2ZwOHk3c0JlQ3g3OVgza1lkWE5UTSt3Ym1WRFJQYjZJU3hBWmtW?=
 =?utf-8?B?RVJWbXljU3RiLzFKVURiYll5clFHbHZTdFAxQUtYUXpHMzlxd1Jpa1ZxUXR2?=
 =?utf-8?B?TEcwejhCKzNMeS9jNTZUV3VRY3pVT09YK0ZFeStoS25URlhoZ1UwSFlKdGJj?=
 =?utf-8?B?UGIyc1h0ZklJajErM3k1SHdvd1FGL0YwZTlUWEIyWXpXemFYay9YZmVxNnlL?=
 =?utf-8?B?TUJpa0lqQWo2cSt4Qmx3NTZQZ2lJUTZTMDZQZXZJV1RuSGJmRVZId2dxM2ZS?=
 =?utf-8?B?d0h1NHNvUUMvMjg0UnVpK2pCYVNWaitVbXp6YlZmZUxucERVSlhqWkVVenhu?=
 =?utf-8?B?b1pMWDdUWGZvMkpsdk5jVTB6WTlKditqM0FpOVZYNzBlcGk1UnRwRTEwOVRw?=
 =?utf-8?B?eUFqNGxDYmx2bnRHeGx2SGtHdHF2QTIzbEdjRmR2ZWJjVytjTVFqd1BFejY0?=
 =?utf-8?B?cVJ1RXFTUFIwUDVmL0VyS1AyZm01UmFrZmUxd2VsWGdHKzg5UHhwQkpWYzVJ?=
 =?utf-8?B?VUo1RC9ubW1ldVBoVXhmNTBRMG1IYmtyZ0tqWVF0TkMwcWo3UGJ0c3hRM1Yy?=
 =?utf-8?B?MjBCY0lpV0ZMV1VYRVJKOHdndm1xVE5RRUg1RWU1dlZsU2oxcVdkSWdHNThZ?=
 =?utf-8?B?OWRvY3lEaXJ1YVU3T0dWTTdzanNWQW5Dd1JtOHYwZXFVVEtPMWJvU0FpZFAw?=
 =?utf-8?B?Y09ZUGlKTFV1bml6ZThLdnlIQ2ZzdDNSTlBzZVBrWW1qaG5hRnBSNytvQWpV?=
 =?utf-8?Q?JZXkBAFmjlA57Npcg8iat/gLP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b5271b-4a27-4aac-7e0a-08ddb3b4e217
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 06:52:43.1233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZAkuV7S4ii1PtYtHwLca7Y1Wou1/xB5rPmwQ7MLVXnNbHbgOPerdC2KhGsJu7fiR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5790



On 24/06/2025 23:46, dmkhn@proton.me wrote:
> On Tue, Jun 24, 2025 at 09:50:54AM +0200, Orzel, Michal wrote:
>>
>>
>> On 24/06/2025 07:46, Jan Beulich wrote:
>>> On 24.06.2025 05:55, dmkhn@proton.me wrote:
>>>> From: Denis Mukhin <dmukhin@ford.com>
>>>>
>>>> Replace VPL011_{LOCK,UNLOCK} macros with raw spinlock calls to improve
>>>> readability.
>>>
>>> I'm not an Arm maintainer, so I have limited say here, but: How is this
>>> improving readability? It better utilizes available local variables, yes,
>>> so this may be a little bit of an optimization, but otherwise to me this
>>> looks to rather hamper readability.
>> I agree with Jan here. I don't think it improves readability, therefore I don't
>> think such change is needed.
> 
> I think exdanding macros helps to understand the code since is explicitly
> shows what kind of locking *really* used, so this aspect is actually getting
> more readable; yes, that's a bit of more text.
> 
> But, MMIO-based flavor does not define such helpers for example, so now vUARTs
> follow similar coding pattern which is easy to read/follow.
I understand your point of view. It's more like a matter of taste here, so I
won't oppose to it. Others may chime in.

~Michal


