Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4378D234088
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 09:53:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Ppn-00015b-9U; Fri, 31 Jul 2020 07:52:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k1Ppl-00015W-FG
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 07:52:05 +0000
X-Inumbo-ID: b8f0bfe8-d302-11ea-ab8b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8f0bfe8-d302-11ea-ab8b-12813bfff9fa;
 Fri, 31 Jul 2020 07:52:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0800FAE17;
 Fri, 31 Jul 2020 07:52:16 +0000 (UTC)
Subject: Re: [PATCH 3/5] xen/memory: Fix compat XENMEM_acquire_resource for
 size requests
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-4-andrew.cooper3@citrix.com>
 <0c275cb5-55ec-b0b0-6ba8-cfa7ca23978b@suse.com>
 <d3c31bea-0c31-5822-15cb-226402c4ae75@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dd3a8e3f-fe09-6d71-1ef6-13e6e1a7ea00@suse.com>
Date: Fri, 31 Jul 2020 09:52:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d3c31bea-0c31-5822-15cb-226402c4ae75@citrix.com>
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
Cc: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.07.2020 21:12, Andrew Cooper wrote:
> On 29/07/2020 21:09, Jan Beulich wrote:
>> On 28.07.2020 13:37, Andrew Cooper wrote:
>>> Copy the nr_frames from the correct structure, so the caller doesn't
>>> unconditionally receive 0.
>>
>> Well, no - it does get copied from the correct structure. It's just
>> that the field doesn't get set properly up front.
> 
> You appear to be objecting to my use of the term "correct".
> 
> There are two structures.  One contains the correct value, and one
> contains the wrong value, which happens to always be 0.
> 
> I stand by sentence as currently written.

At the risk of splitting hair, what you copy from is a field holding
the correct value, but not the correct field. This only works
correctly because of the way __copy_field_{from,to}_guest() happen
to be implemented; there are possible alternative implementations
where this would break, despite ...

>> Otherwise you'll
>> (a) build in an unchecked assumption that the native and compat
>> fields match in type
> 
> Did you actually check?  Because I did before embarking on this course
> of action.
> 
> In file included from /local/xen.git/xen/include/xen/guest_access.h:10:0,
>                  from compat/memory.c:5:
> /local/xen.git/xen/include/asm/guest_access.h:152:28: error: comparison
> of distinct pointer types lacks a cast [-Werror]
>      (void)(&(hnd).p->field == _s);                      \
>                             ^
> compat/memory.c:628:22: note: in expansion of macro ‘__copy_field_to_guest’
>                  if ( __copy_field_to_guest(
>                       ^~~~~~~~~~~~~~~~~~~~~
> 
> This is what the compiler thinks of the code, when nr_frames is changed
> from uint32_t to unsigned long.

... this type safety check (which, I admit, I didn't consider when
writing my reply). I continue to think that handle and struct should
match up not just for {,__}copy_{from,to}_guest() but also for
{,__}copy_field_{from,to}_guest().

>> and (b) set a bad example for people looking
>> here
> 
> This entire function is a massive set of bad examples; the worst IMO
> being the fact that there isn't a single useful comment anywhere in it
> concerning how the higher level loop structure works.
> 
> I'm constantly annoyed that I need to reverse engineer it from scratch
> every time I look at it, despite having a better-than-most understanding
> of what it is trying to achieve, and how it is supposed to work.
> 
> I realise this is noones fault in particular, but it is not
> fair/reasonable to claim that this change is the thing setting a bad
> example in this file.

I'd be happy to see "bad examples" be corrected. As stated at various
occasions, at the time I first implemented the compat layer this seemed
like the most reasonable approach to me. If you see room for
improvement, then I'm all for it.

>> and then cloning this code in perhaps a case where (a) is not
>> even true. If you agree, the alternative change of setting
>> cmp.mar.nr_frames from nat.mar->nr_frames before the call is
> 
> Is there more to this sentence?

I guess I can't figure what you mean here.

> While this example could be implemented (at even higher overhead) by
> copying nat back to cmp before passing it back to the guest, the same is
> not true for the changes required to fix batching (which is another
> series the same size as this).

I'll see when you post this, but I think we will want the principle
outlined above to continue to hold.

Jan

