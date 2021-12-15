Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9859E475940
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 14:03:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247374.426548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxTvZ-0001lP-ID; Wed, 15 Dec 2021 13:02:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247374.426548; Wed, 15 Dec 2021 13:02:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxTvZ-0001j9-E7; Wed, 15 Dec 2021 13:02:37 +0000
Received: by outflank-mailman (input) for mailman id 247374;
 Wed, 15 Dec 2021 13:02:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uCzL=RA=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mxTvY-0001j3-HB
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 13:02:36 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45c5080c-5da7-11ec-9e60-abaf8a552007;
 Wed, 15 Dec 2021 14:02:35 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id z8so33189425ljz.9
 for <xen-devel@lists.xenproject.org>; Wed, 15 Dec 2021 05:02:35 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v10sm434715ljp.125.2021.12.15.05.02.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 05:02:34 -0800 (PST)
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
X-Inumbo-ID: 45c5080c-5da7-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=izfCUCHmd2ACPFfma9Y4V09rmGSvApdm4ziD7yvYm78=;
        b=RjiGfIZXTNCATTVcthCBFogAJofMWOG7Guugc4Ont36BDt9At83CU0XY5i3cmxEQy6
         9xirWvLvC4jLXO+0WAq4uijLANJkDJP2dykWq57zLRtjKL04w5cBQpJr0sOf5vF81aSE
         gSQ2VkRrXH4Gcr53WKgognKtAyi/LlPNTqxuGIJ7wfRHNwWkpsXvo21e4iJg664wbGdf
         JzUCkOHIo/XkikcbJ1/mXNEmbdfzhgddKNiY00g5boNQhyM8ICGMpmCPCgWn7Yn0w7Bf
         aZPMaaLO2fv+WKsf2+L31lpkxIFLFWVah6dheARbMIsJLqNaiq3Q+GUAoBUq1bhuxFy3
         gyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=izfCUCHmd2ACPFfma9Y4V09rmGSvApdm4ziD7yvYm78=;
        b=Nw0cWC1VlMSjMs7niXHKhMYSz0RYNPaj+R7hcf8sie7hnGsazsvVO/n6+ebst14HIx
         SdJsSkpeNMfLzXqqAZKq+0LHHWgzqw9bD2sMmCLFJ5Z1wS+0K8IGXGrJBgIM7hbRcekV
         gObADcMPs3OmF2eo+m16WI9wVsfCBGsRXyB6/hm2/EjQRmm01+lI3hG9PnkOSbCI/Ejq
         bCJ7szchLaol8u+YwBtky6r2t94yqsy9SBapgrTZ8Nj/g5JFSUm+7kEcLe5YWn3OdeDm
         WlHG68Ap+VmNJ3pekqPc1ysC8pJhqzFJAGwpJ3fLOfhdXIYxEXuvdkVGmhORjAJpiJ6u
         ww6A==
X-Gm-Message-State: AOAM532zmpbxKMVFNdzbJ3OJFm83PqZevlrv32G5E4DFm47G7aqCmaSm
	AEM8UOJX5wYfGKS59ldGa2E=
X-Google-Smtp-Source: ABdhPJwOuXDh1jDGghYX5zg0XzpcVmxS5IDu0PDFYrddOnFRxPSTfMBr2xYe/diVo7ExZcziTLZRkw==
X-Received: by 2002:a2e:a268:: with SMTP id k8mr10105655ljm.451.1639573354919;
        Wed, 15 Dec 2021 05:02:34 -0800 (PST)
Subject: Re: [PATCH V6 1/2] libxl: Add support for Virtio disk configuration
From: Oleksandr <olekstysh@gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <1638982784-14390-1-git-send-email-olekstysh@gmail.com>
 <1638982784-14390-2-git-send-email-olekstysh@gmail.com>
 <YbjANCjAUGe4BAar@perard> <bce10079-abd6-c033-6273-ac0ea9f51668@gmail.com>
Message-ID: <5ad59468-0deb-2063-6146-28cdaf2b6488@gmail.com>
Date: Wed, 15 Dec 2021 15:02:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bce10079-abd6-c033-6273-ac0ea9f51668@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 14.12.21 19:44, Oleksandr wrote:

Hi Anthony

>
> On 14.12.21 18:03, Anthony PERARD wrote:
>
> Hi Anthony
>
>
>> On Wed, Dec 08, 2021 at 06:59:43PM +0200, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> This patch adds basic support for configuring and assisting virtio-disk
>>> backend (emualator) which is intended to run out of Qemu and could be
>>> run in any domain.
>>> Although the Virtio block device is quite different from traditional
>>> Xen PV block device (vbd) from the toolstack point of view:
>>>   - as the frontend is virtio-blk which is not a Xenbus driver, nothing
>>>     written to Xenstore are fetched by the frontend (the vdev is not
>>>     passed to the frontend)
>>>   - the ring-ref/event-channel are not used for the backend<->frontend
>>>     communication, the proposed IPC for Virtio is IOREQ/DM
>>> it is still a "block device" and ought to be integrated in existing
>>> "disk" handling. So, re-use (and adapt) "disk" parsing/configuration
>>> logic to deal with Virtio devices as well.
>> How backend are intended to be created? Is there something listening on
>> xenstore?
>>
>> You mention QEMU as been the backend, do you intend to have QEMU
>> listening on xenstore to create a virtio backend? Or maybe it is on the
>> command line? There is QMP as well, but it's probably a lot more
>> complicated as I think libxl needs refactoring for that.
>
>
> No, QEMU is not involved there. The backend is a standalone application,
> it is launched from the command line. The backend reads the Xenstore 
> to get
> the configuration and to detect when guest with the frontend is 
> created/destroyed.
>
>
>>
>>> Besides introducing new disk backend type (LIBXL_DISK_BACKEND_VIRTIO)
>>> introduce new device kind (LIBXL__DEVICE_KIND_VIRTIO_DISK) as current
>>> one (LIBXL__DEVICE_KIND_VBD) doesn't fit into Virtio disk model.
>>>
>>> In order to inform the toolstack that Virtio disk needs to be used
>>> extend "disk" configuration by introducing new "virtio" flag.
>>> An example of domain configuration:
>>> disk = [ 'backend=DomD, phy:/dev/mmcblk1p3, xvda1, rw, virtio' ]
>> This new "virtio" flags feels strange. Would having something like
>> "backendtype=virtio" works?
>
>
> IIRC I considered "backendtype=virtio" option, but decided to go "an 
> extra virtio flag" route, however I don't remember what exactly 
> affected my decision.
> But, I see your point and agree, I will analyze whether we can use 
> "backendtype=virtio", I hope that we can, but need to make sure.


I have just rechecked/experimented, we can use "backendtype=virtio" 
instead of an extra "virtio" flags.

disk = [ 'backend=DomD, phy:/dev/mmcblk0p3, xvda1, backendtype=virtio' ]

Also backendtype section in xl-disk-configuration.5.pod.in really wants 
updating as
at least the first sentence is not true for virtio backend:

"This does not affect the guest's view of the device.  It controls
which software implementation of the Xen backend driver is used."

So shall I go this direction?



>
>
>>
>>> Please note, this patch is not enough for virtio-disk to work
>>> on Xen (Arm), as for every Virtio device (including disk) we need
>>> to allocate Virtio MMIO params (IRQ and memory region) and pass
>>> them to the backend, also update Guest device-tree. The subsequent
>>> patch will add these missing bits. For the current patch,
>>> the default "irq" and "base" are just written to the Xenstore.
>> This feels like the patches are in the wrong order. I don't think it is
>> a good idea to allow to create broken configuration until a follow-up
>> patch fixes things.
>
> Yes, I also think this is not an ideal splitting, so I decided to 
> write a few sentences to draw reviewer's attention to this.
> The problem is that second patch adds Arm bits which are local to 
> libs/light/libxl_arm.c and if I put it before the current one I will 
> break the bisectability
> as there will be no callers yet.
>
>
>>
>>> diff --git a/tools/xl/xl_block.c b/tools/xl/xl_block.c
>>> index 70eed43..50a4d45 100644
>>> --- a/tools/xl/xl_block.c
>>> +++ b/tools/xl/xl_block.c
>>> @@ -50,6 +50,11 @@ int main_blockattach(int argc, char **argv)
>>>           return 0;
>>>       }
>>>   +    if (disk.virtio) {
>>> +        fprintf(stderr, "block-attach is not supported for Virtio 
>>> device\n");
>>> +        return 1;
>>> +    }
>> This might not be the right place. libxl might want to prevent hotplug
>> instead.
>
> Could you please point me the right place where to prevent hotplug?
>
>
> Thank you.
>
>
>>
>> Thanks,
>>
-- 
Regards,

Oleksandr Tyshchenko


