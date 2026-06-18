Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VTh2I5WgM2qwEQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 09:39:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D09EA69E212
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 09:39:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="ER0RbVu/";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1340812.1601545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wa7Kg-0007n9-3p; Thu, 18 Jun 2026 07:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340812.1601545; Thu, 18 Jun 2026 07:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wa7Kg-0007lo-16; Thu, 18 Jun 2026 07:38:38 +0000
Received: by outflank-mailman (input) for mailman id 1340812;
 Thu, 18 Jun 2026 07:38:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wa7Ke-0007lS-IM
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 07:38:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wa7Kd-00BpEp-AG
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 09:38:35 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a33a074-e002-0a2a0a5209dd-0a2a4509b646-26
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 09:38:35 +0200
Received: from [52.101.85.18]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a33a079-2497-0a2a45090019-34655512d2d4-3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 09:38:34 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA6PR03MB7973.namprd03.prod.outlook.com (2603:10b6:806:42c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 07:38:31 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 07:38:31 +0000
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
 b=guW0akIJTFNWUeWBkv+rqWUI6NxOS+1AfjCk4P9KJWBT4Uufvg/SRxOBi8s5OqB19PpS/mOIpPnOlDwE8V8NUlDWS2bW1HOcKut+WOAYbhaU7XUfoA/YpDOAGRLn9rP2FdtoZE79MQspo+/Ke3wUpcyLrhYScJsstqgDhmKvvnO4rfl8xVNYIKYBONjfS3Ep7fL0LMxnUtCALgtlLnFbRj6oAzfdhVlFlqnXtF0wAPym9MzlPHjtbmnUZ5+fCdQLKD1wnAj9h9HZ0wWPhSpdEqhcsDwtd9wwh86Emv2JG7gTrrCjdBIhBY6GBq0wDpaPcfwEQgdxJKdQXvPoJoPgvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kuejj0YFmu+eP/5/RSJalDHN5zDX4ENQUFsCdXrH6E=;
 b=iTQO3lJ8QJKYimRJKFCoc2aGhMcwmjouI2ZdJyzEsbaI/lFuyiU+d+CJL274j/nDuTPzfz1NskCoxdp1VaGGozU63IPkVNNcBJCRiwIZvsU0frCdRgdpuExtkNjPeQQGS0qmSeCE42ZsU2L6SaFa0qLGx9UyM6gS+lBk2jpLvfiQ/r7lKIB2A6J5T3jPW+iEJnDocXAmmM46iUJB55EVjSLH0v9jWL8dJ1uH7sM828tdfg/bQEUcy1yGcWvun6h3/Sppbf2G2xHhU+lHMZpggX6gRryH6mZGzoUbybnl2Nzdky8jGq+xTc3SBoSIYf7BzZmuuSyJNO7/Fs7wV9A9Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kuejj0YFmu+eP/5/RSJalDHN5zDX4ENQUFsCdXrH6E=;
 b=ER0RbVu/0gqpKqaorpKmh0DXFOPraR6DdcBJpHbFA+Ms9/rAqWLkWs/JlkrRnRjeQdyPuOr0upqTga/BjmchXYnO961wMYimczIieDL0jDs80/fCal5OoUDEdlATMOZvH87Jfz5gehkBGqWdW+XFTDqTlnXOWTlL0WcJrTtPyWs=
Date: Thu, 18 Jun 2026 09:38:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 for-4.22? 6/7] x86/domctl: don't imply I/O port
 permissions from I/O port mapping
Message-ID: <ajOgdObWMM-xD-y4@macbook.local>
References: <ad1eb834-b2f2-4db2-b2fd-9d7f5bb857a9@suse.com>
 <e88a6015-8867-41a8-907d-b6749b1d2549@suse.com>
 <ajK644guPV3lfJde@macbook.local>
 <5379dace-04d4-40ad-ab87-7043a5b24ee4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5379dace-04d4-40ad-ab87-7043a5b24ee4@suse.com>
X-ClientProxiedBy: BN9PR03CA0245.namprd03.prod.outlook.com
 (2603:10b6:408:ff::10) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA6PR03MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: 718a2bab-4e3e-4ba9-a834-08decd0c9848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|11063799006|4143699003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rh+kCX0mJoHM+vA1ZTRb9WJ8YNgBz8ruYfTlj2v3mI1pbY0+NlKVvTTtdKAxXtFeZUQ3j52YLUwWbsCGqrNMSfPREqoWANhYv8IS2bK9hClydPqx2OjzyQ7R1mgDwOP+K3zTJcGPZtduIFy4RjiMRcJoXyQjSt/NSKDQ651phu6B+g6UTnp0tmRkWnlwXm0RORTJcIACZkCeJsr4sOaKxu6KknWQ4Hl0A0iugk0B1XyQ/zea3etpIezuoQm1Bqokk2GooiWSKMe2NI+wVaYcMcKm60HjPSifxnsfMVXfsifwDOXaUefcVDuySEp+XfDbonQKuc7gc8da3zAMcNp9154Fq91qr94X6rGYxmhKi2UEeP1IkqsndHE4cA5PUfccauBRKaCP+tqcu/2DaH1IxesplnjRcidRgcySvPUBHFv3SQ1buYwXk9js0RQ+GJqY3kpHECxOzsebih4D/vxILVB3EwbU4hFgCiHjeCKOVDdZq2l2xabxxnzwc7CJ0wxOXzBqL19r6R5HvBoveM/TXM3t0XlcpAcukncY9JBF3GLawHskA1lihlnT0aRbE2Z8ZdJUzXzG26XKtV9ycAEVSmHErg5QNVf86z+3Z4e5wIptxoK31tKPDyNKX1EtoZh520vvAB1hpFFcc1GEmm709lXsyofdTsBy2tmpeZMZqkH4yQkwWjGn8HzP3XHMxKMZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(11063799006)(4143699003)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cytoRlIwemRURktRL2kxNzZmVHdJR3lUZ3JrM1lBaVNtVjBWWFVKUys1OEox?=
 =?utf-8?B?c0xPb1FZN1lOV0ljcGE0M2lDbjlFemszalhaQytjeW5lWE1GRmYvQXJ3dzQ4?=
 =?utf-8?B?Vk4welNEakkyOTk2SU9HTGNJc0tnSEw3TnZHRnBJOWZZYnUzN3djT0gyODVE?=
 =?utf-8?B?RWtTeG5jUXRDQVE2SUJVdDBtU05RNi8wZkZ3Z1R4NWIyL3FJYXdCZVdDMXUr?=
 =?utf-8?B?eUpCZDBsOXhxNHNXNm1rNWtDcTNYV1FHbVQ2ZS9wK0kvVTZ1TktYdUtZNnlV?=
 =?utf-8?B?bWJTZ3hHSFpsd0JoTC9lN3I4T2ZIVEg3SEs2RmFUeTRvTmh3SnlPT3RqUkNx?=
 =?utf-8?B?WlU2UHFPQ3k1bis3dG5IWkp5L3FMbHpaQ0JTZXFGYndBMGJmNjVNaGFhYklq?=
 =?utf-8?B?U2doK28xTmdjaUpzWGpvUmgzdk1mRERrWkZ1c25BT2JWUm9FUGRQZTc5VWp3?=
 =?utf-8?B?eit1WnljWi80cVdzRUNwUVhoaXFydEQxWVV4MW9YTEVCZHZWMmlLRTJvY2JT?=
 =?utf-8?B?YlVQcVYzQ1JYQnNmTWJYUHBoaHVoQWtibkJ0SWo0cCtnOXcxWlduWlFZaXdM?=
 =?utf-8?B?TVZHTGloUzFZT3Y1ZlAvTThXU2VLSVYvME9hQk5kYXRkS0tXaXlPZHNrZ29j?=
 =?utf-8?B?YWxSc2RyVmJnYzlwM3hTbUdkdVc1M2VVelRkM0U5eWZlbyt1UVBwMjkwNy9L?=
 =?utf-8?B?cmQzaUQ5UzZyL3g3RzBoZGxWZDhEamtQTHpoQzlJUWtkK0Rwd3ZFSWpUSHow?=
 =?utf-8?B?em0xSzFyVlVSQUNRUzZUR2FVNVJLYzZ1QUV3dmpYQWJsZytJWXRFTG5pajNI?=
 =?utf-8?B?U25xSlE3VVJHUDQ2NFBHZTZ6KzR0K2FBZVVjcENqeHllbXpiSXM3WlBwK3JP?=
 =?utf-8?B?U3lBZFg0T2NPa29MSVhXQmdUN2xjeU40UTJjSnVQd3RzYmhpY0laaHRwK1hM?=
 =?utf-8?B?US9pM0xvZkVxSk4zMzhoay81Y2VFZkdJOEJ5RXdBTTlBVk1UNHVuWmIxYkpl?=
 =?utf-8?B?eXEwR1NNMzcremF2SUUrdHl5LzRTSFRrak5acFlFbm5rWEZTQzJibVJWSm5R?=
 =?utf-8?B?a2xqTDNWZVhJOVI5U3JEQTRpaHR6QnpIWHZkdDlNYkxQa0N5bWxjTS92RUtP?=
 =?utf-8?B?VTZ1U2I2d1F3L3FVaVpXZk1URGtTQ3ZkL3ZXclVXaWJwb1hzK2xueTFqc3Ux?=
 =?utf-8?B?akpSUktwcWRPMG5nSTlHZDlVckVNbyt3RERqNmhycGNyYW9TYVJicVpLQzQ3?=
 =?utf-8?B?SUFqT296anprdW5Qb3FMMktNV3FsWER4VWNRWlZQNU85eng1S1pUWFpVMGN6?=
 =?utf-8?B?elR0TElDNjI0UEpRbEYreWpETjJQNUlXOTdtWFZERGZuNHJoamtBUTdiYUZn?=
 =?utf-8?B?WFd5emFMNmdqQ2ZqeDFSR3Q1Y0kvTjZQYmc5RTdyYVV2dGdlT2U4Zng5UVhJ?=
 =?utf-8?B?clBqemtNaTdoTnZsaHIzSlNxVXduZ1NlRkNrYW5GTDI1RDJ3eS9vdzZibzFn?=
 =?utf-8?B?d0ZxUEE1MDFXWkpmWnVqZ2RNVHVSeit3QnBoM2dkWWZ5N1VZZ2RMUHphTTNm?=
 =?utf-8?B?TEtoV2FGOFN4cnI2aThJWXpzcWRqMFd3QWx6Q00xd000ZVJ3SnJxdGZOb3NK?=
 =?utf-8?B?VEIvT1JJVWprYzcrQmM0d3hJMURNSlRkV1FJT2xENDlRbmdtSEJ6dFp5N2Q1?=
 =?utf-8?B?QWprdEkxT3NjREVwbmZnbFhXMCt5VHc4aTQxbVBiMTRGd0Q4QXpaU1IyN0hz?=
 =?utf-8?B?NWlLQm55TEFmeVpVSU9USUNVQ01ibUtBQnNsdlJPNVdqM0pRcGM4b0tGZUli?=
 =?utf-8?B?bFlkRE4zcDNIbUEvMUxoSkRteEc2YTByb2p0WDR4b2pMc3FKalFjTHUrTG5u?=
 =?utf-8?B?ODZZWWw2SjZYS1dPNDBZZ29mbERpOUt1T1dwUHJPVWxwN2ZGQjc3M292TnYz?=
 =?utf-8?B?cjdMdnFralhWdzFGV1BRaUFERkNwd3FYZ0ZOOGhQTHRCQ1ptelFMUjZqVlcz?=
 =?utf-8?B?NmdDU250QTJKam5YVFJVak1GekRIdHlxSGo3MWxNWmVrTG44NmFhVzc0U0Q3?=
 =?utf-8?B?U0V4bThhdnl1b2x3RitSNFQrUGFtNkNoM285WkF4d3FIRWdlWmppeE9FWGwy?=
 =?utf-8?B?OGdFSkRPYk5vZ2hJTzNBYTB3OGV3Sy8yenpheFdRTkIxeE1UMy90QnpZakxz?=
 =?utf-8?B?Y3VmeFgrdXk4R3hQYmVCaEZiMWJxbnRNVS91SXhpQnpXbjJ1WTllcTBhSXVF?=
 =?utf-8?B?d2tZTHFxeXVOTlY2aVRkUHpTY3lTU1MzNTl6Zks5OFJmaWU0SzF4U0NlUXFX?=
 =?utf-8?B?ZmVUTmhUZE5uc3Ywb2N1UEcrNDJSeVVnVEVmNUJWai9BZ0lMR2hjZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 718a2bab-4e3e-4ba9-a834-08decd0c9848
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 07:38:31.3574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/iDsCwn2OSXcwNNEGrZj/qwYlcVjorQLa9I4LOoyBMG7tHwzoihLQGY+vz84EGFOlwYuHpTXr3+JTNMfIaxaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7973
X-purgate-ID: tlsNG-bad1c0/1781768315-40762A53-AF2688AB/0/0
X-purgate-type: clean
X-purgate-size: 5666
X-Rspamd-Action: no action
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
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,gmail.com];
	RCVD_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,macbook.local:mid];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D09EA69E212

On Thu, Jun 18, 2026 at 09:15:36AM +0200, Jan Beulich wrote:
> On 17.06.2026 17:18, Roger Pau Monné wrote:
> > Overall I would defer this change to the start of the 4.23 development
> > window, and commit it then.  It's IMO a bit risky to change the
> > interface behavior so late in the development process.
> 
> I share the concern, yet the Fixes: tags suggest this (and the subsequent
> change) wants backporting. Which means we'll "gain" the behavioral change
> in minor releases then anyway. IOW - I'm of two minds here.

IMO I would refrain from backporting this.  Albeit the final behavior
is what we think should be the correct one, and how the hypercall
should have behaved in the first place, it's none the less an ABI
change, and we tend to avoid ABI changes to stable releases.

> > On Wed, Jun 17, 2026 at 11:30:04AM +0200, Jan Beulich wrote:
> >> ---
> >> libxl has libxl__grant_vga_iomem_permission(), but I can't spot any I/O
> >> port equivalent (nor a revoke counterpart, btw). Everywhere else MMIO and
> >> I/O ports look to be treated equally.
> >>
> >> Qemu uses both xc_domain_{iomem_permission,memory_mapping}() in
> >> igd_write_opregion(), but only xc_domain_{memory,ioport}_mapping() in
> >> xen_pt_region_update() and xen_pt_{,un}register_vga_regions(). Is the IGD
> >> region special in any way? Clearly this can't work from a stubdom.
> > 
> > Hm, I'm unsure that code will work correctly after the change here, as
> > xen_pt_register_vga_regions() doesn't grant access to the IO/memory
> > regions to the remote domain ahead of assigning them?
> 
> 
> Hence the remark, and the desire to get input from Anthony. Aiui there
> either already is an issue there as of 0561e1f01e87 ("xen/common: do not
> implicitly permit access to mapped I/O memory"), from over 10 years ago.
> Or there is none here either.
> 
> >> --- a/CHANGELOG.md
> >> +++ b/CHANGELOG.md
> >> @@ -14,6 +14,9 @@ The format is based on [Keep a Changelog
> >>   - On x86:
> >>     - Enable pf-fixup option by default for PVH dom0.
> >>     - The libxenguest bzImage loader now uses the system liblz4 library.
> >> +   - XEN_DOMCTL_ioport_mapping no longer implicitly grants permissions for the
> > 
> > I would explicitly mention access revocation also, FTAOD:
> > 
> > "XEN_DOMCTL_ioport_mapping no longer implicitly grants or revokes
> > permissions ..."
> 
> Sure, and then also ...
> 
> >> +     port range in question.  XEN_DOMCTL_ioport_permission now needs invoking
> >> +     up front.
> 
> ... "up front / afterwards."

Yes, indeed.

> >> --- a/xen/arch/x86/domctl.c
> >> +++ b/xen/arch/x86/domctl.c
> >> @@ -714,15 +714,35 @@ long arch_do_domctl(
> >>              break;
> >>  
> >>          hvm = &d->arch.hvm;
> >> -        iocaps_double_lock(d, true);
> >> +        /*
> >> +         * NB: The double lock isn't really needed when !add, but is used anyway
> >> +         * to keep things simple.
> >> +         */
> >> +        iocaps_double_lock(d, false);
> >>  
> >>          if ( !ioports_access_permitted(currd, fmp, fmp + np - 1) )
> >>              ret = -EPERM;
> 
> For the comment below, note that there hasn't been any log message here.
> Hence ...
> 
> >> @@ -747,40 +767,11 @@ long arch_do_domctl(
> >>                  list_add_tail(&g2m_ioport->list, &hvm->g2m_ioport_list);
> >>              }
> >>              write_unlock(&hvm->g2m_ioport_lock);
> >> -            if ( !ret )
> >> -                ret = ioports_permit_access(d, fmp, fmp + np - 1);
> >> -            if ( ret && !found && g2m_ioport )
> >> -            {
> >> -                write_lock(&hvm->g2m_ioport_lock);
> >> -                list_del(&g2m_ioport->list);
> >> -                write_unlock(&hvm->g2m_ioport_lock);
> >> -                xfree(g2m_ioport);
> >> -            }
> >>          }
> >>          else
> >> -        {
> >> -            printk(XENLOG_G_INFO
> >> -                   "ioport_map:remove: dom%d gport=%x mport=%x nr=%x\n",
> >> -                   d->domain_id, fgp, fmp, np);
> >> -
> >> -            write_lock(&hvm->g2m_ioport_lock);
> >> -            list_for_each_entry(g2m_ioport, &hvm->g2m_ioport_list, list)
> >> -                if ( g2m_ioport->mport == fmp )
> >> -                {
> >> -                    list_del(&g2m_ioport->list);
> >> -                    xfree(g2m_ioport);
> >> -                    break;
> >> -                }
> >> -            write_unlock(&hvm->g2m_ioport_lock);
> >> -
> >> -            ret = ioports_deny_access(d, fmp, fmp + np - 1);
> >> -            if ( ret && is_hardware_domain(currd) )
> >> -                printk(XENLOG_ERR
> >> -                       "ioport_map: error %ld denying dom%d access to [%x,%x]\n",
> >> -                       ret, d->domain_id, fmp, fmp + np - 1);
> >> -        }
> >> +            ret = -EPERM;
> > 
> > Should we add a dprintk here at least, to make it easy to identify
> > what has gone wrong from just looking at the dmesg?
> 
> ... I'm pretty uncertain towards emitting one here. Similarly
> XEN_DOMCTL_memory_mapping doesn't emit a log message if either of the
> two iomem_access_permitted() fail.

I didn't have in mind log parity with other similar hypercalls in
mind, I was mostly concerned about providing an easy way for existing
callers that rely on XEN_DOMCTL_ioport_mapping granting permissions to
identify the error.

I'm not going to insist on adding the error, but I think it could be
helpful despite the non-parity with XEN_DOMCTL_memory_mapping (or we
could also add one there later on).

Thanks, Roger.

