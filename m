Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DF146F21D
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 18:34:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243220.420665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvNJ6-0003IM-DR; Thu, 09 Dec 2021 17:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243220.420665; Thu, 09 Dec 2021 17:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvNJ6-0003G6-9x; Thu, 09 Dec 2021 17:34:12 +0000
Received: by outflank-mailman (input) for mailman id 243220;
 Thu, 09 Dec 2021 17:34:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UPJR=Q2=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mvNJ4-0003G0-6Y
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 17:34:10 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 364207fb-5916-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 18:34:08 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:45166)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mvNJ1-000V7U-1K (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 09 Dec 2021 17:34:07 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 0B8541FE08;
 Thu,  9 Dec 2021 17:34:07 +0000 (GMT)
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
X-Inumbo-ID: 364207fb-5916-11ec-9d12-4777fae47e2b
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <736f40e4-0297-ba7b-abce-c9b67ad8eb31@srcf.net>
Date: Thu, 9 Dec 2021 17:34:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211207105339.28440-1-andrew.cooper3@citrix.com>
 <20211207105339.28440-2-andrew.cooper3@citrix.com>
 <dc3f5bf2-53f9-7dcd-2be7-f9f953b382cb@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 1/3] x86/boot: Drop pte_update_limit from physical
 relocation logic
In-Reply-To: <dc3f5bf2-53f9-7dcd-2be7-f9f953b382cb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/12/2021 11:37, Jan Beulich wrote:
> On 07.12.2021 11:53, Andrew Cooper wrote:
>> This check has existed in one form or another since c/s 369bafdb1c1 "xen: Big
>> changes to x86 start-of-day" in 2007.  Even then, AFAICT, it wasn't necessary
>> because there was a clean split between the statically created entries (L3 and
>> higher) and the dynamically created ones (L2 and lower).
>>
>> Without dissecting the myriad changes over the past 14 years, I'm pretty
>> certain Xen only booted by accident when l2_xenmap[0] was handled specially
>> and skipped the pte_update_limit check which would have left it corrupt.
>>
>> Nevertheless, as of right now, all non-leaf PTEs (the first loop), and all 2M
>> xenmap leaf mappings (the second loop) need relocating.  They are no unused
>> mappings in the range, no mappings which will be encountered multiple times,
>> and it is unlikely that such mappings would be introduced.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> However, as to the description and ...
>
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1230,7 +1230,6 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>>              l3_pgentry_t *pl3e;
>>              l2_pgentry_t *pl2e;
>>              int i, j, k;
>> -            unsigned long pte_update_limit;
>>  
>>              /* Select relocation address. */
>>              xen_phys_start = end - reloc_size;
>> @@ -1238,14 +1237,6 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>>              bootsym(trampoline_xen_phys_start) = xen_phys_start;
>>  
>>              /*
>> -             * No PTEs pointing above this address are candidates for relocation.
>> -             * Due to possibility of partial overlap of the end of source image
>> -             * and the beginning of region for destination image some PTEs may
>> -             * point to addresses in range [e, e + XEN_IMG_OFFSET).
>> -             */
>> -            pte_update_limit = PFN_DOWN(e);
> ... considering the comment here: Isn't it 0d31d1680868 ("x86/setup: do
> not relocate Xen over current Xen image placement") where need for this
> disappeared? Afaict the non-overlap of source and destination is the
> crucial factor here, yet your description doesn't mention this aspect at
> all. I'd therefore like to ask for an adjustment there.

I don't consider that commit relevant.

There is no circumstance ever where you can relocate Xen with
actually-overlapping ranges, because one way or another, you'd end up
copying non-pagetable data over the live pagetables.

That particular commit was part of trying to make Xen's entry code
relocatable, so the MB2 path could load Xen at somewhere which wasn't 0,
but to this day we still skip any physical relocation if Xen isn't
started at 0.


To the comment specifically, it's actively wrong.

Back when XEN_IMG_OFFSET was 1M, and we had 16M worth of unconditional
mappings, then we could get PTE overlap as described, in the corner case
where we were moving Xen from 0 to anywhere between 4 and 16M physical
(2M physical was in principle a problem, but not an eligible position to
relocate to, given Xen's compile size).

And in that corner case, the logic would "corrupt" various PTEs by not
relocating them.  The PTE coving _start at 1M was special cased ahead of
the 2nd loop (finally fixed last week) and the PTEs mapping beyond _end
were unused which is why nothing actually went wrong.

~Andrew

