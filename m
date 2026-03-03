Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLjVOtnlpmnjZAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 14:44:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEDA1F094F
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 14:44:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244776.1544145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxQ3B-0003WU-28; Tue, 03 Mar 2026 13:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244776.1544145; Tue, 03 Mar 2026 13:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxQ3A-0003U3-Uu; Tue, 03 Mar 2026 13:44:36 +0000
Received: by outflank-mailman (input) for mailman id 1244776;
 Tue, 03 Mar 2026 13:44:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KsTL=BD=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vxQ39-0003Tx-Li
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 13:44:35 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c25cf8d-1707-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Mar 2026 14:44:33 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB6516.namprd03.prod.outlook.com (2603:10b6:806:1c7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 13:44:28 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 13:44:21 +0000
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
X-Inumbo-ID: 1c25cf8d-1707-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcjxqzTDm44/i4dbYLm7dbT/1r95675K+oFP+jDFfc3tGV/BcwQorX5TsJgVV7eP243vX93Ebe6bJjRUrZlxNVlfZa8hvlvIwAl4uBtEVYpmv4h2ItKxYto9ytWqxACn34AY0AUPRlLpFQE4Cb8YK0Qx6x1nqpN2GTmSzwDfX5R+KHfGib0QyedjxhkuAA0Ff+auGB46S6QKHtO6W/+B0vZ+hROAvJ5Ev5fm7E7IKQ4CZhDkf2shpaB3cavYHKu2157p/cK3Ro0HJtkUJNXkFymUd872TjbyZwZa1wadqTv1UPwnVqedZLG0gHms0rO+Qn1VkzKplhbn+pKtfKUqYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktuf5dn7Bil6+PtW9UXZZgqOUX3cL1WSNTzz7iLmfZQ=;
 b=esqSLEoezPD0r0ZOHVATPpDGLADQyHM2lDyaNWdZx/z8knO0mrSMB5gOsMEg4I52pDi8frok5aDycsLNmBDdGtS8xbpyFWCL03w/OrKJMA61Dw4Pkw0+IoPFemLo4rTRuXBRt1z/ZWvmd6bHqbjfSzjR6ZsWhjqUB+oUd0hP6igF6+XtAY5zL3UAtJk64HS/wt4RL+EKJTe+3W6w3Uc9dbQrgKUmSHxdfzqE/soHj2V1gn6VEBOf5ILYdjfsGoiNNQ6HP6m4NgbI9DlxZ/McXKG5DPX8byMZklkD39uHNeiz+jLo5ANdXYLfG1eFERUbIBYhRSPgm7OIFztJX7UxLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktuf5dn7Bil6+PtW9UXZZgqOUX3cL1WSNTzz7iLmfZQ=;
 b=dd+zVXxJBuDe1/O1FBx7gJDxz0jBBTZYxC5rCNCTx9AP6l3hjtGOF58k6WDrferqP7UW52GfBNWOpXVOm5z2363o6t5c1TZ+OmKdFjioFuphy3NPt1j01beuuIxuQ9kxDbRl18YgOH8NMHfxli97H9QuTFUxwMOjW9Erasce+8Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5593f7e9-8efa-476b-b1f8-3e77c58d8d36@citrix.com>
Date: Tue, 3 Mar 2026 13:44:18 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 08/14] x86/traps: Enable FRED when requested
To: Jan Beulich <jbeulich@suse.com>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
 <20260227231636.3955109-9-andrew.cooper3@citrix.com>
 <0dbf14bc-1505-4a33-bbf8-53c1ea41c7da@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <0dbf14bc-1505-4a33-bbf8-53c1ea41c7da@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: 482b423f-8166-4ca1-8518-08de792af97a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	7whSGGpqiDN0uQBYB9epxyPA1Q/O8TwmqU2fFKiPthOjSV5SsrCs+DJMsM0kikMJMPxqjvu5RUHApcRzyMo5RZTOSlgqRR7a6BTRbVVz+ilgX2d9WXqyL9L13Z5kTuUMk6iKnYnjU1gPKhsJZVm6a/XGpO2zQQEDDzprj9kDjOzTc2eABQCyH9Qpx0WzF0gD5lyxFqfucYUPlNfhI17MrctqSm43enmQMj7N8G9Rn+aOUxKRATfNu55EWC+djcqGg8WVanx0QfnZy/8SBTq8yaLzq+XxWH1K4KLtpeYJD6bq/kPwTtCAigPeU9wD10v6IHFOQgQRj+pUwXFrCz6cyVY7QobYsJOOX48up5Sh8RYt0/CqMhvwfcrBNO2lpU/7uhv+YD0QO6BZO5o1KwDWLL03monJ4B519TAmnh1Pds5zDSU94gc+eq5NDwlafjWsrLxhSUFZrXRVn/vJEJ15PI7TweTe9P30QAvY3RPODyv3XKf4wZD2J9SIDrH8WraMLu9zBj52MKc0JokxdBBfnoBtv/RmaYWWY4nq77a+zsxVCfeBpAMvUnTM+qcY90EZ5kNg6F6pHoXemSKLAU6GxbPG92tFqaDbeh3//OYPRhtUFU7W8Qr+bUhpizrt/xfrRvhkgaUcEUG2kx2dwUC9tzoyhbD0XekHc37bx/erggUc4UoDG/BQ/GYbUm8LGmhEIwB1ndczXT+b9o7WsxJCLt3TAQvzoYc22DoOe4ih46A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWpYWTM3ZVVzUmlHVFVGeDJ4NVRybFhhNE1KbzUzckVMS3YyR21pM3ZQbDdu?=
 =?utf-8?B?NndyL21iTTEyZ3Qrdk5MZnJWSUIvZ1dHWFB2aERqakVNMGFPdzQ1bjVubmwr?=
 =?utf-8?B?dTVrVFptUDVHNEFwL25PVUtTTkZ0cmRiejlpemx1eEY0NVJNRC94bDFaOXZr?=
 =?utf-8?B?cDA3N05ROTZGcmxqRmlaUjBUeGd2QmV2RFQwalM4bXpOaTNHT01xWkRabnk2?=
 =?utf-8?B?OE5TbnNCMUh5bVQ3a3VsZFJ6NHRybDFwRGlzQmN5WlI4SHpnM1BmYjJuMUJh?=
 =?utf-8?B?M05qbXpuMnlESjArUjd3d2NOMWxiWkJRbFE0YUpTWFVkVElaMWdPVE4yYTlT?=
 =?utf-8?B?bFhJMHphT0FZZzkvTHQzRWZrUWswUkFJN0NQY2hFSXR3VnRSZUlISEVlVEpl?=
 =?utf-8?B?QWJia0RiUU1kR2FKbTdGWitIOVhFejRBcHVJRkI1QkZ6NFFzVGxVQ0VEWFZS?=
 =?utf-8?B?YTdrTDRlKy9zWm5pVFNzcHlDb2wxVmhXRVYwT1VLbjRTL241bVkzclJmK3Mr?=
 =?utf-8?B?eTVtQ3l2Rno3K1QrMFU0V0FIZlZTWEJSUy9FT2NTVFJXZGh5TmNoN2x2cG5u?=
 =?utf-8?B?aDNMTjE1T093RGJTOFVhaS94cDJjcWdpa3pvRllueUtoMlQzWks0UlJkc1RM?=
 =?utf-8?B?bXdPVkZGY1lWQk45UnhrdlF1MGg4cTF5d29PcmFRUUdXMThMUXpCODBNZUNr?=
 =?utf-8?B?U2lyUTUzRURpZjU5NFFsSGlhb1Nmb3hSTW4rT2doc0tFWFFxQWw2b0lJUUFO?=
 =?utf-8?B?RkNmTXVQRURTM0EvMVRxZEY2ZXVZTHpHSFlBdWlsWmkrUTNNaVdKODVlVEtu?=
 =?utf-8?B?TGZqZWVCWFpWMkt5MVJReG9kNTY2eURISEtHVE5vV09LaDdwcWRLdUtXTnc5?=
 =?utf-8?B?N2ZUNGhUVWt3QU8rZzg3bXBhQnFDUEpjTEVEQnNqVVBmU29IK1UyMHQyMXNU?=
 =?utf-8?B?UnhUbkk3K2V6RytqcHZQam9vZWYrdHU0cDhKWjRnRllFbkZHZTByTFRQa21m?=
 =?utf-8?B?dHA1MzhWVXY2UkpkeDBuOE92Zmx6cHllM2R6UEZZZHpKWi9lcWFHYkY0eDB0?=
 =?utf-8?B?eWRVWGRyaTVmc1dieU9wTTdsQVRmWCt0NGg5T2pFbTRXaGFCaTBhQlJJSzFt?=
 =?utf-8?B?dmR0ZW9jTTBsTEpldnhLY1hGZlQrQnVXVzRoQk9QZXA1Z0NyWWtyckxEb1Jo?=
 =?utf-8?B?TmhNOG14TDNDNEdWdVBicHhaRXNjMERXWDFyMDAxTjZxcVZzOGZMZGhkOXpo?=
 =?utf-8?B?Q0FMWmd2eUxyZElHUTBNeExMakp6YnNJbGtHbzkxem9xM090cE5tQ0RCbkRF?=
 =?utf-8?B?bmlnbkhBUDVERTNQVkRzWFhrS3VwVlYxRldNZjJiMmdRa25ISFdjengzWm9R?=
 =?utf-8?B?eW8yVklmUEJiUmZ0R05Fb0FXZC9LSjVUbzhyc1BRSXFsR2N3TnVQU1N4UGE3?=
 =?utf-8?B?emR6RGhOekR5T3hLTUs0Nm5LWHltd25STE51Q0ZxYkVkaytqVkpEdHFJUm13?=
 =?utf-8?B?V2h2dUtJMUFZOTc5QWFLdElKUkNpWGZwK0xpZnVpcEpCV1FIZFFCZEo2S2ZQ?=
 =?utf-8?B?WHgxcVdpMko4eXA4eDJxY0pOUjlNZG4rc21PTUxnUXZHUSt4MXhUQzdTb2Zn?=
 =?utf-8?B?UkgrZ0FhU2RqTDk4L2w2cC9HeVVQdUhOcEZxek93VnNPKzh5SlhFb0REKy9z?=
 =?utf-8?B?Z0ZkRGNZM29la1IxSWE0cTgrNVR3VDg0clM0bHM1amg2ZG1Yd0JvMEtXWGJD?=
 =?utf-8?B?bm1WQ1RWVGNIUWRQWGI4c3M3K3kwemw3cUNGZm15OVIwZVlyMDBLTEZtUytx?=
 =?utf-8?B?Ui81WGpBUFJ0bGF2Y0dSQ3lCcjBBb0lyRGJycFQzMlJyNTdnOWMrMnBER2pk?=
 =?utf-8?B?VVE1bWs1ck93UFRvVlhLR0NZWHJ3SkpTeE0yL1EwYnRtSFlwa1dDZXFnbGJh?=
 =?utf-8?B?TSt6VFByL2gvZGZjdkFIZ2w2ZnFOT284NXg1ODEzSnhzZFBmSi8yVU0wMnF0?=
 =?utf-8?B?VjRsZnpncGp6T2VnWXN2VVJTTGFnL05IVDVQVjlsM0JLazVUR0ZEcjlXUDND?=
 =?utf-8?B?MkZzQ2w1NkZWT2d6eVB1ekptUktPOGkxUTJaaGhxbFQyWDRIQW4xbTJlZWdY?=
 =?utf-8?B?SVVVTGI3VGtLdUR1YzJYUk5pY0E5YUluUkg2V2JOY1FHRS9sWmpnekZjd2RD?=
 =?utf-8?B?ZTRmOWhGM1VPNUtVWFJOaHcxQlJGOTFLNldWYTI4VzZGNXE1OEw3QlcrYktx?=
 =?utf-8?B?MExpbUxkcFQvOUsrOFpXM0xjTW1KOC9UMkVCeHJBL1ErN3JIMDJlTEVCR1Ar?=
 =?utf-8?B?YURlSWlqeWFjTjRyelNWMkFHdHV4ZEZuS2k3ejlscmFSYTVhb3V6Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 482b423f-8166-4ca1-8518-08de792af97a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 13:44:21.5265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rclp8P92I1lVEqU/WK983NQRMs/XSCsg2gXz7NA1EjuDKefxNGuzBJAV/QvlAVc70d0pMprxDvfdWj85fIXkMB8YwcQuv0ElCQEkurvby58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6516
X-Rspamd-Queue-Id: 5CEDA1F094F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 02/03/2026 4:12 pm, Jan Beulich wrote:
> On 28.02.2026 00:16, Andrew Cooper wrote:
>> With the shadow stack and exception handling adjustements in place, we can now
>> activate FRED when appropriate.  Note that opt_fred is still disabled by
>> default until more infrastructure is in place.
>>
>> Introduce init_fred() to set up all the MSRs relevant for FRED.  FRED uses
>> MSR_STAR (entries from Ring3 only), and MSR_FRED_SSP_SL0 aliases MSR_PL0_SSP
>> when CET-SS is active.  Otherwise, they're all new MSRs.
>>
>> Also introduce init_fred_tss().  At this juncture we need a TSS set up, even
>> if it is mostly unused.  Reinsert the BUILD_BUG_ON() checking the size of the
>> TSS against 0x67, this time with a more precise comment.
>>
>> With init_fred() existing, load_system_tables() and legacy_syscall_init()
>> should only be used when setting up IDT delivery.  Insert ASSERT()s to this
>> effect, and adjust the various init functions to make this property true.
>>
>> The FRED initialisation path still needs to write to all system table
>> registers at least once, even if only to invalidate them.  Per the
>> documentation, percpu_early_traps_init() is responsible for switching off the
>> boot GDT, which also needs doing even in FRED mode.
>>
>> Finally, set CR4.FRED in traps_init()/percpu_early_traps_init().
>>
>> Xen can now boot in FRED mode and run a PVH dom0.  PV guests still need more
>> work before they can be run under FRED.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> [*] PVH Dom0 on an Intel PantherLake CPU.
> What other part is this remark connected to?

Ah - the commit message.  Specifically, that I've only tested VT-x, not
SVM PVH dom0.

~Andrew

