Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pcjGHY9FMGqPQgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 20:33:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B5F689308
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 20:33:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=kGkKtLjs;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338500.1599529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZC7a-0001W1-1I; Mon, 15 Jun 2026 18:33:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338500.1599529; Mon, 15 Jun 2026 18:33:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZC7Z-0001TI-Qy; Mon, 15 Jun 2026 18:33:17 +0000
Received: by outflank-mailman (input) for mailman id 1338500;
 Mon, 15 Jun 2026 18:33:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wZC7Y-0001TC-VH
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 18:33:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZC7X-00Dbes-KS
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 20:33:15 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a304539-bab6-0a2a0a5309dd-0a2a4502ac6e-40
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 20:33:15 +0200
Received: from [52.101.56.1]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a30456a-af86-0a2a45020019-34653801149a-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 20:33:15 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS2PR03MB8135.namprd03.prod.outlook.com (2603:10b6:8:27a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Mon, 15 Jun
 2026 18:33:09 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 18:33:08 +0000
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
 b=KeTi5Q9hW5KeFAzX6fwerX1SOloKgNrw9AwwMyM2hkVWYBaWV0e0x6yMrPKbzasJ3QXJQ+lS7cGljuunMOYZRZXUHlnc24BvJ+v3Mo254oSP8YOExRrn96Nw1cDGbmKKkJdnpzdK4ycu6GhNSSd5Pu6Y3Mbx93t8qbDuT0jl3YHozPL0Nauq7JQEeTfgSmEhTtvGqupB1E+auBe0HvuSkvdER5TScZ8DWBGFzRxItgY/lt7S2Mq89L4qBMZk51ixnhB6tGgAVoGhtRQGZ7r+iY+qnk9+VXAuMNsRTfD9mqlVs+2LJ3OtqAoLZ/oE9XOPyJLtRoi/TDyEXuoEVDhXqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhZYQQIlyY8LvXei3rfhL+t1Sa1oDzRsSZR2UVkCws4=;
 b=exwpBplWpy2G69mekeuVHH7KwcPjq0JDr/T86ryEtr8/8xMtiuRZdIpvojEMSuej8m+7YaYzum+erwW/yrrwkF50yB440vx6XY5huXzq9dJFDgAq1LDOkVCukqd1z8qYFhGrCTM7VFTh/Zo4vd85ugGMEIDQh4u3qVOezOD+mSpH86X2qnW1eV27Kt9v1nbdVBP1bVAB/kezIvB9iHnaLxMBLp12DXoVAou5guSsJJv9BGUL/zwMRUaDAAiBf5STbupEOiZnlKgSwfDNzUJndo6YkvmOG7PpAR9M3Upwnv5QHqN7Rfy8q36OQS59KUcXexYsEjgzr8kDhTrqGmNVaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhZYQQIlyY8LvXei3rfhL+t1Sa1oDzRsSZR2UVkCws4=;
 b=kGkKtLjsXpaTVy4g5vG1cfG1AqrSZN/9Zdde899qedNVk+VmzYJXNmIgoozaUDtRiUdew/qBfGgJwtcoKfm0fPRTrtqEA4X2sxSpZnof6q951v0tz4s9bAzT+J/xb9Ti5/o2obcfAXSqDgRlYZ0i+HWXxKcZOvoqkNIzr58rD0A=
Date: Mon, 15 Jun 2026 20:33:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 2/2] xen/cpufreq: fix usages of align_timer() in the
 on-demand governor
Message-ID: <ajBFYYY83dmeM4Kp@macbook.local>
References: <20260227073259.1200-1-roger.pau@citrix.com>
 <20260227073259.1200-3-roger.pau@citrix.com>
 <d00f8d01-33c2-4b43-9ca5-c7aa98488ff2@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d00f8d01-33c2-4b43-9ca5-c7aa98488ff2@amd.com>
X-ClientProxiedBy: MA3P292CA0062.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS2PR03MB8135:EE_
X-MS-Office365-Filtering-Correlation-Id: f07a74a5-4c49-4052-99c1-08decb0c8bc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|11063799006|56012099006|4143699003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	/h/2zLMEfcXL8Dh4PfJpmZ/na2txpoX04PEXjH2OuZecpqoD91to8dwp5XFurfWHKGtQ5Yr6+XvxTlHe0D/8nd60xa3YPbrkkw6bEoA9TIPE9uRtOGFRq28T/kXrj3hNCddJ9ib2X640cpRuWfhRAjHPMiLuKo9aMiA9bf9GcLFE90Q4sptfNKRyEPj9BXK4vQvTZGs1xOzxoKzry5ZystM0XnCd7FF9uHwUmlhnAiuF8jFJu38YhRG0OtwDBCF8i8cRs0p/ig7Ti6F5CPS0hPYKyzZCtgPBnAeFEX2itRnWu4sFnWJUoz/OXlFwihPgch36uqM0N1IIOZzWUCDdfS4tYK17fv+Pi0X/4JAx/7b8vgpd293s134eLKPPvVWqv2/vqOUlS7fIX2N/oue01IDY57XYh/381E5/Oyt4wihSnla3FBdWXhDwbVp+/Z/LvJ6IrzLHAqRy1eiZqN+KCgjR1B04WSCe7UA+XOJN2fgQ0Wm4ZTxVnNVqWkCz1Po+FvmMdYwlwUZtUYKPiX1svHUuY3OZDLwRoV2o6AQ+fv+sMK9QTJ8oZkVM5TPuiDpdaKOSQynIW04ZbMdxhRIW5dfQ60O3hBRsGB2467T5iaqDefyrYiKN9tFrKBlXN5d5Ptwu28mjjvtavQANANpo/BQAP5liwNkhZJ+Ux1OqIE2Mb0KTe6flW22OcLOqrZbH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1RrWERSaGVvbmNWaE0vclNLeCtLam1mNENvaTZmVnB3TTBtZzBPUFpYWXVv?=
 =?utf-8?B?ZzRzMzByMjRwZ2V3SzhxT3Z5Sm01dDU1aTVVNlBXSndZejU3bUlkSGFMRm5P?=
 =?utf-8?B?c1ZZbVNzNFJqYjErQzNGTXV2N29oRlBuNVQ0bWthR210eXV2aFAvUkRmR091?=
 =?utf-8?B?Mmg1TTRYdnBJVHhIcnU4STFubkk2UWVmSXVPOG1TT2Nma1Q0YkgzRUhYK2wv?=
 =?utf-8?B?UUdpK29OeXo5YnJsQXF2N05XbXFzWEpiUDhZcXJIR0M4YktmUGxacHBRZXBQ?=
 =?utf-8?B?eWUwS3VHeWsvczJhSTlFVGlrcDFWZEtoMDlLZ2J1TVJ4UjBWdWhXWEFqTktT?=
 =?utf-8?B?NDR5VmV2U1N0Z2p6TmRaL05PKy9qMTI0RGIrNHhmVk9JbWxUbERlTW9jTEFR?=
 =?utf-8?B?Tjk4akp6M1J0ZDJxWkN0ckdxb2kzNExQUTBsK0daTTRoVmUyK1BtOVhNZTFr?=
 =?utf-8?B?Y1NoVUxCMU5mcVpCemwxRStKZm10MS83d1NDaFFhdUY2cnFTN01tUkp1Zzgr?=
 =?utf-8?B?VmVNTjU4T29nZmgzUkZTbzFmY0xJMisyYnREQVpFamJPR1M3R3NUL3NhYnhp?=
 =?utf-8?B?citpa0c3ZVVENm5NeUZHejRUNVBjK2s5TkQxbnhIbjZVa2FscFFvdzRScGxY?=
 =?utf-8?B?WFBtdWt3L2xhMjF5dzE1eEJOSUVwNER1ZkZWMm1LSGIvQzI1L3p3SEJDRzZH?=
 =?utf-8?B?eEdZUS9JYUtzd3JVQ08zU1h3cVVIUVg4SkRHSVRUUWtia0dNUytnbk5uaE5a?=
 =?utf-8?B?MktQTEZRNEZVMCtOWk1tNDVPTDlyVStnWnFqY1hCMVVOdmZxSmJWNjllRUNI?=
 =?utf-8?B?UFk3aTZDNFM5U2hOWTc1cW1DZmljdDV6VS9HUXAyNXdndnZqYm15ZTl4WFcy?=
 =?utf-8?B?Q3R2RjJzQnlFa1FvTTVTRWNsaC9PK0Q4WVIxOWxseUtxOWlnTlZybXBBYzlE?=
 =?utf-8?B?LzVvTTI3cXVabTVicnBtQ3F6WmNvcllwZ21DMHBvNjVURWZ1eTBSSnV2Mkc0?=
 =?utf-8?B?REVEWnBPRjVqdjhwZ29Hc1FaMGNaQ1U4Q1NIaWpURVY2ZU1TVG9yYWp6ZGtM?=
 =?utf-8?B?c0JHRWJCVnpPc2xSSjVJRk9uVjlLV2xsYXl2SmI2dHA5N2lpZStIWnB6VGto?=
 =?utf-8?B?M1JqcG1mb2tRNXNxWjBPbGwySEVBRDFneld1eEFjTmRXRGloVzRmdWpHNVU4?=
 =?utf-8?B?Qk04di9DcmhKa3BZeXc4MFByN0RDcVN2ZTRnYStEeW1VdEwvaWwrOGVFaHVj?=
 =?utf-8?B?MWc3ZGlJWW5sa00zWm40NFk1dGtMakZmTHIvVzlvWkg5b1kyQXY1SlJHQ0Zy?=
 =?utf-8?B?WnUwOFZqbjlvMjJMc3RIaVZpMFNtVU1xNHhMcURUcGk0OGp6a1Z3TUlkVHh1?=
 =?utf-8?B?RkJ3c01NL0c1THBJSE1ZcnNrUUlBM1BQN0g2RzcvSXQ1TzZBSnpKcktZQjMv?=
 =?utf-8?B?anNCRjRlWXdHTWRrUUIydW1tRjQrYU5GMlpvVUUvOExkczQ0MWd4QTkwTGtK?=
 =?utf-8?B?eVY0SUZrelFPRmFlUGJSQ2NleFNyb200THNqdGJ3MUFLN0pCMy9WS0lLdytk?=
 =?utf-8?B?bnhjalp1Um9HWFlQSFNWaFNvdC9yK0dtQUthanNadWMramYxbU9qY1hOUGpv?=
 =?utf-8?B?aVhkV2c0OExmUnV5WksyWTRmZHdrUmdYWDg4bjVIT3MrTWZKSERJNDRMQ0l0?=
 =?utf-8?B?Y2t2eERGOEtCMlN0SE1UNVJmTmk1VDBIZWZTT28zQjkyRElWOStLQUtuaVI4?=
 =?utf-8?B?WVhmSXoyRmppaUk5Y0VhRVZ0Zlkrb0FsRTFCc1dtRHFnMFJ1TUpObWpGUW90?=
 =?utf-8?B?cmUvOC9pcnlVVTNlQjJzdFJhNUlBT1RtUm1KLzVOUW5neFV6MnZ3ZXhtbDZH?=
 =?utf-8?B?UTY1d1JGRThjdVRSbHN1c2p4N2tlc3oxMDc1VmhsR0JlZkliK1MzRXdER2JJ?=
 =?utf-8?B?bjRsOW5mMVU0NFJYN2JmY0Zlb3ZzdFpFbHc2ZytNZlFKeENBV3g3ZjFCejFm?=
 =?utf-8?B?ckZkN3ByZjgrb1hIMWdDeFNWMEpRczdPdzd0ZU95OGNuRzNTdkxza0wyTUxt?=
 =?utf-8?B?WmtlUi8wdjA0cTRBUEhQSVNQaVpYdVhhZE9rd1BPWkZ3VCtWaXF2TGpiU3Iy?=
 =?utf-8?B?K2hjZG1HYmtPU3J5enl0a1dJdFNXZ0N6aVBNUGRlSEFnU1FxVVN4L0xLeXNU?=
 =?utf-8?B?YXJkVk9ISGp0d00zaXBGNmdDRDB2RDBlYkk3c1hmVE11eE02Y3VVTHBHWStU?=
 =?utf-8?B?b1R5MWROUjZ4UFFxVlpQYVdSQXJyOHo1cHBFMUEwQlk1V0RwMVJDa29GZlYv?=
 =?utf-8?B?ejRqZXpJQ0lhTzk0b0ZQT3FLODl2WGNXWUNoN05jN3g1dGZ1ZzlIUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f07a74a5-4c49-4052-99c1-08decb0c8bc5
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 18:33:08.0251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0lIR6WL9Rft2ZFjg6s4zOqR27avLyVHffsU3h3i2tJF+GSZcAJoXj+72fb3G6OwcYwzPpIM2BMiFYoVUZW73ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR03MB8135
X-purgate-ID: tlsNG-720697/1781548395-8276A161-69EF072E/0/0
X-purgate-type: clean
X-purgate-size: 3744
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C6B5F689308

On Mon, Jun 15, 2026 at 01:44:54PM -0400, Jason Andryuk wrote:
> On 2026-02-27 02:32, Roger Pau Monne wrote:
> > The first parameter passed to align_timer() is the timer expiration, not
> > the current time.  Adjust the calls to align_timer() in the on-demand
> > governor to pass the expected timer expiration as the first parameter.
> 
> Internally, we have a report of a benchmark regressing ~6% with this change
> on 4.20.
> 
> s_time_t align_timer(s_time_t firsttick, uint64_t period)
> {
>     if ( !period )
>         return firsttick;
> 
>     return firsttick + (period - 1) - ((firsttick - 1) % period);
> }
> 
> The code rounds firsttick up to the next period:
> 
> align_timer(0, period)          -> 0
> align_timer(1, period)          -> period
> align_timer(period - 1, period) -> period
> align_timer(period, period)     -> period
> align_timer(period + 1, period) -> 2 * period
> 
> With the change of this patch adding the period before calling
> align_timer(), the timer is set for two periods in the future.  The only
> exception is when firsttick % period == 0.  I think that is unlikely to
> happen since NOW() will always be a little after the period.  Even if it did
> happen, the timer would fire immediately, but the next timer would be set
> for 1 period later.

Hm, I see.  So this is explicitly done to never exceed one period
between sampling, even if that implies using a smaller period and
over-sampling.  That's kind of different from how the other caller
uses align_timer(), where it's expected the timer to fire after the
period has expired, not before.  I think create_periodic_time() is
fine, because it's only the first tick that might be delayed,
afterwards the next tick should be aligned to the period already.

> So I think we want to revert?

I think we want to revert the first chunk...

> Regards,
> Jason
> 
> > 
> > Fixes: af74e3a15a83 ("cpufreq: align dbs timer for better package C state residency")
> > Fixes: 382b95f627a9 ("Fix cpufreq HW-ALL coordination handle")
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >   xen/drivers/cpufreq/cpufreq_ondemand.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/xen/drivers/cpufreq/cpufreq_ondemand.c b/xen/drivers/cpufreq/cpufreq_ondemand.c
> > index 537695eaab19..0d94c0e464a6 100644
> > --- a/xen/drivers/cpufreq/cpufreq_ondemand.c
> > +++ b/xen/drivers/cpufreq/cpufreq_ondemand.c
> > @@ -185,7 +185,8 @@ static void cf_check do_dbs_timer(void *dbs)
> >       dbs_check_cpu(dbs_info);
> >       set_timer(&per_cpu(dbs_timer, dbs_info->cpu),
> > -            align_timer(NOW() , dbs_tuners_ins.sampling_rate));
> > +              align_timer(NOW() + dbs_tuners_ins.sampling_rate,
> > +                          dbs_tuners_ins.sampling_rate));
> >   }
> >   static void dbs_timer_init(struct cpu_dbs_info_s *dbs_info)
> > @@ -400,6 +401,6 @@ void cpufreq_dbs_timer_resume(void)
> >               (void)cmpxchg(stoppable, -1, 1);
> >           }
> >           else
> > -            set_timer(t, align_timer(now, dbs_tuners_ins.sampling_rate));
> > +            set_timer(t, align_timer(t->expires, dbs_tuners_ins.sampling_rate));

... but possibly keep this as-is?  Thinking about it, t->expires
should already be aligned, and hence we could drop the align_timer()
call here?  It should be equivalent to aligning NOW() to the next
period boundary, so yes, we could revert this chunk also and
timer expiry should be the same.

And maybe we want to add an extra align_timer() in dbs_timer_init() to
align the first call also in a separate patch.

Do you want to send the revert, or should I?

Regards, Roger.

