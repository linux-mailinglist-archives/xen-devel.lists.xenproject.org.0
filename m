Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UB8PCfeh+GlExQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 15:41:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CAA4BDFED
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 15:41:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299936.1574505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJtXe-0004wC-Jq; Mon, 04 May 2026 13:40:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299936.1574505; Mon, 04 May 2026 13:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJtXe-0004uF-Gi; Mon, 04 May 2026 13:40:58 +0000
Received: by outflank-mailman (input) for mailman id 1299936;
 Mon, 04 May 2026 13:40:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wJtXc-0004tT-Uy
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 13:40:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJtXc-009ALg-8W
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 15:40:56 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f8a1e7-bab6-0a2a0a5309dd-0a2a450a9ba6-2
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 15:40:56 +0200
Received: from [40.107.209.56]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f8a1e5-56b3-0a2a450a0019-286bd1388b9b-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 15:40:55 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB7100.namprd03.prod.outlook.com (2603:10b6:806:339::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 13:40:50 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 13:40:50 +0000
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
 b=ScRXDbi23dSU22vcjON62LG2tWaQL8NFfuzpaMTZg3ZHAEehZUGN7SJXXFq3Xxy5c2xl/tu+Yqac+EGk7SRmqIJjqsLLd2fTPWu8YCchSr3LDm/oN5l9EXCDiPnP9Nn5X++o8u7zoWn449lznMbO+cYNHpFt8kSF16nqo/dgSmAge9DIln51PMxACyZVTJG4lK+Sw3XYJyHPmMscTmgRdJt9lDcTeBk+GodY+WTc12NCyQhn3uBjsCRM5g0MstITNOYN2dcdtrbrVv7LFCUMGAGHh+iVXMo2Ez4eWhFuN9hu3vrag7pGDCAUQg38QHSUHjllCUNpWkUQPZOLwrFBeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5ZUK99qPY3GpLSFKztsC/WhCwWerXVYqX5C3Giv6Qw=;
 b=H/BcGYgKUwm9d9e50es6fRiVab8ZpVTwlmKo6P5w9VtONR6A2EpVoZmdwVxA9GEw2m+zlHXGlZkV6h6mSzVi2WiOSJQIoGENmB8Qfo5Ax1UL6XNBr0HRYMy4qQ38FHmbuiNHqxUdxNR38necZrWMq623IgvgBl7JZ10lJC673zsjP4VA0i0xNfAkB5YcBWXA1hCwNMNyvl+4YOBuNqkeH6ruYxa635cOW72PHo5syXXueCyJmonJYxAyJI51tiwoLBIWzn+ExVS5B/30TD5/PUPGVbOCydayEW27cBJ2Llb4vGCJYoCm3JfbjRGdG1tISckNbajCE8melLCCR/0c6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5ZUK99qPY3GpLSFKztsC/WhCwWerXVYqX5C3Giv6Qw=;
 b=rxL8aiBBFbXHG/KxjuNK4KbofqJM3GhEJQVRIceMyRgvXasQnbOEhKV07nrNnL46rQOq7GfilZp4ovK6pjWuCjJyGTm4pnjk0w+LCNoL84cj4rQ2sG450RLOPFZbImnlvXLgKl7D06FfJCTHcWwrvQv9gHEht7+8BckQUnturGc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 4 May 2026 15:40:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/cpu: identify uninitialized CPU data using BAD_APICID
Message-ID: <afih3TENGGZCFKLs@macbook.local>
References: <20260430114647.94526-1-roger.pau@citrix.com>
 <62ae456f-3ed2-450d-aaf2-bd9cd10fbec7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62ae456f-3ed2-450d-aaf2-bd9cd10fbec7@suse.com>
X-ClientProxiedBy: MR1P264CA0014.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB7100:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d59c27a-0eb6-4853-a621-08dea9e2c0c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ftWegplcZe1vXUIP+pR5EiG1FRap5wk5xzYTh9VpadVw8beKlUdhbjO8YeitbzQcLwMOptL2VqDV/vSQBRaOy1ng7K9qJWIiYloL7riy6M3j3K/kMVRIrTAnMoDmttrOllJDZ5KJAhdzPJ32dCe311H3gEH2Cukkhp92A+uX2hLpCY+BTKybaeMIUR8n/8HjEEPKXgTLzE+hHEm8hbG/G/aA9az9LUelIEaLNrOHFZUQLMSlkIsDvrNrWPwVGVxvqLHYk5Z+VKdiG+yoieDTAiNOd9T60xMIi5nV7QjXdluJjXDq8/Y4jfaIbCZSeDW3/eGX//8VgOOPvYMPWX1Dj2fhQPQEek+YIk+O0vZUMbXQTTXdrVO9PCcE+ouofyFlJA2QX/6Wu8SfFgonS0aqSXRhkKUUd76qn/EYWqNb5w4ip1kOoTmfC9tIOWp3Raux2Gx55vxZSYenqFHX1NBDKjcoVXggKgZORDVAdz1VTGD43kxiTBLx5yA4HsOTFTEbmWBn5EE08kwSp7746qHlSte5q8aKW8X6ih3O187G6K/Fh4YNsGdxlyez8s4EvGd9qHHxAFiN10exzs1Wl/s3zXjDvs7dVX2Y3+IUiNKBO9nU99I8xpn47IO8JvLOfBNezxuePRB/NlI7xmEDfc1rz2KZZzoeXYqpUaXRcbvRnE/QzWffL9HjvejigVe48Rl4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTlwbHNTTVE5dW84dzVqa0RHbXN3cTU0REFhNWdTNzNCRkd1VUQzVkg2dThF?=
 =?utf-8?B?YTU0S0hveFV3T3ZHNTdKNVJPem5lYUZqak5mSkZDek43WHZXZjhjU2VseHNK?=
 =?utf-8?B?YXNJWWVWOHhsUEg5WmZWL2VYSnhONHgvT0RwcXBvVkZvRXZxem9id0UvV0NH?=
 =?utf-8?B?RllhVEpJZE8xODA4cnlBd0dkRmI4bmdYdDVWSjNsZUxvTG8rMWFiMkFMQVgr?=
 =?utf-8?B?ZWxObms1WFAwQUhyZFBPOTM0VkJDbE9WSnlDNzMyRDMzcG82TjRDVVNQeVBW?=
 =?utf-8?B?bzdrUTRIb0w5UzlWL0hjTytLQkNkVzJERXVlSm5xc3kvM09vNVN5eHJkWi9L?=
 =?utf-8?B?VTdwMGlsOE1jc25KOHNlbGYxOE44RjBkZWtoWWp2MGM2UUZteUxXd2lkSXJG?=
 =?utf-8?B?V3N3ZnFNVXRMNTFOT2NVMjBXY2c3SWQzdWtEWFlrQUo4R3BINXlvRWNjSU1o?=
 =?utf-8?B?WE5QMjRsRnZHMEorYjBIMFNhdjJobWo5NnFtdnlXWXlpOXdOcDF4TC8wVHFm?=
 =?utf-8?B?Q3BOQWpuN3hONXpYWWpnMzR3RytRV250MTBpUXhGYTR5bnBIblpkVSt2bzBM?=
 =?utf-8?B?RDYwWDdMa2oyK0Y3NW1vMXhoVWREckV0NXJObUtMUjZ6cE5DZW8zR2xCVDZ0?=
 =?utf-8?B?ZkhvQjBoQ3Q4WlpvcVAxSmNQVytjUkhGdksvMXRJL2pyTG1OMVpHaDQvdktJ?=
 =?utf-8?B?QVhsNnE5THV1V2sxUXZ5T3d3UUQ2SzdrVERaaVFJSHJUemViV1hSeENmS1I2?=
 =?utf-8?B?RkRheVlGRzAxM01hdjZwbWxCVkFVWnNVdjIrSVJqYk1TczRjN1d6U1BwOW0r?=
 =?utf-8?B?SWduMnpsWWdvck41d09ZNE1ncG1FYzl4U1cydUk3YlZ0UVhHdVdVb3Zpc0wz?=
 =?utf-8?B?WnVPUFNhUmVwL0hVQ0JuTHN3dEFzY3hBY0lpNUg0T2ZpdFFVZ2J3MzFCUjMw?=
 =?utf-8?B?N1IwZ2JPNUpFUlQwM0Z5S0hHUDNRcnM1Tm5ZQlM1Qm9GVlYzNFhFUHJydWIv?=
 =?utf-8?B?cFpJelNiV3g0UkVCMDdWTVA4Y2JQZWRlYkEySW16ZW9rME1XaXdkNFFpSk5p?=
 =?utf-8?B?QUNzbG5rbzE4WGlXT0pJNWI1bG92Sjg3SGNYKzhNM1NuaWlTYm5UM3lhejB4?=
 =?utf-8?B?UllrSjhBS0NnMjk1NG85Qzd1Z29xb2hvS29tcHpjSmRkQTd2MjdXeXM2SzFp?=
 =?utf-8?B?U01RU0NpMWdhdzBrQUxUaFBSM1ROWTVXVFp5ZkxIc1FrL0g1T21La0pldXU0?=
 =?utf-8?B?RVNpTWU4QW9DSG5CS0hYUndFcWhDdTM2QXZwcDNCRkQrdk5UM2JNL3BudWFB?=
 =?utf-8?B?Z3dHOTgrcGxvWGFXNUJZazNKcmNIMU5JTFZqTWRyTlFOR1JlZFdsMXduZDBC?=
 =?utf-8?B?a1lyY3R4ZFYwU0xFRVo1MGdiMEkzNmZhU01GZkwyalJLL2xzM1RtcW85anpv?=
 =?utf-8?B?b203VjQ0UXE4enptWDJmZWcyciswTlEwTUZxd0VQMzNwYVR6clptdWJxZlNW?=
 =?utf-8?B?S2VkS010YjB0Si8ycWJPRENrSVUvSEg5TnBML211L0JaOWhwWjVLbW5tdENR?=
 =?utf-8?B?TDJaMUkxMklRSlZoQnhvOTNPdWhoaVMwZkVRODMwYXNtM2dSZDNCNEt0aHQ0?=
 =?utf-8?B?NVp6R0pjYjA1ckZWMUViNnp2dVNZdWlpeUgzRG8xYk4rU3NPWVNZWklacDVX?=
 =?utf-8?B?ZzRmdWZqd1M2Wmk0RmFGSW9sMzJGMjk2WXhEZk9UQnA4VzRhRHVXMHZvWTN4?=
 =?utf-8?B?blo3RWxCdXI0V3lLMTZneWR6TmZCNGVRSnpYNjBOajc2VmZWRW1LeEd3bmdo?=
 =?utf-8?B?VlJodW15b1FxVUtoZ0w5cHZreFp1VVNMKzNpYmsxQXErN2NHMW91aVpXcWlo?=
 =?utf-8?B?YzcrUTdMMFdZeTNJMElYOHU2MU9KSXBqMDFKMG5vNDJMOGszS3RrNURRNU1N?=
 =?utf-8?B?TjNkcjNPWERKWFZaWDZ3dlZ3WGxveXhLeWpvZ216UGUyY1BGc0VFSTVHNVgv?=
 =?utf-8?B?TDhONmJPWHJwY1pLVXVsemlhckIxaG0rYjlOaHZtaUs3ckJhandFeGViZTNQ?=
 =?utf-8?B?VC9YKzA2b092U09odEhpZEZsSDNkOFRMV3YzcHJYRUJ4YndRNGNsNGs5T25O?=
 =?utf-8?B?OFc2ZS82ajg1dUQvcE1pZUc1WHQycm9JWktiWjR6aS9POUtsSXJVUUdRYm85?=
 =?utf-8?B?UUNLRTI4cVVzYW5rVHE0OTZaKy9DUXErLytoemJiNkhGQmpiUi9sQTRCTXkw?=
 =?utf-8?B?WnFGNDhldUZQVnJyUXpHYnREMHdIWkIzZ0lwRGRubXFvUTVYY3JMbjlJcito?=
 =?utf-8?B?WXdZc0FZNFdzNUVzQVZ2VEtqelBQdTFZbnQ3Nm9QMkxlMXJxTE5sUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d59c27a-0eb6-4853-a621-08dea9e2c0c6
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 13:40:49.9256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8p0o1uy6ur2bteBEPv1NcJdFrS0u1Ra1jaW0v5LJMZx1vmG0BTNYrwPkeBElpLb/iewr+Ql09y/zuao9QA2Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7100
X-purgate-ID: tlsNG-4011c0/1777902056-80C788B7-A88E5DD4/0/0
X-purgate-type: clean
X-purgate-size: 1390
X-Rspamd-Queue-Id: A1CAA4BDFED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,macbook.local:mid];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On Mon, May 04, 2026 at 01:31:34PM +0200, Jan Beulich wrote:
> On 30.04.2026 13:46, Roger Pau Monne wrote:
> > Uninitialized cpu_data[] entries have the apicid field set to BAD_APICID,
> > not boot_cpu_data.apicid.  Fix the check in cpu_smpboot_free() to use the
> > correct condition.
> > 
> > Fixes: 7126b7f806d5 ("x86/CPU: re-work populating of cpu_data[]")
> 
> I think this isn't correct, and the issue here is me having overlooked a
> dependency between that commit and the one introducing the line which
> you change: 8c15d3d18725 ("x86/SMP: guard socket_cpumask[] access in
> cpu_smpboot_free()"). Both changes were committed close together, but
> they were entirely separate submissions (well over a year apart). Hence
> as an individual patch that latter commit was correct, but on top of
> 7126b7f806d5 it would have needed adjustment. Since 7126b7f806d5 wasn't
> backported (while 8c15d3d18725 was), the fix here also shouldn't be
> backported to anything earlier than 4.21 (which indeed the Fixes: tag
> better expresses).

I see, right, in the git history 8c15d3d18725 is indeed later than
7126b7f806d5, and hence 7126b7f806d5 was correct when introduced.  The
bug in cpu_smpboot_free() was there, but 7126b7f806d5 made it no
worse.  It was 8c15d3d18725 that would indeed need to be adjusted to
pick up the new initialization value.

Thanks, Roger.

