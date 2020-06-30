Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A87F20F324
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 12:53:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqDsd-0007rn-2j; Tue, 30 Jun 2020 10:52:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fY2H=AL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jqDsc-0007rf-3y
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 10:52:46 +0000
X-Inumbo-ID: d1fcdaea-babf-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1fcdaea-babf-11ea-bca7-bc764e2007e4;
 Tue, 30 Jun 2020 10:52:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D9ACDACE1;
 Tue, 30 Jun 2020 10:52:40 +0000 (UTC)
Subject: Re: [PATCH] x86: fix compat header generation
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <0e617191-d61f-08e2-eaa9-b324cd6501f0@suse.com>
 <20200630095239.GK735@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7d991541-84df-b18c-acde-449d3edae384@suse.com>
Date: Tue, 30 Jun 2020 12:52:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200630095239.GK735@Air-de-Roger>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.06.2020 11:52, Roger Pau Monné wrote:
> On Mon, Jun 29, 2020 at 05:50:59PM +0200, Jan Beulich wrote:
>> As was pointed out by "mm: fix public declaration of struct
>> xen_mem_acquire_resource", we're not currently handling structs
>> correctly that has uint64_aligned_t fields. #pragma pack(4) suppresses
>> the necessary alignment even if the type did properly survive (which
>> it also didn't) in the process of generating the headers. Overall,
>> with the above mentioned change applied, there's only a latent issue
>> here afaict, i.e. no other of our interface structs is currently
>> affected.
>>
>> As a result it is clear that using #pragma pack(4) is not an option.
>> Drop all uses from compat header generation. Make sure
>> {,u}int64_aligned_t actually survives, such that explicitly aligned
>> fields will remain aligned. Arrange for {,u}int64_t to be transformed
>> into a type that's 64 bits wide and 4-byte aligned, by utilizing that
>> in typedef-s the "aligned" attribute can be used to reduce alignment.
>>
>> Note that this changes alignment (but not size) of certain compat
>> structures, when one or more of their fields use a non-translated struct
>> as their type(s). This isn't correct, and hence applying alignof() to
>> such fields requires care, but the prior situation was even worse.
> 
> Just to clarify my understanding, this means that struct fields that
> are also structs will need special alignment? (because we no longer have
> the 4byte packaging).

They may need in principle, but right now there's no instance of
such as per my comparing of the generated binaries.

> I see from the generated headers that uint64_compat_t is already
> aligned to 4 bytes, and I assume something similar will be needed for
> all 8byte types?

If there are native types that get re-used (rather than re-created
as compat version in the compat headers, which would then necessarily
derive from {u,}int64_t directly or indirectly, as there's no other
non-derived 8-byte type that's legitimate to use in public headers -
e.g. "unsigned long long" is not legitimate to be used, and all
"unsigned long" instances [if there are any left] get converted to
"unsigned int"), yes.

>> There's one change to generated code according to my observations: In
>> arch_compat_vcpu_op() the runstate area "area" variable would previously
>> have been put in a just 4-byte aligned stack slot (despite being 8 bytes
>> in size), whereas now it gets put in an 8-byte aligned location.
> 
> Is there someway that we could spot such changes, maybe building a
> version of the plain structures with -m32 and comparing against their
> compat versions?

Depends on what "comparing" here means. Yes, something could
presumably be invented. But it may also be that we'd be better of
doing away with the re-use of native structs. But of course doing
so will have significant fallout, which right now I have no good
idea how to deal with.

> I know we have some compat checking infrastructure, so I wonder if we
> could use it to avoid issues like the one we had with
> xen_mem_acquire_resource, as it seems like something that could be
> programmatically detected.

Yes, having this properly checked would definitely be nice. It's
just the "how" that's unclear to me here.

>> @@ -57,16 +48,16 @@ compat/%.h: compat/%.i Makefile $(BASEDI
>>  	echo "#define $$id" >>$@.new; \
>>  	echo "#include <xen/compat.h>" >>$@.new; \
>>  	$(if $(filter-out compat/arch-%.h,$@),echo "#include <$(patsubst compat/%,public/%,$@)>" >>$@.new;) \
>> -	$(if $(prefix-y),echo "$(prefix-y)" >>$@.new;) \
>>  	grep -v '^# [0-9]' $< | \
>>  	$(PYTHON) $(BASEDIR)/tools/compat-build-header.py | uniq >>$@.new; \
>> -	$(if $(suffix-y),echo "$(suffix-y)" >>$@.new;) \
>>  	echo "#endif /* $$id */" >>$@.new
>>  	mv -f $@.new $@
>>  
>> +.PRECIOUS: compat/%.i
>>  compat/%.i: compat/%.c Makefile
>>  	$(CPP) $(filter-out -Wa$(comma)% -include %/include/xen/config.h,$(XEN_CFLAGS)) $(cppflags-y) -o $@ $<
>>  
>> +.PRECIOUS: compat/%.c
> 
> Not sure if it's worth mentioning that the .i and .c files are now
> kept.

Ouch - these weren't supposed to be left in. They were just for my
debugging. Thanks for noticing.

Jan

