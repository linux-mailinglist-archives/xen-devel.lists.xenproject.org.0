Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j0PjIHD7RGof4goAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 13:35:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B89096ECDDF
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 13:35:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=BaizO17s;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1349820.1607458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wetCv-00065b-3c; Wed, 01 Jul 2026 11:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349820.1607458; Wed, 01 Jul 2026 11:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wetCv-00062r-0t; Wed, 01 Jul 2026 11:34:21 +0000
Received: by outflank-mailman (input) for mailman id 1349820;
 Wed, 01 Jul 2026 11:34:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wetCt-00062l-4N
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 11:34:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wetCs-009c0c-Ga
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 13:34:18 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a44fb36-e002-0a2a0a5209dd-0a2a450682de-24
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 13:34:18 +0200
Received: from [52.101.56.7]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a44fb38-08de-0a2a45060019-346538075e3b-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 13:34:17 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by LV4PR03MB8356.namprd03.prod.outlook.com (2603:10b6:408:2de::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 11:34:15 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 11:34:15 +0000
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
 b=ebCvYSWL0OI4LV6cns9tdyQ9HP0SDXCarU26GQkrW18PRMO/8LwtFfWCWx243JOTEEIl08Co+c3T//12++PI+5BN6qmf4lvoFK2F2+m9Lxx8RpiOs6Ap4rYkvBysoXIoK4e+V3x2TfkaP9jUDdRLVM+pP+Owbhcc0hzwdiGxtkgeZybE6wA5fc5kyVdkBKSspSJ33dhhTePf/k7hwJ8ipehOaJygVDM6rSKlDyez1AvrP/+PlVspKSBQ1V9COCbqX6mUch4TTkU67EkaQ8fnlnVEw8rQtQFLF+se5mYq9tu/8KIVxVW+4dLHW8Kq3xeSjX1x9h8I4QZZMvfOcfADlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ap7FD2WZLt2K+DThBlbMj7O+NP6IwDUgnGaQtYDhBks=;
 b=s8xlHbINMNDyLMkf1YrlgSf1ETxjMChHn0+zexZRM85xFjrUMl1ukt1wWPJ1OAWPzt1hG2Y/++Ja/0N4emeiiGOqPVmeiclWR9o44pRl6Ykr3jUlMxeuGJW8jbnnr27ywjFNrSwrCHmxWzcbL6ifN91zNAWhIzLrSkOmYOHQBOpmPPjvG5KhGbX2Z+0FDZ0ZvpDW2UXMU36dkm/kGScXYByaSA9Rfu02tuaoSLFNbtsOmrLXuNOlhYqsUz12RDli8onbWA/yFCFQ8ALzCfffXJEgG0plwU4GsyqEJTOh958MVMcCLOHIout4GO83CHl0cgJhg/x28xwHdKf+MVp1CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ap7FD2WZLt2K+DThBlbMj7O+NP6IwDUgnGaQtYDhBks=;
 b=BaizO17sGMgiLtBF11n4ma9ZUEfojtnvutwEvIzFQePVwGRWPzUf0EJAUs/MsBvFSfFyhxqHnUQD6bmMYcAmS6rLyojKVVJb1QoxXbnTfoSZwzL0DqzNPoG9dQOTA8dfIldk3Eu2ffSQwnMd+inCSEshfG8iHcfd5NwjepoeJpQ=
Message-ID: <3c7ef127-83cb-4498-b4b9-c998a9ea96b9@citrix.com>
Date: Wed, 1 Jul 2026 12:34:11 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v6 05/16] libs/guest: allocate various migration arrays
 just once
To: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-6-frediano.ziglio@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260619130501.272832-6-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0091.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::6) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|LV4PR03MB8356:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac4a882-b144-4775-1719-08ded764ae2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|56012099006|4143699003|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DCRM7mX51iB4S68ObTgYZ3pUeZ5LwwTEE4xLOE4X+FGogR/94R9fy4P0nKiuOLpcKeHkus+cy6BbgArOofJsY/p9bbVO2S9YntmJXb9ibPmoufIo5WsYaCKphFQfaPsuLH1WjGxcEI1iwbrwlIpu9zZo94tPSi7PjGLkibawrbOrUPV5Hj5qimCBELVixLFGf5m4V0Q9d9pXbN8vDJjKj8A1vbFywpBr+i7rAxGCp+ORHBFTWcOEDnFKCGME6Qs5wMEBYaBIbAVWEMaYDOR7Rjj+fOJXjwPLglKmOoJkLCtEGEgtrF168EPS3QGyvans3P0XRtEdfbPSlWGjUvsQgy83F7oNGXqKcjBQ6zJXW8/C9mVpCjebLB9pBG7A3XkDXtpinU4AQx/Ue4H0kpgFhx/7jlg2MS+1W4XDwc4L9fzEESqNjcH0fVMKoXTdgtzOL0N87fD2SP45zh99/kbQsJnUMDntGYlZv9jCLgd5dmADnZY20cTodbMGSQ7w9zbykVG3/qJURlRD4FVq6/3lOi0YblEtIXZoi5g+dkmyREsDdeGfkGdsc7gNLk4reN8+4kBNKIWnZjWxP4txLoCJJnb6TY71XxRX8BWHSjxPo+9k7wnvY67pmSj7RKAC+aEZ8bR9UIvX1kTRVI2IeW7OCPb64rvrgXmEt7Xq7QkwSms=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(4143699003)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWlVSHZoRHArOFN3KzhhQW5TTUN2by8vR2wxdStXYXFXR29VSm1udkZ5d3gx?=
 =?utf-8?B?TFFRc2NIZFFha3RYMWMzdFhKekJaS2NUTnVyZm9rbHZWeERmNURwVzZlTmJF?=
 =?utf-8?B?RGlSWDRVR3dCcmdrS3NRVTVJWW9EUVpiQ2xFeDVLR1NnRmV1aGYvYlBRS0xE?=
 =?utf-8?B?UzdmdTZlRndhV3phMkhiYXkwRUI2enVlaDR4cmh5WEZkanUreHU3Zmw4R0E1?=
 =?utf-8?B?SngzS2JpMWVsd2pUT0dRMnhBWHpzTGVhUnJmbElYc2REV05QSW9DMjB4MSs5?=
 =?utf-8?B?LzduazkvbjJmQTVaWk9WdU1hNnBtRWkxc201NlVkTkUwWjEyQytpZXZWWUYy?=
 =?utf-8?B?SmpsbW5uY3ErRUVnK3ZYekowMnhuSlBmM1RwODY2NFBhakZpbkhrTXc3ZGVR?=
 =?utf-8?B?ZEI4aHlDSXZZcEU5WXphdEZ0cUhsSmNlbFNrYWpnM21SbUxwQUZmenZCN29o?=
 =?utf-8?B?ZE1aMmpNc0F0VDZBV0xidzF0bjJ6a2diSnU5REV3YWQvMjZKU29aNUxHakpx?=
 =?utf-8?B?TlFTbnNwYjBGQWV6VnZtS0pmL3NYczFBcWttMlVGYnpRdmRYenQvZ0czY3l3?=
 =?utf-8?B?SnMrRTFMSGs1eWVDK1RxMms1LzBFenB6aFhIOTA1bjc3eFdXL3pGTlpIQmxG?=
 =?utf-8?B?cFBYV0syaGwvT0dMOXQvNVdTWGIrZGlkbWIzb0MrSXdIbEt0MGdPZ3lZT2J0?=
 =?utf-8?B?aEE4eGJ2Smw5Y0hDVnRmd0FsMllJeXVISkJLTUhSb2ZibFptNmJKMDRPWWx6?=
 =?utf-8?B?UGFzdlJ2RTZHYXZDSEtKd3lTMmpzendnS3FUUFJpa3d0VkxZWnY0WUlXZjNz?=
 =?utf-8?B?NS9TdnlRMzhFeEx1ZENSQUpHMVhiMG9sNHlxR3IzOGtuR2EwK1VOZnUraVQx?=
 =?utf-8?B?bUo3Q0dWQWZrUDJSWktTNURPc2dqL0phckM5aEc5a09oeDFQUkxxcE9ZaGRh?=
 =?utf-8?B?U2Rhd3crenhTSGJURmpWelRFdTYwMWw1cG0vSHZqYjFLVm02U3J1Um13RlZw?=
 =?utf-8?B?RGhRSktBNU43UEV2anJvSzE5SWhwV2Y5L3I1eldTeGlpMFY3cVRXeklGdlNq?=
 =?utf-8?B?VCsxMW96aVZ6U2J2NWFaUk0zQUdYeC9SVlJGRDdRTStMSXZYTko5UG9vZklF?=
 =?utf-8?B?WlVkQ0NjL1FUYllXRThLT3pPK1haSXlnSnFVUERYVVdIbHJBMkNRUFJTTUFG?=
 =?utf-8?B?ZlkxYTduSnpNdzhVZ3kxTmxkUUlhSzFWL2UxTmsvZ3BVZS9NR3VPVGRiYlFN?=
 =?utf-8?B?YUVtazZCMkpIU3BMNUhJLzl6MHh1aHIwZFRwK1RLTi9HK1NSNGpqdStZdjla?=
 =?utf-8?B?ZFNYMHVwZmpndC9mTkh4TVFVWGFYQk1hdW4xdFpCVHJvd1dPWTd3cUxpaFBZ?=
 =?utf-8?B?MXN0YlNqUzdNNDVxTU81Z1Q2K3Q5ZVEvcXlUQnRwMVVUeEs4WTFJMkdRYUpY?=
 =?utf-8?B?a2l0S0gwQ1NuVnN5TE92ZWlQMzBtVm9wVkVxbUZCNGJDWWNuYWIxSXVWK0dE?=
 =?utf-8?B?UE44VHJpVWM2S05WaUtnSHlsZS9XaXRlR3JDaFB2NTRYa21iZ08xbHp1SEh1?=
 =?utf-8?B?WW9veHI1b00zSlBBTmQ4SlFBWllRV25RMS9FS3RvQmlRck5jb2JDMkw2SC80?=
 =?utf-8?B?c2d6bXN2RzZqdk54MTg5TklKbjJLdkNtYTA5V0hMZTRXUVUrSU1LS0poNTBU?=
 =?utf-8?B?VFY4WDFtWThqTm5lVlJnNStMbWdTVjdveEE3SVJGR0JMZmdxM21HSkIvbitG?=
 =?utf-8?B?Z1cwUGhWMEdGWXVEV0l6aU1UMHE0VDlFMkZlL3E2ZllNZ1F4UjVhNHJBeW1M?=
 =?utf-8?B?UVBxRDR1TWJhcXhucWhmRGlBVXRvZ1pib0V0Mk5weE5odG1OYXpBNWwxZzlz?=
 =?utf-8?B?a1ljWkJGdUkzSUozZ09Pa3U4Kzh4R0xYWDVkR2J4cGIvUnVzKzRCYXFKRmR2?=
 =?utf-8?B?SWVldHRCVmNHbmw5VjBQbkx5MDlxaDQ0RUpjSFA3K1p5NTRLZE9ocXg1VVdU?=
 =?utf-8?B?REdaSkZSbTA4U2J4cUFlYnNZV0NrZlZZbWlqL0U4RVY4NmVDNzlPbWozZjk0?=
 =?utf-8?B?NFhLUHo4YXcvWUNGRGZQeW1JTVpWZ1pUT1V2STZBTU1HMnpEdDlIUmNhRHR3?=
 =?utf-8?B?cVR4V2RrL2Y3MkoxWlZwemg2ZmZkSlhLU3Z1a2J0N2R1cUVSd08xcm5UdVp1?=
 =?utf-8?B?YWtjb1BZNnlwSzVwSEVSWDIzd2dwbU83M1lLdTQ4R3VrRDZrRkhBV28zS3Nv?=
 =?utf-8?B?M2xHcDNHdE5FVkhEQS9iMmdaUUVxalM2bWRWeUN1MDZiQTBUL29qZjhXNHhX?=
 =?utf-8?B?dGNQZHEwbjBzdGZVVWdkZ2xqbm5OYW5pN0lKOUIyMHdKdC9TZFA4UkxxWXNv?=
 =?utf-8?Q?ArYQ5lOSnNzfBb5Q=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac4a882-b144-4775-1719-08ded764ae2f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 11:34:15.3638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cJ5IjyFf0egS/jwycfYCG9U+fN3E/Q13JH4OAmJhls3sFD1Ja8YFvWkAnzl/f2v01Z0HLXIzgDn3DgrDf5VaFl7Una3AWq9lBds/5ewgOUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR03MB8356
X-purgate-ID: tlsNG-16d1c6/1782905657-C533668D-054898D8/0/0
X-purgate-type: clean
X-purgate-size: 8336
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:edwin.torok@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:frediano.ziglio@citrix.com,m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B89096ECDDF

On 19/06/2026 2:04 pm, Frediano Ziglio wrote:
> From: Edwin Török <edwin.torok@citrix.com>
>
> Allocate these array just once at the start of migration,
> using the maximum batch size, and free them at the end.
>
> Signed-off-by: Edwin Török <edwin.torok@citrix.com>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>

The reason why these are allocated and freed on every iteration is so
they show up as uninitialised to valgrind or ASAN.

Maybe that's overly cautious, and maybe we can relax it, but it's also
not as if these allocations/frees are anywhere but in the noise on this
path.

> --
> Changes since v2:
> - change prefix in subject.
>
> Changes since v3:
> - fix comment style
>
> Changes since v4:
> - change order of fields in structure.
> ---
>  tools/libs/guest/xg_sr_common.h | 13 +++++++
>  tools/libs/guest/xg_sr_save.c   | 66 +++++++++++++--------------------
>  2 files changed, 39 insertions(+), 40 deletions(-)
>
> diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
> index f1573aefcb..95b0564e5c 100644
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
> +    void *guest_data[MAX_BATCH_SIZE];
> +    void *local_pages[MAX_BATCH_SIZE];
> +    struct iovec iov[MAX_BATCH_SIZE + 2]; /* Headers + data. */
> +    uint64_t rec_pfns[MAX_BATCH_SIZE];
> +    int errors[MAX_BATCH_SIZE];
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

Please move the higher hunk down here, as:

    struct xc_sr_context_safe_buffers {
        ...
    } *buffers;


This helps keep related content together.

(I'm half tempted to say they don't even need a second memory
allocation, but right now xc_sr_context is 538 bytes, and this buffer
object is nearly 16k which we don't really want to be adding as overhead
to the restore side.)

>          } save;
>  
>          struct /* Restore data. */
> diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
> index 8c31f9f86c..4988d8040b 100644
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
> @@ -104,26 +104,24 @@ static int write_batch(struct xc_sr_context *ctx)
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

These two hunks are rather messy.  You don't actually need the first
hunk at all; the pointers can all start initialised to NULL.

Alternatively, if you want to avoid the redundant assignments, then
split the variable block in half and list the second half as /*
shorthand names for the buffers */ or somesuch.  This will need to come
ahead of the asserts().

But if you're going to try cleaning this up, please do it in a separate
patch.

>  
>      for ( i = 0; i < nr_pfns; ++i )
>      {
> @@ -209,14 +207,6 @@ static int write_batch(struct xc_sr_context *ctx)
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
> +    }

Given this NULL-ing, the memset earlier shouldn't be needed.

Along with a memset() over guest_mapping, that gets rid of all the early
memset()'s I think.

>  
>      return rc;
>  }
> @@ -806,18 +792,18 @@ static int setup(struct xc_sr_context *ctx)
>  
>      dirty_bitmap = xc_hypercall_buffer_alloc_pages(
>          xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)));
> -    ctx->save.batch_pfns = malloc(MAX_BATCH_SIZE *
> -                                  sizeof(*ctx->save.batch_pfns));
>      ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
> +    ctx->save.buffers = calloc(1, sizeof(*ctx->save.buffers));
>  
> -    if ( !ctx->save.batch_pfns || !dirty_bitmap || !ctx->save.deferred_pages )
> +    if ( !dirty_bitmap || !ctx->save.deferred_pages || !ctx->save.buffers)
>      {
> -        ERROR("Unable to allocate memory for dirty bitmaps, batch pfns and"
> -              " deferred pages");
> +        ERROR("Unable to allocate memory for dirty bitmaps, deferred pages"
> +              " and various batch buffers");
>          rc = -1;
>          errno = ENOMEM;
>          goto err;
>      }
> +    ctx->save.batch_pfns = ctx->save.buffers->batch_pfns;

This is wonky.  As far as I can tell, you've included batch_pfns in the
buffers struct, but left it's old pointer in place, meaning it becomes
dangling when the allocation is freed.

This wants splitting into two patches.  First introduce the buffers
struct with batch_pfns moved only, and sort out the allocation here. 
Then in the subsequent patch, move the contents of write_batch() into
the buffers struct.

~Andrew

