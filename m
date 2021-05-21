Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F363D38CE63
	for <lists+xen-devel@lfdr.de>; Fri, 21 May 2021 21:51:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131383.245590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lkBB7-0006Lh-RX; Fri, 21 May 2021 19:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131383.245590; Fri, 21 May 2021 19:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lkBB7-0006JG-N5; Fri, 21 May 2021 19:51:25 +0000
Received: by outflank-mailman (input) for mailman id 131383;
 Fri, 21 May 2021 19:51:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=08+4=KQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1lkBB5-0006JA-US
 for xen-devel@lists.xenproject.org; Fri, 21 May 2021 19:51:23 +0000
Received: from mail-lj1-x22f.google.com (unknown [2a00:1450:4864:20::22f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b295818f-a8df-449e-b5ec-002336756546;
 Fri, 21 May 2021 19:51:23 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id b12so18080348ljp.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 May 2021 12:51:23 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id e20sm732688ljn.91.2021.05.21.12.51.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 12:51:21 -0700 (PDT)
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
X-Inumbo-ID: b295818f-a8df-449e-b5ec-002336756546
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=dKUEZzl+nHepziUUmCpiGub2H3ufF84sG9duutsuvl4=;
        b=mck1o0E5XKe4kuCbu0BEC/SPoZVPbyJ1KAWEckI6N5ywKwR4SU2elHmIYGFKd4zm9h
         /4szJzv4HiR87DnFS9biv+GoZL1crPSs1N1M0ABqdLTZAIMVjQCrNPpLxEqyGSDx+7BV
         /6NcGLS/7NI/7BdMcBgQHCACuwCoB9xo/G9G898x8nr/MC217Njwo3ZTtqumaMxMyXno
         6joGV30ZjUL0uarjTcupUoBrQ0XWLf6pxXTRbvwFoZwE/VGQZRLA1XnYLpDztESnQ/mC
         9sOkyWCUIAK8bAv6PRSNfUTj1Y1iPQbpL9IL3r1FWByYGnKx6ddf/SkjLBttJDQKI+cM
         cdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=dKUEZzl+nHepziUUmCpiGub2H3ufF84sG9duutsuvl4=;
        b=fyrxXfKvCYZ7u7f9E0Jn7Dm02RIio2HTiUUBlczhTF2SqJCIziwIsgdCAqIFqx6Vm9
         Ac3+5QjImcCuPoFM+6YQZEYRMOC259JpjMTpSrDKlxUztbEQ+FT0qlqzxLO8EUnSLsXL
         YBlzUGGS/qC9fjoLJ75yRqzLVsq2iU7+lqRcYVTG1n/R4ikw7CRv4hpU47BT63+GHBVa
         Xz3ScVgAaArdWw0FNwFawrI3tBw34Kd+rb+JAf0aIRZY8qiuOrynwEGuOPHeFE6Po0U1
         K4MYPlrYB/lrRNeAWn+LGNmkRC15eHOjiz3I+twdG0EK0zzvqHVxClMPLucA99V7tA1n
         t5IA==
X-Gm-Message-State: AOAM532n2qhW0EwGXJKxMb42qQsuTSyPETq2iF2gt5qDmT2D0WzeRo6t
	jGGdUrYbnB47gvDZnv68D2Y=
X-Google-Smtp-Source: ABdhPJyaR0WPyMrke7/wg84GfO7eX1zmtHItlUidCHE1nDlC6rPutiz9cTiZU0rotoRDpj2hb+JubQ==
X-Received: by 2002:a2e:3803:: with SMTP id f3mr7943361lja.230.1621626682026;
        Fri, 21 May 2021 12:51:22 -0700 (PDT)
Subject: Re: [PATCH V5 0/2] Virtio support for toolstack on Arm (Was "IOREQ
 feature (+ virtio-mmio) on Arm")
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Kaly Xin <Kaly.Xin@arm.com>, Artem Mygaiev <joculator@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1621603005-5799-1-git-send-email-olekstysh@gmail.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <7e268505-dca9-82df-e459-d8c090b6601a@gmail.com>
Date: Fri, 21 May 2021 22:51:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1621603005-5799-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 21.05.21 16:16, Oleksandr Tyshchenko wrote:

Hello, all.

I pushed this series in wrong way, so the patches #1 and #2 appeared 
with the same subject as a cover letter.
I have just resent this patch series properly. Please ignore current 
one. Sorry for the noise.

https://lore.kernel.org/xen-devel/1621626361-29076-1-git-send-email-olekstysh@gmail.com/

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


