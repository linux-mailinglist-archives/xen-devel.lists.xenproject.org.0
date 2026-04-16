Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJveCqvg4GkEnAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 15:14:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F30840E923
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 15:14:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283443.1565671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDMXX-0000s9-Lm; Thu, 16 Apr 2026 13:13:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283443.1565671; Thu, 16 Apr 2026 13:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDMXX-0000pe-Is; Thu, 16 Apr 2026 13:13:51 +0000
Received: by outflank-mailman (input) for mailman id 1283443;
 Thu, 16 Apr 2026 13:13:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wDMXV-0000pY-Oz
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 13:13:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDMXV-00Gtx2-5F
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 15:13:49 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e0e08a-2eae-0a2a0a5409dd-0a2a450aea64-6
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 15:13:49 +0200
Received: from [52.101.52.6]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e0e08b-56b3-0a2a450a0019-346534065eea-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 15:13:48 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV3PR03MB7454.namprd03.prod.outlook.com (2603:10b6:408:1a4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 16 Apr
 2026 13:13:43 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 13:13:43 +0000
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
 b=lsPaQy2HUGXxu7yWtBdLzNDGiZ08hbu6M4zQdUs4wPPmTzfq2gKsslYo9xT2lPj0kRWYbsu3xeszJ/LXpkKNcBupKGU47KsUTbpjWIxCdLsbSoOxAWd9aUHKUMVN/ipv77uUz8XEaUh6fSBe8V9COgAAfu+DGx1DylXtyuv345sqF7kvtUEolR5oLcphD4w85kVpUFKWjJEmvgXZxNpTcZ0qZXtSuzhi4I8n9iXAJA/VwTv0l+l+M8YYn2VRDh/Yng3RM68LXJoiw5p1Hxu8RCKQjp0ZZVxGv9mvGXUnCSFOA7Tcd+QLZe6KIvHUlONL5UFYQRJBZIb/nVI4k58Gmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+o9kCYmx18/+SKer5CbgFq9S4TN3A4/wYag7sM2cQY=;
 b=x3rwjQrmrD0l63z3VHIsL57JtbRAa9FPOQ7ZOtP4lPq6pmWJ2mefD33mJc6NFSOg7QR7hv7AcSV+3Eg5JABe9j7xRw+LOcffJlvMw9tX8Wxgni3zWw///NFboDBsFURsZoO41LR0x1n3u/wV3mAkuV+9AEP+YtF3y4F0MLpUMek9iP0WR7EYuBFEqBsjX8pE/6hsjQQmckF27tC/k/xVfXIKfh28fapjWzVmc+zKR58/s5oLOo/qCAxOjazVmcsvFH3BsQ+AdekNdh/ntMLPu2cIhdAJNsPpqJ5vYylaVVQ9AspEC9KjYrfCqGEViQPiKxNj9Ft587xXiYnqTz3s/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+o9kCYmx18/+SKer5CbgFq9S4TN3A4/wYag7sM2cQY=;
 b=0W16gXFx+R9G1tRWU1AiiDbBwCOGqxAJNBWkWqtHTVvUkHGzorb2QR25t0QvrxATqdKVD0d4wDNyMx1Fg/OHEIZIhiCWM2QRox7hTv77nlTxgZitVkXfBkTtVJK/JbX6HNnmn2XyecQkH3udg3JdZsLcb5UkgVp4Zt3H0p78Ij4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Apr 2026 15:13:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] x86/time: use native TSC scaling factors when TSC is
 not scaled
Message-ID: <aeDgg2gB09-G2FQD@macbook.local>
References: <20260414103327.7420-1-roger.pau@citrix.com>
 <20260414103327.7420-2-roger.pau@citrix.com>
 <f424bf3a-0113-4c66-b165-8dae82817f24@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f424bf3a-0113-4c66-b165-8dae82817f24@suse.com>
X-ClientProxiedBy: MR1P264CA0172.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::20) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV3PR03MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: 26678cd3-d247-4b46-107d-08de9bb9fbf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DfptKdScLk0MMtx7ZWVX316X7n9borN0OwiVmLZLK0eCWjY1vj6JoLmpzTqu6C7RAl7fljMlg8Hl0oHmO0v7JR+MclzWienujV2lYXXNVin/5nHaT3WFs+3XrDZEVMqZw3Qey2o9hvZCxpP6IEOoSG9Ag+hExDXJHbKqH7zMZW77NdJzcERRVFV2JHEbcVzskNX/U+M+e28KYp1O4ruzesg+3cosyat46ab/c9vk00HMtfSvPX1ySwWTjEshv9sykicfUeY7yXpZwrKa3SWlTjYCWy+5PJ6NKYw6eUJc4uJ+qwFYo8/5VU5nQyXf02cfauBgiGfZZK1okd07yYlhKPfTuHvfxu6NOikNJ3bQLALXLzHHcZTzPQpS8UoljSEvXN3ZdjsX+sC7DZm4QTe/xIBHoNhf57BPrq29yc8ImvaMmlYOC4IGyzLJ1aIHWNqf3MShEbIyDCCr8ztstfaI+teXJ2VijQD7VpgdxP+DO4mpNA1V7B5C2bvGNqTi2gxk7FU/6e0wffTaXzdjUpDW8Dz6jEOAfJgC/OEOtK/v/FLdzrHarttWvI4WZDSiqOFJnsUtzLPQ5C/NRv7VTIRBYhgSz9QetD+DBBIgN0HvKFPslZljQCdga6EOhfAmBJB4FVUWJNPkEIATNA7Uml20AZk2jgnwVlVb5O93AC50mILDvneb4e4/oklK2zNhPr4YgGL7YCaCrjLX0PNMI2aHrnVIXuV0MWv/jrq2K9p7rOg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SG9pa1RLSE4yMk5VQWptWTBtckI3bERUcWxqaWpqTVgxYk5rVFJqbXBzbGtj?=
 =?utf-8?B?ZjE5NzdtRE5YVHhhdEdBOEg3ZmJ4QjRwQTVVUFNLeWwvOFhOck9YQUhKdUJX?=
 =?utf-8?B?bDlSdjNwa3BKZmZzajV1dTBzbkFuS1B1UTRUc0ZQWTRHOCthOXhxZTBzTktJ?=
 =?utf-8?B?WWVla25NaEFnMHppR1I1bk1YZkZLc0VoRDgvOG83ZXhyYVpYOXlQZUxKc3JZ?=
 =?utf-8?B?Qk1JZEdXWmgyYWN6ditJdzR1UDhWVlQ1WGZoZlpsRHR5WXJiNjZVWThoVXhw?=
 =?utf-8?B?QVNNMVJQSHJLbUU1UDVNTE5Ic1FLNXNlTnhwTEhPTDdnNktjdE0yckJ6bTdX?=
 =?utf-8?B?WUJUVk9tKy9lUU8vU0F5b3Nqd2hYR0pUQ1lpVjltQTV2d2lWbFpNRlA0VWpV?=
 =?utf-8?B?ZG9pcXA2L2tYaEtpUE01bEtBcXFud3hPamNwN20zWWRSa2xDc3hUZDZ1cURJ?=
 =?utf-8?B?bUhkYndBNUt6aEtrdzdBL0N4TnVzWE5ZRmdoNUpjbDRncFUrZ1VHNGpLRnla?=
 =?utf-8?B?T25WM0tFRWVHaTNvL1U2ZkVuemYwSHRSN1dXMTFyZGtnL1k3YWxJZUk3aXd4?=
 =?utf-8?B?WDZjMWJIMWdXbDF2WU91enczS21jV3R3WFg3aEtSY1Z5bW8xQVlTSGh0S1dO?=
 =?utf-8?B?QmRJeDVyeGhpN2FUN3gwaXpydzcwdlJZVmdzQWJnelNMUTdKT2N0bDgrVzVa?=
 =?utf-8?B?UnhyU1dsOUc0aVl1bEk5WDlKNGRRb2hUSjA3MU1jYzI4dk5MTUMzdGgxRC83?=
 =?utf-8?B?M09MTkRTdVpkekhsVlBIekpFUDZqWElnZU9vdFVsNXJlWE9IdzErdDRST1RB?=
 =?utf-8?B?MkZtd2ppUmJLSzFFejR4OUJLTTlnL3p2OSsyaGFHNGMwdS92Sk14SDJhckV1?=
 =?utf-8?B?N1pmOWJ4anNjUnVYbXU2TUxkWUFLU2k2ZUp4aGJJRnRVa0Q5VytqRFdTOVJx?=
 =?utf-8?B?bVZZN0F1K2NYb3JaZkJPbEQ0N29RZG5PSVVENmpnMFRYaHYwcFRWajNHZEJr?=
 =?utf-8?B?Z0p5QlM5THFvVnZPczRjMTdjR2s3RU5JaEZ1Z2FVaUtJcy85Rm52czJhNjZs?=
 =?utf-8?B?R3lENzlhb2E0UDVRaU5CUlJScVlCSXovVExzcStqdXloZXBuZ0lTc1dqV2xL?=
 =?utf-8?B?Q0hPdTNodjZMM21qYjlNR1U0TExsbmlwOC9JbjhZSDFOSWlWeW5velkzbm55?=
 =?utf-8?B?dktLM1pSQTVETXBPR2RSdHNxV2t4TkRmRzNTUm0yUm1oVVZQNXd4ZzRnUWtF?=
 =?utf-8?B?blpoTVdieGpzRkdZZmZTaVk3UFJFa0xmM08zWUN4U3hpS0VTNGdmZWFEbk5R?=
 =?utf-8?B?c25qNXlyUmg4RnRXSHY1TWRSTjdRcEplOEY3cEcra0tNSko4RUZUM0tMQ2M3?=
 =?utf-8?B?S2dUbFdtbXNwb3liK0xnbTVrbGhZMnZOV1d4VituNkMrV0duOWFoY2xYREkv?=
 =?utf-8?B?SzhHQU5nK3BwT3lWckQ1VGNaYXQxYlUzbnpiM2NYbVZSZW1RcU1hOXpHcGUx?=
 =?utf-8?B?a0owV1QyaDg1aEhaUGppU1J5ck56UFBXa1J3cXFPZjErNmNqbU1ONDZyQjlW?=
 =?utf-8?B?dWc1S1lSRXk5aTJ6REoxR2NsZDJURXhoU2JXcU5oVHhxc0pDNnNNdC9JWXda?=
 =?utf-8?B?QVY3OGxBQUtEQ2NORGhUSEExd3I0THo1SlQrVEZodmFUMlpXTjl5dmRhWi9x?=
 =?utf-8?B?alNUUCs5RWliY2hXdXExSFNMTTh6Vnlrc0g2UGlhNGZtTHIrZktSWmsyWTND?=
 =?utf-8?B?TnliZzl6Q0M5V1VkRDhnUzJJYXhuUGE0M25zMEdiL29wdng3bWp4UXhXbGxw?=
 =?utf-8?B?cjNlVWl6NWR3dm1wS0Vtdk1QVlNiQVJ6cEJYbHB6MFFLYWtnNkZKOFU0eHBj?=
 =?utf-8?B?N04vZG9MTzNZMm4rMEFoS3R3K2pjTk0xQnJ1enRaU1M5SllHcGQyY1JkTHRp?=
 =?utf-8?B?RGlZZkZRT092WEFxVGFJRTlIbjczNjBHYUQ3L1JGcThncnplM1haMDE1SlZo?=
 =?utf-8?B?ejNodDZLdlp1Z1NOd2dPRmlxUWFBYTdjUkRhYnQ0eG5RcHdlaHg3VHBQclRo?=
 =?utf-8?B?czFUWHFLM2pzV1lvWGVyNi83SGsyN09mWmZiWDVWaTRsVDZiOHlUK3hxckZz?=
 =?utf-8?B?ckVzUldCUHRwQXFvaEU1ZHU0SkpSV1N0ZEVnNEFzSy9sQlJpNHFEV2F3STN3?=
 =?utf-8?B?R3JOUjJHaWdhT25sTXdRRVp4c1NMWVIwMGhKQVp2QVUrMkZSRHBRUElYRWhZ?=
 =?utf-8?B?OGVYd1BlYzRjV1MzNWxCS2ZRM3RReE4wWWpYbTVUemxuRHpoaFUyUUtTQlBu?=
 =?utf-8?B?QVpOZ1EzMS9idnVJSXhkYW1UaXEvSHRTR09BUHhZcWxSSnVwdjlsZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26678cd3-d247-4b46-107d-08de9bb9fbf9
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 13:13:43.4472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gu/cjmHgrWwpwQKmZj2/gGDYxVz2Ly0lj9YSVqtxKUleoMXAdgSpM8B5DEib3X4Br++GqiidauTzqRq73aDrJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7454
X-purgate-ID: tlsNG-4011c0/1776345228-CED708B7-5D6051A8/0/0
X-purgate-type: clean
X-purgate-size: 2512
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5F30840E923
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 01:28:11PM +0200, Jan Beulich wrote:
> On 14.04.2026 12:33, Roger Pau Monne wrote:
> > When running HVM guest in native TSC mode avoid using the recalculated vTSC
> > scaling factors based on the cpu_khz value.  Using the kHz based frequency
> > leads to the TSC scaling values possibly not being the same as the ones
> > used by the per CPU cpu_time->tsc_scale field, which introduces skew
> > between the guest and Xen's calculations of the system time.
> > 
> > On a 2gHz system, where the frequency is possibly detected as 1999999999Hz
> > (note this is a worse-case scenario), the cpu_khz variable will be set to
> > 1999999kHz, and hence 999Hz cycles will be not accounted for per second.
> > Over a second (the time synchronization period), this leads to a skew of:
> > 
> > cycles * 1 / (Hz freq) = 999 / 1999999999 = 499,5ns
> > 
> > So far this has gone unnoticed because the time synchronization rendezvous
> > forces the update of the tsc_timestamp and system_time fields in the vCPU
> > time info area, and hence the skew only accumulates up to the rendezvous
> > period.  Attempting to remove the rendezvous causes the skew to grow
> > unbounded.
> > 
> > Fix by using the native TSC scaling values (as used by Xen) when the guest
> > TSC is not scaled.
> > 
> > Fixes: eab8a90be723 ("x86/time: scale host TSC in pvclock properly")
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > I'm worried about the usage of cpu_khz beyond simple printing it for
> > informational purposes.  Overall I think it would be safer to store the
> > frequency in Hz, as to avoid losing the least significant digits.
> > 
> > In any case, that's a different change.
> 
> I'm not quite sure - improving accuracy is of course a good thing, but will
> we ever be able to do any such calculations error free, when already the
> detected frequency isn't exactly precise?

I think getting them fully accurate is not strictly required.  The
specific issue here was that the guest was supposedly running with the
native TSC frequency, but the vCPU time info scaling factors where
(slightly) different from the ones using natively by Xen, hence resulting in a
time skew.

When the guest runs with a different TSC frequency Xen already
accounts for it properly, and hence there's no skew.

However, as noted in the next patch, I don't really see the benefit of
storing the frequency in kHz instead of using plain Hz.

Thanks, Roger.

