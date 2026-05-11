Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDt7JEjLAWqgjwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 14:27:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E356950DB4D
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 14:27:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306111.1578184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMPim-0004aA-As; Mon, 11 May 2026 12:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306111.1578184; Mon, 11 May 2026 12:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMPim-0004XE-7w; Mon, 11 May 2026 12:26:52 +0000
Received: by outflank-mailman (input) for mailman id 1306111;
 Mon, 11 May 2026 12:26:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wMPik-0004X8-LG
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 12:26:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMPij-0069vV-SZ
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 14:26:49 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a01cb04-2eae-0a2a0a5409dd-0a2a4508bfc8-32
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 14:26:49 +0200
Received: from [40.107.209.33]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a01cb07-63b5-0a2a45080019-286bd1212653-4
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 14:26:49 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH2PR03MB5205.namprd03.prod.outlook.com (2603:10b6:610:9b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 12:26:45 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 12:26:44 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTxxkD3ahKNc0OsHdVQFEsA/R6xlp+LrUusF+OZZu9IJHolEfR4FZb3DazC/DY8zCqq1iIYjKKh0xmZHUZzxRYuxW2K6rXsOuEvW+TVdMRdWI6k1xaw0znDxh30ik86Q+IT8KwvfZucouXp9XvIgolNFqBiiAMdq+NEMkd7+Hdog4wOuISEQhBb71V9wnU/NKVMpEaBl05U++26qfcTXmNNFmzict2z9Ph2RMVnpA85TQA4uQGrcmEPs1zj8fuZDw1/xznQh9tzaLK/NVtMnokZH8eJKFn4dh8WSM5BfUQYEbuvQJ1Kyl5McHZT7o9uwC520+aMIT0a4yJZHZaRfSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FU+dJ8hryVeVfewUOjAM6q4G/U8PSqpsg7iy7KXantU=;
 b=PExG/dYENgS2sNIMDwG7FJykIuHp87odr5iML/eucvKLW6cM/E3zpHO7mF0dJq5VFMqURVUH3r5ZQRpKUwszTeubTwat4y2VVZ3tN1Ilu5CmJNvf0BSJQf7QvFmEgPS20WlBUqABknXXkuuPRRtB0jzN81FOa7Xi3iEsMR9x4GSk8ISFUYW4GYTvLpsfz9M+a2VqGS8dX7etBKDPbvfqHs4hWZJ+lwjDOTKyuwNIYdoeQKgCyle2y18tGP5rmZX0q2dxoBRVxwJxxbKsnRORLXd9cxcnmVRFger6muKYzUFvOhbn9QQx8exvXuSAA8YPa2hqPrcvIf3S5T5padq+9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FU+dJ8hryVeVfewUOjAM6q4G/U8PSqpsg7iy7KXantU=;
 b=rp4rEuUW5ZCpjtyTRpgEVubQ85brgz07hWsTg1KxW0SSs1cNZgF5gdo8syM9LPUp2PqlSDBK1wlKTFSaGnzqvXzUkdYVKLwpRyqteJqD1FCuMUdItViBPDqyOLwyuWR4V9HNyYYVXhpAq9aqu400yox5qoSq+kfyV2cYUAcRy1U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b703fceb-4ef3-4869-8341-225173bc406d@citrix.com>
Date: Mon, 11 May 2026 13:26:41 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v11] x86emul: support LKGS
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0099bc30-ce07-496a-b9b2-6d7ca400737b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0099bc30-ce07-496a-b9b2-6d7ca400737b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P265CA0030.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH2PR03MB5205:EE_
X-MS-Office365-Filtering-Correlation-Id: a5c79229-2515-466c-109f-08deaf589065
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	455pnqsjHPYS/b2JhSgRsb5Qbwe9FtfvW3/lyRUy5wjHlv2383PVdlXi2pEn3/2sxieMmVDnuQFKfZvFelNT2pKhDQcs2RUj0rcYS32Q/Vi48YI64EEwqeva6DvZAkh4sMF7OPPzbW6HrL2hMEwzEHbPzcjlgYdZemz6xb5BWWVzOass7xopxiDSyDU/GHIyNslix/H4Msq34cJau0x2RE3HJgJ9iEeh+tKkomP4rVzz69V+n1H+YFiLHT1fE4sr7NQIQbEWfa1XI5U3CzjQVpRPMQIAfvUbjLdQcIXEoNlkM6cl+jIgjLYbsUSXFzm4J7Dekz2jIMvtLT9bL2DcA0/YqCp1+RwmoLS5tT98Za9romcbSjyN9EkvkiM36HGwDGr/K68ck2hCr9xTrIdIiWGt+lCQeGoLIa+Wm6EgVVA2ijmVMK2LflJKh8multAdVJZ38eiWQkKpiQfGrCq57SOHONddx5UcBba1bVSr2lmIDyckTq3Hbvnqfu53vn8KF4C8hGuWB3avzbY+u0aB4n81OBWJmx/wy8XA9HHJHDxeXWZEp5qiqoEVR13waCWjj5o0xtOfh/wZrinV8E/Wb2N1uloC28+CVSEwrCDjH7EssqbBUuMZtHRVcG5fZhW9I8MY6vZ3Tb+SAftXX7fZjdI2PXJdUVc5gQgeNe1bl9JDiJlSolfZ2aQzcU3p94g5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTcxYU5GNnBwZGVKbW8ydGxyZlhidkxDNUFMUER3K0M2WUtSZTRNZWpCcjNo?=
 =?utf-8?B?c2V2SGJNcDk5UEcrRWYxMERLN3BPaVJSNGN2Y3U0aVYvUVBuOGpRbkJrMzFs?=
 =?utf-8?B?ak8yUW4rOWZ3d1hZZUpwMW93eDlsaFZsSTJ3ZWVyRGdNNlBkTDF4OFpmamJn?=
 =?utf-8?B?QnNsazFEeGVVZDA1azBSaXdHeHFpaDM1S0xRNzF5SlB6TVdaeHh3U0hNZU9w?=
 =?utf-8?B?U0hjSVh4d2RlUHpLbWdlL2ZpSCs1TVdrVlpXaU1GTkxxbjdqYkhqWTNIc05T?=
 =?utf-8?B?aDlvMmJESUgyQ1p4VjZVZkFCQWVyQ1QrVzl1bFhCdXBPaGpsa1pCNTdiTE5J?=
 =?utf-8?B?VWtjdWdXYWE4OEtxaDVYZW9pc0dqWldOTG1ZT2JZTWt4L28zZWx0ZTZ2amFH?=
 =?utf-8?B?MmhLZU0yajUzNitLOG91Q3NaelJiMDY4b2h6NmNWUk0rTXE5STBjNElNamJw?=
 =?utf-8?B?UmViZHJSKzRmQitGcnpMVGowazN3Q3dDV1d2V2pneEtTbnBoTjAvSUlNSWt6?=
 =?utf-8?B?Q3lYTVdqYWY4czVHaWYxWCt6cnBvMjNQMXNpdVNGOG0rZ0RtcEUvbklhY2o0?=
 =?utf-8?B?bUVYUUlITjl3MVN2V0k3ZTJPcmdtbkF3dzRtT21WaU1mMkR3TVpUbTRCMXpV?=
 =?utf-8?B?Mm5EQ2JZSFRFQUVXaWRQRUZSWFVzenhqMkE4Ym1aM01tMjhiME42NGExSmJ5?=
 =?utf-8?B?NTZUN015U0kxcDhXbmh6RDNnUDk0aHNJUStSRHBYODBSZkVmY3FQN2MvQy9w?=
 =?utf-8?B?ejNQUDdqeFU4Q3dYUmdJY0EyR3ZDQnJYMHRNV2VuZkIzcG9IaDI1MzVlQXpX?=
 =?utf-8?B?QkI0eHp2K21GWVRxNXZuTG4xVUxKbEE4TTRqMGwwdWxJRU40RjNHWXZWUm84?=
 =?utf-8?B?NkpnVVd5OFQvTE5jRGRxbW1uamNZRUxubmNNVXhVUHIyakVsSmVGRUs3Tzha?=
 =?utf-8?B?QjNGaDRBcVh2SFpHb3BHZkM0UTJhOWcvcW0yMkhkZjlqN1NPVEt1enlBNTVO?=
 =?utf-8?B?Si82VE9ROW83bktkRGY0M2hzUEcxUloyLzN6QjVKcWxVcm02a25vKzhwU3lZ?=
 =?utf-8?B?UHF2eHNHZW43Z1BOZkE1MVA3VjZDaEdBWDJCSVQ3eFluRTJ6RXBybCt6bWgv?=
 =?utf-8?B?UVV0V1pBbE1tcitjZGJuY2RqcDB3d1RuQXI5enRqMm1HcjM1dzF3T3hzeUlX?=
 =?utf-8?B?WUZoOTNWbzBvWnoxbGlHZUJLTzgzWUwrdndTdk1ZZVk5OWFFNDJrN0RGRXE3?=
 =?utf-8?B?Ym1UY3EvN01sTGNyNlJ5Qk15YkNNcnNYTkhLTktRVUh3WlZ0SHh0UW5wNlA5?=
 =?utf-8?B?cit1UkJxYkMzaVIzOU80N0VCN1R2Q3FXWDBSTG1DVWNpTE1jTDh4WjBLbzRD?=
 =?utf-8?B?SFFXQXpOQitIMHFsdVQ4WDJjU1Q1ckk5c3VDbms1SVB4c1lYNDlhd24yL080?=
 =?utf-8?B?UWgwSC9FSFJ4VS9zMk5MaUpsbmlVcFlqK0NsS3R2ckRRNENuaDdqL2d3Uk1I?=
 =?utf-8?B?TmVXQ1gzbkkwUVVJamdLV2x3Rjh1eEw0UXo2Zm9uQUlPMGRJUk82YUpuZjhC?=
 =?utf-8?B?QTFhelFPMXlVUjVPdks2QkJWcnQwLzhoNTI2bDVZdENrMWtjemdUT0pzeEVa?=
 =?utf-8?B?Y3RyVUtuWVdJdzBncjdJUE5NNUsrNTZlcENnWEFKV2Y4YVFKaDBKUnoxS3dX?=
 =?utf-8?B?aXRvT0dSb0U0VE1zeVd5dHBjbnp4ektKRG1QMVYwQW41WUNlZlhLbDhZQkRY?=
 =?utf-8?B?UE9oVUhpYWg1NUZYbUpTUXpMQWF4UWVUL1JGRkxMOG5XME9IMVJHTFMzak1S?=
 =?utf-8?B?U29xaW5wWlVxU3c5RHlaWnVOakc5Zi81QkNaTU1nZkNKRlZhaTIzODlHeFBQ?=
 =?utf-8?B?V1hjS2NMUDZNNUs5NXNGb3FsYnowdmcrSFZrTGEvSmZsSmJCN296VDZzcGhX?=
 =?utf-8?B?UW1KRGNrT2tBVmc1TDBxUXlIUHFieW80SVVwNkxWdEJ5bklla1R5eVJlUnVZ?=
 =?utf-8?B?Q0p4OWRsWlFRMno3cnlJcUpEdCtMU3VXV2NEb1FZU3RxR1Rob010YjQ3b0lD?=
 =?utf-8?B?LzVaUzkwSHJYTU1ZWlFaQjBoL3I0OCtpWHhlVkJhZWcvQm9GaWVhaktlcHov?=
 =?utf-8?B?bUpkUit6eVNNSCtpS24zUDd4bEVDRHU0VkdzQ1JFTVZqNTc3TDhwT05RQ0V1?=
 =?utf-8?B?bUY2VU4xWUYyWjIvcTlMUDMvMHk1QVgraEVNcXMveGg1UjA2NWs2T2VycHpG?=
 =?utf-8?B?czQ0T2lnK2IyTW9UdWxmUjhtaTlsT09IMXkxSjNobGRYTHk0R0N2a0hxRUdM?=
 =?utf-8?B?bDY5cDUwSm5QbGV2REpKMG04ditIMW5wTkpGU0tDSXhjVlpOMFNWcnpHRWxt?=
 =?utf-8?Q?benMfIPlephG1K98=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c79229-2515-466c-109f-08deaf589065
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 12:26:44.8656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lOCs2OU9BQjwXMyrtIHwOzdJLeZiTQWFA4snPdSB+gAS/9GE6WUhcfjmKGNiNdb6wg52ZRrfhFRBQelErVWEvTcWRTcyub/gTRj3s9U3Zro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5205
X-purgate-ID: tlsNG-c1860d/1778502409-B5B6CDB1-294C04F6/0/0
X-purgate-type: clean
X-purgate-size: 499
X-Rspamd-Queue-Id: E356950DB4D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:email,citrix.com:mid,citrix.com:dkim];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 20/04/2026 3:07 pm, Jan Beulich wrote:
> Provide support for this insn, which is a prereq to FRED. CPUID-wise,
> while its and FRED's enumerators were already introduced, their dependency
> still needs adding.
>
> While adding a testcase, also add a SWAPGS one. In order to not affect
> the behavior of pre-existing tests, install write_{segment,msr} hooks
> only transiently.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

