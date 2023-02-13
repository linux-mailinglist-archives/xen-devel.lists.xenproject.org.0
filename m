Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B81669466C
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 13:58:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494449.764512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYPK-0001zm-D5; Mon, 13 Feb 2023 12:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494449.764512; Mon, 13 Feb 2023 12:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYPK-0001y4-AJ; Mon, 13 Feb 2023 12:58:10 +0000
Received: by outflank-mailman (input) for mailman id 494449;
 Mon, 13 Feb 2023 12:58:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRYPI-0001xy-OG
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 12:58:08 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe13::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fba8f95-ab9e-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 13:58:07 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6827.eurprd04.prod.outlook.com (2603:10a6:10:f8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Mon, 13 Feb
 2023 12:58:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 12:58:06 +0000
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
X-Inumbo-ID: 0fba8f95-ab9e-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hAN7OBJRROoaP5W95NIm7Yn+vmbamXW8GIrWQJLOlsUw7A5EKGidaK0spI/XlhFfLF4Zdef5S/gADJAQhBXCK3WbjHNBHOlvAYMEfNlWsl9ck4EouXGqyR+hNzjeGSiqPInr9Mk28FKt/omUc1wbiiTnkjlIY1SPrNhU+/zYG9/81+pH2yJqU79+UnNMHF+NHTzzIeWFV3SPmz8rYzsC3nV/VfitwtUs82qPe9V47o8VtH28zxMTUO46srVANSc+hazTLoeG89+7V9NoZeV7BkF8mlDGDe7OFV+ZfijOPkae0zcoJbTCxpH+qWZo8Oq9eG6/bxiwIZKhHKFD4HanuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSqCTzbQHgjNRQrU+5f4nfSA1DCHLoFe1pgl2iU8HYU=;
 b=aIbyDBuIhYlcJ9HKSb5m1onvPOtBvxAMUzkYamAPH8P3jAJ3sSQFFfe2FTpLx61iOfzNDwwXLhUicwL4B1wLp8EOrRKkQyEZEeIhE+23twl8Ws6ewBp9QrXg76rRiz3eIky2/HjmGVhLJLh2MDVkR7zeAAU43dTxuTAUdt0geK+qc/f5cpJM9LaJ/j6kctMTz98pkHHys2yOlX3S4I+j8+IssPEF+3E9WpRtXgBzy2NLvNBMB3GnTnYSWnR7tgr7gKk7FoP8iMhII5BXMvHdFKN+Rtd/YGAXyNkLpjwz9SZko/zKHvCI2Us3YVMqSaMm7KC/QwoXUMCMLjbsxV5CqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSqCTzbQHgjNRQrU+5f4nfSA1DCHLoFe1pgl2iU8HYU=;
 b=k/2NcYzsj7OKhwhiHBmC76Xgxt46cJLpBUfxH5w0Sn2T5fMZzD0Twv6+vtyNqanZ3aLhQhWq0Q7x3w2x5BHWJt5n4nzH2n4J0WLa0HH/Ts3Omt3ZoEgvHDJ/OiAqvEtuNRwhm/aMYA3GmtLLmyccKzfFmaiP7IRco/PNbOH/Em7RKT8ZTvoVsA38KyGBTZsPL0sQeApz6+3Bf1bitHv/632RPFhdkgbF7MML3GOH31MutNmFYASNdMd1ekbLe7PBsVtZNfoHjdl8moZ5XO1BEWuV1Q3PCwEq4qQvJFu1XxussLOfsdEl5lK7mYCUgDLHG73zTvVaQOhskR0v3zPMUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fe6830cb-4d60-c83c-8196-55078f18c6e3@suse.com>
Date: Mon, 13 Feb 2023 13:58:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2] x86/vlapic: call vmx_vlapic_msr_changed through an
 hvm_function callback
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org,
 Xenia Ragiadakou <burzalodowa@gmail.com>
References: <20230207094347.1059376-1-burzalodowa@gmail.com>
 <a1fbb69f-3fb0-3a80-cafe-94b0fdba5a2b@suse.com>
 <c3d5f342-5897-5dbc-22ff-4f52885b3a6d@gmail.com>
 <4c3e3350-b415-3414-c1be-f5d7775ea867@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4c3e3350-b415-3414-c1be-f5d7775ea867@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6827:EE_
X-MS-Office365-Filtering-Correlation-Id: 28ed3f66-4505-4a8e-1ada-08db0dc1f2fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dC1R8z4IKvUbTntH/T4OYvKn5EoD+bS0aEw76+G3H/ZkAMJkEn0cY16ncwKUViFicH9LWqlgNSMbCi8uQs6luwPC5YBQdut5UyjjVhD6cNA0Qg1rzPTPyRPA2wy1u3vZhIuJAhe2ZGmha3z0d7/9n4w7S2FQ0xtgfkFHkJeSBrU+2rZoKSO15NHJu1kN2r94jESKBGok39wScrp2ALw+olG+kY1DuhJtQfoA+HwdOJupAgHcKRhPtj3l0fY0+8FyDBc1yLVOGzUhCOINoEoj26zT2jWH1oO9zEhkdIvehowNt2VcQhdM+IIWcf4Ec04Qo72r1T0xvOWn25haoXvi8ZiiEOxk4bcOrsZgePZdqkF4hErLWXZTeOQH8oEo1N05TscPa38XjpXOgbRNEdFmJxNDTVZ84sp46nXLdvJsP9gFPc9eVs42Wj/AT3VG0X56aVQ0g1clCTml7EjwyABf7nIFQMgagBnZwS2vNQaDbDWTAiu51uvwZtMTTVm+G+1F0RPMvEl6Iv7H0c+UnczUHMNUfIylJ8jvd5VFLC8Rx0gDOej90x11mjjOMFzyF1ARC059Ce9UIJbLyQvX2JAAHJJu+uB16hfzWn5QpS8GWpyNWM7/pqlQOwtRSt4vUD8VSCeylsBNWtBqtzDqbztjdFfHJfZpH/8lgBuXjdRWBT4mhgTCqXJutTfcLsK/Irkaoh4q7rexk91hiGUcLO8eG0H9KsIwxXcQHzwtHhn+QNo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199018)(38100700002)(8936002)(2906002)(4744005)(31696002)(66556008)(6916009)(66476007)(66946007)(4326008)(8676002)(5660300002)(31686004)(36756003)(41300700001)(53546011)(86362001)(478600001)(54906003)(26005)(6486002)(186003)(2616005)(6666004)(6512007)(6506007)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MllDV2dqWStWMTQzWW4vL3JoU0lKemNQeUNJeVZIN0lsRzdWd3I5cjRYYWpI?=
 =?utf-8?B?M0FZUHpRWmxDUlZPTnM5T04rQ0YvaVBwMW02cHd1UzdRelVxREtQdno2UzNv?=
 =?utf-8?B?TStJK2FwcHhNTTZDY3RQd2dnV1FoS0JIYmlsMmt6Umt0bWNOdzFWUEFIbURh?=
 =?utf-8?B?NzFYb0dhSkwzYmJFbi9qSUh4VVR6SlV4bDkwT3JpQ0tldTEzQWNYRmV2bmgx?=
 =?utf-8?B?VDRvbTVVZHkrK0RyNmRSNnk3WDQrSkRRZWI4YlVDUFdmbExKSUwrY2VqZHRW?=
 =?utf-8?B?cFNvdGd0cXR3dkRaa2x0a0JRWEFqb1lRdkp2emFUbitqNE15bVhNbzFZdG5N?=
 =?utf-8?B?SmlSalRtSmxoNTJmNk1Yem5INmNRZ1hhSHZWTW9RUVNmRG5iZU45a1hsYW1p?=
 =?utf-8?B?R1pXSlZwSUVtN0ZGQW9ZakFkSTJtckx2RlVnc2ZiK3pxb0RobnFSeHVKbTZ4?=
 =?utf-8?B?dE1xWXRYNEpXWTNaWmc5ZTN5T3E5QWpwUkpTU0JYRVpHcDRwZnRPVSttYUpE?=
 =?utf-8?B?M3ZUK0x4R2srMmZGandjVEdNQ28rYXpSc1JPYVBxMTJ5MXkyUmlGSWxiU2RS?=
 =?utf-8?B?WWtkbFM2VUFyR05Zc1FRTmNhZndRWDhna1dDVTBuVTdrV3BNOElnMCsycDB0?=
 =?utf-8?B?TG5ydTlBQTFOWlQ3L3pjWVhYQjZZaW53aTBGV0hLOTRpdGRucDc3cXRtMG94?=
 =?utf-8?B?cHROcGZnNXphWVZkM1ZLZGJnMDhYdEROZEZRYWExSElRclRYNmY3VDJUNm1R?=
 =?utf-8?B?ZU8rRmlqOFpEZG5Rd0ZlTUxMUkRPMWNjeGRyUENOZFBiNytQalFkNDlKcm9z?=
 =?utf-8?B?OG4yRm5oTVQrcnluRWZtc0ZjeVkzNFhEWGtxV21UUHZyVVo1c3F6dXY5QzFs?=
 =?utf-8?B?eGI2S0p1TVEycGtjYzhIWWZYVmhUMXBYRUtVT1UrSDFCUTZ2bWZELzdkcE9M?=
 =?utf-8?B?R1JNYXEzNXZiS3Z6bDZFVVVLNkx3M0ErNlZsdnBSeEkrM1pqUGhmd0ZwQmNL?=
 =?utf-8?B?dWNaTHJhcXNCREhPaWMvMDRKMjJhV3h3Szd2OFJlanJXTFg4TFJINkJGZTQ1?=
 =?utf-8?B?RDlkTzgvak83b3ZuYmZ0a0FiMTVaS0R5TGd5dHVNV0JGSUxrNUs5d3VCS0hE?=
 =?utf-8?B?bXJvY2k0MjlHb2YzcGpJVkROWDc0bVJqWDlURU12SjdCS21yK3p3MXBmWGFO?=
 =?utf-8?B?cmcvL2F4bDZHajF5SzVwZVNpalRETHd0QzR3Mnd1UlFBUTBYRE9SYVQ2Y2Nq?=
 =?utf-8?B?V1QwT0FWeE9nbjFxUmYzV2FjZVJVVi9nTlFzdzJHcDA2OUFEZnVmVDNFODVx?=
 =?utf-8?B?T0h6b282aXJvK21PVWNyVkgyYWhpb1hjaVZVcUcwUXZQZUUybEVZK3J0MTBB?=
 =?utf-8?B?R3NtMytBL25oRXN3TlBGN1dxRDZLeW1vU3hUc2g2V3U0VGFYM0h5MGxhY2Q0?=
 =?utf-8?B?dXJnOFFEblYvKzNkZ3lEN3BQbVUraThBazFDVjNDTEFNZkM5TEdtMEhuTlJn?=
 =?utf-8?B?dDViSzJwcXhGM2lFdjhKWUNSUzBIdm5JNGcyL2Y2QmYvQXNOUyt6THhGVFAr?=
 =?utf-8?B?T0hpUXJJL3ZJT25LTlRIb25yNUN2L1gyVDlubDhiR3k4WFN6TEVlbnhLMkRL?=
 =?utf-8?B?NFpDRmV2TEtoREVYbTBXRWV5STdCdjNnay9PVzdyTzJFUUZNa3FiRHF5WmRY?=
 =?utf-8?B?Y0xpTk15eXh2OU5uSTJBS3dRbkgyKytwYkZiMi9HN2hIdlY3NmpDQ1BXQUk0?=
 =?utf-8?B?VnZacmdQVUlmVkUrblZtMUtOQkpsY1Y4bFhpRUhua3hWMitnbmZCZW1tU3hi?=
 =?utf-8?B?eTlDYW50L1R4cllkd0JRWFczcHcrNTJLb3NubmE2U3dTelhZNXJxM0w3NUFN?=
 =?utf-8?B?bVYvR3FJeVBVWXhoeWQ3MHFuWHdNZlZRdzRLakVPOVFTVjUrUE43TFhSTUN6?=
 =?utf-8?B?KzZTbHFnejhrNy9wS2dRYUI5Uy9kMVArZUo3cHVpN20xalhaTlQybTNIZDIr?=
 =?utf-8?B?cmErTXlDRlllQkhDSTJOYzdOcElnQjY0OGJsMGY3cVRVR0JRZUpDRzU3R0dh?=
 =?utf-8?B?bnVyTzBVRTNNOW9MS3hCUHJLTEZzRmlNd3ZIeGkvRFA1b0syNjBXU0tMbHpO?=
 =?utf-8?Q?h+91K7ba5zIgx/prXtrKt4qW6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ed3f66-4505-4a8e-1ada-08db0dc1f2fe
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 12:58:06.3238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IpQrzIB1GNY4sek/5Y/xnV6tlI4CIbgDkCT7usXc/LX4EB111Uyk+cOsXLnbKvV5a+x+BA+3G28iYv3rIcop2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6827

On 13.02.2023 12:05, Andrew Cooper wrote:
> On 13/02/2023 10:54 am, Xenia Ragiadakou wrote:
>>
>> On 2/13/23 12:09, Jan Beulich wrote:
>>> I keep forgetting why putting it on just the declaration isn't
>>> sufficient; I
>>> guess a short comment to that effect next to cf_check's definition in
>>> compiler.h would help).
>>
>> Yes, that would help. I don't know why it is not sufficient placing it
>> just in the declaration.
> 
> Because it's part of the function's type.

What does that mean? Is that any different from e.g. noreturn, which
also is part of the function's type, and the compiler records this when
seeing the declaration. It only ever accumulates (never removes) such
attributes when seeing a 2nd declaration (unless multiple declarations
are otherwise rejected) or, finally, the definition.

Jan

