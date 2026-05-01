Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNPCEme49GkuEAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 01 May 2026 16:27:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE244AD368
	for <lists+xen-devel@lfdr.de>; Fri, 01 May 2026 16:27:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298734.1573819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIoq8-0008M2-8X; Fri, 01 May 2026 14:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298734.1573819; Fri, 01 May 2026 14:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIoq8-0008KK-5S; Fri, 01 May 2026 14:27:36 +0000
Received: by outflank-mailman (input) for mailman id 1298734;
 Fri, 01 May 2026 14:27:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wIoq6-0008KE-Gk
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 14:27:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIoq5-00C7hB-I9
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 16:27:33 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69f4b816-2eae-0a2a0a5409dd-0a2a45049c66-38
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 16:27:33 +0200
Received: from [52.101.62.68]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69f4b853-1dec-0a2a45040019-34653e44a2f8-3
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 16:27:33 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6346.namprd03.prod.outlook.com (2603:10b6:303:11d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Fri, 1 May
 2026 14:27:28 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9870.022; Fri, 1 May 2026
 14:27:28 +0000
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
 b=PGdvfVXBOTal0cY+79BU99wCl4sWBbaeHTbuRmmbW1cUxDQrvwnTS4iue5Bcgu3BZxpyl/pFgKnRUdrl3QUvngXbi1JQ2SkJlDZEKYpTXqCNlD3GbKR+YABDJbevYbVcOYJZAop/tlstpE+J2drEfFQG9KsYNsp3nUOyh7gu99M3st3XceaGag1PfBoLBEQVbQXT4Av6zTRzwRNg8g6edyEC2WQAzs3KgJXyVd9o/zfbPLneMHD6rYDOwq4Da/c1P0DZWJEYgMk5kBEaYK9obZ/dLAAACACnYdXVVT+6eflX+GEjPdZcBrAXvaZiJ57r+Xw4UfPERSjBuTbT9UJ4wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWl7oNrlUO7K4+EhdXYJHT0/IPByFYiJbp9RdZZK5Lw=;
 b=MJbIEba9cpAISLFdPSXRcap/8AMyMwpO2GyKSAkUjkc19ka4fiY1Fyt6By32esL5Dd17g6JulZpa7lYr9gGVzBr19nT9j0dpw9VdZHO7OOs/X8EPblBSqddcW2sh1xuC5N+hE9A5awGJ5aT5o9bqAR9z0Yu6B6BYGcNu7M3O/jPe7jdiZIgFyMbMmrUtJnt0RNVWxqUbaRa2SRCW1lTECl+uGq1t6JFQr/bFsLmVSPNygdteyiTRFH+giPh4KithwiWroQGJJuky623amHIbd5ZZVxEdpzMepf/LhnsInDdrKnYUo843MM7ByxZSYzskjJXfEEYDYaclncTRT/tTaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWl7oNrlUO7K4+EhdXYJHT0/IPByFYiJbp9RdZZK5Lw=;
 b=dsmyHgd3llGd01JmEZs6E0jcFCwcHMP0ry0CnqfYZMIsJcSfdUCp3L+pDyrOhipH6WlNKkhZcvK982LlK9SI9SaGFM3Obu/FLo1GnU3QQi19YDq9PyYbgj976ofiEmQ2KXEejH6GzUmRUC7kZBFzm2v5U2LAdlSDyruKOy5jjpQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <beadc1e6-a98b-40e0-85f4-dffc7b2945b2@citrix.com>
Date: Fri, 1 May 2026 15:27:25 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] xsm/flask: Fix undefined behaviour in avc_dump_av()
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <43fc4b4ed45858b2cebbc37bbbf3b70e664a0661.1777642449.git.dmytro_prokopchuk1@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <43fc4b4ed45858b2cebbc37bbbf3b70e664a0661.1777642449.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0667.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: e6e0c9b1-c481-4eab-8513-08dea78dc5e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IFtD4cCFDQ7ITrQLNRSHm3dfNHUeTNPdut3M3Bx6zu5AViHng/tIrzsbRBcEZBIZnRyzm4MdUbuCNxndGUtl6bFh4e8M0dLUkGQv9xFdso1av4BteN0jzImjZfAVYLlvAuIipjIvQfgVnJHNa7k9GbrE+8cRXkX6Zv4FW2vh6r9d5b4S/b4VeEnKoo1fm34j+jkW14kjm6sewVEA1cDyQbv6fyB96Hu9HT6FFdLpCEXmYAS7TXtuUJyGyq6rfPnriwLKmiHputcrHIgrsWv0RuxTUzernbzZYFJQUZRfvwM5xUxSDwdsObHigacyGNBA+3w8z40U6PEK8kY8k7JYhZlmYBG9vZDEaMoALugVey2RniBtn9E5jRhJBkZbLHXTTCGjq2gaeKpyoeC5/6GaDgmVa92TknT4ZbQ2kVgoyPc43+mCOu4HfLvk3QvDRgq5cW++OrFnRLVKHqOycDjL6wydCVi5eQhymnXXv1cyLrqWX2nD0bQzYTNui8xIBgz1Z2fvkO39yNs8zPTYXLOxWnD8ZCuGU6zDujKL2eA9awo+5RshnzM2R9HMzvGK0rNCyZxP1mu+mh+LH129Em69ONCl6oxor/xjXtE5ixAS0D9FyL9ci+v5/hic+hwYm9qvCF7ZsGw8ok5Jys8AnGGlL+HaEXwZ08OQU91mgtuEtR2Qw3msea1FOb5/jaI+KMxV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2p2anBCcmtaamNBR203cml6SktkT3ROTFVXVFVpSHAwbTZvY2FJemNPNkds?=
 =?utf-8?B?ZWE0d0lTWFRmZ0JxMmhNRDJwMWNVUjRneVNMeCs5eWtHSWdmZ1dvQmlRamwv?=
 =?utf-8?B?eno2Q2ZHTzN5UjBHLzRUOHNheWRkWUd1Sm9LZ2gwWVJ4L2dVTXJkaWhLSGdq?=
 =?utf-8?B?bzB2dG9hbjU5cmE1dlJHb0Y5UThLOXZmNCswMEVWMy9qbDBzVk9RSlhZRkJH?=
 =?utf-8?B?YS9RcFMxc3JzbVNHRWRXWmJyUXcwTmp1OFBmVXhOZmRucy9QL2p1dGJMNy9V?=
 =?utf-8?B?OW9TSWlMa2JJNmhSN1E2MjUxTFhkL3M4Wm8reC9jSjZEYUh6ci9qcjNLbXRU?=
 =?utf-8?B?VGZ3dkxxdHhKRHo0SDBKVlA3dGNjOEdZU25xTEJRaGVRb3JNZ3JvWDRQWjVw?=
 =?utf-8?B?Mlp5dU05WDVEeE9DUUJZckpQTjhRVFZ5Zmo4TmwvYlpYREh0MS9sd0ZOVUNz?=
 =?utf-8?B?Y2Q5U3ZKZ2pUczF0LzhwMEJRenF1TnlGQnR0dDNaTithUGlRaUJRZkpoMXF5?=
 =?utf-8?B?aFNTOExPYnZidUg1K1lBQzYxamt5cFBSUi9rUzN5dFhFOWhKKzhPRSs0MUJH?=
 =?utf-8?B?SVRrUGdOVnVEcG5CdTloaGFlSkdQNFlaRzZzdlR2QWNmUmFyZEw4RlFiejRt?=
 =?utf-8?B?TXRLUndqRGVSUG1Gam05S3JHcUQrNUF1Z29aTGV6RllQWVNVQUI5WUN1cStk?=
 =?utf-8?B?NDZkK25ZbUdncUlvZ1VkR3hVVXV5THUvL2JaMmZMMTlnbys0MU52N0Q3dTdx?=
 =?utf-8?B?QXpGeUZUT0loSE9GYlV0OEV0eEVaYnpweUhCTVdoNHRQVTFvNk5FbE9lc3VP?=
 =?utf-8?B?U3RpWisvOXdjNFd0R2ZVK3lMVkJvTHd4RXpPQ2lyZlpzeCtla01jYU56c1Fp?=
 =?utf-8?B?dnErc0E4b3RodHJ3ZU1vdy8xZTNFS3d5MitYaklDL051bHZveGZxOWM4OUFT?=
 =?utf-8?B?WCtROEJRMlducDRuZUNVdkZSUjBWT1ZjNzdUU3N1M2ZnUzByQWd3OXIxTENt?=
 =?utf-8?B?WWRabktNb0c4NEhNN3lmY1l1N0FRZ3BOOGE4Ymp0ZFY2MzRCdnZNb2prRlhD?=
 =?utf-8?B?clY1eUt1RlNueXdCQ0c0UnVFaUpMRGdaTGZQdWRrdDVUeXNMWU1zYzZzcXJs?=
 =?utf-8?B?d0k5ekM1U2hzWStxbVhONERlMjljQTBSL0t0NEVYL3NrcGhMUXpaZ01vYnY5?=
 =?utf-8?B?Qmp1V3VIaGxYZncvRnNOaThrTmRhd3U3SDFBNVBoZmI4ZkliRVFRREdHM24z?=
 =?utf-8?B?SXRxQkZEQ0p3dlN5eGYySTdVYVJPS3NtV2g0TVprQVBXQ01lZ2V3Wi82ekhV?=
 =?utf-8?B?MWtmd1dUYlh2VzZsTmliczV3cWVzUC9vN3JxYXhOMUtrS3k2ZWNaanJtUEJ1?=
 =?utf-8?B?M1F4ejVrYlBVdE1DVGZpNzhKWFZ6T2FsWkR5QTIyTEJRa0JwWHpwb21LVmJT?=
 =?utf-8?B?WC9ZbXNKdW9ya1Z4eHhIQ2ZRT05iQmJDSWE2RjhVdCtlZElycTUzdGxyUXlm?=
 =?utf-8?B?SG1aOElZOFNWY0ZrUmNQRWx6emErTytGSHc0Y2FSSW5xeE9lSHRqYytWanEx?=
 =?utf-8?B?UDlpN2lrOVluYzV3U05iM21jM1NuOTcrM0x2Wk1rVmIvVzBLTGsyQ1o0U2c3?=
 =?utf-8?B?UnF3anpjSFk5M0E1dTBtczNsTnEwYW5FWk5KV0wwVTJWaW5WbTRNdk1Qdmww?=
 =?utf-8?B?WG9mM0JZOGNRTS9TL2lXQ25vallXQnFnQXZyNi9jSXBLbEZLQzZ3N29ib2N2?=
 =?utf-8?B?azE2RFRxWTYxck9ES0NtNkw5bkh6WEFPbjF0WUZvU2JFQ3hvTjRtKzFJYWIz?=
 =?utf-8?B?SkRyc3RGVUxkRzhuZ0psUCtnR3dYd3pYU09Ta1dXcHlnQ0srTzJRQ0RQOEtv?=
 =?utf-8?B?VkhYVVYyZHZyK1pTNnc3VjFxTmNrRTRKZExFSEJiQmtKbURPMTVnb3g4azA2?=
 =?utf-8?B?NkFrN1pSU29rdWNad1VrSlpDK3hSanRrdUdxdldrMDNQU0N6M2pxcUpVUzlD?=
 =?utf-8?B?TnVFVHVmSW5KUFNqd0xXOE1UaHgzdEpHbWtxclFlemFkUVlrRDFncHRqczlM?=
 =?utf-8?B?Q25odGl0dFlDS3RZRjRwa3BGVFdsUmtDekNSRnJxdzArTVFKYTZEcU9XV0ZI?=
 =?utf-8?B?cE9zck9hbWtkUUcvTUk1REwrTE5JVEFIR0F6NVZxSng0ajVnbWJJVjh1ME9L?=
 =?utf-8?B?ZDJNN1Q2SW5RM3MxRnAxdTlYTXNjZjlvMzBhVnJMNWVGdXBucW5qZy9BbEFX?=
 =?utf-8?B?QjdRYjhFV3RwMWJMUHRCZWVVeDhCak4rYm5TNjVlVzR4M1l5c3ZYaGJlNWhK?=
 =?utf-8?B?VzZ2TW1iSjdZSkx5YTRiTzFzTHlML3BFS3E3ZkZ4REF5RWJwQ01RTlpBcEpu?=
 =?utf-8?Q?5taNigUqcN+vJvjU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6e0c9b1-c481-4eab-8513-08dea78dc5e1
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 14:27:28.6169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SkWBRFEbGfIAc/nb7bKcSV/MdpAbp9p1JHG5i+C2oIOholo9bRhsXkYJDIB+sAuHLkpkJzGgINBbC5OITBKtM8zAAxELS3fNZ8zP5v4wPb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6346
X-purgate-ID: tlsNG-ebf023/1777645653-316483FF-15C3A693/0/0
X-purgate-type: clean
X-purgate-size: 2058
X-Rspamd-Queue-Id: AFE244AD368
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:dpsmith@apertussolutions.com,m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,citrix.com:dkim,citrix.com:mid,gitlab.com:url];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 01/05/2026 3:17 pm, Dmytro Prokopchuk1 wrote:
> When booting Xen with CONFIG_USBAN=y and CONFIG_XSM_FLASK=y,
> UBSAN reports undefined behaviour in avc_dump_av() due to a left
> shift on a signed int:
>
> (XEN) [    1.104348] ================================================================================
> (XEN) [    1.105096] UBSAN: Undefined behaviour in xsm/flask/avc.c:184:14
> (XEN) [    1.106052] left shift of 1073741824 by 1 places cannot be represented in type 'int'
> (XEN) [    1.107546] Xen WARN at common/ubsan/ubsan.c:176
> (XEN) [    1.108295] ----[ Xen-4.21.1  arm64  debug=y ubsan=y  Not tainted ]----
> (XEN) [    1.108848] CPU:    0
> (XEN) [    1.109147] PC:     00000a00002f64fc ubsan.c#ubsan_epilogue+0x10/0xd4
> [...]
> (XEN) [    1.146320] Xen call trace:
> (XEN) [    1.146663]    [<00000a00002f64fc>] ubsan.c#ubsan_epilogue+0x10/0xd4 (PC)
> (XEN) [    1.147227]    [<00000a00002f7bc4>] __ubsan_handle_shift_out_of_bounds+0x1a0/0x290 (LR)
> (XEN) [    1.147868]
> (XEN) [    1.148177] ================================================================================
>
> This can be solved by making 'perm' an unsigned 32-bit type (u32).
>
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> Test CI pipeline:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2493649109
> ---
>  xen/xsm/flask/avc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/xen/xsm/flask/avc.c b/xen/xsm/flask/avc.c
> index 3d39e55cae..9c3ffdc070 100644
> --- a/xen/xsm/flask/avc.c
> +++ b/xen/xsm/flask/avc.c
> @@ -152,7 +152,8 @@ static void __attribute__ ((format (printf, 2, 3)))
>   */
>  static void avc_dump_av(struct avc_dump_buf *buf, u16 tclass, u32 av)
>  {
> -    int i, i2, perm;
> +    int i, i2;
> +    u32 perm;
>  
>      if ( av == 0 )
>      {

The fix is fine, but wants to be uint32_t.  (The existing code is
already inconsistent, and wants fixing up towards Xen's preferred style.)

Can be fixed on commit.

~Andrew

