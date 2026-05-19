Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qE4WKvNtDGpKhgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 16:04:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8965458035A
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 16:04:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313100.1583327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPL2p-0007tt-1P; Tue, 19 May 2026 14:03:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313100.1583327; Tue, 19 May 2026 14:03:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPL2o-0007rp-Ue; Tue, 19 May 2026 14:03:38 +0000
Received: by outflank-mailman (input) for mailman id 1313100;
 Tue, 19 May 2026 14:03:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wPL2n-0007rj-Iq
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 14:03:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPL2m-009jHO-TC
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 16:03:36 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6a0c6da6-2eae-0a2a0a5409dd-0a2a45078a52-34
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 16:03:36 +0200
Received: from [52.101.83.83]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6a0c6dae-229c-0a2a45070019-3465535399a3-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 16:03:27 +0200
Received: from PA6PR03MB10266.eurprd03.prod.outlook.com
 (2603:10a6:102:3cd::18) by PAVPR03MB9137.eurprd03.prod.outlook.com
 (2603:10a6:102:328::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 14:03:24 +0000
Received: from PA6PR03MB10266.eurprd03.prod.outlook.com
 ([fe80::2cc9:8d65:65de:c005]) by PA6PR03MB10266.eurprd03.prod.outlook.com
 ([fe80::2cc9:8d65:65de:c005%6]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 14:03:24 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RVgGNV3pls8hMhvOylcNGrrVtfXws54swCdKeK/X6UIkgeZ3Db0qPgEzR2DrTkjUa5f6P5MqZLRswBps+lTXtlrYsjql6O1zIRh6ajkB4EiLFbEGlKLZ5D70/sxNxraoJdBKHpQtDrnnmJmnfQM+TUZutb2nWdRfKXOWGi7TkYZIkRDtlvrv/LkMAY2ydZAQ6YIq7R6CW2t5Fp+p5dOO/sVMyQqHzlGmtpSBqbCeLZd7H/+guFG7QVl6gl8BZHOgUFtOvOlu7XmVZUn0MVHInPk7uHh76s2n36EWZ+CpDnzMnl/XtIIsZIkBYZrC+0+vbkTaw6+phQQ4RnPjUxVBcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amr1ubwZ80QlB1dNNsSBUWh0Pz9PSTRWOqOxWC6B6Jw=;
 b=mtKZgdgYkJNPc2An6MGAY9AIOXM1QG2wr8XWGOozN8kvkLPz1yTYpMh/3WnrBAPEpECumXIu4RcoCK8P9ftENulsZL/1//264BN6CzyGQUZWR+RhQX8zugvxrNIl4IpyskPmFi26lsddPfoD2eYggs+iRIYoQYDGHRDuroh9CFRQoI3zI1f8CO9teMmHQAHXZSKG7g+xTU/iMj+zRA3V4aLHlZi8rRPx138IfL+EBO1QtVsQErDE/gsKyJvnAs1yb4GT3x7snsGFkwO3ASpyHNJ6NdZAB23IamcyucmWUKWiX6o8a64SYnsjF4VT2TMhkVLiU7h/Zf+EXSGqAoQudg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amr1ubwZ80QlB1dNNsSBUWh0Pz9PSTRWOqOxWC6B6Jw=;
 b=qHn1oFB+ZI2EtxsnC/pwsK8Y3rfhL1HfOFPGY3Aoov+V2JEIe82kb2K97jv3zG9K1tZIdCHj5eTkh1Ztm8lkvyAuH0NfZmL1AiMiLslgbHqcdfc6DAOO9Y06SdBPa1ZwU8rxA0aTiUCYJOXznAbu29AsW2fFwh4ZiwtBl5D/fGyu5glh0yTBF876wPHTH+zDTJqOEWpgvJAprIG7/HSLOfR7upRw14nXazxg69PLvghr0RsY9wNRAhRzRGKIe79DkM2y+mzcY1sgK7MBmCvh6q7yy5nOdh0XTNjiO2jPH5d2F75fQ6mIjdYpf1U/kDHjCYb+u1k1Qvh4fmwd5Klf3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <217a65dd-13e0-41cf-84f0-0155cc9df00a@epam.com>
Date: Tue, 19 May 2026 17:03:22 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: RTDS scheduler patches
To: Jan Beulich <jbeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Meng Xu <mengxu@cis.upenn.edu>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <41d236ba-a93d-446a-b29a-449a1c5f8972@suse.com>
Content-Language: en-US
From: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
In-Reply-To: <41d236ba-a93d-446a-b29a-449a1c5f8972@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::13) To PA6PR03MB10266.eurprd03.prod.outlook.com
 (2603:10a6:102:3cd::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR03MB10266:EE_|PAVPR03MB9137:EE_
X-MS-Office365-Filtering-Correlation-Id: 037d88e4-87dd-4106-4772-08deb5af64b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|4133799003|11063799006|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	P+nYi3fAqq17YQG7noU51F5SZ1WpANw2UHpTOuXHzAenAojfRnTkTp+JVLNc/uDvXLcGQlSLCzsPMl1leGk7rwDkear2IJPO084sR7OYA72wN1cXrWqJIp5qdztCW1IDT7Wo3/WW+3gpDIfdMe2BUqYZBw5nH3YaM5gktNvsdYO2Z/dHZJE82xUQKwLY+gbKuOXarboX2cZV26c2xCU27Xu+u/bo2FZgSxPAXFlMj/30fDleUZsrQjyz5lfdhPaxXXgca7TsdDzvwp3Hv5taCocoBf1HlSNQviPoHN2I9Nb2MCMPfo2AX/kMu9wH6rGuSV18s8ouHVAHqlSaLNI+MXT6kCizTJq0gKWzVF/vv8kJBHoGHWUidt8rMbye6pZ9RXUTdxLJ157HdmDtOVstnzhabQGk9An6JMcrxivNqV3n2zecD5tu4gycWQ9aAgHzvBFKCbwaFcE59YRvtyMez1TaFPFYXN2EZZwUPwMsKzgOz4gDObpZZddEwlCXIX/6a/zpzUzo93K7NQTvW2x4YS6Od+ohclwkxzac8VXSBVDr0UXFnHM68ltZWlG7OHxWmfUr8Gr189NMXDetH5WXZsp0s/sMe1sm8hj+1qY3mJcBvrU1sT4SNIXbo18k4n7MycLZ0oMqBp1v58w6j24LRW69BFvFEls8fPhwJx2s3p8dWqumwBuZJMjyAKszQAFu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR03MB10266.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4133799003)(11063799006)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0dZSUg0QThlOU1RK1pmUEVUY3lMd0FRSUNEdEtsSGNZSnJXR2tzbHJJbVdh?=
 =?utf-8?B?MHlMS0t3WmJJWXVHelJ4c0gzVFRJcnVEVVBwMlZ3Mkw5N0NRR0xoK2N2eDZh?=
 =?utf-8?B?VndoZmUwMjYyZzA5WmpDYzN5SmkzbmlrUUQ0N2gwTFAraG9WUW8yeGM1ME9M?=
 =?utf-8?B?ZG95UWdqVHZFd2ZwZmloQjdXMWFrQXpFT2Y0bHllUUhFOE04VEZBNUVSYVRl?=
 =?utf-8?B?ZkFYUWNvK1JZR3FKS094RFh4L3d5NlpsbWdRYkpxR05wMU8vZnNvZTlEazhp?=
 =?utf-8?B?dnJURTRtZUNHNFhxWE1SZktZU01RK0FidmRNVVhxT2ZHTmN1cW9YSmgzWjAw?=
 =?utf-8?B?Nm5kSXk2bHd0V2UyMFh1eHNtQ0pXU0FKTWk0UzREdW8wZ0ErclRZeDNtVTNO?=
 =?utf-8?B?bVZDUjQ3ZmVpU2Jja2hkV0lYY0JWcjhTNnU5MjFLem1nMUJoTUliQTFXdlZE?=
 =?utf-8?B?SVpWSTZIeG1uYWM1ZXNyV2Z1b0NaQzdnNGdiS1hxOThRNmJqM3JzSEg3Nm5r?=
 =?utf-8?B?RlZLTDdyeTk5MTFPem1HSUxadzdxc0JIM0xTa216RHhmVFN1ektWWG5KOWNl?=
 =?utf-8?B?Y1JlOU5TMjk1KzE0N2t1UHRCTHlxWVdKSSswR0laWWplVjRXOUVFRzMycmhH?=
 =?utf-8?B?WVpGcVVRZytMNEhUdGgycjVSV3Q5eFVpSnVQWlRTUFRBOFRwdmRaTXhmSGJk?=
 =?utf-8?B?V3BjY0grUWVtZmRjdHdteFZYbGd3NGxrT2RmekhsbUQ5djNNYnpLaGFWNldH?=
 =?utf-8?B?TWRGZ01DbFdYZ1Y2bFJkb3RKdmxGblZzZmloSEJqMmhudk9nU1VHcVlydmhH?=
 =?utf-8?B?cUxDMWp5d1lFYzNKZXRESnhCcWt1bC8zdXJyZmRFcXNxaE1GWGtYbEl3c2F2?=
 =?utf-8?B?N2lzUGpobVdtdEVXWWZjZVk5OHFvZHdoOG9ZTHpZQnVsSTBaS1hVWEpnd21Y?=
 =?utf-8?B?eUdxQUdHWHhKWTNyamhMZFdpNWkzRllyYnA1eGNland2L0ZXRW5ySFVTeFMw?=
 =?utf-8?B?b2VRVmVLZDhCb0ZhNkFqTnl3YkY5YzR3bm9LK0VFNTF0MWZ6RlpRM2FZc0Q2?=
 =?utf-8?B?N1hGMFFQS1NCbjdQZlJXN3J5V1lhR09QZERxSUZDcm11Vk1WVlNETjg5d0Rm?=
 =?utf-8?B?QjFRVE9nV1FBMlVxQnJBRzR5WDNyQ0xLVE4xZGtuTUljV0JJUGZRY0libDhx?=
 =?utf-8?B?UlVZOG9WTVZzODZkRWcxOGFqQWhCTzJVem1qLzkzcUZBMm1ndlQ1YWtZODZj?=
 =?utf-8?B?QmdaQllxbHhEZmg0OTFPWG1XWGQrbG5Bd2ZmdFltWk55ZDFQaW0rN0FXR3FY?=
 =?utf-8?B?T2ZXQjRNWEpBMlJRakVtYjdEU3FndjRHQlBUUVkwNlNJYmtWTFg4cGdGdUFl?=
 =?utf-8?B?enZwWWlaMWdVc3FsLzV0YURDQXpDOEJiZm82V2VEYVVtT2pTS0Voek80Qk9P?=
 =?utf-8?B?dk5yS0xrNkRxYmZUTGlWWGJ2Qkp5N2xDVndHRjFxNTRQNklyVkFHR1Bzb1VU?=
 =?utf-8?B?MXNhNmZEL055K1RJUVJXSllObTg4allhK3BncnpraXNJbkZTa3V5Zjg1aHpU?=
 =?utf-8?B?N1Q0Z1FKaDNsSWZlVUkvVURDeVJPTVMyVVUyYTNTa05ERWErak5abXVubXFv?=
 =?utf-8?B?TWl2Vi9hWEdqVGJORzJPMUFLMjJYa3pNSmVaamZJNWdUNlp0RXBocllOekxE?=
 =?utf-8?B?RjRwcHFwVm5yOEVDcGhqQjNOKzI1UmdSbzkxMkdzMDI3dit1dEtNT095WGpm?=
 =?utf-8?B?cmIwV2g5T3V0d1VaQXd3d0hLZnBmTUcwRDlOMkhEWE1rQkhTRTQ3Q29TR1d3?=
 =?utf-8?B?K1plLzZqM1RyT3JxR1l4TVhzYnFwSmgzOUxLTmhhWHYrR1hZKzk0QVN6eVVB?=
 =?utf-8?B?Wmdqd1hEbTh6azJYVmxMY01wNnZ0Q3l4MHdrdHgyNEVCcisxM0FZVGNZbTdL?=
 =?utf-8?B?Rkh4R2VkalhFTkZYcDF0Sm93TU1YTXdTL1hRK2ZXTkloanJuSWlNZTBLdEVo?=
 =?utf-8?B?Mytuclc1YnBnY2poUkUxYU83UmlaSzc4MVJWdmh4dlg0M0VCQmg2NGQzNFk2?=
 =?utf-8?B?QjQvYVoyVFdxWVBMcy9JN1Evd3BCTml3Wmh5UUNuY21lSFN0M3hoVWpEV0dv?=
 =?utf-8?B?ejdkbHhOc3BDNmRuV2JUUjBHb2EwL0ZiMmdjSWdNQUNUMjRDZWFnUDgvdDZm?=
 =?utf-8?B?LzRVTlY0RWlaQTVudS85bm9iRGQzcjNTVlZFWURZekJPUjlPTDA2MzZTVm9p?=
 =?utf-8?B?ZDJjK3VmTjN5clBJSThlb0xHY3UySzZUMG52REFYdnduTDNFSXA1ZWwxdXlX?=
 =?utf-8?B?RGoxQ2d3bTJ3SktqeTJwT2trcXd2bnEwbEhiV0JyaXFOY2NIUzBqK2l4V2R5?=
 =?utf-8?Q?5XbJFMvFgv7eW1jU=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 037d88e4-87dd-4106-4772-08deb5af64b0
X-MS-Exchange-CrossTenant-AuthSource: PA6PR03MB10266.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 14:03:24.7638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DzpYCIlrvylxs3Ehaq2GPQd+I+hs6mgaZSOnyCDsDArk0osrHPG30Xujg7bPT5VOHsDn5oWaAgygctswh7gAIH14CqkD9K9dPTfpEKTHd5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9137
X-purgate-ID: tlsNG-ef75cf/1779199407-21969C48-FF2F85CD/0/0
X-purgate-type: clean
X-purgate-size: 1052
X-Spamd-Result: default: False [-2.18 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:dfaggioli@suse.com,m:mengxu@cis.upenn.edu,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_COUNT_SEVEN(0.00)[10];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:mid,epam.com:dkim,xenproject.org:url,lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Queue-Id: 8965458035A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello one more time,

Small update:

The fist patch series mentioned below:
[PATCH v2] xen/sched: rtds: re-arm repl_timer after timer re-initialization
https://lists.xen.org/archives/html/xen-devel/2026-04/msg00162.html

Was reworked since cpupools forbids removing last pCPU. See v3:

[PATCH v3] xen/sched: rtds: assert replq is empty on timer (re-)init
https://lists.xenproject.org/archives/html/xen-devel/2026-05/msg00078.html

--

Oleskii

On 18/05/2026 18:08, Jan Beulich wrote:
> Hello,
>
> would you mind taking a look at two patches, both of which were reviewed by
> Jürgen and hence hopefully should be relatively straightforward to given an
> ack for:
> https://lists.xen.org/archives/html/xen-devel/2026-03/msg01341.html
> https://lists.xen.org/archives/html/xen-devel/2026-04/msg00162.html
>
> In case of continued lack of response, I guess I'm going to commit the
> patches as-is towards the end of this week.
>
> Oleksii, fyi: Generally it is the submitter's responsibility to chase acks.
>
> Thanks, Jan

