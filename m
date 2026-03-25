Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLR0Ax7Aw2kRtwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 11:59:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6294C323688
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 11:59:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262004.1554703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Lww-0002AI-AY; Wed, 25 Mar 2026 10:58:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262004.1554703; Wed, 25 Mar 2026 10:58:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Lww-00027L-7j; Wed, 25 Mar 2026 10:58:58 +0000
Received: by outflank-mailman (input) for mailman id 1262004;
 Wed, 25 Mar 2026 10:58:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w5Lwu-00027F-ER
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 10:58:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Lwt-00GHqz-QV
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 11:58:55 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c3bfeb-e002-0a2a0a5209dd-0a2a4506d27a-10
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:58:55 +0100
Received: from [52.101.193.18]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c3bfee-3034-0a2a45060019-3465c112c498-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:58:55 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH3PR03MB7434.namprd03.prod.outlook.com (2603:10b6:610:1a3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 10:58:50 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 10:58:50 +0000
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
 b=lNVi6gPhOV6/tfMU99aAfCdCvRDfVC7YmJXdr5a80GkD8A5wN5MADcpa1wdT9Zopr0F12nV5738Gn7YBIOA016EuHozZ16RUnI2QPg/pRFe7ZWcWEjHzAgLzbFrl+eBQkZcalogPUmEwDcKA28ypFC+pzG6bFmrzeOWQFOCEhD/BJncPTO56GeDlSEsfT7wBiwhLbi9HPcnR0wV3cAvK4SO1FYCqyiuZcBFifpmXz0IsI6YCvJfTUySByS3DYE1GrF4+La6RCwp4ah8Ff1rAOYz5L7PRodIwLZg4hT2pVCWf3TRC8rJkRKrwTSPm6Rn2sCckDwO2Jy3pTfOP0BvPrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zevs2WTYtAaaIN9dkoW7HZvpod5J4Pf7OZr0nTk4VRE=;
 b=IPp2tglRCvSzDYiCGQGDLlgj+FTdGIMx+t18BD19+Vky60GMmzQ3+lpEonsem0Jm2rgxdGv0d5WNQoBFcFeJCCziTkEhzlwYpyCpjwxpx/zLw+mmX2Vm3ENC87+O2HQoSzx15p0ZHF0nkMpDeBvhoO3/5QHewqMxY/NXh4CW4B/mILjzFxBBTHiTrvSEAoAECMa0q/LQFkTZ3VeTmMO9BDmoN4DoNKPc+QVfAYAzYIhKuZIzMpcf71vKB4I4ojscjfjmSaBgQbEeeGHPUmmz77X9Ns/oEoiwJkWjv2zMEbD2n60kXZjd50wATpK8Jm8uuGaWPKzQ6AFTvlv1pYopfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zevs2WTYtAaaIN9dkoW7HZvpod5J4Pf7OZr0nTk4VRE=;
 b=M7h3BL04yBemiy0bPBs7KIQnz3eMXRZcsNsMfjaGsKQe8LymyFOf6VTt9tJ/EJQLVRquh6CxPPeCzBWyAkkyWezZavHidUgv5m81XvF/Tf1lA3xmGSgibIGLgf8U9gLMeHjVX4/92RzQm59JuWkWe0dUdY1q6e6QJzwUdT/vbv0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 25 Mar 2026 11:58:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julian Vetter <julian.vetter@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 6/7] x86/dmop: Add XEN_DMOP_enable_ext_dest_id DM op
Message-ID: <acO_5y0JWYvtAvYk@macbook.local>
References: <20260309123055.880050-1-julian.vetter@vates.tech>
 <20260309123055.880050-6-julian.vetter@vates.tech>
 <aa7KcQQoc3-HwlcE@macbook.local>
 <1124b3b3-6593-4ef0-ad9a-28d21e06bbfd@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1124b3b3-6593-4ef0-ad9a-28d21e06bbfd@vates.tech>
X-ClientProxiedBy: MA2P292CA0020.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::10)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH3PR03MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: a279e9c2-17bd-43ae-3d9c-08de8a5d7f23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	0wYUXeUeKcYynjQwP4cHJ1FKgYFchEhr0t42+PS9ZUNZvwe3tK5frYUJFu+oC5opydEgCqyyNJrSlnXWvrY5//9XcRX+bHMbI/tS+HbpiODzYZr34JYISd+fImQGqFQ3BlMQvbpTF6JU/veGqYRgtCZhuqd6LCgCfUtDsOS4qYXeiolobNsrR9RygjRtQxekJLYSo3LxV7JO8AqgrUjML4dJP/WXmlzGZ7Nk3rX8E4glvZSWBIXuoz5NAlHv8Yphuqi0TbsL5GNIQnVe7WR1Rdb46GmYcvaDGkqq1A2Jwr0JDJ/vXeIEYO376AFGlKuZ3iPiPc3PHvpLfXflArS5k7YCJ6qQlcgOpV0X/6VpZ3OEmLGVsJlcCSyIEjvD5rYtBKZzu/XcBKwPvR4sv+kIxgHETmPjusFOJAcdkgIdEFPSXD/X0SeM1dypvXx2BhSworguait3Y0CVJ+DwEPbddCmJpE3j8kp34zSVnwlPSjDsNwoPN4PVH7nLqeZksd6vQE/IP22h0J/p4z0ORgAQj0+7JZibIhCa49mN6OR8d21vSCSRmReDwBFkL5cJAh+ctDvprgLkUN69kJMzsxhohomyZplt4gx3UmCH1ZW2zYsNjYMBZqJ7dupPDY0D9eJ1B+ZS6n7igIieU/EeevMG+dfz+wZU7d962P0VJhfUz2DhevxMvpuLLj5uCWS4mWIHypLjCYi5youdmBzQbHqwdj+qZFyAIEa4KWKb2sSn46s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akFoUms3Z3lwQWk4WFZ0MnZ4ZUlwSUVnL00zb0pmZnZJMmhjNTdmYzRqMGtB?=
 =?utf-8?B?c05uZWh1dmVQQWQ2bWhPVnk2Rzk4d2FXZVMzUWY1VFFDdGhBcm9kaDlob3B4?=
 =?utf-8?B?TkhGQlg4Mk5KdTNYSHEybWkzVmZ6Smt6MjBNdUw0M0ZMczQvVFdSUk9tUG1D?=
 =?utf-8?B?RUoxRHhyM2FHN0ZlYnVBV2dlREgwY05LUFB4UGo0MzZLajlnR1FwY1dmL1dQ?=
 =?utf-8?B?b2dGZE9RcmlVdnZVdVRqRjJMT1UyVjlGYi9vTlU5QWwrRjNZc1EvSlhHenFa?=
 =?utf-8?B?VVJKOEtSWUtQS2xQS2x6ZnlvakxPTmNKaXpwNXY1bUoxdlBOZHIwbE1NS1NJ?=
 =?utf-8?B?bmovWlRySk9oS0h5MS9XRmFuRkJxd2ptQzg3MW00N252VUU5V1UrZit2Kzhx?=
 =?utf-8?B?NGVMUUh3cXd6Ty9MdENBN09KZWFwTFlINnhxZnRYVUtQMVBvc1JMRy9UdFZZ?=
 =?utf-8?B?MndSMitMdnQwNHV0SGFtNEZxT0Q1RkJRby9uQTExajdldTk5bmRqdGpsNnND?=
 =?utf-8?B?N2ZDUlhsZ3dWZm5GZmRqZm9Nc3dTL05FR1VGeHpVVXQ0cWNnajFSVWU4cHQz?=
 =?utf-8?B?ZGJuWkJTRW1hS2J0RFZYRlZPQ1hLemxYVzh4SHJuT2xQY1hLMHR0bnUxbURH?=
 =?utf-8?B?WC84eFN6ZDlKNzBQOS9jVlhGaTcvOHFBY1RjRVRkakJZN29GNVBnY0gxa3Yy?=
 =?utf-8?B?alRhZHBmR1BQTm1vZzVZWjVHREVVaytreUZmWmxvTmFDVUNmbTdMM2JuZ3ZC?=
 =?utf-8?B?UTBkUHZLSVJ5RWR3UGFGRXhMMENBdmdYbDNvU2REZ1R5L3lHQW5HTmVaVWh6?=
 =?utf-8?B?NXZBRzhYc0Z2T0hlZEtSM0QvVXA2SFNtNC9tNGQ1b2FsMk5CVjJVdkRaM042?=
 =?utf-8?B?T2M4OEhIQWdsRmdMY0ZpWlpiQlk1ckx5QytIbVBRWFd1QWhIdTd4dGJDWXdL?=
 =?utf-8?B?d1ovaFo3QWxKNGpVTnVQMlMxMUhPSTJRbTFQSS95eXpKQ1ZZZHFjY2huTCsw?=
 =?utf-8?B?aWdLVTNCcWo4OG9qVk9jVGVzcWNESDMvQS9XRGhEWVRzL3RWVWh0WVp2SmM4?=
 =?utf-8?B?YnRtR293bXMvSThFLzF3em1QdU5FQVdheXJQMDRqU0NZNWpkUGdHL0JjOXlu?=
 =?utf-8?B?VkxqZEp2eHhmb1FBbTlNcUprY2daZDBWV2tTUHZVTWUxditIQUdteW5sT0pz?=
 =?utf-8?B?eTNJMU5vRDNiazlBODlPSDV3TlJCaGtsN2trUDJuUUUwUUZkQ3g0RXNxeW9V?=
 =?utf-8?B?YXIvRThZdTBMa25OSGtLc3BUSCt1RDAwSi9VcXRpUUhmQ0pNS0pPNnVMYmpo?=
 =?utf-8?B?OG5LRkhwRjU5aFJXdnJxa1M1RHFGb2hvUCsyd25XN0Y4UlIrdEY4OFBYSSs3?=
 =?utf-8?B?cFZSR0dRbUllUzMxNDhNbGZkdlBPb1BoZnJQSGdnMFdlZVU5TG91UGtITDFN?=
 =?utf-8?B?c2M5YkE2ckk3VHIyQlJ3aGw1NWtDSTBXeitwNDhWRExvcGZTTElocjF0Q3pL?=
 =?utf-8?B?cUNLZS9nUFN0U0lEL2NPcWMvT3M5cm1vTkVkQURWZ3NKajFRS1VIQVcrTVlC?=
 =?utf-8?B?TXVndEtDbjdNQXJmU2NFWEs0TEZRYlUvb1MxTXFsaHZwY3cwS0ZycTNPVjlo?=
 =?utf-8?B?bmJqSVJmMzA0a0ZZbU1ldGtvMWtseXpIdGd4clhKWVBOeDgybFNZOFgvb3l1?=
 =?utf-8?B?VWNBaTVJQ3l4UE1PL25tK3hjeFVjekc5VCtleEs4SnFONGE3SmpDa245N0xa?=
 =?utf-8?B?bmhnVlNhS1hVbTdtQ09aZ2Z3TjRRaStqWUxqeGl1T3U2NTg2ZXorcGxVbFN3?=
 =?utf-8?B?dktkUHBYcEloa0hLbmxKaXpCTml2M0xnMG83a1kxeE9FS1BaRjQwWmhEUTR4?=
 =?utf-8?B?WDdmRkllVEFKSy9QQ3p4cVFncGtkKzN0cHVaR0pPSUhFUDlwRmJxb1lFZmtP?=
 =?utf-8?B?alZ2UnlGV2U4Tkdsb285SzJ4djdqT090Z2lhc1cxanVoQkgvai81ZWtGb293?=
 =?utf-8?B?U1JwSUwrVlo1bVBZdVhiZXZ1eVJXR2l6ZXhzVWUzZG5Nc1R6SjgwWlNzcHVa?=
 =?utf-8?B?VVpNSlBVeWt3OER1R3JmUGNwOVFZSW1NOXBOMCs4aWlmekdTb2pEdXkxai9J?=
 =?utf-8?B?dk9TVmpOQ1A4RzJTSm84Uk5lRk44aUtSd1VRWmxhWFp0M0Z1WVpLOWNkeGQv?=
 =?utf-8?B?WFRMMVB6MGNEV3puemd6em1ockgvUktCNnhTQU81Q1Q3dkY3eXdTREVYc0hi?=
 =?utf-8?B?eVNZank0dXc1NGJ3UmN2b3p4MUVtRnpVM3dlUm5JOWxSdTViMTRFVHZRN2pD?=
 =?utf-8?B?SERXMFFUR0pQWXBocTRVWVNNZ3AxMVk2SEZoUHBpMWtCdnl6M3VPQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a279e9c2-17bd-43ae-3d9c-08de8a5d7f23
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:58:50.4843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: za5eehznLx7/9lgXnBM5hdsURVFmE+M324RdJL/PzBwlBpmRv5XxPOWiov7FzeY7P9d8hGzWGWKsjieGbkshGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7434
X-purgate-ID: tlsNG-16d1c6/1774436335-7A3921C2-D3374AD2/0/0
X-purgate-type: clean
X-purgate-size: 5151
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:julien@xen.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6294C323688
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 10:22:20AM +0000, Julian Vetter wrote:
> On 3/9/26 14:29, Roger Pau Monné wrote:
> > On Mon, Mar 09, 2026 at 12:31:03PM +0000, Julian Vetter wrote:
> >> Xen cannot simply advertise XEN_HVM_CPUID_EXT_DEST_ID to the guest
> >> without knowing that the device model will handle extended destination
> >> IDs correctly for passthrough MSIs. A device model that still uses
> >> XEN_DOMCTL_bind_pt_irq would pass only the low 8 bits of the destination
> >> ID, misrouting interrupts to vCPUs with APIC IDs greater than 255. So,
> >> add a DM op XEN_DMOP_enable_ext_dest_id that the device model can call
> >> during domain setup (before vCPUs are started) to signal that it will
> >> use XEN_DMOP_bind_pt_msi_irq for all passthrough MSI bindings. When
> >> called, Xen sets ext_dest_id_enabled in struct hvm_domain, so it's
> >> visible to the guest via CPUID.
> > 
> > Have you considered whether you could re-use the padding in
> > XEN_DMOP_create_ioreq_server to signal whether the device model
> > supports Extended ID parsing?
> > 
> > Also, you might want some negotiation between multiple ioreq servers
> > on the same domain.  IOW: is multiple ioreq servers are registered
> > ahead of the domain having finished creation you could level whether
> > extended ID should be announced.  For ioreqs that are registered after
> > the domain have started you need to enforce the currently set Extended
> > ID support.  If the domain is running, and Extended ID is advertised
> > you must prevent registering any new ioreq that doesn't support
> > Extended ID.
> > 
> 
> Thank you Roger for your feedback! It's very appreciated! This was a 
> good idea. I have implemented this now. I have used one of the reserved 
> bytes and use it as a flag field.
> 
> But I have a remaining question/concern, which maybe you can clarify.
> If server A (e.g., a secondary emulator) registers WITH ext_dest_id 
> before the domain starts, hvm_ext_dest_id_enabled() returns true and the 
> guest will be advertised XEN_HVM_CPUID_EXT_DEST_ID. If QEMU's primary 
> ioreq server then registers WITHOUT the flag

But QEMU would also register ahead of domain build having finished,
and hence you need to take the minimum of all supported emulators.  In
this case, if there's a single emulator registered ahead of the domain
build having finished that doesn't support the Extended Destination ID
format you cannot advertise it.

> and goes on to use 
> XEN_DOMCTL_bind_pt_irq, pass-through MSIs will be misrouted (or rejected 
> if I then refuse calls to XEN_DOMCTL_bind_pt_irq for that domain). My 
> implementation allows this combination before 'd->creation_finished'.

Yes, the combination is fine as the feature is leveled across all
registered emulators before domain creation finished.  Once domain
creation has finished newly registered emulators must have Extended
Destination support if the feature has been advertised by Xen in
CPUID.

> I have added a check in ioreq_server_dm_op() for the 
> XEN_DMOP_create_ioreq_server case for the "runtime" case as you 
> suggested. If one of the existing ioreq servers announces it, and a new 
> server wants to join, that doesn't have this flag set, it will be 
> rejected with -EINVAL:

That seems fine, as long as the feature is levelled across all
registered ioreq server prior to the domain being started.  IOW: you
shouldn't take the value of the first registered ioreq server, it has
to be levelled across all registered ioreqs ahead of domain start.

> if ( d->creation_finished && hvm_ext_dest_id_enabled(d) &&
>       !(data->flags & XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID) )
>      break;
> 
> But what happens to the first case I described, how can I reasonably 
> negotiate between different ioreq servers or determine who is the "main" 
> server? 

Why do you care how is the "main" ioreq server?  All ioreq servers
must support the feature for it to be enabled, it doesn't matter
whether it's a primary or a secondary server.

> In practice, usually if QEMU ("the only" server that matters for 
> pass-through) opted in, the feature is enabled.

Hm, not really, On XenServer we use a separate ioreq server (not QEMU)
just for passthrough of certain devices.  So I can tell you there are
other users of ioreq outside of QEMU that do passthrough.

> If it didn't, no other 
> server would have opted in either, no? The only "sort of" issue would be 
> if someone wrote a secondary emulator that sets ext_dest_id to basically 
> "lock out" a QEMU that doesn't support the new XEN_DMs?

Ahead of the domain being created you need to figure out whether it's
safe to expose the feature across all registered ioreq server at that
point.  After that, if Extended Destination ID is exposed, only server
supporting it can be added for the lifetime of the domain.

You will also need to migrate this setting AFAICT, so the guest
doesn't see it disappearing when it resumes on a different host.

Hope this makes sense, let me know if you think some of the above is
wrong or undoable.

Thanks, Roger.

