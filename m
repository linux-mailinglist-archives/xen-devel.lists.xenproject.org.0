Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCgMNCiQBGoVLgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:52:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 449155357CA
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:52:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308152.1579687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNAw0-0003cP-Na; Wed, 13 May 2026 14:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308152.1579687; Wed, 13 May 2026 14:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNAw0-0003a7-Kc; Wed, 13 May 2026 14:51:40 +0000
Received: by outflank-mailman (input) for mailman id 1308152;
 Wed, 13 May 2026 14:51:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wNAvz-0003a1-Ar
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 14:51:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNAvy-00DYPq-NI
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 16:51:38 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a048fe7-bab6-0a2a0a5309dd-0a2a4507ba7c-42
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:51:38 +0200
Received: from [52.101.57.43]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a048ff9-229c-0a2a45070019-3465392bfa02-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:51:38 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MW4PR03MB6396.namprd03.prod.outlook.com (2603:10b6:303:123::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 14:51:35 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 14:51:34 +0000
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
 b=wZjWxCQUxkBMZorLwJZzw/oEGqnZFrQ9FgxFoylVOD+8SMOMMFO1mNHFFB/QihSqn9stU878KD8aeKyRG0OGT3OILwy4FUkwepVGVwpsntTk/3WmGrzEkcefv2T8tx8Ftnx/Sv/XwtFl87Zsa7ZAVu3AONb/z0NAQRfakNKVGAB4GKHmju9SRvADtKr/pYyPEetCkXX165ZbTapQPbW9TB3abt8Ocf0+pL0FxwxmlX7/Ri3FoWcy7u65WlkzuroeQFhnoKrz1tOc8I0DmDVTPq0O6pOWBT+BKtqSMSfNSiQEtMvjPYjPHy+0KycxfXp/mQFHNJRBdoMhLBrx/BOOVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1PnMIYYDrjMoksVc8qk88Z6j3Av6oz9ZuhJER4OfKts=;
 b=xbTkgq1rI4ie2budUJf7DOfyyFE//E28LA8JZPpmJTp6PamD8rEh+zECOVR8n6J2J86pUjHJYTeoPqjktenZIBcAgVWr5S4a+fNI3TeiZDe9rhUuZiRKHoT5p7HiiB1q7awDVgQxoyp8EDqmhQiykMBzGnFjGCQw4PNbkJ+f4rEfd19FFZj/pBZeFPbyxVuQGxVh0ut/hYMgpr/wNPx2wwN0Eh8CAUuRuhJrtumJcxmt+JUWTShwGk/shqNOQ260QSzmuMkYOQEIfWljoE60CLSkdoCc9yextsouO1G4MT3WrSYa0sQyoXQZuTZY1odWrfij6dI5t/2cMsoXlayEww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1PnMIYYDrjMoksVc8qk88Z6j3Av6oz9ZuhJER4OfKts=;
 b=T9ElPHPp1vlM9owKplxY4DKQSrizGE37pjNdWuFCPC8g4ZtLyT/Yvy1+SwY2mOJ1cprkvNb4XANXSbUzFdOp2pw4GFfxHMo0eQ8p9rTdV/fu6xhyVq6B9/xJBsKr5Q7OBCSteA0Gr9DXYLhiflDZbGyJSawJEm8MARxfTc5OStQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 13 May 2026 16:51:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22 1/5] x86/time: use RTC century byte when
 available
Message-ID: <agSP8jYIylnPfl_H@macbook.local>
References: <b36b6f2f-2b0e-462d-9846-4a1b4d7edef9@suse.com>
 <2723456f-5d8c-4a2a-9876-e65d35579936@suse.com>
 <agQ7B0JQqisZ55jp@macbook.local>
 <35e23e0f-5439-4516-906c-4310cd05a4a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35e23e0f-5439-4516-906c-4310cd05a4a9@suse.com>
X-ClientProxiedBy: MR1P264CA0024.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::11) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MW4PR03MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f7ebbcc-7301-47c2-f570-08deb0ff20c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	glCIbEN6QvXWWu0F4hC+CZ9J+LIUFBQy0yPuC6R9Z4wEVZC9KIedRhn517shoLP7DIveSjZmbdy6/w2+DEndKhJCaht8jNFOK8mjkn8MFMprnzsGSyXTVmTLQSBb8J7A5J2wAFEEyo/3lkhXlo6VWeu0o2YI7/c0Wp4y7UrTPQjhl2lBybWj7LfEfNvFoCf6ae5m6L16uMcxD6vPxxJ7Lyp1OGR8dKW5mRy5u/7KzTIoaSHabB/G3R2NtAczyaGZivjDl1b7FYDxfj8uRuI1R+ohJ6JhAt8RgUnBrtf8B6DWJeVJlG1n3VNtHqjd1MmmEgGl6JKl6NTkIgh1GzQy3KywCcVM66+ZSmxTJqiKSLHjbvf09E/v6KSCz8AJqcxqfojybwimXeUhm4Eg24WWVb5VYugLlrD3yZx2i/7dArNh+mcgTEmFP9rOmoh+nTqGAaPjcjPHrgvujZZJ8io6GGAxIUjjlKKevHtpC3YpWX2XrDMkANScSvtUCqiXPsCD/m6dugRA41NpC11d7vzg5fNkn83FNrZYazqZ2KV8sY97P89tlkQobM3mVLmOftgT9aNzDoPtRXIaOPPsRscHDkYqM+2vvUrT5CRD26mqW9IEQT0N9nksDkAV1LXnDfJKhAaskjJSqthHkO9crOgBugUmgh2mwYw5qSsPWo5mwx7PnirAkqoxK+dtI1Nb5tg8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(11063799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STgxYzdRK2FRUEVXY1R6UG1EV0pTcFllcEc3N2FkNTZFR0hDWmQvVDQ2aWl6?=
 =?utf-8?B?VE8ybjA2Sm9nZXpjTFZxT1RmVUNheXRrVFBya2ttWGM2WmhXN1dlRTIyWkRp?=
 =?utf-8?B?S3RmS2VUZzE1ZEJiS0pGdHVxdEw3Ukp5N0g4M2phNmN3TWttcjNZcmpOcEJY?=
 =?utf-8?B?b1phK29JOGpiTVFXVExKbytFd0s4Yk5NK1B1MXVhTFBWMWVrZG9vMUxEVGhH?=
 =?utf-8?B?cnNFVGp4Mm5zaXphY2lKQnNHTWlnb0liREZMQnNHcTJIcE1kS0lBMEw5dDl3?=
 =?utf-8?B?N0NUVHFsT1o1VGdmWDVLQkQwUm9PdWd2MFBkZUtiNGlsN0NXeHNGeHUva0dy?=
 =?utf-8?B?RzNZUEp5TEhhanFseUxNVDQ0L1ZhZjRkSVhTNzNxNGY0ZDhLYVlJOERZUjRn?=
 =?utf-8?B?aGdGM1FBVm0zaUNDbVB5ckp1NTh5MG44Sm1aM0Z5VXRJTTRoVlpJVWo5Z3Z0?=
 =?utf-8?B?N1ZGRmdFRWlJdDRkNTl1RlA2SHVSeWVadDdPTGpaeExGWk05bWc3czVzaE5q?=
 =?utf-8?B?R0dRYzZVdHJtUjM0a1ZWaUxBdWVFVWIzazE0dUppR0FVY0wwM0tHWC83eFZi?=
 =?utf-8?B?OHhvanNOZyt6a25wQUZTSXhiL1JvS0JLaVVORHdZd0RXakFWc2RUNU5ZNm5B?=
 =?utf-8?B?SGNOVlFrWFpyeFpDbHlCVy9COGMrRS9LT1U4cDJIWXFRZ0FOM3ZUUkxzcklL?=
 =?utf-8?B?NnZLLzgyNHpsbkxKdFVmZEVoMm9YSVZXUHBoMzBLQStheGVqZlJtZ0E5UVl0?=
 =?utf-8?B?R0FrTEdqQlVRQkFxWnlCTWNvdjJnb2Vobis3cFMvVlAzVW9DcmJqdGVvM2ls?=
 =?utf-8?B?THE5VWFuaEZmUFBGZ2JQUkV3WVk1Mzc4aE5BNkdlZ3VqUTF1MVgvemN5N0Zv?=
 =?utf-8?B?OFNaWmNKVUZuNzFrZUJ5V1lQNUVIMzhSZ1ppRDlJZVdqK3hYQXdMY1c4NWxE?=
 =?utf-8?B?L2hNWVZWZzNSSXZKYTUyanFFQlRBdXphWWpOK2FFMFlRSzhLT2t0dFVlLzBK?=
 =?utf-8?B?anJRUTBGUHVkb0ZqbERNOWF4a0dtcTNISENXS1JDbDJQU2NCaUxkWGx2enFT?=
 =?utf-8?B?VmZQRzRqSEJrZ2JpWFk1U3pjUGRTakRqazllSUpXeEkzS0Q5UFlaYUZBeWF1?=
 =?utf-8?B?YlVGY1k1ZTExVFM4MXJrbFVlaDVaSUhudlhETlRzL3BYQzNzck84WGJUZEVD?=
 =?utf-8?B?TnNubURYN3VEMHM3U3lqL09hRWJTbEt1b1hYTHNTZUZJa3dmRVZOdGFkanMr?=
 =?utf-8?B?SmtPTFlpODh4Y2M5U1hTamlPZGxBZmc4LzdJa0xGZ1FHUDhBOFh5a2ZLZ2RZ?=
 =?utf-8?B?cloyRlNwbWR6aUJyN0tDNWdON0hEaG9RcFFhR1prTEp5K1RHRkxldm1za1lX?=
 =?utf-8?B?SldzZGRoYlRMMWZ3ZWVzbEhvTHF0NUk5WXlGZGxCemw1THRDcG15MjBOcWtM?=
 =?utf-8?B?VTd0TFFzelRTRS8vZUZjZ0kzcys0OGRHTS82VDZHM1FXVHc1TFcxMWpRM0ts?=
 =?utf-8?B?V252UCtXb0JqNzVNTURDRGJBZFdCVWtwWVV2REh5a2h0TlI4RHhaanQ1dXNK?=
 =?utf-8?B?MDVDcFhoWTlrNnQwWFFCTEtxYzk0eEE3dFJIVmU0V3lpSXJtQVdNM0E1b2RV?=
 =?utf-8?B?VmNidUMreGk1OWx5K3RheHBmelVnaGljRnM3dlhsVHphTHFoK3lzTklwYlBV?=
 =?utf-8?B?SWxtZGl2cmlGME5Qc0NSWXRUVTJLN1dPYmpySU5mek5ianJpckpBTHZFeDJO?=
 =?utf-8?B?T3R4N0VLV253V0QwV1dTN3hpWTV5ZlFQZ1NDRDlRVzRZeWpuYk52MU5HdExr?=
 =?utf-8?B?eldXUmtoQkV3VGFrbGFlNnhTQ24zUXZZU0V0WDEwekRMcHJGWE4zaGYwNWVV?=
 =?utf-8?B?bGFzd05VRDYrYnBBelhSTmpiWVJZWCtKZ3JzMXdrTCtmbzRqNVNzWHdJMU5w?=
 =?utf-8?B?RGhFd2lMcjlKVjBhaEp6b1Vac0tzbTdUeWR5TENPK01mcEh3WmZDRWlrTTN5?=
 =?utf-8?B?NGFOSzBoeDZjK2JrZzRGSVFqSGRYc3ZMR0hzWnlsdTJHS1ZHcmZxQzdpK1BF?=
 =?utf-8?B?RFNRR2ZYR0lrNjRMMHM4MHJTOU9DdTVCemViU1BhTE9pZlVJd3hrMW1NaXR3?=
 =?utf-8?B?NWpta0MwdU9HSmFyL2J4cnJMZEw0VHpUYVhUSnB3VFJaNFIzMkNUYW5DRnJW?=
 =?utf-8?B?MDE2UHBBUjlvMXU1UkMvZzZ5cktHOVRIYmxBVzcrbGc3MUFRYWZrN3crQ2p6?=
 =?utf-8?B?cGltdkpCc3lhUE1QUVFYbTdjWVpyZ2xVQmw4SGJHOFVWSU5HSldjUmovb3Nv?=
 =?utf-8?B?WVJrK2Myc0pHRjVld2M2dVcyK0ljQ05wSHJpV2hvQkFsdVlEVnowZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f7ebbcc-7301-47c2-f570-08deb0ff20c9
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 14:51:34.8845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LtozMxyJRuKLZXv29UimkdrCi4I9yIB76gUCQY2LadHRVvdjvzrQuEi49qRaklrDZ4bEHL26WFhleQr9yU9AkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6396
X-purgate-ID: tlsNG-ef75cf/1778683898-2176AC48-FB780C5D/0/0
X-purgate-type: clean
X-purgate-size: 1399
X-Rspamd-Queue-Id: 449155357CA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 12:36:26PM +0200, Jan Beulich wrote:
> On 13.05.2026 10:49, Roger Pau Monné wrote:
> > On Tue, May 12, 2026 at 04:58:43PM +0200, Jan Beulich wrote:
> >> @@ -1280,6 +1281,8 @@ static bool __get_cmos_time(struct rtc_t
> >>      rtc->day  = CMOS_READ(RTC_DAY_OF_MONTH);
> >>      rtc->mon  = CMOS_READ(RTC_MONTH);
> >>      rtc->year = CMOS_READ(RTC_YEAR);
> >> +    if ( acpi_gbl_FADT.century && acpi_gbl_FADT.century < 0x80 )
> >> +        century = CMOS_READ(acpi_gbl_FADT.century);
> >>      
> >>      if ( RTC_ALWAYS_BCD || !(CMOS_READ(RTC_CONTROL) & RTC_DM_BINARY) )
> >>      {
> >> @@ -1293,7 +1296,12 @@ static bool __get_cmos_time(struct rtc_t
> >>  
> >>      spin_unlock_irqrestore(&rtc_lock, flags);
> >>  
> >> -    if ( (rtc->year += 1900) < 1970 )
> >> +    if ( century )
> >> +    {
> >> +        BCD_TO_BIN(century);
> > 
> > Don't you need to move the BCD_TO_BIN() translation with the rest, so
> > it's not done unconditionally?
> 
> No, the century field is always BCD.

Hm, then I guess Linux needs adjusting, as mc146818_set_time() only
converts the century to the BCD format conditionally on the control
register or RTC_ALWAYS_BCD.

I've found several sources only that as you mention also claim the
century value is unconditionally in BCD format.

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

