Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53032561A30
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 14:18:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358460.587683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6t7t-0005Z2-7A; Thu, 30 Jun 2022 12:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358460.587683; Thu, 30 Jun 2022 12:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6t7t-0005Vv-32; Thu, 30 Jun 2022 12:18:29 +0000
Received: by outflank-mailman (input) for mailman id 358460;
 Thu, 30 Jun 2022 12:18:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=npq1=XF=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1o6t7r-0005Vm-DR
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 12:18:27 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdfee3fc-f86e-11ec-bdce-3d151da133c5;
 Thu, 30 Jun 2022 14:18:26 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id s1so27012438wra.9
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jun 2022 05:18:26 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a5d4bc1000000b00219e77e489fsm18853629wrt.17.2022.06.30.05.18.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 05:18:25 -0700 (PDT)
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
X-Inumbo-ID: bdfee3fc-f86e-11ec-bdce-3d151da133c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=RJleqi+0HQx/3xnKLvwls6z60YY3TaUIzcUE6+U77y8=;
        b=OmuHmcd1ZxhtDYkmBcqIAggqomsRRxwGXztdtl41dv1prJbWl6kj1/6gwM4XIX9l2S
         kWQXLVGM2uJ3CyzO7LTavdLI1nIdzN929Pawg9FDhsljF37OCIwKlJuzlxl7siurCO+3
         EmhrVOKoZL3r1M8yfvm3oHxb3praMkQzJfW+bm/3Br40+6xi91i26nImttONa64aHrOx
         9B7uf1tAGMMJPRtStpqseCrokJNld7cUTPVhZc4Vd0EELnKdprbST6tFrjixySVin8ib
         YKYBMjHdNceFU5xLwHp+p1jjYLsQfRCbmWK2AwOvFC9HSLoigNoAG/KvHL8tE6XlXlrm
         qx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=RJleqi+0HQx/3xnKLvwls6z60YY3TaUIzcUE6+U77y8=;
        b=sFkU93aSl6o+aL5ktlclFZvX6Mw2mVoXxs9o+ERlbPjOHwHP7SVclfa8CvWZRXKn9E
         N4ottvWzMO5Oe+g23IaDP5nJeGibGUqqC5Vl2olzNv6mpLV87A+3eK50lOnrvR8ZfXra
         Ed54Wk23lNIqPoOT3TToYVQDvr27kUdlZzh3IPa4GEBE5QMZVZLG5SCOHIz+h1kJgph5
         sxPmjAEuuFKLPzgFziS8AEzNq/0RVyn2sSvUcQQ6oBlipM/+CLBpY6Z1Z9ljkwGEdBSq
         kXrPn10jZKEaBBJxKQ+aoGn7c+NeUxxUWEMLKSsdJZmifkn702aUTX2DJb8x4TTUKrgb
         eF1A==
X-Gm-Message-State: AJIora+aEj1Q9J42pZWFyCYPbq9QwMBfv5dKKT+vKaQZjH9mUOam0BBC
	pc2zPvmFv8fDQPzPqveCKU4=
X-Google-Smtp-Source: AGRyM1uttJtJkk1/eUL0NOxY5BSV0GCjSTKh0LzgBEhl68Jj2Rh1AKX/7hm+pqeOberDXo1cHVt67w==
X-Received: by 2002:a5d:688e:0:b0:21b:9d51:25d2 with SMTP id h14-20020a5d688e000000b0021b9d5125d2mr8404703wru.286.1656591505569;
        Thu, 30 Jun 2022 05:18:25 -0700 (PDT)
Subject: Re: [PATCH V10 1/3] libxl: Add support for Virtio disk configuration
From: Oleksandr <olekstysh@gmail.com>
To: George Dunlap <George.Dunlap@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Nick Rosbrook <rosbrookn@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <62903b8e-6c20-600e-8283-5a3e3b853a18@gmail.com>
 <1655482471-16850-1-git-send-email-olekstysh@gmail.com>
 <9A36692A-8095-4C76-A69B-FBAB221A365C@citrix.com>
 <02648046-7781-61e5-de93-77342e4d6c16@gmail.com>
Message-ID: <36d4c786-9fb7-4b30-1a4d-171f92cc84d7@gmail.com>
Date: Thu, 30 Jun 2022 15:18:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <02648046-7781-61e5-de93-77342e4d6c16@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Dear all.


On 25.06.22 17:32, Oleksandr wrote:
>
> On 24.06.22 15:59, George Dunlap wrote:
>
> Hello George
>
>>
>>> On 17 Jun 2022, at 17:14, Oleksandr Tyshchenko <olekstysh@gmail.com> 
>>> wrote:
>>>
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> This patch adds basic support for configuring and assisting virtio-mmio
>>> based virtio-disk backend (emulator) which is intended to run out of
>>> Qemu and could be run in any domain.
>>> Although the Virtio block device is quite different from traditional
>>> Xen PV block device (vbd) from the toolstack's point of view:
>>> - as the frontend is virtio-blk which is not a Xenbus driver, nothing
>>>    written to Xenstore are fetched by the frontend currently ("vdev"
>>>    is not passed to the frontend). But this might need to be revised
>>>    in future, so frontend data might be written to Xenstore in order to
>>>    support hotplugging virtio devices or passing the backend domain id
>>>    on arch where the device-tree is not available.
>>> - the ring-ref/event-channel are not used for the backend<->frontend
>>>    communication, the proposed IPC for Virtio is IOREQ/DM
>>> it is still a "block device" and ought to be integrated in existing
>>> "disk" handling. So, re-use (and adapt) "disk" parsing/configuration
>>> logic to deal with Virtio devices as well.
>>>
>>> For the immediate purpose and an ability to extend that support for
>>> other use-cases in future (Qemu, virtio-pci, etc) perform the following
>>> actions:
>>> - Add new disk backend type (LIBXL_DISK_BACKEND_OTHER) and reflect
>>>   that in the configuration
>>> - Introduce new disk "specification" and "transport" fields to struct
>>>   libxl_device_disk. Both are written to the Xenstore. The transport
>>>   field is only used for the specification "virtio" and it assumes
>>>   only "mmio" value for now.
>>> - Introduce new "specification" option with "xen" communication
>>>   protocol being default value.
>>> - Add new device kind (LIBXL__DEVICE_KIND_VIRTIO_DISK) as current
>>>   one (LIBXL__DEVICE_KIND_VBD) doesn't fit into Virtio disk model
>>>
>>> An example of domain configuration for Virtio disk:
>>> disk = [ 'phy:/dev/mmcblk0p3, xvda1, backendtype=other, 
>>> specification=virtio']
>>>
>>> Nothing has changed for default Xen disk configuration.
>>>
>>> Please note, this patch is not enough for virtio-disk to work
>>> on Xen (Arm), as for every Virtio device (including disk) we need
>>> to allocate Virtio MMIO params (IRQ and memory region) and pass
>>> them to the backend, also update Guest device-tree. The subsequent
>>> patch will add these missing bits. For the current patch,
>>> the default "irq" and "base" are just written to the Xenstore.
>>> This is not an ideal splitting, but this way we avoid breaking
>>> the bisectability.
>>>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> OK, I am *really* sorry for coming in here at the last minute and 
>> quibbling about things.
>
>
> no problem
>
>
>>   But this introduces a public interface which looks really wrong to 
>> me.  I’ve replied to the mail from December where Juergen proposed 
>> the “Other” protocol.
>>
>> Hopefully this will be a simple matter of finding a better name than 
>> “other”.  (Or you guys convincing me that “other” is really the best 
>> name for this value; or even Anthony asserting his right as a 
>> maintainer to overrule my objection if he thinks I’m out of line.)
>
>
> I saw your reply to V6 and Juergen's answer. I share Juergen's opinion 
> as well as I understand your concern. I think, this is exactly the 
> situation when finding a perfect name (obvious, short, etc) for the 
> backendtype (in our particular case) is really difficult.
>
> Personally I tend to leave "other", because there is no better 
> alternative from my PoV. Also I might be completely wrong here, but I 
> don't think we will have to extend the "backendtype" for supporting 
> other possible virtio backend implementations in the foreseeable future:
>
> - when Qemu gains the required support we will choose qdisk: 
> backendtype qdisk specification virtio
> - for the possible virtio alternative of the blkback we will choose 
> phy: backendtype phy specification virtio
>
> If there will be a need to keep various implementation, we will be 
> able to describe that by using "transport" (mmio, pci, xenbus, argo, 
> whatever).
> Actually this is why we also introduced "specification" and "transport".
>
> IIRC, there were other (suggested?) names except "other" which are 
> "external" and "daemon". If you think that one of them is better than 
> "other", I will happy to use it.


Could we please make a decision on this?

If "other" is not unambiguous, then maybe we could choose "daemon" to 
describe arbitrary user-level backends, any thought?



>
>
>
>>
>> FWIW the Golang changes look fine.


Thanks.


>>
>>   -George
>>
-- 
Regards,

Oleksandr Tyshchenko


