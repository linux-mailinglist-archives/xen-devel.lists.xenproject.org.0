Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CGs5BfHYHmohWAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 15:21:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A35062E6FB
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 15:21:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=A2MGm+Vv;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325037.1590557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUP3v-0001Yk-GI; Tue, 02 Jun 2026 13:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325037.1590557; Tue, 02 Jun 2026 13:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUP3v-0001Vs-DM; Tue, 02 Jun 2026 13:21:43 +0000
Received: by outflank-mailman (input) for mailman id 1325037;
 Tue, 02 Jun 2026 13:21:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wUP3t-0001Vi-J0
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 13:21:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUP3s-00HDfv-Vd
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 15:21:40 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1ed8da-bab6-0a2a0a5309dd-0a2a4509c20a-46
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 15:21:40 +0200
Received: from [52.101.43.68]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1ed8e2-2497-0a2a45090019-34652b4417b7-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 15:21:40 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH7PR03MB7242.namprd03.prod.outlook.com (2603:10b6:510:249::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 13:21:35 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 13:21:35 +0000
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
 b=RJ7uvu40jIG1MyDh6Idp1en7B9FoFh1GTo8T0F7jnfUCChRu/vU5WA7koTJoWDc/0R3GahYsn6H4odma3PUVIKOJJo1cyO5AVqokqZvoJoWUFnxLSQ7Fd1P5VBYpuA8qiJ+O8BGatS1jtA8LTrcDsrrNW1cbgsQVrav7YrTktumvobxOhDhySUhyTNjzx1HVsk74MaX1M1OP3MhgNVx8nfFrYvc2HXWdTA4SrbnuGKjQZ8hwlRJpil2pL1eiGQG6gSG7N/a14Dnu0qV5nS/dxjFMxJMZcCvKuEaSsCfnW2cyX8gsoi7dFhPpWisWuWZfyB2BACCPMQjOU0fnNS8wmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5RBuPc9TJo72fLZhQ3NRquAG5yfuuYFxjVDo11bqpk=;
 b=BLTjPx5vzormw590K8Xw89AjcF0ZHCCbBTffJX8sPL4GshFAzCOxz937aafqN/J74EpOhbjHK0i8jeL2TBroZqIhNKTQ+UYLNo5iU3jjGZXcKC8esLY+eu/yO+q0mgJk11zAopZS0t5IA3lGpz9EhTl27+QCT2Eo0gyWxDR1cO86TVqtnx4nL3n9ZM2bJpFWRpjsVU44zU0QwPEtbcH37NHUhIiCnSkxPLYu4geW3Vd85xpWqZ7odNpAbNRPH0q46gauzUJTbDpYaBO4XlZEgfvfK7+ix7BY4sRHp/vFlX590l9aICFLA1Ns2+6YWnpecLvQlyr/Uhb6+1M87/ZuOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5RBuPc9TJo72fLZhQ3NRquAG5yfuuYFxjVDo11bqpk=;
 b=A2MGm+VvU/DsXYfH/G87IHcRIlPcOrFsf1IVnMeWH/NvKYZIO1/rTL4NPLWTp8SUs4W6S5Hq4E4tKU6xDteG0E895vgmhJe+Aa+25icJELoEgPDXcJdpIg+YAMEJcU3p6ZO/m20PACGjt3BSNpw9Usw4BOWDynMLCVfNZrQqE+4=
Message-ID: <563477eb-7e7b-467c-949c-fd1cf8a37b6d@citrix.com>
Date: Tue, 2 Jun 2026 14:21:31 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Marcus Granado <marcus.granado@citrix.com>
Subject: Re: [PATCH] xen/mm: avoid watchdog timeout in dump_numa() on large
 domains
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
 xen-devel@lists.xenproject.org
References: <10d8309efdb878a3b615a7daca2bb5209525cb37.1780390167.git.bernhard.kaindl@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <10d8309efdb878a3b615a7daca2bb5209525cb37.1780390167.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0054.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH7PR03MB7242:EE_
X-MS-Office365-Filtering-Correlation-Id: da2d8288-d9ea-4689-ae13-08dec0a9decc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QojOCtCLoDvauNly0hhTWTbnryrG4xXqut0SQtkcSLF/wxd+pfFaGsT/dI6t7GaoojxpNC7DoMY0pYXA4HgQR9+sWwv+/f95C+Cjn8YogoCwgBJ4rohBnvGdZBz3+zNQJqbKR1BhbMpJ8WQzX4KCmK2cU7CqywI33SkqhlST1rXUGBWAJpeRzoP7qCPlG/E3bHyyWbB8k3M8n0xep7d06AqmVvW6Sni40v0aKhI7QHQLx4OPFkGN+W3m5veYFf+WN3EQAWzOQ6+8HEjxPyPHwoiRZI4VdOTk7xSRLcE60LjCqeV7XNn9cd5/IRurpesqrUGCq8bbvCkfJbZCzdexSf6Rwa+AxJkLjre/K3d9IQ1xvWPOPTKP6WHZ/0QwDhnAMXRbMM3xBLcmri7s0QGesT7iNIavkucHVbNUj3HC/OqrAxR4J2PtMWJsWQ1pkPsv5L3pJ0FY0Ah1DAEYQyz8Aqzl6B9X4JPbVhU+xpCXSz66tmNxigUmUkvRUUJjdwtUJSPCIeVloqGlJKpKu5SPXQMoH1+Sr/YgQcIynD7tMo9G+OeKdX8yN7zzSkdIopBuxJFhSWs40+u60/rdFf9zMiUXzRu9N0Dctl719JNhWYkeoKXH4PGRlidQn9i6JEfZsqReKe+tIg76w+w96jgRN3WruWFDNEXftwadtsV2AAt7U9YqGspUQLks5JW2shxH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3ZlREVkQTF1WW9CaVR3N3RsY1F3UFRXdHU5OHRKcngvSzFCM29qUDlwaldG?=
 =?utf-8?B?bGZnK3R2YmlFRFVOMGVNYjBnMWFvaDdrTGVVc0NITWN5TzFFc3JQb1dRVXFW?=
 =?utf-8?B?cER3a2Y2YlpNRnFDRGczOTl2UDZtQkJxeExrSm5SLzYzTTdPSjlNUDYxdEs2?=
 =?utf-8?B?czV0S3I0MlpLV2MveTNwN20wTHMvVlRQTnk4L1cyRTk4dlRmOVd1dmgzUTB6?=
 =?utf-8?B?bjdzTjQ2SGdsTHFTeUJQb2F0TjlCdjB2WFBmRE1VMnVKenFoL2lPSXQvMXRN?=
 =?utf-8?B?Y25XZlhna1NtQWhlT2Z6WnZvVkVHYnpJMUlzaEpDY1NOTExxSldnOWU1SVRm?=
 =?utf-8?B?eC9aUUtOaVJUUnQ4ZFB4T3dIY1N5bVZVQ1MvdGhlbUIwWmtKSkJuR29ZVVJZ?=
 =?utf-8?B?VmdGMm5kS3JPOE9nemc2b2FpTEVxTGZLSHVTYnJZZEVnOFRQRGpRdGxBQ2dm?=
 =?utf-8?B?WEZjdmtobzNRNmJPOUNjMFNHd2gzWTBBcW9mUVovYURNM25ZaWI4RnFjMlli?=
 =?utf-8?B?QjlWbG1uaXNxZkN0aTNIYzBnNUh2bTRzbXh2M0FkM2M4KzM5ekFPU3pIQndD?=
 =?utf-8?B?Z0xVSXRSV1ZkTkF6OEppOXpUakhHOXlGa0lnRkJveldTa0c1SlY2clhzUmlH?=
 =?utf-8?B?Q0xZUXZLR2l4MDIwek9rTk1jQXVxalk4VDllU1FOMTBzOTNTY1JpMjdyb1FJ?=
 =?utf-8?B?Tk1URmYyYTVrY2t6bjdBbWwzSUtWMzlRNDgzcDZkcGxOcGpRMXJsNCtRb0dJ?=
 =?utf-8?B?MVVpTTZRaVQrVGdwSEJkd29US1pPbVZqSTM4bUVyaGlWOW1RM0VNc2FpQ0J3?=
 =?utf-8?B?SXBrM1V3MVRBWHZueGVEVWlhS3ZaUHpDcjg4QXB2K3haenhiWlFweEVWbXdj?=
 =?utf-8?B?dnVvdU1rZ01wT2VJR2c0eWJkVjVZN0RzMkFNVzNRZVNmK1FwVzdFMTFvTXlj?=
 =?utf-8?B?UjlUblZTMy95MW85dU9SUi82SXhVTzNDME5naUQ4VVFmMGx3Skp2dzZhZ1Nz?=
 =?utf-8?B?UFBaVXV4SllwTXVtdDZMYWgxd1FMYmMyb2ZjUEw2T25rUHJCQ1Azb2ExMlNs?=
 =?utf-8?B?Ujk0cUlFaERSOHF1c3JFaFZ4bkZsMEMySjdlcUZVOFdmVVExWEJ3YytrbXpK?=
 =?utf-8?B?NE5VOFNrYkhRdnFlMnFYdnpUM3lMZXZjb1Jna05ka2hPY1hCRmlwRGxuNkJp?=
 =?utf-8?B?bVdvdS83R2N0ZWs3OG9FZ0VjU1BVdllHMFdYN2pXUGFBVWpsa3JPam9naVRI?=
 =?utf-8?B?MGpXejFicHdHbGVxNVcydTRGenFTYmltVUNQbFpoTG40RVFtT3RPVFNBaTdB?=
 =?utf-8?B?K3JhbVp3T1hmMnRRcDVxOHZ3akV4dHNpNlArVWJ2S3FRL0JJa0VKMjlKWDVT?=
 =?utf-8?B?bnNuMmxlMHhha1o1ZjZHTjdNVXFacWNqbi9wVEtGNEVBWUpLak8wZk9hbWtk?=
 =?utf-8?B?MGZvUFh4cmN6VGZGbStsWGpIaVdGUlRteC91dzZMQ0FJcEh1eGRiZTRnNlNt?=
 =?utf-8?B?TW1ESForbUFldW1BYlU0TGFEYXNQVy9LRGVRcHBpbmkvbzNlNzNEOEdzeHcr?=
 =?utf-8?B?V2g0blVOVXliUVdMM3A4YUdabGFadTMwbDg4b3VyU2tON2NiWWVzdlNibkp6?=
 =?utf-8?B?c28wOVFVWkczSUZTMWdidkliUVZlWjhDK1MyV0ludStCTnhmZ2RCMnVYLzBU?=
 =?utf-8?B?MENxSFlrTDRmNzF0ak9hZ0kxZk1oZWFiOWhETlFEbDFwUHp0d2ZIUThjdXZO?=
 =?utf-8?B?MVFSSXJRU1ozNVV1RHNMUUp0UnV4UDBTSS9vU0gvT1FESHp0RnhyWDgvaERH?=
 =?utf-8?B?NXFRYXNLY0dMeFlMNEV4M3pSUWdTRzZzaW5EOUQyZkQrdGZsMUJlc2RPUTFT?=
 =?utf-8?B?bGhCWlo1YXNvQzJTcnN2MWVzVkMySE9ZV1Y1bk9NZGhxSUkyclZONGlWOE52?=
 =?utf-8?B?T01iMnVyNnNmMExzRERsL2toeXNxSTJnSSs5VGQvQ3I3SnFid2NWbUJuc1Ru?=
 =?utf-8?B?MXUwRjFrVUVWdkRuUHF4OUIvbEdYWVllRmp0U2RvVXYrcGNqRDZvS0VlNWhk?=
 =?utf-8?B?UXdncGVaZUV1VzN2d0Q1WXRsbWdPVy96Si9ta1ordisyK2dwZzlmcFR1bXA0?=
 =?utf-8?B?dHhiMGFRT25FVDZOM0ZhRDNvdWtZS25NTHMwQzZjUWU4cFJLNlEydE92RGJx?=
 =?utf-8?B?SGFBZmxIcnBxdGlhVmJYbDNRVHJFMVk2TGdiZEtPSEVieXdCR2pmTXdXN2Mx?=
 =?utf-8?B?b3ZwMUpBNDV1dTVaT2o1V0ZiOVZDc3U3NGZJeHRMRTQ1YjBidDd2dzV2REd2?=
 =?utf-8?B?S1puZVR1WlVqc2s3UEZsTWkzU1BIZzloWkswRXY1MGVvYmppaGV5bDFodW5q?=
 =?utf-8?Q?upGaqiZ2411NSOYY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da2d8288-d9ea-4689-ae13-08dec0a9decc
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:21:35.3987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TrROg8A5HGeEEBr87Ch/83lqa6DsMm44JlSnFzlzZmNSvklegk5/+f+OP0BQ7zYN1z2rm/kGxFuFpBmqX///uZFUWFFZpY1PRRyBg8qkxzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7242
X-purgate-ID: tlsNG-bad1c0/1780406500-40F66A53-20DD1866/0/0
X-purgate-type: clean
X-purgate-size: 1631
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tamas@tklengyel.com,m:alejandro.garciavallejo@amd.com,m:marcus.granado@citrix.com,m:bernhard.kaindl@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:from_mime,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
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
X-Rspamd-Queue-Id: 6A35062E6FB

On 02/06/2026 9:49 am, Bernhard Kaindl wrote:
> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
> index 5c7a0ff30e8b..89ae418be0ae 100644
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -769,7 +769,7 @@ static int page_make_private(struct domain *d, struct page_info *page)
>      ASSERT(page_get_owner(page) == dom_cow);
>      page_set_owner(page, d);
>  
> -    if ( domain_adjust_tot_pages(d, 1) == 1 )
> +    if ( domain_adjust_tot_pages(d, page_to_nid(page), 1) == 1 )
>          get_knownalive_domain(d);
>      page_list_add_tail(page, &d->page_list);
>      nrspin_unlock(&d->page_alloc_lock);
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 8cb4241b0511..0b6afba2acdb 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1558,6 +1558,15 @@ void domain_destroy(struct domain *d)
>      /* Remove from the domlist/hash. */
>      domlist_remove(d);
>  
> +    /*
> +     * Final invariant check: all pages still owned by the dying domain must
> +     * be accounted for per-node before complete_domain_destroy() reclaims
> +     * them.  Debug-only; expands to a no-op in production builds.
> +     */
> +    nrspin_lock(&d->page_alloc_lock);
> +    assert_numa_page_count(d);
> +    nrspin_unlock(&d->page_alloc_lock);
> +
>      /* Schedule RCU asynchronous completion of domain destroy. */
>      call_rcu(&d->rcu, complete_domain_destroy);
>  }

Why have you re-merged these two patches?   I explicitly split them in
the XenServer patchqueue, and they should remain separate.

~Andrew

