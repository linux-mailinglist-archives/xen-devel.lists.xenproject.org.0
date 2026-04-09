Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJmOLRN012nTOAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 11:40:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 292813C89DD
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 11:40:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276921.1562236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAlrp-0001ep-4s; Thu, 09 Apr 2026 09:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276921.1562236; Thu, 09 Apr 2026 09:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAlrp-0001bb-1p; Thu, 09 Apr 2026 09:40:05 +0000
Received: by outflank-mailman (input) for mailman id 1276921;
 Thu, 09 Apr 2026 09:40:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wAlrn-0001LL-K9
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 09:40:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAlrm-00129k-W0
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 11:40:03 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d773eb-e002-0a2a0a5209dd-0a2a4508db14-24
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 11:40:02 +0200
Received: from [40.93.198.1]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d773f1-fab6-0a2a45080019-285dc6014cd9-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 11:40:02 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA2PR03MB5785.namprd03.prod.outlook.com (2603:10b6:806:119::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Thu, 9 Apr
 2026 09:39:59 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 09:39:59 +0000
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
 b=aw/SqIH+Suv+vtKxAs/IiFog3zIHU0c89AMtjn1VJmJpCqyrOlTKWDnGVzK4MdD7A1H+DNh23vXcJW/v83Z8xgg4CTV9dspN3wY7i1qMNZv7myZrkjURq6YYHr8T/CNzcnDLKmuHXk2bcESjkbwIljFCQMuVzgOAC/lYy6DzWK748bcJT5gzDTLkLSO3XxsYSju7oYrVJKr7J5lbslz8Y1Tgeluvihnhsnp003C9eK8Ssa5W6OTayt4m4YZ2v4BDbgCyNbYYb8+OBBIDLo4+jIhXaaUk8knvc9jT6+nQIsqYRi6cSJn4Qv6uOV7coZGJkiig508jpecnSSRwTiQqww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOxvfhRzXM3bOYL/bM+QCj0XR/27X2u91zMUEfTG5jw=;
 b=wr4u0HtbE5nBQ+JgKIsPGZkqDecDLiEftvcVFfLpDscFZXDh+TgazCFy7IZhBfb9t9X9W7b7gLptxr1hsJq1/e8exNKJahRcuKsAM+Q29jyUzLeZYikJMV4JEHF6zeMU28woUR7PpF4r+mzcK4XmWxRIitoauxqYBUPvCc8pJ+8kS/hNzUpa25m6lmqpFTu+AIBTJ/iok/97n5LBHMKj7QKJ425+lGS+klK0PHGNfpe0g+Y53L7N4d7hQihA5Mh41xQCu6fZgM2aFSLUB9U4WWAUCEUAAw+olnUgLGdZoitLrrKhNmL7yz0hxDSCTBzJvZMrgisXeOlZD398g8q3gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOxvfhRzXM3bOYL/bM+QCj0XR/27X2u91zMUEfTG5jw=;
 b=VGNLpZu3eM1iRCDHFbnHAOhnBhui5jWHquFEU6inbgzNV2ENBnHV0Z+IP5uuXPXbWjQEleeVHwcyq+nf1FU9h15qwOiIs8VPAhICap39z634XVzaJcWdO3/cywfF1a16ItWYNNuvFBgdtg9hgVPWxee1cjq4EQ2bCirHaAJBZkU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <35802158-a43e-438d-b20a-8c748819a1f6@citrix.com>
Date: Thu, 9 Apr 2026 10:39:56 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH] x86/APIC: handle overflow in TMICT calculation
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2fa2fb41-cb62-4a1b-84cf-822b2f97bc2b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <2fa2fb41-cb62-4a1b-84cf-822b2f97bc2b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0444.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA2PR03MB5785:EE_
X-MS-Office365-Filtering-Correlation-Id: f1a86ce2-bb2e-4fc2-960a-08de961bf779
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	6mHNABucUx4qp5iMFli9Lw9VJOYo3gjy/vpxVF3dMWeSpzy0TY43IhYkx6jca+87a/0bUBn2UQ3p5Zm+5rh1YETIG+ttf93YPYMJCs5q/CSIs5m7s7WK8uxAgQVJN/m/Wj6lIE5UXhcy2lEipl3sLccUaIrz9bUdAM6s+xphpR97bFATfVudwdC9uyShXETEzF/sYrWwjT2S9GqyPc82o0mcv7BK3i0dnD389l4LSqVYG9leJ0I07BP4OKuL8QeMu5AQ66EYfQuNCaueWXdq4w7VZ7klHsdMkKQlqrKtEGKFkdi3at95PORpyw+tUV2GomU5oZsb7Tj5LJbK42ATQCxfXU+2fCLlFR4PaxIfUefF1YncFmB/PMGIIeYoXcIal5QnsNenVHgOb8JR262rzKZgJTmH2OeUbV2imQt+QHq+okg8OoJ27xEsVaoobkAqOHZXgTGpy03yhd23ey/icLNWh0TP59Tt012KmhqoiLmC5c5UtGiG/m+a7ciOEc0ii+681MWiHGg7i4COqvtcVHa407ORAzZYLiia1qoUDG5Wz0Ab7dncRAvQwhPvDa/RLrCffvSLi/Cp1NIZout0GJc72aQINHNamOLrsyxqQgSsYKguLqWL7NNq7/sg7y4jDEfjA6tqb/IhULRCoboq9vuS6ohWpi28VnxtJi4MnT241Dolv67CkliKzbgQuDRQebSqwR2J3rjqY+nDkbGt56w2JQ+pxhn4NoDNzhV2rMY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V29uM3gwam9nVmNPTUV0ZjRzNVNHc2JiekhXVTZtM0x4R013Y0dFTCt4elJP?=
 =?utf-8?B?VlQ2OC9LTFZhSnZ0ZmltUmlmYjRhS1JLYXVUdStnRWRVZUFtOVRVVksrVlU1?=
 =?utf-8?B?aW1hd2xsTWVjYkZOSndwOUhVaU9xSlFObWJwZXRabGZobXI4Y0xUd3E1Y2xp?=
 =?utf-8?B?Ujczbll6cDRCVTNpa2t0TExhRHhvbzlOQWIrd2p0TDlQV1VyaXVvYWJTTE5s?=
 =?utf-8?B?ZFlyMDZXT01WUCticmp1ZmJFVjVvanZ3SWFpVnR2cEhqSzhFZ051SldUdm00?=
 =?utf-8?B?aC8xNEdpaG9vYkRJUkU3ZVBPakU1T3MxbzNMNzVkSWhUcEtZSzVTWWE1OHpm?=
 =?utf-8?B?T3B4ZmRCVjl1YnpPK0kxdlc5UDd0T2lSOTZkRVY5SUl4eEVXdnlnNDR3UGtw?=
 =?utf-8?B?ZlYvZFA1UW1VUHdlRGNhWmNISk5hdm05K2I3cWFZdnJQYi9DSThPQlYxaU5z?=
 =?utf-8?B?Sm92NENSdnc4Y1JaSnVQd2ZINk9ZRmptK2tHalRLZWRZTlY2UHp3emV2WXQz?=
 =?utf-8?B?NW91VzBqVWpQU1BvbzZJRUl5MzZNd2ZiUmU5U3RyOUNSaG1kSlVaNlIzR3Jn?=
 =?utf-8?B?NEhRUnR6eGUvcjJIc29lMm1ETTBrRzF4dkxLYjhMcDloSCt5WmM5ZnBLR3cy?=
 =?utf-8?B?T3UvZk05RncwWjZsN0NmS2FiYThWbWNzVHdPTEhlRVNXYy9wT29Nb3JuWXgv?=
 =?utf-8?B?cGlsUit1MFJnY3RUNEJIT25ubGJaQ3JBNTFYWlFlSHdzOENvSEVmQUxyZ2V5?=
 =?utf-8?B?Y2FYYUJMakFpT3V3WTVmNG44Zk5tdmF5c2IvaDYrMCtGQ1hQdVhJcXVGVTZP?=
 =?utf-8?B?bGtiY3hCMEVxMW9IL280Ykc3ZkUxWTVUY3BLdmhid2MzSEJUVjRWVWpMOE1o?=
 =?utf-8?B?V1ovTEtNZzhVYWNSSk9YVGpWbXdQMkNRVDlxdE9qcW92YjBmcTBYYlZPVDRx?=
 =?utf-8?B?RE5jbjdRSm5SWHc2SDZZNGNyZnJrbVBsK0RkRE9YWi9kUVBzWFNiR2RSUWJL?=
 =?utf-8?B?VE0wNUMwTXVCNEFUSlZUTjBydXhzNkFkTnZRN05qQWlXalptYlhrNVNzWDFn?=
 =?utf-8?B?TE80eDA0c3o2Z01VZ1hBTE5ZZ0YrU1FWTjFJcnlNOGdiYktEWXdVWW9NS3NH?=
 =?utf-8?B?MDJNN0hxTnFycW9xbVBlU0t0b0lwV08zZFhiNmdOS3R5MERaTzhUbTlHUHlR?=
 =?utf-8?B?VFd6WDcvTmp6eHhjak16VGE0ZDUwNjZldmNsZXR0TkRPVUdmaE9pWGJZVWRw?=
 =?utf-8?B?Y3ZjdDYyVHVJU2wwZ2FvcTRDVnJlbEpKMVB0Y0tPdElFSE52Z0dxMjF2NGRx?=
 =?utf-8?B?VktOaEpLMmJlRnl5djh3QnJDVzlJRG5NWFJvOHd6OVpqMG1WQjN4Tkhyc0dW?=
 =?utf-8?B?T3BYdUdTWG1FeUZzSm9ncTZXSUdxSWJibEJJQ3V0ZmJoQzBtVmJ3RC94Wkhn?=
 =?utf-8?B?cW12YTFGYzMySzM4bkhOMVNXSS9kbm8wUmlnaWpEMmFiaEk5Tlo0anR1b2No?=
 =?utf-8?B?b2phSngwcE5yVWtVQ0hQNFdkclZBS0VITEZPVzZGMEFwSEEwOTdqK1p1OUVN?=
 =?utf-8?B?cDdnVEdQV1kzTTY4aXhyeS9rTWdJWEV6eFJxWTk5NDJLR1B1Y1Ryb1Y2QWxN?=
 =?utf-8?B?Sm1EVVNVQS9nalJidlIyV3NUUUYxb1A3ajFjbjhhQlVYZ3BiRDczY1o1TG1Y?=
 =?utf-8?B?NTBBSmhqb3VvaDhLV1FUSktabmJsUW1TN3hwcFNvZ2R1LzVjUm5VTUlHUStx?=
 =?utf-8?B?bGxGMnovRVpMbjlPczA2QTdvcjhHZGlHNm1HSE83WUJUZi9uTVJnc1pKbElN?=
 =?utf-8?B?aGY5TXczR0VhZnUyUEVaOGNxVEZ2UjFlM0FDeW1CdjNiell3MzlTd3hWL2xs?=
 =?utf-8?B?Q2p5TzhLRVg0TWRXaFVOTkRnS09zb08rcitNdFpwS2pubWJWWlBFV1ZETDlt?=
 =?utf-8?B?VmliQ2UyWjI1cnZxSndGSU1PSmgyN1Uza0VVaXM3VndNT2FSU0t4NUoyMEc2?=
 =?utf-8?B?WmpBdjdBcG9Eczg5Y2RTc1dFeHQ2WGU5NVgveFFqaUx6cHJTRWpmUkdxUEp4?=
 =?utf-8?B?dXJ3SjJYQlhOd1VTeUZqZTd2TzR2WnZZQ1gvNWNzcXM5Wkljd2QrUnBHL1p4?=
 =?utf-8?B?QnhNOUh3dWQ3cEpsbitGbkwwZUlpc1BKdDY3UGhrSjFvMGRlbGk1TjZWYlY5?=
 =?utf-8?B?M2pzbDl6U2pmQW40Vk8remc2Vlh5L0xQRDFVeklRdHJDdHhueEhodmtvdVFW?=
 =?utf-8?B?N2s1Wi8vZWIzbFJPcUF2cVFBeVVZNWJSTWR0K0EvT0ZzbXhGYi9yQUFFa0dR?=
 =?utf-8?B?SHFXZm9ucHlVcmVwVWowU3NSeWdIY1RoV3BiNzV1RmpDSVpuMHlBODJ4WHJv?=
 =?utf-8?Q?HZe9n1fZsLATa7WM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a86ce2-bb2e-4fc2-960a-08de961bf779
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 09:39:59.4209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1gCjk04M8z3orqpLG2iC913X+v/LaVqgi/dM2VMmC4uOROaNGMB1PT0Hk5Uono/BwfvomRueFmxILo1urXGBY1LHXwx9tAX5hoxme0b+0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5785
X-purgate-ID: tlsNG-c1860d/1775727602-77D43497-62696A1D/0/0
X-purgate-type: clean
X-purgate-size: 1940
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:stewart.hildebrand@amd.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid];
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
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 292813C89DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09/04/2026 10:21 am, Jan Beulich wrote:
> With an expiry value on the order of 20 hours, and with a bus scale value
> of 256k (as supplied by qemu), the (signed) multiplication will be UB. As
> we've checked that the value is positive, we mean unsigned multiplication
> anyway. Yet let's play safe against even larger expiry and bus scale
> values, leveraging the compiler builtin that there is for this purpose.
>
> While there also drop the stray cast from the actual TMICT write.
>
> Fixes: 9062553a0dc1 ("added time and accurate timer support")
> Fixes: b95beb185810 ("x86: Clean up APIC local timer handling")
> Reported-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> Sadly neither gcc5 nor gcc15 properly optimize the (effectively) two uses
> of the 0xffffffffU constant: Both use a 2nd register to load the constant
> (really 0xfffffffeU unless <= is used) a 2nd time.
>
> --- a/xen/arch/x86/apic.c
> +++ b/xen/arch/x86/apic.c
> @@ -1224,10 +1224,16 @@ int reprogram_timer(s_time_t timeout)
>      }
>  
>      if ( timeout && ((expire = timeout - NOW()) > 0) )
> -        apic_tmict = min_t(uint64_t, (bus_scale * expire) >> BUS_SCALE_SHIFT,
> -                           UINT32_MAX);
> +    {
> +        unsigned long product;
>  
> -    apic_write(APIC_TMICT, (unsigned long)apic_tmict);
> +        apic_tmict = UINT32_MAX;
> +        if ( !__builtin_umull_overflow(bus_scale, expire, &product) &&
> +             (product >>= BUS_SCALE_SHIFT) < apic_tmict )
> +            apic_tmict = product;
> +    }
> +
> +    apic_write(APIC_TMICT, apic_tmict);
>  
>      return apic_tmict || !timeout;
>  }

This is fine for staging, but be aware it cannot be backported before
4.21 due to the toolchain baseline (and nothing in CI will notice, I
don't think.)

~Andrew

