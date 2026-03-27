Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAvxG+uuxmmiNgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 17:23:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3433475EA
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 17:23:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265973.1556653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w69wo-0006y1-As; Fri, 27 Mar 2026 16:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265973.1556653; Fri, 27 Mar 2026 16:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w69wo-0006wI-7P; Fri, 27 Mar 2026 16:22:10 +0000
Received: by outflank-mailman (input) for mailman id 1265973;
 Fri, 27 Mar 2026 16:22:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w69wm-0006wC-Hh
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 16:22:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w69wl-00DveF-U2
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 17:22:07 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c6aea2-5cb7-0a2a0a5109dd-0a2a4502db36-12
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 17:22:07 +0100
Received: from [40.93.195.34]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c6aeae-63bb-0a2a45020019-285dc322ad47-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 17:22:07 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB7023.namprd03.prod.outlook.com (2603:10b6:a03:432::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Fri, 27 Mar
 2026 16:22:01 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9745.023; Fri, 27 Mar 2026
 16:22:01 +0000
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
 b=ik//9bHvcWrHBt1BMAHrnPzozTLzUzs7QO2PypnzROisQpoaRVq6E+ZNokEiWBWIg9b/H8dkwP0AZCV7oA9R7Ocgs1UvqBgfXuWceF4HVvFaB99XW2idD9PAHDLkKAAyexzj6rnJSV9nm4q4LJjnsTfUcM7GlCMkMtXxICrtK9gwTjEJiDdGmsnKEiohUl+AWCAxB8AKwCr2p3gmjTf3OA7uVaE3N8r92Jn/Q44VJcopE/FR4FOh/YQDrszNi0vgwYAdGJKZQ1OLrhhCtmz1C3hwzYc9kkXIAUZsXyTWluH59KKcc4JwFDgYiiFc4WBkc/3z8DHQE25wscOIxIgzEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycr6zfo8t9VZ5q0vHSI77f2ZyV3kSnoqeHgKcKxwuOc=;
 b=ZqpiVJ2lzyNbDqGrlvfnAgjP/Z1CAFG216DJN67WV/Qn0yqerxGPemWGiX/BpzrjQn033euh87Y/T8+ls5gfGPkMKMQUKJuaiEvuvapX0iVZ+0CdVulI2jBw3RDuv33Pa4XEX2morwR/lS4HK41XevZgpuCPMP9MtxyKGpGAog9ipJRKW8a1OX7qArKCGxiRzMspU6YWtvK2OuF0/mHg2JTuo0Zr7Yd4jSEZYVYIX89/7ZFWUbioescXtE1sZK2p/zc7CDJKlGztwljvgexyl471hWSHbZeUV0BsjBoq2dniySwEiD4yACOtQgbTXQhG6pvElu59bnOV/Nz/eL0/+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycr6zfo8t9VZ5q0vHSI77f2ZyV3kSnoqeHgKcKxwuOc=;
 b=Q7CF3+/azajmtYwsxEjcLCQu2+jkzcXDhgTvftDmj7SmpsApyWC7QxWiBkKCwxQxobjSJlvewJTDTVUnL0p8VWZWCTH9GsyQbwrLyZADCbJZDWauYh6d+O14DHRW+q04hhULBYLTNGu0TmHy9ChjbVvZk8bUa+E0//f0SbLwaVc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <13153741-134b-45ea-8de6-3f87c6fb2ec8@citrix.com>
Date: Fri, 27 Mar 2026 16:21:58 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] x86/fpu: Initialise FTW as well as FCW in
 xstate_alloc_save_area()
To: Jan Beulich <jbeulich@suse.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20260326190429.1156367-1-andrew.cooper3@citrix.com>
 <20260326190429.1156367-3-andrew.cooper3@citrix.com>
 <a0cf5128-9387-4796-8440-7e33b6dd8337@citrix.com>
 <e6a36adb-20fc-41ce-9db7-7c7bc4ba9fd5@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <e6a36adb-20fc-41ce-9db7-7c7bc4ba9fd5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0127.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36e::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d90db3e-93e0-4b37-6a8e-08de8c1cfa24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	/d/iz6hcI5JZoYsarhR8NgKVrtiUJ0r+Deb78ZNnuC/C9806jue9LiRYwEsIljaurqg1ssgU/xVegCa/3TJ56ca1mSr9T5Orr0p+27i63ZZdJ0laqpNt2KZZYMXhgrW1Tu7Bx0GgR+KlOYhv7ExgQ0DNNo4qA8M0YP45hTKu8GDzfhMugXP1ZUWok2BtxXaJx8sVoOqxdyOx3paLsmTiup2wTg2iE7KbpfdaziPcXjr3U3TJHL/x9uL7zMcJ0aV3bo3a2emZGNpBCFzIZ/dzmtKZcmEY/bYNIDzPHvotOQwOG95o1AACPz5rjbOb0EdwfKODorjnHbJji1MdSgvl05TjMpMp4ET0t1twf6DUIf/g4dQhAyxyIF+fyMRD0e/uk7chGfpJ6pjmsclBHO9mRv3dDKYXsUoxJb7lpBMOm9wZv3kTtcihsrF3Nv3g7uMcbJVfsGDuIEG5Xp1QaRvj3BK93vbW0xnXRkOeA6NPpuUVCWkaK6j2HYS0S8DBeiHuYb8aVBLMlB0caJ4ZrLnOaRFE9uexqXcLkd6WNt0SpK530jQs0htv9mOypsYR2T0c9MmdA0K3SspE52aLudRGYZAW7Mr+YnqriD/d1XfNQebskY2XX8KlqJCZyRlqh1C32LzoIoVtJxnzL2SM4M5LW05/2JMUMhSfe04+q/An8BfHP6b6P5IwOe3GbtUau5DJ+13Z6czvYWF0y6vq30vlI6UQCSbZdbHmcS7Uo7tc0cc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXNScGJpY0psaHpLMWE0cTRtQVkvNjJvaG1yby9VMDE3Yk9XMk4wcnFvSTk1?=
 =?utf-8?B?VlFzcm9FejVveVpTeXJmY0VtV0c1cFRUeWJIVHJVTmxoZlUxY3hzb29YaXIy?=
 =?utf-8?B?MUh2VXhoUndxcnMvZ0JFY1YyRnd2N1dwY1RQc0VKd0pyeDlFVlVWN1UyZEw5?=
 =?utf-8?B?UmlpQmxVcWZ1aXpPZEhlU1hHc2ZKSDVyOGNvbFdCcGpOOEVxNERFd3VwMm43?=
 =?utf-8?B?RkdDRU94K3R0OEhSZ3FSZEdjZFB1VVBJWkZJam5vWDFhWUtZbXhRTnM4N2tF?=
 =?utf-8?B?d09nYWFrdHZ1bU9LdkVuVXJHN0lVUTZ4d2gxVHczalJpT2FXNGllZTI5SWVO?=
 =?utf-8?B?U0pVV0p2VVVJaUswejhkM0tIL1g4QkJGeUtpZmlIU1V4aUl0N0JqYzREbzFi?=
 =?utf-8?B?RkpOMFVyVlNSK3NIOFUxeTNvUStxT0FHS1NyVFFCYTU1emZqYmhxQ0tCOGFv?=
 =?utf-8?B?b0NWUDJzY3NmeTJDUEhSRXZHYXJRMWRpUnQxeUhrdXVJVjdXaHpHWlhsSHVK?=
 =?utf-8?B?cVJvOTlGYnQ2TklJM0VPbHVBcnl2dkUxSlVhTVRLRHEvRzk2ckZ0Q0pyV1VU?=
 =?utf-8?B?Q21OT2hzRWRJRHdoL0g2NkVXZ3JxT1ZsbVBqQmxUQ0ZwOFdIeFJpWG03VlBW?=
 =?utf-8?B?MEEzUGVzY244c3FwMGhrVy9xZWtyRUptTEJieXhJL0dIVk1ZRW5La0l5OFlX?=
 =?utf-8?B?b0llL3JSQ3ZGZFI2WFhYVnF0MXVKVWZGOE5tRmdIcElkM2ttOVErUDhYL0Vq?=
 =?utf-8?B?eWJtQkpZOGlSN2dJcHBxWFdhUmVGbWpNT0JzNlViWjhlU1pQSy9LT09wMmg5?=
 =?utf-8?B?Vm91MTBEUFpOdFBCc0kvOGo0YzBING01cHMwZXBRNG8vVVNiYm9oQUZWaWFx?=
 =?utf-8?B?aTdPbm14SUdCdEJrR2ZwcDNPTEtFY2RicjVkN2p2ZUpsZjh2M0FvU1N0c3Az?=
 =?utf-8?B?M3d6Z2dPaGVPanc3REd6MEtyT3pnajgraGJHcTJ3Nk1pSFhoejZxNVA4V3Fn?=
 =?utf-8?B?RkNvMEdha0pETlArSXk1VmE2T2x0ZS9OY2h3MXhvSlBuQkVIeVhCbmhhbmZj?=
 =?utf-8?B?ZktwYytSM1VQUHZXa1JMUEFzYmMyRVI2TWk4aCtDcnpuTVcwcnpWdHBYMExP?=
 =?utf-8?B?Q2Y4VEJHQzRxZFRneGNhbUsyWkhnL1RuUFRic3VJNlEvblFSVHJjR3FQTGpK?=
 =?utf-8?B?Q3dLNFJEeUIxSmJQOU9CQTlubk5DSVdBTjgrVlNhSElzVTlTYmJjRU9CY3dO?=
 =?utf-8?B?ellmbXpscmF1QWJWUVkvUjFBUU1aNHJmenZhTlJlbWxZK0NIc0RXTUMzZ2hS?=
 =?utf-8?B?NzVLdDJxR2E4cGs5eWJZVmpFaEg4aVg3SG5oZnJJOVhTRitJN0JlUzlLUWxs?=
 =?utf-8?B?NlljNy9VR1NCOHRQZllOODdLYjk5UEo0VXhMZ0ZkckNXRWdOVkFLS2JETDg5?=
 =?utf-8?B?R0NPNE0zdjVNeGk3ZVRLeGIxazVuaDRWTStBV1FJaEtKQTRhSTVqVUR4NmpW?=
 =?utf-8?B?SWZ2eDVDeVdvcUN2Mkw1MFFhZmxCenpEYzRGaXZxOEdCb3RFdEEwN1ZTVXVu?=
 =?utf-8?B?c3grd2RhMjIxSStnQld5MG9zaVlEeitreXBRSFU3U0FNWmV2M0ltZ3FXcWtv?=
 =?utf-8?B?U0NxRDVUYkVpK2J6bS8vSjZPWTVOYjZWNUpSSi9TU1lETVgxRlloYk93L0FC?=
 =?utf-8?B?b1FZOGQzcVBuM04xb2Z3UldMQkI0N1VxeHpwbXJHUVRyR1ZzWDdQb2J0elFk?=
 =?utf-8?B?bFVGTVFvWTh3cWxHdGhETXFCOHdmUnF1M0E4U2E0cFE3OUJrdHFGUGVMU3hp?=
 =?utf-8?B?ZkxSbXVad3V6VWlDaU53b2k5eVRQYm5LNWtCZElqdmJaK2lUOHo2TldISVlT?=
 =?utf-8?B?SWFLQVVRUHl3aENyaFB6WDRIeWFsSjZaeEpodzRFbURVaW1Nb3lmbzZ4Q3JB?=
 =?utf-8?B?VUt3bVVtdlA5U2ltZk5IbUlLaHQxbmJ5cmx0RWcvSnBYWUsxVGlWMGJ5eXBB?=
 =?utf-8?B?bklGM3ZJTnFhQllKTWlJdUIwUVF2djRBK3AwZVhsR01RNWpKS1J5WUZHOUpF?=
 =?utf-8?B?VXp6L0l6UXZNYUY4TVVXaEUxaURyV0lFWE5XMEFnd3czMlpCemdlWnNkemhS?=
 =?utf-8?B?elkyempxdVI5ZFFybzRZU2FxQW1TdzZGY1owUGl1OTdxcHlpYTB4NFB1UGx2?=
 =?utf-8?B?RmNmVjFmOVErK3VGMklVWEhvUk5CaXFVMVdtTmNBbjFBRVNGMXd3eEc5QlR6?=
 =?utf-8?B?L3pqS0NydkVpckFKclNYVldqbmdZL25QVWNjZTBxRTI0ZDdIWlZOMU1TWWVv?=
 =?utf-8?B?R0ZtYUhhY3VtM2orVDB5SlQyV3ZNRS9rSEg3QzJFdHltbzBGb0UrTXV1OGx2?=
 =?utf-8?Q?8j4HCKiiA/5zt2+c=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d90db3e-93e0-4b37-6a8e-08de8c1cfa24
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 16:22:01.7658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pheIuhtZL2AItB2iTvrAQL21jrLLxw7gDyUFJNcKesOjGmxQ875loWpstq2Z74B+BKWVf1SUlWsgmegwcmfJT1qYvzbgvUxBuI/zkWYRmo0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7023
X-purgate-ID: tlsNG-720697/1774628527-4368EDB8-5FD3C22E/0/0
X-purgate-type: clean
X-purgate-size: 2506
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:ross.lagerwall@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
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
X-Rspamd-Queue-Id: CD3433475EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27/03/2026 10:17 am, Jan Beulich wrote:
> On 27.03.2026 11:04, Ross Lagerwall wrote:
>> On 3/26/26 7:04 PM, Andrew Cooper wrote:
>>> xstate_alloc_save_area() configures FCW and MXCSR to #RESET values but misses
>>> FTW.  Fixing this means that the backing memory always has an architecturally
>>> correct value.
>>>
>>> Adjust the comment to state that it's the #RESET values which we care about.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
>>>
>>> I don't understand what the rest of the comment is trying to say, so have left
>>> it alone.  There's still a lot of cleanup to be done to merge i387 and xstate.
>>> ---
>>>   xen/arch/x86/xstate.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
>>> index e990abc9d18c..747df0b2e9a9 100644
>>> --- a/xen/arch/x86/xstate.c
>>> +++ b/xen/arch/x86/xstate.c
>>> @@ -550,11 +550,12 @@ int xstate_alloc_save_area(struct vcpu *v)
>>>           return -ENOMEM;
>>>   
>>>       /*
>>> -     * Set the memory image to default values, but don't force the context
>>> +     * Set the memory image to #RESET values, but don't force the context
>>>        * to be loaded from memory (i.e. keep save_area->xsave_hdr.xstate_bv
>>>        * clear).
>>>        */
>>>       save_area->fpu_sse.fcw = FCW_DEFAULT;
>>> +    save_area->fpu_sse.ftw = FXSAVE_FTW_RESET;
>>>       save_area->fpu_sse.mxcsr = MXCSR_DEFAULT;
>>>   
>>>       v->arch.xsave_area = save_area;
>> Is this comment correct given that it is initializing FCW to FCW_DEFAULT
>> which is different from FCW_RESET?
> Is the goal here to represent XSAVE init-state in memory, or do we truly mean
> #RESET state (in which case FCW_RESET would need using, and in which case
> leaving xstate_bv bit 0 clear would be wrong).

We're creating the vCPU, so conceptually I think #RESET state is what we
want.

But, I'd forgotten that #RESET and #INIT FCW are different.  Also, we
don't really want to be taking the overhead of keeping this properly at
the #RESET state until the guest executes an FNINIT/etc.

I think it's better to keep using DEFAULT here.  I'll rework the comment
and commit message.

This also suggests that we want to rethink vcpu_reset_fpu(), but we can
leave that for later.

~Andrew

