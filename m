Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FruWKzU3RWr98goAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 17:50:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C546EF624
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 17:50:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=qeWvOLGM;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1350205.1607747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wexC9-0001Oi-2o; Wed, 01 Jul 2026 15:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350205.1607747; Wed, 01 Jul 2026 15:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wexC8-0001Mv-Vr; Wed, 01 Jul 2026 15:49:48 +0000
Received: by outflank-mailman (input) for mailman id 1350205;
 Wed, 01 Jul 2026 15:49:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wexC7-0001Mp-JZ
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 15:49:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wexC6-003vPF-Ca
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 17:49:46 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a453711-e002-0a2a0a5209dd-0a2a4501e270-16
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 17:49:46 +0200
Received: from [40.107.208.19]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a453717-400f-0a2a45010019-286bd0138a9f-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 17:49:44 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by SJ0PR03MB5805.namprd03.prod.outlook.com (2603:10b6:a03:2df::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 15:49:41 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 15:49:41 +0000
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
 b=G+LNIGdI8DRjVTkNwH9lCZtkEQKHauUXSnxgtw01x0+CLEyIsfV78D5UFutBMKz4sUc+ZeXSiUwqF9yJyereYVUDvwwVkzVPfrQLasc15UrxRGZYfal8Z4rrnrKDjkTbhRgZo5EHmVglR3VNyI6ZiJdT3XCxejAWt4LWvwtm5XmBHmXtP+paANkcAEEUOSS9U2nq8vTn+KY00ef6/AWWTBEh35yRuZU9nR6qkKJwpV1o1IrXEDUJS6798VDV7DsBACcMdQaJF56PGuzFOZm7snpNG0cuBHo5FO9WlpvoUxL6hEu9T+fBiCNvN27JR+cMmyt6tyEtITwlDPqjG03tvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1gKsCNQ5LpJgewCViFf6a2Fi0hn7CDK6/H43Ro6vcjc=;
 b=LMlZmxay5Pf8Gfh86EzR8wt6xstyAge9AXm0EJb8Zpr5RPWILwA8GHDfHPreGm33Nv18cc/JJn2+xaUwKbZhYy4fCDkxEDSYjiXcS3TxXQRizZtqsV5tp91NI0KS7dwPr3xZaKVpsCCbf7PBgAwRhKhJnATNiMCshDvE8tAjmHpvDse8F/MA+8/8HhFWW2qnM8ZvXpDNKRja+eWkOu3d6Xr93ZYKJ/EtW9fUzOGdGmoKtWm8V5EE2tsjron5W59Rdo5wrwMuWUEXEC7sMutzDwhGL2IpwDc+GcA+AG8Z+HTv9yOlkFy3A1M1Sr5tYxa6kGR/iOHzfFkiIADiOlM2Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gKsCNQ5LpJgewCViFf6a2Fi0hn7CDK6/H43Ro6vcjc=;
 b=qeWvOLGMBY1xq7EQDZB+CHgDJyTBq9lZFh3XBDb8QHK28kV2KS2exzGNg9NAJJsajODLr0XHQTpiMzyXKokK1g+Eb//olGx0WagLeL5rpnt+8SvZmfvBuqe2qcyZxA/pdQ6L/gDj6tsgjakQ+4/qKC8faILwnTphoxR0/5GcQC0=
Message-ID: <f4ae99d0-1c0b-4a8d-8420-e971996f6d8d@citrix.com>
Date: Wed, 1 Jul 2026 16:49:38 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: [PATCH] stubdom: remove c-stubdom
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20260701144259.4077884-1-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260701144259.4077884-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0254.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::18) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|SJ0PR03MB5805:EE_
X-MS-Office365-Filtering-Correlation-Id: 9333feeb-00a1-4c72-ca10-08ded7885d4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	T3NHbcjUug2ONyrzNeycljCaHaa2Ed2ab7JWJ/izKx6ByUax7E4dxZUZawl/h/3xf/oD0sKxW7/R6j5CMftGk6UzD5NQ7+zAGjdM5d3Zw88F4vijEaMfmoq6umIdUH1LmH2C7XkfsZyZ4I6n3N45jWejqMJd1DvmWD4l+ASnHiPhmBIkNs6qX/kXRht6RuwIu3oUv6Zn7QSqS2TcuZkCQym4SG5LEhY7WL6MxYwiS5UvPQjPFadzic+yByt/0Hucpv6twNR61mcK5iFdc50bnhmIj00JtEBQY4dfREtcXhKctljc84bcUrsGqFT1OQAqHP4eIZlXU7W6fljhpwMhgFseRP+VilygILmQZFjGQ7VDZGn1XJwGqxt9HC3Ks4whbK9nK7eSuuAbGSjZ7EvU6Az8RqTk4rTO7NOXDnqM1ytiReg4sK0Fpnk/Ryu8b1Ohe0WEukNZTHTDuSM6DuAHrL8BRfXMi5F1xwCNLzeSSfDa8tBQ0bp8831QUPO0eTbSGs/hpw3LrRkNxKin7fnARyl4X74i7WHbSj0XqADK8QfhMpr9l3hzwvpTi1rTz4F1R/5B26NaFnentuBSSLoZ4OoBef9SYROJGhdHS1wD3/B42NAy0WwGHamE5x7NhJSkg74KoqpnljtN9v8SV6rmVOuC4y4gS0bQ4V2CymBBcEA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blROMmx1RS90Zkl1NzFlM0FyKzdtTnkwRGRXQTR3ZGRNMm1WekV3YmhFY0o0?=
 =?utf-8?B?QU9kRmZsOHVVQ1pVL1c2cERRV0lzd01oVHk5Z3FQNW55WjBWNXp6RDUvVXVx?=
 =?utf-8?B?WE1JWGZ0SDdibUJNcHQ4ZUhUaWNTT3N0cDJCWHRMUHZCeTBuenpJRlBjVERa?=
 =?utf-8?B?V3QxWHp5bk9TS3NsNEVJY2NzL05WOXZCOGh4ZmI2dG9vTjZVUTdiRklVc0hr?=
 =?utf-8?B?MHM4UzNyd3hiem1KQ2d1ajl0MGFPY1d6azZhQWxoanJPVTlPazMvTUgzSHl6?=
 =?utf-8?B?RDU4QmIxWXY2N2M0WjNSNERZNjliRU5pUG1ZTm9XTHE0Lzc1clhITS94MmtO?=
 =?utf-8?B?b2xOVGNrTVk5emNrUDB3WkJZU3UxaCsxMnN3TzNOdFc4RkNkcTN0c0VxMU00?=
 =?utf-8?B?OU5iS1dTMXpQUWpocXNOMmhaYXFDVHF1NWQzdlJpOVk5RWZCN3JZRm1kc3Rq?=
 =?utf-8?B?cFE5bFJvU2FUaTc2QTVYTnZnKzJGWUZnV0xXc2pscFp1TytsRUpjbEI2a3g4?=
 =?utf-8?B?T3hKQkRBUjdXOFdYUlg5QUtFN3JjMEpjMVhDZWNmY28wM3JLRTJEQnVnblpY?=
 =?utf-8?B?ZXhmVm5EcjQzTnowdi9ZMUtoTmRHaGJnRU1IbzF5eWpxM2svYWFPREFzMm4v?=
 =?utf-8?B?ZEFYemF6cXMraSt5WnBrWmp3aWcvK2lCUVJ4OXRjcVMzOWFQRnQ4V3hseUNq?=
 =?utf-8?B?V1ptcHY0UXg5b2RSbWlWcUhvOWNSbTNidFdRaVlHaGxuMUhSbXlna0pvMWRZ?=
 =?utf-8?B?SEVFd0ZrUDNQL3ErWVhsRTFlcXVsNlpVcmlsZSs4amtvWDY4VTNQSWFabjhm?=
 =?utf-8?B?WWpMdXllckRYL09pVEtmU2lVR0dlc1lCbzZSalNLdU5FTUZDLzViR1FsYkVS?=
 =?utf-8?B?WGtCTTExNS8xczI0cG5DbXpLeE5pNEFPaURNdXZIdDhvY1Y3ek5QT3hlVkVZ?=
 =?utf-8?B?b1Ayc1QvZjhCQjdwbWgxbVZqM3RMOHJUU2J5akRpeXJZc2RWbDArRVU5WEdR?=
 =?utf-8?B?dkxNaG90V29TVTUyVmpRS0NaNEl6VjgxWWtPZG5UU1ZwVFQyRTZmaEJRUUt3?=
 =?utf-8?B?SnJ4NXk2TWdHV2plVzk0RTZvaFdhZUZkSENRSzlBN2NTc21sWExNNFJ2Umxs?=
 =?utf-8?B?OWYzdzdOV1dxRGtBT1E0TmhKb0lEQ2swWTNsUTRJVHNKeFlneE5SQkxGNzFz?=
 =?utf-8?B?UlJjdXNDYUFZWUNScmZuU29lRkY4T0NMclFDZnBCdmNSMDNKNGVvRW10c1BU?=
 =?utf-8?B?T01mZXIxd2pqTjI2MzlVU2RZZzg2ZXFZVmh6ZW81RTZ3YVRUMG9xemVVSURh?=
 =?utf-8?B?WkNJVGtXaVJkdW5YUzZ4MjJadk1FblZ5S2FHSlZyNGRzY3hhN0c3YWdPZ2ww?=
 =?utf-8?B?dDVvd0h0Q2pqZHNrRGZOWlFycDRYNk9jaDFISUJJN3RqeFMzbWEzbVBJc2Zv?=
 =?utf-8?B?dXRwWkQrR0ZmU3YvS3pLNVZqelAxS1JQS3FGSHRhbE10NTBidDJidnJxdXh5?=
 =?utf-8?B?OC9Xa0FPWDc1UUtqd3NZVm9FU2lIMmFva1VUTWJjUlp4dXZ2Z2hSUjZNZmtj?=
 =?utf-8?B?eFR1K2p2ZjlIRWEzcUtKU3ZzZlJVai9RL2xWYTloZXd1SUtKSnlER3M3NDhQ?=
 =?utf-8?B?L0h6cXVPSG5pSys3c1QyQjE2RlNKcklidjcxYkNLUk8xUGc0K01PYnVnZVB2?=
 =?utf-8?B?Nkp2eEV4WkdBdHFKT3hlT0VIMDlTZ0RXalVJdGxaZmordUwxVTJTcXlOTmZx?=
 =?utf-8?B?VXJDOHFYZEpWbUkxUnZBTXU5cVFTR29aS0FKSGhjblFpaTRQbUVxVTE3Ump1?=
 =?utf-8?B?OEVVU0JsVnZrOHF4ZVZHd0FRbnJLSzJEdnppaGlXMnEwQnhFWWtuemc4T2My?=
 =?utf-8?B?cDFJRlptcHZXVzdEVEYyRTNJN1VKYitnNGlvbXhiNnRzMFdmanlCeWxhbSs4?=
 =?utf-8?B?Sjd6WDZDYTJyTXdEcnhqZXZYei9HWVEzUTRLczZqVlFMMVR2ZFhsTmxlYjE5?=
 =?utf-8?B?dFdRS2RwQUNSQWZhbnpjNzRKbm9jVmdyaTUzUGhFbFZMaHpUS1FmcFZPYVVO?=
 =?utf-8?B?OGcydWpaVnVHZVc5R0JySmdSUTh4KzM4M09JTGgrclVSbmdmcFlkZEFTenY4?=
 =?utf-8?B?Wi82bkxuQmNHWldLQUZNcDZIRllLRjA3U3dqdGNQMkhvQ2QvS0FqdzNSanNO?=
 =?utf-8?B?TGRLYmh2OVREUEhEZlhLODdJandLcXVXZnM3TVRKaTBlK3FpQVZrZFhWcXYr?=
 =?utf-8?B?SEJqazR0VFdBTFg1R0E4Q0RRN0FEcU1IdVlhbFMvVEFyMm5lU2UzMFBtcUpy?=
 =?utf-8?B?Q3J6TDNYSVdiZVBmdFo5YUVubkhyODRENkJSa3pNQy80L1N3U1N6cFZrc1FM?=
 =?utf-8?Q?2G8haQwhYfOFa6NA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9333feeb-00a1-4c72-ca10-08ded7885d4c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 15:49:41.5046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uaEi7DFk0yB6fkSCJ4jhGTrz1nAM0u+J7mJLEUsErTpN5o6I1ksARzs0ubteyP/vnFIwUO3KXig9Z4X6pMUjiC2oPZYykaM7XE0boOKSKJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5805
X-purgate-ID: tlsNG-d62444/1782920985-D04D51E0-38BF478C/0/0
X-purgate-type: clean
X-purgate-size: 894
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:samuel.thibault@ens-lyon.org,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email,changelog.md:url];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
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
X-Rspamd-Queue-Id: 17C546EF624

On 01/07/2026 3:42 pm, Juergen Gross wrote:
> C-stubdom was meant as a base for building new Mini-OS based stubdoms.
> It hasn't seen any work for many years now and creating new stubdoms
> should use UNIKRAFT instead of Mini-OS.
>
> So remove c-stubdom.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

I didn't even realise we had one of these...

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
>  stubdom/Makefile     | 19 -------------------
>  stubdom/c/Makefile   | 13 -------------
>  stubdom/c/main.c     |  8 --------
>  stubdom/c/minios.cfg |  2 --
>  stubdom/configure    | 44 --------------------------------------------
>  stubdom/configure.ac |  1 -
>  6 files changed, 87 deletions(-)
>  delete mode 100644 stubdom/c/Makefile
>  delete mode 100644 stubdom/c/main.c
>  delete mode 100644 stubdom/c/minios.cfg

CHANGELOG.md too.

~Andrew

