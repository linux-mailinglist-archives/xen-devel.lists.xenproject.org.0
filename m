Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEE64791DD
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 17:50:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248782.429123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myGQy-0002rN-MS; Fri, 17 Dec 2021 16:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248782.429123; Fri, 17 Dec 2021 16:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myGQy-0002pH-JN; Fri, 17 Dec 2021 16:50:16 +0000
Received: by outflank-mailman (input) for mailman id 248782;
 Fri, 17 Dec 2021 16:50:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EyUW=RC=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1myGQx-0002pB-6c
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 16:50:15 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67b3cb4d-5f59-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 17:50:13 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id l22so5869949lfg.7
 for <xen-devel@lists.xenproject.org>; Fri, 17 Dec 2021 08:50:13 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id bt18sm384281lfb.50.2021.12.17.08.50.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 08:50:13 -0800 (PST)
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
X-Inumbo-ID: 67b3cb4d-5f59-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=JRxht2kaQ51s5BnEnRmm/sgkC3ogtNKIzqiJk2qXWac=;
        b=EGvYn9PwkKtSxOqc4c/zOCcIRnpZTvaNeQ25eKta/ILkZYlt5+/UFeXK9rikykIaYu
         ULOJRp2nBNr9NMKUHCejhiFGGElT2NkUHVMzinIJksMNfVs6QkzhxAJJktz8UQsbISGi
         E91Kms4XPZNzyFVqcp6fnC/2GyaWrO06g8TggM4OA4N4tgbEFmCHrXdqvtj249TNA3Xa
         XxiVT4ITLt6MdYYG5jLI5QIs72xpZXzX6LrlzxlPuDqw1OOubjDCT6WfpC4WDu/vcJnf
         iyyNi5zB35dlgiVrR+M5gktChdnXYgH+/tnPlXn7yzHTIGMmiGLqGpcXBCa0S4/6mE20
         4FvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=JRxht2kaQ51s5BnEnRmm/sgkC3ogtNKIzqiJk2qXWac=;
        b=5+jHbQIJeOqkAb3If/+EQ0px0qnX3g4yidGOSYgSB2KVZB4Z6G8bfZyqJtgZc+qBQ9
         sKOJGmmEx+vpAeLgcZKmDwqT48F18NDlmIcDKgnMjnAn3MZhUoXHIxjF9IqCigypcT88
         VC8D6F7v26g17UeoMhuakErEhMwng+XNKYFzRZpl3UjGRvXmVKqEUzJFv5K/g8gRFZC4
         qy5ULwVQZaytJ+XbR+zb9RzWczDAJJkPtktLFvaasV3RuuYlPZz40b4O/s31PVTxTw11
         E6lO34wnPkquHP3psE2JrfI673x/dPox6rrdM/4xIMVkha1BA90YN16erC3Sbm/AsnXr
         pUFw==
X-Gm-Message-State: AOAM531h4k2k5Ah2hZnvGcGXb8VnzSUnYsrStJjsN15h1MxFq9DIu+cU
	L42Yd5xBak7GgCi3DF+55oA=
X-Google-Smtp-Source: ABdhPJzFyjlh2a17NmZaUl+5+StbymFvBnAff3k+lk1B13sfD8jLIKNwgeBYFFXMEgVwRF94zZMZ2Q==
X-Received: by 2002:a05:6512:50c:: with SMTP id o12mr3524797lfb.41.1639759813351;
        Fri, 17 Dec 2021 08:50:13 -0800 (PST)
Subject: Re: [PATCH V6 1/2] libxl: Add support for Virtio disk configuration
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
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
 <8348ef52-701b-e1f9-2d9b-226ac97e8e2f@gmail.com>
 <15b837ba-25cf-7e4c-4729-f82bffe02fed@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <44885d7e-c5a0-5b7c-144d-b9e6c7e54715@gmail.com>
Date: Fri, 17 Dec 2021 18:50:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <15b837ba-25cf-7e4c-4729-f82bffe02fed@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 17.12.21 17:26, Juergen Gross wrote:


Hi Juergen, all.


> On 15.12.21 22:36, Oleksandr wrote:
>>
>> On 15.12.21 17:58, Juergen Gross wrote:
>>
>>
>> Hi Juergen
>>
>>
>>> On 15.12.21 16:02, Oleksandr wrote:
>>>>
>>>> On 15.12.21 08:08, Juergen Gross wrote:
>>>>
>>>> Hi Juergen
>>>>
>>>>> On 14.12.21 18:44, Oleksandr wrote:
>>>>>>
>>>>>> On 14.12.21 18:03, Anthony PERARD wrote:
>>>>>>
>>>>>> Hi Anthony
>>>>>>
>>>>>>
>>>>>>> On Wed, Dec 08, 2021 at 06:59:43PM +0200, Oleksandr Tyshchenko 
>>>>>>> wrote:
>>>>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>>>>
>>>>>>>> This patch adds basic support for configuring and assisting 
>>>>>>>> virtio-disk
>>>>>>>> backend (emualator) which is intended to run out of Qemu and 
>>>>>>>> could be
>>>>>>>> run in any domain.
>>>>>>>> Although the Virtio block device is quite different from 
>>>>>>>> traditional
>>>>>>>> Xen PV block device (vbd) from the toolstack point of view:
>>>>>>>>   - as the frontend is virtio-blk which is not a Xenbus driver, 
>>>>>>>> nothing
>>>>>>>>     written to Xenstore are fetched by the frontend (the vdev 
>>>>>>>> is not
>>>>>>>>     passed to the frontend)
>>>>>>>>   - the ring-ref/event-channel are not used for the 
>>>>>>>> backend<->frontend
>>>>>>>>     communication, the proposed IPC for Virtio is IOREQ/DM
>>>>>>>> it is still a "block device" and ought to be integrated in 
>>>>>>>> existing
>>>>>>>> "disk" handling. So, re-use (and adapt) "disk" 
>>>>>>>> parsing/configuration
>>>>>>>> logic to deal with Virtio devices as well.
>>>>>>> How backend are intended to be created? Is there something 
>>>>>>> listening on
>>>>>>> xenstore?
>>>>>>>
>>>>>>> You mention QEMU as been the backend, do you intend to have QEMU
>>>>>>> listening on xenstore to create a virtio backend? Or maybe it is 
>>>>>>> on the
>>>>>>> command line? There is QMP as well, but it's probably a lot more
>>>>>>> complicated as I think libxl needs refactoring for that.
>>>>>>
>>>>>>
>>>>>> No, QEMU is not involved there. The backend is a standalone 
>>>>>> application,
>>>>>> it is launched from the command line. The backend reads the 
>>>>>> Xenstore to get
>>>>>> the configuration and to detect when guest with the frontend is 
>>>>>> created/destroyed.
>>>>>
>>>>> I think this should be reflected somehow in the configuration, as I
>>>>> expect qemu might gain this functionality in the future.
>>>>
>>>> I understand this and agree in general (however I am wondering 
>>>> whether this can be postponed until it is actually needed), but ...
>>>
>>> This might lead to the need to support some "legacy" options in future.
>>> I think we should at least think whether these scheme will cover (or
>>> prohibit) extensions which are already on the horizon.
>>
>> ok
>>
>>
>>>
>>>
>>>>> I'm wondering whether we shouldn't split the backend from the 
>>>>> protocol
>>>>> (or specification?). Something like "protocol=virtio" (default 
>>>>> would be
>>>>> e.g. "xen") and then you could add "backend=external" for your use 
>>>>> case?
>>>>
>>>> ... I am afraid, I didn't get the idea. Are we speaking about the 
>>>> (new?) disk configuration options
>>>> here or these are not disk specific things at all and to be 
>>>> applicable for all possible backends?
>>>
>>> I was talking of a general approach using the disk as an example. For
>>> disks it is just rather obvious.
>>>
>>>> If the former, then could the new backendtype simply do the job? 
>>>> For example, "backendtype=virtio_external" for our current use-case 
>>>> and "backendtype=virtio_qemu"
>>>> for the possible future use-cases? Could you please clarify the idea.
>>>
>>> I want to avoid overloading the backendtype with information which is
>>> in general not really related by the backend. You can have a qemu based
>>> qdisk backend serving a Xen PV-disk (like today) or a virtio disk.
>>>
>>> A similar approach has been chosen for the disk format: it is not part
>>> of the backend, but a parameter of its own. This way e.g. the qdisk
>>> backend can use the original qdisk format, or the qcow format.
>>>
>>> In practice we are having something like the "protocol" already today:
>>> the disk device name is encoding that ("xvd*" is a Xen PV disk, while
>>> "sd*" is an emulated SCSI disk, which happens to be presented to the
>>> guest as "xvd*", too). And this is an additional information not
>>> related to the backendtype.
>>>
>>> So we have basically the following configuration items, which are
>>> orthogonal to each other (some combinations might not make sense,
>>> but in theory most would be possible):
>>>
>>> 1. protocol: emulated (not PV), Xen (like today), virtio
>>>
>>> 2. backendtype: phy (blkback), qdisk (qemu), other (e.g. a daemon)
>>>
>>> 3. format: raw, qcow, qcow2, vhd, qed
>>>
>>> The combination virtio+phy would be equivalent to vhost, BTW. And
>>> virtio+other might even use vhost-user, depending on the daemon.
>> yes, BTW the combination virtio+other is close to our use-case.
>>
>>
>> Thank you for the detailed explanation, now I see your point why 
>> using backendtype=virtio is not flexible option in the long term
>> and why we would want/need to an extra configuration option such as 
>> protocol, etc. I think, it makes sense and would be correct.
>>
>> If we take a disk as an example, then from the configuration PoV we 
>> will need to:
>> - add an optional "protocol" option
>
> I'm not sure regarding the name of the option. "protocol" was just a
> suggestion by me.

Yes, personally I would be fine with either "protocol" or 
"specification", with a little preference for the former. What other 
people think of the name?


>
>> - add new backendtype: external/other/daemon/etc.
>> This seems to cover all possible combinations describe above 
>> (although I agree that some of them might not make sense). Is my 
>> understanding correct?
>
> Yes.

ok, thank you for confirming.


>
>> Unfortunately, disk configuration/management code is spread over 
>> multiple sources (including auto-generated) in the toolstack which is 
>> not so easy to follow (at least to me
>> who is not familiar enough with all this stuff), but anyway may I 
>> please clarify what is the minimum required amount of things that I 
>> need to do in order to get this basic virtio-mmio
>> support series accepted?
>
> I'd say we should first get consensus that others agree with my
> suggestion.
This is fair. Personally I share your opinion (what you propose sounds 
reasonable to me in general). Are there any other opinions? Any feedback 
would be highly appreciated.


> If so, I guess adding a general "protocol" (or whatever
> the name will be) attribute to struct libxl_device_disk (and maybe
> to other devices, too?) should be the first step.

Agree, I would start with the disk and see how it would look like.


>
> It might even be a godd idea to use "virtio-mmio" as the protocol string
> for differentiating it from e.g. "virtio-pci".

Makes sense, I thought the same.


>
> The rest should be rather straight forward similar to your current
> approach.

Good.


Thank you.


>
>
> Juergen

-- 
Regards,

Oleksandr Tyshchenko


