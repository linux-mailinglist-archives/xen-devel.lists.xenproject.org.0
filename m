Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2282F0D55
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 08:42:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64607.114148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyrpQ-0008I0-Vj; Mon, 11 Jan 2021 07:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64607.114148; Mon, 11 Jan 2021 07:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyrpQ-0008Hb-SQ; Mon, 11 Jan 2021 07:41:28 +0000
Received: by outflank-mailman (input) for mailman id 64607;
 Mon, 11 Jan 2021 07:41:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ekcf=GO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kyrpP-0008HW-9G
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 07:41:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a07513a-3818-4502-a798-acc8b57c02e3;
 Mon, 11 Jan 2021 07:41:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D32B7AD18;
 Mon, 11 Jan 2021 07:41:24 +0000 (UTC)
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
X-Inumbo-ID: 1a07513a-3818-4502-a798-acc8b57c02e3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610350885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0x1KK+K5lffX90kM/qUTtqWVpX2J/Pv5JdmKK0nU/dU=;
	b=oIXWze9V1pCjk381TQv7oXVmhEOgm1b0fpoe6nQL1Vu5RbuZQMcQiw9iwMFAmuzBmaWnET
	iL2n3gg1pkML03lpdPbuLnWQ3vWVHvJHvEDXbCg1CRTdTJ4PFzhNp8n9FhVnKR/LOYo3l5
	8KiJhA4cK5abu0Ebo8qBEwXUc2CZwlY=
Subject: Re: [PATCH 2/6] x86/mm: p2m_add_foreign() is HVM-only
To: Oleksandr <olekstysh@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
 <cf4569c5-a9c5-7b4b-d576-d1521c369418@suse.com>
 <f736244b-ece7-af35-1517-2e5fdd9705c7@citrix.com>
 <e2ee99fc-e3f8-bdaf-fe4a-d048da34731a@suse.com>
 <b4abbe2f-5e3d-5f43-80b8-cfa3fd97061e@citrix.com>
 <CAPD2p-nZyf_i_bGh5sSs2fC4S7nxB1Mk_zbSKtqF=zvBOp3X+Q@mail.gmail.com>
 <2dcbe286-4112-e4b3-dc12-9691154365b3@suse.com>
 <448a6ef3-2cbd-da9c-e4ef-88122d246833@gmail.com>
 <18c21c64-d350-482a-c778-c8478d3daf2c@suse.com>
 <c8315e16-6130-e990-3d16-d0d42b2f92c4@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ec041f81-4b80-5ffb-8219-6732f50bef36@suse.com>
Date: Mon, 11 Jan 2021 08:41:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <c8315e16-6130-e990-3d16-d0d42b2f92c4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.01.2021 18:37, Oleksandr wrote:
> 
> On 08.01.21 19:01, Jan Beulich wrote:
> 
> Hi Jan
> 
>> On 08.01.2021 17:38, Oleksandr wrote:
>>> On 05.01.21 10:48, Jan Beulich wrote:
>>>> On 04.01.2021 17:57, Oleksandr Tyshchenko wrote:
>>>>> Hello all.
>>>>>
>>>>> [Sorry for the possible format issues]
>>>>>
>>>>> On Tue, Dec 22, 2020 at 12:41 PM Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> wrote:
>>>>>
>>>>>> On 21/12/2020 08:10, Jan Beulich wrote:
>>>>>>> On 17.12.2020 20:18, Andrew Cooper wrote:
>>>>>>>> On 15/12/2020 16:26, Jan Beulich wrote:
>>>>>>>>> This is together with its only caller, xenmem_add_to_physmap_one().
>>>>>>>> I can't parse this sentence.  Perhaps "... as is it's only caller," as a
>>>>>>>> follow-on from the subject sentence.
>>>>>>>>
>>>>>>>>>    Move
>>>>>>>>> the latter next to p2m_add_foreign(), allowing this one to become
>>>>>> static
>>>>>>>>> at the same time.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>>> So I had to ask Andrew to revert this (I was already at home when
>>>>>>> noticing the breakage), as it turned out to break the shim build.
>>>>>>> The problem is that xenmem_add_to_physmap() is non-static and
>>>>>>> hence can't be eliminated altogether by the compiler when !HVM.
>>>>>>> We could make the function conditionally static
>>>>>>> "#if !defined(CONFIG_X86) && !defined(CONFIG_HVM)", but this
>>>>>>> looks uglier to me than this extra hunk:
>>>>>>>
>>>>>>> --- unstable.orig/xen/common/memory.c
>>>>>>> +++ unstable/xen/common/memory.c
>>>>>>> @@ -788,7 +788,11 @@ int xenmem_add_to_physmap(struct domain
>>>>>>>        union add_to_physmap_extra extra = {};
>>>>>>>        struct page_info *pages[16];
>>>>>>>
>>>>>>> -    ASSERT(paging_mode_translate(d));
>>>>>>> +    if ( !paging_mode_translate(d) )
>>>>>>> +    {
>>>>>>> +        ASSERT_UNREACHABLE();
>>>>>>> +        return -EACCES;
>>>>>>> +    }
>>>>>>>
>>>>>>>        if ( xatp->space == XENMAPSPACE_gmfn_foreign )
>>>>>>>            extra.foreign_domid = DOMID_INVALID;
>>>>>>>
>>>>>>> Andrew, please let me know whether your ack stands with this (or
>>>>>>> said alternative) added, or whether you'd prefer me to re-post.
>>>>>> Yeah, this is probably neater than the ifdefary.  My ack stands.
>>>>>>
>>>>>> ~Andrew
>>>>>>
>>>>> I might miss something or did incorrect tests, but ...
>>>>> ... trying to build current staging
>>>>> (7ba2ab495be54f608cb47440e1497b2795bd301a) for x86 (with # CONFIG_HVM is
>>>>> not set) I got the following:
>>>>>
>>>>> /media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb-r0/git/xen/common/memory.c:941:
>>>>> undefined reference to `xenmem_add_to_physmap_one'
>>>>> /media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb-r0/git/xen/common/memory.c:941:(.text+0x1e391):
>>>>> relocation truncated to fit: R_X86_64_PC32 against undefined symbol
>>>>> `xenmem_add_to_physmap_one'
>>>>> ld:
>>>>> /media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb-r0/git/xen/.xen-syms.0:
>>>>> hidden symbol `xenmem_add_to_physmap_one' isn't defined
>>>>> ld: final link failed: Bad value
>>>>>
>>>>> It is worth mentioning that I do not use pvshim_defconfig (I disable HVM
>>>>> support via menuconfig manually before building).
>>>> The specific .config may matter. The specific compiler version may
>>>> also matter. Things work fine for me, both for the shim config and
>>>> a custom !HVM one, with gcc10.
>>> ok, after updating my a little bit ancient compiler to the latest
>>> possible (?) on xenial gcc-9 the build issue had gone away. Sorry for
>>> the noise.
>> There's no reason to be sorry - we want Xen to build with a wide
>> range of compiler versions. It's just that if a build issue is
>> version dependent, it is often up to the person running into it
>> to determine how to address the issue (and submit a patch).
> 
> ok, the issue was observed with gcc (Ubuntu 5.4.0-6ubuntu1~16.04.12) 
> 5.4.0 20160609
> 
> I think (but not 100% sure), to address the build issue something like 
> the stub below could help:

I'm sure this would help, but personally I'd prefer if we could limit
the number of such stubs and rely on the compiler DCE-ing the calls.
Hence it would be at least desirable (imo necessary) to understand
what prevents this to happen here, with this gcc version.

If you could also provide your exact .config, I could see whether I
can repro here with some of the gcc5 versions I have laying around.

Jan

