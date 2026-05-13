Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAMhLLRZBGqjHAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 13:00:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 060EE531CBD
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 13:00:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307793.1579368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN7J3-0003PC-D0; Wed, 13 May 2026 10:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307793.1579368; Wed, 13 May 2026 10:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN7J3-0003NF-9e; Wed, 13 May 2026 10:59:13 +0000
Received: by outflank-mailman (input) for mailman id 1307793;
 Wed, 13 May 2026 10:59:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wN7J1-0003Mn-Fm
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 10:59:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN7Iu-00Bd2k-E0
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 12:59:05 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a045979-5cb7-0a2a0a5109dd-0a2a450b960c-0
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 12:59:05 +0200
Received: from [52.101.48.2]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a045977-212f-0a2a450b0019-34653002309a-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 12:59:05 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN6PR03MB7599.namprd03.prod.outlook.com (2603:10b6:208:4fa::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 13 May
 2026 10:59:01 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 10:59:00 +0000
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
 b=TA8R9o02xeMfGYTjtPSmiqIpkYMDbh2CMqN1KSXCI+mHe9sDxsQWrJd04nfSMrS9JL+bQwxP0Lh5zpKm3GZSHHWm0SID3WRC/3xcJboTNB7VE4388ym6zm75T+ee8UTM7GH5We7VC2snWEhDL8NLeZ2kWu4L2hSmLuyH5GmjYq5KBGaalB9haQp4R9cEzTDUVXTyBErhkymLEOvMz5/uPPFp7w1KmnrJWpX1ftKFcMHUnQ2GpcpoS2JdezOe8gJfyoo1JVh5IFWpXB2k4+vGcFxE4G8pPeGcwMMlT8lK/wUgAdKjEfVTMTXm/jCC/vbS2B2HHmeXZdDWI5z13+Hpew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2697FogvK+GbgqC3vp/4msEAktZ6w8pUzrzsytVNV0=;
 b=YYB8OgPEq3I7sDujqGAwBN6NFwtok+myZZUK3j9MHOEY+TvVDaxxJY0oEaBRk0spuoPGG9WIZH58pmWXmJht5N6cOzWet7WWP4Gn38BxfH96zsrRubWVh8h4BTkaoW7nKFNcBybv7nOEDaK2gFepQDQgm1yCyY+deNqlS2j+QI1Y8QsRFuw4T5OGn7uQUJ2yg4EmI9Vj0c2vpV5FVoCAe2/n90j5qOCw4N6MrIyV8P24zxg8xPvBYitgT1qiYxch3esUQPLXBDIgzxJKFrpFqDNBmmRp/q99nIISSKbWmoyek32pD1rZG1BAtC2Wtd9gqeV+CJvLxtGZObrJWV7fZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2697FogvK+GbgqC3vp/4msEAktZ6w8pUzrzsytVNV0=;
 b=gVYFFCVF6gmlE6RX/aniIVAFBIEXJdRPT6hlr+DDaCyuDwtGJdFCWtdWegnnEAn+rfUv8ZntuPHDHFe1/LQWx+Hi15+YKS+kOMzKBeoOHwMNdymVR2Xw84MRskXoNpO8LiBLhXdsOXhopahAWNu6X+u5Op4TjBduLyNmunNO0tU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d6bbc387-4049-4c0b-8d30-34a287393cfa@citrix.com>
Date: Wed, 13 May 2026 11:58:57 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 4/5] CI: Add a Debian 13 (Trixie) arm64 container
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260508212907.1643761-1-andrew.cooper3@citrix.com>
 <20260508212907.1643761-5-andrew.cooper3@citrix.com>
 <249ca124-b144-4c50-a0fb-3c0e6db5a1ca@amd.com>
 <d1037e15-cde7-40a1-9011-a02c23e870e8@citrix.com>
 <36527d70-da8c-454d-8de4-54c29c3bd565@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <36527d70-da8c-454d-8de4-54c29c3bd565@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN6PR03MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c4f6fd7-b679-493e-0118-08deb0dea39c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	rcrs8xzJXlLRp76MqjyOOBw/ObppYfBIYO4NTB70S35vZhOyLZDOj9w175J/nWrfxVOz6BfJWT6mKaj/Y+SnMQ3JCajtcv+SNJY1rabhoB7lxl210M5m5uzu9nnRk4ePR47U0jkHskSq8LG/t68pnMpTNqgTg79VUZJDN7SCFR2pJfEK4bmejXsHLk/MauiH2xontDqnBEf064wk4uHu0WEzaRBsaYVSXC6we6h8uV15S2QUy7b0dwvJHCUu0X8hW6JFFrMnRo6H+XwDzBsA/GaocpBi7b/brivPzQ9WYY9jbv0QJGU+071w7+ir6+tbKQRQEtk5Te3vt0xdPdUtyfXuPUj4p0NtKZ5+ETSvR9uDyILjkMMzbPlJBjQfr5SHXJhDPzLZ8R2mrTAynN2P1p2tMvM5rgyN9dqfu0/ys1+1u22vLsa4/Dqsopg7C+hiT6WXbFCtGdXQ6c0mE+spS6Uccc/LwdIgA5xhCbBJfOdoBxZ4h9e09UeyA2Yno9CYGUi9kSMuqXn0FY5TRNCWF0uMGtWYOiFV1/ltHBY4eMGInIaspuY1wgIwi5iWf7bId6fHAr9D8kwafJo+kH3YtvBw5uPWf7cy8nIiAdcVSDctpBP9xWIQ6untjavfR2Lh1LDqVv2Z4OwHd9ya15fWIBDXaj8XfdC3K/0KVEhBVF3tvsdQtajlJbSTjGyqXCVG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjRHT294RXJNak5HR1A4dE1jcHl5MEZ5UkR5c05tb2N2UDVMUjRTZXVZazJV?=
 =?utf-8?B?bGRhUjJKdDU3YkY1MkhnSFp1bTZBZG0vTjhlby9kcndxSHB6akc0UEo0SFVT?=
 =?utf-8?B?bVZMaCtPQlQxcFFFVTA5ZEJ2b1haODhzWnB5cnRJVDJhS1NkNzk1SUxhaE9U?=
 =?utf-8?B?blNSUnBOUCtsSVI3cnVUUFRLUG5KV1ZrR2NRcS8vczNnWklsMHZvUFgzcDNv?=
 =?utf-8?B?L2R0MW5lZHM3UFY3WEdWQ1U2elpnYXZpUVFiMExtUkUyWGNScXRjMXhYQXpH?=
 =?utf-8?B?V0tBeHlxRmJmemRVVW83cVMrSVBwaXdWamFOb0FQbStob0VHUGN1dWd5WExQ?=
 =?utf-8?B?dVJyTHd4SE1HTFppSnhiK0pWcTZQYUtsWktXcGhIQXdpWENvaEVYaFh6bXUz?=
 =?utf-8?B?bFBZekhESVRNVFAxS2R3NURBVzBTQzlpRDFuMERrbnVUSjdSWWpXOGN5d1Yv?=
 =?utf-8?B?RVQ1dGxnOXB2RE05WVM4UE1saEVET09RWTNxZmFMd3BVc3pkcmlyVUNFeWVk?=
 =?utf-8?B?cU5xbEkxSFZkSEFZS2NvOW1MMitOcEhzMmJIRXlwY0lFMFZ3aTFWNTQxcDR1?=
 =?utf-8?B?Zk02bndUaGNtWERhLzlwVzNhdDRZc2dRNlZvNERNYmVDcm9CMUZMR09kOC9P?=
 =?utf-8?B?eFIxUHFFb0FkV0NUV3A4ZjUzQzZMOVRYaGM2U2x3dlYvNWtXL2Fjbysxem8v?=
 =?utf-8?B?bzZTZzk1WVp4NDNUYVpVVTF6cVhFU2VOb0p2VUQ4dThyYkwxVUZUMXhPc202?=
 =?utf-8?B?blc3MTJzaUZWOG1uZFQvblk3dG02VWprTWRWRE1SWGtRbjZxRXpSNGZ0b0Zu?=
 =?utf-8?B?T2lhVHpkRnVnelRNU3ZsN1crdWlaK21aWGFEZEJ3dXBURkszNmFNbW9zbG1m?=
 =?utf-8?B?bkliSXJvSEd6NWd2SmdSQk9vQW1iTFFSQm1GSEdYNHE3eG5nU3lOK2QyRlhW?=
 =?utf-8?B?TVU0WkJTNWg1dTJuTDdtWlB2SXdNZlZHazlRUHVITk05cjZySGlzQjl3SDRI?=
 =?utf-8?B?bFV5Nkh3REgreG9jek5UMjNHMll4c04rYkFMWENjNmljczBYSnY1Q0JQZ3dL?=
 =?utf-8?B?QU1mUG01SlRjdDBsc1YvNnN4cTNSNzJwakt0OFlXQUJqeGgyamV0bFF5NHVD?=
 =?utf-8?B?UFE5a0pjcFBIa20wWlRPR24raDZwSHVoaFdNb0cyQmNjOGV3ak5aeVhUd05z?=
 =?utf-8?B?WStLeit6d1hFb3hIanY2ZWxFVFNxVEZrbG51dnUrbkxIVlVkWlk4ZTBlL3Uz?=
 =?utf-8?B?RzdNcXZoV01MZXd4RFlvbi80Nkc1VmNvN0RGazkwdm0vR3hQQmJubTZnTGZl?=
 =?utf-8?B?ejBHcVJCUE1Da1BNczVjV3U0T2dneFVuNXV0c1NlSk96Mlovdkx3aExsOWxK?=
 =?utf-8?B?KzU2T0F4S0d5dXgyQU8ycklxUnVqa1pyRkhLT01ueDRsNEkzNTkzalBPSTlr?=
 =?utf-8?B?cE9HQ2gxMEp6Z2JJS01sQ3JsVGFVQjh1Q2lKbzg4L29wMGNybDNYK28wOW14?=
 =?utf-8?B?VDg1YWlFQnNTMWJLZ0ZXdjdlMnVVKzl6alBOaUlqR2hWOXFEb2FXNGtaMFVj?=
 =?utf-8?B?R1A0VlZSV1JZaWhOVXYyMjJkd05tclBTTk9kdWN4OU9VUDNXdktzQzNWakJK?=
 =?utf-8?B?T2FjV3pEZmxtNk82akpleERqNVQvSjBHaUNXd1VJZGFkMUlXaWF4cTdwTU4z?=
 =?utf-8?B?eS82ckNZbVAwOHRUa3VNV1U0akJXTUxtRVJXUnFKUEpEaFMrQWpKY0ZrdmE5?=
 =?utf-8?B?VHloUENqeGRHbU1zdWpYaFd5Ykc2NDVOZitlVkFIazRxZmZRbE4zZUd2aVkv?=
 =?utf-8?B?Z291SEE0VmRrYVZsS2Zsck14Qm5ZekwxNmt3WGxGVHB2SzVYVDRBWU5TOGg5?=
 =?utf-8?B?ODcybHl5MlN0VytiZ1JWMkFoSG96L1QzeTNPVU5CQ1BNb3VtRG5lUG1mYVh2?=
 =?utf-8?B?d0xFQy9zRVFmRVVieVhYTjNubFJOQXFYcWJOK0ZGOHRKcUdpcG5MTE1xaWpv?=
 =?utf-8?B?czlZWjRjTW15SWxqbWkxZEhHT0RwRHZGaEpJeXN3NkpQdjlldVBqa1NxTm1v?=
 =?utf-8?B?L1lRc0ZxakMxMjY3Y2xTdUxtN2lWYlYycVlFenhLUTNFamQwVWxmQmNTWTF6?=
 =?utf-8?B?S1owRjcyN1o2MktXWERSRDhob1RyaVRrOHZMWjhtUjJIcjIzTmg5NWQ0ZzVT?=
 =?utf-8?B?NUp5YUNHa0lXWXJlR29UL2JDUEVuVkJENndHNlF1SDZhV29TYTMyRXdrQnFv?=
 =?utf-8?B?bHRNa1pQeTBUYXBId0xtYUhLYThEL2hwZWVnZXhXNjIxQ3NNbmE1MG1aUTZ3?=
 =?utf-8?B?d0g1TExSZG1wTUJzWFEySWtMT3RVUUk3RHM1TlNYY0NRWnU3eUNhK3NFWnNn?=
 =?utf-8?Q?Mki8geigBQJs/bcc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4f6fd7-b679-493e-0118-08deb0dea39c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 10:59:00.9080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5jgT+FYcixwUIuhvUDvhG4R1v9+Ivtt7p6aSL9ecHE9LqLyJsb1XP0DVDgi/4KglTjiQpYr0LGJ2WefrY+HHPw9bWt5bJNpEGkTIpdacGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7599
X-purgate-ID: tlsNG-42698a/1778669945-20C7DF3B-0556E012/10/63158204843
X-purgate-type: spam
X-purgate-size: 6341
X-Rspamd-Queue-Id: 060EE531CBD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:email];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:cardoe@cardoe.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 13/05/2026 7:32 am, Orzel, Michal wrote:
>
> On 11-May-26 11:21, Andrew Cooper wrote:
>> On 11/05/2026 7:29 am, Orzel, Michal wrote:
>>> On 08-May-26 23:29, Andrew Cooper wrote:
>>>> Exactly as per the Bookworm container, but additionally with the ipxe-qemu and
>>>> qemu-system-aarch64 packages.  These will be used to remove the export jobs.
>>>>
>>>> Switch qemu-arm{32,64} jobs to use this container.
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>>> CC: Michal Orzel <michal.orzel@amd.com>
>>>> CC: Doug Goldstein <cardoe@cardoe.com>
>>>>
>>>> We should probably wire up some build tests too, but it's too late on a Friday
>>>> for me to be thinking about that for this posting.
>>>> ---
>>>>  automation/build/debian/13-arm64v8.dockerfile | 71 +++++++++++++++++++
>>>>  automation/gitlab-ci/test.yaml                |  4 +-
>>>>  automation/scripts/containerize               |  1 +
>>>>  3 files changed, 74 insertions(+), 2 deletions(-)
>>>>  create mode 100644 automation/build/debian/13-arm64v8.dockerfile
>>>>
>>>> diff --git a/automation/build/debian/13-arm64v8.dockerfile b/automation/build/debian/13-arm64v8.dockerfile
>>>> new file mode 100644
>>>> index 000000000000..b9062ee8b443
>>>> --- /dev/null
>>>> +++ b/automation/build/debian/13-arm64v8.dockerfile
>>>> @@ -0,0 +1,71 @@
>>>> +# syntax=docker/dockerfile:1
>>>> +FROM --platform=linux/arm64/v8 debian:trixie-slim
>>>> +LABEL maintainer.name="The Xen Project"
>>>> +LABEL maintainer.email="xen-devel@lists.xenproject.org"
>>>> +
>>>> +ENV DEBIAN_FRONTEND=noninteractive
>>>> +
>>>> +RUN <<EOF
>>>> +#!/bin/bash
>>>> +    set -eu
>>>> +
>>>> +    useradd --create-home user
>>>> +
>>>> +    apt-get update
>>>> +
>>>> +    DEPS=(
>>>> +        # Xen
>>>> +        bison
>>>> +        build-essential
>>>> +        checkpolicy
>>>> +        flex
>>>> +
>>>> +        # Tools (general)
>>>> +        ca-certificates
>>>> +        cpio
>>>> +        git-core
>>>> +        pkg-config
>>>> +        wget
>>>> +        # libxenguest dombuilder
>>>> +        libbz2-dev
>>>> +        liblzma-dev
>>>> +        liblzo2-dev
>>>> +        libzstd-dev
>>>> +        zlib1g-dev
>>>> +        # libacpi
>>>> +        acpica-tools
>>>> +        # libxl
>>>> +        libfdt-dev
>>>> +        libjson-c-dev
>>>> +        uuid-dev
>>>> +        # xentop
>>>> +        libncurses5-dev
>>>> +        # Python bindings
>>>> +        python3-dev
>>>> +        python3-setuptools
>>>> +        # Golang bindings
>>>> +        golang-go
>>>> +        # Ocaml bindings/oxenstored
>>>> +        ocaml-nox
>>>> +        ocaml-findlib
>>> Since this is a container used only for tests, why listing packages required for
>>> Xen and tools build?
>> I did leave a note about that.
>>
>>>> +
>>>> +        # for test phase, qemu-* jobs
>>>> +        busybox-static
>>>> +        curl
>>>> +        device-tree-compiler
>>>> +        expect
>>>> +        file
>>>> +        ipxe-qemu
>>>> +        ovmf
>>>> +        qemu-system-aarch64
>>>> +        u-boot-qemu
>>>> +        u-boot-tools
>>> So after this change, even though you replace debian-12 with debian-13 for all
>>> the tests, the debian-12 still contains the unneeded packages (i.e. for a test
>>> phase that it no longer runs).
>> Yes.  I can't do this series bisectably without it.  Also, in the past
> Ok, I understand the bisectibility problem.

On further thought, I can in principle fix bisectibility by introducing
Trixie first, but that loses the logical sequence of events somewhat.

>> people have explicitly requested to be able to run the qemu smoke
>> testing from the build container, which is why it's like this and not split.
> Unless it's a rule that every container follows and is documented somewhere I
> don't like this argument.

It was explicitly requested by ARM, and accepted at a time.

If you'd like to revisit this decision, that's also fine too, but I
don't want to be flip-flopping on it.

I could:
1) Make a 13-arm64v8-test.dockerfile containing only the test phase stuff
2) Switch to this ahead of the 12 cleanup
3) Do the 12 cleanup without the test phase stuff

although this makes a new scheme that we haven't used before.

The one thing to say.  It's almost always safe to add packages to an
existing container, but ...

> My plan then is to do the clean up of Arm containers
> in the future to remove packages not used.

... you can't remove packages from an existing container.  The
containers are shared by all stable branches, and you'll generally break
older branches by doing this.

Where we have dropped dependences, e.g. ae26101f6bfc, I've commented the
dockerfile so it doesn't get copied forwards into a new container, and
can be dropped when the identified version falls out of stable support.

a0e29b316 is an example where the containers did get rebuilt after the
version of Xen ceased being tested.

>  It creates more confusion for people
> willing to create their own dockerfiles for testing (or just to see what it
> takes to build e.g. Xen on Arm) than it gives benefits.

That's why the dependencies are grouped and labelled.  I do expect
people to be able to figure out the bits they don't need based on the
comments.

>> Honestly, I was hoping to leave the Trixie update to the ARM
>> maintainers, but despite the Bookworm QEMU (7.2) being newer than the
>> 6.0 in the export jobs, it contains the SYSREG interception bugs which
>> prevents hiding ThumbEE from guests, and breaks all the arm32 testing
>> with a Linux dom0.
> Does it make sense to have both Debian 12 and Debian 13 build/test? Can't we
> have just the latest one?

Build, yes absolutely.  You want as wider range of compilers/toolchains
as possible.

Test, we tend to only do one.  For x86 it's the alpine build; for ARM,
it's from the Debian build.

> All of the remarks above are not something that should prevent this patch from
> going in, so:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks, but lets see about the latest proposal first.

~Andrew

