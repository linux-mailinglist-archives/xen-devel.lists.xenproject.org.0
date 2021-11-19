Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B572456C62
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 10:35:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227703.393926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo0Hy-0004LL-Nm; Fri, 19 Nov 2021 09:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227703.393926; Fri, 19 Nov 2021 09:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo0Hy-0004II-K6; Fri, 19 Nov 2021 09:34:34 +0000
Received: by outflank-mailman (input) for mailman id 227703;
 Fri, 19 Nov 2021 09:34:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GMHT=QG=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mo0Hx-0004IC-So
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 09:34:34 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df852520-491b-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 10:34:20 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id m27so40405196lfj.12
 for <xen-devel@lists.xenproject.org>; Fri, 19 Nov 2021 01:34:20 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b5sm307023lff.278.2021.11.19.01.34.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 01:34:19 -0800 (PST)
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
X-Inumbo-ID: df852520-491b-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=eAP6XJ4o0PmgI8WAMtNC4pMx0n7xuY5MAe6fyQzUAbw=;
        b=OdgNqqoNR0UNkpncKFrGsJVhQm1udH7iLjBdRFBy8ifBgZpNPfIZSFu/d2f/D/HMmx
         qg26Hs4rF9Tmxi6CQaXJUQP86/lUP19py7PmfrXrJ70nX/pH0mDhEqXkks5Ywtl589rT
         K58v335QdLkWWqe3DkBjBqKXPgfVDStSDOf1vM7teEvAtxB/y+DLrLs+AfGcHt+T/emZ
         SJgkVeDPVRThHB5iEAdLANs+1C7RWPBNwnoHhkCr0r1ojjKE3j/rXfqjuPEl4OkY5a6x
         oyX6QBK1BGV3hRhnC2eZgf7g8USyY3M07YSfpxFV/9OOK+6q0aOrKUDlqh7s37IN64t3
         zLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=eAP6XJ4o0PmgI8WAMtNC4pMx0n7xuY5MAe6fyQzUAbw=;
        b=yB42L1tTfYmPuOO3lAw+BZ8oEIsRIAU44xkrStgqlmAJoxHs0Mh9gVMAQzDhxon5NE
         7KoRW7TwVUOVoqMAMfDQiuh1LPnzuk8abNEDh4cXqc5fZCdLimXkvotdEfs+l1la7a9e
         tl9PfvgfEMNR9rkWm7cz929abI8SmwMuY0suvkzRXxIryZhSQyKss5iWt1EvdgY0I5ud
         qIYgRXMH/FkPD6Es3uuLDB61JgUBcEzYxUE1RL+e9D96mx1zPiXucmmlLEHnJFzqIYzD
         useduLn0VeiKWn2Wj1r0E2bLmovyXGSoeXbthM+92eC/7kO70GfyduhUUVkXXGxenL8Q
         s4Gg==
X-Gm-Message-State: AOAM533jLZa6agvidbj0bQ1C6Mc6Uu5IUxK3ZVcZMBsK3DzorP7TpB9b
	9870AIDPQ6TtlRgjVQZrO4A=
X-Google-Smtp-Source: ABdhPJzD3TKxnic5qHDthfyhujd3SQBTrCj44aPkA5uQJtskwIp1UB4xnh1T6dQWWei2jOcFu3gz8g==
X-Received: by 2002:a19:7419:: with SMTP id v25mr30532282lfe.159.1637314460136;
        Fri, 19 Nov 2021 01:34:20 -0800 (PST)
Subject: Re: [PATCH for-4.16 2/2] CHANGELOG: add missing entries for work
 during the 4.16 release cycle
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Dario Faggioli
 <dfaggioli@suse.com>, David Scott <dave@recoil.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Juergen Gross <jgross@suse.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Paul Durrant <paul@xen.org>,
 Quan Xu <quan.xu0@gmail.com>, Rahul Singh <rahul.singh@arm.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Shriram Rajagopalan <rshriram@cs.ubc.ca>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Tim Deegan <tim@xen.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Community Manager <community.manager@xenproject.org>
References: <20211117095338.14947-1-roger.pau@citrix.com>
 <20211117095338.14947-3-roger.pau@citrix.com>
 <CAPD2p-nb7u7om7zv5-KvfZTsmGis9uGfBkvwjEXrym_+4PN-RQ@mail.gmail.com>
 <YZaOgGWfbDkIq4Lq@Air-de-Roger>
 <d4f3d50d-9875-f7bf-2c82-83f8fedb8cfc@gmail.com>
 <YZdZZsgXjZv/rh66@Air-de-Roger>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <41554b67-552b-3e44-9e5e-f7e493ebf615@gmail.com>
Date: Fri, 19 Nov 2021 11:34:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YZdZZsgXjZv/rh66@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 19.11.21 09:59, Roger Pau Monné wrote:

Hi Roger, all


> On Thu, Nov 18, 2021 at 09:04:30PM +0200, Oleksandr wrote:
>> On 18.11.21 19:33, Roger Pau Monné wrote:
>>
>> Hi Roger
>>
>>
>>> On Thu, Nov 18, 2021 at 06:11:07PM +0200, Oleksandr Tyshchenko wrote:
>>>> On Wed, Nov 17, 2021 at 11:54 AM Roger Pau Monne <roger.pau@citrix.com>
>>>> wrote:
>>>>
>>>> Hi Roger, all
>>>>
>>>> [Sorry for the possible format issues]
>>>>
>>>> Document some of the relevant changes during the 4.16 release cycle,
>>>>> likely more entries are missing.
>>>>>
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>> ---
>>>>>    CHANGELOG.md | 11 +++++++++++
>>>>>    1 file changed, 11 insertions(+)
>>>>>
>>>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>>>> index ad1a8c2bc2..8b0bdd9cf0 100644
>>>>> --- a/CHANGELOG.md
>>>>> +++ b/CHANGELOG.md
>>>>> @@ -21,6 +21,17 @@ The format is based on [Keep a Changelog](
>>>>> https://keepachangelog.com/en/1.0.0/)
>>>>>     - qemu-traditional based device models (both, qemu-traditional and
>>>>> ioemu-stubdom) will
>>>>>       no longer be built per default. In order to be able to use those,
>>>>> configure needs to
>>>>>       be called with "--enable-qemu-traditional" as parameter.
>>>>> + - Fixes for credit2 scheduler stability in corner case conditions.
>>>>> + - Ongoing improvements in the hypervisor build system.
>>>>> + - vtpmmgr miscellaneous fixes in preparation for TPM 2.0 support.
>>>>> + - 32bit PV guests only supported in shim mode.
>>>>> + - Improved PVH dom0 debug key handling.
>>>>> + - Fix booting on some Intel systems without a PIT (i8254).
>>>>>
>>>> I would add "Various fixes for OP-TEE mediator (Arm)" here and ...
>>>>
>>>>
>>>>
>>>>> +
>>>>> +### Added
>>>>> + - 32bit Arm builds to the automated tests.
>>>>> + - New x86 pagetable APIs.
>>>>> + - Arm vPMU support.
>>>>>
>>>> "Extended regions support, device tree only (Arm)" here.
>>>>
>>>> ...
>>>> The extended regions are ranges of unused address space exposed to domains
>>>> as
>>>> "safe to use" for special memory mappings.
>>> I've worded this as:
>>>
>>> "Report unpopulated memory regions safe to use for foreign mappings,
>>> Arm and device tree only."
>>>
>>> As "extended regions" was IMO too vague. Let me know if that's OK.
>> I think, it is OK. Nit: maybe replace "foreign" with "foreign/grant"? I
>> would be OK either way.
> Maybe, I would consider grants as foreign mappings also, ie: the
> memory is foreign to the domain, but I can see this being confusing as
> we have a specific kind of mappings that are named foreign.
>
> Does replacing foreign with external seem better?

Fine with me, thank you.


BTW, I noticed that "Support of generic DT IOMMU bindings for SMMU V2 
(Arm)" is not mentioned. Looks like the support has reached upstream 
during the 4.16 release cycle, so worth adding here.

@Julien, @Stefano?





>
> Thanks, Roger.

-- 
Regards,

Oleksandr Tyshchenko


