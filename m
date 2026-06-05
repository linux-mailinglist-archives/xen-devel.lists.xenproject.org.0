Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sFgjGaN7Imr2YAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:32:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E22646022
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:32:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=YYOpN5ug;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1329075.1593292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVP2p-0005Dg-Cl; Fri, 05 Jun 2026 07:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329075.1593292; Fri, 05 Jun 2026 07:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVP2p-0005Am-9O; Fri, 05 Jun 2026 07:32:43 +0000
Received: by outflank-mailman (input) for mailman id 1329075;
 Fri, 05 Jun 2026 07:32:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wVP2n-000596-L6
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 07:32:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVP2n-0005ti-1g
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 09:32:41 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a227b92-bab6-0a2a0a5309dd-0a2a4505c164-44
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:32:40 +0200
Received: from [52.101.48.25]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a227b97-aaa8-0a2a45050019-34653019a56b-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:32:40 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM4PR03MB6062.namprd03.prod.outlook.com (2603:10b6:5:391::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Fri, 5 Jun 2026
 07:32:37 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 07:32:37 +0000
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
 b=SXXhghop2KS1V/0oRL4xskh5mMWtdkYpFCvq6+G/nfuDSPbIweiNsTqdnvzdD8OyC3S+sV7eGftjSLYL6a8YeN31ZRWDqo8gqmUKfRxH0x5s7VsGWIIhErqKmmYcKokaCzp1FzFxiynM7eNh4aEf02+fn+ax2SJJ2CuPZy2m2s688xrGeJgy6FlQl25BxcMGn4bAhkV3B2NljcvL8HPncjGsogzSioF7blcVVCWyaxbtqWdlCZ2l+jk5M05E/B+S5jHUqGXVy4cEYPQsjs1Y0IECfJS13dPfW98maC/qCQl+47896Suva6tGxFVCMS392ZtJYGTwebjbH7KItjvDaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNsMsB8giOxuzXS+KnQoaYlk9xNl1w2DzXclUzTWedM=;
 b=gUwi7fu7Tam8TmoBAiMxyPEo2tKN9aUz499wFJv/6uTQfX/oTIKvkLmxtHKqAB14paLA+xAc8Ypau5WE3CKnt1vmGMHksSEzaKpwduQvuofCurh5ORSsgdxCmr/w4zE1/3678fCwuxFyjWDkmGQDeZeHagUAe3QEkTTdVoHuC4w/pgxzhhdNETL2waUHJnxzS2VqVx17QsiGaKy7QuHaRSm1a+bzty0jNmQ7eG+TVfkmH4uq9H64172+lRyfUZ0SeP0CRNlEWvNYrpgHFV9CjFJONjNEgvtElS7xhoHERIdrU45egvSzHcL4dCwje8Nve5ojuV+QlIxEBagGyHBqag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNsMsB8giOxuzXS+KnQoaYlk9xNl1w2DzXclUzTWedM=;
 b=YYOpN5ug3clOoWdOFZWh/NGMQCFB3Thcda5+zbhQDexs+osOzzqk4SorWGuSvlXLFaC5iSe6XsvvlbBewrUo/jHkiyTBXGmzXGKyJvXXRyxXdQ/2lGkcHXIv+C44vkEijmAkbclcM9wovYdFm5iEKZ9JSyun02/Xq0X9teRBSMQ=
Date: Fri, 5 Jun 2026 09:32:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>, oleksii.kurochko@gmail.com
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 0/3] xen/x86: Change stub page freeing to fix smt=0
Message-ID: <aiJ7kglbv50TnDGu@macbook.local>
References: <20260604231837.804560-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260604231837.804560-1-jason.andryuk@amd.com>
X-ClientProxiedBy: MR1P264CA0207.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::7) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM4PR03MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: 767a1811-79f2-4dba-0d61-08dec2d49de8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	inFc2KtJcr5qEK4qOFUZPiW1/nJyLntiaujGqmO8xPZxjnciIVP0px7OtT3YKF0MSveVatMBeMX6No+TiXg/6E3LiAZ8Dh2qBCc0jaL1ypP8wu9jFs9HbfoXfOqPtNAj+GtJurSRno7I0glxAE2GPVEbZHo0v23FuY0cu0jUmJpz5Fg6Os/BGWJn6PeGDvraRYWPkV3/Uzl5u0cUdfj0C15/4MITLFwplgeAuap0icM3YymflE2++QnJNdsEdeO7uLZ12Nc7PPsBcifIvZdMrQJhJUKr0jaIa+GlGvjupoC/mLp1fVrT+1Sg564cOot6H8NM4yfOLoOdNJc2NK9ajhlHSXc1Fgnlrd98AbUjx1ufhAOFNR8QI9UoHuKBg99fNd0hgFZXjTozIh/oUXIZaLNwQ+VjhyTsdM5kkwWg3F/o+jR+b4xBAu6H/cOP2mqbOoHjwWVskxTsBVzKW47mZcTp1AOGBjoSewk1EtBXJ2JqAUorybPBIDfyFmjk2qKrR0v/kCF+hUzOCQLMAPJEfoPNtfTj8GcySJBu6wooV+Y4auo2yitXCAYkMP/cqpYX9eBKee+AztPfkudKM7j/8HkIVW11t5dEDtxBgEtBzR5Pp+fTjRjkb9Xk8Yw/u7r7Os6JxgnHAf9xexfBhLnTduPXwdeGGhZyJn5Xu2BW+6O/1MY4f+zg0gzBNc2rKrbS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVR1eFI5Y1hONDJLNG5MRitsM1dXYUc0QXRlTzg3UVdOc29CaXdKU25xWWVW?=
 =?utf-8?B?OWJ3TDltODdRb0pJalRKL2ROQVMwSWY4RmcvVW9XWG9jdndUVWJMdHBYcFRC?=
 =?utf-8?B?dUFXaFBxaHZEcUIvdng2Umg3MXQ2czVIRXIvMUl6RVZka0xPdzBMKzcySFUz?=
 =?utf-8?B?OGJoUS9DZFdRcnZROUNlaHRMZFJGNEcwWFlZVVhkSlV5M2o4UFJUcnEweDU5?=
 =?utf-8?B?c0lZRG5vekVQUlBhQU1sVTNXdzljNjFhUmIzb2pnWm1lM0c1Tm16SWVPR3ll?=
 =?utf-8?B?RnZOTURta1hYc1MxUUprNTJNQmF2MWdDQWUrL092Y09NQUZIbUplNGQvN2dz?=
 =?utf-8?B?Zk9laDV2WVQ4cXBPR3ZZWVNpTi9ESnpibEV4Qk5ScHlrZFEwK3FJWmxid2VO?=
 =?utf-8?B?YVQyRHpMWkV6MG1JTlh4NHUxNkNMdC9JeUttb3M4TFhyamRLN3k0UkVUOElJ?=
 =?utf-8?B?OUt0azNnSDZ6ck1SNXgyVmFPVXprYjc1OFdKd1FITVBDQVo3dWJZdlhlTFF3?=
 =?utf-8?B?NDRkOGdsQUNtdWdVejJMTFRLYUFoWnNKcDdlOTVtaDZVcGkrVlZDZmtPQm9w?=
 =?utf-8?B?dno0cnhQcjBlSzNtVW1FbXNmaXZpSTJuaks4Q09aT05KWml3RUk0Z0wvZG1G?=
 =?utf-8?B?WWpZcnJ0Q3R3cTlTUEdIY3NMOG5ITWtuSHA3UWNHeUNwK2svdjhvbzRBbTZp?=
 =?utf-8?B?NlJobC9mUVAyQmNLdzhMSnc2SUV4SEkvS25QVmVJNHZZdmdwbkdyUnZNQ2JK?=
 =?utf-8?B?SW54L2dxS1c3dTZIazBTOVo4QXFBbDJySC9JT0tMODNkY3AyNDV0eHlwdm92?=
 =?utf-8?B?Z0prOUxTZm93NTFzZDY2Ums4RG5tSDZCZmN0NzZybmJQenpnU2UwWnhkWTFF?=
 =?utf-8?B?YXlva3ZRajNIRDVDNDdnYm45VWsvTVRqVHlFTHZRZjZpZTZPdDNaeTdrVjJB?=
 =?utf-8?B?ZEJ4VWJPWEo4d0FJZ0laYUdXbkh1QUtxSEg1cXltUzNiN3RJUkpTUGNXMWlo?=
 =?utf-8?B?bEJreXZHZ2d0SjU0TWs5dDBDa2JsZGRFL0d0VzlxdHM3QUxTY0tabTFrcjBH?=
 =?utf-8?B?RnF4aTV1SVdia2k2TDcvTVg4QVJWalZrU1VVRlRXdFgrc1FxZ1VIQ1JQSFVQ?=
 =?utf-8?B?WWc3dUY3NE0zc29MeFc0OHNjcmZBNGs2MmhvdGE3Y1FHY2h5cTkxNHRRa1Jr?=
 =?utf-8?B?bG4wa2ZiYzh3bmtkay83Z04wU0tXa2E3UkJRWHVJbG84NHFOMnc5akdkUCsr?=
 =?utf-8?B?ZXhGRnhXeW9INzdPaGUwWmVjMDhKcERSamF0VUlXOTlkSE5LOXB6WFZad0JR?=
 =?utf-8?B?L3lSaS9FNHljU3B1RUFrZWZVaGgzR3NBQ2x3aDBSOEpLYk9ZSzhUK0tHMTU5?=
 =?utf-8?B?dCtyUy9LbUVLVkZ6TzRtSDZZbFFGNmJBV1dDM0NQcXBzcFlELzg2KzhMR0pp?=
 =?utf-8?B?M0p4dXo3UXUwa3FHaThBaGczTnV0REVoZjJ3RnRyd2RoRU1xZU5GelFJNFZ0?=
 =?utf-8?B?dWMwcU5RRnVOVWhOM1NiY3RNMlpoeGpYVXl4SjNSRWIxTk1jRWhpY2NMcnAz?=
 =?utf-8?B?L0cxQ1NNSGp0dzdXNzR6UUFteC95SmtUMzVCUnBBRE10UWpRUWVxaDdubzlo?=
 =?utf-8?B?T2lrTXIwRlhsUkUrenkvL2Q0eE1KWGwrRXRRTWFtNzFmU3Y2aHM3NC9NcmJR?=
 =?utf-8?B?N29Kd2dpZHJnQkdPdDN4QXJHbmNtcGNVV3FiVWg5UGxKZ0NObFI4amNvRUkw?=
 =?utf-8?B?UC84VGJ5UllJQnZKS3VodzMyY0NyQjVqUVExUjBGWVhwNXRTVkhjR2JtUlRJ?=
 =?utf-8?B?YWJvUFpXL3FTNFlKczcwaVZzUXdSdlhhTThnMmVybDdkMXZTSFp0aWhldjIy?=
 =?utf-8?B?REFGdGpVb2pYaTNvVVMwRFFvUUV5aHYrc2RkeXU5VVgvRXQzaDV1aExxamJa?=
 =?utf-8?B?WXh1dEhOcEhIVTVoSkZGQVpUNlo3WnZEMC9yUTkyOUxvWnJBSnZwQU44UXNm?=
 =?utf-8?B?NGxROGFsaG1DcHlPZEhteFhrVEMybGl1QXhXNng2UHRaQTF3c21LTnk2TmRv?=
 =?utf-8?B?NW5JYjdxMkxwdTY4RmErNDcxWUNNbGViK2pXWkxOME13SlNLdDRPL3VtMktT?=
 =?utf-8?B?YWNRUnJOS0t3WnRhdzUvRW9PajJFTWltRC9LbjBWaW9YWkVYbE5Ic0MvcDB2?=
 =?utf-8?B?S2h1bmhDakJ1eG9NYWJ1U052Z3JZWjVoYjhGWXIyYm1VWGh3UzFkemE0c2s2?=
 =?utf-8?B?cDE3QXU3MVRIY3M4ZzdKZmZuSDVtSFEvdXdFUjgrSjgya1p5eVZ6T0pnWitj?=
 =?utf-8?B?aDVjUC9HOSs3YVFSQVRtcG9CUXN2ZDZHYkp2Sk8yeDI5SEw0L2Z6dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 767a1811-79f2-4dba-0d61-08dec2d49de8
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 07:32:37.4093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Buu54ZexjeS8Pk/twaJS04NvY5ccu4lFbQv/eoR/jJ1ij9keLEVWT8ZtcCJSMjYLw2WyxDinVOQQYJ1JVphFFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6062
X-purgate-ID: tlsNG-c201ff/1780644760-D8D7F443-5163D26D/0/0
X-purgate-type: clean
X-purgate-size: 765
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_TO(0.00)[amd.com,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:from_mime,citrix.com:dkim,macbook.local:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
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
X-Rspamd-Queue-Id: C2E22646022

You want to Cc Oleksii for those, as we would like to get them into
4.22.  I've added him to the cover letter so he is aware.

Regards, Roger.

On Thu, Jun 04, 2026 at 07:18:34PM -0400, Jason Andryuk wrote:
> This is a different approach to fixing the stub page handling that is
> broken with !CONFIG_PV and smt=0.
> 
> Jason Andryuk (3):
>   xen/x86: Remove unneeded stub_page setting
>   xen/x86: Split out page_walk_mfn() helper
>   xen/x86: Change stub page allocation/free logic
> 
>  xen/arch/x86/include/asm/mm.h |  1 +
>  xen/arch/x86/smpboot.c        | 32 ++++++++++++++++++++------------
>  xen/arch/x86/x86_64/mm.c      | 31 +++++++++++++++++++++----------
>  3 files changed, 42 insertions(+), 22 deletions(-)
> 
> -- 
> 2.54.0
> 

