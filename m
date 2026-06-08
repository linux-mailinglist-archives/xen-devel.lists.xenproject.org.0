Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zt8IFJXkJmolmgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 17:49:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ABD65853D
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 17:49:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=KnDbnYQP;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1331978.1594618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWcE1-0002Of-JZ; Mon, 08 Jun 2026 15:49:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331978.1594618; Mon, 08 Jun 2026 15:49:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWcE1-0002Ls-Gq; Mon, 08 Jun 2026 15:49:17 +0000
Received: by outflank-mailman (input) for mailman id 1331978;
 Mon, 08 Jun 2026 15:49:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wWcE0-0002Ko-7I
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 15:49:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWcDz-00DPxp-78
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 17:49:15 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a26e46a-2eae-0a2a0a5409dd-0a2a4502a0d4-24
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 17:49:15 +0200
Received: from [40.93.194.18]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a26e476-af86-0a2a45020019-285dc2121dde-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 17:49:11 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV0PR03MB989297.namprd03.prod.outlook.com (2603:10b6:408:398::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 15:49:08 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 15:49:08 +0000
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
 b=fxxx5ScZdNsmFzaRTEsJYmBEX7GEJvKuQDcxcdItm74+PnrvF0srAH0eWewnEn4Bc0ABBmtzpeLCJlZE9avG07jHkzu+1L8IOVxBkfCWDuVxsbgPWmX9e4+lFXiYR4ojtCNxHkUn6k3l1acTJLzzixj6RMi9ZsRcnJ+YAuMWiF2ecuPCjaJiCsPW5gqb4PxfZPQ1uGmLE2N6AcDEDSTUrwijmN7ztk2ghbrTMZPemmWp04oyxLKaxWoVpKh1Th1vYOqGyTpBj8XYNdmRPrZEs08hfzC3C68EYpyIBjulizzxQFtpnDSTbpepx8JbAKOENZR64nSi+rAqg3URPrTrjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXEUH6DhDRlMQFxC3n4/ns1ohebv+I7XvDIajM+HBck=;
 b=L9qSq3U7vlAVNZm2x5bp4FrCacSjSw8TXzKJ0aHEawdiwA6W9dcUT2HNIB+mdIfGBCmGCXuFk4+uq0dZ02A7id/dLs8qqmOoX0CO6y5m6JuP46mU7n8Is3jVtNA0e9vcsjDIaJx7SO+uYHhYPsetgkRhlTuRQGsGBD4+n+3RBrC881/+nyZvNDsmo5hs6dpNx0k8qBW8XPcswsbr2GZO0UFNWedO+uvDsYyAggNZeWsKaEpYWL1hiJBqBHMs+bzH4sMyFqMMXgVQhCduF4aIteJRvQmgSSLX0KmpTt6BWVX9GUOpL0Xc5pdG6ptQZ0gem95Idwnz+79riW64HQQBxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXEUH6DhDRlMQFxC3n4/ns1ohebv+I7XvDIajM+HBck=;
 b=KnDbnYQP8tEgVOZbB3edbiklh2jVvstxfVFJxOuDnEQw/Q6+ICIymdVwOuQsL6YwGKbYrbltZIu7pYuvmKIINE77/+rr541SgER6QnR99d61OH322BqWurkcOVhIEGXfhKQS8AoIVZWf6UON+atT0Tq1/ZfutL+Wzb1ABhSjygs=
Date: Mon, 8 Jun 2026 17:49:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Edwin =?utf-8?B?VMO2csO2aw==?= <edwin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v4 05/16] libs/guest: allocate various migration arrays
 just once
Message-ID: <aibkcDCjyeK_0lMK@macbook.local>
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
 <20260603130603.776452-6-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603130603.776452-6-frediano.ziglio@cloud.com>
X-ClientProxiedBy: MR1P264CA0011.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV0PR03MB989297:EE_
X-MS-Office365-Filtering-Correlation-Id: db9fdb4c-b54b-4f2b-644e-08dec57579be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|11063799006|5023799004|4143699003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	e2lF+lZ0O5jRoBJYH96FewOtbxUTqY5rphYmjwR9Jh4Qf3fbQimttVRZTaP+FjEU63arUjUpDVB3w3u05vvgchQ+6BMYgsYHjal1MZuXi2w/ji69CaeoKCdwMakV020KYs9OJPNvHzaR3mS9RGWxkgeJOc7SyfQi2JMdRJPqFLugXc9sUBucgQI1PAXO4h5IG4mBIqG1ltuziE07+81qrgJyIZZNI3k44pVBZSCyBr+tSZlicg6ecdMU2TjPLfnecGRJWp7zjSEJ793TW5Xc7F79ftIM1hKdxo7+QexqklmEDd8/XUUb7qDQf7cyJd9bTecx8Nzs1mV1nXPivIytMkrAIRjy1nMuHL2k/F1LEKNs0Bd/uG85UDhRPOE9RB3wRNXvfsT4yR/PsDOGqAvynaCrUYHQ4u5nZf2C0r8xyaEUSvtABIJiBL4dQX4RZb5z131voAVfoSNcbScbxJodjNR6VjYsGPsN+uU13NmLbRPZiRV/mfm5TqCBJ8TB3lTbt6TG7tGn4a1Fp+yz8e54WcfqW7skgM2bpvr5gvDlJdgQ3MSxt02EtULfD74lIN5wdYXOMOdSXAQrriblEmDpdkYuDCXkP3NLjrPoutxIbbE6QcKhv58EBrMZXKtK5Y/YB4Bc+8TSV81mHzb9mFh9VkULymjIfxwBHgoVOtPT9UULYRBvAcxj+SeWx2PNyt8eDhSkmpcjNSNDI3o+pcXyzA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(11063799006)(5023799004)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THlEMEpwNjlYWk1xUGdBZjM0MmxMejV6TEtWdTdNUWswcmdLbjlLM25zSUFY?=
 =?utf-8?B?U1VsREwyS3paQzdmdE5oU1BXWk8za2lBUjJjM3loaFhheUVXWHZXWldITFhK?=
 =?utf-8?B?K2ozTlFrcm1UM3FPTzMrSkxOejBtclFKT0pFT0ovOXVKRU1QVENlOUNIemFt?=
 =?utf-8?B?Q0lpTFcwSkRXM1lkeDlMenRRdHE2SXNJOE5sdXNXNUtJb1labFpZaXlyQWJO?=
 =?utf-8?B?U2JQM3JFUzI4bjVPMER4N0t5Mkh4MVIxREZJVVorK0h1USttOE5rdHc1M0h3?=
 =?utf-8?B?VWxReW1PS2tTTjV4ZG9JU1hIN0lTVGR5Z3NyUTRlUWtzSWNQTDBmcDQ0TU45?=
 =?utf-8?B?cFZ0Wi9QNEhsNWorSGcxOW8vdEk3LzVJcmxtSzJKUTdkQlluRlI5T2dHblln?=
 =?utf-8?B?ZXpkMnBGcWo2dlF4MXRNNSs4NGdHTEVsc1NYZWRpVXgxWk9LVVBuNlBvWFFQ?=
 =?utf-8?B?MlMzQlVOMk9XNWVsZmR6UWRJNmsyRWQrRUxLd3poYTBUaURyRDJFUlN5aUo3?=
 =?utf-8?B?Ykt0aHFGU1hhTjVBN0xBSHVma1QveVEyekRVOU0zTDNzZTBCd3NjcE9CSVIy?=
 =?utf-8?B?RnlhMkNpU3oxRjI3Y0tCUmE1Um9wTEppS3dDWmlFZENodnpicHJOQnlyN2VZ?=
 =?utf-8?B?QzFMS0VWTHpSS3l1WlJFYTRMUnJ1VXY0RGRyVVdxTy9jSjZoc0xBOTBzYnlU?=
 =?utf-8?B?KzQvK1F6eDRwSUVsNlJwZjZtVkVzVkEzM2dWazBDbU5CL0VKT3R0NzI5TnJm?=
 =?utf-8?B?ZTBsMjRBTGFPeDdKcHd5Vy83eWhEUTVlbkY3STBLM2xrdGdRdlJpQ0lwNVFE?=
 =?utf-8?B?akxtTllqMG9FbzlycXJFVk1GeEk0MTY2S0Yvb2NRTW1XNlJkdVhhenVLRU5E?=
 =?utf-8?B?c0ZuSU1iamYrWWpnQ3FZOW5lZFZEUDZiN011UmdwSEw0Nkk5bmhLdVdlWHZT?=
 =?utf-8?B?dVlmczN5SDIyNDdFbFFFa1kwVWFBNVV0dDFWQ055eEMzQWd3V0VrR01MUWtL?=
 =?utf-8?B?T244WEFaM1BiaENlc0pUQnZRYzJLODlGeCsrR1RHcmNpQXpITUhwaHYxYkNz?=
 =?utf-8?B?QjRGYjVBTEdRYk5RTWlya3NvYndVd0U3WHN3SVhaQXBwSlNOK0p4c3AwcG9W?=
 =?utf-8?B?VHVsbGkydE45b0FSZUxRdFBVY002b1lJZlpOVzkvdS9nem5XRW5WdHZHWGNL?=
 =?utf-8?B?eEhzbVM5VmNoRlFWZFlHOHl6SnRzeURDenRkZkIrM1phMEplZ0NXVC9ZamRD?=
 =?utf-8?B?cGVoY3RuaVo2SmJxRXBNSzhMWDdBT0Zwa0VyZHltOTQ2eHkrSS9paCsyZUFo?=
 =?utf-8?B?ZVBaY0RNUVNoaWNDV3AyYTZUVG1TZ2dqQlB1bG9pejZpcDlBbU84WlRvbDd1?=
 =?utf-8?B?UjNMNkVraHV1Mi93d2s3SzUwaDd3ZGRlNk9kTXQ5NXMxc25ZTVpWeXJ0eVAr?=
 =?utf-8?B?bFV3ekNnUE5TekhTcmkvWjNQbnhRL2JudkNJWDlpYTdxU3JmYUw2c1FuUHJk?=
 =?utf-8?B?S3VYM0o2WjdXQ2xlTE94WHo5ZGpnYjk2MVFKaXFKRkFsTzdPZklrTUVOYUpM?=
 =?utf-8?B?WFFKVnVJcFFEM2FuTC9hM3ZQUjJZdmxXNERNVVJzcUlmLzJWbnhqeVZoWmRn?=
 =?utf-8?B?NnpuVjY4WXJtMDhma0E0cEo1bVpSRFgrMlFMdjVIRVRyZHVvSHhrOXlIcFNU?=
 =?utf-8?B?S3dzOWtaU0RhcENxS3RPcHROdDk0UWkvZzF5dUY2c0pnTWFvUjA2Y2Y1TWw0?=
 =?utf-8?B?WGtBYkd4TUU5RFNZTmM4Qk9yN2tuSXhnL0VCbURlOTIxK0FWU1NHSUk4UnE1?=
 =?utf-8?B?VHkzOVNlajhlNDhqalYvejNoZmFFaW8xeVZWRFBNWDd4KzNvVjRWSUg5QnpQ?=
 =?utf-8?B?TjVvVlBiTlNITWRiVWZYN2lIczB3Y05sc3FEK2ZuK2xoR3N1RDQ4OXBCc3J3?=
 =?utf-8?B?VmUxb3duY2pBMjR5MitwU3ppSzBYclRtcUlUZEZQQU90SnM4bGFnRWo0U3VP?=
 =?utf-8?B?TUhhSUgzcTg2ZjY5VTRTaGlkVUNtM21haVc0OW5lejJqZXBjdkhXeGNPSVYx?=
 =?utf-8?B?L1hVQ2oxRy9NSFpuUWo4ejNGOXVQTi90akFMSk5vc3ZLOFJtWkFEaWhmVGFJ?=
 =?utf-8?B?YWtDbEZJcG1Wbmt3a2d0cWRzbXRNYlNUTXh2N0UxbHZUZnJhRHBYVk9SRlRR?=
 =?utf-8?B?VCtEaHViN01ScDd0djQvOEpiYkI0VUg5UmExaG1MR2lsNUlDWXVBUk9HR0s1?=
 =?utf-8?B?em9SdkZqZnBaQzIxQ0laQjUrRlZDdXZLL1FxWXN1M0dhUktLWWV6UFJZZ0NV?=
 =?utf-8?B?Q0oxWXhsQ3RXSy9iMERJUE50RDVyVm04S0dYMGZjTU9zZFRzVkFjQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db9fdb4c-b54b-4f2b-644e-08dec57579be
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 15:49:08.0363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xvYW3jU4v7dkhsz/IFp5yt+JNWD4lGwEIJ/ooJBU4hjEUbu5pC/VB1eZ6+7ZHggAGFZkjEvpVzOaoVEecoydbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR03MB989297
X-purgate-ID: tlsNG-720697/1780933751-AB563161-8D99E744/0/0
X-purgate-type: clean
X-purgate-size: 6281
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
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 83ABD65853D

On Wed, Jun 03, 2026 at 02:05:52PM +0100, Frediano Ziglio wrote:
> From: Edwin Török <edwin.torok@citrix.com>
> 
> Allocate these array just once at the start of migration,
> using the maximum batch size, and free them at the end.
> 
> Signed-off-by: Edwin Török <edwin.torok@citrix.com>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>

Jan made a comment about this patch (and how it related to a still
pending patch of his):

https://lore.kernel.org/xen-devel/e3f22fa6-c497-4afc-9498-12449548acfd@suse.com/

That is still unresolved AFAICT.

> --
> Changes since v2:
> - change prefix in subject.
> 
> Changes since v3:
> - fix comment style
> ---
>  tools/libs/guest/xg_sr_common.h | 13 +++++++
>  tools/libs/guest/xg_sr_save.c   | 66 +++++++++++++--------------------
>  2 files changed, 39 insertions(+), 40 deletions(-)
> 
> diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
> index f1573aefcb..82549b5589 100644
> --- a/tools/libs/guest/xg_sr_common.h
> +++ b/tools/libs/guest/xg_sr_common.h
> @@ -209,6 +209,18 @@ static inline int update_blob(struct xc_sr_blob *blob,
>      return 0;
>  }
>  
> +struct xc_sr_context_save_buffers
> +{
> +    xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
> +    xen_pfn_t mfns[MAX_BATCH_SIZE];
> +    xen_pfn_t types[MAX_BATCH_SIZE];
> +    int errors[MAX_BATCH_SIZE];

FWIW: I would possibly place errors at the end of the structure.  It
seems more natural and is the only array that has 4 byte alignment
instead of 8 (on 64bits at least).

> +    void *guest_data[MAX_BATCH_SIZE];
> +    void *local_pages[MAX_BATCH_SIZE];
> +    struct iovec iov[MAX_BATCH_SIZE + 2]; /* Headers + data. */
> +    uint64_t rec_pfns[MAX_BATCH_SIZE];
> +};
> +
>  struct xc_sr_context
>  {
>      xc_interface *xch;
> @@ -244,6 +256,7 @@ struct xc_sr_context
>              unsigned long *deferred_pages;
>              unsigned long nr_deferred_pages;
>              xc_hypercall_buffer_t dirty_bitmap_hbuf;
> +            struct xc_sr_context_save_buffers *buffers;
>          } save;
>  
>          struct /* Restore data. */
> diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
> index 8c4e760f8d..7d8055a3f9 100644
> --- a/tools/libs/guest/xg_sr_save.c
> +++ b/tools/libs/guest/xg_sr_save.c
> @@ -86,16 +86,16 @@ static int write_checkpoint_record(struct xc_sr_context *ctx)
>  static int write_batch(struct xc_sr_context *ctx)
>  {
>      xc_interface *xch = ctx->xch;
> -    xen_pfn_t *mfns = NULL, *types = NULL;
> +    xen_pfn_t *mfns, *types;
>      void *guest_mapping = NULL;
> -    void **guest_data = NULL;
> -    void **local_pages = NULL;
> -    int *errors = NULL, rc = -1;
> +    void **guest_data;
> +    void **local_pages;
> +    int *errors, rc = -1;
>      unsigned int i, p, nr_pages = 0, nr_pages_mapped = 0;
>      unsigned int nr_pfns = ctx->save.nr_batch_pfns;
>      void *page, *orig_page;
> -    uint64_t *rec_pfns = NULL;
> -    struct iovec *iov = NULL; int iovcnt = 0;
> +    uint64_t *rec_pfns;
> +    struct iovec *iov; int iovcnt = 0;
>      struct {
>          struct xc_sr_rhdr rec;
>          struct xc_sr_rec_page_data_header page_data;
> @@ -105,26 +105,24 @@ static int write_batch(struct xc_sr_context *ctx)
>      };
>  
>      assert(nr_pfns != 0);
> +    assert(nr_pfns <= MAX_BATCH_SIZE);
> +    assert(ctx->save.buffers);
>  
>      /* Mfns of the batch pfns. */
> -    mfns = malloc(nr_pfns * sizeof(*mfns));
> +    mfns = ctx->save.buffers->mfns;
>      /* Types of the batch pfns. */
> -    types = malloc(nr_pfns * sizeof(*types));
> +    types = ctx->save.buffers->types;
>      /* Errors from attempting to map the gfns. */
> -    errors = malloc(nr_pfns * sizeof(*errors));
> +    errors = ctx->save.buffers->errors;
>      /* Pointers to page data to send.  Mapped gfns or local allocations. */
> -    guest_data = calloc(nr_pfns, sizeof(*guest_data));
> +    guest_data = ctx->save.buffers->guest_data;
> +    memset(guest_data, 0, sizeof(*guest_data) * nr_pfns);
>      /* Pointers to locally allocated pages.  Need freeing. */
> -    local_pages = calloc(nr_pfns, sizeof(*local_pages));
> +    local_pages = ctx->save.buffers->local_pages;
> +    memset(local_pages, 0, sizeof(*local_pages) * nr_pfns);

See below - I think it's possible to avoid the memset() and keep the
same guarantees.

>      /* iovec[] for writev(). */
> -    iov = malloc((nr_pfns + 2) * sizeof(*iov));
> -
> -    if ( !mfns || !types || !errors || !guest_data || !local_pages || !iov )
> -    {
> -        ERROR("Unable to allocate arrays for a batch of %u pages",
> -              nr_pfns);
> -        goto err;
> -    }
> +    iov = ctx->save.buffers->iov;
> +    rec_pfns = ctx->save.buffers->rec_pfns;
>  
>      for ( i = 0; i < nr_pfns; ++i )
>      {
> @@ -210,14 +208,6 @@ static int write_batch(struct xc_sr_context *ctx)
>          }
>      }
>  
> -    rec_pfns = malloc(nr_pfns * sizeof(*rec_pfns));
> -    if ( !rec_pfns )
> -    {
> -        ERROR("Unable to allocate %zu bytes of memory for page data pfn list",
> -              nr_pfns * sizeof(*rec_pfns));
> -        goto err;
> -    }
> -
>      hdrs.rec.length = sizeof(hdrs.page_data);
>      hdrs.rec.length += nr_pfns * sizeof(*rec_pfns);
>      hdrs.rec.length += nr_pages * PAGE_SIZE;
> @@ -267,17 +257,13 @@ static int write_batch(struct xc_sr_context *ctx)
>      rc = ctx->save.nr_batch_pfns = 0;
>  
>   err:
> -    free(rec_pfns);
>      if ( guest_mapping )
>          xenforeignmemory_unmap(xch->fmem, guest_mapping, nr_pages_mapped);
>      for ( i = 0; local_pages && i < nr_pfns; ++i )
> +    {
>          free(local_pages[i]);
> -    free(iov);
> -    free(local_pages);
> -    free(guest_data);
> -    free(errors);
> -    free(types);
> -    free(mfns);
> +        local_pages[i] = NULL;

If you are doing this cleanup here, you could also do guest_data[i] =
NULL and avoid the memset, since at the start of each write_batch()
the arrays will already be zeroed (either because they are allocated
with calloc() on the first call, and always cleaned up in
write_batch() after usage.

Thanks, Roger.

