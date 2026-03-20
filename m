Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPpIOTAXvWnG6QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 10:45:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E5D2D8377
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 10:45:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257933.1552172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3WPS-0005v7-Fb; Fri, 20 Mar 2026 09:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257933.1552172; Fri, 20 Mar 2026 09:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3WPS-0005sa-Cc; Fri, 20 Mar 2026 09:44:50 +0000
Received: by outflank-mailman (input) for mailman id 1257933;
 Fri, 20 Mar 2026 09:44:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6CX8=BU=citrix.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1w3WPR-0005sU-Bn
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 09:44:49 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6eaa506c-2441-11f1-b164-2bf370ae4941;
 Fri, 20 Mar 2026 10:44:48 +0100 (CET)
Received: from DS0PR03MB8272.namprd03.prod.outlook.com (2603:10b6:8:28f::23)
 by SJ0PR03MB5645.namprd03.prod.outlook.com (2603:10b6:a03:282::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Fri, 20 Mar
 2026 09:44:44 +0000
Received: from DS0PR03MB8272.namprd03.prod.outlook.com
 ([fe80::2e63:9a7a:3701:7654]) by DS0PR03MB8272.namprd03.prod.outlook.com
 ([fe80::2e63:9a7a:3701:7654%5]) with mapi id 15.20.9723.022; Fri, 20 Mar 2026
 09:44:43 +0000
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
X-Inumbo-ID: 6eaa506c-2441-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ec3FdAxxWzJYb0ONVHcITGv+gi105yTRpEvI/kwZgb3Zf37CGimtxR5NEA5CPVZICzuEuAo5FfAkRkke21N+RXLSbc+t+1rlpeah8PDa5uiYGkvPZbbA10t7OpuNtxGB5GPUCfqMCa1OlBc8qnG9dEOnTrQzIIIsjZBu5T7elrgTBKlEMkQQXqzLsPdoygeSMVytM6FmJtaib65z9JDA4c8ahKJNLZsNV3DsFE5psEU41xXgpSdawhdlrWcILB1RPBPOBz80SCO1799d1FGywrnCe4yzTgqMLq0ItaH9hHkhfcbOydkbtydEHm6yKbnkCDbATROC6Ya0qMvt1TLJHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2jyNF+FUpbQyEUqCFzvhv/x/pVfjXtbuFX7agRaWcs=;
 b=PLatOu3E4pqiXNePJqrkZJR4qEpyV0QqQTBe4Luur88x2xZnSKFn7L2h7Q+0ypre5/QoBiWxn8iIU1J7UwSFWFQbM//IbMQEhrdHTBDt698fzNyPUHEMXt1hmVUh3TpPhjZVBve3yDJQFIHucol69rl9BlRWmQhxvyRjWb2aLdg2SOtqNF2s37lLsaqgRD6YiPZEawha5Gy367BtDvlfEcyxauO6bpaG0l/aMSyXdS45Xyt09hG1vFwcKVujT0+MSL9Q0rwYgojbFW8/kDOgDEQFlZukohMPuLqWSidId6InZc90SUZyOfHkNcU2Zg8G66bVI8moDAVoLJhZY3Ztag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2jyNF+FUpbQyEUqCFzvhv/x/pVfjXtbuFX7agRaWcs=;
 b=ZPIWcrAn8d1PvglPpAEtRq5c5I84CpnALP0NlZgc9qy3AZSbcQy0MApXJ0I3gWIRIDIqlkrHdEIM7QYz8uWadQyzos7yscMzysPpEouRvy1hRpQZb6XDtn5jPiH26oPenhpHqrildW/o8SSPrT6FLGigudFX6+ytsfKiWoOIV0A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <72944656-cc83-48c8-8cd0-9fc5ccc6f96b@citrix.com>
Date: Fri, 20 Mar 2026 09:44:39 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/hap: Defer NPT P2M TLB flushes
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20260319114041.1455593-1-ross.lagerwall@citrix.com>
 <abwCyyhBusfh5Qvu@macbook.local>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <abwCyyhBusfh5Qvu@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0041.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::15) To DS0PR03MB8272.namprd03.prod.outlook.com
 (2603:10b6:8:28f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR03MB8272:EE_|SJ0PR03MB5645:EE_
X-MS-Office365-Filtering-Correlation-Id: 87c3be10-f4af-4de3-5686-08de86655068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	tc1PmUgFKXzp2y3Fg8CAbiIb4O6U+31msTGbjlBK73k58EKqQWMTDts81C/M1SRcBx9WlGUC3eRMU78MKpzqrdUikYcRrS/8NVS3aY5MMBUPDPPf12ubACOf+pnnUtUDmnoQb//aSkxzkgaCKFZRDI6PCovihyeFXOXJJ6+ZukuzWjF/nJfxLR56Zh/orL+sUSsqk6CkqT6lzOKOLTT4ht42ECF6kTWEvrgnsiCEFiQJe4BTLxWg60HNxlGzsG5M0EKJyjvVf0RuRoBrjj9kU8jabEIg9pOvqQz3PxbVL1kQAzaF8Xh53pCURBi+oKdwQF0v/3zlZT/0yPaxwR3w4uEYfu8lRkL9fWjWMd4z4LcFaBfFUtDyYkTISQmwTZHgomoCdFcRjL47f1jMvct7FQcF5PNRgWlXnsefzHng86RNoj3VVvu8v1dH0PoEGYMEKwXPU48SEkvF1dHhQPVyomqg65ATQFki7n+nCBBsi5aO1CQpoIsqYB7RmeY+K0zuNEQuL13z16Pc2mpGol4yO+3orNzu7gcZn3Uhp7CJ0gwBQFKVV4TByEGiirp4NFHVK9OM8RtQ3rw7joGiLA+OZjopIcEbty9ILAGpQ7jdpgBI3h1L7O7zpKbzLJ4Vart3dDAI4tLepCSjm8poOxaOl1BOl9d6ODjx2iFDZ3SiDKfVW8j+eEufXeNRsac2DxUFJR4iecQBtTF3HlE8rrUliG57dRXS4w7t9tO8f10eAbA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR03MB8272.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVBVOVJ5NCtLQzZsNUNwT3I0QW9MeDJRTFVIa0RzbEtEL0t3T2x2V3BZR2d6?=
 =?utf-8?B?bGhMU0tqZmdIK1VqNmJ0cFFXY3JJTER5K1ZrZXF2Vlo5ZHdyV1JQQkUyOXJq?=
 =?utf-8?B?QU9FZ0lpREJYVy9UOWZIeUp2SUxuSGNua3IzeXdZc3ArVzJkN0JNc3FSaXl3?=
 =?utf-8?B?ZEVESERDMWtFclZ6OHVqbm83UmlVU0JpQlFLM0dCWFRjazVLLzVabjl1c3Z2?=
 =?utf-8?B?S1d3WC9QZ2dWQnNha3dYd29FRjFtV2JKUmIySXFUM21RU1lXNjFqYWxIczRJ?=
 =?utf-8?B?bWxsMUJ6OWhZUllMdEkyYlFhVnRJem5zY3hIek1mWXpVdkdPRzRXcVhBVkhk?=
 =?utf-8?B?MnIwNytVNzdJWVFBQ3NPa3FIVFV4dzBPZElvZDU4T2hkRlRCbS9DNlE0dE5H?=
 =?utf-8?B?SlZYbTBjQXFoVlN4dmt6ZnBBYWdyTm8rWFFMUk1wdTRkVytNTE5KUHllbjRY?=
 =?utf-8?B?RVJONmdzdUM2TEZJSGthK1hCRmlNS1J2K2o2N1Z0WnpWeWRLY0paeDk0K1pZ?=
 =?utf-8?B?UFRKc3UrOVBiL3NTSjA3T2FON2V4OEpDY3lhZmhDeWJEY3NYTWY5ZDVLRTZH?=
 =?utf-8?B?VmFqYjhhSERMSVRtbWV4NXBuTEk1Wkw2REk5cDhNbHFyWHRmM21FUG9TTzBq?=
 =?utf-8?B?TE1ZcGgyMjlqUHNRZUFyMUlMRnN3RHZzNmhIU3dmV01ibmFoTTZPTkQyOXYx?=
 =?utf-8?B?Y1lzZm1TS3liY0JPUEFURlUwVU1SQmY1R2xPeVVWWnFCczIwVWhOREpzOTdI?=
 =?utf-8?B?dE1nYTFKWkZXY0N2NlpEcThUVlpLZE5kaDhiVm9GWTJUZHFCeGUvQmVNNkE5?=
 =?utf-8?B?NlQ1enZjWmpYV0hQaURsUTBKTW42UzlTSGlnaUxMVWhPRE5OZWVtZWlPNlZy?=
 =?utf-8?B?OHk3WVJhSGYwcXR1N3hJd01ZRGd1Sk1NZmkzNHF5ZDZvK1R4OTNrYVgyQ24r?=
 =?utf-8?B?R3NrTUtnY3BGVk1VRVZ2WU8rb0JGN0dGTjUyWnZMYmdCK0hZbzBBTUNYbnNJ?=
 =?utf-8?B?ajhrbGh6ejRZZ0tTRzMxN0pQZWZjYlJseXhSOW5VcFZkRGRrUXNjbm02akth?=
 =?utf-8?B?cUNKaDhxQ0d5ZThlc2hHYVdGemVjdFFXUDZPTXk4bEVBdkpSZWYyWnFqZ1Uv?=
 =?utf-8?B?dU12SGVJeDNjUHNscmtsYUNhdmJzWVdWR2RDZlVJOWhjaGxDbE9PdzN4cC92?=
 =?utf-8?B?bCtPeTRmUi80VHI5elJFaHV5ZW5SUkRub3Mvdnpyanpubm9VKzZWOUM4UllY?=
 =?utf-8?B?enBHbDB6N0NPSnYvNlI1anRqU2REeDMzcmg5VTlHczNrb0xvT3d2dFc5dDBC?=
 =?utf-8?B?ZEJDR2RRNy91TkszS1BZSnkrZ3h6MGdnak85dTRyVWxZZUV1Q0pWUjhLSE16?=
 =?utf-8?B?emJNdmprdEhaQnhqM0xpTWF2c1JzOUxZOHNuRXRDZ0c0Y0FNeG5RSVdHN2pO?=
 =?utf-8?B?T0hUem5VdVlkM2hOZklMWGtOdWNEMWUrNDFTeHFFVTFuSWxZNVRXc3I4VGdk?=
 =?utf-8?B?bDFlYTBqQ2dBQnBqbENvTlZwOThyV2RWRW9UZWt3UU91QTArUmErS0ZQbmla?=
 =?utf-8?B?QlJsaUNEWjlPL0xXMWIzL2U5cFhkRnRWamVRZFZuLzBXblhuekVPVHhzWXJ4?=
 =?utf-8?B?TFU0MXJBWkwzQWdpeERCMjFsQVI2NkZOZ3psR05vYWJUdzNMR256dEY0RnV5?=
 =?utf-8?B?aGdxallqaHV0Y0dyWjBjU09BVlIxdkxYUnJ2N01sQWFMK1RlY1hnT2hqNE1l?=
 =?utf-8?B?ekpHR2xKb2Z6TnNYdTYxN1UwSXFvMkFrZkNTQkhOV0t0T3NlSzQ3Umh5cVBF?=
 =?utf-8?B?RVhhVGg2Q0RScmFNWGIvbVBnQk1wT204WUlGY1dGQkhkN3VWSjhRUjVvbC9S?=
 =?utf-8?B?akVoTklIZHNEcjExZmV2SUh6TEMzbEpPSUZjUG9URG10SGk3TFdVTXgwRUdG?=
 =?utf-8?B?S21XazFQeW5pdU82TWtMOElqaEtoMW42WHBQV2VIeWw1NW9Ed2g1eFY3OXhl?=
 =?utf-8?B?TmlrelRrRlpBSkZtVG4wek5PR2loVm9MWHZQRGtVdXM2QlllbmJHclp1MGdm?=
 =?utf-8?B?WDFsMGUwcTNYeERRY1JrTkU0NlVRVnpsV0FUa0Jta2JXQkQrZTBvak5hUFAw?=
 =?utf-8?B?RXp3OCtHV1pGdjJzYzBpeFFUS2pjZ1QxWEZXNnRVMDQ4TkMwTDVvbUg5VEZL?=
 =?utf-8?B?SEZab1JVT1JZNndEQ2ZDbE55VldQWDRVL2xqaUdtRlNEalJGOGQ3bU9BSXN0?=
 =?utf-8?B?UWRucStvQWVMQ3BQNE11M0JySnhDcTNWc0FzVk1McjNWSTQ3VW1vSWtVMDNo?=
 =?utf-8?B?MVFJZ0plcmlvVG5aNnBZUk1BT24wS0x0a2diZWh5WERJTjVZcm8yS2dHdDVY?=
 =?utf-8?Q?jS7mmdHaV7HdPezU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87c3be10-f4af-4de3-5686-08de86655068
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB8272.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 09:44:43.4197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BbOXqhB+qgXb3pNe1AwG9bkEx4ADo0pO0KiOdon/9xCzSgJfvOBX1o9y9YItRt8FaWdpQD4bPjjunI/x2IkauqG49d6GGvwAXtiVgk+ulTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5645
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
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 35E5D2D8377
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 2:06 PM, Roger Pau Monné wrote:
> On Thu, Mar 19, 2026 at 11:40:41AM +0000, Ross Lagerwall wrote:
>> Like the EPT code, defer TLB flushes for NPT to reduce the number of
>> flushes and avoid holding the P2M lock while flushing. This can
>> substantially improve performance in some scenarios.
>>
>> The cases where the TLB needs to be flushed without deferring are
>> already handled by the call to p2m_tlb_flush_sync() in p2m_free_ptp().
>>
>> Suggested-by: Roger Pau Monne <roger.pau@citrix.com>
>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>> ---
>> In v2:
>> * Tweak commit message.
>> * Call guest_flush_tlb_mask() if the assertion fails.
>>
>>   xen/arch/x86/mm/hap/hap.c | 22 ++++++++++++++++++++--
>>   1 file changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
>> index a337752bf488..67137611d9db 100644
>> --- a/xen/arch/x86/mm/hap/hap.c
>> +++ b/xen/arch/x86/mm/hap/hap.c
>> @@ -814,15 +814,33 @@ static void cf_check hap_update_paging_modes(struct vcpu *v)
>>   static void cf_check
>>   hap_write_p2m_entry_post(struct p2m_domain *p2m, unsigned int oflags)
>>   {
>> -    struct domain *d = p2m->domain;
>> +    if ( !(oflags & _PAGE_PRESENT) )
>> +        return;
>> +
>> +    if ( unlikely(!p2m->defer_flush) )
>> +    {
>> +        struct domain *d = p2m->domain;
> 
> As you are moving this around, and seeing that guest_flush_tlb_mask()
> takes a const domain parameter, I think you could make this local
> variable const.  Possibly the same below with the other d local
> variable.
> 

Yes, that makes sense. Can the adjustment be done on commit if there is
no other feedback?

Thanks,
Ross

