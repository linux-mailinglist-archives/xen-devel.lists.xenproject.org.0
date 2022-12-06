Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CF764486D
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 16:54:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455303.712751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2aGJ-0003fB-Gk; Tue, 06 Dec 2022 15:53:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455303.712751; Tue, 06 Dec 2022 15:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2aGJ-0003bx-Dv; Tue, 06 Dec 2022 15:53:39 +0000
Received: by outflank-mailman (input) for mailman id 455303;
 Tue, 06 Dec 2022 15:53:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d2tL=4E=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1p2aGH-0003br-G3
 for xen-devel@lists.xen.org; Tue, 06 Dec 2022 15:53:37 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24ccd528-757e-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 16:53:36 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so1123103wmh.0
 for <xen-devel@lists.xen.org>; Tue, 06 Dec 2022 07:53:36 -0800 (PST)
Received: from [10.17.77.118] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a7bc5d6000000b003c6c5a5a651sm21420231wmk.28.2022.12.06.07.53.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 07:53:35 -0800 (PST)
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
X-Inumbo-ID: 24ccd528-757e-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vzXsgDvi7hObpjeRqijy9CsI9/OavsVlrCeP/8GtI74=;
        b=DbM/GO460jfqXPVMMlqYtic6iLYzMzau1aKBvjUcA/7S+TWCTdU/8vh+Pu5KH9n7H1
         jWjAy9MQr6eBYuEs9izIUoA3ibOXwAY5OvJjF62oY71jPTsWXTA92YChkFoP/To/pdnl
         cVVluLRsaQzCjQVGvmT3Gdgipi8SIokx9aoDlLGdBoCoEEDppRkyoKhAGRNW7AxmqA44
         TWmN6WjR/vmpQGvtAMe32ra9Zvh6AsXEOytoVwdSC+qU2E0B8wJvDcgwMxEcIMi6CCXl
         3w4GkDAEGXBVYubtK8QRaQo2jy/jcshaNgMTY6nGT41WAOxTFMzQ37neu6Kinxq4eqhY
         9fiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vzXsgDvi7hObpjeRqijy9CsI9/OavsVlrCeP/8GtI74=;
        b=ij9G6b4YKBHtKux/WDlU2+fxByBRf8+p98//m0sd2d8wpMKQdNLo8hZY0h8XdUdQJb
         FHuQ+jyC9IJZaYGpEEJr1IsFh/zq+8wTxTlUSocmCWCK6LsGcNo1ysnxpkq36J638rMZ
         nRZngjM8kNudtOcO1EKayhryQJ0Ub3LUcLcXP9FFkAw4eEkuaYyPzhiHpO03kNeX40Vy
         ST3CpbW4AGNkodVH9++WZ6uQY4Ii0NnVB0cbTh5Acaf8HXNmv41usuazGjShn3w3POMr
         +hr1DafBT0zcXphoTZ1gNBfYnx+UKMlrRe9X7UZ9vta0I7waBq7A7yWFI5v0cZGT3Unz
         c0oQ==
X-Gm-Message-State: ANoB5pl3HKwa6RwIOmbhJ5P1J48cz4l06njsSLUB2LdS1EPud3szIYR3
	AE0xtwI6O7w2vlwiEGtmmNU=
X-Google-Smtp-Source: AA0mqf4KOZIKU3GxdPlk+i/7ThkRqVrWQbWPMsacJVHGFSK75tHxP4wTXP1IrySkvwHAtTUizHOwKg==
X-Received: by 2002:a05:600c:3501:b0:3c7:4f0:77b3 with SMTP id h1-20020a05600c350100b003c704f077b3mr49414752wmq.93.1670342015663;
        Tue, 06 Dec 2022 07:53:35 -0800 (PST)
Message-ID: <71a281c6-78df-a107-15e6-a06cd93413a6@gmail.com>
Date: Tue, 6 Dec 2022 17:53:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V6 3/3] docs: Add documentation for generic virtio devices
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xen.org, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <cover.1667906228.git.viresh.kumar@linaro.org>
 <24a0278313ea9a9e6c093880dead835184025734.1667906228.git.viresh.kumar@linaro.org>
 <4fbe5c89-4468-9ad4-e391-2f51ceaa5b67@gmail.com>
 <20221205091118.lttaot42hcidb7gj@vireshk-i7>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <20221205091118.lttaot42hcidb7gj@vireshk-i7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05.12.22 11:11, Viresh Kumar wrote:


Hello Viresh

> On 04-12-22, 20:52, Oleksandr Tyshchenko wrote:
>> So as I understand current series adds support for two virtio devices
>> (i2c/gpio) that require specific device-tree sub node with specific
>> compatible in it [1]. Those backends are standalone userspace applications
>> (daemons) that do not require any additional configuration parameters from
>> the toolstack other than just virtio-mmio irq and base (please correct me if
>> I am wrong).
> 
> For now, yes. But we may want to link these devices with other devices
> in DT, like GPIO line consumers. I am not pushing a half informed
> solution for that right now and that can be taken up later.

I got it, ok.

> 
>> Well, below just some thoughts (which might be wrong) regarding the possible
>> extensions for future use. Please note, I do not suggest the following to be
>> implemented right now (I mean within the context of current series):
>>
>> 1. For supporting usual virtio devices that don't require specific
>> device-tree sub node with specific compatible in it [2] we would probably
>> need to either make "compatible" (or type?) string optional or to reserve
>> some value for it ("common" for the instance).
> 
> I agree. Maybe we can use "virtio,device" without a number for the
> device in this case.


Fine with me.


> 
>> 2. For supporting Qemu based virtio devices we would probably need to add
>> "backendtype" string (with "standalone" value for daemons like yours and
>> "qemu" value for Qemu backends).
> 
> Hmm, I realize now that my patch did define a new type for this,
> libxl_virtio_backend, which defines STANDALONE already, but it isn't
> used currently. Maybe I should remove it too.
> 
> And I am not sure sure how to use these values, STANDALONE or QEMU.
> Should the DT nodes be created only for STANDALONE and never for QEMU
> ?

If we expose virtio-mmio device to the guest via device-tree on Arm, 
then I think the DT nodes should be always created here, no matter where 
the corresponding virtio backend is located itself (either STANDALONE or 
QEMU).

> 
> Maybe we can add these fields and a config param, once someone wants
> to reuse this stuff for QEMU ?


I don't know what to suggest here, sorry.

On the one hand, it is an extra work for you trying to add functionality 
you don't need at the moment. On the other hand if we add "backendtype" 
config param right now with default to STANDALONE it might simplify work 
for someone who ends up adding other type (in particular, the QEMU). 
Let's see what the maintainers will say.



> 
>> 3. For supporting additional configuration parameters for Qemu based virtio
>> devices we could probably reuse "device_model_args" (although it is not
>> clear to me what alternative to use for daemons).
> 
> I would leave it for the person who will make use of this eventually,
> as then we will have more information on the same.

Sure, these are just thoughts for now.

> 
>>> +=item B<compatible=STRING>
>>
>> Shouldn't it be "type" instead (the parsing code is looking for type and the
>> example below suggests the type)?
> 
> Yes.
> 
>>> +Specifies the compatible string for the specific Virtio device. The same will be
>>> +written in the Device Tree compatible property of the Virtio device. For
>>> +example, "type=virtio,device22" for the I2C device > +
>>> +=item B<transport=STRING>
>>> +
>>> +Specifies the transport mechanism for the Virtio device, like "mmio" or "pci".
>>> +
>>> +=back
>>> +
>>>    =item B<tee="STRING">
>>>    B<Arm only.> Set TEE type for the guest. TEE is a Trusted Execution
>>
>> Also the commit description for #1/3 mentions that Virtio backend could run
>> in any domain. So looks like the "backend" string is missing here. I would
>> add the following:
>>
>> =item B<backend=domain-id>
>>
>> Specify the backend domain name or id, defaults to dom0.
> 
> I haven't used the backend in any other domain for now, just Dom0, but
> the idea is definitely there to run backends in separate user domains.


ok, good. My point is the following: if backend domain is configurable 
then it should be documented here.

> 
>> P.S. I am wondering do i2c/gpio virtio backends support Xen grant mappings
>> for the virtio?
> 
> Not yet, we haven't made much progress in that area until now, but it
> is very much part of what we intend to do.


Thanks for the information.

> 
>> Have you tried to run the backends in non-hardware domain
>> with CONFIG_XEN_VIRTIO=y in Linux?
> 
> Not yet.

ok

> 

