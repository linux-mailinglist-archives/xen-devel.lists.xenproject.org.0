Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9LWRLXT7PGpqvQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 11:57:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B336C4709
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 11:57:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=CevConbL;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1345410.1604277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcgpI-0000DM-9b; Thu, 25 Jun 2026 09:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345410.1604277; Thu, 25 Jun 2026 09:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcgpI-0000AY-5l; Thu, 25 Jun 2026 09:56:52 +0000
Received: by outflank-mailman (input) for mailman id 1345410;
 Thu, 25 Jun 2026 09:56:50 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wcgpG-0000AR-Iz
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 09:56:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcgpF-008FKe-UL
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 11:56:49 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3cfb58-bab6-0a2a0a5309dd-0a2a450cafcc-30
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 11:56:49 +0200
Received: from [40.93.196.14]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3cfb60-f399-0a2a450c0019-285dc40e73d3-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 11:56:49 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA1PR03MB8097.namprd03.prod.outlook.com (2603:10b6:208:592::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Thu, 25 Jun
 2026 09:56:45 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.018; Thu, 25 Jun 2026
 09:56:45 +0000
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
 b=clX+AOzjzO4Kob0kkqYtKSNM0r2YR/okzT7xU5rOEDdJ+qnlZhdzzK1VbnopziqAiQKl12fYFvQ28PI+SEPrtz7qQVq4SGIv4+rcoM0MNqko9dX9FyzPvgS4MJelZvxK0lIQOVDJc8ebMoL2g+rHdxpoqaRsDRehSyBZwSTuFzSX75OX4x0w/yBjjAKrQfjCD2/SpRGT5Svc34Bmknp8mvjxGE3Rard40KF37lJdG0dPrBFkesPxNrjIHMyLB+Qm+NddJ9Tz4rQaz403KFRbxgwiGV7uh0GcW93WjW0TJttzu//w5VGqGS9YZrf37kv7t2De9C3n+DOq/iJ0j+aiyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4K1o1md2CFFyChMQ2HaXsZ9rYQ85cZ24g+tyFgF3XNk=;
 b=qq0oDpnkWIc8bakIkrBa5uZljZGjse/+gp6SqvbhUTnZvjBea2Yk3jEKId19bJuFoqpKna7EVMOJrBc/gB8/WIhJLuAviR4d28jlogs4rqtubNeIktl64SjFNiMnzBerOOfqJeIQIWxVbez5AZ7MxhvL4LcQ5Sb8IP0dk2ZlUNhHPNlwxQjWZOknldnqfq5oEloBV9lB+2JWEqzhiK7kwyPDiTMU2kHgxTVmsmbrJjp6S8Wy1CcdKd80IRHUeen4L+MIt0zxYREbaLk040yBpPws5dTqGE/LK4jFcXb2IrGNw6lfwc67a0kRk7TIKz4E35LfzoyKOVb+ZPH7hhFubQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4K1o1md2CFFyChMQ2HaXsZ9rYQ85cZ24g+tyFgF3XNk=;
 b=CevConbLNG7VRce1h89DV58MtANMvbjQSAb7qdLTQTGAnIZ1eMoG6+iJ2ktv+jfXxjfue8mx4s8Dlg1AajFLCKtKFeCkGCDt4wLgnoGQ+qXUa2lLqf2qXjSMzXPtqum/DrMujFgKryFe8NKB//ZXf4HfLu5TBSl2HDcDwhtr1U8=
Message-ID: <b24c7119-a668-4ca7-bb48-ebe202919b6f@citrix.com>
Date: Thu, 25 Jun 2026 10:56:42 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/fred: Send an EVENT_CHECK IPI on exit from NMI
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260624142338.653064-1-andrew.cooper3@citrix.com>
 <53950c10-8708-4122-8976-5eeb943ed2a3@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <53950c10-8708-4122-8976-5eeb943ed2a3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0074.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA1PR03MB8097:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a38abe7-c13f-4ad1-1bac-08ded2a01121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	4ORi9qcc1LEWGf29X6tKLi0mEEEv4s6pHAdsF5kzxtOGwWE341Pm8aDldXBjreP1uNcWkJ4O3gSd51QUaWLWwVfrzlUzw0edDqy9t3tr+Y5qIQcBlVEW6qFlVBdloV+OmQI9lwlYi7DGPWtsIOBUPSH2BJzynY6yyxTHNE3dZMVcJD/4YXQxZYilI8KezUIophPRmPToGfjo1vYr34pUGkIJKpAugUHZM4PMDT1P8iJkbRlur2an23N/fNZ1giibhgpnFlnZcG3P1wuoGtMDNgxYnMBB4WgBW2w0wR9n+DaoGskUqmBvPOuPU/T2NNvlpJYwR2wtDIJX+MCIn7jjH4ybhnUzJs+jJcklsg8qDM7FRvso+73ZrTPXZuRZyB3qb8DvQmB7RtOOzrmvQ7foEgcsjFEfeAZxsawDc9iPPmxXQfhpgnaFCOR269NQxmKauy+qht4QAYERwIzWdVTjdQWrsUyQ+2RFolLkuaIHIsr82+fKuTvTK8e+1LR4T8TPG+kcOHSoBoRyLZTuuoEvgLwCwp/cgqhFRA/DOkyoHLj2aOTEqUpxoGl0T76Ylyp9/VtsqEPcYJkGVQODyxRjlMl2qys1oxfayijUwWpwUH6gxoiXiGPLT5rqzZUpmkRFAAnYcgSdQ1rC6dBxVXva96R62v3/vdGdu59gEzWQ9eI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlJjcGhCbElDSjgwazN4UVZObjQ3L3I0SW5iUStsVjBlSXF6RUh1U080N2xr?=
 =?utf-8?B?V05BN1FkbCtpZE9vR2Rkc1R3Z2FKaFd4QXppRGVEQ0pPUWFZU2l4TmZxTGdw?=
 =?utf-8?B?eWcrOFNmckdMMEpXU2M1U255RWxGTmx3OTNTV3lYSlk5ZWVKQVhSYmt4WjVj?=
 =?utf-8?B?WklLNEN1VGgxeWlHT0VYMVlBbzY5WFBNQVZwNTh6dTlyWXlRYnBCVWp3SHJl?=
 =?utf-8?B?cTFBUjViQmlHZGZZcG9ZOUd5UVMvZ0txSjlja3hxNGo5SkhaVlJmV0UvSTlo?=
 =?utf-8?B?V1FtbFJ2b2FUMW0wdFRpOUg5YkFJTGN5WlM2WSs3SjI2VUhuR3VTaWw2SzNj?=
 =?utf-8?B?K1BDWldXT1hZdHZMUTNVRHQvNnVTbXVGU09IRXdtNmhoaHgyMHdhbUVJMFZi?=
 =?utf-8?B?em81eDVhN1JEYmZpNElqQ09LY3ZqYTBrNDRZSGxMQUlmZlRpVnNZdC94Yk5Y?=
 =?utf-8?B?OEt2OHV3b0hiREc5WTJuVHVGQVpBSFpGTlUyd3hwTGdhWlVxUjBUMzJBaFUx?=
 =?utf-8?B?L2hTd3AzQ1FoeXNFTHVBQU1LbERrbUxNTFc1Y1NDMVVWSlpjSHczdndjSklG?=
 =?utf-8?B?YzM5SzNyM1o1cHRzUDhic0ZFcU8raWFSNzg5cU81QVJPM1Y3SFFQY1dRbjhW?=
 =?utf-8?B?WHVzN2FVdlgwdkljdmR2aFJuRFJrdm9xaDV1d3Y1cEoyeFg2WW5jazJLU1NJ?=
 =?utf-8?B?amJGQ25TaUZOZUF3dmNRL1FpSDE5dzMyYWJMV2lXdE8wVS9mcHpOTENaK0Vu?=
 =?utf-8?B?OC9CdVhLblE2cmxncVBoZnhUMXNBRERMeEE3NFhFN0lFZ0h2dEFFZzNtb1JU?=
 =?utf-8?B?MXBibWpkLzhCT0RKUFFjbE9NL0RuOEdRZjl5bWFWcTFQYnl3RHlvS0tSMUtN?=
 =?utf-8?B?dThtamJsUWl1Q3ZUZW1TR2hyS3ZnelVRVVFaak5zSytjU1hPSW5XQkxlajZB?=
 =?utf-8?B?L0g4d0FOdzBhQ2JZLzhNNW42clJyMnFUSk90WE0zMjdTamdiaEs4SWxPa01O?=
 =?utf-8?B?U0JHMVZaTm02NXZQVVhSbFpZKytJdUdYd1hMSnBWN0xtNzhxS0ZybDRQSlEw?=
 =?utf-8?B?UjQxWHRkN2FkSlg2dVc2Y0JLaWd0eHZrRlRHeHhhZDE4dSsxS1BUcmxVeTZ5?=
 =?utf-8?B?OTBER1ZhbEQ0N2ttaFBUYitReVp2WTQxdGJ2WkRzQjkyd0FMa3RXaU42dUZ3?=
 =?utf-8?B?Z0JrUW9hbVhFWW5vZkNpUllkMlUxcjU0ZVRVazdYK0tFbTdrRGV0UWN2d0Uy?=
 =?utf-8?B?VmFydURUZGtLSFkwdytiejVFb1hLKzFMNDlib3F2bWdJZkdpWUVDU0FYRVJX?=
 =?utf-8?B?TkRzdjRXRmE0cmdPMEozdFpGRERDUEpSM2ZyMkRVdWNqQmh6R0hIUVJFMGJ4?=
 =?utf-8?B?ZkJNbk9WZDRSVytzTDNYZzA0T0FiQ1pxdVFBenVENWR3VHhWUTVPSEYyandt?=
 =?utf-8?B?blBNQk9xWmhMUE1ZeU5hY0wxRGdIVjVCS1NmbXFyRW9DeDZycXNtdjNSN1FG?=
 =?utf-8?B?NU5IZjFPYkVsL3MyTW4ybEY1NHFkVWJrMHZmSXlUQ0phMEExS2dsY0RUbEJB?=
 =?utf-8?B?Z2dhT2xyQURHdXo5TlNITnFtK05RT1Z4cDFMTVg4WUZqQnhuRXQzV3BDZThs?=
 =?utf-8?B?b3JwemhBem8ybTIxRE1RMUhRZE0yNEduN28reWxVL1JtTTN6TzBtUnRjUEVZ?=
 =?utf-8?B?OVhvNjc1UDhqOERxWjZoKzk4R3Fma0FCUU4vZ0s1UDVkRkZFbkFMOGhTQ0Zy?=
 =?utf-8?B?U1Roek90WnJJZjB5VDZWZ24rR3J4UG82RTNSamV3KzNZS0dIZ3M4Nno1ZHJy?=
 =?utf-8?B?RWxZZktiajJYZXI2OHNmR2JQbkRzRUEvMlhaa3d4NUROVzkyOW5HQzJ6V1Np?=
 =?utf-8?B?Y1VFaTczcExrVHZDNjY2b3pVZ3hxQ3laNm84UHk1Y1M3L3Z3bDdUT0Z3OTlF?=
 =?utf-8?B?WS9lWkVTY2k3emI0VGoyZ2gyRFcvVmRmRUlpUVB2UmFlQWlUakJVZVlWZFBk?=
 =?utf-8?B?WVUra2ZlZE8wN0loTnJTU20wOVkwbzdYRDk4aENlM2VoK2F6SXRMaHNaaDN5?=
 =?utf-8?B?Mkh4ZG1iRGlpVUltdUMzaXRraTZCd1doZXpWTXBHUk14QXduMUR5SWpDc0JL?=
 =?utf-8?B?VEpSUXpydjZKYUF2STlDbk9FTVBXaEdaZUNxWjNGWXVncU0zVU9UbHJ0UXRm?=
 =?utf-8?B?SjlYYlBWTzZUN0NsdnpZUnZoUFV0dVdBcG5DelZ2Tk16NHdGYjZQS0NuaElw?=
 =?utf-8?B?UldxK08vVGYzRUNXTFpmUnJraHRZMFpzNTg2YVN3eGlnNmNZaENMWG5Bby9u?=
 =?utf-8?B?bzd3OWFtTVVjSnQxRENRUnRwc3V5SzYwbWxBOWw1UTBrbmh6aU1QUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a38abe7-c13f-4ad1-1bac-08ded2a01121
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 09:56:45.7749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kkqxFLJDdSia3gg8pRRF5OkTSf/M18JEdLd6+fz6lU4yQiJfbxfvbwjh/H6OkZmbsPzJ401CgYJbJvpOF38mQU2h7iosiqzPemC88A7E44Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8097
X-purgate-ID: tlsNG-d25034/1782381409-92B3DD51-7A48E3E6/10/73395122804
X-purgate-type: spam
X-purgate-size: 1330
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:email,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 19B336C4709

On 25/06/2026 10:53 am, Oleksii Kurochko wrote:
>
>
> On 6/24/26 4:23 PM, Andrew Cooper wrote:
>> Returning from an NMI which hits guest context needs special casing
>> in FRED
>> mode just like it does in IDT mode.
>>
>> Break nmi_exit_to_guest() out of handle_ist_exception(), and use it in
>> entry_FRED_R3() also.
>>
>> Expand the comment a little, and invert the conditional jump to
>> compat_restore_all_guest() to avoid needing an #else clause for
>> CONFIG_PV32.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Teddy Astie <teddy.astie@vates.tech>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> Slightly RFC, not tested yet.  (My AMD system takes an eternity to
>> reboot)
>
> I would like to have a test on hardware to verify that it doesn't
> break something else.

Yes, just confirmed elsewhere on this thread.

>  With that:
>
>>
>> For 4.22.  Found during testing of FRED.  The consqeuence is that we
>> can end
>> up scheduling while still in NMI context, after which things like the
>> watchdog
>> and other diagnostics don't work properly.
>> ---
>
>  Relase-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com> 

Thankyou.

~Andrew

