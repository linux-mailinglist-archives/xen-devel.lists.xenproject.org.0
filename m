Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC65D2FA151
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 14:24:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69667.124840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1UV7-0006XT-3w; Mon, 18 Jan 2021 13:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69667.124840; Mon, 18 Jan 2021 13:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1UV7-0006X4-0k; Mon, 18 Jan 2021 13:23:21 +0000
Received: by outflank-mailman (input) for mailman id 69667;
 Mon, 18 Jan 2021 13:23:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hh0t=GV=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l1UV5-0006Wz-22
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 13:23:19 +0000
Received: from mail-lf1-x134.google.com (unknown [2a00:1450:4864:20::134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ef976d0-9737-491e-a3d7-8d0e77fd2753;
 Mon, 18 Jan 2021 13:23:18 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id b26so24056498lff.9
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 05:23:17 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v4sm1893332lfa.55.2021.01.18.05.23.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 05:23:16 -0800 (PST)
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
X-Inumbo-ID: 9ef976d0-9737-491e-a3d7-8d0e77fd2753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ABPU3Mv7pESs5E7tOsjD+lkFrpRrN4UoS2+0GyCGC+s=;
        b=AupSnJ/RYpe1HUFa1pd2LGzJKXpIWWtn6qnNB+FdM+frXXQMN0yjxVclYggJOSFTIg
         Nn9yJ3NVG/K0+23hK5NdYOhDUnrb3acc2B93CFrbSL05kzDl+3H9Nf8m0DBl16yxjywE
         4r0M1GG9VoVO/CzJoVwUvXGR5NZ0mzOwaOwZYCdEyVEyB3ZTzu8AaJjNYi+G3Ox07l7O
         PBRDumayeIYZpBXt4rrK5oxMfz7TDiTovy3onjxtfRP3tUX+rk7FGDlVbzIhQ65Pex+e
         PT4evAlKdvoGqNR9g83LZqYtLp6SH+E4mBopKLda26QQ0/A8PahAJyhtRikCQNBcaA6x
         fnow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ABPU3Mv7pESs5E7tOsjD+lkFrpRrN4UoS2+0GyCGC+s=;
        b=DsQWwlxzQcWfcVd2RQrQfSVSKgmBkP1XzykA+T/XauPt9OqLQPiwJlfarlo9wqBHhB
         uKQcYwsmz3BdMXhN1pxV/i5irZNIovQ/7KnVLBl35DECcdOIhD1UYOgtex0j2CHllznU
         BqmIKgUEQCOUuQJ2JDljc9JwzMKvg3BQ7jOKvLPcNxDVa2XJnwY29HoYMiAORg+2oQXg
         wt8S/p8U9wbwkHEpKrnvbSpI/lAjlWrDEYXAECIM9rISwtEolyQQpZYcbJP6xGTocwdT
         aUlxYIQfRjPlDXMLPvj4+CP9NLb0THWC84w9TT03EWI1lTMqCnICa2ob+p4gfZSX/voH
         zd8w==
X-Gm-Message-State: AOAM531Uhp8Wb+j0Yc89Be+PA4PBI0BDkz7B7rain42UGSZfe3qtvaQs
	m6Srpyt+v2kJhfHEwFSHEM0=
X-Google-Smtp-Source: ABdhPJyqTAtq9p6EC9eWOpdvifm1jdXacTyz3QuXZiUG71kWpaaU8Vsck3mokgk2VuM7OtXTGw7FQg==
X-Received: by 2002:a19:ad42:: with SMTP id s2mr11064419lfd.448.1610976196826;
        Mon, 18 Jan 2021 05:23:16 -0800 (PST)
Subject: Re: [PATCH V4 15/24] xen/arm: Stick around in
 leave_hypervisor_to_guest until I/O has completed
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-16-git-send-email-olekstysh@gmail.com>
 <1f1f910b-ebef-f071-3458-12ad493d6e79@xen.org>
 <e57ca0f8-f92f-1ba3-d874-4265e1031542@gmail.com>
 <56919528-460f-6ba5-3412-11293b032e14@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <b775a7ec-647f-7f2a-8d0b-2b3bce01d3c5@gmail.com>
Date: Mon, 18 Jan 2021 15:23:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <56919528-460f-6ba5-3412-11293b032e14@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 18.01.21 12:57, Julien Grall wrote:
> Hi Oleksandr,


Hi Julien



>
> On 17/01/2021 20:23, Oleksandr wrote:
>>
>> On 15.01.21 22:55, Julien Grall wrote:
>>>> So we need
>>>> to check if the I/O has completed and wait again if it hasn't (we will
>>>> block the vCPU again until an event is received). This loop makes sure
>>>> that all the vCPU works are done before we return to the guest.
>>>>
>>>> The call chain below:
>>>> check_for_vcpu_work -> vcpu_ioreq_handle_completion -> wait_for_io ->
>>>> wait_on_xen_event_channel
>>>>
>>>> The worse that can happen here if the vCPU will never run again
>>>> (the I/O will never complete). But, in Xen case, if the I/O never
>>>> completes then it most likely means that something went horribly
>>>> wrong with the Device Emulator. And it is most likely not safe
>>>> to continue. So letting the vCPU to spin forever if the I/O never
>>>> completes is a safer action than letting it continue and leaving
>>>> the guest in unclear state and is the best what we can do for now.
>>>>
>>>> Please note, using this loop we will not spin forever on a pCPU,
>>>> preventing any other vCPUs from being scheduled. At every loop
>>>> we will call check_for_pcpu_work() that will process pending
>>>> softirqs. In case of failure, the guest will crash and the vCPU
>>>> will be unscheduled. In normal case, if the rescheduling is necessary
>>>> (might be set by a timer or by a caller in check_for_vcpu_work(),
>>>> where wait_for_io() is a preemption point) the vCPU will be 
>>>> rescheduled
>>>> to give place to someone else.
>>>>
>>> What you describe here is a bug that was introduced by this series. 
>>> If you think the code requires a separate patch, then please split 
>>> off patch #14 so the code callling vcpu_ioreq_handle_completion() 
>>> happen here.
>> I am afraid, I don't understand which bug you are talking about, I 
>> just tried to explain why using a loop is not bad (there wouldn't be 
>> any impact to other vCPUs, etc) and the worse case which could happen.
>> Also I don't see a reason why the code requires a separate patch 
>> (probably, if I understood a bug I would see a reason ...) Could you 
>> please clarify?
>
> Your commit message begins with:
>
> "This patch adds proper handling of return value of
> vcpu_ioreq_handle_completion() which involves using a loop in
> leave_hypervisor_to_guest()."
>
> I read this as "there was a bug in the code base and we are now fixing 
>  it". AFAICT, this patch would not be necessary if we don't apply 
> patch #14 in Xen (assuming the rest of IOREQ is complete).
>
> Therefore you are fixing a bug that you introduced in the same series.

Now I got it. Thank you for the clarification.


>
>
> It is considered as a bad practice because it means
>   1) we have to review code that is known "buggy" (patch #14).
>   2) adds more churn in the series than necessary
>
> Instead, it would be better to split your changes in
> check_for_vcpu_work() from patch #14 and add them here.

Now I agree, will do (and update patch subject).


>
>
> [...]
>
>>> So I would rework the loop to write it as:
>>>
>>> while ( check_for_pcpu_work() )
>>>    check_for_pcpu_work();
>>> check_for_pcpu_work();
>>
>> makes sense, I assume you meant while ( check_for_vcpu_work() ) ...
>
> Yes. Sorry for the typo.
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


