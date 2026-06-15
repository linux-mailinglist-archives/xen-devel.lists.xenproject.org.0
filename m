Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pz8uFt6/L2r7FgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 11:03:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C55684D8E
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 11:03:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=XP2Je1tc;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338061.1599073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ3Cx-00031Q-GI; Mon, 15 Jun 2026 09:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338061.1599073; Mon, 15 Jun 2026 09:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ3Cx-0002yh-DS; Mon, 15 Jun 2026 09:02:15 +0000
Received: by outflank-mailman (input) for mailman id 1338061;
 Mon, 15 Jun 2026 09:02:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wZ3Cw-0002yZ-2L
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 09:02:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ3Cv-001DB3-9a
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 11:02:13 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2fbf94-5cb7-0a2a0a5109dd-0a2a4506bc5e-2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 11:02:13 +0200
Received: from [40.93.194.10]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2fbf93-7371-0a2a45060019-285dc20a9a62-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 11:02:12 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB5187.namprd03.prod.outlook.com (2603:10b6:a03:226::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 09:02:09 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 09:02:09 +0000
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
 b=ET9owZ/XEeVLpxFwya1uDa1qeyaGPjwCKlnwH/U1Yzm8O7XFbhyLfaFb2MwP6TS57arReBpa/5CCOfcnZNWeu/xLrlQ0RA4Son8TSVnpYRFuXZaF3u+4qmiL11redpTqTZwl57BBqRhoFREOSQI7z9iooomZ0Ve63Qk4ii5y+/MCZCElyFGnxKPAkJj+JDrmlxgjxLIS5CGf9+sFW71ua5VwCceBooM7+IGDRgV4mPIfnYoWsDwd4vkCSWCjkfhE/b9OAf+XWqCAQCWH0pUFUYOI63n7fk0Wp8sjxMB7aLXx8HsQvGs8wjSp/umKU/H+cG7Xc6L3Wrot9+Ce7asN6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XIJSJ3hLuT169BQ2K0kEK5w6YTOxqer/mhBVLQ3N6Y=;
 b=TCxfZOJoWgZXV+Tm7uQxPefqVa02DYd9/ln6PLSs6zxl7hH/quXcsJ31JUN2yQjPVtmPmdNM8fkNvuRrCRb2eFqsySPb2kfjNZE6UXjQi1Im409+lLgnYwGQcxkj1muxqhOTqksN7u0aFEfFE2Ax8P/b/8B9fxokNy81kwJiUv8lbxV/PulNtejIp6LrZL+xs5DeJNZNNl8UswVRXlFqoZG1iqtW1jZcA+AHgb7xxOh2GOTj3G45nwbUSLX7k0scgtGoVljdp89Sf2DXix+URPLuuiY8U4lUwFhh597lvIdV8oSbr3AAV4Ce28aR4U6Tsp6l3llpOTlCSLy6bNE5Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XIJSJ3hLuT169BQ2K0kEK5w6YTOxqer/mhBVLQ3N6Y=;
 b=XP2Je1tcLqOgic4TiNASyKNKOGadiKAAcxZCacbV3dRuXmFwB48PMVMWOmy6e7RVtu1i9DdKGB4oYTlGFn+Ok61Ad1ZMRO+BuTr3pPLiogA7whPKL/OhoZ9WEmHBHHgDA8i7uWizwJcZr3gFPXWjRkO5UEQGuWpbNDBVf8qTHtc=
Date: Mon, 15 Jun 2026 11:02:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: Assertion '!is_idle_vcpu(v)' failed after 'Remove
 fully_eager_fpu' commit on EFI
Message-ID: <ai-_jUw0QmdC7gPK@macbook.local>
References: <1781272430.8631fc262581453bbf619ec5b2062170.19ebc1c488b000701b@vates.tech>
 <aiwTkDUP6rDPbV6R@mail-itl>
 <0db98119-48f3-4edd-a422-8e50ee713b7c@citrix.com>
 <e84d6765-61fa-4203-a1ee-ac07f54a1026@suse.com>
 <48878ff6-ad36-448f-aa9d-6b37e2e179b1@citrix.com>
 <1781277924.8631fc262581453bbf619ec5b2062170.19ebc701bfb000701b@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1781277924.8631fc262581453bbf619ec5b2062170.19ebc701bfb000701b@vates.tech>
X-ClientProxiedBy: MR1P264CA0089.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::22) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB5187:EE_
X-MS-Office365-Filtering-Correlation-Id: 2430c4eb-8777-4736-d16f-08decabcc820
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|4143699003|11063799006|5023799004|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	R3m5PsFwXPZS5cZtE/f2EyPwtc5PlO0VFhKSViaxpXdYMeeXTtUfVcVh27ZHZ6EsZffn+/KSWPFqEmfXkVtP4EErC6r1QagftAyt6O2jZQaDxFoqd4xzNB4gwVnqA105YWqBoioDp7aphy8VWgmCWcr8qvanVNBYtgdOBoXNUIXsil8Ey+i7F0R8F5eMm8QCGK7vBen8LNbHD2cQ75hbDHdt9R/qTi7m7EaSQfBLvsiX1k4zUu1zRgKBxsK7J0oe+fNJm00MZ61ufIbplVO9x23BPrVHlRCOQI+rW+i+oLRWhJHRO0LpO96HA55Ndb+Md/uGg2FNYgDsLYfRBj+jzoPB+LjDZMZpAeiUaraYQtMkGb+6/4VVRDQ37OM5Tmn7I4mak39q25D7u07O/p9em6kgSe0EHEiutaw/B2pFz9FKJA/m1wAYHid87krbOQwm3IhUjaJqdDzUbjKVYgCrZsS7zvIuz2ojd+JFw5IoyuEyQvb/kd9btuOws9V/V4gV9U2/J2irZpdczyWpTen/DY8Nt928G71TRfQwGXgS/xj1MzwalwH8gHfd5dJJcYv/96tDrfxS4d5ICnY0kwwRStlxkc2ka8Zft8VuAbxVp19HEFPOhlX5PoVPXMA2UXFVS0zdWkgzZt46PgDA9k5Ridup9ojVGK/kbDx8XFBQQxf1AxZ/0ZTKVpLU6t3MCfeD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(4143699003)(11063799006)(5023799004)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzdSR0FKWXNvNzFCRHh5d3h2MEdIclpDbWJQT29jZWRnOW1QczVzNDFWRkNU?=
 =?utf-8?B?d0NtU25tNTlxaitqS1V3SEk3Y3ZteVdYaTJTS2VDMzRiMnVuZ0h6ME9ubW5K?=
 =?utf-8?B?VWU5ZVQ4RDcxN3N2QzBQMm80V1g0NThEaDU2ZmFqMHUrNUM1aFpqRHZBL1FS?=
 =?utf-8?B?STQxOHBUK1lzV0ZNTWJSTmljM3lJSStaTXFjYkVPOEJkblhrbjR0YjkwYW1N?=
 =?utf-8?B?cG5OdHdzbWhOajdQZnk4UG5JN09Qdmc5aHMvblRDSDFhTmdzcFJxWmc1RTdV?=
 =?utf-8?B?dkNpRmZ5Q2lMOC9LZ3dINXg0UCsxYnZocVBNd29sdmVoMUFUT2JzaWVTQ0hF?=
 =?utf-8?B?Sm9iSGJXbU9QeWpiSlFhbFpCUzZ5Z3RzMFYrMVpWRmk3RUh6Y2MrYUY1WG43?=
 =?utf-8?B?V3RYYVNOZUVJcFBSM203c1FIUmxYcklaUkRRQ2QzQ3laNEVQOFRDSG1URE9B?=
 =?utf-8?B?alBlc0xEZnlQaGVCWUV2WUF1SDhrdmRoS3AxczQ2QXdwY3FtWE8xU0hUQ3ZU?=
 =?utf-8?B?WkIwQTdObGpTTGc4bzdyYVpNeXllRDVxR1dIM0dmMjA1WUZQNGI3ZzFPcE82?=
 =?utf-8?B?M1p0QVhkR2t0SVVFa2YrMmY5SFhQWm1qRlZhWE9DeGwwTWdUeVVxT0dNdmV5?=
 =?utf-8?B?a0RqN2NWdEpQVUEvZStQZk9LTTQ1RVlGVlJISXZJbEJVcUlXRGZiaEhhbDdN?=
 =?utf-8?B?NEJNdDZNQWsrRkRsaGo5d0NYUU5pdjdMM29ZRCszalkwNDlsVjhzQTh4TVU0?=
 =?utf-8?B?d0JiYTdyZ0VyUmt5VEZHZnlHc0loS1RzQ0o1NHdMSXdJSnlyT3RVN1QwMndO?=
 =?utf-8?B?UXZBUjBKNUptM1h5akFSTEk0OHp5K29SV2E2Z1JISmR1eDZZZGNxcnphQmdD?=
 =?utf-8?B?Ynp6bGRJRnlvQ000SDBmVlh0K2pua0dVVFBQY2IvMnY5WUZGaUVLcTRDalBW?=
 =?utf-8?B?VURYczAzVFZpSSsxZkhNVFpxYkFHLy80UE9lUHdDVjVLck9iU3lOcm1IalI5?=
 =?utf-8?B?c25aN3A4b2dXUmhoLzhtNC92dzQ3TW1RZnJtYjJwM1RWemp4VGFyaHVmbnY4?=
 =?utf-8?B?TWg0WEFMeGZtd3pZeE55OUljZXFvL0NaR0NCSTdvRURBb010L0NYYzd2eUFF?=
 =?utf-8?B?S0JMQTRkWUlMMWNzMmJLYUFPakY5S2dwOFJ2OWNzOG4xdjJpT2dkZ0RlQzN6?=
 =?utf-8?B?d2F2MUJrL0FxYXdsSUFkMUZqNG5CY3I4SnVWc0tsTk9LUDlJZDVMZE5RRSt5?=
 =?utf-8?B?VjVnVFRXSGZoeUd1WUp4YStuU1ZDYUdFV3pWQlJiRWxJOHJyNUFlS1NGTUx5?=
 =?utf-8?B?MDdvWVh5NmNaZDUvMGtScWs5c0pEc2gzbGw4THNyck9hVVJKTDJJamRIajh5?=
 =?utf-8?B?NGRhV1pKZjRvNW1lOXRnM2hpQWJGRGFLS1N5WHdKL28rUG1rMUhlVStiemF2?=
 =?utf-8?B?YTVKd0E4WUJhVUpwM2pnb3JQZVV5Rjh1cDlnWGtIRlZqMlY4a0ZkR1RkSVZK?=
 =?utf-8?B?M2xtdkpnbWMxWkpvcS96ajBnT3g1OTUvMHRKOHNPMTBFOW1SUERSeU9iUTlj?=
 =?utf-8?B?NTFqaGZMUkdsNW9JTlh6QTVVVmc5MTVJVlpHREMrWHloQ2tmRk9neWdNWmMr?=
 =?utf-8?B?SzBpTzVMUlFyUWlCSmxCQjdjbGpaTkVJb0VST1VIR2pDTUpWUWlRektROFJY?=
 =?utf-8?B?WTdXNnBzc2p0VWtNSzhPY1M5NW16ZDIzYXFmSUlYWDdKZVJJQkpiRGxPOHV6?=
 =?utf-8?B?L0lJTW1vVEpMdzVkUkx0MUR2M0FMOHNuQXNCK2xuU2tSK1MzZ1FYZjBQKzl3?=
 =?utf-8?B?OGozS2pWR2xEQUF2V0xTc3Fza3JTSzlteDhBRy96cEV5ZmZMdVpTT2pPRmJo?=
 =?utf-8?B?WUFPNndYQzB6S1MxS0g4QXVJQlYxMmoxWm5VZldQSW5hdkxxR1lzOHlZaHhR?=
 =?utf-8?B?RHBwQXNWS0xXMUF5RVpMYmxMMmFRMUszM2xkLzAwa3hzTFo4bkpKZXJuODRU?=
 =?utf-8?B?cGJtYUR4NXhUa3lPOHk0TGNRSmtla2thbEJ3cVRwalBBMFoxbGZTZkFvT0Jx?=
 =?utf-8?B?NHdUbUQwVWVFMkk4Qmp6OHdETksyV09qUVdmK1ZuVkUxR2RldTNXczU5N0xM?=
 =?utf-8?B?YmdaQ3ptQTNoZHJTa2ZKMmJ1amw4NjhrQ0JGNnBINnZiaXU4dU8rT0JPWTIw?=
 =?utf-8?B?TkhRMkVkVHllMDhyQU1qSlB2TGp5aE9qVmFtcjZpSkZvZnAwVmUxNThOdTI2?=
 =?utf-8?B?Njg4Mk9yZXAyY1R1UHpLMjRpMTRvS0tjMXhPWmVOQWRKclFKbEREN0dGMnMv?=
 =?utf-8?B?cW1wQW9FelR4L3FGWU1PZEtTYXhtZjhIREhld0JwYkRsS1ZrVTlUQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2430c4eb-8777-4736-d16f-08decabcc820
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 09:02:09.6015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpST1H4uIETxXefj8IMcI7tBZIgfeyN1RbyVkC6E9jtalRxlSFRJ66owrjkgkBWymjUChXyIZLn8L3fthv3r0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5187
X-purgate-ID: tlsNG-16d1c6/1781514133-8757ED75-69C39FD9/0/0
X-purgate-type: clean
X-purgate-size: 1862
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A0C55684D8E

On Fri, Jun 12, 2026 at 05:17:31PM +0200, Anthony PERARD wrote:
> On Fri, Jun 12, 2026 at 03:32:00PM +0100, Andrew Cooper wrote:
> > On 12/06/2026 3:20 pm, Jan Beulich wrote:
> > > On 12.06.2026 16:18, Andrew Cooper wrote:
> > >> Well, no intended change.  It was a very big patch.
> > >>
> > >> Nothing should ever be using efi_get_time().  It's unusable (i.e.
> > >> crashing) on hundreds of millions of machines.
> > >>
> > >> So, while we obviously do need to fix the assertion, this is "only"
> > >> collateral damage from having fallen into the efi_get_time() path in the
> > >> first place.  That wants investigating too.
> > > Perhaps a reduced-hardware system with ACPI_FADT_NO_CMOS_RTC set?
> > 
> > The identified system is a Broadwell-D.
> > 
> > Come to think of it, there were some systems of that era which (falsely)
> > claimed to have no CMOS.  (An HP Haswell Blade comes to mind, but it
> > will be a similar chipset.)
> 
> Some info from the boot log about the machine:
>     HPE ProLiant m510 Server Cartridge
>     BIOS Version: H05 v1.98 (02/02/2023)
>     System Memory: 32 GB
>     1 Processor(s) detected, 8 total cores enabled, Hyperthreading is enabled
>     Proc 1: Intel(R) Xeon(R) CPU D-1548 @ 2.00GHz
>     HPE Power Profile Mode: Custom
>     Power Regulator Mode: Dynamic Power Savings
>     Advanced Memory Protection Mode: Advanced ECC Support
>     Boot Mode: UEFI
>     HPE SmartMemory authenticated in all populated DIMM slots.
> 
> One of the cartridge on a Moonshot.
> 
> > > On such systems efi_get_time() would better work properly.
> 
> I guess it works fine on this system. On a different cartridge, with a
> Xen build prior to the commit, I have in the boot logs:
> 
>     Wallclock source: EFI

Can you provide the decoded dump of the ACPI FADT table?

Thanks, Roger.

