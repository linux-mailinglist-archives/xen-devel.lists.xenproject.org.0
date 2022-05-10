Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E40795213E3
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 13:34:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325491.548077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noO8C-0000Qf-2s; Tue, 10 May 2022 11:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325491.548077; Tue, 10 May 2022 11:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noO8B-0000Or-Vx; Tue, 10 May 2022 11:34:19 +0000
Received: by outflank-mailman (input) for mailman id 325491;
 Tue, 10 May 2022 11:34:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VXvK=VS=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1noO8A-0000Ol-3e
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 11:34:18 +0000
Received: from ppsw-40.csi.cam.ac.uk (ppsw-40.csi.cam.ac.uk [131.111.8.140])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f39a196-d055-11ec-a406-831a346695d4;
 Tue, 10 May 2022 13:34:16 +0200 (CEST)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:40840)
 by ppsw-40.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1noO84-000PcQ-ks (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 10 May 2022 12:34:12 +0100
Received: from [192.168.1.10] (host-92-26-109-251.as13285.net [92.26.109.251])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 2096F1FA59;
 Tue, 10 May 2022 12:34:12 +0100 (BST)
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
X-Inumbo-ID: 1f39a196-d055-11ec-a406-831a346695d4
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <e7fcd02f-5fef-13e5-9ae0-763913aadd0c@srcf.net>
Date: Tue, 10 May 2022 12:34:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, Lin Liu <lin.liu@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <cover.1652170719.git.lin.liu@citrix.com>
 <c9488a2fe15d59dc86712e70614c4dbe0794506b.1652170719.git.lin.liu@citrix.com>
 <76c9bed5-6643-4fa6-eaf5-c865f942193c@xen.org>
 <00d82608-9430-6b20-26b5-207c62358179@srcf.net>
 <3670ae1b-fac2-7665-b2a7-f3e414cd6c84@xen.org>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v3 4/6] xen: Switch to byteswap
In-Reply-To: <3670ae1b-fac2-7665-b2a7-f3e414cd6c84@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/05/2022 12:17, Julien Grall wrote:
>>
>>>
>>>> diff --git a/xen/include/xen/unaligned.h b/xen/include/xen/unaligned.h
>>>> index 0a2b16d05d..16b2e6f5f0 100644
>>>> --- a/xen/include/xen/unaligned.h
>>>> +++ b/xen/include/xen/unaligned.h
>>>> @@ -20,62 +20,62 @@
>>>>      static inline uint16_t get_unaligned_be16(const void *p)
>>>>    {
>>>> -    return be16_to_cpup(p);
>>>> +    return be16_to_cpu(*(const uint16_t *)p)
>>>
>>> I haven't checked the existing implementation of be16_to_cpup().
>>
>> It's a plain dereference, just like this.  AFAICT, it wasn't unaligned
>> safe before, either.
>
> Well, technically an architecture could provide an override for the
> copy. I agree that arm32 is already bogus but...
>
>>
>> It should be reasonably easy to fix in a followup patch.  Just memcpy()
>> to/from the void pointer to a stack variable of the appropriate type.
> ... I disagree that it should be fixed in a follow-up patch. It should
> be fixed now as this is where the badness is spread to any architecture.

No.  That is an inappropriate request to make.

Lin's patch does not alter the broken-ness of unaligned on arm32, and
does improve the aspect of the hypervisor that it pertains to.  It
therefore stands on its own merit.

Your choices are to either fix it yourself (after all, you are the
maintainer who cares about this unrelated bug), or you ask Lin kindly if
he has time to look into fixing the unrelated bug after this series is
complete.

It is not reasonable to say "this unrelated thing is broken, and you
need to fix it first to get your series in".  Requests like that are,
I'm sure, part of what Bertrand raised in the community call as
unnecessary fiction getting work submitted.

~Andrew

