Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 951521C354D
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 11:10:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVX6x-0004r6-In; Mon, 04 May 2020 09:10:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVX6w-0004fI-D5
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 09:10:02 +0000
X-Inumbo-ID: 0896781e-8de7-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0896781e-8de7-11ea-9887-bc764e2007e4;
 Mon, 04 May 2020 09:10:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CB76EAC7D;
 Mon,  4 May 2020 09:10:01 +0000 (UTC)
Subject: Re: [XEN PATCH v5 08/16] build: Introduce $(cpp_flags)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200421161208.2429539-1-anthony.perard@citrix.com>
 <20200421161208.2429539-9-anthony.perard@citrix.com>
 <62011f46-b208-334a-4070-0bd72cb21d28@suse.com>
 <20200428140119.GC2116@perard.uk.xensource.com>
 <86af7c75-8f8b-db0a-7420-343ccd70fc33@suse.com>
 <20200501143215.GD2116@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e8eb1674-b149-7bd6-a903-673914b40bba@suse.com>
Date: Mon, 4 May 2020 11:09:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200501143215.GD2116@perard.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 01.05.2020 16:32, Anthony PERARD wrote:
> On Tue, Apr 28, 2020 at 04:20:57PM +0200, Jan Beulich wrote:
>> On 28.04.2020 16:01, Anthony PERARD wrote:
>>> On Thu, Apr 23, 2020 at 06:48:51PM +0200, Jan Beulich wrote:
>>>> On 21.04.2020 18:12, Anthony PERARD wrote:
>>>>> --- a/xen/Rules.mk
>>>>> +++ b/xen/Rules.mk
>>>>> @@ -123,6 +123,7 @@ $(obj-bin-y): XEN_CFLAGS := $(filter-out -flto,$(XEN_CFLAGS))
>>>>>  
>>>>>  c_flags = -MMD -MP -MF $(@D)/.$(@F).d $(XEN_CFLAGS) '-D__OBJECT_FILE__="$@"'
>>>>>  a_flags = -MMD -MP -MF $(@D)/.$(@F).d $(XEN_AFLAGS)
>>>>> +cpp_flags = $(filter-out -Wa$(comma)%,$(a_flags))
>>>>
>>>> I can see this happening to be this way right now, but in principle
>>>> I could see a_flags to hold items applicable to assembly files only,
>>>> but not to (the preprocessing of) C files. Hence while this is fine
>>>> for now, ...
>>>>
>>>>> @@ -207,7 +208,7 @@ quiet_cmd_cc_s_c = CC      $@
>>>>>  cmd_cc_s_c = $(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -S $< -o $@
>>>>>  
>>>>>  quiet_cmd_s_S = CPP     $@
>>>>> -cmd_s_S = $(CPP) $(filter-out -Wa$(comma)%,$(a_flags)) $< -o $@
>>>>> +cmd_s_S = $(CPP) $(cpp_flags) $< -o $@
>>>>
>>>> ... this one is a trap waiting for someone to fall in imo. Instead
>>>> where I'd expect this patch to use $(cpp_flags) is e.g. in
>>>> xen/arch/x86/mm/Makefile:
>>>>
>>>> guest_walk_%.i: guest_walk.c Makefile
>>>> 	$(CPP) $(cpp_flags) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
>>>>
>>>> And note how this currently uses $(c_flags), not $(a_flags), which
>>>> suggests that your deriving from $(a_flags) isn't correct either.
>>>
>>> I think we can drop this patch for now, and change patch "xen/build:
>>> factorise generation of the linker scripts" to not use $(cpp_flags).
>>>
>>> If we derive $(cpp_flags) from $(c_flags) instead, we would need to
>>> find out if CPP commands using a_flags can use c_flags instead.
>>>
>>> On the other hand, I've looked at Linux source code, and they use
>>> $(cpp_flags) for only a few targets, only to generate the .lds scripts.
>>> For other rules, they use either a_flags or c_flags, for example:
>>>     %.i: %.c ; uses $(c_flags)
>>>     %.i: %.S ; uses $(a_flags)
>>>     %.s: %.S ; uses $(a_flags)
>>
>> The first on really ought to be use cpp_flags. I couldn't find the
>> middle one. The last one clearly has to do something about -Wa,
>> options, but apart from this I'd consider a_flags appropriate to
>> use there.
>>
>>> (Also, they use -Qunused-arguments clang's options, so they don't need
>>> to filter out -Wa,* arguments, I think.)
>>
>> Maybe we should do so too then?
>>
>>> So, maybe having a single $(cpp_flags) when running the CPP command
>>> isn't such a good idea.
>>
>> Right - after all in particular the use of CPP to produce .lds is
>> an abuse, as the source file (named .lds.S) isn't really what its
>> name says.
>>
>>> So, would dropping $(cpp_flags) for now, and rework the *FLAGS later, be
>>> good enough?
>>
>> I don't think so, no, I'm sorry. cpp_flags should be there for its
>> real purpose. Whether the .lds.S -> .lds rule can use it, or should
>> use a_flags, or yet something else is a different thing.
> 
> 
> OK. I think we can rework the patch to derive cpp_flags from c_flags,
> use this new cpp_flags for %.i:%.c; but keep using a_flags for %.s:%.S.
> 
> As for the .lds, we could use this new cpp_flags, the only think I saw
> missing was -D__ASSEMBLY__, which can be added to the command line.
> (There would also be an extra -std=gnu99, but I don't think it matters.)
> 
> Does that sounds good?

Yes. I had another thought though in the meantime: What if cpp_flags
became a macro to be used with $(call ), with c_flags or a_flags (or
whatever else) passed in by the use sites?

> As for using -Qunused-arguments with clang, I didn't managed to find the
> documentation of clang's command line argument for clang 3.5 on llvm
> website, but I found it for clang 5.0 and the option is listed there.
> I've tested building Xen on our gitlab CI, which as debian jessie which
> seems to have clang 3.5, and Xen built just fine. So that might be an
> option we can use later, but probably only for CPP flags.

Okay, thanks for checking.

Jan

