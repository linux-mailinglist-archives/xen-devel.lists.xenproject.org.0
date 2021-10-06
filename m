Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 981AB424332
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 18:44:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202951.357975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYA0c-0005Cg-DG; Wed, 06 Oct 2021 16:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202951.357975; Wed, 06 Oct 2021 16:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYA0c-0005Af-A3; Wed, 06 Oct 2021 16:43:10 +0000
Received: by outflank-mailman (input) for mailman id 202951;
 Wed, 06 Oct 2021 16:43:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RZr5=O2=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mYA0a-0005AZ-Ty
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 16:43:09 +0000
Received: from mail-ed1-x52e.google.com (unknown [2a00:1450:4864:20::52e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e60cb26-19da-475c-8ea1-de069e08fccf;
 Wed, 06 Oct 2021 16:43:07 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id g10so11828215edj.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Oct 2021 09:43:06 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 21sm9039618ejv.54.2021.10.06.09.43.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 09:43:05 -0700 (PDT)
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
X-Inumbo-ID: 8e60cb26-19da-475c-8ea1-de069e08fccf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=qyZjXB8gtaRu0Z/QxYOb1rOU+So8fcRfrhgKOe4nKGQ=;
        b=DppPKuE+Bqoh8Skt7ySYDiPE5UsX4cbdhWCqTmepAMqRN18O1OcQJib1wYgnZceEzJ
         U5e45EFZM5utg05p3EWGth88NMObE442VkEnDDXEId3WSbBZZ4zsWgx/5HXe92cVhS6P
         5pdYgLLp9A1yERosaH+Q+QhssiJixes3Hw2dKENbp9X8/zOYVwZkS96T0gcH3/DcLG2M
         Lvs7E3On74jw8cjRn+hLx3bm4Sw86L/x1F8K+5Wmky3T/zZK9HaUS1ihwRghJ54rCrv7
         Z92v3Hl8D4jfIN5wy2dG1xrIdXqp+7IXAeJWh1k+2DuGkIOqL1owUVcEDF21fcSwrtPE
         fbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=qyZjXB8gtaRu0Z/QxYOb1rOU+So8fcRfrhgKOe4nKGQ=;
        b=SwFTlVfNPtRB//Uba0fidSfnln94qbz+He6REwMusUxGWqLteKe+qTuSZqOEMokBpq
         OYVad1TSbKMSSbnvQ057WODFvBR6vSQGVubhzktm6OUDhi9W8WdWY/+vPVYgGrSQUS0x
         twR5yPO7BnA02Nj2qCkrY9gZd5p1rqF5Qezppvz0Z7e/NSCMnFGPN7NzvGII64x05w3V
         0uEghP5Xig2jkTK/s218WGgbwWvjX5tNBThAQ6YopdbuDN/KMvn2o78sfRDSACujoeI5
         L302RO6g5DwoX+FqKmk3zpHb9VQcmw6fnkm4yIX8+zoQdBGN4gjuzt4m6p32wb1ruHR3
         BL4w==
X-Gm-Message-State: AOAM531gnrKf4OY+amEJvAamMOC2AHGE2GEZJcblZt8U61Z5L2rlqUwU
	/TDPCXTcH4wp25+5hVofxB4=
X-Google-Smtp-Source: ABdhPJx0e3xIughrIfUerxb9+UmalvBJ2xOUbUz550Rs+pVoxrCQY8t0n8AIiojejcbxGBdpld/uLQ==
X-Received: by 2002:a05:6402:358a:: with SMTP id y10mr34605942edc.238.1633538585551;
        Wed, 06 Oct 2021 09:43:05 -0700 (PDT)
Subject: Re: [Stratos-dev] Xen Rust VirtIO demos work breakdown for Project
 Stratos
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Sergio Lopez <slp@redhat.com>, Wei Liu <wl@xen.org>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Arnd Bergmann <arnd.bergmann@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
 Rich Persaud <persaur@gmail.com>, Daniel Smith
 <dpsmith@apertussolutions.com>, Paul Durrant <paul@xen.org>,
 openxt <openxt@googlegroups.com>, Julien Grall <julien@xen.org>,
 jgross@suse.com
References: <87pmsylywy.fsf@linaro.org> <YU5mW396S04IsCBr@mail-itl>
 <874ka68h96.fsf@linaro.org>
 <CACMJ4GbgnQVQbH1N3Duxmx10n-Qv+zzncqarNyuhmKhE-wqdqA@mail.gmail.com>
 <alpine.DEB.2.21.2109272323160.5022@sstabellini-ThinkPad-T480s>
 <CAPD2p-=MdGB_a+oEsFrPQpLo7GeKkMwYyAWcQt3z0qrGr3vR7w@mail.gmail.com>
 <alpine.DEB.2.21.2110011649220.3209@sstabellini-ThinkPad-T480s>
 <CAPD2p-m=hYbG1YjPZ9yZ7Qzs6KjCT2jSHpaDUPB0sFJoZfY4uw@mail.gmail.com>
 <alpine.DEB.2.21.2110041436070.3209@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <1d6382b6-ddf8-494c-4f7b-afc50a4269a4@gmail.com>
Date: Wed, 6 Oct 2021 19:43:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2110041436070.3209@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 05.10.21 00:53, Stefano Stabellini wrote:

Hi Stefano, all

> On Sat, 2 Oct 2021, Oleksandr Tyshchenko wrote:
>> On Sat, Oct 2, 2021 at 2:58 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
>>
>> Hi Stefano, all
>>
>> [Sorry for the possible format issues]
>> [I have CCed Julien]
>>
>>
>>        On Tue, 28 Sep 2021, Oleksandr Tyshchenko wrote:
>>        > On Tue, Sep 28, 2021 at 9:26 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
>>        >
>>        > Hi Stefano, all
>>        >
>>        > [Sorry for the possible format issues]
>>        >
>>        >
>>        >       On Mon, 27 Sep 2021, Christopher Clark wrote:
>>        >       > On Mon, Sep 27, 2021 at 3:06 AM Alex Bennée via Stratos-dev <stratos-dev@op-lists.linaro.org> wrote:
>>        >       >
>>        >       >       Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com> writes:
>>        >       >
>>        >       >       > [[PGP Signed Part:Undecided]]
>>        >       >       > On Fri, Sep 24, 2021 at 05:02:46PM +0100, Alex Bennée wrote:
>>        >       >       >> Hi,
>>        >       >       >
>>        >       >       > Hi,
>>        >       >       >
>>        >       >       >> 2.1 Stable ABI for foreignmemory mapping to non-dom0 ([STR-57])
>>        >       >       >> ───────────────────────────────────────────────────────────────
>>        >       >       >>
>>        >       >       >>   Currently the foreign memory mapping support only works for dom0 due
>>        >       >       >>   to reference counting issues. If we are to support backends running in
>>        >       >       >>   their own domains this will need to get fixed.
>>        >       >       >>
>>        >       >       >>   Estimate: 8w
>>        >       >       >>
>>        >       >       >>
>>        >       >       >> [STR-57] <https://linaro.atlassian.net/browse/STR-57>
>>        >       >       >
>>        >       >       > I'm pretty sure it was discussed before, but I can't find relevant
>>        >       >       > (part of) thread right now: does your model assumes the backend (running
>>        >       >       > outside of dom0) will gain ability to map (or access in other way)
>>        >       >       > _arbitrary_ memory page of a frontend domain? Or worse: any domain?
>>        >       >
>>        >       >       The aim is for some DomU's to host backends for other DomU's instead of
>>        >       >       all backends being in Dom0. Those backend DomU's would have to be
>>        >       >       considered trusted because as you say the default memory model of VirtIO
>>        >       >       is to have full access to the frontend domains memory map.
>>        >       >
>>        >       >
>>        >       > I share Marek's concern. I believe that there are Xen-based systems that will want to run guests using VirtIO devices
>>        without
>>        >       extending
>>        >       > this level of trust to the backend domains.
>>        >
>>        >       >From a safety perspective, it would be challenging to deploy a system
>>        >       with privileged backends. From a safety perspective, it would be a lot
>>        >       easier if the backend were unprivileged.
>>        >
>>        >       This is one of those times where safety and security requirements are
>>        >       actually aligned.
>>        >
>>        >
>>        > Well, the foreign memory mapping has one advantage in the context of Virtio use-case
>>        > which is that Virtio infrastructure in Guest doesn't require any modifications to run on top Xen.
>>        > The only issue with foreign memory here is that Guest memory actually mapped without its agreement
>>        > which doesn't perfectly fit into the security model. (although there is one more issue with XSA-300,
>>        > but I think it will go away sooner or later, at least there are some attempts to eliminate it).
>>        > While the ability to map any part of Guest memory is not an issue for the backend running in Dom0
>>        > (which we usually trust), this will certainly violate Xen security model if we want to run it in other
>>        > domain, so I completely agree with the existing concern.
>>
>>        Yep, that's what I was referring to.
>>
>>
>>        > It was discussed before [1], but I couldn't find any decisions regarding that. As I understand,
>>        > the one of the possible ideas is to have some entity in Xen (PV IOMMU/virtio-iommu/whatever)
>>        > that works in protection mode, so it denies all foreign mapping requests from the backend running in DomU
>>        > by default and only allows requests with mapping which were *implicitly* granted by the Guest before.
>>        > For example, Xen could be informed which MMIOs hold the queue PFN and notify registers
>>        > (as it traps the accesses to these registers anyway) and could theoretically parse the frontend request
>>        > and retrieve descriptors to make a decision which GFNs are actually *allowed*.
>>        >
>>        > I can't say for sure (sorry not familiar enough with the topic), but implementing the virtio-iommu device
>>        > in Xen we could probably avoid Guest modifications at all. Of course, for this to work
>>        > the Virtio infrastructure in Guest should use DMA API as mentioned in [1].
>>        >
>>        > Would the “restricted foreign mapping” solution retain the Xen security model and be accepted
>>        > by the Xen community? I wonder, has someone already looked in this direction, are there any
>>        > pitfalls here or is this even feasible?
>>        >
>>        > [1] https://lore.kernel.org/xen-devel/464e91ec-2b53-2338-43c7-a018087fc7f6@arm.com/
>>
>>        The discussion that went further is actually one based on the idea that
>>        there is a pre-shared memory area and the frontend always passes
>>        addresses from it. For ease of implementation, the pre-shared area is
>>        the virtqueue itself so this approach has been called "fat virtqueue".
>>        But it requires guest modifications and it probably results in
>>        additional memory copies.
>>
>>   
>> I got it. Although we would need to map that pre-shared area anyway (I presume it could be done at once during initialization), I think it
>> much better than
>> map arbitrary pages at runtime.
> Yeah that's the idea
>
>
>> If there is a way for Xen to know the pre-shared area location in advance it will be able to allow mapping
>> this region only and deny other attempts.
>   
> No, but there are patches (not yet upstream) to introduce a way to
> pre-share memory regions between VMs using xl:
> https://github.com/Xilinx/xen/commits/xilinx/release-2021.1?after=4bd2da58b5b008f77429007a307b658db9c0f636+104&branch=xilinx%2Frelease-2021.1
>
> So I think it would probably be the other way around: xen/libxl
> advertises on device tree (or ACPI) the presence of the pre-shared
> regions to both domains. Then frontend and backend would start using it.

Thank you for the explanation. I remember this series has already 
appeared in ML. If I got the idea correctly this way we won't need to 
map the foreign memory from the backend at all (I assume this eliminates 
security concern?). It looks like the every pre-shared region (described 
in config file) is mapped by the toolstack at the domains creation time 
and the details of this region are also written to the Xenstore. All 
what backend needs to do is to map the region into its address space 
(via mmap). For this to work the guest should allocate virtqueue from 
Xen specific reserved memory [1].

[1] 
https://www.kernel.org/doc/Documentation/devicetree/bindings/reserved-memory/xen%2Cshared-memory.txt


>   
>>        I am not sure if the approach you mentioned could be implemented
>>        completely without frontend changes. It looks like Xen would have to
>>        learn how to inspect virtqueues in order to verify implicit grants
>>        without frontend changes.
>>
>>   
>> I looked through the virtio-iommu specification and corresponding Linux driver but I am sure I don't see all the challenges and pitfalls.
>> Having a limited knowledge of IOMMU infrastructure in Linux, below is just my guess, which might be wrong.
>>
>> 1. I think, if we want to avoid frontend changes the backend in Xen would need to fully conform to the specification, I am afraid that
>> besides just inspecting virtqueues, the backend needs to properly and completely emulate the virtio device, handle shadow page tables, etc.
>> Otherwise we might break the guest. I expect a huge amount of work to implement this properly.
> Yeah, I think we would want to stay away from shadow pagetables unless
> we are really forced to go there.
>
>
>> 2. Also, if I got the things correctly, it looks like when enabling virtio-iommu, all addresses passed in requests to the virtio devices
>> behind the virtio-iommu will be in guest virtual address space (IOVA). So we would need to find a way for userspace (if the backend is
>> IOREQ server) to translate them to guest physical addresses (IPA) via these shadow page tables in the backend in front of mapping them via
>> foreign memory map calls. So I expect Xen, toolstack and Linux privcmd driver changes and additional complexity taking into account how the
>> data structures could be accessed (data structures being continuously in IOVA, could be discontinuous in IPA, indirect table descriptors,
>> etc).
>> I am wondering, would it be possible to have identity IOMMU mapping (IOVA == GPA) at the guest side but without bypassing an IOMMU, as we
>> need the virtio-iommu frontend to send map/unmap requests, can we control this behaviour somehow?
>> I think this would simplify things.
> None of the above looks easy. I think you are right that we would need
> IOVA == GPA to make the implementation feasible and with decent
> performance.

Yes. Otherwise, I am afraid, the implementation is going to be quite 
difficult with questionable performance at the end.

I found out that IOMMU domain in Linux can be identity mapped 
(IOMMU_DOMAIN_IDENTITY - DMA addresses are system physical addresses) 
and this can be controlled via cmd line.
I admit I didn't test, but from the IOMMU framework code it looks like 
that driver's map/unmap callback won't be called in this mode and as the 
result the IOMMU mapping never reaches the backend. Unfortunately, this 
is not what we want as we won't have any understating what the GFNs are...

> But if we need a spec change, then I think Juergen's
> proposal of introducing a new transport that uses grant table references
> instead of GPAs is worth considering.

Agree, if we the spec changes cannot be avoided then yes.


>
>
>> 3. Also, we would probably want to have a single virtio-iommu device instance per guest, so all virtio devices which belong to this guest
>> will share the IOMMU mapping for the optimization purposes. For this to work all virtio devices inside a guest should be attached to the
>> same IOMMU domain. Probably, we could control that, but I am not 100% sure.

-- 
Regards,

Oleksandr Tyshchenko


