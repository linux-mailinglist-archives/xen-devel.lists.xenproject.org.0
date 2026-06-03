Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mnZpBq8xIGq0yQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:52:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 740B7638448
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:52:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=VhMe1bGa;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1326409.1591850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUm1C-0008DY-IN; Wed, 03 Jun 2026 13:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326409.1591850; Wed, 03 Jun 2026 13:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUm1C-0008BS-Ev; Wed, 03 Jun 2026 13:52:26 +0000
Received: by outflank-mailman (input) for mailman id 1326409;
 Wed, 03 Jun 2026 13:52:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wUm1B-0008BM-BI
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:52:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUm1A-003Uvg-DL
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:52:24 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a203193-5cb7-0a2a0a5109dd-0a2a4509dd16-28
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:52:24 +0200
Received: from [52.101.46.43]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a203196-2497-0a2a45090019-34652e2b90d9-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:52:23 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV8PR03MB8161.namprd03.prod.outlook.com (2603:10b6:408:297::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Wed, 3 Jun 2026
 13:52:19 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 13:52:19 +0000
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
 b=AuMTjLE/xlNajSaKwHXH6y4i7gSDIgQvYW7fbW1dpf1egybua6pi90CgjCrRhQTq8CpeDIneRTGuXBrIf3yLYk/C8Ot12sx2Bedn3/qQbGVpXOACtPkr4BWPb091vG22D+ju3jFCUI0PD5C+Kh9NTutMbV/J7Jx1RC8n4vhfYKY5/nIopUGE25RtB4YhQjTuyOTkXWkYNuwB0MxAv3Sw0Z94dHRQJLe0RIGIEH5hgurqeG0wKHrBCedStuhodKOf4ZjjdQz4eMQb1yEC+HQJGtimtOOp94sG/m77IK2/vy0bsRJ7hkYy3hIlWxPP0uhq/QCXpTAEJkZ56j+kLwYmVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+TZt0aavyBKq+KPdzXHwK1p5G/y1l89qbb2KxqbgFM=;
 b=knuAPGsgcau+X4/UMjTFJYS1qutS4dmYDihxVAQvV8mEkfDZyAe/wuMbrAyvSVCtcsA5R4+6rm62BmeCoSRyF4v8NXagWz5JGPeYLk/ghsoPzUklZeSP2Mr+JurstH9aZc96lgjTNnOFhOTv+5sNG1ZSkwQ6UYpgd1nDGQ2nTBBjBwzOkcIi2XNgLYbqLkE89FC6xVUwSzyOqDw3zgluByf+y/GJy5+AKEzFkfFzms3MlBnnsg4SRkrk1etzRb4GUnGxDchCPV8M2zI9/P5aVyiK/ufxYGx6jjiRKs3h3Ix7b8s48S9Qy5JMnhcVVRXIMGxkI2cbuUhTfu+Y1FtEfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+TZt0aavyBKq+KPdzXHwK1p5G/y1l89qbb2KxqbgFM=;
 b=VhMe1bGa80YtylynYPVYN5mlYFB+hTYVaIh6+Y3dEmoCRAOTGE+tYo+euiFCBmqxFkMIMo+AQiFGc/tyLJOx9qG+pVofRMVeGtAyT6/MwYWEMUjY3iqfdTb5/jLz6merCI6fFJ+QNskYgDwXGXIDCMvdwk0R6sdhxiHSHh6AiaY=
Date: Wed, 3 Jun 2026 15:52:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.22 5/5] xen/numa: fix setup of non-aligned memory
 affinity ranges
Message-ID: <aiAxj4jOP5A7mRfI@macbook.local>
References: <20260601154332.30797-1-roger.pau@citrix.com>
 <20260601154332.30797-6-roger.pau@citrix.com>
 <de557b90-e5dd-468b-ac34-dcf463e95cad@suse.com>
 <d17f835b-3095-4d08-b2bd-7ab69e08db45@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d17f835b-3095-4d08-b2bd-7ab69e08db45@suse.com>
X-ClientProxiedBy: MR1P264CA0028.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV8PR03MB8161:EE_
X-MS-Office365-Filtering-Correlation-Id: 8023460d-6ffe-496c-ee64-08dec177545f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xOMIohhrjuYRYFL82avTVngm/qrvxmveSqZpZn96VpC25daayoZnhskT7a0D6abZMmk/NtWd/rg2DtoADGTnZrfxOJLJPb5DEmDu1Ea8tVUCLuy/WcbU9jxTm3H2CzlHoGaBw3OrUQ32RQhctqEfQw2WDnHFoUrgXKGgn+Xhx07VVTtSZh007n/k27a02ncC9SeBUi68TLjjPcAkEGDqfmOOh8ek6fTDtW8Tc3U883desYFTHOkMBozpJMchGeI60K5MLVlX4qJ9zThMDKFmZYr8MRL0j9a2fq5RnPtySbIpaIEaT/7+VodNo6Dy5WymGjNa6Te82HDJ2rbR1SWG8WODaUFhsVl0eHnR7TB+4kMHZWPgma1pubeJULxBycVz4uPllV+SbEffbtzTPzt2mN8tEJsuad3MOGTN4VWC7VQ9r0rliz3CLEbR+Nt7vK6bxRp9HEbPq63a3awrS0RyQqs8aJw/HLmPM5wQeNwS3qxlVl9Wf7Ji5SsYRuZzEuKKYWVD8Ajr0mJJQ8B+KLKZtfgBOrNtlhRl9gLxicP8Y4yLOQupIoOC2Z71Q/QKStevNDteyOeAq8FTT8Kc49FinqJ0nn6TTdDxAbw2NkgzmsH1Leb8uqPycP6Nrmscj14xBpseN7ip+nVKW7PCSc6n/1P2+3ej5YI9k3tis74iaQ7J5+9oRNZBBSx6nIduMUEw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjFsbDQwUVN5cFd3anZhUml5bEpkdjZEN29oMkE5VWR0OXpoUCtUQ2RQdXFj?=
 =?utf-8?B?VUo5Mk1pWEsrSFY2UDZBSXZ0L2k0cWU3dWVPUEorcXpTcDF6Nm5tZ0lHc0lr?=
 =?utf-8?B?dElmSzVGV2tQNjlUODlrMSt2R2tnSkZEK2NTYVdIWTNzMG45V1FndmU1Ukxz?=
 =?utf-8?B?dFIwN0NGSFl0VXlCQjBVTTlLaUpDQmZhUHVReW1OeUEvNlpERmQvSFVhc29a?=
 =?utf-8?B?S1BmNHlSK0U3Z0hqNGRwN2l5Wmd1VlZIMlJFRVFYZlF4T0JESGR3Y0x4ZUZ2?=
 =?utf-8?B?WmsxdHhGdTdLdFFQaVU1QmpGSTJuY3pzU3JzY2lSanQ5c2pBbHVjN1QzYlpp?=
 =?utf-8?B?Z1IvWVkvZWtvK25mZmI0bnZwS3p0VzNXWE5DRTJzRXp4akcwMFV4NDJaaEg3?=
 =?utf-8?B?S3FXazczVzlaOXpqbG1FaW9xaXlOREpVTHpmR09rdFM3NWtXVVdFVllSbW9a?=
 =?utf-8?B?TDZNV2Y3Y2p5cjNsNDNlazBDbWhOWk82SGc3TGU5OFUwbERUN0grdWZLMFFl?=
 =?utf-8?B?cGR1c3lmbkR1ZG5CcjZvZFJWaTZFWlNtWERaTFlGQW1NeUVoRTlKcEtPWEpP?=
 =?utf-8?B?ZGVTaS9seElnanVVTXAvRFExQmExekYxSXdIQktNYUhhZnlUMEp1Lzl5cG1H?=
 =?utf-8?B?WkgvVzQ1NC96MC9lcXFHbW4zYTJKbEU5eVc4dS9oUTN5dWVrY201S0FXOWhE?=
 =?utf-8?B?em5uWGxva3k0UEtEZENYOFk5WGhoeFNHanpzVitxZmJReEF5djQxUTFpeTNW?=
 =?utf-8?B?eW04SWp4NWJkRVNhdVFxVFB3cC9tRURtTkJwQlJPSkNBNEZwSk42TVBLejR3?=
 =?utf-8?B?aVNJdVp3RkwwWWY3V2NaU0QxZzc1bS9mMEZORmZYRDhCemE2dStyWC9CZllC?=
 =?utf-8?B?aStLL283ZzZtODZ1L3VVQXV6LzlvNUFHMWNMazlLVWZTSU9hN1BDckhtN3Zy?=
 =?utf-8?B?N01aanNReVZzMnVDVjhXUkJmZHNIR0p3bTJlN0ZKQjRXVUVzY3AyVlEwUWJ5?=
 =?utf-8?B?TVZJeElrckw5ZHMwSFBNSFdxSkdwT3A3bDJpY1Z6UUxzenBncTJxSEEvMnl6?=
 =?utf-8?B?em54blJjQjY1cDI1dlpyZ2R1eUk5SlNnMzFUTHh4OUV2QmptS29tdnFEaGNN?=
 =?utf-8?B?aWJBbkhqazltWUVpYWJ1VDZybzh3bW8xaWpETElFLzJWcXprd2dsUGExWFQ3?=
 =?utf-8?B?Z0twYXJoZHpMZHMwYkRBQjExanJkQmFyZ0Y3UWlmazBCMlNsdDNQQS83cmhy?=
 =?utf-8?B?MHdCa1dWa0Y3WEh4QVlFT2FvUjhVMEp1cURZejhQR2FKZWFCTU1RQzY0WCtF?=
 =?utf-8?B?dGJJZlBRRXlVUzkycnNLbWZGQ1BCUHRML2N1aUlScHpBTzZ1alpUYnFFMDND?=
 =?utf-8?B?OHdTN1RQNU1JV1l4LzB2YXhONG5aaTZyeDJCUnBJdGZPQ1NLTW9xNGdnckpj?=
 =?utf-8?B?emw0WUF5ajdrRTV2Z1d1eGtZQ0NEVnE1N2ZyT09tc1dYY0c5RzhERFFCT2Va?=
 =?utf-8?B?Q2ZHOTQweGFmeDFnUUtIcUhua1pPNFB1bmI0eFhac3kydVpKQ1NUK0hrdDFB?=
 =?utf-8?B?SFdYR3RGbmNqMXo3N3lwNnE5VFQvdDJhRzFKMC9HSFBodE1nZVc4NVFlWlJi?=
 =?utf-8?B?MDNHaGFNNDdLUmZrY1FkVkMxbzh0YTJJbUFxd290K20rdDJ5bFNPQUxZcUtX?=
 =?utf-8?B?aks0SEEzV3FSMkhMTmtoalVYbFJrWkdWcHlrdEE1MmFZNk9uK3QvT0tBcTh2?=
 =?utf-8?B?RVJIOVVsNndyb1RWWkt1ZWVGMjUraUlFdkZLelVIMWlGaWwzTFc2Nmx0a2o5?=
 =?utf-8?B?YlorS1hpaHN0RHJUczljdjlMK0pKOXRBb1Izc3hPbGpKNFZPY2cyRlMwektm?=
 =?utf-8?B?MkV1SU12MEZBcFhpOUROa2hPNU00VHU3VWh2RS9kbmJYbU9DZTZqUWN4SGg0?=
 =?utf-8?B?WkJQN0ZYdFdKY1ZoSVgrY1lZYzdGc21MUlRMNUdqNG1YZk1rODY5REdLVXRH?=
 =?utf-8?B?K2tYTlNpK2ZsaVRyS0h3L3pNQmlnSC9xUzdscXZ5ODZxSy9XSzQ0MnVuWncy?=
 =?utf-8?B?MVNPclBCZXZuZmtoSjZVSlRkTWliYVBQQ3ZoOWxyVlJMUTBpeTNXK0drcm5B?=
 =?utf-8?B?R1QwUDVqYXRhZm9iRnBHd1ErMDVNeGh4OWhxMmR3bWpsR2JYQ2xKNHA1aGhC?=
 =?utf-8?B?OVhmV3h0bkIzVC9vbkQrTkhDem12TzhVMGxLRjB3TU9UaUpvS1lESitwVHlT?=
 =?utf-8?B?QkIxRmxjRkpHK253UHBlY3RPUkpieGdMQWkzZVZpN0hpQWt3K3BJanNWOEx4?=
 =?utf-8?B?RUdmOXcyUnFmeVFsWWhDTGpqdGdzbXc4anJoWnAvdlV6Wk9zcjgzZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8023460d-6ffe-496c-ee64-08dec177545f
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 13:52:19.6658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Wwr1IFMYKUxU3z+PaaHmc9uurz4xmgeETyyLhVs9ZhebZnl/uf4nlRdYDjCrGQ/rP6BHR+cnhE1BA1Su+RwUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB8161
X-purgate-ID: tlsNG-bad1c0/1780494744-4216DA53-D72DBD63/0/0
X-purgate-type: clean
X-purgate-size: 1264
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
	FREEMAIL_CC(0.00)[gmail.com,vates.tech,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:from_mime,citrix.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 740B7638448

On Wed, Jun 03, 2026 at 10:54:38AM +0200, Jan Beulich wrote:
> On 03.06.2026 10:53, Jan Beulich wrote:
> > On 01.06.2026 17:43, Roger Pau Monne wrote:
> >> --- a/xen/common/numa.c
> >> +++ b/xen/common/numa.c
> >> @@ -396,7 +396,13 @@ static int __init populate_memnodemap(const struct node *nodes,
> >>  
> >>      for ( i = 0; i < numnodes; i++ )
> >>      {
> >> -        unsigned long spdx = paddr_to_pdx(nodes[i].start);
> >> +        /*
> >> +         * Round down start address: if start is not aligned to the memnodemap
> >> +         * chunk size the tail remainder might not be added.  Overlaps created
> >> +         * by rounding will fall into the same NUMA region.
> >> +         */
> >> +        unsigned long spdx = ROUNDDOWN(paddr_to_pdx(nodes[i].start),
> >> +                                       1UL << shift);
> > 
> > Imo this rounding would better be done ...
> > 
> >>          unsigned long epdx = paddr_to_pdx(nodes[i].end - 1);
> >>  
> >>          if ( spdx > epdx )
> > 
> > ... only after this check (and then perhaps also after the subsequent if()).
> 
> Oh, and: With that adjustment
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Fair enough, I will adjust the rounding placement.

Thanks, Roger.

