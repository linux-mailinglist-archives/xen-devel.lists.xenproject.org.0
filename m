Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6M5FHBs5sGlbhQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 16:30:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C021F2538E4
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 16:30:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250197.1547668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzz1d-00053q-Jz; Tue, 10 Mar 2026 15:29:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250197.1547668; Tue, 10 Mar 2026 15:29:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzz1d-00051x-GB; Tue, 10 Mar 2026 15:29:37 +0000
Received: by outflank-mailman (input) for mailman id 1250197;
 Tue, 10 Mar 2026 15:29:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pBDb=BK=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vzz1b-00051r-Pq
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 15:29:35 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0396879-1c95-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 16:29:34 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5536.namprd03.prod.outlook.com (2603:10b6:a03:28a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 15:29:30 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 15:29:30 +0000
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
X-Inumbo-ID: f0396879-1c95-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LOf+kk2cB9Ku1MGa+Px3wJqXYTBDJCAHL4ripO/5mhdG0Jaz3azeUGxvRvev4B2pyAQVS1V7/HqQ7EDq8RxugQAyLdxsv0GGNUK3qRfoqHsanOh0imHsSCW1JxaxgiqxN58tv0uHV+IqS0JODv7W45AQm1cs34b7/PXISbDriUx+lWPTVvlsAYa7k79Npqa1aCkYOjBw1PVgtAsxE5g1wjsptChvR7gR3iMOQpJoVbhBf28YNMMWRZr5EwyOCiGfoH5TUKfpc/ZLwdufQqVNMQbha/fEBnv7OBx+VlFU53JY6B62l35TS+Azx76GHK6x3TtPfEmz7MRuTf1YEUz5mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSYeDnj5tO0lb7ERQWCY+4rIFbqwAmh28D8IGMmNgxE=;
 b=WC/uI60B/U06IYDIGDP+QeMpaH25qIWnZ2EMsKmcaSthgANcESKvNfen/yu514CmcCeQeZX2F+7JvqInRFz8eVMmftFZdYYDqsTJOwOIBpl9Mbw7TpgfX+HtSZGl6FLo3pseBmtQ8Ynnx87DsHvbmV+lQYFuhapGvcPWkPyN7baW0O7FGHx+aUPJwywoaSepNKaSHBzfpgmChOX3wbXkG1cYbdVW/XNAXzQ8oySLwzJpKg/oGH4vbkFnPMLoSex0Q4UOukn3/98WHq6iEJoTRL+G6uivUn2VDgtw9l/7EnwcN505qfLLyq1ySCizYXhEKlYjuWw0CwN5WeSdNJMoeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSYeDnj5tO0lb7ERQWCY+4rIFbqwAmh28D8IGMmNgxE=;
 b=pUQmiYZQnGKBvMEhyYMgfgfcOnQyeiHYbye2H8ElasNFi9g7TLNN+jClOHTB99+vVZYXW/VpxyhYGfWQsfmJc/sC/1h13pNcOvyKGjfoiDPv5eS5E4zInRbW3PqtjdDIW1MUGjGbSJb0Cwyr62s4XtM/P1qaeoI3xqOdqP3cG9w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9eed183c-4157-4432-94ec-a7b7a689fd4a@citrix.com>
Date: Tue, 10 Mar 2026 15:29:26 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/6] x86: Remove x86 prefixed names from hvm code
To: Jan Beulich <jbeulich@suse.com>, Kevin Lampis <kevin.lampis@citrix.com>
References: <20260304195350.837593-1-kevin.lampis@citrix.com>
 <20260304195350.837593-4-kevin.lampis@citrix.com>
 <4a5018a2-9867-432b-9464-874532241316@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <4a5018a2-9867-432b-9464-874532241316@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0473.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3dc::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5536:EE_
X-MS-Office365-Filtering-Correlation-Id: 837ccb74-9d8c-4847-9f89-08de7eb9d2a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	GP/t20XMfvDaVQYmZP7SbCYxy3A/U0AuMvaKK+kXjKCk4qk5S3G6n14Fzh0luZKjfz/cdsTczrLw6WsL2u4Iy0/wo9mId7M9TLin+o1UDseSIfvcJGwrFfGo29qpHKlabesyRRBET3eEh27eWPEwtytSea9VaX0jkdYXwqzfyMu07pFmdN3q6YEQh7i6MUG9x0kgYtivVzaZyN/JmgZLTSMpaSI19o+3dDMk6sDalZNxLATLPhhg4Tapi3RSK8utwo4/X81udgMlUsg/Lj4RLEyfdTjCwHmFOmyDttIEkBs/E3Wg+jQZEbotwHIoJVp8QhIVwUxMyirlxljZMR8SisBTWN9HtawQq+G/WDqtc+DCNHUX4BtvNSPjK+gJURnfUEb46oa/PUszYdsflaheJ9Aq1nSKcBNEtWdADRnw+Ke4hZ4aqtxDxmB9izY8vX81ExkCuj2TY/wHYNGEootzchuVP0Ry7qHSw92S6zLmL8a0gEnSlgfDhTFxJxg+IuVyVhN5+Y4KtUNIrmNl1nL+/HcK99lm0Naxn7FM4dLeAcBk/Vn55lhfynWXiGdNzmDWneYwPmcy4jiSu7RX4PO6Iy6XWADEd57ugZXj7zZ+Tm9F2nj81sAXbQ6fA/iXSB2/8ARR7b/o5njF7gD+ZqmU2K9Si4+KUp25PUBO2tVTELX0XZ9rZoWql+ZeDk+jAWNg1bEvcro5JHM0511oyKotfCF7ITDO/f2dCSGsimMG+lU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elBoa0RPRWpCcTlvV2kzVnFjWTA4NWxBa3ZXaEV0VjF3RVhaZVZwY2ZrTzY4?=
 =?utf-8?B?Y200RHFBcUJ4UXFFNEMzdmZFaHo5YWNCbWUxTUlZTTFuQVpMQXBheEhjck9x?=
 =?utf-8?B?KzVnMDdodTFIRm1ram8wQ0kvK3BwYjE4K05UUjkrd3BlNDlzRDdQNE9wSWJC?=
 =?utf-8?B?Q1AxSG9hbVlreGluQ3BoYWh3N2lLMEErUVV3Mzh6RVBhZWQrWWluUlVqYjZF?=
 =?utf-8?B?Q3ZRY2ZVSzM2RGF5VXFhOUFWdGw0ZjR3VHdHU0pON21sVHpsL3lHRktFVmI1?=
 =?utf-8?B?c2hRcVZTYzU2ZlAvckVLRVBZZTJKRkEwalNDQkVqQlRFMnNpeFJWNXNjQXJY?=
 =?utf-8?B?K01JSkxUa1hKSFcrdU9RaWtxcXpKeUFuTERVWThqNTJ0UXJubURKUWVmc2dO?=
 =?utf-8?B?ejFYaHkrZFdLL2Y1VWFOdnBYUHdKVElmNlBnRGgzVkxNT2htOUp5eHgvbThR?=
 =?utf-8?B?VzNuaVpHQzZvaFZIYi94bFlrVlkzNW1xVnJ4RnBveFJLWW9VNVBGTHNHS3pw?=
 =?utf-8?B?aXk1UVB2NENYM0xHaFBTQ1ZsZVpmOVRrYk5aanZxc2ljSXNUV3orY3VWZmYr?=
 =?utf-8?B?TGdTK3dIdkRnUjcwTmFiVWNTU0hiS2cxUWp1UnJlNk1GWTMwOHdLVTBGYzFI?=
 =?utf-8?B?UkprdVpybStFMGdFV2YwYmMwcTNacXBxZ2lBVkdISlFOVXR3WmRtQVNEOWpR?=
 =?utf-8?B?NTM1cGY4WmdiNU5wcXFUdVRibVBjSVpIYUJxQSsyUHlaSUU5NnpudVlFWXBT?=
 =?utf-8?B?RU5PM3E1YVM2d2xUQjZYb2VQRnptR0hzd2RrcXZuTDV6dTRPcmQwK0pKKzgw?=
 =?utf-8?B?bUo0a0pneUdDcnQ3NDhMZGl2RFA2V2p3UCtmclhFZEdSdEVOQ2VZZWVZeVNL?=
 =?utf-8?B?eGhSeFA2WENrMUQzWHVRY3pRaGdMUFI3QXpXU1lYcTFkMEpuazNGNjI4UGRF?=
 =?utf-8?B?WFdteXdtbDgwZDVXUlFxTE5IUXdwbzhRbGpRUkxjYWRFbXVuU3JsZFBCUUVy?=
 =?utf-8?B?Wm9SNHVwRWhpeHJoRjlKeTQ4ZXFKRTlhaTdaZUx3TTJkeU13VVZJTEJpWTRW?=
 =?utf-8?B?Q3lnNzkycmo3ODcxNXJjQ3kyNEVUOW5kSFFDTDl3U0g1Z3o4WGtqQjlYVmlm?=
 =?utf-8?B?NjdXL04rUURrZWN2bjU4MVYvY201OFJnMGR4bTJrSG9nc2R5czF0cFRveFY2?=
 =?utf-8?B?bG4vQ2ZIZDI4VU9EbEE3Yk05eWs1UEdndWxHVlNyalBtVlVCMThwaTlOUFBO?=
 =?utf-8?B?MEZlWVplMkVkaVlZMmxGVWF6Vktsd2RHZlNzQy9IU25qS0RTNmM5Zlh3bStY?=
 =?utf-8?B?dFFVVldTQjVlcjBvZnhHSFB4SHhhK0NqTFR3alR6RXI3dUM0d1FpS0t5VmhC?=
 =?utf-8?B?MUhiY3V2R1ZFTTBUdXd3OHZtRWQ1Yi9WYjRvMkJLMFJsdEEydURnTHplQlA1?=
 =?utf-8?B?QmNFbWFyd05iZUJ3aHdTZnN1cHg5M0ZabHVLSXBuZ2sraDVDMEpwOXNPKzlw?=
 =?utf-8?B?YzJRb3M4TFVjY3U3eGpGM1kyWE1kY2orVzZaTFNDYkVmRmQwR3VkRVlxc1ZR?=
 =?utf-8?B?NERhUnFsTkNrR3ZRcDJyaDczeTRpdWtuSk8zNnIxcE5GZG1QWmlUTksrcWRG?=
 =?utf-8?B?dnd3M2Jic0lDU1pacms1OFJkZm9lRnh1akIvRnBQMEVVY3dNT0xWbXgyK3N6?=
 =?utf-8?B?emVHck1IdEJvekxCUE9kYlMreUEyUGg3TEFINXFnMnE3MXZ4SG9aejZTbnlz?=
 =?utf-8?B?WVlGVGgvUzB4WjJMZk1LNXRKelJFa2ZaWkk4cUZBalJhSTVIY0w2TytYbFFC?=
 =?utf-8?B?R29SY0liZzBtVlFRT3ZsRVZoVjBnMmhRNW9TVnlLdExSaUhOa0oxTnR6VzdX?=
 =?utf-8?B?WFA4T2doMnZ6bSttNkRxK3Vrd3ZiZk1KVE8wN3JvNWI4S2FjRW1QdlM1USty?=
 =?utf-8?B?N1J3MjBoangxY21RVkREcGpCNmdtd2NZd05SamJhUnVnUmN3OHRmTWd6MUhN?=
 =?utf-8?B?MUpmVm5DbEFjaWJLWjRlVUpHR1FSSUxrUyt2TU0wZmI5V0pvRmliV0owTG1J?=
 =?utf-8?B?S3JjT3dxQTlxZTdheWgwR2w1N0xSYWE5SW1Yd3VtMUdNNjJabm1ZUkxCdzFo?=
 =?utf-8?B?c0swVitsY2dDWU9IMCtobzQ1NGFIZkM0U3ZaNEQwU3dVTnpUZkRaSkQrRm5R?=
 =?utf-8?B?MGNHckYxcGFldXIzRWc3TnRBZ3ZDMTkwZ0FmVmdxa2MzL2J0NkNCem5YNnpB?=
 =?utf-8?B?SmV3cFRSWWZVZFJPa25KRFA5cDRIY214eVUvTEtuT09teU95OWpjM080VkM4?=
 =?utf-8?B?OXFrTE9wOFhQc0tzejFCcWU2K3VNNmMvSG9uNlpWNGkwOXNiVW81Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 837ccb74-9d8c-4847-9f89-08de7eb9d2a2
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 15:29:30.1901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YWBDZz4nc8ZqbUI8TcOlZvEssWjg5aZowXblsR9LyJgXXoh1rnaZNdbZTNl3lSZpaDvp487q5ke5H187yZlqDH01XBykGDV1vvf6EQrNwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5536
X-Rspamd-Queue-Id: C021F2538E4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 10/03/2026 10:26 am, Jan Beulich wrote:
> On 04.03.2026 20:53, Kevin Lampis wrote:
>> struct cpuinfo_x86
>>   .x86        => .family
>>   .x86_vendor => .vendor
>>   .x86_model  => .model
>>   .x86_mask   => .stepping
>>
>> No functional change.
>>
>> This work is part of making Xen safe for Intel family 18/19.
>>
>> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
>> ---
>> I couldn't find any information about these Intel family 6 processors:
>>   model 0x5d: /* SoFIA 3G Granite/ES2.1 */
>>   model 0x65: /* SoFIA LTE AOSP */
>>   model 0x6e: /* Cougar Mountain */
>> Should I add them to intel-family.h?
> We should keep that in sync with Linux, I think, so "no" unless you mean to
> first have respective entries added there.
>
> 0x5d is listed in the SDM, so I'd recommend keeping the entries (using IFM()
> directly for the time being).
>
> 0x65 and 0x6e aren't listed in the SDM, so may never really have hit the
> public. Respective cases can perhaps be dropped, but such dropping would
> again likely better be done in a separate change.

These are the 5G basestations I mentioned during the x86 meeting.  Linux
has declined to take take these models into intel-family.h because
they're not general purpose.

I suggest we drop them, including 0x5d.  I can do a separate patch.

>
>> @@ -3073,71 +3077,71 @@ static bool __init has_if_pschange_mc(void)
>>       * IF_PSCHANGE_MC is only known to affect Intel Family 6 processors at
>>       * this time.
>>       */
>> -    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
>> -         boot_cpu_data.x86 != 6 )
>> +    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
>> +         boot_cpu_data.family != 6 )
>>          return false;
>>  
>> -    switch ( boot_cpu_data.x86_model )
>> +    switch ( boot_cpu_data.vfm )
>>      {
>>          /*
>>           * Core processors since at least Nehalem are vulnerable.
>>           */
>> -    case 0x1f: /* Auburndale / Havendale */
>> -    case 0x1e: /* Nehalem */
>> -    case 0x1a: /* Nehalem EP */
>> -    case 0x2e: /* Nehalem EX */
>> -    case 0x25: /* Westmere */
>> -    case 0x2c: /* Westmere EP */
>> -    case 0x2f: /* Westmere EX */
>> -    case 0x2a: /* SandyBridge */
>> -    case 0x2d: /* SandyBridge EP/EX */
>> -    case 0x3a: /* IvyBridge */
>> -    case 0x3e: /* IvyBridge EP/EX */
>> -    case 0x3c: /* Haswell */
>> -    case 0x3f: /* Haswell EX/EP */
>> -    case 0x45: /* Haswell D */
>> -    case 0x46: /* Haswell H */
>> -    case 0x3d: /* Broadwell */
>> -    case 0x47: /* Broadwell H */
>> -    case 0x4f: /* Broadwell EP/EX */
>> -    case 0x56: /* Broadwell D */
>> -    case 0x4e: /* Skylake M */
>> -    case 0x5e: /* Skylake D */
>> -    case 0x55: /* Skylake-X / Cascade Lake */
>> -    case 0x7d: /* Ice Lake */
>> -    case 0x7e: /* Ice Lake */
>> -    case 0x8e: /* Kaby / Coffee / Whiskey Lake M */
>> -    case 0x9e: /* Kaby / Coffee / Whiskey Lake D */
>> -    case 0xa5: /* Comet Lake H/S */
>> -    case 0xa6: /* Comet Lake U */
>> +    case INTEL_NEHALEM_G:
>> +    case INTEL_NEHALEM:
>> +    case INTEL_NEHALEM_EP:
>> +    case INTEL_NEHALEM_EX:
>> +    case INTEL_WESTMERE:
>> +    case INTEL_WESTMERE_EP:
>> +    case INTEL_WESTMERE_EX:
>> +    case INTEL_SANDYBRIDGE:
>> +    case INTEL_SANDYBRIDGE_X:
>> +    case INTEL_IVYBRIDGE:
>> +    case INTEL_IVYBRIDGE_X:
>> +    case INTEL_HASWELL:
>> +    case INTEL_HASWELL_X:
>> +    case INTEL_HASWELL_L:
>> +    case INTEL_HASWELL_G:
>> +    case INTEL_BROADWELL:
>> +    case INTEL_BROADWELL_G:
>> +    case INTEL_BROADWELL_X:
>> +    case INTEL_BROADWELL_D:
>> +    case INTEL_SKYLAKE_L:
>> +    case INTEL_SKYLAKE:
>> +    case INTEL_SKYLAKE_X:
>> +    case INTEL_ICELAKE:
>> +    case INTEL_ICELAKE_L:
>> +    case INTEL_KABYLAKE_L:
>> +    case INTEL_KABYLAKE:
>> +    case INTEL_COMETLAKE:
>> +    case INTEL_COMETLAKE_L:
>>          return true;
>>  
>>          /*
>>           * Atom processors are not vulnerable.
>>           */
>> -    case 0x1c: /* Pineview */
>> -    case 0x26: /* Lincroft */
>> -    case 0x27: /* Penwell */
>> -    case 0x35: /* Cloverview */
>> -    case 0x36: /* Cedarview */
>> -    case 0x37: /* Baytrail / Valleyview (Silvermont) */
>> -    case 0x4d: /* Avaton / Rangely (Silvermont) */
>> -    case 0x4c: /* Cherrytrail / Brasswell */
>> -    case 0x4a: /* Merrifield */
>> -    case 0x5a: /* Moorefield */
>> -    case 0x5c: /* Goldmont */
>> -    case 0x5d: /* SoFIA 3G Granite/ES2.1 */
>> -    case 0x65: /* SoFIA LTE AOSP */
>> -    case 0x5f: /* Denverton */
>> -    case 0x6e: /* Cougar Mountain */
>> -    case 0x75: /* Lightning Mountain */
>> -    case 0x7a: /* Gemini Lake */
>> -    case 0x86: /* Jacobsville */
>> +    case INTEL_ATOM_BONNELL:
>> +    case INTEL_ATOM_BONNELL_MID:
>> +    case INTEL_ATOM_SALTWELL_MID:
>> +    case INTEL_ATOM_SALTWELL_TABLET:
>> +    case INTEL_ATOM_SALTWELL:
>> +    case INTEL_ATOM_SILVERMONT:
>> +    case INTEL_ATOM_SILVERMONT_D:
>> +    case INTEL_ATOM_AIRMONT:
>> +    case INTEL_ATOM_SILVERMONT_MID:
>> +    case INTEL_ATOM_SILVERMONT_MID2:
> Can the Silvermonts please be grouped together?
>
>> +    case INTEL_ATOM_GOLDMONT:
>> +    //case 0x5d: /* SoFIA 3G Granite/ES2.1 */ // XXX ???
>> +    //case 0x65: /* SoFIA LTE AOSP */         // XXX ???
>> +    case INTEL_ATOM_GOLDMONT_D:
>> +    //case 0x6e: /* Cougar Mountain */        // XXX ???
>> +    case INTEL_ATOM_AIRMONT_NP:
> Same for the Airmonts and ...
>
>> +    case INTEL_ATOM_GOLDMONT_PLUS:
> ... the Goldmonts.

We need another sync to intel-family.h.  Christian made a correction or
two in this area.  I'll do a patch.

~Andrew

