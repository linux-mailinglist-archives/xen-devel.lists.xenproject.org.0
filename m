Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICfZEekNqmlbKQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 00:12:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC7B219336
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 00:12:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247238.1546025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyHrl-0002dj-Ah; Thu, 05 Mar 2026 23:12:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247238.1546025; Thu, 05 Mar 2026 23:12:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyHrl-0002cI-7n; Thu, 05 Mar 2026 23:12:25 +0000
Received: by outflank-mailman (input) for mailman id 1247238;
 Thu, 05 Mar 2026 23:12:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k4Bm=BF=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vyHrj-0002cC-SD
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 23:12:23 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0e089a6-18e8-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Mar 2026 00:12:18 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM4PR03MB6190.namprd03.prod.outlook.com (2603:10b6:5:399::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 23:12:14 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 23:12:14 +0000
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
X-Inumbo-ID: c0e089a6-18e8-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jz8aPoOD9fw1Xwk4j0GLg8YyM2EcL/2Dz9F04eHcDA4rkT7hUz4a0FuBpt1VsqAaTDP2+UzEjBnJUTtKcS7jmDcoNw22RvpEmvxi5PNeH6XFVKFfRcsUnIkTulal0RGFCEMMvK9nfCVXyKJzZt+t4m6vpkqZAEjAVvYC8+ySDmJ6/y7t5iZ+vZa3oXbuuMj4FAQgwIW1IUNhsQTvsHfbHqXPzqUPmjt9zTZQBjHLSmO4tdC0JsyfPvuZblf0BbKEfe7PJW3UvRHrGKVq9n/Igb2RFkAzx5UOzauRlIcq9zc6T3V6AGjm1VTuRw8QBE9GVwd07iRHU2kFaJWtJVWQjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5pjx4bf+wJbVOTCBWJI7I9V55TuDqo6aQNSqfapI5E=;
 b=qBluRLUiqQRskuHo4pF/ev73Na+mSNpblZcujBwOoT9IHdMI6nYnTLQ5kQj7hRWFlCEsV8Ep0JTnx8o6il6mxssR0MwM408voywOgJjprvPrbKXBb1pYuj+iaFEtSxX3q7o0k3kN+fPfL8BiQApfU9VRt/a0XUgSic1/165TOsSZtwTtfwpAk9G63Lirov/CqiVuBhNoMLE4HU9p8sVXWBPuiE/mlD1zl93Fr+RTqWSHJI5olxJUkEbtjDm7lSoblLOG3471KVlGAA5/QhXhxWgvpIhPQOQdPGSjshIa40ljCXOKN/RsEe1OKaBoC/erHyRcYGw+1N9x1DpIiW0HRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5pjx4bf+wJbVOTCBWJI7I9V55TuDqo6aQNSqfapI5E=;
 b=JwQrZOT6F1CkgzrEPNIUHHs6gmqNqtiODw9e6CocLNYUK/3HF0xsKCXdZjKpxdhWLacBBDke4dwmeJFNvHeGbZin+QBUgC6Bu9Nd9WMeeAg0bqGcbw3WMTDJit7HWpiYzPVxDz/YYv8TT0CoDYQzQ4Zi+ycbjSbvyDpjTzzj0Cw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0644e951-2200-4b24-8e01-ba178aab8136@citrix.com>
Date: Thu, 5 Mar 2026 23:12:10 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH] arm/gic: Optimize lr_mask type based on GIC version
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260305195745.2595017-1-ayan.kumar.halder@amd.com>
 <4d81d177-f1ce-49e6-8a40-fd16c0b4e0b9@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <4d81d177-f1ce-49e6-8a40-fd16c0b4e0b9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0109.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM4PR03MB6190:EE_
X-MS-Office365-Filtering-Correlation-Id: 3953ffde-2624-4b33-8a53-08de7b0ca33c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	51O+X3x6KjgtfDZEQ4cudvlMdazSy7BgoN6stQnI2WvtS6f0i216VN+/LMhW5UzMw8Ym6IrotQDJG7gObveFg+rCjgnr1fe6dB7u69yoSWyO2f7NV+ijLca/MVpBl4Vx/6ovRHZe5LMcbCLwWKeLixRNSJdFwqQSYF0eMnsSfFVYY5ovbgkRJ7/eNcbWe5oMjPC924ui9hunaBIeItn3eSLe8HcJj+ISA3PbVL7fPy0McrogHhjedfiRNpZoU2lRS1FMbl30wO1kfY6jY+wOfNapJ2rTozwEHHWyK2ORndyqd6J5XGH8wLbbi1ow+zUWr00yK+RwdcF+RDK0Xo/sQEHOoxxge6ZWeFlQvP+p/995fYWUbdzuStZim+D7f5sjX9ozyR2m7iaZdTC62kzsFRnX82hn1D/Rml44GnZpI1HU4UAsISNZp9Ai/HFIPnxPha8frxkmacF12p97xofLCDd6Uuosaop5VuKb3m5bkAX7qPQfkQZeSILCu+uxuzc6aoa5nsiTulzoazDmS/sJQkESSO/4hTB//0T/PBcZXZ8PrJWAbSsO2pU+XaNogaPwZEXSL+fzF7GNQjmqqN1SMQAKc48PTYPGFUerb/ecSWfCN0beEhB+APLWOQywsK0oduPqgve62xylGMs4DXXNP6pkpMUhNhfDt8Ick8bM34Gc8keazNi1PE8ZRHmhMVjgIyJCDi/AcXAcixbEacLBsiWBUzAWOnzTcbAG2N6mxqs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVJndlRPRTJCSzlDYStWVEJ0Y1krN0hITE0rYk9Sd3NUNG5uYXFFOXpaRUlG?=
 =?utf-8?B?NnMxU0VGL1FKcWpuR2pDUUlVQUYwMkd5a0N3V1J5MitFTHYyQ1RlS0poTWQx?=
 =?utf-8?B?TjFrU1FudUxqU1YwTWxCWTlBK1prRWx0MzNIcTBoZFp3aFRqbXYwYUlXQW9l?=
 =?utf-8?B?SGZGUGd2ODFnVG4zTUFoZnVrRVkyZXRrZVRQL3V3QlVib2Y3M043ZHBHcjJB?=
 =?utf-8?B?UE9PbmE0dXBQdWhXNkU4UVNWSE5ySHN5dGtxWDVmN0w4NGxVUTFWN3NlMjR6?=
 =?utf-8?B?eTVtOG9RZ0VpSjJ6dXZ1aURKc0dPQ01DRkdtMS9hUVhRUzRvelJud3NRVk56?=
 =?utf-8?B?MndrUlNMRmM5Zisyd3p6WVhhM01wVkh5VHZrNlhUYmxzWmFpVzdRZ0FxQk1L?=
 =?utf-8?B?Kzg5SWIwNWMyMXVaYUY2NXJjcmtVL25VY1g4N1Z0QTNnOGhHL1E5NlduVWQ2?=
 =?utf-8?B?WWFJUmx4dFZjcU1XN2NjZ1ZjK3FHTkovUGxYb2NFSkplMUVZQUVZbkpPT20v?=
 =?utf-8?B?S2kycW9sL0FRSlRvNG1hT2x2VzdiSGx6N3lDVnhvQXR1MGR3dDhhbWFWOUdQ?=
 =?utf-8?B?aTdTV0FraEMrQS83cnpESnFXdkYxR1JKdVZsZHhxUEd5V0NrOWM4WTM4em8r?=
 =?utf-8?B?WC9MNEl2OFozVTYwdkFSRDJ4cnc5UW9yUUloaFU5MnEvVUZlWHM0NTBDd2ZH?=
 =?utf-8?B?UnRQc1k3ZUZHYm55aE9DTVNXbGNVdElJNW13OG9meGpURk8veERQK09ZSGF4?=
 =?utf-8?B?ZktJdSttR3hFcHAyZzYzYVZTSzRsZTgyY0N6WERoVnVzNHc5SWd3MWtXVHEr?=
 =?utf-8?B?ay9YRS9SdThJZE9nMytFTjlxOCt6K1lVQTV3L2JWY1hqSEdIcWp0MHpZVmZi?=
 =?utf-8?B?T3g1bUlZS0RPSHB2SnRoSllYek82UzNkWm1HeUlzZGZjT2U0NHNmdmRrZ29v?=
 =?utf-8?B?Q0dtcDdnOEUwOVlIb2w5Wmh0VXNpc20zOUNDQ01aTzVLMjA5RGh1NHI0L05s?=
 =?utf-8?B?bnZFRGd2R3ZtbVpTVXJWdTVlMWIzemVlQXJkM0xvT3R0Mldab2dyM0xPTXlX?=
 =?utf-8?B?M0VoMkxYanp5cGthdlU2dUJub2d4Y1NhWkRXNXVQSFJLOVNtRGhTcVVzYlJO?=
 =?utf-8?B?ZFdJWEMxOHNMeVJMK0JlWm9nemV6VnRjdlhnVElJUFNkaElXNEdnTHZRUzUr?=
 =?utf-8?B?R1RrSmVXdEtlSWFtbmhWY2FETjlSYUY3NDN2ZllhMHdZbDFPNGEwRU5QYXlC?=
 =?utf-8?B?aDBYSzd2NG1ObHV1ODlPc0Izd2puUDVCelJ0WmFzUm5ieVRNVzRiSm5HOXZp?=
 =?utf-8?B?WjJyYnRiWFB3TG5aeEFuQloySkhvNEFFVHloUlpiT2JrWlhEcFE3aXJaeEVC?=
 =?utf-8?B?YkdEQkpoWk84UVEzNFNiSE52UXZnTzFFOCtQOWdSN0NJeDVtWGpCZG9saEJJ?=
 =?utf-8?B?OGlEZUpKcUtHbjVweWRQN2dkTTFmOXQ4VmVHZnVGeDRIMjl3VFllNy90Qko0?=
 =?utf-8?B?UEZiZVpsTGZHYWx1c0xINGZaT0JKMnFlOUJMSjF5WGJqa3duS3N2K1liSXVF?=
 =?utf-8?B?b2xOb09xSS96bExWTS92ZVZLRGwwSng4T3pYSnhmbVNCcUxEM2J0aGxpYk4y?=
 =?utf-8?B?cmNpeWc5VmNyRDc5SHpxZ21sRnhRemZtMXAwRkVaUldzNVZLR0o1b0NyUE1u?=
 =?utf-8?B?eTduT0x4L3VIajRnYTc4YlVQYmJOMVYzeU9CdW1DV3RQSmlDUFhuRVdwVTds?=
 =?utf-8?B?QVB0U0JrRHNqbWpmRjM2VUxOYTVlbkdwNENXKzFEQjZlVkZDRmVqTnh6N3Z2?=
 =?utf-8?B?Z01ZSWRmcDdnU0NlR2M3TnhnVFdYR0R2SmJXam1LMzMwVjUxZVFVUDRFQzVx?=
 =?utf-8?B?WFRFNUtOWURVRWd4Z05FaTRVTkVuT2VtMkxtdFBma2VER3hMVGVpd3dGaURE?=
 =?utf-8?B?UU9ieXJwcTBhQUM2dlh1UTViMjJaanhLSWtaOXNHOE8xLzhhZW9EVUFtbWpW?=
 =?utf-8?B?dFNaNFg2R2N6UWNnMVdqZTErZ3E5bVkyZy9Ldng3SU5vYmxsYkJPUEtsNUYy?=
 =?utf-8?B?VUtOT0FTbXhld2t5OEx4ODBwM0F4ckpVWkVYdFZPdkp4UzlJL0tDT2Q2VkZV?=
 =?utf-8?B?SmNjTkVlUjhlY05jZjdrdkdxQ3JEWXN1TkFvQjJMaWdJMWlEOUgyT2YramJ5?=
 =?utf-8?B?NU5IV2x0Y2NSNnVDRzgyQUxMbDBsN0VzUU91UUVZbnJRNit0K1gvdy9PTGxa?=
 =?utf-8?B?eDgySXBEYlhWaTF5M1ZvUkdrRmZEdGZCTlZBUTBYUUpRNmJuS0Jmc2FRN2ZR?=
 =?utf-8?B?MWJLM3VLWVpkaTlCWFE3N0pUTzhhRk1raG5GM2VUejUxd0k3WWpBZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3953ffde-2624-4b33-8a53-08de7b0ca33c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 23:12:14.2316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mnCejbTdqU2SsGNhfkOvgV6jqPWgFO76Lbn7dzqwdCQttWQlFUQ3sLjsq/tW7aogdq2DX/9LnRsWxpbybaLBGJ/PKRf1zYaIrnQWRUGcNBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6190
X-Rspamd-Queue-Id: ABC7B219336
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:ayan.kumar.halder@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 05/03/2026 11:01 pm, Andrew Cooper wrote:
> On 05/03/2026 7:57 pm, Ayan Kumar Halder wrote:
>> The lr_mask bitmap tracks which List Registers (LRs) are in use for
>> virtual interrupt injection. Previously, lr_mask always used uint64_t
>> (8 bytes) to support the maximum number of LRs across both GIC versions.
>>
>> However, GICv2 and GICv3 have different hardware limits:
>> - GICv3: ICH_VTR_EL2[3:0] encodes LR count -> max 16 LRs (4 bits)
>> - GICv2: GICH_VTR[5:0] encodes LR count -> max 64 LRs (6 bits)
>>
>> This patch introduces conditional compilation to optimize lr_mask size:
>> - CONFIG_GICV3=y: Use uint16_t (2 bytes) - sufficient for 16 LRs
>> - CONFIG_GICV3=n: Use uint64_t (8 bytes) - required for 64 LRs
>>
>> With this, parameter 'lr' in gicv3_ich_read_lr(), gicv3_ich_write_lr()
>> cannot have a value > 15. Thus, it should not possible to hit the
>> BUG() in the default case.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> What does this actually get you?
>
> Because it doesn't actually eliminate the BUG()s you reference.
>
> If you really want to go ahead with this patch, then make a  lr_mask_t
> or the right type and don't double-code everything.

Also, this creates an Out-of-Bounds read in vgic_sync_from_lrs() amongst
others.

~Andrew

