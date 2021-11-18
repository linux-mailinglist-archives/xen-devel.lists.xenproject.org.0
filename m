Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFFB45631B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 20:04:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227582.393651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnmi3-0000Kn-RU; Thu, 18 Nov 2021 19:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227582.393651; Thu, 18 Nov 2021 19:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnmi3-0000Ht-OQ; Thu, 18 Nov 2021 19:04:35 +0000
Received: by outflank-mailman (input) for mailman id 227582;
 Thu, 18 Nov 2021 19:04:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tNz=QF=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mnmi2-0000HX-FY
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 19:04:34 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d73d883-48a2-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 20:04:33 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id b40so31037901lfv.10
 for <xen-devel@lists.xenproject.org>; Thu, 18 Nov 2021 11:04:33 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id o17sm12344lfn.50.2021.11.18.11.04.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 11:04:32 -0800 (PST)
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
X-Inumbo-ID: 5d73d883-48a2-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=G1Qx5xvvEgGKi2uAbKYdFA3Jpya7JG3GAmYp9/wd4RA=;
        b=eHD3uvFpOJ3kY08WIE6U4FALAxk6vRIJtAkEHwKHA5I1PJnOjZkGowgImyT6VSjjEe
         KySHOfcWlg4+0EBlVjzIFh2znxzzd+TZLE4H+XM0rJq2+46M7cgkAnaA7nvdMpi+X6wV
         jATUWv+KedTgJevEVm8FBBcUT7pVlULDTj01uHuCw/6UL2YydoE1wSl7D8vs9TEs1IAX
         0icz90OWfRQ5mOU6hxdB4vRg4Id7O/9pXQPYSrb0THYEdo5yd+/UF1KJUzC+4Tzj7Owd
         V+qyJcB9OiuqiG/r+0yJkGy0LTtWdsFPnXvYu5H5ndMOdZHlAKCFaHaU8Xd+U5D1NHmd
         yGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=G1Qx5xvvEgGKi2uAbKYdFA3Jpya7JG3GAmYp9/wd4RA=;
        b=kRXivfXSbFR494tHu/3s55DSfr+l3iwdqB1ZnukexlhC07lcRjeTRp2Zq8Kp/dFZTk
         qOuCLbWgCDuApL7tAorBEO9RSkbZGEC/6Rld0HgXDPPHzUMnBQ6BOXW+qssDoV9Yxj2H
         b12PD2cn10o91nKm9HWAPtQ/Kj27n+nrrvy77uNn4lRJ1fdDCzMDRLySQIFYMmS64Nzm
         sYSY0ICSs6JoS2B/uwDpF3Vn92K74z9d+gW37Dc6VGsxgL7aAeI7BAOC9jPHa7uYqSWF
         O9ADLKMk5l701pyqjOc5Cr1D9BjOFwT+sVdEcaFrEKX0FLp7wmUsQp0y2Kv5QgyFF6ez
         tvxg==
X-Gm-Message-State: AOAM532rCa1PdLSZ+PLZv1uWXCCLHvD8Fy/VdteYwUUeOW9p0ZdRcc42
	V25VBEZNwILNfFTKyYoI5tY=
X-Google-Smtp-Source: ABdhPJzaFHStI21+VziopIbXQgR6syncIKNuElOP0ssSAnNEQQ1Pqi2P9+WbREYTqOo2n4F5ZsqMqw==
X-Received: by 2002:ac2:4c50:: with SMTP id o16mr26669215lfk.517.1637262272920;
        Thu, 18 Nov 2021 11:04:32 -0800 (PST)
Subject: Re: [PATCH for-4.16 2/2] CHANGELOG: add missing entries for work
 during the 4.16 release cycle
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
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
 Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Paul Durrant <paul@xen.org>,
 Quan Xu <quan.xu0@gmail.com>, Rahul Singh <rahul.singh@arm.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Shriram Rajagopalan <rshriram@cs.ubc.ca>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Tim Deegan <tim@xen.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Community Manager <community.manager@xenproject.org>
References: <20211117095338.14947-1-roger.pau@citrix.com>
 <20211117095338.14947-3-roger.pau@citrix.com>
 <CAPD2p-nb7u7om7zv5-KvfZTsmGis9uGfBkvwjEXrym_+4PN-RQ@mail.gmail.com>
 <YZaOgGWfbDkIq4Lq@Air-de-Roger>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <d4f3d50d-9875-f7bf-2c82-83f8fedb8cfc@gmail.com>
Date: Thu, 18 Nov 2021 21:04:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YZaOgGWfbDkIq4Lq@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 18.11.21 19:33, Roger Pau Monné wrote:

Hi Roger


> On Thu, Nov 18, 2021 at 06:11:07PM +0200, Oleksandr Tyshchenko wrote:
>> On Wed, Nov 17, 2021 at 11:54 AM Roger Pau Monne <roger.pau@citrix.com>
>> wrote:
>>
>> Hi Roger, all
>>
>> [Sorry for the possible format issues]
>>
>> Document some of the relevant changes during the 4.16 release cycle,
>>> likely more entries are missing.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>>   CHANGELOG.md | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>>>
>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>> index ad1a8c2bc2..8b0bdd9cf0 100644
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -21,6 +21,17 @@ The format is based on [Keep a Changelog](
>>> https://keepachangelog.com/en/1.0.0/)
>>>    - qemu-traditional based device models (both, qemu-traditional and
>>> ioemu-stubdom) will
>>>      no longer be built per default. In order to be able to use those,
>>> configure needs to
>>>      be called with "--enable-qemu-traditional" as parameter.
>>> + - Fixes for credit2 scheduler stability in corner case conditions.
>>> + - Ongoing improvements in the hypervisor build system.
>>> + - vtpmmgr miscellaneous fixes in preparation for TPM 2.0 support.
>>> + - 32bit PV guests only supported in shim mode.
>>> + - Improved PVH dom0 debug key handling.
>>> + - Fix booting on some Intel systems without a PIT (i8254).
>>>
>> I would add "Various fixes for OP-TEE mediator (Arm)" here and ...
>>
>>
>>
>>> +
>>> +### Added
>>> + - 32bit Arm builds to the automated tests.
>>> + - New x86 pagetable APIs.
>>> + - Arm vPMU support.
>>>
>> "Extended regions support, device tree only (Arm)" here.
>>
>> ...
>> The extended regions are ranges of unused address space exposed to domains
>> as
>> "safe to use" for special memory mappings.
> I've worded this as:
>
> "Report unpopulated memory regions safe to use for foreign mappings,
> Arm and device tree only."
>
> As "extended regions" was IMO too vague. Let me know if that's OK.

I think, it is OK. Nit: maybe replace "foreign" with "foreign/grant"? I 
would be OK either way.

Thank you.


>
> Thanks, Roger.

-- 
Regards,

Oleksandr Tyshchenko


