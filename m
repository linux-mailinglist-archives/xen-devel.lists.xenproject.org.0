Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 530B04764A5
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 22:37:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247588.426929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxbx9-00066R-AG; Wed, 15 Dec 2021 21:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247588.426929; Wed, 15 Dec 2021 21:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxbx9-00064e-7E; Wed, 15 Dec 2021 21:36:47 +0000
Received: by outflank-mailman (input) for mailman id 247588;
 Wed, 15 Dec 2021 21:36:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uCzL=RA=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mxbx7-00064Y-Uq
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 21:36:46 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1925007f-5def-11ec-9e60-abaf8a552007;
 Wed, 15 Dec 2021 22:36:44 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id 207so35327198ljf.10
 for <xen-devel@lists.xenproject.org>; Wed, 15 Dec 2021 13:36:44 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id m15sm506367lfp.9.2021.12.15.13.36.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 13:36:43 -0800 (PST)
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
X-Inumbo-ID: 1925007f-5def-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=uvAYJJO/yaMsslbNsLas3eYctpidKRGYCe1+j8gscng=;
        b=nlQGk6jukmLPrNG4Bh7ktrtG5gbmVo758Nyy6zSGUsiLIImLyTFqddACKdm/7tSHBs
         41tbLt+BGSUdR38UBThvdhjzl4lf/wQmy2i8AHb6xFpEc6th1wryxyo8mSGJteiVuEeB
         OpITSmXI2PI6kuoRnoKZnRTWA2yNIyvS+bkM47eLT/AHzXLBA1KotsMKaNkK5Ei/Z6A7
         gr0l7FqwY9SATZ6JoHeLKpr9Cdf0Ske3zQNLrL3Qr3oqOW754kFr/C7PzOI2RYy7qDSK
         +gS1rDwnWS+j1n7c+4x0dDZrl/i6NGDf/gnw3RY65chYjPyaEoh5q/6g55L+XpYF6WEF
         Pg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=uvAYJJO/yaMsslbNsLas3eYctpidKRGYCe1+j8gscng=;
        b=RT980l+y+PgLE3ZcUXEFYdVl7NGkd9zWSJivHJRqEzDYMX+L+gjLDASMQ8KGuY/2X3
         XoMgbyRHdmQh9F6+O9AK7RsEZ7D9Pm7aTptg+86LdlYVV5dhaCq84d/yQowLCCpLTT2h
         GZK1b1h6X+JTGoZkib2/OtcENdjyZb1hMGZuZh0FO7fBUiTk1JGUM3XR/HtZ3CcpoFZw
         GeuBSnvX8Yx8JenMpasRf1wYjZNqEDtWBntn3CiWnz18t1KFPzN/t13mCmas6Vd9RvRh
         J0p4OkTgBjF2NR0JGJJJQlrAxS9FMA3+cvzomi8ENfO61hMc9aKrsHLJn3rlyKfZq/pj
         g1pA==
X-Gm-Message-State: AOAM5315D8phNdZbG8SpCPA6Rgqhd+8flQVl7Gz33C+LdkrqYrOY21GM
	HSnhB1NFzhkGgJ9NuQ0Xefo=
X-Google-Smtp-Source: ABdhPJx1C/qQ5FxwhxU+sa3wZVtYHVfLUj3iwst6+xkky0xm115khluyv+ccSh2QKazn1OdwbPbVDA==
X-Received: by 2002:a2e:b8d1:: with SMTP id s17mr12077313ljp.446.1639604203715;
        Wed, 15 Dec 2021 13:36:43 -0800 (PST)
Subject: Re: [PATCH V6 1/2] libxl: Add support for Virtio disk configuration
To: Juergen Gross <jgross@suse.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <1638982784-14390-1-git-send-email-olekstysh@gmail.com>
 <1638982784-14390-2-git-send-email-olekstysh@gmail.com>
 <YbjANCjAUGe4BAar@perard> <bce10079-abd6-c033-6273-ac0ea9f51668@gmail.com>
 <4c89e55d-4bf1-506e-d620-4a0ff18ef308@suse.com>
 <dc1b70ac-079d-5de8-cb13-6be4944cef0a@gmail.com>
 <813684b0-df71-c18b-cf4c-106cc286c035@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <8348ef52-701b-e1f9-2d9b-226ac97e8e2f@gmail.com>
Date: Wed, 15 Dec 2021 23:36:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <813684b0-df71-c18b-cf4c-106cc286c035@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 15.12.21 17:58, Juergen Gross wrote:


Hi Juergen


> On 15.12.21 16:02, Oleksandr wrote:
>>
>> On 15.12.21 08:08, Juergen Gross wrote:
>>
>> Hi Juergen
>>
>>> On 14.12.21 18:44, Oleksandr wrote:
>>>>
>>>> On 14.12.21 18:03, Anthony PERARD wrote:
>>>>
>>>> Hi Anthony
>>>>
>>>>
>>>>> On Wed, Dec 08, 2021 at 06:59:43PM +0200, Oleksandr Tyshchenko wrote:
>>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>>
>>>>>> This patch adds basic support for configuring and assisting 
>>>>>> virtio-disk
>>>>>> backend (emualator) which is intended to run out of Qemu and 
>>>>>> could be
>>>>>> run in any domain.
>>>>>> Although the Virtio block device is quite different from traditional
>>>>>> Xen PV block device (vbd) from the toolstack point of view:
>>>>>>   - as the frontend is virtio-blk which is not a Xenbus driver, 
>>>>>> nothing
>>>>>>     written to Xenstore are fetched by the frontend (the vdev is not
>>>>>>     passed to the frontend)
>>>>>>   - the ring-ref/event-channel are not used for the 
>>>>>> backend<->frontend
>>>>>>     communication, the proposed IPC for Virtio is IOREQ/DM
>>>>>> it is still a "block device" and ought to be integrated in existing
>>>>>> "disk" handling. So, re-use (and adapt) "disk" parsing/configuration
>>>>>> logic to deal with Virtio devices as well.
>>>>> How backend are intended to be created? Is there something 
>>>>> listening on
>>>>> xenstore?
>>>>>
>>>>> You mention QEMU as been the backend, do you intend to have QEMU
>>>>> listening on xenstore to create a virtio backend? Or maybe it is 
>>>>> on the
>>>>> command line? There is QMP as well, but it's probably a lot more
>>>>> complicated as I think libxl needs refactoring for that.
>>>>
>>>>
>>>> No, QEMU is not involved there. The backend is a standalone 
>>>> application,
>>>> it is launched from the command line. The backend reads the 
>>>> Xenstore to get
>>>> the configuration and to detect when guest with the frontend is 
>>>> created/destroyed.
>>>
>>> I think this should be reflected somehow in the configuration, as I
>>> expect qemu might gain this functionality in the future.
>>
>> I understand this and agree in general (however I am wondering 
>> whether this can be postponed until it is actually needed), but ...
>
> This might lead to the need to support some "legacy" options in future.
> I think we should at least think whether these scheme will cover (or
> prohibit) extensions which are already on the horizon.

ok


>
>
>>> I'm wondering whether we shouldn't split the backend from the protocol
>>> (or specification?). Something like "protocol=virtio" (default would be
>>> e.g. "xen") and then you could add "backend=external" for your use 
>>> case?
>>
>> ... I am afraid, I didn't get the idea. Are we speaking about the 
>> (new?) disk configuration options
>> here or these are not disk specific things at all and to be 
>> applicable for all possible backends?
>
> I was talking of a general approach using the disk as an example. For
> disks it is just rather obvious.
>
>> If the former, then could the new backendtype simply do the job? For 
>> example, "backendtype=virtio_external" for our current use-case and 
>> "backendtype=virtio_qemu"
>> for the possible future use-cases? Could you please clarify the idea.
>
> I want to avoid overloading the backendtype with information which is
> in general not really related by the backend. You can have a qemu based
> qdisk backend serving a Xen PV-disk (like today) or a virtio disk.
>
> A similar approach has been chosen for the disk format: it is not part
> of the backend, but a parameter of its own. This way e.g. the qdisk
> backend can use the original qdisk format, or the qcow format.
>
> In practice we are having something like the "protocol" already today:
> the disk device name is encoding that ("xvd*" is a Xen PV disk, while
> "sd*" is an emulated SCSI disk, which happens to be presented to the
> guest as "xvd*", too). And this is an additional information not
> related to the backendtype.
>
> So we have basically the following configuration items, which are
> orthogonal to each other (some combinations might not make sense,
> but in theory most would be possible):
>
> 1. protocol: emulated (not PV), Xen (like today), virtio
>
> 2. backendtype: phy (blkback), qdisk (qemu), other (e.g. a daemon)
>
> 3. format: raw, qcow, qcow2, vhd, qed
>
> The combination virtio+phy would be equivalent to vhost, BTW. And
> virtio+other might even use vhost-user, depending on the daemon.
yes, BTW the combination virtio+other is close to our use-case.


Thank you for the detailed explanation, now I see your point why using 
backendtype=virtio is not flexible option in the long term
and why we would want/need to an extra configuration option such as 
protocol, etc. I think, it makes sense and would be correct.

If we take a disk as an example, then from the configuration PoV we will 
need to:
- add an optional "protocol" option
- add new backendtype: external/other/daemon/etc.
This seems to cover all possible combinations describe above (although I 
agree that some of them might not make sense). Is my understanding correct?

Unfortunately, disk configuration/management code is spread over 
multiple sources (including auto-generated) in the toolstack which is 
not so easy to follow (at least to me
who is not familiar enough with all this stuff), but anyway may I please 
clarify what is the minimum required amount of things that I need to do 
in order to get this basic virtio-mmio
support series accepted?


>
>
>
> Juergen

-- 
Regards,

Oleksandr Tyshchenko


