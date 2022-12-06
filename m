Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6AE644549
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 15:07:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454920.712507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Yb0-0001EM-MH; Tue, 06 Dec 2022 14:06:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454920.712507; Tue, 06 Dec 2022 14:06:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Yb0-0001Ay-Hx; Tue, 06 Dec 2022 14:06:54 +0000
Received: by outflank-mailman (input) for mailman id 454920;
 Tue, 06 Dec 2022 14:06:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d2tL=4E=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1p2Yay-0001Aq-DW
 for xen-devel@lists.xen.org; Tue, 06 Dec 2022 14:06:52 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a54676b-756f-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 15:06:51 +0100 (CET)
Received: by mail-pl1-x62d.google.com with SMTP id b21so13995738plc.9
 for <xen-devel@lists.xen.org>; Tue, 06 Dec 2022 06:06:50 -0800 (PST)
Received: from [10.17.77.118] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a170902680d00b00189c62eac37sm6749498plk.32.2022.12.06.06.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 06:06:48 -0800 (PST)
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
X-Inumbo-ID: 3a54676b-756f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fP5xJavYfw+udVxdse618vFGR2H6vGrEn/ZNEsRsWpE=;
        b=ltxTTIg7eItZRNuUsj3XFlbMXW567ZyrwHYtpYFareAihiRMy39SU/stMFjnqrnKAJ
         nuhfxOFevWOQGTcVaGv7S++kC6mkeCYqG/LcXtnfrFo/wD3vjbTgSh6ptVmR/YL+KngR
         5bl9H4w1eIK//hwsTKRwuiJixFo++6BZjtvldDOeke8q2HUCLJH18Y+V9J/vNMfMxUqu
         KvUEefPHXy+K/maudeR9oDUhJ4MwsNWVqPSjJ0axio5h+ihnkOm9OfKqoprEZ33osl4o
         YIpoM4hJKcXg340l8owGiPqqKvGhaufHg+B2wAASL62nFj6VUThW++jj1fn0gOcYFGUt
         L4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fP5xJavYfw+udVxdse618vFGR2H6vGrEn/ZNEsRsWpE=;
        b=iYKxtUR3rAPj3SE6/LO0LZrB47BA89swx2HRa0sJ5NeQmujMgb3hwhf03aNhWUaVYj
         ZImScADJWKZBYGFUobeMNBAZoWv/eJEIi7ir3qR6VD60X3gihIm4mqa3A5FIgZHHriDV
         yY8tFKx4w4pvHLxYyM8zgmiZTVyOF7joDMbBMq4iQTxOwahzRLSbLoyux2ctp/EWwTAI
         EJFLd5Sz7B8/uh9cm9n5tGhGenuukQWK9pLFb5NNXfaltJx38fYtHGgod7jdZiBUcdsm
         RsW/Ot/Yos7T/NYd6+6VUHzctt0PZe6+h3i3u6nFfr6NuzZK02Dum5l24UPBMUhpUg9v
         dLBg==
X-Gm-Message-State: ANoB5pkBK0FTNS0aSglCgVK1rAszibBQL0hqrin8Jau2rYgTbXrPnSSD
	BUtHDg6y5ToY6VGq1GHVi7s=
X-Google-Smtp-Source: AA0mqf7jre/E5aj71ikn01xnR3XnQlnYIbCwodJZw4YG1XwBb36m2Qbr5AEStrRD1Pw2SUtWf+YfFg==
X-Received: by 2002:a17:902:e415:b0:189:e924:e27d with SMTP id m21-20020a170902e41500b00189e924e27dmr4042391ple.167.1670335609164;
        Tue, 06 Dec 2022 06:06:49 -0800 (PST)
Message-ID: <4261f3f1-09f6-9d63-b085-a7ae58b242e5@gmail.com>
Date: Tue, 6 Dec 2022 16:06:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V6 1/3] libxl: Add support for generic virtio device
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xen.org, Julien Grall
 <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <cover.1667906228.git.viresh.kumar@linaro.org>
 <f1dc91669df27705c25a1f3018427c2db77b32a6.1667906228.git.viresh.kumar@linaro.org>
 <6a546552-d71d-a262-5981-8058dc37ae26@gmail.com>
 <20221205061518.l2i4kqkzcivpxaxl@vireshk-i7>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <20221205061518.l2i4kqkzcivpxaxl@vireshk-i7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05.12.22 08:15, Viresh Kumar wrote:
> Hi Oleksandr,


Hello Viresh

> 
> On 02-12-22, 16:52, Oleksandr Tyshchenko wrote:
>>> This patch adds basic support for configuring and assisting generic
>>> Virtio backend which could run in any domain.
>>>
>>> An example of domain configuration for mmio based Virtio I2C device is:
>>> virtio = ["type=virtio,device22,transport=mmio"]
>>>
>>> Also to make this work on Arm, allocate Virtio MMIO params (IRQ and
>>> memory region) and pass them to the backend. Update guest device-tree as
>>> well to create a DT node for the Virtio devices.
>>
>>
>> Some NITs regarding the commit description:
>> 1. Besides making generic things current patch also adds i2c/gpio device
>> nodes, I would mention that in the description.
>> 2. I assume current patch is not enough to make this work on Arm, at least
>> the subsequent patch is needed, I would mention that as well.
>> 3. I understand where "virtio,device22"/"virtio,device29" came from, but I
>> think that links to the corresponding device-tree bindings should be
>> mentioned here (and/or maybe in the code).
> 
> Agree to all.
>   
>>> +static int make_virtio_mmio_node_device(libxl__gc *gc, void *fdt, uint64_t base,
>>> +                                        uint32_t irq, const char *type,
>>> +                                        uint32_t backend_domid)
>>> +{
>>> +    int res, len = strlen(type);
>>> +
>>> +    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
>>> +    if (res) return res;
>>> +
>>> +    /* Add device specific nodes */
>>> +    if (!strncmp(type, "virtio,device22", len)) {
>>> +        res = make_virtio_mmio_node_i2c(gc, fdt);
>>> +        if (res) return res;
>>> +    } else if (!strncmp(type, "virtio,device29", len)) {
>>> +        res = make_virtio_mmio_node_gpio(gc, fdt);
>>> +        if (res) return res;
>>> +    } else {
>>> +        LOG(ERROR, "Invalid type for virtio device: %s", type);
>>> +        return -EINVAL;
>>> +    }
>>
>> I am not sure whether it is the best place to ask, but I will try anyway. So
>> I assume that with the whole series applied it would be possible to
>> configure only two specific device types ("22" and "29").
> 
> Right.
> 
>> But what to do if user, for example, is interested in usual virtio device
>> (which doesn't require specific device-tree sub node with specific
>> compatible in it). For these usual virtio devices just calling
>> make_virtio_mmio_node_common() would be enough.
>>
>>
>> Maybe we should introduce something like type "common" which would mean we
>> don't need any additional device-tree sub nodes?
>>
>> virtio = ["type=common,transport=mmio"]
> 
> I am fine with this. Maybe, to keep it aligned with compatibles, we
> can write it as
>   
> virtio = ["type=virtio,device,transport=mmio"]
> 
> and document that "virtio,device" type is special and we won't add
> compatible property to the DT node.


Personally I am fine with this.


> 
>>> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
>>> index 612eacfc7fac..15a32c75c045 100644
>>> --- a/tools/libs/light/libxl_create.c
>>> +++ b/tools/libs/light/libxl_create.c
>>> @@ -1802,6 +1802,11 @@ static void domcreate_launch_dm(libxl__egc *egc, libxl__multidev *multidev,
>>>                                  &d_config->vkbs[i]);
>>>            }
>>> +        for (i = 0; i < d_config->num_virtios; i++) {
>>> +            libxl__device_add(gc, domid, &libxl__virtio_devtype,
>>> +                              &d_config->virtios[i]);
>>> +        }
>>
>>
>> I am wondering whether this is the best place to put this call. This gets
>> called for LIBXL_DOMAIN_TYPE_PV and LIBXL_DOMAIN_TYPE_PVH (our Arm case),
>> and not for LIBXL_DOMAIN_TYPE_HVM. Is it what we want?
> 
> Can you suggest where should I move this ?


I am not 100% sure, but I think if this whole enabling work is supposed 
to be indeed generic,
I would move this out of "switch (d_config->c_info.type)" at least.

>   
>>> +libxl_virtioinfo = Struct("virtioinfo", [
>>> +    ("backend", string),
>>> +    ("backend_id", uint32),
>>> +    ("frontend", string),
>>> +    ("frontend_id", uint32),
>>> +    ("devid", libxl_devid),
>>> +    ("state", integer),
>>> +    ], dir=DIR_OUT)
>>
>> I failed to find where libxl_virtioinfo is used within the series. Why do we
>> need it?
> 
> Looks like leftover that I missed. Will remove it.
>   
>>> +static int libxl__virtio_from_xenstore(libxl__gc *gc, const char *libxl_path,
>>> +                                       libxl_devid devid,
>>> +                                       libxl_device_virtio *virtio)
>>> +{
>>> +    const char *be_path, *fe_path, *tmp;
>>> +    libxl__device dev;
>>> +    int rc;
>>> +
>>> +    virtio->devid = devid;
>>> +
>>> +    rc = libxl__xs_read_mandatory(gc, XBT_NULL,
>>> +                                  GCSPRINTF("%s/backend", libxl_path),
>>> +                                  &be_path);
>>> +    if (rc) goto out;
>>> +
>>> +    rc = libxl__xs_read_mandatory(gc, XBT_NULL,
>>> +                                  GCSPRINTF("%s/frontend", libxl_path),
>>> +                                  &fe_path);
>>> +    if (rc) goto out;
>>
>> fe_path is not used anywhere down the code even within the series, why do we
>> need it? Or we just read it to make sure that corresponding entry is present
>> in Xenstore (some kind of sanity check)?
> 
> I copied it from libxl_vkb.c and it isn't using it either. So I assume
> it is a sanity check, though can be removed if that's what makes
> sense.
>   
>>> +
>>> +    rc = libxl__backendpath_parse_domid(gc, be_path, &virtio->backend_domid);
>>> +    if (rc) goto out;
>>> +
>>> +    rc = libxl__parse_backend_path(gc, be_path, &dev);
>>> +    if (rc) goto out;
>>
>> The same question for dev variable.
> 
> Hmm, this we aren't using at all, which KBD does use it. Maybe we
> should even call libxl__parse_backend_path() ?


 From the code I see that KBD uses "dev.backend_kind" afterwards, so for 
that purpose it calls libxl__parse_backend_path() to fill in dev's 
fields, but here we do not need it. I would drop this call together with 
dev variable.

