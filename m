Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIbsAHEkD2paGgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:27:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 649AE5A8532
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:27:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315409.1585224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5Iv-0006si-3n; Thu, 21 May 2026 15:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315409.1585224; Thu, 21 May 2026 15:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5Iv-0006qR-13; Thu, 21 May 2026 15:27:21 +0000
Received: by outflank-mailman (input) for mailman id 1315409;
 Thu, 21 May 2026 15:27:19 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wQ5It-0006q3-ML
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 15:27:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ5It-003b2r-39
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 17:27:19 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0f242c-e002-0a2a0a5209dd-0a2a450c9832-38
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:27:19 +0200
Received: from [40.93.196.50]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0f2454-62f1-0a2a450c0019-285dc4323339-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:27:18 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 15:27:15 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 15:27:15 +0000
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
 b=aEyGF5fRZRemYAJ7G6hMn9xqdLGsXGeSOZ8wPXCN/RO3YdY/CDF/K7wzGP2bBzKzOn2wRk/HZzfOeJDj8uBn0+P+FLOvPgDDOXjzqyWnDTdFElu9BCUokg9a2t42XP5GI/6adst2hgPSSKRIUnMtgUwtKz9yXBfDWOYF4paiRu+jQmfBtTTWwk6rd/4Mx9Pa6N/61B735iw1Ozw3NbEh3xvgPDaPBnP8BbNG3fvMd3SB/vy9IoWO769lfZiaHAdL6SfOxzQHpfK/zkgsUAjiodmgagLeXaW5bpds3ee+y+4H6gJU2vQFRQpMiG19FdXfp7Mq++Q59IjUys4t4vWSIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0K4F/hcRyaD+7FLcG2u4gAy+TpuzoRYRtkVYfuEB3bg=;
 b=Cl3l7aDY1xO2rI2ckkGqqSj+aVKjT+YWs2aWF5uGYZSqfKDq3NlWKlGLkR3Dec5T8+HVZpvby5Q5Tis9HCt2vhdGcSnBt0rU3mEY3SPU0QX71sGba223HyydpjcEYgz/QbhT1OQIMus4uxNTY65jvArj8Ia+akMu3XXpMupUFRalgCCVTmyW8rqF4RMnyqrRucQTDJjO3fgtKQMHfv+Fi+bT5I1l2tQ09OVFalMERzLLRdnDViT6aiGldxVeSEIdCF/1nF7QaIPWQCErmhpieAWUkMrQfFAExr/HpdD2Vk8Gz9YicvBt4hbqBy97xB6dBy+YzMLMgAugCE9Nmp3DSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0K4F/hcRyaD+7FLcG2u4gAy+TpuzoRYRtkVYfuEB3bg=;
 b=uYkurUK2QJv93rs7UdCOG05/as7Y2Ztcde9nbAy/C1N0zhY+kt7OduHdcruT2YxuEj1L/YRh4FzmuyG+cduHuQ55uDy6GnPgg+/b3g/DknIT8Pb/KYRTcZ7rnF+rJM3ypiU1kmM8xzC1jC8+jPWGJkMTgWlijr5GFcwFB1RCgm0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <28d1d6fc-604e-4689-ba1c-894904f3ac94@citrix.com>
Date: Thu, 21 May 2026 16:27:11 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 1/4] x86/shadow: split get_unsafe() invocations
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <738daea9-ebec-4299-b0f9-49448293106d@suse.com>
 <f532fc29-f3cc-484f-b137-c3f8d04279fb@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f532fc29-f3cc-484f-b137-c3f8d04279fb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0135.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM8PR03MB6230:EE_
X-MS-Office365-Filtering-Correlation-Id: 5505578a-377f-412d-e018-08deb74d6fd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|4143699003|11063799006|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EENtGxYxCQ0dqrlAgaHOqcSUQPLjCME8FBM+0WnecqMs1GVfNwRzX1FNOLogfM5eh39NFmLTARh+4tWBBuZIPBSteP0uuePt/lEIypfCYq7NIF6bJpuVeyupD7Rcl16HmcgzaoQTbrYTJkXV8IaAX+Pvimf/MHBG/J8YYv66kSK6sn2WW89B7a4DzKlywEpc24X4rvh9nI4La3faUrfsF+ujNV9Lnp68r+EvXJ7e+NhAyhXJEw+y0IrfaE6TKdChVKZy+3/GTmmFkpgyekREy631TfLHE0Y8DITd51GCesH9qam7+B2RjRt9BaGu9fIPdsjg1YdBxjFAqB99+vNQUVFlZldf0bxZ3bX4BAxQ2DDhGSg6goj89ZbjWpWSeqv9YlF2r2RQq48wjXYvozQHemxWmQp1wOuDCsDIq3aPsteuILSjLxXBGgeFwEwgphV6GQE1P/gCupSsL3hTXh0ZaZ0MDwCi8nG2Kogo8NHlW0rvZudH8JgXR9y6xb0mLQF/1qJgS/Nw5GIb4cAtFOil2y44HsRMZYYxCqgNyYsmyVMKqLrCqw/0w/ro3puA6GSYg7fRvEiWG3ADgYAih7h6k0fYphgbwa1Bg753y5ciHq6fvqe1nRCJvC41USMfopCYtUNu7AYXl3r0LDJcOn/Q3HeTJg0/SUyo3Y4EDIbIdEVwMQ/j0iTk8KN/AKvY0XiQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(11063799006)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1ZHZGRFUzVTZ0VJZGo1NjJGdjBUQlBmVEY3dDJYQnkvM2t2bVUvQ0NPVUxa?=
 =?utf-8?B?RllxdXZJMlhseHVrZ3doOUIvUVhxcmFxbE5MVlVDNlQ3Qk10QkVQSHk0RHpI?=
 =?utf-8?B?NlBEdEMwZStkSXc5MUo0RUNCelB3blFOQ0JVc1pSZ2FheFVHNkpiYVJoWnhK?=
 =?utf-8?B?Tnl4U1JoZEE1dzNwODJmTUV3eDBFOHZoK3Y0bU1YMnI0YUxDWmJKVmwya3By?=
 =?utf-8?B?Tk9LQnV4MjNBazRTMVliZmphVDZHMTJpOFhwSzJVTnhCOGswN2hUNmZGNlkr?=
 =?utf-8?B?TnFVMStIUE10MlMrRHZiV2dCS0NWeUwramtxV0tYY09FWmpubWZZcy9pSWRP?=
 =?utf-8?B?cy9ScjBRSEhiYzlYdkg1azBxNVU5T2I4U2NGRlJEMFUyYWtOYW0weEtNYVpL?=
 =?utf-8?B?UFBiR1JyWUFrV1NQNG1oZXR0MGtHNDMrcE9HN21DU29SYkhHdWhsQVE2T1V4?=
 =?utf-8?B?czFZRUlJUy9PWnBSNG4yQzBPUzFVcUg1UnVrbkRjSUZiSGlwRldWZXNNdWIz?=
 =?utf-8?B?Q1ZyY0F1WXoxSEo1Z0FERjNMZFJURjJrOHJlS0dHYk9pNVZ6bE1rb29wYzVO?=
 =?utf-8?B?R2svczRGaEsxLy94eitPWkNKSUVPMFhZb1I1cmxwenpoRDlwbjZIMGtNWGVw?=
 =?utf-8?B?U2VxUlhYeFVlbFUxK3ZGK2gvUWZoYWtOV1ltQW1GN3pVZ1RPU1BiOGF6Qlps?=
 =?utf-8?B?R1FBRmlJelplQXhGTjFKWitaQlUyRkd6eml2dllLK2I0U0Qvc3hPeDZlMk83?=
 =?utf-8?B?Kys1M2c2eWtxMFJ0bTA5UFVsRzJMMTJTUEI3OFBPOGtKVkdqY0FCSVFaUkd4?=
 =?utf-8?B?TlRqUCtIRGEvYkxtc0NjaklicWgwa2FqOEd4eHo1dlBWSHJlY0liWFF2aVB5?=
 =?utf-8?B?S0Z3ekpVU1NUTkQ1UGJPbFB6N2IrUzUyVjhGNERFZXhkQ1VqaldPVk5uWTV3?=
 =?utf-8?B?TndIVHRvMEdVYldIOWFUSldDQnpFbm1TVGFLaUxFMkF1N1JORVFvS01XMjgr?=
 =?utf-8?B?UkkzcEtsVFo1TEc5V1ZzdTNoeThsUXR0ckFiOTFOMlZZbW12dmdqRXo1SlFO?=
 =?utf-8?B?cVBMdTR4LzYrRmx1RnFGaWM2UlllQVBLUE43ZDhCUHU0cEZaMmNGTUlRTzB3?=
 =?utf-8?B?ZWtCU3dUZHZ5bHlYMVlldzl0b2ZDbVpoNFBaYXJORklxdkdSTGRCSHBPT3Ur?=
 =?utf-8?B?bUV3TityOUtxRUVEWlRyNXB2aWZFbVFOdVA5bzIrTTRNQVFMZGNReW1aeUJZ?=
 =?utf-8?B?aklaU2hYVGZOK2Vvc2swMHF5VlRUT1dWc3N0bUNYdWdXcCszTWRkeWlsWU1F?=
 =?utf-8?B?UWFXUmRVeHQ4YmxmY3RGWVpiNlp6UnBnMlZheWk3d1hab3haY3IwUEFIY1d3?=
 =?utf-8?B?Sk9KMGkxRm5IQzI4NnZkdnZZN3BvRjJZRFFrb2tjdE9qNjkwN2N4dzFHUy9S?=
 =?utf-8?B?U3Y0MjBUeHVJQ1FuOFpBeHV1WHRqMy9HWTNaSy91ZGliaTVEWWcwTG1OaFZ1?=
 =?utf-8?B?YXdaTUkzY25lU0ZtQUloSU4yVHdvV0haMTNac0VGMk1ZVjFKMzcyQ1JVTjM5?=
 =?utf-8?B?N2hwQnJSUXh1QjhNNkpuYzlQWXhMVVROaFpVWnJjaThJYUxSa21HVTBtTnIy?=
 =?utf-8?B?U2dkMXFxM2U2UkRmdTFCUXNNTm42VVRRSG92UzYzYnc1RnlMMWxrY3JTVW1L?=
 =?utf-8?B?Tk02KytTOVV3UC9vcENUWDV0cXlTNVhVb2wvbVJsbDVqeEJnUWdHQWFWNWVM?=
 =?utf-8?B?SVB6Mi9nTjhYNnhDOTVFT2thNnNMS2JJcE4wQjc4cWpmSzhFU01BT3RoL3U4?=
 =?utf-8?B?UVRWSVFkSnBCR2NlaFFTUEc3QTloSm9HZGVVM1lBSit3V2JRcDBuVVV6ODc2?=
 =?utf-8?B?akliNVpTbEtLTncraTZiRVNXdnhna0I5N0VtcTVLWnJtQXdZd3kyVXRTQ2tY?=
 =?utf-8?B?VW1PV0ZBeG1ZK2JnQUpTcVQwbDl6UFBYSnEwZ3ByMVJKbmZsejVVdUdWYk5R?=
 =?utf-8?B?a29zSHVreHNBUzdySytCV3JpYzFsMVp3S3l6VWdaRDVhQlNPZWdKeHkwVzBY?=
 =?utf-8?B?cHNiNUJtdHFxNndkTVlPZG83bjNkQ3U5Y3E3YjNKMnNmTVFCZ0p3Z3V2Mm5n?=
 =?utf-8?B?Z3dXLzgwZFlNMlV2VnZPby9PRC9hZTBTaFVKRWVOWk1LWGROalJLc2NpQ0F3?=
 =?utf-8?B?YU1DV29QWEE0UHJ6RkRCUk54eTJTUGNwaHExOEZROHltYjhHTEk2ODV0YWRH?=
 =?utf-8?B?SUZQNkdYNEwvT0lUaHBwTXk1VmN2elJOMGszb0YvVHVnbGRSUGJPaFNuTUNl?=
 =?utf-8?B?KzVKOEJVLzlEaGJ0Y0lkNDMrVzkrT1ZSVW04N0RHVldpTFdjajlYMVRBdVY5?=
 =?utf-8?Q?Q4ivxKxWErxYoTYI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5505578a-377f-412d-e018-08deb74d6fd8
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 15:27:15.1582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aDCMR75bLntJInP1J4W5/PONI6lxCgGSt1EWHvAdSfLi+bmQR7VHaZbeBVNNeL+yhjF27sIk5RQPLIx5puzSDmXZKAaoBZiaGCtzx/D0z/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6230
X-purgate-ID: tlsNG-d25034/1779377239-E3B7CCF5-D1C927A7/0/0
X-purgate-type: clean
X-purgate-size: 668
X-Spamd-Result: default: False [-0.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:email,citrix.com:mid,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 649AE5A8532
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/05/2026 4:15 pm, Jan Beulich wrote:
> Misra C:2012 rule 13.6 takes issue with is_hvm_vcpu() uses (deep) inside
> sizeof(), as used by get_unsafe(). While sh_linear_l1_table() doesn't
> involve is_hvm_vcpu(), the rule there kicks in for "call to function
> `__builtin_expect(long, long)' (unevaluated `nothrow' call effect)".
> Break out the address calculations.
>
> This, overall, turns out to also improve generated code (with gcc15 at
> least). No functional change intended.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Code generation is improved with GCC 12 as well.

~Andrew

