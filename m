Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KSNJnBp4mnk5gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 19:10:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD0641D6D7
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 19:10:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284651.1566317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDmgt-0007ns-OC; Fri, 17 Apr 2026 17:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284651.1566317; Fri, 17 Apr 2026 17:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDmgt-0007l9-LD; Fri, 17 Apr 2026 17:09:15 +0000
Received: by outflank-mailman (input) for mailman id 1284651;
 Fri, 17 Apr 2026 17:09:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wDmgr-0007kp-Pc
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 17:09:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDmgr-005Sgd-6L
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 19:09:13 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69e26912-bab6-0a2a0a5309dd-0a2a450ce9ea-22
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 19:09:13 +0200
Received: from [40.107.209.65]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69e26846-62f1-0a2a450c0019-286bd141bbda-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 19:05:12 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH4PR03MB8017.namprd03.prod.outlook.com (2603:10b6:610:239::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 17:05:04 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 17:05:04 +0000
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
 b=KJBzCh57uYLzsZ7NX1qdzaace6I69RFK1wR51SIG60LNZWdt3q5qATJ2Gl9hUBjb+V8+dQ9XsGseIDzm+3/7QCiZ1IPmnZMbOfvGKynuITaEYUjJ/pe8PqD1OiDSQFtCi5fZEwm0lYDz9FHI3Z/sQHlO1N7LYJ1qD7e6+3N6OZ8JLgW1yofEO+qul7xOdH8KlGu1Z7yGuj19DVy4HyeSb5ehUiPH1/fUq5/fsKmc30jSWrz0C9+DFvN0Ka9RRY9qy8VB74n3rgRNoeDu9kdDEFvJGghVEpUtFWk/AdngC6F457jagHkgacCxVTDQM/cqjoHw/ymt0ww9LUPsM/4Ukg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfnXQOZbuWlbAbpL0KR1LXfz9Q/M5071JFAcXbAQcXo=;
 b=ka8Tfmp0YMw/p/aMzrr4UJ3x6Zj1AhbvWsKVd79gMJwlK6sBDWcCkONXg9tBQ+YyVkrCL0LkWc2OG4w2EyuFXTh/rhrdQui8I3/uCaPRl0GLoyJPE94RSilsk6bppTe7MNJSbLDEIWYGVY2L8BozZJgSoTfVcNfghDQwoBJOYaLWTA3iTeYro2P/ck7F4pNNAuWJ8dSZJ5L8EKrsWwnpEl9T4bVTOHo8w/ua24wX1IeXZCcEtYfo6XlgsdjfsL0ere6GECpMQAWJNJe2dxj787GBuVAvi01JxmVxnL1gKfHNbz+wkPgnMo7+Ov4zR1d4f91000z5Z9g/iwxlyIVV/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GfnXQOZbuWlbAbpL0KR1LXfz9Q/M5071JFAcXbAQcXo=;
 b=GKpjLY32/SUWE99LFAgP4HvUnUM3yzNciVeSYzXGnBMw9FGNaTnMnoFjZtICVm7kVKVkgpH8X5bm/vxs4SIrQ5GbsxShElfGJxqpMahjB7Enlfkab+kCe8N7hEqA5lSlTitE5SdMa+bme5A7zINclruD1KpqC4Mo8ExD7B+hxpQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2688ce14-9d25-4374-83a7-dea3ee508f71@citrix.com>
Date: Fri, 17 Apr 2026 18:05:00 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/boot: Force error checking for reserve_e820_ram()
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260417160828.526063-1-andrew.cooper3@citrix.com>
 <85625a6f-8d04-4863-8f74-461c9a85464f@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <85625a6f-8d04-4863-8f74-461c9a85464f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0457.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:398::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH4PR03MB8017:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6edd5d-4b63-4aa9-f80b-08de9ca37824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	NhUYMPJtpAyZAvXBFt5ihm5DvWsQdsCFkd3UbBm/J7hOG4QHYDmxaU63dsQpcNU9jB3Wz8aGNVtQZOQwXdWZoJbOH6IpEFMqC1/122Yy1utql2nkpa/a2zzFeOVORAKZ5JltaEY1XzwNdhnhR3/br7nPUfcvnInWTt3wudXX4+6fr/vHlPoxWJDO85kYiTVkbxOmmec+GP21UKd1BnYsQfYY9gSeg9O7SFb0MzQQxSWEeBvyxL5aN+9rOjk/eiqdwrRzFA2DkY8YS0uRqRAzlycR0DkCGUkml0leJDVPzSSP48ep0Ta0tOTo2rnu+bTsggy7JiTKwwjyHvDlg/DjVHNuqArhvCFY4ZlKCFubLGn6iCYbIGq3wjcJ5FseuYxLa4d7WO5/dExobN19ZDe30Y6G0cPNRi04xABK73Q2RRJ9XcsL5AZrXkGq2O2GqNBCAR7JwXyf0i10z7QU+QJ65ZvFM5wXezVv3V3jeA6TQ8MRrKrMTbdAM7GOLTFzThx89Z55Tp5oitIArGP6TRgVQQMGNMrzjnnOrU+4+AJduhFOw/V2FCAxRCQfZrvo/K6CiQ81TqLu1akjnwKfoBxp4NS1Xgeg3f2iT35ar46Kbko04iqpuUN0Hbu9YkRyQIHC//DSxII4ekxiaIip3A61TzFPuVmipUDD+e4d1jPjGVU3eKP4SLJaChwNd2tJfQWAlShvF17jRNu12ohZjZbAiTcL6tuRHBZ0UzGxpTXDX0U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0VWbkQzTkpwUWE1YXRiUlFPc3lTK3ZVSFlLTlpGQUNhMGNEQUxwS081MGt1?=
 =?utf-8?B?WkZ3TEdneEFOY290QnYzOGttRHd2ZHlQYUVJU2dJa0g5d1lNaUxHeU4zTjVq?=
 =?utf-8?B?WXpOaUw1YlVWb3NWazMrZTFGQmgzdjFQS0RSU2FwUjZNN1lZYmFuckJhQVkv?=
 =?utf-8?B?eVQxNFMyZWxzR1YvNVowUXF6T1QwcWJxNE9ZN1pPaE9VTkZueWFFKzlBZmZm?=
 =?utf-8?B?NTN2V1p6czNLNldnejN3SDFVUmRqUGhXdFFUU2FRSkV6NmwxN1pGNVBqMHVa?=
 =?utf-8?B?UEwyWVNXZXRtUGJkYnlBdWtSVmZ3ZVliTVlhUWZqcmVsUlZnMnRjbnFkVkVj?=
 =?utf-8?B?Wi9rT2xUdDRyVlBCYWxncEM1bUtiTDFTNzE5Mlg4K09OczZQWlpWb01XemZ3?=
 =?utf-8?B?ZVI1bCtkUUhCcGFxSWN0cWpDdTJuV1owdHpUWU5wZ1E3M3lIVGhNUEZlN3VQ?=
 =?utf-8?B?RjJTdnpzRVFuVXFpVVRRcWNNeWNzamZpSHIrK0VkUWpKN1JoQ0FIMlorcFdI?=
 =?utf-8?B?ay9OL1RFYVc2dVZNSkEvUnppUFV6aDd3ajVyaHN6dFFIVnBJckRqRzU2Z1N4?=
 =?utf-8?B?Tk1HbzZkMGhiNVAzc2NlSFZNUzl1UkJQbVdoakVLT2w2eWtldE1YbTNDQ3lr?=
 =?utf-8?B?UVozdysvZmpvQnFXMW9tcDJxZnFlYWxiOFZpeksvRTVGQzl3TXJMWXhzOUFk?=
 =?utf-8?B?R3dEanZFTXVPVms5NFFBY3JsMTRNSDhrbkFwMy9FOFNOczdIZEpvbm80RFJo?=
 =?utf-8?B?ZXp5ZG9xVUkzdkEzWkxneGlFYk9XNGhEZFBGVzBuMElXSFlDY2VqdUZ1VGdZ?=
 =?utf-8?B?RkJxSGxIdnJ6YVdxcHZzOHR3ejdmSlpaTjRaT0d4N0ZuM2ErN2lCdnV4TWFQ?=
 =?utf-8?B?ZW9JOUJkZlorcWVLQ243QkhsOG5RcnNnWkhWdk85bVVRUklEUC9QWU1JZVph?=
 =?utf-8?B?ZWNFVU5RU3dUdzlYdnZreXFqVU1QMnV3amUwY3F6c2ZIN21jcURhdnhoMGFy?=
 =?utf-8?B?MG1PNno2MUxjbFlyb1hVWFY1T1I5Wm9PTENkZGRtTW5LOFZNcUo0UldleDRB?=
 =?utf-8?B?Z2xqdURKbXZud2NBSFZmbkM2VjdKRUlJZzNCZ2ZOdnh4WTE0MFVBbVd3L09h?=
 =?utf-8?B?YnVtdXFlT2NXZ09jRGRvTWJTcktYVTcwTHBtbEUyRlRmN1hnbU5HbFdXRDh0?=
 =?utf-8?B?azFnRkpwL2xWUEdPQVluZmlKTCtlRTAxdktySkhDNVZvcDBqSUtpazZCczZT?=
 =?utf-8?B?TWJqdWJTM3R0UXBWbklvdndkc0sxMDdVK3Z1Rmp3VVYxSzdmSGJSUnhLK0xo?=
 =?utf-8?B?bVlzMDVGeVJlMno3WnQzMVgxQjRRNWxNVUFBR2lmOEFMNWl0ZGhESnZVcnMx?=
 =?utf-8?B?SnZRaGpmb2hESlZzeTRtU1pqZC9BaW9sQ2VuN2p1YWFRbEpvUktuWTJMTkgx?=
 =?utf-8?B?eFlYTTczdjFIcmpBVmVMcVBXYzhKUEo3R0hKYjVVa3ZWcllVUk5tcS95M0JC?=
 =?utf-8?B?VDZjUWs4VUNZdDhDU000bWdwS04rQ0VOcndobUV1ZytKWW84RHlsbmNXd2cx?=
 =?utf-8?B?Zk1HTG1RaWRiQU1ubEZUZFFiN2REK2xkOURBclFzQW40WUN4bjBENnVMTlJa?=
 =?utf-8?B?L0hjY3RFWjhBVGt2VFErcjV3eXprVmFCTzVRRDNuT0JwT0x2dmt3dXd5WWRI?=
 =?utf-8?B?ekRDRnhPbTFuYW8zQjBSdm90MUZCNXNRazZJWnBEOE0zejc3dk8zVlFacjNi?=
 =?utf-8?B?UjJCVkNoRzBGUWZHODFzK3NmSm5KMm83OXlQUHVFTkJVdVR2S1M4a3hOa01Y?=
 =?utf-8?B?cS8zQTh1ZmpOVkZZN3ZGMmt4RFZYa0hiMjNvdlJERUN6bkJzMnZjYklTRzl4?=
 =?utf-8?B?alFqclgwUEN5NHJJSlNqS2tEOGZFMy83UHFneDJ2VlA5Zyt0b1F6REQ0V1pj?=
 =?utf-8?B?WHJSQ3FNMHRUbWhXbVFubExUMTJKTWlRWkpXTldaR3MvUVI5cGQ3RVhSWkNt?=
 =?utf-8?B?UmxHSDd2bUZ0TktFcVRsajZkMGxaOVZhS2tCVHkwUjBlWjhGU2NQYXV6YnNt?=
 =?utf-8?B?clhWaUgwVmJjdzZQZWdKd1VlTDJYTzQ5a0FzdUNiZWJ6TXZ2R0VBRzRaY0tY?=
 =?utf-8?B?ODY3c2pmc3Vkb29pWENtem51eGJkMnp3dHVUK0lvYUJMQStSZFpVdkF1SmFk?=
 =?utf-8?B?WVRndG9ycnFDa1ZyUWFBVzZBc04rMVpjY1RoYjA3Rll1K0lYb0ZoSUhOKzc2?=
 =?utf-8?B?d05EMkxaeW83ZlJaaDE5WSszaU9pSE9FSmp0STNHSEFHeUVHRUFsWnhNVXYr?=
 =?utf-8?B?MjRSWm8yNmRpbVErQ2Zvb2hDUW0zTmI0TlF6cHJXcnRxSW5RKzdGV05JVWtu?=
 =?utf-8?Q?Fz7E6K2rxdAllKhA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6edd5d-4b63-4aa9-f80b-08de9ca37824
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 17:05:04.3317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84IycofJRCecBD0jQn6nQZNGryNPxGR5bBe1dv4G7LbcXCTSXBexoTfGrTkUEaFrZueKwMqlcQbbtSoLV/4eCbkH8L8VBug/FnzRbQSf4l8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB8017
X-purgate-ID: tlsNG-d25034/1776445512-F7811CF5-61FD4742/13/0
X-purgate-type: clean.bounce
X-purgate-size: 4678
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,vates.tech:email];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
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
X-Rspamd-Queue-Id: 0FD0641D6D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 17/04/2026 5:27 pm, Ross Lagerwall wrote:
> On 4/17/26 5:08 PM, Andrew Cooper wrote:
>> Failing to mark Xen as Reserved in the E820 is catastrophic; RAM
>> regions get
>> handed to the physical memory allocator for general use.  Similarly,
>> failure
>> to mark the boot modules as reserved is not going to result in a working
>> system.
>>
>> Mark reserve_e820_ram() as __must_check, and panic() on failure.  To
>> avoid
>> opencoding the range in every caller, print a general failure message in
>> reserve_e820_ram().
>>
>> Reported-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Teddy Astie <teddy.astie@vates.tech>
>>
>> Slightly RFC; only compile tested so far.
>>
>> There's no obvious fixes tag.  This has been many variations of
>> broken since
>> forever.
>> ---
>>   xen/arch/x86/e820.c             |  8 +++++++-
>>   xen/arch/x86/include/asm/e820.h |  2 +-
>>   xen/arch/x86/setup.c            | 11 +++++++----
>>   3 files changed, 15 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
>> index 872208ab3722..f09a01f0c50a 100644
>> --- a/xen/arch/x86/e820.c
>> +++ b/xen/arch/x86/e820.c
>> @@ -670,7 +670,13 @@ int __init e820_change_range_type(
>>   /* Set E820_RAM area (@s,@e) as RESERVED in specified e820 map. */
>>   int __init reserve_e820_ram(struct e820map *map, uint64_t s,
>> uint64_t e)
>>   {
>> -    return e820_change_range_type(map, s, e, E820_RAM, E820_RESERVED);
>> +    int res = e820_change_range_type(map, s, e, E820_RAM,
>> E820_RESERVED);
>> +
>> +    if ( !res )
>> +        printk("Failed to convert E820 RAM %"PRIx64"-%"PRIx64" to
>> RESERVED\n",
>> +               s, e);
>> +
>> +    return res;
>>   }
>>     unsigned long __init init_e820(const char *str, struct e820map *raw)
>> diff --git a/xen/arch/x86/include/asm/e820.h
>> b/xen/arch/x86/include/asm/e820.h
>> index 8e7644f8870b..a86d60ce3e77 100644
>> --- a/xen/arch/x86/include/asm/e820.h
>> +++ b/xen/arch/x86/include/asm/e820.h
>> @@ -25,7 +25,7 @@ struct e820map {
>>     extern int sanitize_e820_map(struct e820entry *biosmap, unsigned
>> int *pnr_map);
>>   extern int e820_all_mapped(u64 start, u64 end, unsigned type);
>> -extern int reserve_e820_ram(struct e820map *map, uint64_t s,
>> uint64_t e);
>> +extern int __must_check reserve_e820_ram(struct e820map *map,
>> uint64_t s, uint64_t e);
>>   extern int e820_change_range_type(
>>       struct e820map *map, uint64_t s, uint64_t e,
>>       uint32_t orig_type, uint32_t new_type);
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index d041cbd5f6f1..9c1f1eafa0d7 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1639,7 +1639,8 @@ void asmlinkage __init noreturn __start_xen(void)
>>       {
>>           uint64_t s = bi->mods[i].start, l = bi->mods[i].size;
>>   -        reserve_e820_ram(&boot_e820, s, s + PAGE_ALIGN(l));
>> +        if ( !reserve_e820_ram(&boot_e820, s, s + PAGE_ALIGN(l)) )
>> +            panic("Failed to reserve boot module %u in E820\n", i);
>>       }
>>         if ( !xen_phys_start )
>> @@ -1652,11 +1653,13 @@ void asmlinkage __init noreturn
>> __start_xen(void)
>>       /* This needs to remain in sync with remove_xen_ranges(). */
>>       if ( efi_boot_mem_unused(&eb_start, &eb_end) )
>>       {
>> -        reserve_e820_ram(&boot_e820, __pa(_stext), __pa(eb_start));
>> -        reserve_e820_ram(&boot_e820, __pa(eb_end),
>> __pa(__2M_rwdata_end));
>> +        if ( !reserve_e820_ram(&boot_e820, __pa(_stext),
>> __pa(eb_start)) ||
>> +             !reserve_e820_ram(&boot_e820, __pa(eb_end),
>> __pa(__2M_rwdata_end)) )
>> +            panic("Failed to reserve Xen in E820\n");
>>       }
>>       else
>> -        reserve_e820_ram(&boot_e820, __pa(_stext),
>> __pa(__2M_rwdata_end));
>> +        if ( reserve_e820_ram(&boot_e820, __pa(_stext),
>> __pa(__2M_rwdata_end)) )
>> +            panic("Failed to reserve Xen in E820\n");
>>   
>
> This condition is inverted.
> Otherwise this looks like a sensible change.

Oops, yes.  Fixed.

This is a horrible function of type int but returning a boolean
success.  Still, I'm not altering the error scheme in the same patch as
this fix.

~Andrew

