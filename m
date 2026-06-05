Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id twxJByB3ImpvXwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:13:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76120645D30
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:13:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=xyOLsPE5;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1329009.1593220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVOk8-0006B6-0m; Fri, 05 Jun 2026 07:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329009.1593220; Fri, 05 Jun 2026 07:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVOk7-00069i-Tt; Fri, 05 Jun 2026 07:13:23 +0000
Received: by outflank-mailman (input) for mailman id 1329009;
 Fri, 05 Jun 2026 07:13:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wVOk6-00069U-7U
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 07:13:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVOk5-00CqJi-8R
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 09:13:21 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2276f7-2eae-0a2a0a5409dd-0a2a4506cca8-46
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:13:21 +0200
Received: from [52.101.46.48]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a22770f-7371-0a2a45060019-34652e30b9f0-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:13:20 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA0PR03MB5497.namprd03.prod.outlook.com (2603:10b6:806:b5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 07:13:17 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 07:13:17 +0000
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
 b=p6K9JXkftu1+Yp9ZjIedFvwoDe7yShhcVl+EMkQ1ptRV3RVXfakmhltFiGP9EPgvNaATb6y6Hs8b+Licgpc0zI3eyrVCtDjHW9ouSYmwP+B+kkODCFWd7uKGIzhL6BPlC6z9FHQK3FzICQzlfN7F1uunjaajjpDxpSIB47Gg6ByI4hiH/eRKVit15jXU5/d8s+IMfq8my1RrVsYplgRY37eHP2ot/4h7UnAMYmXPBUKJ74NBNCcTKMb5dlYfos5M1QobpqTAGu8Xyvu3Qn2u4M1LyCXYSmW+VgnBR7RcpSEsyx9F3hjAmIjJJzuSTiyOEhr7TYfxU2LSov13SNbKBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWUxhTPz3dkRlP+8PB5PHjU80RAgWr4k7/yeKPtup3s=;
 b=oOCANq40JswT3b4xXz0oDrVhK+nCjfz5YemAsDyY8doZdI3HYi9DsOCmc5ag1VX4N42asUfZpbhPNmkRQoXaUhPLAVrFObCLG3atG+evbrFtIBquBlBC1OKByHWfvKgCa/GIN3VDGAIbcU04VsSS+/3nRJCKXduz5TpxmAawYNt/eYNA9xNpMtR32X2yNRYm1zi1u84TXTWnuBw/0GOQK1OyXo4y3ZZBCp0lfvBkqBBdz55HWMEtF/8khRXcxB3XofOO0XzjbpvPiIkASO9Ezd3/mx8VG3VkpGMBEclWZyhvEd9mko29YX1N1A+3DyyLoVILypkg9J175HpNq2PdTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWUxhTPz3dkRlP+8PB5PHjU80RAgWr4k7/yeKPtup3s=;
 b=xyOLsPE5IPT7lxK6ExlGEZmdP/zipMXlueWLjiMY6BuAEGabeei1AEB0jOM9W3GkWzZQ4evjCe6fD2Wtr8Pp0oN9TW+Zm6s3Z2B5hGVxI7HlZX1UkRS4rs9obSJwjD9q9I59QIDzhj4d3SqYsNU2ugHhTGNf8061DdH0PutJDoc=
Date: Fri, 5 Jun 2026 09:13:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH for-4.22 v2 2/2] x86/mcfg: relax memory map checks on
 newer firmware
Message-ID: <aiJ3CRdO0y2cGZu3@macbook.local>
References: <20260604132523.95125-1-roger.pau@citrix.com>
 <20260604132523.95125-3-roger.pau@citrix.com>
 <0bfa979f-f69c-44ce-8a29-4c92876c7fca@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0bfa979f-f69c-44ce-8a29-4c92876c7fca@gmail.com>
X-ClientProxiedBy: MR1P264CA0147.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA0PR03MB5497:EE_
X-MS-Office365-Filtering-Correlation-Id: 245e36e6-6f99-4caa-09dd-08dec2d1ea68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|6133799003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	vm20yJfpR8BuVnf/Oi/9GyGs3NtsUJPlLyiLxRnrnat4g/OukE5qTdf3AbTUI6ENRwMtrwp1Ql531Y1Y2udLNfD5NzsjLuDpbEXr94VrFZef2Zx+nwti/36sX3USFbiXyQjqeHBsQ1FwD+JOwVsKPnjWvc+2qDAPM5oxnYnH3w0RUOYwpDGZNnV+1QVEZ+CowlAoIWVseM04rArQCAQYZKSs+MOXdjaFYF8wqGZZ3TpSFMX2gt5/b6z5OE9IjxrvHC6znX76l1pBh42328pXYDyXK7jwLjmKWQYyGPKoc1UVoDgAPvV7RwQO7brO2biAJCll2ARF9RNdTvfPnNvAq4diQn0LIsQETqtcBCmsJuCoCMKeXxNLVFGkHKKblRo8Qf3Rk3p3h8T2TU3SXUUZzjWge0jtbUAmIcSCEGwsC/XWa9RHAeqeqIXQ9G2O3LiSISIQ+cNlkHGvU7+RbdeLucpcSeO/VOXTzecoh+NZ88Y1vM6C04GzLFYB/FVr+QAENbgbDt5cv4mlX1ANCvrs4yQVHWYeUKp/SNze2128o8CGpDTrxRADv3efSO/YVq6x0PlOtC+jwKbyRe+FlbaQhgqT3GlcbS4mJ8plcBBQXLGKKJKoWi17Z2GMxuLGiaG9V5wPXgg5yhcPOy7g3vbOqbTxpv5qLx10M8hcfO0pojOJejkI4SIgbZSv2zEKyTCg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(6133799003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1c3S3RDYkw3K2VlTExaRG5wK3JPVXE5VFBmV25YbEx3bGIzK3FYc2JaQU5v?=
 =?utf-8?B?czNTME5RTUF2VDZwdXVUa3o0VkFBR0t2by80Y2wwc1dsRXhNUTYrU01iUzdX?=
 =?utf-8?B?S2NDNFdxRWlYRnozdnYydjJSUzN0cVBRRmEzd0ZKVGFBYjAwODcxejFYZzdj?=
 =?utf-8?B?cjV6d243OFVYK2RCVHNaa3g3MnE1Y1d1ekNFOTIwNDRhTGF6UGZtZHBMbE9Y?=
 =?utf-8?B?di9Walg0cm9EWXZnakE0TUFaTXBlcWYrQVAySXN1YkZGTHVCblU0MEdwZkEz?=
 =?utf-8?B?bnBQVmdqenhQV0pvZGViZEJqODlGOGg3RXgzT1A4aUFqSmUxMzdwNEloVmpL?=
 =?utf-8?B?c0JCa0hibFRZcDZIOEJQVGtXVzZmWFR0aGJibEhwOTR5SHdxYkNhWGx4RnBp?=
 =?utf-8?B?TFhHd0RZaVhyM0U1WDhMUllvaE9Fak1KK1BEb2VBbVg3b1lVcHNxT1I5U3Ex?=
 =?utf-8?B?dGw2enBHOHNwMHBGSWc3clBtYTRHdVFZM0tZcnF6eGwzNkpHQThpUkVKMDYr?=
 =?utf-8?B?NWlyMEZISUgrQmFhUEJ6UEplM2hEczJKdDVHRmVpT3B0N24vbktrMDRpZDNz?=
 =?utf-8?B?L0Z2TTRTem5FY21tKzVKSUtNMFVGNEVIREtZV1dmWmpraWJOdmt5RW1GbjZ1?=
 =?utf-8?B?cHZLL1VrTmQ3K3VYS3FsajZEL3R3ZTdFN2xrL0VTK2s3ekN0TDJBaEF1Tmdx?=
 =?utf-8?B?ZkRXSDFwenJSajFJTTZJNFF0c2t2YTkxZTY1K2o1c0lsVXpoSSt1NkxYSmZo?=
 =?utf-8?B?UkI1QTRTaXBvMksxbWkrYTh1WjFwL1lRazkyQkVabEtjUjNkSUtCTlorMHZk?=
 =?utf-8?B?V296bnNyVDNNVlFlRUJCWWNlRnp4cVJLYlU0aHgxZDBsczU2RkYveG5ld1Yr?=
 =?utf-8?B?dlFpM0kxbXVuSEpVU1BQaVdReVZ0SWRYQ2Ezem11cmZ5dnpOYlVzR0ZLMS9k?=
 =?utf-8?B?Mnk2MEtjSzJVZzd3L3RmU1owQkJqb0VtenhxVlRPbkYrUkpNVmRUV2wzTnNR?=
 =?utf-8?B?Vm45QnVWektNQXA2cU15N0Z4bHltVW9CY2RXcENaS1Zic3JwTlNWVUN5ODhS?=
 =?utf-8?B?TXBMWFR2TFhWTGRXNVQyU1YwdDNmWVpRN01nT1IrYVFpaCtJanlYYnYwcXEv?=
 =?utf-8?B?U2NkS1BBcHNjOG9sZVQ5UW1iNkZwUGNpdm8vWDBUTlVaOTRZT2QyR3N6SXpk?=
 =?utf-8?B?S2REanVtTlBhRCt4VXBqdGFneXNWS1R5Wm9nUkNReUpRYmJJQllOVWFxRjdY?=
 =?utf-8?B?dmNwMGJxdklVSVFpdkRaZmcyM0lIa1UyN25YOE0wV3FobFlGdjRjNHpvNHV3?=
 =?utf-8?B?SWhqUHhDRU5HQ1JCeEpXZjk0UFRRZnI3M3JsaVl1ZG9rQlNtYitCSlFCU3Fo?=
 =?utf-8?B?LzB0Vi9WT3FZRWkrdTVDWTlBM00xNDYrVmVDUlozbS90NytYV0xmYW4zc003?=
 =?utf-8?B?VWpKSHdEWlRDY21RWTJKQ0M4azJuU05tNXo2SWxRZTh1WTdiVHhoSnZWVXJo?=
 =?utf-8?B?aGVEamUzR0tiMnZSL0FSVEFzTElpb2cyc1VJMnA2cGVzMmREdUlmclV2MFR0?=
 =?utf-8?B?a0t1cHhSeUFQcmdhK25CUGN0K2VyME53aWZMMUlUcStyZ3QvSEdUNVM5TTR5?=
 =?utf-8?B?b2o2c1FmVlZFbmkrWDJ5NGtmbXpIRVFjdVRxa3U3d3BaSXVWVytsZWJUKzdB?=
 =?utf-8?B?ZWQxWXRBc1Nud25Mdno1VWMrZ1VPM2xaV01mdGFac2NFNXNQZ1hhMXVkR3Fq?=
 =?utf-8?B?S2ZBdW8yQU1aU3NxQUlMU3phTkRROXQ0SWhmanVsbGVTbFlzdVlrVGJVRHB3?=
 =?utf-8?B?bkg1MmpLcUQ4VjNGV1lkSU9rTWNEdHZ5KzNXVjBMVkFRaU0vUmVmMEo3Tndv?=
 =?utf-8?B?VzR6MlBaL0wreWRHL01kdTFVVzRUOHdJNmtYS0Fta21yb3BLZ1M1S3UvSU9L?=
 =?utf-8?B?aXV2UGJFb3pHcjdDL3JzOUZXRVR5OVI4Y2sxWEZYbDJsSWZicUpMbXVLdzJG?=
 =?utf-8?B?eDRCeTcwVzN5UDd6MTZNMFVkb0hwRVZiOXppNGJBeDhUYmIya2Rid3V3RDVI?=
 =?utf-8?B?K2VZOE1vbVNRSnJSU0c0OFZFYjlpeTF4UEp6UFBEKzdYNEh1WkM4U1B1TkxH?=
 =?utf-8?B?M1ZGaWZ2UjlETDhwODRDS2pRVlB2U3BDbjgzTW9ZQjRMRFRoN2hyekNuR0hx?=
 =?utf-8?B?SFFKVFBtOW9OcUJhTzlCS0FTMWNqNTRlU3VnNndEdllIZkZsUVVYTXFEN3Vp?=
 =?utf-8?B?N0VZczJyRDBDamFwaGlwenNYRHZnWVdLczlVUS94OFpOYVo3OU4xR2FLRzJJ?=
 =?utf-8?B?SEE4cVZ6WHRjdSsweDc1dy84Zm1vSWRtQzRocXE1MVg1b0tuTnNBQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 245e36e6-6f99-4caa-09dd-08dec2d1ea68
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 07:13:17.1628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/fvcT5z/QRJ9mn+BsnXqa/+x0yNplgzxHj8ryOLYVG4zN4TDvYn2dfti9JVsCuMGhbL3W0HQaWdmNJMUWs9YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5497
X-purgate-ID: tlsNG-16d1c6/1780643601-8C67DD75-BD2F14FA/10/73395122804
X-purgate-type: spam
X-purgate-size: 2264
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:from_mime,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76120645D30

On Thu, Jun 04, 2026 at 03:50:28PM +0200, Oleksii Kurochko wrote:
> 
> 
> On 6/4/26 3:25 PM, Roger Pau Monne wrote:
> > Per PCI Firmware 3.3 specification, section 4.1.2, ECAM space must be
> > reserved by declaring a motherboard resource, but there's no requirement to
> > mention it in E820.  The specification additionally states that: the
> > resources can optionally be returned in Int15 E820h or EFIGetMemoryMap as
> > reserved memory.
> > 
> > This fixes an issue with detection of extended capabilities when running
> > Xen on a Lenovo system that doesn't list the MCFG area as an
> > EfiMemoryMappedIO region (or as any other type) in the EFI memory map.
> > 
> > The more strict logic was introduced in Linux in 2006 as 946f2ee5c731
> > ("[PATCH] i386/x86-64: Check that MCFG points to an e820 reserved area").
> > This was picked up by Xen when MCFG support was added in 3b35911d709e
> > ("Enable pci mmcfg and ATS for x86_64").  Apply an approach similar to
> > what Linux has done in 199f968f1484 ("x86/pci: Skip early E820 check for
> > ECAM region") and relax the strict reserved region checking so it's only
> > done for firmware manufactured prior to 2016.  For firmware from 2016 and
> > newer allow MCFG region to reside in holes on the memory map.  Note Xen is
> > still more strict than Linux however, as it will refuse to use MCFG regions
> > that overlap with memory map regions different than reserved.
> > 
> > When dom0 boots it can prevent access to misconfigured MCFG regions by
> > using the PHYSDEVOP_pci_mmcfg_reserved hypercall.  This brings Xen's early
> > usage of MCFG (prior to ACPI AML parsing) more in line with the
> > implementation in Linux.
> 
> Don't we want to add Fixes: or Ammends: here?

Hm, when the code was added to Xen the checks were fine, that's why we
keep the existing behavior for firmware < 2016.  The change here is to
cope with new firmware behavior, so I'm not sure we can reference a
commit from 2009 with a fixes tag when the new behavior only applies
to firmware > 2015.

> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Generally it looks low-risk patch so:
>  Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks, Roger.

