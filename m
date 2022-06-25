Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CD055AB09
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jun 2022 16:33:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355993.583965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o56pY-0004YJ-VR; Sat, 25 Jun 2022 14:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355993.583965; Sat, 25 Jun 2022 14:32:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o56pY-0004WW-SW; Sat, 25 Jun 2022 14:32:12 +0000
Received: by outflank-mailman (input) for mailman id 355993;
 Sat, 25 Jun 2022 14:32:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yMZ6=XA=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1o56pX-0004WQ-0R
 for xen-devel@lists.xenproject.org; Sat, 25 Jun 2022 14:32:11 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97c607f7-f493-11ec-b725-ed86ccbb4733;
 Sat, 25 Jun 2022 16:32:08 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id c2so9274843lfk.0
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jun 2022 07:32:08 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 9-20020a2e0509000000b0025538905298sm673389ljf.123.2022.06.25.07.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Jun 2022 07:32:07 -0700 (PDT)
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
X-Inumbo-ID: 97c607f7-f493-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=x6Fy3/uQW7PV7sjNtq2E/ETGqkCcnt2NEZ3nx6xebvU=;
        b=kPLVc4WgWv9UOcTxcJeUmLBcacmFB0x92i/cnP9qkiTkq+7Pf/73C8eL7bhBjYopcw
         XKZBNsC9qxZ7RD3Tp6thB4lvxugHlPvS/HBc5kj0hAwEe2lF4qiG/p3unTM8SkNAc070
         gpaROcQVHyu2Yy+QUc3sjcimfoXuiTqbvtvR1m6ThVO3FMC/RXXI5Pf4mxinKlm6e/Ug
         iXo8FPQtB02xh21nzg1epj4r+SVBQRxEbKoLuD4Miuik5tHevhNhGHrElp4CP+W/Ph9+
         uuFio5XIytB7w2WP8dAD3/Absd8CuAsmPg04ptZogx9jzhfmIS3q6jhLXihMh/VymPob
         oK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=x6Fy3/uQW7PV7sjNtq2E/ETGqkCcnt2NEZ3nx6xebvU=;
        b=1we81DD7zffTyueh6Lh6zpjWEqA1TjtD/yljl0LIbhcshYL4gt3KRoh0MpdzD16s1D
         8g6zHMo1okge4wSjMYkM1g8kPMj8FzBVBeog1n04NHMTiHtNnrMZcbk+dHfH+kkM5d+z
         jEu/9vMRQC4hFV2gbpChlsK2fEHAdgaVkRe/WS7lQaUd1h7KhWXojB7sKyechfGUCeXJ
         K7tIXAD6uliRmu4xCNgdO65X9aKgwcegv8cDWbvyFKF49IN+gbtQafMuno0sUj1nxJG7
         ZatcJwMTX15vuSbmXNRRECXb8sWtEwGkgi8KZIcF3twPJPc22brl0REDfKSGNXZbVtIo
         NWCA==
X-Gm-Message-State: AJIora8FgO1cW/IbHolrEejHvEAFntQjGxzpUkEy+Wo7eLrgqXxua9YB
	ItTF0+XdVRZKfFSek0sUqS0=
X-Google-Smtp-Source: AGRyM1twwdIQDqNiLkOdvn2UhiibUoio6MYgplot2RcoWQCCbiR/hzHrRmxnPgBxO721xNiDlsUAMA==
X-Received: by 2002:a05:6512:b19:b0:47d:e576:305f with SMTP id w25-20020a0565120b1900b0047de576305fmr2570362lfu.61.1656167528035;
        Sat, 25 Jun 2022 07:32:08 -0700 (PDT)
Subject: Re: [PATCH V10 1/3] libxl: Add support for Virtio disk configuration
To: George Dunlap <George.Dunlap@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Nick Rosbrook <rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <62903b8e-6c20-600e-8283-5a3e3b853a18@gmail.com>
 <1655482471-16850-1-git-send-email-olekstysh@gmail.com>
 <9A36692A-8095-4C76-A69B-FBAB221A365C@citrix.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <02648046-7781-61e5-de93-77342e4d6c16@gmail.com>
Date: Sat, 25 Jun 2022 17:32:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9A36692A-8095-4C76-A69B-FBAB221A365C@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 24.06.22 15:59, George Dunlap wrote:

Hello George

>
>> On 17 Jun 2022, at 17:14, Oleksandr Tyshchenko <olekstysh@gmail.com> wrote:
>>
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This patch adds basic support for configuring and assisting virtio-mmio
>> based virtio-disk backend (emulator) which is intended to run out of
>> Qemu and could be run in any domain.
>> Although the Virtio block device is quite different from traditional
>> Xen PV block device (vbd) from the toolstack's point of view:
>> - as the frontend is virtio-blk which is not a Xenbus driver, nothing
>>    written to Xenstore are fetched by the frontend currently ("vdev"
>>    is not passed to the frontend). But this might need to be revised
>>    in future, so frontend data might be written to Xenstore in order to
>>    support hotplugging virtio devices or passing the backend domain id
>>    on arch where the device-tree is not available.
>> - the ring-ref/event-channel are not used for the backend<->frontend
>>    communication, the proposed IPC for Virtio is IOREQ/DM
>> it is still a "block device" and ought to be integrated in existing
>> "disk" handling. So, re-use (and adapt) "disk" parsing/configuration
>> logic to deal with Virtio devices as well.
>>
>> For the immediate purpose and an ability to extend that support for
>> other use-cases in future (Qemu, virtio-pci, etc) perform the following
>> actions:
>> - Add new disk backend type (LIBXL_DISK_BACKEND_OTHER) and reflect
>>   that in the configuration
>> - Introduce new disk "specification" and "transport" fields to struct
>>   libxl_device_disk. Both are written to the Xenstore. The transport
>>   field is only used for the specification "virtio" and it assumes
>>   only "mmio" value for now.
>> - Introduce new "specification" option with "xen" communication
>>   protocol being default value.
>> - Add new device kind (LIBXL__DEVICE_KIND_VIRTIO_DISK) as current
>>   one (LIBXL__DEVICE_KIND_VBD) doesn't fit into Virtio disk model
>>
>> An example of domain configuration for Virtio disk:
>> disk = [ 'phy:/dev/mmcblk0p3, xvda1, backendtype=other, specification=virtio']
>>
>> Nothing has changed for default Xen disk configuration.
>>
>> Please note, this patch is not enough for virtio-disk to work
>> on Xen (Arm), as for every Virtio device (including disk) we need
>> to allocate Virtio MMIO params (IRQ and memory region) and pass
>> them to the backend, also update Guest device-tree. The subsequent
>> patch will add these missing bits. For the current patch,
>> the default "irq" and "base" are just written to the Xenstore.
>> This is not an ideal splitting, but this way we avoid breaking
>> the bisectability.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> OK, I am *really* sorry for coming in here at the last minute and quibbling about things.


no problem


>   But this introduces a public interface which looks really wrong to me.  I’ve replied to the mail from December where Juergen proposed the “Other” protocol.
>
> Hopefully this will be a simple matter of finding a better name than “other”.  (Or you guys convincing me that “other” is really the best name for this value; or even Anthony asserting his right as a maintainer to overrule my objection if he thinks I’m out of line.)


I saw your reply to V6 and Juergen's answer. I share Juergen's opinion 
as well as I understand your concern. I think, this is exactly the 
situation when finding a perfect name (obvious, short, etc) for the 
backendtype (in our particular case) is really difficult.

Personally I tend to leave "other", because there is no better 
alternative from my PoV. Also I might be completely wrong here, but I 
don't think we will have to extend the "backendtype" for supporting 
other possible virtio backend implementations in the foreseeable future:

- when Qemu gains the required support we will choose qdisk: backendtype 
qdisk specification virtio
- for the possible virtio alternative of the blkback we will choose phy: 
backendtype phy specification virtio

If there will be a need to keep various implementation, we will be able 
to describe that by using "transport" (mmio, pci, xenbus, argo, whatever).
Actually this is why we also introduced "specification" and "transport".

IIRC, there were other (suggested?) names except "other" which are 
"external" and "daemon". If you think that one of them is better than 
"other", I will happy to use it.



>
> FWIW the Golang changes look fine.
>
>   -George
>
-- 
Regards,

Oleksandr Tyshchenko


