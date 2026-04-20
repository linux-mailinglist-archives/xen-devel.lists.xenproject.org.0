Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gO6nAnZp5mnBvwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 19:59:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E45D4325D4
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 19:59:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286406.1567474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEstc-0006Uw-TZ; Mon, 20 Apr 2026 17:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286406.1567474; Mon, 20 Apr 2026 17:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEstc-0006T1-Qr; Mon, 20 Apr 2026 17:58:56 +0000
Received: by outflank-mailman (input) for mailman id 1286406;
 Mon, 20 Apr 2026 17:58:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Christian.Koenig@amd.com>) id 1wEsta-0006St-N6
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 17:58:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEstY-00929j-Eo
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:58:54 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Christian.Koenig@amd.com>)
 id 69e66952-bab6-0a2a0a5309dd-0a2a45048bfc-4
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 19:58:53 +0200
Received: from [52.101.193.71]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Christian.Koenig@amd.com>)
 id 69e6695b-1dec-0a2a45040019-3465c1477a79-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 19:58:53 +0200
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by SJ1PR12MB6314.namprd12.prod.outlook.com (2603:10b6:a03:457::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 17:58:46 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::c3e5:48f8:beb6:ea68]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::c3e5:48f8:beb6:ea68%5]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 17:58:46 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edQAgWRZbROMMROzRfF3x/nT/ta4xrLcZJ1D2CeJZ/1LP8Fmtiv6ROEiPH1BpSzdeyZXe1lKvrx8Pp6ScFAdNRNQcceLn/8+drV5zbkAGmZ3+Ho251/fEaA0XDX+DaGpgu1LlYwl79EUyZz8/84cwiVUvuQRzIybvlnwcwSNaQAprllu4AZnEQ4g8GoeD2XNV1yAwOTOaGthlKQIydKIdyhhlUDPJAMBkU8xOpGndTf1/pCec609w+sKwNk4auGZMw21sUs58duRT808e62vdBQrRCtEzv8c8TsRqiHBvRX1LaG/VXZhShxmTh8wfpwVyiA8dbB+zO5/cG14o6Ptrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABIJ7tmj+LPKbyCca4GcZ4wgsHCa5XzmVwLgBnt1wHM=;
 b=jdd81WtBI9t8UzCfBcznmLGX015dSPCE/I4cvY2tcIHVJ+7X1je2P/+KTpd8zeqT8jHGvE1dopCnNT02Bo27LnB46lfVzld2fzYvmgxNbXNLhrekegTtcfsfzkri2x5v6fV930GGu78j54Pd7EvpYqXBF4Cnab5hshopm2bmYlaGigUX4gJ6MKFHT371GYJzW1FU6/sO/Xrd+qJVo+PabCBbjjfKQ6nHVTMZUyKQGfepqLh1U7LYvh6hRjlAqBes/P2hO+HOvEy8IKkD+7GWnN3zh0PuclkGeQsEVyXkMxz52B2tcTb2h4be5KdY9Im/Ut7rgcvG37Gx4oDopViQAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABIJ7tmj+LPKbyCca4GcZ4wgsHCa5XzmVwLgBnt1wHM=;
 b=u3Ks1zM1Qp5vskOjspqZ8pfHInkNDNCMqMbi9OqgZ+E+tpE4xaWIIQx6u5pswNtCfScEzsGpADlJN+LoE0TnFYVXoj3yoQwdg1B5G65A8vCryfgiWySYdiYOaLDSKD5n0R8sy0F0AawjU4+9tvPwnk0wPHopNQzXBMWPeeP2ONk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <964c3670-fad3-44ce-bd93-2057bca2dcb8@amd.com>
Date: Mon, 20 Apr 2026 19:58:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Pinned, non-revocable mappings of VRAM: will bad things happen?
To: Demi Marie Obenour <demiobenour@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 linux-media@vger.kernel.org
Cc: Val Packett <val@invisiblethingslab.com>,
 Suwit Semal <sumit.semwal@linaro.org>
References: <a06133f7-3093-4733-9786-bc46c1453e06@gmail.com>
 <b8d04414-18b5-40f7-9ea2-88b30ff5bea0@amd.com>
 <c7865b27-6bf1-4df1-9520-c9ef6b3ef368@gmail.com>
 <4751cf03-d3c1-4d5d-af8e-39ad7c8ffb84@amd.com>
 <7472bfcf-8c22-4ac7-b903-a883cdb8f1c6@gmail.com>
 <8fe8b78b-5294-4319-af92-a4fb00527417@amd.com>
 <8846bac5-77ff-4439-ac5c-c33cdb4a94e3@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <8846bac5-77ff-4439-ac5c-c33cdb4a94e3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0088.namprd03.prod.outlook.com
 (2603:10b6:208:329::33) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|SJ1PR12MB6314:EE_
X-MS-Office365-Filtering-Correlation-Id: 576e2a51-f05b-4551-1f50-08de9f067803
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	97tp2xvaYUXGl4+h6PUxugV3ssQM/LnbnFywL6LWGTxm8mdZYrrcBos+Kvu99LvQgDHfmZThXe5YLkVGE3kmeqSkH4vFnCrEbd6OU6z+PXJo+o24sD0Hdyelh5de8kcxQCmRmfmgsofmnUDcjQwBgCjskvDsebZRswCj3v2lPhiNYwQKct4FIYTdD4YeNH34Tom9td4AI/6SGD0DIIgM6ABnATvuL1U14PXYUrpC7IR6ghK/zSnzXS6nTk0I07GRkXRjgD4Z2+zs1VPJdl5sqL8zlnHFSELBnNZxkQ+dPYi3/HCET5we9Z3M0fTuCRIEZA0iHtEfPOlCxKmvLiz46VUN8dUJ0ImGQCFj9GdpbxjKeTnwBzxaWOoSitp/nI+89CCDn6TqcUfksVUhc5dFpGNjC8MJuGU0InStrPKJeXV92ePLpNtgxbzbR5jcdiWvZZ8vmFkFwLtPDHp/uJZBptwRCiARaXOVlvg2qP9rT3AUsnIn6YJA/jmFI1RoEYSfyQ4t4hgf6YA6YetPSJYexjSh8FGbEXuiG76RYMkvO2Wogcaubow8yR7j26eVe70PybR9inkmQhLT9Sslxv+N1+mXgLtEGe3+DcvOMaPT8XDFpYrK02t1LAWlyOoV4KykIqs3WXo7+1Iv4jSRribQNW3gLXPC+EPnrcHEqsJpmiOJzsr5UeMSAN6kmGP1sojnV97HthyZuVFrQRwOLXpXJixOq/aW/Y44lU21hsWGXrs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB5673.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajUyQ1lmQWdZdDdwbWxGVTByWk9FT0RacFUvOHFzRGhFZzdhUnpwMCs0MjY1?=
 =?utf-8?B?MGwxMndIckxleDl5NmxYRWZWSllZclBlTktVdHpKMXFEK2dEVFRMR3RlVHYz?=
 =?utf-8?B?cDc0WjZycWZuVnBEQkFScFNGajROVGNlTFYra3J6eXJpN3RPN3hIVkZnYWxr?=
 =?utf-8?B?VWFUMlcxcm1zeHlJVk90TlJTUDV0Y3ovZExxK28zV2hjV2xXcTNVWG04K3pD?=
 =?utf-8?B?M2RueWk5dm0vbmFIQkZ1c1ZiOUpGcmVNUVBicnR5dWhubHBZbDQrTmpzaFB2?=
 =?utf-8?B?ZnhTRHVXazJoYnBQd0prMDdyMTFIUmdyc0xQa3JaZTg0Tit1Y043SmNRQUFS?=
 =?utf-8?B?aEFrSy9tZ1c5WlNQZDFVVHZodjNTVnhZcHJUOWdjOUF3NWxsMDNpaklHKzR4?=
 =?utf-8?B?aWJqejdWTlgwaUZWaFdzMlp5bVRLM1ZhVi9rQUhjUmlBTGJpQ3poZm5PcWtI?=
 =?utf-8?B?LzdOc3B4bExwa1ZtSm5NSTQ2NHh5VHBVbm5uSm5IdjRBOTgvb09EdmpNOWdU?=
 =?utf-8?B?RHQvWkR2MVNBTStqVUJrQytHTkluTUxoVVlVZW5sRm9TZm84SG5MOU9jdDFJ?=
 =?utf-8?B?bElTUVpkTUF5dFovekZZaTZkc25raDhja0s5dTk1dmNNTlU3QWxLUUpxV1BF?=
 =?utf-8?B?eUgveTBGVGluZWNLWHlNRk1LYkpvN1owQ2s0Y0Q5YTkyZGZLd0xPNGlqbXJN?=
 =?utf-8?B?U05wcVhDOUIxOG5ycXY4Z1l1bnRCSmdySXhxKzh5YmNheEcyUmZTNUs0MW1K?=
 =?utf-8?B?akE2VU1RQWdKZG9QeDhyd0Z2RUYvL2orbTVLbVhNNWJuaGZrMU50RDRIMTBi?=
 =?utf-8?B?d0FWdFpOM3orNnZKOEQwb0t2WFpBUlRZUC9nK1lTODBjNGlVd3VVdXpjRXZL?=
 =?utf-8?B?aHl3Y3g1SklEdk1WRVpUbXEzekxLV1h4d054aEhKVzRVZG1QZDRPbGFZeHA2?=
 =?utf-8?B?cmdNVm81bXJER2cwN3pkczdPSjJ1L21DSnBuVWJNNkxuNTQyMDBvS1owTkJY?=
 =?utf-8?B?c0RGODhEWWpVbk9HcXdQaU1LMDRyVVVlN1hVbWRtNzZESHFVNWJnSXdRZity?=
 =?utf-8?B?YkswSlg5SnpqdWNqVG1NRm5YV1ZnYnNJM1E3UnFhZURsTHRid3psQmJuM1hV?=
 =?utf-8?B?aHhMWTdoSitYVTVYSksyTG95SGcxVTZaYis5bmxLcHJPNFliK3M2aW1MZmw4?=
 =?utf-8?B?TGIyY2gwY2dXQXVuSTZLMUFBY2IvM1JaMnl6eVFDRlRoVlhIdHQvTU9BQ1JL?=
 =?utf-8?B?a0VpY1QrcXlMaVpmdVlaOGlNRGppeXBYVXFjQkFCU3FEQkNOaW1PVzFKQkMv?=
 =?utf-8?B?QXdmUTlpSEJSblYwNHJhbEZQWlVVVlBvK3hzWXFNelByMVY2T2kyblJHQjRx?=
 =?utf-8?B?N0VwRW5HT0NIdFZQdllySUwyZkIvRGd6M05jdUlSMGE2ZXJFYjZadWs3L2pZ?=
 =?utf-8?B?Z1ZUNWs4d3FRN1hGZFFNQTVYSkJhQkMweGhncHphMDJxbzZBam5yRDN6OW9Q?=
 =?utf-8?B?MUxVM2lzeXFDRTRzS2JwYm9PZkhLVmFWMlJuaG43STZSY0R3ejVtb1dQTnZB?=
 =?utf-8?B?cWM2dmkyM1FEU3p6NlJxL0xVckdJMWFweHR0RHhzOFRKMFdFSStITkRDZVQ0?=
 =?utf-8?B?WFhUYzhONHkyMU5vVytUb2RRd0h0cXRjOGR3ak1aSU5jTnkwaWhIYllKalZN?=
 =?utf-8?B?VzRNckhRVUZCZlN1RjUrYlQ4dUlnZnFmQ2kwSXRSQVY1Z0lJUm5PRUI3WUEr?=
 =?utf-8?B?VFRyaGkxMGRCWkhGK0pLbWFoUWtuNVJtb2ZDZXZwNEVsWGdlNjZ6eUJmZEts?=
 =?utf-8?B?UWw3Y0YzSFZrWmViZytaRENQVmxVZXkvYzNETS9ZZVFWTXlMNW1wTDVXTytM?=
 =?utf-8?B?S2o5UkM4S0N4Q2plL090aHVuTDdubFN6REY5TWdyby9oY052UUdNMmdVN1B2?=
 =?utf-8?B?enpJWmxOcHRDdzdCWnlVdzlmTTkwZHR2Q1dVWmdtM3hEYTNFeVBPR1hFS1p4?=
 =?utf-8?B?UmwvODNjUDExYW5vMVpzcXRsQVRLSnRmZllLUEJleDlJTjYyTmFhbVpvTFk5?=
 =?utf-8?B?dFZGQ3NuN3c1N3FkUHhMcWR6ek8vQjJMQkRKMDViYWVySk94WW1sSlIvZjYz?=
 =?utf-8?B?b0hWRVpHeFlwc2hlUm12ZEk3MG1sNGlhUUdvZGdnenBFck4zZlphd3kwSWdw?=
 =?utf-8?B?aEVEU1ZTbmV0bTB1RXZSZ2VEWEhQSFd1VVdJN0RSUFhOUFRhcDdSN2RPSEI3?=
 =?utf-8?B?VC9SYkV4cnRFYklnSlVzdjFVRDJyK2FSMGptSkViNzdoQUFDbG9mUTg4LzE5?=
 =?utf-8?Q?yLs+QZgbvLbNY4MVyc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 576e2a51-f05b-4551-1f50-08de9f067803
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 17:58:46.6981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qg576XjRLwFScbq0nT3V1CzFQKOLkLJSdyKw7nNBOfjivsqkUJwbMhvAnXUHZHsR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6314
X-purgate-ID: tlsNG-ebf023/1776707933-2B7693FF-FD4F1067/0/0
X-purgate-type: clean
X-purgate-size: 4438
X-Spamd-Result: default: False [-1.19 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:demiobenour@gmail.com,m:dri-devel@lists.freedesktop.org,m:xen-devel@lists.xenproject.org,m:linux-media@vger.kernel.org,m:val@invisiblethingslab.com,m:sumit.semwal@linaro.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,lists.xenproject.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5E45D4325D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 19:03, Demi Marie Obenour wrote:
> On 4/20/26 04:49, Christian König wrote:
>> On 4/17/26 21:35, Demi Marie Obenour wrote:
...
>>> Are any of the following reasonable options?
>>>
>>> 1. Change the guest kernel to only map (and thus pin) a small subset
>>>    of VRAM at any given time.  If unmapped VRAM is accessed the guest
>>>    traps the page fault, evicts an old VRAM mapping, and creates a
>>>    new one.
>>
>> Yeah, that could potentially work.
>>
>> This is basically what we do on the host kernel driver when we can't resize the BAR for some reason. In that use case VRAM buffers are shuffled in and out of the CPU accessible window of VRAM on demand.
> 
> How much is this going to hurt performance?

Hard to say, resizing the BAR can easily give you 10-15% more performance on some use cases.

But that involves physically transferring the data using a DMA. For this solution we basically only have to we basically only have to transfer a few messages between host and guest.

No idea how performant that is.

>>> 2. Pretend that resizable BAR is not enabled, so the guest doesn't
>>>    think it can map much of VRAM at once.  If resizable BAR is enabled
>>>    on the host, it might be possible to split the large BAR mapping
>>>    in a lot of ways.
>>
>> That won't work. The userspace parts of the driver stack don't care how large the BAR to access VRAM with the CPU is.
>>
>> The expectation is that the kernel driver makes thing CPU accessible as needed in the page fault handler.
>>
>> It is still a good idea for your solution #1 to give the amount of "pin-able" VRAM to the userspace stack as CPU visible VRAM limit so that test cases and applications try to lower their usage of VRAM, e.g. use system memory bounce buffers when possible.
> 
> That makes sense.
> 
>>> Or does Xen really need to allow the host to handle guest page faults?
>>> That adds a huge amount of complexity to trusted and security-critical
>>> parts of the system, so it really is a last resort.  Putting the
>>> complexity in to the guest virtio-GPU driver is vastly preferable if
>>> it can be made to work well.
>>
>> Well the nested page fault handling KVM offers has proven to be extremely useful. So when XEN can't do this it is clearly lacking an important feature.
> 
> I agree. However, it is a lot of work to implement, which is why I'm
> looking for alternatives if possible.
> 
> KVM is part of the Linux kernel, so it can just call the Linux kernel
> functions used to handle userspace page faults.  Xen is separate from
> Linux, so it can't do that.  Instead, it will need to:
> 
> 1. Determine that the fault needs to be handled by another VM, and
>    the ID of the VM that needs to handle the fault.
> 2. Send a message to the VM asking it to handle the fault.
> 3. Block the vCPU until it gets a response.
> 
> Then the VM owning the memory will need to call the page fault handler
> and provide the memory to Xen.  Xen then needs to:
> 
> 4. Map the memory into the nested page tables of the VM that faulted.
> 5. Resume the vCPU.
> 
>> But I have one question: When XEN has a problem handling faults from the guest on the host then how does that work for system memory mappings?
>>
>> There is really no difference between VRAM and system memory in the handling for the GPU driver stack.
>>
>> Regards,
>> Christian.
> 
> Generally, Xen makes the frontend (usually an unprivileged VM)
> responsible for providing mappings to the backend (usually the host).
> That is possible with system RAM but not with VRAM, because Xen has
> no awareness of VRAM.  To Xen, VRAM is just a PCI BAR.

No, that doesn't work with system memory allocations of GPU drivers either.

We already had it multiple times that people tried to be clever and incremented the page reference counter on driver allocated system memory and were totally surprised that this can result in security issues and data corruption.

I seriously hope that this isn't the case here again. As far as I know XEN already has support for accessing VMAs with VM_PFN or otherwise I don't know how driver allocated system memory access could potentially work.

Accessing VRAM is pretty much the same use case as far as I can see.

Regards,
Christian.


> KVM runs in the same kernel as the GPU driver.  Xen doesn't, and that
> is the source of the extra complexity.


