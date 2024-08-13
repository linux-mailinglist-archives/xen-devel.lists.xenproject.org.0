Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6F3950B51
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 19:20:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776526.1186691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdvBt-0003aZ-4J; Tue, 13 Aug 2024 17:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776526.1186691; Tue, 13 Aug 2024 17:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdvBt-0003Xz-10; Tue, 13 Aug 2024 17:20:13 +0000
Received: by outflank-mailman (input) for mailman id 776526;
 Tue, 13 Aug 2024 17:20:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ynFR=PM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sdvBr-0003Xt-N9
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 17:20:11 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ac4ea4c-5998-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 19:20:09 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-368440b073bso70676f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 10:20:09 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36e4e51e876sm10981474f8f.73.2024.08.13.10.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 10:20:08 -0700 (PDT)
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
X-Inumbo-ID: 4ac4ea4c-5998-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1723569609; x=1724174409; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=84sx66JI+FulYoVmyiqu6uT4YzhJNSXXhPlav9Qus3U=;
        b=GY1L+0z0+izYPr2Am8PZmvFZ3w2CKgbsZtsUEUiBbdQDs8ocNAlb/NSPL6iUxrlQYU
         9oxiEUYaqTPA/IgDByqxO3TOEnOmAAhsIjWiC70JuUBE40v/NxiJW3lJjtL5YUtgQTyH
         Iab2GU62HqkV6YmRPi1gM0alScvr4/jNLc4ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723569609; x=1724174409;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84sx66JI+FulYoVmyiqu6uT4YzhJNSXXhPlav9Qus3U=;
        b=js+g0z4l1UXCDAUrf9IeyoZoKA1TOCyFvys9uOChJatgxc6pcddLkO2Hr1AQqiEKz7
         dxvmhyDiWTDefIY3dCegnFYLVO9Yr+oSoLf+F57I00z1WMa/iVMVcwATCKKm22KWUs6h
         iNv6gNpfd26qwAALwSchbTaUknoXROUBEdbQdbybDb+dV9Gg2Jozyejcpd3LI+9+8B6M
         zcYPQtARyWPvWlIwl7lL7t6Us3uUf8P6H1EwHIpWU6QGZDUfv4104hVkUZv0eQIY93ek
         wg4JarqEgELYVeSn81VyQ7htT1zD4LF7ZQ01rgOVe9TsfbDjrogCyRpaA5JaiWGeNJXW
         JM5A==
X-Forwarded-Encrypted: i=1; AJvYcCVyEjFsozlEwgcRNE1n0l2caXsYurTjiI6oMAUR4LBfvqQMBX9O3W29UCJ5K9HZsxQsGqMxigXiThr24v2seWW6I76qJVwBPg7qw3Z0ZoU=
X-Gm-Message-State: AOJu0Yx8DO3Ff1xyFWXu0lVbzgxmcVecJ1zRpIDF6NC6J4ZSm3PKVfp7
	kvPEUDJP1JaSdsUTUdvJmJaLcA/Md5tQbEcFpbhDQSr3pnauR7a6T2Hc+MXCaqA=
X-Google-Smtp-Source: AGHT+IFTGC62jSGYkGCBeBoI9MiD8GQfXOo+KENKk3RMxfPXu/2PblHRt3RsejLkmmxd/OqMpwzjUw==
X-Received: by 2002:adf:ebca:0:b0:362:ad01:5435 with SMTP id ffacd0b85a97d-371775c6b2bmr355964f8f.29.1723569608962;
        Tue, 13 Aug 2024 10:20:08 -0700 (PDT)
Message-ID: <a93b9398-9cc3-48ed-9570-47204ab80d5f@citrix.com>
Date: Tue, 13 Aug 2024 18:20:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/10] hw/arm: xenpvh: Add support for SMP guests
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org, anthony@xenproject.org, paul@xen.org,
 peter.maydell@linaro.org, alex.bennee@linaro.org, xenia.ragiadakou@amd.com,
 jason.andryuk@amd.com, edgar.iglesias@amd.com,
 xen-devel@lists.xenproject.org, qemu-arm@nongnu.org
References: <20240812130606.90410-1-edgar.iglesias@gmail.com>
 <20240812130606.90410-5-edgar.iglesias@gmail.com>
 <alpine.DEB.2.22.394.2408121650590.298534@ubuntu-linux-20-04-desktop>
 <ZruRm34zIMtUm7oH@zapote>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZruRm34zIMtUm7oH@zapote>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/08/2024 6:02 pm, Edgar E. Iglesias wrote:
> On Mon, Aug 12, 2024 at 06:47:17PM -0700, Stefano Stabellini wrote:
>> On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
>>> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>>>
>>> Add SMP support for Xen PVH ARM guests. Create max_cpus ioreq
>>> servers to handle hotplug.
>>>
>>> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>>> ---
>>>  hw/arm/xen_arm.c | 5 +++--
>>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
>>> index 5f75cc3779..ef8315969c 100644
>>> --- a/hw/arm/xen_arm.c
>>> +++ b/hw/arm/xen_arm.c
>>> @@ -173,7 +173,7 @@ static void xen_arm_init(MachineState *machine)
>>>  
>>>      xen_init_ram(machine);
>>>  
>>> -    xen_register_ioreq(xam->state, machine->smp.cpus, &xen_memory_listener);
>>> +    xen_register_ioreq(xam->state, machine->smp.max_cpus, &xen_memory_listener);
>>>  
>>>      xen_create_virtio_mmio_devices(xam);
>>>  
>>> @@ -218,7 +218,8 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
>>>      MachineClass *mc = MACHINE_CLASS(oc);
>>>      mc->desc = "Xen PVH ARM machine";
>>>      mc->init = xen_arm_init;
>>> -    mc->max_cpus = 1;
>>> +    /* MAX number of vcpus supported by Xen.  */
>>> +    mc->max_cpus = GUEST_MAX_VCPUS;

The only suitable number here is the one you get back from XEN_DMOP_nr_vcpus

GUEST_MAX_VCPUS is and has always been bogus as a compile time constant
in the Xen public headers (yes, ARM inherited it from x86, but it should
have never been copied to start with).  Please do not introduce any
further uses of it.

~Andrew

