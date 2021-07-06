Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5444B3BD60E
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 14:28:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151205.279463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0kB6-0001Uo-1o; Tue, 06 Jul 2021 12:27:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151205.279463; Tue, 06 Jul 2021 12:27:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0kB5-0001Sz-UJ; Tue, 06 Jul 2021 12:27:51 +0000
Received: by outflank-mailman (input) for mailman id 151205;
 Tue, 06 Jul 2021 12:27:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uJ8l=L6=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1m0kB3-0001St-Nq
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 12:27:49 +0000
Received: from mail-lf1-x12b.google.com (unknown [2a00:1450:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f8e4765-252f-435d-bc8c-aa472fdada83;
 Tue, 06 Jul 2021 12:27:48 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id q18so37965722lfc.7
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jul 2021 05:27:48 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id e22sm802296ljb.61.2021.07.06.05.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 05:27:47 -0700 (PDT)
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
X-Inumbo-ID: 0f8e4765-252f-435d-bc8c-aa472fdada83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=u8cdZs1n2eju+an6IJ3Xbw/pZsVr76Ngc8Hf5ehaKsg=;
        b=smBU5skCFKSVjHnHm7fiFcnEtKYg7pIetICwIe/DfEvsq8N/r7ffbbzTroIUUWyk1i
         aCQoyTZHsaJtieLTvR3ggiJQZvYoHZlUzCEOp0uYSCPgDJCWd+A16OOTRSLdzvxNMePz
         gJCPNHATGIxXzHN6e7nu+5lf3e8LzJMHifjgHMxn7fOaHbYkDxJMTU72FO1XqWZ6lIpW
         aMKIA2qVk6NKB2W1t7ODhrMZH6yGYgPbLT7cyJDGJxbMTt1rVhJrjeWFPo18dr0jK0wS
         sHnhxdBY2PukSIbXGQZJmmLYWSRLbYdrA8ph92RsiYw0xEd96pU8m7zw3e7yWtC0C6Qu
         RXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=u8cdZs1n2eju+an6IJ3Xbw/pZsVr76Ngc8Hf5ehaKsg=;
        b=X87PJVmNad1/hni/PxHiOZVfoKIBJHoWnjA1ly+RKSjUeb7lkOyCsHc8u30I5M9mv2
         nysfQJH0HtvQWsiGbvf75EbLNUkc/JSjhuqwb6TT9+fyNsw+TiOEa5n75dNF00diPi8Y
         KQlTvuaNM/UG1223D4dCfRSkjtm6EX5gnF+Vb4Pvz+BRfbiWt2x3mdMpB26VFENUYtD+
         BOTcNX9C9nCP8f3TWZ5VpVNgFUplnqozYIKvuTFFEdL997LjXA5iax0EVLRhy7/0vfl9
         IwQ37QKh5XbHEYIT9ioJ9V3kHsNXDcJqRVzcBMDolszL+8qiUAlH3Oqnx+yvzvWGXi9s
         WQKw==
X-Gm-Message-State: AOAM532mIYKtAl7l53m+x19T6uDu5Wk6PawkMXlAKOsaGKnt7Wal9wQZ
	BZqwTYevIsoZDyGKxC2Kqtg=
X-Google-Smtp-Source: ABdhPJzwMdD+8qWzl4WU+/5ySyaCBfS1W8G5IIpXPQzc0U+DI4pyGZ25P5n5ftNB+0ODep0rmTYGBQ==
X-Received: by 2002:a05:6512:3b8c:: with SMTP id g12mr14685284lfv.551.1625574467534;
        Tue, 06 Jul 2021 05:27:47 -0700 (PDT)
Subject: Re: [RESEND PATCH V5 0/2] Virtio support for toolstack on Arm (Was
 "IOREQ feature (+ virtio-mmio) on Arm")
From: Oleksandr <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Kaly Xin <Kaly.Xin@arm.com>, Artem Mygaiev <joculator@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1621626361-29076-1-git-send-email-olekstysh@gmail.com>
Message-ID: <0b2c79f9-67d4-219d-2edf-3576a8684c58@gmail.com>
Date: Tue, 6 Jul 2021 15:27:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1621626361-29076-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


Hello all,


Gentle reminder...


On 21.05.21 22:45, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> Hello all.
>
> The purpose of this patch series is to add missing virtio-mmio bits to Xen toolstack on Arm.
> The Virtio support for toolstack [1] was postponed as the main target was to upstream IOREQ/DM
> support on Arm in the first place. Now, we already have IOREQ support in, so we can resume Virtio
> enabling work. You can find previous discussion at [2].
>
> Patch series [3] was reworked and rebased on recent "staging branch"
> (972ba1d x86/shadow: streamline shadow_get_page_from_l1e()) and tested on
> Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with "updated" virtio-mmio disk backend [4]
> running in Driver domain and unmodified Linux Guest running on existing
> virtio-blk driver (frontend). No issues were observed. Guest domain 'reboot/destroy'
> use-cases work properly.
>
> Any feedback/help would be highly appreciated.
>
> [1]
> https://lore.kernel.org/xen-devel/1610488352-18494-24-git-send-email-olekstysh@gmail.com/
> https://lore.kernel.org/xen-devel/1610488352-18494-25-git-send-email-olekstysh@gmail.com/
> [2]
> https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg02403.html
> https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg02536.html
> [3] https://github.com/otyshchenko1/xen/commits/libxl_virtio
> [4] https://github.com/xen-troops/virtio-disk/commits/ioreq_ml3
>
> Julien Grall (1):
>    libxl: Introduce basic virtio-mmio support on Arm
>
> Oleksandr Tyshchenko (1):
>    libxl: Add support for Virtio disk configuration
>
>   docs/man/xl-disk-configuration.5.pod.in   |  27 +
>   tools/include/libxl.h                     |   6 +
>   tools/libs/light/libxl_arm.c              | 133 ++++-
>   tools/libs/light/libxl_device.c           |  38 +-
>   tools/libs/light/libxl_disk.c             |  99 +++-
>   tools/libs/light/libxl_types.idl          |   4 +
>   tools/libs/light/libxl_types_internal.idl |   1 +
>   tools/libs/light/libxl_utils.c            |   2 +
>   tools/libs/util/libxlu_disk_l.c           | 881 +++++++++++++++---------------
>   tools/libs/util/libxlu_disk_l.h           |   2 +-
>   tools/libs/util/libxlu_disk_l.l           |   1 +
>   tools/xl/xl_block.c                       |  11 +
>   xen/include/public/arch-arm.h             |   7 +
>   13 files changed, 764 insertions(+), 448 deletions(-)
>
-- 
Regards,

Oleksandr Tyshchenko


