Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A46DE1D18EA
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 17:16:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYt6t-0006pO-4e; Wed, 13 May 2020 15:15:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dqM3=63=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jYt6r-0006pJ-0e
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 15:15:49 +0000
X-Inumbo-ID: 9fb49acc-952c-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fb49acc-952c-11ea-9887-bc764e2007e4;
 Wed, 13 May 2020 15:15:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D6241AC20;
 Wed, 13 May 2020 15:15:49 +0000 (UTC)
Subject: Re: [PATCH] x86/build32: Discard all orphaned sections
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200512191108.6461-1-andrew.cooper3@citrix.com>
 <a1d1135a-8f9c-81c3-5fc8-bbc3787ebd0f@suse.com>
 <e11b2b5b-5504-f2a3-f1d8-986bc97a4b78@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <875d5449-dde0-e675-fb1e-c2b3ed238674@suse.com>
Date: Wed, 13 May 2020 17:15:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <e11b2b5b-5504-f2a3-f1d8-986bc97a4b78@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jandryuk@gmail.com>, Stefan Bader <stefan.bader@canonical.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 13.05.2020 17:00, Andrew Cooper wrote:
> On 13/05/2020 10:13, Jan Beulich wrote:
>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>>
>> On 12.05.2020 21:11, Andrew Cooper wrote:
>>> @@ -47,6 +47,14 @@ SECTIONS
>>>           *
>>>           * Please check build32.mk for more details.
>>>           */
>>> -        /* *(.got.plt) */
>>> +        *(.got.plt)
>>> +  }
>>> +
>>> +  /DISCARD/ : {
>>> +        /*
>>> +         * Discard everything else, to prevent linkers from putting
>>> +         * orphaned sections ahead of .text, which needs to be first.
>>> +         */
>>> +        *(*)
>>>    }
>>>  }
>> To be honest I'm not sure if this isn't going too far. Much
>> depends on what would happen if a new real section appeared
>> that needs retaining.
> 
> Anything which is important enough will result in a linker error.
> 
>> Granted the linker may then once again
>> put it at the beginning of the image, and we'll be screwed
>> again, just like we'll be screwed if a section gets discarded
>> by mistake.
> 
> This way is more likely to result in a build failure than an inability
> to boot the resulting build of Xen.
> 
>> But it would be really nice if we had a way to
>> flag the need to play with the linker script. Hence perhaps
>> on new enough tool chains we indeed may want to make use of
>> --orphan-handling= ? And then discard just .note and .note.*
>> here?
> 
> The only valid option would be =error, but experimenting with that yields
> 
> ld: error: unplaced orphan section `.comment' from `cmdline.o'
> ld: error: unplaced orphan section `.note.GNU-stack' from `cmdline.o'
> ld: error: unplaced orphan section `.note.gnu.property' from `cmdline.o'
> ld: error: unplaced orphan section `.rel.got' from `cmdline.o'
> ld: error: unplaced orphan section `.got' from `cmdline.o'
> ld: error: unplaced orphan section `.got.plt' from `cmdline.o'
> ld: error: unplaced orphan section `.iplt' from `cmdline.o'
> ld: error: unplaced orphan section `.rel.iplt' from `cmdline.o'
> ld: error: unplaced orphan section `.igot.plt' from `cmdline.o'
> 
> which I think is going to get us massively bogged down in toolchain
> specifics.  I'm not entirely convinced this would be a good move.

That's ugly indeed; especially the .rel.* sections are worrying to
appear there. Hence patch as is
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

