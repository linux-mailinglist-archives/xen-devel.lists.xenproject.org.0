Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QHVjKy3xImokfgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 17:54:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5A1649827
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 17:54:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=YPbnZ0MU;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1329744.1593748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVWru-0002wq-P7; Fri, 05 Jun 2026 15:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329744.1593748; Fri, 05 Jun 2026 15:53:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVWru-0002uX-MS; Fri, 05 Jun 2026 15:53:58 +0000
Received: by outflank-mailman (input) for mailman id 1329744;
 Fri, 05 Jun 2026 15:53:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wVWrt-0002uQ-T5
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 15:53:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVWrr-001cdz-HP
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 17:53:55 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a22f0fc-2eae-0a2a0a5409dd-0a2a4504b2f6-22
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 17:53:55 +0200
Received: from [52.101.48.58]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a22f111-1dec-0a2a45040019-3465303a18b8-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 17:53:55 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB6545.namprd03.prod.outlook.com (2603:10b6:806:1c4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 15:53:51 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 15:53:51 +0000
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
 b=NQ1/56cVOsZoUaF04XUzBTHuHnPZuTPQGOyg19KN6o9UKecbPYpS/VOQiMZUkxPj4hXakVqt1D2Z+1r6GemHz8B5q8zxgTU4ijw2vFzREGck6aH4m1gV22pns0DBhWH0wEBbC2CDIH0fikOXnE+Dl74rZ9Ic9aXhlvcngCjhYeLA0rkPOL1EzYgs/htPqtbEVKkMjW+x9dVKmUqTliLqYhz8cf1jn86vQlxLyOhV/qkDZZtNXQAFj3spSCg+uGr+rSO9CsKBhHoIBn+hXsuniGjB8awGFfNevMTd7OfXoC+ntK2X3PwQN5tE5aCsKB7XUy0gZA7/mc2kXg4qfLJLsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QcfU634S+PKybxdDqSJuwCFzJjKF6da2VNhhC5xtBj8=;
 b=BD/lQ/CCzyUM3jt2c++zEn2wDEFHUT38zFzzVffVog+Nxr4TDq+VIg1FFPC63o56hnp06fQe+TBgWLFAbZkoFtonxtBkzChJZJEvFfOffnyppP64zy1wRjpMO0M6V1wnRHfxsAVBHYnAAXXSmzNrRTgwLaz0LhAJRjzw2rhmTKrJZeP2qmCgCKRVZivBOmLC4yRSBIGeE/qb8RdPTE38ktrNmxzWPhM/E2ni59O54Q1mO2zd4hYyx6kg8oNK8VlLpnLDZJwzGY5bbxIIDLH9ukffrnMQw2gr/nPBj2dH+O30I9nJbOT44ocnZjBv0mxAWfpvojMX6QuY1zucaj0pMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QcfU634S+PKybxdDqSJuwCFzJjKF6da2VNhhC5xtBj8=;
 b=YPbnZ0MUo7bBOz/0jFdziumUkH+Pl4d93kTYs8m0TLi59TCwRe+Tj80at6DXL4ErsJTAHHqPMs8kKaF4bdUtvLRnMkeuqavQrbkzSuok8+PXQ7vTjnZ3euLpbpWC+kgcR52Tbyoa9fyaMSXzQSyOYGLa1SD5Pl4scSxw5IDRlN0=
Message-ID: <f4e8d445-2679-41a5-8966-bf36fcfa2568@citrix.com>
Date: Fri, 5 Jun 2026 16:53:48 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH for-4.22 v2 4/5] tests/numa: add unit tests for NUMA setup
 logic
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20260603191836.77955-1-roger.pau@citrix.com>
 <20260603191836.77955-5-roger.pau@citrix.com>
 <ff3d8693-3357-4d64-8306-fb1378bc41a8@citrix.com>
 <aiLv97hjEbG5PQAu@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aiLv97hjEbG5PQAu@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0014.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: 6741cd4d-7a4f-4338-59a9-08dec31aa3b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|4143699003|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9FUpsOze1Lvnam+vAoTbYvNtt0xhZVdeLp0gpMOvp4ou7E+SR/L/FECEV5NWdilcsYvZ6mPSWP2TEJiBOwQqVtZLCKe5IrDAvckrPJoC7H5ExBEmWr11K5V8fYjp89edW30+WY6R8IRbkIo10K1/wCykcFpwUmwqjnQfRUGWP0n9E9qawUEn/IJNVGWWMJqKlCxb+J6XTaBya1ouIiui+lsRj9rdPNa730Gu5TRmPiBAD8t/a2jjWUVcm0ObrYBJ2p77n1vezi8JDKokx0SRBS9OOwK5qJr9NA78Tu0UlKpKDn/Vr5+2Ul6Y8Ax3dCvprWP0rNiIOKCbIftw0QtyUcDuMcGpjlwFAL3jtFIncnrYYI8FRbKaCuuc8H/ohe49eqT92YD3AnJChY/roIaLZSmrPlBJUop96qT5uc1yr8n97YlzKyBDMYARmWS5eiyPt4Ry8cWy9PD6lADZ43xmanPR1nfQUkRisD5JhDY5kd6JigXcXuCNXIbIELwuOAf1bliER2YOax/E6k19SdDHjLJBP826FjcBZtHfgadKc/ETp+DTQy4EBs91v2X30AKINnTTc5X41MM/R2/VuChBNJI9BIuVS0oZoP+xF/gX/EnUbFvmT04g8MjZ3u2jdjGcyaEdAmmDjtPiWL/oy1zOvC7hkbDFq1J5GfReFPJnV+qToTKtBuEOWgSNEI91PZpGX1ka9FqZINP8hQhCCUdJeg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4143699003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3cwbzVJaUJ2Z3ZxQm90SUR1cjNaRjJRamFTZTVPRUFjREZ0UWxvVksvMThD?=
 =?utf-8?B?MDArTzk5RVNkWStoZUNDdjh2eFB5NFlJWmpTMVdyNHNKOTlIcnVsUHpyRHM2?=
 =?utf-8?B?RGxJd3pxa3ZtalBSVnhDMGlncUpHbkpWUC9aRXRKVlU2MjdGR3Z3K0FGNk9P?=
 =?utf-8?B?UXlCZm1YSjNmd3Vyd2JKa1BjQldxK0crRVpUS2d5YWdzc1gxSTJNSDdDMlgw?=
 =?utf-8?B?cDJDU0NiaFJLb290VUdKRHI0bFBNNzRzc1cvbCtJMzRuK1N3MjdVbU12d1JN?=
 =?utf-8?B?aDkyKzA3Y2lSaU9nT211NDcwZnl0TmN1Z2ptWTBSKytaTUd4RTJFUTZQNGlx?=
 =?utf-8?B?WWN1bEVseS9kaWh6cmNhTVBtWnExbHAweG1PeVlTODNBaXRMQzFzeG5KTVJB?=
 =?utf-8?B?ckF5WFpiSnFuOWdpNU44L3JkNFdlaGZBWU8zZ2treG53M3ZGcXdWS0JKL2cx?=
 =?utf-8?B?bU9MQlIvSXhsWVJKR0pOenlwbW1UcWd6bWptbzJxOXNFQStHeFd1N2liVEha?=
 =?utf-8?B?ajhBZ20rQTZ2aG9GSDZnaEp6NjFtVU90dGNqaG1jYkVrRU1URGNBYTE4Nmhs?=
 =?utf-8?B?aEQ1bHlVa1RiTjFROVA1djZLaSs5SEpVNDhYUmh0V2EzS1JicEtpQTVvWUhH?=
 =?utf-8?B?dVVka2hNVnU2Ky9uTkIveHJRc21iSGR6ZlVqQXJUNVRpdXdxejhHOGtPYWln?=
 =?utf-8?B?VnNIVkZUNkc4K3pTcFAxMEpGb2VHM05GN3o0MkxSZG5ra2EveVBOcytVVVVa?=
 =?utf-8?B?ZTB3MC96eEJLRVIrVk9nUDhRS0pGT1Bpb1BiaUphUGo1Z2ljOFhpeXlka0Za?=
 =?utf-8?B?MWU0REIrZTBCS0lReUZZNms5azJKalhUSkxMRHd4eXF6QmhzTWY4RTEvdTQ0?=
 =?utf-8?B?ekZ3cXErSlJwdWRoTkRrSWVXZElJYzdkRmJHSHhCVEJYeGRWS2M3dkQ5enpi?=
 =?utf-8?B?SE5XcEYrY0hEWHNQeGRoK3hvL2xqNm9XMUN6dUpOSVRSWXVoTklDR0dKcFFz?=
 =?utf-8?B?ay9YcWczM05TZmFwNEV6RGZTblRrSlRjWTlrenJMWmZ6YkVUMHZ6ZURITDhW?=
 =?utf-8?B?UVVvN2NsUkJ6QWxOVjJxMHJGS0JJdEVUcEdTU0xFNWNZS0QwQ1RsQndwUHBj?=
 =?utf-8?B?RmU1aEN0OTZlMHY2Z0xQQ0ppdzArdVNhQ3BaVCt0SHFEc3J2RG04cExFaTlU?=
 =?utf-8?B?NGY4MEY2NkdiZmdCTDlDZ2Q3b1c2MVhROTlnWHl1L25vdzArTFExajBCcTU5?=
 =?utf-8?B?ckJTREhvZzc3c0dYQW93R053MjFDOWZDdXJ5OSs3dll1OVhSZlh1c0g1VnE2?=
 =?utf-8?B?MHViZ2U1ckVhOW8veks0akJwMzh5dVJ3TTFjVTM2dE50VXdiZ1JBdWRteHYw?=
 =?utf-8?B?UmdObTM4dTZTdVZwLzRyNzgxNlJvU1Z0Z0Z6bXR3dUdVbWI1SEpUN0V4dEoz?=
 =?utf-8?B?eXhJdU5DV3BXZTdEMUJ0SHg0T1l2VUtVWmRGYXhZMUV6Z2liekZPcE9vMURR?=
 =?utf-8?B?Unplb2hJY0o1ZEk5VGNaQTNmTVNwd012WGlsTXB4TkdScEVUMENscENIazBE?=
 =?utf-8?B?SlpWdlBsZE93U1FzOENoWGpoL1JrL2dLTnVSU2JLbXRzeFloeGJ1dlo5Vnpm?=
 =?utf-8?B?cllqVTAvTVY2aSszcDRCN0x2eS9BZ093dml1bGpLQkZjT2k1aCt0UnJoNUYv?=
 =?utf-8?B?MFh5RS9wTzA1UmxmSTAwSmpRSVFnS0tFc0Z1TWFBU2VoMjF2RzhtLzF6NXh6?=
 =?utf-8?B?Z0MyUThGSEYvekdxdlhGUzBTUlpNT3QrTWpLR29GcFpNb1RrOWlvUTJYbzVl?=
 =?utf-8?B?Y05YVGp0OFFHa3RLNzlxV1RibExYTENQQmhDaTk2RGJtaFZEUDNWcExnQXZw?=
 =?utf-8?B?V2EwMTd5enpSM3dvcVE4Vlp1YXRmL2ZOaGk0dmJLeENnK1hjRzZmNVF6VXpE?=
 =?utf-8?B?YWhZaDhoRTAreU0xdXpwaXhmci9oQi9VejltbFNNMS8xVVIyellYWkEwZGZv?=
 =?utf-8?B?OXhDK3ZYenB3TzBSZCt6cEZOMVhvb0hHRWtHb001QmNUeFRhNDY3QzVpanZU?=
 =?utf-8?B?aERLYXY5ME53dDNmTkt6WTliOVlTckFOaDdEcXAxRXFQWERMRmtxS2hpZXdp?=
 =?utf-8?B?QW1ZWWsyaEkzTktxdGJNeCt3cHUvcm01Uk9Id3JjUEpWOTV0dUJiUUVzRWFO?=
 =?utf-8?B?T2h4QUxYNXVYTEdoK1J0TUtHTUg4ZVF5TVR3VlYxTGo3OWdXZmh5TGFCYUlF?=
 =?utf-8?B?ZExTbDJqSi8yRFlpSTZOR3plU3RJN1RlUTRJSkUwZ1Y3dUtBNGRXYmplU09H?=
 =?utf-8?B?ckNJek85dUlCazAxYjF0dE04QnZjUStiWHJhZ1hpNFdBejJXdU1YdFkrak12?=
 =?utf-8?Q?EIresvhv+4Fazvdw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6741cd4d-7a4f-4338-59a9-08dec31aa3b2
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 15:53:51.7035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W5siuXyDTo2C1RlGbS6F+DpLN84DbU18RUVSXvw3SGYyeDeU9LjsGtQ5TQM0gPm7dDY3NIUUKz6TOyaWU+AZecBhmoZmg4X5UDhUCyyUXVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6545
X-purgate-ID: tlsNG-ebf023/1780674835-40F753FF-FF4EF19F/0/0
X-purgate-type: clean
X-purgate-size: 5973
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,gitlab.com:url,citrix.com:mid,citrix.com:dkim,citrix.com:from_mime,citrix.com:email];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE5A1649827

On 05/06/2026 4:49 pm, Roger Pau Monné wrote:
> On Fri, Jun 05, 2026 at 04:41:58PM +0100, Andrew Cooper wrote:
>> On 03/06/2026 8:18 pm, Roger Pau Monne wrote:
>>> diff --git a/tools/tests/numa/harness.h b/tools/tests/numa/harness.h
>>> new file mode 100644
>>> index 000000000000..9eec77f31402
>>> --- /dev/null
>>> +++ b/tools/tests/numa/harness.h
>>> @@ -0,0 +1,184 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Unit tests for NUMA setup.
>>> + *
>>> + * Copyright (C) 2026 Cloud Software Group
>>> + */
>>> +
>>> +#ifndef _TEST_HARNESS_
>>> +#define _TEST_HARNESS_
>> This is overly generic, and liable to break if anyone copies it.  Maybe
>> NUMA_HARNESS, or WRAP_XEN_NUMA because ...
>>
>> Looking below, how about naming it wrapped-xen-numa.h, so ...
>>
>>> <snip>
>>>
>>> +
>>> +static inline bool arch_numa_unavailable(void)
>>> +{
>>> +    return false;
>>> +}
>>> +
>>> +#include "numa.h"
>> I presume this is the real xen/numa.h ?
>>
>>> +
>>> +#endif
>>> +
>>> +/*
>>> + * Local variables:
>>> + * mode: C
>>> + * c-file-style: "BSD"
>>> + * c-basic-offset: 4
>>> + * indent-tabs-mode: nil
>>> + * End:
>>> + */
>>> diff --git a/tools/tests/numa/test-numa.c b/tools/tests/numa/test-numa.c
>>> new file mode 100644
>>> index 000000000000..bced68d4d7f1
>>> --- /dev/null
>>> +++ b/tools/tests/numa/test-numa.c
>>> @@ -0,0 +1,222 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Unit tests for NUMA setup.
>>> + *
>>> + * Copyright (C) 2026 Cloud Software Group
>>> + */
>>> +
>>> +#include "harness.h"
>>> +
>>> +static paddr_t mem_hotplug;
>>> +unsigned int __read_mostly nr_cpu_ids = NR_CPUS;
>>> +
>>> +#include "../../xen/common/numa.c"
>> ... this has 
>>
>> #include "wrapped-xen-numa.h"
>> #include "../../xen/common/numa.c"
>>
>> which I think is clearer to follow.
>>
>>> <snip>
>>>
>>> +int main(int argc, char **argv)
>>> +{
>>> +    static const struct {
>>> +        struct mem_affinity affinity[MAX_RANGES];
>>> +        struct mem_range ram[MAX_RANGES];
>>> +    } tests[] = {
>>> +        /* AMD Turin system. */
>> I'd suggest /* From an arbitrary AMD Turin system */
>>
>> Just "AMD Turin system" feels a little as if all systems are like this,
>> which is absolutely not the case.
>>
>>> +        {
>>> +            .affinity = {
>>> +                { .nid = 0, .start = 0x00000000000ULL, .end = 0x0000009ffffULL },
>>> +                { .nid = 0, .start = 0x000000c0000ULL, .end = 0x000afffffffULL },
>>> +                { .nid = 0, .start = 0x00100000000ULL, .end = 0x0c04fffffffULL },
>>> +                { .nid = 1, .start = 0x0c050000000ULL, .end = 0x0fc4fffffffULL },
>>> +                { .nid = 1, .start = 0x10000000000ULL, .end = 0x183ffffffffULL },
>>> +            },
>>> +            .ram = {
>>> +                { .start = 0x00000000000ULL, .end = 0x0000009ffffULL },
>>> +                { .start = 0x00000100000ULL, .end = 0x0007590ffffULL },
>>> +                { .start = 0x000759d1000ULL, .end = 0x00075a0ffffULL },
>>> +                { .start = 0x00076000000ULL, .end = 0x00094c73fffULL },
>>> +                { .start = 0x0009b5ff000ULL, .end = 0x0009fff9fffULL },
>>> +                { .start = 0x0009ffff000ULL, .end = 0x0009fffffffULL },
>>> +                { .start = 0x00100010000ULL, .end = 0x0fc4fffffffULL },
>>> +                { .start = 0x10000000000ULL, .end = 0x183f7ffffffULL },
>>> +                { .start = 0x183f8800000ULL, .end = 0x183faabffffULL },
>>> +            },
>>> +        },
>>> +    };
>>> +    int ret_code = EXIT_SUCCESS;
>>> +
>>> +    /* Dummy firmware interface provider name, use TST for TEST. */
>>> +    numa_fw_nid_name = "TST";
>>> +
>>> +    for ( unsigned int i = 0 ; i < ARRAY_SIZE(tests); i++ )
>>> +    {
>>> +        paddr_t min = ~(paddr_t)0, max = 0;
>>> +        unsigned int j;
>>> +
>>> +        numa_reset_state();
>>> +
>>> +        ram = tests[i].ram;
>>> +
>>> +        for ( j = 0;
>>> +              j < ARRAY_SIZE(tests[i].affinity) && tests[i].affinity[j].end;
>>> +              j++ )
>>> +        {
>>> +            const struct mem_affinity *affinity = &tests[i].affinity[j];
>>> +            paddr_t length = affinity->end - affinity->start + 1;
>>> +
>>> +            if ( !numa_update_node_memblks(affinity->nid, affinity->nid,
>>> +                                           affinity->start, length, false) )
>>> +            {
>>> +                printf("Fail to add NID %u [%" PRIpaddr ", %" PRIpaddr "]\n",
>>> +                        affinity->nid, affinity->start, affinity->end);
>>> +                ret_code = EXIT_FAILURE;
>>> +                continue;
>>> +            }
>>> +
>>> +            min = min(min, affinity->start);
>>> +            max = max(max, affinity->end);
>>> +        }
>>> +
>>> +        if ( !numa_process_nodes(min, max + 1) )
>>> +        {
>>> +                printf("Unable to process nodes\n");
>>> +                print_ranges(tests[i].affinity);
>>> +                ret_code = EXIT_FAILURE;
>>> +                continue;
>> This is mis-indented.  Best double check the whole file.
>>
>>> +        }
>>> +
>>> +        for ( j = 0;
>>> +              j < ARRAY_SIZE(tests[i].ram) && tests[i].ram[j].end;
>>> +              j++ )
>>> +            if ( !test_paddr(tests[i].ram[j].start) ||
>>> +                 !test_paddr(tests[i].ram[j].end) )
>>> +                ret_code = EXIT_FAILURE;
>>> +    }
>>> +
>>> +    return ret_code;
>> This is fine for now, but we're going to have to consolidate the
>> patterns eventually.
>>
>> Do you have a Gitlab CI run with this passing?
> Yes, this for example:
>
> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/14693648817

Ok.  Acked-by: Andrew Cooper <andrew.cooper3@citrix.com> preferably with
the suggested adjustments.

