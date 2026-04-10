Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CObbCIbB2Gk4hwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 11:23:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C99E3D4ACF
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 11:23:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278537.1563332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB84G-0005gw-O8; Fri, 10 Apr 2026 09:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278537.1563332; Fri, 10 Apr 2026 09:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB84G-0005em-Jw; Fri, 10 Apr 2026 09:22:24 +0000
Received: by outflank-mailman (input) for mailman id 1278537;
 Fri, 10 Apr 2026 09:22:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wB84E-0005eg-Tb
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 09:22:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB84E-00GVjk-9P
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 11:22:22 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d8c147-bab6-0a2a0a5309dd-0a2a45039148-4
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 11:22:22 +0200
Received: from [52.101.53.55]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d8c14d-02b3-0a2a45030019-34653537f301-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 11:22:22 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH4PR03MB7625.namprd03.prod.outlook.com (2603:10b6:610:235::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Fri, 10 Apr
 2026 09:22:19 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 09:22:19 +0000
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
 b=hVvUCMUNanezrWEnY2/YIVMvTc1id7NFihIj6BeMfJ9s6GTcakUeoxQtU/altxO2x6iFSxb2ych+GEbvfU7mlLgPhTAhkI9B9kOJRHI6IStphJH3VRoxyMcd5PiKNUiIBTnRApVvwY0N7RhjiJM9wqxpWLb666pa2lykOjlGpYi4Z2iqurDvz+CVXuFTAaQzwEbt4LTNC0CNjPzAEFAPCpV897ZArTrnodDd1bZ1JrCDluITkZLBAQxVfObFfINypyts+juzIkxuaUmmaBLe8mRDifDEvUk9HPzKgtNbMnfuYQFAm0z086OvY0jCPpyYujj9CD741YIq5kqZuo6olw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWi+ptAh+iUNz/K24C8UzRI31s1G7n9n9MvYxXxLBQw=;
 b=FxS/bYiW34+v165wHA7Mm3XGutywsuN5mZAO3GAOtDWmYWS+ct2+phBjADSwrbGyOvGpQUSNoUCSZkTtumzv+5QoBrYW6vZqkR0MRKoWCeO5TmFL5jqXmMKDKkxhdfS1pLe1i6g9U2/hNx70D+QCztzAkb2qCXgTXwvMR+29oHwY3mGnIpLOOwp/g8vF3zoJFn6uJg5ZGjXnaqmlR814n5bKzogtIPn+f5w53qqdVqLfvktC1v/BRkVGqn/lagsuRZ+Ap3lKTo1wbvX/zFD7QG2r4EkDvqVgasUcMF9eWBoXp9o9hbN8lDbEosyoIEXjaf8weB+mqk65a0oPsFaGdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWi+ptAh+iUNz/K24C8UzRI31s1G7n9n9MvYxXxLBQw=;
 b=AEs7pX4fz6oMSfjoiGwrB3Z7r5Zx/XAAyvxcPeQKQIPLVjvzwc+HGRUW6jUnr+FapyPpf65mQsJJzlDTKvRLxh1KfR60VIONRZog5RyjJL10LzXNmD0E3ojJKqCYpmXqTG92qfhnnb5Ixc8yTiID/JeUoIfmhIS2vfI6kCBiOkI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <85f76f74-8554-4000-8c39-623b83944648@citrix.com>
Date: Fri, 10 Apr 2026 10:22:15 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] x86/time: do not kill calibration timer on suspend
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260410085504.32925-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260410085504.32925-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0260.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH4PR03MB7625:EE_
X-MS-Office365-Filtering-Correlation-Id: bd639fab-7e3b-451a-ddfb-08de96e2a9d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	8EQdalglUQgDHvi7JL2vPmehYb4HOqMfNGLg3rWsQBkY2b6TGTfZRbJ7/QH0XhSRUd7v0pFT4XeoYVa87GYeW1MXAVDSBNQL/6lLWwCMvnwWXObAMT64O7MprcbRDVt2Vd8b5ZaOqg/Jh0g2/g3rfERgTr2eVSTFtye1w5u5KH/A3TEV620kpEEyem8RMcCdI6IJkLwGk3wQmlKpmCaoUh/YBDUi8tH05jWoUHY0PfKQoRcKlOXdN1s7LpjCpYrxCn/QzhZB+qPo6cqD96BRV5nbTvvnWCBrr5c2KmlgLUfXcp6ZbIegkIZygF5g8KjJNmrrHLct8bbuMAs0sLpbZJMQScjcjrxSfEqhnLV3jriEvO0UrhwFkHsCRrpw9HYxhtw9LAa7VA/HswC+W6DFe4EG4f0OlEiz9L+h5L4MdBPLbX/adsz+ZI8AE2xoBak6/WqBd+ouic4Bu4sURb4xP+Kdq9T77X+oFFC9axYGhw4lni21jMN55UD2dmyKHl5sQFRKWlkj44J+uOtRP3pqi20kGBvXxPgHtgAbHAgvKFraYVlpDy05eSYyvmwcU1VGflwjmHghrgNA36XCURfeVNZRjpMEExEN3iBu6R9tUs99JYwlstnP1uMeRHe5lDRLmOX5ysxtXX1N5t4rek0l1I3rQWaD4/mPctGY8+NfkdHlBZw9GAJCk+xPYWbiFCgvnoBcfUKMp9crGGO6nojLRvTcIuewXZQJoAXljCxHEhM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1BJSnZJaXdiOFU1OWFCMExIbk9TYjlRUy9GeGtYQkNmZjVJdGI3d0JlelZt?=
 =?utf-8?B?MUdUZ3pFMEhMOGVPdlRWVW1zNHVvQ2hXZkc5dGpNeXpFMi9IRXAyN1AzSjQz?=
 =?utf-8?B?SzlCQk1tVStGdHFXWThqNzFWQ0lxMXZQUkJzOHdNczVVWjlaQmE0Mm5INHpn?=
 =?utf-8?B?dncwUitBT1Y0T3ZTUkFURVZwTGZJOHlyeExvcDc1elBRVk56ZG5OaUREV0l2?=
 =?utf-8?B?ZlEzRnpRQWRDSTUwaGFsdi9zbWNCUDZDaFpaOWtwL0plOGh0cnZ0ZWhOdWVT?=
 =?utf-8?B?bzQyVDBjUkRjM2ptdVgveGpNb2hzT1YreWkrVFJ5bEFTMExXT2UwUWFRWlQx?=
 =?utf-8?B?SXpjaVNidjYzTW9kMVBQMkp2aEo5MjhqazY0amtVL204cjRreE5aelJlUWhC?=
 =?utf-8?B?cFNKaThWWGw2YkFHVEpPRDBWSVhFNkwyazYzTllPdE8rQytiZ1NvK2hDU0hW?=
 =?utf-8?B?ejNUaDd2R1VGaWFzMnQ0ck9seDVPenM2d1ZGS2NjY2V0NEJtemVqb2dqaEo0?=
 =?utf-8?B?aVE2R0NCRlh3VlpFVXJGbzFLUk13STY1L1ZQOWdleVRNYmpOeUpzcmtWSFpx?=
 =?utf-8?B?Tmwyc1dDMFJVMmhKaEhHc3dpWFhrYlQ4VWJta1B2QUZiWHFDNEFvRWsyZXQ5?=
 =?utf-8?B?anJmNmhtWTRSM200Q2FFTDlSNHhWUGRmaUg3Zzc5TGRFUjFCeHBMcnhNZmpF?=
 =?utf-8?B?WnRjeUI3TUZZRDVRMXNDQ1NsYVdBNm9hVGNKK1NPQ0Z2YlFORXRjNmFRd0tn?=
 =?utf-8?B?by85Y3NFMjN1R3J2MkR3QUQxQXQxU2dYMG4zQnFnUVlhRjJsVkw4TFZuZE95?=
 =?utf-8?B?MlpyU0p6N2FJbDVHeG1TQmJqN0U4b2JmaGRLVlRvTDVkcGJlT1VRMWg2dmdF?=
 =?utf-8?B?Mm5EZy9xRmdUSjhQcUNEVytwNkpsQXNQTXhRcEdIbHZDUThaVHM3SmF1NVB3?=
 =?utf-8?B?S3B1UlU5QzhzSlhwMW10WEdmbUREMlhrWElPS1hwUkt1ZVg3bU1RbFBRWktY?=
 =?utf-8?B?Z3BjSWVWUU02aGdRZ2xpcUR2c2RSQkRyQnFKTjQ0RFJFSEhBcjJ0WDFjMUZz?=
 =?utf-8?B?bTJYZ3JRQmY1WjNtYXFKVTBseTlQOFljRDVhUElDSWVsRXdNdnlpR2ZmVFhm?=
 =?utf-8?B?VnpjY3hsYm5aUSt0ejZxSWIwRUpuelFacFBnMTU5NXE4Y1dDMGxreHFxV3Bo?=
 =?utf-8?B?V0tNNDcrQzA0L055bFRRZy9YT3VzMVk1dElyaFo1cHZ0QUhxYTZFblBod292?=
 =?utf-8?B?anN6QktQdFU4M1k1U1hzaUdSU2s0eXRLanNBV3liUmQ3Z0dFVFVFcFdhaDNB?=
 =?utf-8?B?ckFWYkxSMXZyaHd1YUc2TEt5QTExeHJ1OE5JakdkZmQwaUFYMllCRytxT0FB?=
 =?utf-8?B?M2dHTGpzMWJmNFJ1ekRuMVFtMnpxakZVMjlPL0pucW1HY0NiWC9RMFZSSUFk?=
 =?utf-8?B?R3B4ZzJWdXR5U2lhSWNHWmVFelAzZXVCMHd3bXMveUlhemQ3eDRYaDdFMWl5?=
 =?utf-8?B?VU9ZVFllMEVaU1YzQlpKa1lzZndzYW1iWEVwNnZ2dlBEYnk1RmtreXZ3cndV?=
 =?utf-8?B?QlVmcnFSVzRzZzFuWjNlUlY1Rms1bTRxVmJybUdMYTZhV3RCSHBJU2NBbzI5?=
 =?utf-8?B?aWoyVG0yRkVoZmI4WUZiblpMa1c5KzdUN3lSaXVpbVVHWFB5SjZGYkszR3NX?=
 =?utf-8?B?clN2dnorVXRHQW9SL25iYzQrRXE0cW5keExpRGpFY3FBQ3YrRFV2SGw1aHg5?=
 =?utf-8?B?MUZMTUgyTENGcDNHZXdrdWFWM2ZUZXdjSG5MYnFlVUtjQ2hqTXN4Q2JiZGcv?=
 =?utf-8?B?U2dNZEJrT0owVzNtc3d5bm1TWHdzVTczU3hCTi85VVVVaHNHT2w4bjE2ZS80?=
 =?utf-8?B?OXdTaDNBeU9vclIxREx4NWRYeXRRZ0kvdE10WG1oYVY5YitBbHZDZFIyTUtC?=
 =?utf-8?B?RmRxZXFDOXNRcjYwWHpYQmJkMHlOTERXWUF6ZjF0Zm15amoxcm1RVFVqQllY?=
 =?utf-8?B?SXQzMW1HVTdKWmlFOW1KSHlHNWN4WnZPTXc4ckRtamxiYUVIR2R6OGlkZDlj?=
 =?utf-8?B?MFFWZkNBb29SSk5IWlBoQXhsMTVnUDc5dzVaSERqR2FEYVA3SWxleVE3YTEz?=
 =?utf-8?B?VFFRY3daSGNkaEJFQmdtL3dQMHN1YmFuL0JJUk92N2VveldOS3lpWE05OFB4?=
 =?utf-8?B?S25jN2hsaGZoMzJWbi9aeWxaaHprOForSFN3eDFzcWxidWtVc1lNYWVsSUo3?=
 =?utf-8?B?MDluaklZelFtSExIbktxb1RaVDN0dm5SbDlzWGZzcGdRUGR4T2hsZEpoYlM0?=
 =?utf-8?B?T0RpTGRZNFFYeU5QdW5xU09qOVVCc3N4bWRlU2pKYUhGM0NQODFERDI1RHZs?=
 =?utf-8?Q?wK+A3ozgRf8/cRE4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd639fab-7e3b-451a-ddfb-08de96e2a9d8
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 09:22:19.0498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9tA2cxhhYZ2evJXfNwEv+ckaFLZbX8PS83HuAmdULroxQ4Zdk4Cb/0X6tugHgf7fB1qIXDJRBGlJY17nZ0iSnbRl41CLNngTqdnbL78Tuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7625
X-purgate-ID: tlsNG-33051d/1775812942-42D1EC9A-D1FCD841/0/0
X-purgate-type: clean
X-purgate-size: 2024
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 7C99E3D4ACF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10/04/2026 9:55 am, Roger Pau Monne wrote:
> A killed timer will ignore further set_timer() calls, and hence won't be
> re-armed unless it's initialized again.  Use stop_timer() instead of
> kill_timer() in time_suspend(), so that the set_timer() call in
> time_resume() successfully re-arms the timer.  Otherwise time calibration
> is no longer scheduled (and executed) after resuming from S3 suspend.
>
> Fixes: 6d90db1a2ca1 ("x86: rendezvous-based local time calibration")
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/time.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
> index fed30a919d2c..4233ea507d40 100644
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -2728,7 +2728,7 @@ int time_suspend(void)
>      {
>          cmos_utc_offset = -get_wallclock_time();
>          cmos_utc_offset += get_sec();
> -        kill_timer(&calibration_timer);
> +        stop_timer(&calibration_timer);
>  
>          /* Sync platform timer stamps. */
>          platform_time_calibration();

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

This should definitely be stop timer and not kill timer.

However, the fact it "stops" drift after S3 really does concern me. 
There's clearly a different issue here which this is covering over.

The systems which we've been testing on all have ITSC so the TSC doesn't
drift.  Whether there's a step or not is a different question (I'd
expect firmware to arrange to avoid a step being seen), but a step would
not explain our symptoms.

Given it's only once a second, can we dump the scale/offset which the
rendezvous produced each time?

This feels suspiciously like we've gauged the frequency too fast, and
are relying on micro-fixes every second to keep time looking normal. 
(This is pure speculation; I don't any evidence).

~Andrew

