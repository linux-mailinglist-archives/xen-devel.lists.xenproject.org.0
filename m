Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K6GdKDzBKmokwQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:07:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3808672962
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:07:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=wqb8QNnC;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1335591.1597784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXg4K-0007Z1-Cx; Thu, 11 Jun 2026 14:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335591.1597784; Thu, 11 Jun 2026 14:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXg4K-0007W9-9k; Thu, 11 Jun 2026 14:07:40 +0000
Received: by outflank-mailman (input) for mailman id 1335591;
 Thu, 11 Jun 2026 14:07:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wXg4J-0007Ua-1e
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 14:07:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXg4I-00G0hP-4C
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 16:07:38 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2ac114-2eae-0a2a0a5409dd-0a2a4502aa26-48
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:07:38 +0200
Received: from [52.101.62.32]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2ac128-af86-0a2a45020019-34653e20aef8-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:07:37 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM6PR03MB5289.namprd03.prod.outlook.com (2603:10b6:5:24c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Thu, 11 Jun
 2026 14:07:34 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 14:07:34 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1w4zz0jzXX7qyd0xL5HD/9XK2HcjzUMgU2WYNyJ+wZGNk7BvXF/dpz+slyq8V57xg1334G7JKarWFz2/368plMJ1ryBTQDbwrqvvGgeSDaz09ThFTyYByw2Jc7yh6ZDrynVKehDzvfvlIWCwoxo2ZdoSvQQcQoZpLPrdTikek/gagjgBjKHiML9enTISUwYv47nLGn37SEN4eKSG2HNyePCOfJQINMxN5AsKxZyxeLtwpYTfmiXapEt2Byn8dCESAFtCJXAlZRbpygbj6ILg3W85um/JnWwsY4Bhw6x/hwqZrl3520H5w79AkmSs4Kdfp2Mk/87GAR0xdz3kFpZwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdIFMsg6ROC+4Esu5v132n3LafhJovr9ECI+32VkfhM=;
 b=DpkijUP83SvzoaKhSF/22QXhcGvD0FWkojjqPVEomkU+y0mc2YQtFXt0xYQilHE2GJ/ctc4StxHbNIC2lQzqA9FLIRHcB+F11wFS7VH2WTu+tA25r9ms10nwS3po40BhUzNTw4Qb8HGKZVretB1WHRl7oz1flda0fFZHXKw2g1EHaX7rGtm219GUT1dXeO6PAJWkMTuzt3EPrcxf636Gyr63u5OeagiaHJHmjM76iF1f4dNtdiuwyJmvYnYkdIveZ+cCQmt14PPdih7Xo0UcibthvkjOTCH3A2Ew4zpCbSroTT6JNv22wkN2Yv2D1Ii+8QGaUDhK4V6aZTOi5ywbcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdIFMsg6ROC+4Esu5v132n3LafhJovr9ECI+32VkfhM=;
 b=wqb8QNnCNsp2lQg8LkY90gcRS5aUed95rc5pWhoyoJs9jbIIFD63A522b62FBbQoh1hhyf6pNuhzQH7TtmTlelrETypD5BalZTnUz1I6pXELTpNkWctJT/f7zdy46tnCFbJKbYKSUH0gAeRdcGkZsLU6ZhLmRDvnU65QodTf20M=
Date: Thu, 11 Jun 2026 16:07:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH for-4.22] xen/x86: Change stub page allocation/free
Message-ID: <airBIotw8RKqjtmv@macbook.local>
References: <20260611075342.58428-1-roger.pau@citrix.com>
 <1639ef93-4260-4a2b-bcfd-d39a059c1c56@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1639ef93-4260-4a2b-bcfd-d39a059c1c56@citrix.com>
X-ClientProxiedBy: BL1PR13CA0278.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::13) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM6PR03MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: 83429e6f-e390-4184-3d40-08dec7c2c898
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	TnHljxArs+xiv11VYM3oSIc1vInVeQrlZNWVZ4J46RmZ/azUpu7wCnQ1gnDc+44Uq39Rd/rjpvzdIAzdhHmthes8mrLT3Gk36YBCM+oH+B23XNExgiXJDuQHpFUSp+/pX0g33ZIm2xnkWizMiT8SF+Es3LulLZyyWQUQ8/iYJEW8PxO3nWJlhiPGJ47+YW0v20kg5qFDBXlGXnzeW2/6D24BPP+4wiNBiIsIJTTsTJq8op1+R9Zsr6soj5gFslqgITb1UBUvdR550mxyGy75AaubUvr6FMvxd4W2dd/mBGE/FENTbr5VXCJ+Nyw9zYpRLtaEDi8PgLInphkny9DFuq8UR6rMJ50LJNASOjVjZmbgoXHQRUxRbE27CYss6au23pJ5Ft0cc05Y+NC7XhiTHwrg3j2NcbxTPUWrMqx6V5QY4KnAGmoPUthqxuy4siLOrpnTQZEcYzm2LcvppVMFxDwKCdgogNq+u0a96pEvPonWVRhMWEEoY6xgpBO008reKxgbIYGlH1pTiWR9o+AqawVmbawO7AbzNQprZnUXhXAvw6BQbjYvdrbLruVers2/YMuyL2fvuIABWrEDioJO55vcTf5nIXjollz1Qt2E6HQxJFz4d6uUee6YCCy21g85xiroaLoPyCZ9hA8AhcoTXuQaBO/hrdwjYQngkqAXipxFpRU0jRjjDEmovSWz8GA1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFJkZUg5WDV5cENOY0ZwaDVjSHVWOVdpVjhienl6OW5FZkx6NDF2Mi9QSlpl?=
 =?utf-8?B?QkE2bzVsTzJxcW8wUjZUeWd4amMyYUVEd3FUVUpERnBsamZVVlp5T0JmSFhj?=
 =?utf-8?B?K3VTOVR5S1ZIT25NZFd3L1dCMFhMUGFMdDQxQ0UyQXJBRER6SkRCNW5rRUtj?=
 =?utf-8?B?MURxQ3lWdE5QcnMyYXlFRzdZZ2E2a285NXdVVWZNTkZmU1RIL3l4aFoxUUJu?=
 =?utf-8?B?bDJCb1N6VUlpQXF6cUx5RVRTRzg3dFgzZ0VLbDg4VFVyL0FidmtLNm9rc2pU?=
 =?utf-8?B?VDhJclhmNndaVUJxVzV1aG43VE1qUVV6YlMzcFpjVXliM2tNSTFXUXBxV1ZS?=
 =?utf-8?B?bDVIVmdaSERtaE9RZ1MzWkZRWUZYNDZMS2g1T1lOaXFjK3Z0RldGbVBVOFhW?=
 =?utf-8?B?aWZSWHBuUUQ0UnI2Qlk4OFY4S0V5UHFBQ0swQ0x2Vm5aNU13MzJReW9uRWdo?=
 =?utf-8?B?VGVwYWVOMHBWTzRMUXpJYWplMjh5Tjk4c1NMd2tqWE0xNUlYUDFrSUxzcnc3?=
 =?utf-8?B?TGk2TjJwYklRYU05ZHlraEh5bUNSQmZOWnE0ZUlXR0ZkWkdXKzgxc0k0T2Zo?=
 =?utf-8?B?djhWUTVuSm1LcTg2UzdyL1V4VUthQXdBQlhCR1FBck1UYzdjR3A5YTkyckJE?=
 =?utf-8?B?VkZOdm11SDNiM0gwKy9uelhNNUQ5cHJSY050cUt5NDBqelM4ZmFJVXdmUUJJ?=
 =?utf-8?B?M1VEeHkrenBHT3hPSWYrcGZDUHNaNHJEazN5ZjBRWklSemIyaEhITE5raFpF?=
 =?utf-8?B?YklMWTFWWGRQWi9wN0Q5NU5vWUNaL2xnOUE2VjVwTkt0STFZY0JaeEdiUXgw?=
 =?utf-8?B?SjJCTVZrVjBXcDZ2T0tXYTMremNoMUpOZ3JZYTVUQStVVHFjZHd5cytzeVZq?=
 =?utf-8?B?Y0E1akVwbjFHOVZqcWxEdm84dmwrWjV1ZEFaUmRKanUzN0VicXlMbW9iZlI4?=
 =?utf-8?B?Z3RCR0hIN0Z6L2J5UVhqMUxGbFBjMFA2M0haRzJtRVdaWmYrNTZCTzYrZEQ5?=
 =?utf-8?B?d3BUYWM1UkdUSURvRGxBT3FzcEQ1dUJCb0t5SjEvWklmM1p1RHBwK2JoRi9w?=
 =?utf-8?B?NklDZzhUbnRZZWVFbVlSZ3NzcCtuVWZxUCtlWlNYRUV2c21zRlVWUVlXMXJ3?=
 =?utf-8?B?eVYwbDcxb3phM0hWNU96Nm1QVk9sb2dMWlk0SXZhSmVtMkJueHliRDNxN0pV?=
 =?utf-8?B?R05HUXE3TFNIQ2JIUnhKa0ltOW00MzZCR0lOeks2bVpzUWw1R282eXMrWCtS?=
 =?utf-8?B?N0ExalUyL0lOeWl6cUMrOVBQaGlVYnBFcXdYWEJVNmtNNHJuVmlpUDRQSlRU?=
 =?utf-8?B?UXVBalBKN25UT040ZXZBN3JOdy8ycVVyUjVZUTdHV2g0bDBWUlZFV2VqU3lM?=
 =?utf-8?B?MXliZ0pCRWo1cm9XUC9Mbmd2SjlObU9zaitwMVE2eFBEdGJKN0tNbmJOaWNU?=
 =?utf-8?B?dndCWmVLV25JbUw3MlBUMVJMelIwZHVSSDRWTHlJaGdzZWRZV3RYQnNveXhB?=
 =?utf-8?B?NXBYQ3NtbU5PTXJWYVA5aThZbEJrYkRZSEYvYWVXZjB4Y2gzRFN2bWY0NmZE?=
 =?utf-8?B?RUlkNUk4bUFpMXg3dVBiU3ZaelBSVkJFdEY1NGVpR0IxaDNQZHNkVXZ4cWp6?=
 =?utf-8?B?eVRjeFNHUVdwWCt1Qkg2Ty9McE83WXJaQS9uOEgwNVZzKzkyaEl5a3AvWStY?=
 =?utf-8?B?ajZOM1o3b25FTERWR2NTRithVFBncTY5UjR4Mm40YldlRmNHdFU0RmhwaWFB?=
 =?utf-8?B?Z2R1U3hraEhSalhSVlBmSEhOUUx1RGtTdjlTdjRldTNRUjB1OStLMVRGNFZh?=
 =?utf-8?B?S21hL0JycXB5R0hvWElIRVlxdExDUlUvN0dEMHFpUFpuR2IwbTkzUlNvckk5?=
 =?utf-8?B?MlR1UTYxblNVc2JVb2VibFFyTlBmYk85UHl4ZHQ4YlNWU1FMYVhYT2E4QlJn?=
 =?utf-8?B?bzFmenpiaWthSVBqcVNyMGtHRTRmeTJ3WVFRb1gwd0c1MXI0WDdwUjk4b2VY?=
 =?utf-8?B?TFlNMTZMUzZPaGpDNklBcXhDNjdQZ3lIeVQ3eUQxL3psQjNiSFZ1RDdCMWVL?=
 =?utf-8?B?cVR5VE4vSG5TNkpXb2JtZFp5ZXFmMEZlY0dnN3l6bHgzR1ZqRi82SUxXMjJ4?=
 =?utf-8?B?bEJsNGp5R3NUK2RLU29nSUZrbFpzUXZFSUVxOFErQWdIM1JZU0h4QWVZVFRi?=
 =?utf-8?B?UmNjUUxIcFJGWTMraS90N05wYzlrZUJVVG9KQnVpSG5QOTM2NUtweURQQUh4?=
 =?utf-8?B?ZXoyQXpjLzBMOWhTbVNyckpicjBwYXFhdTJ3UEhOM3dUbmdnaWQzb0M4QU9O?=
 =?utf-8?B?TnRqWDJCZ05POWNUUGlpOUQ2UnRrZXBzUnpmM0xSbUYrc2Nuazc2Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83429e6f-e390-4184-3d40-08dec7c2c898
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 14:07:33.9053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zGQq/1sUPTy5nUyTsIEpQ+g/hkT75A1EXu3G5aAqyUftGelaFRRxfwoo8ntx9rZ/uRD28a78gY6eQmg0KVpTqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5289
X-purgate-ID: tlsNG-720697/1781186857-A937C161-44D4427B/0/0
X-purgate-type: clean
X-purgate-size: 9201
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:jason.andryuk@amd.com,m:jbeulich@suse.com,m:teddy.astie@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,amd.com,suse.com,vates.tech];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:email,citrix.com:from_mime,amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E3808672962

On Thu, Jun 11, 2026 at 12:38:46PM +0100, Andrew Cooper wrote:
> On 11/06/2026 8:53 am, Roger Pau Monne wrote:
> > From: Jason Andryuk <jason.andryuk@amd.com>
> >
> > Today the inline tracking of the stub page is problematic.  0xcc is used to
> > indicate unused, but it is also a "clear value."  A !CONFIG_PV build with
> > smt=0 will bring up CPU0, bring up CPU1, bring down CPU1, and free the
> > in-use stub page.  CPU0 or subsequent onlined CPUs can write to the re-used
> > page.
> 
> I'm pretty sure a CONFIG_PV build booted on a FRED enabled system will
> do the same.
> 
> This is the other case where we (now) forgo writing out the LSTAR/CSTAR
> stubs.
> 
> >
> > The new approach uses a global, CPU-indexed dynamically allocated array of
> > stub addresses.  However, to handle NUMA aware allocations, we cannot
> > allocate all the memory in advance because of the NUMA dependency.  Take
> > advantage of the fact that Xen will attempt to contiguously pack CPUs on
> > the same NUMA node (see normalise_cpu_order()), and on CPU bringup use the
> > same stubs page the previous CPU did if suitable.  Note the code would
> > still function properly even if CPUs from NUMA nodes are not contiguously
> > packed, it just consumes more memory.
> >
> > stub pages are no longer freed.  They remain referenced in the global
> > CPU-indexed array and are re-used if the CPU is re-onlined.
> >
> > stubs and node_stubs don't have an explicit lock.  During boot they are
> > accessed single threaded.  During runtime, &cpu_add_remove_lock serializes
> > access.
> 
> Is node_stubs stale?  Stub(s) should be capitalised at the start of the
> sentence.  In context, it's not clear that it's a variable name, and it
> doesn't need to be the literal variable name to convey the intended meaning.

Oh, yes, that's a leftover from the previous version that I picked up
from Jason.  What about using "The stubs array don't have..." to make
it clear it's referring to the variable.

> >
> > Fixes: 7a66ac8d1633 ("x86: move syscall trampolines off the stack")
> > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > There are other even more simple options here: for example Andrew proposed
> > to pack stubs contiguously in both the physical and the linear address
> > spaces, at the cost of possibly loosing the NUMA memory affinity between
> > the allocated page and the CPU using it.  We have decided to go for a more
> > conservative approach here, that keeps the same properties as the current
> > logic regarding NUMA memory affinity of the stub region.
> 
> Part of the suggestion was made in error, but there's a second aspect
> which I'll discuss at the end of the email.
> 
> > diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> > index 4192edf635b6..cddf8806c877 100644
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -2089,9 +2089,7 @@ void asmlinkage __init noreturn __start_xen(void)
> >  
> >      init_idle_domain();
> >  
> > -    this_cpu(stubs.addr) = alloc_stub_page(smp_processor_id(),
> > -                                           &this_cpu(stubs).mfn);
> > -    BUG_ON(!this_cpu(stubs.addr));
> > +    init_bsp_stub();
> 
> Personally, I'd name this init_stubs().  It does work for more than just
> the BSP, and the bsp_* part is only really needed for clarity when
> there's a matching ap_* variant, which is not the case here.

Np, I will change it.

> >  
> >      bsp_traps_reinit(); /* Needs stubs allocated, must be before presmp_initcalls. */
> >  
> > diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
> > index d8fd71ffab37..3282392317f4 100644
> > --- a/xen/arch/x86/smpboot.c
> > +++ b/xen/arch/x86/smpboot.c
> > @@ -641,41 +642,61 @@ static int do_boot_cpu(int apicid, int cpu)
> >      return rc;
> >  }
> >  
> > -#define STUB_BUF_CPU_OFFS(cpu) (((cpu) & (STUBS_PER_PAGE - 1)) * STUB_BUF_SIZE)
> > +/* Dynamically allocated, indexed by CPU.  Store physical address of stubs. */
> > +static paddr_t *__ro_after_init stubs;
> >  
> > -unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn)
> > +static bool assign_stub_page(unsigned int cpu)
> >  {
> >      unsigned long stub_va;
> > -    struct page_info *pg;
> > +    paddr_t addr = stubs[cpu];
> >  
> > -    BUILD_BUG_ON(STUBS_PER_PAGE & (STUBS_PER_PAGE - 1));
> > -
> > -    if ( *mfn )
> > -        pg = mfn_to_page(_mfn(*mfn));
> > -    else
> > +    if ( addr == INVALID_PADDR )
> >      {
> > -        nodeid_t node = cpu_to_node(cpu);
> > -        unsigned int memflags = node != NUMA_NO_NODE ? MEMF_node(node) : 0;
> 
> I think you need to retain this calculation of memflags. 
> MEMF_node(NUMA_NO_NODE) doesn't work as expected.

I think I'm confused, MEMF_node() macro is:

((((n) + 1) & MEMF_node_mask) << _MEMF_node)

So when n == 0xff the memflags result is 0 (0x100 & 0xff).  And then doing
MEMF_get_node(0) gives you NUMA_NO_NODE, so works as expected?

> > +        nodeid_t nid = cpu_to_node(cpu);
> >  
> > -        pg = alloc_domheap_page(NULL, memflags);
> > -        if ( !pg )
> > -            return 0;
> > +        /*
> > +         * Attempt to use the same page as the previous CPU if possible,
> > +         * otherwise allocate a new one.
> > +         */
> > +        if ( cpu && nid == cpu_to_node(cpu - 1) &&
> > +             PAGE_OFFSET(stubs[cpu - 1] + STUB_BUF_SIZE) )
> > +            addr = stubs[cpu - 1] + STUB_BUF_SIZE;
> > +        else
> > +        {
> > +            struct page_info *pg = alloc_domheap_page(NULL, MEMF_node(nid));
> >  
> > -        unmap_domain_page(memset(__map_domain_page(pg), 0xcc, PAGE_SIZE));
> 
> You've dropped this memset() of the whole page to 0xcc.
> 
> As a consequence, the stubs for not-yet-onlined CPUs, or for gaps
> because of NUMA, are rubble yet mapped executably.

My bad, sorry, I will re-add it.

> > +            if ( !pg )
> > +                return false;
> > +            addr = page_to_maddr(pg);
> > +        }
> > +        stubs[cpu] = addr;
> >      }
> >  
> >      stub_va = XEN_VIRT_END - FIXADDR_X_SIZE - (cpu + 1) * PAGE_SIZE;
> > -    if ( map_pages_to_xen(stub_va, page_to_mfn(pg), 1,
> > +    if ( map_pages_to_xen(stub_va, maddr_to_mfn(addr), 1,
> >                            PAGE_HYPERVISOR_RX | MAP_SMALL_PAGES) )
> > -    {
> > -        if ( !*mfn )
> > -            free_domheap_page(pg);
> > -        stub_va = 0;
> > -    }
> > -    else if ( !*mfn )
> > -        *mfn = mfn_x(page_to_mfn(pg));
> > +        return false;
> >  
> > -    return stub_va;
> > +    per_cpu(stubs.mfn, cpu) = PFN_DOWN(addr);
> > +    per_cpu(stubs.addr, cpu) = stub_va + PAGE_OFFSET(addr);
> > +    return true;
> > +}
> > +
> > +void __init init_bsp_stub(void)
> > +{
> > +    const unsigned int num_cpus = num_present_cpus();
> > +    unsigned int i;
> > +
> > +    ASSERT(!stubs);
> > +    stubs = xvmalloc_array(typeof(*stubs), num_cpus);
> > +    if ( !stubs )
> > +        panic("Unable to allocate stub array");
> > +
> > +    for ( i = 0; i < num_cpus; i++ )
> > +        stubs[i] = INVALID_PADDR;
> > +
> > +    if ( !assign_stub_page(0) )
> > +        panic("Unable to initialize BSP stub region");
> 
> \n's for both panic messages.
> 
> With the above stuff addressed, I think this is looking ok, but
> definitely subject to Jason confirming it resolves his issue.  And for
> 4.22, that might even be sufficient to go in.

I will go with the adjusted version of this patch for 4.22, if it
fixes Jason's issue.

> The other thing I want to discuss is this:
> 
> >      stub_va = XEN_VIRT_END - FIXADDR_X_SIZE - (cpu + 1) * PAGE_SIZE;
> 
> because it creates 32 virtual aliases of every stub.
> 
> AIUI, this was a hard requirement for the old freeing scheme, but the
> optimisation guides recommend against creating aliases like this. 
> Besides microarchitectural tracking/safety effects, one consequence is
> that we end up with 31 aliases which have unsafe branches in them;
> disp32's depend on the linear address the code is executed at.
> 
> The ideal solution would be allocate VAs just like we allocate paddrs,
> and for the map_pages_to_xen() be beside the alloc_domheap_page(),
> rather than outside of INVALID_PADDR check.
> 
> This reduces the amount of VA space (and L1 pagetables) used by 32
> times, and removes the risk of accidentally using the wrong alias.

I think the point of having a different page for each CPU is that we
can remove the page-table entry when the CPU goes offline, and hence
any mismatched attempts to use that stub region by a different CPU
would result in a page-fault.  In practice I'm not sure how useful
that is, at the end we already clobber the stubs region with int3's.

I don't mind looking into that as a followup change, but for 4.22 I
would rather take this less risky version.  The mapping adjustments
will be a different patch anyway, I don't think it should be squashed
with the content here.

Thanks, Roger.

