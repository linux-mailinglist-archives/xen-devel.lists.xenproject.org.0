Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2942D2C90E8
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 23:23:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41503.74692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjrZb-0000nt-7Q; Mon, 30 Nov 2020 22:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41503.74692; Mon, 30 Nov 2020 22:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjrZb-0000nU-3r; Mon, 30 Nov 2020 22:23:07 +0000
Received: by outflank-mailman (input) for mailman id 41503;
 Mon, 30 Nov 2020 22:23:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avKr=FE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kjrZa-0000nP-1N
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 22:23:06 +0000
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba570b5d-06f1-4549-9d10-d6ac8e7bbc85;
 Mon, 30 Nov 2020 22:23:04 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id i2so18455551wrs.4
 for <xen-devel@lists.xenproject.org>; Mon, 30 Nov 2020 14:23:04 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u26sm892884wmm.24.2020.11.30.14.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 14:23:03 -0800 (PST)
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
X-Inumbo-ID: ba570b5d-06f1-4549-9d10-d6ac8e7bbc85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=glKUrv3uJuSm2IL6cWSBnV9ZqAJu7D9khspUyI5Axx4=;
        b=gzTOo1D9dzGbaFDvzbeElJeJoZVvX5LoC0RKGbqdOMAeXgGnISFWYKuMyI6lBOA9K6
         h10rZdGwLlRgrV+pUu+LD/gmquda1cMvblqlfIfojOFSSy9mhGHe0EvRII8jqr6qXdUU
         UQpnBVfLv4azqJpRVF5Xl6OITAmjn6+gGyVpDu6+IeZcfCQofPz14s0M6yrgjBapuXO1
         tpsZDa/yVeKyRvmd4oRxwicssQqBghElKxCelzB7IDEBMkFer/b1nn0NNsXa8TtiqTg7
         JVBmeIchhRYoDocZfJvzIS30qSNw2FJ7g/0ZKXi10CEYb2/ek8IOOq+ALKg04Hhnzu1c
         JPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=glKUrv3uJuSm2IL6cWSBnV9ZqAJu7D9khspUyI5Axx4=;
        b=Cu0OZB1+G1oTmjG4MCPC5g6A7Mqal3ndkqe+yQCVTYc2DWF1siDDJoIWkrhyMLDYo/
         HNjUoh5iTRfsMA2Nvzyqifis6PS0VZLzns8d2GO99d2qK/ctd+ufT6SFGNOHZHc4xoG8
         AZRMZ1Aqev3Jb3lvJMKfVVjM6AwdshO+IUCqZOplyGzsm9c/4PUuvCMtdzFgthC0Ij4x
         c/bCtgai8VovcjADcrBZY6NdnsZhVcZ6sSPy3cITglfPkAnPytf/D0cwo8xT8ayel7lZ
         2RCjF5vMIMnV+8pUB/tgXpgdHMU40jHVDcdSpuUd4YoG7GtE75s5IS6g7z9qKeW2R9+H
         ON6g==
X-Gm-Message-State: AOAM5322vIh7QjtkMF5QFTL2LGWoc+5MblpPII/A0JLPGMStj+6viHtJ
	H2WZglpHt0Kc5Sdr6Hdn834=
X-Google-Smtp-Source: ABdhPJyAk2h5T56reTKnxgEnjILBtdQBdnVvnpzkX4lBonK8477fCTnF5bGidJlBeHIZxU6romNl+w==
X-Received: by 2002:a5d:6286:: with SMTP id k6mr31158021wru.309.1606774983619;
        Mon, 30 Nov 2020 14:23:03 -0800 (PST)
Subject: Re: [PATCH V3 00/23] IOREQ feature (+ virtio-mmio) on Arm
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien.grall@arm.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tim Deegan <tim@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Kaly Xin <Kaly.Xin@arm.com>, Artem Mygaiev <joculator@gmail.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <87h7p6u860.fsf@linaro.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <248003d5-87a2-a7b2-5b30-e94c2a49945b@gmail.com>
Date: Tue, 1 Dec 2020 00:22:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87h7p6u860.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 30.11.20 18:21, Alex Bennée wrote:

Hi Alex

[added missed subject title]

> Oleksandr Tyshchenko <olekstysh@gmail.com> writes:
>
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>>
>> Date: Sat, 28 Nov 2020 22:33:51 +0200
>> Subject: [PATCH V3 00/23] IOREQ feature (+ virtio-mmio) on Arm
>> MIME-Version: 1.0
>> Content-Type: text/plain; charset=UTF-8
>> Content-Transfer-Encoding: 8bit
>>
>> Hello all.
>>
>> The purpose of this patch series is to add IOREQ/DM support to Xen on Arm.
>> You can find an initial discussion at [1] and RFC/V1/V2 series at [2]/[3]/[4].
>> Xen on Arm requires some implementation to forward guest MMIO access to a device
>> model in order to implement virtio-mmio backend or even mediator outside of hypervisor.
>> As Xen on x86 already contains required support this series tries to make it common
>> and introduce Arm specific bits plus some new functionality. Patch series is based on
>> Julien's PoC "xen/arm: Add support for Guest IO forwarding to a device emulator".
>> Besides splitting existing IOREQ/DM support and introducing Arm side, the series
>> also includes virtio-mmio related changes (last 2 patches for toolstack)
>> for the reviewers to be able to see how the whole picture could look
>> like.
> Thanks for posting the latest version.
>
>> According to the initial discussion there are a few open questions/concerns
>> regarding security, performance in VirtIO solution:
>> 1. virtio-mmio vs virtio-pci, SPI vs MSI, different use-cases require different
>>     transport...
> I think I'm repeating things here I've said in various ephemeral video
> chats over the last few weeks but I should probably put things down on
> the record.
>
> I think the original intention of the virtio framers is advanced
> features would build on virtio-pci because you get a bunch of things
> "for free" - notably enumeration and MSI support. There is assumption
> that by the time you add these features to virtio-mmio you end up
> re-creating your own less well tested version of virtio-pci. I've not
> been terribly convinced by the argument that the guest implementation of
> PCI presents a sufficiently large blob of code to make the simpler MMIO
> desirable. My attempts to build two virtio kernels (PCI/MMIO) with
> otherwise the same devices wasn't terribly conclusive either way.
>
> That said virtio-mmio still has life in it because the cloudy slimmed
> down guests moved to using it because the enumeration of PCI is a road
> block to their fast boot up requirements. I'm sure they would also
> appreciate a MSI implementation to reduce the overhead that handling
> notifications currently has on trap-and-emulate.
>
> AIUI for Xen the other downside to PCI is you would have to emulate it
> in the hypervisor which would be additional code at the most privileged
> level.
Thank you for putting things together here and valuable input. As for 
me, the "virtio-mmio & MSI solution" as a performance improvement sounds 
indeed
interesting. Flipping through the virtio-mmio links I found a discussion 
regarding that [1].
I think this needs an additional investigation and experiments, however 
I am not sure there is an existing infrastructure in Xen on Arm to do so.
Once we make some progress with the IOREQ series I would be able to 
focus on enhancements which we would consider worthwhile.


>
>> 2. virtio backend is able to access all guest memory, some kind of protection
>>     is needed: 'virtio-iommu in Xen' vs 'pre-shared-memory & memcpys in
>>     guest'
> This is also an area of interest for Project Stratos and something we
> would like to be solved generally for all hypervisors. There is a good
> write up of some approaches that Jean Phillipe did on the stratos
> mailing list:
>
>    From: Jean-Philippe Brucker <jean-philippe@linaro.org>
>    Subject: Limited memory sharing investigation
>    Message-ID: <20201002134336.GA2196245@myrica>
>
> I suspect there is a good argument for the simplicity of a combined
> virt queue but it is unlikely to be very performance orientated.

I will look at it.


>> 3. interface between toolstack and 'out-of-qemu' virtio backend, avoid using
>>     Xenstore in virtio backend if possible.
> I wonder how much work it would be for a rust expert to make:
>
>    https://github.com/slp/vhost-user-blk
>
> handle an IOREQ signalling pathway instead of the vhost-user/eventfd
> pathway? That would give a good indication on how "hypervisor blind"
> these daemons could be made.
>
> <snip>
>> Please note, build-test passed for the following modes:
>> 1. x86: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y (default)
>> 2. x86: #CONFIG_HVM is not set / #CONFIG_IOREQ_SERVER is not set
>> 3. Arm64: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y
> Forgive my relative newness to Xen, how do I convince the hypervisor to
> build with this on? I've tried variants of:
>
>    make -j9 CROSS_COMPILE=aarch64-linux-gnu- XEN_TARGET_ARCH=arm64 menuconfig XEN_EXPERT=y [CONFIG_|XEN_|_]IOREQ_SERVER=y
CONFIG_IOREQ_SERVER is not protected by CONFIG_XEN_EXPERT. I mentioned 
how to enable CONFIG_IOREQ_SERVER on Arm (since it is disabled by 
default within this series) when
describing how test this series to Masami, but forgot to add here. Could 
you apply the one-line patch [2] and rebuild. Sorry for inconvenience.


[1] https://lwn.net/Articles/812055/
[2] 
https://github.com/otyshchenko1/xen/commit/b371bc9a3c954595bfce01bad244260364bbcd48

-- 
Regards,

Oleksandr Tyshchenko


