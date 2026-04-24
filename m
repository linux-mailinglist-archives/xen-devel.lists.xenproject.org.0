Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMcEJK4y62lfJwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 11:06:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E06445BDFA
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 11:06:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293323.1571121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGCUA-0004oC-LM; Fri, 24 Apr 2026 09:06:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293323.1571121; Fri, 24 Apr 2026 09:06:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGCUA-0004mb-IQ; Fri, 24 Apr 2026 09:06:06 +0000
Received: by outflank-mailman (input) for mailman id 1293323;
 Fri, 24 Apr 2026 09:06:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wGCU8-0004m3-PF
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 09:06:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGCU6-00E81O-Oj
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 11:06:02 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69eb3272-e002-0a2a0a5209dd-0a2a4508da4a-22
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 11:06:02 +0200
Received: from [40.93.201.46]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69eb3278-63b5-0a2a45080019-285dc92e9a93-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 11:06:01 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MN6PR03MB7647.namprd03.prod.outlook.com (2603:10b6:208:4fa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 09:05:59 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 09:05:58 +0000
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
 b=KQ3L1jZ+PDTBouejRM/TChBS/XbKWhneAzw1g0o+SCXvIa4pBG0lOF2vYd6GAFBRhPF1WiMr+UdXeFBvdlIZ+hhLW9D+pAA+Ie+2UWGS/pGIJ6YZc+H8Xe84wgAuiye2QGDd9rLixmb2kDPhL2Gm5Dmfh1AulbYNvT+H5XWxvR6lQlwBPYgxyTStTxqX+Kza2Gc74THW8V+m3VhU0wB9/UjzbMm2IbEM9g6prEj4+SmeCFGgcg3AHrUF04k2nGU6opdXHRvRUjELfDHt/WbeV7Nq4URzBocOiM7MGERXPGjZRLUM9TKoaspGq9ZqqkFs0uL2mrurqCWgvPTq0GByQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ji1YEMzP233OD0vlz33sSjZWh80qoEbi1o+wqj7pvJA=;
 b=KBgbyHsT7OHyrWrt8jJPL+Y7MDhJOFQJJOoIGQxU9Yoq6CtuyVO/a/2rSmJyY188BleD4hE4R+YbbI6LE3pTkIxsj3RAW48G+zarbDqlDE5fyp8xl1UNtUKrj1gi4Sk6lXqBBufo6/oas4OrFSnxiOPHeUElvRUgx1Bhj+uc2+is/LctmBkMAAOAHg6CZNEEs0DgZ0nTEGrnhietpsRRS3C2DFNcbq9x8/FJFQLXdGJg9smtgVL3BZQ7Vunrp7jdv9nkA32XZ9KTCjJlmOWqzc82H7+ZCzMoV8hD0C/i/3QOuTlGWtg2jbaB4kk8NJKmi4zigPblntGAccC9mzhZbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ji1YEMzP233OD0vlz33sSjZWh80qoEbi1o+wqj7pvJA=;
 b=m3RnXTq3EzreXGUKYr7dr5bIc9ROICPZIze5Wmk/PgDDlHc6t6JU67EPgBAL4lZWUKfXCsyiODHyGCQFB3jOWldkUiCfi0wW1OLpR7lNnK5Vd2ldVftdTROMsRyCuOXSp5oU7/sKEkts6E8gPlsW4rJO99ck9ti6Q/ETli6AreU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 24 Apr 2026 11:05:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] x86/amd: Drop allow_unsafe parameter, tune down XSA-9
 mitigations
Message-ID: <aesydCALj_BSxJ1-@macbook.local>
References: <1776877188.8631fc262581453bbf619ec5b2062170.19db6223737000f373@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1776877188.8631fc262581453bbf619ec5b2062170.19db6223737000f373@vates.tech>
X-ClientProxiedBy: MA2P292CA0002.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MN6PR03MB7647:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ba3fe08-1783-4140-f101-08dea1e0b363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	uuZq+v5YGZG3AqLxb526Nnw5yVPdF8CX87mzEqx1OoTXGbekd3E/Jz/ZWqLTZ/OsgXdS/evQj/aYXBTyBgwPXMm9gvMqcJ6sJzNePMYMYgzikkXbKlsoga6SuMmqNOthpeyjuoU0/ccud8QNjwwYzk7Nkr9cMFmsn3c0DR7abFc8J2Zb2dgCDFyEXv/uAnuio2laIiFfhQfHK1xTwO5/ibSLkhAkHLHBO5fxRe2NV27FdSv03hkW37eswsIplwVFpNRODqZmd6xcLM0AQSmF/fWUfARJO5cqZ3UMdNM7qTWfrz8EEnfb6UoE0FCYaCyOvwD5d2bjeHN1BKSOYHdkjocvuzS+nDB1llxY7OrpG9hMQ/PwwSJHxtzy4eGFCcZsXQIKFc9O+PYtzWSWoHWzxG+Z2XsMF922JDeYNNOgzvTV+DSI+uiJx6x6mC+u7JhyDEzycjzRweoU6P6B8daJ8H1cESL91Hywks2EfavjuNtKz36rZbz2/y1KCSMERIrMJorxVde7J8vPL8U5MeEozeQm2rj5yKFSfpzotXCqlIGZJfv2dHT7jIonqUhU2FWxKNsdA+jqhcBABKSV8nKBNn3flM2hXuNS6bYVlsM5NZtgyRtM/B8iNb3ZD/x1LbKh1y/rZGZDsoUQt2IdSEnOmY7YClv1KR1bWhSemiKP/NvOP7VcHwFqvjBb6rHt3uayt3DSzQnQA07VHCtC84nldJUbjQIERB2pYxF/NMcxd14=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blFjSko4NnZPSDY1MUF1dWVlMmcxS25ZQ3R3WGlkRUZTSGtIYU0wMklnbmJ1?=
 =?utf-8?B?Wm4yZFlac3FxNTZWcHhtQ2ZJZzBXMWxHenp1VForM1pycXdEUVgzK1ZCak0r?=
 =?utf-8?B?cWhWSFErZjl5ZnVpeGxhUmdySURqZ2c1NEppOFZRaWM0QkpVRURKNFVnd1Vv?=
 =?utf-8?B?dFFSYW1XbDlnaWRjQzkweDhmZ2NzanFEMGZ3NTlMajhKcm9iVU1OMUhkeTVD?=
 =?utf-8?B?c2lHaXdjSG1SUW81YmwrZ0FXNXFEKy9MY3ZLaEQ4QkJzc2hyZFQ0dFdwZmhz?=
 =?utf-8?B?bktva0pHZ2F1NzRtV0lOMFMzOFhEenVZNXpqd3RyVGVzamVJaGxrbGR4WXRB?=
 =?utf-8?B?L1ZScnAzWG9FaEowaUl3QURXbXVsaTlHeUJXWGFDQTN0bVZkZ3pKR3B2aXZS?=
 =?utf-8?B?WW96RXQ1Q1Z0Q0pZSGhUVitKU3NTV1VLdWlSMXNGcVRGT2dXdmpBL0dZQkgz?=
 =?utf-8?B?bEYxaVlCUUFrQzFtYm1EOEh3dThEV2dnb01ZeEU0VnNsTVE5WnhKRXdXZEZ2?=
 =?utf-8?B?UGxzZ1RMdXNaY0Z0dHRUWUNScEk1RFN5RFdSV1h3VUdIdVRPMFdvZytSYXBI?=
 =?utf-8?B?VEV2Umo2RC9LczExYVB5TlZoZEZocjRkZnZJKzhFNHJXaFVpQm9qSGhhRzh2?=
 =?utf-8?B?QkpLQmRxdTdiMFAwOGR3dnI2dEwvYktidVluUjZBWENXVlphbkVwdzBrcDE1?=
 =?utf-8?B?WHJRTmRHRGxwV2QvNXREL1BpTndIY3IyTXJmUHVoMU1kM1VFMDl6Y09sRmd3?=
 =?utf-8?B?bnJKbG9CRFBqaDFtMFdabFliUkVncExUWDk1K29qVXkxSVZLYkh6dVIrT2Fw?=
 =?utf-8?B?ZExpTm1IUHFRTjcwNnhiMU5zKzUyQ1h1OEx3WmNzR1paeWtCYmhXRU5jaWJn?=
 =?utf-8?B?WHlhc1VxcU9EMlZaTTREdWpqNVdQN2Y4Q29UVmloM25yNnRCL1RMVHJGZytl?=
 =?utf-8?B?V0lUTFQxUXFkSWhjaUZJdW5kc21iQml4Sm5VUml3bVJBNHA1OHRvN3RzZzY5?=
 =?utf-8?B?MkhuQ0RBdGZoajI0bWZTQWo2UUpvd2F4UmkxN25kY2lQV3hheGROUEVIbWRo?=
 =?utf-8?B?blFvUEp1dmd3RnNHWHRHd2p1SlF4WStKSGN5emNnd0RVd3l1SWZXaThRdmtN?=
 =?utf-8?B?dnp3NkdIVUpQVGllMDdFQXN4MmNUZGR0UEl4SWVDRHdwT0ducDdCSU5GUGd4?=
 =?utf-8?B?N2JOazIzN3RZYmY3QVhqZ0U2cktJaU1qRHczMlBja1E1cXZwT2MzcWs2SWJj?=
 =?utf-8?B?UzY2RXYzM01LVUVNV3RvbTVjTjcrR20ycFhDblZHN2dDUEtHcXN4a1pqMWF5?=
 =?utf-8?B?RFI3blZWWEk2ZDRYZVZmOXVMTUxQNUZRcW5aR3c2bHhpS0w4NWswQkNsQi9R?=
 =?utf-8?B?QnN5WW5CcjJNZmNYajJaRnZvNFpvSGlVVnpjVnUydHdvaHVIK2xCTm9SUEJp?=
 =?utf-8?B?WHVzc3RPM1V0OGMrRDZQellqbGluUnNwSUdVcDJwT3dDRkxGNTBDamx0bXpo?=
 =?utf-8?B?RDBmYTZyQkYwRG1ibWRtOVBDcVdUNWEzWWNaVG5MY0Fkb0pTa3pkSk1jREF1?=
 =?utf-8?B?YzBaQm5YSWpNV3F0NVZpKzA0ZmxLRW5ZUlpmNm9VZXNvaFkvMGhJNStHQ05L?=
 =?utf-8?B?TS9RUXVvamFUR0JySjlQUnpHelJDcENvcG9PNHk5KzNjL1BMTlJLQXdOYks0?=
 =?utf-8?B?elRmOEFJdVozZTdGMzducUh0d3RabnNUdFlidnF1aEFVNHQ5ZnZFcnc0WGdh?=
 =?utf-8?B?czZQUWY0NWNvQy94WFZzaVVuWDVES1cwOXBYdFUzc0xFRVVxZmxYMXg0ZmxF?=
 =?utf-8?B?N09YMG8xMEp2OVJ0d01zVUtVamw4ZEFrR2xDMHJvbndsNnREZFZ1bzg5RTVz?=
 =?utf-8?B?STI1Yk9ES29qSFFSUVdIcnhBS2tWNkdhcVNoalZCZ1ByRFd0YnozTU1zcnVD?=
 =?utf-8?B?Vm5XUm8zMVh4dlBacWlsSy8rbkEwaTk0L09XSk1qRUtyekttMEk2ZWhEVm85?=
 =?utf-8?B?VkZVek9qSXdVdTUyeGc3VHhPZEJLZFhaWUdzQzRoRkNJRXgzQTVjcE9qRWdW?=
 =?utf-8?B?cVN0MWJ0SkJRelk4a29nTENhSi9jWmlLckdoN3VmQVRxeFlMOWRpYnZmeUV3?=
 =?utf-8?B?U0wrVC9QTnhtS0RmMTg5SUIvMnNsMzR3MXJrNmpDZWpIdXZvcEcvSmFzMmh3?=
 =?utf-8?B?OEtwSDNmajBDd0lMVkwwSkk4YmxwWEl4QmFMOTgrOWNXTkFmeHFlK0l3U2gz?=
 =?utf-8?B?NGZ5R051MFVzOCttc0h3L3FjYklhT2lMbjBJSXdJSWUzTGJ4d3RpTzVxeVBv?=
 =?utf-8?B?VUJIY2VxOEN1RWpNbm1NamNVbjcxZkQwM3NIT0dUYXRTVGpvWEdXZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba3fe08-1783-4140-f101-08dea1e0b363
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 09:05:58.9316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iofnkgo5rSNCDxvbPrfl1MV4uKApIrZg5E9jRJmANuz17Lo2m42d12pOmnNiscu+7P0YHARIq+teaxWQScDSvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7647
X-purgate-ID: tlsNG-c1860d/1777021562-39360DB1-B27C5065/0/0
X-purgate-type: clean
X-purgate-size: 3907
X-Rspamd-Queue-Id: 5E06445BDFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]

On Wed, Apr 22, 2026 at 06:58:06PM +0200, Teddy Astie wrote:
> XSA-9 mitigations prevents Xen from properly running if a affected CPU
> is detected. While the vulnerability has no mitigations (aside not running
> 64-bits PV guests), it's only outcome is a DoS.
> 
> There is no real point in preventing Xen from working here and it would
> be preferable to just log the vulnerability to the user so it can act
> appropriately.
> 
> Also reword the errata message regarding that it only affects PV64 guests.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> It's hard to tell whether or not we would want to drop allow_unsafe, but
> currently, Xen is allowed to boot with XSA-304 mitigations disabled
> (intentionnaly) which has a similar outcome than this one.
> 
> From a user standpoint, preventing the system to boot or starting guests is
> too extreme and would be in practice seen as a bug, even if it's justified
> policy which can be overriden.
> 
>  docs/misc/xen-command-line.pandoc | 12 ------------
>  xen/arch/x86/cpu/amd.c            | 21 +++++----------------
>  xen/arch/x86/domain.c             | 14 --------------
>  xen/arch/x86/include/asm/amd.h    |  2 --
>  4 files changed, 5 insertions(+), 44 deletions(-)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 6c77129732..04d206f919 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -133,18 +133,6 @@ resume.
>  `s3_mode` instructs Xen to set up the boot time (option `vga=`) video
>  mode during S3 resume.
>  
> -### allow_unsafe (x86)
> -> `= <boolean>`
> -
> -> Default: `false`
> -
> -Force boot on potentially unsafe systems. By default Xen will refuse
> -to boot on systems with the following errata:
> -
> -* AMD Erratum 121. Processors with this erratum are subject to a guest
> -  triggerable Denial of Service. Override only if you trust all of
> -  your PV guests.
> -
>  ### altp2m (Intel)
>  > `= <boolean>`
>  
> diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
> index 712734a6e7..f1f4a25754 100644
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -20,10 +20,6 @@
>  
>  #include "cpu.h"
>  
> -/* 1 = allow, 0 = don't allow guest creation, -1 = don't allow boot */
> -int8_t __read_mostly opt_allow_unsafe;
> -boolean_param("allow_unsafe", opt_allow_unsafe);
> -
>  /* Signal whether the ACPI C1E quirk is required. */
>  bool __read_mostly amd_acpi_c1e_quirk;
>  bool __ro_after_init amd_legacy_ssbd;
> @@ -1205,19 +1201,12 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
>  	if (c->family == 0x10)
>  		__clear_bit(X86_FEATURE_MONITOR, c->x86_capability);
>  
> -	if (!cpu_has_amd_erratum(c, AMD_ERRATUM_121))
> -		opt_allow_unsafe = 1;
> -	else if (opt_allow_unsafe < 0)
> -		panic("Xen will not boot on this CPU for security reasons"
> -		      "Pass \"allow_unsafe\" if you're trusting all your"
> -		      " (PV) guest kernels.\n");
> -	else if (!opt_allow_unsafe && c == &boot_cpu_data)
> +	if (cpu_has_amd_erratum(c, AMD_ERRATUM_121))
> +	{
>  		printk(KERN_WARNING
> -		       "*** Xen will not allow creation of DomU-s on"
> -		       " this CPU for security reasons. ***\n"
> -		       KERN_WARNING
> -		       "*** Pass \"allow_unsafe\" if you're trusting"
> -		       " all your (PV) guest kernels. ***\n");
> +			   "*** This CPU is affected with erratum 121"
> +			   " 64-bits PV guests are able to cause a DoS (XSA-9) ***\n");

We try to avoid splitting log messages, so that people can grep easily
for them.

I would also add a add_taint(TAINT_MACHINE_INSECURE); here.

I wonder however if an update of the advisory would also be needed, as
we are modifying the applied fix, and hence the text in the advisory
no longer matches the code in Xen.

Thanks, Roger.

