Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 507762F2062
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 21:07:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65361.115798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz3SA-00042U-FT; Mon, 11 Jan 2021 20:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65361.115798; Mon, 11 Jan 2021 20:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz3SA-000425-CE; Mon, 11 Jan 2021 20:06:14 +0000
Received: by outflank-mailman (input) for mailman id 65361;
 Mon, 11 Jan 2021 20:06:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=57GD=GO=cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1kz3S8-00041z-0A
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 20:06:12 +0000
Received: from ppsw-41.csi.cam.ac.uk (unknown [131.111.8.141])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dae296da-9db7-41f8-b5a0-02646dd0089e;
 Mon, 11 Jan 2021 20:06:09 +0000 (UTC)
Received: from 88-111-124-141.dynamic.dsl.as9105.com ([88.111.124.141]:46886
 helo=[192.168.1.219])
 by ppsw-41.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.159]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1kz3Rr-0004lI-SQ (Exim 4.92.3)
 (return-path <amc96@cam.ac.uk>); Mon, 11 Jan 2021 20:05:55 +0000
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
X-Inumbo-ID: dae296da-9db7-41f8-b5a0-02646dd0089e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cam.ac.uk;
	 s=20180806.ppsw; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=u363ERDEk5LI6ZHDV4EVgqJF/frQZX6TFuVx3BiS0pY=; b=GP6vLqnFdT16V6Hyz4pSMkZ6fp
	LUklHLXei0QJh4j0cF2LCkFWNc59E/47DjGOgliKeO3Dx0D9x6SWvd50MtFDHQJ1Qu2NTQcWoALkw
	q/xmSQ8w91WhBbfj4ODWNQIAglDV38aNHYFuVtrKk1QThenOEFIFS0m951WN7XrpSbeA=;
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Subject: Re: [PATCH v2 09/11] xen/memory: Fix mapping grant tables with
 XENMEM_acquire_resource
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
 <michal.leszczynski@cert.pl>, Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>, Andrew Cooper <amc96@cam.ac.uk>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
 <20200922182444.12350-10-andrew.cooper3@citrix.com>
 <eb9768ad-b6cd-b01e-d689-63775f6e5914@suse.com>
From: Andrew Cooper <amc96@cam.ac.uk>
Message-ID: <0462d837-947b-30a8-21ab-5a9a6b9ca4e1@cam.ac.uk>
Date: Mon, 11 Jan 2021 20:05:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <eb9768ad-b6cd-b01e-d689-63775f6e5914@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 28/09/2020 10:37, Jan Beulich wrote:
> On 22.09.2020 20:24, Andrew Cooper wrote:
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -4632,7 +4632,6 @@ int arch_acquire_resource(struct domain *d, unsigned int type,
>>          if ( id != (unsigned int)ioservid )
>>              break;
>>  
>> -        rc = 0;
>>          for ( i = 0; i < nr_frames; i++ )
>>          {
>>              mfn_t mfn;
>> @@ -4643,6 +4642,9 @@ int arch_acquire_resource(struct domain *d, unsigned int type,
>>  
>>              mfn_list[i] = mfn_x(mfn);
>>          }
>> +        if ( i == nr_frames )
>> +            /* Success.  Passed nr_frames back to the caller. */
>> +            rc = nr_frames;
> With this, shouldn't the return type of the function be changed to
> "long"? I realize that's no an issue with XENMEM_resource_ioreq_server
> specifically, but I mean the general case.

That would require going back in time and making a more sane ABI for
struct xen_mem_acquire_resource

We really do have a 32bit nr_frames field, and a 64bit "where to
continue from" field.

>> --- a/xen/common/compat/memory.c
>> +++ b/xen/common/compat/memory.c
>> @@ -636,15 +662,45 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>>                      compat_frame_list[i] = frame;
>>                  }
>>  
>> -                if ( __copy_to_compat_offset(cmp.mar.frame_list, 0,
>> -                                             compat_frame_list,
>> -                                             cmp.mar.nr_frames) )
>> +                if ( __copy_to_compat_offset(
>> +                         cmp.mar.frame_list, start_extent,
>> +                         compat_frame_list, done) )
>>                      return -EFAULT;
>>              }
>> -            break;
>> +
>> +            start_extent += done;
>> +
>> +            /* Completely done. */
>> +            if ( start_extent == cmp.mar.nr_frames )
>> +                break;
>> +
>> +            /*
>> +             * Done a "full" batch, but we were limited by space in the xlat
>> +             * area.  Go around the loop again without necesserily returning
>> +             * to guest context.
>> +             */
>> +            if ( done == nat.mar->nr_frames )
>> +            {
>> +                split = 1;
>> +                break;
>> +            }
>> +
>> +            /* Explicit continuation request from a higher level. */
>> +            if ( done < nat.mar->nr_frames )
>> +                return hypercall_create_continuation(
>> +                    __HYPERVISOR_memory_op, "ih",
>> +                    op | (start_extent << MEMOP_EXTENT_SHIFT), compat);
>> +
>> +            /*
>> +             * Well... Somethings gone wrong with the two levels of chunking.
>> +             * My condolences to whomever next has to debug this mess.
>> +             */
> Any suggestion how to overcome this "mess"?

The double level of array handling is what makes it so complicated. 
There are enough cases in compat_memory_op() alone which can't

We've got two cases in practice.  A singleton object needing conversion,
or a large array of them.  I'm quite certain we'd have less code and
less complexity by having copy_$OJBECT_{to,from}_guest() helpers which
dealt with compat internally as appropriate.

We don't care about the performance of 32bit hypercalls, but not doing
batch conversions of 1020/etc objects in the compat layer will probably
result in better performance overall, as we don't throw away the work as
we batch things at smaller increments higher up the stack.

>
>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -4105,6 +4105,9 @@ int gnttab_acquire_resource(
>>      for ( i = 0; i < nr_frames; ++i )
>>          mfn_list[i] = virt_to_mfn(vaddrs[frame + i]);
>>  
>> +    /* Success.  Passed nr_frames back to the caller. */
> Nit: "Pass"?

We have already passed them back to the caller.  "Pass" is the wrong
tense to use.

>
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -1027,17 +1027,31 @@ static unsigned int resource_max_frames(struct domain *d,
>>      }
>>  }
>>  
>> +/*
>> + * Returns -errno on error, or positive in the range [1, nr_frames] on
>> + * success.  Returning less than nr_frames contitutes a request for a
>> + * continuation.
>> + */
>> +static int _acquire_resource(
>> +    struct domain *d, unsigned int type, unsigned int id, unsigned long frame,
>> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
> As per the comment the return type may again want to be "long" here.
> Albeit I realize the restriction to (UINT_MAX >> MEMOP_EXTENT_SHIFT)
> makes this (and the other place above) only a latent issue for now,
> so it may well be fine to be left as is.

Hmm yes - it should be long, because per the ABI we still should be able
to return 0xffffffff to a caller in the success case.

I'll update.

~Andrew

