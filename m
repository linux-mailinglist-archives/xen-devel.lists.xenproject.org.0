Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAY1APlQ5mkDuwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 18:14:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6342742F318
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 18:14:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286347.1567439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wErGY-0000ON-3P; Mon, 20 Apr 2026 16:14:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286347.1567439; Mon, 20 Apr 2026 16:14:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wErGY-0000LA-0R; Mon, 20 Apr 2026 16:14:30 +0000
Received: by outflank-mailman (input) for mailman id 1286347;
 Mon, 20 Apr 2026 16:14:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wErGW-0000L4-CS
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 16:14:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wErGV-008659-BD
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 18:14:27 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e650e3-bab6-0a2a0a5309dd-0a2a4502e75a-0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 18:14:27 +0200
Received: from [52.101.193.61]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e650e1-af86-0a2a45020019-3465c13d7a53-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 18:14:26 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH0PR03MB6162.namprd03.prod.outlook.com (2603:10b6:610:d1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 20 Apr
 2026 16:14:23 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9818.033; Mon, 20 Apr 2026
 16:14:23 +0000
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
 b=XNPEvAT85W49KhV9ycoAZjXXoN4vsefdF3ZBrbu8aCuqd7oIqngJY/b0HdQIKPaFNIROsAAaKK2rgymKfYu8qYCP1AO35aT5tZFhbKMOUxPee7sgjV0FzMnQiQ/1WzfWBEuWjpvON4OYGA5sQpTvh3MVHc1V+Sx+gBN9bhtoPIJuYpSfR49+UIwlRyFAyi4UgYr7tWWXhaRXEa2yqzGEdiA3MUzWcgepNNlTX4eyPkmNfKdSupoNiME+6k954qOA2XKdNfIZii8XJNsfxQyxQhrslpLbz5O1BGEJ7jRiR6TGTpbTkCaD8kqRiEyiaFktnUwUOHlx5sDBY4K+EA2Wow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V96pWWCUkchYywXY2ng+krZjeuzCTGROfoobKErAJ+0=;
 b=B1zJcSyfcRwOzf7Z4MLaW7MTMyD4SWu2a6LtBOhKxQXbxi3j0+IMcXBSQ9XiGX52zTyTHFz6GjXPI1dWLidgFXl1WXQOjBmRMhWvRU/mCEzEnmmmbc8ifY98CPH3epaehHfq7qkHEly7HqBizYcrGbKfm+om95Y7jVtM82ewiaRCKm3CZOK0J5qeX7Qrum8K7xwErgtNhxaJlG1eCsf6Xizx+6kYfTvmpYAgf+Ys+dK/S2gsFfJ60uTLvWkK4XehzGX4nPUg1Z7bb4bdDesUwSPgXgV4a516wjaLh/aPl6EHn5O5gWwHlV9lHGsTE7YBfndyPQ3yW/OCOZpLzvUdhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V96pWWCUkchYywXY2ng+krZjeuzCTGROfoobKErAJ+0=;
 b=e9AdXREHN+yUcBqYJqb6uwbV89oan+bbVJ/ebIIJ03Tv75zy0HMyeTYjmR2JIUYwfBLHBA/hcXCu8xLmUDQIMrunVKGoSHQad/JQLfiYSxP/NW9JT/RNP/AeS+y2Oiy1KuxIBSU/9k1z7Wzyizyye1ABVmq3lkk8Badx9Uocots=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 20 Apr 2026 18:14:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] x86/cpuidle: split the max_cstate variable
Message-ID: <aeZQ3FcNl_EsPTdE@macbook.local>
References: <4b89f640-046a-49c1-95f1-947d98135e5b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4b89f640-046a-49c1-95f1-947d98135e5b@suse.com>
X-ClientProxiedBy: MA3P292CA0071.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH0PR03MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: f7fe3565-2c10-444b-2a6f-08de9ef7e2c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wIcq5DZuhd7qAbYYFX6eQQXiMS3rusp3uuqEaPrZf2KC3mSGwZwMXkR+noQ11cUViw9K5Oy5IediOtC4fKG9KFReII59LBrRg/JsKQhhKX2oBgD/XinQEnyEw0Mkuy4oSziOGa+UyRvPvTogB9T9GxFPo78AK2yYZnaeMaktxftejyDb39G5cGUc+1acNWfFNhDWMsrjwQKPXKd880jisWdlazC0A2Q6r9ABiF+BXl/BoAmrtcXZAYWIKAiyX7YsoZ8zcy0lSX8YnJHTlmxNm5OPwEAQI8HMKbHerXH2IQcFyI3IP1vVYU9PfLAjIT4g9Iei72/kJqysmlXbSRGAq8q9nrnjVLC4s2btQQH1rNP57mqfoo3L/YfOmlpNHW0Grfio3xdtDMreZeleYkoTrNCnAB+twK9ra6p2Upq9m0+5qjo3TV5sUj+n+JXGSypmdiFlUFZllXxgRxp2Ac9EEl9jtGMDtM8LkTrVtPbJvp2tAmtsagp3q2suzcY+9s7CzGgX1FxuCnEy4W5CzQ+ZSNoBQBSr/fuTDZ+KaEhSXkKCxRcqpVabtwgU6pxWALGLK5fpZtx3pZ1qIt/b8q7Os/KuK1jGHn39zw/DHfEcv/C1VgenK+7XwuNJszIDVWzNFa5HzSJsrcYQkNTc2dTOyWqxHKtvSJz98osyYSimRko0XSOLkigw194XmdY+0iJEzVbRfnUu0t29BiWXq20179GOBCoWpcEUpq80OPdzxDk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0UzTVNNbWJBQ2FLREtzZm5kaDU5dVFoeVZlcWtZQXJYQnRxRjVYTmRRR2tH?=
 =?utf-8?B?Y2Z2Vmk4WVhRdmpVWUh4bmhMVVBRZkRlL3UyYTRuejdCeVFUd3NuL2lQTUNu?=
 =?utf-8?B?cXU3S1UvMHRzU0xLQXFHWHJNaWtGenBBNS9sVUZDdC9qZXBGclNNRk91YjVp?=
 =?utf-8?B?RmwwUFl1U01FRTJDeDZMeGJ0bk5OcmdPdzhnUTBYRHlHWXd0d25QNytlTnNN?=
 =?utf-8?B?R3V4TDJKdHpoaHN4ajgxazlIQ0F0RnRjWERaWkhBRWMxcVMwZlV1akpBQ0Zo?=
 =?utf-8?B?am00SnE3VmpJM2dYS3Ira2EwRkZHTnNXazZGK1gzUmdQYjRDSUdsRDN2NXY1?=
 =?utf-8?B?THIrUGcwazl5TmRPbzY3VjVJdlNxaXpyWU1mY29LaUFrYkhrcFQ0bXhqK2Nr?=
 =?utf-8?B?aTdmd3pmb01vSXFJc2pYNE5UclBRRmxvcXE2OUdFeENzMXRROGhyMHZjbHkx?=
 =?utf-8?B?dFBWRXpScWt1UmREVjVNWm45eWhTMzJBTC9NdFY0aHk4SHVYVkVVWUZDYmlq?=
 =?utf-8?B?UWp1VEpTNnBKbExUaTAwZksxOHF2cnI4SXNtWjFkbVBwZFE5SU83azlsSGph?=
 =?utf-8?B?ZkZzWVRBRG9XV1hlTVF4eWJhQi91eXJmd21hR3RVNDVRZEQzTFgrbDl0bXZy?=
 =?utf-8?B?QWNCSSsrdHFwdmRZVG5RV1VkSTNGemdwdkk2WTNNOE9pVUpDK2hpVmVWNEh6?=
 =?utf-8?B?QXV1ZlRrMmNaRk4xOE45UGRIdHlCZEV3UzFuUUZuM2FDVkxrRDR1SnptQnFH?=
 =?utf-8?B?WXY4V1pteUpCU1hSN0lVdS9MN2R6cWV6d2lUdnpqK0M5QkVxUm5pM2ZxWG0v?=
 =?utf-8?B?bEFrbHlLY3FURzMwVFppWDlxYkZZdkM5RVlaSnU1THhzYnNTYldhVDh1ekQw?=
 =?utf-8?B?OFJNbVpJc25ERnJSZlZoL2tDTVB5Rm1lVS84N3ZIRnFEZmN6UHd3ZVp6Z3lN?=
 =?utf-8?B?MUt0bXBWUjdOV1hIT295Uml0SnNBNkx3UHVKei84VHVmMGJTWUtNZ2IrV1JT?=
 =?utf-8?B?WEdKTUlrOUNuRHFWWU9jRjVTV3BkRms1SG1LdzJhbklPOWx4aDlGSE1tUjZF?=
 =?utf-8?B?UjR5eEJHem9KOW84NUovd09rdnpHWExNVXNqdUhLM21kRlRpK0IyZ3pWVGNy?=
 =?utf-8?B?R3ZVTVNyNG0reVBjTmNYK3BXL3EwWVN6TU4xdkJvT2pxTUc0Q3NsaitKWkMr?=
 =?utf-8?B?UkdCZjZNVzBIaFdKOUN6Z0NCK0FwYzkwb3RET1h1QVEzSWViT0Q1SGtIK20z?=
 =?utf-8?B?RkVPYStwaHBpK1RWR3F3c1lmb0hMN1p2T21SeCtMeEsrN3lIWXFyZGdXdVc0?=
 =?utf-8?B?TVR1RUJpMXhLVVMxWURrVWtzdHNja3AvUjRURTZLaU8zcDk5K3VVZVJuU0Rr?=
 =?utf-8?B?b2w2eHF5N2hFU3YwUzZwYldlWHBwTnBIV1I5dXNiZGR3Mk95SU50d1VocW1h?=
 =?utf-8?B?YW10Q3AvbkI3Q2o5NDg1WEtUWkIwVjFyQjM1K0pUWHljYmxaUmVESk5odUIv?=
 =?utf-8?B?ZWh2ZnpnNzBoMzRpZVJCMkhFU3JwSnNHZW81aG9ic1YybFJ6dXQ0eE03cFQ0?=
 =?utf-8?B?YWNJR1FVSUxFOHhQd2l3bkpkbktJeVlWd0dxV3NnZDZoazAyUmZ5WklieTBV?=
 =?utf-8?B?b0V4eE1zc29wSGZYZm9IcVFOc0RCVXNMMmZYQlVUbENQSUZ3RjBSbXp2VE04?=
 =?utf-8?B?Q1k0MUZudlI5QUtOY3ZYUmVPVUxmL05TalB2TjVHVWpsMlV1d21nSUlyNTcr?=
 =?utf-8?B?c1BRUTlpWWZ4NVQxVmtMOFp1RnNSbHI2SGpQckZiZnhHd09JNzU5bHMzYXpQ?=
 =?utf-8?B?OXg3WHJMdjgvWkVYZVRnUm5hWFdwS2NBaXdwN25PS0k2WXhDYkNuY1hJVVlU?=
 =?utf-8?B?SFQyZFBBSUh2L1haeGhYbnVaL0VlSVl1R1B4YlJSdmxrY2phNjNNcldyMkJO?=
 =?utf-8?B?bmU1THJCZ2lZRU5FYnZnL1VjODdjNVZ1VFVKdkt0OUdIY002d1h4T3UvZTJa?=
 =?utf-8?B?ZWtXbzJWMTVyajF0S2VPanFDeGlnRi9LSmxQa014NXpsOW1Ra25BRXhWUUpq?=
 =?utf-8?B?QWZhUWJlK0xnTG9waFdEWjJVVmJFenQ3WVJaMzZtWUY1Q3JtdFA3S3IzMkRJ?=
 =?utf-8?B?aFlUeHJBbFd1REc1QmxicmdEWER3V3ozRFRYZDhBeXBqOE1wTERmdTF1dWFi?=
 =?utf-8?B?cHpHUHBwU2JoYzcrbElOTDVLVmdQS1J0T2J1SUI2UmwyUWdYZlpqSTZaeFRm?=
 =?utf-8?B?RDFzcTA1bVVXNmtqNGJCSGVJOFIzUlAzcENxWjZCYjgwd0I4clFERWhFdmo0?=
 =?utf-8?B?ZDIxdlZaN2k1TWlaeW52eVNLeSt5OHJtemh5NVZOWlNaa01nVjFIdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7fe3565-2c10-444b-2a6f-08de9ef7e2c6
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 16:14:23.3314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3dp50rANtjFxGdVlwloDElRzeOh+ztAYAMGLkX5NuN7TPRK1YyZFdlXMnwJQYO/5QOBQJeesxF/ocmDd2G4GWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6162
X-purgate-ID: tlsNG-720697/1776701667-80F7E161-B386D7FA/0/0
X-purgate-type: clean
X-purgate-size: 13848
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6342742F318
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 01:34:43PM +0200, Jan Beulich wrote:
> The admin can control the upper bound wanted not only via command line
> option, but also via XEN_SYSCTL_pm_op_set_max_cstate. While decisions how
> to set up the system are okay this way as long as we deem the command line
> option a strict upper bound, what to do during S3 resume should not be
> based on that potentially varying value. Decisions there need to use
> solely the strict upper bound we may have enforced ourselves (or which was
> forced onto us via command line option).
> 
> Rather than altering pit_broadcast_is_available(), drop the function
> altogether. It's pretty odd for acpi/cpu_idle.c to call into time.c, just
> for that to call into acpi/cpu_idle.c again.
> 
> Fixes: 8d24303023ec ("x86: don't write_tsc() non-zero values on CPUs updating only the lower 32 bits")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> cpuidle_disable_deep_cstate(), when called from handle_rtc_once(), is
> still somewhat of a problem: Boot time and resume time runs of
> _disable_pit_irq() may still behave differently because of that.
> 
> If we wanted the sysctl to possibly move the maximum C-state beyond what
> was given on the command line, things would get yet more complicated, as
> we'd then need to re-configure the driver that's in use.
> 
> I wonder how useful the ACPI_STATE_C<n> #define-s really are. Plain 1 is
> used in e.g. probe_c3_errata(), and the plain 7 doesn't even have a
> respective constant (nor would that be suitable, as that's not really an
> ACPI state).
> 
> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -119,7 +119,7 @@ bool lapic_timer_init(void)
>          lapic_timer_off = hpet_broadcast_enter;
>          lapic_timer_on = hpet_broadcast_exit;
>      }
> -    else if ( pit_broadcast_is_available() )
> +    else if ( cpuidle_usable_deep_cstate() )
>      {
>          lapic_timer_off = pit_broadcast_enter;
>          lapic_timer_on = pit_broadcast_exit;
> @@ -131,12 +131,15 @@ bool lapic_timer_init(void)
>  }
>  
>  void (*__read_mostly pm_idle_save)(void);
> -unsigned int max_cstate __read_mostly = UINT_MAX;
> +
> +unsigned int max_usable_cstate __read_mostly = UINT_MAX;
> +unsigned int max_allowed_cstate __read_mostly = UINT_MAX;
>  unsigned int max_csubstate __read_mostly = UINT_MAX;
>  
>  static int __init cf_check parse_cstate(const char *s)
>  {
> -    max_cstate = simple_strtoul(s, &s, 0);
> +    max_allowed_cstate = simple_strtoul(s, &s, 0);
> +    max_usable_cstate = max_allowed_cstate;
>      if ( *s == ',' )
>          max_csubstate = simple_strtoul(s + 1, NULL, 0);
>      return 0;
> @@ -413,10 +416,11 @@ static void cf_check dump_cx(unsigned ch
>      unsigned int cpu;
>  
>      printk("'%c' pressed -> printing ACPI Cx structures\n", key);
> -    if ( max_cstate < UINT_MAX )
> +    if ( max_cstate() < UINT_MAX )
>      {
> -        printk("max state: C%u\n", max_cstate);
> -        if ( max_csubstate < UINT_MAX )
> +        printk("max state: C%u\n", max_cstate());
> +        if ( max_allowed_cstate <= max_usable_cstate &&
> +             max_csubstate < UINT_MAX )
>              printk("max sub-state: %u\n", max_csubstate);
>          else
>              printk("max sub-state: unlimited\n");
> @@ -690,18 +694,18 @@ static void cf_check acpi_processor_idle
>      u32 exp = 0, pred = 0;
>      u32 irq_traced[4] = { 0 };
>  
> -    if ( max_cstate > 0 && power &&
> +    if ( max_cstate() > 0 && power &&
>           (next_state = cpuidle_current_governor->select(power)) > 0 )
>      {
>          unsigned int max_state = sched_has_urgent_vcpu() ? ACPI_STATE_C1
> -                                                         : max_cstate;
> +                                                         : max_cstate();
>  
>          do {
>              cx = &power->states[next_state];
>          } while ( (cx->type > max_state ||
>                     cx->entry_method == ACPI_CSTATE_EM_NONE ||
>                     (cx->entry_method == ACPI_CSTATE_EM_FFH &&
> -                    cx->type == max_cstate &&
> +                    cx->type == max_allowed_cstate &&

I'm afraid I'm missing why this uses max_allowed_cstate instead of
max_state.

>                      (cx->address & MWAIT_SUBSTATE_MASK) > max_csubstate)) &&
>                    --next_state );
>          if ( next_state )
> @@ -1448,7 +1452,7 @@ static void amd_cpuidle_init(struct acpi
>  
>      for ( i = 0; i < nr; ++i )
>      {
> -        if ( cx[i].type > max_cstate )
> +        if ( cx[i].type > max_cstate() )
>              break;
>          power->states[i + 1] = cx[i];
>          power->states[i + 1].idx = i + 1;
> @@ -1611,21 +1615,22 @@ int pmstat_reset_cx_stat(unsigned int cp
>  
>  void cpuidle_disable_deep_cstate(void)
>  {
> -    if ( max_cstate > ACPI_STATE_C1 )
> +    if ( max_usable_cstate > ACPI_STATE_C1 )
>      {
>          if ( local_apic_timer_c2_ok )
> -            max_cstate = ACPI_STATE_C2;
> +            max_usable_cstate = ACPI_STATE_C2;
>          else
> -            max_cstate = ACPI_STATE_C1;
> +            max_usable_cstate = ACPI_STATE_C1;
>      }
>  
>      hpet_disable_legacy_broadcast();
>  }
>  
> -bool cpuidle_using_deep_cstate(void)
> +bool cpuidle_usable_deep_cstate(void)
>  {
> -    return xen_cpuidle && max_cstate > (local_apic_timer_c2_ok ? ACPI_STATE_C2
> -                                                               : ACPI_STATE_C1);
> +    return xen_cpuidle &&
> +           max_usable_cstate > (local_apic_timer_c2_ok ? ACPI_STATE_C2
> +                                                       : ACPI_STATE_C1);
>  }
>  
>  static int cf_check cpu_callback(
> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -384,12 +384,12 @@ static void probe_c3_errata(const struct
>      };
>  
>      /* Serialized by the AP bringup code. */
> -    if ( max_cstate > 1 && (c->apicid & (c->x86_num_siblings - 1)) &&
> +    if ( max_usable_cstate > 1 && (c->apicid & (c->x86_num_siblings - 1)) &&
>           x86_match_cpu(models) )
>      {
>          printk(XENLOG_WARNING
>  	       "Disabling C-states C3 and C6 due to CPU errata\n");
> -        max_cstate = 1;
> +        max_usable_cstate = 1;
>      }
>  }
>  
> --- a/xen/arch/x86/cpu/mwait-idle.c
> +++ b/xen/arch/x86/cpu/mwait-idle.c
> @@ -1045,15 +1045,16 @@ static void cf_check mwait_idle(void)
>  	u64 before, after;
>  	u32 exp = 0, pred = 0, irq_traced[4] = { 0 };
>  
> -	if (max_cstate > 0 && power &&
> +	if (max_cstate() > 0 && power &&
>  	    (next_state = cpuidle_current_governor->select(power)) > 0) {
>  		unsigned int max_state = sched_has_urgent_vcpu() ? ACPI_STATE_C1
> -								 : max_cstate;
> +								 : max_cstate();
>  
>  		do {
>  			cx = &power->states[next_state];
> -		} while ((cx->type > max_state || (cx->type == max_cstate &&
> -			  MWAIT_HINT2SUBSTATE(cx->address) > max_csubstate)) &&
> +		} while ((cx->type > max_state ||
> +                          (cx->type == max_allowed_cstate &&

Indentation is weird for the above line IMO, you should use hard 3
tabs plus spaces afterwards, like the surrounding indentation?

> +			   MWAIT_HINT2SUBSTATE(cx->address) > max_csubstate)) &&
>  			 --next_state);
>  		if (!next_state)
>  			cx = NULL;

Seeing max_cstate() is used in multiple places here, you might want to
introduce a local max_cstate variable?

> @@ -1458,7 +1459,7 @@ static void __init sklh_idle_state_table
>  	u64 msr;
>  
>  	/* if PC10 disabled via cmdline max_cstate=7 or shallower */
> -	if (max_cstate <= 7)
> +	if (max_cstate() <= 7)
>  		return;
>  
>  	/* if PC10 not present in CPUID.MWAIT.EDX */
> @@ -1623,7 +1624,7 @@ static int __init mwait_idle_probe(void)
>  	    !mwait_substates)
>  		return -ENODEV;
>  
> -	if (!max_cstate || !opt_mwait_idle) {
> +	if (!max_cstate() || !opt_mwait_idle) {
>  		pr_debug(PREFIX "disabled\n");
>  		return -EPERM;
>  	}
> @@ -1714,8 +1715,8 @@ static int cf_check mwait_idle_cpu_init(
>  		hint = flg2MWAIT(cpuidle_state_table[cstate].flags);
>  		state = MWAIT_HINT2CSTATE(hint) + 1;
>  
> -		if (state > max_cstate) {
> -			printk(PREFIX "max C-state %u reached\n", max_cstate);
> +		if (state > max_cstate()) {
> +			printk(PREFIX "max C-state %u reached\n", max_cstate());
>  			break;
>  		}
>  
> --- a/xen/arch/x86/include/asm/time.h
> +++ b/xen/arch/x86/include/asm/time.h
> @@ -31,7 +31,6 @@ int cpu_frequency_change(u64 freq);
>  
>  void cf_check pit_broadcast_enter(void);
>  void cf_check pit_broadcast_exit(void);
> -int pit_broadcast_is_available(void);
>  
>  uint64_t cf_check acpi_pm_tick_to_ns(uint64_t ticks);
>  
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -517,7 +517,7 @@ static int64_t __init cf_check init_hpet
>      bool disable_hpet = false;
>  
>      if ( hpet_address && strcmp(opt_clocksource, pts->id) &&
> -         cpuidle_using_deep_cstate() )
> +         cpuidle_usable_deep_cstate() )
>      {
>          if ( pci_conf_read16(PCI_SBDF(0, 0, 0x1f, 0),
>                               PCI_VENDOR_ID) == PCI_VENDOR_ID_INTEL )
> @@ -2655,7 +2655,7 @@ static int _disable_pit_irq(bool init)
>       * XXX dom0 may rely on RTC interrupt delivery, so only enable
>       * hpet_broadcast if FSB mode available or if force_hpet_broadcast.
>       */
> -    if ( cpuidle_using_deep_cstate() && !boot_cpu_has(X86_FEATURE_XEN_ARAT) )
> +    if ( cpuidle_usable_deep_cstate() && !boot_cpu_has(X86_FEATURE_XEN_ARAT) )
>      {
>          init ? hpet_broadcast_init() : hpet_broadcast_resume();
>          if ( !hpet_broadcast_is_available() )
> @@ -2707,11 +2707,6 @@ void cf_check pit_broadcast_exit(void)
>          reprogram_timer(this_cpu(timer_deadline));
>  }
>  
> -int pit_broadcast_is_available(void)
> -{
> -    return cpuidle_using_deep_cstate();
> -}
> -
>  void send_timer_event(struct vcpu *v)
>  {
>      send_guest_vcpu_virq(v, VIRQ_TIMER);
> @@ -2999,7 +2994,7 @@ static void cf_check dump_softtsc(unsign
>      else if ( boot_cpu_has(X86_FEATURE_CONSTANT_TSC ) )
>      {
>          printk("TSC has constant rate, ");
> -        if ( max_cstate <= ACPI_STATE_C2 && tsc_max_warp == 0 )
> +        if ( max_usable_cstate <= ACPI_STATE_C2 && tsc_max_warp == 0 )
>              printk("no deep Cstates, passed warp test, deemed reliable, ");
>          else
>              printk("deep Cstates possible, so not reliable, ");
> --- a/xen/include/xen/acpi.h
> +++ b/xen/include/xen/acpi.h
> @@ -142,30 +142,33 @@ int acpi_gsi_to_irq (u32 gsi, unsigned i
>  
>  #ifdef	CONFIG_ACPI_CSTATE
>  /*
> - * max_cstate sets the highest legal C-state.
> - * max_cstate = 0: C0 okay, but not C1
> - * max_cstate = 1: C1 okay, but not C2
> - * max_cstate = 2: C2 okay, but not C3 etc.
> -
> - * max_csubstate sets the highest legal C-state sub-state. Only applies to the
> - * highest legal C-state.
> - * max_cstate = 1, max_csubstate = 0 ==> C0, C1 okay, but not C1E
> - * max_cstate = 1, max_csubstate = 1 ==> C0, C1 and C1E okay, but not C2
> - * max_cstate = 2, max_csubstate = 0 ==> C0, C1, C1E, C2 okay, but not C3
> - * max_cstate = 2, max_csubstate = 1 ==> C0, C1, C1E, C2 okay, but not C3
> + * max_{allowed,usable}_cstate sets the highest allowed / usable C-state, where
> + * "allowed" is command line / sysctl based.

Hm, this is a bit misleading, because max_usable_cstate is also
command line based (plus system errata).  What about:

"max_{allowed,usable}_cstate sets the highest allowed / usable C-state.
max_usable_cstate can only be set from the command line, while
max_allowed_cstate can be set from both command line and systcl."

> + * max_*_cstate = 0: C0 okay, but not C1
> + * max_*_cstate = 1: C1 okay, but not C2
> + * max_*_cstate = 2: C2 okay, but not C3 etc.
> + *
> + * max_csubstate sets the highest allowed C-state sub-state. Only applies to
> + * the highest allowed C-state.
> + * max_allowed_cstate = 1, max_csubstate = 0 ==> C0, C1 okay, but not C1E
> + * max_allowed_cstate = 1, max_csubstate = 1 ==> C0, C1 and C1E okay, but not C2
> + * max_allowed_cstate = 2, max_csubstate = 0 ==> C0, C1, C1E, C2 okay, but not C3
> + * max_allowed_cstate = 2, max_csubstate = 1 ==> C0, C1, C1E, C2 okay, but not C3
>   */
>  
> -extern unsigned int max_cstate;
> +extern unsigned int max_usable_cstate;
> +extern unsigned int max_allowed_cstate;
>  extern unsigned int max_csubstate;
>  
> +#define max_cstate() min(max_usable_cstate, max_allowed_cstate)

I would be tempted to drop the ending parenthesis so that you don't
need to adjust callers, but that's likely misleading, as then it would
need to be uppercase MAX_CSTATE.

> +
>  static inline unsigned int acpi_get_cstate_limit(void)
>  {
> -	return max_cstate;
> +	return max_allowed_cstate;
>  }
>  static inline void acpi_set_cstate_limit(unsigned int new_limit)
>  {
> -	max_cstate = new_limit;
> -	return;
> +	max_allowed_cstate = new_limit;

Do we want to check the new limit doesn't exceed max_usable_cstate and
return -ERANGE or similar on failure?

After this change it's a bit weird to silently ignore invalid values
IMO.

>  }
>  
>  static inline unsigned int acpi_get_csubstate_limit(void)
> --- a/xen/include/xen/cpuidle.h
> +++ b/xen/include/xen/cpuidle.h
> @@ -89,7 +89,7 @@ struct cpuidle_governor
>  extern int8_t xen_cpuidle;
>  extern struct cpuidle_governor *cpuidle_current_governor;
>  
> -bool cpuidle_using_deep_cstate(void);
> +bool cpuidle_usable_deep_cstate(void);
>  void cpuidle_disable_deep_cstate(void);
>  
>  #define CPUIDLE_DRIVER_STATE_START  1

