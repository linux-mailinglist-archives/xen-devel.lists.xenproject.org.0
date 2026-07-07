Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JvUdOuAkTWovvwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 18:10:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 268BA71DB16
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 18:10:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=csNkcGYU;
	dmarc=pass (policy=reject) header.from=citrix.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1356412.1611047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh8Mx-0002RG-EF; Tue, 07 Jul 2026 16:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356412.1611047; Tue, 07 Jul 2026 16:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh8Mx-0002P8-Ae; Tue, 07 Jul 2026 16:09:59 +0000
Received: by outflank-mailman (input) for mailman id 1356412;
 Tue, 07 Jul 2026 16:09:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wh8Mv-0002Oy-2F
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 16:09:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh8Mu-005LRh-FA
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 18:09:56 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4d24ce-5cb7-0a2a0a5109dd-0a2a4501cae2-16
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 18:09:56 +0200
Received: from [40.93.195.58]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4d24d2-400f-0a2a45010019-285dc33ae673-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 18:09:56 +0200
Received: from CH8PR03MB8276.namprd03.prod.outlook.com (2603:10b6:610:2c1::14)
 by IA1PR03MB8264.namprd03.prod.outlook.com (2603:10b6:208:59f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Tue, 7 Jul
 2026 16:09:52 +0000
Received: from CH8PR03MB8276.namprd03.prod.outlook.com
 ([fe80::8420:cc3e:23e9:7a0e]) by CH8PR03MB8276.namprd03.prod.outlook.com
 ([fe80::8420:cc3e:23e9:7a0e%3]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 16:09:52 +0000
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
 b=a/AEWDPw3QIjl3QmnT4HoDd8DzUzMI7AFDL8G9M3M2+8p9HwHGryRsqpzxZQ2wULfe62KvBwGCYulSWnd8nsQOP514ADk59Wk/FBvMtNReQljaSxWTrlLnkCTEFZs+hpg9kl8dCcPtc0xZDnGnbuVKWfh+EVuvHW0/yKDNkek8H5lIsG6SCsCNlJ6LxEe50yG+c0ysfkcd4MDZAJfH+cWYCNq2porlEH5nwWqeFT6B95q0ae9s7T4DsfSyQOCce/3QcHIjihTOyqA8MFNMxfSXi5MvaD9q2aEY/rQ8gtBDTtd8iIQ+gb+oC2C0lwDHtr3A33tTi0UT131+CoQupHWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJI1FZDTjTmkZxHsHU6cqXxVY6nvta+6C1JDPNO2aSU=;
 b=Q4ypdTTuWehuP230hr99o1i1ZMgS1S5kNqam1xx+oEcIr0IgFl+7dHbYS7c/tSfboODtUVG5UkjlQxDgkNdKLWDGdSFH/5ZocmS6wbEfeKRonBqlVos52WqUz1kULxlkuGvt7uMvbe+8W3fTfKAtJgk+FsV7UCc6mFDwilcl7+OpAxx/OHT2C26i1/LVCbeu6YFedfDV7hFzQgR3la4yIj2RPWDqzzoFX1ui0FVvUkfJjh9tgw74M9LLcKd9zebudF9dp2oAKkcYGQKdiOfsE/L74/dRUafJIHLWVO5mHnztWYMOAoUb2/xQOl9w7pdsxBuzGisJ1X4tSr7+inYRVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJI1FZDTjTmkZxHsHU6cqXxVY6nvta+6C1JDPNO2aSU=;
 b=csNkcGYU6MM1qn3KOhowcEKbTKq5uvDBUapPs6JJF1ILZBYxCqZzp8zFTYn1U4mdm1Ruau4/UIKIFYuhh8RJD2yi+4y0FA4aYMy6okJNEY8cz6zWP0M8jJFU+1ysBgxs/VXdDiPCfLtESwZxnPppD4jRjcpEfCKCm6F+sdEYo04=
Message-ID: <5869bc7a-94cc-46dd-b8fd-b1582e12ec26@citrix.com>
Date: Tue, 7 Jul 2026 17:09:49 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/3] x86/entry: Use PUSH_AND_CLEAR_GPRS and drop SAVE_ALL
To: Jan Beulich <jbeulich@suse.com>
References: <20260706153415.1264750-1-andrew.cooper3@citrix.com>
 <20260706153415.1264750-4-andrew.cooper3@citrix.com>
 <6c4bb5bc-be27-4eef-a08f-1dd96df81304@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6c4bb5bc-be27-4eef-a08f-1dd96df81304@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0299.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::17) To CH8PR03MB8276.namprd03.prod.outlook.com
 (2603:10b6:610:2c1::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8276:EE_|IA1PR03MB8264:EE_
X-MS-Office365-Filtering-Correlation-Id: 39edccf5-d468-48f8-03b8-08dedc422dad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|3023799007|18002099003|11063799006|4143699003|56012099006|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1lY8snF3ExR3Iws2dWKoeYpdDkY3ihmp1CbMkuD2R1vCGQtVoA5CbAy/MlMD7cO8EMN8cW3Z31xvlm8vdbzMKIEwdH2ufTi8/rqU+dTi6VW/x2gkeDe9bArkYldLxKTzlqp563KGBNmKzo6R1S4RpBNs3d98+3j4OTQelpGd+p6G/MMsSqxb/9ZjkGhVTSSnm5xIkZB/dWTyRo4F1o16n73ajZ5wiq24WZv0fiNb6EtH6wVCZ0cq2n6V8CvHLCdLbz/93B0yx0KrCkE0o3Zlkx07Hp5KPKkT6435GviHzy2Iflc8y9Jz59KdDtuOY4lbp4D5zclh4NXt8D5uOutCDxd44ksAaxTWmQGrXU1T63Gg11iUpsVAQI6NgatnWsml/SyKZoJhuTEPnJLbVhEPK9k8ewicFbyeGJ49VnacEkE7APRvkm96dAxhMOq+71lLeBooJyb0X39OUB/TiN2rspwPPpQyDqbbNcYbFJf+e3XiKDTxiRu8JT9SqNn3wTF0H2MU2utFSqe1uSYVStoV/nb0ezihNZ2ggw227UB0anG9KvLgrz7WQY5mY+AHOF6i6rrhnxw9K49Lz3UPFvF8/piiIh8tzVZimwNakHgBrX9LchqctvoHrIGo+lxnuMRlkfnuTqchuOQ4qTmv+I2GaeznQPlGYVrUzNKNMNm89/c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8276.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(3023799007)(18002099003)(11063799006)(4143699003)(56012099006)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3dZRE1sYnN0ZlAwZk9Yb2lNRWIzN2NGbjhHYlN1RUpZK00yM2lVKzl5SHZv?=
 =?utf-8?B?N2MyQUVBZitCZXY3RDZWaUpQcFJxbklOdDlkcjYvb3dLdkZ1anREVTdvaCty?=
 =?utf-8?B?bHFGR2ZxQ0pkZzBscUsydk5IVlB0VjBDS25naDRvb01GQmVxcW9wc3lhWWdr?=
 =?utf-8?B?TmkxbkpHNmhuN1BZVTJoTThRbk0rcE5vc1FkSlQrUVR5dTV4bGxqbGdNN1dl?=
 =?utf-8?B?MVZRVm8xc1I0U1h1bEtlQW5jUExxenp1WGM3amxIQUMwREVlZ2RVU3ZkVXAv?=
 =?utf-8?B?OERoNm1odWEwMkFzNG1OdnpVTWFWdWZHaFZvY1h6WnpnVDdzUTIxdkRBUmNF?=
 =?utf-8?B?QWpPeGhKbE51WFRWNHNnL1RHbVI1RU5Ud2ZjYXhSeGpjc3JISDFOUGZhQjRv?=
 =?utf-8?B?bWtuQVBIaXkyeDQ0T0Z5bGQxR291T0ZWK3lodlVoMC92N09DOHNPdUNmSmxa?=
 =?utf-8?B?ZWxVZDAySEFMVXFEajBLR2VxeUtFOXExMFZaRUFsUWNRZzNoNlo1bTlSUWlV?=
 =?utf-8?B?N0pZUDZIVVhwdlVkeGNDWWFFTXY2enNlZDVZdzhrckJYQ2N0eHJoaFhCemMv?=
 =?utf-8?B?SHoyQ3ZPUW5obVFKVVRMaHVpb2JZM01ITnRTWU1UelZCVGZ5UExDUS9xWnBS?=
 =?utf-8?B?QmJNRkhxR0xtaUJ4WHJIYWoyVnp1a2VBaFhtM1ZZZHVYVVNSM0c5R1pyaG14?=
 =?utf-8?B?cEdBTVNFSE5VSTgrWjhSTjkyQyt3NEh5ZGRkYk4zREIwY2dnM2o3d1I4Q3pz?=
 =?utf-8?B?L1pwd21CRjVTWkpWaysyTXpCUEtndDZ6aWV3T2ZGNnMrdzRQTlBsc3pzSEFz?=
 =?utf-8?B?SGh2R1IzTTA4emNTRnV3cXJoQ3FFMVU0OGJNVEdtbS9OYmxvQ2ZjUzk0M3U4?=
 =?utf-8?B?ZWlVZjNWc3IvQXp4R3J0S2pmNlRrbU41bTlZZmJEYmNpZVJRZGtadDA2eG1k?=
 =?utf-8?B?YzRObWpTQ1hTQWF6ZlVZQTlCdUZxcnBUaFdRMEF4aDB3VGhQT3U0czBnUXl0?=
 =?utf-8?B?Q2x3ckF6dEVZZmJBZDNpQkIreG53OTM3L3R0QkVtSTJLVDJHcWFmcEJhajFj?=
 =?utf-8?B?c1ZadTFWV0RnQXdaNVRFOUppQUg4N0VnY2lSeHpWR3dQZWlQbW13TnJLK0Fo?=
 =?utf-8?B?ZXZJSzRyMDFmZTUvRmdZaXk0UHc1d1hRNkZkdWJFbzBSeUphQVNTN3VVUjU5?=
 =?utf-8?B?ZkI2TVdPOWRkR2RIVnYzVmJMbjBTNTdJUlhTNjJseHRNUEVRNSt5d0VDY1Jz?=
 =?utf-8?B?Q2ZCODJZVWlIbDZoQnVzaUlKSjFjSEc2Q1JWWEc5aTVmaWkwUVlBaDdvZWdl?=
 =?utf-8?B?RE0zOTNHckppODBNM0NPNUNjU2pNNDRJZ2dOTDJRZXZSeGg1ZzdvNC91aGtt?=
 =?utf-8?B?OWtyRWkyNlRpL2RaQnR2ZTVrMGhZRWhaelQrOWdtY0ZsS013d3gvTkdRVjZV?=
 =?utf-8?B?eXN0MXBTQVNZejZVZGQxVnhFaFlHYlFlSlBnQ3NMOVMyYXBIc0pzb0hDaHc0?=
 =?utf-8?B?a21DT1dXUVh3YmpvVENLLytnV2VXZFJXelFoZzJIV2JibUoxa0NTZHJRQjJP?=
 =?utf-8?B?b1g5VTYzd2ZZQXpaTWlnUi9mdTJrek9HQ0NhZ2xCbTJ0NW5nK2U2MjRKeXBI?=
 =?utf-8?B?K3ArejAvR0VJcDVMSzM5Z25yMjNyOXF2bnpQMDIwR3FnN2F2byswN2JFSmRX?=
 =?utf-8?B?dFB5elhjUi9VQlNQcEttWE03R2kvSDB2THZZTkR2YmxGdERDNVIxOHltMkMw?=
 =?utf-8?B?bGZkejVXWVBnN01RUmlGWmV1dlhJT05kUXFwQWtKUUVlVDIvRFBlNVlLcEJw?=
 =?utf-8?B?M3RiTUVidHREME9TL2pVa0g1MVY2d2wzQVkvZUdzRDR4c09ad0UrK1NMOVEw?=
 =?utf-8?B?Mm5PNzJxVXNwS2RJSlVpelk1MGkzNUErd3RxdnBsY2l4WGRqWWFQTzJrT05x?=
 =?utf-8?B?RC9zcUh5Ky9uNjg5U2RMTjlaeDE3L0NJUVhOZ2pBWDdOWTUrWXlFN3JPTC9F?=
 =?utf-8?B?M0RFcXVvVm5xOG1PVnNvVmx1Y0Z6YWI4bXplVUg5dktnQ1hmS2xaMXM5bkNl?=
 =?utf-8?B?NnhsNWRndDRMMFlUd05oRFVYRnJUaTNPNnl5cVdPQUFLTFJIUmNRSC9GTXlN?=
 =?utf-8?B?aHFRVXQyMExlbGpPVFVMRG4wMEVoVkpFQ0FHd0h2TDltVzFYVFI0MzJGZlEz?=
 =?utf-8?B?QndlOForZUVocWhia0NwRHlTcERYNDk2SnR6OFZxZDNEdWR4a2hKNEl4UnJJ?=
 =?utf-8?B?SHVSUnFaY09JcmZrUXlDWWszdUs4WWxsVWg3VHV5cmUvZ1krTm1CZTRuTSty?=
 =?utf-8?B?ZTloOVgxMG9KZjFTbGxVYzFKTVhVQzRtLzEwVGpvemRIb1U3UHFUdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39edccf5-d468-48f8-03b8-08dedc422dad
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8276.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 16:09:52.6339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/SYmHv/hntAi9kPYb/0ISEDk9DOW8L1KAaTxJpk9lSoVYFY/gSgFYnaJjyZYj4Hn3z90+MZHx65wRyYb6ZdjPXbnUwXId5Ce0f5+X2aI34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8264
X-purgate-ID: tlsNG-d62444/1783440596-822DD1E0-3051FFE3/0/0
X-purgate-type: clean
X-purgate-size: 2437
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
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
X-Rspamd-Queue-Id: 268BA71DB16

On 07/07/2026 8:16 am, Jan Beulich wrote:
> On 06.07.2026 17:34, Andrew Cooper wrote:
>> PUSH_AND_CLEAR_GPRS is shorter than SAVE_ALL in terms of emitted code.
> Could patch 1 perhaps also gain this sentence?

Done.

>
>> lstar_enter() and cstar_enter() do not need CLD.  The SYSCALL instruction
>> sanitises flags based on MSR_SYSCALL_MASK.  For all other cases, place the CLD
>> instruction next to STAC/CLAC so the flag handling is together.
> And really the earlier the better. Relevant perhaps for early_page_fault(),
> which has no CLAC.
>
>> Get rid of the compat=1 special case for PV32.  It's not obviously a win, and
>> PV32 is getting increasingly rare these days.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> Bloat-o-meter reports:
>>   add/remove: 0/0 grow/shrink: 0/12 up/down: 0/-518 (-518)
>>   Function                                     old     new   delta
>>   symbols_names                             135277  135276      -1
>>   symbols_offsets                            53664   53660      -4
> Interesting. Likely an artifact of padding going away between two functions.
> Which likely would change again if the SLS patches would finally land
> ("x86: guard against straight-line speculation past JMP or RET in assembly
> files" here in particular).
>
> Btw, as it occurs to me while mentioning SLS: Judging from the patches I
> have, IRET looks to be immune, albeit I can't find any statement in the doc.
> What about ERET{S,U}, uses of which we've gained only relatively recently?
I think the bit you want is in SDM Vol2.  For ERETS:

"Instruction ordering. Instructions following execution of ERETS may be
fetched from memory before earlier instructions complete execution, but
they will not execute (even speculatively) until all instructions prior
to ERETS have completed execution (the later instructions may execute
before data stored by the earlier instructions have become globally
visible)."

and says the same for ERETU.  Sadly, "following" is ambiguous in the
context of SLS, but an ERETS-to-self could end up legitimately executing
the next sequential instruction.  Either way, the "not execute even
speculatively" is the property wanted.
IRET notes that it's architecturally serialising, which is a much
stronger guarantee.

~Andrew

