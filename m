Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GI40FjCd52ml+QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 17:52:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C03C443CF47
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 17:52:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289137.1569340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFDO5-0004uT-P1; Tue, 21 Apr 2026 15:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289137.1569340; Tue, 21 Apr 2026 15:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFDO5-0004rP-MA; Tue, 21 Apr 2026 15:51:45 +0000
Received: by outflank-mailman (input) for mailman id 1289137;
 Tue, 21 Apr 2026 15:51:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wFDO4-0004rJ-LR
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 15:51:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFDO3-00FApN-Um
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 17:51:43 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e79cf0-5cb7-0a2a0a5109dd-0a2a4506a6f4-38
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 17:51:43 +0200
Received: from [52.101.43.15]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e79d0d-7371-0a2a45060019-34652b0f463e-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 17:51:43 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM6PR03MB5306.namprd03.prod.outlook.com (2603:10b6:5:243::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 15:51:39 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9818.033; Tue, 21 Apr 2026
 15:51:39 +0000
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
 b=KPtlFWinBpdKFTI8bQVNXc8BMskr14bVh6oKKyvmE0YTxo3rvQtmwPGooAVyvEGbOgoWoHhSf2MPeuthq8TY3vq1k3o6WFC0lVe1RC7DV3mjAc6r9LXj8FSGsgDXmdL8cE2FNN9L57cR/0mguo8ClZWf+N+9Rf0eXzeLtwwUmjYEM8Juqe99SWU+0KUIR5I+VdtRlqCavETPRaK+ClpoOyFvn2GZdAWJHhztnnbBWwTR0ZzBQ7RrDkqCYRHkQRofY4bwNskZleq4iANTg+vvqETl0V2l4y6b7Pgbl4R7oTXKzs1v+GCDmbJ0JGcPxAucZeJhqQIDSRt9ae+a1GQBxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpZknm63C3UCr1JhTs56RiX4HA+vYrjymingqcNFx6Y=;
 b=nIZizQ/G0CuFoWk80EUBLKazBdGDQzJGdqp02gPHdmGrEJNqBaL5Avdp12lC4muQQAHDeRs17t31gwf0zQD6LEnHBZ1dvF393xXZGl/cpmVhQ1MIlWPOLRH6O7Ie5Z9H6AkI6X5wScgbElDh9dEgA1ISvZigpnWWbiy7joAKa+cAqcbit+LaV8QlXnzmrT08Oo1TR1hBfvng2A5dr93VV+02Ruzw4NvCMUTyqO43oJtfyMHCYQ25xPG0unFOnNqR6NiX3mVhl7Po1kOwc2T4bqmukjUvd9byDfMDRqrYPzgVUiTIqAfNurNecgSacFjxQskRwlAazSc712aWZ99lEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpZknm63C3UCr1JhTs56RiX4HA+vYrjymingqcNFx6Y=;
 b=LwOrkODIh0XHX8cBpWPQ2nl8ND27jlKC0K4AmUYCb4bLbdKknLrNIriueBrhCZfpoFrU84vbubUxIC1ibPN2NhmE0UK8Hf/s3X3bZfe/WlH2aO8FNDhvuxFSM4JXNzhr4oom+JiyvIAdhwaZdG/4yJWuPNZycDGsDohQx6Bzmvk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 21 Apr 2026 17:51:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tools/xenpm: fix FreeBSD build
Message-ID: <aeedB31aEBJb2Pa8@macbook.local>
References: <20260421153224.36368-1-roger.pau@citrix.com>
 <2204fbae-be5b-4f56-ad2a-cd5692db81cb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2204fbae-be5b-4f56-ad2a-cd5692db81cb@suse.com>
X-ClientProxiedBy: MA3P292CA0027.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::13) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM6PR03MB5306:EE_
X-MS-Office365-Filtering-Correlation-Id: d74373a9-2e7a-40e5-fb94-08de9fbde01d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	woQI7jIBWQh36dwmOpe72cz5UrrlCAUJb4JefadqSBmCUjEY0bV2RuQl9M9sjjjHP7XGYgNgYWLgK47zh8SaWoTDRggIukSOwhwl15zmKbN67PlumXVDFZJjuxIKJhXyxYq86qz/hmUwofvFZ/Lve9hJkvS113kMbcZdNh/89WMUboJEiwRkmUQpBGa5VWw/ltdEnnO7PK+tdv5I3DufY5blcR+jD11wqhxcq2hBK9pU6JH5oFR7ub27mWn2PwtBbZfocK6rV/k+bkT6GLjEbvna8xzOwHNbanx7cR9wHqQx75qI5Irqt/docw3/7/mlSgmpZ+fl95GQX6MVn94imiVLo2yxOW+GmxE6Rh1C5E3QgWBFUaAKL0QfURwrWoMZJlnKlw5+JS2FPWRjVh/fBG/7pfzyWyd6QFHKLTMA6cT9IHrn/QO4N2W6VnfFHocoyy3loH0d+IDH8rIgxKYFn9t6+BXyVsNTSXkk/myWjS3oIZ6SJtX1yR1jJMlbOVLaxUycNSJMdSbje/2HklLPMuKqGYY/BK3qLbuYWqfNyaRVQBoSXsYC8y4MkxDd7kdTWqauZiiApLw6Vv+Oni6TNoGEUzwQByFENgfBjdKuwzQX0Te2nZBmXMzt8epJtoIKChkkf13IZiE9ZbmgjOJk6z9JtfaHjGiLWWo+hFRXv93bRFTBqqz/WvDI1JZk7DlZw9/3epTFvtOSkZIqd9WiPbhZWJlBk0BDsU82VvdgTpY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmFIZnBiNEZjQU02eXdMUlNPWWRRQ1IwZHFOYjVMMFFHalNYdTJTZzVxcWtO?=
 =?utf-8?B?dEoxVVRFSkJNRFZzMGRyVCtGQ2RUUWVnQnFWNnlMRUs2b2t2elNSdnRCTU5a?=
 =?utf-8?B?SWk3a1BwM0ZjMVA5RHhkanVNNU9Dc0ZjVEpFZnpKbVVKT3pBNGRqd3hjc1VT?=
 =?utf-8?B?bTNsRk9Xb1R5NlpxSzBudHdlS3hFU3FKbVBMMCtsRGJyUWFHekV2enRYd0NN?=
 =?utf-8?B?bXNibEtDOWZoSlpYSFQ0dWJoUGtpckJ4WTI2cDVGVUNsWE9uNXNnUFc4aXEx?=
 =?utf-8?B?SHJXOVIvNmY0YUo2WElVcFVFSktyazJQb3FJYjdkS2RiOEVWdzI2SSt2RW5S?=
 =?utf-8?B?MTltV2hnNXNWeWd2OWNXZmgvOGlhdUJBU0ovUXU0UzNIZDZSWGk4VWtHZzhH?=
 =?utf-8?B?NlYzT3FraXFtVUwxcWlwQndqK29jK1FOSGhsR0tMQlBxVndPdHRRaXY5Sld0?=
 =?utf-8?B?QnJvYXQ5NENFTUx6R3BHVnVudDQ2d1JMV0pTalhMb3RSY2wwZXVxS0UvNnh3?=
 =?utf-8?B?UjNiNlZVUG5pRng3Y3VXNE9rTHBEKzdRVmdaVFUzUnBOUEZIREdGOERMbTRJ?=
 =?utf-8?B?bmxHMVh5TkdiOVdCdkJtVFBhN0pmNm1heGlmbXlQakN5SVJ2YmZRQi9kdWRD?=
 =?utf-8?B?MEsvekI3M3hpRHpoQnQ2c1FaZFNzd0ZIOU9wVEZFUFZPa1RLQ2Nad3NpWHg5?=
 =?utf-8?B?TksreDljZ2hNN0twMWhCMUI3OTJDZ2VnYXY4TmdRQXVXSDFIZjlaSWFrVHo5?=
 =?utf-8?B?MkEyU0dnSzA5YitLZXBVQnY2VlduZnZ4c085Vk9kd054SWliTVhZRE9WSFlv?=
 =?utf-8?B?MUJvc1djODc2UEwzVGJJVVZQdFZWSGpUVC9DWGtDRXdaSWZ4TVJwVnlJMHdN?=
 =?utf-8?B?Q0lmcm5kdXczQlYzV0M5TGJ0aGNJZEtBaHFGZUpXeXVBWkttLzZjTW9McEFy?=
 =?utf-8?B?RzBhTlU2eEpuWWp4UEtpNS9xc3ZLZzVYZFlTczAyQVI0QjZVdkpZY0dBTEJF?=
 =?utf-8?B?aWhDYzhaeDBVRVVmNUNTZ2craTJiSXJhREVSN0dDUzd6TXZTSllvWTVLWjZw?=
 =?utf-8?B?U0lQNi9BOWcxN2hWWC80THo4N1RxWUxqUEhRUkdlbStreEhFUTlWMVJlV2RT?=
 =?utf-8?B?UG96S3FJQ3A4a2phS0ppZ2dOaXp2dGZkc0FTM2Y5b1lDYy9VZDJWMnpsbXNz?=
 =?utf-8?B?eE92R2dnSHZtNklyUGd1Nk1lVFkvSUQyOHUrL1pmVTVvT2p0OXk0NFJuRHV4?=
 =?utf-8?B?bGgwT1NXUnJSaVh4ZWlidW9YT3ZCaUVheWJKZ1g4bHJxaXRLSGdpdkdWN3oy?=
 =?utf-8?B?NStzQVRzemFhZk04UlpPNWhLazliYjJieTNGSExLRWRidkVBZkI0UWxrbHVY?=
 =?utf-8?B?YlNPRDcvWnBQZEtTMm15YVd6TW5UQWtkMGR2b1pBZG9IN0hLWWI2OW4weXBr?=
 =?utf-8?B?c3Bha1dySHVtUms1UDdNYjNOYmxRZ3MxSU1WMnl1cTZMWG0zdUlZK0FTOCtE?=
 =?utf-8?B?OHJ0N2drQlRPdkdvdmhCbVVaVFpVcEt5SnNMbHpQS25aOVhRR2VPVlRnTEZ2?=
 =?utf-8?B?dVdib2c4dmcwQ2hxYUUvY0ZkNnIzbkhPVEZMMzNLVG9oUlljQTVta2ZTdzRz?=
 =?utf-8?B?bVlCclBPWjhQQ0gvNU4xMERyeVNsNmI2YmJtQkp1b3VVV3VIMVZjdDU1QkNV?=
 =?utf-8?B?RTJIT292Z0tEWFBuQVo5Z2w5UkpSMDc4Z2w0cEozbndESXhhVE11N0x5N0Ni?=
 =?utf-8?B?SWM0dEdaVFJaNnpybUhaaEdhM21HOEx6QldBcGZxa3FpcEIzR2Z6UU5mY3p4?=
 =?utf-8?B?eFRQZ0h0UEU0RFNpM3g2bjJJWmFlWXJjNVNEUjBHeTdTOUczczFCcU5hanph?=
 =?utf-8?B?NEpreVJrRkxDb2lJMmQ3amMvYi9JdUthQzZRckczTXBDdGZmQkxla2U1MGJG?=
 =?utf-8?B?NllTUWVLTkpEbnFwYmNsSUdMeHJ6SXlNbmJjbyswRjFLVk1YT2xiNWpyRDho?=
 =?utf-8?B?TWpvQUh2UlRaaisyaWxldjIwMTlYUU1qOWlvOGI5aW10UGp5dEZScG9TbmE1?=
 =?utf-8?B?eTNyMGpsOW5oVnFxTHhNZ2xPRmlmc3hSWGs3Wmc5TlhiUVdGd2FFQzZpZGRG?=
 =?utf-8?B?YnhyTlV6K2ZVOWJUNkZxQWlZQjZtZWk5Rlhwbk5laGpQV3Yxa3F4U0hkdTVa?=
 =?utf-8?B?VkpqLzJaRXMwSDFmV0ZpZXFRcko1b3BFK3IwaFlmM0syZ09WZFRtWjRwNjlH?=
 =?utf-8?B?cUtFOHZDK1pnV1lmREpZYkw2VUQ2SnlDOHgrU2FIcmdCRER5WExubkFNbTNQ?=
 =?utf-8?B?eDI0UGdKeUlDOXVDZXZzdkpZTjNCZU0vbHBYUmxoRTc0cy9rdjB1QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d74373a9-2e7a-40e5-fb94-08de9fbde01d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 15:51:39.4348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dqTC/rZrcl7XZSFuQ6q8W6aLw0EUNjGcXsjFCuuCv+O56bbZztL3ssCZOlM/FBFTrKYspzb8CL9iOf6lrYCTfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5306
X-purgate-ID: tlsNG-16d1c6/1776786703-CFB7DD75-A6E482BB/0/0
X-purgate-type: clean
X-purgate-size: 1619
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
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
X-Rspamd-Queue-Id: C03C443CF47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 05:35:57PM +0200, Jan Beulich wrote:
> On 21.04.2026 17:32, Roger Pau Monne wrote:
> > ENODATA is not defined on FreeBSD:
> > 
> > xenpm.c:1380:17: error: use of undeclared identifier 'ENODATA'
> >  1380 |         errno = ENODATA;
> >       |                 ^
> > 1 error generated.
> > 
> > Fixes: edb657887a60 ("xenpm: Add get-core-temp subcommand")
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  tools/misc/xenpm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
> > index 87107bd6c617..ecb39c911d84 100644
> > --- a/tools/misc/xenpm.c
> > +++ b/tools/misc/xenpm.c
> > @@ -1377,7 +1377,7 @@ static int fetch_dts_temp(xc_interface *xch, uint32_t cpu, bool package, int *te
> >      {
> >      case 0:
> >          /* This CPU isn't online or can't query this MSR */
> > -        errno = ENODATA;
> > +        errno = ENODEV;
> >          return -1;
> 
> "No such device", however, isn't quite what we want to convey here. If no
> better error code can be found that's available on FreeBSD and Linux, I'm
> inclined to suggest that we stick to ENODATA where available.

Seems like a lot of complexity, for very limited usefulness.  The only
usage of errno is to be printed in the error message, and for the
purposes of this function ENODEV is already unique in the function, as
ENODATA was.

FWIW, I think ENODEV is not that far fetched: the CPU being offline
or the MSR not being present seems like what you would convey by using
ENODEV.

Thanks, Roger.

