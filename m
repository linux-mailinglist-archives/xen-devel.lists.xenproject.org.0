Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAPGF4E7+mlZLAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 20:48:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B72C14D2DCF
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 20:48:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301040.1575386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKKnp-0003zR-A6; Tue, 05 May 2026 18:47:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301040.1575386; Tue, 05 May 2026 18:47:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKKnp-0003wu-6I; Tue, 05 May 2026 18:47:29 +0000
Received: by outflank-mailman (input) for mailman id 1301040;
 Tue, 05 May 2026 18:47:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKKnn-0003vQ-Ha
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 18:47:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKKnm-006wcY-Ni
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 20:47:26 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fa3b3e-e002-0a2a0a5209dd-0a2a45048b08-2
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 20:47:26 +0200
Received: from [40.107.208.28]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fa3b3c-1dec-0a2a45040019-286bd01cf0c8-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 20:47:26 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS7PR03MB8194.namprd03.prod.outlook.com (2603:10b6:8:266::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Tue, 5 May
 2026 18:47:23 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Tue, 5 May 2026
 18:47:23 +0000
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
 b=rRy3wzvwLgcqqTZqMD0ioAWunLTz8E9HwqfJ4/ncYzkFErcL4TgUDcfMR8QdgUz/pwsm5300/WObT/80n8OTtDXS2NNJJTO/PMWqnJb/p30Fa23Xo/GAVj4de9GJcPAZGulnw84RFSm1COZow72NNYeRhdn/XQqtCw7q5iwzEwVtunnfj82zn7mRKTtm8Xh63kMltL5jHtuiK0KGajuOk8/tASJqMRBt0PidKBKOq/UJK263jpQfHXwg8nkcgI2hLqspfKAk0Jn4PV3ZQDeTTilcSQ3vkU6ulzfk3zgJP9XHgNajqEwhBkQaynNeirHyGM52OW7gn2oyUEi8+MDUCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaAzmLR88ohHdVhTv5+l411VaehP/eneHc6BE5CTaGg=;
 b=XOTdnXXOXvRg2JQub9fm29A4YxBToG7rTmsw5GdWErUeThpBBRYeIzKgDe4g2/tGzfwGtgYAJorD07aEG8wkwN7wkYJ4zBVGMgnxGB+ESvA6AWwcK/8nfrz8NrfhzswsHVJLpCoxS3Tivi1YEfNMcBrDU27lo7LiXwxvTmuyX6ROBngZ16kpJBTMsUrGWMl1MB0jn45BPLgG6AHSEkhiwZGHJmyUTCdqVDUlXjqdGlrASXSa2TwvzhBRNesIcs2Pqyj8rC717z6REgZz1YLWXI6kG8YPjJAntn6da+kmOjbQwTjnTt/bYzQpbyEKgnB3CS0O6iiP+xI9J+oKdYNgbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaAzmLR88ohHdVhTv5+l411VaehP/eneHc6BE5CTaGg=;
 b=MYjmoouJOVeI9q9xk9iPyTCwnSQOsXKa2RKfiuZIcrltQX2zo/zu+FOF6Y5kw+8X6aXEzgW1l6ES3bN8tBaR1ctxwYRrO1q24y2Tvx1WXkvusdrplzFhYk5OSKpe4YUFwDvQ2GQzLbRaTP0DqP/BYPIdWLiMC6baJjX1QJLWpDA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 5 May 2026 20:47:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Problem with PCI-passthrough to PV guest
Message-ID: <afo7NyXOEsDsVB6i@macbook.local>
References: <04c8ed4e-4e99-46ae-b83d-af9031f5b622@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04c8ed4e-4e99-46ae-b83d-af9031f5b622@suse.com>
X-ClientProxiedBy: MR1P264CA0187.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::20) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS7PR03MB8194:EE_
X-MS-Office365-Filtering-Correlation-Id: b278bc9d-caef-4c0d-3a76-08deaad6be63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PnhE2JVDZQ9QtButdjZfFTKrGolC2O8xsS726+QlS0hiDUlAZK+20Wny7XQCwGP6C2d/vaYH99z6e5klZBBkXyJMyK/xK7a8nAcfR+oE/ged5SxSdbb6C4CFLqZwYlsrRGUL2jO3aYjw3Zc2yZuwKZMssb2DFNagilgOlwUbwbUdNW4yXkRUbiNqu0qLGbZ5FiPh+dgwT81QgupObZQip0XxUvzJCF3uesHSXkOCcSbQCuRYrGuzfZfIyc/eJ8u/ORbkh1ZhhkveB0HtfDbNgV7p+Xy7OrkkkrdN1CMsaYEHyrEy84DQdjYhKrtxDgh7fLPutJMjhx/KlqsGjARJgiZiStu1MXS7TM7izEcT6HEJjGpaFP5kzp3sQyYZSqAEOhKkANelZyeJfJdO12cN4ef9c8tFToT+nxr9ON8z+BiLSdFJdLEEN0a0UVfQfd1X0D8+KsKEhqysQTvRJXU/sGsZJlCiIaVOe75Nk09bP/a8vP15xmxU+aDrHVzxIeW/SoE02rmjEG75g8BO/EHp6g+SAfNkC05p0fqCSFalnvp3QlOpSW2abIfWftjMcSqEQF7M1JmlogwOFh2IGaIID6hol0HnyyIIVW4s7icKKNYN7hBu989Hff3PoT85ickR5BDG/Exhfl5OEHfRT+e1YEHZN3hSFd+JC2d63wbpYYBruvYvo6QvztCc3TVqvSNC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUNpRFd5UmMrR2xpMEZ5Kyt1SXFQWGF2MHE4eWRsdTZJQ3VmY3FLUm8yejF2?=
 =?utf-8?B?YTE0RzFMaXNsZW9vaW82YzJ0NUpTMFRHQTRPcUUzU3AzQktiNGRmanZ0U0FU?=
 =?utf-8?B?VUhJbGF2UWdHK3dqRmt3ZVo2R25tWW56Z1YwRGpRUGhaa0toeDRuKzRCS3ph?=
 =?utf-8?B?aGxuSEgyOG1nM3Eyam5IVC82aFNZV3FLVE1ha1hLcld1SjNqMi9mQjBnUGk0?=
 =?utf-8?B?Y3FmanlQdVF4TEtVeitDWkdSbHhCS3ByMXY0TzIzVEZ5VVlkdUN0YWZsVnc5?=
 =?utf-8?B?NVdkKzJPQ0Y2blYvQW4vZkNMNDhXZUNqWjBiUDJDTnpyWlJRMFEvSThpUG5G?=
 =?utf-8?B?cFdqc2U4bEpIU0Npb3AzemhNdmZoWGRabkczWG5Rd0ZZblJncUN5cFQ5L2FD?=
 =?utf-8?B?S0c3d3JlbWlzRW1YaFZ4OGZKYVc2bElsYXNncDBWYmcrREtqMWljRitaa1Fx?=
 =?utf-8?B?WVVNVGJzTGhENUFpRmQxQkxLNHk2d0xNdnM2OWdrNHk0RGFUYzlCVi9DSE1X?=
 =?utf-8?B?R0UzejNzQVFrbE1QZm9YcWZnS0tvdEV1RHZBZWk4Zk0rOHdKais1MlhKeEs2?=
 =?utf-8?B?ci95a2NGTWdUUkI1bFZzNnp5Y2QvU3B5U09PNi9pMnpTTlFrLzNBdnhBSHRr?=
 =?utf-8?B?ZXFGa3A2SFozczR5akFpdlZyWU9Ldk5NTm1vYjVCa20vYWxzMUJVMGFUbkhq?=
 =?utf-8?B?aXRtUWplczg0RDIwYkI1SjNKVG55SUxTbkE5bndrK2xlUDdSZ2JUNjViTHRK?=
 =?utf-8?B?anp3cDNGTGM2UjBNODltWUo5SHVrU3JpMUhBYlpBNXY4SklRbGZOZmN2Yk5m?=
 =?utf-8?B?Y3NrRnhMNS85L3RzZ1RzejRnbUxYUTJYcTV3ZlhZQjRzSzdUdHV6dDVBVDVZ?=
 =?utf-8?B?dDhhUkFHWXRmc3VkaTdQdm5NS3hybk1tUzA4UTBQOUY0cDV4WW5vYmJMcEpT?=
 =?utf-8?B?M1FIRGRqSVNwYkN2bkovelFOeExVb2d6bHVEa3BRKzFrbkl1ZldhNjN2eldT?=
 =?utf-8?B?SGxabk9HYkxWUGlFaFhVR2JLNWxRSzlNckQ4bkt5NnRhWnQ1OHhiUzNXRFp0?=
 =?utf-8?B?YnVIeWNhQ05HQ1JXRHJGSkllSEpMeExxRDZMeS9vMUIxVVlNamNxQjYreXkw?=
 =?utf-8?B?cWR0OWl4LzgzQ0dIaE9SK3M0OXIyUG8wWDJTWWtKSFQ0cDREdFRqVVB1NUJr?=
 =?utf-8?B?SmZ1dWpIVGlTWFh4Q3pBWnFWenZ2ZHdjOG1vV3lFd1BwK2wzdzZIVFhXd1N6?=
 =?utf-8?B?ZGxKQjlmaFg3QWxhOHc1UzF6SGFJcjFpWmhqRVgzWkZRSFBsMlBvWTVUNFlo?=
 =?utf-8?B?b3JnM0ozNUx1SXNCN3R0MFdBRjdBTlNtZDF6THN6NURrU24wQS9oYXJFRG9u?=
 =?utf-8?B?S3RMdnRhL25WZWw3emRvSmZqakJia3lFSmFWUW5JMHFBeEh0NFlWMDY4SGsz?=
 =?utf-8?B?Y2Q1K216UE43d2MrYnF3aGhOYmM0L3NNN1Nldy9mdFAwaFJ1Nm1oS3Nrc0J4?=
 =?utf-8?B?RFdFTmEvNFZYdzNtUWhHdUpiV1NrMldQYjFqSCtOTEwvZHovdlRCSjJ1ZWFo?=
 =?utf-8?B?NFVUN3lGSUo3N1htdS9hY2hjZFEvWlhhdjR0UUZQOTNnQTkxWXdhWldUK2dl?=
 =?utf-8?B?UjBqY1VRbFdBUDY1TU84YnpQVGJmeHV5alovUEx3ZmNMRm1LdXdXRnpxQ1A2?=
 =?utf-8?B?ajRDbmkveU1tMVZSa1lpUFJzaGRPVm9kK0ZGOGR6Nkg3U2JyTDZoMmU3ODM0?=
 =?utf-8?B?UEZpRjNWbTAvYlZmeHdXejBOYmtCbzB1ZFFzR1FscTNQQ1MzY2h4ZjZueUhR?=
 =?utf-8?B?SnFuOXlhbDJMVGpiRjFHbk1lUFRJdk1idnBwSmg3S2oxbWpZeFhDRjZYcDJz?=
 =?utf-8?B?U2RJN0JLTEU0VVg2dG8xWThFOUFtSWs1NytpVDhQZW5xNWFOTWtkMjJUNVJF?=
 =?utf-8?B?WURrd1dnaU9Id20xdS9ISFpXeExuVGtZOXJKK0NxaUxzakZnVUwrR3Ywc2dL?=
 =?utf-8?B?cW9oWFgrdG14M21RMWdaU1lMZDFxc01rMGMrdlZwVXBQT1VDbVUrUVg5M1d5?=
 =?utf-8?B?b0ZScXQ5YXJDUnpqME9KSXlERXlVOEI5VnpjWWYzaU9Kd0UyU3d4K0FPNWE0?=
 =?utf-8?B?dHZBTDgvWllJRFF4RWRaUngyaENsR2ZTUFNlUXFvZDc1bzQ3K0M0R1BQM3J6?=
 =?utf-8?B?YXZJeFczR1lhRzQ4MkxGaFdobEhrNFdCV3RRQkJWZitNenJDcFFxQStHd2Fy?=
 =?utf-8?B?WDV3ZCt1OUdwb0hWQkJRTGNoOCsydjg2M2VnUm95Ym5oQ0dGOVg3N3d4Q1J4?=
 =?utf-8?B?TktyTnl2NmZSUWVCd01PTXkzQWZpOHd6Z2U0OThObTd3bERmNDQzdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b278bc9d-caef-4c0d-3a76-08deaad6be63
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 18:47:23.0095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F1KM3l7GfWkqbHoc0P1RFFPVFFNOEWuNnhIl9xYuucwMiAA5czgUM7K4HLJnxmG8orhglTQuq/V9Ss3lD1aQ0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8194
X-purgate-ID: tlsNG-ebf023/1778006846-2AD643FF-2B68D117/0/0
X-purgate-type: clean
X-purgate-size: 3902
X-Rspamd-Queue-Id: B72C14D2DCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Tue, May 05, 2026 at 05:53:31PM +0200, Jürgen Groß wrote:
> SUSE QA is seeing a problem with PCI-passthrough of a SR-IOV to a PV guest
> running a 6.4 based kernel, but I can reproduce the problem with upstream
> kernel, too.
> 
> The guest is configured with "e820_host=1", but the PCI region on the host
> isn't marked as "reserved" in the memory map, so it won't be reserved in
> the either.

But that's how it should be, device BARs shouldn't be in reserved
regions on the memory map (albeit we have seen this fairly often).

> As the guest doesn't have the ACPI table available describing the PCI regions,
> /proc/iomem in the guest won't include those regions as used, resulting in
> the kernel's resource management to use those areas for potential memory:
> 
>  resource: avoiding allocation from e820 entry [mem 0x78edc000-0x79868fff]
>  resource: avoiding allocation from e820 entry [mem 0x79d2a000-0x8fffffff]
>  resource: remaining [mem 0x0000000090000000-0x00000000ffdfffff] available
>  resource: avoiding allocation from e820 entry [mem 0xc7ffc000-0xc7ffcfff]
>  resource: remaining [mem 0x0000000090000000-0x00000000c7ffbfff] available
> 
> dom0 /proc/iomem:
>  ...
>  80000000-8fffffff : PCI MMCONFIG 0000 [bus 00-ff]
>  90000000-c7ffbfff : PCI Bus 0000:00    ← PCI MMIO window begins here
>    90000000-900fffff : PCI Bus 0000:01  ← I350 VFs assigned in this range
>    c6000000-c70fffff : PCI Bus 0000:04
> 
> dom0 e820 map:
>  ...
>  Xen: [mem 0x0000000079869000-0x0000000079d29fff] ACPI NVS
>  Xen: [mem 0x0000000079d2a000-0x000000008fffffff] reserved
>  Xen: [mem 0x00000000c7ffc000-0x00000000c7ffcfff] reserved
>  Xen: [mem 0x00000000fbffc000-0x00000000fbffcfff] reserved
>  ...
> 
> domU /proc/iomem:
>  ...
>  00100000-78f06fff : System RAM
>    01000000-01ffffff : Kernel code
>    ...
>  90000000-97ffffff : System RAM

But that's not in the mfn address space, it's just RAM in the pfn
space of the guest?

>  fee00000-fee00fff : Local APIC
> 
> domU e820 map:
>  ...
>  Xen: [mem 0x0000000079869000-0x0000000079d29fff] ACPI NVS
>  Xen: [mem 0x0000000079d2a000-0x000000008fffffff] reserved
>  Xen: [mem 0x00000000c7ffc000-0x00000000c7ffcfff] reserved
>  Xen: [mem 0x00000000fbffc000-0x00000000fbffcfff] reserved
>  ...
> 
> The VF is showing up near 0x90000
>  pci 0000:00:00.4: [8086:1520] type 00 class 0x020000
>  pci 0000:00:00.4: reg 0x10: [mem 0x90004000-0x90007fff 64bit pref]
>  pci 0000:00:00.4: reg 0x1c: [mem 0x90024000-0x90027fff 64bit pref]

While the above addresses are in the mfn address space?  I assume this
causes issues because MMIO is identity mapped in the pfn space.

>  pcifront pci-0: New device on 0000:00:00.4 found.
>  pcifront pci-0: claiming resource 0000:00:00.4/0
>  pci 0000:00:00.4: can't claim BAR 0 [mem 0x90004000-0x90007fff 64bit pref]:
> address conflict with System RAM [mem 0x90000000-0x97ffffff]
>  pcifront pci-0: Could not claim resource 0000:00:00.4/0! Device offline.
> Try using e820_host=1 in the guest config.
>  pcifront pci-0: claiming resource 0000:00:00.4/3
>  pci 0000:00:00.4: can't claim BAR 3 [mem 0x90024000-0x90027fff 64bit pref]:
> address conflict with System RAM [mem 0x90000000-0x97ffffff]
>  pcifront pci-0: Could not claim resource 0000:00:00.4/3! Device offline.
> Try using e820_host=1 in the guest config.
> 
> My first idea for solving this was to add the PCI regions from dom0's
> /proc/iomem to the e820 map of the guest, but this is more a hack than a sane
> solution.
> 
> Thoughts?

I think the issue is that the guest has created a pfn RAM range when
there is none in the provided e820.  When using "e820_host=1" the
guest should be limited to creating pfns only in the ranges marked as
RAM on the host e820 memory map.  Creating a pfn range over a hole in
the e820 shouldn't happen.

Regards, Roger.

