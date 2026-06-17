Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 59OEFA+7Mmri4gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 17:19:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839E369AE71
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 17:19:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=a2dF5Pho;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1340515.1601504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZs2n-0006n9-ST; Wed, 17 Jun 2026 15:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340515.1601504; Wed, 17 Jun 2026 15:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZs2n-0006kN-Og; Wed, 17 Jun 2026 15:19:09 +0000
Received: by outflank-mailman (input) for mailman id 1340515;
 Wed, 17 Jun 2026 15:19:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wZs2l-0006kH-VB
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 15:19:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZs2l-00E3Y4-4Q
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 17:19:07 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a32bae2-bab6-0a2a0a5309dd-0a2a4501d4da-30
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 17:19:07 +0200
Received: from [52.101.43.6]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <roger.pau@citrix.com>)
 id 6a32bae9-e031-0a2a45010019-34652b0678da-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 17:19:06 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH7PR03MB7004.namprd03.prod.outlook.com (2603:10b6:510:12f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 15:19:03 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 15:19:03 +0000
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
 b=j0gqzMmwr1ysyxphufcMqc80XQtyE69mLQ9o1JpS/tkuYIRamAzrNk1qUzVYM3lw8mlnzFo31Q7PCaU6sMj/RxW9UKDm4oCUpS/aN9AJ/p/uJtDT6NihK33xGOyK6mgyjliHCnqkdOD3ApYXDCby5/NbEsYlMYRae/M9ztkk4TuuwZCXTCcLgdO8fk3ClG5SdVPhOPlP7+G0/5Jt11zjlX21l7C74NBqM2r2BkfbbkyLMyxMtSHnP3BGMLzvQbeLFm9FNgl2YMJGJ7P2fASJa+qA6lSVmu6RzvglIHbedz7deDRZsWKVZHuixgHs0JmwxYT6isMNtYynd8xRpDP1Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pn+Th8CsRrWFe5cH3Qkgtst+UYl1medopOqeOgFKw/k=;
 b=HqdsrknA4u13+NRNGfh5K1NRswU0IrzOQK2kVSQoyU8j0jGUBnYFk7dionz4JzjKYzgGzhaPi2cVi9Uiqgxfxn2SoBJ6+xTVSeK5ASi7o1xf6cfnXnA0gA5bVvEd5+oj/rK9tZY26LEaQ/egRKHasax1s4S/Riqi2qunt28kGE+/l7mrEnSvSbw7O07/htFUBTJWEhhcyWI4FfO2UdiB5xhKStG3K7scg8t/Or5jBBGEtUs9Y3mj35L4EhsMJH3gi7TxtNyumkcP+Kg4GJ23saBmfndnlKcZRxrUI/JbKIbvWsgt99pqeYzz4yFGX6IY6BNGOd1ElzucTdWof2WyYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pn+Th8CsRrWFe5cH3Qkgtst+UYl1medopOqeOgFKw/k=;
 b=a2dF5PhoHopsw25wJEckZ/SBmfUJUQvKVj46yjPpFz4yj2LgbAI+hvji9SkpUEVD04mVtbVmqLYpnoiByY0Kspwj4G/21UHvRo6FUYrSpxXQE3JOJw+NhD7naIelfJP5vNfQVSFszlKWDdEIUD4495OJ6KQGDL5HGOsI4HIx5CU=
Date: Wed, 17 Jun 2026 17:18:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 for-4.22? 6/7] x86/domctl: don't imply I/O port
 permissions from I/O port mapping
Message-ID: <ajK644guPV3lfJde@macbook.local>
References: <ad1eb834-b2f2-4db2-b2fd-9d7f5bb857a9@suse.com>
 <e88a6015-8867-41a8-907d-b6749b1d2549@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e88a6015-8867-41a8-907d-b6749b1d2549@suse.com>
X-ClientProxiedBy: MR1P264CA0038.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::32) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH7PR03MB7004:EE_
X-MS-Office365-Filtering-Correlation-Id: e44c79c7-8ca2-45d9-6c7d-08decc83c3e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|5023799004|4143699003|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ukRbyZaj37dZp07wX73Lbt/hfCCmHTzv89vBYTvbTHe9+FJ7oNSvwERFHpfr5Sp/RXJca8sh2V9zZPQZ+CNLnbZpChEqZgLzW/w0gSbz0jgr1cFhfYr6AaW1Ukgw1BMcX7g7wKdcXldMgfsdxqBrlEkQL/qnhwK2wGWx+kjvxd4j+rJm9CgCAQ5P2aMZxH6Px0k1p+FsKuwDcCuYKyacgiCqGzrIiOt7DJNtTHt+fmKMxoYrF76SMCJD4vrbzDCwtXW7WD47T//uVjr7Sr8VTPbCPZhMS+nEYMleBul++WUlNv14mRGEwoJyGEUO957a6YSXCFscAOK0mcCwPjOxbqP7d8byzjc+IMc0swVa/C7GiN3hw93HiSD8VOEH1ttwe3hLusOl38HL5FGDfciKkidOxk0+UEFyYCEN4lXPxu9CoFnkcCdj3JcwK1em6kycLrmnCj5owwjNZhsCNW9bzRKsAXkY5SOzFyV2Bg267WQGpNnGzyy5c7uJn+eER8Px5kx9xYklPfZ9ZNkOXcNBjhQ47Nx/51G0b//X4iLsHNxGlsV7lss3oHzrHcmTEFWrWGpCrSo7S6p9AdeY4jekxu0Bnf3+g6JHCaqd0iTTOHqjO8+NYAgTR2W1+8ANxwObttTJon+AEXvmIOPqmuuuWjbTdZczNQ89NYmYBKGZbguCtxNq7iRYT3w+Fe7K3FZb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(5023799004)(4143699003)(11063799006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmNka2t3ZXVMeTRyMEVFMWk0WTBmeHJKVG1QOFE3YlN2T0swdHc2THBBRjNG?=
 =?utf-8?B?UENockJRZjlvNWR0UHNoVmdZL2U2aERzQTVyT1FPZ3VQcjlMRHNVQXBXVVJp?=
 =?utf-8?B?Z1lDSGx0TWwvRzFrTnkrN2p2VUEzdmxlb0ppbmRocU9scU1OMzVEV3p1MFBS?=
 =?utf-8?B?L2MwYkVKZXgrM1h0cGhkVU0rbFdidHp2V2V2a1Q4am9kQTA3emFGSWtwamNU?=
 =?utf-8?B?TWF2cVowZCtMa2hDTit5YnVLdzc3RC9rdXlvSnpvY3Y2eDNhWEd2UWF4dnBt?=
 =?utf-8?B?cnpYTG5oN1M0dGNqZHB2cjFYdm1nWS8xQ1pZTm9aaTE5RXRFdGxhcVJTcjQr?=
 =?utf-8?B?d0Q5bDB2VENqRy9uM3VUSitzUmx0bEpWdzV4em1ERjluVzJ3dXU3WXRpZHBC?=
 =?utf-8?B?STN2WHFpUjI4QVcxRkhQNDlhdGZTTFg5VmxpY244K3lZRWx2blBvTHUxM2Y0?=
 =?utf-8?B?YTV3WjhlYk9CWnhXaWttdU45OVlqZ2kzUnVoTUY4Tng5NGk4RzVWMVlQQndy?=
 =?utf-8?B?b3dlZkE0T1JlRXo2WHZHUjRzUWo5bUpHeEZXNEgxYndDRnBmM3dycDIva2p5?=
 =?utf-8?B?UlVWZVk3U0hHeUNSQ3dyYjEwVUxlYUNRbTQ2SHR0OC9RVStubHI0VWxUY3Y1?=
 =?utf-8?B?cGpQYW1PaEtYY0lTMVhpbTRBSTUxZ3BTQ1h4clZIMngzT2M2ckNVZnVtRnNQ?=
 =?utf-8?B?Uzc5R2pkYjVNcTZUMnA2Mi9scStzdmUxdmJ1WWdGNnEvTnV2b0I0Mk54U25W?=
 =?utf-8?B?R0JDK0xDVWlpTjJmdXFneitLWkpKVGRKLzN2ZWVJMU9CMENoQkpjNjVaejRG?=
 =?utf-8?B?RzVoMUdObE1mK3Z3UHhQcWNvS2g3RkhqNS9XYVp0NTZpeFpZUHFkN1g2azhW?=
 =?utf-8?B?RFFaR1FYbUs1TXh1cVB4NytNNElENG9KZmtQMXNTak9XZDVYZGE4VHNUbmZm?=
 =?utf-8?B?cUkyMWY5QWc0bWxpZmFacWIzT2huZ1l2YjU4K1pRVFpxN294Wmd0TTN4SENV?=
 =?utf-8?B?ZFZZM3RDQ1VielhIVWVHMEdHR01mbzJIRHhNNnZYa3F0N2lybUp0bTN4L0hW?=
 =?utf-8?B?K24zTWErWmZHUis0YmU4VkRDRWVzQjFCVFA5WWNWS3RxNXE2SUVnVStwRmFz?=
 =?utf-8?B?cm9iUy90S0ZPSTNkR0ozUjVxUmxnL0tDRWhiMncxNnpFaEFvcDl6WFBNTG5r?=
 =?utf-8?B?ek5LY2dZNDhRU04raEFiNU5ZU0pVRGtkOUozb29pWmp5dURsT2JBa1NEMHY0?=
 =?utf-8?B?V0hiU3M1NmNDNWU5bzNHSXhKK04vMkcyMEJnck1MdHpFaTVYNEhOREpJWWpt?=
 =?utf-8?B?a0ZFQWpMVkhqSU9Hb1NhL1VwTGxMcDFlU3gyWWZDNUM2ekVNZmxVdTZyRERL?=
 =?utf-8?B?TXJOUnFuUDJnY3RydnQ4TTJzandXY0p5ODdKYllZY29WdnVMZTlHT0xNdTBR?=
 =?utf-8?B?dEgrZ3BFR1FrQnhnYUx4aGRTUC81R1lmQ2tRcy8zVmFQTmtPOGd2VjVoQm94?=
 =?utf-8?B?T1RsdHdpbmQxMXhYYWU0TDMydW8xYW15ditDcFhhcC9XTFFWandtdHJSQ0hn?=
 =?utf-8?B?eUc3QnVMd3ZHUFJJbDhrdTVZWWdpTFJDdktnWEdwSzFqamx5emN2b3dWMHhh?=
 =?utf-8?B?K3Ayc2NXd2dURkpWdW05akFQYXZLK3NUcnNRQUFHaHdRdG9NNWxXYzlxZnFa?=
 =?utf-8?B?WVYxRktBekwzYmFPOExWTHcybklQVHVnQS9nbUFkd1NXdDlYMFl1dE1tNStG?=
 =?utf-8?B?K0tsV1dHcnFQZzZvRHhGbUpTMllKRFF0THlnNG10QVBkMUhMMVJNbTBuR1B1?=
 =?utf-8?B?aE5XRFZGMi9VeGNOSnJ3ZjJVZFFaNjduRHh2UFN3U25EZ2VmS1NxVkNqS29V?=
 =?utf-8?B?elZTV2kxM1ZiMFp0WDd2czRQQ0RLQzdtWHB4T0ptZVlEakFaNWhQN3lWRTRH?=
 =?utf-8?B?bDdBa0hDMSswa2RQUVRHUE5oMjN2Nm9vRnFzRWRpVFA5aXF0UVdtNzdCcE5k?=
 =?utf-8?B?TFFGbXZ4WjYrQWN5ZDdNaGlNS0w4YkRHQlJxUkp1NkR3WSszRGM2RmV0SnFq?=
 =?utf-8?B?MEdVbU91cnF2aU1BV09udEluY2RlZlc1Q21oWnhab0dUaG4xYnFuSndDNVhs?=
 =?utf-8?B?T3QrZHZLQnhEZW5YTHpzbmVhQ1lSTDZPR01YMFA0QU1hQkNaN2c5bXBuQnlO?=
 =?utf-8?B?VG55ZU9Sb0IyRWUvUDdEbGZPVHcvakVhTVJFSVh0akpFQXl2T1ZjRVhoVUhj?=
 =?utf-8?B?RjZ3MW9NMitPN2xBTDhOaFFOcmwrdjdhSStTdWE4ZWEyUkNTMDdsZ29jekZU?=
 =?utf-8?B?dTN2aWdXNy9Zc2JmN1k2TlpSd0dnVWZNQUpleFIvWXVpRUhnU2lGUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e44c79c7-8ca2-45d9-6c7d-08decc83c3e9
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 15:19:03.5520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RqTduYPSSznctLATIbysTRDD6isJ0Z3Dno2LJPIPa6/LSdx/yPiw6adaOcHE66f5f3eXd0nLA0pYNmCI5xCetA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7004
X-purgate-ID: tlsNG-d62444/1781709547-CDDB3E30-8968A614/0/0
X-purgate-type: clean
X-purgate-size: 5810
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
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,gmail.com];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 839E369AE71

Overall I would defer this change to the start of the 4.23 development
window, and commit it then.  It's IMO a bit risky to change the
interface behavior so late in the development process.

On Wed, Jun 17, 2026 at 11:30:04AM +0200, Jan Beulich wrote:
> Rather than granting permissions when mapping (an operation that DM-s are
> allowed to carry out, while they can't invoke ioport-permission), check
> whether permissions actually were granted when adding a mapping. This then
> also allows relaxing the necessary locking.
> 
> While no longer granting permissions upon mapping is "only" at risk of
> breaking guests, no longer revoking permissions upon unmapping strictly
> requires callers to additionally invoke XEN_DOMCTL_ioport_permission. Or
> else a security issue would arise. In-tree code already does so.
> 
> While there switch to using %pd in the two log messages.
> 
> Fixes: 192c4dabc344 ("domctl and p2m changes for PCI passthru")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> libxl has libxl__grant_vga_iomem_permission(), but I can't spot any I/O
> port equivalent (nor a revoke counterpart, btw). Everywhere else MMIO and
> I/O ports look to be treated equally.
> 
> Qemu uses both xc_domain_{iomem_permission,memory_mapping}() in
> igd_write_opregion(), but only xc_domain_{memory,ioport}_mapping() in
> xen_pt_region_update() and xen_pt_{,un}register_vga_regions(). Is the IGD
> region special in any way? Clearly this can't work from a stubdom.

Hm, I'm unsure that code will work correctly after the change here, as
xen_pt_register_vga_regions() doesn't grant access to the IO/memory
regions to the remote domain ahead of assigning them?

> ---
> v2: Avoid double evaluation of "add". Add ChangeLog entry.
> 
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -14,6 +14,9 @@ The format is based on [Keep a Changelog
>   - On x86:
>     - Enable pf-fixup option by default for PVH dom0.
>     - The libxenguest bzImage loader now uses the system liblz4 library.
> +   - XEN_DOMCTL_ioport_mapping no longer implicitly grants permissions for the

I would explicitly mention access revocation also, FTAOD:

"XEN_DOMCTL_ioport_mapping no longer implicitly grants or revokes
permissions ..."

> +     port range in question.  XEN_DOMCTL_ioport_permission now needs invoking
> +     up front.
>  
>  ### Added
>   - Support for per-domain Xenstore quota in C xenstored (includes
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -714,15 +714,35 @@ long arch_do_domctl(
>              break;
>  
>          hvm = &d->arch.hvm;
> -        iocaps_double_lock(d, true);
> +        /*
> +         * NB: The double lock isn't really needed when !add, but is used anyway
> +         * to keep things simple.
> +         */
> +        iocaps_double_lock(d, false);
>  
>          if ( !ioports_access_permitted(currd, fmp, fmp + np - 1) )
>              ret = -EPERM;
> -        else if ( add )
> +        else if ( !add )
>          {
>              printk(XENLOG_G_INFO
> -                   "ioport_map:add: dom%d gport=%x mport=%x nr=%x\n",
> -                   d->domain_id, fgp, fmp, np);
> +                   "ioport_map:remove: %pd gport=%x mport=%x nr=%x\n",
> +                   d, fgp, fmp, np);
> +
> +            write_lock(&hvm->g2m_ioport_lock);
> +            list_for_each_entry(g2m_ioport, &hvm->g2m_ioport_list, list)
> +                if ( g2m_ioport->mport == fmp )
> +                {
> +                    list_del(&g2m_ioport->list);
> +                    xfree(g2m_ioport);
> +                    break;
> +                }
> +            write_unlock(&hvm->g2m_ioport_lock);
> +        }
> +        else if ( ioports_access_permitted(d, fmp, fmp + np - 1) )
> +        {
> +            printk(XENLOG_G_INFO
> +                   "ioport_map:add: %pd gport=%x mport=%x nr=%x\n",
> +                   d, fgp, fmp, np);
>  
>              write_lock(&hvm->g2m_ioport_lock);
>              list_for_each_entry(g2m_ioport, &hvm->g2m_ioport_list, list)
> @@ -747,40 +767,11 @@ long arch_do_domctl(
>                  list_add_tail(&g2m_ioport->list, &hvm->g2m_ioport_list);
>              }
>              write_unlock(&hvm->g2m_ioport_lock);
> -            if ( !ret )
> -                ret = ioports_permit_access(d, fmp, fmp + np - 1);
> -            if ( ret && !found && g2m_ioport )
> -            {
> -                write_lock(&hvm->g2m_ioport_lock);
> -                list_del(&g2m_ioport->list);
> -                write_unlock(&hvm->g2m_ioport_lock);
> -                xfree(g2m_ioport);
> -            }
>          }
>          else
> -        {
> -            printk(XENLOG_G_INFO
> -                   "ioport_map:remove: dom%d gport=%x mport=%x nr=%x\n",
> -                   d->domain_id, fgp, fmp, np);
> -
> -            write_lock(&hvm->g2m_ioport_lock);
> -            list_for_each_entry(g2m_ioport, &hvm->g2m_ioport_list, list)
> -                if ( g2m_ioport->mport == fmp )
> -                {
> -                    list_del(&g2m_ioport->list);
> -                    xfree(g2m_ioport);
> -                    break;
> -                }
> -            write_unlock(&hvm->g2m_ioport_lock);
> -
> -            ret = ioports_deny_access(d, fmp, fmp + np - 1);
> -            if ( ret && is_hardware_domain(currd) )
> -                printk(XENLOG_ERR
> -                       "ioport_map: error %ld denying dom%d access to [%x,%x]\n",
> -                       ret, d->domain_id, fmp, fmp + np - 1);
> -        }
> +            ret = -EPERM;

Should we add a dprintk here at least, to make it easy to identify
what has gone wrong from just looking at the dmesg?

Thanks, Roger.

