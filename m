Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHzcFKhm8GnKSwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 09:50:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE76F47F43D
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 09:49:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295410.1572065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHdBZ-0000Iu-CX; Tue, 28 Apr 2026 07:48:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295410.1572065; Tue, 28 Apr 2026 07:48:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHdBZ-0000HR-8K; Tue, 28 Apr 2026 07:48:49 +0000
Received: by outflank-mailman (input) for mailman id 1295410;
 Tue, 28 Apr 2026 07:48:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wHdBY-0000HL-8c
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 07:48:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHdBX-007BUw-3Y
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 09:48:47 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f06654-2eae-0a2a0a5409dd-0a2a45059f60-40
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 09:48:46 +0200
Received: from [52.101.56.7]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f0665d-aaa8-0a2a45050019-3465380733bd-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 09:48:46 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BN9PR03MB6204.namprd03.prod.outlook.com (2603:10b6:408:101::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 07:48:44 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 07:48:44 +0000
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
 b=E6e84rqZK2HeKCPLoCPjafeM1dPfXU2Wf3lZrRiN4dyOoXZpDA8gkax8//YOWNY4Jm8jR88UhiVOlE6JVVHsb5KvBtvAT8D7oP5GntIM64oMZGeX8eWNXG3NP/3WE4k2aKRmDZaZdIYjxjNeHy+OphEQJB3l+FqO9tnLhjNIsGATlK12UgrnYFZtKrBPYlDlM/Hm735f/RNuOTW8+29ejkEbGc5GeebLqVg0xtcTL9Ku79h7YZfY2h92ixyCJFeViYS5lYb63ewtAMES0CeYui+zAbOLu8Q1QgUTz297wm55ygtYYTtR9zfA9vqq5zBrHlmzEircpEExVsx8MTJEvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5LjEDnCnKB+aJUEQ/u4vjV15DYk3BNPjC1GMqMTxMY=;
 b=YaAZuoizsBHsdFwlz31H0Ns6/Rvh2VmFwl6dsRVO+SWr+4gFmkgPmxqJFvM7VpuAf+imzTsVpuSGZIS4umIdKVJbmF9HlSSOeqlkZmcD9f0I7R3j6sAjG5YlRI15bIbL9mpusag8R2MpmHgls3zAFGkhQajzgPakzXBBMUHfo/Jr69GHyWBF9w1U9MdOvhuvcrJgFquoY6bB5J25EUxmbLyRdoZXSUR49V8JU/yqYdFi8tfwInwaiECGQuNZYtypy6CrWWDmJWymo9dkPntBvc7AHOxbTR49ZjnUgaBbE5uTLvFSli4zZBVXHj7clMsuDL5DyabvAgngdU87VZkJGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5LjEDnCnKB+aJUEQ/u4vjV15DYk3BNPjC1GMqMTxMY=;
 b=YTQrsln/vCVjdEsRvlj67EpfiIMtd4IWBKyJBwyue4HqmHbzyvYVe4tKDgCs2V1ffDzyNbfQvXVhL7TqY7ifBkA0YGGXQebyWmo4dqQsCg8OM/roKLf45FM+5aumPuQneWPda6O64K5ZrD0Lw83nDdZGknH/hYgJ0TR4ceZnNQY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 28 Apr 2026 09:48:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 00/17] Q35 initial support for HVM guests
Message-ID: <afBmWSFsyrwy_Ru1@macbook.local>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313163455.790692-1-thierry.escande@vates.tech>
X-ClientProxiedBy: BN9P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::21) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BN9PR03MB6204:EE_
X-MS-Office365-Filtering-Correlation-Id: 83eb3cea-0ab0-45c9-7126-08dea4fa9277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cGXIm6BxCGxwGrMPqEDvUJfZ47hNq2vzZC8kapXxfjiPiT2ALEeFYQNKZJdbYQIh0qnHeGaVccKxSFnQm87R0WdrGnSAddrxfv/M1kwX7+svayavc3Mz4DHdJcZiqYm8Q+DYMaIF5+U4oqO4FiXYNAYiRZ87RC0rw4WLsmVVDPdSRxLj6Vh990WUY5w9pLU4d5bcjUcZJHhm22dccUOVcurmo5U+09zM/MbvYejDmi4pkOM6HuZzycJhcQ9WQ5yTTfi5kPo2CNK8C7hpcVkdSoUrQNSabEGv5vh3NO06A3S0+Sqw1BntCPiqzaFXZzPoWlbdq236bVdWxdltIosfCvpHrsW8IIlEq4U7QSy9kQwChlzflCXC36UuDm16GcWrN5uANIM51Pob8zuBvQGsKAeqRk77UG1qA8VJTB/vX6rJx8E9QsH4cm8AQR18/JMErOjjQl8oHhmb3vNEItBpJ9FFEcyitqAPqXkgUtdO4KtTrF8fNENqSxxeChOKzn3+vxieYxbjLLEmDFSGzXWSC2EY5BrZrkAnm2o0VMDjVh/0arJnhbyu1hCOL9GAftFjb8Qpky+v41n7TmgweDYjkGaeqOfDmPYrJFOeLpKm7gdefZ9TeQa50OYyUfgbvORQY7pIc3T8CJXB5O3HobP4I6ilmAL5MjZWepubWrN6I0LG13FbWeVnd9Yp+E7caLAhFGTrZnqISrs1FEK2qt7IpKYaV/+p2KQfQfYWhnZBfBA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUU0VGRYMFlPL3AxRDUvS2xtMS93cUEzeTcwUnhBNHdmWjd6aU9oNXAzemRw?=
 =?utf-8?B?eEpON0p1ZXBqOFhja1MvWHpOcklHSVVqaE5pTU4yOStjYW4rc1dadGNKNXVh?=
 =?utf-8?B?SU5rSW55eStXdnMyUGlxaGVpazR5V0hOTk9kQ2xKQzRMYWdTNUZHWER4eGdt?=
 =?utf-8?B?eFJlYll4UWF1SzQ4c0FoUmEwU3lqRGNGMmh1dTdVV1NFcXAvZEI3ZllwUVE5?=
 =?utf-8?B?NkxPdm9PamNzWWh2dnR1eWZ2bUFCN3k5SVozejd2NjdqNERCTy9EWTVpK3Jr?=
 =?utf-8?B?NzBpdDYzWm9DU1R6L2J2UmhETFlPQk8xRUw1Y0xGZ01TZW5EV3hMSnJPOG9G?=
 =?utf-8?B?ZUxFNU1nRzR3d1dtT2wrdG9EOE5laytDdG16MzZQMkJEd3N3ZU1leVcwcGQ5?=
 =?utf-8?B?S01hOXludFhNUVNhY3JXQjArbjJkUGlnRVptaXdadE9mYitsN1IzdXBhaG9w?=
 =?utf-8?B?MmZ2eEcvRmU0T01mT3VVajdodlM0Q21STXFBVzhZVzA3N1JNakNCU2hCQ2M5?=
 =?utf-8?B?SnRMMzQxY2Q0VFRQeWwrRXpHVXFOMjZXV0NYOFhSSzloVWFFOWcvQnNmYWJF?=
 =?utf-8?B?alM1TUJoN2dDZndMeGtteDlHQnJ1K3Jpa0lYVlU5ekNjanNlU2p0Y25tdzZN?=
 =?utf-8?B?RW52eVVuTlZqSWd1T0FJNkRuUjJpNUVqcmxMRzVsYkZnNHpDdWJ2ZzUzOVVD?=
 =?utf-8?B?dlBnN01McVZEZm1VWHpLbTZWbkZBVjFkVGhNaTJmREdWc3E0YXpyWWlZNjdq?=
 =?utf-8?B?cU14NHZDOGxidHV6MTJ2ZkVBWFIvNDJyR2oyeUFYM2pjak11VUcvYWx5cHA4?=
 =?utf-8?B?QXNRa09XVm4yQjFBQk1GaWRlSXVLdlFCc0p6OXY3L2ZiYk0rQmcyRFlucUxY?=
 =?utf-8?B?Z3FacGlvbCtLMStaSHFIa005TDcyY0VqdG1tTWJYVlRnZUw1UCs3S0RQN3Fr?=
 =?utf-8?B?RGE4TVlkVVdLL01tdngzSSsxUnNyR24ybjc4VnpYVWg5SFpsZVVUdVU2RUM5?=
 =?utf-8?B?RWdZVk9QdlRjT0JoKzVVMlh5TzRGckVyRkJFOHNtMHhPZTBBRngvcjJSM1pQ?=
 =?utf-8?B?Y1ZWd0o4Qml0WXg1NzNIWWlIUHdXcjFGV1NyQk16ZmZhYk5pTC9pZVFxenZy?=
 =?utf-8?B?b3oydlJrQXVMMVNicWVGV25DbE0rcWZ2TVNrdTF4SlZyYklRcVRaaWdsbFAv?=
 =?utf-8?B?OTVHaFZMQS8rYVpYRjc2dmNMR1cvVE5jTnF4Y3Y4ZGpsaTk1ZEcveDRWK3ph?=
 =?utf-8?B?em5oTklZZEREN2NjK3dkbm5FTWNZUFYyTDVrN1g4Nlk1SWI1N1JTMkd3aTBz?=
 =?utf-8?B?MmluZ0M4NXZrZVBoSm9YLy9OMnFGaDQyQjc5UzZNSnp6L3lkYW4xMFZPVzJv?=
 =?utf-8?B?dzlZSFBXajNOK2REQ0FHUUkyZ1NXRnliSktYT1Q5Ty85cXlHTXkzR2djMkg4?=
 =?utf-8?B?OEF2UDFhYUhWc05haWFhNVhOYWJOODc2cnAyNnU0cmZuU0tIUkIvZ2g4YVRU?=
 =?utf-8?B?a3lzZWZCVzQvQlEwa0haNDhXczhkUEo0QVpaM2lRSkJHMmRVYU1TOE95SE5H?=
 =?utf-8?B?czF5c1FZaGsrRzlFNHJpbmR3UkRWd0xwRzVmTzhMc0U5NExWekM4RGJNMnR2?=
 =?utf-8?B?bFFWc1F2ZWtqQnZ2UVRRNXk2WXBCRzFuL0F4czF2dlQ5QVVUQTBuZDZBdnBZ?=
 =?utf-8?B?aUlmcmtGdDkyTDV6MXlaYmdjNGlPWTZONXdaR2hBMmhXRkpCVFZrUDFEY2pS?=
 =?utf-8?B?cEtKYjFiamxMSHM4YVF5bW9IMTdLZHExczJZUkV5R1VWb045aVJiSk9wdUgz?=
 =?utf-8?B?THg4MGJlMktEdUt5RCtRY3VPTnBOcGlyK0xCQXdHVXNIMmIxSjIvRnhKQ0s1?=
 =?utf-8?B?OTZ2bFVSU3BoaUVKWnBLR3E5ZVJvQmYwYUdRWlk0RjExZzZSd2lrQmdxV1dX?=
 =?utf-8?B?V3AyUWRvTzR5OWZueCtJN1NZc2Z5UXZHRENkZ1dEcElmT3RIU0tXc2lUUG5s?=
 =?utf-8?B?V1Bpb2JwRWxSb3pubTdpczUxK2I2WFg1ZDlZcnZ4Rk9HNkpWTWlzcEZvZFdE?=
 =?utf-8?B?ZVlvemh4Z3JTUzFWVHhkdEx2UWRrQm9mU2xIc3JNL3k4MU1PSmZRTFh1U0Vi?=
 =?utf-8?B?Si9FSDFKcGF1QnBEM2tTNmgzRUZNQVBVN1JJYjBNenpiMU4xMER2NGR2bm9t?=
 =?utf-8?B?Wkh2ZHV0VDBSZ212MmpQU2VGRE5iR3hiWTdGb3JwY1pNQTE0cEZOQnZndUdH?=
 =?utf-8?B?K2Noa2pJZEdmRVgvRlNRYWhUdVVPaGdDb3ZJVmNtd0wrd3R1L2cyQnBUcEEy?=
 =?utf-8?B?Wi8vc2Z3amxISDE0a3RDcjBYQ0xZZlZDTldERGNpRlE4SWFnTzdXUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83eb3cea-0ab0-45c9-7126-08dea4fa9277
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 07:48:44.1878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vrmdLBiHJa9C9UxeqDy4LO3OWAnar2G+sL8ye+YXFefA/rP3FlPoGcxJBougOoXjfscAniEBI4pTjs+lfnZtSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6204
X-purgate-ID: tlsNG-c201ff/1777362526-E0FA2443-F201F1E8/0/0
X-purgate-type: clean
X-purgate-size: 2096
X-Rspamd-Queue-Id: AE76F47F43D
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:jgross@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On Fri, Mar 13, 2026 at 04:35:01PM +0000, Thierry Escande wrote:
> This series introduces initial Q35 chipset support for HVM guests, based on the
> patchset at [1] by Alexey Gerasimenko.
> 
> Basic support means that this patchset allows to start an HVM guest that
> emulates a Q35 chipset via Qemu and implements access to PCIe extended
> configuration space for such devices emulated by Qemu.
> 
> Support for PCIe device passthrough is not implemented yet. This is planned but
> implies modifications in the hypervisor and the firmwares, mainly for the
> support of multiple PCI buses.

Why do you need multi bus support to expose PCIe capabilities?  I'm
not seeing the relation between those two.  You could still expose a
single bus on the MCFG table.

> In order to create a Q35 guest, a new domain config option has been added,
> named 'device_model_machine'. Possible values are:
> - "i440" - i440 emulation (default)
> - "q35"  - emulate a Q35 machine
> 
> If the option is omitted it defaults to "i440", not impacting existing domain
> configuration files.
> 
> DSDT files for Q35 and i440 are largely similar so the existing file dsdt.asl
> has been split with i440 and q35 specific parts put in seperated files.
> 
> The PCIe MMCONFIG area is configured by hvmloader and its base address and size
> are set in Xen using a new pair of hypercalls HVMOP_get|set_ecam_space.

I guess I will see how that looks like in the series, but the setting
of the ECAM region would better be done by the toolstack.  Setting it
in hvmloader is possibly not the best placement, because it doesn't
run for PVH guests (and we will want ECAM support for PVH at some
point), and there's also a vague plan/intention to get rid of
hvmloader even for HVM guests eventually.

> Access
> to the MMCONFIG area from a guest is trapped by Xen and transfered to the
> emulator as XEN_DMOP_IO_RANGE_PCI ioreq type.

Thanks for doing this bit, IIRC from when this was last posted this
was the biggest shortcoming of the series when originally submitted.

Thanks, Roger.

