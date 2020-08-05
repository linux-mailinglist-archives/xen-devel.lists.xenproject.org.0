Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B93A823C655
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 09:02:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3DQt-0005La-Gh; Wed, 05 Aug 2020 07:01:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7mHh=BP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3DQs-0005LV-Dx
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 07:01:50 +0000
X-Inumbo-ID: 34209da2-a50b-4022-8269-d29ea3474df0
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34209da2-a50b-4022-8269-d29ea3474df0;
 Wed, 05 Aug 2020 07:01:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BD26DAC37;
 Wed,  5 Aug 2020 07:02:04 +0000 (UTC)
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
To: Stefano Stabellini <sstabellini@kernel.org>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
 <000c01d66a33$2bd56510$83802f30$@xen.org>
 <9f83a7ed-ca97-449f-c7b9-a1140644abe9@gmail.com>
 <f0c32cfe-5c33-30ae-b08a-3d72e935745a@xen.org>
 <alpine.DEB.2.21.2008041105510.5748@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2ab4c567-8efa-1b9d-ab00-4ea7e1ab323e@suse.com>
Date: Wed, 5 Aug 2020 09:01:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008041105510.5748@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 'Wei Liu' <wl@xen.org>, paul@xen.org,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Tim Deegan' <tim@xen.org>,
 Oleksandr <olekstysh@gmail.com>,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Julien Grall' <julien.grall@arm.com>, 'Jun Nakajima' <jun.nakajima@intel.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.08.2020 21:11, Stefano Stabellini wrote:
>> The point of the check isn't to determine whether to wait, but
>> what to do after having waited. Reads need a retry round through
>> the emulator (to store the result in the designated place),
>> while writes don't have such a requirement (and hence guest
>> execution can continue immediately in the general case).
> 
> The x86 code looks like this:
> 
>             rc = hvm_send_ioreq(s, &p, 0);
>             if ( rc != X86EMUL_RETRY || currd->is_shutting_down )
>                 vio->io_req.state = STATE_IOREQ_NONE;
>             else if ( !hvm_ioreq_needs_completion(&vio->io_req) )
>                 rc = X86EMUL_OKAY;
> 
> Basically hvm_send_ioreq is expected to return RETRY.
> Then, if it is a PIO write operation only, it is turned into OKAY right
> away. Otherwise, rc stays as RETRY.
> 
> So, normally, hvmemul_do_io is expected to return RETRY, because the
> emulator is not done yet. Am I understanding the code correctly?

"The emulator" unfortunately is ambiguous here: Do you mean qemu
(or whichever else ioreq server) or the x86 emulator inside Xen?
There are various conditions leading to RETRY. As far as
hvm_send_ioreq() goes, it is expected to return RETRY whenever
some sort of response is to be expected (the most notable
exception being the hvm_send_buffered_ioreq() path), or when
submitting the request isn't possible in the first place.

> If so, who is handling RETRY on x86? It tried to follow the call chain
> but ended up in the x86 emulator and got lost :-)

Not sure I understand the question correctly, but I'll try an
answer nevertheless: hvm_send_ioreq() arranges for the vCPU to be
put to sleep (prepare_wait_on_xen_event_channel()). Once the event
channel got signaled (and vCPU unblocked), hvm_do_resume() ->
handle_hvm_io_completion() -> hvm_wait_for_io() then check whether
the wait reason has been satisfied (wait_on_xen_event_channel()),
and ...

> At some point later, after the emulator (QEMU) has completed the
> request, handle_hvm_io_completion gets called which ends up calling
> handle_mmio() finishing the job on the Xen side too.

..., as you say, handle_hvm_io_completion() invokes the retry of
the original operation (handle_mmio() or handle_pio() in
particular) if need be.

What's potentially confusing is that there's a second form of
retry, invoked by the x86 insn emulator itself when it needs to
split complex insns (the repeated string insns being the most
important example). This results in actually exiting back to guest
context without having advanced rIP, but after having updated
other register state suitably (to express the progress made so
far).

Jan

