Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A5130765C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 13:49:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76998.139227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l56ji-0002oV-0W; Thu, 28 Jan 2021 12:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76998.139227; Thu, 28 Jan 2021 12:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l56jh-0002o6-T5; Thu, 28 Jan 2021 12:49:21 +0000
Received: by outflank-mailman (input) for mailman id 76998;
 Thu, 28 Jan 2021 12:49:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tEu6=G7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l56jh-0002o1-5T
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 12:49:21 +0000
Received: from mail-lj1-x22e.google.com (unknown [2a00:1450:4864:20::22e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 656c512a-55aa-4026-8c72-61f492603565;
 Thu, 28 Jan 2021 12:49:20 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id u4so4630553ljh.6
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 04:49:20 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id p17sm1992959ljj.91.2021.01.28.04.49.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 04:49:18 -0800 (PST)
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
X-Inumbo-ID: 656c512a-55aa-4026-8c72-61f492603565
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=dgdSNw9Sde+sbK0Da07wwof2udIJaSaLHHECyeB1A5E=;
        b=QK+p8upsCI5jGaxryHc7KDFMo5cn5PAqIov5pswJPvCRGnsRRL/Zyr1n1hZacd05fV
         Y2LmEEA+crjpgSQUgHAklSq6OLHy+DHAAA1Rf+CuUkpgAdgi1uJ3VNOpJPP1o6+Z2Dq6
         1WL1acxHGEtQmB4DUaz4fMdRRHie0cMl0tmhuPCoPTh18iKtqemhtfDWU7GBCwcIg7QN
         RvNmUO8DNzKzIyfxpRCeP+Di3J/8FyUKmozrG0tA/OzQwT7CiACgvlEBChHBQil5dPYY
         RUfVAT6UYW8xedTliLqaiRe8Q9ANSMgr1q6fAbdbPsbcDBp4ym/3G72PoEuYEall/EOq
         V4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=dgdSNw9Sde+sbK0Da07wwof2udIJaSaLHHECyeB1A5E=;
        b=co3qGxaEewtmErELp4srw2YHEnMX8hginqaBkN+trXmfBi0/9IZM3O5IeTcYQrBEX8
         Y2vDr7y+YKkQRsTr49xXkVvBb1maZuGvJ5xcNa8KFU+NQovksr8XohHojKhPC46SNGGh
         VtxuxGWT+LEeecGrFtEIiDKZZd3cIxLXX4l7JWerwxIEDNNUGSuJLFhQdjgopIOEjxON
         lcYAI+44Jk/AOfEbreeE89wX8RRLxaCcha3eYdWGdG8+Gbdy0IbELzF++S6TEpc3PoG8
         ZsPBjHStk/XfW4XYEtiDblidez2OtqFq2/epfpLRFTOmCe9r/0Ms48qynhR+5BmSrg/x
         K27g==
X-Gm-Message-State: AOAM532YqQYfcTjLKB9TIRW3qxgAXXLJwnRbOjlpujJ63PMe14XxZ7jU
	z8eU7FHC/4cTGvqOV5AAo1M=
X-Google-Smtp-Source: ABdhPJxP287Iu7NymYCcOo3c7w3iDTPxCqVwT+29D2YRiKZayuivNr5xgnT1ROtD3W/eJs2yhjJXsQ==
X-Received: by 2002:a2e:6f05:: with SMTP id k5mr8030901ljc.400.1611838159182;
        Thu, 28 Jan 2021 04:49:19 -0800 (PST)
Subject: Re: [PATCH V5 04/22] xen/ioreq: Make x86's IOREQ feature common
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien.grall.oss@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-5-git-send-email-olekstysh@gmail.com>
 <CAJ=z9a1c+obN3KW_cMr7OH0112_gHSxnAoEJb9qW6R1J38QgQQ@mail.gmail.com>
 <20270711-36bc-6d7d-16cb-4572cace47ed@gmail.com>
 <eb03f366-9405-c193-07be-fbeca29fca4c@xen.org>
 <1156e356-5762-a196-ec16-bb6614912394@gmail.com>
 <alpine.DEB.2.21.2101271235410.9684@sstabellini-ThinkPad-T480s>
 <dd9a1bf6-5afb-158a-6456-a5ded15580bf@gmail.com>
 <0785367a-9349-ae0c-2622-9412297773fc@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <f6983b35-ea63-b48c-e122-ee9c294034ab@gmail.com>
Date: Thu, 28 Jan 2021 14:49:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0785367a-9349-ae0c-2622-9412297773fc@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 28.01.21 13:21, Jan Beulich wrote:

Hi Jan

> On 28.01.2021 12:01, Oleksandr wrote:
>> On 27.01.21 22:46, Stefano Stabellini wrote:
>>> On Wed, 27 Jan 2021, Oleksandr wrote:
>>>> Thank you. I got a request to make a possibility for user to select IOREQ via
>>>> the menuconfig on Arm. Saying tech preview do you mean that I also need to put
>>>> it under CONFIG_EXPERT on Arm?
>>> Normally I would say that unless it actually takes an expert to enable
>>> the feature, it is better to make it depend on CONFIG_UNSUPPORTED [1].
>>>
>>> However, in this case, it might actually take an expert :-)
>>> Additional patches are still required to enable the feature at the
>>> toolstack level, and also the user needs to build a userspace ioreq
>>> server. So in this case I am fine either way. I'll leave it up to you
>>> and Julien to pick the best one.
>>>
>>> Either way, please add "(EXPERT)" or "(UNSUPPORTED)" in the one-line
>>> kconfig description for ARM if possible.
>>>
>>>
>>> [1] https://marc.info/?l=xen-devel&m=161168780401884
>> Thank you for the explanation, personally I would prefer EXPERT, but...
>>
>> It would be really nice if we could agreed regarding that *common*
>> Kconfig option before I submit V6 (which would probably avoid me to send
>> V7 I hope).
>>
>> Now I see it as following (please note, it is a subject for new patch in
>> this series, which should come last):
>>
>> +++ b/xen/common/Kconfig
>> @@ -137,7 +137,13 @@ config HYPFS_CONFIG
>>             want to hide the .config contents from dom0.
>>
>>    config IOREQ_SERVER
>> -       bool
>> +       bool "IOREQ support" if EXPERT || X86
> This would make the prompt visible for x86, which we don't
> want.

Hmm, I missed that point.


> But I guess Stefano was anyway after ...
>
>> +       default X86
>> +       depends on HVM
>> +       ---help---
>> +         Enables generic mechanism for providing emulated devices to
>> the guests.
>> +
>> +         If unsure, say Y.
>   config IOREQ_SERVER
>         bool "IOREQ support (EXPERT)" if EXPERT && !X86
>         default X86
>         depends on HVM
>
> As the prompt should be invisible this way on x86, the (EXPERT)
> doesn't need further qualifying, except maybe in the help text
> (just to avoid this being taken as a possible mistake).

Yes, this works as my initial version *but* is invisible on x86,

what is more that indeed the *EXPERT* tag for IOREQ on x86 will look 
quite odd...

Perfect, thank you.


>
> Jan

-- 
Regards,

Oleksandr Tyshchenko


