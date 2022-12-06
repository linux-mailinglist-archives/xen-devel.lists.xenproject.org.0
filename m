Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B04C64459A
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 15:28:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454975.712572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2YvW-0007LK-S8; Tue, 06 Dec 2022 14:28:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454975.712572; Tue, 06 Dec 2022 14:28:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2YvW-0007I3-PD; Tue, 06 Dec 2022 14:28:06 +0000
Received: by outflank-mailman (input) for mailman id 454975;
 Tue, 06 Dec 2022 14:28:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d2tL=4E=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1p2YvV-0007Hw-BV
 for xen-devel@lists.xen.org; Tue, 06 Dec 2022 14:28:05 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31dda876-7572-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 15:28:04 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id f18so23701500wrj.5
 for <xen-devel@lists.xen.org>; Tue, 06 Dec 2022 06:28:04 -0800 (PST)
Received: from [10.17.77.118] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 co16-20020a0560000a1000b00241b6d27ef1sm17477046wrb.104.2022.12.06.06.28.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 06:28:03 -0800 (PST)
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
X-Inumbo-ID: 31dda876-7572-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=itSi0aHZ4tkKMhRYukQK5MNx0W0zDwdwKQzeAkw7qAg=;
        b=e63t5Br/L+kFJqYDjDbor1YatU3hbK8weuO09xyyhI4MGEiAce4uRDwZZegpowIGr/
         sdHc0Dnp3Uv7hdz7D9UZzLglFT+yH/KjC3I8uHvD0SpW0sZ1bTlFGZpM4rPNEwslvtg7
         DxhKZbV7VLhlg2vT1INYxooVY3IgJfk1NKNZN9la/Oep2/nxQDVX+YhrL31qWy4rJ/sG
         B6qGNIWoN1KPU10dVRaFn4hqou0qLmLzQaEQAXQ+XZaTOy6o8ewtHeOn/dKDU2tw0m1D
         3fI9fvTZVojhMwb9aDY5IGdZfBGGbySNAB3oXU2A82Lop6UUKJS6sEF9jupaZBLlmwAb
         D3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=itSi0aHZ4tkKMhRYukQK5MNx0W0zDwdwKQzeAkw7qAg=;
        b=JP7bSmRLLvJFzmNlFzXJS3si+YZM2i/6Z5+5jMMhckvEsshi0o+Yf1SH65yuZTDeS+
         SO7jX+w0BtJ6Go/CsqTX0UqxM3y3jrWzKmxi2FsZJ2xl4vd6gcLte8pnJ8ujm1NIV0L7
         MVjBp7ZzGqa/cN/PQimiHWXkW4llmkLqUbspUrqjKTNOtdn+BcIAm46Rd2iyX1ZmpGoR
         +if1kah+W8FdlXecQwAXWhpHzicjmAAkxTpIVH7nwcHqgmCe6mdiPQ49Gaab3ujDPqMx
         oVh2bb8gWPiXAQS6zEwA9jZnp97Eq7JDhQliJIbnffLLjdyBk9dqdJHbsG7TWDSxhvfi
         5h8Q==
X-Gm-Message-State: ANoB5pmaVzgIILKdS0MNxArjkr/39YfErh2ytlulB5BuosjM3XD6VjVr
	AY383aIogT84YxTc9vBPA2o=
X-Google-Smtp-Source: AA0mqf7+LIaB+fh5JtqU/BJoul9D5nwE9fD8YTjKXpp6z6g5iuOXZCQAgSV64sqnP6idcgcI8368rg==
X-Received: by 2002:a5d:4564:0:b0:242:4e1e:98ec with SMTP id a4-20020a5d4564000000b002424e1e98ecmr8976708wrc.247.1670336883744;
        Tue, 06 Dec 2022 06:28:03 -0800 (PST)
Message-ID: <5584001f-9f20-def3-84b5-a6689d4bf9d3@gmail.com>
Date: Tue, 6 Dec 2022 16:28:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V6 2/3] xl: Add support to parse generic virtio device
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xen.org,
 Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <cover.1667906228.git.viresh.kumar@linaro.org>
 <73663851c5223b99ed0f23a163a0d44cba0ebe29.1667906228.git.viresh.kumar@linaro.org>
 <4a355c28-9596-cfbd-ffd2-2f8d9dde9938@gmail.com>
 <20221205062047.yuv3hyrkpumry7wn@vireshk-i7>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <20221205062047.yuv3hyrkpumry7wn@vireshk-i7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05.12.22 08:20, Viresh Kumar wrote:

Hello Viresh

> On 02-12-22, 19:16, Oleksandr Tyshchenko wrote:
>> Interesting, I see you allow user to configure virtio-mmio params (irq and
>> base), as far as I remember for virtio-disk these are internal only
>> (allocated by tools/libs/light/libxl_arm.c).
> 
> It is a mistake. Will drop it.


ok, good. Please don't forget to add a note to idl file that virtio-mmio 
params are internal only.


libxl_device_virtio = Struct("device_virtio", [
     ...

     # Note that virtio-mmio parameters (irq and base) are for internal
     # use by libxl and can't be modified.
     ("irq", uint32),
     ("base", uint64)
     ])


> 

