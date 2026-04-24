Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id II+2DYt/62lLNgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 16:34:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD85460439
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 16:34:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293667.1571241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGHbp-000622-5D; Fri, 24 Apr 2026 14:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293667.1571241; Fri, 24 Apr 2026 14:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGHbp-0005z0-2N; Fri, 24 Apr 2026 14:34:21 +0000
Received: by outflank-mailman (input) for mailman id 1293667;
 Fri, 24 Apr 2026 14:34:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wGHbn-0005yu-70
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 14:34:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGHbl-005Civ-2H
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 16:34:18 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69eb7f5c-e002-0a2a0a5209dd-0a2a450cdea8-12
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 16:34:18 +0200
Received: from [40.93.198.62]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69eb7f68-62f1-0a2a450c0019-285dc63e379b-4
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 16:34:18 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 14:34:13 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 14:34:10 +0000
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
 b=M8wQXJLccYafABNEraAMkCHT388USbpCNzLxcKNAACmxVGBbByCrr3cmG3p7Hzu293KkYUO6yQ3kewyjiqY/LMc32tHIT8ZpVD5KSU8XWNbAdXGxVsvIK8UGn3rATVM2owqMFHuZju5Ap4zG+ko2SK0ohLFuIkmBhBuBynuq+TZ5/DP6SdA7R4r2ns9mpb5lHF89/02LUjlPKfYbTJGY+MCR+USTNEO3hXnPehKXS8Zf7T+iE/poG0XxWQPL8WFbbGVZ5dzJlamoyJBRdm720nv27uSYCtJJfYU/Sh6XK0xCCW5beIykqRBnZWMD1HOmaEKAABlfIw6UN7kP6bXRdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIkADVF/UMmjEt2yNFcwUJFEVG0YBO+Enjx1llxOZO4=;
 b=TiHFiyTS6gTAo/J8ickQMCPd5NZf3ToWoaeH5aP6Tt6aaVqU1vdDaRiFrw3eji6WREBjCcWvO+5RBv04W2qjz/tOcAOt1lIvylJUr+VHDCK6NRgaYCZ3keoj0G5O8dAo4vg8uvSyEbfNLIL6lgfoAse5leRBmOutp8l4GtXwq/yuXg+rYRGzV2KM1aS7DaqO5mTpsRS9vp40BwycFdh16wyHJ7d4nT/cakfU2ttxckhDaEAqqvjgygCSZd40mderAzCys4iguScEIYo8jpwILAIDfm22rfimxFgHLlAbgx75kWDW4pKsdQ7UiWTzuTzCSaMAKVSahRcXVMUnyoCv9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIkADVF/UMmjEt2yNFcwUJFEVG0YBO+Enjx1llxOZO4=;
 b=N/J/jPfWazwM1mjaEyixw9543vO9o5db+RQOOGlleivgVYmb6BZkFeRvdNe8IvCBGgi84uzVVXPNwamminHzLOoXPNti0AgpGSjYSpsMdflITiPIXhBSXow6s9OJ838FGrHS4Y+x1iFcCGr+ldWmdjwNtq4hKN5GkIV+l1zfhvE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 24 Apr 2026 16:34:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/9] x86/mwait-idle: arrange for BSP MSR adjustments
 during S3 resume
Message-ID: <aet_X0c504QvcqGT@macbook.local>
References: <7b7a677e-a5b9-42c8-beec-3c506b4eac52@suse.com>
 <e5e03239-1d4e-4ab2-8f16-83d280f23b24@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e5e03239-1d4e-4ab2-8f16-83d280f23b24@suse.com>
X-ClientProxiedBy: MA3P292CA0002.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB6581:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e077f1e-3204-4a91-5187-08dea20e8c99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XHsK+ICLioq+0eYnq/P1bjA6E1xrKHA0QpQSARDOuRXcYOGKuFz6QJCHRSheZ94MwSpo05tTbA9CYqx//e9fz6Y7z0LGFA4iUfK9jVl8gQ6Ql5PzM3roHSBARFuMcUZkJisDoC7Eo/U+LQWhmC7t6R+qxxvFFW9fo2HIpm5GgkDUvPWhotz682LWaJU9wqidurHckcO/I7tDDgMShROpR4K8HFCjrOSP/+ZndRHtpuPAv/jLj4mmEIRDSV8AIMbujZMS0o33xDxHJn+BmwvU7+LObxd/Mopwd/S8j4I2krSbPbF/VMd4xaBvxHEO/EqQ+OnoHZz3xC4WlDZVpDIbDFpOqet3ncgu4ErhSo9OEBQFdICg/HkIJwHRhILN5/k4xLb9fyV1ybK4YhE7yOssigQF/EU5dXTx4TE1Cceq9BfigY66Y8w9sxiA/oP52IQR+Wksb4CE9DUNOrLh2S9zIndFPGUxJAQzx1sm64T0MJiRptt9E5G46ArHlizb7kBILUZabpM5Hbe8rduTi3xcdkLmDZJkbSag+oklMa6HbezYHmxh5IIogeTOs2Hqd0p/WkveF8w0sYTKWwsbPwmZhLvOWKrcmdqymp9skc9gHxl/MjEeQwKkqXYZpj4CAyQbQg6CSZyOYFfEaESjzOWCnUHktiizNyiw9OHbA3q9EM1c0m2nceTVwnLONgEWgcjkthS7wmvHzFxMQ2EQnBLVxDJm7uDK/Bnokm+WxfMh0CY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGFmN25jbHYreHNEdnBSM2tqa2VnTENYdHlLTHVFbnZmUjVnREhIdC9sRVZX?=
 =?utf-8?B?YnExeUtOdGlvOEdBdENib08vWVdwL2p6OGU1UHN3R0hpVTVWK3YwSE9lbGVx?=
 =?utf-8?B?eUhYVUtGRE5ZaUFkRHpsZHN1d1BzeVp6T2F5aUhFOFZlQ29FRVhjWnhwZWtH?=
 =?utf-8?B?UHN2N3ltYjRXMDlqS2wxRitSaTFqNUhleE0xa3VjczZRYkFZYUtYbVM0MXNz?=
 =?utf-8?B?dHQ5Sm1rcGgzenVuWTNnODB0SWlYR0huckdCc0JxeU9UK1RUNy9xVVM2azZ1?=
 =?utf-8?B?dVRSQkpzR0NaWVFYc0JLSWlkbndleTQzYnhoRG5lNktKZ2U4MXg1TFpEL1N3?=
 =?utf-8?B?c2tWZ0ZqeU5MUTFuZXlIbU9OU0hWYWVTR0ppMXc3WVd6bHNRZG9KZnRoWVYv?=
 =?utf-8?B?bFY3R0E4dUM2UnNlOVJuZktERTlnYlhNMEZTUllGMG4ydFZMQnBVazVCTHls?=
 =?utf-8?B?UUx3UWVyeS9uTzRwcmJUbVVJWjRpdkdTUHg1YjVFcWRBUFg2K3ZQc283akJZ?=
 =?utf-8?B?UW1lVmdBRFViRkIrWG5VUElYUnYyUjFRU2FodkY5VUF5U3FaZkRPM25qN3BT?=
 =?utf-8?B?MWFlVnJGTUFMdEJkRXluYm45d1NPS1hQOHFidGRpbjQ0ZldNWHdXVkV6QXdH?=
 =?utf-8?B?SEhyaVJCdXkrRkNTZUpuNXdpcEYvM0wvOGtOc0VaMXo1SmViQ2NXellHb2R1?=
 =?utf-8?B?ZnZiRUJZMlN0Qm9NNmNnR1JWRmZkU1FjOW5QcmtDVjA5Z1VLU2VNOURpcVJ6?=
 =?utf-8?B?U2g5ZVkyeVlWSDBEVEp1dGdvZU16TFRMUFBFTS9vZWl4ZWUyRlgyS0dXM0hk?=
 =?utf-8?B?aVB3RFdueS81aTYxM2pQVVRYTmxXR2FGdy9ZTXQyQTNDMzI5aEZGcklmcHo4?=
 =?utf-8?B?WWNmVDBjUnhNNng5TWtjeUpoYldKQjdJdmY4SGlhU1RrREdPR2tRS0tzc0ZG?=
 =?utf-8?B?ZC9oOHZpSmthd0JuSk52UzVrY3o0ZHluMDVMOUs4M0hQV1pZV2FkVFNrQnhl?=
 =?utf-8?B?eWN5bWZuSFpqdlpOMnYwclhQTkROL3l2VDA4S2FBejkzNnpFa0MyZWY1Mm9X?=
 =?utf-8?B?RHdieGF4bnVDbU9QSk5vSW9SZ29YTUFJTnZYeEpyU0hyc0JwbHhJM2ZoenNG?=
 =?utf-8?B?R2NKdmZ3Q3EwQThSY3dPS0dCVnNCQXJSODNPejlOZWhzTFg3U1ZNUmhSMEY0?=
 =?utf-8?B?eWhUMjJKKzZ6b0lLdG41L3h2RE9WeHBBY1lyQ3pJZWRDTy9MOUVPSmQ0ZFZY?=
 =?utf-8?B?Y3pHUEFmaDBCUkl1dkk3QjFuS3RzeU1sZ2RVeFRzZmpkVFovLzZiMm5FYll3?=
 =?utf-8?B?Z2g1a05aUUhOSEcrNW00S1ZTMzl3VVhBdjRpa1NtTDZlTnFYbkRnWmJkUy9V?=
 =?utf-8?B?SjFuWUcrS205c0FvWXJzUHhnT2IvOWZMVmxtcTJpZkh3bVhhNlYzWE9MY0Vo?=
 =?utf-8?B?RUdnYk5uU05GcTMwVDRmY3d0YnZTak8vRUswMk1seDl3dGxQNkNSbjB3ZFpV?=
 =?utf-8?B?T2dFMTZ0LzNjV2xKRFAyQ2IxYUo4V05ZelFuOGpGUVlRZkFYdVlIZ2huVWE5?=
 =?utf-8?B?dmpQK0QwOE53ZmozR0F5cGVML2crYW1uQzhteHppZHlJc0tsRTZFSjc2Vk9M?=
 =?utf-8?B?VFdTeXlPY3Buc0JsOHo4dVBlSWxsYkkvYnZJZHdaRXdQQmtnSC9SQURPUEdh?=
 =?utf-8?B?VlYwM1ZVcHphN29zN25zYk9FYnM5Z042Q1dyeUl1SkUxeTloTHRVNGJlZGxX?=
 =?utf-8?B?V1RiazJFemJrSHJuNnZtcFpEUlFibEZ2MXRrenFsOG5QOEJSbkI0eVI4SEVh?=
 =?utf-8?B?cGU0b3BhL1M4YTdTV1pPanhRSERBa0M5a0hZK3FyVzJjc2g5WFRHeHN4a3gy?=
 =?utf-8?B?bDhlbUdMNm9wUjJuS1BqcjIwNVpNS01wMUQxcFF5MzlyK3FtRGhsVnhvaFBW?=
 =?utf-8?B?V201bnY1emd2aElBNmdoekJxVlROM2JHR3VpTkxyTlRyRHNLbE9xK1JkNVVP?=
 =?utf-8?B?WjNyWlVLQURzTDVoTWJteFE3MkkyRG1LQWMxaW1aUGJWbjJLVHVtcCtSbk54?=
 =?utf-8?B?WWdUOVBkNG5UWHBaa3VPUlo3SG9TNTVuQVVLVm9LZlZPaGEzejlVd09HVDJ4?=
 =?utf-8?B?UUtWWnQvUEFkQkkybTRGT2FJT2JVbG1XQ0g1VnJzaEJwbkd0d3ZvVEloY1Z0?=
 =?utf-8?B?eDdkaWdCaGFtSzdnTVZFYXp3Ky9JbWw5RHIvUHlzRlIzdkFlZkFBQWVFWWE2?=
 =?utf-8?B?MEpYTVFIeWxMeTlpMXBQRXdaZk92dkxLdWZUUXN2MFpNNU5vbk9WVEl1RkFt?=
 =?utf-8?B?SlZ3T1NoK3hNQlVCUFFXSHpXWHhEbFJta1grcFl2WGdQV2l4M3dVdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e077f1e-3204-4a91-5187-08dea20e8c99
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 14:34:10.7670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wtus9C3d9rgETED7vfrLKSksWy8KLJPP7UaU2D1hurSEreB2i2VjX2TJg33c3/7OHo4f+d3YAAzLe4h4ujTnlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6581
X-purgate-ID: tlsNG-d25034/1777041258-F5C0FCF5-DD4314ED/0/0
X-purgate-type: clean
X-purgate-size: 2779
X-Rspamd-Queue-Id: 8DD85460439
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,macbook.local:mid,citrix.com:dkim];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Thu, Mar 12, 2026 at 05:54:30PM +0100, Jan Beulich wrote:
> mwait_idle_cpu_init() is only called for APs, yet MSR writes will
> typically need re-doing post-S3 even for the BSP. When multiple cores /
> threads are present (and to come back online) in a package, for package
> scope MSRs this may be covered by APs doing the writes, but we can't rely
> on that.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/acpi/power.c
> +++ b/xen/arch/x86/acpi/power.c
> @@ -28,6 +28,7 @@
>  #include <asm/io_apic.h>
>  #include <asm/irq.h>
>  #include <asm/microcode.h>
> +#include <asm/mwait.h>
>  #include <asm/prot-key.h>
>  #include <asm/spec_ctrl.h>
>  #include <asm/tboot.h>
> @@ -299,6 +300,7 @@ static int enter_state(u32 state)
>      acpi_sleep_post(state);
>      if ( hvm_cpu_up() )
>          BUG();
> +    mwait_idle_resume();
>      cpufreq_add_cpu(0);
>  
>   enable_cpu:
> --- a/xen/arch/x86/cpu/mwait-idle.c
> +++ b/xen/arch/x86/cpu/mwait-idle.c
> @@ -1680,6 +1680,28 @@ static int __init mwait_idle_probe(void)
>  	return 0;
>  }
>  
> +static void mwait_idle_cpu_tweak(unsigned int cpu)
> +{
> +	if (icpu->auto_demotion_disable_flags)
> +		on_selected_cpus(cpumask_of(cpu), auto_demotion_disable, NULL, 1);
> +
> +	if (icpu->byt_auto_demotion_disable_flag)
> +		on_selected_cpus(cpumask_of(cpu), byt_auto_demotion_disable, NULL, 1);
> +
> +	switch (icpu->c1e_promotion) {
> +	case C1E_PROMOTION_DISABLE:
> +		on_selected_cpus(cpumask_of(cpu), c1e_promotion_disable, NULL, 1);
> +		break;
> +
> +	case C1E_PROMOTION_ENABLE:
> +		on_selected_cpus(cpumask_of(cpu), c1e_promotion_enable, NULL, 1);
> +		break;
> +
> +	case C1E_PROMOTION_PRESERVE:
> +		break;
> +	}
> +}
> +
>  static int cf_check mwait_idle_cpu_init(
>      struct notifier_block *nfb, unsigned long action, void *hcpu)
>  {
> @@ -1762,24 +1784,7 @@ static int cf_check mwait_idle_cpu_init(
>  		dev->count++;
>  	}
>  
> -	if (icpu->auto_demotion_disable_flags)
> -		on_selected_cpus(cpumask_of(cpu), auto_demotion_disable, NULL, 1);
> -
> -	if (icpu->byt_auto_demotion_disable_flag)
> -		on_selected_cpus(cpumask_of(cpu), byt_auto_demotion_disable, NULL, 1);
> -
> -	switch (icpu->c1e_promotion) {
> -	case C1E_PROMOTION_DISABLE:
> -		on_selected_cpus(cpumask_of(cpu), c1e_promotion_disable, NULL, 1);
> -		break;
> -
> -	case C1E_PROMOTION_ENABLE:
> -		on_selected_cpus(cpumask_of(cpu), c1e_promotion_enable, NULL, 1);
> -		break;

I'm possibly missing some context here, but why do we use
on_selected_cpus and the CPU_ONLINE hook?  Won't it be easier to use
CPU_STARTING and avoid the use of on_selected_cpus(), as CPU_STARTING
runs in the context of the CPU being onlined.

Thanks, Roger.

