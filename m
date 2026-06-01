Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGlbGN2oHWp+cwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 17:44:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCF9621F84
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 17:44:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323944.1589647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU4oM-0007IZ-93; Mon, 01 Jun 2026 15:44:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323944.1589647; Mon, 01 Jun 2026 15:44:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU4oM-0007EW-5V; Mon, 01 Jun 2026 15:44:18 +0000
Received: by outflank-mailman (input) for mailman id 1323944;
 Mon, 01 Jun 2026 15:44:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wU4oK-0006xe-Eg
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 15:44:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU4oJ-0007hv-RN
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 17:44:15 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1da8cc-2eae-0a2a0a5409dd-0a2a450ba75c-12
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 17:44:15 +0200
Received: from [52.101.85.22]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1da8cc-212f-0a2a450b0019-346555167c7f-4
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 17:44:15 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV3PR03MB7453.namprd03.prod.outlook.com (2603:10b6:408:1a6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 15:44:11 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 15:44:11 +0000
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
 b=uQx0a8Rr5iutAkcp2r6oOMB/S/zHyey9ohjai1lCRRpMdX6UcBn9VIrUaOJOdpqExaRHAIm7/9zv+aPLv3lDPbo74OGT7Lm6hArFCoRCrChlW5qpD7/SEfhNAzo4Dz7GfTwphH+Uszjz3ROHuttRv8UV8DTnietW0Uec3v7SnXF7QQ2FWbHp9gEn+RWkI74G4IfIdSC6bYAhluaocOiq5OqRG3hXgeYgbtvI6x5jYAOmleQmfpbXgBdBiP3oKPm79ebfrihDdNEaTqIrFFBVplIr9JtXWpYkTIxCgpAiOFB1IPu0QAo/Y+vSNfSCeArG7lXtd+t0wXvztNHNLXtPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baK8cjPkKPNArYKcbk9tpmKQdKKjM8clHoyqodwv1j4=;
 b=PbEP1Z58ExsHi25tScLMeLt0XCtVpJIuW/mWyyL41fLBvd9cuujiQM2kE7W+N88dCJSHEjnE8R4pe1vyCKrW0M8rPmnoB/TOgQe7rBWBAf1aQ4H1+2OG2wnXn6KMB67aoFFpyFAcvb2si7hLX82k8PlRLThklvusDF3I43SAUsU42lfxfHOIGPj2FgJQlmfmXRAuO2dp2hCJx8MSaXi8dbbo+m+vv+KJdnwzsHTBL/C4nnmaYpTcnPqzN0d963a6niXCZix1E+7Lga0He3gQwjzVU+Tn6Ul2r94Ut2I+TeqCn6p5JfJV4qHY1sudgCZG1kGwPO11ZV6tNY8NGbS+bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baK8cjPkKPNArYKcbk9tpmKQdKKjM8clHoyqodwv1j4=;
 b=xE3Aqk2LdihK8ojuKKM+9LKwAPMnt9TCrQwV3MHRIwHeDi0n3rJkHeQZ80pMYZroLk0/ZyyUzJgpUa65lHgH7kdhgrWfYeEueUoaXqrvfVkuJR2/9B5nZQ9ah6TQZCIY+lVqT+p/zDy62q1wXSTRjHn5R1M7VigMU0ywA0mwm4A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH for-4.22 4/5] tests/numa: add unit tests for NUMA setup logic
Date: Mon,  1 Jun 2026 17:43:31 +0200
Message-ID: <20260601154332.30797-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601154332.30797-1-roger.pau@citrix.com>
References: <20260601154332.30797-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LV3P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:234::34) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV3PR03MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: e29966c8-4112-46aa-6fce-08debff4a055
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|6133799003|22082099003|56012099006|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info:
	o1PVk/IwI/1Vnh8fSMuOPDRYZsuGNC4Bv77B8xNKkkURdcw9LzxYbrRYkFGE+BPBu78Kv54MVxgHvpgvnJk3Kb9UZEUYSq7zuZXxeK1EvoYzy+dEBYVDTgdkc8ZE/5b0m0spZ2vqTtAKYQ0rRFr9pJ5bsjq0ksIYgyVjzIn3hWWDcodYY9cP5BHO+Mo2G/ZU6qVwH8QYR3NxcjCXENqfRtKQb3/4Cw+DNTYvJnXrpFmYYxceioxqZ+6aG5eMTHHXzoR8EmE3nvWs2QKFdn9xcmXRLv/Kw6joNlGxBR7XiWqSC/QDfGXYSRZwoUnlfcUmUn7bZt3vlxVm0BGYLx/QFQN3qEzvBB3wNDyGTS6drtolONuBY33wb8kryJGFruJ16gwz1qU36qr+DwE6Jh4IAV8d56icfpRJsZoQVihC3c+WVjIC+IGAHwXxaS2X3VKLlVJfo1JHcAz8KisVIeQkjgtT0byyoaMQlDY0UNoB/7FoaQiHbVFv35Y6MvzK6TasexfzOz/tL8IxOVslildpjMIqp6qywg3IG0Jp1upd/p8cvscMaQAffu/LZOJrb0sTkdBaS7l6fF7tq/tn0B+z4sm3PBDB7deOwbvxeUpjhVgXdnhnToKwF05GZnrwRTHq9lSAvmKScwfUK7vICO6PvM05eMNBOKc/cHK5Cr0DYBlyktnij+du9/Srvsy+czBA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(6133799003)(22082099003)(56012099006)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3RTaTl4SmtGN3V3MjJubTRwWHFQZ3JrZEJLL3RmaXNYTUE2ZGM4UFpLS2VG?=
 =?utf-8?B?SlI3SVN0cnJVKzZrRzV1clZ0L2VFdG5WWGJGVk1lZytsL1BxTDRlT3pDeEtu?=
 =?utf-8?B?MEx5VzYzQ2dOcXZ5MUg3RWZwbTc1YXhlN2picHN6cmtlREc0U2EvUUlDbjlV?=
 =?utf-8?B?aVdFaVhTMjRVVGJJSHZUdUdObkZKSG0vQUNQNDhTd1JjaENWSW1sUTY4aWJn?=
 =?utf-8?B?a21CbHYwYjh5NHRzVkJOZnY5NHJCQjJDOUZpdUtZc3hTdGpob3VsWjlRRGwr?=
 =?utf-8?B?T3A0V0ZCdmIzNEZmUmo2VHF0K1VzbnJGQ2hKWjV5VnJERTVJWHJLNUpacHBa?=
 =?utf-8?B?YVV4U05CN1g3Q3ZHSlhvelRCWU51R1FQVDVNL0RSMW53L0swc3BQRGtyMjZE?=
 =?utf-8?B?NHM2ekwvOTE3ZzFISGNWendMOVZuQmpCWXBhUHcrYW8waG9sK1NoaVFMSitu?=
 =?utf-8?B?dEFkKzZLZ2paSEdLWXdLL0J5UXd2b0E0d0JUNngwc0xySnAxbUxTMnlINXJz?=
 =?utf-8?B?Wm5LeWVWc0g5c0J5RlRoRmRSazRyQ05ZTnZ5TE03WWhTcUFWQTBTRnhpK1Jl?=
 =?utf-8?B?Ykd3Z2UzZlNSamVLUFNEcHBHY1A0Y0N5YTRqTmtDUWQ4cDFjZGRtWnBwbWhM?=
 =?utf-8?B?d2l6RE05eHYxdUQxbGNpanZvZ3pmKzZZeUN4WHJ3M0tvYkVlbFRmT3kyMEhL?=
 =?utf-8?B?SlAzTENGcHY3aVg1U3d1N3hrN2I2ajR6ZkZOdFdxUXlQek85eGlyS0VqZ0J1?=
 =?utf-8?B?aVcxZ21EalduekluWE1obEhwYzgvSjl5N2JUYVAxQUZxcUxqSExMUXp6UTAy?=
 =?utf-8?B?dC9rZ1RVTnVKSGliUjVseENHRlpnWkJsa3A1QmU1WTI2eFNyMC9BOTJIK0RW?=
 =?utf-8?B?andXSDdvdWp3L0JaYmdELzZLZzhpV2J2R1pCbE91cXdDYmVmeVFGOElOaFRq?=
 =?utf-8?B?NExwMjlZYVdCSmlVRDY0VmZlNUhva3lwdlBlOVVpUFQ1SVN4NWtTY3NBakh1?=
 =?utf-8?B?aDhuSitHKzNxTlBjNHVxVU4yNzN2bUpPRUQzeHcvbENMZDgyVmt4OWFtWnhH?=
 =?utf-8?B?TGpKck8ycDRGWGpCZ0lVWmh6bWpMT2hYN1lUN1V4NzdzRUpPOEVGVDloSXBM?=
 =?utf-8?B?SlFOeWxSQkU1VkxJLzNBQWZsVmYxdkMrdUdHNHB3MjR4a2tmdG0wamtYUWhK?=
 =?utf-8?B?MWJCTWMzR254S1Y4NlFtMzZWYVNoMGZWT2w2SStlWC9kN01MdkthV0s4dlVl?=
 =?utf-8?B?QjRkN2FHTzBxcU5Ubk1zSEdhRW5NMlcyc0sxbDNIdmVsUit5NXQybER1OFAv?=
 =?utf-8?B?UGlOY3pUUGlVZGRndGRjKzN4c3VyRnMreThNMWkvMGNZQWs4cUM3UDJLNnVa?=
 =?utf-8?B?bWFxc0VORU5xVnVwdnZXZTE1RzVQZHorTFB4YVpoRmtiaE10RXZYdVpzSCtl?=
 =?utf-8?B?Y2JCaHVoZ2plZHNDYXRxVnliSVgvWnA4TVF2KzU1b1UyKzJnZ0xzRnVNRTZT?=
 =?utf-8?B?RkVtZVVJMkV5UHlCWDg2MVd5YnNDYXJxRmtzZFV4RWp3c2txUVVTbCsvVW81?=
 =?utf-8?B?RU1ROVFXck1WbVBwWGJ6ODhZd1hNRUZxa1B2Y285TklmRGNpUER5RHh2Z3VP?=
 =?utf-8?B?em1QM0NjNnpGQm05dG41Y0N2U2NmQ2VEUHJrZHdNUDN0eFphTU4ybUtEeEd6?=
 =?utf-8?B?NnUxZlVFMklUV1g5Mm0rUjM2SSs3SG5tcG12azkySXNSajNyc2xvM2JBLy8z?=
 =?utf-8?B?cG11UHhHbjlwMEFQbFFsN0dwUXZqMzFYT3Qvc2gyb2xpV0tRb2x5MDBoN1g1?=
 =?utf-8?B?VTM0WUhvTGJrK3ZCK1ZzZEhqZFN6UkZVYTFMRTFNVXlDSEFaaWpsTVZmR3Ax?=
 =?utf-8?B?TGtNK0JEclZmMitlK3B3c2lKSjBwU3dqanY2citsM2o2SHdRZGdzSytGUGU0?=
 =?utf-8?B?OUhaaWNMdjIyRW84aCtNRG14dWlONTBFZlNYY1k4MDQrU2VjbHJ5WmQxMTNI?=
 =?utf-8?B?OWRxQU1tclIxaFZxa21QZHgvbWRQKzRIMmJnSUc1WC9ScWtxQk9FSlpSU0ZI?=
 =?utf-8?B?KzRiMjZZQTN4Z2NUQXhCdlpHZlU1UU43Z3ZVZi8xcWVONi91UW8xWGpkb3BT?=
 =?utf-8?B?c3V1c2lmOE9raDdISWlUMlBCOHZxZUt4ZFp5S25pYmtySTU3V3ZEZUNRK1JM?=
 =?utf-8?B?SFE3d1F1dEpLSWM4cnM5YmM3VGgxa3ArZEkyYnFKVmxUUytuaWtNSjR2bFlv?=
 =?utf-8?B?RHcvVzE3b09GTGRlcUhnUTdYejRlTlU0R1FZdDdMZCtZK0g2RktzUmFYS3Qv?=
 =?utf-8?B?Tzd0VzZlY081UmFnQk92VGExTWtKYUwxYzVMWGpiUEhyWXNCYVpadz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e29966c8-4112-46aa-6fce-08debff4a055
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 15:44:11.7686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKyOdufeE4GPjuixbZrC1rmJQd3zA2IqDgjFow/DsHzmbwFvezwkDGxDKZ9EqaCeoOkjso16zUFvmuWbfjtaRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7453
X-purgate-ID: tlsNG-42698a/1780328655-1BD7FF3B-97355DDE/0/0
X-purgate-type: clean
X-purgate-size: 14975
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:mid,citrix.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EFCF9621F84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

NUMA setup, like PDX, requires certain amount of logic to configure the
internal structures and parameters for NUMA operation.  Introduce some very
basic testing that allows building and testing NUMA setup logic in as a
user-space unit test.  This allows feeding synthetic memory affinity and
map to the logic, allowing to reproduce bugs that would otherwise need
access to real systems with such a configuration.

For the time being introduce a single test case, based on a known working
NUMA setup for an AMD Turin system.  Also the testing after setup is
currently limited to ensuring the start and end RAM region addresses fall
into a correctly setup memory block.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/tests/Makefile         |   1 +
 tools/tests/numa/.gitignore  |   2 +
 tools/tests/numa/Makefile    |  47 ++++++++
 tools/tests/numa/harness.h   | 184 +++++++++++++++++++++++++++++
 tools/tests/numa/test-numa.c | 222 +++++++++++++++++++++++++++++++++++
 5 files changed, 456 insertions(+)
 create mode 100644 tools/tests/numa/.gitignore
 create mode 100644 tools/tests/numa/Makefile
 create mode 100644 tools/tests/numa/harness.h
 create mode 100644 tools/tests/numa/test-numa.c

diff --git a/tools/tests/Makefile b/tools/tests/Makefile
index 6477a4386dda..fc0ed8091510 100644
--- a/tools/tests/Makefile
+++ b/tools/tests/Makefile
@@ -4,6 +4,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 SUBDIRS-y :=
 SUBDIRS-y += domid
 SUBDIRS-y += mem-claim
+SUBDIRS-y += numa
 SUBDIRS-y += paging-mempool
 SUBDIRS-y += pdx
 SUBDIRS-y += rangeset
diff --git a/tools/tests/numa/.gitignore b/tools/tests/numa/.gitignore
new file mode 100644
index 000000000000..0710a767f400
--- /dev/null
+++ b/tools/tests/numa/.gitignore
@@ -0,0 +1,2 @@
+/numa.h
+/test-numa
diff --git a/tools/tests/numa/Makefile b/tools/tests/numa/Makefile
new file mode 100644
index 000000000000..5235f9d6297f
--- /dev/null
+++ b/tools/tests/numa/Makefile
@@ -0,0 +1,47 @@
+XEN_ROOT=$(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+TARGETS := test-numa
+
+.PHONY: all
+all: $(TARGETS)
+
+.PHONY: run
+run: $(TARGETS)
+ifeq ($(CC),$(HOSTCC))
+	set -e;             \
+	for test in $? ; do \
+		./$$test ;  \
+	done
+else
+	$(warning HOSTCC != CC, will not run test)
+endif
+
+.PHONY: clean
+clean:
+	$(RM) -- *.o $(TARGETS) $(DEPS_RM) numa.h
+
+.PHONY: distclean
+distclean: clean
+	$(RM) -- *~
+
+.PHONY: install
+install: all
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
+	$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(LIBEXEC)/tests
+
+.PHONY: uninstall
+uninstall:
+	$(RM) -- $(patsubst %,$(DESTDIR)$(LIBEXEC)/tests/%,$(TARGETS))
+
+numa.h: $(XEN_ROOT)/xen/include/xen/numa.h
+	sed -e '/^#[[:space:]]*include/d' <$< >$@
+
+CFLAGS += -D__XEN_TOOLS__
+CFLAGS += $(APPEND_CFLAGS)
+CFLAGS += $(CFLAGS_xeninclude)
+
+test-numa: test-numa.c numa.h
+	$(CC) $(CPPFLAGS) $(CFLAGS) $(CFLAGS_$*.o) -o $@ $< $(APPEND_CFLAGS)
+
+-include $(DEPS_INCLUDE)
diff --git a/tools/tests/numa/harness.h b/tools/tests/numa/harness.h
new file mode 100644
index 000000000000..71ff9c792191
--- /dev/null
+++ b/tools/tests/numa/harness.h
@@ -0,0 +1,184 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Unit tests for NUMA setup.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+
+#ifndef _TEST_HARNESS_
+#define _TEST_HARNESS_
+
+#include <assert.h>
+#include <errno.h>
+#include <inttypes.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include <xen-tools/bitops.h>
+#include <xen-tools/common-macros.h>
+
+#define CONFIG_DEBUG
+#define CONFIG_NUMA
+#define CONFIG_NR_NUMA_NODES 64
+#define NR_CPUS 256
+#define MAX_RANGES 128
+#define PADDR_BITS 52
+
+#define __init
+#define __initdata
+#define __ro_after_init
+#define __read_mostly
+
+#define printk printf
+#define XENLOG_INFO ""
+#define XENLOG_DEBUG ""
+#define XENLOG_WARNING ""
+#define KERN_INFO ""
+#define KERN_ERR ""
+#define KERN_WARNING ""
+#define KERN_DEBUG ""
+
+#define PAGE_SHIFT    12
+/* Some libcs define PAGE_SIZE in limits.h. */
+#undef  PAGE_SIZE
+#define PAGE_SIZE     (1L << PAGE_SHIFT)
+#define MAX_ORDER     18 /* 2 * PAGETABLE_ORDER (9) */
+
+#define PFN_DOWN(x)   ((x) >> PAGE_SHIFT)
+#define PFN_UP(x)     (((x) + PAGE_SIZE-1) >> PAGE_SHIFT)
+
+#define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
+#define mfn_to_pdx(mfn)   (mfn)
+#define paddr_to_pdx(pa)  ((pa) >> PAGE_SHIFT)
+#define mfn_to_maddr(mfn) ((mfn) << PAGE_SHIFT)
+
+#define ASSERT assert
+#define ASSERT_UNREACHABLE() assert(0)
+
+/* For the purposes of the testing assume arch NID == Xen NID. */
+#define numa_node_to_arch_nid(n) (n)
+
+typedef uint64_t paddr_t;
+#define PRIpaddr "016" PRIx64
+
+typedef unsigned long mfn_t;
+typedef uint8_t nodeid_t;
+
+#define __set_bit set_bit
+#define __clear_bit clear_bit
+
+static inline unsigned int find_next_bit(
+    const unsigned long *addr, unsigned int size, unsigned int off)
+{
+    unsigned int i;
+
+    ASSERT(size <= BITS_PER_LONG);
+
+    for ( i = off; i < size; i++ )
+        if ( !!(*addr & (1UL << i)) )
+            return i;
+
+    return size;
+}
+
+#define find_first_bit(b, s) find_next_bit(b, s, 0)
+
+/* Minimal cpumask support. */
+typedef struct cpumask{ DECLARE_BITMAP(bits, NR_CPUS); } cpumask_t;
+
+#define cpumask_clear_cpu(c, m) clear_bit((c), (m)->bits)
+
+/* Define the nodemask helpers used. */
+typedef struct nodemask{ DECLARE_BITMAP(bits, CONFIG_NR_NUMA_NODES); } nodemask_t;
+
+#define node_set(node, dst) set_bit((node), (dst).bits)
+
+#define first_node(n) __first_node(&(n), CONFIG_NR_NUMA_NODES)
+static inline int __first_node(const nodemask_t *srcp, unsigned int s)
+{
+    return min(s, find_next_bit(srcp->bits, s, 0));
+}
+
+#define next_node(n, m) __next_node((n), &(m), CONFIG_NR_NUMA_NODES)
+static inline int __next_node(unsigned int n, const nodemask_t *srcp,
+                              unsigned int s)
+{
+    return min(s, find_next_bit(srcp->bits, s, n + 1));
+}
+
+#define nodes_or(dst, src1, src2) \
+    bitmap_or((dst).bits, (src1).bits, (src2).bits, CONFIG_NR_NUMA_NODES)
+
+static inline bool nodemask_test(unsigned int node, const nodemask_t *dst)
+{
+    return test_bit(node, dst->bits);
+}
+
+#define node_set_online(node)	   set_bit((node), node_online_map.bits)
+
+#define cycle_node(n, src) __cycle_node((n), &(src), MAX_NUMNODES)
+static inline int __cycle_node(int n, const nodemask_t *maskp,
+                               unsigned int nbits)
+{
+    unsigned int nxt = __next_node(n, maskp, nbits);
+
+    if ( nxt == nbits )
+        nxt = __first_node(maskp, nbits);
+
+    return nxt;
+}
+
+#define for_each_node_mask(node, mask)                  \
+    for ( (node) = first_node(mask);                    \
+          (node) < MAX_NUMNODES;                        \
+          (node) = next_node((node), (mask)) )
+
+/*
+ * Dummy helper to satisfy allocate_cachealigned_memnodemap(), the memory
+ * allocation is instead done in vmap_contig().
+ */
+static inline mfn_t alloc_boot_pages(unsigned long nr, unsigned long align)
+{
+    return 0;
+}
+
+static inline void *vmap_contig(mfn_t mfn, unsigned int nr)
+{
+    assert(!mfn);
+    return calloc(PAGE_SIZE, nr);
+}
+
+static inline void panic(const char *msg)
+{
+    printf("%s\n", msg);
+    abort();
+}
+
+/* Dummy implementations to satisfy the build. */
+static inline bool arch_numa_disabled(void)
+{
+    return false;
+}
+
+static inline void numa_fw_bad(void) { }
+
+static inline bool arch_numa_unavailable(void)
+{
+    return false;
+}
+
+#include "numa.h"
+
+#endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/tools/tests/numa/test-numa.c b/tools/tests/numa/test-numa.c
new file mode 100644
index 000000000000..bced68d4d7f1
--- /dev/null
+++ b/tools/tests/numa/test-numa.c
@@ -0,0 +1,222 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Unit tests for NUMA setup.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+
+#include "harness.h"
+
+static paddr_t mem_hotplug;
+unsigned int __read_mostly nr_cpu_ids = NR_CPUS;
+
+#include "../../xen/common/numa.c"
+
+static void numa_reset_state(void)
+{
+    bitmap_clear(processor_nodes_parsed.bits, CONFIG_NR_NUMA_NODES);
+    bitmap_clear(memory_nodes_parsed.bits, CONFIG_NR_NUMA_NODES);
+    bitmap_clear(memblk_hotplug, NR_NODE_MEMBLKS);
+    memset(numa_nodes, 0, sizeof(numa_nodes));
+    memset(node_memblk_range, 0, sizeof(node_memblk_range));
+    memset(memblk_nodeid, 0, sizeof(memblk_nodeid));
+    memset(node_data, 0, sizeof(node_data));
+    memset(node_to_cpumask, 0, sizeof(node_to_cpumask));
+    memset(cpu_to_node, NUMA_NO_NODE, sizeof(cpu_to_node));
+    num_node_memblks = 0;
+    memnode_shift = 0;
+    memnodemapsize = 0;
+    if ( memnodemap != _memnodemap )
+        free(memnodemap);
+    memnodemap = NULL;
+    bitmap_clear(node_online_map.bits, CONFIG_NR_NUMA_NODES);
+    node_set(1, node_online_map);
+}
+
+struct mem_affinity {
+    /* Ranges are defined as [start, end]. */
+    paddr_t start, end;
+    unsigned int nid;
+};
+
+struct mem_range {
+    /* Ranges are defined as [start, end]. */
+    paddr_t start, end;
+};
+
+const static struct mem_range *ram;
+
+int arch_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)
+{
+    if ( idx >= MAX_RANGES || !ram[idx].end )
+        return -ENOENT;
+
+    *start = ram[idx].start;
+    *end = ram[idx].end + 1;
+
+    return 0;
+}
+
+static void print_ranges(const struct mem_affinity *r)
+{
+    unsigned int i;
+
+    printf("Affinity ranges:\n");
+    for ( i = 0; i < MAX_RANGES; i++ )
+    {
+        if ( !r[i].end )
+            break;
+
+        printf(" NID %u [%" PRIpaddr ", %" PRIpaddr "]\n",
+               r[i].nid, r[i].start, r[i].end);
+    }
+
+    printf("RAM ranges:\n");
+    for ( i = 0; i < MAX_RANGES; i++ )
+    {
+        if ( !ram[i].end )
+            break;
+
+        printf(" [%" PRIpaddr ", %" PRIpaddr "]\n",
+               ram[i].start, ram[i].end);
+    }
+}
+
+static bool test_paddr(paddr_t addr)
+{
+    mfn_t mfn = PFN_DOWN(addr);
+    unsigned int idx = mfn >> memnode_shift;
+    unsigned int nid;
+
+    if ( idx >= memnodemapsize )
+    {
+        printf("Fail: MFN %lx -> IDX %u outside of memnodemap range\n",
+               mfn, idx);
+        return false;
+    }
+
+    nid = memnodemap[idx];
+    if ( nid >= MAX_NUMNODES )
+    {
+        printf("Fail: MFN %lx -> NID %u >= MAX_NUMNODES (%u)\n",
+               mfn, nid, MAX_NUMNODES);
+        return false;
+    }
+
+    if ( !node_data[nid].node_spanned_pages )
+    {
+        printf("Fail: MFN %lx -> NID %u without spanned pages\n",
+               mfn, nid);
+        return false;
+
+    }
+
+    if ( !node_data[nid].node_spanned_pages )
+    {
+        printf("Fail: MFN %lx -> NID %u without spanned pages\n",
+               mfn, nid);
+        return false;
+
+    }
+
+    if ( !node_data[nid].node_spanned_pages )
+    {
+        printf("Fail: MFN %lx outside NID range [%013lx, %013lx]\n",
+               mfn, node_data[nid].node_start_pfn,
+               node_data[nid].node_start_pfn +
+               node_data[nid].node_spanned_pages - 1);
+        return false;
+    }
+
+    return true;
+}
+
+int main(int argc, char **argv)
+{
+    static const struct {
+        struct mem_affinity affinity[MAX_RANGES];
+        struct mem_range ram[MAX_RANGES];
+    } tests[] = {
+        /* AMD Turin system. */
+        {
+            .affinity = {
+                { .nid = 0, .start = 0x00000000000ULL, .end = 0x0000009ffffULL },
+                { .nid = 0, .start = 0x000000c0000ULL, .end = 0x000afffffffULL },
+                { .nid = 0, .start = 0x00100000000ULL, .end = 0x0c04fffffffULL },
+                { .nid = 1, .start = 0x0c050000000ULL, .end = 0x0fc4fffffffULL },
+                { .nid = 1, .start = 0x10000000000ULL, .end = 0x183ffffffffULL },
+            },
+            .ram = {
+                { .start = 0x00000000000ULL, .end = 0x0000009ffffULL },
+                { .start = 0x00000100000ULL, .end = 0x0007590ffffULL },
+                { .start = 0x000759d1000ULL, .end = 0x00075a0ffffULL },
+                { .start = 0x00076000000ULL, .end = 0x00094c73fffULL },
+                { .start = 0x0009b5ff000ULL, .end = 0x0009fff9fffULL },
+                { .start = 0x0009ffff000ULL, .end = 0x0009fffffffULL },
+                { .start = 0x00100010000ULL, .end = 0x0fc4fffffffULL },
+                { .start = 0x10000000000ULL, .end = 0x183f7ffffffULL },
+                { .start = 0x183f8800000ULL, .end = 0x183faabffffULL },
+            },
+        },
+    };
+    int ret_code = EXIT_SUCCESS;
+
+    /* Dummy firmware interface provider name, use TST for TEST. */
+    numa_fw_nid_name = "TST";
+
+    for ( unsigned int i = 0 ; i < ARRAY_SIZE(tests); i++ )
+    {
+        paddr_t min = ~(paddr_t)0, max = 0;
+        unsigned int j;
+
+        numa_reset_state();
+
+        ram = tests[i].ram;
+
+        for ( j = 0;
+              j < ARRAY_SIZE(tests[i].affinity) && tests[i].affinity[j].end;
+              j++ )
+        {
+            const struct mem_affinity *affinity = &tests[i].affinity[j];
+            paddr_t length = affinity->end - affinity->start + 1;
+
+            if ( !numa_update_node_memblks(affinity->nid, affinity->nid,
+                                           affinity->start, length, false) )
+            {
+                printf("Fail to add NID %u [%" PRIpaddr ", %" PRIpaddr "]\n",
+                        affinity->nid, affinity->start, affinity->end);
+                ret_code = EXIT_FAILURE;
+                continue;
+            }
+
+            min = min(min, affinity->start);
+            max = max(max, affinity->end);
+        }
+
+        if ( !numa_process_nodes(min, max + 1) )
+        {
+                printf("Unable to process nodes\n");
+                print_ranges(tests[i].affinity);
+                ret_code = EXIT_FAILURE;
+                continue;
+        }
+
+        for ( j = 0;
+              j < ARRAY_SIZE(tests[i].ram) && tests[i].ram[j].end;
+              j++ )
+            if ( !test_paddr(tests[i].ram[j].start) ||
+                 !test_paddr(tests[i].ram[j].end) )
+                ret_code = EXIT_FAILURE;
+    }
+
+    return ret_code;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.53.0


