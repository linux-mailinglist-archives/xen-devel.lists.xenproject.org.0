Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kFI4HpXtImpefQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 17:39:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B88E364960B
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 17:39:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=DyQETBmj;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1329700.1593712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVWd3-0006ap-RX; Fri, 05 Jun 2026 15:38:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329700.1593712; Fri, 05 Jun 2026 15:38:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVWd3-0006Yf-OG; Fri, 05 Jun 2026 15:38:37 +0000
Received: by outflank-mailman (input) for mailman id 1329700;
 Fri, 05 Jun 2026 15:38:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wVWd1-0006YZ-U3
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 15:38:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVWd1-00Eof1-06
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 17:38:35 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a22ed70-e002-0a2a0a5209dd-0a2a450cbed8-26
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 17:38:34 +0200
Received: from [52.101.62.10]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a22ed79-62f1-0a2a450c0019-34653e0a2d09-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 17:38:34 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MW5PR03MB6959.namprd03.prod.outlook.com (2603:10b6:303:1aa::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 15:38:31 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 15:38:30 +0000
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
 b=gWbOKgVHwDGDXZtkpv2SGglJgeB/e1riRi+48ZzbbsKsmjC2EFIN9wRD34gleh+GdJEsqD1gGtstC/2d47Xl/Ms3MCgryCpy2RwLf4Iv8y/jOEgIwXl5Ex7jMnYkJNgJ0WtulFGpI40icAwjWpENDKCkddibPJpsh7+PMQ3AHLJ0LGweZ5Wv2yj3gh4lKr0IprMaxjfWWircRYiPv+eMRKPr14xzSuwo9BTy+N/tNzE5xelqOEKwpX+dTSJhcXlc4iJ/HLzcuHuzt6w++6ChJFU5dAF+2U1FzL03kyjUB2U5CItGaZAPY6J6CqOmpsEyU19c5DHUasWQJGjIYLTvbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PGVV9U+zysbOTQjOgeQumWu5m47aboUeJSvnOGH1P0=;
 b=b23vAvLUVCqHqrwLX0LFghnzA3sShD9q+St66c0mFoWTXtUY6p6CHbpWO+kKXslqANjzj+glXn2XbXBvxNwtdCxlkSYq4gtqsXoJe9B77cJHjrlTfIJqiaJz/GYoXik0FSJNWMzhb5lof5LrOkWN9iaIntyC0k7fEa1XdLeEsZHmHQthGkRl1SP8VqTFGfkM6C2l7qOcYzZqQkJDk+FZ1jj4PYRjrWAIX4Q24/sd8mo9JYUBTQvlmFcvxxQpQurBSKNMpSfZAO0T4lqLk4JkXBuT22ITiOwuSl6niVtBY+Nu+WR1a6bTcRbEi0/fIOG8Et9W2x7g8Lk7m4YDJD3AXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PGVV9U+zysbOTQjOgeQumWu5m47aboUeJSvnOGH1P0=;
 b=DyQETBmjqwGzU6CK4tlZzAWPdeIasASLUKFQcVG0Ygh6K9NSmwWRyHbpqZ5a4ceLoBOviy/TM7g0GG0aEaiXa65v6UrcEIvy1Ki7Upy4vLwfGMITiJpXOEXaj4CUj353I4hDXkgV8+W0XIOQAYojSja/OH1nBZrVIV88+mAvCyA=
Date: Fri, 5 Jun 2026 17:38:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH for-4.22 v2 2/5] tools/macros: adjust ROUNDUP() interface
 to match hypervisor
Message-ID: <aiLtc2YChTAZktRM@macbook.local>
References: <20260603191836.77955-1-roger.pau@citrix.com>
 <20260603191836.77955-3-roger.pau@citrix.com>
 <e102162e-6845-43a5-b615-01d91959883e@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e102162e-6845-43a5-b615-01d91959883e@citrix.com>
X-ClientProxiedBy: MR1P264CA0046.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::28) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MW5PR03MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb7b63f-9a89-489c-a9ca-08dec3187ecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099006|4143699003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	5h1lXoyPp/7muHWkIl9dvg9qeUeaHulQe4YatWZGu41ir7fo7hwcdrVpDR0lYmJ/VR1If6GavDijgSG0gIekvJASc/yE1Rs9wSJK1Lt5uGkTKmjufO6JDM65pXd7J+mC8z07gkchHgFRNEzTC2YyUsca7GeVgE5+5r5fiBil0ITsPiabVayZlr7oi4pM/PKwNhscJcXgbSa+f5TQRgo0fihDIxA3JEIu02mkzqn28f3byhSYKhkVkiV5/hd7B0xtkMpgS8SxbVttO9dxV1YdaV8j+CWvaUPSQvgP1sXNr8c0Kklz0jTtorurQ5LV4O68PoyXPGECWExu3MmxWHjB03AMbibm5wEfkx3att14DjjeoG1wdvXR/uZDCBi8evJ6/MritY6nxjNOALiGbJ7v49J7EZ34CmNAHKw7uMXwZg/S9ACJ0ehKgqlkqQOLB9RkWxsU3nxU/FQapqHaMjgVsx4Uc0VXsbssqcIUyzSs52aaPCxhOlPm42gjUW9i2pNRnEcqP5gYX57OoIaCTBwAxpOUoC1ILbClEo8gNlwqMBRMvQSMhPl2yJDFp1+YSiVO7rErS3C7YvHVa5m7P6JoClnakoXFgxtsobauJ3FpTWdBv2KMlgI6IiOnOeeEC0qIkqi19B6Am4hrxBrBzYL8s0dZfXALPMkp1qkZH/FBKNjM8OpcQAEMSKs4ttSUhJiD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVpxWWZOVUlTWjVraVhJN0FvREd4SzZkdGJ4VzlEMTdHQmdBbmtJKzRxN3NX?=
 =?utf-8?B?TVJadEN5VEVvQzlBVnBzMkF2VEdrOWVlc2tvYkIvNUhxWjVzV3ErZ2tyWW93?=
 =?utf-8?B?b3RYQXlURmpIaVBVWkJuZm1yWnQvR1ljYjJoTG54MWtVRzV2aXBtTzF5OTh0?=
 =?utf-8?B?Um1RUXliMFlKRTFTcUZYWnpnbjhkcTRyS3A0bmlreEUzS0l1WlFnL1lwaFNK?=
 =?utf-8?B?Lzg3VzdvMVpIOHhOc1NTNko1ZktRRHZGNlB1K0owUmQrOE9HbE0xMXI1Zndv?=
 =?utf-8?B?clhsdE5mbkx3YzFjYnA3dHZKSU1qbEhUeEFZQnZaNGVLR05oWlB0UkVBUnFQ?=
 =?utf-8?B?TGdiK2trQWJKSU9hZG5oWmNJbGZNaFJtYk5yTmNsK0VqaW9wSWlxOWRLdXRW?=
 =?utf-8?B?KzlKRS9GcndTTnphMVkwUERINTNsMUttUys5OTVWc3JVMmxic2hGT2cwUndK?=
 =?utf-8?B?OGJSeDFpWnBxME0xSnVFcllzQS9xdEdUZnAwZU8wVjc3aUh6ak5LMmRqMXBP?=
 =?utf-8?B?eUtGN25ZM2RiRFgyRUlOY1lmcEZ5Ym50SlZCSTJLRnd5ZG9QcEs1SW40V3VJ?=
 =?utf-8?B?YmdJS1RVK3B5OGtzU1VNUVU5UHE3WWYxN1g0eHpnODExRllxOVMzdkZFbHRy?=
 =?utf-8?B?bm5XaU5zMDREL2FnRTJDdlZpWVV1QkM1VUtMSFMweDZ6ODhhMzJtTkswSHVW?=
 =?utf-8?B?MWRtY1ZIRHVKalZmR3Nxam5aNVplRzR5eUxYdTlQT1hoSnBtTTNGZnVyQU9y?=
 =?utf-8?B?UCsvNXF1OXovalVWWC9nTUUrZVFwR1dvcTVseHJNSzhlWU4xb2lJUktrUHdo?=
 =?utf-8?B?dVRoUVJPYlR1OXIvdDFVdDJxRmtHODM0OUppMko5dW5lYzdMY3EyRXpJQVYw?=
 =?utf-8?B?T28xR3VSZFJ3THhnZHg0TDhaVFc5QXI0QWVsREQ5VlEzRGlvMk4wK040NDZw?=
 =?utf-8?B?dFFHcGM1Uy9hN2dQMThSMVQ3K0ZmcFpnMTY1L0ttVWRGc0F3b2Y3eDVxdENp?=
 =?utf-8?B?WTVoWDFLdkk5REJMWm9KMEJaWWtETEdOcDBYMUdUQjFITWt6L012R01CSDY4?=
 =?utf-8?B?NnZNYXZhVlp2aDVUQ2Y3aFNsQ1drc0h1U0tYdjRneVZMSEVha0RXMk9ScWU4?=
 =?utf-8?B?QnNEVUpsSlNaYkhRSnc1YTJPRk41enc2Z1czaXlIS2Rna0RSRFN5UU5UQ2Yy?=
 =?utf-8?B?WW90azlXMnV1ZUV6SnB4ajA2QU5UcjY5emo4SWZ0SVNYZzV6N1V2SEYwZ3NS?=
 =?utf-8?B?UHNoNHQ3Z1ZOaURONEs0MEZWdW5ybXQwWnJ5cW9WZjRWY2NpTi9UQlNYSlpo?=
 =?utf-8?B?UzU2US92Ui8wVSt4cExYWitjc0dhK1hld0hXR0R4Q0tRRjJJbkVWZlZqVmg2?=
 =?utf-8?B?dndJV2FLbDJYQzFaTkF2OG5jbGg4V05mWHBlK2ZWVFM5VlZrNGhjUzVIRXpQ?=
 =?utf-8?B?TE05Z3ZBTzFMb0FTWFpMbnk1L2V3U2tuTm9UZEhEQjhxMlZ6RGJXMkRFMi9J?=
 =?utf-8?B?UkdJcFhzQmwyYW1hREp2V2pyV3pxU3ZoWkExNE9ROEwrRUFBUHJ5bHZOdEx5?=
 =?utf-8?B?Zy94R3lIL0tldWpIQlpmeVNySERES2tVUTJsNmExOTBoeW1QZk1CNkNGYzNp?=
 =?utf-8?B?ZGZ6a2cyb3ZqTHBwdWxvc1M2SUZ2Y1BWU1R4S095SHNVcXU2anlLRDc2b0cx?=
 =?utf-8?B?Yk1jYktsSFR6bDdZVmNIL3FDYk1uSmx5SnowYnF0K0FRbWdPcWR4R1IvVU5k?=
 =?utf-8?B?MEtEMVREQ3hxT3RvaUtuc3dyREFTSUpsL2hMNUlXS1d4MGtNd09pa0dYV0Z4?=
 =?utf-8?B?M3c2dmhJaCtPdWhxdjgrL1hTR1RON1NsbWtmVENTMGUxSVpoVnpPcTgvQWhm?=
 =?utf-8?B?bzlZYUtGR0gxT1FNM1FMamFrUkY1cmFHU05SQ0tBcjJIU3Q0TjNuZ3dTOUZo?=
 =?utf-8?B?WWJCUEt3eGlVVHdmbGR2Tk1Kcm1JeVkvc2lSYlhhS2hSSDllTFA2bXpUVXlq?=
 =?utf-8?B?NklCcXFsN0NwQjJNNkErZHE4VCtxRENwcmQ3enFqYWliMDd6citXbUIrN0Ew?=
 =?utf-8?B?KzFGZzYwS0dUVXhuRnN6U25VQVM0SzgraFV5L3BLQXBNY3RUdGk3eHpWT0VX?=
 =?utf-8?B?SEYyaTVrNkhDMXVwTFFRRnVzcDExUzZseStjczErQVpQeHNOemgveVd1dWNn?=
 =?utf-8?B?bXZhUzZMdGtScENRbG9zSTd3Ly8zbW9ENW1SMk15V2lOdi9mVUJnYmhWdGwx?=
 =?utf-8?B?YUlRbS9WaW9TeWVyV01FUzFQSFJyWTlnTVpGR2w0NlpuOGdVYzVldEhDVUZw?=
 =?utf-8?B?bTJMUGtvaUhZTUhzTjB3SXd1TlkxMGw1c0liL1AyZ2VSR0FCMXp1QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb7b63f-9a89-489c-a9ca-08dec3187ecc
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 15:38:30.8226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3t09u44N7Eo9bulLTGvEWtEQkm9W3gONTx9oX8x0PrpDhlNIFcWARIvp1KMvwW6a2FyCLcp8djwg5T7FJasYOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6959
X-purgate-ID: tlsNG-d25034/1780673914-E176ECF5-05DC42A2/0/0
X-purgate-type: clean
X-purgate-size: 10271
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:julien@xen.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:from_mime,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B88E364960B

On Fri, Jun 05, 2026 at 04:24:27PM +0100, Andrew Cooper wrote:
> On 03/06/2026 8:18 pm, Roger Pau Monne wrote:
> > Adjust user-space callers to use the new interface.  No functional change
> > intended.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
> 
> Yeah, libxl's choice to use order was always bizarre...  I'm glad we're
> getting rid of this.
> 
> > diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
> > index 268936efe25b..9af83535944a 100644
> > --- a/tools/libs/guest/xg_dom_x86.c
> > +++ b/tools/libs/guest/xg_dom_x86.c
> > @@ -678,7 +678,7 @@ static int alloc_magic_pages_hvm(struct xc_dom_image *dom)
> >      {
> >          if ( dom->cmdline )
> >          {
> > -            dom->cmdline_size = ROUNDUP(strlen(dom->cmdline) + 1, 3);
> > +            dom->cmdline_size = ROUNDUP(strlen(dom->cmdline) + 1, 1U << 3);
> >              start_info_size += dom->cmdline_size;
> >          }
> >      }
> 
> I think this would be better as a literal 8.
> 
> > diff --git a/tools/libs/guest/xg_sr_common.c b/tools/libs/guest/xg_sr_common.c
> > index 7ccdc3b1f6aa..54dde924a7c0 100644
> > --- a/tools/libs/guest/xg_sr_common.c
> > +++ b/tools/libs/guest/xg_sr_common.c
> > @@ -56,11 +56,11 @@ const char *rec_type_to_str(uint32_t type)
> >  int write_split_record(struct xc_sr_context *ctx, struct xc_sr_record *rec,
> >                         void *buf, size_t sz)
> >  {
> > -    static const char zeroes[(1u << REC_ALIGN_ORDER) - 1] = { 0 };
> > +    static const char zeroes[REC_ALIGN - 1] = { 0 };
> 
> = {} as you're editing the line.
> 
> I have no idea why this is 7 in libxg, but 8 in libxl, but dropping the
> -1 here is probably wise.

I've noticed this oddity, but was cautious with doing any change
there, given the code freeze status.  I can do the adjustment.

> > diff --git a/tools/libs/guest/xg_sr_stream_format.h b/tools/libs/guest/xg_sr_stream_format.h
> > index 8a0da26f7543..4310f4311e65 100644
> > --- a/tools/libs/guest/xg_sr_stream_format.h
> > +++ b/tools/libs/guest/xg_sr_stream_format.h
> > @@ -53,7 +53,7 @@ struct xc_sr_rhdr
> >  };
> >  
> >  /* All records must be aligned up to an 8 octet boundary */
> > -#define REC_ALIGN_ORDER               (3U)
> > +#define REC_ALIGN                     (1U << 3)
> 
> This really does want to be 8 rather than a shift.
> 
> >  /* Somewhat arbitrary - 128MB */
> >  #define REC_LENGTH_MAX                (128U << 20)
> >  
> > diff --git a/tools/libs/light/libxl_arm_acpi.c b/tools/libs/light/libxl_arm_acpi.c
> > index ba874c3d3224..ac8165de15b6 100644
> > --- a/tools/libs/light/libxl_arm_acpi.c
> > +++ b/tools/libs/light/libxl_arm_acpi.c
> > @@ -107,12 +107,12 @@ int libxl__get_acpi_size(libxl__gc *gc,
> >      if (rc < 0)
> >          goto out;
> >  
> > -    *out = ROUNDUP(size, 3) +
> > -           ROUNDUP(sizeof(struct acpi_table_rsdp), 3) +
> > -           ROUNDUP(sizeof(struct acpi_table_xsdt), 3) +
> > -           ROUNDUP(sizeof(struct acpi_table_gtdt), 3) +
> > -           ROUNDUP(sizeof(struct acpi_table_fadt), 3) +
> > -           ROUNDUP(sizeof(dsdt_anycpu_arm_len), 3);
> > +    *out = ROUNDUP(size, 1U << 3) +
> > +           ROUNDUP(sizeof(struct acpi_table_rsdp), 1U << 3) +
> > +           ROUNDUP(sizeof(struct acpi_table_xsdt), 1U << 3) +
> > +           ROUNDUP(sizeof(struct acpi_table_gtdt), 1U << 3) +
> > +           ROUNDUP(sizeof(struct acpi_table_fadt), 1U << 3) +
> > +           ROUNDUP(sizeof(dsdt_anycpu_arm_len), 1U << 3);
> >  
> >  out:
> >      return rc;
> > @@ -128,7 +128,7 @@ static int libxl__allocate_acpi_tables(libxl__gc *gc,
> >  
> >      acpitables[RSDP].addr = GUEST_ACPI_BASE;
> >      acpitables[RSDP].size = sizeof(struct acpi_table_rsdp);
> > -    dom->acpi_modules[0].length += ROUNDUP(acpitables[RSDP].size, 3);
> > +    dom->acpi_modules[0].length += ROUNDUP(acpitables[RSDP].size, 1U << 3);
> >  
> >      acpitables[XSDT].addr = GUEST_ACPI_BASE + dom->acpi_modules[0].length;
> >      /*
> > @@ -137,11 +137,11 @@ static int libxl__allocate_acpi_tables(libxl__gc *gc,
> >       */
> >      acpitables[XSDT].size = sizeof(struct acpi_table_xsdt) +
> >                              sizeof(uint64_t) * 2;
> > -    dom->acpi_modules[0].length += ROUNDUP(acpitables[XSDT].size, 3);
> > +    dom->acpi_modules[0].length += ROUNDUP(acpitables[XSDT].size, 1U << 3);
> >  
> >      acpitables[GTDT].addr = GUEST_ACPI_BASE + dom->acpi_modules[0].length;
> >      acpitables[GTDT].size = sizeof(struct acpi_table_gtdt);
> > -    dom->acpi_modules[0].length += ROUNDUP(acpitables[GTDT].size, 3);
> > +    dom->acpi_modules[0].length += ROUNDUP(acpitables[GTDT].size, 1U << 3);
> >  
> >      acpitables[MADT].addr = GUEST_ACPI_BASE + dom->acpi_modules[0].length;
> >  
> > @@ -150,15 +150,15 @@ static int libxl__allocate_acpi_tables(libxl__gc *gc,
> >          goto out;
> >  
> >      acpitables[MADT].size = size;
> > -    dom->acpi_modules[0].length += ROUNDUP(acpitables[MADT].size, 3);
> > +    dom->acpi_modules[0].length += ROUNDUP(acpitables[MADT].size, 1U << 3);
> >  
> >      acpitables[FADT].addr = GUEST_ACPI_BASE + dom->acpi_modules[0].length;
> >      acpitables[FADT].size = sizeof(struct acpi_table_fadt);
> > -    dom->acpi_modules[0].length += ROUNDUP(acpitables[FADT].size, 3);
> > +    dom->acpi_modules[0].length += ROUNDUP(acpitables[FADT].size, 1U << 3);
> >  
> >      acpitables[DSDT].addr = GUEST_ACPI_BASE + dom->acpi_modules[0].length;
> >      acpitables[DSDT].size = dsdt_anycpu_arm_len;
> > -    dom->acpi_modules[0].length += ROUNDUP(acpitables[DSDT].size, 3);
> > +    dom->acpi_modules[0].length += ROUNDUP(acpitables[DSDT].size, 1U << 3);
> 
> And all of these.
> 
> > diff --git a/tools/libs/light/libxl_sr_stream_format.h b/tools/libs/light/libxl_sr_stream_format.h
> > index f8f4723c2e91..b02c954a388e 100644
> > --- a/tools/libs/light/libxl_sr_stream_format.h
> > +++ b/tools/libs/light/libxl_sr_stream_format.h
> > @@ -29,7 +29,7 @@ typedef struct libxl__sr_rec_hdr
> >  } libxl__sr_rec_hdr;
> >  
> >  /* All records must be aligned up to an 8 octet boundary */
> > -#define REC_ALIGN_ORDER              3U
> > +#define REC_ALIGN                    (1U << 3)
> >  
> >  #define REC_TYPE_END                    0x00000000U
> >  #define REC_TYPE_LIBXC_CONTEXT          0x00000001U
> > diff --git a/tools/libs/light/libxl_stream_write.c b/tools/libs/light/libxl_stream_write.c
> > index 98d44597a732..9ea64369352f 100644
> > --- a/tools/libs/light/libxl_stream_write.c
> > +++ b/tools/libs/light/libxl_stream_write.c
> > @@ -119,7 +119,7 @@ static void setup_generic_write(libxl__egc *egc,
> >                                  void *body,
> >                                  sws_record_done_cb cb)
> >  {
> > -    static const uint8_t zero_padding[1U << REC_ALIGN_ORDER] = { 0 };
> > +    static const uint8_t zero_padding[REC_ALIGN] = { 0 };
> 
> These want the same adjustments as the libxg side.
> 
> > diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
> > index d6d462b7bc82..86c86b3e9a77 100644
> > --- a/tools/xenstored/core.c
> > +++ b/tools/xenstored/core.c
> > @@ -3067,7 +3067,7 @@ static int dump_state_node(const void *ctx, struct connection *conn,
> >  	head.length += node->hdr.num_perms * sizeof(*sn.perms);
> >  	head.length += pathlen;
> >  	head.length += node->hdr.datalen;
> > -	head.length = ROUNDUP(head.length, 3);
> > +	head.length = ROUNDUP(head.length, 1U << 3);
> >  
> >  	if (fwrite(&head, sizeof(head), 1, fp) != 1)
> >  		return dump_state_node_err(data, "Dump node head error");
> > diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
> > index 2db452144dd4..a880ff678ef9 100644
> > --- a/tools/xenstored/domain.c
> > +++ b/tools/xenstored/domain.c
> > @@ -2159,7 +2159,7 @@ const char *dump_state_connections(FILE *fp)
> >  		if (ret)
> >  			return ret;
> >  		head.length += sc.data_in_len + sc.data_out_len;
> > -		head.length = ROUNDUP(head.length, 3);
> > +		head.length = ROUNDUP(head.length, 1U << 3);
> >  		if (c->domain) {
> >  			sc.fields |= XS_STATE_CONN_FIELDS_UNIQ_ID;
> >  			head.length += sizeof(uint64_t);
> > @@ -2232,7 +2232,8 @@ void read_state_connection(const void *ctx, const void *state)
> >  		unsigned long off;
> >  
> >  		off = sizeof(*sc) + sc->data_in_len + sc->data_out_len;
> > -		domain->unique_id = *(uint64_t *)(state + ROUNDUP(off, 3));
> > +		domain->unique_id =
> > +		    *(uint64_t *)(state + ROUNDUP(off, 1U << 3));
> >  	}
> >  }
> >  
> > @@ -2308,7 +2309,7 @@ static int dump_state_domain(const void *k, void *v, void *arg)
> >  	n_quota = get_quota_size(domain->acc, &rec_len);
> >  	rec_len += n_quota * sizeof(sd->quota_val[0]);
> >  	rec_len += sizeof(*sd);
> > -	rec_len = ROUNDUP(rec_len, 3);
> > +	rec_len = ROUNDUP(rec_len, 1U << 3);
> >  
> >  	record = talloc_size(NULL, rec_len + sizeof(*head));
> >  	if (!record)
> > @@ -2372,7 +2373,7 @@ const char *dump_state_glb_quota(FILE *fp)
> >  	n_quota = get_quota_size(quotas, &rec_len);
> >  	rec_len += n_quota * sizeof(glb->quota_val[0]);
> >  	rec_len += sizeof(*glb);
> > -	rec_len = ROUNDUP(rec_len, 3);
> > +	rec_len = ROUNDUP(rec_len, 1U << 3);
> >  
> >  	record = talloc_size(NULL, rec_len + sizeof(*head));
> >  	if (!record)
> > diff --git a/tools/xenstored/watch.c b/tools/xenstored/watch.c
> > index a9a06e9e4816..309c5bb66bef 100644
> > --- a/tools/xenstored/watch.c
> > +++ b/tools/xenstored/watch.c
> > @@ -349,7 +349,7 @@ const char *dump_state_watches(FILE *fp, struct connection *conn,
> >  		}
> >  
> >  		head.length += path_len + token_len;
> > -		head.length = ROUNDUP(head.length, 3);
> > +		head.length = ROUNDUP(head.length, 1U << 3);
> >  		if (fwrite(&head, sizeof(head), 1, fp) != 1)
> >  			return "Dump watch state error";
> >  
> 
> And these want to be 8 as well I think.
> 
> Definitely with the migration formation adjustments, and preferably with
> the others too, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks, I've done all the adjustments.

Roger.

