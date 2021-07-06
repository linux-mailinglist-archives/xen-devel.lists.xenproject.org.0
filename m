Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 108163BC6F4
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 09:07:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150785.278758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0f9d-0007yI-U7; Tue, 06 Jul 2021 07:06:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150785.278758; Tue, 06 Jul 2021 07:06:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0f9d-0007vB-QR; Tue, 06 Jul 2021 07:06:01 +0000
Received: by outflank-mailman (input) for mailman id 150785;
 Tue, 06 Jul 2021 07:05:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0f9b-0007v0-Rc
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 07:05:59 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aed28bb2-2a87-4d50-863d-d8987d106fe7;
 Tue, 06 Jul 2021 07:05:59 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-721VTY5cMUWomGorOp2XtA-1; Tue, 06 Jul 2021 09:05:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Tue, 6 Jul
 2021 07:05:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 07:05:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0032.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 07:05:54 +0000
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
X-Inumbo-ID: aed28bb2-2a87-4d50-863d-d8987d106fe7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625555158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SUpr3RDGFTqGWjEogHhWrI6pokeMjD44aLKIwZvnhh4=;
	b=UWy4XnS5bEIa6c6KNStzxLnzqAaaXPU6T2ppIwDkQElrAc/0N8+9cZwHCzs9bcIT+NPTR2
	d/2G+xgdI7VXqhXzuyaNr/x8s3OaHW1GEpuz5A9uMnTrzj/cZX1/vE+AUdgwk9HWkAsInc
	a98jARwHJTXaCUH9ppoVg+wQvZy2n8c=
X-MC-Unique: 721VTY5cMUWomGorOp2XtA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcEqCrfizHeVNcmJbFCOTfoaEEN0LShy8hAHvAIQI2zZwwgUlQwtgwbCuqntVl9mHxxaBhwyv/lUjzDQmmqdsNNIFUL/dHoIjCjrWXRF1dMyF7/mX89BUl9e6Mv1YILVdwSOaYMMLcxhW+exQlf5Sah420BEtDevTjr55m6rUrJrf+VatVEoFZroUrzLUzRiTw2EiiEE5tJcVd209abql8ftEx0IB8CEYdrbMXfgGeVFnjyjma3LMxe+LK/4Xk2pQy11dU9rolo3K1WQqc24nSTzSYFPucZVVubOYmUSirdLPLsSFyGhwfvyrL7QhnCQP1EYaADKAr/Asm5kn/jJKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUpr3RDGFTqGWjEogHhWrI6pokeMjD44aLKIwZvnhh4=;
 b=fX2PT8IZB1ZO/hVHNVLZ7RFAJM5nUKWoqcxHG56YyLKUkO+0SoKRxvoUQdI7sUq58m8oQUKIbsz9Auv2dIcpfm41imFtmazqRqeBVBg+JPPU05ASsUTH2nQz8nUb2fqwoJ95XYKv5PMhDqP9UBQInubfu76j427F1+xIJFYh4jfFrw3xlaAxCb1j1WF92qucLF6Mxr+JBlKM5KK+p+tnGiA/hcuaxEaWbROcaKJMjqKpfV/aNhx2aAIEWO0s0cvxMQuucvIHhvyWQLK1KfeF8l2GXrLhnHF1KRVGeZYf1jrOZItnkhRHXI5STccwP2ATVpNl4QgCnEg+uGp5jQtYqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 02/16] x86/P2M: introduce p2m_{add,remove}_page()
To: paul@xen.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
 <eaf6f63d-1122-f52d-1147-cda40a9c3387@suse.com>
 <04de95f8-313e-aef3-1cea-599d5526233b@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c527a6a9-f747-4a52-c668-069afdc375ec@suse.com>
Date: Tue, 6 Jul 2021 09:05:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <04de95f8-313e-aef3-1cea-599d5526233b@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR1P264CA0032.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b8d294f-12a4-4937-21b4-08d9404c7f98
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23356CE73695702ED5454DBCB31B9@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mKagGXFULGaz7ymB2+IoA32VuU+ePp0j2bnlioTgIhBAcSxm1jSmyrlgDVrdQgFps8hreBQFt2wUnDfCeuI8UF9Yf6l5I0LdejYuV8gB6xzdE5P+EkIR90Q9LpPFiFk5ImbZJIhGr1WSk4MVCtMBloH0iveGv9eNb7YpHoEGrWS9m4a8tqi48sar91G0gQbmjEv5hy/ZkM7avGpO9TRf/6KzWnsJBS0LrtMItAsAYN9R3o7+oVFLxdTCQoq/ziwH3yjhE8jtx+HVps2kOEKstvY5i+K7gOWNt+4aF+93Ui0dU3WhRA6qtJlhO5FoFcuIw0doCCZ1maZwMqzYNbvfPdnFWObZNAFG1an0VUZqo2HFIDZo3BgjErVFIo/HbKEj53D2RUboJoiGkQslFGPbYTrhdOrfQEDxgRW3ZGZyx6VkzPHqbIZTm4Snx+wwKyoE4FDG6+IRrE7gFFfs+yNC1HGQ7rkBJMDnq2FV7Intz5rv2lIMxAveK9DSzrQK6V/TJCXt8noQ0/bMzV+sVE2YDHHH5BxW4/uep+H4s27PSzWrxDvqh8qzAtbhDyF9zUIT4eiGzRLM70FhXsCd4828QX+44WslyGlGeGzu7GNDIaneBCxbhdbxkqstPDRsm7WI4HUONeFJ/gf0pdyNJ8hmchZGp56KfUZiMNasIo6cb3ae7Gib+a6qtMFQ4Hm1vdIU4DsmIe9F1+RBG0hygHqMYwyhKFJSnodhkaX7VUN3Ueo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(376002)(366004)(346002)(396003)(66946007)(2906002)(478600001)(38100700002)(36756003)(31696002)(66476007)(26005)(5660300002)(66556008)(53546011)(186003)(16526019)(6486002)(4744005)(31686004)(54906003)(4326008)(6916009)(8676002)(316002)(956004)(16576012)(2616005)(86362001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzdHcjNqU3JnNkt4Qm5pMjhoZkIyRzd6cHB3WXdXOXlVZ2ZTMWpRVkw0clh4?=
 =?utf-8?B?aFI1ZW1sK1Z3WFdMUXZBWFNPczJSMHpYeGFIU0xSRU4wMUJIcUl1dU1iT25X?=
 =?utf-8?B?cDhCSzZTMlJqR2xlQ29VVVRVWWw3OVpXZFgwNjhrWXdGVkZCOFZzbFJPbVg3?=
 =?utf-8?B?QzVBS2RtdnlEYUZjS2k4RWFieEczdDBDWkVuOGFxdnIvMWwzd2E3VWd1d0Ra?=
 =?utf-8?B?bEplNjhDdFBLUDJxVEFxdEZJZHlrejgrQzBlZENYL0h3K2NicHo2RmJwaGVs?=
 =?utf-8?B?Qy9IWVh4NHl5SjhjTXo2UVY2anV0YXRoZnB6NGdweGh3SlRGcFBOeDc3TG44?=
 =?utf-8?B?UDg3UmcvN1czOVcrclNFN3V0YnBiRUlnNnd5QkRTWEdXUlA3ekwzalNKdmVM?=
 =?utf-8?B?K1VPTVNWLzdJYlM2bzBVUzVnV0pOSUJ6UXZab1FzaUNYKzV0aUpNcDdHcHhw?=
 =?utf-8?B?dG9rWnVXb3VsUnZDRTZpY2tSQXNjaWQ1RlBCL2ROQXliMW1USFVhMUdYYWNR?=
 =?utf-8?B?OUVXZzBzQ1Fvdi9LWC9Za1p4bzd5RjRkL2JWTzFxMFEzOUoyOHB6UFJmTHY1?=
 =?utf-8?B?elk1TW9ndnUyaldLbWQwYkF3TDNuM3krS0RGU0ZDWmorWlFBdlRVU2hxaVZL?=
 =?utf-8?B?dCtCMDZVMmlTYXlwMkhjdXp3MkVHSlMyZTh1MXFXZFlhOXRFeGNHWFdGM1RM?=
 =?utf-8?B?aTdySnMySGJyOUV1eHZnSmFsZk11K0xNQkcwYTJPLytKS0drUmZwY1RoOGlM?=
 =?utf-8?B?c25xZnFPeGVHRUxJL2xnSkNnRXNHWk5jT0tVZkRLWkhvMHVLMmVYWkdkcldT?=
 =?utf-8?B?K3lIZTI0eElCQzZCaWg1SkthVXhBQzd4TDczZFN6NVM5dnFDRkhuY09Ra0VR?=
 =?utf-8?B?VUtFY2pab2Z2V0Jmd1hwai9HSitqU0hzcDNWSk1HcXVENksyNUNURkxveDMw?=
 =?utf-8?B?b1NFRFNJclQyY09nbGJFM0FJck9ZVVA4K04zWFl2RnB4Vy9FelRVdWlnU01Q?=
 =?utf-8?B?emI0MC9zZzFLOVU2bDkwMXhHQlNyc0M1SFdsY2JVbXpFbGt1TUpFV0Q1U1p4?=
 =?utf-8?B?RWFlZ3k5MWYzQ3FTUDNHbzl3MEEwS1crVGtjN0tDRWJZSyt1TVQvWlMzWnBV?=
 =?utf-8?B?SUUxVWhOTTlwRENYbzlWb3RRSmZabmhOUitPTW1iU0wxVElzaWlyNWszRUFl?=
 =?utf-8?B?NzhZMGFWakNseW12OTdtNk81UDVCTkJkUjV5NTlQZ05ZMTdMME05blhHSTBS?=
 =?utf-8?B?UHliR0JyQlA4aGMxcTl1Zmt6cDE0dGN0Y20zLzFqU0tFcVpaQUZkQlhKMkdP?=
 =?utf-8?B?dHJUbFp2NGx0WTl1NCtnZzY3SWM1d3JVU1lmdW9FeE4yRExBQnVSSXZDT3lS?=
 =?utf-8?B?RmJYbmhpS0htZzh2NnV4amY2QWVJbC91M25GalQ3V05hMkplcHV3TXJOS3N0?=
 =?utf-8?B?Z2pwN1BTNGgyM0lEVjgyNHJJYXI5ZTNXbzRDbmkyNCtuMlU1U1hDNEp4eDhh?=
 =?utf-8?B?TkF1eHhpVUVjV2cyaEV0bVBMSlYxSE5HMXpOeDlNeXgxNWVka0dHVVFETzJ1?=
 =?utf-8?B?d1d4ME5qSEsrT1Z3R3FlNTU3RW43TTEyQU8zcFMrbklDUW9lU3pERmc3ZFlB?=
 =?utf-8?B?R3BBVHI1TGpOTTZ5RndzQVUxMTl2ZXdpTHhVY0hlc2RGa0lqVFlPUW9qSUtl?=
 =?utf-8?B?QWtONFJWeC9HN2FDOExaazk5U1A1U0l5NmFlV1ZHcUgzQ1JvckVyZ2NnV1Nq?=
 =?utf-8?Q?ypt3afYDVLz2okp1yySuabGoJKTuPJXN1QC6vIa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8d294f-12a4-4937-21b4-08d9404c7f98
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 07:05:55.3153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/nk04641uUCGhq16AVlJa8+G1krsKu6e2H8+t7xr5FSqyNJzJNzYoTSNNsZdMfeq2LYmcM2fWNMAvExmFC7lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

On 05.07.2021 19:47, Paul Durrant wrote:
> On 05/07/2021 17:06, Jan Beulich wrote:
>> p2m_add_page() is simply a rename from guest_physmap_add_entry().
>> p2m_remove_page() then is its counterpart, despite rendering
>> guest_physmap_remove_page().
> 
> Did some words get dropped in that second sentence? I can't really 
> understand what it is saying.

Oops - this was meant to be "...  a trivial wrapper".

>> This way callers can use suitable pairs of
>> functions (previously violated by hvm/grant_table.c).
>>
>> In HVM-specific code further avoid going through the guest_physmap_*()
>> layer, and instead use the two new/renamed functions directly.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
> 
> The code looks fine so...
> 
> Reviewed-by: Paul Durrant <paul@xen.org>

Thanks.

Jan


