Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MdUMtaZFWqNWgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 15:02:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F22E65D5F8C
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 15:02:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319902.1587350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRrPn-00040n-Ot; Tue, 26 May 2026 13:01:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319902.1587350; Tue, 26 May 2026 13:01:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRrPn-0003y6-LZ; Tue, 26 May 2026 13:01:47 +0000
Received: by outflank-mailman (input) for mailman id 1319902;
 Tue, 26 May 2026 13:01:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wRrPm-0003y0-9h
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 13:01:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRrPl-003jpd-6Z
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 15:01:45 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1599b8-5cb7-0a2a0a5109dd-0a2a4503e2e0-8
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 15:01:44 +0200
Received: from [52.101.52.50]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1599b4-672d-0a2a45030019-346534324212-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 15:01:41 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS3PR03MB989170.namprd03.prod.outlook.com (2603:10b6:8:39b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 13:01:39 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 13:01:38 +0000
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
 b=Tu/MPy2BhEysFd3gye7RFbBJDLQ6cFQODbYQ6aKUSZNwWsPLMY0+231qf9bK9BPFQkqNgMMQ47NB1reCjp/xKnYXlTC1cOTk2Ngb/HgeYbq+Gy+SIb338K1pDtd9iqYzaJRQgi9UdD5TqcrE3HLGVOXLWca9G59QRvlHZDkokdo4i8C5/uVdGyAxHkxZ93XXZ8b/jIDPrFjzHcrzHuj+7IxFIOPLIXIXO8CX2qydPcWxcLA6L+c5e6DImj8qFjdiszRHBPVUyhFKrh0x86GHKmRflCXaDTaAsiLGiRK237f7BSK4SoIOQrJsHIerZM0YyZ8KsCIsx6+9nohix4RJpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPeLVPd5RjWrIXnE1PRx6H7KapO5nur6/vEYdxYyWGU=;
 b=lirTuk1p90UZcRvHv0fATUh1+N1QOLM1FQQ4FYfzC+Z5NiGaghgpSzmbu6GmJAO2ObPsfWx+Gb6axfCq271dBya0EuOlV4I2UhUychjGHv6GxQ0IjvOus/1vBnyESuDTtXZEI4RhI+Nf1TEhfPsydxV0RK0SveeD2rrBidDCeib6EDpGeDN8ZdmWxjvxg0cDm1Cmjrke+4suHx+yA6G+wCOjj6ebruWkjPnr+yrTPFo1lL1kCQGENzs0OgIo189ZEyUXNJauS/5VElyJ4V8lyHt5BXcHABhKMIkHJ1KnLgoWQmD18hJcMjM1fnZDqVpVVmWGECDF50lt1Q01EQ/zWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPeLVPd5RjWrIXnE1PRx6H7KapO5nur6/vEYdxYyWGU=;
 b=beGQTJafkVotTA457gF8qyKJVL60utq1xhljFfm6w9bo0blfbckewC7vyTMdcXPaLh65T+NLFSmQbiIQXj9GDfm0ZIgdMzN5UVDCA/BYwqEhz5kU438JeC9r3idO4Vp7uF0DHSBqNr9l9zGbt0wDXK/0tMXKMK1USB585mX+CHA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b9ddc37c-216b-4c18-8d77-03ce641d2614@citrix.com>
Date: Tue, 26 May 2026 14:01:34 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v1 1/6] nestedsvm: Fix CR3 MBZ check
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260526124027.573412-1-ross.lagerwall@citrix.com>
 <20260526124027.573412-2-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260526124027.573412-2-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P189CA0090.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::35) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS3PR03MB989170:EE_
X-MS-Office365-Filtering-Correlation-Id: 8386211b-29a3-4fe9-c09f-08debb26ecaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	OQL7vRJat/J+/zW8+/lRPWWXfirwOkvHBzI4x5IfJsSnMdL69pskmhobNi/+ZoFd6oKUTri8Ah4oTvrP7CWfcNqRaqFdbH4mfcU0HSPJ/6w/iTzhuraeAypzyvX+vyyh8jC/4pD2iYhmDg4L6ibDYqSBTQTmcnppmh/kRgKL/yLkAt5evsfSXlYZxdliF2/e6hiXUZn1x7xyVf19mYGDT/EmvRAQgkGXGaUUC0YgkAIUWlGHXWTkrYGEQqGJweNhF4lO5gy8f99ZsR7iL+0gArABsoO2h18dAG+yWiMIg+JqUWGBZ4gk3kt0bAPoa8AVmNDu3HHrQ+WxUfF/mCiqAupH4tfYYW6X5GzemV8A0RetMnfkkvhubQqDXx0AVbxYAPFd+jX6pvBzYRDFYKILXH5hliimkbzQ8sboBN82ULS4oUmgztspPuUOYgxLJu2qRce7ZL5FDJrZ0BN5tBcaMLWPQQeVCf9a1U9UWEe+90fe1DGmwnqqrJvI6oS8FxvVrBa/ox1ngiuCdDAvd7da0sMgjBw1bIMbXn3DG7QWEyQQC55C3bJP/v/pA00jPamdNgAs/ApUL9Yk8sstEC6ItXhjeCQG3FB+aB8xwPICZUvfW19Ik6GOgXADn2wDkw7/hLlG4GouC1GVsDg4vspf9A0rJCOlKRmU/fKBqNL1FXKAjf1suF6mxLmn3ws6aSYO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elVKN1F5OWtRUlFNMTQ5YTM4Yk9VMGsyNzFIa2kxYUpPYm5YSGVXZUFyY0Z6?=
 =?utf-8?B?a003L0JXZzVuOGNDZ1hVTmFodDZjbHhMYlJxK3dMczN4S0FVTjR4bXhsenZS?=
 =?utf-8?B?MGVOb0FIOVQ3VXRsbTVNQlB5WFU3OXRRWU9XemdJZ1ZrUXQ5aGdvenVVa3JT?=
 =?utf-8?B?SVNmNWpBV2d4L0oxYWswMXhhYWdZaTFEa1VuUDRLdExZWEJMdVBtZVRTWmRv?=
 =?utf-8?B?TkE2Wmp5NWNOa05GRmFWY1NLS2p1RzIzcTFVSE90Q1JCOGlxSk5wMFRjUFZU?=
 =?utf-8?B?cEpmT2lIT2ZVUU1iaXlKREs1cUtFc0krRmhLd1ZQbC83S3dMa2Nkb2FsaDFm?=
 =?utf-8?B?REg3a1ZDdlNyYlVwR0RCT3ZXa3FHaXBNenpvaEx1TDl6Ti9jQTNpOXBtOEYw?=
 =?utf-8?B?c2xwNjhBQ1Zac2M2Q08vSWdpUHVuTDFSSFdiU1pIUy9WZkk3MlBZTXhRTWNa?=
 =?utf-8?B?UW40Z2N2S3pBQVB3UzNQeTZva2VoZmpsSzNYZlFMdXNyQytIUmIvckxYMzc5?=
 =?utf-8?B?RmxMK2ZOd3BXb0dLT0xOWlZMM2lrUFZBL1hWakxsTENEUHMxQVdMc201ZG45?=
 =?utf-8?B?SjdHVWZjMW14MWZaOVRpL2x0T2VjUVdlNW82TVhVSUhTSFljTGM2UVBBbUhD?=
 =?utf-8?B?dDI4VEsxZjNFVmhSL2ZlZFBmMndaUm5VVktvKzdob2lnVm1iNTRKL0FNWTZJ?=
 =?utf-8?B?ck8yR3dGNTJ1S2UwcGU4NnJ6Zk51V0hIUXZwRElkZ0lKZjJ6dTU4U0tMSWh0?=
 =?utf-8?B?WGFmR0tYOE9IVSt1dkVpT3paQm5kSThsV1hhcHk1ZUtpaUh1VVNuQlJ0SnU1?=
 =?utf-8?B?MXJUaHM4dzNqRmp2RWduSWRkdFJhQ2pGQnZ6YjQzaG1MVUN6cWJ6SmI3ZGZP?=
 =?utf-8?B?NlhmaHNvcHVlTXliS0kyZ3lLb0FONXBiamVKMUxRT2VQbVRmRkFYZFdPakxp?=
 =?utf-8?B?YmxEVmNGVGV4cGpkY2RDYThicE9XUVZaem1BaUdoVHpsRkFnd2JJQW9WblFJ?=
 =?utf-8?B?RmdDNmpEUEdlbnpmbHFqakZtRnNOY29xUGMzSU4wTklSY0lDTVJJOFF5aEdr?=
 =?utf-8?B?elI4WUNDeVVyRTM2R21yS0xiRUZsWmd6eXl6bGJ6OW12YWN1N3pldTM0MGhv?=
 =?utf-8?B?WVZCZFBLQS9SMCtXM1R0bTBuYlhNTGhNYUh1eUV4VlZGUDk1VTcrbEFrb3Uy?=
 =?utf-8?B?NTlhcWwxWXVBRitNTVNiNHNMQ2V2QlFQRWViMFd6Wm5RS2pUTlptWVVwV2Ju?=
 =?utf-8?B?RHRpbG9QOEtZN2s4bWZucmcxUjFqSXVZR29weWRPOGowTHdkZk1LL3RqbTg5?=
 =?utf-8?B?azN2VUVzQS9XTWhOM3p5bndTeVBtS3VaRXAvcXhVdGZ0SENJcFYxbXhsWlVk?=
 =?utf-8?B?VGNoaGRrMC9KdENQb1R6QW54V0ZhYXFYQ0k4aDk4MUNCZ0tjTW51UGRNR0lK?=
 =?utf-8?B?SFVrdklwNk9yaDE4Z2l3Wjg1Nk9KaEtwOVdhOUgwMjdrVldFZFRHUGp6YUJW?=
 =?utf-8?B?UDdNWk5DTUI4a3IxZnBMUmFtMUVQcnN4TURWT1ZBU2lPYUpsK3hGZUZXamFz?=
 =?utf-8?B?ZUc2N1NYa1dmRmxSSjI0VjArNmEvb3V3U3JjTGR1c3ZiVzlmYmN6Sk4yc0Ey?=
 =?utf-8?B?UlEwVTJUbGJUcndMay9RbTl6d1ZpZ2kyRytHd000cEYxUDZWZkRKVndmTE9N?=
 =?utf-8?B?SEZtbnpLTGNwODRRZDFRTnZ3UldnV2RQcW1ndEhOYS9oK2pDUU9pOWlIUUl3?=
 =?utf-8?B?cnE1bWNBVGcwZElEUmlrcDBVZzF2ZVpPNEJWdDMxTnpaZjlkeDRMRWQzNzlJ?=
 =?utf-8?B?cDJyY2lOUWo3WUVoSFREU1kzZi9OMGI4ZGpjbDFQdFlLblVDbUE2OUppTHph?=
 =?utf-8?B?Y3VYTXV1UGxlUDdPZ3hRTE1mbWt2ZzF4cU8wbUxLSThRTU83OTNKRzUwSTdx?=
 =?utf-8?B?eCtxQVJIbExiNVFsSUJzYm0rbDRaVDQzT3JtTW0rZFZRV2dWczZlTFM0R3B3?=
 =?utf-8?B?b1puajdnbGh2a1FjaU13WFptbmVBRFlFNXB3L0FUTDdUNzRoQjQ5bDFCQ2VY?=
 =?utf-8?B?RVpXK2xSOTdmeEtBT0pKdnNjOEo0YklxNzd6bURmOElyRVppZVkwUFBQejJj?=
 =?utf-8?B?bzVKVWZpWTJYbE5aOHFzc3EzZ2tCUDlMdTlrTTYzUHhIeGw3aXZnaXk4TmY2?=
 =?utf-8?B?SVg1Qlh3cTNuM0dHemtpMEVPb3NvcFQ0L2RxSlEwVEd0M1hJZk1XTUVWVzYx?=
 =?utf-8?B?NkNMWEtyVDlBUDdPWnlYeW52bWx5V29kbXd3OTVVd3JZZ0RxZ2RyQkZwV2Jk?=
 =?utf-8?B?UFpZWlJVTlI1UlR1VE5ITWpKSWhCTDNFRy8zcnZlM1ZqZzlYZWtCazVaWTZm?=
 =?utf-8?Q?BAJ3tdAC4xpylNeQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8386211b-29a3-4fe9-c09f-08debb26ecaf
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 13:01:38.8247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qalyaflqWN+W74zjmYF8gPhekGjj+8EDcZMD0UnLrtmt/8sLLQ6C4Mxkwx0tozpL1L+Sz9ToXYRv6m1ccLHUgx1opkekUmNaPZuy41/IYeo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR03MB989170
X-purgate-ID: tlsNG-33051d/1779800502-3957F938-FB549CDA/0/0
X-purgate-type: clean
X-purgate-size: 1904
X-Spamd-Result: default: False [-0.18 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F22E65D5F8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26/05/2026 1:40 pm, Ross Lagerwall wrote:
> The existing code checks for any reserved bit set while the APM only
> considers it invalid if an MBZ bit is set. Relax the check to match the
> APM and hardware.
>
> Some of the reserved bits were observed to be set running Rocky Linux
> 10.1 on Xen on Xen.
>
> Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>  xen/arch/x86/hvm/svm/vmcb.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
> index 975a1eaef806..9ada491e57db 100644
> --- a/xen/arch/x86/hvm/svm/vmcb.c
> +++ b/xen/arch/x86/hvm/svm/vmcb.c
> @@ -347,10 +347,8 @@ bool svm_vmcb_isvalid(
>          PRINTF("CR0: bits [63:32] are not zero (%#"PRIx64")\n", cr0);
>  
>      if ( (cr0 & X86_CR0_PG) &&
> -         ((cr3 & 7) ||
> -          ((!(cr4 & X86_CR4_PAE) || (efer & EFER_LMA)) && (cr3 & 0xfe0)) ||
> -          ((efer & EFER_LMA) &&
> -           (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr))) )
> +         ((efer & EFER_LMA) &&
> +           (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr)) )
>          PRINTF("CR3: MBZ bits are set (%#"PRIx64")\n", cr3);
>  
>      valid = hvm_cr4_guest_valid_bits(v->domain);

The APM does say MBZ for VMRUN, but the end result of a VMEntry (virtual
or otherwise) must be a legal CR3 value.

For 5.2.1 CR3 Register (Legacy) and 5.3.2 CR3 (Long), the APM states:

Reserved Bits. Reserved fields should be cleared to 0 by software when
writing CR3.

What's the real behaviour for trying to set a reserved, non-MBZ bit in
CR3?  On Intel it's strictly a #GP, and I really hope it's the same on AMD.

i.e. I really hope this is a documentation error on AMD's behalf, and
not a misfeature we need to support.

~Andrew

