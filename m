Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 510A658CF89
	for <lists+xen-devel@lfdr.de>; Mon,  8 Aug 2022 23:16:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382594.617571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLA6t-0006fA-2e; Mon, 08 Aug 2022 21:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382594.617571; Mon, 08 Aug 2022 21:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLA6s-0006cU-VZ; Mon, 08 Aug 2022 21:16:26 +0000
Received: by outflank-mailman (input) for mailman id 382594;
 Mon, 08 Aug 2022 21:16:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y+qk=YM=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oLA6r-0006cN-6b
 for xen-devel@lists.xen.org; Mon, 08 Aug 2022 21:16:25 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b61e5bb-175f-11ed-924f-1f966e50362f;
 Mon, 08 Aug 2022 23:16:24 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id bq11so14464309lfb.5
 for <xen-devel@lists.xen.org>; Mon, 08 Aug 2022 14:16:24 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a056512324900b0048afdf1ba33sm1534255lfr.208.2022.08.08.14.16.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 14:16:23 -0700 (PDT)
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
X-Inumbo-ID: 5b61e5bb-175f-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=i7sPcJcYJQqlG8+9RAdwokm2aX0ltxFoBxcSqQqgYGM=;
        b=YMT0LyDNumiq5hkP4xLvldqwpg5jyUIS9J588fyrHn3Az//G5VFFRYJvpsX3IILnoT
         PkEtsXMHvSHzzmBbOHtEoUDYlK98W5CQ0Oi3bqYdS97muxLpxXLK9iQuicPSroph1/xj
         etkIIzgDb+qRipVOZKit/Q+yGTNc7SpNUOOGVuzjdT9LSlMZkPK/bOz46HNyxkNEvpD0
         hY/8TaAbprCnVVBZGjShcG/MykNbCGp+voMHL+xQ8x7ijZW0jJKwO1TPpGOfWZlMCrp1
         6gXsrKZccmsZjvoAPRhG7EPc+t/M5HQqMMS4RkxTgeRGvgi3DA8Py/aLx6WSzlcgcuEh
         pUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=i7sPcJcYJQqlG8+9RAdwokm2aX0ltxFoBxcSqQqgYGM=;
        b=oItQKpBU5sH4N6H/xGxSzAiW9aTK7TjyGaSXSFj5XZwax0gwnvf+zHFP74Ab5eVjTm
         BC6nG+wYx8rXxjqpikhoLt5jkAVa8ckSZUvS0X4ASdreI99RQbp3Uf/Cye3fx1t0B61m
         xRPjOwm09fYRICtmXu6d1zCWuCpNCzwbiFAireY7nhQfaHuqnxQ+GAkwrKhz1n8cPAlb
         5jl9nleiegS9Q3YGwB/f38flESJJKYioZQxjaZpYWTGXYHp4M7Jwv5nvyJOEH+yFxzyN
         g/zmIlzjWB7ZKogwUbdYJH9KmGunTNNQyop/1UOE73MH7g4KOaKiVA4IILorN/tGMEYn
         APcQ==
X-Gm-Message-State: ACgBeo1EQKxPW1fdtrgJj6Fdrphz09tOwqXc/prUNfB4nbFni62nH+kX
	HcFT1h6AMRWGDvj5DHJHqaU=
X-Google-Smtp-Source: AA6agR4ZpsVxQiDD8cSBPMyeSP1aWpsjR3qGi2qMv5ViCUIG577CbFYSpVgWPyYT7gd4vMdQ+n/1UQ==
X-Received: by 2002:ac2:5ca3:0:b0:48b:9997:9a01 with SMTP id e3-20020ac25ca3000000b0048b99979a01mr4269402lfq.374.1659993383806;
        Mon, 08 Aug 2022 14:16:23 -0700 (PDT)
Message-ID: <0610eb02-f074-f2d1-47b0-cb8c54374ebb@gmail.com>
Date: Tue, 9 Aug 2022 00:16:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3 0/6] Virtio toolstack support for I2C and GPIO on Arm
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>, xen-devel@lists.xen.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>
References: <cover.1659596139.git.viresh.kumar@linaro.org>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <cover.1659596139.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 04.08.22 10:01, Viresh Kumar wrote:
> Hello,

Hello Viresh


>
> This patchset adds toolstack support for I2C and GPIO virtio devices. This is
> inspired from the work done by Oleksandr for the Disk device.
>
> This is developed as part of Linaro's Project Stratos, where we are working
> towards Hypervisor agnostic Rust based backend [1].
>
> This is based of origin/staging (commit 01ca29f0b17a ("sched: dom0_vcpus_pin
> should only affect dom0")) which already has Oleksandr's patches applied.
>
> V2->V3:
> - Rebased over latest tree and made changes according to changes in Oleksandr's
>    patches from sometime back.

Thanks, I have reviewed all patches that touch libxl_arm.c (##3-6)



> - Minor cleanups.
>
> V1->V2:
> - Patches 3/6 and 4/6 are new.
> - Patches 5/6 and 6/6 updated based on the above two patches.
> - Added link to the bindings for I2C and GPIO.
> - Rebased over latest master branch.
>
>
> Thanks.
>
> --
> Viresh
>
> [1] https://lore.kernel.org/xen-devel/20220414092358.kepxbmnrtycz7mhe@vireshk-i7/
>
> Viresh Kumar (6):
>    libxl: Add support for Virtio I2C device
>    libxl: Add support for Virtio GPIO device
>    libxl: arm: Create alloc_virtio_mmio_params()
>    libxl: arm: Split make_virtio_mmio_node()
>    libxl: Allocate MMIO params for I2c device and update DT
>    libxl: Allocate MMIO params for GPIO device and update DT
>
>   tools/golang/xenlight/helpers.gen.go      | 212 ++++++++++++++++++++
>   tools/golang/xenlight/types.gen.go        |  54 ++++++
>   tools/include/libxl.h                     |  64 ++++++
>   tools/include/libxl_utils.h               |   6 +
>   tools/libs/light/Makefile                 |   2 +
>   tools/libs/light/libxl_arm.c              | 138 +++++++++++--
>   tools/libs/light/libxl_create.c           |  26 +++
>   tools/libs/light/libxl_dm.c               |  34 +++-
>   tools/libs/light/libxl_gpio.c             | 226 ++++++++++++++++++++++
>   tools/libs/light/libxl_i2c.c              | 226 ++++++++++++++++++++++
>   tools/libs/light/libxl_internal.h         |   2 +
>   tools/libs/light/libxl_types.idl          |  48 +++++
>   tools/libs/light/libxl_types_internal.idl |   2 +
>   tools/ocaml/libs/xl/genwrap.py            |   2 +
>   tools/ocaml/libs/xl/xenlight_stubs.c      |   2 +
>   tools/xl/Makefile                         |   2 +-
>   tools/xl/xl.h                             |   6 +
>   tools/xl/xl_cmdtable.c                    |  30 +++
>   tools/xl/xl_gpio.c                        | 142 ++++++++++++++
>   tools/xl/xl_i2c.c                         | 142 ++++++++++++++
>   tools/xl/xl_parse.c                       | 160 +++++++++++++++
>   tools/xl/xl_parse.h                       |   2 +
>   tools/xl/xl_sxp.c                         |   4 +
>   23 files changed, 1509 insertions(+), 23 deletions(-)
>   create mode 100644 tools/libs/light/libxl_gpio.c
>   create mode 100644 tools/libs/light/libxl_i2c.c
>   create mode 100644 tools/xl/xl_gpio.c
>   create mode 100644 tools/xl/xl_i2c.c
>
-- 
Regards,

Oleksandr Tyshchenko


