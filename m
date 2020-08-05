Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC0523D03F
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 21:46:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3PLi-00085W-3I; Wed, 05 Aug 2020 19:45:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w8Yv=BP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k3PLg-00085R-Hp
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 19:45:16 +0000
X-Inumbo-ID: 8232f639-f170-492b-8925-a6896dabf402
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8232f639-f170-492b-8925-a6896dabf402;
 Wed, 05 Aug 2020 19:45:15 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id s16so33829955ljc.8
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2020 12:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=jXGBKthtVoRPS37ymfF9cwHpxqndAf8UpmNF+uHu80w=;
 b=d3iuRYG7D0OqgVn3qvImKMbma7EhFkjB/cvRvFdniQLvHgdDil8ql5Cz+gR3Ot8jXW
 RByAt+q3dAQ4uN7Yn2EQy+48NKlnNdBUWlIcbqLEuaQMijI8e0VpKKwoyVHCTM5My17v
 DKEv8W4WI4kg/THnn3J3qMfXPZ2eUpjd044TPNpmlso+LJ7UhsekNOHdRoA9jVtkPu+p
 hcUCEWGhSC0n9laKxDJmNVCm8267kz15JsqiFcGgA7giAm+nI4ORj/P2RtJFLEbqAEGW
 SVdI9hwbtloCNgFFNIJbWyr0JV/KOcp3sV2I8Vy4WuP8IGNvyNUW3WaVlWIcR9BlIXZX
 5wcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=jXGBKthtVoRPS37ymfF9cwHpxqndAf8UpmNF+uHu80w=;
 b=cDnSMikzf3NzVRzPH21haSKKuxCSDuSjQcniGHPfsyeO8T9uPfmEl9Jrrj2rRiKeiO
 Gwma8ReY8cB36wYi4Ikc+f4IebKu2++DpYvL8y9SyEKDoVnZ8lTpz6NDvy8qDG5oBM2R
 rQ3b2utqZFjFDTm4WYi7Yt0+8B6n1Z5kRp+IJ/ErabkVegfOA9NGri3x9E5l3xO3QL11
 S/R4JxYFTLAL4yha3XYvrr6xQmS4Yi3i8NttUMzr41O3c00Z0nlQaibcV8w2aiiUEXc5
 sDcPytDI3nPKprnQHp7VWkAoGfslcxQ4kcR8V4nFUw9cgbwKp/qvFN2EKCbDxLo0tx8s
 otbA==
X-Gm-Message-State: AOAM530YO/PIIcDyMmfKEC7VVek6Ubl9ITFhIxDI8TUkk6ytbTjUiw4T
 vwdzJ6lisVJ22N2N/3t0Wus=
X-Google-Smtp-Source: ABdhPJy+M/VpUSsI2AG6KIJdbcnHjoF/PsX9qeFnQLbp8rFEECt9g6pvloSeNNS6JNBez3Y+TfCbiw==
X-Received: by 2002:a05:651c:1051:: with SMTP id
 x17mr2323222ljm.141.1596656714197; 
 Wed, 05 Aug 2020 12:45:14 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id a19sm1553883lff.25.2020.08.05.12.45.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2020 12:45:13 -0700 (PDT)
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2008041327110.5748@sstabellini-ThinkPad-T480s>
 <cb48c78c-60fc-7dad-58d0-7a0a095ab4d4@suse.com>
 <alpine.DEB.2.21.2008050938450.5748@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <e94bf263-d76d-776b-f1d9-b03804a8b446@gmail.com>
Date: Wed, 5 Aug 2020 22:45:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008050938450.5748@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 05.08.20 19:41, Stefano Stabellini wrote:
Hi Stefano

> On Wed, 5 Aug 2020, Jan Beulich wrote:
>> On 05.08.2020 01:22, Stefano Stabellini wrote:
>>> On Mon, 3 Aug 2020, Oleksandr Tyshchenko wrote:
>>>> --- a/xen/include/asm-arm/p2m.h
>>>> +++ b/xen/include/asm-arm/p2m.h
>>>> @@ -385,10 +385,11 @@ static inline int set_foreign_p2m_entry(struct domain *d, unsigned long gfn,
>>>>                                           mfn_t mfn)
>>>>   {
>>>>       /*
>>>> -     * NOTE: If this is implemented then proper reference counting of
>>>> -     *       foreign entries will need to be implemented.
>>>> +     * XXX: handle properly reference. It looks like the page may not always
>>>> +     * belong to d.
>>> Just as a reference, and without taking away anything from the comment,
>>> I think that QEMU is doing its own internal reference counting for these
>>> mappings.
>> Which of course in no way replaces the need to do proper ref counting
>> in Xen. (Just FAOD, as I'm not sure why you've said what you've said.)
> Given the state of the series, which is a RFC, I only meant to say that
> the lack of refcounting shouldn't prevent things from working when using
> QEMU. In the sense that if somebody wants to give it a try for an early
> demo, they should be able to see it running without crashes.

Yes, for the early demo it works fine, however I don't use Qemu.


>
> Of course, refcounting needs to be implemented.

+


-- 
Regards,

Oleksandr Tyshchenko


