Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G5E3MsbWK2pVGAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 11:52:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB206786F0
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 11:52:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=t5i+CBSA;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1336459.1598227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyYD-0007Hy-3z; Fri, 12 Jun 2026 09:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336459.1598227; Fri, 12 Jun 2026 09:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyYD-0007FQ-0w; Fri, 12 Jun 2026 09:51:45 +0000
Received: by outflank-mailman (input) for mailman id 1336459;
 Fri, 12 Jun 2026 09:51:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wXyYB-0007FK-NO
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 09:51:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXyYA-00FaCY-LE
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 11:51:42 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2bd6a9-2eae-0a2a0a5409dd-0a2a4504e3d6-16
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 11:51:42 +0200
Received: from [52.101.201.5]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2bd6ac-1dec-0a2a45040019-3465c9051378-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 11:51:42 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MW4PR03MB6508.namprd03.prod.outlook.com (2603:10b6:303:127::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 09:51:38 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.014; Fri, 12 Jun 2026
 09:51:38 +0000
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
 b=fGGpQ81JTm1GLBURHmGdOpzubPd2rXA0cvcDsXQjp3DzKka5BWPtTJE37CMUN3bRgFp5QwVsFlcyrds53qF5pdrgo5sZBzAeiGLcmKh2KnJKg7/FPH7/zBqPKiDyh2xlIhaDw3B3Nhvv8jVbfMU2UKiEoOhgNoCuwyOTZfUObrEXw24iKkWTvoxBiRZR4LXJ1ygCsyCI2CG0lHZSbR6rZDQsK0ULSEdF5U31WXRcWq1kWISZO8viBMK7tOW2gTElBCWoO8EXuo6paLEpF8Q54wFAgeOPpOKqknuy1ZsXfrHBrghGAJM05GcmoCSanHohFyRfq4OkCjryf+6MaEAVRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wuo4Jwek3qoNujtbRi4UfO6L6g1gowRsFuzpATDRLGM=;
 b=ip7fpX17ADxwGiFvX15vmEsxmnrWa5TebqX0kM2sPQ+vz6mzR9rnXAVhntTv0EV5a8ntH3IReyl5Dn4TPgvn52alxQJK0f3AHpGmrJ6ndOW9HDOO+Cyrcmez1XXyvXvVFGKfULwQVGMtnZiEGlxI+UjlpEvrqXJemm4uujvc4ZMSukBN5r+IOoXk8V3ESLTITxpVpAJbmefmJpNWxBQvlIVf5Cup4fb/9qVrzdga5KhcQNqx459wkHSyBIIrTKP/7UZNd7oc533Lnrf3ZV6l7Ls3d8iOqwu/0TlUwpJ1eqMpC7zLef5LAItjhtXqaQ8b+TRA0NyIwQyZNjf9Mhrdug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wuo4Jwek3qoNujtbRi4UfO6L6g1gowRsFuzpATDRLGM=;
 b=t5i+CBSA3uVb+jA+sHDHOdsfIQSWGC+FsxdevXJCJgGTvO2RUq8XRhr+XWV6VmNoRJ1iWsDkLZa0q/+W2rguw/8XCI1+AUDebBb3zjEPWIKjse8/lmXzKJHktW9Lsiu12/FpkqAPYQ17hvbnrYfA5xqAScbxaHF2WvZJin8NMqI=
Date: Fri, 12 Jun 2026 11:51:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleskii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22 v3] xen/x86: Change stub page allocation/free
Message-ID: <aivWpmFsbr9QwXca@macbook.local>
References: <20260612082213.82235-1-roger.pau@citrix.com>
 <cda71bb2-9318-4a63-ac0b-95b88e6c5660@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cda71bb2-9318-4a63-ac0b-95b88e6c5660@citrix.com>
X-ClientProxiedBy: MR1P264CA0150.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MW4PR03MB6508:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f59cd91-b6e9-4eaa-6a6d-08dec8683233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|4143699003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	vcEjdtQ+YmZ/mPYJJY6SJfnGu7gI2pwaG8yGg3y8eWh76hMDnjUMpbqjP6B0ViBpDdFEwF0X8MtceiB0PvCFUX+EPWrnpf1x1hOYgc2qciN7TqgymidGF2GZ3HDnowy08/2K0ENPz/M9CmIw6YRlX/hl9gav2LTSzqyprHOU6Gl4dkU/CxRrSRqd3Lc8KtQQ6L5YBrTx6XP6EBxk/8/e8mOuU1BKI95i0ZB3yiaLCTDe0Y4H3GZZPk3C1w2PKHjv/FWgROqIpa9h9M4KLMA0xs4jL2x9Wn6jkLw+Ij5VAzJ/O+8d57FLahNOWmeJlwwzNtwAyQrv6T9Tm9NagYM4wqVJmEP4VBtHb7Lq3UIrPYvqTL1zRTs24A6yfv30I7V1rtX+8scbKktohcNR6UnMATG7Kpkkuuaw2VT4qYxVsB5zPQ/rjYbh/WZVxDJoZ1Q5wVme4kw7W9huzrNYjfPUy3OWrzaPBKqLemTrAjNjRes8g4CZp49DpBJc4QPR/shiBhJFIJ7zQMB5xnb7BqZEedFX2mDv5vRIytoVMo9h3XF0s+srNrX4/TGvOAb/GRaD+Bfatg220F24oBVf/Mcuku7pLkCFbYQ9y86+QbW6BBzwDtt19kPIynoJm2DiKX4jdLHgRtGZw4Quu4uIGH/9qvzkzfLUbdMOSWIKaS7uYy45nHRggi0BfCzVi4Kv+9eL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTd3bXQ4RWRXTllra0d2TnJpWk5CeWZUVTNSZXhoRWZqR0JtR3ZxZi9FMDd3?=
 =?utf-8?B?T1BDSTdtdGtHOTVJb1VFREVmZlZ0eGUxQ2lDYWNuZkpWVkYwWkRabis4TGlo?=
 =?utf-8?B?QlV1RmxBazdlcXlRWXdRakZDVFd6MnRzQ090NmlUalRLWmNWYkFyeStmUkFY?=
 =?utf-8?B?UjU4VHdMS1BMbHJIZkxDQ2RnbzJFdmVnNGpzU05UYUFOMzNiV0RDS050QUVP?=
 =?utf-8?B?LzR5UmxjZU16YStSaUN1RUNOU0pUblZrd0NyOWlPWlZ4bzF4bTNRK29QYWtY?=
 =?utf-8?B?V1UwR1M5R0hWbDJ6WFM3eHBnZFExVkpWK0swaHhzUDlvQ0hxNzFreTFUeUVI?=
 =?utf-8?B?bXFPSGEyRmFabVE4WkI0RTlkSEdsczdHS3pzeFFHcTlwMXlXTnVSMHhUVDEr?=
 =?utf-8?B?ZXFiM0hWSVQ2c3hrUHp0WDMzU1BScnUzMS9LeVVyUUdvU2NWRjRQOEg2VDJB?=
 =?utf-8?B?ZWZkeTNWV0FCMEtwMU83bytkakhlY0ZQM2Jwbm5ZMzEwOXJyRzhwN000MUNI?=
 =?utf-8?B?MHYxeEUxVVJKN20wV0UrWW1TcUhNUU13SytzWHVBTW8rRkxjNEw4OGlUSXp0?=
 =?utf-8?B?ZWZhZkhwVTdBbnFTVlJFaGtEaDRtSW9MN3VvOHMzUHB2SElXVDRhbXR3UTI3?=
 =?utf-8?B?U0RCVEFOY3VzeWtrZUNrWUZYbk91T1ptVU11WWJGZ2pmOXBHSi8rSTZJaEFx?=
 =?utf-8?B?R29weVZ3NTZ1ZE9LNnUwYmhDb01tMlZ0OW5FaGJLYUt2d3BpdVBPY3c5TW5Q?=
 =?utf-8?B?UDZkZERaUXRqMjJvY08wM1RIcVdyZEJuVEMxbm5CWFVCcyt1dUNpd2k4MWUx?=
 =?utf-8?B?dFYyNk5uSnNDak9Uc0N0bkNQdjBoV0dkM2NYbnpOU2djM0NKazNVTzViS2xh?=
 =?utf-8?B?bnRWUE9xY2hDd21XWWhHYjRZOU1YVjdWRGVsVXFsYnkwM04xZlZvaWllQkI2?=
 =?utf-8?B?U3FzM005TDAwQ0NBZ1A3RUtuWkhPQlhLNEFhSzRmc1lkV0ttTTUxYllnNngy?=
 =?utf-8?B?NXVaYXBSWVBWcmxMV1hJU3dUWVdPR3BZdjI0d3BUWklOQWZlcTFiWVFuNVRr?=
 =?utf-8?B?cTlFV1k4U3J0WUFtNEFrclJnZ1lMUmcvSjBMRit3bEhYejR4aElNY2N4SnI0?=
 =?utf-8?B?Q3Y5ZnE0cnhYdFZXVjVnbzAySzRKK2k4WmhRSWdxT1UwWTZVSmtUL3djTDRG?=
 =?utf-8?B?UStDdHBhYW9OK3ZNYWk0TFMwSGQ2M1lObUp4UHBmaitjR1ZjWFl2UDhuWUNB?=
 =?utf-8?B?Zlp4YndmdVBIT1JjemJDN29GY1ByQSs4SVpsT1o1OExQREhpVWQ1U1ZiS3Ur?=
 =?utf-8?B?NWcwVE81L1pQNFV6djJ6NGNGRzNvMnZ6VnhkT21iNlptb1lYYkMrbDFQZHRr?=
 =?utf-8?B?YUF2ajk0ZWs2Yk9NdGlvRWVpemxKMm5DVFluWTloQ01XWS9jQUIvYjgrNjVY?=
 =?utf-8?B?V2IwUUNRNm1tVHpZNit1MzJ3UmhCRlZEczFaV2VuR3B3SGwyWkNtWFN5KzFm?=
 =?utf-8?B?STJUakYrVjdZcTQwSEsyZ1JUVkRyWjJhVGRWblJSdkhLZ1Y3R21SY3QxSEQx?=
 =?utf-8?B?R3JNaEMzZzRVbnl4S0xFK3NXQzdDK2hQOXpUWjhhbzJwd2o0V091blBoVG9E?=
 =?utf-8?B?cDRtSllzeW80UTJycTBKUTFkYTRCUGVKZUpackx5ZXRTaTg0NFlxeTVXditi?=
 =?utf-8?B?cnFOUUdxemlvWG5nT2ZPamdUVVJpQytyOUtMU3lObTY4aVBYa0VMa0g0R0dJ?=
 =?utf-8?B?cjNrbXdrYVVEdWNMYW95VEZtRXdlbjNiOTRqaGNEM2ZQa3JLdFVjKzBGZUk1?=
 =?utf-8?B?Y2dGUnpUcFV3OXN0VjRDd2dFaVV4WEJnY3dkN283azJDMDNRT3FkUVE5MUdW?=
 =?utf-8?B?SXpINkQ3RzB2UFhjSjVqOUZtS2tGOVhUUGZ1eDNadUtrZ01aMC84TGRxTXpu?=
 =?utf-8?B?V0wrUXQzVlNuZFFGMGIzQ0R5eEk1YWhvcFJwK09JZkRKa1B4Z3RMTGRra2Iw?=
 =?utf-8?B?Q3kyN1RSZGxXdUtrMEFFdDkwKzZFc1FyNDJ3angrdzQ4SnUwY1hsT0JPOTVF?=
 =?utf-8?B?VzBYZlZWZDlQVEo1QXhEN1pnRlh3czJCR0NWN0ZiSXJ1ejB2UVU1ZDI3Tm5Q?=
 =?utf-8?B?cm8zdFRjL2xIbXpwOEM3TlF5dVFYZE44a2w3d1lCOS94UUdlTUFUY09TWjdo?=
 =?utf-8?B?eGc1Qmxqd1ZwbUJSc1RBa2FPdDFFam5JK2M5a1k3UnErRCtwWHFBMjV1S0pY?=
 =?utf-8?B?dmxGN1BpaTgzT3RtL2w4QW9HNWt6eUsvRVZHK2xZRVJhS09KRlJ2Uk9hbExx?=
 =?utf-8?B?YzJUaWJxOTRKQnlTSVJydmQzNkNHWGg0dlRxWmU2VXBNRkxTSGsyUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f59cd91-b6e9-4eaa-6a6d-08dec8683233
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 09:51:37.9418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2xCShWuBPP/fR7rGN0Ko4/h0/pdqK48C1AUHGklB3navp3r9H5N+1nH8A41P6GTo3Gs/nxqfKtnI8YGLzGYxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6508
X-purgate-ID: tlsNG-ebf023/1781257902-2BD6C3FF-348E5825/0/0
X-purgate-type: clean
X-purgate-size: 1859
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
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,amd.com,suse.com,vates.tech];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:from_mime,macbook.local:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:jason.andryuk@amd.com,m:jbeulich@suse.com,m:teddy.astie@vates.tech,m:oleskii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,m:oleskiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1AB206786F0

On Fri, Jun 12, 2026 at 10:35:59AM +0100, Andrew Cooper wrote:
> On 12/06/2026 9:22 am, Roger Pau Monne wrote:
> > diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> > index 4192edf635b6..0253d22c349d 100644
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -2089,9 +2089,7 @@ void asmlinkage __init noreturn __start_xen(void)
> >  
> >      init_idle_domain();
> >  
> > -    this_cpu(stubs.addr) = alloc_stub_page(smp_processor_id(),
> > -                                           &this_cpu(stubs).mfn);
> > -    BUG_ON(!this_cpu(stubs.addr));
> > +    init_stub();
> 
> While I hate to nitpick further, "stubs".  There are 4 per CPU, and I'm
> reasonably sure we're consistently plural elsewhere.

Funny you ask - I had it as "stubs" initially, but then realized the
existing function is named alloc_stub_page(), and hence switched back
to use "stub" as that seemed more inline with the existing usage.

I will adjust on commit.

> Otherwise (and with Jan's grammar note in the commit message too),
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks, yes, that's been adjusted in the commit message.

> One further thought, which would be for a followup patch if we decide to
> do it.
> 
> We do now use UDB for bugframes.  It's also marginally better than INT3
> because if we do ever end up finding ourselves executing it, because
> we'll #UD on the first one, rather than try to brute force our way
> through the #BPs printing a log message per instruction.
> 
> One thing I didn't check and I really need to is whether UDB has the
> same speculation-halting properties that UD2 has.  It's not a guarantee,
> given that the encoding is valid in other modes.

Hm, yes, let's see if I find some time to change it, or whether
someone else beats me to it :).

Roger.

