Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IG/fDgq5AWoZjAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 13:10:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F52650C824
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 13:10:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306062.1578156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMOWF-0001Cc-Gi; Mon, 11 May 2026 11:09:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306062.1578156; Mon, 11 May 2026 11:09:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMOWF-0001A9-E1; Mon, 11 May 2026 11:09:51 +0000
Received: by outflank-mailman (input) for mailman id 1306062;
 Mon, 11 May 2026 11:09:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wMOWD-00019z-Ui
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 11:09:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMOWC-002qTm-Te
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 13:09:48 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a01b8fa-5cb7-0a2a0a5109dd-0a2a45099f90-4
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 13:09:48 +0200
Received: from [40.93.196.50]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a01b8fb-2497-0a2a45090019-285dc4329d5a-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 13:09:48 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BL1PR03MB6117.namprd03.prod.outlook.com (2603:10b6:208:308::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 11 May
 2026 11:09:37 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 11:09:37 +0000
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
 b=Cmkrv8Eu00guOCvJc8N8/iVxkb74sAHwnlgQ5b6NGZxquHTO7/gCtYy3RVrm0LuCkF/BFBKBbwQaNv3qwlboXZ/YLx9GQvIMZiHHzyhbRdvpVM2YKjQBe0HDLsmTjR+Wa9kPzWLQS6UhBeVb13EnxiF8JytBIjxl9pZFhspGnswfRZ6cnWHAtzN5l6YnA2FVGHTb5e1HDyuLmTFcd+G5rcGPZx5px3sZNUZLrMPHkKwXx11CuW+Gu+OkO3LEE/B7XaCacCaogon8QIMpmGdTX0j36gWXF7+a2CloK31kV5LI55xLEz3qvROERHGq79c0n/MZ0GdacDbb59bge6S0IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haYQnbyMwK0rL7Ngqtt3E/by4BGsY9AHl6NGAth1ZNM=;
 b=x4Guf0gVXoulGBa7XvZe0kAH9TC3AINKGi7YRB7flVWcb5LzeNE+knX548k0p6ZnDjj9kJHmVKCptjDnNkvleFVfVc0OxmaXx2+QlqEB3lVPYqN/f3DLx/IhUMLKKgMOEFNgZqoX8F7EDobcNXDfYI6OHRuTc77z7RD7e6gl/qHSBpE4Z6lqCorPo8/wDpw5mAeVicFCJBz1HsIqmIlXqrOfFKCZP4V+tID6PorX4jjHTAbOuxRIsZXgxXw/lj8LpOggaCKa5r3gkEpO8af4d0Gjj/IO7/IB7CX91FCR174wwZ1EN7wkm8U9C1sri1RMxGM/g5mfNWkKI1iShDQGiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haYQnbyMwK0rL7Ngqtt3E/by4BGsY9AHl6NGAth1ZNM=;
 b=CiXTEQqEM4UACaz/oqeBMWV0LQefwtlkl71CfzCRcw/UCuk8wzFY7IbT1DR9sqMDs70uoKiANoEPyq97s3owz1QzrFFep3XqCzhIaLri/HoBq/3mAgiroIlLbY/QU4n2KaeZErISb2Q1X1UZaYU7ZrCFtf6xldhPWRLF6AIoqto=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <12f44475-f4de-494f-8d75-3c3ac039b96c@citrix.com>
Date: Mon, 11 May 2026 12:09:33 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 1/5] CI: Adjust test needs[] to ensure binaries/ is
 non-root
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260508212907.1643761-1-andrew.cooper3@citrix.com>
 <20260508212907.1643761-2-andrew.cooper3@citrix.com>
 <a7932bc7-86ad-401c-b462-01078e6e11bb@amd.com>
 <455c64a2-bae4-47d0-a2bd-902be3ea6127@citrix.com>
 <fd6d9873-d1db-4aef-acbf-6f7659f5c528@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <fd6d9873-d1db-4aef-acbf-6f7659f5c528@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P195CA0004.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BL1PR03MB6117:EE_
X-MS-Office365-Filtering-Correlation-Id: 53361046-e23a-4b6b-a323-08deaf4dca2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cegfCjfrrWN3xV4n5u9CIrde7UxjJYJmmBmsU+D/3KCd1nAOyP8oTstjtae4lyz6AoWIR/inJeBqig6cahaJ/Z+rdVdHHBpOdavueK2n9Jos4ymQy69xK/u+3XjOPYPigPzOeNb5lUj6M69V+dLUZje7jws1FdDdiSP4jNxb7eZOWGXHSQ0EjHEKrveSnhCYc0SsB7Q/8iH8UNsxIq6NqBnAP7puTdOFs6qGhTIgNr788uef3AujmUNTqwA+MSRk4c0QPqKPUW0XE7RZyidMQSbZfh0NjFZJV8SfPGB4FbP1oo12GcbTpEMxwTKqxpfM1u/dI4zx4GBN0Te2rdeAIVuuDwvkOApVhqQp/sigSQeX2kBljPcud/ZOuHNaJCOAbRn6hWFZ6ErwWOM+4MTkxXQRQh/ADHnrsOe55nTcF6wJTPQC8BkScE2H51uIK8LZb2tcmc7uLscD+IUjql2zvYFHu2/z2vuDp6XeOlFxxMU1ncnQsgpMwpOfDB9qGsnBJj5IeP/djIHVhsEJJ+LPiILkGRWi+E+JMNDiab6jC4yIqo8UECmgxQ7MNBAT4qXtCrUlLSx+1PAfmWBzPhXQ245NyA0KSCJRFAP3MpgDKGdztwtWw3gkXV5TM9JBSGY86JmR8+0Lzg3i5y0WJ/K8casljff/b14eMj/uy5gXP3wDGpojcjj/qm1aOzie6WHf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWphT1p3OTlWTkUrSWpJM3JMVjk0SzExeElYS0x6N1BqdFdBak9nZlRmOHpZ?=
 =?utf-8?B?Y1l6bWRpUDF0cnQ2c2pyNWVtVnV5aHhMemYwaVVrd0JrckZmZ3JJMnNYaHFq?=
 =?utf-8?B?UUlpL2pER0xkRWlxOGZuM1c5KzZDRUVvcFlDTkNDL1g5cGFybE8xR3NFbWhj?=
 =?utf-8?B?cTBmTGsySGdrajNXbndPRHIwRXA4am93aFRKdmpzRHlEamFyUHEwN2JpbDVH?=
 =?utf-8?B?cC9iN3c2b0VCNStTb1dUSUFDWWl6RmtDSWQrV0hOTGlwRWNTaEVIeXo5ekZ5?=
 =?utf-8?B?VkpmT1FZVS9nNHhLUmtBbXdDTVhkbDRwY3pwTDVqUFJQVFdybmlEQVFuYnoz?=
 =?utf-8?B?Wlh2TllYY1IzVEhldUErVXA3T2p4dVBIRGZCUGhZNENGYXRTbkV2VE56M2ti?=
 =?utf-8?B?My9ZQTYvTzEyY1ZlSENlcE9mRDdscFVxNlJOUCt3aFJKZkZ3Y2NlanRqZm1E?=
 =?utf-8?B?NWgweWNmblNPMTdXYXl5Zm9JOGlJYjlPbmpLeThIYnhWY2FlWll2Yk1aYkFo?=
 =?utf-8?B?eGYwQkI0NFhxeVdMb3B2RjNSNGZwZmdHdnNCdEEwWEJtcGRPL1NTZ0JyOXNx?=
 =?utf-8?B?elRTZ3cvbDZyWWRZSi80NW41QnF1YmgrcWtrQXQ3NWdGU3FvUjZyUjJtVUtV?=
 =?utf-8?B?MlZNQXhZTGEyYXVob3c3ZFJHdlcvcHZSMEl3ZnJKdE5lWVVUMnd3ZmF6bGFx?=
 =?utf-8?B?U0tSQnlOSitnZEdsbVllS0orRnBrUlBYektyNmV6Y0Ixbk10dWNybnRBcDhF?=
 =?utf-8?B?dnhXQ0M0a3RjQlFXN0JDRDVKR25pR0FLUFBQb0JzTTlqakw3VW9XVmdFbmpp?=
 =?utf-8?B?ZzEyKzI4VldyMjBxZlBLdUZROFVGTWFYMEJBeEprcHk4T1FNNkMvV3d3eWo0?=
 =?utf-8?B?NWdPSzVEeVZHaDFZUk9sd1I3aGRPd2lrU2w1VkZ2SDY3bFo1U1JYRGEvQ0ZM?=
 =?utf-8?B?UkdscDVBeWVENTZTRjBTUjQ0VGl6RVNOSnNKT1BuLy9uR3B3MkpZR1dvRnRH?=
 =?utf-8?B?V0FMdXlnN1ZITGEyOGticklMMnl3WS92dVcvbUpGSHZNdjRBczZBZkh1QU0x?=
 =?utf-8?B?c2R5OTFvOWo2ZCszQ0tyNzlsUG1PUmlJLzJLakNWOHJkSmNCdXVyZmkzRjMv?=
 =?utf-8?B?aXlhdnBGNWlGZkRFTERLS0FtWm10N2FQUWlmOUhGNmpYdVc1NnNWRmhERFZD?=
 =?utf-8?B?SWxGVmlBTmdZUmVUOENiRmw0WE9DMWNKRmtqOVMvMjNqd2dobXpnOCttVUd2?=
 =?utf-8?B?QlFqWHNYM05wRzJIWEJ0amF5M1dudEhqTk9CWkVzOWtLaUNKYkp5SFBra2Rh?=
 =?utf-8?B?L1dLTm5WNTM2Y2RXMTZEaXdwNmo5OVhkVUlncTdyc2dWeXQ0bGYvVXJHSDNY?=
 =?utf-8?B?dVlrVmdFTFllNEh5QndQK2JkYTNOYU1nbDg4SVh5a1BydVgwSjFOY2pObDBm?=
 =?utf-8?B?b0JMOU5KVm5wZU9MZzBoYytpTGJFcVF4VzhFV0FaU1BjYm1KOTBwUThwN2xw?=
 =?utf-8?B?NDBLZHVLVUpicFBmdVZpZXlXK2NBcnd2cmFIb1JyUlNEUTZmeGtPRjlaZHlK?=
 =?utf-8?B?b0pjTExYamhteGN4Ky96R2hUNmhmd0pGazd3YzI2M1Z5UENLak9Mdm9jZDRY?=
 =?utf-8?B?N0gzeWRLZWtja3pmOGQ1SExNZGJYaGNSTHdtQk10VGcvaDVHN1JPUENkd0ZC?=
 =?utf-8?B?VEVHNktiRi9aR1pIR3hucEY3OG5ENzg5TWh1N0Uyb3pOM0l3TkVFUHQ2b1Bn?=
 =?utf-8?B?RWNsTm5jUm51N0RyU29JSHdPc1dBcnEyb2xibnlxaWNuRkl6c28wNlRHcDR4?=
 =?utf-8?B?c1FUUlBmNDhRV3g3akprbXJRT0M0QlVRSnlRUnVZNEQ2N09mR3BML0FxeU04?=
 =?utf-8?B?WDI1QVZ2a29HN2dTZXYxUUFZdGl3cGxaeGU1ZHFnVzlUVHQvOEZ3TDhhVnI3?=
 =?utf-8?B?S1N6RC85dlZTNW42RXgyK1g5eWE3QVVta0hXSGRNb0o3T3llYS9qTDJCaFpm?=
 =?utf-8?B?UDlpenZjblQwQzFZNUU1YlBIRGFBL25IYzMyQ3dkclVrL0dreHhyUWltTi9L?=
 =?utf-8?B?NU95L0llYkhMZmt2eUhyZkdnSTFGOUM5eklBU2xrZWg4N3BXMG81dWw0RFdQ?=
 =?utf-8?B?bmxQZThKVThkcUpFUU41Qmx3VUhyRlZ1ODlOREV3cW9SWnYrNVRUblE5M3RE?=
 =?utf-8?B?RGRFVTdZRTY3UEVvcTlrVCtwbnQrL2YzWFhBcGVWOHdYVE9scUtkVEIyYmha?=
 =?utf-8?B?NlN0TE5MQTRlandmU29mbHViUXplUzI1T2puSSsvblVsbmZJQjFJdmJ3NlNW?=
 =?utf-8?B?b2UvbCs4VHcrYk9EUjFPZDFPWFpMcjNNbkJLZVUvQ2tLeXVEUXVLdzBPT0hq?=
 =?utf-8?Q?M8C1/p8VpLH6q2OY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53361046-e23a-4b6b-a323-08deaf4dca2e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 11:09:37.3408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMesIK3Dud3ILPkZYilEV7iJKy6wud0GQdF4fkA8VfW5Egy35IF6opLNE0lcwT0NRsG+BlLbHSQkeLY1dS5SAQxE8wOTBtcjNhLuqKYv+ps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6117
X-purgate-ID: tlsNG-bad1c0/1778497788-89D85A53-F698FDAE/0/0
X-purgate-type: clean
X-purgate-size: 3699
X-Rspamd-Queue-Id: 6F52650C824
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:cardoe@cardoe.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
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
X-Rspamd-Action: no action

On 11/05/2026 10:06 am, Orzel, Michal wrote:
>
> On 11-May-26 11:03, Andrew Cooper wrote:
>> On 11/05/2026 7:16 am, Orzel, Michal wrote:
>>> On 08-May-26 23:29, Andrew Cooper wrote:
>>>> The binaries/ directory is a composition from the artefacts, and also used as
>>>> a working directory for most of the tests.  If the very first artefact is from
>>>> a root container, then the test must also be a root container to use it as a
>>>> working directory.
>>>>
>>>> For arm64, the existing linux-arm64 artefact suffices.  For arm32, pull in the
>>>> microcode-x86 artefact as it's the smallest available.  This bodge can be
>>>> removed when all build containers have become non-root.
>>>>
>>>> For the qemu-xtf-dom0less-arm64-*-xen-version jobs, use *arm64-test-needs
>>>> ahead of alpine-3.18-gcc-* (as it's a root container), and to deduplicate
>>>> the *-export dependency.
>>>>
>>>> This will allow us to change containers to being non-root one at a time,
>>>> rather than all in one go.
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>>> CC: Michal Orzel <michal.orzel@amd.com>
>>>> CC: Doug Goldstein <cardoe@cardoe.com>
>>>>
>>>> We should also stop using binaries/ as a working directory for the tests, but
>>>> that gets very complicated very quickly and I don't have time to do it at this
>>>> juncture.
>>>> ---
>>>>  automation/gitlab-ci/test.yaml | 10 ++++++++--
>>>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
>>>> index 8770c523e228..517af1732437 100644
>>>> --- a/automation/gitlab-ci/test.yaml
>>>> +++ b/automation/gitlab-ci/test.yaml
>>>> @@ -15,6 +15,12 @@
>>>>    - qemu-system-aarch64-6.0.0-arm64-export
>>>>  
>>>>  .arm32-test-needs: &arm32-test-needs
>>>> +  # Bodge to ensure binaries/ is non-root.  Can be any artefact which comes
>>>> +  # from a non-root container, and microcode-x86 is the smallest.  Remove when
>>>> +  # all build containers have become non-root.
>>>> +  - project: $ARTIFACTS_REPO
>>>> +    job: microcode-x86
>>>> +    ref: $ARTIFACTS_BRANCH
>>> I don't see it being removed in this series even though the containers are non-root.
>> Correct.  The Alpine container still being root is discussed in the
>> commit message, and is why ...
>>
>>>>    - qemu-system-aarch64-6.0.0-arm32-export
>>>>  
>>>>  .x86-64-test-needs: &x86-64-test-needs
>>>> @@ -569,16 +575,16 @@ qemu-xtf-dom0less-arm64-gcc-hyp-xen-version:
>>>>    script:
>>>>      - ./automation/scripts/qemu-xtf.sh arm64 mmu64le hyp-xen-version 2>&1 | tee ${LOGFILE}
>>>>    needs:
>>>> +    - *arm64-test-needs
>> ... why use here is ahead of ...
>>
>>
>>> This also pulls in Linux image and rootfs which XTF tests don't need. I think
>>> it's much better for a test to list the actual list of its dependencies.
>>> Otherwise you are asking user/developer to dig into the yaml.
>>>
>>> ~Michal
>>>
>>>>      - alpine-3.18-gcc-arm64
>>>> -    - qemu-system-aarch64-6.0.0-arm64-export
>> ... the alpine inclusion here.
>>
>> This can get reverted once the alpine container is split/reworked, but
>> not before.
> Ok, so once the Alpine container is reworked, we will get back to proper
> dependencies list.

Yes.  I hope to do so for 4.22, but the alpine container needs more
careful work as it's also used by the QubeOS hardware runner environment.

>  In that case:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thankyou.

~Andrew

