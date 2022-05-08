Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 738F851EF07
	for <lists+xen-devel@lfdr.de>; Sun,  8 May 2022 19:29:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324095.546014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnkiK-0008Jg-FM; Sun, 08 May 2022 17:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324095.546014; Sun, 08 May 2022 17:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnkiK-0008Gd-CU; Sun, 08 May 2022 17:29:00 +0000
Received: by outflank-mailman (input) for mailman id 324095;
 Sun, 08 May 2022 17:28:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1pl+=VQ=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nnkiI-0008GX-Lp
 for xen-devel@lists.xen.org; Sun, 08 May 2022 17:28:58 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57352646-cef4-11ec-a406-831a346695d4;
 Sun, 08 May 2022 19:28:57 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id h29so20321442lfj.2
 for <xen-devel@lists.xen.org>; Sun, 08 May 2022 10:28:57 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a056512069000b0047255d2114bsm1608206lfe.122.2022.05.08.10.28.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 May 2022 10:28:55 -0700 (PDT)
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
X-Inumbo-ID: 57352646-cef4-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=WRz9xv0fmBEp2JAlnucnVl6yJb0kOq13ngn6JVHazMU=;
        b=qqmzexPzwBfSQ0gHfvXngAz0XgYnIsFd0ZpS8j0ckvknBpaph4fQQeGRX5+UHHnOOT
         ulQUuh8LnR9ZL3JN/ECdr9b7UvB3zEsDxuFvAnFWV0N6yXzOEJ5xE5pX2yAvIIpyrxcH
         VA1Oo0Mfxu3y44l5XQzwMNtjhIsDsHhwP+m5DAs6cDw3YCxYDQaOe/3mURcbEpW3GG2S
         eZQzHaJhsq0vNlOYmOXGDrcRn+Hf2AvphM8hri/mtV08Ignc8n+dNUEEw8o6mAVzCsYn
         7rDlBv+mPdD8emlbh3ZggjELeYKG64QCKH4qmXXRJes/gUf+AXwvhOyWM+w8VGNb3LrH
         z+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=WRz9xv0fmBEp2JAlnucnVl6yJb0kOq13ngn6JVHazMU=;
        b=g2pRFOf3BO8JEMHv5z4i4pfwsBkySPaxCzYw0EpfxfQsQsVjNFTWoPfFKZgvClJtsn
         R2PbDydgm+vw60xTmcWlInvHTECo7YSI4XDNoiZUX3aUqbfZik5j1NnVJSUFtJ7sg3Rn
         GHu0Lkg4FkpkAQ+p5qjE0neDNe3GPsn6B5EgStC/uUMtnWZnLQayQeRRoJsb7+Bgbza8
         bYPWmCPXnkCB/H5STZWuepcQkd1RxesDR+FO+E6VfYGuiv0z5UY0tzlnpiIY5Dm+aKKV
         H2DMRg/Oc+WXVvgfVRlnWYIKlqkDBXsW+ikJUs4IoW/wEQxVnoA1oa1M2NS1M9hF6yy5
         kpcg==
X-Gm-Message-State: AOAM5326bDcM4NTFS0/EajgbeD28ikQtXurCtLadS62NXD+pbV59RtfX
	w63/yzC9OITZuOsrV7Kt/hQ=
X-Google-Smtp-Source: ABdhPJxwf77LK5q/yL0rfV1/j/98QqkCxFE1iqZP+RaBYaJ18lxv/E5854RYROvcrwIlZz2ZTNlHHg==
X-Received: by 2002:a05:6512:2398:b0:473:9cf5:1750 with SMTP id c24-20020a056512239800b004739cf51750mr9934073lfv.300.1652030936704;
        Sun, 08 May 2022 10:28:56 -0700 (PDT)
Subject: Re: [PATCH 0/4] Virtio toolstack support for I2C and GPIO on Arm
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: xen-devel@lists.xen.org, Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>
References: <cover.1651734854.git.viresh.kumar@linaro.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <a9817f90-d701-2dff-f258-be7a21230fc0@gmail.com>
Date: Sun, 8 May 2022 20:28:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cover.1651734854.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 05.05.22 10:33, Viresh Kumar wrote:

Hello Viresh

> Hello,
>
> This patchset adds toolstack support for I2C and GPIO virtio devices. This is
> inspired from the work done by Oleksandr for the Disk device [1].

Great work!


>
> The first two patches can be applied right away, but the last two need
> Oleksandr's series [1] to be applied first.

I have reviewed patches #3/4 and #4/4 (libxl_arm.c changes).

FYI, I have recently pushed V8 of my series [1], which changes the code 
in libxl_arm.c a bit.


>
> This is developed as part of Linaro's Project Stratos, where we are working
> towards Hypervisor agnostic Rust based backend [2].
>
> I must accept that I am a beginner to Xen and developed this patchset based on
> support for existing devices like Disk or Keyboard. There may be bits which I
> missed or the one I added which aren't really required.
>
> Thanks.
>
> --
> Viresh
>
> Viresh Kumar (4):
>    libxl: Add support for Virtio I2C device
>    libxl: Add support for Virtio GPIO device
>    libxl: Allocate MMIO params for I2c device and update DT
>    libxl: Allocate MMIO params for GPIO device and update DT
>
>   tools/golang/xenlight/helpers.gen.go      | 220 ++++++++++++++++++++
>   tools/golang/xenlight/types.gen.go        |  54 +++++
>   tools/include/libxl.h                     |  64 ++++++
>   tools/include/libxl_utils.h               |   6 +
>   tools/libs/light/Makefile                 |   2 +
>   tools/libs/light/libxl_arm.c              | 117 ++++++++++-
>   tools/libs/light/libxl_create.c           |  26 +++
>   tools/libs/light/libxl_dm.c               |  34 +++-
>   tools/libs/light/libxl_gpio.c             | 236 ++++++++++++++++++++++
>   tools/libs/light/libxl_i2c.c              | 236 ++++++++++++++++++++++
>   tools/libs/light/libxl_internal.h         |   2 +
>   tools/libs/light/libxl_types.idl          |  52 +++++
>   tools/libs/light/libxl_types_internal.idl |   2 +
>   tools/ocaml/libs/xl/genwrap.py            |   2 +
>   tools/ocaml/libs/xl/xenlight_stubs.c      |   2 +
>   tools/xl/Makefile                         |   2 +-
>   tools/xl/xl.h                             |   6 +
>   tools/xl/xl_cmdtable.c                    |  30 +++
>   tools/xl/xl_gpio.c                        | 143 +++++++++++++
>   tools/xl/xl_i2c.c                         | 143 +++++++++++++
>   tools/xl/xl_parse.c                       | 160 +++++++++++++++
>   tools/xl/xl_parse.h                       |   2 +
>   tools/xl/xl_sxp.c                         |   4 +
>   23 files changed, 1540 insertions(+), 5 deletions(-)
>   create mode 100644 tools/libs/light/libxl_gpio.c
>   create mode 100644 tools/libs/light/libxl_i2c.c
>   create mode 100644 tools/xl/xl_gpio.c
>   create mode 100644 tools/xl/xl_i2c.c


[1] 
https://lore.kernel.org/xen-devel/1651598763-12162-1-git-send-email-olekstysh@gmail.com/


-- 
Regards,

Oleksandr Tyshchenko


