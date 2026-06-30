Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UQVnN3jpQ2rclQoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 18:06:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EB96E6406
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 18:06:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=xbyP1I9u;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1349196.1607083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weaxy-000164-Ne; Tue, 30 Jun 2026 16:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349196.1607083; Tue, 30 Jun 2026 16:05:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weaxy-00014U-Ke; Tue, 30 Jun 2026 16:05:42 +0000
Received: by outflank-mailman (input) for mailman id 1349196;
 Tue, 30 Jun 2026 16:05:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1weaxx-00014M-4z
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 16:05:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weaxv-008OxQ-R3
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 18:05:39 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a43e937-5cb7-0a2a0a5109dd-0a2a4504d7a2-30
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 18:05:39 +0200
Received: from [40.107.201.55]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a43e952-a01d-0a2a45040019-286bc937b8a9-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 18:05:39 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by SA2PR03MB5802.namprd03.prod.outlook.com (2603:10b6:806:f9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Tue, 30 Jun
 2026 16:05:36 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 16:05:36 +0000
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
 b=G+BS33s7tHYrFkeS54+WHq1xgankjvTCsiu5GcFoqHxHxuKqdDIz/2sA04IL/o6pF2xp4EQX9ImXvJPJb8TtedIlvEOT53Icpy0C/3bry4nJ0eWw9mCZXMeoVqEnxUA5W8F3uw1mZ2F+mTzVHYt7dDVJj6ZkpzqhJjL7ynYfX0qCn/qy3/SgplTfBm//7OIbO3Kz48VxY3JtTuI3Y8P1NEXa4hEBwyMxrZ4Xd/KQgdtSZafjjbNoU+UWDGPS1Vjulhhx2bq9w5LsUkHZguWrCIg0OjyBKFlqU4rMat4u0AKWKBxwA26Dcwq54Dj/Zjbg7bB5vqU2FLzpEMpMDrNEIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/1lLF3LS+pOlXaoZCY4S5d+B9kxSn71glJTXxI1BH8=;
 b=bfE5y+fWcV/ubS5jSjRgfCAx1qxnqxOA6p4l+nx5vWOnBzSAfDra4zn+R1Fq4U+NNLgUDPUh+aD2gFj9mRQ//WSHjdNSGYUmF4bEvqIgVlOw5zHF13rR+mF2xjdp0ZSgttI0cK4H/ZD5rW6rDCntzLfGOZqO0J9KptieXRx5WT8nNFQnMt9o9Jx+JPHyb8aE2v8eHTFaqX7t+Eypy5uJYPitmCiZSRyT93oRgLL2ZswQhymjfU4AvuL4TljmFVCh6B4m0js/gkbhYNCsqjBPljDxI97guZIl2SurUvmQ4hoPt7rDtmuCiKhnd7IRqlez2KHzG5/WhrGnEj9Tw8FGSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/1lLF3LS+pOlXaoZCY4S5d+B9kxSn71glJTXxI1BH8=;
 b=xbyP1I9uWQJsIUKpQgki9cyKG4YrSDpRjxtAgyeC4U/GakwXhOK3ecqFhNDaRg1aqerQXahioS9EMLnwR4Fvs5TOMKEHj0y8IIrOHLhEQIuV8NRuMRKEL/q2xlN9uBGhamh6FgaJwkrcDBeTloUKkxL6mmottVwvNFU58rvFG/o=
Message-ID: <64aaca44-1401-4649-a904-794df1502610@citrix.com>
Date: Tue, 30 Jun 2026 17:05:33 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/kexec: Drop compat_mode_gdt_desc
To: Jan Beulich <jbeulich@suse.com>
References: <20260630155749.751977-1-andrew.cooper3@citrix.com>
 <f94f3aed-279e-4320-942c-a79f06547f72@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f94f3aed-279e-4320-942c-a79f06547f72@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0206.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::18) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|SA2PR03MB5802:EE_
X-MS-Office365-Filtering-Correlation-Id: 9776019e-a752-4558-0eff-08ded6c16be5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	nZF5K//W+joGyneDo+EUxlH5xTysVamPldiO5PInhrV3up/PBisxtsn35ZsQIzhQUKh+boWhA1/B1uXIHYwy6m2tGx/1esQ8cYLh+/E4a+9DuAeiA0GW4uDhPFH4szJ7f2wnBp9anZqWJ1nWazQCY9YcwdT2L38QKSDVt7yjhKat0ab9p+qNNTFw7bncOtpGdwswrjonGLOY5911jV7s9LA7U0Aclmi4hkEB50Cb3dVdKhe6R6TEoCjC6I03T4YX896+KWsp2Or3tCLTy54tYD2RY8w1c1EyD/1zQPiWm3GrW8Yw2/Ytb3FE2JogH6hGML5tvWlsj7190zv+MBWhtPIUQdMS0DDIUrcpDWrKQTI6BRMWGRCd7+IcedjK7jv1S4llmt6cXIT1GPsV4Bhi1J2/03eJ+KogeF+621DoSv8V4HO4zleXWHG9Bf+ClPEV42ogG4il8wHngb/6tFWahLhk9c7nal8fUTqoNL+Fb0XJJESJLunsMNmwrrGiAv0n16ryyu2q9EbqsCe2smLAiCMDZMJ0TMy5YTPGDNJQkttPuXG+nAy9mF+d4UirENRc+45gaHrDXoXz9n7YkdEHnfzX+Cix7jrGMCstN3FWX2cPspIW0HbXHWDcG7C5qaHLWuoKtxRrMzs+A3tMhHJ19t5Zeha0JJu4Ohl70H33bmw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTBjZDNjTG1RTmw0QTNiV0U5SUFkSlc4T0txQ1NxRVlzd0hGNnhlamdHR1RI?=
 =?utf-8?B?KzNxWWMxaWtuUzh2Y0p1T2x3alhsUjJqNDJ2d1N2NVcyR0ZaWHVrdkdKbmgv?=
 =?utf-8?B?YjI0WlQ1N0RzWnYxZEVMd2xsbUY2ZE45Ylc1dnZybU1KK2hPZ2VxODdESVU5?=
 =?utf-8?B?SHRjRXRhdzg3VlpxeWt2R0ZhbmI5R3NxNWNMZGJkK3hpcUZGQnE2cVBETWpm?=
 =?utf-8?B?VWdJdkNyMVYzTkdhMm5uR1M0RzhicjFvN0tEZExzaVF4RXNXTGk1amNVOGJj?=
 =?utf-8?B?NENsbEZwdEgyaDNWSXdrekpENTkyRWJiOWlFYkV3V3FkTFhXZGRoMmhFK2lF?=
 =?utf-8?B?bzJ2TVJJbnhMYzZ5N1dZWVB0WU0zZHRRTjcyMlhNcXRwZVJXZWZtLzJWU3JQ?=
 =?utf-8?B?R1h3RU1kY2xkZmdJbDVqMW5pMEs0Um5UOHUvT3pIRkRYZW1lOGxUbWJZOXN6?=
 =?utf-8?B?Smt2bkR2U09DVStITk52Q2dnRWYyWE5kcTk4M1l5a2owb1ZCMTVCM2l3Tkp5?=
 =?utf-8?B?dzcwS3JJWWU3Y1dQS1UwSEg4bmFVZGtOandrdXo3azRGdFdOTGFQcnBDS2dr?=
 =?utf-8?B?anFKcDlpUE5yVVNRWFkvN0tKSGh6bElHQi9XbWRSTWd1SEQwdVUxQ1RBWWg0?=
 =?utf-8?B?YzZQaUY2L1hFR091SGtHQjJ5OUZKSDJrMlhkM09DTmMyMmRYekEya1NNZjY2?=
 =?utf-8?B?TUJSS2FiU0p3Z1dLMDRUSkhRZEtKdWVKSlQ3REUrT3JJTHQ1MHJ6ZEVZWmpu?=
 =?utf-8?B?cFMrYkdJQVl2OGdQWTY0VUZnOENldE9jblhVVCtHUWhPWVB2clh0ZVZMdzhs?=
 =?utf-8?B?dDdwbnhiMnN0c2RtSFZEZXJKQ3IwMEJlQW5FR2tGUGJrWW03NGdGM2h3VlVk?=
 =?utf-8?B?elA5UWYvMmRjd3o5c2Irdkp6YUsyUmx2Z09lSU9HNmNENDgxSDNxQW9wQitz?=
 =?utf-8?B?a2pXcXc1Nk5rKzQ0akl0TUUzVFk5a0ZneEcrYXZQVmdIR2dka3JBMFRBMFJM?=
 =?utf-8?B?Ykt0ZSs0SVRIUXpSekYzZ3hzcWJpUWhXbmFTQlFuSkNQckMyeDlYaUt2Z3lH?=
 =?utf-8?B?Y2wzLzVYSEhZanZrY2hyUEcydjE1anJvZWU5UUo1cjZDUGFUY0Z2NjVaU3R2?=
 =?utf-8?B?Q3ZDaDlUNUxEUW1wV2JBWlRITUZVN0JNWXcvZzZnL1ZCSk9HaDZTQU9WM0gr?=
 =?utf-8?B?SHpXUWw5a3RkN2p5SnpHVmE1L2ZkS2tHMm4yNzREU1ZMcUwxQytHQ1BPS25x?=
 =?utf-8?B?WmJJM1YvY0wzM0lMQ3FwVjJFRUptV0gvc3ZGd1pzNVJ2QU13bERPZ0hqbkth?=
 =?utf-8?B?VExIYmJ3MW0zQUJNV1dpcUhKWStJazczY1Ezc1FLU3VtOEU0RGNNcGttSzJ4?=
 =?utf-8?B?QTBYUnE5aG9SM2xvRHI5MjVHK2RPeXBQbmhGMWpWTkVZTVlzMTdtVktDUmc1?=
 =?utf-8?B?cDZKdW9CTzJUN1hOaWRKcDArUDAwL2UzRnR1akZyc3lMZC9wNGJJc0RRMzRr?=
 =?utf-8?B?Z3k0bVFlaXY2TFAvNTA3bmlzYTIrWjdBWThFZUZCMWQwSTdFcnVMamVNdHFR?=
 =?utf-8?B?V25WTFM0ZVQxcy9oRFZkUlB0VFVYcGhkMXZUUFd4WmtKNU9IL294UCtRbXV0?=
 =?utf-8?B?MFVqUU1QcDB3b1NMa2ErL1E1Q1lJUzFFRlNTYWFNWU0vY2xIZTFqNG5qNTJM?=
 =?utf-8?B?OUFHMUFJcWZuV2NteFRYV21ibDBhR0kyRHJVMXZhTlJzTFU2SmFjL0tSdnhy?=
 =?utf-8?B?ZWN6bmNudTd5UGRPWVA3M3lPZCt4ek9uendKLzhiWkMwNW1TRU5EM0NzbHRa?=
 =?utf-8?B?cXlqM2t3N3cyVDE0SkRFbExCWmtDajYvZkswMkpia3I1TWpxMTRHYmFJS3l2?=
 =?utf-8?B?dHlVMUw2YlMzYTlUOWYzMUp4WlMrUWQ4amxkSFVBYXQxRHNwRy9mcS8xWnUv?=
 =?utf-8?B?MXM1aEFzSVJNeUE5aXVGTmU5SWZlZjVSS2FiY3RiUFQ1VXZDdXVNaTFKMDhN?=
 =?utf-8?B?T2pZeHR5N0VsMjJDTWhVY1J3N3FXa3dhMEUvTnMySm83M2MzdWhtRGtjRkZl?=
 =?utf-8?B?OFF0NXN3aWcxV3RRdmlld2FsM21pWGFnT2hqRU1LQ0xpUXpWSlVRMlV1ck1q?=
 =?utf-8?B?cG15YkNtM05yNWpIR0h5WllWZXE1Y28xTW1VeC9oYVFjbVRiMnpmd3V2emxr?=
 =?utf-8?B?d1FXWWdxenFtWEFUelBxQXBzOWhVOWxwUzBqYlB4NE1DRXlURWc2S0pGR3lH?=
 =?utf-8?B?UWgvK3VYTTBVWW5OanRPOUVBbkQ1WWovMmhzaEI4bDE3L2lTcHl0QmV0c2px?=
 =?utf-8?B?d3pDYUJvWkRnM280Zm00YjJYVnBzbjJPU0dUYk5pK0J1NE52MUxGbmhnQWlu?=
 =?utf-8?Q?wFzRbRWfVzfNXwkI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9776019e-a752-4558-0eff-08ded6c16be5
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 16:05:36.2373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQYUsJSTcYjK7Kp0LOnLDw+dcInXuGzjM7ZySGuhdb7z7w8MFb+EtDS1BZRbsZ9ffLZx0/a99fHL9J0Y5COmTMe1tIO2V7UyCSMZsV5y64s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5802
X-purgate-ID: tlsNG-ebf023/1782835539-AEF2D1CC-C62769AB/0/0
X-purgate-type: clean
X-purgate-size: 569
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 47EB96E6406

On 30/06/2026 5:01 pm, Jan Beulich wrote:
> On 30.06.2026 17:57, Andrew Cooper wrote:
>> Given the need to calculate the base anyway, it's easier to do so entirely on
>> the stack.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Since we've started using (the somewhat odd) PUSHW, perhaps not really a problem
> to have another instance:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

These are the only two where it makes sense, AFAICT.  I'm not expecting
to use this trick elsewhere.

~Andrew

