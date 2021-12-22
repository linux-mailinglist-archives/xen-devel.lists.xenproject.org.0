Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5706747CF77
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 10:46:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250710.431771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzyBa-0006IM-0A; Wed, 22 Dec 2021 09:45:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250710.431771; Wed, 22 Dec 2021 09:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzyBZ-0006GC-TD; Wed, 22 Dec 2021 09:45:25 +0000
Received: by outflank-mailman (input) for mailman id 250710;
 Wed, 22 Dec 2021 09:45:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/qRA=RH=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mzyBY-0006G6-K3
 for xen-devel@lists.xenproject.org; Wed, 22 Dec 2021 09:45:24 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df0d2fb1-630b-11ec-bb0b-79c175774b5d;
 Wed, 22 Dec 2021 10:45:18 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id k21so4216631lfu.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Dec 2021 01:45:23 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z18sm164000lfd.8.2021.12.22.01.45.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 01:45:22 -0800 (PST)
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
X-Inumbo-ID: df0d2fb1-630b-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=81SH7+ghC7XBRSldxsSZ8EYsimdzl700pJu4JByV1s4=;
        b=kijYg8W72WY6hB/nLCYtVJHIAF0Ce3nVHOLcjmctsLN/k8SzZgfRcHTFENSZDCObbG
         uJ5vsFGRsLDTjBCxoESGQoxF3ZipBYasOklqmHv8E5BnpfZHVG1teZmRTd1c3RU9FrXm
         46+FcB/HKGqnsqi8Wo2hci8edQYAxE/clKPDaT63OKBiZ/gjdD4K+v8SzgWXUttmXtAc
         l3NeYKvHCFj5OxUocNj7UMIqknM2g4qx6aNYTHnc6wANOn9zTDXqQZlvt9K/QArltoZf
         XK7YU8f2ccd4pV2ATjYtlIF/7H0jW6/DySei7vhSxzMic7riQsSHRSKI6hkpSSH+sm04
         iDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=81SH7+ghC7XBRSldxsSZ8EYsimdzl700pJu4JByV1s4=;
        b=qHXTlfgmgK9Ia1VPlBIyLupxgtqyhsRFPcHopxCVJrtQNUUHqZxwC6yoXLNHPXxHwA
         Q9GnSUHZ9ZP9X2v1Gi8IRvVjb9pcVKKYqHx3iq0mBYWtcbe+aX8APW7ehGVCmDzI9FoX
         qcRz2/sbk+xwQaIq9KBFs/uyyRaXy2PfJGaP7vfzDQLSaAHrxT2wC2ivAWRbE82x5L5P
         x+0T0lFepq+E4QCNqrAce4M0sBxoVqKQCUHXb57dmYld0dHKElotCisHzciiv3Vdg++r
         0opfXg43OKJWEhJlthVT6dmReDtW3y+m9fPCvuDCOoC+HziPHK6n/orHwK5rz/3TE7CK
         dxvQ==
X-Gm-Message-State: AOAM5308Vy7t3EKpiJ+e+0vauOLOycOiU/VF4zlS+F0yYutIXp/sdBXg
	NjmOhBCSaqFeh5uEPxgDTk8=
X-Google-Smtp-Source: ABdhPJy5vQG7s+WkcnNyhHXRTyXCt23FHPICxX/J8flmB1repSsuWhxqouUMR4jp/z8jSmxIbGzsxw==
X-Received: by 2002:a05:6512:4015:: with SMTP id br21mr1991736lfb.233.1640166322784;
        Wed, 22 Dec 2021 01:45:22 -0800 (PST)
Subject: Re: [PATCH V6 1/2] libxl: Add support for Virtio disk configuration
To: Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
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
 <44885d7e-c5a0-5b7c-144d-b9e6c7e54715@gmail.com> <YcIE5rv5vwxwSvKd@perard>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <f880ebd7-64e9-f446-e386-30933918a027@gmail.com>
Date: Wed, 22 Dec 2021 11:45:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YcIE5rv5vwxwSvKd@perard>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 21.12.21 18:46, Anthony PERARD wrote:


Hi Anthony, Juergen

> On Fri, Dec 17, 2021 at 06:50:02PM +0200, Oleksandr wrote:
>> On 17.12.21 17:26, Juergen Gross wrote:
>>> On 15.12.21 22:36, Oleksandr wrote:
>>>> On 15.12.21 17:58, Juergen Gross wrote:
>>>>> In practice we are having something like the "protocol" already today:
>>>>> the disk device name is encoding that ("xvd*" is a Xen PV disk, while
>>>>> "sd*" is an emulated SCSI disk, which happens to be presented to the
>>>>> guest as "xvd*", too). And this is an additional information not
>>>>> related to the backendtype.
> You mean in theory? ;-) In practice, xvd* is the same as hd* (or sd*?).
> I tried once to have xvd* mean PV disk only, but the patch was rejected.
> So at the moment, we always get an emulated disk, we can't have PV disk
> alone, at least on x86.

I guess this a question to Juergen?


>
>>>>> So we have basically the following configuration items, which are
>>>>> orthogonal to each other (some combinations might not make sense,
>>>>> but in theory most would be possible):
>>>>>
>>>>> 1. protocol: emulated (not PV), Xen (like today), virtio
>>>>>
>>>>> 2. backendtype: phy (blkback), qdisk (qemu), other (e.g. a daemon)
>>>>>
>>>>> 3. format: raw, qcow, qcow2, vhd, qed
>>>>>
>>>>> The combination virtio+phy would be equivalent to vhost, BTW. And
>>>>> virtio+other might even use vhost-user, depending on the daemon.
>>>> yes, BTW the combination virtio+other is close to our use-case.
>>>>
>>>>
>>>> Thank you for the detailed explanation, now I see your point why
>>>> using backendtype=virtio is not flexible option in the long term
>>>> and why we would want/need to an extra configuration option such as
>>>> protocol, etc. I think, it makes sense and would be correct.
>>>>
>>>> If we take a disk as an example, then from the configuration PoV we
>>>> will need to:
>>>> - add an optional "protocol" option
>>> I'm not sure regarding the name of the option. "protocol" was just a
>>> suggestion by me.
>> Yes, personally I would be fine with either "protocol" or "specification",
>> with a little preference for the former. What other people think of the
>> name?
> I don't have a better idea. "protocol" sound fine, as long as the description of
> this new field is about how a guest kernel will communicate with the
> backend.

yes, sure.


>
> We could start with "default" and "virtio-mmio" as options. "default" is
> what we have now and usually mean emulated+xen-pv.

ok, sounds good to me.


>
>>>> - add new backendtype: external/other/daemon/etc.
>>>> This seems to cover all possible combinations describe above
>>>> (although I agree that some of them might not make sense). Is my
>>>> understanding correct?
>>> Yes.
>> ok, thank you for confirming.
>>
>>>> Unfortunately, disk configuration/management code is spread over
>>>> multiple sources (including auto-generated) in the toolstack which
>>>> is not so easy to follow (at least to me
>>>> who is not familiar enough with all this stuff), but anyway may I
>>>> please clarify what is the minimum required amount of things that I
>>>> need to do in order to get this basic virtio-mmio
>>>> support series accepted?
>>> I'd say we should first get consensus that others agree with my
>>> suggestion.
>> This is fair. Personally I share your opinion (what you propose sounds
>> reasonable to me in general). Are there any other opinions? Any feedback
>> would be highly appreciated.
> The new proposed property sound good to me as well.

Great, thank you for the feedback.


>
> Thanks,
>
-- 
Regards,

Oleksandr Tyshchenko


