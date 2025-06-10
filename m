Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4277AAD2E0E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 08:43:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010488.1388587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOsgx-0005jE-Pf; Tue, 10 Jun 2025 06:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010488.1388587; Tue, 10 Jun 2025 06:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOsgx-0005gt-Mq; Tue, 10 Jun 2025 06:42:39 +0000
Received: by outflank-mailman (input) for mailman id 1010488;
 Tue, 10 Jun 2025 06:42:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OYHl=YZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uOsgw-0005gn-EK
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 06:42:38 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2417::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14a3f460-45c6-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 08:42:31 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SA0PR12MB7090.namprd12.prod.outlook.com (2603:10b6:806:2d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.39; Tue, 10 Jun
 2025 06:42:28 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Tue, 10 Jun 2025
 06:42:27 +0000
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
X-Inumbo-ID: 14a3f460-45c6-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M1TnPe+ALRtBM2QHR8zilhmJ8VT946KywxDve9xcQmNN/IjYdnKNBbjTQMvBGR6Ah7mkRCQemXxI8MwBgX+qEFBEtMmCZv+Ux1DHibWzdQBtAt+y4ToT+QVgiw7qVunPxIKBn4ENK3quIuAjOoVlcgKV02PCt7wesZdwB+xp9T4HuPPtvcLLJLtv6aPTFSmvxkA2WOMPPvS2EWeZ9ArsWngoJG2un3t3rg4/23ZGmmQWBV55X0WnpoDwjM3GH6mQoMh7dsLYfZO98cXzePI9gwE6ySC9vZ4lk7FF2S7kB3z5aZrZ7sWUmDQBHVfjPK77mNwjG6gO6Aq/D4BHgG217w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPC9iPavFIQNXws7Q9IwJCwqAm2J9I8pLaLCui7orW8=;
 b=k0JN+004X+VRDukyqAarJm/wfGIOGiyo/mYLQqh69BRVCc0Iu+DqdKZf1+TLsToNn2EDa1SDJZ5H+/4sJc9NtCJt1gLtWEhJYaf0IVwK/2n6WlJa5u1E1iDVtd9IB6aKJrW8OFPRXJW5i4fsk7QxXV2l9h9i5fZv2NQP5zdVWvAJlGKeVlkr9kr8ova6wVHGWcCWQ0qZRPT/aG2zejVRf3MXwZvyw3wVOXPmfFiyN4DbaeDVe6o1Kko2DnnVB6a3Nm68fdA//05nmANi1+SdVBpqLChjV1g+7Oi/6NusBjW4Gw7AuSKxaG7QlXF9n9+h8Iz+QvqEVJFxE1TFOfybHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPC9iPavFIQNXws7Q9IwJCwqAm2J9I8pLaLCui7orW8=;
 b=qLClENRUB/20pNRzL0mGcoBkmiD/b7yH54478uQL9c/8QATAptVpSmWRVGt80yDRQm1E84iR17/3eL/xnN5Ojc7YewtXRXuCteLZZCO2EG+gYaaVIP182WKFE+BbRlcwBTLBARiqNzvEo8C8XrWquAymbGmT6S5uedXRwHRn0Vc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <cdaa3471-047d-4c79-9b4f-b57b776bfc34@amd.com>
Date: Tue, 10 Jun 2025 08:42:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: fix build with HAS_PCI
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250609205422.180717-1-stewart.hildebrand@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250609205422.180717-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::9) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SA0PR12MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e0bfba6-51b9-4714-8ddc-08dda7e9f76a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzF6WU9EMUxTemMwdVhjQXhZRUNZOUc2Zk5tdzUyVzE5aDUwRGxNMXNhanN3?=
 =?utf-8?B?VzJEdE1PV1oxR0xZL1pKQlVFUzBRRE1DZWkwVnhOcnlwTXFSekJkeHRtYTls?=
 =?utf-8?B?S3VzRU1KRTEvK0hjT2I0WWFuRWRsTi9tTDIwOHJhWWtUQjZvRUFaS1dCRkVZ?=
 =?utf-8?B?MG1sQ25SUTRzTVNYbEc0akVERFNZNDZWeE5ORkVWM1VjNWh6czlDWHArS2VE?=
 =?utf-8?B?UGdzY0VUcGdSUlBXenRVaitadGZNSG9BeHlCL3M0V3V1elBhZjdlVTQ1WndO?=
 =?utf-8?B?cVVOd0NxdGlOVWM0YnlSOUY0Y2JNaDBpVzF4elVnZCttTy8xcG15S1ArZzlx?=
 =?utf-8?B?Q3VENE9FVGM1OUZQQ2hmOGt3TVYvTEd5ZFJyWW84MFQxSk8wSmViOXFlM1NF?=
 =?utf-8?B?RHFjbGp2S2dzd2I5ZTJnZHBWRllVUCtEZzJyTk5MWmIvYUlUNTNwTFlkUVMr?=
 =?utf-8?B?cGQ3SkU1TG9TTVE3SEJPSHJIdnNGYlZkdzY2RFlpTUdXWXg4bHFZZExtWnRx?=
 =?utf-8?B?VDFaSjRTVko4V3BKcDdDalFxZkd4d2lNVk1KenpzVGg0YmRCa2xPcHRucFdI?=
 =?utf-8?B?VWp4bWJpUlNXNWZjREVDTnQ2Vll4RTZ3MWRyUUVjZE5NM2NmWnJacEZKOWpo?=
 =?utf-8?B?c0IyVExFSU4vZTJSMERXSEJLa3V4NEVBeElzYTFBME9tTUpVaE5PUUxIT1k5?=
 =?utf-8?B?T3hDbkFRTlFvSG8zV3BuTm45UzNLRW93WlFwY1o5UjhuZC9MeWVOcTZkaHlv?=
 =?utf-8?B?WVNZdWp6c3ExRmIyRnR2a1pMcXlIOXFOdncvbG9oWGUrM0puSGo2UnkvcVBn?=
 =?utf-8?B?d2dWM1VDb01tMWNWYTlkS3B5MnREZFhVQzhoNEtNSndLMnAvOEJ5RkpndTIx?=
 =?utf-8?B?TVFVa1VSUkxPeitjd0RTVnk2eDN2QkpZaVNVN253TDJXNVJ4ZldHSHBnNUoy?=
 =?utf-8?B?NGs2a29KV25HSDdncVRJNjErekp2MzJHUTA3TzVHN2FrRGhFYUlUbEpUWFFt?=
 =?utf-8?B?WkhZSFNGdG9YLzdGUDR6dDk0dXVENmx0L054TUN0dFRvVUFsY0N2OE9PQ1Vp?=
 =?utf-8?B?RmF6RnU2aG9valR0WmtQOVNwNVl0SlpEMS9oS3RHdlBtQ2ZNT2lzSGZGRXk5?=
 =?utf-8?B?N01Zb2VDbmlWMm1BVFk1RzJIaGVKb3hQL0NxdThtcmVVaXJqc1RzdHVwTlRq?=
 =?utf-8?B?dnJldGR4Mjc4Y2NZM2JNOVFjRFZFaUc0SUE4cnJlMUc4cGJBQkVKNEg0RjR4?=
 =?utf-8?B?bURmNGVPQldhWGJoU01SSXE3NWpWeWhCOEV6cnZrNGxRVUh6VS9LNjBUdU9F?=
 =?utf-8?B?WE9VeFhXQVo1SzQ4SnVHTFZ0Q0JQTEVPUWRQNkZYaHoxZjlIZ1pjT3BpWVRL?=
 =?utf-8?B?SEVZRlZFdlhMTE5tKzhqZXpZaXVPOXdEVXFGWlgyUWp0NU92NnJhS05tQ2dJ?=
 =?utf-8?B?emw2R0F3bWV5RjhnQlFNWmhldXZaSzd4QmRDZ2dCYTV2L05xTjllZE9DS3VV?=
 =?utf-8?B?OTVJWWI0MGxtckd0MEs5QUEvdWRtdkRWYzM0Q0tRTkZrdnptVk9OZ0RxcWxE?=
 =?utf-8?B?ek1mbWJzSkpoNkl1UzJSNWp6RHduemFZbU40a3djUmRPczk2dUFEQjQrcVQ1?=
 =?utf-8?B?UnV0M282cVoxTHc3QTFKc0VGZmw0V21yT0hueE90V3VLOFNqR1JSaUlGNXEz?=
 =?utf-8?B?OXFYTTNaQk9xaCs4SE9LYTNDZlJwWGNqMUt2VTF5aXIvdU1zS0lRRmlvVjFM?=
 =?utf-8?B?Q3l2Q1l1Kyt0TVh2dWVPdFphMkZBSTdYWFFkUXNrdHRrV3hRbmZPck9RSUoy?=
 =?utf-8?B?NHRLYWdmK3hBeUVaTXg5SEtiUERoUW9aT0NoL3BpbkhtYWx2bnVDL2xvcG9h?=
 =?utf-8?B?Kzh3NUtwamIvWmd6TlNXZWNJRmROZTQvK21Pa280SFQrYlVCWUgxQUhrblBn?=
 =?utf-8?Q?X0+IDPLq6Sg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTY4VkpFZnJkNzhUTldvdVhTaGY4anhhUEMxSjhmUW5TN2RLa0JkV1hmZE9l?=
 =?utf-8?B?TXIrRjhkL08xSGRHSFdkWkRYa3hjNUNqeU5LM3F4YmIvUUhCTFhneFJqNGNP?=
 =?utf-8?B?Nll0MWZsemFROWhYWnQydzNZblUwR3BkQzFmNWlFV0NKRjBKY0lDWHBHR0NV?=
 =?utf-8?B?dWoybk1vaUhXc2Q0cHY2SE9XNW04NktsNFRKZlFQNTFFdXVXZngwcE1ZcmhH?=
 =?utf-8?B?czRzdk5JdFhQTUQydzdzTnY0eUhSeWEzeU9NYm94bnRNSDYvQ0RaL2VLRU9N?=
 =?utf-8?B?dXVQb1AyTGczV01hQ2dCakFvQS8zVXN3UUlEaVdGSGJyM2tHZjRMWklYOFJi?=
 =?utf-8?B?d2dpTjI1SFpnK0daT2FWK3FWOGd3M1FrVCtCckE2KzZ1Nmlld2YzNi9IdUgy?=
 =?utf-8?B?RFAzUmFzREdueXRoWXpUT0dZaXVkRnhzWTFKZ0hWcy9WY28vS2lmRk5uNEl2?=
 =?utf-8?B?Z21QM2c4c1d3MzkxUEhPd2p0WWhhK3BBRkdBR3dSY0hHOEhYYTMranAzMkxY?=
 =?utf-8?B?T2N6QXJjWit2M2NoSlNTdTQ1MlVkZ01RdXQzRzJ1cHJBcDhSV2NSUjZLNDB1?=
 =?utf-8?B?R2JiYW14VndvUkdLdCtJNmhaRnhuSS8vMEhKTDBsKysrcVgvK2E0TERMNTYw?=
 =?utf-8?B?MXVDRTgva0d4dkRpNnRPYVMvSUNacXhnLzMvQVpRcUVEd2xna21zd3hKeGJm?=
 =?utf-8?B?aTc5OWhEVlBrWWFvQWZQZXlXOWhKMEZpQm9ZWVY2dWxWTVV1T09XWi9mMzZX?=
 =?utf-8?B?Mll4UUhEUzJRSnViRDNNRVVRTi9UQWJ6OVRWYjdKRDJiZklRVllqcUFzVWE1?=
 =?utf-8?B?YkNTNDdtbUxLVXFtRm5SaU0zMS9xL0FtMTgzeVhvSC85SzRJSDcyWHJRcm4y?=
 =?utf-8?B?WTladGlXUFJDbGFRZDRhMXBsUThrSVJCY1JlMzloSGVVYXBCQmgwektXdmp0?=
 =?utf-8?B?b2Q0TCtLU2xrbU80SndjMFZlaXhxSlcreFFKaURKT0JUbE1NMEYyR0tpeGd0?=
 =?utf-8?B?dlB5VEh1M2RXVEUyR1RmWDdGR1F2SFpwTFQvNng5aysxeUtRRGpDemhQdnFJ?=
 =?utf-8?B?dHdBcXFCbDFoL1JwTkVHc1Q4OHhHZitRdWo0aEdqdGY4QzVIZlB0RkpxVitE?=
 =?utf-8?B?cjZFUWVOYnhnb2dha21ZSnl0REdDMmp5Q1hGMjRXbExJVHZ2SnowOU5IUjA3?=
 =?utf-8?B?SnU0VGxhTVBXdlE3WTg1Y3pXSExONHJzQTd6MVhPTzBPeEgzN0FrMldLd3dl?=
 =?utf-8?B?b2hQSndlLzF4cTdVckNXWFh6aTJDU3dMeDJQRDg5K0xQc1dqazY2YllMN3J3?=
 =?utf-8?B?N3FCVi9xMTluMzhrMmc4UjJWOU91U2U1U1c0aFcyS1libW02ZVRxaVVJdjNq?=
 =?utf-8?B?RHBqNjFxZVhhTk5pSEJON0Jvc3BObmc1K1kzQWhLdW5RNDhqaW1YVFVjMTNY?=
 =?utf-8?B?a2hycmhvL0RNUlYzWW51eFRnK29BNXEzTUo2MzZXTlNERzZzRWpoWVQvMkMx?=
 =?utf-8?B?Nk5nN1h2SzJLeEkzSVZGZ3RDVkZydHY1d1JVb0ltM3NncUtyOSt4NTIySmVW?=
 =?utf-8?B?a3VuNGtaNWxONHM5bW5jYmwxMVo3S3A1b0ZrTEhUdnB3RGdLQXFGNFBKRWtz?=
 =?utf-8?B?WDhUbXNzOGFyZFN1aThlMFJqWTJTWXVxK1dNVjQ5UXlIZ3E5TWlMeFl5enN3?=
 =?utf-8?B?Q1g0aDdIeEFZcTVmTnJpaVBwRkdINFI5Umd0bU1RZGc5M1dWUnBkZTBqUnRy?=
 =?utf-8?B?UmxZTldmaktBTXFPMlB0ZEF5UG16STdPRmUxYUowMUxrczZlMjFzRWtwMzVD?=
 =?utf-8?B?WFIzS3JwTjNVTmMvTFRvbUxlK0NKZ0hEYkxFSUlSeHNuMFgyS0t6QXhxSFN3?=
 =?utf-8?B?Vm9sdjdDZFpqYWpWd0tyTk9Ca1dXUW1MeURZTkMvZ1hiZ2xYTEg4Uys0a2VZ?=
 =?utf-8?B?MHljeDN4WFZhMTNRT2FJVkd4TmtGNUVvdWgvT3U0Vnp0RmJNTURxekVGaW9n?=
 =?utf-8?B?a09HeUxPN0FqM1dZcnpBMlJYemVicHplTzREWXBVZjFRd25ORmQ3SFh1Yndm?=
 =?utf-8?B?SkdwNUhCUy9DaTJSUUZOQi9kSk9jeFlBK2t5TWNWWEVWWWxoSTdrM2M2Z3NX?=
 =?utf-8?Q?9a7B3vKoNg+fsCbYVV9b5gDiV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0bfba6-51b9-4714-8ddc-08dda7e9f76a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 06:42:27.8650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/ZeTSS8jTK6Ub8wvi1lDAXzylRZIi98c93igLS0yhaDPRdSsicjUb/munrvLOIQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7090



On 09/06/2025 22:54, Stewart Hildebrand wrote:
> In file included from ./include/xen/pci.h:72,
>                  from drivers/pci/pci.c:8:
> ./arch/arm/include/asm/pci.h:131:50: error: ‘struct rangeset’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>   131 | static inline int pci_sanitize_bar_memory(struct rangeset *r)
>       |                                                  ^~~~~~~~
> cc1: all warnings being treated as errors
> 
> Fixes: 4acab25a9300 ("x86/vpci: fix handling of BAR overlaps with non-hole regions")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
>  xen/arch/arm/include/asm/pci.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
> index 1605ec660d0b..1bbb9d780193 100644
> --- a/xen/arch/arm/include/asm/pci.h
> +++ b/xen/arch/arm/include/asm/pci.h
> @@ -17,6 +17,8 @@
>  
>  #ifdef CONFIG_HAS_PCI
>  
> +#include <xen/rangeset.h>
Just for the struct, I think it would be better to forward declare it (at least
this is what we recently started to prefer). Especially given that rangeset.h
also forward declares it.

That said, I don't find it mandatory, so with or without:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


