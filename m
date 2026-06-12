Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8DlmGdIILGosKAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 15:25:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 966F6679C62
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 15:25:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=FvPBcCnO;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1336693.1598486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY1s6-0004Pf-Cr; Fri, 12 Jun 2026 13:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336693.1598486; Fri, 12 Jun 2026 13:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY1s6-0004O7-9M; Fri, 12 Jun 2026 13:24:30 +0000
Received: by outflank-mailman (input) for mailman id 1336693;
 Fri, 12 Jun 2026 13:24:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wY1s3-0004O1-UY
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 13:24:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wY1s3-00A1wp-4E
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 15:24:27 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2c0889-e002-0a2a0a5209dd-0a2a4506bf02-8
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 15:24:27 +0200
Received: from [52.101.62.12]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2c0889-7371-0a2a45060019-34653e0c1de3-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 15:24:26 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BN8PR03MB4915.namprd03.prod.outlook.com (2603:10b6:408:dc::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Fri, 12 Jun
 2026 13:24:22 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.014; Fri, 12 Jun 2026
 13:24:22 +0000
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
 b=W5fuodkZ7YPxAZDUPLyLsf0F16U32GYxceMtXlYsUbSNofHFWe3tRlH9enJplpDLktM2yOiYP8JXX7/2cAYuLpNPopJ4AaGZdtlQLlYY9V7dcu0rFG9zTauP9g1mJs++/XwHb5F97YrAAarQfour/fTVtemPa0KBbPrzpdMlGXOvoesN1xEZWBJQQAp7A0Yj8oZWEQkRz1OJbd/jnG5Nt4n/+YMNALTpHQvaYj5jNvs3giB1pW/CSvU2bkJnzt3h6HSazY8t63Axi+JmXydW5h6yN74Q4qbSmbdE4SjFlbM8rzCtvJRQgHqs1fMCVXe2LdUjblQRfItfczJssu5STA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAAMqwDqSnXiIlcE4/coKSBG4igSentjqk2NxYz9C6A=;
 b=kHC0Zm/0BsRI8Us2gQoQRrphIevxwL5GKwJUest/QZmn8mnaFi5iasYBwFZVm4+U7SitgQUnj+soJ0CxKx5AKgibWDiZiOaJwT5xxp/BP1wCJeLc7zAMCKfsb+nKWUTxy6JAboPVtaFD6xBLqhw0AtpOxsc5ITN64UmTzgHOCGRoCgN16431RDHwf+7Mm/wD2tGj5iP+UPUE9cuvBIXd4eYLZoXpReXBX/FIevIsr/FGqE1XYQ1dH1h2VdAPu1KDR2KBLOmcoepWw0dXxx7MbmOU9OgzUfv5YMT+RYKd9l+/aJDdLO4zkZxAHM/wxXN7vG+Ea+QM3ge7aA8fPkdZiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAAMqwDqSnXiIlcE4/coKSBG4igSentjqk2NxYz9C6A=;
 b=FvPBcCnOQExFkVEmJ/05Nz+ti8aEDF2mQp6jKQVNJ+5lkOj5I9oemZevL3Z8u7iF7wCB7MtRa9WH5y20h4Y5IPVeDvnQll64wNY/EnaEdckZU7nQF/TH8A49m+0zjaNLvdmVyowId2G8WA3sIyAls65hglSwLoFFLUmSVPxkrnE=
Date: Fri, 12 Jun 2026 15:24:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Alexey Gerasimenko <x1917x@gmail.com>
Subject: Re: [PATCH 02/17] libacpi: new DSDT ACPI table for Q35
Message-ID: <aiwIgrerH933SPbC@macbook.local>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-3-thierry.escande@vates.tech>
 <afCJTdlBPPyWEejk@macbook.local>
 <1781258461.8631fc262581453bbf619ec5b2062170.19ebb4721b0000701b@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1781258461.8631fc262581453bbf619ec5b2062170.19ebb4721b0000701b@vates.tech>
X-ClientProxiedBy: MA4P292CA0009.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BN8PR03MB4915:EE_
X-MS-Office365-Filtering-Correlation-Id: c6060590-6028-46d1-7419-08dec885ea38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|4143699003|6133799003|3023799007|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tfqb7IT6KC3DmwIwyrO6f7uEal5J/MSU63psL4iUYSMtk91CkfQJn8K339uiUzatoga8wffuOUbRHW08TWzte6faxOuV5mDHCG7Y9xhiqcqfgTRiLJEjSz6irLmRV7MzMj+Mxx83Rzn6xpuTVP0xhHQXcv9sI0htKH9nCQvVdfDoTnpfqxpEyuEYHIURDHh2g/FYdML+8fG1TFijDCKbmT5BpUxPXTX1UJAsaT2hCXE5CEdKXe2+URMpGna7F3i1O5OP7tarU3bmvxb9I9isj4HhCzglFE+GoIZeROvHYzsB/vMgjJqHsDr92o+wrs1VQZpZSkKexsrwHE42wSDTypMh0Kiy50kqnDg8JJH1sxUdh9KmiTfluXUw3byzeSBOSHLaqD70aM1Q4CcKGmXaBYAl6EJ3uTj8+lVUogkZ2HTJnlrXUNdGA6V+EsPgPr0bnMvsPb5VKdEppxtzlDesmrprG3lZzEj4FEIohDF/zF+siYsGnXRjvdETk8bKjsaAKGFup5BqBTcpe7zDnyblQxdDeGJObD8cVBLW9cywHACEEaPvidtVTORBbaHrKFOAMHiamT3BGzm5wAsToz/jnXMUtmWwwWrgZ36m6vQD32ILeO3eKDLUB9KghmtnIbZtOUqWiRQkH2V3Vq9bhJoZZ7kaXfCKvDTi4LcBiQQUIHKJ36KsDj+yMXSKyUmUYst0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(4143699003)(6133799003)(3023799007)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVdScDQ0ZXE5ZlJ0WEpGVFV0dmptZmRwNzZJdjU3ZmlkYVZ4R1lyMTZxdGgx?=
 =?utf-8?B?MUxMSyt5MTZzTWpmMUhMZVlSWEswZ244Vy9vYUdPMFNXUnVKSEFYTFR2cWc5?=
 =?utf-8?B?VHhsdSs1Y25vQ3RmVFZqd0l4dHYvRXhBaHRFcEdXbFkxYlFkM3haNjhYUWN4?=
 =?utf-8?B?Nmx6ekhTc3FUTEdud1ozajJLbUNLRURKVUVkRTB0NktuakM4TTI5VVVJTmIx?=
 =?utf-8?B?Q1FxZzI2ZkJidVBFd1RibHEzTnlnbjJxYXNGWjR4ckFZTy9LbFJjUjU4djF5?=
 =?utf-8?B?K0VkaGxnQjJ0QjM2ZlBObG9QTEp3YVJnSlNMTHk1MG8zN2YwQXVyV0hRVWEv?=
 =?utf-8?B?Z3VpUVo3TkJ5aURzc3dlWGlhT1kvT2xNdTViOEJ0YXROd3NMSTJUWnlZR3NW?=
 =?utf-8?B?QkwwYzJtSkErRHR1eVpoZ3dzajF2NjRjb2U5TXhqRyszclIrS3hsQW5LZzQ1?=
 =?utf-8?B?VEtBRXlhZmdiUlpNWW5oaktwTFZYV01MNEVaL1pOS2I5RHVOa0JXSWpsZ0c5?=
 =?utf-8?B?eThLeTFuQ3BzWWVPQ0dJanFkc2grQ3d2dlNQejc4b0t1YVhHbE9sUDlHTW9r?=
 =?utf-8?B?V21hZTdyWjNKdVhxczdVNDVCWFhOMWVTSUxNN0J4aXN2ZEtHTGoxMm9DTUFY?=
 =?utf-8?B?d1RHOWVmaGhmK0FqUmFjUjhOcThIMzRxeXhWUUhVa0F1cVMxS3hOczFUVzlR?=
 =?utf-8?B?eEhPUzRpSndVWmZ4ZWJIa3pwOWIwdEFaNFppWVZIQU1sNkZNbHVVUy9adktt?=
 =?utf-8?B?VHRCTUI5TmFiRnlxRGkyS1lnTHFGVnJrcXR3ZHUyMC8yMXFOeUtjOWRxSkRT?=
 =?utf-8?B?dGJieGJjSzArcnA1WW4vNjZ5NTlhZ21YYXBUL2lKamZUSXF2SGh6VTVpN1o5?=
 =?utf-8?B?eGM5dzdhOFpIQ0dpeENTRFRSUFpJTTJtbzR0b2hLaUhXcnYxRDV5UUdxYk9y?=
 =?utf-8?B?NG4zQ0VSRktsYWVObEo2UVlnUytPTld5NWpJcHBMUEczemZOaGFjMEcrV1VE?=
 =?utf-8?B?b0pKUTJ6aUJ4WkRlQ3d5NStaY1ZzVW1aQTBHQ3kxRzR0M21xbnYweko4cHNL?=
 =?utf-8?B?UUhJc1BZVlowSHZuRVlJNjFya2ZITllWR1o0c0p5ckZVWTJZUUdFamFRZWxn?=
 =?utf-8?B?QWdlV2QvRXVNS1dzK0tlTDlFWHJURFJUK2hmMGIxNVRyYmZrYlhXblVLVWV0?=
 =?utf-8?B?MVJZRzVZZlR2NGI4ODBSS0tnaDd0M0xvNnY3VDJJS1lHUFlwTkZmVUM5dHBI?=
 =?utf-8?B?UDlraUYrbFVqaGduc0ZIYWYrb2hOUDEyT3hUelhaa2sxSUVGY09uVEd4M3lQ?=
 =?utf-8?B?T05lTVVhNDFsZ2UxNS9wMHJ0RldlMnA2RE1FMmszd0h5c3JsMjF1N0ZLZ1lB?=
 =?utf-8?B?bm42aVFEWXRoLy90ZDV4eHhOeWFieEU5cFVmSUFlN1gxeUNMSEVqeTloMDhQ?=
 =?utf-8?B?dVpWN0NpekJCQjdpS1dBUjVXZnhnMnB3dUgyMkRsRXRWYU1udy90S0syRUl5?=
 =?utf-8?B?QnpKcWhuVEQwLzIxSncvdHIwZ0NqT1pJVTF4MllQaE10TVowZHdON09jN3E5?=
 =?utf-8?B?VnA3T05qeDk4KzFBVCtLVlRxQUNRRWIxQ2xzLytoUDdWOC9JUG5HSTg4ZWZr?=
 =?utf-8?B?ZUFqbStkdWYrQnJKcFFBRGRleitYbGxCanFPVnI1VEJMdFhBazZsVWF4ZzF5?=
 =?utf-8?B?aUMxQ2tjUmxhMEhKYlZSSFo5ZlNjN0lrZlNzWTNKazdiazJ4bCtqMnB3aGZS?=
 =?utf-8?B?VGpUQkFaK1htRGpudENEM2kvOGtpa2Z4TEhKUzEvREMxb0FGc1VpWWFVcmZo?=
 =?utf-8?B?a2RycVlDeWQ0b2VvVlArelVibU81WmJsa1BSdmdFZjh2NmNQUWUyck5XSzNV?=
 =?utf-8?B?ZW14UTduRTlCNGJVRkc2d2JsSnBqMXF1Q2pmcEhNd2owZjFYUHBPeEw0T0F1?=
 =?utf-8?B?UTl2QkNUd0tVcnNiV1VqamxSQ3grMVduMzVsU2k4ZFJDZjBnZUY1VEs5a2Nu?=
 =?utf-8?B?ZVpYS24vdlBFenc0RlJuZlFCRUdBdi80cklYYUM0RkVxWlU1UHRtQ2Jpb0FZ?=
 =?utf-8?B?TlJjVnoxRk85MGsyQlllZ2cva0VBd3M2OVU1VUZNdytRc2FsS0lYSStHTk43?=
 =?utf-8?B?Z1MyaVBsMDBqaXdQK1RadFNtbkdqdVV4MFI3cjZFSlptTGxzVTV3Vjl3TGU3?=
 =?utf-8?B?MkVKcmR0ZGF5SXBSZWMxcmpmYmJOZmxDNVpsSTdaMFdWYS9DVWhNSlhWR1pG?=
 =?utf-8?B?OTJjZ3VaSFp4Z1FPUzBFTG5HaHk1RS9JQThORkRwUkZjcjF2TXA5M1Z6b2Rm?=
 =?utf-8?B?T1c0dnk3TUZoV3JMR0ZpblVUS2VxUEFTQ2NTUVM3cC90Y0FuNlBTUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6060590-6028-46d1-7419-08dec885ea38
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 13:24:22.1282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wsCW7881iXKkzQKtONYJd4P0gsrOfzkI/rMHXj+8k11sLl0tmaU3MzXJWagrOAqYWfYZqC5TU25Oi4kuZ8Od9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4915
X-purgate-ID: tlsNG-16d1c6/1781270666-85B6DD75-E755DFA7/0/0
X-purgate-type: clean
X-purgate-size: 7214
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[lists.xenproject.org,suse.com,citrix.com,vates.tech,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 966F6679C62

On Fri, Jun 12, 2026 at 12:01:00PM +0200, Thierry Escande wrote:
> 
> On 4/28/26 12:17, Roger Pau Monné wrote:
> > On Fri, Mar 13, 2026 at 04:35:01PM +0000, Thierry Escande wrote:
> >> This patch adds the DSDT table for Q35 (new tools/libacpi/dsdt_q35.asl
> >> file). It only contains the specific Q35 parts that differ from i440).
> >> At the moment, these are:
> >>
> >> - BDF location of LPC Controller
> >> - Minor changes related to FDC detection
> >> - Addition of _OSC method to inform OSPM about PCIe features supported
> >>
> >> As we are still using 4 PCI router links and their corresponding
> >> device/register addresses are same (offset 0x60), no need to change PCI
> >> routing descriptions.
> >>
> >> Note that '15cpu' ACPI tables are only applicable to qemu-traditional
> >> (which have no support for Q35), so we need to use 'anycpu' version only.
> > 
> > Is the above statement fully accurate?  It seems like 15cpu tables are
> > used with rombios, so the dependency is not on qemu-trad, but rather
> > rombios?
> > 
> > If it's truly only dependent on qemu-trad then we should remove those,
> > as we have removed qemu-trad.
> 
> You're right, the dependency is on Rombios. And I though Rombios was
> only used for qemu-trad, my bad. So it implies to use Seabios or OVMF to
> have Q35 support. Is it something acceptable?

IIRC XenServer still uses RomBIOS with upstream QEMU, for
compatibility purposes.  I'm fine with just adding Q35 support with
SeaBIOS and OVMF, it seems justified to request a newer firmware if
you want to use a newer chipset.

> > 
> >>
> >> Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>
> > 
> > If the first SoB if from Alexey, the From: should also match.
> 
> Ok, I'll change authorship or signed-off order depending on how close it
> is from the original patch.

I'm not an expert, but I think as long as it's based on a patch from
Alexey you need to keep is SoB first.

> > 
> >> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
> >> ---
> >>  tools/firmware/hvmloader/Makefile |   2 +-
> >>  tools/libacpi/Makefile            |   2 +-
> >>  tools/libacpi/dsdt.asl            |   3 +
> >>  tools/libacpi/dsdt_q35.asl        | 130 ++++++++++++++++++++++++++++++
> >>  4 files changed, 135 insertions(+), 2 deletions(-)
> >>  create mode 100644 tools/libacpi/dsdt_q35.asl
> >>
> >> diff --git a/tools/firmware/hvmloader/Makefile b/tools/firmware/hvmloader/Makefile
> >> index bdc33a877f..99f045efaa 100644
> >> --- a/tools/firmware/hvmloader/Makefile
> >> +++ b/tools/firmware/hvmloader/Makefile
> >> @@ -78,7 +78,7 @@ rombios.o: roms.inc
> >>  smbios.o: CFLAGS += -D__SMBIOS_DATE__="\"$(SMBIOS_REL_DATE)\""
> >>  
> >>  ACPI_PATH = ../../libacpi
> >> -DSDT_FILES += dsdt_i440_anycpu_qemu_xen.c
> >> +DSDT_FILES += dsdt_i440_anycpu_qemu_xen.c dsdt_q35_anycpu_qemu_xen.c
> >>  ACPI_OBJS = $(patsubst %.c,%.o,$(DSDT_FILES)) build.o static_tables.o
> >>  $(ACPI_OBJS): CFLAGS += -iquote . -DLIBACPI_STDUTILS=\"$(CURDIR)/util.h\"
> >>  CFLAGS += -I$(ACPI_PATH)
> >> diff --git a/tools/libacpi/Makefile b/tools/libacpi/Makefile
> >> index d3d4bc9543..e6c4a3fd8b 100644
> >> --- a/tools/libacpi/Makefile
> >> +++ b/tools/libacpi/Makefile
> >> @@ -11,7 +11,7 @@ endif
> >>  
> >>  MK_DSDT = $(ACPI_BUILD_DIR)/mk_dsdt
> >>  
> >> -C_SRC-$(CONFIG_X86) = dsdt_anycpu.c dsdt_15cpu.c dsdt_i440_anycpu_qemu_xen.c dsdt_pvh.c
> >> +C_SRC-$(CONFIG_X86) = dsdt_anycpu.c dsdt_15cpu.c dsdt_i440_anycpu_qemu_xen.c dsdt_q35_anycpu_qemu_xen.c dsdt_pvh.c
> >>  C_SRC-$(CONFIG_ARM_64) = dsdt_anycpu_arm.c
> >>  DSDT_FILES ?= $(C_SRC-y)
> >>  C_SRC = $(addprefix $(ACPI_BUILD_DIR)/, $(DSDT_FILES))
> >> diff --git a/tools/libacpi/dsdt.asl b/tools/libacpi/dsdt.asl
> >> index 130826fdcc..dc764881c9 100644
> >> --- a/tools/libacpi/dsdt.asl
> >> +++ b/tools/libacpi/dsdt.asl
> >> @@ -201,6 +201,9 @@
> >>                  #ifdef MACHINE_TYPE_I440
> >>                      Name (_ADR, 0x00010000) /* device 1, fn 0 */
> >>                  #endif
> >> +                #ifdef MACHINE_TYPE_Q35
> >> +                    Name (_ADR, 0x001f0000) /* device 31, fn 0 */
> >> +                #endif
> > 
> > You possibly want to do:
> > 
> > #ifdef ...
> > #elif defined(...)
> > #else
> > #error ...
> > #endif
> 
> Well, the iasl compiler doesn't support the defined() directive (at
> least the latest Debian version from 2025) so I'll rather use something
> like:
> 
> #define MACHINE_TYPE MACHINE_TYPE_XXX
> 
> #if MACHINE_TYPE == MACHINE_TYPE_XXX
>  ...
> #elif MACHINE_TYPE == MACHINE_TYPE_YYY
>  ...
> #endif

Oh, I see, I wasn't aware of it not supporting defined() when #ifdef
is available.  Kind of weird to support one but not the other.

> > 
> >> +    {
> >> +        /*
> >> +         LPC ISA bridge
> >> +
> >> +         PCI Interrupt Routing Register 2 (PIRQE..PIRQH) cannot be
> >> +         used because of existing Xen IRQ limitations (4 PCI links
> >> +         only)
> >> +        */
> > 
> > Right, and PIRQA..PIRQD is already defined in the generic dsdt.asl.
> > Might be worth mentioning, otherwise the block looks incomplete.
> > 
> >> +
> >> +        /* LPC_I/O: I/O Decode Ranges Register */
> >> +        OperationRegion (LPCD, PCI_Config, 0x80, 0x2)
> >> +        Field (LPCD, AnyAcc, NoLock, Preserve) {
> >> +            COMA,   3,
> >> +                ,   1,
> >> +            COMB,   3,
> >> +
> >> +            Offset(0x01),
> >> +            LPTD,   2,
> >> +                ,   2,
> >> +            FDCD,   2
> >> +        }
> >> +
> >> +        /* LPC_EN: LPC I/F Enables Register */
> >> +        OperationRegion(LPCE, PCI_Config, 0x82, 0x2)
> >> +        Field(LPCE, AnyAcc, NoLock, Preserve) {
> >> +            CAEN,   1,
> >> +            CBEN,   1,
> >> +            LPEN,   1,
> >> +            FDEN,   1
> >> +        }
> >> +
> >> +        Device (FDC0)
> >> +        {
> >> +            Name (_HID, EisaId ("PNP0700"))
> >> +            Method (_STA, 0, NotSerialized)
> >> +            {
> >> +                Store (FDEN, Local0)
> >> +                If (LEqual (Local0, 0)) {
> >> +                    Return (0x00)
> >> +                } Else {
> >> +                    Return (0x0F)
> >> +                }
> >> +           }
> >> +
> >> +           Name (_CRS, ResourceTemplate ()
> >> +           {
> >> +               IO (Decode16, 0x03F2, 0x03F2, 0x00, 0x04)
> >> +               IO (Decode16, 0x03F7, 0x03F7, 0x00, 0x01)
> >> +               IRQNoFlags () {6}
> >> +               DMA (Compatibility, NotBusMaster, Transfer8) {2}
> >> +           })
> >> +        }
> >> +    }
> > 
> > This seem to match the blocks in QEMU, so it's likely fine.
> 
> I'll add qemu copyright header
> 
> Would that be ok under the original copyright notice ?
> /******************************************************************
>  * Q35 part heavily inspired by q35-acpi-dsdt.dsl from Qemu
>  *
>  * Copyright (c) 2010 Isaku Yamahata
>  *                    yamahata at valinux co jp
>  */
> 
> 
> Regards,

Seems fine.

Thanks, Roger.

