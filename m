Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAhmOLVqwmlScwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 11:43:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA493069D8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 11:43:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260325.1553676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4zDR-0003hT-0Z; Tue, 24 Mar 2026 10:42:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260325.1553676; Tue, 24 Mar 2026 10:42:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4zDQ-0003es-UA; Tue, 24 Mar 2026 10:42:28 +0000
Received: by outflank-mailman (input) for mailman id 1260325;
 Tue, 24 Mar 2026 10:42:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w4zDP-0003em-7N
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 10:42:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4zDO-000esr-JI
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 11:42:26 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c26a91-bab6-0a2a0a5309dd-0a2a450c9ef2-2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 11:42:26 +0100
Received: from [52.101.62.32]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c26a91-f93d-0a2a450c0019-34653e205c72-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 11:42:26 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA1PR03MB8190.namprd03.prod.outlook.com (2603:10b6:208:5af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 10:42:15 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 10:42:13 +0000
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
 b=pxv6L/6/tItxhiC6BNIVzhkXTcHB2MHY84KulbjGvJzEm9t/2rDU2NZV4cqvlmhuCvNWieA60aATHEHcv0tCF2dBie5mf+QzrgCrkELIY+y87WGt52z8jpZf+tlTok/wrW9bfPxNmeoVh1lxmKhAEPlurmPD0yk2KGFzW8PFwlesrqilMH+KlNRCw20T6v68fc5ab07q64tpPMc6W5RB72OBny9M43l05hbMNaTALMkujfgjblwWRXPhHizR7kpn6Ph+hCkWPwq3xCAM7PBEQcX8eK434h+n84VyhsTTG6DV3E7zeXJLu6vCNTv6/E5lA/X/uAv9NegC17nEkrYafQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROOAnVTIjqFZzUxpVEQ6+pSLkhcWTHf4QrPDNmMhjd8=;
 b=HmnuaR2vmdEto0zQbikMVfmZ0h5RLJBlY/wJDizgpbF64fMdGeG1nKwR0OYdrBRs2TSQKVsSXAMAe9rPVZx01TMKJDwDvrkr0Bj0NLDgreCAeInnLde3Hr7DBRBmYSus33Jn86+cIN1oSiVqx1T890MSIV/5bvmGqxJqw1sDJgJnc5IODnxpL3zYh7X7IxJX1WUtXaFxtIFoee9yKccrQj9RCNbFQYy+2ZSlxO4Ivg02RyIc3iXI4jOzOhDh8kVgTcjGXCdWWZISsJLomKWZ5nhwe0GzxuXnSWDe21In4Zisa5+1RG0AETg5DV8f18NiHq2Gy2nkFMLKZh8iHiAV4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROOAnVTIjqFZzUxpVEQ6+pSLkhcWTHf4QrPDNmMhjd8=;
 b=PBAQvCVdzuAdePaMO+9OnuuTis0/1bf/O4HQZlwHrJlzxHsMmV6BEwg01611+pirD+Y/Bjw8MNaVVgSi2cP6wvzJ7DefRFS+exe9KZk92fltRd0MjZRo9mZisWjbMVCLCYS2v+XJQoj1n7ix9bwXDdlhuDgyyxm5uc2kJW7pOHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9172b52f-13f8-4d9e-9caf-87ef04b5fb05@citrix.com>
Date: Tue, 24 Mar 2026 10:42:19 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/6] x86/vpmu: Expose PEBS and DS area in PV mode
To: Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
References: <cover.1773160025.git.teddy.astie@vates.tech>
 <0762ceb722be83bbdf6703cf419debf30609feb0.1773160025.git.teddy.astie@vates.tech>
 <7e4be441-c0ae-498f-9fdf-e5ea8bf11e48@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <7e4be441-c0ae-498f-9fdf-e5ea8bf11e48@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0407.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA1PR03MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: a0f7c61b-264a-42bb-a9c1-08de89920240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OL0J+ID2AxV4l6DlfZIJnos8cux/IA5QQK4SUC8qOuu7klROE1lSwER30xIi0yG0oy3J6NS1CmBcbLDe5GXxx/dM/PYw7yfjKJx3dppl6qN1UgBOWdZ3Yci8jYNe5FleCMYBN7/4tZxXvdW/m5eBg1BGQgGguygNO5dye7oi1RsjKnSvxoTiL2ZtxxHQl7Jgjbrs/bhujHL1wSF94pRpLxo5iHULhcOYEisbsi3BGLLbackADNDgoEyl19/CAtMLKWoCVR+KxaWy+qXUGmp0eWmF3vsY740xbNwA0bVV1UHMt4y/d2Kv01a+7uT74xgA4wKKGger8msLnpvvfs32AflT0eqcq+Qlx4g9dle0fzpuL5nFIFpyEFUaiyjDZpjPdBSaIrTDvvljH30dZtGlK38GCnfwG+gRplw/v1YS2HaCLr/C8SxY2qeYMqRFV/9qXYyTKt0B/EslqAMU+NpPeLmYDnqSJM50o6gmctbozWivhgMlQPhkUDCZCHAgO/XmtfSEligCzKRwcrb9iByrLxdmtxUsMSRxfGw+4/PbnTop4J8ve33Ei/7xspdhQF6Nfl2cNpXjjSihUbkoMsghUiyrutN+LW0RVfgOkk2flNYhx6R82exQhk97+IsGuK207S71BSXFoYTtUy3s/qc9PJrjerO3b4Im6PsCP4MACQPeci6O4hFViyEDsS5Ks5TfVPhUNtNNpFaneOehWBKb9Bg5l3mCf+X/gM8HEDLsFiY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXU2MnJaYUh0YXV4eFJnWmx0VytBZURkZ2dMczFMY2wxQmo3NE95Y1JDMXRj?=
 =?utf-8?B?OUp2VlFXQnNIZmFiNURHVUlHSTQwK1FnZDBkeGkwZUFVRXZ4cTMyckpzZGdW?=
 =?utf-8?B?dm1hOHZiTURYbWtPd3ZpaDBXbGM1elNmOVFFcHY2eWIzOGpUd3IvanlWZDdp?=
 =?utf-8?B?bmozMmJ6Rm9wVEhYMWhxSzZyTXViSW1ocDd1S3Y1NHBZWHp0emd3UndYMkgv?=
 =?utf-8?B?UmxPUnk1NmFHdGxReXpqZ1B6TERHazhhYXlFdHllby9QZ3lOcnovV3Bsam1H?=
 =?utf-8?B?S0ppVllpYnJmTXFwNHIybm85dDEzci9QU1B5SGRqZFVvZXB6T3M5VkpaTFVU?=
 =?utf-8?B?YXF4c1FUYXlWRjM4U2JvVHFmR2c1eFBSQjRORmdSemNISjlxN1A1bml6WTZ4?=
 =?utf-8?B?THdYZDNOUVRSREFTckpGait0SlVsek9IR1d6WkQzVXBnTnJWQ1Q2dnlhaXlC?=
 =?utf-8?B?RlM4eUduMDh1OUs0T1NPOGZkbC9KUTdZQjhUTzczVUpmSkdxeVI2ZTRxc2g0?=
 =?utf-8?B?ZkRtalI4R3FTRm1CMjJlMHRqMFlFUEE3UjNFa3dsaDlZWXNKdlZKcld1dE5C?=
 =?utf-8?B?ekVUS3l0QVZSU0plL0E1a1RGeG9GaWJtenRPbVlxR0NsYjFvMmJaRUZmelgx?=
 =?utf-8?B?RCtqTm5QYXVtVVdzanU3STNnRDZiSU8zNWRMSlg3UEkxTkVrK3ZIVmc4NE45?=
 =?utf-8?B?SVVzQXcyMzJvMWFmMDgyZzdibFE0K2gvTFpBSFBGUi9qZEZrRDlkMG1EeDNv?=
 =?utf-8?B?ZjRpbG1YelVPb3Z4dHdCTVN6WTdSOElNdGlmelhEL2NuUzJVVVczUTVUMTds?=
 =?utf-8?B?c2crSUVRVFZNZ3VkMy9yOVpPRnJXWlF2bnl2UUNCaXZ1UnJmdHJiQzhnRldX?=
 =?utf-8?B?aE1IeTd4cGowZ1duTWh5SStkOTRlUGlMbUxpUG1sc2dSTmxGTkJ6cG1RSUtj?=
 =?utf-8?B?cnpUTHdFdXN3MmhyQnZ3VjY4c3RaR3RHM2FyTnRXd0czZFZuOUF5UG8rRG9v?=
 =?utf-8?B?ZE16aDBWVlFUQ3RKRTVhUGcvdmFrK0prQklmMGpCWWdOTTFOZkFUTHNKZnhI?=
 =?utf-8?B?Y09yOTB4NHBtMlhQcnByVlFoMDVXNElHY3hORXVLQlVpVUZhMnVyUnVPcllW?=
 =?utf-8?B?bDkyM0FSVVcyZnhEQzFaWHhLdDVOdEdYVUxYbGlYcEhOcFVQOEsybFE5TXRE?=
 =?utf-8?B?WXZwOHgzb3IyUkNJSSs0S09pQWVHNDBuZEY1aHFPTVUxNGpmeFhNbkpXWnc4?=
 =?utf-8?B?VVl6V2JoWk83Mld1T3Vlb01BVjBSVk81MFI3dnc4alB0UlFLRlhWWFhiM3JX?=
 =?utf-8?B?WGZaU3I1eElMdFdkNmRZeFRHcndGMFdYZHlqaW16R0V6ME9KTlBMb0x5ZVd1?=
 =?utf-8?B?aWJLQ2ZLRmFrOE5RSmV6ZldjTTlKUENteldLNU5GM0szYmtsc042VXFqUC9x?=
 =?utf-8?B?VlpCd2YvOEdPUFQ5M3dLZkZzTnlsN01NNU8zdlJLZE9BZTFTQXVXQnUzQk5J?=
 =?utf-8?B?eHlab1JtWSs3QkFTeDBkS3ZPQkxFNWFxekNMQ3hBazMvSXNVaTJKcFBZcVpw?=
 =?utf-8?B?aVB1OXUvUDlMTk85TVZIeXFvUGM4UmVlakVLaFlLd2pyR09SSXFBTFVoSGtR?=
 =?utf-8?B?Wng1MHVyeTQ0eVU0SkgyRDExSFFlU3pPdENnejExQmovNlcwZWJxc2FSc1h1?=
 =?utf-8?B?dHRUL1dhYVpoL3crZm5RaU94a2JxOHM0NU52cUZydzk3bExJQXdvRFJxSUJu?=
 =?utf-8?B?dmVlRXFqN0dGRmRqeWRCc3k5eCsxekdJajRnOEhtVGtZNWltaElXK2NGR1dk?=
 =?utf-8?B?YUNzVFBDMjRnNDErZnBqL1FlenNIOFdQaVZuYkE5OFRaTXAwL1ZvNklSVjcv?=
 =?utf-8?B?YnFwQXVFdWhqdlBCRmt6eGNtYi9sc09tWFpPeDRHVFovdnhHMllXUDZyQURa?=
 =?utf-8?B?VFVCTXB6dXBaM1FQZHREaTRNWVhOOS9PbXZNdFJlcjhXM0E1QzgxSlRqNjg2?=
 =?utf-8?B?TVNaWE9PeGdvUnpTRlNYVXo2QXpiK2FqdzZXcjlnNTUyTVQ0ekJzUnk5SVJa?=
 =?utf-8?B?OUZYc1RGRnZTcFNXZXY1bHpIWGloRDc5UmFPQ1ZQOWRsMGZNR1gvNVhtUG02?=
 =?utf-8?B?SmlnS1BOcCt3QjVTRXUzLzlNUmVZaEQ0aU4rVTk5Vzd4bU5kVDIrbSsrb040?=
 =?utf-8?B?NTNzN2Z4TE9ZYjRCODRwUG1zU0ZEVkQ4RGZ4WFpNMENPUmt0UmxDUHJ1KzRh?=
 =?utf-8?B?MVFDQU5zbWZTNExoSHhGTHNlVGhUejZGd2FLM0g4NVV0dmlqWTNWV2krZUl1?=
 =?utf-8?B?dm1rK2FWdUxyU3Zhb05Xcll5d2g1VmRPMFlLWlc0RGhhSjhyK2d3WEpaOUZU?=
 =?utf-8?Q?DPVzH6Q2qkvRIp78=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f7c61b-264a-42bb-a9c1-08de89920240
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 10:42:13.0767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BuUMGQpPLGaIPqTb1oUYed+ta1Tb11CJHTuMRkZ1010CPU+Yz+Jendb4p6LiDqR9+g6oB6EhHFgjyi1yGYx7ff54yvMfttTF9IPlY+vbV2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8190
X-purgate-ID: tlsNG-d25034/1774348946-6ECAA734-AA1CD947/0/0
X-purgate-type: clean
X-purgate-size: 1211
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3EA493069D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24/03/2026 9:11 am, Jan Beulich wrote:
> On 10.03.2026 17:44, Teddy Astie wrote:
>> I don't see any reason for them for not be available, especially
>> since core2_vpmu_do_wrmsr has PV specific logic for MSR_IA32_DS_AREA.
> This is really dangerous: You allow PV domains to control whether the area
> is actually mapped. It lacking a mapping can, iirc, on at least some CPUs
> result in a complete hang.

It's ~all, and explicitly documented.  SDM Vol3 20.4.9.3:

"The recording of branch records in the BTS buffer (or PEBS records in
the PEBS buffer) may not operate properly if accesses to the linear
addresses in any of the three DS save area sections cause page faults,
VM exits, or the setting of accessed or dirty flags in the paging
structures (ordinary or EPT).  For that reason, system software should
establish paging structures (both ordinary and EPT) to prevent such
occurrences."

There are potentially uses for PEBS/DS, but it needs to be via explicit
opt in only; it is absolutely not safe to let guests have in general.

One fun interaction would be a PV domain which gets shadowed (PV-L1TF,
or migrated), which will instantly violate the #PF requirement.

~Andrew

