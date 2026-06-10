Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xGixExU1KWp4SQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 11:57:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F526680E4
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 11:57:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=LUzHs4Po;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334106.1597211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXFgW-0002LD-MW; Wed, 10 Jun 2026 09:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334106.1597211; Wed, 10 Jun 2026 09:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXFgW-0002IR-Jl; Wed, 10 Jun 2026 09:57:20 +0000
Received: by outflank-mailman (input) for mailman id 1334106;
 Wed, 10 Jun 2026 09:57:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wXFgV-0002IL-If
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 09:57:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXFgU-001kyX-79
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 11:57:18 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a2934f9-2eae-0a2a0a5409dd-0a2a4509ab70-44
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 11:57:18 +0200
Received: from [40.93.201.65]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a2934fc-2497-0a2a45090019-285dc9414abb-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 11:57:17 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by CHAPR03MB989226.namprd03.prod.outlook.com (2603:10b6:610:2fe::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.15; Wed, 10 Jun
 2026 09:57:15 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 09:57:15 +0000
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
 b=Fg+nROkMJAuEMP6MJFS8Z3YPwCnZn0F2m5jqGLqLcfvhc6ySAKbgfwOXZQrg7CWVuxCwuezS95IV5HEwFNVtG0GBrdbSRnbfOdC5JgcgHiTK8F0jm16iyN2cRV25c2IuIFkzWmQBBZZZjbEozG7beLcarAjBG+O/w0CZNcqtW2MZjhARcIdu3sRP2Xerul9WqES7t763eRok80x8s4kkujS8AcrLrYdGPpDd/pcc42ffpFB++z+XvDwtwrl3xN2c8gr2jC5zSLrx0OuZnGg78mMa1CBFO5VZyiHnFSbmjgS5JMaaxmS7oJwoscM+ErR8lMskQ307an/Rfgv4S8dd1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLYJe34Z6WHlwoSJDhl1LQvPgiztpz7D02TDA3ys6oE=;
 b=kShlEGDy3iqNjEENc1QNTf4iaASkem0Za0Z6EIVCkJuVP6h5pG1XiHX/Ma561W126+T9vdB6GViAGT+EKUhZQp+gwQZtXkAd4JB/y5eecn01OEGpqVeH3/R6BvnSDctJdkeKyoYnFc4n5xYkvHblFc3vnHfUARCqUUx0PMvT74HQBKqMQkojr60FhLCbAuEBbLkiAjtrtptD0oEPVyZU/mnSBi5bmvgCFEm/bUzmrcgDowNFp78f3X4BcxfbNeT0gqFo69fZ7cjo09lriwoNdWNw1VCUplINK8Ihmpu4AX00c8cmFTKk4AXwvzJxkKxA+QvHfYaD6ifKd8sNNDFT/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLYJe34Z6WHlwoSJDhl1LQvPgiztpz7D02TDA3ys6oE=;
 b=LUzHs4PoY92+tUFOqt1L/EPhbeWluivbFB13TFnpFHr0JeAFkuDbC8yQ4aeVfDuNmQJjZLrpjiwUtCfMY2WnDTX8S+DJXG15OP/0RyPOQEAb8JoHNeYVuaUlIXP6KLnmxngK/UXdJHcDCpNPk2kJLhR61eebb/D58lQCKYWA5Qg=
Message-ID: <071947c5-00ad-45b5-b782-121ad2b7f919@citrix.com>
Date: Wed, 10 Jun 2026 10:57:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] domctl: Avoid taking domctl lock for certain ops
 used during migration
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20260609151528.2426788-1-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <20260609151528.2426788-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0071.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::22) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|CHAPR03MB989226:EE_
X-MS-Office365-Filtering-Correlation-Id: d6e00b43-46db-46f7-f1b3-08dec6d6a644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|22082099003|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ZoZQKQN6Md9Mrc5Y0zeNI84eHFhTLQFB2liRR3cswfCeBNyJaxPF1drRGIHmKXgLEDZ23fJ96w/A/zTkIcYja+Vi/oKWSe7475tWYTJUeUlFblNTFQLIWKasR8lH4w29N6E8zwyINSpBiJq0AP6dgXxFJgzgsaBrK4CfohdwMG+UToQKRwsTxiQbuFoBd+hC4KwydVVat2Q0jzg50CAMX2gMKGOO/uLnQa71pi1qV6n78Pl5EHBig9hGdW+qRifh5KkChJNh+1hDxmLgEAYGaxnNHoSYPycZX2rvu/maule9gF8q5Y+YlEHbT59EZPyArym3l7rOvYnljTH8a3z1ele7yaXvu7//+6W1pJMP9kTJalcukfD+qk0gmaEzY56DWy5QP/ohc7hEY5JntEhEipm96mFEVuqqb+KFVIrdgqoGKrHsZjUwseln2cIw/9/3hFQs+1pAnG1gm/b8EEKgjh/aCdMKt64gZ28258f/094IxtLCYbX9r2sPxjMA0FainXn16hgMLKuFCOyNwJaw8KFXQz5hlTSQGQcsY74R+nEXnyPjYPhc/FdU0rpFHsl9S59iS2qXKDNIaa6lyRrMyHjdUssXeLe7dnb8q313ohM+BqMD/nc8/rnllwjNTUb3qOp0VzHp1X677H7UVR0TfUGllG2vhpXB6W8D5xEJFb8SOAeI6LPZZNEcEhGkzR7d
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(22082099003)(6133799003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eForclFJbVNMZ1U5RUpDc0twaFo0aGxGTENOcktYUU1BSHAzYk9UekNxdXlj?=
 =?utf-8?B?eWt6Vk1qNkJOMmZjWlNGZHprZ0l3ZCtvS20xZndnUFNUVGF6YkZlSURIVXZH?=
 =?utf-8?B?d1FieE5wUHN1eE9MWWFXdlFhdXI4RnZYd2N6Um04RVpRcXNTSDc1cXM5V1dy?=
 =?utf-8?B?a3lGZjI0eFovK21YZGh5NHVRa3l0K1pxK1NycTZ0eVZ3WnBIQjUzOWhzYm9I?=
 =?utf-8?B?VVlyb1BPWC9ZVVp2OTNweFNxd1o2Titobk95aVZGbm9UcUdINkZpajlyZFJu?=
 =?utf-8?B?ZFpMSlREbEprQjNsdkJlU1hVSC80clRlc0QzL2pvTHVBekFEQWxiMGpzQWZa?=
 =?utf-8?B?anYzRkRlTHpKajZxaEpPemZGV004cUNQTmVybTB2eTBPeFVzVlN2NHVqL2pV?=
 =?utf-8?B?aXhocVBtUzExMUhNQ1A0SzVFd3ozZnZKSGVFZVd5SEVabHVxSnR3WlNEYXBa?=
 =?utf-8?B?cEZRSDZXbjF3aEdKRUozM2JTZVhicHlOYmpQUG9WQVpqOXo4WHJzNTd6Z1A3?=
 =?utf-8?B?Ym9PbUZValRFcjNlaTE1czdlZEo4R2lyZVdnelhTRlg3TjBBcG1NMnBoMmNM?=
 =?utf-8?B?U0VpZnF0aVBCSmNvOVFSN285L1hpZWtpZ05QOUxlY3dlczg0dmozMFVVOVdH?=
 =?utf-8?B?R05VaHFIKzJlSkc0N3ZsTGJBTUw2SldaYkJ6eW1oSFdhYzBoTWpVVVJiT3Nk?=
 =?utf-8?B?WXZNTk9GWGFrN2JHcHNUdHlheUViRGdWbWFkTm5FYVlteXNLdnhaOE1jM1Jp?=
 =?utf-8?B?bThnb2FpQkFkUkdYVE9kdlVhOC9ySG12SUNkMmdja3IvMFhmdnllU0FsQWYy?=
 =?utf-8?B?bnFDMHU0Uml3WXNneWV4YVFsRFdHQzNWRWo0SFZta0VNdzBTc29GLy9saE5t?=
 =?utf-8?B?WURqQ1pPSmtBMEZiNEhuTGdUY1Fidi9OeDhGbWZnYWFNSG1RSjRUZ3RaUXB4?=
 =?utf-8?B?WlhBaDRudjMvNXdmSTNYMm1yWHB0Ymxic1Z1YzA2dHBXdyt0amlxRnBiSkw5?=
 =?utf-8?B?VFlJVXJNaGhEanFnNFR3eSttQklQMjQ3OTJmUkZzaGgyM2NVNW5ZZ2xsWlk4?=
 =?utf-8?B?NVBwOEhWakdKdVhMMG93Q09iQ3pwWk1EQXlDaEJXaHN6UXdJY204czl6V2c5?=
 =?utf-8?B?MGJZTHBkQjNjTVBrcURQL0d4VmxUdDlTSFdRZ1J2M3RveG0yL2Z0QUhDVVRH?=
 =?utf-8?B?T005Y2dmdjc1WGFjc1ZDVmVmb3F4OUM1akd5SGJKMXJCc3prbllOQk9ZT1gw?=
 =?utf-8?B?QzNtT2w4L1prNlcyNlYwY2JTd1lYdXZKcWY2NmJGY3JrY085SkFVbmdjY3ZY?=
 =?utf-8?B?WnRodDczdFdoRmdRQWlSUUlybm9TZHBaN1JTRWFvMFkxZjExNFp6a0hPdERU?=
 =?utf-8?B?MlU3UDhzNVQ3bWhmd1BFbTFsaTRwbHRQWFQ0c3hGcms5UG9WdUQrVjJJUFk1?=
 =?utf-8?B?TmE0aVdmVDVDQTFjSnBPSno0bHNHT21xT3c1RjViN1dkSWRIbHpzMmlDWjIx?=
 =?utf-8?B?NHlVanloS051dlo1QS9LZVh0K2gxTDN6UExkZU5MbElvOHA1ZEhPVzY4WS82?=
 =?utf-8?B?akZUV1E2eTZibHpmWkQrMUdxTXJzQVEvK3pLdzFzaE03dHhXNlgvaGdSQlNC?=
 =?utf-8?B?eG54b1BFcGI5MUVLQzBZZjJ5cTlZTVdDMldNQVFzcU00S1dScC9EZHdQVEth?=
 =?utf-8?B?VGI3R3h1QlhmVnRCMjh3THV0YzRqSHZ6OUdUT0RsbXY4K2w2bUNPazdDWERU?=
 =?utf-8?B?VTVQR2ZSR1huRnRpeVlacXJ1Q3VReXBBRE14akVBK0JuQldBY3ZOeEx4Nks0?=
 =?utf-8?B?cG5BeDJ6NS9TUngvNXdWSEJEaWprMTlSTDg2eWhhdUlpNVRJR1gwWndvazJX?=
 =?utf-8?B?Yjh3ZmNTdEhWOGNZazRxb3ZZSXlKcXZ5bGMxWTZXSVpPNTB6dGQ2OHp3V09s?=
 =?utf-8?B?QnVPYUE3SDhNNTllejlwcWt6WDhCaUVtWWN2d1NLVHdwWkk5aGZ4MEhteEtO?=
 =?utf-8?B?RnkyZVNGVDJlcTFDNThoY1V0aHVKZU9xbE9HWUxwY201SURXL045czhkeEU0?=
 =?utf-8?B?Q2N3cSszOHZaamovTFBuMjBralMzM21oRTczMFhYNmZDWnVEZkZiSjZVZDM0?=
 =?utf-8?B?MlArallUWHpCbVJXQjhkdXYvMzVCdG4wU1JZeVFMd2VJcGl3elg5MTVpNkZE?=
 =?utf-8?B?NlFRa1dBU3NtRE5LQVhodHhaRnlxT1hhOWc0YzVrRVdMbHFVa1RNZmZYMytm?=
 =?utf-8?B?L0FQcGJvYi9XNmttdVNHSE1hY0ZDS0Z2WjFjVGo5VHQvdlNNcVM5cVhCV3k4?=
 =?utf-8?B?b2ZOUTNvYktVNVhDc01JNXkwRjcyTEJYaTNzdkdEWEVEZk96U1dWL1dLSnBt?=
 =?utf-8?Q?AMEAgN7z/w4SEaRA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e00b43-46db-46f7-f1b3-08dec6d6a644
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 09:57:14.9604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QAypjfy8fLsMeWjlZUrMlOH4mYoHRKRnoTRHee3qBj3IPQwPM1TxZ747vXaNKJ0nINCwDQG2MHWP8tCMYDysBgxXak0Rqk6BRmSQtcldc/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR03MB989226
X-purgate-ID: tlsNG-bad1c0/1781085438-42772A53-85EFDA38/0/0
X-purgate-type: clean
X-purgate-size: 1160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[suse.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,apertussolutions.com,gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 98F526680E4

On 6/9/26 4:15 PM, Ross Lagerwall wrote:
> When performing multiple migrations in parallel, the domctl lock may
> become extremely contended:
> 
> * Operations like "xl vcpu-list" were observed to take in excess of 20s
>    to execute.
> * The "clean" shadow op may pause the domain, restart with a
>    continuation and then become blocked on the domctl lock, causing VM
>    downtime in excess of 20 seconds.
> 
> These issues can be fixed by not holding the domctl for the frequently
> called operations during migration.
> 
> Thanks
> 
> Ross Lagerwall (2):
>    domctl: Handle XEN_DOMCTL_getpageframeinfo3 without the domctl lock
>    domctl: Handle some of XEN_DOMCTL_shadow_op without the domctl lock
> 
>   xen/arch/x86/domctl.c    |  4 ++++
>   xen/arch/x86/mm/paging.c |  8 ++++++--
>   xen/common/domctl.c      | 13 +++++++++++++
>   3 files changed, 23 insertions(+), 2 deletions(-)
> 

I'd like to request inclusion of this in 4.22 since it fixes a real
customer issue we have observed and would have been posted some time ago
but was delayed to avoid drawing attention to and colliding with
XSA-492.

Thanks,
Ross

