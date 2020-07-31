Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 551142343BD
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 11:54:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1RjW-0004Jt-Am; Fri, 31 Jul 2020 09:53:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k1RjV-0004Jo-CD
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 09:53:45 +0000
X-Inumbo-ID: b78c4800-d313-11ea-ab96-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b78c4800-d313-11ea-ab96-12813bfff9fa;
 Fri, 31 Jul 2020 09:53:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 373A4AB9F;
 Fri, 31 Jul 2020 09:53:55 +0000 (UTC)
Subject: Re: [PATCH] x86/vhpet: Fix type size in timer_int_route_valid
To: Eslam Elnikety <elnikety@amazon.com>
References: <20200728083357.77999-1-elnikety@amazon.com>
 <a55fba45-a008-059e-ea8c-b7300e2e8b7d@citrix.com>
 <278f0f31-619b-a392-6627-e75e65d0d14f@suse.com>
 <076df48e-0010-bb8d-891f-dc89aa4b9439@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cd9b283b-5c10-d186-93ef-8d8c07302e26@suse.com>
Date: Fri, 31 Jul 2020 11:53:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <076df48e-0010-bb8d-891f-dc89aa4b9439@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <pdurrant@amazon.co.uk>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.07.2020 10:38, Eslam Elnikety wrote:
> On 28.07.20 19:51, Jan Beulich wrote:
>> On 28.07.2020 11:26, Andrew Cooper wrote:
>>> --- a/xen/include/asm-x86/hvm/vpt.h
>>> +++ b/xen/include/asm-x86/hvm/vpt.h
>>> @@ -73,7 +73,13 @@ struct hpet_registers {
>>>       uint64_t isr;               /* interrupt status reg */
>>>       uint64_t mc64;              /* main counter */
>>>       struct {                    /* timers */
>>> -        uint64_t config;        /* configuration/cap */
>>> +        union {
>>> +            uint64_t config;    /* configuration/cap */
>>> +            struct {
>>> +                uint32_t _;
>>> +                uint32_t route;
>>> +            };
>>> +        };
>>
>> So long as there are no static initializers for this construct
>> that would then suffer the old-gcc problem, this is of course a
>> fine arrangement to make.
> 
> I have to admit that I have no clue what the "old-gcc" problem is. I am 
> curious, and I would appreciate pointers to figure out if/how to 
> resolve. Is that an old, existing problem? Or a problem that was present 
> in older versions of gcc?

Well, as already said - the problem is with old gcc not dealing
well with initializers of structs/unions with unnamed fields.

> If the latter, is that a gcc version that we still care about?

Until someone makes a (justified) proposal what the new minimum
version(s) ought to be, I'm afraid we still have to care. This
topic came up very recently in another context, and I've proposed
to put it on the agenda of the next community call.

Jan

