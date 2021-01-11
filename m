Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A902F0DEB
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 09:23:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64649.114230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kysTm-0004Z6-TY; Mon, 11 Jan 2021 08:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64649.114230; Mon, 11 Jan 2021 08:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kysTm-0004Yf-PW; Mon, 11 Jan 2021 08:23:10 +0000
Received: by outflank-mailman (input) for mailman id 64649;
 Mon, 11 Jan 2021 08:23:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oy8T=GO=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kysTl-0004YW-4e
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 08:23:09 +0000
Received: from mail-ed1-x52c.google.com (unknown [2a00:1450:4864:20::52c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6197afe9-5c65-40e1-ae96-c1e5db961ce8;
 Mon, 11 Jan 2021 08:23:07 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id y24so17823731edt.10
 for <xen-devel@lists.xenproject.org>; Mon, 11 Jan 2021 00:23:07 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z25sm6645107ejd.23.2021.01.11.00.23.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 00:23:06 -0800 (PST)
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
X-Inumbo-ID: 6197afe9-5c65-40e1-ae96-c1e5db961ce8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=X+xsdFwqzCwzysA/Wmmx21ACuIz2jgT6UDqW3BpMumU=;
        b=lV6d1LhUo98w9V0oiYwzRDDfvyPlPmaILWHwYmL+OYNYtv+GgOXyFIT0gf41ScXkFW
         vy1vfKnveDO9oFYU5eXuqWLsgb3cjVEIORNUSaJe6DGespQnBPWHNwFc7QvKWS20LHWB
         VdlNyHFMKfdJKSEIcuMKpYHNUZw5NPYPe1NnDxRUEA6/SLXS4VW1TyXEthyYPX/Kzcbw
         f7Xr7lsNMGwmuDLgCGjf9Jb02qSPoaA5gG+O3FsIKoIWxPnf49VXWqK4ZcSbgnC6gCV4
         T4kPddHHu2tZTy5OiH2ZlDpVAkwAkmXq9Rbw444D+ixFa7xEZOJsR3H5MIHDL65GvYH9
         ydnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=X+xsdFwqzCwzysA/Wmmx21ACuIz2jgT6UDqW3BpMumU=;
        b=S6hayt33t6l/jmy0ebcW3LeYYjg8wQUjSKV45xmjnsNNIUlGEMDZxH4PDkUmd/3pRq
         fmNHJvZ/Us3cIRi+gR7E3Hx3OYkY+cVOMelpZTp6g89+tnCP81CkhxVTvDTwUjjZnRFV
         7wpBfaM4ipzscdsCWJTkXLxfqRJmuqwTsyfQeOhliah+wP0a11DC3Icp689dV43adnWw
         Oh7eafgDfRqgOIihqmtUsnhD/5UioYfubELRa8NKxyfOFqrcAYbd2SYGNEBH0q0WzFuT
         aIm0+kcXcbYYcsUnssMjzCWrWisS0JGq0WS7rCA+Kq2yglALup/wv5JvNhO5bFgR9nP2
         ljGA==
X-Gm-Message-State: AOAM5324wuAwf0vMb1Eoi4dx1ugtpv508yKVr9yK2loH0Sp2NSBsCQQf
	71wEpNGlxc+Y//VYiGJK1Mg=
X-Google-Smtp-Source: ABdhPJxynxKlhr5YK8J7XYZxnQGWFsmFGy6dOlD1Om/aQIFXKyLMPfbMdBE004ZweTbBIZR9eNin2w==
X-Received: by 2002:a05:6402:a53:: with SMTP id bt19mr13595047edb.104.1610353386814;
        Mon, 11 Jan 2021 00:23:06 -0800 (PST)
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
 <c8315e16-6130-e990-3d16-d0d42b2f92c4@gmail.com>
 <ec041f81-4b80-5ffb-8219-6732f50bef36@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <f6f1ffdd-619d-017e-6820-276814056845@gmail.com>
Date: Mon, 11 Jan 2021 10:23:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ec041f81-4b80-5ffb-8219-6732f50bef36@suse.com>
Content-Type: multipart/mixed;
 boundary="------------4599ACA034CD60F037B96A8E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4599ACA034CD60F037B96A8E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11.01.21 09:41, Jan Beulich wrote:

Hi Jan


> On 08.01.2021 18:37, Oleksandr wrote:
>> On 08.01.21 19:01, Jan Beulich wrote:
>>
>> Hi Jan
>>
>>> On 08.01.2021 17:38, Oleksandr wrote:
>>>> On 05.01.21 10:48, Jan Beulich wrote:
>>>>> On 04.01.2021 17:57, Oleksandr Tyshchenko wrote:
>>>>>> Hello all.
>>>>>>
>>>>>> [Sorry for the possible format issues]
>>>>>>
>>>>>> On Tue, Dec 22, 2020 at 12:41 PM Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>> wrote:
>>>>>>
>>>>>>> On 21/12/2020 08:10, Jan Beulich wrote:
>>>>>>>> On 17.12.2020 20:18, Andrew Cooper wrote:
>>>>>>>>> On 15/12/2020 16:26, Jan Beulich wrote:
>>>>>>>>>> This is together with its only caller, xenmem_add_to_physmap_one().
>>>>>>>>> I can't parse this sentence.  Perhaps "... as is it's only caller," as a
>>>>>>>>> follow-on from the subject sentence.
>>>>>>>>>
>>>>>>>>>>     Move
>>>>>>>>>> the latter next to p2m_add_foreign(), allowing this one to become
>>>>>>> static
>>>>>>>>>> at the same time.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>>>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>>>> So I had to ask Andrew to revert this (I was already at home when
>>>>>>>> noticing the breakage), as it turned out to break the shim build.
>>>>>>>> The problem is that xenmem_add_to_physmap() is non-static and
>>>>>>>> hence can't be eliminated altogether by the compiler when !HVM.
>>>>>>>> We could make the function conditionally static
>>>>>>>> "#if !defined(CONFIG_X86) && !defined(CONFIG_HVM)", but this
>>>>>>>> looks uglier to me than this extra hunk:
>>>>>>>>
>>>>>>>> --- unstable.orig/xen/common/memory.c
>>>>>>>> +++ unstable/xen/common/memory.c
>>>>>>>> @@ -788,7 +788,11 @@ int xenmem_add_to_physmap(struct domain
>>>>>>>>         union add_to_physmap_extra extra = {};
>>>>>>>>         struct page_info *pages[16];
>>>>>>>>
>>>>>>>> -    ASSERT(paging_mode_translate(d));
>>>>>>>> +    if ( !paging_mode_translate(d) )
>>>>>>>> +    {
>>>>>>>> +        ASSERT_UNREACHABLE();
>>>>>>>> +        return -EACCES;
>>>>>>>> +    }
>>>>>>>>
>>>>>>>>         if ( xatp->space == XENMAPSPACE_gmfn_foreign )
>>>>>>>>             extra.foreign_domid = DOMID_INVALID;
>>>>>>>>
>>>>>>>> Andrew, please let me know whether your ack stands with this (or
>>>>>>>> said alternative) added, or whether you'd prefer me to re-post.
>>>>>>> Yeah, this is probably neater than the ifdefary.  My ack stands.
>>>>>>>
>>>>>>> ~Andrew
>>>>>>>
>>>>>> I might miss something or did incorrect tests, but ...
>>>>>> ... trying to build current staging
>>>>>> (7ba2ab495be54f608cb47440e1497b2795bd301a) for x86 (with # CONFIG_HVM is
>>>>>> not set) I got the following:
>>>>>>
>>>>>> /media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb-r0/git/xen/common/memory.c:941:
>>>>>> undefined reference to `xenmem_add_to_physmap_one'
>>>>>> /media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb-r0/git/xen/common/memory.c:941:(.text+0x1e391):
>>>>>> relocation truncated to fit: R_X86_64_PC32 against undefined symbol
>>>>>> `xenmem_add_to_physmap_one'
>>>>>> ld:
>>>>>> /media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb-r0/git/xen/.xen-syms.0:
>>>>>> hidden symbol `xenmem_add_to_physmap_one' isn't defined
>>>>>> ld: final link failed: Bad value
>>>>>>
>>>>>> It is worth mentioning that I do not use pvshim_defconfig (I disable HVM
>>>>>> support via menuconfig manually before building).
>>>>> The specific .config may matter. The specific compiler version may
>>>>> also matter. Things work fine for me, both for the shim config and
>>>>> a custom !HVM one, with gcc10.
>>>> ok, after updating my a little bit ancient compiler to the latest
>>>> possible (?) on xenial gcc-9 the build issue had gone away. Sorry for
>>>> the noise.
>>> There's no reason to be sorry - we want Xen to build with a wide
>>> range of compiler versions. It's just that if a build issue is
>>> version dependent, it is often up to the person running into it
>>> to determine how to address the issue (and submit a patch).
>> ok, the issue was observed with gcc (Ubuntu 5.4.0-6ubuntu1~16.04.12)
>> 5.4.0 20160609
>>
>> I think (but not 100% sure), to address the build issue something like
>> the stub below could help:
> I'm sure this would help, but personally I'd prefer if we could limit
> the number of such stubs and rely on the compiler DCE-ing the calls.
> Hence it would be at least desirable (imo necessary) to understand
> what prevents this to happen here, with this gcc version.

Sounds reasonable


>
> If you could also provide your exact .config, I could see whether I
> can repro here with some of the gcc5 versions I have laying around.

Please see attached

-- 
Regards,

Oleksandr Tyshchenko


--------------4599ACA034CD60F037B96A8E
Content-Type: text/plain; charset=UTF-8;
 name=".config"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename=".config"

IwojIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgojIFhlbi94
ODYgNC4xNS11bnN0YWJsZSBDb25maWd1cmF0aW9uCiMKQ09ORklHX0NDX0lTX0dDQz15CkNP
TkZJR19HQ0NfVkVSU0lPTj01MDQwMApDT05GSUdfQ0xBTkdfVkVSU0lPTj0wCkNPTkZJR19D
Q19IQVNfVklTSUJJTElUWV9BVFRSSUJVVEU9eQpDT05GSUdfWDg2XzY0PXkKQ09ORklHX1g4
Nj15CkNPTkZJR19BUkNIX0RFRkNPTkZJRz0iYXJjaC94ODYvY29uZmlncy94ODZfNjRfZGVm
Y29uZmlnIgpDT05GSUdfSU5ESVJFQ1RfVEhVTks9eQoKIwojIEFyY2hpdGVjdHVyZSBGZWF0
dXJlcwojCkNPTkZJR19OUl9DUFVTPTI1NgpDT05GSUdfUFY9eQpDT05GSUdfUFYzMj15CkNP
TkZJR19QVl9MSU5FQVJfUFQ9eQojIENPTkZJR19IVk0gaXMgbm90IHNldApDT05GSUdfU0hB
RE9XX1BBR0lORz15CiMgQ09ORklHX0JJR01FTSBpcyBub3Qgc2V0CkNPTkZJR19UQk9PVD15
CkNPTkZJR19YRU5fQUxJR05fREVGQVVMVD15CiMgQ09ORklHX1hFTl9BTElHTl8yTSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1hFTl9HVUVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX0hZUEVSVl9H
VUVTVCBpcyBub3Qgc2V0CiMgZW5kIG9mIEFyY2hpdGVjdHVyZSBGZWF0dXJlcwoKIwojIENv
bW1vbiBGZWF0dXJlcwojCkNPTkZJR19DT01QQVQ9eQpDT05GSUdfQ09SRV9QQVJLSU5HPXkK
Q09ORklHX0dSQU5UX1RBQkxFPXkKQ09ORklHX0hBU19BTFRFUk5BVElWRT15CkNPTkZJR19I
QVNfRVhfVEFCTEU9eQpDT05GSUdfSEFTX0ZBU1RfTVVMVElQTFk9eQpDT05GSUdfSEFTX0lP
UE9SVFM9eQpDT05GSUdfSEFTX0tFWEVDPXkKQ09ORklHX0hBU19NRU1fUEFHSU5HPXkKQ09O
RklHX0hBU19QRFg9eQpDT05GSUdfSEFTX1NDSEVEX0dSQU5VTEFSSVRZPXkKQ09ORklHX0hB
U19VQlNBTj15CkNPTkZJR19NRU1fQUNDRVNTX0FMV0FZU19PTj15CkNPTkZJR19NRU1fQUND
RVNTPXkKQ09ORklHX05FRURTX0xJQkVMRj15CgojCiMgU3BlY3VsYXRpdmUgaGFyZGVuaW5n
CiMKQ09ORklHX1NQRUNVTEFUSVZFX0hBUkRFTl9BUlJBWT15CkNPTkZJR19TUEVDVUxBVElW
RV9IQVJERU5fQlJBTkNIPXkKIyBlbmQgb2YgU3BlY3VsYXRpdmUgaGFyZGVuaW5nCgpDT05G
SUdfSFlQRlM9eQpDT05GSUdfSFlQRlNfQ09ORklHPXkKQ09ORklHX0tFWEVDPXkKQ09ORklH
X1hFTk9QUk9GPXkKIyBDT05GSUdfWFNNIGlzIG5vdCBzZXQKQ09ORklHX1NDSEVEX0NSRURJ
VD15CkNPTkZJR19TQ0hFRF9DUkVESVQyPXkKQ09ORklHX1NDSEVEX1JURFM9eQpDT05GSUdf
U0NIRURfQVJJTkM2NTM9eQpDT05GSUdfU0NIRURfTlVMTD15CkNPTkZJR19TQ0hFRF9ERUZB
VUxUPSJjcmVkaXQyIgpDT05GSUdfQ1JZUFRPPXkKQ09ORklHX0xJVkVQQVRDSD15CkNPTkZJ
R19GQVNUX1NZTUJPTF9MT09LVVA9eQpDT05GSUdfRU5GT1JDRV9VTklRVUVfU1lNQk9MUz15
CkNPTkZJR19DTURMSU5FPSIiCkNPTkZJR19ET00wX01FTT0iIgpDT05GSUdfVFJBQ0VCVUZG
RVI9eQojIGVuZCBvZiBDb21tb24gRmVhdHVyZXMKCiMKIyBEZXZpY2UgRHJpdmVycwojCkNP
TkZJR19BQ1BJPXkKQ09ORklHX0FDUElfTEVHQUNZX1RBQkxFU19MT09LVVA9eQpDT05GSUdf
TlVNQT15CkNPTkZJR19IQVNfTlMxNjU1MD15CkNPTkZJR19IQVNfRUhDST15CkNPTkZJR19I
QVNfQ1BVRlJFUT15CkNPTkZJR19IQVNfUEFTU1RIUk9VR0g9eQpDT05GSUdfSEFTX1BDST15
CkNPTkZJR19WSURFTz15CkNPTkZJR19WR0E9eQojIGVuZCBvZiBEZXZpY2UgRHJpdmVycwoK
IyBDT05GSUdfRVhQRVJUIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfU1VQUE9SVFNfSU5UMTI4
PXkKCiMKIyBEZWJ1Z2dpbmcgT3B0aW9ucwojCkNPTkZJR19ERUJVRz15CiMgQ09ORklHX0NS
QVNIX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX0dEQlNYPXkKQ09ORklHX0RFQlVHX0lORk89
eQpDT05GSUdfRlJBTUVfUE9JTlRFUj15CiMgQ09ORklHX0RFQlVHX0xPQ0tfUFJPRklMRSBp
cyBub3Qgc2V0CkNPTkZJR19ERUJVR19MT0NLUz15CiMgQ09ORklHX1BFUkZfQ09VTlRFUlMg
aXMgbm90IHNldApDT05GSUdfVkVSQk9TRV9ERUJVRz15CkNPTkZJR19TQ1JVQl9ERUJVRz15
CiMgQ09ORklHX1VCU0FOIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfVFJBQ0UgaXMgbm90
IHNldApDT05GSUdfWE1FTV9QT09MX1BPSVNPTj15CiMgZW5kIG9mIERlYnVnZ2luZyBPcHRp
b25zCg==
--------------4599ACA034CD60F037B96A8E--

