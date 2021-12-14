Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E036A4749EB
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 18:45:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246997.426011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxBr4-0006RO-3r; Tue, 14 Dec 2021 17:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246997.426011; Tue, 14 Dec 2021 17:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxBr3-0006Or-WA; Tue, 14 Dec 2021 17:44:45 +0000
Received: by outflank-mailman (input) for mailman id 246997;
 Tue, 14 Dec 2021 17:44:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KYVb=Q7=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mxBr3-0006Ol-8S
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 17:44:45 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85b259c2-5d05-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 18:44:44 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id m12so29482307ljj.6
 for <xen-devel@lists.xenproject.org>; Tue, 14 Dec 2021 09:44:44 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id l5sm66998ljh.66.2021.12.14.09.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 09:44:43 -0800 (PST)
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
X-Inumbo-ID: 85b259c2-5d05-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=uqxUfm1THXv/yDKcD369ZBk4WnFZq/PwykH2G2ovfx8=;
        b=HkPhSAhtrIPNwoawvtRNGKHA1GMJkgBCRuG4dMJnzFvAteqUsC/O6YSoF/0JFNibP8
         qxqJgy49FPhoKTJaKHrMAPbHyzGsWhXEk0fMZSfsG/ktlhTnDQS7Q5MBv/xrfxTWeriR
         aIBiezl6SrIUCUtGt+6PrACk7EbOmcyKLeMB+lWC3Wb4nu9Hc1tq1z4Tg/R3oB1fuuPf
         ZGw9AUjKyhvGZ10d3xePOsgTJuSWR/G4iGeJf3i6uvyOixAHmnILHTqZiw/ub2FGDEcH
         xZexdX42D+MKKr17yqTZyd5jvbZEM6+1VCrEPGxXdKbcK6ewJqljRxYKqlMVeVxUaV65
         I7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=uqxUfm1THXv/yDKcD369ZBk4WnFZq/PwykH2G2ovfx8=;
        b=di5RbaXTa81FmoWarBeAzMDWLFhC4g36H5tGfXg5CEsbEG2Dhzwzk3g8ROKColwTJ2
         pIcmON0gSS906T8d2QGWgRY3OxhDu6de41QnhU9Cz8vingJQmHLswdOueogOSbvkvowp
         GaLQd4ogeeLqNIZkXGB6jSnqmUFfN/f0Hm0W5iH1rsRXUQ65dYTsFfBfHsrII32jGr/E
         5brY60rWRTbxw0ntgtovBEEtO9Slebc8DB5E5ZhEoRH10E5SwkFmmX74cd03KDumBVnm
         zwDyUnZK49jusaujGy0+uam2nhs3iXrS3N/HpbyouvB4G2qAQJz+tM4phcgh/uOynqli
         tGkQ==
X-Gm-Message-State: AOAM5323Qg00CdnLRU9iVRAHHTOX2C+2HO1bSsfL1L3UF6cSFHj2bVHx
	9Sw4ZW0v6ebzkSsZUHooOGM=
X-Google-Smtp-Source: ABdhPJzyHjwRnzY+cUwIqV/SFE74ckoJfjQjc2Sb5RXrlEZGACAkq7j+HuGYKrn4kpRFF6erAVVKDA==
X-Received: by 2002:a05:651c:a0f:: with SMTP id k15mr6554516ljq.298.1639503883712;
        Tue, 14 Dec 2021 09:44:43 -0800 (PST)
Subject: Re: [PATCH V6 1/2] libxl: Add support for Virtio disk configuration
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
 <YbjANCjAUGe4BAar@perard>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <bce10079-abd6-c033-6273-ac0ea9f51668@gmail.com>
Date: Tue, 14 Dec 2021 19:44:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YbjANCjAUGe4BAar@perard>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 14.12.21 18:03, Anthony PERARD wrote:

Hi Anthony


> On Wed, Dec 08, 2021 at 06:59:43PM +0200, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This patch adds basic support for configuring and assisting virtio-disk
>> backend (emualator) which is intended to run out of Qemu and could be
>> run in any domain.
>> Although the Virtio block device is quite different from traditional
>> Xen PV block device (vbd) from the toolstack point of view:
>>   - as the frontend is virtio-blk which is not a Xenbus driver, nothing
>>     written to Xenstore are fetched by the frontend (the vdev is not
>>     passed to the frontend)
>>   - the ring-ref/event-channel are not used for the backend<->frontend
>>     communication, the proposed IPC for Virtio is IOREQ/DM
>> it is still a "block device" and ought to be integrated in existing
>> "disk" handling. So, re-use (and adapt) "disk" parsing/configuration
>> logic to deal with Virtio devices as well.
> How backend are intended to be created? Is there something listening on
> xenstore?
>
> You mention QEMU as been the backend, do you intend to have QEMU
> listening on xenstore to create a virtio backend? Or maybe it is on the
> command line? There is QMP as well, but it's probably a lot more
> complicated as I think libxl needs refactoring for that.


No, QEMU is not involved there. The backend is a standalone application,
it is launched from the command line. The backend reads the Xenstore to get
the configuration and to detect when guest with the frontend is 
created/destroyed.


>
>> Besides introducing new disk backend type (LIBXL_DISK_BACKEND_VIRTIO)
>> introduce new device kind (LIBXL__DEVICE_KIND_VIRTIO_DISK) as current
>> one (LIBXL__DEVICE_KIND_VBD) doesn't fit into Virtio disk model.
>>
>> In order to inform the toolstack that Virtio disk needs to be used
>> extend "disk" configuration by introducing new "virtio" flag.
>> An example of domain configuration:
>> disk = [ 'backend=DomD, phy:/dev/mmcblk1p3, xvda1, rw, virtio' ]
> This new "virtio" flags feels strange. Would having something like
> "backendtype=virtio" works?


IIRC I considered "backendtype=virtio" option, but decided to go "an 
extra virtio flag" route, however I don't remember what exactly affected 
my decision.
But, I see your point and agree, I will analyze whether we can use 
"backendtype=virtio", I hope that we can, but need to make sure.


>
>> Please note, this patch is not enough for virtio-disk to work
>> on Xen (Arm), as for every Virtio device (including disk) we need
>> to allocate Virtio MMIO params (IRQ and memory region) and pass
>> them to the backend, also update Guest device-tree. The subsequent
>> patch will add these missing bits. For the current patch,
>> the default "irq" and "base" are just written to the Xenstore.
> This feels like the patches are in the wrong order. I don't think it is
> a good idea to allow to create broken configuration until a follow-up
> patch fixes things.

Yes, I also think this is not an ideal splitting, so I decided to write 
a few sentences to draw reviewer's attention to this.
The problem is that second patch adds Arm bits which are local to 
libs/light/libxl_arm.c and if I put it before the current one I will 
break the bisectability
as there will be no callers yet.


>
>> diff --git a/tools/xl/xl_block.c b/tools/xl/xl_block.c
>> index 70eed43..50a4d45 100644
>> --- a/tools/xl/xl_block.c
>> +++ b/tools/xl/xl_block.c
>> @@ -50,6 +50,11 @@ int main_blockattach(int argc, char **argv)
>>           return 0;
>>       }
>>   
>> +    if (disk.virtio) {
>> +        fprintf(stderr, "block-attach is not supported for Virtio device\n");
>> +        return 1;
>> +    }
> This might not be the right place. libxl might want to prevent hotplug
> instead.

Could you please point me the right place where to prevent hotplug?


Thank you.


>
> Thanks,
>
-- 
Regards,

Oleksandr Tyshchenko


