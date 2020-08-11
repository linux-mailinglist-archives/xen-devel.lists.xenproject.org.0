Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D5F241971
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 12:10:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5REj-0007bo-JE; Tue, 11 Aug 2020 10:10:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SWDt=BV=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k5REi-0007bd-0U
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 10:10:28 +0000
X-Inumbo-ID: 47980881-5376-4424-9bec-00bcd21275c8
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47980881-5376-4424-9bec-00bcd21275c8;
 Tue, 11 Aug 2020 10:10:27 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id w14so12873682ljj.4
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2020 03:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=bGaHq5Hu1R/dyUDPd1s9Sn1DjsP8mu10vaT3uZRxUmw=;
 b=IWFuVrfr1e7yVVgQWhVaZTLfPZ/blCUccQD1r55wPQ6GpLzejRiGEAYB8Tw9NBw6t8
 zrtzDuoklqCYcMmmQ108itlsZuWF2VjsTIU9cHmaYG9FHYRl/q/nEXzhQKHNqjJbJsBU
 i7lN7tGnTuYLa+MZ364sFvsIMx9A8JW8UtP5KKqvpV0TAW/KJBABNlLTWJtYlO2PmGKa
 9Dl+ikLpS5elmQ/ZSFEEt2w8u2hxeOmQMukVpfAAoE0ROAavnWdjQMVPgAR9OHxFMjAO
 74Tt27bZsRdqP4o0tFraCRJ5x0fGdjljWENt2TQL6IYDnEm63WFz/v6nsEqzfcZv5nAT
 Akvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=bGaHq5Hu1R/dyUDPd1s9Sn1DjsP8mu10vaT3uZRxUmw=;
 b=h3OLs6TS6iCuRblp9cslwdbfkcqg+QV62NZO1veDUEdMcjGpWhpiHMzcyy0sWHPtZP
 XlY/NCidSMSTpt8FR7oVd70jaTf44FJZLt3MvrvqSnZiApc9y5lYWqqIX2fn8jZaE+yz
 d70p2MK+99JjNEJv4FiW8D6UfaiiCohoySfzf1uz6x4Bl3BvgdJkz8hPJFfFj9b3roVI
 /DvRlX9OcVz04XGgqXG8GXCP5KC5hndPiBWRUOdOSFI0/QqNkYx3DQxTll0tm/IZi5La
 29u4N/xhasdG9vrYeVDWaC975vXUhGjAyPGWFg20m3JCePNfRhNX4GQR9HCndcPgKJ9c
 ofXA==
X-Gm-Message-State: AOAM530G0TAJBDRHbLKDvk+R2kM41BnRU3YkGKCh3HoxsI6G+d2ndmgs
 yZKHsCcJ9vedww1lYhw1tzQ=
X-Google-Smtp-Source: ABdhPJz92qVYAZjRgF4CKrXNxt2ODVa5/5VY9Eww7vIGoiraY48XabJ2wkJB5lrjeqI9TxO9gIpX9g==
X-Received: by 2002:a2e:8197:: with SMTP id e23mr2921874ljg.406.1597140625848; 
 Tue, 11 Aug 2020 03:10:25 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id j6sm9882927lja.23.2020.08.11.03.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Aug 2020 03:10:25 -0700 (PDT)
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
 <000c01d66a33$2bd56510$83802f30$@xen.org>
 <9f83a7ed-ca97-449f-c7b9-a1140644abe9@gmail.com>
 <f0c32cfe-5c33-30ae-b08a-3d72e935745a@xen.org>
 <alpine.DEB.2.21.2008041105510.5748@sstabellini-ThinkPad-T480s>
 <2ab4c567-8efa-1b9d-ab00-4ea7e1ab323e@suse.com>
 <alpine.DEB.2.21.2008051253230.5748@sstabellini-ThinkPad-T480s>
 <013b142d-5296-5bbe-7d19-903f59e0c974@gmail.com>
 <alpine.DEB.2.21.2008071259580.16004@sstabellini-ThinkPad-T480s>
 <06f78323-b8f5-fd11-486a-437267eccc29@gmail.com>
 <27513b2b-e59b-d446-7e68-eac4bc503409@gmail.com>
 <alpine.DEB.2.21.2008101200230.16004@sstabellini-ThinkPad-T480s>
 <441f4413-b746-035e-948e-da3ff76a9a3b@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <dc6de2f4-8f9d-aa96-8513-aecedb11e0ef@gmail.com>
Date: Tue, 11 Aug 2020 13:10:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <441f4413-b746-035e-948e-da3ff76a9a3b@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: 'Kevin Tian' <kevin.tian@intel.com>,
 'Jun Nakajima' <jun.nakajima@intel.com>, 'Wei Liu' <wl@xen.org>, paul@xen.org,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Tim Deegan' <tim@xen.org>,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Julien Grall' <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 11.08.20 12:19, Julien Grall wrote:

Hi Julien, Stefano

> Hi Stefano,
>
> On 11/08/2020 00:34, Stefano Stabellini wrote:
>> On Mon, 10 Aug 2020, Oleksandr wrote:
>>> On 08.08.20 01:19, Oleksandr wrote:
>>>> On 08.08.20 00:50, Stefano Stabellini wrote:
>>>>> On Fri, 7 Aug 2020, Oleksandr wrote:
>>>>>> On 06.08.20 03:37, Stefano Stabellini wrote:
>>>>>>
>>>>>> Hi Stefano
>>>>>>
>>>>>> Trying to simulate IO_RETRY handling mechanism (according to model
>>>>>> below) I
>>>>>> continuously get IO_RETRY from try_fwd_ioserv() ...
>>>>>>
>>>>>>> OK, thanks for the details. My interpretation seems to be correct.
>>>>>>>
>>>>>>> In which case, it looks like xen/arch/arm/io.c:try_fwd_ioserv 
>>>>>>> should
>>>>>>> return IO_RETRY. Then, 
>>>>>>> xen/arch/arm/traps.c:do_trap_stage2_abort_guest
>>>>>>> also needs to handle try_handle_mmio returning IO_RETRY the first
>>>>>>> around, and IO_HANDLED when after QEMU does its job.
>>>>>>>
>>>>>>> What should do_trap_stage2_abort_guest do on IO_RETRY? Simply 
>>>>>>> return
>>>>>>> early and let the scheduler do its job? Something like:
>>>>>>>
>>>>>>>                enum io_state state = try_handle_mmio(regs, hsr, 
>>>>>>> gpa);
>>>>>>>
>>>>>>>                switch ( state )
>>>>>>>                {
>>>>>>>                case IO_ABORT:
>>>>>>>                    goto inject_abt;
>>>>>>>                case IO_HANDLED:
>>>>>>>                    advance_pc(regs, hsr);
>>>>>>>                    return;
>>>>>>>                case IO_RETRY:
>>>>>>>                    /* finish later */
>>>>>>>                    return;
>>>>>>>                case IO_UNHANDLED:
>>>>>>>                    /* IO unhandled, try another way to handle 
>>>>>>> it. */
>>>>>>>                    break;
>>>>>>>                default:
>>>>>>>                    ASSERT_UNREACHABLE();
>>>>>>>                }
>>>>>>>
>>>>>>> Then, xen/arch/arm/ioreq.c:handle_mmio() gets called by
>>>>>>> handle_hvm_io_completion() after QEMU completes the emulation. 
>>>>>>> Today,
>>>>>>> handle_mmio just sets the user register with the read value.
>>>>>>>
>>>>>>> But it would be better if it called again the original function
>>>>>>> do_trap_stage2_abort_guest to actually retry the original 
>>>>>>> operation.
>>>>>>> This time do_trap_stage2_abort_guest calls try_handle_mmio() and 
>>>>>>> gets
>>>>>>> IO_HANDLED instead of IO_RETRY,
>>>>>> I may miss some important point, but I failed to see why 
>>>>>> try_handle_mmio
>>>>>> (try_fwd_ioserv) will return IO_HANDLED instead of IO_RETRY at this
>>>>>> stage.
>>>>>> Or current try_fwd_ioserv() logic needs rework?
>>>>> I think you should check the ioreq->state in try_fwd_ioserv(), if the
>>>>> result is ready, then ioreq->state should be STATE_IORESP_READY, 
>>>>> and you
>>>>> can return IO_HANDLED.
>>>>
>>>
>>> I optimized test patch a bit (now it looks much simpler). I didn't 
>>> face any
>>> issues during a quick test.
>>
>> Both patches get much closer to following the proper state machine,
>> great! I think this patch is certainly a good improvement. I think the
>> other patch you sent earlier, slightly larger, is even better. It makes
>> the following additional changes that would be good to have:
>>
>> - try_fwd_ioserv returns IO_HANDLED on state == STATE_IORESP_READY
>> - handle_mmio simply calls do_trap_stage2_abort_guest
>
> I don't think we should call do_trap_stage2_abort_guest() as part of 
> the completion because:
>     * The function do_trap_stage2_abort_guest() is using registers 
> that are not context switched (such as FAR_EL2). I/O handling is split 
> in two with likely a context switch in the middle. The second part is 
> the completion (i.e call to handle_mmio()). So the system registers 
> will be incorrect.
>     * A big chunk of do_trap_stage2_abort_guest() is not necessary for 
> the completion. For instance, there is no need to try to translate the 
> guest virtual address to a guest physical address.
>
> Therefore the version below is probably the best approach.


Indeed, the first version (with calling do_trap_stage2_abort_guest() for 
a completion) is a racy. When testing it more heavily I faced an issue 
(sometimes) which resulted in DomU got stuck completely.

(XEN) d2v1: vGICD: bad read width 0 r11 offset 0x000f00

I didn't investigate an issue in detail, but I assumed that code in 
do_trap_stage2_abort_guest() caused that. This was the main reason why I 
decided to optimize an initial patch (and took only advance_pc).
Reading Julien's answer I understand now what could happen.


-- 
Regards,

Oleksandr Tyshchenko


