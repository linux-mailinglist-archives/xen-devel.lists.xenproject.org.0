Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAAnKqIlvWlp7AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 11:46:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 133052D8F78
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 11:46:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257979.1552199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3XN6-0007T5-AM; Fri, 20 Mar 2026 10:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257979.1552199; Fri, 20 Mar 2026 10:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3XN6-0007Re-6a; Fri, 20 Mar 2026 10:46:28 +0000
Received: by outflank-mailman (input) for mailman id 1257979;
 Fri, 20 Mar 2026 10:46:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6CX8=BU=citrix.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1w3XN4-0007RY-2b
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 10:46:26 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07215cf5-244a-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Mar 2026 11:46:20 +0100 (CET)
Received: from DS0PR03MB8272.namprd03.prod.outlook.com (2603:10b6:8:28f::23)
 by LV8PR03MB8164.namprd03.prod.outlook.com (2603:10b6:408:296::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Fri, 20 Mar
 2026 10:46:11 +0000
Received: from DS0PR03MB8272.namprd03.prod.outlook.com
 ([fe80::2e63:9a7a:3701:7654]) by DS0PR03MB8272.namprd03.prod.outlook.com
 ([fe80::2e63:9a7a:3701:7654%5]) with mapi id 15.20.9723.022; Fri, 20 Mar 2026
 10:46:14 +0000
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
X-Inumbo-ID: 07215cf5-244a-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2AYiN1/BMSdI8aBF8a1+DEXs2DYwrU9Kv4QopJErQb7Wtd79siBbZxnEa5NX0S4QNlg8l5h5DdC+KSmO4jNtdsOyaylUJtF47om5eRaHzodesUtZFA0E7FxZGFq6ftGXlM8FxnNjScgcFuyvwUaVcCVVfmgvtJ8rHO46lO4IUkRG737+EzBVFsOmGPmUdEgF1iRkLz4VndqJmggFy/eUVFqTR65Jg0lHqDu9ing+7sjysy+aNVCiKv+PZEz3/87QNo1xhx/qOFl7STG7GW6V9y4dPoUVUPpBGGgHIfmBwxXtZIK3apqnp2srDB9vMaz0JJ6C/GZad4Hq8w1IdmySg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Kkk6Zd6txHNwwoJi5Tyr+RvkDuM60jBULf2zj7xAgM=;
 b=vl+o/KPThXlW8Ps/h1awhrsZqE/u3xYOyVWEspMjeFmFPfg8iTsqlHS50titpODL6spjzeHVAr5jLZPTNN2mLC9UJP9FZNSQPwZ7O2ekbCtQjjRb3qFjRNzhL9SkNs5o3MCB2etYKf7BKjpj7T+O/u3/rFTur+PVqYNvig3T2OPcGewQqXOODo/TA5y5UBqw4L4/it0iUsuod/MoOFfdvcbs1pHVgO3SxM5+fs3t4mQxZ2RfLdozhZjTQqq/C2cuoz5SzPi4UhYkdonv0Maqw42Dzeq9M9EDITps3zKucN1Su9Q9DKo4j1DrNj0Gjo0SKiqdbSHF2KX+hlcJqhgxVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Kkk6Zd6txHNwwoJi5Tyr+RvkDuM60jBULf2zj7xAgM=;
 b=Qf/pcV+SLV2CssVJEjMjUaVSgvrJ5qSBjKKp7nUCNkt4JMAPQvWIQ9LanIscI91vR1xK+Dzp9Qx/05KudLRMjuS0k8noDCWPv/A9A09jbExtGfhZYpuaSEEve59iYeBWFY0TJWTPzHZHPyK192iEkPcD5iy7tBrIRweLzBiBnmM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <599e1de2-6468-4f32-a52b-408d8c63e8a6@citrix.com>
Date: Fri, 20 Mar 2026 10:45:28 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/8] x86/vmx: Remove lazy FPU support
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
References: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
 <20260319132924.1469809-3-ross.lagerwall@citrix.com>
 <a67bbe7c-9c41-43e4-9d28-f5f221c96b95@citrix.com>
 <c646fd85-f526-435d-897f-c1ad72e6d234@suse.com>
 <4a03299f-cf0e-44ba-ac35-f13392eb83fc@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <4a03299f-cf0e-44ba-ac35-f13392eb83fc@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0308.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::7) To DS0PR03MB8272.namprd03.prod.outlook.com
 (2603:10b6:8:28f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR03MB8272:EE_|LV8PR03MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: ba4028f2-ae3f-4711-37a9-08de866de871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+mwhUqBocBEtG2i6kMvExCfu1kdWYu5I8RPh3WD0wbRMjLk5VllRmVDScl2iGHXWxr2iNL2gqHJACE1/1g8eA2azMXKXuVLrO6FxMAx0Hgk1DLFJW601SOhUolL4eZYr/DIJr5YYUynRNFl7M1jSAxcoMpmXXMGg8XMPfdaVhElv90GibOZWnh84zpZaj3QMc5o+YWZ3VRxIn+Yyob8ajg4yCS5Qc2TGJH1bTXdHbPN8/0bp5lng4MTgDxzS0GrA1SQ1OLay+9xPQkE9gGljkjGOfPT+0Y/z3cK2GCfoAHX9stpRw79JkGr9VlRHoUIkbi93zj6wv7C4pz+vN5fstAtyiVwIM3Xu5GYppQRO80YwvfhqvCqBLVcxV5pRNE9qUb/k3aVIy7azuTlN7Q5tBt6QUw17NgygiFj5VVtFoC5ITh4bha9pYtIQDpPT7VevVji2pEsN2eenJ1qhkUzr0KJXxqlqi5TvFwwsFq/JYiULdrOTSwgvi7wjz01p62zsLHY0+rJNJ8VqzDVQZq1+dV2f+VQhahSl+DnQ4qL8S7m6D5S0bQgYByNFWyF/FBEC7X0R4/yVjwKdzd3W6fZSVp886yquFv2tWzII5+pGF/pmv6NoK9iAFrb2895vTbhq4XgpPeUiTtPB2p5x6CEQKgJS7TsFIPIc8clob6G9U6Fg0ZrK+/t2A5LzCYx7jv9bZTrESGMVYlVR6phQ6YrCHXn0+RcBJuMRDY+8h63VoLg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR03MB8272.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djRvc1pMYWpqZVkwV1kxK2hEdnAxV2RqSStFa0lMVXpBc0Z0NW9PRWF0dTlY?=
 =?utf-8?B?K0sxYmdnVC8vL0RyZ1NBTjdjWlh6MmxQN2RHKzA4UjhPTHVQelVIdHZqQllY?=
 =?utf-8?B?WGlWVDdQUTFMb1Q3Y1lQVFZkMlhZZG1jZTd5dGhlWmtlSzRiS3h0bVNhWDFj?=
 =?utf-8?B?L2l6RGNBSVpVVGlDTjljeTAyQStoMmJ3OWpFNEFKS2x5VTZLOXZBZ3daNjZL?=
 =?utf-8?B?N3pUSFA2aXlBK1JTaHUyejd4dFliamx0UlFTRVUyejBNUFl6MUNvWlZqYWRa?=
 =?utf-8?B?bnJXL2RGanNmLy92N0dFUjRucWZ5VGZDdkV3VGFidFhKNGhZNGxGVHZ3aU1B?=
 =?utf-8?B?K0hTQ2ZZTnJiWVY1MkxTTlZXVVh0RnVMTHI3ais3VU9OZExySmxrN01JTVlW?=
 =?utf-8?B?d0FmQThvRXArSjlEMVgyQTVDbllIVkJOMVdxOW1xUU13a1ljZ1FLZ21HRGZ2?=
 =?utf-8?B?eEw2WGlOMkJ2YjRoTnZma1VDVWdZZGFuL2lFVm1TWlVyZDZ2TTRXbzB5eG8x?=
 =?utf-8?B?b09UYnpnbUZSZ1VwMDFMeCtiUDNtYlhRN0g4TVprcEtSRU01VE9aU0p5Sk9Y?=
 =?utf-8?B?ZFIyNCthdThmNGsyV0VRSzBNZlZVR3lwdkRkT2VDMHR1dDBWSjdmdHFxMC9B?=
 =?utf-8?B?VXM1SXlEQ1JUN2M3aCs4ZHNDOGwvRDVMSEFxUzQyS1NuL1N0ZmVkcGN5bjUx?=
 =?utf-8?B?VUZZc0lRdDNGNzE5dVE2SXgxSHhScmNlOS9kMFA1bUx0cVF4L2tKbTVIZ0Ni?=
 =?utf-8?B?a2Y4MUoxVEFiV3h4eTYyVWxFS0V0UGppdms4RDNTSnd4RGg4bUtvMGhaWEwz?=
 =?utf-8?B?TjJJbUN5SkkrdU1qaWVreUs5djYzWmp6V0FYTDdCTnJ1dHRjWGwySEVzNU9z?=
 =?utf-8?B?K3MrQlJYS2I1dDUyMHJ6djlZc25FcG9BOGk0TG9uN21CSGt5UElTYU1Yblhw?=
 =?utf-8?B?TkNydnRRc0lWV3lBNldmbnVxc3lmMVBNOTRNbm5EcE1SWU5Md0xYUUN1WXRz?=
 =?utf-8?B?SHJzeHdwQXYrVC83U1R4K3drTXg4eTVJODdDN3VXT3MvRU91TEF0U0FZZmFw?=
 =?utf-8?B?V2FBUTBFbEJOZWpySVp2WlcwT2hLUXBSUHRJUWhBTUdJbHk2STZNeS9zNlpY?=
 =?utf-8?B?cyt2UjdoOXNDVnBYWTZqTUNwaHBRVFZWVnZkK0FKLzVZLzZUd2tuYm41ZXlx?=
 =?utf-8?B?OVdScUsvUEhOWWNNMVNhRDJrZTVaRGNXSXNwOFUrbkFVMk1CY0ZGS0Exb1gx?=
 =?utf-8?B?b0VQMktKRUxzaEYyS3Nvc056eU5NZ3RadTVMcVVPV0lQY1hZaHIzc1lpWmR5?=
 =?utf-8?B?RmRHV2dhQklWVmVUQmtOelJ4LzZjcVBQd3lwUTcvOHNwd09kcnB2ODN3MCsy?=
 =?utf-8?B?RytkNXk4Zy9udXZzTVdCYUd5eUU3OEdmM2JpaFlmQzdqRS9ESlFmWXcyWlBT?=
 =?utf-8?B?U1JrVSt3RTQ4RjliZFc5b2VmS016aXVuOVUxMWVBeU54QWhKck1oTkF3VTQ3?=
 =?utf-8?B?VlJQRDZHWmJDQ0N4Z084Q2NZNG00bDBYcldnZnNtMTk3V2M5eHNndVhwbEUv?=
 =?utf-8?B?aUl2b216V2l0UkwvY3R1OW1kdjRJdlg3TTk1Vk5kNktSQjU5Zlh2WHFGZWpv?=
 =?utf-8?B?STl2TEU4cVZGSkdyRWZQU01xOTBYRjM3VkxTcHd2Y1M2Q3drRHZqZ3hVVXpC?=
 =?utf-8?B?QmJ1dWZkQTJrc3ZWVFQ4K09jRXZkbWwzb3NFWjYwd3VKWFpBUnpwd0h2SWY5?=
 =?utf-8?B?N1FhUXk4ekRqcjFxckdvWUg4cVB4cjZ5K0E1Wkl6TWtEUEN1dVluLy9YcGFU?=
 =?utf-8?B?cVhyQlJXZUpFVWZCMEdDYnk3V3BjNGt6Q1UvcSsvTCtvUVJCckVWeEtGMkFP?=
 =?utf-8?B?ekFNWkdmMUliaUxXakNuTTVFT3RHOUU5QkFMN25GUndPM1NkMVl0d3ZPL2xV?=
 =?utf-8?B?RFdjWUc4NWV4eFFWdVBLYVF6UDVWRi9hMTZEOSs1WktsckZHSHhtdTNlWURh?=
 =?utf-8?B?bUpoMWo1TDBWdFdJL29EVVRWYlpIemNxbERCT1paNEdtdkE3SVRJZE02RmxC?=
 =?utf-8?B?cHJ2Uk9ndFJwMmZpSkNjb1F3Ukduamx4cSsybEl4MUtMQ0dtbmZtT01oaUY0?=
 =?utf-8?B?VjFrc1UwNndlaGp4RXJFdS92cmtCVHZ2akNlVmwwNUNNSkFXUXd0Z0hPSDZJ?=
 =?utf-8?B?V0Y2aVpKZ3FBU1A1S3F2VFlkRXRpcmpwOGl4eUJ3NHJhMm9mM244c1dHY2RL?=
 =?utf-8?B?QnQ3eW5YQncxVnF4NThDQnd4c2Y1aWtZanh0cFp0RU5sc1MrVXo1YStGVGFm?=
 =?utf-8?B?QXA5ZzZSZmN1UmlUUHg4V1NJVmcyMXFLNjdtbFpNbk9HOWFCcDJxOS9kNnFV?=
 =?utf-8?Q?OvMuwAYyWKzU1d5U=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba4028f2-ae3f-4711-37a9-08de866de871
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB8272.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 10:46:14.4209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /3b0DqcKf0d4uU4qOAnAyAMUKzgMXtdAnfyPHEKgCcY+D50NL15d4mvEdVkl0wEH4xEJlJmMXMybyzIRBDSmsxFZziNmiSa2b7OhQFlCo9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB8164
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 133052D8F78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 4:54 PM, Andrew Cooper wrote:
> On 19/03/2026 4:43 pm, Jan Beulich wrote:
>> On 19.03.2026 17:38, Andrew Cooper wrote:
>>> On 19/03/2026 1:29 pm, Ross Lagerwall wrote:
>>>> Remove lazy FPU support from the VMX code since fully_eager_fpu is now
>>>> always true.
>>>>
>>>> No functional change intended.
>>>>
>>>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>
>>>> ---
>>>>   xen/arch/x86/hvm/vmx/vmcs.c             |  8 +--
>>>>   xen/arch/x86/hvm/vmx/vmx.c              | 70 +------------------------
>>>>   xen/arch/x86/hvm/vmx/vvmx.c             | 15 +-----
>>>>   xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  2 -
>>>>   4 files changed, 5 insertions(+), 90 deletions(-)
>>>>
>>>> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
>>>> index c2e7f9aed39f..8e52ef4d497a 100644
>>>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>>>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>>>> @@ -1247,10 +1247,7 @@ static int construct_vmcs(struct vcpu *v)
>>>>       __vmwrite(HOST_TR_SELECTOR, TSS_SELECTOR);
>>>>   
>>>>       /* Host control registers. */
>>>> -    v->arch.hvm.vmx.host_cr0 = read_cr0() & ~X86_CR0_TS;
>>>> -    if ( !v->arch.fully_eager_fpu )
>>>> -        v->arch.hvm.vmx.host_cr0 |= X86_CR0_TS;
>>>> -    __vmwrite(HOST_CR0, v->arch.hvm.vmx.host_cr0);
>>>> +    __vmwrite(HOST_CR0, read_cr0());
>>> (Not for this patch) but I'm pretty sure there's room to optimise this
>>> further.
>>>
>>> CR0 should be constant, both here and in SVM.  Reading the active cr0 is
>>> an example of the anti-pattern we need to purge to make nested-virt work
>>> better.
>> In which case, is it a good idea to purge the host_cr0 field?
> 
> Oh hmm, I take back my R-by slightly.  We still need to initialise
> v->arch.hvm.vmx.host_cr0 for this patch to be no functional change.
> Easy enough to fix, or fix on commit.
> 

Not sure I follow why v->arch.hvm.vmx.host_cr0 is needed when this would
be the only place it is used?

For no function change, it should be probably be...

__vmwrite(HOST_CR0, read_cr0() & ~X86_CR0_TS);

... though that might be unnecessary after patch 8.

Ross

