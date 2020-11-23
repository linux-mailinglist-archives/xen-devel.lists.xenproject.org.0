Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B95872C105D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 17:36:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34861.66118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khEpH-0007yg-5z; Mon, 23 Nov 2020 16:36:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34861.66118; Mon, 23 Nov 2020 16:36:27 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khEpH-0007yF-20; Mon, 23 Nov 2020 16:36:27 +0000
Received: by outflank-mailman (input) for mailman id 34861;
 Mon, 23 Nov 2020 16:36:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dDmC=E5=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1khEpG-0007yA-0r
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 16:36:26 +0000
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c173b3b0-9329-4d6b-a938-e3e53edaadee;
 Mon, 23 Nov 2020 16:36:25 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id s30so24654040lfc.4
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2020 08:36:24 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id i10sm1427063lfo.19.2020.11.23.08.36.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 08:36:23 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dDmC=E5=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1khEpG-0007yA-0r
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 16:36:26 +0000
X-Inumbo-ID: c173b3b0-9329-4d6b-a938-e3e53edaadee
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c173b3b0-9329-4d6b-a938-e3e53edaadee;
	Mon, 23 Nov 2020 16:36:25 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id s30so24654040lfc.4
        for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2020 08:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=/K5iUHatmuqEhjbGJrlXqgis7vMnx7mGfGzhYkWi4Lk=;
        b=hpag8Ohy0eqJW7lFDqpoS7fwWHLBaWodIwFKCn73f1bp4ILV6Rt4XLoGzQFArD0ZFe
         aJD1i09SNG1Y1ghDcmaD7rQueu1uENJSlC2EA7GEoSBgm6hdNT+AbVCAkL+nSWQOxXgl
         u/1lXYy3bTZxgzt7Ox70Vh5870q0UmIPTLTv1g+RDPX8eKZEwwv0lWcLpVMs9PkDbCYj
         oldrWJq8OvBR+E3LCX9SnrdRWT9CyeTMJN6CvunD/ipPV3ddXZuWwubq6W60g9M9n5r+
         ZJPVZ3v2aZO07DiJC4oVmNZdjWueck2lCRDnlWg7e/e9AoMQ2GpMM/KKaolA4+PhPb/L
         9qPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=/K5iUHatmuqEhjbGJrlXqgis7vMnx7mGfGzhYkWi4Lk=;
        b=tcTPVpDsmeK8zDFV2cjbZbf7wuSGXOzbvt/gCF8w86JYg9Qsw12G1PIRjxr4XbZw4E
         eltiP3INSbo4UjPmB+gfv1FoctbzTeEfk56v2nEotz963rcGLDswMpkpXZ/Vy5Uvui3w
         q0uIzpyM2G5KOPl55IcaFYFhrMJtpQt8B8G0KaomJD7SPJUeMlP1RKhrdQczuQNrZyHu
         C3y7FXjeDXSLGOwj6M/l6RlUwiqloiBUc7+z0OOfPoERMGaDVfemi3L9kf13P8WtP7h+
         YUELhJGtY7C/br4KOywNcdm4B3sGR/HlAxz9yIKhurdukuq7pGl+xjTtj4dOAm/TL0e8
         m7VA==
X-Gm-Message-State: AOAM531M271SeTlYwywlXS7VFPy5bHyIL6I9FT/ONSQ2KvaYGrVHOUH9
	VxmmqCyFmHTAw1c4DWAd0IIYNUGBz3ig8w==
X-Google-Smtp-Source: ABdhPJz76K7PsT0Uou9OKoNF4Et8bXBU8xHH7QuobTFBx8CsBz/ywiEB+w/2LmaEIV51m62KMtTV0g==
X-Received: by 2002:a19:c714:: with SMTP id x20mr12641037lff.537.1606149383746;
        Mon, 23 Nov 2020 08:36:23 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id i10sm1427063lfo.19.2020.11.23.08.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2020 08:36:23 -0800 (PST)
Subject: Re: [PATCH V2 12/23] xen/ioreq: Remove "hvm" prefixes from involved
 function names
To: paul@xen.org
Cc: 'Jan Beulich' <jbeulich@suse.com>,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Julien Grall' <julien@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Jun Nakajima' <jun.nakajima@intel.com>, 'Kevin Tian'
 <kevin.tian@intel.com>, 'Julien Grall' <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-13-git-send-email-olekstysh@gmail.com>
 <e3064b77-71c3-9d8d-2324-6839895101f4@suse.com>
 <d3b6623c-683d-2845-78c3-a114193b0ce4@gmail.com>
 <04a81b7e-213a-968b-048c-dfa68b6e3b0d@gmail.com>
 <96e6622c-08b3-ff85-75f1-14c8b7cd6d6e@suse.com>
 <30c01448-d4f2-803e-1569-5e806f830efc@gmail.com>
 <002101d6c1b0$e906a520$bb13ef60$@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <0b502895-e715-4dee-6476-8e25f3a7a3ec@gmail.com>
Date: Mon, 23 Nov 2020 18:36:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <002101d6c1b0$e906a520$bb13ef60$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 23.11.20 17:54, Paul Durrant wrote:

Hi Paul

>> -----Original Message-----
>> From: Oleksandr <olekstysh@gmail.com>
>> Sent: 23 November 2020 15:48
>> To: Jan Beulich <jbeulich@suse.com>; Paul Durrant <paul@xen.org>
>> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Andrew Cooper <andrew.cooper3@citrix.com>;
>> Roger Pau Monné <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; George Dunlap
>> <george.dunlap@citrix.com>; Ian Jackson <iwj@xenproject.org>; Julien Grall <julien@xen.org>; Stefano
>> Stabellini <sstabellini@kernel.org>; Jun Nakajima <jun.nakajima@intel.com>; Kevin Tian
>> <kevin.tian@intel.com>; Julien Grall <julien.grall@arm.com>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH V2 12/23] xen/ioreq: Remove "hvm" prefixes from involved function names
>>
>>
>> On 23.11.20 16:56, Jan Beulich wrote:
>>
>> Hi Jan, Paul
>>
>>> On 23.11.2020 15:39, Oleksandr wrote:
>>>> As it was agreed, below the list of proposed renaming (naming) within
>>>> current series.
>>> Thanks for compiling this. A couple of suggestions for consideration:
>>>
>>>> 1. Global (existing):
>>>> hvm_map_mem_type_to_ioreq_server     -> ioreq_server_map_mem_type
>>>> hvm_select_ioreq_server              -> ioreq_server_select
>>>> hvm_send_ioreq                       -> ioreq_send
>>>> hvm_ioreq_init                       -> ioreq_init
>>> ioreq_domain_init() (or, imo less desirable domain_ioreq_init())?
>> On Arm (for example) I see two variants are present:
>> 1. That starts with subsystem:
>> - tee_domain_init
>> - iommu_domain_init
>>
>>
>> 2. Where sybsystem in the middle:
>> - domain_io_init
>> - domain_vuart_init
>> - domain_vtimer_init
>>
>> If there is no rule, but a matter of taste then I would use
>> ioreq_domain_init(),
>> so arch_ioreq_init() wants to be arch_ioreq_domain_init().
>>
>>>> hvm_destroy_all_ioreq_servers        -> ioreq_server_destroy_all
>>>> hvm_all_ioreq_servers_add_vcpu       -> ioreq_server_add_vcpu_all
>>>> hvm_all_ioreq_servers_remove_vcpu    -> ioreq_server_remove_vcpu_all
>>>> hvm_broadcast_ioreq                  -> ioreq_broadcast
>>>> hvm_create_ioreq_server              -> ioreq_server_create
>>>> hvm_get_ioreq_server_info            -> ioreq_server_get_info
>>>> hvm_map_io_range_to_ioreq_server     -> ioreq_server_map_io_range
>>>> hvm_unmap_io_range_from_ioreq_server -> ioreq_server_unmap_io_range
>>>> hvm_set_ioreq_server_state           -> ioreq_server_set_state
>>>> hvm_destroy_ioreq_server             -> ioreq_server_destroy
>>>> hvm_get_ioreq_server_frame           -> ioreq_server_get_frame
>>>> hvm_ioreq_needs_completion           -> ioreq_needs_completion
>>>> hvm_mmio_first_byte                  -> ioreq_mmio_first_byte
>>>> hvm_mmio_last_byte                   -> ioreq_mmio_last_byte
>>>> send_invalidate_req                  -> ioreq_signal_mapcache_invalidate
>>>>
>>>> handle_hvm_io_completion             -> handle_io_completion
>>> For this one I'm not sure what to suggest, but I'm not overly happy
>>> with the name.
>> I also failed to find a better name. Probably ioreq_ or vcpu_ioreq_
>> prefix wants to be added here?
>>
>>
>>>> hvm_io_pending                       -> io_pending
>>> vcpu_ioreq_pending() or vcpu_any_ioreq_pending()?
>> I am fine with vcpu_ioreq_pending()
>>
> ...in which case vcpu_ioreq_handle_completion() seems like a reasonable choice.

ok, will rename here ...


>
>>>> 2. Global (new):
>>>> arch_io_completion

and here arch_vcpu_ioreq_completion() (without handle in the middle).



>>>> arch_ioreq_server_map_pages
>>>> arch_ioreq_server_unmap_pages
>>>> arch_ioreq_server_enable
>>>> arch_ioreq_server_disable
>>>> arch_ioreq_server_destroy
>>>> arch_ioreq_server_map_mem_type
>>>> arch_ioreq_server_destroy_all
>>>> arch_ioreq_server_get_type_addr
>>>> arch_ioreq_init
>>> Assuming this is the arch hook of the similarly named function
>>> further up, a similar adjustment may then be wanted here.
>> Yes.
>>
>>
>>>> domain_has_ioreq_server
>>>>
>>>>
>>>> 3. Local (existing) in common ioreq.c:
>>>> hvm_alloc_ioreq_mfn               -> ioreq_alloc_mfn
>>>> hvm_free_ioreq_mfn                -> ioreq_free_mfn
>>> These two are server functions, so should imo be ioreq_server_...().
>> ok, but ...
>>
>>
>>> However, if they're static (as they're now), no distinguishing
>>> prefix is strictly necessary, i.e. alloc_mfn() and free_mfn() may
>>> be fine. The two names may be too short for Paul's taste, though.
>>> Some similar shortening may be possible for some or all of the ones
>>
>> ... In general I would be fine with any option. However, using the
>> shortening rule for all
>> we are going to end up with single-word function names (enable, init, etc).
>> So I would prefer to leave locals as is (but dropping hvm prefixes of
>> course and
>> clarify ioreq_server_alloc_mfn/ioreq_server_free_mfn).
>>
>> Paul, Jan what do you think?
> I prefer ioreq_server_alloc_mfn/ioreq_server_free_mfn. The problem with shortening is that function names become ambiguous within the source base and hence harder to find.

Got it.


Thank you

-- 
Regards,

Oleksandr Tyshchenko


