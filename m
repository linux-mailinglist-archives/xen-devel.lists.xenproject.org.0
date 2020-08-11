Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4323241636
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 08:15:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5NXP-0002PY-OT; Tue, 11 Aug 2020 06:13:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SWDt=BV=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k5NXO-0002PT-SM
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 06:13:30 +0000
X-Inumbo-ID: 7cf2b69f-81b8-460d-b50b-253db2ecb95d
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7cf2b69f-81b8-460d-b50b-253db2ecb95d;
 Tue, 11 Aug 2020 06:13:29 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id t23so12216402ljc.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2020 23:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=1Bzfmvk2BnHsFI3KruBg0hyGec2mKW3d8FB+a2+h33c=;
 b=R2V33lcpM/PdrQJeW4Rk47P+3MpfvhJqkVnIpRWDhin+V+ee+2w0T1W2IqiJdwSl/S
 xysgx2V2A/6tnF5U8icw/rmZMSvhV7n4x6olv8ZUTU//Xb6jT9sLhLx310JcQYQS3TO7
 rBVvPFo2SI8UxyRMUeX6PtpDZD66fG4KrAI24ZZZuDjJ9D7xzUsuXxXCOwvz1Un86DTS
 XlRKGkw9XFyAD/HHgaTcDXQ11b0kZf6jsZ4hUn4coEEGKA5bp4MXmGkttCGxZDQnChOC
 XdIcL0/EEk6jpgKmD7Ye+gZasvOxmYPnIDGeIGnMgPvnL3ZCfRKWCKZ3lry0Klygk2+0
 WudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1Bzfmvk2BnHsFI3KruBg0hyGec2mKW3d8FB+a2+h33c=;
 b=RMW2TidVGpaoEnzx8mABKakZcteZ+GdExy/8K4Of/X+RNOMNkjT1WnwwcuYLhJG3TI
 CUy9nSB6gfYSt3d7wBYW8ltYi4K6kWnol0deDqMfV4EPE9ZQ9IV/fQIx9xJqcgQMdJgM
 xdP9VwyUNmfzuX+hc/hbtZDTZCDS0wzpYnqCUQxizH9tYw8AEr5IbazvKkMQSRu4AGZp
 g9efFTI27BIbC5EsmMLhvvsPZMaDxYViFBydCjkgLbrtKkFIWLEpdZkYXdDJWOkidj0a
 S3ChqpOtMnQA6Tl5djjyPM4PWFhjp4wocbaQaTTBidpF9VT/xRm9ktBHyjZ4TtQGUo7d
 uMLw==
X-Gm-Message-State: AOAM533ds56nK6/cwHi2IJJeCXY6Dc42jqL2++6El1UClY/3gC0kS0J3
 LBYczzFxE2TDXu6ASDu0D4A=
X-Google-Smtp-Source: ABdhPJy6CzmdlhEpECJL+V+fEk+co/1olpyqWacCcNMTbMg4vZ6Jz4V5DU5X6T55caK7vZgvc2zYIA==
X-Received: by 2002:a2e:9284:: with SMTP id d4mr2233165ljh.64.1597126408116;
 Mon, 10 Aug 2020 23:13:28 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id t18sm11339511lfb.69.2020.08.10.23.13.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Aug 2020 23:13:27 -0700 (PDT)
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: Julien Grall <julien.grall.oss@gmail.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2008041327110.5748@sstabellini-ThinkPad-T480s>
 <8e8a394c-bd2a-4444-9f4b-e022c59e0f81@xen.org>
 <a1a1fcca-e840-3c02-dc9c-742c3e397836@gmail.com>
 <659a5b45-a37a-5cf2-0bcd-ba1ea3d47cc4@xen.org>
 <48a130dc-57fd-0627-d188-ddff4abf6778@gmail.com>
 <CAJ=z9a3x7LgztG2KQKza8n3Y7xJsoO+DSmyi8Pxm1BgQOBs=xQ@mail.gmail.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <5cf9c14c-3bac-ccbd-6586-1a540dbe9b8d@gmail.com>
Date: Tue, 11 Aug 2020 09:13:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJ=z9a3x7LgztG2KQKza8n3Y7xJsoO+DSmyi8Pxm1BgQOBs=xQ@mail.gmail.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 11.08.20 01:37, Julien Grall wrote:

Hi Julien

> On Mon, 10 Aug 2020 at 21:29, Oleksandr <olekstysh@gmail.com> wrote:
>>
>> On 10.08.20 22:00, Julien Grall wrote:
>>
>> Hi Julien
>>
>>>>>>> @@ -2275,6 +2282,16 @@ static void check_for_vcpu_work(void)
>>>>>>>     */
>>>>>>>    void leave_hypervisor_to_guest(void)
>>>>>>>    {
>>>>>>> +#ifdef CONFIG_IOREQ_SERVER
>>>>>>> +    /*
>>>>>>> +     * XXX: Check the return. Shall we call that in
>>>>>>> +     * continue_running and context_switch instead?
>>>>>>> +     * The benefits would be to avoid calling
>>>>>>> +     * handle_hvm_io_completion on every return.
>>>>>>> +     */
>>>>>> Yeah, that could be a simple and good optimization
>>>>> Well, it is not simple as it is sounds :).
>>>>> handle_hvm_io_completion() is the function in charge to mark the
>>>>> vCPU as waiting for I/O. So we would at least need to split the
>>>>> function.
>>>>>
>>>>> I wrote this TODO because I wasn't sure about the complexity of
>>>>> handle_hvm_io_completion(current). Looking at it again, the main
>>>>> complexity is the looping over the IOREQ servers.
>>>>>
>>>>> I think it would be better to optimize handle_hvm_io_completion()
>>>>> rather than trying to hack the context_switch() or continue_running().
>>>> Well, is the idea in proposed dirty test patch below close to what
>>>> you expect? Patch optimizes handle_hvm_io_completion() to avoid extra
>>>> actions if vcpu's domain doesn't have ioreq_server, alternatively
>>>> the check could be moved out of handle_hvm_io_completion() to avoid
>>>> calling that function at all.
>>> This looks ok to me.
>>>
>>>> BTW, TODO also suggests checking the return value of
>>>> handle_hvm_io_completion(), but I am completely sure we can simply
>>>> just return from leave_hypervisor_to_guest() at this point. Could you
>>>> please share your opinion?
>>>  From my understanding, handle_hvm_io_completion() may return false if
>>> there is pending I/O or a failure.
>> It seems, yes
>>
>>
>>> In the former case, I think we want to call handle_hvm_io_completion()
>>> later on. Possibly after we call do_softirq().
>>>
>>> I am wondering whether check_for_vcpu_work() could return whether
>>> there are more work todo on the behalf of the vCPU.
>>>
>>> So we could have:
>>>
>>> do
>>> {
>>>    check_for_pcpu_work();
>>> } while (check_for_vcpu_work())
>>>
>>> The implementation of check_for_vcpu_work() would be:
>>>
>>> if ( !handle_hvm_io_completion() )
>>>    return true;
>>>
>>> /* Rest of the existing code */
>>>
>>> return false;
>> Thank you, will give it a try.
>>
>> Can we behave the same way for both "pending I/O" and "failure" or we
>> need to distinguish them?
> We don't need to distinguish them. In both cases, we will want to
> process softirqs. In all the failure cases, the domain will have
> crashed. Therefore the vCPU will be unscheduled.

Got it.


>> Probably we need some sort of safe timeout/number attempts in order to
>> not spin forever?
> Well, anything based on timeout/number of attempts is flaky. How do
> you know whether the I/O is just taking a "long time" to complete?
>
> But a vCPU shouldn't continue until an I/O has completed. This is
> nothing very different than what a processor would do.
>
> In Xen case, if an I/O never completes then it most likely means that
> something went horribly wrong with the Device Emulator. So it is most
> likely not safe to continue. In HW, when there is a device failure,
> the OS may receive an SError (this is implementation defined) and
> could act accordingly if it is able to recognize the issue.
>
> It *might* be possible to send a virtual SError but there are a couple
> of issues with it:
>       * How do you detect a failure?
>       * SErrors are implementations defined. You would need to teach
> your OS (or the firmware) how to deal with them.
>
> I would expect quite a bit of effort in order to design and implement
> it. For now, it is probably best to just let the vCPU spin forever.
>
> This wouldn't be an issue for Xen as do_softirq() would be called at
> every loop.

  Thank you for clarification. Fair enough and sounds reasonable.


-- 
Regards,

Oleksandr Tyshchenko


