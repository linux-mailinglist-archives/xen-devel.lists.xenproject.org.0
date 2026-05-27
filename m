Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLqTAhElF2qu6wcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 19:08:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FE15E82B3
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 19:08:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320671.1587888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSHjr-0003u1-8x; Wed, 27 May 2026 17:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320671.1587888; Wed, 27 May 2026 17:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSHjr-0003rX-6G; Wed, 27 May 2026 17:08:15 +0000
Received: by outflank-mailman (input) for mailman id 1320671;
 Wed, 27 May 2026 17:08:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wSHjq-0003rR-IH
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 17:08:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSHjp-005iHz-OF
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 19:08:13 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1724fd-2eae-0a2a0a5409dd-0a2a4507b752-0
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 19:08:13 +0200
Received: from [40.93.198.61]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1724fc-229c-0a2a45070019-285dc63d34cf-3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 19:08:13 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH8PR03MB989112.namprd03.prod.outlook.com (2603:10b6:510:3a9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Wed, 27 May
 2026 17:08:09 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 17:08:09 +0000
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
 b=DylwN425p+RIg390RJ2Q+PlPvWdS1o0YgfGe3XaucVxsKOThXVSQOVlk6buS0SZicuTB2srARe10CPrAYcz3IvGl739hn+R73DkmPUGP9Cp7I44QmvgE5S8NFEDAm5CSUCPQbjXAZKTJjmkcu6Nm6x7DSEgk8FBTDNUkIczVFmGbf1sGBRJq3KwRYkT/rZ7spsvJYrtur8TASeyvkLNI4mK/sDV4SmFz14MC8OsZghg2yd0Fxo6LQce/kyiYm82+0wPP+p5KDbKf8iKN37SULrw7if/HhTIfIZP6mgahyyt9NpNmsErpBWx9Zfs1VMwJF494aEQBhHTh8nZYgh5XhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujP4l/sxPLt2T2Vv7PlHyuCa+rq/V5MUfr4toMNe9gY=;
 b=IiEusqYjeKw/tNNffSS7eOh/0yO5RKqxzakgk9ginoQqc/K1UFo5YsXZi44R8laJ+sqUfwp+PATxToK0Wx0FpCi2sNOjCo4BClkYcJjUpI1NqQfuw4XcBf1HXV0t82SY7TZmGqhIcOQpiVqxLJNqJNdP1r2RDEtBWbawnHp+GwJrSkkzNwThZZwwo54HB+K9y9dSuDTOsFUbaQnUr9CRY3+fivZ4F0UFMOBNR+me42m5UYiioQgxpMHB/pHD1ga7f/Nlh9mBTNbn194zgAv/u119Y08QFN0R/I/xdQol8ttlb4HErUGMaeouwRwRJ8DcVuUna62m3HO4XkT+sFgEVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujP4l/sxPLt2T2Vv7PlHyuCa+rq/V5MUfr4toMNe9gY=;
 b=Ln52mISZM8yeWOl/VPYQvKpvlGba2cS+3z0okMYP5yMReELge23QJ4w8NnmJRkFe+5xKw7ktYkgKi1YHixl/nmmWz2x5aAb79jN4zOsE62nXjsWKxHa8lYhXpXzw3HepDlNnLEE1CPBrKAlX05pQmrilZLaq7xUyScuMOek4JHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 27 May 2026 19:08:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>, Denis Mukhin <dmukhin@ford.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] Fix fallout from DOMID_ANY ABI breakage
Message-ID: <ahck9cHeNQTUvokV@macbook.local>
References: <20260527165758.2346373-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260527165758.2346373-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR1P264CA0002.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::7) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH8PR03MB989112:EE_
X-MS-Office365-Filtering-Correlation-Id: e2714aef-ec77-43ce-8ecf-08debc1286c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	rXdlVlSDcxdnJQmc8YNM8B3UCjEiDsJfDddCBzgcazwOwOl2NfjSsXsmxr7GZ8q+VYLt+oz+Tb+YwGjPVIbqTYcLKbmckwqhoEquqhY149OpsrCDdTqGFXF4Em8cepuNuhzqGSBYBcfIQL4dGVP80p31ggtceONalPBBo9SlOjP1VpXRS/N6zVBnYW13D8+leK8eBZuc0BdMLT7MaaQa1wkiwNna5LH2sB5rDFmscdv524Qwg5EmFmZyo3apZ+FF4C3DDs3UKWDnDRBAeKCtoj4+RklTYWPNt30JvfdCHxh6L3rX1V+IGHEa48l4O94KbV5Bqb7zBeojlh6FiNR6MwiuxIB+SrU7TtSyzTTBQRCpU/B0pGEE8++qd9+88Su+SzqNrrSiafMSKY0T6fNOgtQFO9XrGXbBTHkfoBhpK7d5D81ePlxhG2JDSEgtCUR53uCT1VF/xgF0zU4uxsG764IwnRLe7Fk+Hkn5dcOjZD2OdsJo3HYRXSaFLEARaH4yIfQNHLr0W8XohjK6TzEnLxOgSv5/8BIxio8xqlzqW9TkyZQbxjuLpAzIPJdN8rwQfLi0iZ82eZ2cslePeXC9EuOLliZYY7tWHsiprV4PDO8yd7Rd2G0ARz1tFi+/fbl+kLfCL8O8F9o7xWP9wDCQqA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3RtdXVnNldLdE5sK3U3UUJwODYvRDlNSGN2M1U5ME82NmI5WndoUkk0eUtk?=
 =?utf-8?B?RS9TSCtuU0NvNFdkaWE0NGhEZ0NqVTdTRUlIRXh3QXdqVkxtM0Z5aHNZVFNN?=
 =?utf-8?B?eW9jZ3AwZmRzbG5BS1J3T1JxK21kU0dZV3d3V2Y2bC9Hc3Rrb3hIbUU3akhz?=
 =?utf-8?B?VkhsKzdiVU0xcU5ZZk5PdVdBOGViRnBwQzVDd2VJdFRSTTY0Si92WTl3eUQw?=
 =?utf-8?B?OWU3eGE4VUtZMlJlSGh6S1hXaFJGemR1T0duZzVhcXNHNzZIN0ZLMlNiblNy?=
 =?utf-8?B?bDRYN0krUmxWYmdYTkw1QmRWbG94b01GZlZram5aSDg2YkxML0ZpNldIQ0Fl?=
 =?utf-8?B?c0w0d1N1b0R1MUdDbk1wb0FBd2lNUE5QNmd0S1YwczVoa25LUEN5MUZaNmFH?=
 =?utf-8?B?TkFLUU0zK2hEQjZUaFZjbkFKY3lZdVhpQUdEMDZ0SHZUamp1UW8rQSsxRkg1?=
 =?utf-8?B?cDVqcWNtUUw0cjQ2YVRJaENkNXM2NUFZRVZBK2ZIaWZPNU14dFI3ckNkTWFT?=
 =?utf-8?B?TnpWeDZUUXNOUzEyK3NBQTdEWGdVU0U0R1k1cmFiOUtVT2ZQWk02QXlQcWZj?=
 =?utf-8?B?bXZ2b09UU0JweVVySndHUU4wVEFHb0hCWVBieEszdzUyQ1p5bWxaQ1V5REM0?=
 =?utf-8?B?ZEUvSUJLOVVEQ2twTlFVR01NSDFXUHVUZmRsUytvczZOSC9KVjBnVzBvenF2?=
 =?utf-8?B?ZnBFa3RZOEtleGpQVU9DSy9VRUtWdmUrekxKQXhVT3BuL2UzSmVnTTM1NTM4?=
 =?utf-8?B?b0t1VldYS1NXS2FpS1VMS2x5eHhoWk1JZUhqOEdTSnpUaGY4U2o4SGh1U0c1?=
 =?utf-8?B?WVZBa09QOHRCQ3JwNWg0d0tnUWZTZEpjNHo4SzRFYVgxeVNBNnRZUVJ2dTVw?=
 =?utf-8?B?bW1Kc1FRY0J1U2toZnhGVXFlZmxKRk5ITzNnWVlkTHVqZnUvYXVCYUJYMDRQ?=
 =?utf-8?B?T25lb01VVTFiVDVlL2pIYW9UaFMrSjlLSTBvMnlyUXJQSFFHVTY1L3E4cGtM?=
 =?utf-8?B?aFZDQUJoUTRZeUhtT1FRekM1VG1OemdqejBIRHFYaGFueG1UeUdqMzhjZHpR?=
 =?utf-8?B?bzNGOE45Y1BLZmduSVRDU2hJcTBqYVQyMVB3by9tem1RcWRFcU1yeWYvWnVH?=
 =?utf-8?B?Wm9rT0o4alZUZXVPbit3bXc0bnlkL2U2Z0s4NzJ4NEdGQnhUd0JmdHRQUklT?=
 =?utf-8?B?NlFiUlFYTFh5ck1hY0huN1J3cjRUME5lQkRSVlhPUWF1dWk5dkZxQ3Q2WUU3?=
 =?utf-8?B?QjcxSmhqY1Q4REY0b29RSEJ5V2lBNnRHNGlBSE51cWJkdStnU3hQb0NPU05w?=
 =?utf-8?B?ZlYzeGFKQXBYczBsQ0N6bTUyR015RVJ1bTc1ZkgxbnVCTUp6UmxKK3hDcFRm?=
 =?utf-8?B?aUI3MCtmWWpMZWFnQmJQN3I4Z0ZiVkxDd2oxQ2IyeWt3Tkowc1ZYVlZSQkxY?=
 =?utf-8?B?RmcxY0IyL2xVRVA5V3BaM1FwUHhRVGN5bEIzSG1qYUNRZG1IdTN1cS85ZzhB?=
 =?utf-8?B?eUtOSGE2MzBmNGhxTDc5dXZVTHZLN1VrUFF3Y1Z2bGFvMWl4QjA4ZFNhL3lm?=
 =?utf-8?B?TzBKK1k4OVlaMmdPNTZ4TVRwb210SCsvQVZIWmNwdlJZYmVHcHJlbkVFYmYw?=
 =?utf-8?B?RXoyMUd0a3lUV25Qb25ScE1waDMwYkY5ZjMrekhlR1ZoWFM4ZWlkcGR2eHYy?=
 =?utf-8?B?N0JmOUIxekhWWTRBS1hmbmhVcktmYlZJOHBLL2VRNE1ZVEFBOEZzdHVUNzly?=
 =?utf-8?B?UDZUOWJHQUVUTTkzeVBKZXJtbVNkcTJnb3VOUFp4aWk1S0ZZbW50d3ovWVZp?=
 =?utf-8?B?OFk1Q1R0L1NnQnhlYzkyZWlBSU5FOEdaUmJ3eXQ5Z3FkRTFrbDhOZmUrcWJO?=
 =?utf-8?B?RUFtLy84WEZkYW9SMXVFOU5uUEFmT1pLYTBSWGoraU82bFRIU1RYcGN3RXlm?=
 =?utf-8?B?TlB6bUVGNnRVYU95SGZONmR5L3NyeVl2Sko0WnB0NzFBcmI5cGFqeXo2bngy?=
 =?utf-8?B?akl3MVNtZWtLRWhJd0IxRnlvT0Q2cWJqc1pBaldOOU1vdm9yeGVKa0VJb2I0?=
 =?utf-8?B?SVNUZURSK3VndEd6eThPaCt3UWhsZ1BJOEZYUHgzcnlmcWRHeFNKNVUvTk03?=
 =?utf-8?B?S1l6ck43RklLUVl2V29vK2x4K2dLZ0pIeUZkcUVLR0oyc1QxV3FDUEEwcEFZ?=
 =?utf-8?B?TnovQ3FKazRXRVNXU0RIc0xieisrSjdNalQ4aXRiTENMSmhhc29qeVBiNTQx?=
 =?utf-8?B?R2NIZVJRRFRNbmp5dFpOckNVMndHeEdzRWNGRW8xenRreGRsQy8reHljQ0ZT?=
 =?utf-8?B?UUk2aFNBSlY1aEI2YngzSFpGQ0gvTzhXSEFsc1labno5b0dWazZGdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2714aef-ec77-43ce-8ecf-08debc1286c3
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 17:08:09.1978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jfgs9XGtOjiQIbsGcgqq+LIo+9od3rxWi0dFuQ9XOfSJLPSQ2KiSVTQ9ET99PYTdnKVRfYFx3hfAqDmewJpvkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB989112
X-purgate-ID: tlsNG-ef75cf/1779901693-21B68C48-F486D864/10/73395122804
X-purgate-type: spam
X-purgate-size: 2783
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,vates.tech,amd.com,suse.com,xen.org,kernel.org,ford.com,gmail.com];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:jgross@suse.com,m:dmukhin@ford.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 38FE15E82B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 05:57:58PM +0100, Andrew Cooper wrote:
> Commit 23e2479ff9de ("xen/domain: introduce DOMID_ANY") broke at least:
> 
>  * xenstored domains
>  * The Python bindings
>  * The Ocaml bindings (i.e XAPI, and therefore XenServer/XCP-ng)
> 
> by causing Xen to reject 0 (the wildcard sentinel for decades) and
> DOMID_INVALID (a recently introduced wildcard sentinel) without adjusting the
> callers of xc_domain_create().
> 
> Under other circumstances I'd revert, but xenstored has gained a dependent use
> of DOMID_ANY.
> 
> Fix up the remaining in-tree callers, which covers init-xenstore-domain and
> the python bindings.  The Ocaml bindings, like libxc itself, expose this ABI
> detail to their caller, so need fixing individually.

I think this will also affect the rust crate(s), even when those don't
use the libxc bindings.

> 
> Leave a very clear message in CHANGELOG.md that all external callers need
> altering.
> 
> Fixes: 23e2479ff9de ("xen/domain: introduce DOMID_ANY")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Juergen Gross <jgross@suse.com>
> CC: Denis Mukhin <dmukhin@ford.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Both Roger and I said no to the DOMID_ANY change.  We both think that there is
> still insufficient justification to be adding it as a new constant.  Next time
> it's going to be a straight nack.
> ---
>  CHANGELOG.md                         | 4 ++++
>  tools/helpers/init-xenstore-domain.c | 2 +-
>  tools/python/xen/lowlevel/xc/xc.c    | 2 +-
>  3 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 25f5a192ed48..1b54acf912a5 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -7,6 +7,10 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>  ## [4.22.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
>  
>  ### Changed
> + - Users of xc_domain_create() must now pass DOMID_ANY to obtain an
> +   automatically allocated domid.  The prior sentinel values (0 since the
> +   birth of Xen, and DOMID_INVALID since Xen 4.21) now no longer represent a
> +   wildcard input.

Maybe also mention XEN_DOMCTL_createdomain explicitly, to notice is
not only the callers of libxc that needs adjustment, but also users of
the hypercall itself not going through libxc.

Thanks, Roger.

