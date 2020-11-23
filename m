Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7752C0F3F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 16:48:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34728.65932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khE4D-0001PO-Ah; Mon, 23 Nov 2020 15:47:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34728.65932; Mon, 23 Nov 2020 15:47:49 +0000
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
	id 1khE4D-0001Oz-7H; Mon, 23 Nov 2020 15:47:49 +0000
Received: by outflank-mailman (input) for mailman id 34728;
 Mon, 23 Nov 2020 15:47:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dDmC=E5=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1khE4B-0001Oq-C1
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:47:47 +0000
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 414d1422-316d-42d9-9bc4-a15bb4475700;
 Mon, 23 Nov 2020 15:47:46 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 142so18466511ljj.10
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2020 07:47:46 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id s62sm3552lja.102.2020.11.23.07.47.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 07:47:44 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dDmC=E5=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1khE4B-0001Oq-C1
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:47:47 +0000
X-Inumbo-ID: 414d1422-316d-42d9-9bc4-a15bb4475700
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 414d1422-316d-42d9-9bc4-a15bb4475700;
	Mon, 23 Nov 2020 15:47:46 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 142so18466511ljj.10
        for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2020 07:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=6BjATHCxirlMscvoXaspmm4DKGb45kqaNww0aQhBLrQ=;
        b=uZdvRNn1LYALcK93XCRoJlD9kYiCNAtQGcM/ihVDybp6lXIjsBGgJXV7ZJqjp1Sc/K
         8ERB4r/Wioa/fSTuQWerlp72SCjqSVgld38wTHOe36kj4BJTILm7aY1cW2XrGYrd7wJb
         l/7RxNG4lVyp2/vroymXZZIsG6wiuYw5CBvNvizf+tdytsLcxbzleEJKWMt56vgv0DNO
         YUPZi2UdGn3t5J5cjZlPt4E/qCK7YOXx0R2Q9bmXPMwGfeviMetA+9r5eCu1ur/cxtoi
         1FU62uMfxZnvD7z3IpoPlQoGV6B0coqQedK5ezspYCrvDsdfeZoybjKBfWhunBU4C+bx
         aQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=6BjATHCxirlMscvoXaspmm4DKGb45kqaNww0aQhBLrQ=;
        b=GpRO7tB5WOVsV07oruhJSmq+68lRy+Vl8Tv6I7owqHstFTaReTjAlzOCoWTLnLFm3S
         WViRQypoQ2w62C1u/dvqlPGLSglxsqISViINi8/nhLbwpcdqDlwx6IqhfdvR5vYw46Uz
         k0/IZJg0MzUN1v/Gdn77gZmpIkxe1colF8xvzPLBTvM/DZTwvks417BxOSSmkNlFvXkn
         WErx6/f7MOIe6ZtWoMJByaWs6y8J2SDe0XiDB6g6k9e1XfTtRgoLUM2uwIDmnR02SJ+V
         qiKbbfcFBJcFGXSIgrUfeOJV3dNg6k3Zn+n8RiuFFVxdxf/AqMezv3sEkF5OCh9CO0Bk
         Lv4A==
X-Gm-Message-State: AOAM531NkMq44BF0O2wc2IwgndiBB8q2wxmqg1hjR54d3Z9QAJblmjz0
	fsKQ3iEh13u61YTneTDCnWYCkTcUlXoKvA==
X-Google-Smtp-Source: ABdhPJxg0rSQzCab1r/3SntdBdL5F6WJpzjZ1Zuek553WQZKxfgF82EOdsSRqvPgwyUh+AZVzsBr6A==
X-Received: by 2002:a2e:86c1:: with SMTP id n1mr65040ljj.351.1606146464679;
        Mon, 23 Nov 2020 07:47:44 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id s62sm3552lja.102.2020.11.23.07.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2020 07:47:44 -0800 (PST)
Subject: Re: [PATCH V2 12/23] xen/ioreq: Remove "hvm" prefixes from involved
 function names
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-13-git-send-email-olekstysh@gmail.com>
 <e3064b77-71c3-9d8d-2324-6839895101f4@suse.com>
 <d3b6623c-683d-2845-78c3-a114193b0ce4@gmail.com>
 <04a81b7e-213a-968b-048c-dfa68b6e3b0d@gmail.com>
 <96e6622c-08b3-ff85-75f1-14c8b7cd6d6e@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <30c01448-d4f2-803e-1569-5e806f830efc@gmail.com>
Date: Mon, 23 Nov 2020 17:47:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <96e6622c-08b3-ff85-75f1-14c8b7cd6d6e@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 23.11.20 16:56, Jan Beulich wrote:

Hi Jan, Paul

> On 23.11.2020 15:39, Oleksandr wrote:
>> As it was agreed, below the list of proposed renaming (naming) within
>> current series.
> Thanks for compiling this. A couple of suggestions for consideration:
>
>> 1. Global (existing):
>> hvm_map_mem_type_to_ioreq_server     -> ioreq_server_map_mem_type
>> hvm_select_ioreq_server              -> ioreq_server_select
>> hvm_send_ioreq                       -> ioreq_send
>> hvm_ioreq_init                       -> ioreq_init
> ioreq_domain_init() (or, imo less desirable domain_ioreq_init())?
On Arm (for example) I see two variants are present:
1. That starts with subsystem:
- tee_domain_init
- iommu_domain_init


2. Where sybsystem in the middle:
- domain_io_init
- domain_vuart_init
- domain_vtimer_init

If there is no rule, but a matter of taste then I would use 
ioreq_domain_init(),
so arch_ioreq_init() wants to be arch_ioreq_domain_init().

>
>> hvm_destroy_all_ioreq_servers        -> ioreq_server_destroy_all
>> hvm_all_ioreq_servers_add_vcpu       -> ioreq_server_add_vcpu_all
>> hvm_all_ioreq_servers_remove_vcpu    -> ioreq_server_remove_vcpu_all
>> hvm_broadcast_ioreq                  -> ioreq_broadcast
>> hvm_create_ioreq_server              -> ioreq_server_create
>> hvm_get_ioreq_server_info            -> ioreq_server_get_info
>> hvm_map_io_range_to_ioreq_server     -> ioreq_server_map_io_range
>> hvm_unmap_io_range_from_ioreq_server -> ioreq_server_unmap_io_range
>> hvm_set_ioreq_server_state           -> ioreq_server_set_state
>> hvm_destroy_ioreq_server             -> ioreq_server_destroy
>> hvm_get_ioreq_server_frame           -> ioreq_server_get_frame
>> hvm_ioreq_needs_completion           -> ioreq_needs_completion
>> hvm_mmio_first_byte                  -> ioreq_mmio_first_byte
>> hvm_mmio_last_byte                   -> ioreq_mmio_last_byte
>> send_invalidate_req                  -> ioreq_signal_mapcache_invalidate
>>
>> handle_hvm_io_completion             -> handle_io_completion
> For this one I'm not sure what to suggest, but I'm not overly happy
> with the name.

I also failed to find a better name. Probably ioreq_ or vcpu_ioreq_ 
prefix wants to be added here?


>
>> hvm_io_pending                       -> io_pending
> vcpu_ioreq_pending() or vcpu_any_ioreq_pending()?

I am fine with vcpu_ioreq_pending()


>
>> 2. Global (new):
>> arch_io_completion
>> arch_ioreq_server_map_pages
>> arch_ioreq_server_unmap_pages
>> arch_ioreq_server_enable
>> arch_ioreq_server_disable
>> arch_ioreq_server_destroy
>> arch_ioreq_server_map_mem_type
>> arch_ioreq_server_destroy_all
>> arch_ioreq_server_get_type_addr
>> arch_ioreq_init
> Assuming this is the arch hook of the similarly named function
> further up, a similar adjustment may then be wanted here.

Yes.


>
>> domain_has_ioreq_server
>>
>>
>> 3. Local (existing) in common ioreq.c:
>> hvm_alloc_ioreq_mfn               -> ioreq_alloc_mfn
>> hvm_free_ioreq_mfn                -> ioreq_free_mfn
> These two are server functions, so should imo be ioreq_server_...().

ok, but ...


> However, if they're static (as they're now), no distinguishing
> prefix is strictly necessary, i.e. alloc_mfn() and free_mfn() may
> be fine. The two names may be too short for Paul's taste, though.
> Some similar shortening may be possible for some or all of the ones


... In general I would be fine with any option. However, using the 
shortening rule for all
we are going to end up with single-word function names (enable, init, etc).
So I would prefer to leave locals as is (but dropping hvm prefixes of 
course and
clarify ioreq_server_alloc_mfn/ioreq_server_free_mfn).

Paul, Jan what do you think?


> below here.
>
> Jan
>
>> hvm_update_ioreq_evtchn           -> ioreq_update_evtchn
>> hvm_ioreq_server_add_vcpu         -> ioreq_server_add_vcpu
>> hvm_ioreq_server_remove_vcpu      -> ioreq_server_remove_vcpu
>> hvm_ioreq_server_remove_all_vcpus -> ioreq_server_remove_all_vcpus
>> hvm_ioreq_server_alloc_pages      -> ioreq_server_alloc_pages
>> hvm_ioreq_server_free_pages       -> ioreq_server_free_pages
>> hvm_ioreq_server_free_rangesets   -> ioreq_server_free_rangesets
>> hvm_ioreq_server_alloc_rangesets  -> ioreq_server_alloc_rangesets
>> hvm_ioreq_server_enable           -> ioreq_server_enable
>> hvm_ioreq_server_disable          -> ioreq_server_disable
>> hvm_ioreq_server_init             -> ioreq_server_init
>> hvm_ioreq_server_deinit           -> ioreq_server_deinit
>> hvm_send_buffered_ioreq           -> ioreq_send_buffered
>>
>> hvm_wait_for_io                   -> wait_for_io
>>
>> 4. Local (existing) in x86 ioreq.c:
>> Everything related to legacy interface (hvm_alloc_legacy_ioreq_gfn, etc)
>> are going
>> to remain as is.
>>
>>
>>
-- 
Regards,

Oleksandr Tyshchenko


