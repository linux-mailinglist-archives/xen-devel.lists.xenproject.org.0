Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PRNDkAcxWnr6QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 12:45:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E738334AA7
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 12:45:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263807.1555640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5j8p-0000e8-2J; Thu, 26 Mar 2026 11:44:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263807.1555640; Thu, 26 Mar 2026 11:44:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5j8o-0000bl-Vn; Thu, 26 Mar 2026 11:44:46 +0000
Received: by outflank-mailman (input) for mailman id 1263807;
 Thu, 26 Mar 2026 11:44:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w5j8m-0000bf-O2
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 11:44:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5j8l-008Wk6-Uj
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 12:44:43 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c51c11-5cb7-0a2a0a5109dd-0a2a450bd9f6-44
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 12:44:43 +0100
Received: from [52.101.62.67]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c51c2a-ef63-0a2a450b0019-34653e43d5de-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 12:44:43 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS4PR03MB8376.namprd03.prod.outlook.com (2603:10b6:8:328::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 11:44:40 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 11:44:40 +0000
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
 b=kDGJheI4eKypSzI/NZDHV/W0mAZI9v2f2SaQp5D3qNHQQL9BgMmUQSL3pSvfLMHGx5KCPSgsfrCqlBA+/rTeUOoXWqyX/BPGA4Th/fyJHBqTPkk/vxGQecQlxIvZqaDAQhiXCemjrCqTCOSW4OVDYhMlySGSbMW400o4J2jWUEZDzwREo4AVSFQbbYT9MRdfug2PJhLF5AVpmXp+Pm8gtWBvkNNkyYDcQLx+zJPXiGe/pq/fmluTQ1kSteVCUlVSzvSorMburg7S/WhtgPCQjVE78+XCM0Yxae20MVF4CwOObqWX4rDyqQWxXRsWffl8b6/LiiVLMVu+AcBKnMwbwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYGwoJBqOjz3GfYEITrRmgAIdluvKemJVzO9E2/P/WA=;
 b=BwYl1suSjOYlvY7zuYKCGT933lCEbx6bOaH1AWwGsCSeRmVNLamoXg21EmU0WHeVPu+AiT/Ctom/L8VhA5NzwM4ZswiugSiw19QZXbLZdqRKay0fQ9RydJVCzUUVVv0XCShseel4TH1qaOJXb9ebQM7fUk413mfFKABc1Pym/OJ4b9vIGPXIW5nCA0W8onVhziwvYVxQDUr28KeAW6ZuhYOrpk8NbAGajEvPjBW/h/Q/9Umao4w4wtltHPMMNYo8ASmHVC+42XM1DS11gXX5MkBGVxQ7Uh+RtyRPSzssKdSKTM/88+seTUpTCc1uzLMTsbXdCM8f3xgJjXhz+iKkMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYGwoJBqOjz3GfYEITrRmgAIdluvKemJVzO9E2/P/WA=;
 b=D2+l421Zp50JRkYxle7q8VFlL6GJQK7bOOC/g6jV5pe5QyYeN02ggZK9vW8ZxZ+R0huYefxAf06Gj9YAvpjPrYH+bmnfw1z8zDLKSo/w2KMwg0/n/e0RWfCQV+kvuua5TBUrIBZiAXY1zczfQ2kXgfY3lg4cPiRSVLLRpdeXjmQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f58e1df8-2c76-42dd-bd1a-b2c93facfa68@citrix.com>
Date: Thu, 26 Mar 2026 11:44:37 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/4] xen/uart: switch ns16550 to use pci_sbdf_t
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260325145824.31601-1-roger.pau@citrix.com>
 <20260325145824.31601-3-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260325145824.31601-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0223.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS4PR03MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: d8bb1d1c-df95-4c0f-7909-08de8b2d10a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VNQnpRugTK+Fz2vNvHqFty3dA9GhBYxmZ6rY/bx4SgalHuiAp1akHyqFoELG2JquwFhNQ07FbqbfctJqxeoXZmBQHuy/pjo4kkaHA0x9WbtHu8ESP2sdDTH4MppY8mxu+BsBkTAxn5eK2Ext4TJDQLpxsFwzBKm1nOiNjD61quts55+b553H3oEuUoZfxU1PPKF2ov8Sdp30BFl4KRC+8eA4X0xkhcOkkT1o3ohHxWTpFQCpk20TFzJUhZ0yili4XCDEDIpxOZbjNqm6qyWuvR3fD6NfQ+ASxhCKCHSdBE4+Ywp41H2kJpO/93JlLE/rAnGU70/h74drH+mc1ZvRNzOh//5izdlv4yN5q6PdWqM2MEAWmkUtnCI8tLKUo7IDCCINJh0fbROeMmBbyJadFnAJdgahudGc9xzqv6pxggUSpjJmguHzLTqAK79ilJ4PG+/9Dr613uX9kbRfQXVgAXfnKnDDLQKqZvXVUIabkT+DKtBD0tpF2LJXYfrLhIvGxlNrK5R+udI/H5gGwsNfJulbk5myGzsUBwDWXPYhQmQ3nU2wfXaQzTJG0LXkuL164fDzRyp1uDDhTZ9vZE9Q5zW3Qdss7Mz7j4h75gdF/8GD756S0Ef/6WXpXtFbDRIdJLzftu8HJtHWc1V96pk8RMiLdSi0akYP+GRz6D4bGmauy35wS3OogFJzNqTMbhmVJCUhWI98cFokBj+0G6q06jNJhTnGJskDl8kliW74IQU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1ptN0ZocVJ0TDUrZUVJTWxVSnBKZklzVzh2ZURIWEVVYi9TMklleU9qSWxU?=
 =?utf-8?B?cjBXLzlZaEw1Q0FJWUdiSys1Q0p0bmJzOGZSSlc1THpRaXI1ZytHVWdyQ2Zq?=
 =?utf-8?B?c1A2ZXo4WnBPaXF5WEhUdEFnMkh5b01DenFuRElmN2RBOFhScHpIemt4dklF?=
 =?utf-8?B?WnVsdmtjM0FsZWMzYjl5YjZXZjU5SWlac093bWFtSGFEcUtWaVBhL0xOTzJL?=
 =?utf-8?B?RzhXSnpjemtXMzBZdEVtTlErUmwzT00vZ09BVnN4T0NxdEpxbnpQSlgyUGNG?=
 =?utf-8?B?cXN3V2dVNnlaSm9Od3Z4ZTJSZ1V4MVZHdER1VkhRRzdOQ3duS0tYOVBhNzJK?=
 =?utf-8?B?bmFxdmh1RXlWOWNqQzlHRTlLaW5TcDYzZ1Y0RHFqWWRiZ0RNZXEzTi9qVWJa?=
 =?utf-8?B?R0d6OHJUNTlqS05YSkt3VUJnZkpjS084cDdSTDBqQXR2ZnUyb3pkeWU1c1NH?=
 =?utf-8?B?R2pWeWxEV3crZGZpSkhGM3AvRlJkT2YrTEFyaXh1bFNmSVFtb2VxOFl1Nm8r?=
 =?utf-8?B?QWNoYVZYUUhYL2tndjI2MHJMZDdUVS9GYWVxbkowN1NYTTNZNU5RU2JoMkwx?=
 =?utf-8?B?UmE1YmQvNk1OT205alk0K3p0dWE5WldtVzVFWGhKd21wNktFbWpmTUdVcjY1?=
 =?utf-8?B?OTlWZ1ZMNGxMZkFzMVVmVTNuNlViaTREb1BwZlVEc002VWphS0d3SVVXV0ZC?=
 =?utf-8?B?RzdUWnU3R2xJWHJUSENZT1dPcjBWV1BsSTVwQXBFNVZRa1RMR0dLY2pzV01k?=
 =?utf-8?B?d2pDVStqUE4vaFZhMzZsYXp1d3RhallBd3pJK2ZtbGVCbi9HcWRSdlgxMzBO?=
 =?utf-8?B?STRWbjhialNibWZtM3ByVWMrcGU5YTNFSExNVjB6ZGVyKzZtamp5WnJaRVZa?=
 =?utf-8?B?ZXdaWDNxVmhhZjZZVVpsSUhwY1cwZlNwamQ2dmNHR2NwQW01em9tWGpvT1Qz?=
 =?utf-8?B?ZTlTTUdRdmduOXJFOHdpaFZ5UHpXTGZWWVhnVW5raWtvc05pWG51cFZSZCtT?=
 =?utf-8?B?citPVzNIaVQ1NkhmR0x1RWpsU0wrSDhJVUdhdjVCQWp6TWNZcEFLdDZ4cUZO?=
 =?utf-8?B?Y2E0Y3JQREdhclFZVHpQckpneXZ5dHZrc3Q0VGhINTFYNW8vNG42NTlpQVlw?=
 =?utf-8?B?NTZ4YjlrcktZRmNGVGNlZ2pMK2NMLzhQd29LcTNoak5QTEFWMXFSTUtxYlhU?=
 =?utf-8?B?Q0dSY3U5c1VlUmpYS2pzbGhNa2NFWGplam1NNmVnTW9UWGVIbFZ2R3M5SUNF?=
 =?utf-8?B?bU1QaWhwVzhubTBlRmVoWWxsSlpQWnpneWVyc1VST1Z1NDk5YVo5Q0JZeVlC?=
 =?utf-8?B?UXQxT0Y4U0tqNGduUlBjN0xMcERGUVBreGExSGdNUnNoVHNQUGVybzlNVVF2?=
 =?utf-8?B?REQrOGI0dGJBWnBRRkkvQVhrMGh6Sk5GVndUZlpUMlg1aUdlY2pLYlZpWEM2?=
 =?utf-8?B?QWdMN0NJTHFMaVhnOTdYMUQ4M3RmN294RTlrK2hYcTJjbkpjMXovUzVTOHNk?=
 =?utf-8?B?LzdwU3BYMkZaWFlJblRZdkh2UDE1RXdOWEVlMWtET2QwM3o3TG1yZ05RSnJh?=
 =?utf-8?B?Y3BYYmFydXM1Ry8zcXpqUk5CbFI3K1lFV1B1NHpSckgxMGNrRXhkSDRLVXd1?=
 =?utf-8?B?dCswY1gxNk5wNWc2L3JBd0VWdzQ2ZGk4a1VFMG42S2d4N2FVeTZFbUQydFhR?=
 =?utf-8?B?V1VYRzBjMmVrdDJKVXlyYzA0UXd4M0hUMG9IYW9FUVhJYnVFMFlMcndlR2pV?=
 =?utf-8?B?dlFiSXFQSGlLTm1mQ0lDeTQ1SnN6akd3LzZlWGV2TWx6VVY0Y1Z4MkZMQUNN?=
 =?utf-8?B?ZEdXQ2lqMUN5UlhxaGNTa0ZGaVJxVDM0THRSVmEwWjN0d3A0empXcVk5ZXBr?=
 =?utf-8?B?WlRtY0MzSG5YbVp3aHc2blZ4c0dCQzc4WURxd2NxUmtRTVRQSFVWcW03S0dQ?=
 =?utf-8?B?dnptUW1DWVpxVGFRM1hEbmIzYXpXa2dseUdwWVl4TS9rWG5OcGZrRVZBNUZQ?=
 =?utf-8?B?NWRkUkhTL0tjVUtzR2RuSUViQkpJenYxMEZGaVRnK2dpQkU0c2J4anRVZnhK?=
 =?utf-8?B?RnhGd1hNUW4ybEZGQ1R3SUpFMEFkWk16OWNDOC9JQUtqZ3lIc1d6M3owR0dL?=
 =?utf-8?B?UVZ6cStwdjhaS1plZ0hER1VYY2ZHamhNOVQ4aHhsWXVNbTh4dllSWlltdWxD?=
 =?utf-8?B?MEx3R1R2SFkxeGxTREN5MkFJVG5NdnM2UytRYyt2bVJYL2dBQ0FTMElUNUVL?=
 =?utf-8?B?aFJnVUh6MGhYekJhVzZhVFJPNXJQYlo3TnpwZStJL2E1Wm4vS3VDK0FYTGNV?=
 =?utf-8?B?UndhSnc5bktLcER3dVcySVBIQ1dVMlpzQW16ZmFHdEM4ODlxL0FJNDhIMmlJ?=
 =?utf-8?Q?ckvPSZgGjg6+oMtc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8bb1d1c-df95-4c0f-7909-08de8b2d10a4
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 11:44:40.4155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llNlHgVwk8sxJ6hzHROxl5VUGs5zGp80xaDQn5J+kfq7xemN89RX1RFHYvx4Us1r6dET9D8Ahqfc8HJ4ZbmvA4A8aj+tPCR7u7t+mNp39P4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB8376
X-purgate-ID: tlsNG-42698a/1774525483-A0409112-1050F90D/0/0
X-purgate-type: clean
X-purgate-size: 285
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8E738334AA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25/03/2026 2:58 pm, Roger Pau Monne wrote:
> No functional change intended.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

This looks to be a substantial improvement, even if there is clearly
more to go.

