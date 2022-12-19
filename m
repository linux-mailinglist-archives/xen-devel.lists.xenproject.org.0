Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9DD65129F
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 20:17:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466320.725198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7LcM-00019f-Sm; Mon, 19 Dec 2022 19:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466320.725198; Mon, 19 Dec 2022 19:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7LcM-000176-Pk; Mon, 19 Dec 2022 19:16:06 +0000
Received: by outflank-mailman (input) for mailman id 466320;
 Mon, 19 Dec 2022 19:16:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RXDn=4R=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1p7LcK-00016y-GR
 for xen-devel@lists.xen.org; Mon, 19 Dec 2022 19:16:04 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93fbb259-7fd1-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 20:16:02 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id a17so8520840wrt.11
 for <xen-devel@lists.xen.org>; Mon, 19 Dec 2022 11:16:02 -0800 (PST)
Received: from [10.17.77.109] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a5d4f87000000b00236576c8eddsm10664334wru.12.2022.12.19.11.16.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 11:16:01 -0800 (PST)
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
X-Inumbo-ID: 93fbb259-7fd1-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/0jXQrslbZ/dicsEddmPXAWTn/gFpyO24UPpcN/esfQ=;
        b=aslOEhyCUNn1pm7aOkVPENmvshhkEQ1dDyKR39yQyC1pLy8NO8dGFMUt9RVzBnVvi9
         6Td4EDIHSd8IXbBybahhbO1qIQ6zMlAJkUW55Blf1uUQPQH2kcgLstDOtdSD+OKMGoUY
         mFwyU/CQdkHu++8lgHO6QJ1hXuHJiSwmWneo5cpLDP8gONOREBdsTfDk1wk2sQCi0qv1
         ADDzgNTrtWixGV2xckZ5S0F8tbb1/XjfoSj9hgTVxw0VU0psyP+cvUgo8PauuIL9dScp
         yyoTa1l4bB1IgvH+SZR5ogqHd7LUgtIrLP0ldXVR5yt+9jo+J8XR7nCuzcQnR/obfx+y
         ePgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/0jXQrslbZ/dicsEddmPXAWTn/gFpyO24UPpcN/esfQ=;
        b=ejaHCLduHPhTkmty7m6cLdbeyI0RLNkz1ljoASvFjBIM2rZwxT0aKU7YW7UvSUehSr
         +cYG6Hm1B0vSaeNVuhB8/mZzNseUVpgrImA+1c40+XrwsB6zj7m+IMDeccVnfKDI0KZ5
         7tVGyFyO/hgS2DUhXzZKuAZ9sXX+atOd34McP9BsF54NUghcIwcNj91G2z/lXzrmsiOn
         w1eW1Ab7xdeej73+qCWDM8cNYcMqNYq2pXewaxOLgm0zYKvFkmVYGcnsKoGMGc9NyTar
         JmvHy8Mkx5Tuz6pQwfG+a3D6QkQo+o/YdRtvG19UbmQ3LMZ74AgCT36VcZ8CcciY8Qde
         LADA==
X-Gm-Message-State: ANoB5pkBQ/AZHNrRHii4KOgxseZrSmThWNIgGvFRCYgVnTMTJsVKdYBC
	azF4K0zAXEXzLK3BFfyybFk=
X-Google-Smtp-Source: AA0mqf5/5xJ276TopBLHumEJjyV7vtZVQSdRgv81KRdn013mhD/JT1QHBZJSjSdmcWkQ2r/4LpMaqA==
X-Received: by 2002:a5d:4e04:0:b0:242:4f41:2efc with SMTP id p4-20020a5d4e04000000b002424f412efcmr42432972wrt.35.1671477362168;
        Mon, 19 Dec 2022 11:16:02 -0800 (PST)
Message-ID: <1a348320-62d1-77b5-d8e9-f21e8f2f2b47@gmail.com>
Date: Mon, 19 Dec 2022 21:16:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Virtio-disk updates for latest Xen ?
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xen.org
References: <CAKohpo=u7qp4URjRRAMM4xEytmZoKZAJOZLw4v0HTk13BrK-fw@mail.gmail.com>
 <CAPD2p-kfhaygmNNutUdk-mApR7z1YDSTYCEhtLgLsXi+-wbv8A@mail.gmail.com>
 <20221207002138.qulrlav3z3heozk4@vireshk-i7>
 <20221207035918.amzgrybqub632dyc@vireshk-i7>
 <f4ba541c-d089-28af-c80b-dcb0fa87a9d7@gmail.com>
 <20221215042205.y5565f7rv6asmsw5@vireshk-i7>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <20221215042205.y5565f7rv6asmsw5@vireshk-i7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15.12.22 06:22, Viresh Kumar wrote:

Hello Viresh


> On 14-12-22, 17:01, Oleksandr Tyshchenko wrote:
>> Today I had a chance to check virtio-disk on my H/W using new Xen branch
>> which does include Juergen's series with commit 3a96013a3e17
>> ("tools/xenstore: reduce number of watch events").
>>
>> Very interesting, but I didn't manage to reproduce an issue the similar to
>> what you had already faced with the rust counterparts before (caused by the
>> lack of Xenstore watches?). Note that I didn't debug what exactly events I
>> had got during guest creation/destruction, I just made sure that backend
>> worked as before. I checked that by running the backend in Dom0 and DomD and
>> performed a couple of guest power cycles (reboot, destroy/create).
>>
>> If you could provide the debug patch which you seem to use to print incoming
>> events which you described in previous email, I think I would be able to
>> re-check the situation at my side more deeper.
> 
> This should be enough to see the new changes I believe.
> 
> diff --git a/xs_dev.c b/xs_dev.c
> index a6c8403cfe84..8525c6512299 100755
> --- a/xs_dev.c
> +++ b/xs_dev.c
> @@ -421,6 +421,8 @@ static int xenstore_poll_be_watch(struct xs_dev *dev)
>       if (!vec)
>           return -1;
>   
> +    printf("%s: %s\n", vec[XS_WATCH_PATH], dev->path);
> +
>       if (!strcmp(vec[XS_WATCH_PATH], dev->path))
>           rc = xenstore_get_fe_domid(dev);


Thanks. This print does not provide much information in my case 
(virtio-disk). All what I see here in both cases (with old and new Xen) 
during guest creation is the following:
"backend/virtio_disk: backend/virtio_disk"

But, if I modify the xenstore_get_fe_domid() to always return 0 and as 
the result to get stuck here, I can see subsequent events for other 
paths here.

I agree that with new Xen (after commit 3a96013a3e17 "tools/xenstore: 
reduce number of watch events"), some events are missing now, but I
still don't see an issue with virtio-disk and can't see why it is going 
to be an issue. The code doesn't wait for the last "finalizing" event 
for the root directory "backend/virtio_disk", it goes ahead to find the 
FE domid right after receiving the first event.

new Xen:
oot@generic-armv8-xt-dom0:~# xl console DomD
backend/virtio_disk/6/51713: backend/virtio_disk
backend/virtio_disk/6/51713/frontend: backend/virtio_disk
backend/virtio_disk/6/51713/params: backend/virtio_disk
backend/virtio_disk/6/51713/frontend-id: backend/virtio_disk
backend/virtio_disk/6/51713/online: backend/virtio_disk
backend/virtio_disk/6/51713/removable: backend/virtio_disk
backend/virtio_disk/6/51713/bootable: backend/virtio_disk
backend/virtio_disk/6/51713/state: backend/virtio_disk
backend/virtio_disk/6/51713/dev: backend/virtio_disk
backend/virtio_disk/6/51713/type: backend/virtio_disk
backend/virtio_disk/6/51713/mode: backend/virtio_disk
backend/virtio_disk/6/51713/device-type: backend/virtio_disk
backend/virtio_disk/6/51713/discard-enable: backend/virtio_disk
backend/virtio_disk/6/51713/specification: backend/virtio_disk
backend/virtio_disk/6/51713/transport: backend/virtio_disk
backend/virtio_disk/6/51713/base: backend/virtio_disk
backend/virtio_disk/6/51713/irq: backend/virtio_disk

old Xen:
root@generic-armv8-xt-dom0:~# xl console DomD
backend/virtio_disk/4/51713: backend/virtio_disk
backend/virtio_disk/4: backend/virtio_disk
backend/virtio_disk: backend/virtio_disk
backend/virtio_disk/4/51713/frontend: backend/virtio_disk
backend/virtio_disk/4/51713/params: backend/virtio_disk
backend/virtio_disk/4/51713/frontend-id: backend/virtio_disk
backend/virtio_disk/4/51713/online: backend/virtio_disk
backend/virtio_disk/4/51713/removable: backend/virtio_disk
backend/virtio_disk/4/51713/bootable: backend/virtio_disk
backend/virtio_disk/4/51713/state: backend/virtio_disk
backend/virtio_disk/4/51713/dev: backend/virtio_disk
backend/virtio_disk/4/51713/type: backend/virtio_disk
backend/virtio_disk/4/51713/mode: backend/virtio_disk
backend/virtio_disk/4/51713/device-type: backend/virtio_disk
backend/virtio_disk/4/51713/discard-enable: backend/virtio_disk
backend/virtio_disk/4/51713/specification: backend/virtio_disk
backend/virtio_disk/4/51713/transport: backend/virtio_disk
backend/virtio_disk/4/51713/base: backend/virtio_disk
backend/virtio_disk/4/51713/irq: backend/virtio_disk

At the same time the code to automatically determine the FE domid is not 
ideal, for the instance, it is based on the assumption
that new FE domid should be always greater than old FE domid (which as I 
understand *might* be wrong) and contains a delay, so wants to be improved.


