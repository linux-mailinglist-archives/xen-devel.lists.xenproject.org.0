Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CF42418CA
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 11:21:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5QRy-0002nw-3l; Tue, 11 Aug 2020 09:20:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4+w=BV=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k5QRw-0002Zx-M1
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 09:20:04 +0000
X-Inumbo-ID: 8f6c20c2-d482-46c6-99a2-f95310eb1d0b
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f6c20c2-d482-46c6-99a2-f95310eb1d0b;
 Tue, 11 Aug 2020 09:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bd1q8FsC3igFmo07I/9GyTruVYHgfVy5oU4uLtwlQl8=; b=AfWxgMagCpVMH515x0CjI1oz/G
 i+hY9ual6q+xiBuyc1lpmWArQz5L6mzbJIeix4NdqqugHiHkJadxDADWZg6qUB5ceox/aH0cpMU+g
 5VCJ7NDp7qzH85rvtv4jbDF+DqgXm18N/Bi6XewdGYuCWDwFGKC3D+DIkP3lq+Vis5CY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k5QRm-0005Wf-0l; Tue, 11 Aug 2020 09:19:54 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k5QRl-0004HH-LC; Tue, 11 Aug 2020 09:19:53 +0000
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
To: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr <olekstysh@gmail.com>
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
From: Julien Grall <julien@xen.org>
Message-ID: <441f4413-b746-035e-948e-da3ff76a9a3b@xen.org>
Date: Tue, 11 Aug 2020 10:19:50 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008101200230.16004@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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

Hi Stefano,

On 11/08/2020 00:34, Stefano Stabellini wrote:
> On Mon, 10 Aug 2020, Oleksandr wrote:
>> On 08.08.20 01:19, Oleksandr wrote:
>>> On 08.08.20 00:50, Stefano Stabellini wrote:
>>>> On Fri, 7 Aug 2020, Oleksandr wrote:
>>>>> On 06.08.20 03:37, Stefano Stabellini wrote:
>>>>>
>>>>> Hi Stefano
>>>>>
>>>>> Trying to simulate IO_RETRY handling mechanism (according to model
>>>>> below) I
>>>>> continuously get IO_RETRY from try_fwd_ioserv() ...
>>>>>
>>>>>> OK, thanks for the details. My interpretation seems to be correct.
>>>>>>
>>>>>> In which case, it looks like xen/arch/arm/io.c:try_fwd_ioserv should
>>>>>> return IO_RETRY. Then, xen/arch/arm/traps.c:do_trap_stage2_abort_guest
>>>>>> also needs to handle try_handle_mmio returning IO_RETRY the first
>>>>>> around, and IO_HANDLED when after QEMU does its job.
>>>>>>
>>>>>> What should do_trap_stage2_abort_guest do on IO_RETRY? Simply return
>>>>>> early and let the scheduler do its job? Something like:
>>>>>>
>>>>>>                enum io_state state = try_handle_mmio(regs, hsr, gpa);
>>>>>>
>>>>>>                switch ( state )
>>>>>>                {
>>>>>>                case IO_ABORT:
>>>>>>                    goto inject_abt;
>>>>>>                case IO_HANDLED:
>>>>>>                    advance_pc(regs, hsr);
>>>>>>                    return;
>>>>>>                case IO_RETRY:
>>>>>>                    /* finish later */
>>>>>>                    return;
>>>>>>                case IO_UNHANDLED:
>>>>>>                    /* IO unhandled, try another way to handle it. */
>>>>>>                    break;
>>>>>>                default:
>>>>>>                    ASSERT_UNREACHABLE();
>>>>>>                }
>>>>>>
>>>>>> Then, xen/arch/arm/ioreq.c:handle_mmio() gets called by
>>>>>> handle_hvm_io_completion() after QEMU completes the emulation. Today,
>>>>>> handle_mmio just sets the user register with the read value.
>>>>>>
>>>>>> But it would be better if it called again the original function
>>>>>> do_trap_stage2_abort_guest to actually retry the original operation.
>>>>>> This time do_trap_stage2_abort_guest calls try_handle_mmio() and gets
>>>>>> IO_HANDLED instead of IO_RETRY,
>>>>> I may miss some important point, but I failed to see why try_handle_mmio
>>>>> (try_fwd_ioserv) will return IO_HANDLED instead of IO_RETRY at this
>>>>> stage.
>>>>> Or current try_fwd_ioserv() logic needs rework?
>>>> I think you should check the ioreq->state in try_fwd_ioserv(), if the
>>>> result is ready, then ioreq->state should be STATE_IORESP_READY, and you
>>>> can return IO_HANDLED.
>>>
>>
>> I optimized test patch a bit (now it looks much simpler). I didn't face any
>> issues during a quick test.
> 
> Both patches get much closer to following the proper state machine,
> great! I think this patch is certainly a good improvement. I think the
> other patch you sent earlier, slightly larger, is even better. It makes
> the following additional changes that would be good to have:
> 
> - try_fwd_ioserv returns IO_HANDLED on state == STATE_IORESP_READY
> - handle_mmio simply calls do_trap_stage2_abort_guest

I don't think we should call do_trap_stage2_abort_guest() as part of the 
completion because:
     * The function do_trap_stage2_abort_guest() is using registers that 
are not context switched (such as FAR_EL2). I/O handling is split in two 
with likely a context switch in the middle. The second part is the 
completion (i.e call to handle_mmio()). So the system registers will be 
incorrect.
     * A big chunk of do_trap_stage2_abort_guest() is not necessary for 
the completion. For instance, there is no need to try to translate the 
guest virtual address to a guest physical address.

Therefore the version below is probably the best approach.

Cheers,

-- 
Julien Grall

