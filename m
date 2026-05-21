Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFXLFK7XDmr2CQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 12:00:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DB55A2D68
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 12:00:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314976.1584882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ0Bq-0004ns-9W; Thu, 21 May 2026 09:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314976.1584882; Thu, 21 May 2026 09:59:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ0Bq-0004la-6r; Thu, 21 May 2026 09:59:42 +0000
Received: by outflank-mailman (input) for mailman id 1314976;
 Thu, 21 May 2026 09:59:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wQ0Bp-0004lU-5i
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 09:59:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ0Bo-002NTO-D7
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 11:59:40 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a0ed77d-5cb7-0a2a0a5109dd-0a2a4507a0a6-40
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 11:59:40 +0200
Received: from [52.101.46.44]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a0ed78a-229c-0a2a45070019-34652e2ca4ba-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 11:59:40 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DM6PR03MB5065.namprd03.prod.outlook.com (2603:10b6:5:1e6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 09:59:36 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 09:59:36 +0000
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
 b=Wv/yM2lobqSxCfkP/YeuFSEHurgv/LOnWwKViSgzfJxIBTDLv+pYGdsB1nRYN3QX8cB2utpGNzAnBQZjv0XZqv/x91hXHb5oTvjtREs6U3RyWKjx67mqouij6WkuPBJ2w3KdVCvMYQOyQxKtHWDb7SPudKZlXn98IopspySTxtlm4P1va70ZjHGU0lB7JXhZdoMjXswhCH3uBBE91qLe8LSZst1ix/bZGgJqJu7ge/NrC/uG9awsMY5eetYDsyomAK0GeNUw91pu3244bSgFEDNLCmCp+nuzuKlB+G9eo9J0dRjb4uZrnMP4DwuApZcpVFNOKY0DVx4lrDqvNgP9Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDEJxPnWZRZ1I1hMe9c7ZBpGFl48edlwTI0Es+xq44E=;
 b=mqll3hVgk+CZO4oUTPcNLMv7mD9tKXFzPaYwHf6GhqlDbtn6dkEef8GcO4AWjfahtctDnPbj+N9OnanF4CJL8CKLp08kfK5UjcIB7C4PHLDXwNyQ0JjRvvnyza62Fh/n0/diK0qMuyom6rzjZfY5Et/ci5By2jfiBzhcD3uAGwRQ2ONOV5KLIrwsw8ZZ6cR2Idvuqhag2csmaWjxSrp4NhgqlKrSZF+9oodY4wR2epylzZ53KvwUrpbISr07hyWtpgK0dpmrXduS5SMGxB6DDWGD/y+EdZUXxrsHg87tNzlrD7QeMkoiM3xpISk3Yx6l5ypFc3YwzFB0e6rZStwOLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDEJxPnWZRZ1I1hMe9c7ZBpGFl48edlwTI0Es+xq44E=;
 b=oZ7v9NSvNq1D4LP+J8XTLOnJ2NYDaRhKF2l+ZnhVzck1omazR2wXnouQ7QZ5wn4FSsjlS4G2TJJtU+8pSoiNfxhsWoqIL7wCXyen0WYGS8MWeUML7+ri/wXXNbxGmE9LFkE0/i7SF6ThxwmiI4sIKx4BYtbluZhEKZ8KcbEZroc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <41ae79a0-70b0-4343-a75c-f43f33a6d5d1@citrix.com>
Date: Thu, 21 May 2026 10:59:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 3/7] x86/emul: Separate out instruction completion
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
 <20260518131404.3716969-4-ross.lagerwall@citrix.com>
 <882ff7e2-077a-4af1-8e0c-4a0e83d8c2b8@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <882ff7e2-077a-4af1-8e0c-4a0e83d8c2b8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0381.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::33) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|DM6PR03MB5065:EE_
X-MS-Office365-Filtering-Correlation-Id: adbaa2d8-29f2-45ab-d65f-08deb71faa6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|4143699003|5023799004|3023799007|56012099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	hHKe3O1WwNVOMrLoRqUivKkhT7C8Rdk8mYbmoCBEy/zhceguZyzZ8qxd0SyrNGV9Oa4K3weJpy//MSRIVly+ZtkmVpYJtjYBqU1xAnKuy0wkQW7IZaTOeaaXoOLoOS7f+tPyPMMMiO/8Jy9vL/l76D1YPeYdgckoVL8dOzcDpMZ1oax8BCXwdH0LuFds1adUiv0KnI5YtWQnRaADjnvLi7AUWVIF04u1ppZ48Hb6SoYBaHo785pZDfJafVcG5dEa428YVnSZ/b4gyS1sCYGUQQiAwXQSjNNA2rADvLzPDA/RdRs50sHIcCZ1pcm5wDUtiz3wfI2sUzJ3kxedsYWbj3Ca1laheuYWLQX3Uw1Oo7ExvvLaIcvGrvcPN6jeZImLiDcqgEOPOumoDD0fJajPwbCaIt/SiWfa1/lqdHnKE5TMaOe+KKfIX3Bc4oVRDyK/zpCb/ssVQNUB5ZJ+1tpsxKmjD3NQNSSeNjovcX5/w8Oty6JO8rNuyDhvI4gY4otVONgXqV0kn0CGvnWacipQOHsBtvehwd3d3Imv2dWe2XOa5akkPpx7R5RZ+m3IVHZjluMo2KVNpQagZCAW4/cIkDBT9++z3c6ViO5oZQPSsOkDPXhyYAvPFKhQsCwok/nZ6IJZ008+qLBU/PQdDyL72BRjczP5kAjYbQCcv0XFOAgQodKR18egYRUXp4sAwnog
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(5023799004)(3023799007)(56012099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUVTdk5HQlBPUldodmN2cEttUCtKaHJsTXJGUTJBUWlidE1LMk9WUUZ6Um50?=
 =?utf-8?B?UEhqTVh1QnU3NGxuT1FpTWp3ajFSYjhsYmFLc3lxLyt3MW9kRHQ4WnRwUS9X?=
 =?utf-8?B?YTNGRXlFLzVWeDFMRUYvSWxoNHJ3K1FXU3VNU1RrN3BGWFFBbGxaWVJOWEEy?=
 =?utf-8?B?VTdobVYwMm9ObHpXa20wNll1TUE1OGMxak1WTEt5cEdOYUZKMGZDbFE4eStY?=
 =?utf-8?B?bXpaVnBEdnRiMjN2K0dHZUVvd3pBRXprSG9FNUZuaThFNFFVaTA3by9BbFht?=
 =?utf-8?B?YjM3UmNHZzlDOVVLblFWZytzc3JoaDJrWkxZR0JJWnh4ZHR4QlpsUVp1aDYx?=
 =?utf-8?B?TEVxR0Y0NTVaaUtKZFk1a2diWFJYeUtGQlpHL2pRMDBFQ0ZsMGVtOTk3RE92?=
 =?utf-8?B?d2JGTFZ4N0lFeWlpUXhKbjJtcDV0OThzd1c0ZURGUnU5TThlVXAreFI1RTF6?=
 =?utf-8?B?MStYTXN6T2tJQ3JLWEpxU01OODYxMmVQTkJWdXp0OTdyUFVxc3JKK3BQak54?=
 =?utf-8?B?TUlYK3hHQk1HbUZMRzNycVprd2dMbEhrNlVtSmdvSkRWZXFYQ3p0OXd2ZG0y?=
 =?utf-8?B?RTVocEJhK29uZ2FGWEhCUlhOakZndVpxUGJXc0lMQmVnOTdMd3ZCS2s4cE1q?=
 =?utf-8?B?QjRDZ2ZzMVJiOVgvaXpnLzFkanpoSGM0OE95Qmlwd2JRUlVLc1NEaFFFNlRW?=
 =?utf-8?B?SGpjQlEyZXRqZVJJbXk2bmsrNW1LMEQ0SmxBRzRaR1VEQWtBYnQydWdwOUQ5?=
 =?utf-8?B?N3FVT0ErQ3h6b2lTR29QczJBaURTTko2T2paUDZKS3hCTHlvcWR1OVdjSXM2?=
 =?utf-8?B?WlpzRUwxTjFRdWw2L3VzVUFGQTJTZmNERnA4QVo3bXN6M3JFSEx0RmxqY1p5?=
 =?utf-8?B?dTBEeVhMNDNlUWJFd21zRURPSlgzeHZGdi9YRCt6c1FIZGRwRFVQc08vYUEx?=
 =?utf-8?B?VHlXSU1WTml4cEYycmZkOWFQK2dFSklmU2FHRVdJS2IvL1U3OXpiK2x4Lzhl?=
 =?utf-8?B?dFZvQVAxY2FnOWRUaEJRekN4Q3BYbjdhRUgxTmZOSFVmMSthTUNGc3hVaXdi?=
 =?utf-8?B?SzhUb0xSMDVOQjV1T1FkUG5JV3N5UXNzVXFkR001UGpEMnJiMG5BdHVNcUdh?=
 =?utf-8?B?dVpDZm5UTTRWb1lUdFBhdTArRHZvMG92TmdBV2svYnlZQit0Uk9JOTBvSXk3?=
 =?utf-8?B?UnR5dzljMjhXUnF3L1ZWUHlaVW04TDlyeGRSQ1JqYjgvYTYzU1dYUFNBRHRH?=
 =?utf-8?B?MkJrV1ozc2VCRW1rOFBqbG9KSUxTTlQxOWVSMW84RTlLREFScUg3a0hyVlNr?=
 =?utf-8?B?NTJoV3ZiM0JkajhrQ2ovRUhCelhIOU1RMW8zWStpZjFuTXZJd01jTjJHMjd2?=
 =?utf-8?B?TC9BQjhqU3RKcVAydE55ME9LZWE1d1hXZG1UT2FKcnRkTkowMnR6eEQyTVNQ?=
 =?utf-8?B?dzl5SlJqK1JzWmRGV3RWdWJyM1pxS0dDTVYrYUpjNEo4Z0t0T3FtU2tybWNa?=
 =?utf-8?B?NXp6aGQ5bUNZRVExbjBHYkZTcGszS0VjOHJTcXN4eEhuMC9rQjdIeHZHaUg0?=
 =?utf-8?B?VDJuS3ZyWjkxdVljdEo3TURJWjZtV3hXZk50Ry92YXpQc1dhQUJsQUJrYmZt?=
 =?utf-8?B?cDRvUmdRS3ErdGNBZDY2NWdIN0t1M2dmaGhuNHBNaXRnRHJkZUpESGQwQ1Fy?=
 =?utf-8?B?TzJQMFZRR2JRS3hoTTgzNHVYWm5aV3Z4Mm9NaEpYdThOaS9wU1BUbUN1VHhx?=
 =?utf-8?B?eUZJK3c3Q3BUL3lWemFyTytYSTl6S1ZiKzRaRFBYQU5iYWxnNHQ3Qkl5NVFL?=
 =?utf-8?B?RHl1c2NLT0ZrSlB2VUNpdk44aTZFb29sSU9GbDY5UE83YTdGK3JpVzI2YmJu?=
 =?utf-8?B?YjZJeCt6UE01c3Mxc2lFYitHK3BBSXdlTnV3alFJOSt0T3pkT1NHaFpnZVZD?=
 =?utf-8?B?UzF4NlF1b002a2tPSjY4b21VTmtXdHQ2ekt4QitSY3d0QytrdU5PY0QraGhX?=
 =?utf-8?B?Y0o4ZE4vV0FVS2l4bkJlSWEyQlBjdjZoS2YvUTJBU2M2cG1oc3BjSkN2Y0xx?=
 =?utf-8?B?TjEvaHRGQ1Q1V0RFNnAwNDlkSndBVExyNzY5K3hUdXpaVFo1Ui9zSG8vNG1C?=
 =?utf-8?B?dmNvbi9UcGllNksweGh0M2JYTTlFWFJLdFFwRTBoKzVtYnFGNWZhcVROQ1hB?=
 =?utf-8?B?UzU1KzBzZUQxNWZ6UlJRWGc0bHVVSU5aSnB2T1NBWlZSa2RFY1RRZGpiekkz?=
 =?utf-8?B?dlh5NnVrUzRJNXc1VHNKckc4ZFpxNGFFT1dHZzhEUGdLUVBWb3gxVlY5UkNh?=
 =?utf-8?B?aFNxUUIyOUdlY3Z0UkgxelpwTjcxc1MyeUpNb3BaYWViUS9qaUp3aHRRU1RV?=
 =?utf-8?Q?L5honWLh8579GrUw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adbaa2d8-29f2-45ab-d65f-08deb71faa6c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 09:59:36.5937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iRKyK/VEUdf89IQjap0UdMTPOdrlnWCiP8IvOkqHANBl1CdV7diG2IlE51OB65Cp+PiUE+YH46ZS+zqqIJU3GXwHouPDKIa9ysFyIR3+v/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5065
X-purgate-ID: tlsNG-ef75cf/1779357580-23B78C48-6C5679EA/0/0
X-purgate-type: clean
X-purgate-size: 2346
X-Spamd-Result: default: False [-0.18 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B8DB55A2D68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 11:08 AM, Jan Beulich wrote:
> On 18.05.2026 15:14, Ross Lagerwall wrote:
>> To support merging the emulated instruction and VMEXIT paths, split out
>> instruction completion from the core x86 emulation so it can be called
>> separately.
> 
> You don't mean to use a full-fledged struct x86_emulate_ctxt on the VMEXIT
> paths, do you?

For VMEXITs it uses a struct hvm_emulate_ctxt which contains struct
x86_emulate_ctxt but without going through the full emulator. See patch 4 for
details (probably makes sense to discuss this in the context of that patch).

> 
>> @@ -1265,8 +1281,6 @@ x86_emulate(
>>       uint8_t b, d, *opc = NULL;
>>       unsigned int first_byte = 0, elem_bytes, insn_bytes = 0;
>>       uint64_t op_mask = ~0ULL;
>> -    bool singlestep = (_regs.eflags & X86_EFLAGS_TF) &&
>> -	    !is_branch_step(ctxt, ops);
> 
> Nit: Yes, indentation was screwed here. Please ...
> 
>> @@ -1280,6 +1294,9 @@ x86_emulate(
>>   
>>       init_context(ctxt);
>>   
>> +    ctxt->singlestep = (_regs.eflags & X86_EFLAGS_TF) &&
>> +	    !is_branch_step(ctxt, ops);
> 
> ... correct such when moving code around.

OK.

> 
>> @@ -8347,17 +8364,6 @@ x86_emulate(
>>       put_fpu(fpu_type, false, state, ctxt, ops);
>>       fpu_type = X86EMUL_FPU_none;
>>   
>> -    /* Zero the upper 32 bits of %rip if not in 64-bit mode. */
>> -    if ( !mode_64bit() )
>> -        _regs.r(ip) = (uint32_t)_regs.r(ip);
> 
> While, because you have the new helper update ctxt->regs, the removal of
> this update of _regs looks technically okay, ...
> 
>> -    /* Should a singlestep #DB be raised? */
>> -    if ( rc == X86EMUL_OKAY && singlestep && !ctxt->retire.mov_ss )
>> -    {
>> -        ctxt->retire.singlestep = true;
>> -        ctxt->retire.sti = false;
>> -    }
>> -
>>       if ( rc != X86EMUL_DONE )
>>           *ctxt->regs = _regs;
> 
> ... further uses of _regs here (not this one, but in general) would be at
> risk of no longer working as expected (yet only in a corner case, so
> possibly not covered by testing).

Any uses of _regs after assignment back to the context is surely broken anyway
because nothing outside of this function would see the result? Not that I would
expect that to happen anyway since this is essentially the end of the function.

Ross

