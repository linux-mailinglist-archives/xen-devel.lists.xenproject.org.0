Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BADE46F476
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 20:59:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243280.420792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvPYu-00029o-D4; Thu, 09 Dec 2021 19:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243280.420792; Thu, 09 Dec 2021 19:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvPYu-000281-9H; Thu, 09 Dec 2021 19:58:40 +0000
Received: by outflank-mailman (input) for mailman id 243280;
 Thu, 09 Dec 2021 19:58:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UPJR=Q2=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mvPYs-00027t-Of
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 19:58:38 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64487aa4-592a-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 20:58:36 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:41444)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mvPYp-000U5I-mQ (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 09 Dec 2021 19:58:35 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id CD08F1FD51;
 Thu,  9 Dec 2021 19:58:34 +0000 (GMT)
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
X-Inumbo-ID: 64487aa4-592a-11ec-a831-37629979565c
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <becdcf55-51fb-0b62-6b34-d5c790b7d238@srcf.net>
Date: Thu, 9 Dec 2021 19:58:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211207105339.28440-1-andrew.cooper3@citrix.com>
 <20211207105339.28440-3-andrew.cooper3@citrix.com>
 <81893ccf-6b94-ddc7-d92b-f254861fe994@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 2/3] x86/boot: Drop move_memory() and use memcpy()
 directly
In-Reply-To: <81893ccf-6b94-ddc7-d92b-f254861fe994@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/12/2021 12:03, Jan Beulich wrote:
> On 07.12.2021 11:53, Andrew Cooper wrote:
>> @@ -1243,7 +1196,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>>               * data until after we have switched to the relocated pagetables!
>>               */
>>              barrier();
>> -            move_memory(e, XEN_IMG_OFFSET, _end - _start, 1);
>> +            memcpy(__va(__pa(_start)), _start, _end - _start);
>>  
>>              /* Walk idle_pg_table, relocating non-leaf entries. */
>>              pl4e = __va(__pa(idle_pg_table));
>> @@ -1300,8 +1253,6 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>>                     "1" (__va(__pa(cpu0_stack))), "2" (STACK_SIZE / 8)
>>                  : "memory" );
>>  
>> -            bootstrap_map(NULL);
>> -
>>              printk("New Xen image base address: %#lx\n", xen_phys_start);
>>          }
> This bootstrap_map() must have been dead code already before, except
> for the "keep" argument above needlessly having got passed as 1? Afaict
> passing 1 was pointless without using the function's return value.

bootstrap_map(NULL) is necessary to zap the constructed mappings, but it
seems like the use of the return address was dropped by c/s 0b76ce20de
"x86/setup: don't relocate the VGA hole" in 2013.

>
>> @@ -1325,9 +1276,10 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>>                   (headroom ||
>>                    ((end - size) >> PAGE_SHIFT) > mod[j].mod_start) )
>>              {
>> -                move_memory(end - size + headroom,
>> -                            (uint64_t)mod[j].mod_start << PAGE_SHIFT,
>> -                            mod[j].mod_end, 0);
>> +                memcpy(__va(end - size + headroom),
>> +                       __va((uint64_t)mod[j].mod_start << PAGE_SHIFT),
>> +                       mod[j].mod_end);
> I'm not convinced this can be memcpy() - consider_modules() specifically
> allows for the current module's source and destination areas to overlap.
> See also the comment ahead of its invocation a few lines up from here.

The comment which says:

/* Don't overlap with other modules (or Xen itself). */
end = consider_modules(s, e, size, mod,
                       mbi->mods_count + relocated, j);

?

memmove() in move_memory() is broken, and in fact always results in a
backwards copy, which means that one way or another, overlapping source
and destination doesn't work.

If it was really broken before, then it can be fixed now by using
memmove() here, because using 2 directmap mappings means the
forward/backward check will now work as expected.

> I'm also not convinced we have the source range (fully) direct-mapped at
> this point. Only full superpages have been mapped so far, and only those
> for the current or higher address E820 entries (plus of course the pre-
> built mappings of the space below 1Gb [PREBUILT_MAP_LIMIT]) located
> below 4Gb.

PREBUILT_MAP_LIMIT is 2M, and that's only to cover the fact that we
build l1_directmap[] with the VGA UC range at build time.  I was hoping
to remove it in due course.

As to the other mappings, that is awkward.  Perhaps what we ought to do
is split the loops.  First fill in all 2M superpages into the directmap,
then relocate Xen, at which point we've got plenty of frames to feed
into the allocator, to let us do a second pass filling in non-2M regions.

We can depend on the modules living in RAM regions, but might want to
explicitly confirm.

> As to the 2nd argument - if this can indeed be converted in the first
> place, may I suggest to also switch to using pfn_to_paddr()?

Honestly, that's taking a terrible situation and making it worse.

Calling pfn_to_paddr() on what is logically a paddr_t already ought to
be a compilation error, and the logic which makes this change
deliberately is some of the most nack-worthy logic I've ever come across.

It's very much not ok to have mod_start be a paddr or pfn, and for
mod_end to either be an end or a sized, epending on where you are during
boot.

~Andrew

