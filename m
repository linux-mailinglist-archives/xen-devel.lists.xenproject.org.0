Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3cWLFojQJmr6kwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 16:24:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C363657214
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 16:24:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="SQS1c/+Y";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1331670.1594233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWasZ-0004fH-7Z; Mon, 08 Jun 2026 14:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331670.1594233; Mon, 08 Jun 2026 14:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWasZ-0004dg-4h; Mon, 08 Jun 2026 14:23:03 +0000
Received: by outflank-mailman (input) for mailman id 1331670;
 Mon, 08 Jun 2026 14:23:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wWasX-0004da-C2
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 14:23:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWasW-004MTR-Ou
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 16:23:00 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a26d038-5cb7-0a2a0a5109dd-0a2a4501ddb6-42
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 16:23:00 +0200
Received: from [52.101.57.46]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a26d043-c1f2-0a2a45010019-3465392e9f63-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 16:23:00 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH3PR03MB7361.namprd03.prod.outlook.com (2603:10b6:610:1a6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 14:22:57 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 14:22:55 +0000
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
 b=gRg2BaerpBxbfktoj+aFqs0XobiMIi/HqcS6cxlq5vrkTUlFsuatPp+waFEmr+mAgwa90FLPOvVF2W8cLPfxXNKPtPUBuobxpO+nUjpna9inTtU3TYcl21AmZcMx8Qh3fBF8KnL9po8LL96mO4hi6KT+xJeIQSwPujPHevwtFEIKq6ylx4jEUWtcyRTR1KcWg62HKHJ4ZkFJ/wHBC+5JxAqCTFAsEPAGy2JhHqlWad35VdDd53yrx7MTbhpIp3ob0lFa+ak9YvqrIPv9k4Y+e5wV6ss+RUxqCxPi5nycj+jauhD6J+7FzttDWEg2I1iQHiQBKQY5+VKKXGxDnknQ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gf9FbH3sawEqfVJhCcjgRsUN7h1KXfkMtsmcB52mMs4=;
 b=Ma1QH0Rv3KXMiIg4YqUz4aXwd8S8jscK1DoMSim+MMXQmxg23fHxEAvon7qJGDvJTBhe5lFuNvNHENRgdRflEGmpt+1H5oE+2o9nbDz4CPzjV+zN9+Z76bZbnQZvooms60P0aQDaNV8VViZXS4WBGPy0ZJClTEMKgjmEJ0ZcInT+USOFsEgau8ps4AXsb5GlR1+cULP/Tv8bWWG/oBfqdTaAnm+ZC33lezu2hqz7lKUehmcb85V3E1l1g1JZ3Z4FZNUu136pLgzBrXmKu+9ytoWetE95LvMAMZ+buLYPNGOt/tX2QfHFXHBqBvRR/z/a9C1M5DRnhbcK9KCJYTYBQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gf9FbH3sawEqfVJhCcjgRsUN7h1KXfkMtsmcB52mMs4=;
 b=SQS1c/+Yr/0umK8Ia3l71fGDm2Xcqk+OitovagTJ8cdmRNBHwzMyAS81cnkCg3ULDzo5FZMMJJGzgatZR/qiK7JLX/YRCKJDOo9uZywqJEZ5wTP20VSBlXjc1yJcdQeuj6NUXUCdPEZMwxhrupNzwJD3jLgmYPN7T7dYFMiPHMg=
Date: Mon, 8 Jun 2026 16:22:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 01/16] libs/guest: Reduce number of parts in
 write_split_record
Message-ID: <aibQPLHlV6-fNtLO@macbook.local>
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
 <20260603130603.776452-2-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603130603.776452-2-frediano.ziglio@cloud.com>
X-ClientProxiedBy: MA3P292CA0037.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH3PR03MB7361:EE_
X-MS-Office365-Filtering-Correlation-Id: 96eb734b-32df-4640-8cf3-08dec5696e66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ahslcXqaF4UtMJ1bKDBVsDIW0mTzYrb2Q34Qz8FtX+Q9GA+pCuIwnjBJq9RHxBnATYDFOb0FL49iD8lvvc/yt0O3ldMc7hBB4UnuuASn2dbG0DTfSbzqHDzgHeTM7P2ZrYnCZBiC1aU9yK/j4wO7w6VaT0qt+CblxRT2vQTVCQ/+W5W+7fxAvihGiQ6k/J3eERkorooccRlYUTgaWNUAZGGz5G+vmUv9f9hSEmm2JTYxJAe/wyEzNl8L6XsoI1zHc5jESiBdL+TMDqHZxwleMrT/Cc4Tp+lqnZfj7YK/ZBITrsZjIcBop6vJV+qp6UcjKIxJ0+GqogA1RFON2UN7HCzZAI/0z7aw8OrJeLC9CVYqi1gGipXw8NGixgs6VtH78f8irLywfnB/umqQ7Xo/c02JEn08vYhgMny0uAYmqV05X1KQPI+66Ep6vbN5cwJvaE14j2aiNOgCsL1R+RJRFPBzb6QrZBceZcrqH33vPtnrDCb+W4XHSzqIaJzbiElSjS8wSm/GMr/UF39MpwHJgHM3oDza7tgbpaR/m75meOIF6HQ0CEMqosQB/iXZeFFI2SI8idkqFmOIlppSDyne+wYExrV+z8xlHVCzg8LemY+48eAabJYziDbO4xZzum41SpDFl70jTu+W8piOIkZU8VTnbNZuI92i0DKYrU24dDTRoof6rHj5/TWmHo4WGR1F
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wjc1WUViMWwxdXgvOUZmRUJwN1h1Z0lSNEh6bWhyWG9RVWJmLzJZc3JnZThX?=
 =?utf-8?B?ZVJRZi9qRHEyOXZ3bGxSbWh5L3BCVE5XSFBjeW1RM2p6bHRENEVwc09LWWZB?=
 =?utf-8?B?Mzh3eFRKa3hNYThRWmRqZkROcFZTQ1d3QjVrT0pLbUI3T0UzRkVKZitaUnlO?=
 =?utf-8?B?ZmlYVndaRi9KT1VUcEhTdzUvcWRhNFJvOFpseHpPK2UwVWJzb1N1UG9pMWgv?=
 =?utf-8?B?WXQ4UVJGM1ZHQ2greTZUYURPNEx4Q0M0b2N6ek9IZGFnNmxtSEp4ZnJKT1lU?=
 =?utf-8?B?YnkrQWZyaXNZd0Q0V1NJK3E4T2kwZFJRZ0Y3Z0oxRkNDMm1jeUlQeEVuazla?=
 =?utf-8?B?SUhoSXM5dlEwVTZZeWVpbXJuSm4wQWsvdkUwdno0a3REam9IM0I2aHFwdENE?=
 =?utf-8?B?ZndNZFlOQ2UraHB1eGJSRUhvTERhYjgwMnRZMUY2dW9BN3NOSzk5VkpHUkk4?=
 =?utf-8?B?QXhMWDlmTkN4NlpoQVpyTnc3STRMTjVZWWpwY0J5MzJNL2Jpd1FwV04yRDRC?=
 =?utf-8?B?T0U5d3JCVUhKUldtMjIzSlhqYnhsMkpsY2owTE1lTjlOWWJjdXJoeTZscC9U?=
 =?utf-8?B?VXJ3Ui92NmZ0bHhCRVBJTE5ObHhWNEpQMHc4dEdLSHdUKzIxMDJld3JUTGM5?=
 =?utf-8?B?NklwRytxemtFRnNjSkg2a0MzeWFzM2FFWVgwM2Y2U3FjNFozZUpER2xuKzVQ?=
 =?utf-8?B?Zk1iWWJLdU9nbGhEeGNvVTlNbmY0SXlyZGtjT044dytjWktPSW9rU2ZYZ1ZR?=
 =?utf-8?B?UHlqRThzRHdycjdIbjlEeGRoMHlHLzhZeDRUMEJSeXZQdVZqL1lyTW51QW9P?=
 =?utf-8?B?M0w3ZGg2aWdHZG5DOFRWamlBbUNPMVhYM3ZJUkhDM3FIWUNkZkkrcWE5QWdn?=
 =?utf-8?B?SHhBYmJndlhpZG9USlNHeVM4TFJINXlDZ2VDdHkweVhjZTMvY0dlQzZqSmpq?=
 =?utf-8?B?SXlJbGJZaURFay90M01vbTh2NjB0a2VkQ3dTYWJEVy82ZHdLd1R1MUN5VHBQ?=
 =?utf-8?B?VnkwdHl4ZFovcklSbTVFMFVQOCtSbnM3TVpmaXdLNnNBMFkxUUZNYVdZVmZ1?=
 =?utf-8?B?cXlIckhUeWxYWmVmN2dpWWtyL2hkRTJKRVZOSEdoNERObFVZUUpzWXZ2VGg1?=
 =?utf-8?B?OTBkMkR2SHhiWnFYZ3l4S0NwNDRNZXBjVlJQQ0tuejYxOW1mcXRNSHp6SGJm?=
 =?utf-8?B?bTN2dC9rcXVYRmRmaEpUeGJqNUtiY01JaEd0cERWM3RTSjdzMDRLRHlLeGFu?=
 =?utf-8?B?SUFSVzJGdS9NWjJSSGZ6WUVYRFlMbEpBWk9pR0IxK3Q2OTRxcFlFN0VDZVcy?=
 =?utf-8?B?TitvaTkzQUpLemRLSk5hRjREN05aQm5TOFU3d2s1K2k3NDdmTDVobk9BNDMr?=
 =?utf-8?B?MDR6SjN0dzJXSEVPUXpURllCTWZrS1dndzRUNXlPU2JvUlNLUGhyeVpMeGFF?=
 =?utf-8?B?MXVRQURmU0NKdW0yRzRxakxseHR2c3dXNWZ4R09NTjM5enhaWGlQVmtzSjhL?=
 =?utf-8?B?YlJZdDdtaFRlb0QveDFhdGt0WUZLK2Q0bm10ZjdDdnQ5T296NjdjblBmKzJh?=
 =?utf-8?B?NmJyWGxjcWMwSHFhK2FCMGE5VVdaSDRlNUJYcDBHeHZPemV6ajZBeEdVS1pU?=
 =?utf-8?B?TFJLb0tNbnByRis2TWtZQ0pjUmZxcVRiZjQxRTdoRFFSRS9QMGNYZW1vQzRh?=
 =?utf-8?B?TVJtVmUxYkZ3Wlh5UEcrb3JEUlFzYjVaang0cGNpZ0dVdDdLZXlCN1h3dFp3?=
 =?utf-8?B?Zjd6czZ4dU1oVDZFMlZwd0dIelhMNlh0Ti9TSlJVN1RLVEdwQUcyMlFCeGRB?=
 =?utf-8?B?M2ZDTzByVENjRE9YczBiSG96M3laQmZRRVV1bjdnaGZjL2NrRFcvMUFEWFBw?=
 =?utf-8?B?VlFjcjhzcmtzaVhLNllGWXY2NlloZXlCVkpxSFRYUjhHUHVpa0dQdmhMMmVQ?=
 =?utf-8?B?bVJSYVZNQUE1dDhYWTJJekZxUEdGMm5zRDhzUFFMU1R4RG9IWWxPS2s4WEd1?=
 =?utf-8?B?ck5pTHVRTUdmbUxJUkJ6TklEVEhqM0lSM21sdXI5RWtlV3pQNXlLaXI5UFB6?=
 =?utf-8?B?dzM0bWVGYncybCtsTzRhbVZOZmRwbGJLZ3orOXI2RzRlZzdFcDlmYnlrb3U2?=
 =?utf-8?B?aExnYSt6WjI5ZkRQK29zcXhjL0ZwUUlZb01GcERXVHB1RDFMZGRFckg1YnBN?=
 =?utf-8?B?YzdUSWoxMzIwRldQSEYvbnhXM0pzUnNTR05qRGVqc3psSk1LYmlWc0R3U1lm?=
 =?utf-8?B?OVhlSEJmSkZVT1JLUDBKUVhDcENSOUxqekdqTXAvS2lBOWd5Y2VDZGMyRXcr?=
 =?utf-8?B?MklTVzJzenoyMkxtYXFEYkt0Y3dxUG5EWFFaVHhRWXJ5NUdIcm5MZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96eb734b-32df-4640-8cf3-08dec5696e66
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 14:22:55.0090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7xcXHlUblx24ULDZmG8nsLfRZIVBFcZgNgL5A39yXMfZHyoT+D6u57eUlXroaWwJpcFni/RjT97EutDEVV9AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7361
X-purgate-ID: tlsNG-d62444/1780928580-B6342FF4-CF305AB7/0/0
X-purgate-type: clean
X-purgate-size: 1063
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,macbook.local:mid];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C363657214

On Wed, Jun 03, 2026 at 02:05:48PM +0100, Frediano Ziglio wrote:
> From: Frediano Ziglio <frediano.ziglio@citrix.com>
> 
> Small optimization.
> There's no much sense to split the header in 2 pieces, it will
> just take more time and space to reassemble them in the final
> buffer.
> This also avoids truncating combined_length to 32 bit in case of
> 64 bit machines potentially avoiding following record_length check

I'm not sure I understand the sentence above: rec->length is a fixed
width type uint32_t, and hence it will always be 32bit, regardless of
whether it's build in 32 or 64 bit modes.

I do get the truncation part, and that using size_t is indeed better.

> (it could still be truncated writing it in xc_sr_rhdr structure
> but the following check will catch it).
> The function become more coherent with following read_record
> function.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

With the commit message possibly clarified.

Thanks, Roger.

