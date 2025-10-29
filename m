Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94000C1BC52
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 16:47:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152892.1483389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE8Nz-0004YT-3W; Wed, 29 Oct 2025 15:46:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152892.1483389; Wed, 29 Oct 2025 15:46:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE8Nz-0004Ww-0c; Wed, 29 Oct 2025 15:46:55 +0000
Received: by outflank-mailman (input) for mailman id 1152892;
 Wed, 29 Oct 2025 15:46:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=brwG=5G=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vE8Nx-0004Wq-P9
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 15:46:53 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a72537c-b4de-11f0-980a-7dc792cee155;
 Wed, 29 Oct 2025 16:46:49 +0100 (CET)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 LV4PR03MB8306.namprd03.prod.outlook.com (2603:10b6:408:2d9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.19; Wed, 29 Oct 2025 15:46:46 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 15:46:45 +0000
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
X-Inumbo-ID: 7a72537c-b4de-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGWLKsQkYwAPk/wtzgZI/wJvKjWeO/MlWWCuOyHWbETUMwJmAzhomsKhbJE2PcQFzssPgOhXj8JpuauR6EctsZvAaZE6RtOUP3VaJhTzFGOXi8q09ja5Ichk9aAZF4XDnuj4e6rMRyIioinA3eEeqnxVwmd5KA1SJC9GScaMmcK61UKxea5689F/t7foOekGQNq7Gw5HwYnYVrEv4Qk86CrQA2RNln9vcJuHlcoqd8uFa+6gCbI9SrxKq0PwCLKyyW7Ho/6HlvBY+0CAQu63FrH07fW2zHdpRwcAmAE6y0bdBoreckaMNCuSa2Odf9lOOkNr/z/mFWurMf3AW3P6eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwTUZqOVnz7g9NgDUa0VcR7tpC4eF9Zj01MdhJRW7BA=;
 b=jDWhMUgU8pS1wkooSmkUxPxq8FBDvks5+BTD3WXeuTeNjRQhSawl1DCrATi6+Ek/YKsBgoSu74liGlsCO1ZLFjh7ihsLPhmeGjEfhSOFqNAqR7yVar/eDOoDHRENWhr+6KJ4+f+1Mt+bh8yOAueu0/qEFp71V8nVJRxMA/zYMbFAyhY2AmBnIeoulm+03dPZi7XGmsxBZr3fe+H1Z3QoXeOPzOwQqLF1qm4wQ3ax2JUwdvo4Klswtf6WghMkpU/nSSh/KMvudaxjgvNSwVDRVWwItHbhNzKzuLCJv3Tu3KZc39ZiYfN6GtvpYrt73tI+LKMGUxUPgTirvzUwt7H5jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwTUZqOVnz7g9NgDUa0VcR7tpC4eF9Zj01MdhJRW7BA=;
 b=LB3yuHy5wE2UxyB+lzt0N9Q19N1aHOP+wFj5NPF/d/OKFQzxupwKUotogSWox4eEd9kRyZoD41oBBKUszky/wD/QD4UOXz1G+wtvXvt2bR01eM7ZRPOvzNG8hJp/BTc2UuvV7jXHG4sh+F9MCWQ+31y0r+vE9W1MeNuwgVRCB88=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <62f90575-ae77-48d1-8888-fbb7db69d591@citrix.com>
Date: Wed, 29 Oct 2025 15:46:42 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86/hvm: move hvm_shadow_handle_cd() under
 CONFIG_INTEL_VMX ifdef
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org,
 Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <Jason.Andryuk@amd.com>
References: <20251023151903.560947-1-grygorii_strashko@epam.com>
 <eaf5e6bd-e7b8-4a3d-8b5b-33d1a9630619@vates.tech>
 <4059d1dd-4e5a-429c-96dc-e7d81f4af7ab@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <4059d1dd-4e5a-429c-96dc-e7d81f4af7ab@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0577.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::21) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|LV4PR03MB8306:EE_
X-MS-Office365-Filtering-Correlation-Id: 79274967-dcb6-43a6-16ff-08de17025d3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTNBYjIxb2djNXlSQ3IwMjVYZGhhS0l2ankxWXlDajFYeVZEeUJBcytjUU9h?=
 =?utf-8?B?d1NZYTJuRE9wL25rSXFWTmZJdVp2YzlrL0l0aTJuenNGd3k0L3dIZmVOQ1Vu?=
 =?utf-8?B?ZFhpZkMwK3E0Sko5K000THVjZWZGb2xYNkFkV2tNL3JXNnJ4Q2dtSjBUajZo?=
 =?utf-8?B?SmVab0dTZTNtUloxNFBmb0ZSYjdtYUNsZHllby9xR0dKV0U3dzJRSmNVbjF4?=
 =?utf-8?B?TFRkMVMxakh0R2lOWVhCL0g4TzJWRkRaVkVpU0lWdk82QlpFTEkxUnkyZGI3?=
 =?utf-8?B?S2E5RXVLc0lXZ0xIZE40OExnb3F1a2NUMmNxTEI4OHBqRFFnV0o4MElsTkUv?=
 =?utf-8?B?aG1rOExMdlAwbkdIaUtiNkszRUUyWkxFd1R2SSs1TkVhK0dVUG9uSkdKMXRm?=
 =?utf-8?B?Z3I5Zy8rdi9NK2IxS0ZrbGRDMHpWb29mTFdZN2VEMnpDdUlJRW5DWStyMW80?=
 =?utf-8?B?dS9YenFiRnJsdFJ6OCtEQUdhWHZnVm5KRDlkNmlRbXBuLzFKY2o2bWdLTmkr?=
 =?utf-8?B?OHdUZVZFZkNrUDkxZXpRNkREQytrWGlOWUNTWnVnT3NPMERhTEtNc1BuSkRt?=
 =?utf-8?B?aWxUZFhISDVhUzdxK1NiUEVyT1N4REtxaUcvR3hYb2N0SXBxS2lleXNUSTRm?=
 =?utf-8?B?ZDRrdGsyUFhkTWtaLzFqSE9ZWldJNlNnS2p2TGVtR1htUXdib0tzaGd1L0hl?=
 =?utf-8?B?WlRJc3d1UVprQnY1ZnhFdklVand6YTZ0aWNvcW5oVW9jc3ZZeEhvRUhub2N3?=
 =?utf-8?B?WHgzaUJvaWQ2bWVxay9WcHBpdHN3bnh0SzN5MkFTTmpXZjZsUUtkQ2s2cjBQ?=
 =?utf-8?B?SFNXUUlNY3ZDbENqaG93KzdiVDNxWFZXbmVsanNXQ1VSTU81d1RwMUMvZmNO?=
 =?utf-8?B?d2FwM3hlS3NLRkZlWldBN2xVaGhyK0Rwb1hMY3d4dTQ0dHlpNzltZUxVbk1n?=
 =?utf-8?B?UmFXSXY5dlVHN1RnY2dsZHNQQ3lSai82S2VjRXV4dVJjenU5K1NTOU1xZmhu?=
 =?utf-8?B?b3JQbmlsYmxFdnFJT3lITklQSkQ2N2pxYXp2WWZGUUxKR2QzQ0MrU0FMNFZa?=
 =?utf-8?B?SWFZTksxWlpKY0I3cXpZOVNWcWV0UmZRS2hKTlR0dXlySnpPY3VXTmZaUUxT?=
 =?utf-8?B?eFU0akVKYWhDbU9lVGhWYzVHQUZ2YkJ6Nnpaa2MraDVLMkV3cGdBWmdORTRp?=
 =?utf-8?B?L3dOTXJrY3E5aWJ6LzBaRDlkT0xvemhRSjdwc256YkNLRGgvZVJjQ1J2amV6?=
 =?utf-8?B?VnRQYjJHdUNMMHM3ako1cC9kZ0ZtWXRhQ0dZQVd4ZC9STU5ONHpodi9CdnNm?=
 =?utf-8?B?TFpGV0taWDFBZVhEU0RNMlF1QXpJUEtuUDZVN0R0elZ3Tmh0bWVud0YxbndD?=
 =?utf-8?B?UVNuVGhWd3ByYjN3dVBRZ2Nta1l4TzZXOEJ1QUdJYkVCdnJjVWtMUjRuNnUw?=
 =?utf-8?B?Z2hWT2xWbjg5eU8ycU14eU9IRGFWS2FpWVI4Y1pwREVSbmhQL1lQZ1dSby9L?=
 =?utf-8?B?aWs1dFdvbFJDQ0dCUG5KNnJoWE1sVlJXbGJSWmdXYTFLRU1zZndEb0ZKSy8y?=
 =?utf-8?B?T0d5STJtN0x2MjZlMUVZWGFhQlY0Z3JCS2NNRG5WcHowZVpOK3J3Z2lGTEUx?=
 =?utf-8?B?RmY3OTkwRnd5WkNTNjdvMHoxa0NyL0E5ajJsS08xc0NRNTdjYkVLdkhiNWFv?=
 =?utf-8?B?RjVFL21XMi9xUFgvNFBkUHUxSjd4N29HUVVKUHJoRElaTzNvaHBtcVBuRVZ0?=
 =?utf-8?B?U3lvZkc4UjIyZGZ0aGpYeE10TXBiZDd1Nm9PYUlrRmdGcW5OYzVxelBQbkE0?=
 =?utf-8?B?WUZ6UjVkQS8zS1pkZmx1WXJYL2h2UHRsdWZaQSs4amtyZDliYmpiT3l4NGJj?=
 =?utf-8?B?TWtYWHpnMGljQlJUL3hYYlczWTFiNDRWWExUc0pKM2pUWGFXanFJRFFsZUpI?=
 =?utf-8?Q?I3RzEO8LVQ6JxmVrT5iiRlf7OAMsdIAl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHg3Q1hlemtCam5FR0E5QTZ1azFMMnhIUjVBYmFJcmN1Wno4NWJOZVhwazBh?=
 =?utf-8?B?N3ZjS3FzTGVaSW45eTROcXZxWitvd1J4WFB5aU9pYzlSSlU0cWZ4bkUrSTZ0?=
 =?utf-8?B?SnpNcDRmS3FxRzQvL2RVdkFiVlo4em5JNDJoVXhsdVpxQVlacTJwYkFtUWVY?=
 =?utf-8?B?RmFVYk8rT3IvQndQLzRCQkdxbndmTUdwd29CandEcG5uS1FYZnAyNk82Rm83?=
 =?utf-8?B?b3h2KzN3a1pnMnM2elBmTklUL1l2OXdGUjhOMVJzbTV3SGQwV2VKNGVlN0Zm?=
 =?utf-8?B?eFRicHROK1J3Yjl4VmVoUklRcXdxcnRHeG5zRVdOVUZsaHRFZ0ViMEpKT0xP?=
 =?utf-8?B?ZzNrRlJtNW5VTGNzMUU5NVlEV3RRWkFqY1lCV1czR0FVeEQySjlzUWxZU0RO?=
 =?utf-8?B?eEY2VHZKQ3BFc0VSTExrN0g4cUhqQnp0c1Vyb3NkMnhUTThDdEkrRWg4T1Bz?=
 =?utf-8?B?a0JkK2pSMTR5LzNrYW1sSTFqcU00YU5kZStqLzMyNTNnQVhhQmxqcUZYY3FE?=
 =?utf-8?B?SjVvY25KZ1NzZDRaSTU0b2I4SVVKS05VWStsSklEQU14Z0JDN29vMmhDQWxG?=
 =?utf-8?B?KzhVaHdTekhNd3REYjhFeHBIQTJpL0Q3NnV5UVl1Qkx5V2tKVlZEdEFLQk1z?=
 =?utf-8?B?SWJRczFYUlJZOEJBUEdOcmM5SW81ZE1YQVVMNU1tZU9oVSszMlo5Z0VpcVlM?=
 =?utf-8?B?Z0JsT1crQ0VGbkc3RTVIOFYyWjMvcFQxSk1SL0FSRmxhVWxPNGlIL2dzN05D?=
 =?utf-8?B?czZKYS9SV29wOFhxeW1GeHJhZFJSaUZ0blhTSlJ0U0JrZ0RDRHFVbmdaODVB?=
 =?utf-8?B?UnRCTHB5OGdSendlOU5Qc1NCOUJvcUo3bWRzcCtnZndvKzZGbkE2NS9rMU1k?=
 =?utf-8?B?TEVpdGFVWG9oZDA5NkZsNjYvQlFtZDVoMlVPU3lSK0gxV3M5SHB3R0Y0Zk1a?=
 =?utf-8?B?Nm5ySlpCMnZHZ01hZ0UxMUtYUzFJVmdaS0g5WWRJRlJJRWFTdUd0Ymh4Qkl2?=
 =?utf-8?B?R2N6dm0rb1B1QmVaRUhMcEJrRHNtSWRRR0xuaFduL0hNZHUydmpuTU9TUUdP?=
 =?utf-8?B?eDVBendQaStCc0UwYmFwMHBmNmNwMnN3MDZIeTRkUjl4UzRPSmIrYVE4SHVB?=
 =?utf-8?B?VlN4L2FNN01sbHlaRzJzV1k4WmdyS2s2NndFaUt0bjQxN2ZjRzN5aVVETjY4?=
 =?utf-8?B?VlhtaFEyVjhzNzRwQ2tlaHVTQ2FLb2VGMDhrNUFaT0hrbXprRUJrMTdKaHRD?=
 =?utf-8?B?TTRmOWdTUUJxaWhEK0xHT3h2WHlRM1pDQTNsMXhHMnRZZjd2T3orRm9LZm9P?=
 =?utf-8?B?NkwvOGtCTk9wRW9QYzUxd2Nwd1hzN2N0YVVXRVNVbmRNYk54bVJtakpjNjN1?=
 =?utf-8?B?K0RKd3UwWU9ZNXZsRGVCd0hZQjlSaXlsbjNlckdIMkJiUXE4MUx2dlZMOWNX?=
 =?utf-8?B?OE1nQjV5alZwTUVkZDVMK1N6VEh2Z0FYaEV6ZWx5cGJSbmdiK0tCeGZtcjBZ?=
 =?utf-8?B?eC9iOEhiWGk3YTF5Y0pGUks1ZTU3ZWdtTUwrVGRFYVpXZWxXa3lBN0FhaHB5?=
 =?utf-8?B?L3JTMnJDNE9rMUhRQTMwL0FFQ3ZTV3hTV0t0L2xNWGpDVEtReHpxVmNsVFZM?=
 =?utf-8?B?T1JVT1ZoNWs4WlduWEY0dGhOUFE3VnpkNG1PYm1EWXM1aXRLdXZ4VVdDa0pk?=
 =?utf-8?B?T1NMekc2bm9NVFk1aFFET3dQdTVQSzdpSWpvd3BwZ0wvajRqbnhLTGdyWTEy?=
 =?utf-8?B?SCtyWFlTQ3gxMUhJUnhuNm83WExVWHJQQ2Y3MHFnak51U1NUWmxscVNwVEtl?=
 =?utf-8?B?SUUzZ0VsTGdQWjRtU2hEVEhUcTQrUG5PK0dieEdSU242ayttRThOMWpUNXJt?=
 =?utf-8?B?UUVMNWpnbnVDV3ppT05Yc3FqRkovYmxJdWJtS2VYRlpNcUFtanFlWWhwN3RV?=
 =?utf-8?B?OHdoVFM0SjVDTmU4SU9ITnNuQmZoZHB0end5TlNYaGZ0TndBYjhleDFEQ0Vw?=
 =?utf-8?B?Qm5ETzY5NlJWMlFHUVhUTFdlT0RSVjNVWXhGLzhNQnhrU3pUZTJhU2E1UHdI?=
 =?utf-8?B?QzRIZDdlbUxaRjI4NkFiclE3aU94bGFudUJYVVNlM3AzcUYybXJXaGdRT0Jz?=
 =?utf-8?B?bUlzaXdxN1YrSlg5QTgxcTBCN2VYaUo4ZUFuVWcwMnNjS1ErcGNlbXpBTDlZ?=
 =?utf-8?B?dWc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79274967-dcb6-43a6-16ff-08de17025d3d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 15:46:45.8394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTF1JF+BG4Ghqi5vDp8M9VJNxci2EttHGhiBYSF+FjkkthwaKJXDWKnRfRKLdl7Xn3DPLJdHCg95Sd3sQra21wh+zVg2NuOfyHpDZu0Dggg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR03MB8306

On 28/10/2025 12:43 pm, Grygorii Strashko wrote:
> On 25.10.25 21:10, Teddy Astie wrote:
>> Le 23/10/2025 à 17:22, Grygorii Strashko a écrit :
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> Functions:
>>>    hvm_shadow_handle_cd()
>>>    hvm_set_uc_mode()
>>>    domain_exit_uc_mode()
>>> are used only by Intel VMX code, so move them under CONFIG_INTEL_VMX
>>> ifdef.
>>>
>>
>> If they are actually Intel VMX specific, they should rather be moved to
>> VMX code (and named appropriately) rather than if-defed in shared hvm
>> code. If AMD code happens to need these functions in the future, it
>> would make things break pretty confusingly (as headers are not updated
>> consistently).
>
> I agree and like it even better. Can try if there is no objections?
>
> There is hvm_prepare_vm86_tss() also which is also used by VMX code only.


There is some horrible complexity here.

With SVM, we can run guests perfectly well in Cache Disable mode (i.e.
gCR0.CD=1).  Nothing extra is needed.

With VT-x, for unknown reasons, entering a VM explicitly leaves
CR0.{CD,NW} unmodified, i.e. always the Xen settings, which will be
neither bit set.  As a result, when the guest wishes to set
gCR0.{CD,NW}, we have to jump through hoops to make this happen.

Without going into the details, the upshot is that this "handle uc mode"
logic is VT-x specific, and oughtn't to be in hvm.c.  Moving it seems
fine, but the data, d->arch.hvm.uc_*, wants to move into the vmx union too.


hvm_prepare_vm86_tss() is rather different.  It, ultimately, is because
of limitations in early VT-x and it's probably fine to move too,
although the infrastructure surrounding it has bigger changes needed.

~Andrew

