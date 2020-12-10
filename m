Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B4C2D5B08
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 13:58:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49182.86942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knLWe-0000Uy-99; Thu, 10 Dec 2020 12:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49182.86942; Thu, 10 Dec 2020 12:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knLWe-0000UZ-5c; Thu, 10 Dec 2020 12:58:28 +0000
Received: by outflank-mailman (input) for mailman id 49182;
 Thu, 10 Dec 2020 12:58:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ykji=FO=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1knLWc-0000UP-Fa
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 12:58:26 +0000
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c2beb07-3afe-4d07-b38a-6e95b861d811;
 Thu, 10 Dec 2020 12:58:25 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id m12so8055290lfo.7
 for <xen-devel@lists.xenproject.org>; Thu, 10 Dec 2020 04:58:25 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id f2sm595273ljc.118.2020.12.10.04.58.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 04:58:23 -0800 (PST)
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
X-Inumbo-ID: 2c2beb07-3afe-4d07-b38a-6e95b861d811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ohwkoyODvJw6BcZ33Iln+najISdwGwnci2zjmYTgWbU=;
        b=T/OWrY4Yd1rnYS0alT3/ZO5DD++RxEMUbtUPShKmTtIW9m/V6E25ljoIOEkvwXdQJw
         h9hDm2tH7pzehWl4CKbIZfl9mY661XMf2nCcGb3D8DSrvHYfcbGHxxBSoK6sMl4TP4Rt
         aElWoxOOjjZiH0z0EcRchtpjtuYWdj9JAfkMfoJHdZG8labIwT0Vcg8wOQ0h/G8IYuzC
         XbIgBYKx2wbsRqkrNFRWQu4i0rq8yKkNjEGiPwHGmsk+g8VdJfjtEtxM4oQq++PwOfDR
         GeqsARsuFOey7eUqsKidRCF8nZg7AiArrkmtfNfO0ULcHRQdBoqIl5wQRgaev6VF6BJd
         0SxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ohwkoyODvJw6BcZ33Iln+najISdwGwnci2zjmYTgWbU=;
        b=V83MmwCozs8niIqOSiKjwfN+WVU5hU17oIjarTGxxwf5JVW/XoCusG3IFrJElU1r2N
         j6CqodltUN55YRJFdJPRnnF8RQ7XUJAdMCVfFYCUMxPXDNkTB6HSlSV0ueWWrUnt/+Ge
         WQFOUCntSxVmdeNmNlJzNmsVBR6mAa0Oi4N9PDvrrLKBPvt8PLNWwETpMR+Q5AK4XVXX
         /5OLDr12tpOETvjKGKQRS+xcr+VIsxG8xBj5tsCR2SxzS5wdlhooq9a28UiG1yhGkyEG
         z4XWULc0wY39BHz7psgPEcvX/PUoPEwstLAAOZykTvAVjXv3gp8sv4JYaDX25Sj4tS5C
         0RIg==
X-Gm-Message-State: AOAM533lNHvzxTZym/vr0PasWlg1Ni7IAWYzpZRhMQMylfLbReAuEA4J
	I9g2NEaDmcR/F0boR7azRTY=
X-Google-Smtp-Source: ABdhPJxCP+weIO1KUKDIM65V/3MvzqmAhHEEe+b3TXaDEJ6q276HTDGTrw79px3ruqERDNWD/6GU6g==
X-Received: by 2002:a05:6512:481:: with SMTP id v1mr2584455lfq.132.1607605104174;
        Thu, 10 Dec 2020 04:58:24 -0800 (PST)
Subject: Re: [PATCH V3 18/23] xen/dm: Introduce xendevicemodel_set_irq_level
 DM op
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, alex.bennee@linaro.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-19-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2012091802240.20986@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <ca3ddec2-dd93-7b6e-fd65-5be730418200@gmail.com>
Date: Thu, 10 Dec 2020 14:58:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2012091802240.20986@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 10.12.20 04:21, Stefano Stabellini wrote:

Hi Stefano

> On Mon, 30 Nov 2020, Oleksandr Tyshchenko wrote:
>> From: Julien Grall <julien.grall@arm.com>
>>
>> This patch adds ability to the device emulator to notify otherend
>> (some entity running in the guest) using a SPI and implements Arm
>> specific bits for it. Proposed interface allows emulator to set
>> the logical level of a one of a domain's IRQ lines.
>>
>> We can't reuse the existing DM op (xen_dm_op_set_isa_irq_level)
>> to inject an interrupt as the "isa_irq" field is only 8-bit and
>> able to cover IRQ 0 - 255, whereas we need a wider range (0 - 1020).
>>
>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> ---
>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>> "Add support for Guest IO forwarding to a device emulator"
>>
>> ***
>> Please note, I left interface untouched since there is still
>> an open discussion what interface to use/what information to pass
>> to the hypervisor. The question whether we should abstract away
>> the state of the line or not.
>> ***
> Let's start with a simple question: is this going to work with
> virtio-mmio emulation in QEMU that doesn't lower the state of the line
> to end the notification (only calls qemu_set_irq(irq, high))?
>
> See: hw/virtio/virtio-mmio.c:virtio_mmio_update_irq
>
>
> Alex (CC'ed) might be able to confirm whether I am reading the QEMU code
> correctly. Assuming that it is true that QEMU is only raising the level,
> never lowering it, although the emulation is obviously not correct, I
> would rather keep QEMU as is for efficiency reasons, and because we
> don't want to deviate from the common implementation in QEMU.
>
>
> Looking at this patch and at vgic_inject_irq, yes, I think it would
> work as is.
Not sure whether QEMU lowers the level or not, but in virtio-disk 
backend example we don't set level to 0.
IIRC there was a discussion about that from which I took that "setting 
level to 0 still does nothing on Arm if IRQ edge triggered".
So, looks like, yes, it would work as is.


>
> So it looks like we are going to end up with an interface that:
>
> - in theory it is modelling the line closely
> - in practice it is only called to "trigger the IRQ"
>
>
> Hence my preference for being explicit about it and just call it
> trigger_irq.

I got it, just rename with retaining the level parameter?


>
> If we keep the patch as is, should we at least add a comment to document
> the "QEMU style" use model?

Sure, I will describe that QEMU is only raising the level and never 
lowering it, if I have a confirmation this is true.


-- 
Regards,

Oleksandr Tyshchenko


