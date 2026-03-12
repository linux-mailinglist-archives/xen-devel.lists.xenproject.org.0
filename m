Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6M0GKomzsmmYOwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 13:37:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6CC271E50
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 13:37:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252325.1549049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0fHq-0001nO-QA; Thu, 12 Mar 2026 12:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252325.1549049; Thu, 12 Mar 2026 12:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0fHq-0001kP-NT; Thu, 12 Mar 2026 12:37:10 +0000
Received: by outflank-mailman (input) for mailman id 1252325;
 Thu, 12 Mar 2026 12:37:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cgz6=BM=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1w0fHp-0001kJ-69
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 12:37:09 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e721f32-1e10-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 13:37:07 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH0PR03MB6097.namprd03.prod.outlook.com (2603:10b6:610:b8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Thu, 12 Mar
 2026 12:37:02 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 12:37:02 +0000
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
X-Inumbo-ID: 2e721f32-1e10-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YNZrB5qmNharfsAbhqWF12qB9HtAhQa4NANPDxEz2U7RA9vFwWQthqDzFf7pfNYHVzmyKty7Ed041fQ08d/pg6CxUTfXZtgkJtTxrfHj9iYXNuHJU7XIc25Zy+WFGnqAfnzrvT7EpkhPlZ1ct9N53TXMkOuok+TCIaNZxTAsFIFhUkV9Vr6mbcYLZP3gPQXsAF8E70/PDGnpP3r99bleSaDq1FyM7RmnWvnCkiT0k1clp/aLvjOKZ6+86xMaeVmJgjjqp0WWnl+tgGgY1b8YhewXmI0qnrcdNGbOIZceHAxWmx0fY/gmxT9wyxS//2oWguT2+BYHCm7lc7k9EDB0pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32xfGSlmZmAV4r62Vdfwma1sqbZCZMXVXE8QY3dUyJs=;
 b=vKEwGGd8q3J4yypllm5MUuQV4+wG18KwvMdD6k7E0YkMoQwdm0GboNe4x/XphzFBR4xoZcV0qG6/kfKO5UpUCQChRAnmUrfjNjXwFcI9n0frMlklOaYEiQsGNFTCVK7+hDuja8m72D1qKDUBMssU9WfYNCuQBhq+bS+PoJqE47ac5aDd1d4nOI8CBngYleAIuJmCEj/z42nubjp1929UQEYMiCj4vjGMZBX6etODetpgRV7cjzUP0LElyBbw5MfGV5bsozdwpOPKSAorpu3R1QK8U6zAtSll7fnXRvFPSgESKt8CCNzE2GcuY7AbYWUtjPyRjXoFoXIJInH/0IdFzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32xfGSlmZmAV4r62Vdfwma1sqbZCZMXVXE8QY3dUyJs=;
 b=H/IK9jO2zFXuAqfsNsFxasF/jqkjgaUyZirJ2rtSfihHnLbUKF6/DMYlNTyaYiBHRxX0keJrO65/i2NFZvFNxWJvwZyKgFZjgUJ3tdoH3ODJyOeFfTbidVJL0hms5MYJuyZYa8uBBSSKEeWuXbI4PJWScHy4dBa05yC0lS4Ojdc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cb069fa0-c775-4bed-9eda-ac21feeecd3c@citrix.com>
Date: Thu, 12 Mar 2026 12:36:59 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4.1 13/14] x86: Clamp bits in eflags more aggressively
To: Jan Beulich <jbeulich@suse.com>
References: <20260227231636.3955109-14-andrew.cooper3@citrix.com>
 <20260311175838.573925-1-andrew.cooper3@citrix.com>
 <2f006ef9-8a2e-4059-83ed-65dbe50ea9bb@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <2f006ef9-8a2e-4059-83ed-65dbe50ea9bb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0122.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH0PR03MB6097:EE_
X-MS-Office365-Filtering-Correlation-Id: 847e0b8c-1308-412d-b0f3-08de80340fc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	APs28X/1G6+CZSbuSWtZjtoqYXtcVKOakh3hacbXcWHPjND1clREQ0DK8EifecLZmCVh/XSVOOwef6u42NbHCAQYSLwxcZ+EV10IRk1TZgFlMPIH+LeuzwkZsWsnhUOK8e+KSGfSoERTpWQjeqqxRf4mfVZp5L8rfWcgMRL0/AH7mtfLkwFs+AgprcHJSRLqj+3ZebENgoTePgq0EjUaurOnsU5Y1CAb9qypkDoQY8sn9GTrJJ6TJCUW/fPX8gbZEr+ZT1RIVC073c3PRazr08VFQE18i1Wz9Qt//vSD6PuxOahwnOAKXtsCjgW0SU4tyWZPz0OL2BhSGWP7oUJ854m2RZUFa+COsFDnZAgzlP2DKOaKMLBfVjoslUpMXsmNDubEtT/iro4ahGBkJ0sWjAhBBLlyPsfIKIf9nwnaUF5W4w+EMD5ykkp6cztMOLINGRcYAx2z8pISmm2bZGyezCguN6sfGs3MvLQJJquJ+9BXZwR5jq3tWvUswqEp3Y0XJuJy6uBmO5wy/8ePbzMaFyy3BqztNu7uEhVTYTAtuRN38Ip/zfsMoQRXk0JhuUtzbm6yYtD3cne+dalqL+cwfxpz3grj6ZyiyYOfyu+HRlMKS8KnO21x5rxHA0FJEvYjB5tnt1mpJY+KxnryIczNg2z13zO796Ko7erjyH0Ep71yYrIh6S4UND1Sl9Soxs7NfSCbmZV8QZjRs05pal5wGrpuRiFMAcaXEjYBIq02Uws=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUdDazczaEZiUGc5ZnpKMlRIdXRhTkVhVVhwNkhjN2xFVEVDOE1aZGl6d0RV?=
 =?utf-8?B?RkJDeGdDQnBwTy8rdEREWnh0RzNOWk1iUzc1YzcrU1hpdXhIZkdGK213aXRH?=
 =?utf-8?B?cWpaMjJkc1AxRjdKdko4ZVVQV3pZS21YYTlJZjQ4V2hGeFVvR1ovb0ZYT0lF?=
 =?utf-8?B?dU1pL0RHdWtSR2hUV0FVZWZrUFc2RFZ6OFZveVNYTzB6UC9GczZhU2t2VFBH?=
 =?utf-8?B?bkZDRVFFRU91eFRIbFN6SndkdFN3Ky9yZDM0RW0vbVpzRE5QTzdqTHllWXBl?=
 =?utf-8?B?VFFOWDI3V1RwUWQyYlExOXlNTFZNUllvbEZpdUphZlhCOEtVdTliM1VEUE5k?=
 =?utf-8?B?cFY2cEhpb25JbFIxKzRVVEpRUk10VVY1NFlDMlJldzhEdG9Pb3lzaFdhMnhK?=
 =?utf-8?B?eUJSR0JrQU1KTGxTZUlJaEE5c3RUSUxDSDZibENlano3RGVtZllNa3lGK1Jv?=
 =?utf-8?B?QVVoVTdHMnVnR2huY0kwSGVHZHFOanorNHBQV3dJb0VnZit0NHdYNlEwcDMr?=
 =?utf-8?B?azNONnJwMjE5ZTRQTlRFTEc4S2M1Lzd3ZXJONWlYMjg4VkZhVGlNRkVXelcx?=
 =?utf-8?B?aGFtV09rTDVNbFhSek1uREhoeXYraVdTcERyVStEdXRKa3VaNFNTanQrcURt?=
 =?utf-8?B?S2FzMkVyWmJ2aG4rQ0l4dTNhQjJFRm04bHRzOHR2bkV6RGFvWE1tazZDYnpT?=
 =?utf-8?B?dGsyTGE5U0ZDVkpOeGNUcjlmNG9Ma3ZjeGIvTUNOSmc0ZzRnMDRzblkrVTh5?=
 =?utf-8?B?UFowa0hicEhRazZjRW01Rm9QZGx5aW8rNUlzeHN1b2dmb2w4LzlXNzFuL3Zo?=
 =?utf-8?B?eTBQZkdjV0ZQY2Zpb2s4WEh6S21wakxFUzFlRE5md2hjZEpET2RRbW1DZlh6?=
 =?utf-8?B?elIxQ3FTRVB1NmdsQzQ3ekY5cnJ4THlrY013MWxKbHJHU1pyNzFHRjd6eEdx?=
 =?utf-8?B?Q2F3dzBjR0tCSldsVHhnT1B1ZEx4dWVlZE93K01heTI2QUFoQitQTVBJS3JL?=
 =?utf-8?B?bVVZRTdxN1NMOENLUkowYXl2MWlOZjZwL3FFb0lMZUZNWGQzOTcwdTNaNWpz?=
 =?utf-8?B?TmhoM3RXdTBGNHRjdzY2Y0hObmZEVW5jWXRscjUxNDVxYU85eXJUT3VpTXR1?=
 =?utf-8?B?NDdVWFFtSU5NeFphZzEwZE1yc1AxSzZ4UFF6cVJjQzFja0hhKytvbk1kR1ZL?=
 =?utf-8?B?QXlySExKV3VjMjhNT0xQVGR1bW1nSVE1NmhidWlLaTVLa0dHam1xcGVMbGNo?=
 =?utf-8?B?dEVuSmlvcmdYRWl3VDNKNzJlUFlxNkx0SHhQM2hiaUU3dmMvRXJjenBHekpq?=
 =?utf-8?B?TTZzZ21LV0xKcVdhcW42NmFMRW1qTnVGY1dXNUorZlc4aUxMN3ZFL2J3N0t3?=
 =?utf-8?B?a1d4dU8zNi95ckxDbkgzM2pPdWdFK2VRcVhmSDlRa3FEUjhEaVFnakZLbVdt?=
 =?utf-8?B?OG1WcHpRVzFsUlJaRnhSclpWUzZKVDNDVmRNSWd6QUdCQ3hsTTZBbTN3YkRR?=
 =?utf-8?B?RWpmM0RDT2Jqc2xvY3h5WlplKzYvZGJBWE5qblV6NG5OdVd6S0dtKzFxc3oy?=
 =?utf-8?B?QkF5SVd0Rnoxd2gwRCtSaURKUTNNK01ZLys5eU5Vc3dNY3RRVXAzUTdZUHo3?=
 =?utf-8?B?ZXpQZ3FjZGJoeWJRemlidHRpMFc3OVpNcTMreUhSaWpqbE0yamRuTWlFR1ox?=
 =?utf-8?B?bFB1WjZScldzS3ZEMWZOWThQTWVVak5OUCtvU2xGZGpua0JNdWlyVjJxR2dY?=
 =?utf-8?B?UUZra2JBQWV6UlJIZlIyZGpDbUw3cm51SDh5ZVRwSDlCQ0RVMEs3OWNTUHVB?=
 =?utf-8?B?dzA1ZC9zcHdOdXNYS2lnQS9BeFBSVWs0Y1A5a2ZaYmFWYkF3TGpCU01kTTht?=
 =?utf-8?B?K1VramxoL09TTENzMnZicDFmdU1YdTIwT2YzMkVxUHJTdFkzYWtGZTI1dExW?=
 =?utf-8?B?cTl2OUVnRkdISUpDRVVtaGk0aElrcjNGcE5iQWtUWVRHUm9hSGllMUkxMWxy?=
 =?utf-8?B?UEdsVGx4SXk0ZW50Uk9xTUd0VnFMZkFSZFR1aTkrOXpIQlI4a1F0MFBZM0hZ?=
 =?utf-8?B?di9LRlgyS3ozQmxWSWtRcGd0NFN6YkpHWHorZDJZV3ZuOEZKa3FIb1E1Vmps?=
 =?utf-8?B?YjVaRUdKRzdmWlF3UEZwSkd5dU9kL29lL2dTTUE3L1BVa1RidG9UcFBXNmMr?=
 =?utf-8?B?N3UrMFhRSDJ6KzJCMHYrM2RjaEhVdVBiazczOWxUWTFmdUNIWmVQYzBoWUxa?=
 =?utf-8?B?OUlKMDBSbGNDanFYcmN2WFczOVp6L01Sa0VKWWx3RzBLbkF2MkZHR3hSU2VV?=
 =?utf-8?B?UWpXdnBpZUc2eWdnZkgyU1I1YXpjdlRWTVNRSG5waUpXMFZQeU9ZZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 847e0b8c-1308-412d-b0f3-08de80340fc4
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 12:37:02.5255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mRl9LArgUs5BoD8eBo3M275pkRXn1Q+Y0e3npfL2JEM5VmKLDZpi5QseT8M6+SWcwzPU2C4rRkkqtI7ZTCodBYB6GECUCLxxk8PC2G+BI0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6097
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1B6CC271E50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12/03/2026 8:15 am, Jan Beulich wrote:
> On 11.03.2026 18:58, Andrew Cooper wrote:
>> In FRED mode, ERET is stricter than IRET about flags.  Notably this means:
>>
>>  * The vm86 bit (bit 17) and IOPL (bits 12,13) must be clear.
>>  * The sticky-1 reserved bit (bit 2) must be set, so dom0_construct() needs to
>>    set X86_EFLAGS_MBS in order for a PV dom0 to start.
>>  * All other reserved bits must be clear.
>>
>> Xen has been overly lax with reserved bit handling.  Adjust
>> arch_set_info_guest*() and hypercall_iret() which consume flags to clamp the
>> reserved bits for all guest types.
>>
>> This is a minor ABI change, but by the same argument as commit
>> 9f892f84c279 ("x86/domctl: Stop using XLAT_cpu_user_regs()"); the reserved
>> bits would get clamped like this naturally by hardware when the vCPU is run.
>>
>> The handling of vm86 is also different.  Guests under 32bit Xen really could
>> use vm86 mode, but Long Mode disallows vm86 mode and IRET simply ignores the
>> bit.  Xen's behaviour for a PV32 guest trying to use vm86 mode under a 64bit
>> Xen is to arrange to deliver #GP at the target of the IRET, rather than to
>> fail the IRET itself.
>>
>> However there's no filter filtering in arch_set_info_guest() itself, and it
> Nit: Excess "filter"?

Yes.  I noticed that immediately after sending.

>
>> can't arrange to queue a #GP at the target, so do the next best thing and fail
>> the hypercall.  This is not expected to create an issue for PV guests, as the
>> result of such an arch_set_info_guest() previously would be to run supposedly
>> Real Mode code as Protected Mode code.
>>
>> This allows PV guests to start when Xen is using FRED mode.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> Nevertheless, a largely unrelated remark and two suggestions:
>
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -1193,6 +1193,14 @@ int arch_set_info_guest(
>>  
>>              if ( !__addr_ok(c.nat->ldt_base) )
>>                  return -EINVAL;
> Seeing this still in context: I had some trouble locating the position where
> you're making the change, as in my local tree this is long gone. Is there
> any chance we could make progress on "x86/PV: consolidate LDT checks" [1]?

I'll have another look, but this patch is going to need to go in first
as it needs backporting to 4.21.

>
>> +
>> +            /*
>> +             * IRET in Long Mode discards EFLAGS.VM, but in FRED mode ERET
>> +             * cares that it is zero.
>> +             *
>> +             * Guests can't see FRED, so emulate IRET behaviour.
>> +             */
>> +            c.nat->user_regs.rflags &= ~X86_EFLAGS_VM;
>>          }
>>  #ifdef CONFIG_COMPAT
>>          else
>> @@ -1205,6 +1213,18 @@ int arch_set_info_guest(
>>  
>>              for ( i = 0; i < ARRAY_SIZE(c.cmp->trap_ctxt); i++ )
>>                  fixup_guest_code_selector(d, c.cmp->trap_ctxt[i].cs);
>> +
>> +            /*
>> +             * Under 32bit Xen, PV guests could really use vm86 mode.  Under
>> +             * 64bit Xen, vm86 mode can't be entered even by PV32 guests.
>> +             *
>> +             * For backwards compatibility, compat HYPERCALL_iret will arrange
>> +             * to deliver #GP at the target of the IRET rather than to fail
>> +             * the IRET itself, but we can't arrange for the same behaviour
>> +             * here.  Reject the hypercall as the next best option.
>> +             */
>> +            if ( c.cmp->user_regs.eflags & X86_EFLAGS_VM )
>> +                return -EINVAL;
> Technically we could support VM86 mode, by fully emulating things. Hence I
> think -EOPNOTSUPP would be more appropriate.

Sorry, but I think you're rather too late on that suggestion.  Anyone
wanting vm86 mode can use a VM.

>
>>          }
>>  #endif
> Having all of the EFLAGS handling together would be nice. IOPL and IF handling
> sit further down. Could I talk you into moving these additions down there?

No, but not for ...

>  Yes,
> there are downsides to that: It looks to need another "compat" conditional, and
> it would further the mix of state updates and error checks. Yet I still think
> having all of the EFLAGS stuff together is a benefit.

... these reasons.  The later position is after the point at which it's
buggy to fail the hypercall, because we've already reset the FPU amongst
other things.

This is a dire function in need of a lot of work.  I'm just leaving it
no more broken than it was before.

~Andrew

