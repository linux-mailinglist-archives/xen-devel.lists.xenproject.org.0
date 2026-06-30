Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZaZ5GBrzQ2oRmAoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 18:47:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1D36E697A
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 18:47:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=ifrnHfOj;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1349246.1607119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1webc1-0001Kr-Ec; Tue, 30 Jun 2026 16:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349246.1607119; Tue, 30 Jun 2026 16:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1webc1-0001I6-Bk; Tue, 30 Jun 2026 16:47:05 +0000
Received: by outflank-mailman (input) for mailman id 1349246;
 Tue, 30 Jun 2026 16:47:03 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1webbz-0001Hz-NB
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 16:47:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1webbz-00HM4O-2v
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 18:47:03 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a43f2f5-bab6-0a2a0a5309dd-0a2a4502d9f2-6
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 18:47:03 +0200
Received: from [52.101.43.10]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a43f305-5a27-0a2a45020019-34652b0acac7-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 18:47:02 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by SA1PR03MB7053.namprd03.prod.outlook.com (2603:10b6:806:326::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 16:46:58 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 16:46:58 +0000
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
 b=cvsgOVNEnj1+YGPirH4cXFnxBddTa/thX1yE9eHLBvqoHbj/Wsj5JPfFKoVKZtfq7Ay+UW/F1xY9+vhOPmbADhLWfnr91wc9RGoEvQIw+sYkU6EkdgKgFb/AC6JPzgLJGKKdeiQQ0TbnOpTVNIzm1LWWj9VstXf8AzGf68C8zHjXNeIynQZunHHxOJBMMvvIw+8DQwLl+t8CFKgFuQ8MQO848xe/HBFfYU4abnASUSKhdZcAdmuP5euyxJRV8C2Hjq31hy2XEEZEqM5dYRPJJ5qbcmhEP4CmZ4UU8zup8+Ghz4p4XRKx9yUWTB6W9M5GHQPgBjIsJV+lx+e2JPDFXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYq/hvH9BpfWCNSnII53rqXSzEtF4/Bua8MCmOgeSTA=;
 b=wo1jMd6Pcb982yweCBUU1rDdVMQoXxIN22cDFd692k8Mr3uhpT8d4pys8KNvohrreGurwoHStqgSVjtq2MBLzKI7dWvxdkSFM8XgE+bZHmPsYe3sGBMYcxffXWYSiQMvZ/zR8vLs09ND4hKPIh99+ksWLOfAz7CpdeTWt68M6oiV5nrgKRDzMszjnB8T5ilbtdTYDJHE0PPsJQ5SYnFdkf8kt5SFFPq7ckHR3TtY4XlkTSGHSeuLrcCAhWIFl9E6z6x4sq5QELRuW6DEN6o0vsIyelNjleJZdZrGrwGaQ8FV5XYjXRex65ie+BRMnID2KfXgv0uDXQFnWBHZLsnCuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYq/hvH9BpfWCNSnII53rqXSzEtF4/Bua8MCmOgeSTA=;
 b=ifrnHfOjGJ+Cl79fhHqAcL2rbtjVvlhLyf+S2w3Zgsd/khz+NFPl40kypYIalCqt9CknpLjdiXxisoFbrifx4ORSXwxnPfR+vqkqNxPb3uWJc3E5AHPTeweDYTsXNkVV5yOBrJPDsCN5VyG1WOHT/lUTBZbNO3Sqwfpycn47Z/M=
Message-ID: <73d8b955-8462-47ce-8913-d11303bf63c3@citrix.com>
Date: Tue, 30 Jun 2026 17:46:55 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 03/16] libs/guest: Reduce number of I/O vectors in
 write_batch
To: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-4-frediano.ziglio@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260619130501.272832-4-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0105.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::7) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|SA1PR03MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: b413844f-48ed-4e5d-cd08-08ded6c7338c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Veb/jMp5grTEMvKk3f7zgkJdWsb6YzPhZnOAd8ILIB7MvHazeH6VcPMrp04z6u/TCUzVS7GcY2CGqFmgjE7kUjMlKjWNbaGVu5hZzdD+LKeioCcQDUoeiL+nmMvxuStdtd5+CZo21s0b8PAydEfJbU/0fyEze7lKhvmkeO0+qyiVw/Y61ctstrCtJo+x4FvTcDo0fPUHpx7AcsS2Kp0VdZAqTYBwLP8Z2rBhUoPi0XBVB3j8WaaljMUnOv36FMq3rgThmAqYdqlaVp49DCGF706m3cKY+Ae7eCPbY0TTZzKWhyHqNXiAOQCg6N/KOom/TsmuAJHrlm8qfUhDFryEEzeRsnjr0V21bahyn7uVZm/fnd1+W5yrdHA8iVahdfja57kZDMd/TMJNlkvYTWrzjbBo23ACD0RqgBQ7Joz/rIWTRtKjjBGt/h/elrmUiRnz/QRgiZbmFsf0t+V2lLag8BOlB32lvMhpjGgT9sJgmMQR2UATuHYytbgUNhXgNqUs5AViY0V5k7jrQnqBUNerPjIo117Gmb02m8eCvfPCJMeyWCx6Imcf76KiBwvBWop4xhJZYbXDM0zjKxCRRIsVHP/BDGO5/EPmKtqyg/NOP/j0B9ajopLAiWUD0Nvsi8xBDlfbRINims0zAxmeHeQCfJhYR0hRvPgaEG6e9+odbm8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXFlcXJHVUY0ZjBVRWwyMWl0TWJEdUFxbkV0cnBsZS9qbGhPSlpIV1R3dE45?=
 =?utf-8?B?YUZscjF6VmNjZGIrempyZVVFUHVjTTJFbTYxSVlqYjVJdisvbU95TmtoVHRs?=
 =?utf-8?B?Nlk2UGRYUGx3QXJaVGpyMWpFYmo0SjRxY2E5ZEJ1dmE0NlRQWEpZQXhwRW5p?=
 =?utf-8?B?YngxNjNZSUoyY1dhMDFwMTVid0dPOFFlak1NV3hQMSs0YXFvWitoL3BxbTMr?=
 =?utf-8?B?bElrajk5eHgxWkZVbXYzaE1uSVpubGFsVGdhdk53OGppd2U1MjZPK0pxR3B2?=
 =?utf-8?B?MmxwM1h0ODBjUmh6MytHdFQ4NDZNOWxRd0FjTTlHOUwwTS8wZUY3Vk5hSStV?=
 =?utf-8?B?WVFuUVdNTHJVRVN0RE9xTmthMEEyR2d1Ly9uWXd4MEdycGdWblVrVU1TYnQz?=
 =?utf-8?B?YlprZmJTaXFra3NvakVSRUtReEFKblJZKzlNNjE3RHRlbWZpTDZFMVlJNDl1?=
 =?utf-8?B?NVhxVHNYZWpnTFd6cWhkcyszRWwzNG1MVUk2UHk4RzdwaEhoQ2ZHZGhaNkFv?=
 =?utf-8?B?SDMyeFdXdk5HRFZ6bk9ndExjVVZLOEpMaW5hcFp5YU5DdVF4ay92RjVuNUlr?=
 =?utf-8?B?OTZBTk9JemJJQWV1OUdwMXBQRzBrNkpPZXRnUXVIVW8vbmRiMTYwa2MyUjEy?=
 =?utf-8?B?MmMyVE5MRjA0ZUxZemQxVWZUeGZsbndBRUVJcW9pZUVDT2YrdFAzUmRhVUJx?=
 =?utf-8?B?ME11Z0NTQllTbU5LZ3lhSEVPN3RMb2V4MUFIN0pUSGFzSGFZdGU1M29BWWoz?=
 =?utf-8?B?anhwZkk1SnEvQVRvUEJwRFR6WHdENzBMdEplK2hNTEcvWmgyMVc5Y2ZkWjF6?=
 =?utf-8?B?UlB0MHkzdzdZZWFUbnhkUkR6c3BpeFc4cmJ4YkttNElWOThjOWNSZDZaODNy?=
 =?utf-8?B?bEpTZkRpNXZHWkNCRWJBMFg0YUVDN3FJRnhEQWNoNlB5QTB4ZFluak5jUVA4?=
 =?utf-8?B?NnVKbTg3amdWYlVpSVo3Wmg5ZUZrWmVqOHI2enAzSHBNcG1lb1VwWCtPQU9D?=
 =?utf-8?B?cUxGbDFXNWtmY3NKOEg3T3AxSUk5MXZoVFRTZlpnWWlwbnJlQ250K1VzekUz?=
 =?utf-8?B?YjlQNUx1NXBtV09ZUmdRWHloMUszZXpCQ01Gd2doUm5xeS9kS2c2S0pRdFN5?=
 =?utf-8?B?OVV1UTdqMGxGRTV1dUV0SVR3SGhOTXRveU4xQzEySzl5YndNMXM3OElrYkxx?=
 =?utf-8?B?Vi9mNEt2RDBFcTJWZ211Y1hXS3FzbThsaHB6SVpTMHF6ckMweDJYQnhHQlMv?=
 =?utf-8?B?Rnd3MzNmbERnUE0rQmJnNjc1UUNRS1RVQ0RnTHBOME9KUmRJNWJoRW9EZm12?=
 =?utf-8?B?WitaM1pWZ3oydmU3YlpTN1BtdzYvS2IyT2traG5YUFhHdndoSzhVNlJBVGw5?=
 =?utf-8?B?b0FaUS9EZC9BMXZaQjkvdzhpV0QvM3V1ZXBDZEc5SU8wMGZ3MjVNcjk2Vitj?=
 =?utf-8?B?VFJwOGlZK090SWU2ekN1b3FkTlE2UUZ2cTVUOG1WUGJGUE8wYldxbVBrREZP?=
 =?utf-8?B?aFdVcHIrMks1V0xCTWtzcjhKUGIrR1p2MUxsd3lKQ05UR3h0VFh3RzdXdXVQ?=
 =?utf-8?B?L254OHZtYWN0aTZUZUFTUzFnandOR3p3Y3paZnNLcTVPZVQ5R2MwNFd0U3BQ?=
 =?utf-8?B?N2grbzZzRzcrZVYwZElrcS8xNWRYdDB0cHVwd2pqb3VXd2VsL3JmaTNZTE43?=
 =?utf-8?B?ZmZNckxiViswVHl6YUxCTHhRV2I1M3ByZnloYlVIZlk0LzFTNVJQbWszNlR3?=
 =?utf-8?B?dTlGQTFPQjBCa3dLQkF0YlRsK3lGNW1uYUZpNjVYSVRiQzNFMDc4c1JGZitp?=
 =?utf-8?B?b0cwUVZJTHBQR3FPc3l0MUpjSWxEWnlvNktWbVBzbHpvZXFWeWQ1bjRsVVlY?=
 =?utf-8?B?MDF3SWdvSUF3dWFxTHpmTklXQmdvUS92MUJzb0lnWjN5ZksydFF0TytkTnVt?=
 =?utf-8?B?aTFlNm1jc3NPc3J0blBudHoxdTVmUXNKdDMxNHFrdkRZbmVmbUhrbkZTZXpl?=
 =?utf-8?B?NDF5VW5Pb3licFJEalBNc0VZZXhEd2tvRkZjSHd3dGVJQ09Ld3Q1NmNPZ0g0?=
 =?utf-8?B?MkZjVWpFOEFlS0lTbG0zVmZ3TVBmUjFpRkF4VHNXRHNHS3g4THNlSW01UEgy?=
 =?utf-8?B?dUs0d1RUYXR6YzN1TGplTHltWU5VQjRnYUxZL05abWRIeCtUOG05QWVvZTNk?=
 =?utf-8?B?RWtNRnJicGJvdHdQaThHUUxxUHAvV0xJUGNudE5MSy9oNnRuVjNEQytsZFEw?=
 =?utf-8?B?UWUyMzZwd1dBNk5ZZWNpWXdSNzhhS25jUXZUMG5NYWl2QnhzVTFtdlpub005?=
 =?utf-8?B?alhoaHdDSDM3YWpQRUZ1MndGZDA5S2l6cnltb1ZEOEdKdVNtQTZjQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b413844f-48ed-4e5d-cd08-08ded6c7338c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 16:46:58.6168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkFnNhM766eS5QvEcy8PGFwyXeGPoS1FOe7VnvLrROocLzc/tgkh4ryUdTHRoWSYBzTzfi0Sl4DaBe7pT2xpHLWbpGoUH3bcslmHLOj8ECc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7053
X-purgate-ID: tlsNG-720697/1782838022-54CE57C5-64011B55/0/0
X-purgate-type: clean
X-purgate-size: 793
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF1D36E697A


This has the same exact subject as the prior patch.

Either it wants merging, as they're both in the same function, or the
subject wants to be different.  Even a "Further ..." prefix would help.

On 19/06/2026 2:04 pm, Frediano Ziglio wrote:
> Each page was sent using a different iovec item. This potentially exceed
> Linux maximum (1024).

Linux cannot have a maximum of 1024 because this has been working fine
for a decade using 1028 in the common case.

> Coalesce adjacent IO vector elements to attempt to reduce the number of
> overall IO vectors for each operation.
> Also some implementation (MiniOS) emulate writev with multiple write calls.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>


