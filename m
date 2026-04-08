Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HJFDC4l1mklBQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 11:51:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9095F3BA23E
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 11:51:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275566.1561350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAPZB-0002t5-Cj; Wed, 08 Apr 2026 09:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275566.1561350; Wed, 08 Apr 2026 09:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAPZB-0002rZ-9M; Wed, 08 Apr 2026 09:51:21 +0000
Received: by outflank-mailman (input) for mailman id 1275566;
 Wed, 08 Apr 2026 09:51:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wAPZ9-0002rT-NH
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 09:51:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAPZ7-0054yK-3D
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 11:51:18 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d62514-5cb7-0a2a0a5109dd-0a2a450b9b9a-16
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 11:51:18 +0200
Received: from [40.107.201.46]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d62515-bca8-0a2a450b0019-286bc92eff13-4
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 11:51:18 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH7PR03MB7135.namprd03.prod.outlook.com (2603:10b6:510:2b3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 09:51:15 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 09:51:15 +0000
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
 b=gDVtJ6Kqq+io+1yx/DxhVG7UrUlthBR2X3NHbQDk282ogMULlH0FTAwH4B+qKXGfTXbfWueo0XHv/nVt8WZmjYfuQEG6M39eQiLdWLTZqOHVGOaXDeE57uuZvimd8YAvNQe2I50byRDkdiwidWADLTCYQSPCS65mADcsBqBbT1vN4Fak2Iq42FcfnlOFJHUuBr/JbNIA62YlkzK/ZVvMWWTtTlM62IhVv3SAC4qDu3FJFrSi9PuzVAZz86Tl/y1sXB0ho7pQYC/Fw1heMIIIi2ajJRu82PxhyR1t5hm6eNGBDfVV//TmAcztKj1JTN1NWDd/OmcjeM7zYnOxFuqwuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyQ6vquH4hEhzKWsUhUTr+mSncIo5TDiuXFQYOLH/oc=;
 b=GbW52Zb0PO7zCQKdB/EacZ8uCkiAaY/q07xI6bs4mBjGCNnYi5WejHPsk4iAOWGnqkRz4dXjoKDFNwZneNLZ4zKFCKfLcUhiPT2kGD7F69LDuxEuvEjg2Qe5zysU/+CP9xgvLbZkh4dFBe4cu34GqEj9v2cuMUEQLaqp0f9fVOK5F9dfPTEFOjfy2WikMNzNQSitBuDnc4WdLUT4DfrwP+sw59HCPJTG9KN5QpAh0mbh/IH1s+3xguKTyQaaNI1+tWTHrLy/77VuBb7JCAxNcf0rSm/y36VXkAVcAfZMrYMs/CwDcjHtj8djtUXrdqEuxR8rJNNSU89wdeBfU7UOxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyQ6vquH4hEhzKWsUhUTr+mSncIo5TDiuXFQYOLH/oc=;
 b=Fv6DASk64GMo354jCoTNcnHMd50mr3Tzk4N73vHsfYM5uhuzICHuj0HYkDn+9CRS/GNH9hs+zVZ3fzBN1YOfM7aXOQIjt3fj4/svqr5ziZobSbDESs5tt/uC4RSGgNo6GR21cZdbUWlADiFiECVISBJk82jlo2ViLW2IYjlLRsc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <14185c87-84c0-4019-a3f6-50587b941350@citrix.com>
Date: Wed, 8 Apr 2026 10:51:11 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 0/2] Final series to make Arm MISRA allcode green
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20260407103434.90838-1-michal.orzel@amd.com>
 <68cea196-efdc-4481-9e4b-bb450bcd2071@citrix.com>
 <bdb8e991bbd200de2f0af5991304dffb@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <bdb8e991bbd200de2f0af5991304dffb@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0489.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH7PR03MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cf7f9b5-b2b4-4ec8-2c1b-08de95545fb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gtidyFuMfpBuWzp5ZMLncsSazkGE2W84npQlqroJJZ+nakSxQTT3Ky65TzE/WTMnCK5ju86aYoICAkZq2y1uhaq5xsp7QlKGpSaR5PWBp1r7h7F2g/2Y5dCxoMgJxX3oOn4S9MSF2CPIqXtCyOcxGuhnwwN7EGZnK65+h2uoXv73q47rkP8o0I0IoL5qN0nTa9AWdi7s30Q2vYdjrsbzvZoJLbvJt+bhNVNI2ej6A5qIBSgpw/LwPq+HhR9HMlBwP75AHNLGGPhLJphw+9gIEcli3coYhNwX9MdaNePbcK2NHZq2pEQJrK+gggNdPEmGm0TxnEoq1+MClC+8n5eNBi0DRw4CJ+VS6deL9T42SwMlIKTblHPpkYS52WajGEXi752/Uq317xLihkdPfAw6sMlcnc1QAyJi6sQoaU2s0CVrdoNONFPxlRMCZcphg1Vk1ynasqSKPoSit+nKDXi0sWBMjQj/SpGWsyb2OBEGN4x4JiRX/DJDRn4Fjmy0scgddmNRAFxE+VJQwbF0+DPln/YmuxNeS6Pej2YI4XrP8/UMG6PpwweRPK7Llm//PhGaXs872pAoG8BrmyItlb8fWOkLlpDjjPoDf50GPjfufaEDfEtuCzm/jrM1bqKGKbteuw34oT9UqPekyb1n1KlD8zn9gWJgeY636PSc4gGVtAK/iQF8YJ8Ei9bUp0AtocW3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEM4ZCtvZVU5dDhLQWtTNkk0a0xBc3FVQzBLaDVqVkxUOUdzYjBqa2tEU0JZ?=
 =?utf-8?B?UEpqc3MzN09XaDdMQVhiU3JFMmpnQ2NSU0ZKZ1l3Q1VkYkdVTlVuYTFvbGlq?=
 =?utf-8?B?SWR3eGN2RXErQloxcVBZZHBybWF4VStNaFhibDNqR2oxNDNFRCtNOVpmL0Ro?=
 =?utf-8?B?SmJBZmIyWWdyYUlqdzBzOTRBd2FIaEh2RUNSMFJnL2FIVzlSNVJSV1FaRmkv?=
 =?utf-8?B?dmN5MkNIME1vOTB4dys1VHFYVWN4VmtDQ3Ivbkd3c1Q1Q3VHREEwRlZQMHE2?=
 =?utf-8?B?cE9PK3l6a01XYk5hYWdzMjQrZmhzelNlZUkyU3dFSk9wTUVvZDk3cnovRzlh?=
 =?utf-8?B?TzkwUk1jbXArQ3NlVk90U3lGNE94UGYwaXVIbTdKU1R6cEp4cktMUzViQ0R5?=
 =?utf-8?B?UFZLeHpPdnRlanYvZjZ1ZXhXSzN5RXJKTlRMU2tadFprcmtGUWlSVTVUcGN2?=
 =?utf-8?B?NXhKa0VPSmpxaWJKeHpoYkRKRU15WGRwZkFSWEt5Y212RjYzMXpTMWRSZWw0?=
 =?utf-8?B?QURrZ0JWM1NuNXFwNW56dXpBWUhkK1BIcHlGUzNpc0R5MUlvS1dmVyttVmpj?=
 =?utf-8?B?VkpnVVAzbU1ndzV5a0s0dDJpVkJ2RVJkZ09zQ3R1a2wrS0hLSnJoNXVadU5w?=
 =?utf-8?B?T1hoK01hdVB1aDV1UGdDc1VFa0E3eHFtUlMxZnk2U0NCa0c0a2JuZkk0SHp1?=
 =?utf-8?B?Z3pkNmNnQmxEZy9SUVdJa05qUFhNWUpKM3RwVGYxOWpacFpaRWRySGUyU2Yz?=
 =?utf-8?B?Z3ZwRDlvTHJXbkhvbnNnM2M0TUFZcVdLSGxGNGhacjg3KzFaRjdDc0VlVllY?=
 =?utf-8?B?M2NHczNwT2xUMjlKVnY4TDRBcnpmUlZ5ZGxwZU1oUDIyczhuRFZPMkFJbXd1?=
 =?utf-8?B?MGZUdUoxL29TUDF0V0o3K2h0MFFqVHJqNTN2MTZvbEtvSlZsR2ZyUHl3U1or?=
 =?utf-8?B?bFhUUGtiVGVQNTYxL0VOYUNtcUdKa1U5ME5wcWNFODJsd2EzaEpFNVNqTWxB?=
 =?utf-8?B?MUcwWGY1ajlmcTBEdExsRld0Z1RKWEdEMVB1VUdJblF2RmdwaGsyWDNKY21P?=
 =?utf-8?B?R1U3TGZPeDJ2dnZBcnBkakN2Q1J6azQ4MWI4cXpGY2VkMWN2NzcwSTJ3bStR?=
 =?utf-8?B?cElvamsxMnE3elF4YWhBRXJiR2Q0cFRFY3ZpQjhSWjJ5UWlvN1MrUzZ6RkZJ?=
 =?utf-8?B?VVdmWlZjSjVxY29GSWhYRW94cXdORWxXWWxGRkM3aVRLdUYxdVhMY01veGdq?=
 =?utf-8?B?QjZyTjRCbC9HSkhsVEhkT3RjdXIyVDhPaVJ3aGp2MGUwNzBXbmdUeWk1dXB3?=
 =?utf-8?B?cnRuUlp2N1FRemtNMVVZRHpkb2FUaW5HK2lCTUxRRnVQUnlLQ3ZsazVoQVBy?=
 =?utf-8?B?WmJwSGxwZjFKRG5YdmlFVnhleGQyTGQzWjU3VTlDUVFlU01acVZiMjhsclVh?=
 =?utf-8?B?S2F0V0JrNWdtSnY3R1RSRTRUb2F3WmJWRzdTV0s2bnIrUXNXd0NwOE1WRVdi?=
 =?utf-8?B?SUpPT3FxdTl6Zkgrb3lMeko0T09wdG1KQU5ybEFFWjFYdW94cjRVZXVJOW9C?=
 =?utf-8?B?eWd2elZkTmMvWHFIc2VuMXUvVlNkZ2JrUlR6VkhtT0llTEpUWlZrWjNhdFJR?=
 =?utf-8?B?RGZrYjVPdUlKeWkzdGlvRTlkZWhSSkdsaUpDNlpROW0vdUdEVjNjQmhNVVVG?=
 =?utf-8?B?UCtjaktxdFVFZjYydWR0QnQ5Znp1RC9SZ08yeFkrLzJrbTlBUHNkRVNvWFN1?=
 =?utf-8?B?b3A3eFJhczVFOTBRaU4ycjRBL0o3dHNYZURLWVdwV0VGNHNvWDdqd2pmdmdV?=
 =?utf-8?B?U21TTmpGSGZhZTN0THlFbXhNci9GOEVmRlVVaG5pNFVqczB4REViMG9QOW5r?=
 =?utf-8?B?dGZzd3pOQlFRYWYwVVN1Y0RhN1FnTE1ldERobmxVcFVBL0FLNHlIb2plMUdN?=
 =?utf-8?B?dVFaYjlQTEpSb3FtcjVRcGRrbzFmaFNuTmJYVVEvZUtocWlqRE9qbkVyY1lV?=
 =?utf-8?B?NG5PRlQ1N0huMzBvUzQrSmJrRnhxVVZ4MGh4aFB4MTROMUNBUGF5a2hoVjZ6?=
 =?utf-8?B?cm5HcVBoRXFqa2xsa1FTMFZSOXFVSXZsS1JaWmV2bUVLd1J2bzhCMUZpWlJ3?=
 =?utf-8?B?dUJFYlNMSHNvNExlWS9saU1YbVU4OEtKNmgvVXVNc2pUVkw4b3BIc3BkTDZC?=
 =?utf-8?B?K0cwVXowZWJyTFVLWWNVd3BaZkpqUG5lTmZnUEV1VXdveXpveVUvOUxtS1JR?=
 =?utf-8?B?ZS95a2dNMmIwZUQ5ZXZBemhUUnYxN2hSSjc0RDhnT25FTHRod3NJcEc1cFZ6?=
 =?utf-8?B?V3dlRWE1WUQySjBYRm45amxKM3lPMCtmQU42TzFnR3VhRGYwRHlvUyt6RXEw?=
 =?utf-8?Q?CPNVLUWfGGhIzDck=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf7f9b5-b2b4-4ec8-2c1b-08de95545fb0
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 09:51:14.9969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62Snx6t+0J5kjvw/ZtOzryUyv4Y4JMdL4vsmD2MxCaDKC0yZmqDed0DPZYCBN9WQrUJXyf3tng/8F4F0/ZJNPuorFvLy/ECROfurg7z7fuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7135
X-purgate-ID: tlsNG-42698a/1775641878-EFD472A1-8637F84E/0/0
X-purgate-type: clean
X-purgate-size: 1398
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:nicola.vetrini@bugseng.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url,citrix.com:dkim,citrix.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9095F3BA23E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08/04/2026 10:46 am, Nicola Vetrini wrote:
> On 2026-04-08 11:22, Andrew Cooper wrote:
>> On 07/04/2026 11:34 am, Michal Orzel wrote:
>>> No more regressions for clean guidelines:
>>> https://gitlab.com/xen-project/people/morzel/xen/-/pipelines/2433943072
>>>
>>> Michal Orzel (2):
>>>   iommu/arm: smmu: Fix variable shadowing
>>>   iommu/arm: ipmmu-vmsa: Fix variable shadowing
>>>
>>>  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 6 ++----
>>>  xen/drivers/passthrough/arm/smmu.c       | 7 +++----
>>>  2 files changed, 5 insertions(+), 8 deletions(-)
>>
>> If all the violations are fixed, should this test be made blocking?
>>
>> ~Andrew
>
> Only if they are also clean on x86; otherwise an arm-specific list of
> clean rules should be made (probably better). @Michal what do you prefer?
>

All I'm suggesting is this:

xen.git/xen$ git diff
diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index 4e9af9d60224..f01798c5dee6 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -149,7 +149,7 @@ eclair-ARM64-allcode:
       CONFIG_STACK_PROTECTOR=y
       CONFIG_UNSUPPORTED=y
       CONFIG_VM_EVENT=y
-  allow_failure: true
+  allow_failure: false
 
 eclair-ARM64-testing:
   extends: eclair-ARM64-allcode


so regressions become blocking.

~Andrew

