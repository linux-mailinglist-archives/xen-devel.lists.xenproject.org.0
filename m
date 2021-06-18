Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0562E3ACAB7
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 14:20:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144557.266050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luDTP-0004Ga-0z; Fri, 18 Jun 2021 12:19:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144557.266050; Fri, 18 Jun 2021 12:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luDTO-0004EP-Tx; Fri, 18 Jun 2021 12:19:46 +0000
Received: by outflank-mailman (input) for mailman id 144557;
 Fri, 18 Jun 2021 12:19:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0aA=LM=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1luDTN-0004EJ-Ec
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 12:19:45 +0000
Received: from mail-lj1-x22d.google.com (unknown [2a00:1450:4864:20::22d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45eedb53-44e6-4426-b7ff-c373e9b6c102;
 Fri, 18 Jun 2021 12:19:44 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id c11so13750617ljd.6
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jun 2021 05:19:44 -0700 (PDT)
Received: from [192.168.10.24] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id m17sm893136lfh.288.2021.06.18.05.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 05:19:42 -0700 (PDT)
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
X-Inumbo-ID: 45eedb53-44e6-4426-b7ff-c373e9b6c102
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=VHUmKlI4aJS4pagUzg+7Tt3nHb/YUaiR7m9vEvW57lw=;
        b=OKdgX0EwgTG8Xy0t84JtVhgFPaQZ/KzTyhAT/HdyFiI7MeCDGCsgKqjktVeN+og0cT
         ZDrEAsKSwPvZVXrA5hcJaWy2yyUz5QDNjRJTjDatQWlJHPGu3GqS7PBKt3uy58MkS1TO
         /NggO9JGKsKl4HVWlPU7Bicr0Hfkz+FJ8Xs5Qj+p2ExoJUu445T/5MJNWFUauUDqd0p4
         EUhiTMWkVMfsYgqvvb7jEOR6nxNTFJnJSt6EISdGkKgkoibJGqDYmYzy/5z1iQOHhF/7
         hbE0DUTXUECpqBHs98bD7td7C0WPLUI1cooRFxsjqc0K5UNRHbx/2a0ejlwNBUYlxkTP
         b6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=VHUmKlI4aJS4pagUzg+7Tt3nHb/YUaiR7m9vEvW57lw=;
        b=ByOm/BAUUrexuJHa/HMYTc4bioIGG6v/uEHDrrKePoySGxbKFsdBRMLnu7GejHBVeS
         fueN6j2Q1wQL8ZrvP2ugT7Br3xQmHFlqEnhuK4NKWAgyHMEZS/BHdxQTyTXNdbsMNuFM
         l9TXSP3mfT5US8i/Z8vjJsnj8Bxuhrcvq3t60oKIeE/34u9X0ZOHI3RBQUW/8H2mGimj
         xdp9fdGIm4kWpeTHal5kDtSx8hvNvuKbo1Vo3pYqFdGAdOc9RAjjysabhYavJMYExBhW
         iw04nh+WUpbSZtq3ZSeIIpbXWAivcEmodMhYXAIByYuArY5rQxMXyBsak2f1AJrR6Ip1
         /0cQ==
X-Gm-Message-State: AOAM533jxGXXNJestTjoEfyHO40ELyHaSRmpnL0rztT0ZDUwoDmFgI3q
	eT2BQb/B9DL9vcd+nf5pCTk=
X-Google-Smtp-Source: ABdhPJx9I5sxJqdk0Zu4qCCOVZP9Ob1u0Y0JO4nKPKwUnu00rZh+XrJJD1utlMMN/4XtlsriUlBSfg==
X-Received: by 2002:a05:651c:102a:: with SMTP id w10mr8921448ljm.486.1624018783309;
        Fri, 18 Jun 2021 05:19:43 -0700 (PDT)
Subject: Re: Uses of /hypervisor memory range (was: FreeBSD/Xen/ARM issues)
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org,
 Roger Pau Monn?? <royger@freebsd.org>, Mitchell Horne <mhorne@freebsd.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>
References: <YIptpndhk6MOJFod@Air-de-Roger>
 <YItwHirnih6iUtRS@mattapan.m5p.com> <YIu80FNQHKS3+jVN@Air-de-Roger>
 <YJDcDjjgCsQUdsZ7@mattapan.m5p.com> <YJURGaqAVBSYnMRf@Air-de-Roger>
 <YJYem5CW/97k/e5A@mattapan.m5p.com> <YJs/YAgB8molh7e5@mattapan.m5p.com>
 <54427968-9b13-36e6-0001-27fb49f85635@xen.org>
 <YJ3jlGSxs60Io+dp@mattapan.m5p.com>
 <93936406-574f-7fd0-53bf-3bafaa4b1947@xen.org>
 <YJ8hTE/JbJygtVAL@mattapan.m5p.com>
 <f7360dac-5d83-733b-7ec5-c73d4dc0350d@xen.org>
 <alpine.DEB.2.21.2105191611540.14426@sstabellini-ThinkPad-T480s>
 <b6fe6e06-517c-ee4c-5b71-a1bee4d4df13@xen.org>
 <alpine.DEB.2.21.2105200919100.14426@sstabellini-ThinkPad-T480s>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <2d18f588-5e76-e3da-e7df-5c754516f8d6@gmail.com>
Date: Fri, 18 Jun 2021 15:19:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2105200919100.14426@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi, all!

What do we need in order to move on on this?

It seems this can be good to have for many use-cases around

Thank you,

Oleksandr

On 20.05.21 19:21, Stefano Stabellini wrote:
> On Thu, 20 May 2021, Julien Grall wrote:
>> On 20/05/2021 00:25, Stefano Stabellini wrote:
>>> On Sat, 15 May 2021, Julien Grall wrote:
>>>>> My feeling is one of two things should happen with the /hypervisor
>>>>> address range:
>>>>>
>>>>> 1>  OSes could be encouraged to use it for all foreign mappings.  The
>>>>> range should be dynamic in some fashion.  There could be a handy way to
>>>>> allow configuring the amount of address space thus reserved.
>>>> In the context of XSA-300 and virtio on Xen on Arm, we discussed about
>>>> providing a revion for foreign mapping. The main trouble here is figuring
>>>> out
>>>> of the size, if you mess it up then you may break all the PV drivers.
>>>>
>>>> If the problem is finding space, then I would like to suggest a different
>>>> approach (I think I may have discussed it with Andrew). Xen is in
>>>> maintaining
>>>> the P2M for the guest and therefore now where are the unallocated space.
>>>> How
>>>> about introducing a new hypercall to ask for "unallocated space"?
>>>>
>>>> This would not work for older hypervisor but you could use the RAM instead
>>>> (as
>>>> Linux does). This is has drawbacks (e.g. shattering superpage, reducing
>>>> the
>>>> amount of memory usuable...), but for 1> you would also need a hack for
>>>> older
>>>> Xen.
>>> I am starting to wonder if it would make sense to add a new device tree
>>> binding to describe larger free region for foreign mapping rather then a
>>> hypercall. It could be several GBs or even TBs in size. I like the idea
>>> of having it device tree because after all this is static information.
>>> I can see that a hypercall would also work and I am open to it but if
>>> possible I think it would be better not to extend the hypercall
>>> interface when there is a good alternative.
>> There are two issues with the Device-Tree approach:
>>    1) This doesn't work on ACPI
>>    2) It is not clear how to define the size of the region. An admin doesn't
>> have the right information in hand to know how many mappings will be done (a
>> backend may map multiple time the same page).
>>
>> The advantage of the hypercall solution is the size is "virtually" unlimited
>> and not based on a specific firmware.
> Fair enough
>

