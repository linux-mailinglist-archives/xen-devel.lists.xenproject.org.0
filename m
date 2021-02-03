Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C75930DE48
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 16:37:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80956.148582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7KDC-0002oB-7f; Wed, 03 Feb 2021 15:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80956.148582; Wed, 03 Feb 2021 15:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7KDC-0002nm-3v; Wed, 03 Feb 2021 15:36:58 +0000
Received: by outflank-mailman (input) for mailman id 80956;
 Wed, 03 Feb 2021 15:36:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0lb=HF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7KDA-0002nh-4I
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 15:36:56 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 581f6b03-a22e-4b01-a123-c422c3c327d7;
 Wed, 03 Feb 2021 15:36:54 +0000 (UTC)
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
X-Inumbo-ID: 581f6b03-a22e-4b01-a123-c422c3c327d7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612366614;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FX6FwoNVhsfj7C4kPKB0/qKC8cFRTtjcevGezhqt2Hc=;
  b=SEMB3iH6UcOGL69f9pheFtQiR281xGj/FYhfjchzpr+O38Fs9i8AYyfq
   cRSQOAGJ0tIymGt2VB2OQWOnUA/ByJfzBH9GMcUlnHBcwqLrMLk+GFJAC
   8bqFszcJv+N45hjAqWsKkwF4IPP2A310WOJYuudTNFQS3CQwlTyr+Z7V+
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZolqkgHUWX0jB/D7M9wWi4VoA0dBkR7wd0TFtTlkrsgXXDWTekACBG68hDYis1efwPNCEc96wg
 d4Oxq7loGDiu36OPc4/DXVPFImgpoeKg2J0cpezQKK2BK8brHWSjZH/9F+hWmpMsQcGw74HHOP
 DiQemBEP4AUk7P9gYLvHmq0BV7ZX3e5VcoKFMqsWqkgXp8Z7IQLD3l8EaufevenfdNQowHRWGq
 O7YYWrCvJNq5UXZGuJh3f1cpBZpIuTxWnr/EYPDjyM8Azt5DZxTYcvuS4LO/y8wqH4sQcZXbRZ
 s94=
X-SBRS: 5.2
X-MesageID: 36422234
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,398,1602561600"; 
   d="scan'208";a="36422234"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbTSkS8p7a3x6aIMa6q9zCGaZNfT7UK0YZkEijCUI2tFpx/M1TZuMeoyPM8RxeSVxpfrNv0FYqc5NVjmu24ZjpjDrjnpZXl/pPr5BYLRdeKKjaeQbEChxhdR8Qo+LF949h0uwLq8gHMmEoNrYzKVi5NoSnfABuhHh7Uv5bDcLs9waR7GQdyRgU7g0ABUGnMAGSWbdGNjc8AJ34ktXIFNYfn3uPu/KJ6D5LdOnS527GFpceNI9yEEvxagkO6TDgwYC/6a/0jN6DiW84ajcxJY5k3657o7YwD+RpO8RyVOpNXAT4guyZALdUeKtxDEShIcUtO+CHdQZcYys50KbuJISg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FX6FwoNVhsfj7C4kPKB0/qKC8cFRTtjcevGezhqt2Hc=;
 b=Hpy1iAc1wqLdfolBdK3iGn1noCj4Wl9y2J7gIfUVSC/46/krs1uzlFppYHUXXUbE7uAaiMMxBhs1MzcWIVM0wNTVOz6Nkb1ajPVWgiZHUKPHseKEbR12S7LKuOgpEzKY0T7ZCmMRJghzTrCbm9g7QQicG5MZOh2twbfcR+dZcPOfqXzUQ6pz2ckDgHJwDiMmVOeRp3aaSZdCf6wJOrmW/UrrR7ecjsOrwJiFvhaCcxhG1fEw4hvK8Wn8Hs8xwcbcKXUp5koYVJbW0n2AKI1uoUygb3IvJ+1qBndeVum7p3Eug4WWYwSDGlMlOVOiGIIpW+AWfqp+AqBbRNG5rbTB7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FX6FwoNVhsfj7C4kPKB0/qKC8cFRTtjcevGezhqt2Hc=;
 b=jgd3fpUDVPpZIX9EZhrqmtI3SS32PFyo0UG+oS4wBA4VhVsYT/dXZYyu1PIkrPgs6MmzU7XPFQYwsRWyBMC50oSD9FbjgSIZ2yALD8YIcrhuHdlhyTZN4xUunWfMfcLWHNMAd7nrvp+Zy34VkuboiwcaSirFQo2jFTJJFYRusa4=
Subject: Re: [PATCH] x86/string: correct memmove()'s forwarding to memcpy()
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <a23d148a-25d0-cc5b-6050-88345188ef5a@suse.com>
 <0d537de8-09f4-9971-466f-8bf42964171e@citrix.com>
 <1556e428-be59-2035-8406-a54576c4d41d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <84f171f0-39b4-9ee0-9536-d8e6ff794dbf@citrix.com>
Date: Wed, 3 Feb 2021 15:36:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <1556e428-be59-2035-8406-a54576c4d41d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0489.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::8) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9aa1bba-14f5-4337-dd95-08d8c8597f70
X-MS-TrafficTypeDiagnostic: BY5PR03MB5064:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB50648C4AC3B8A4784AAED783BAB49@BY5PR03MB5064.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yg63cnFXw3GTaeqI5s1cN5cf5TNB2YgPvIPWJg2rEJtdMbeqcv12Q5TfprsVvvkZCn8PoVigvqm1ykVTE1Vmj5l/BkbBSBW5P/U5goJFY4SqkexUOydHAVG7k7zu0bRcjFcyXsVpCJ8iCI3Tn1thlm3EgU8Oi3ctfbzRSRlwaTsBvhDhf40dJF/xrIfmAbN9Tj3qNQF0C0OZCwiOOU754EYofBMTcB2OXMoxh48HKSvXDN1csCc/y85mMgpjrNgNGKwSOhvn/8jR0JujbLpZ+SB9mUf9p4QsssfHPIAkXeqjCD7wSZpatQv575wVX6hVRuE0Oo6Zjz2ILsby+O5jBmE2GzdhKQQZ9vAOa7fRBJyq2TYZebRFCJPm4FOUsGLk8Td7mqmGhM9x5XnrS9hSzoSE4IXKFUl6Y3D5icrcFlFEzVOR6WxLljw5YJ2cY9LvMWl3Ie0fTVPaSyk+0A4Oy7ESD4JAhuyRrKqSoOjHToWqJ1PuhWMigyEYS8bS/7HdYfVRH3TQm1DcDsgMXPcPhO2LnxrrSQZw2xmkBVmtzZZIFp8CnGYQG3FTjgX6PKnrUjBoWILzvCI00sNPUFjGQRjMK/BzIcQcuQd07/5oGQs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(66476007)(16526019)(8676002)(6916009)(54906003)(6486002)(53546011)(26005)(186003)(66946007)(86362001)(36756003)(66556008)(4326008)(478600001)(2616005)(8936002)(316002)(956004)(5660300002)(16576012)(2906002)(31686004)(31696002)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SlVMWlFaYXU3SG1WQUpvWStudWs5OHVjRXg0c3RwWExseW1FRjN2MXhRUi9B?=
 =?utf-8?B?cWVFSEZpV05PSmhlYnhYbzR6cGp3czZZVTJRTG1vTEdnR1RxVDZuS0ROR2w1?=
 =?utf-8?B?Y0xJdE5IbzYyanphb3JHWDJFQU82OW5zanN1K1N4Sk5BYUgzMjNuWU4zSmVB?=
 =?utf-8?B?bnZ3Z0hmSG12czN3TGVJcjlLU1JhVFNIK2xwenBQdFhOZGMxeVlCY3AzRFla?=
 =?utf-8?B?KzdDKytaWE8xeGR5aGFkeXMzTlhISFZYQjRWc2lhVm9WUisyODZIeHpZM2Ju?=
 =?utf-8?B?ZVU1c0gyVUVNMUxKWmVnYVlhc2FaaGxFODhJdzhtT0lYaDZzVXBTbHpaM0N1?=
 =?utf-8?B?QVV2WkZsZFVjL0psTHRGNURFanJLQUd1SXU1Nmd1eTlPTmpaNTNMbk90dXlM?=
 =?utf-8?B?VVFHOFgvRDBXMURDRVdRZDVmc1pTcTNLaGt4V3oxQ1Q3aVcvejl2TzJGUGtx?=
 =?utf-8?B?RDZQdFhMZUh0cFo1Ymc2RXdheEhHV2h3N216SmZOa1p5Y2dQeVZpVDAya1I3?=
 =?utf-8?B?bDJTQkRkS3NGdUNxQTM3amhOMmxLZWdvelNOcmZUUWZJYkFrR1dIaVZDT1Mw?=
 =?utf-8?B?MGp3ZWxreGphbkNjVTRVVGpmeEF3SlZhRHIySUliQWhFVjNsT25HampFOXVi?=
 =?utf-8?B?TWtnbGpHM1Jya0dqOUJCUWt6eGpHaG56eXFCTjhBRnl1di9BWm1PSlFIc1ZL?=
 =?utf-8?B?OXkwaTZRU1JuK01RR3hlTWpSd01FVGJtUWN2RUMvT09SaVMrS1RPbENDOE9R?=
 =?utf-8?B?ZDNHS29US1ArM204TXYrQWZJOXFGTlFDQ1Q2eVRXSWpkRE9pNUV4YmQxLzNv?=
 =?utf-8?B?TnhyOUNPTmoxUDJoVTFYYzZaVVUwb2loNGhJdTI4TGd6aUp6OHcwR2kvSnNt?=
 =?utf-8?B?MFR1ZWljRklySWNpekprMUttY1hhR2hOcFFJRlZlNExkK3hXRnR3SDVZRnFm?=
 =?utf-8?B?RGJ5VGh6WHdSdDh5WTNGaStYd1l3RnNNU2J0WDMyZzlBQ2p2Z3JhUm5rWHNz?=
 =?utf-8?B?UlIxVmNOb3BhVWNJTWFLL0UrSXA5SUJ5MVh1aWJneXdwNTl5Qm9ZMks0dTBr?=
 =?utf-8?B?WFQ4U0tFN3NOY3prOG0rc1BsV0JOT3NaNUtNS1VGT0M2enJUeWd4MFJ6VWJM?=
 =?utf-8?B?SW9HbUZuMnpsYTJ3ZVNkQ2hiTFJwL1A0Q2xLaHVIY3g3elpVODRMSHliMDlz?=
 =?utf-8?B?eVNuNXdWamd5ZDJManNhd1V2SmtuUVRXVEdHTkVKTm1vanBBYkIyOWg3eldI?=
 =?utf-8?B?b0FQUEJIZmp2RVJIS0RRSGNLWTdzQ1ZKWGVQVFJFUm05WVRscmwwbHFKVnZ2?=
 =?utf-8?B?WnVucW84NU5FVVFoR1ZFOWxxN1hMN2RYdEJOV0g2d2pMcGdiRHY5QzdmTmRM?=
 =?utf-8?B?eC9od3BYNENHSkdlTzVTQTJkYkRmQXN2US96cnlQMDJtc2tVNW1QTVhGRVlF?=
 =?utf-8?Q?rXIgUUxH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9aa1bba-14f5-4337-dd95-08d8c8597f70
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 15:36:39.0881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VyZXZ/xCvIbd0Uyc0KiVSo0uwesOk5/Qxbt4Cgi4wIo7AIl6IkARuuQaFbRv7XMqP9vB5I/c/+FRW1zFnnGCZYVh0DMHo19rzdhepdoBJO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5064
X-OriginatorOrg: citrix.com

On 03/02/2021 15:31, Jan Beulich wrote:
> On 03.02.2021 16:01, Andrew Cooper wrote:
>> On 03/02/2021 14:22, Jan Beulich wrote:
>>> With memcpy() expanding to the compiler builtin, we may not hand it
>>> overlapping source and destination. We strictly mean to forward to our
>>> own implementation (a few lines up in the same source file).
>>>
>>> Fixes: 78825e1c60fa ("x86/string: Clean up x86/string.h")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> I agree that the current logic is buggy, but I'm not sure this is an
>> improvement.
>>
>> You've switched from relying on GCC's builtin to operate forwards, to
>> relying on Xen's implementation operating forwards.
> Is there such a guarantee for the compiler builtin? If so - no
> need for this patch indeed. But I couldn't find any doc saying
> so.

I've never seen it emit anything which isn't a forwards operation (i.e.
I think the compiled result tended to be safe in practice), but C's
flexibility does explicitly permit a backwards implementation.

>
>> At the very least, can we get a code comment stating something like
>> "depends on Xen's implementation operating forwards" ?
> No problem at all.

In which case Acked-by: Andrew Cooper <andrew.cooper3@citrix.com> to
avoid a round trip.

>
>>> ---
>>> An alternative would be to "#undef memcpy" near the top of the file. But
>>> I think the way it's done now is more explicit to the reader. An #undef
>>> would be the only way if the macro was an object-like one.
>> I chose not to use undef's to avoid impacting the optimisation of other
>> functions in this file.  I can't remember if this made a difference in
>> practice.
>>
>>> At least with gcc10 this does alter generated code: The builtin gets
>>> expanded into a tail call, while after this change our memcpy() gets
>>> inlined into memmove(). This would change again once we separate the 3
>>> functions here into their own CUs for placing them in an archive.
>> As (perhaps) a tangent, how do we plan to provide x86-optimised versions
>> in combination with the library work?
> By specifying the per-arch lib.a first.

Ok - good to hear.

>>   We're long overdue needing to
>> refresh our fast-strings support to include fast rep-mov/stosb.
> That's pretty much orthogonal to the code movement though.

Yes, but it does need doing.  We're perpetually playing catchup, and
there are meaningful improvements to be had for logic such as
clear_page() which is fairly poor, optimisation wise atm.

~Andrew

