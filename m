Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCRFNnjb4Gk/mwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 14:52:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 691A240E64A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 14:52:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283377.1565635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDMCN-0003wZ-AV; Thu, 16 Apr 2026 12:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283377.1565635; Thu, 16 Apr 2026 12:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDMCN-0003uJ-7a; Thu, 16 Apr 2026 12:51:59 +0000
Received: by outflank-mailman (input) for mailman id 1283377;
 Thu, 16 Apr 2026 12:51:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wDMCL-0003sK-SZ
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 12:51:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDMCL-00GoSe-9V
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 14:51:57 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e0db60-5cb7-0a2a0a5109dd-0a2a4501e7e4-28
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 14:51:57 +0200
Received: from [52.101.57.10]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e0db6b-c1f2-0a2a45010019-3465390a0fed-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 14:51:56 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB6549.namprd03.prod.outlook.com (2603:10b6:a03:386::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 16 Apr
 2026 12:51:53 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 12:51:53 +0000
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
 b=U+FW5CKMJijW+WuotcCmEUrnlZQrEn2kQXaulZ4AVYqRu+Y1/Vhmy5emmb85iR2Cix8L75OxiPveTaBhEYQnIclbyd3kpaWQJva8VA4IIggDDKSOT9/mH4zy6/xXWtw6020EDfsl2Sy4JjWXeEzTuL7a780mCjJ5dJ/9myRPAxQxbRckPYfqMtAZ9TD33LMbjY1JM+/FoH+r3/6ze5jnypR+meQ+vs5zxLet4mzxziWcOi6ftumTqxAD8eUqaLYbb1KkOy0+JWdfuCwCFmcr//aqW/obronEIDu3NgMq4iO6d4ZcKl1a3Aas05F/I1HlJe3oeE/0eEwF9zwgi0ujUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvK8tzfFPUqL8DxuGW02odaYKvZIuwiT17LQHLD9LUM=;
 b=CAp9+C8TixUjLLMaTUD9MM4vKCkhD8gHhTn/EaUczc3rgAVWPE8Qe75mT7t8d6ZjXnL7D/FmrHvPJ/3PtV0/ZXZN9Jl3o3mX57XOJc9s9xpaJJKY6Hu3aec0oFPa9K3a1zvuXzyivnuZV/KUckTwvQRXBk5Y3MljIh0ms7RQrgACBrZNVkQGECxPTgB1/DvF23H3MrYOpsnyXKi41BwHg+jpw5m/61Du1rCtA4zSIia90TxBpJUsoATZfTf7v7O8LBoIJ5b4TQbBEcvXgD6Dc/3V7obMizrAGuOUEuT/N/zxfoMaT42Kmzw0kRyE6ToB+J8OQRXukNtR++svA8Y3mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvK8tzfFPUqL8DxuGW02odaYKvZIuwiT17LQHLD9LUM=;
 b=hKbnDuUKDVa7anjapp+Fi00qxVNw3vANACGG8uZVsVuNBa2bBFaRlcCCjnBoWE0WLwIgFmvUUhfT1ml4K7oopGoY+YTyiGiaoeugcitwrmI6FI9AQrlX+gC3xH8cUruaTOwXe/3Ok3lVsXDbNEWBXTdivkwhhb9ZLNLov2l5iFc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Apr 2026 14:51:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] x86/time: use native TSC scaling factors when TSC is
 not scaled
Message-ID: <aeDbZZA-asNJ3Gci@macbook.local>
References: <20260414103327.7420-1-roger.pau@citrix.com>
 <20260414103327.7420-2-roger.pau@citrix.com>
 <f424bf3a-0113-4c66-b165-8dae82817f24@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f424bf3a-0113-4c66-b165-8dae82817f24@suse.com>
X-ClientProxiedBy: MR1P264CA0094.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::27) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB6549:EE_
X-MS-Office365-Filtering-Correlation-Id: 602c10c2-4486-4e08-6386-08de9bb6ef2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	TU2RsExEQegfbdcd2nyrmN+78M4dQ3pl2FMFtuI4DaoY+URSlQHeAsMfa7JBZVA98T/M4QcqYY9IyVDdeqnSqfsTrbjoNAkVqIi0ejHOWS7atffqx47svtQqP9H+OhBHVJX3ZsCySU6ia6PvES/yG9vsiCjeyj7WI4aJFQgX1zh0SvDPAZZyTHGqsBDH8UymyXBi8gr9FQXMysdhgC4oUX4hT37U5F9W5YYQBQX4NM3pgJTAHbP33ZlTWhXHc++RUC3T9f4tUvGK068nsitFHP37lhwmWrlxcid6xe5HjMguEEeMF1+Onijb4KJbL73bU5Q37IgltSCc9jMl0BtHSnbgOIqaKf+JInr456sIRIPsSyohtpV8ushaAG7oKgKnuEIJwmzl3ozXPvg0Oqs8gkqjnoBFP9bWou/MB03k8NAklYqDpeqZdbtHQEW6I31EmHccLPuAncMptibB8EUVmMweyEKEP/ZFfdgnvzDQqWv/L7Vha6EE4/OPdzSQeYcAAvMRC1qU9LHmI7SLLWe2ac4AvCvvPtW0Ky6zDUA+kSzAHZaQG+0UxkEIJKHDa7jdtTCestlIpungYbl09O50Azs9+CNBkoi6Gmm9blXhBSVzSke+YoK8xIQOHhKO1hjq3UD73U70XcQF2gDA3vvvguehk/4gr8Wi8jP/PlVVy+KXSwjcXXPFq15bQ/qSx3QVjigR5IrGX1tKkPRAvIBpMWLxPmKjRywTdgWn04dr5sU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGxrYzk2Tjh5Q3NEallXcmUvRGZtUThDeDlkZllKUlRDUHpUZG9GQ1VjOG9Q?=
 =?utf-8?B?bzMxNjFBa2NseXZ0Wld4Z0NwMExsU05iUDVoY2p5QWUyT0hBc3ZuMDc1ZTZL?=
 =?utf-8?B?dXlhYllJUVlGVHhiWjVlR2RpaDkrZGErb2c0bUE2VWNpTVZ1M3YySjZtRVNB?=
 =?utf-8?B?bkwrTWQ3aGZvRGVDWURMdmx4OWhLZzRmcTNXQ3NuWEErUmhlZGljK3NudVlW?=
 =?utf-8?B?dytncUhRS0Z4b0hpOTY1NFZEaVdJZjdaTlgxZS9ZN1Zxa2V5cE1IUXNyMUgz?=
 =?utf-8?B?UHd5K1pCanRxQ09hQXFLYy9leG5wNDY3OTgvYWhqaUZXSVBsU2QxbHpQS2t5?=
 =?utf-8?B?MUQzTExoREs0eFUrL3FCSHdiRVByK2h6cTE1elVyTjVsR0V3clV4VXNLeUQ1?=
 =?utf-8?B?L3hHQ3p6USswU1FHYWs4VS9GZHE5RTE3Z1FUWnhVZk1SUnVMUHhVWXdLcmhI?=
 =?utf-8?B?emtWWlo4S2JaMVVuZG5UY2NsZVU3enFlUHJPNm0rVGgwYW5uOGgxOUpvaDNU?=
 =?utf-8?B?VkJGRGlGM0t2VFhLUTBNdXVrVXJnZXRSaGgyS2hqOUx3ay9nMjhYK3ZWSVpX?=
 =?utf-8?B?VDZoU0JWOWVJdkozQUpRNGN4SUtKVEJLT0tVeGFESG9FdCtMakJaYXpVOXhB?=
 =?utf-8?B?VjQ2dWxVQjQwcEFOUHh2cmxoNElsK0dzTHdLZm1lWWdZck8yREFYRGx6a05i?=
 =?utf-8?B?S2lSeDNDVGJ2bk1KWGZ2VmlVL2J1d2pjNlhLb1FXZ1U5RXYzcnUvdis5cVI3?=
 =?utf-8?B?SlJEbmxTMjg5a2tKSjErSHQxK0pBWUdPWExVSEUvTFpQOVpHdHJyR1VOdlpY?=
 =?utf-8?B?ZUJiSlpTVHFTU2dvTTUyVGtnMHRDSzZlTC9CWTgybjdKaG5KTGsyVFd1UWV3?=
 =?utf-8?B?MG50VUhzbzBFL3c2SUgyanBhVi9yS2NoL3VGRUdST2wvVmJMQW83b1dMRmhh?=
 =?utf-8?B?Z2NqTEVaUjR3Qis0ZUdpd0c0eWFwem9hcWVMTmxJNjd6SFlGeU51ZXRacEZ5?=
 =?utf-8?B?MGc2YWg1aU4rMDc4YktjYXY1ckllbkhCa0JvWXA0b0V2TmZjRjlxY3cvbloz?=
 =?utf-8?B?V2V5aC8xQk0rbU84bmhzY2ZRbFpoZElFeC9uVW80akh0N2UrNkwzaGpUeEVr?=
 =?utf-8?B?dTR4YUoya2xVdDRwblNHL2RreFlGajYzcXlOWGwzVFFPcm5Fc3NCQTVzNitW?=
 =?utf-8?B?d0lqNEIwNWREdk4wSCtCaWxWRklZalQyVkJyNWtiVFp2RUFlOHE4VC9lcTUv?=
 =?utf-8?B?UENBOGxEbHI3VzZZRWlpRDhVRUE4ZHltLzNscXI4VGJoUEtzbWxqQjFETm4w?=
 =?utf-8?B?T2dUVGRvaTJBQ0Jwd09sczRyaFRGWSt4dFVZMzd0TU9yU0JDVStXaThHZnJV?=
 =?utf-8?B?SWZOVVlLWENOcEdsUithNnN4ek5JaDdzaXh6Q3Buc0tEUEliTnZTM1dFdUxj?=
 =?utf-8?B?UURqQkZQMXlyV041SENUc1phZExhMHdmN28yVER5WEVud2QxOWJDb09NeGtm?=
 =?utf-8?B?KzRkRVkrRExTU2ZYTWhyZWlsRjZHWElzbEtrMEVGUzBQU0RjSE5qL0ZFU2Iz?=
 =?utf-8?B?WmRxb3FNQmJmYTZLalViNTF1OVMxQTJTaDJlRi8yZFFqKzJodjE5M3BhZlpH?=
 =?utf-8?B?d2lXRjlSZXFDZlVLaHI5SWZlK24wSW9aMWdWYTZOSlY2RDJjTWNEa3pQM282?=
 =?utf-8?B?aCtvTTlnRUFzTEhiUDZjcVBsVUcwa043UWdEejh3Z1czZTl4Q09KSVlFZmNi?=
 =?utf-8?B?WXlJaU95Rm9tTkpJdHA3NnFYQWVPQVArL1I2RGVHbEFsMzdoeVBpRXhuYUxo?=
 =?utf-8?B?dURqU1JNMlRJWkdqNXpuYWxQNUlnWkNEVklMdUJrZzFSQVV4T2cvMHdrNEtr?=
 =?utf-8?B?RnJUa0ZLWWJtM1FVWkhTTXhGcnpxNVBnakFDeThzSkd6anQ3Y3NSSmFLcVZh?=
 =?utf-8?B?ekJ0L3VnZzZyeTBDWGpZaUNlZzMvMzRBZW9uUVZJVTZrSWNKMWdHNXdrcnYv?=
 =?utf-8?B?UkdTd3RwSmpOcDhqQVk0WWQ0SkViOXVLcHErV0dvZkZPYVYxSnRwajBHZ0V6?=
 =?utf-8?B?eGVUazFBUDdXbFVzaXJLRkdjb0lQRHlmL0FTcHFsdndOalJKcG9GZk1nSzFk?=
 =?utf-8?B?b2szS1Rpelg1aWVaQVZQSEpVamY3MlhkMzhTdHdINUc4ajdyVFE4YW1vZits?=
 =?utf-8?B?ejBHQ054eTNqM1EwbVhpV1NrZU5KdHhYRHpqd1BDMnJrci9UdWxoMWYvdzJW?=
 =?utf-8?B?bk1pdTI4RlBMUjhDeW11aDdCTm12TWgrVXBzTWt6ek5BWkRqVVBXbGIrVC9p?=
 =?utf-8?B?NjdDRjZPY2k4SGNMM0lFVHpXa0YybEErZFdjS0sweEVBS0o0YlptZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 602c10c2-4486-4e08-6386-08de9bb6ef2d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 12:51:53.4754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tkxd5fF05kZvqVhF/N6Uj3iTlrLsIIGSncZ6+bVHuSwdljnSz2zTj+jDzfWdESooTlg+Ov9T02vbm0eWidw+Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6549
X-purgate-ID: tlsNG-d62444/1776343917-BC812FF4-809E1DA8/0/0
X-purgate-type: clean
X-purgate-size: 3367
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email];
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
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 691A240E64A
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
> 
> > --- a/xen/arch/x86/time.c
> > +++ b/xen/arch/x86/time.c
> > @@ -1710,17 +1710,25 @@ static void collect_time_info(const struct vcpu *v,
> >      else
> >      {
> >          if ( is_hvm_domain(d) && hvm_tsc_scaling_supported )
> > -        {
> >              tsc_stamp            = hvm_scale_tsc(d, t->stamp.local_tsc);
> 
> This is a potentially imprecise calculation. How likely is it that its result
> will indeed ...
> 
> > -            u->tsc_to_system_mul = d->arch.vtsc_to_ns.mul_frac;
> > -            u->tsc_shift         = d->arch.vtsc_to_ns.shift;
> > -        }
> >          else
> > -        {
> >              tsc_stamp            = t->stamp.local_tsc;
> > +
> > +        /*
> > +         * HVM guests using the native TSC ratio should use the same per-CPU
> > +         * scaling factors as Xen.  This ensures time keeping is always in sync
> > +         * between Xen and the guest.
> > +         */
> > +        if ( tsc_stamp == t->stamp.local_tsc )
> 
> ... exactly match t->stamp.local_tsc? Don't we possibly need a (small) error
> margin? (In which case of course the next question would be: How to establish
> such a margin?)

hvm_scale_tsc() has:

    if ( ratio == hvm_default_tsc_scaling_ratio )
        return tsc;

So when using no scaling the input value is the output value, and
hence tsc_stamp will match exactly t->stamp.local_tsc.

Thanks, Roger.

