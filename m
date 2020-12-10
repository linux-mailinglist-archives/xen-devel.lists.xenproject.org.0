Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE8B2D5B83
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 14:22:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49211.86993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knLtP-0003ik-7p; Thu, 10 Dec 2020 13:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49211.86993; Thu, 10 Dec 2020 13:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knLtP-0003iL-3s; Thu, 10 Dec 2020 13:21:59 +0000
Received: by outflank-mailman (input) for mailman id 49211;
 Thu, 10 Dec 2020 13:21:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ykji=FO=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1knLtM-0003iG-Vw
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 13:21:57 +0000
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 532f62c1-e92f-48b9-8877-7f66ac2abf49;
 Thu, 10 Dec 2020 13:21:55 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id m25so8140879lfc.11
 for <xen-devel@lists.xenproject.org>; Thu, 10 Dec 2020 05:21:55 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id y12sm482995lfy.300.2020.12.10.05.21.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 05:21:54 -0800 (PST)
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
X-Inumbo-ID: 532f62c1-e92f-48b9-8877-7f66ac2abf49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=NOedhVT3rvhdHXuGqVxU37/Xsir0ZN0vrpQc+/P9xm4=;
        b=HIAbXnrYpPbBzsPh8PCjdG//01sIMd72psTDBVAXPZmmMaNmcUOEPnqjiqbYwTjacS
         wcPReKzQb4FyURa6ZWrdPZpKHkdfquk8p1Y8PETCLAr5gXBEpx133DC42Bvq8iCeJqyM
         J0JWZIPGXWALeZWk4wPFGJE5jeOPdWBqTcsVriMJw0OAObJvNvSkoyMC3CumZl/jojH4
         MQ3so+qLcQKrsnyj2RTBJ+cY0NdFoBaYHRnMPQKCjiZd2bteW8ZDtI2/tSitEm+7XsZd
         YN0F8SqVuS+HHlKzRrVDDolcc/pX2nCRhqLc1kOamc8XCQyhZCHX9o9SPFn1cg7FNs4n
         fT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=NOedhVT3rvhdHXuGqVxU37/Xsir0ZN0vrpQc+/P9xm4=;
        b=KC0+1rzC0xIqKF7f0a03Q5e0IlxUqlWFJWYaloJZXn7gwp/Nt0ZgshRKWJrsXAaRw7
         ZeH/x5mIu8ZgQue0SCLzYmCsexv9/zE1X0lLKYF/vptm5GL3G2wysi0WIVTnxQ7hF9sQ
         uqW2oBTLobR1XLKkA++xphhMZyz6N+UILOJD/4roJgFdH9tEE9fCXE6AnZwrQlao+eef
         I0HaqQjaU40tSulfe6pNBrv2kYvlFiZ20TtblwzESGlrtVKXiYcsLWqCeBSS+shOnfuB
         fR1yxTVDf/C701BQQIlHoU0kF7h8SD8/393auCt9bWtmln8SaK6NOY1rtUGD8VoNDwBC
         TGZg==
X-Gm-Message-State: AOAM531RlTrw5CGYIQp4cv1dQ3wOf3KLE0yCvhBGt7f+u5F2HqW+QRgB
	DDptNBqJqT455sFdTijhUhA=
X-Google-Smtp-Source: ABdhPJx5/4mH2wr+XsZl8BCvpjmawibTtVzu0mH/VQIu3KglLmkLGls9nL7kqH1M8QbsvZL0GJGHPA==
X-Received: by 2002:a19:a57:: with SMTP id 84mr2749675lfk.327.1607606514683;
        Thu, 10 Dec 2020 05:21:54 -0800 (PST)
Subject: Re: [PATCH V3 15/23] xen/arm: Stick around in
 leave_hypervisor_to_guest until I/O has completed
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-16-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2012091432450.20986@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2012091521480.20986@sstabellini-ThinkPad-T480s>
 <52799b99-6405-03f4-2a46-3a0a4aac597f@xen.org>
 <alpine.DEB.2.21.2012091745550.20986@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <88aea7f9-43d2-f67b-b5a8-c0b6204eac58@gmail.com>
Date: Thu, 10 Dec 2020 15:21:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2012091745550.20986@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 10.12.20 04:30, Stefano Stabellini wrote:

Hi Julien, Stefano

> On Wed, 9 Dec 2020, Julien Grall wrote:
>> On 09/12/2020 23:35, Stefano Stabellini wrote:
>>> On Wed, 9 Dec 2020, Stefano Stabellini wrote:
>>>> On Mon, 30 Nov 2020, Oleksandr Tyshchenko wrote:
>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>
>>>>> This patch adds proper handling of return value of
>>>>> vcpu_ioreq_handle_completion() which involves using a loop
>>>>> in leave_hypervisor_to_guest().
>>>>>
>>>>> The reason to use an unbounded loop here is the fact that vCPU
>>>>> shouldn't continue until an I/O has completed. In Xen case, if an I/O
>>>>> never completes then it most likely means that something went horribly
>>>>> wrong with the Device Emulator. And it is most likely not safe to
>>>>> continue. So letting the vCPU to spin forever if I/O never completes
>>>>> is a safer action than letting it continue and leaving the guest in
>>>>> unclear state and is the best what we can do for now.
>>>>>
>>>>> This wouldn't be an issue for Xen as do_softirq() would be called at
>>>>> every loop. In case of failure, the guest will crash and the vCPU
>>>>> will be unscheduled.
>>>> Imagine that we have two guests: one that requires an ioreq server and
>>>> one that doesn't. If I am not mistaken this loop could potentially spin
>>>> forever on a pcpu, thus preventing any other guest being scheduled, even
>>>> if the other guest doesn't need any ioreq servers.
>>>>
>>>>
>>>> My other concern is that we are busy-looping. Could we call something
>>>> like wfi() or do_idle() instead? The ioreq server event notification of
>>>> completion should wake us up?
>>>>
>>>> Following this line of thinking, I am wondering if instead of the
>>>> busy-loop we should call vcpu_block_unless_event_pending(current) in
>>>> try_handle_mmio if IO_RETRY. Then when the emulation is done, QEMU (or
>>>> equivalent) calls xenevtchn_notify which ends up waking up the domU
>>>> vcpu. Would that work?
>>> I read now Julien's reply: we are already doing something similar to
>>> what I suggested with the following call chain:
>>>
>>> check_for_vcpu_work -> vcpu_ioreq_handle_completion -> wait_for_io ->
>>> wait_on_xen_event_channel
>>>
>>> So the busy-loop here is only a safety-belt in cause of a spurious
>>> wake-up, in which case we are going to call again check_for_vcpu_work,
>>> potentially causing a guest reschedule.
>>>
>>> Then, this is fine and addresses both my concerns. Maybe let's add a note
>>> in the commit message about it.
>> Damm, I hit the "sent" button just a second before seen your reply. :/ Oh
>> well. I suggested the same because I have seen the same question multiple
>> time.


I will update commit description and probably the comment in code.


-- 
Regards,

Oleksandr Tyshchenko


