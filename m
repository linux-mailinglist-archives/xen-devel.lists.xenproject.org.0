Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E293E23F54E
	for <lists+xen-devel@lfdr.de>; Sat,  8 Aug 2020 01:46:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k4C2z-000745-NE; Fri, 07 Aug 2020 23:45:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tO9i=BR=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k4C2y-000740-9N
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 23:45:12 +0000
X-Inumbo-ID: f8dc32a9-9fa5-484b-b7a9-4751a7c1e700
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8dc32a9-9fa5-484b-b7a9-4751a7c1e700;
 Fri, 07 Aug 2020 23:45:11 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id h8so1834498lfp.9
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2020 16:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=/DvT9xa8toEseeHzoJwpWlVyvQeSAfvo/Pdjio7ZUHo=;
 b=TRk1K5rTfN3WTqw7I9O08Ep5Yb08hOBYekkD6qLJIRCIyLnzQW29UMpkjU751YxW1N
 KLP2f79jgfxjqNx0wo1tTJ1envrH+cE5+Oaq1Md42cXR7SzvDyt+GDiIQiUbKCsX5pV2
 QgKDYum5MYd/3oaj82C0k3G9GTELN7Skawkz0hXnu/hUj1Dh6nNfgh7T5zXMtzeVZzCb
 feKZJ18rXgmVqfPDDADPyhwh6xVs6yULkeGdLle6yZ4QZOeCCI+Bggc7chx4cYveTAYE
 kB8bTWfP25+JT/MNdeYjwS5UbatiRSPoHUxmeGFQ3d/9BcWSYJDpfzBESOQvwBnUVLXl
 UHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/DvT9xa8toEseeHzoJwpWlVyvQeSAfvo/Pdjio7ZUHo=;
 b=GPhE3VMJZAavHFQhX1WixHpz63DUd5OL2r72MamBaFzlWVA8py5V2Ea6Nyg+rNwzlg
 xRWPhBfa3BEmWLdEwY5ftsbrYM61fh4MybjVy6mrI4sx2Qe41Kr6txqQjWD4Bk3gQuTz
 bwBV6bR+GUo/F5a7KJTmWo8Rc1Pw0vQVTvn3FzDnITFtlzq0tgosTD432YUSPjYToOy4
 v7UuOHNiZ7gseyB1AuAHqx+BleAHGfnIqZTC4iI4kpzITJf+EDd5jWfZ/dtsBb0mKfTs
 3G1VIRjPO3rLQnU49qJjZlUZTDON9DNVIwQEPPZcGzRVcWPXCpTWiRIkZL4WwWrV6PW3
 5mkQ==
X-Gm-Message-State: AOAM531cd2VgFO9OWvJ6shhqPo5i1b/BhALI1ysWnSNx0lcxv/ZPHN6P
 Il3xmu27MdYk8g+oKhvj6BU=
X-Google-Smtp-Source: ABdhPJyvjoFf7UPJOZrqQkzqOQbQA2Is69QLebe6zjCOg3y15r5kBkOQz4J/k0430iZyH7agJ3rAOQ==
X-Received: by 2002:a19:3c7:: with SMTP id 190mr7456986lfd.14.1596843909932;
 Fri, 07 Aug 2020 16:45:09 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id g24sm4364133ljl.139.2020.08.07.16.45.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2020 16:45:09 -0700 (PDT)
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
To: Stefano Stabellini <sstabellini@kernel.org>
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
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <910ec6ee-1076-2c9d-c01d-b6b4cc0bc6b8@gmail.com>
Date: Sat, 8 Aug 2020 02:45:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008071259580.16004@sstabellini-ThinkPad-T480s>
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
Cc: 'Kevin Tian' <kevin.tian@intel.com>, Julien Grall <julien@xen.org>,
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


On 08.08.20 00:50, Stefano Stabellini wrote:

Hi

> On Fri, 7 Aug 2020, Oleksandr wrote:
>> On 06.08.20 03:37, Stefano Stabellini wrote:
>>
>> Hi Stefano
>>
>> Trying to simulate IO_RETRY handling mechanism (according to model below) I
>> continuously get IO_RETRY from try_fwd_ioserv() ...
>>
>>> OK, thanks for the details. My interpretation seems to be correct.
>>>
>>> In which case, it looks like xen/arch/arm/io.c:try_fwd_ioserv should
>>> return IO_RETRY. Then, xen/arch/arm/traps.c:do_trap_stage2_abort_guest
>>> also needs to handle try_handle_mmio returning IO_RETRY the first
>>> around, and IO_HANDLED when after QEMU does its job.
>>>
>>> What should do_trap_stage2_abort_guest do on IO_RETRY? Simply return
>>> early and let the scheduler do its job? Something like:
>>>
>>>               enum io_state state = try_handle_mmio(regs, hsr, gpa);
>>>
>>>               switch ( state )
>>>               {
>>>               case IO_ABORT:
>>>                   goto inject_abt;
>>>               case IO_HANDLED:
>>>                   advance_pc(regs, hsr);
>>>                   return;
>>>               case IO_RETRY:
>>>                   /* finish later */
>>>                   return;
>>>               case IO_UNHANDLED:
>>>                   /* IO unhandled, try another way to handle it. */
>>>                   break;
>>>               default:
>>>                   ASSERT_UNREACHABLE();
>>>               }
>>>
>>> Then, xen/arch/arm/ioreq.c:handle_mmio() gets called by
>>> handle_hvm_io_completion() after QEMU completes the emulation. Today,
>>> handle_mmio just sets the user register with the read value.
>>>
>>> But it would be better if it called again the original function
>>> do_trap_stage2_abort_guest to actually retry the original operation.
>>> This time do_trap_stage2_abort_guest calls try_handle_mmio() and gets
>>> IO_HANDLED instead of IO_RETRY,
>> I may miss some important point, but I failed to see why try_handle_mmio
>> (try_fwd_ioserv) will return IO_HANDLED instead of IO_RETRY at this stage.
>> Or current try_fwd_ioserv() logic needs rework?
> I think you should check the ioreq->state in try_fwd_ioserv(), if the
> result is ready, then ioreq->state should be STATE_IORESP_READY, and you
> can return IO_HANDLED.
>
> That is assuming that you are looking at the live version of the ioreq
> shared with QEMU instead of a private copy of it, which I am not sure.
> Looking at try_fwd_ioserv() it would seem that vio->io_req is just a
> copy? The live version is returned by get_ioreq() ?

If I understand the code correctly, indeed, get_ioreq() returns live 
version shared with emulator.
Desired state change (STATE_IORESP_READY) what actually the 
hvm_wait_for_io() is waiting for is set here (in my case):
https://xenbits.xen.org/gitweb/?p=people/pauldu/demu.git;a=blob;f=demu.c;h=f785b394d0cf141dffa05bdddecf338214358aea;hb=refs/heads/master#l698 


> Even in handle_hvm_io_completion, instead of setting vio->io_req.state
> to STATE_IORESP_READY by hand, it would be better to look at the live
> version of the ioreq because QEMU will have already set ioreq->state
> to STATE_IORESP_READY (hw/i386/xen/xen-hvm.c:cpu_handle_ioreq).
It seems that after detecting STATE_IORESP_READY in hvm_wait_for_io() 
the state of live version is set to STATE_IOREQ_NONE immediately, so 
looking at the live version down the handle_hvm_io_completion()
or in try_fwd_ioserv() shows us nothing I am afraid.


-- 
Regards,

Oleksandr Tyshchenko


