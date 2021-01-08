Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B65E2EF698
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 18:39:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63759.113114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxviD-0002a5-4o; Fri, 08 Jan 2021 17:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63759.113114; Fri, 08 Jan 2021 17:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxviD-0002Ze-1Q; Fri, 08 Jan 2021 17:38:09 +0000
Received: by outflank-mailman (input) for mailman id 63759;
 Fri, 08 Jan 2021 17:38:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5LZb=GL=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kxviB-0002ZZ-R2
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 17:38:07 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf94bb2b-e66f-425d-b2c9-35243dd2e4a2;
 Fri, 08 Jan 2021 17:38:06 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id l11so24891281lfg.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Jan 2021 09:38:06 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id t131sm2084251lff.81.2021.01.08.09.38.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 09:38:04 -0800 (PST)
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
X-Inumbo-ID: cf94bb2b-e66f-425d-b2c9-35243dd2e4a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=CFEF+8YuiX5u08e8ad/3SwWbWFJSb4VP5bGC2OS3RRE=;
        b=l7oL50ge8PHPqnaNEvjlQrCKhcUSVJdjFaVtUtsxooegyu4q0MaguI9mulWDLLdOvB
         X0RovykD4FkSbL3mBvFUWzAYu5V5s5G7EK/so0xmqbkDETXQ6+BM2VuTOTH9qRLO2Ren
         JsU6Mbud3v9vjFeSbQXN8ejGxsR9ytMru27zIAfGOEJuplkedzCkVNnnBnt3OQGA7sWE
         V/s3JSsec0e/ctTTQL65iob4pOTmeT+ZZ2vCApt/pqIJpmh4UfhPZN89p4CLEek90Fmq
         K7lhQzQlX7vzecKJd+7tEpstcDLjN9GMRdH6HXhH+nfVSOLfdNlCsRqPI084cMB0xdcc
         5S/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=CFEF+8YuiX5u08e8ad/3SwWbWFJSb4VP5bGC2OS3RRE=;
        b=kUxXpZ1THpbOpW8KXgiefw7zs9rgO3iwVqncxC/BAqk8c+rrspWnUbkbhDlTR/gkvz
         x3TDLrsXIg7nNjiXVeAM+Szsu77zsQuFotCY4g4UaDI5PhNA4To4MJT3sr4Ja7Dj1OGs
         aF5VEus354gfYxPe14NSOFUM6SHaH+URin9VzfxmdNLK21eI98d7QgxnnIBz/cyNiM9B
         9pM6JwwG7c4wotaDmLwWxu16b/HSkM6t3X1SthskIjNEocCrwDNpNwbIcNBUVyup0Eai
         b0oZaJQWWm3ksdHS+bpOrc57cvviNbdt//Lvs8ZYmg2pevToIToLxTdIPDqGW6cy5ykE
         VL/Q==
X-Gm-Message-State: AOAM530ZbyYHf2Hl/Be1z003vXOiWejc63q+3JAzZe7Pct47m3gCEmi9
	7T0ldxcM0+GQ9boPnX6lkRc=
X-Google-Smtp-Source: ABdhPJxwZE2hD4C4Ws602z5jOg6ZWq3LAYjwJtjw72suf4uozCdpNCOS88zMhK06bqV7+Q4Ak3u9TQ==
X-Received: by 2002:ac2:504e:: with SMTP id a14mr1934825lfm.524.1610127485589;
        Fri, 08 Jan 2021 09:38:05 -0800 (PST)
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
 <448a6ef3-2cbd-da9c-e4ef-88122d246833@gmail.com>
 <18c21c64-d350-482a-c778-c8478d3daf2c@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <c8315e16-6130-e990-3d16-d0d42b2f92c4@gmail.com>
Date: Fri, 8 Jan 2021 19:37:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <18c21c64-d350-482a-c778-c8478d3daf2c@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 08.01.21 19:01, Jan Beulich wrote:

Hi Jan

> On 08.01.2021 17:38, Oleksandr wrote:
>> On 05.01.21 10:48, Jan Beulich wrote:
>>> On 04.01.2021 17:57, Oleksandr Tyshchenko wrote:
>>>> Hello all.
>>>>
>>>> [Sorry for the possible format issues]
>>>>
>>>> On Tue, Dec 22, 2020 at 12:41 PM Andrew Cooper <andrew.cooper3@citrix.com>
>>>> wrote:
>>>>
>>>>> On 21/12/2020 08:10, Jan Beulich wrote:
>>>>>> On 17.12.2020 20:18, Andrew Cooper wrote:
>>>>>>> On 15/12/2020 16:26, Jan Beulich wrote:
>>>>>>>> This is together with its only caller, xenmem_add_to_physmap_one().
>>>>>>> I can't parse this sentence.  Perhaps "... as is it's only caller," as a
>>>>>>> follow-on from the subject sentence.
>>>>>>>
>>>>>>>>    Move
>>>>>>>> the latter next to p2m_add_foreign(), allowing this one to become
>>>>> static
>>>>>>>> at the same time.
>>>>>>>>
>>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>> So I had to ask Andrew to revert this (I was already at home when
>>>>>> noticing the breakage), as it turned out to break the shim build.
>>>>>> The problem is that xenmem_add_to_physmap() is non-static and
>>>>>> hence can't be eliminated altogether by the compiler when !HVM.
>>>>>> We could make the function conditionally static
>>>>>> "#if !defined(CONFIG_X86) && !defined(CONFIG_HVM)", but this
>>>>>> looks uglier to me than this extra hunk:
>>>>>>
>>>>>> --- unstable.orig/xen/common/memory.c
>>>>>> +++ unstable/xen/common/memory.c
>>>>>> @@ -788,7 +788,11 @@ int xenmem_add_to_physmap(struct domain
>>>>>>        union add_to_physmap_extra extra = {};
>>>>>>        struct page_info *pages[16];
>>>>>>
>>>>>> -    ASSERT(paging_mode_translate(d));
>>>>>> +    if ( !paging_mode_translate(d) )
>>>>>> +    {
>>>>>> +        ASSERT_UNREACHABLE();
>>>>>> +        return -EACCES;
>>>>>> +    }
>>>>>>
>>>>>>        if ( xatp->space == XENMAPSPACE_gmfn_foreign )
>>>>>>            extra.foreign_domid = DOMID_INVALID;
>>>>>>
>>>>>> Andrew, please let me know whether your ack stands with this (or
>>>>>> said alternative) added, or whether you'd prefer me to re-post.
>>>>> Yeah, this is probably neater than the ifdefary.  My ack stands.
>>>>>
>>>>> ~Andrew
>>>>>
>>>> I might miss something or did incorrect tests, but ...
>>>> ... trying to build current staging
>>>> (7ba2ab495be54f608cb47440e1497b2795bd301a) for x86 (with # CONFIG_HVM is
>>>> not set) I got the following:
>>>>
>>>> /media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb-r0/git/xen/common/memory.c:941:
>>>> undefined reference to `xenmem_add_to_physmap_one'
>>>> /media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb-r0/git/xen/common/memory.c:941:(.text+0x1e391):
>>>> relocation truncated to fit: R_X86_64_PC32 against undefined symbol
>>>> `xenmem_add_to_physmap_one'
>>>> ld:
>>>> /media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb-r0/git/xen/.xen-syms.0:
>>>> hidden symbol `xenmem_add_to_physmap_one' isn't defined
>>>> ld: final link failed: Bad value
>>>>
>>>> It is worth mentioning that I do not use pvshim_defconfig (I disable HVM
>>>> support via menuconfig manually before building).
>>> The specific .config may matter. The specific compiler version may
>>> also matter. Things work fine for me, both for the shim config and
>>> a custom !HVM one, with gcc10.
>> ok, after updating my a little bit ancient compiler to the latest
>> possible (?) on xenial gcc-9 the build issue had gone away. Sorry for
>> the noise.
> There's no reason to be sorry - we want Xen to build with a wide
> range of compiler versions. It's just that if a build issue is
> version dependent, it is often up to the person running into it
> to determine how to address the issue (and submit a patch).

ok, the issue was observed with gcc (Ubuntu 5.4.0-6ubuntu1~16.04.12) 
5.4.0 20160609

I think (but not 100% sure), to address the build issue something like 
the stub below could help:


diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 85a8df9..ed35352 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -609,9 +609,19 @@ union add_to_physmap_extra {
      domid_t foreign_domid;
  };

+#ifdef CONFIG_HVM
  int xenmem_add_to_physmap_one(struct domain *d, unsigned int space,
                                union add_to_physmap_extra extra,
                                unsigned long idx, gfn_t gfn);
+#else
+static inline int xenmem_add_to_physmap_one(struct domain *d,
+                                            unsigned int space,
+                                            union add_to_physmap_extra 
extra,
+                                            unsigned long idx, gfn_t gfn)
+{
+    return -EACCES;
+}
+#endif

  int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap 
*xatp,
                            unsigned int start);

-- 
Regards,

Oleksandr Tyshchenko


