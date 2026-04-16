Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yD6MEnr74GlloAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 17:08:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB16F410433
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 17:08:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283649.1565814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDOKK-0007VU-V3; Thu, 16 Apr 2026 15:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283649.1565814; Thu, 16 Apr 2026 15:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDOKK-0007Ss-SN; Thu, 16 Apr 2026 15:08:20 +0000
Received: by outflank-mailman (input) for mailman id 1283649;
 Thu, 16 Apr 2026 15:08:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wDOKJ-0007Sm-ST
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 15:08:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDOKJ-006U4x-92
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 17:08:19 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69e0fb56-e002-0a2a0a5209dd-0a2a4504974a-46
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 17:08:19 +0200
Received: from [52.101.193.7]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69e0fb61-1dec-0a2a45040019-3465c1073096-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 17:08:18 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA2PR03MB5721.namprd03.prod.outlook.com (2603:10b6:806:117::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 16 Apr
 2026 15:08:15 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 15:08:15 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3SyxKAIrgjxnmd2fOVUDvRx8ADWDWCkpnEwkuJaNQVUj454sHXqkGcR1OmVoPlhYAhvDTM3RTQX4Ude7IvS9KDQGgUZOs7/c+13wUJhFPCS+L3XEODDYdEQxQYj1gSmF7eI3fgFtSBr27x78sa/ztwi7xoQRfPJKasQaA+fnhgoCMAkDirWFLf4a8H6kGQjHgSjBiiunEZBuWzmxn2Yp/WyZdg3rnNuDlDwZy/crMiWxG5lxNQwjuC0Ve2dikXFV7P627CWay7E+X6+ohxRCX2zcQ9lzQyiperX6KFTMFu+WQd45x7jmwBuOtYy1Asqq8LPGK6aNW0ftkBM+ObUkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmxJGYfV+BK9CeO9I7cbWuf0MRtfPiUFwAsIa90oYSI=;
 b=arAY3LwNymU7r8k0uiD1TCqucOv5MWJoRlQgLSzQKst0vzQgKGrIH60QV4Pu6AGHVXnp7nVTKWnYp54MQlgbKeFrrF8h/cjAt2jCFurSRyt2qxM+eIWx2MJNzOHH4xmimcNd83WKqAorqzZl+u5hGl9eOMcsZgCS4dwn4HtaAZfk/RetlWkc92Fn/jJEOVrtlwRBL7EakVMewWn9xkm7dEoBLMsUKMbsOXC1uu4U+48G/8ZkM2EZ6V+Th3pvUINiQVFhopllKgvblOZyj9iiHM+o2oxtSDYJrLYxZ0DFPSnVH6J5Gen5u6gaIzuTh7feBnXH5OgPpu63r3YwWPvmFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmxJGYfV+BK9CeO9I7cbWuf0MRtfPiUFwAsIa90oYSI=;
 b=fcINLIUKZjKHF9/3CFi9zR9wPkmVX/SRN2jJbGCT/VIAI3v22g3YAJAwagPbclL/6VPSZAUMKMUhIK/jiN9FPn+RYtQWE2AAuMCCUB3BSwIIhMd4gwlu8Y8jLnttYVuHwlwgDB45Gy1OamITOfG6Cv0RvFsR/ahb4GUYWJKjYQo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5fbe67ec-d96b-413a-b1e5-fcd8f3c6dacb@citrix.com>
Date: Thu, 16 Apr 2026 16:08:11 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] xvmalloc: adjust XVFREE() ordering
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <29c2a896-59b4-4804-ade4-362f65ffadfc@suse.com>
 <aeD0tZVMC-LD5FMo@macbook.local>
 <58dd3393-02a8-418a-8a8a-7d8f0256fb3c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <58dd3393-02a8-418a-8a8a-7d8f0256fb3c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0090.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:349::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA2PR03MB5721:EE_
X-MS-Office365-Filtering-Correlation-Id: e8e15a5d-3420-47dc-587d-08de9bc9fc34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xhXE8fcMtzdU4eQnwtIqk71Crn86xh56TWefEYt3jq2s7wkbuS9K9NI6RRPXvSPdmqpmrYbW+7TgMdzMg+xDzHIrOQKmmvqlKiO1Vc5oGjCnEReLsEBgJHHb+mQiquI8Yy05GXO8PPnaeVTsUFvTJaE34vwJwQrX8o7Xyf2es+EO3xcSJdfJG2YEljsyqKkFPCEnzUt0yHi4P9vF7LGzoITvA3Ikr+XS5ieUyJeoPNkHPnPLMZu2jkdzdhcgInnmGEcD98sY+WX4u2eDl6EuVIPmBvUcLZdxADyTjxlQ2xYiYoY0Hq6ZuDgF0mxuGU2ULjTVqOJyDFlYARdZ+jRzhHwuYtq+SMbLWDzD1SjBq2JoiUOly1Tz7JnTvFfYUEk6GWDXHFZ8hHxfShHBuKDwNikEyazvHnrQ3WgxCr3z+PcGl2/h6FcQ5Rnz3K8SsyvqnBzYRP5j2l6vC3wjoynU+JBrW8S8+2EwGHnGnWwLkspv8AQfq2DOuZhadTBOmC/GCjBLMPRxtLZymkosKouBeUvCvUSuIDfoPvfEvMlV6htQA38INVgvqRMzbjw5LBCjB4+tvrgui2UI3yMmZd0Vz1CdBncyNG59LND7cj+c1RD33tsUVWPtigtSdYQC0Od9G9ELnuUWbVgT+LpBpNQcvm2U1Y7PBHXVPJ262NJhzPRJMR79nITLf0cUhbpcvTotr9j+eW7arv8tn2AawdAYIJ+eIbdWyqE11X2RNFLtPps=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2pqVndwZEVMZkcxSWxqV0RxYVJvb0pWemdMTVBadzAzN01LM05IeEJHSW5E?=
 =?utf-8?B?ZUpPNVg5bytqbWZQcE54SmgrWWo2MjhKZG03aXVDTk4xSzFuRTZjMW45eVBh?=
 =?utf-8?B?WkFaVkRyb0lrSzhPQUh5dmFvUkpDTDBRaW5wQmd2TGxUVi9KWEI0eXRGWTEz?=
 =?utf-8?B?RjFCVjBWTHB3b3kzZkU5Q1VYb0tLNGprSHJBNG9iUWtqVVdqM3VOSy8rd1c1?=
 =?utf-8?B?cXI4ZFU0cjRqOFN4SWNMK3lMOUpXT3drQjZCbklCNCs1ZWREbk9HeXhLWDlZ?=
 =?utf-8?B?V0xkdVZ5WldyQXVUanhUNDJMZ2ZHVC9wbkZUYmlDNWpvNk1FZ3ROREx3c09S?=
 =?utf-8?B?ZTNlN1BZN0YrS044Vm5VVnAyc25xVk8yc2xnNm9SUlkreENSSjkrbzBFVTZW?=
 =?utf-8?B?QzlEd2hwbW5QQ1dPZkpZVVpRRlgvY1Y5cTVZOUtydXBLT3Avc240dzlOQXdI?=
 =?utf-8?B?cDdHSERsVU5MNG9FOFlCUzVFWERyTGc3RWcwaDBvMkJFYW1wd3NnUWZJaCs1?=
 =?utf-8?B?cVhaT3BGQUt4SVh4TXdSRkRYdHQvenlMbG9DalFKSEVObi8weHhQTGVZT3Vy?=
 =?utf-8?B?VE5rd3NWK0cvNXVVWmVWZkFaYmFsa3dJU3B5VkxhSVd0S3BiZHYrcjVDRGQ3?=
 =?utf-8?B?UkVUV2NmcHZ2MUNzMzZGQVREbUJJd3FOV25SelA5SjJ3T0FWMmN4UmhJR1VL?=
 =?utf-8?B?UFVDWmFtM3czRnNFbE1xYWJseEhrZUx2S1hiUU96eldsRSs4RW1OTy9vbVhQ?=
 =?utf-8?B?OC9QNzhlNXBUaXRPazI1SVpick83Mk04WVRjdUZtVTlFS2RrYUJMWVZiWEp0?=
 =?utf-8?B?ZjlvbE5TWUlTN0cvT1FkZmtiSVFRbkpEUDNTYklpTWo5OEpFaEhnNkZteGx6?=
 =?utf-8?B?Tjl0SHcyQ3FyQUM3aGlVV0ZLVEJZRHMzWnU5QTZTYkcyeWZPWjRFYlJMZ0to?=
 =?utf-8?B?TjdQcm5oMmtIa0M2bzdFeHU4cy9WaWRXZDZKNWlBcHViWkhtOW1tQ1F5ZkEr?=
 =?utf-8?B?VXNRVkE2VTJtdFlnYmpRMTYyVEliSHFMZmljbDl0UGE5SjBOKzNYS3Rwd25w?=
 =?utf-8?B?SitRVDMvYm5TNEJHZzBTLzJMUUJNNkRKelMzOHBnVUo5Y0IxcTVmZThIWW1L?=
 =?utf-8?B?UmN6OGlDMng4UkRFenY5WDMvaHc3UTd2V2t4WGJOUUM1c1lGb2VEaFMyUjd6?=
 =?utf-8?B?ZFZLMXNKQUY1aElGZFQ3c1ZtT2ZzeS9yVk1MKy84dytnc2o5UGZDNWJIOWRZ?=
 =?utf-8?B?TG1MOTNhcGtsUUg1ZEx4MldveGRpSEU0cjZHeVpFMnVsWUttMFRBTDhhRE9n?=
 =?utf-8?B?NkhjVzZDRzhQd1ArYVhXWTlhQ1o0Tmp0VHE1RkxBeDE4SFJQbUtGNnN6eDQz?=
 =?utf-8?B?ZGoyZTJJVmQ2WVVCeHRaMGVPWmxxQ0lyMTJsWjBDTWs4dWNLUCtiWHB1dTFZ?=
 =?utf-8?B?YWNWKzVpYkpTbFNBbVh6Zmp2ZlN1Q0hXOUw1RFdQN1p5cjU4ck95RFJwcTZq?=
 =?utf-8?B?MzRIQnVGN2s0TUdlRjJCRkp6ZEhobnNyRUF6TWV5VlpNVEpKNm1RVTVsVHZY?=
 =?utf-8?B?YUFiSzhCbzk5cyttWXN6L1Z1L3h4cmdMaWp6bDNTQm9XcjdvS0hWRms5ZWJz?=
 =?utf-8?B?REpaVlNtTDNLYXBsdTBxQ2NGRFVuQUgvUDN6NStxTE42Z0NGaVR1S2N5em5M?=
 =?utf-8?B?QkFoL2g5emxod2QyUFhxczl0bW9SUmxvTTgxMk4xMFAraHNVT2tGMnl2RGNm?=
 =?utf-8?B?bnpsMENnTEpPUllLcTQ4alJXRXZsREtwWFhFN2FRd2xnRER2K3FDeUlXTFpp?=
 =?utf-8?B?aXo2RURYZkpVenJyREM5N0crR2pvVW5PMjc4cFRNaW9NL3lOMTE1ekRzeUUy?=
 =?utf-8?B?VFRTdEt3S0VLbS9iazYvcGZIS0Vvc21kRlVpdmlObWx3NHpjQUtncC9Zenli?=
 =?utf-8?B?TUhWdUk0emJ2b01UZ0dXdGZqVHpja3EwT3JFR1VoRERLOE5lY0tGRHh4RERy?=
 =?utf-8?B?UUlkbG1NQ05DTCt2RDN0MzFSZXdvSXJ2SkE4OHVpamtqZUJtWXUwbFZHUkhL?=
 =?utf-8?B?dm9abFZ4dFVlVjNMeVAxSXJ6YXl1N1lWSkpWa0pwT2twc1ArcG56aFQ4UTk1?=
 =?utf-8?B?dXZuZ1BGUXdnNWRiTEFCb1FGZUJSUTJtMk9Zam03R2V5K1lRelEyVm5IVnVO?=
 =?utf-8?B?MmVERG5RVE5nQU9MeC8rci9FcGFycVVFcHJXVVFWVTNJbFNCSU95amVCeVF3?=
 =?utf-8?B?VXREcmxvS0hnMjJrakR5d0RRK3JrWDIrZlBBdG5CZzVxVjdnZ0dOZHkwZWdi?=
 =?utf-8?B?TDlOMmNsSGNZYTduRjlqUDEzempNdngxNmkzeWtyNWloNkY2TGN1QitxL0RC?=
 =?utf-8?Q?EJQwGKjLMeQKOBBM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e15a5d-3420-47dc-587d-08de9bc9fc34
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 15:08:15.6192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MfrvzFYkNmHZq4kpfqUNkpywFt8FG/Q9U0avVJxXZXZkxnoiTZF4gIfBRN4zs6Oucd6sXgaAyhbO7Ukvx9moSGyRA3bwAnGXRSJZUlKhLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5721
X-purgate-ID: tlsNG-ebf023/1776352099-4BD6C3FF-E8A219F7/0/0
X-purgate-type: clean
X-purgate-size: 1281
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,citrix.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AB16F410433
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16/04/2026 3:50 pm, Jan Beulich wrote:
> On 16.04.2026 16:39, Roger Pau Monné wrote:
>> On Thu, Apr 16, 2026 at 04:32:54PM +0200, Jan Beulich wrote:
>>> What c4f427ec879e ("xen: Swap order of actions in the FREE*() macros") did
>>> should have been done right away when XVFREE() was introduced.
>>>
>>> Amends: 9102fcd9579f ("mm: introduce xvmalloc() et al and use for grant table allocations")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> Thanks.
>
>> No intention to stir controversy, but I feel like this should better
>> use the Fixes tag, as it's not an omission or similar, but code fix.
> I would have used Fixes: if I was able to spot a use where the difference
> would actually matter in existing code. I can switch, but in the absence
> thereof I deemed Amends: (marginally) more precise.

It's speculative defence in depth.

Zeroing the pointer in memory before freeing the block is strictly
better than the other way around.

For the local CPU it prevents speculative use-after-free (the store
queue is always in program order), and whether it does this for remote
CPUs depends on how strong the platform memory ordering is.

This all came from the Ghostrace paper.

~Andrew

