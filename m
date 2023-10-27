Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDF47D933F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 11:13:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624299.972751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwIiO-0005sj-Ea; Fri, 27 Oct 2023 09:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624299.972751; Fri, 27 Oct 2023 09:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwIiO-0005r4-Aj; Fri, 27 Oct 2023 09:01:12 +0000
Received: by outflank-mailman (input) for mailman id 624299;
 Fri, 27 Oct 2023 09:01:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eEfT=GJ=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qwIiM-0005qy-8b
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 09:01:10 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e7a9c1c-74a7-11ee-98d6-6d05b1d4d9a1;
 Fri, 27 Oct 2023 11:01:09 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40836ea8cbaso13770805e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Oct 2023 02:01:09 -0700 (PDT)
Received: from [192.168.10.177] (54-240-197-227.amazon.com. [54.240.197.227])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a05600c510100b003fe1c332810sm4617535wms.33.2023.10.27.02.01.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 02:01:07 -0700 (PDT)
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
X-Inumbo-ID: 5e7a9c1c-74a7-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698397268; x=1699002068; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kudjWF6BKXHcvZTM1tPFPJmSWancLrtDgA6AoiUkJqM=;
        b=Z+iu32F6fttlk8QIZQCrVNQoD/GzYkObeU8NEfeaXOgD7J9ue44PGcjSTmyBZc1h4Q
         gdJ18Xdm9jyIo/drekfaZDDkhQRfeJXjrCIa9P1+0UzESS2ctzOX9diLSP6YcVYUhxYr
         TnJlm0nY6sSnTZhgpy3iy+jc8oCN0gwPp6IraaSSCX+LfAuWE6YYzj/+Gz6u+BcCfxV4
         Yvt0YHzALt2nN3K/KhLfhwwre1MbXHZZOvFU3La1mSpnzOTVX55TB0yOVS65NWYB+g9W
         Ci4Pf4ayZQdSoKIiYiPQP9AJVg1bl7+Wn29otYgxjstPsF+MJjyYOocsLs7tku+aEO0q
         cTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698397268; x=1699002068;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kudjWF6BKXHcvZTM1tPFPJmSWancLrtDgA6AoiUkJqM=;
        b=VQbtwMcYnsvKYgn+0gfaLSiqeHKfrallrzJWWSmvmE4gLK2k4oszDda1e+q4v8M6cH
         UrIS5kb3+vQAmv7/l5wJ8goCQqIouK/wLnf2GK6QVqJ9WZttIhwWmN4jOzJEIHCzGGwY
         wyhTDTOTJKXAYJ5ifbkIzioJKfXXvvQxT1s/JNgHO1noZ2b2bTHhxFNG3JETTux0gmuN
         iHSTQpx414rAVKprMnwH+qRdjIhjuhIJVueqCdmoeNyAYd/20JzC21K4VkOh3kUkYZYL
         6FBDBAXMPl/zuga+B6B1DFcEI/Tge0ruf9gQSKBYb6oVtXacM1sMGCSNl9ldY05FkN8E
         Q00g==
X-Gm-Message-State: AOJu0YzkmjlTjtLUpBXd1CzXL872xTRch4v97CcAouOLmH/hOPFtZU8f
	xw5luve/tWDkFq6pYd4z1aY=
X-Google-Smtp-Source: AGHT+IF2wenxeyE7XIJ4gn5j7HE7kYt/efuEUfra8aTWvRCTeZ6usZClJatbl/oALDDone8ynTaYHQ==
X-Received: by 2002:a05:600c:1f92:b0:405:959e:dc7c with SMTP id je18-20020a05600c1f9200b00405959edc7cmr1735809wmb.30.1698397268254;
        Fri, 27 Oct 2023 02:01:08 -0700 (PDT)
Message-ID: <9fb67e52-f262-4cf4-91c2-a42411ba21c4@gmail.com>
Date: Fri, 27 Oct 2023 10:01:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v3 13/28] hw/xen: automatically assign device index to
 block devices
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, paul@xen.org, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Bernhard Beschow <shentey@gmail.com>, Joel Upham <jupham125@gmail.com>
References: <20231025145042.627381-1-dwmw2@infradead.org>
 <20231025145042.627381-14-dwmw2@infradead.org>
 <74e54da5-9c35-485d-a13c-efac3f81dec2@gmail.com>
 <f72e2e7feed3ecf17af8ab8442c359eea329ef17.camel@infradead.org>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <f72e2e7feed3ecf17af8ab8442c359eea329ef17.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/10/2023 09:45, David Woodhouse wrote:
> On Fri, 2023-10-27 at 08:30 +0100, Durrant, Paul wrote:
>>
>>> +    if (blockdev->props.vdev.type == XEN_BLOCK_VDEV_TYPE_INVALID) {
>>> +        XenBus *xenbus = XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
>>> +        char fe_path[XENSTORE_ABS_PATH_MAX + 1];
>>> +        char *value;
>>> +        int disk = 0;
>>> +        unsigned long idx;
>>> +
>>> +        /* Find an unoccupied device name */
>>
>> Not sure this is going to work is it? What happens if 'hda' or 'sda', or
>> 'd0' exists? I think you need to use the core of the code in
>> xen_block_set_vdev() to generate names and search all possible encodings
>> for each disk.
> 
> Do we care? You're allowed to have *all* of "hda", "sda" and "xvda" at
> the same time. If a user explicitly provides "sda" and then provides
> another disk without giving it a name, we're allowed to use "xvda".
> 

Maybe sda and xvda can co-exist, but

https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/man/xen-vbd-interface.7.pandoc;h=ba0d159dfa7eaf359922583ccd6d2b413acddb13;hb=HEAD#l125

says that you'll likely run into trouble if hda exists and you happen to 
create xvda.

> Hell, you can also have *separate* backing stores provided as "hda1",
> "sda1" and "xvda1". I *might* have tolerated a heckle that this
> function should check for at least the latter of those, but when I was
> first coding it up I was more inclined to argue "Don't Do That Then".

This code is allocating a name automatically so I think the onus is on 
it not create a needless clash which is likely to have unpredictable 
results depending on what the guest is. Just avoid any aliasing in the 
first place and things will be fine.

   Paul


