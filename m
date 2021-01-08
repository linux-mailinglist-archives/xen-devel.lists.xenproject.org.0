Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2376C2EF5E5
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 17:38:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63702.113063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxumT-0004TO-GE; Fri, 08 Jan 2021 16:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63702.113063; Fri, 08 Jan 2021 16:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxumT-0004Sz-Cy; Fri, 08 Jan 2021 16:38:29 +0000
Received: by outflank-mailman (input) for mailman id 63702;
 Fri, 08 Jan 2021 16:38:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5LZb=GL=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kxumS-0004Su-1G
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 16:38:28 +0000
Received: from mail-lf1-x136.google.com (unknown [2a00:1450:4864:20::136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8cc2793a-13ab-4626-9d42-e02b25cb7f94;
 Fri, 08 Jan 2021 16:38:26 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id a12so24346920lfl.6
 for <xen-devel@lists.xenproject.org>; Fri, 08 Jan 2021 08:38:26 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v5sm2269237ljj.135.2021.01.08.08.38.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 08:38:24 -0800 (PST)
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
X-Inumbo-ID: 8cc2793a-13ab-4626-9d42-e02b25cb7f94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=c1Bj1CFmjhUOUP80IWwRQmzBKlPt7vuSdKSFJ6i8rqA=;
        b=mGT780Pul+wWOSYPds7ZZyJR4couAWMFBs6BinIeNr5v29f8iyu1DM+pstaQlBiYdf
         fXZakL09GF/hb4mCZDuiWwK5Bic9w5w3yDkloMAuQt5OCprY9NPl//Hg3CmQfL57vn0P
         OFuVRksZghBJoiHB1satRQMXpGrIX3Rr7AXZUgpjgzpmCxSuxOI1KSn3iJLa4tDqAvom
         tkS0huxGlZtiZZqWIKZ2zL/amNJ1NaIxCFPuFMFoR4nqWvzuUZhlueKEp9U6dp3jcAD7
         TCJ+/mlaelSLibhN+wRcVR1ofHKjqw4ju7U42CE3rjEVYZEg1fM0nICzR/w7nXgZckXb
         qN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=c1Bj1CFmjhUOUP80IWwRQmzBKlPt7vuSdKSFJ6i8rqA=;
        b=NolcPKYgrYzQKTHHmcKNfX/PSS+f6yaYBnZNwXSgRWfayS+b/CEhKqeIzvKQL+771V
         HufpZdQ591QEv/rjwBJxrKyaynZQxFq7PhsvT12xyPYTMloBpJiWskh+RU5B8e+03HxK
         CFl1OTNtv3EaLJ4u9oFH4lWc8Fnnytwx0Gnx21B3dgchHTwNMgUEk+pRpp01aqXo9dOL
         m7jMeoEiBWky2pzhrGsjAsdWdXBehzQQBh7L35IC6QXFNgypLUQz4ejUM7Hm05tM5GcG
         Hb/R4QFSTdKrzPCUX2XaLL3sM8cSVHBBiQGzv6x5yM49mHVMy26dCJLyuUgwAG5lE1v7
         VAnA==
X-Gm-Message-State: AOAM531AC0RTOwn+JcVMElXyF7am4LaP1NOZB5iDNrCZz9ClnTUp334b
	qgnCehuUmgD2q7VMcwrC7fQ=
X-Google-Smtp-Source: ABdhPJwzj1xezDkjONfhe0DbeuSI7SeJ0JgAqRpowJqGEzvidIi5MJU4ZUbv3Yyfgjs1WvyQyP8g+w==
X-Received: by 2002:a2e:2242:: with SMTP id i63mr1827392lji.343.1610123905007;
        Fri, 08 Jan 2021 08:38:25 -0800 (PST)
Subject: Re: [PATCH 2/6] x86/mm: p2m_add_foreign() is HVM-only
To: Jan Beulich <jbeulich@suse.com>
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
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <448a6ef3-2cbd-da9c-e4ef-88122d246833@gmail.com>
Date: Fri, 8 Jan 2021 18:38:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2dcbe286-4112-e4b3-dc12-9691154365b3@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 05.01.21 10:48, Jan Beulich wrote:

Hi Jan


> On 04.01.2021 17:57, Oleksandr Tyshchenko wrote:
>> Hello all.
>>
>> [Sorry for the possible format issues]
>>
>> On Tue, Dec 22, 2020 at 12:41 PM Andrew Cooper <andrew.cooper3@citrix.com>
>> wrote:
>>
>>> On 21/12/2020 08:10, Jan Beulich wrote:
>>>> On 17.12.2020 20:18, Andrew Cooper wrote:
>>>>> On 15/12/2020 16:26, Jan Beulich wrote:
>>>>>> This is together with its only caller, xenmem_add_to_physmap_one().
>>>>> I can't parse this sentence.  Perhaps "... as is it's only caller," as a
>>>>> follow-on from the subject sentence.
>>>>>
>>>>>>   Move
>>>>>> the latter next to p2m_add_foreign(), allowing this one to become
>>> static
>>>>>> at the same time.
>>>>>>
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> So I had to ask Andrew to revert this (I was already at home when
>>>> noticing the breakage), as it turned out to break the shim build.
>>>> The problem is that xenmem_add_to_physmap() is non-static and
>>>> hence can't be eliminated altogether by the compiler when !HVM.
>>>> We could make the function conditionally static
>>>> "#if !defined(CONFIG_X86) && !defined(CONFIG_HVM)", but this
>>>> looks uglier to me than this extra hunk:
>>>>
>>>> --- unstable.orig/xen/common/memory.c
>>>> +++ unstable/xen/common/memory.c
>>>> @@ -788,7 +788,11 @@ int xenmem_add_to_physmap(struct domain
>>>>       union add_to_physmap_extra extra = {};
>>>>       struct page_info *pages[16];
>>>>
>>>> -    ASSERT(paging_mode_translate(d));
>>>> +    if ( !paging_mode_translate(d) )
>>>> +    {
>>>> +        ASSERT_UNREACHABLE();
>>>> +        return -EACCES;
>>>> +    }
>>>>
>>>>       if ( xatp->space == XENMAPSPACE_gmfn_foreign )
>>>>           extra.foreign_domid = DOMID_INVALID;
>>>>
>>>> Andrew, please let me know whether your ack stands with this (or
>>>> said alternative) added, or whether you'd prefer me to re-post.
>>> Yeah, this is probably neater than the ifdefary.  My ack stands.
>>>
>>> ~Andrew
>>>
>> I might miss something or did incorrect tests, but ...
>> ... trying to build current staging
>> (7ba2ab495be54f608cb47440e1497b2795bd301a) for x86 (with # CONFIG_HVM is
>> not set) I got the following:
>>
>> /media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb-r0/git/xen/common/memory.c:941:
>> undefined reference to `xenmem_add_to_physmap_one'
>> /media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb-r0/git/xen/common/memory.c:941:(.text+0x1e391):
>> relocation truncated to fit: R_X86_64_PC32 against undefined symbol
>> `xenmem_add_to_physmap_one'
>> ld:
>> /media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb-r0/git/xen/.xen-syms.0:
>> hidden symbol `xenmem_add_to_physmap_one' isn't defined
>> ld: final link failed: Bad value
>>
>> It is worth mentioning that I do not use pvshim_defconfig (I disable HVM
>> support via menuconfig manually before building).
> The specific .config may matter. The specific compiler version may
> also matter. Things work fine for me, both for the shim config and
> a custom !HVM one, with gcc10.

ok, after updating my a little bit ancient compiler to the latest 
possible (?) on xenial gcc-9 the build issue had gone away. Sorry for 
the noise.



-- 
Regards,

Oleksandr Tyshchenko


