Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE232F2A21
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 09:40:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65535.116131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzFDf-0006SF-I7; Tue, 12 Jan 2021 08:40:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65535.116131; Tue, 12 Jan 2021 08:40:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzFDf-0006QD-Ep; Tue, 12 Jan 2021 08:40:03 +0000
Received: by outflank-mailman (input) for mailman id 65535;
 Tue, 12 Jan 2021 08:40:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5SK+=GP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kzFDe-0006Je-Fm
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 08:40:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ea93bc9-ea26-4cdc-a65f-61d193054604;
 Tue, 12 Jan 2021 08:40:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 88F6BAB92;
 Tue, 12 Jan 2021 08:40:00 +0000 (UTC)
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
X-Inumbo-ID: 8ea93bc9-ea26-4cdc-a65f-61d193054604
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610440800; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YiovJydfNunrj3A2jUo4VwLxJWFiY9GTf6y/bfrIAS4=;
	b=cAPA3u+JFY8Vjtv2xEXfVDRsbOCVZy1hpJ43CxhB4VhU+DoyADCIULEG/nBOn4nd0fpYOR
	O+jfMAzSZQg9lZpqUgTFMMpMLlXJTNBclP4BhCSOCYGgmiCWO76ENhm3zPVRxBppKbFvXE
	gZdSoMClmQB61/n+PC8Nj+auLetxPrg=
Subject: Re: [PATCH v2 09/11] xen/memory: Fix mapping grant tables with
 XENMEM_acquire_resource
To: Andrew Cooper <amc96@cam.ac.uk>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
 <michal.leszczynski@cert.pl>, Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
 <20200922182444.12350-10-andrew.cooper3@citrix.com>
 <eb9768ad-b6cd-b01e-d689-63775f6e5914@suse.com>
 <0462d837-947b-30a8-21ab-5a9a6b9ca4e1@cam.ac.uk>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3a661aa1-25c3-52a7-6d18-4ad5e2d9d0f7@suse.com>
Date: Tue, 12 Jan 2021 09:39:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <0462d837-947b-30a8-21ab-5a9a6b9ca4e1@cam.ac.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.01.2021 21:05, Andrew Cooper wrote:
> On 28/09/2020 10:37, Jan Beulich wrote:
>> On 22.09.2020 20:24, Andrew Cooper wrote:
>>> --- a/xen/common/compat/memory.c
>>> +++ b/xen/common/compat/memory.c
>>> @@ -636,15 +662,45 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>>>                      compat_frame_list[i] = frame;
>>>                  }
>>>  
>>> -                if ( __copy_to_compat_offset(cmp.mar.frame_list, 0,
>>> -                                             compat_frame_list,
>>> -                                             cmp.mar.nr_frames) )
>>> +                if ( __copy_to_compat_offset(
>>> +                         cmp.mar.frame_list, start_extent,
>>> +                         compat_frame_list, done) )
>>>                      return -EFAULT;
>>>              }
>>> -            break;
>>> +
>>> +            start_extent += done;
>>> +
>>> +            /* Completely done. */
>>> +            if ( start_extent == cmp.mar.nr_frames )
>>> +                break;
>>> +
>>> +            /*
>>> +             * Done a "full" batch, but we were limited by space in the xlat
>>> +             * area.  Go around the loop again without necesserily returning
>>> +             * to guest context.
>>> +             */
>>> +            if ( done == nat.mar->nr_frames )
>>> +            {
>>> +                split = 1;
>>> +                break;
>>> +            }
>>> +
>>> +            /* Explicit continuation request from a higher level. */
>>> +            if ( done < nat.mar->nr_frames )
>>> +                return hypercall_create_continuation(
>>> +                    __HYPERVISOR_memory_op, "ih",
>>> +                    op | (start_extent << MEMOP_EXTENT_SHIFT), compat);
>>> +
>>> +            /*
>>> +             * Well... Somethings gone wrong with the two levels of chunking.
>>> +             * My condolences to whomever next has to debug this mess.
>>> +             */
>> Any suggestion how to overcome this "mess"?
> 
> The double level of array handling is what makes it so complicated. 
> There are enough cases in compat_memory_op() alone which can't
> 
> We've got two cases in practice.  A singleton object needing conversion,
> or a large array of them.  I'm quite certain we'd have less code and
> less complexity by having copy_$OJBECT_{to,from}_guest() helpers which
> dealt with compat internally as appropriate.
> 
> We don't care about the performance of 32bit hypercalls, but not doing
> batch conversions of 1020/etc objects in the compat layer will probably
> result in better performance overall, as we don't throw away the work as
> we batch things at smaller increments higher up the stack.

I've put this on my todo list to investigate. Maybe nowadays we
really don't care all this much about 32-bit hypercall performance.
The picture was surely different when the compat layer was
introduced.

>>> --- a/xen/common/grant_table.c
>>> +++ b/xen/common/grant_table.c
>>> @@ -4105,6 +4105,9 @@ int gnttab_acquire_resource(
>>>      for ( i = 0; i < nr_frames; ++i )
>>>          mfn_list[i] = virt_to_mfn(vaddrs[frame + i]);
>>>  
>>> +    /* Success.  Passed nr_frames back to the caller. */
>> Nit: "Pass"?
> 
> We have already passed them back to the caller.  "Pass" is the wrong
> tense to use.

Hmm, interesting view. I personally wouldn't consider the
passing back to have completed before we've returned.

Jan

