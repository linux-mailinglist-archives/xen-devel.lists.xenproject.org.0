Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC7B4255B9
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 16:42:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203687.358870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYUb5-0002TQ-72; Thu, 07 Oct 2021 14:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203687.358870; Thu, 07 Oct 2021 14:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYUb5-0002QD-2S; Thu, 07 Oct 2021 14:42:11 +0000
Received: by outflank-mailman (input) for mailman id 203687;
 Thu, 07 Oct 2021 14:42:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4W4d=O3=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mYUb3-0002P9-8F
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 14:42:09 +0000
Received: from mail-ed1-x52e.google.com (unknown [2a00:1450:4864:20::52e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b22f1b91-adc2-4e16-bc39-026891452f59;
 Thu, 07 Oct 2021 14:42:08 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id d9so45302edh.5
 for <xen-devel@lists.xenproject.org>; Thu, 07 Oct 2021 07:42:08 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k22sm10036374eje.89.2021.10.07.07.42.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 07:42:07 -0700 (PDT)
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
X-Inumbo-ID: b22f1b91-adc2-4e16-bc39-026891452f59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=4K0lcUrqBzAbVC/KiHkUa0EpMDN7BjwOltB1b+F8d6w=;
        b=mFdC/xQMjGBGONZ6fMGqmQ/9ps6VfpbL+Z9fX4l7AMH1hx1mdFpMbGO1ARILOi74ul
         jCfOJkj9iO1mfh42WjLRIzLNIR0yNCQdW2W9hSIAWp43SelBIpDjmpwGWZN8bYqyu4kV
         k3Ld01Wwqqv4U3FVS1FSN+aoFcpcyfYeS+MiU4ImK0jzmMTDQrjAJIzaevCB0K4K/CDW
         IbZIlVJtyUQ2JP9zOyGeV2guCH73O9w6vjf/OTacIGBu6Z89p6LMywpa/fWX1IMDZqLc
         gGOX8wqicu2UAelxh1goLudbQfp6VFciqPrk+jARs7WYJq/pNvihDi+EIA9pfsKU5uby
         rlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=4K0lcUrqBzAbVC/KiHkUa0EpMDN7BjwOltB1b+F8d6w=;
        b=DuNs+a/0ax7YsKoFXDCGmq+FJ3m3Z4c2fqcixnWVCu0UsAyrJG4Vpy0auvSULps2MH
         bGLvAShhF7HidMzWPoYHe1oG0TZNlSgvOWuQkKOgmy9RWcOBgz5gknZQjyBfV24OGe6w
         Tl2Y11xMpeA1AFkjeiAdz0hWxtAzbOIGyko9vo36dmqxqLTXIijhs8DQTH2oYZ9uvsn/
         RR7/Wne63A+kr+fj3MkzuRwTWB5oIJ0YOG4yWDypKAhzE7zeJu9Og9O8Qz24W3RGbe/P
         RT/o3t+39ErOLivhKzJh8GyDtu9jcYnSS3jeWg3ETQJQxmrZy9FMYsh7uUVuxcNSsjSX
         NxTA==
X-Gm-Message-State: AOAM532hAJzpBDoPFV2vSWUUi6xQoE9PVAZ9a+Ule4wshCEGFExv6RW/
	WbH7dBRZJA05E6tdIN1gyPs=
X-Google-Smtp-Source: ABdhPJyQIs5Wca63Iysy5mgBc9oNRHg+mkM2KUzycaDukhzAKODvs0VHlupvc9n3hpEi2QgzhjQYpg==
X-Received: by 2002:a05:6402:19b5:: with SMTP id o21mr6928114edz.214.1633617727427;
        Thu, 07 Oct 2021 07:42:07 -0700 (PDT)
Subject: Re: [PATCH V5 2/3] libxl/arm: Add handling of extended regions for
 DomU
To: Ian Jackson <iwj@xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com>
 <1633519346-3686-3-git-send-email-olekstysh@gmail.com>
 <24925.35278.762786.539238@mariner.uk.xensource.com>
 <224ed316-aac0-3ad4-22a1-efc592e717e2@gmail.com>
 <alpine.DEB.2.21.2110061658450.3209@sstabellini-ThinkPad-T480s>
 <24926.53922.628049.481827@mariner.uk.xensource.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <0450c601-656a-4e10-1802-433d2e5c44d8@gmail.com>
Date: Thu, 7 Oct 2021 17:42:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <24926.53922.628049.481827@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 07.10.21 13:57, Ian Jackson wrote:

Hi Ian.

> Stefano Stabellini writes ("Re: [PATCH V5 2/3] libxl/arm: Add handling of extended regions for DomU"):
>> On Wed, 6 Oct 2021, Oleksandr wrote:
>>> On 06.10.21 14:34, Ian Jackson wrote:
>>>> Oleksandr Tyshchenko writes ("[PATCH V5 2/3] libxl/arm: Add handling of
>>>> extended regions for DomU"):
>>>>> The extended region (safe range) is a region of guest physical
>>>>> address space which is unused and could be safely used to create
>>>>> grant/foreign mappings instead of wasting real RAM pages from
>>>>> the domain memory for establishing these mappings.
>>>> Please forgive me for asking this question now, but: why is this
>>>> ARM-specific ?
>>>
>>> Sorry, I can't say for sure which x86 mode also suffers from
>>> that. I might be wrong, but as I understand that x86 in PVH (and
>>> HVM?) mode uses unpopulated memory ranges (which are unused from
>>> Linux PoV, actually everything not yet allocated or reserved from
>>> "iomem_resource") to create foreign/grant mappings.  So the real
>>> RAM pages are not ballooned out to get an physical address space
>>> to create these mappings. The problem is that we cannot follow
>>> Linux advise which memory ranges are unused on Arm for several
>>> reasons, this is why this patch series makes the hypervisor to
>>> start allocating and exposing these ranges.
> So it sounds like you are saying this is an ARM-specific problem ?
> The key being the "several reasons" which you mention.  Are they
> ARM-specifc problems.

Yes, you could say that. Below are reasons why we need the hypervisor to 
provide these ranges on Arm from my understanding.

[leaving aside hotplug case]

1. [Related to Dom0]  Dom0 is mapped 1:1 on Arm, but there might be some 
guest mapping, mapped identically in P2M (GFN == MFN) for PV drivers to 
work. So Xen has everything in hand to be able to choose extended 
regions (which won't clash with other resources).
2. [Related to every domain]  Not all device I/O regions might be known 
(registered) by the time the guest starts creating grant/foreign 
mappings, so guest cannot guess by itself what is really unused, but the 
entity which creates the domain (Xen, toolstack) knows these details in 
advance to be able to choose extended regions (which won't clash with 
other resources).


>
>> Two more things about this being ARM-specific.
>>
>> Even if x86 was affected exactly by the same problem, the code to expose
>> the safe memory ranges to DomU is arch-specific (currently device tree.)
>>
>> Also the code to calculate the safe memory ranges is arch-specific as it
>> depends on the DomU memory layout which is arch-specific.
> This demonstrates that the implementation is arch-specific.  But one
> of libxl's functions is to abstract away implementation details and
> provide an interface that can be used to "do the right thing".
>
> Ian.

-- 
Regards,

Oleksandr Tyshchenko


