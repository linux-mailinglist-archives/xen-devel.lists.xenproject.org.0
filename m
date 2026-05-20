Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qD7NBeWGDWp4ygUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 12:03:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A32858B493
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 12:03:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313777.1583845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPdlY-0005FK-Dk; Wed, 20 May 2026 10:03:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313777.1583845; Wed, 20 May 2026 10:03:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPdlY-0005Cw-Ae; Wed, 20 May 2026 10:03:04 +0000
Received: by outflank-mailman (input) for mailman id 1313777;
 Wed, 20 May 2026 10:03:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wPdlW-0005Cq-VE
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 10:03:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPdlW-003VSq-4E
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 12:03:02 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a0d86d1-e002-0a2a0a5209dd-0a2a450bb796-28
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 12:03:01 +0200
Received: from [52.101.61.67]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a0d86d3-212f-0a2a450b0019-34653d432879-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 12:03:01 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM6PR03MB5306.namprd03.prod.outlook.com (2603:10b6:5:243::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Wed, 20 May
 2026 10:02:57 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 10:02:57 +0000
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
 b=O4Q7F+YrbwH58nntsPjPeZMitbudITSAseOYTvxJoJW+xFGtcbNNhJhc7a5tOjHaF6pwZ0Su0BfHA8EQ8wxght3uJIDQuA7/4ZkigCUml0Q261g0FAUfGp+61vU6NppqgV5hJFkqW5HRoBszXqkHbuXg534qQNj06p93W6JnbW87pfuPNIw4IOsFo/M5fI5+gqt9E+9oSeJvYiKZB4qVF8zp7/p8uSpmJH5RV2EFOuj7BOxfPjjT7ZgFPjGUEb6MFisR77K2EtyjI227kxKJ6aQHY9xFnRm4/gTLksXx7FwyPqJ5LwYX3uTniViKi19u20ilwIEGBJZe/dyL6kr9Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eINjlhfG1Rhpl1Pu3mthwbYWgVp4GH3KSOpebC1q3tU=;
 b=Wx39rQGnKjzhWkVFRlJet0ULWKt5R7RYgm+03lL+c9qo9HeyS0ilRy5x8lTsr7GvEiYG5uLYPUjkIBXTfSz7S8nvWalQRL9D4T569Xb0ZhpqeKBwecJ5vUzu1hF2S9U0xCTNB+gpsmVXbtiZrSJNYatun28oxJ6+nGjeyRCmOewk2QmSUecaHUuwVhKAGTF2scMAwBWwOjYl599WQk+y6Nv9AGVbu5WQVUHfCliPZfbLlM8WH8a/05jXA4L67sqPh73Ry8HyCQ0VQhJQmAOFp+6WkGXdO62zYNFqXHOtdVlLxsH1Bi0MeYz4BhKp/9oYnh6KPdR0wmjQ0fG6hzZfQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eINjlhfG1Rhpl1Pu3mthwbYWgVp4GH3KSOpebC1q3tU=;
 b=NmHMb+fsZmb5UPVEovY+ad1k90qr0YJrMWXhp+E3JYQ/773BiSoDo1ngI3X9VBGdYuaLLJ1fbk1l6RNOZayg5mTMOwqr1shjicv+bpIAfXNfScs5k9Vs47D1rprbVQ5z6/kwoaE8OCgBBKHdFs2/AR6fSfVH91EnRh4XTWL4sP4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 20 May 2026 12:02:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 RFC] x86/time: avoid early uses of NOW() to return zero
Message-ID: <ag2GzXm-yg12DQY5@macbook.local>
References: <68b1607a-f2a1-4f53-84c5-43c61eeb1869@suse.com>
 <agXwsshLlV50dcnV@macbook.local>
 <8fbab1f4-3078-4ac3-b147-84d1b5f5abd1@suse.com>
 <agcb1WAGLWDRYZ06@macbook.local>
 <547161b2-2fea-4576-a635-62838ffa2d33@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <547161b2-2fea-4576-a635-62838ffa2d33@suse.com>
X-ClientProxiedBy: ZRAP278CA0007.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM6PR03MB5306:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aba454a-b996-4fce-476e-08deb656f7e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003|3023799007|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	/XGY9yERaXJw8fH6x+A1h5D5foxD66gRljAHLzAItbCR/xtkSGA4T0ukPjrFap54lysPyenVaRKA4OICY/xNhIg6KRPXE/MfXcVPtZ2qSiyF9g9YN5RTo9Pj3gLPm7a6CMKSuqEok3BIwlS0TkWL5Vrd2oYvDCzVWk6kSU/pmEjW4EvQ34eR7+U5tZLMrZ3AmKz/9GPzon47xDHTJc0WsYsiyTqPwWQHGv0kzuNFvDtm5Scgc/AaRh6zSqDO+7Wf+qFpfafX3nr+TN7E58Rs09sWR/nyG9sZoH2LjFlZA9Din4lB8Q8YpjCLj2UBM4UL+nxSUqwzJa4M3vdL7uC4tesqV0DaMmMpnia06ze4PYyY+UsZ0eK5vZoX9bEi3J1YZcRSrbkMRkkMx8+g80g5cCd9oveeMH601+jEWEvHpH7poS2WB2iTjY7tmgE2WTOlnnZSPQrCTAnTYx88SiwBVA4LJ4Nh50eMrTNr0bMG+1B5cmV4i0Q5D8zQmxpLAQ3e+wxvBgAaQWs3EhgN5IGElTbu48EohgUq1f2eFpg1GQUnTwX5MaJX+IUFjEWZwXCwMnrjtulfyG8afWtL11TwlA+8O698Srfo4OiLQe9Ml8URgHNnQF9ptN+hsgnE9Un47YV84e7xcN5Z8sr3UpQQerm6rC0+d9VjKFvNbwxQ8MXGQC/HInYr9eTHJwqIZRpc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003)(3023799007)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dS9yV0xSclZXbmh3RHN4bTllaDFHVTlTWGhobEdVZFg4a1MzeVRyTkJSb0RV?=
 =?utf-8?B?VlJOYWJibFpLeHZ4N0NFUTllM0RTRDl4UjNSWU8rajFJTFR1Q3Y2U3huZVNj?=
 =?utf-8?B?UUZyY1pCVmJIaVdLbHljS2lmUHQ0dzZvanFzay9ocmU4dE9lR295cGt2bWhR?=
 =?utf-8?B?TitHTjNHcjA3dlFBUlc4Z3JMUkU0QlQyZDZmSzJXajZyc0VUNjZUU0I1ZzRZ?=
 =?utf-8?B?QUxqV2ltVWxMR3RWVWw3WE5KaFRwbmhvbXhhd0hEZHlQWExnODNaMFRYOW5k?=
 =?utf-8?B?ejIrZWtxK3JZVll0WTFwU3pXaXJJMzZUWVIvaWJxTXEvSEx1eG5CY1NUSWl2?=
 =?utf-8?B?b21QWVlwUExnc3lXV1NpVU1tMGxncCtDRHVVYW1QSDV1dHVDRndOVk5QelNZ?=
 =?utf-8?B?VEs2U2ZFWTNFWE0xTFQ3UHdROE9TWHdINEF4ajFEdlJhM29tSTJOV09oMktm?=
 =?utf-8?B?L2QzRVNFVkxBT3JGWDk3b3VQMmJJNk5XdExTZ282UDcxM3dHa1NDdk1UZjRE?=
 =?utf-8?B?cGtIR0Q1azdFaDhHVzFCTzVWOFpwTEtMWnZRSmtVb0Z5dk5XVFZDL0Z6dzVI?=
 =?utf-8?B?Z3Z1cXhSaFQ5Tk9qNjBVYnZoSGJjZnVMT3VsRGdtYU9YZEdoUjNTcW9WK0xh?=
 =?utf-8?B?cm9BMncvVjg2bzBZODNhMGlpOXdvcUVub3kzcUJGUmI2d2w1OXVKYWVFZTFi?=
 =?utf-8?B?ZnZoQ0xpTmI3T0c5SGgrYXpxSXAzK0YrUFFIbXFZU1hlWHdveDVlcVZDOERN?=
 =?utf-8?B?ejE4WlI3OUZWSXkzc1ppL2V0aUxLM29zTDJpVVpFTjFpQXNMaVphSCt0ZG9Q?=
 =?utf-8?B?b1RYdTVDMlpMcFlnUFZxWnhYYlhYOXhCQzBkeUtwM2ljQzR6UVFLNmp6aTVs?=
 =?utf-8?B?eWx5L3k5K1pxaWF6bGdKZVpHTlhqVHIxNWdqVHlJUzNxLzljdFdtaURIb0wz?=
 =?utf-8?B?WlZiQTdxWW5FV0RSN1FOMVo1ZE4wY2ZOUmt0ZCtJMmVwMmR3OEZmS0diUnVm?=
 =?utf-8?B?VklVQmlIL3ZrRHEzZ2l5eWRzdCtObDN1eC9sK1ZaZEtja3YwVXBnTzVWVGxa?=
 =?utf-8?B?cmVNTHFSTzdrU2ZxRkVRR0paZWxFWUFrU2Q3ZkVUN1BoakRHMCtSdjJnNStw?=
 =?utf-8?B?ZVp0UHNwdFVOKzNNSWE2VzR0RC9raysrcEJmaW40Ui82ejVrbzVXTnIya3I0?=
 =?utf-8?B?TVUramhNbis5V3RSWm9la0x5elk0NXVyb3ljR3k0Q2xiV0g4cnFYanlnaGQr?=
 =?utf-8?B?N3ZlZmdCMXJXbUpETWt3NXd3eC8zT0dzTXFQcE9jY1N2aDY4TTlNV0pTNU9J?=
 =?utf-8?B?eDh6MWJ4OHhERFlQY0RtMnAwbzhkY3l1N0cwcEptbzEySDVrcHFGSG1hYmIr?=
 =?utf-8?B?SjQrelhoanQ4MEtjR2V6djFzWkNnMzQyM28vczgwZU9uTnJjU3RPR2crWGxX?=
 =?utf-8?B?TGR0Sm1VQjNzY2k1YkxDTzdqendJdW9MYVNRaTNSQ3I4NEZDNzF0N04yYm4y?=
 =?utf-8?B?RVova2VtRTRtalZTeTJEUjQrdFZYTEJncDhLRXR0eTV2cHlzZitzN1Qxc3l6?=
 =?utf-8?B?V0dmS295SjVjZVZlR0FNZXJGOFRiVnYzVzNOeU5LREF4OTBLNUQ0TjdVdGp3?=
 =?utf-8?B?TGl2NXkvdGVacC94by9IYUNwRGxIOWJYVDlIdHl0Z0NMWmtKejFFUm02YnVI?=
 =?utf-8?B?TFpPWEdHOGVHcW1yaVRVejQ2VysxQ21iMnZlTUdEMmFiOEVLZ2JtQXdheTZH?=
 =?utf-8?B?RUNIOEdPVjJSU2FLN2M5MWU3bkllbEpyRWp3NGhFK3VDMTdteUtXSUwrQkhJ?=
 =?utf-8?B?LzV4ZVVYeGduc2ZDdWNsSmNOQ2VWQnFuVHBjYkVpaXovNHRNL01KUkgwNlBO?=
 =?utf-8?B?OXE5QTdPUm1UQUp2TnovcGF2cWFTMUVncGhJSU1ZcUhtUWhHQlAyN3MzdWdu?=
 =?utf-8?B?cEJibDhXYVMxdTM4RnpXRjJRc011MitReEhDYjZ5bUFPdXdyTFZSM3g5YmlT?=
 =?utf-8?B?d1ZkSkpSaXhKTTdoak9XUzdWN1F3NVR6Yjc0dmNUakQ0KzNMditWU0pnd3Vz?=
 =?utf-8?B?YTN2T2gzYktKUU1DZHBGQm5IQ28veFVDSkFudGhzTHFoM0Y5RWxYOFNOOFFF?=
 =?utf-8?B?bGROMS9hUWJMQ2NjZHF0Y1hpRjJ4VERjRFVQV0IzT3lEdlg3MDhTNUIyUHFa?=
 =?utf-8?B?MVZWWjcwTW9hYzNRbVBKYXFEL1EvU0JTWnVYODJ2Q2FXUE9BQ2loSFFjMzQy?=
 =?utf-8?B?ZDVZd3FhaVZWeGNhTHcwT1JYQTJZYWFJS1F2Z1ZyZHpQeFN1K2dpM2pjakJM?=
 =?utf-8?B?eGNXbGNjcVpRcHV6RkNnbE03aDB1Q3E4Z01BZWFBekszdnFGdit3Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aba454a-b996-4fce-476e-08deb656f7e5
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 10:02:57.8451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b2ZS60WkAZOtNtZDvIBoOP9ighCE6KervwknFZ++OuI48XbCBlasGlT+JCLoO0L+Rp3hexgHhMAg3BXCse0AiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5306
X-purgate-ID: tlsNG-42698a/1779271381-1956BF3B-B46A946A/0/0
X-purgate-type: clean
X-purgate-size: 3270
X-Spamd-Result: default: False [-0.18 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7A32858B493
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 10:05:41AM +0200, Jan Beulich wrote:
> On 15.05.2026 15:12, Roger Pau Monné wrote:
> > On Fri, May 15, 2026 at 09:15:40AM +0200, Jan Beulich wrote:
> >> On 14.05.2026 17:56, Roger Pau Monné wrote:
> >>> On Wed, May 13, 2026 at 08:44:46AM +0200, Jan Beulich wrote:
> >>>> @@ -2623,6 +2640,21 @@ int __init init_xen_time(void)
> >>>>      return 0;
> >>>>  }
> >>>>  
> >>>> +/* BSP-only function to pre-set an approximate TSC scale. */
> >>>> +void __init preset_tsc_scale(unsigned long freq)
> >>>> +{
> >>>> +    struct cpu_time *t = &this_cpu(cpu_time);
> >>>> +
> >>>> +    /*
> >>>> +     * The incoming frequency is only approximate (nominal).  Increase it by
> >>>> +     * 1% to make NOW() output rather a little too slow than too fast, thus
> >>>> +     * avoiding a possible backwards jump once the final scale is set.
> >>>> +     */
> >>>> +    freq += DIV_ROUND_UP(freq, 100);
> >>>
> >>> To avoid such possible jump backwards, won't it safer to also update
> >>> the ->local_stime and ->local_tsc fields at the time the new scale is
> >>> set?  Updatign those ahead of setting the new scale should avoid any
> >>> backward jumps.
> >>
> >> ->stamp.local_tsc does get updated; you merely dropped that line from reply
> >> context. As to local_stime - how could we possibly set that, when we didn't
> >> get through init_platform_timer() yet? Leaving it at 0 is the correct
> >> match for setting local_tsc to boot_tsc_stamp.
> > 
> > Please bear with me, maybe I'm not understanding exactly to what the
> > code comment refers to as "possible backwards jump once the final
> > scale is set".  I assume you refer to the setting of scale
> > early_time_init()?  The ->stamp.local_tsc value also gets updated at
> > that point, so it's not possible for the timer going backwards?
> 
> It is updated there, but only to boot_tsc_stamp. I.e. no change at all
> if preset_tsc_scale() set the field already.

Couldn't we do the following in early_init_time() to ensure time
doesn't go backwards:

    if ( t->tsc_scale.mul_frac )
    {
        /*
         * Update time snapshot to ensure time doesn't go backwards as a
         * result of the scale change done below.
         */
        t->stamp.local_tsc = rdtsc_ordered();
        t->stamp.local_stime = get_s_time_fixed(t->stamp.local_tsc);
    }
    else
        t->stamp.local_tsc = boot_tsc_stamp;

    set_time_scale(&t->tsc_scale, tmp);
    init_percpu_time();

That's kind of the same logic that's used in cpu_frequency_change()
ahead of calling set_time_scale().

> > This changed with the addition of the init_percpu_time() call in
> > early_time_init(), and makes the setting of "t->stamp.local_tsc =
> > boot_tsc_stamp" pointless, as it will get overwritten by the logic in
> > init_percpu_time() a couple of lines after?
> 
> When making these changes, I first thought so too. But no, that write
> isn't pointless: In case preset_tsc_scale() wasn't called, leaving the
> field at 0 would break the use of get_s_time_fixed() out of
> init_percpu_time(). (Iirc I only noticed this because of having put
> debug printk()s there for other purposes.)

I see, yes, that would be needed.

Regards, Roger.

