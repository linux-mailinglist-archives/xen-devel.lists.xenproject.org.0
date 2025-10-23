Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B34BFF6B8
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 08:56:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148728.1480599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBpEs-0000QQ-En; Thu, 23 Oct 2025 06:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148728.1480599; Thu, 23 Oct 2025 06:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBpEs-0000OR-Bk; Thu, 23 Oct 2025 06:55:58 +0000
Received: by outflank-mailman (input) for mailman id 1148728;
 Thu, 23 Oct 2025 06:55:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=20m7=5A=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vBpEq-0000OL-M8
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 06:55:56 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4feb80a4-afdd-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 08:55:51 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-471b80b994bso5483425e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 23:55:51 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897ff3f5sm2354381f8f.22.2025.10.22.23.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 23:55:50 -0700 (PDT)
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
X-Inumbo-ID: 4feb80a4-afdd-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761202551; x=1761807351; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yBjsiZOdEn77FHXbaFH/pyzY5kAYbLCRT+sJz0dq6fA=;
        b=x3eRcqv0oHEnVJncJu6Fpwd9WXfYFRH+w5NkDfR1Ac2cmyJfZ5SeFa4yfcCQGwWk3b
         EiXxLDwMMMDIdBGdUDXJfvk4jcr/Q7GdyMvtbWHgqDTdYkG0crbp5vFtVmDHS+48SLLm
         Ie6OgQScja63iEmgoNOOeCZJRMyQCbFTrWvgrpd3DbJSnWZQlLiPAQqxOpi0LnbjeRyr
         aj+YGcXNmVLAYuihQzzN1tdIFEaEJ4z1rX8fYPlhMwlmBISw0qm5/rTSDjXtCQUz5uhg
         OmsMb2ST+3uQojwVm0A1J1v3CaarUJeG4bKLHFJhMtqIykGe87/Urxc2BtE/CfvB5L3B
         n9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761202551; x=1761807351;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yBjsiZOdEn77FHXbaFH/pyzY5kAYbLCRT+sJz0dq6fA=;
        b=ny432XBT0GLsBETjU1K82as8ZWEMg6PgPjJlGU8DAxXXCTMaXekXyL8C9PD+ipA0Gj
         Z7pkQofEVUZeSOM/9wYrGPn5M7WvwUfWE28VofZjco98p/aNI8Z2HvvMufirYAeQl6bQ
         mTCsF6Dk5nC0Sb36VKpVDquzm5IWhd1piRo74+oYxBfun0KXSOAjvF/zvt/UIwNQIBpc
         hOgQgQL02WioDxqoLD1xSnP2BXTYih3rpmn+KscteCqxvyztDXq/UA1znXMHTS8VBNPR
         Ndlo8XMGNjgUYwvYIkH+FNo54jFFrW4xvTlUnxuHaLWz1ituHMc4de2NlgFW8dw9KH/K
         cniw==
X-Forwarded-Encrypted: i=1; AJvYcCXz8NjtKRp3ooKKETKVeSEw2u5q/mAzds4KhZW6ZV1g+Ozt+bahO5uZ7Hlee+oRi93p1hgRxJKV9K8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZux6VWSeofNDnLYMJZ2rNssObVoPKyF9bqeYOHyohn2XZdtg+
	mz+TTIkwO1lxZdSCA2CRAt2BGBdseJ+uG/1afY0jgcZv4Yj1VJF6OhQaAYYDaKUTuMQ=
X-Gm-Gg: ASbGnctClkngfY/tAwwk4mMHGAri2+MTtqYaXv4NoJztb37ExVVh11fRk1bBEDzwGD1
	6ef41hFywS2yH2w79x56Zs6xi7YB6NdngqUp7XA2KN9p/mJUoCnFbpDimPZ5cdT8LtyprKEr+ji
	ObcycL/BBUa4mxr8eLmUDHVA8CwY+4d/uLlUyoJQS14obeI/IbEZP+KlMI+4X09vk/ufJ55HlaI
	TFqKs6t7Foq8vuNOMK0+eVCdGjXGY/tSZCoJOagzZCwzr7HESGF9OqN8aoRDzVyyPctBsUDTEpV
	TQlNAB/mGUwe2oU8XvVdzkSg82GVIZvwTeykQtA7kxTHf8H3UjGntpfr7pYbGqHeMJZ4lRxLs1u
	ZqWPXJTINyhKzOgD+mpKghmHOpeSgM45bepMa6UoXRZvogq3oFJ/XbXcn6w/cVvXl6sy85asLBa
	Jv/BWzz611QLSOEwPp9j9zOyFG+09PWuL0jfSyd5fp25aMxIb+WHOgQQ==
X-Google-Smtp-Source: AGHT+IFc7GZgQ+HjgYh3w9CjXImj+3Na+YnYobgCi3dJmLowW01x3YzXkb4t8JrWd9L/fU1Q9uMKFQ==
X-Received: by 2002:a05:600c:4ec9:b0:46e:2562:e7b8 with SMTP id 5b1f17b1804b1-471179123admr170521105e9.21.1761202550629;
        Wed, 22 Oct 2025 23:55:50 -0700 (PDT)
Message-ID: <c013adf2-9620-4766-8f5b-1000ed1a494a@linaro.org>
Date: Thu, 23 Oct 2025 08:55:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remove redundant typedef when use
 OBJECT_DECLARE_SIMPLE_TYPE
Content-Language: en-US
To: Nguyen Dinh Phi <phind.uet@gmail.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhenwei Pi <pizhenwei@bytedance.com>, Alberto Garcia <berto@igalia.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Aditya Gupta <adityag@linux.ibm.com>,
 Glenn Miles <milesg@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Fam Zheng <fam@euphon.net>,
 Alex Williamson <alex@shazbot.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Amit Shah <amit@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org
References: <20251023063429.1400398-1-phind.uet@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251023063429.1400398-1-phind.uet@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/10/25 08:34, Nguyen Dinh Phi wrote:
> When OBJECT_DECLARE_SIMPLE_TYPE is used, it automatically provides
> the typedef, so we don’t have to define it ourselves.
> 
> Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
> ---
>   backends/cryptodev-lkcf.c               | 1 -
>   hw/char/ipoctal232.c                    | 9 ++++-----
>   hw/char/xen_console.c                   | 1 -
>   hw/dma/pl330.c                          | 6 ++----
>   hw/net/fsl_etsec/etsec.h                | 1 -
>   hw/net/xen_nic.c                        | 2 --
>   hw/pci-host/bonito.c                    | 7 +++----
>   hw/ppc/pef.c                            | 1 -
>   hw/usb/dev-mtp.c                        | 7 +++----
>   hw/usb/dev-uas.c                        | 7 +++----
>   include/hw/char/serial.h                | 1 -
>   include/hw/input/lasips2.h              | 6 ++----
>   include/hw/misc/auxbus.h                | 7 +++----
>   include/hw/misc/bcm2835_mphi.h          | 7 ++-----
>   include/hw/misc/npcm7xx_pwm.h           | 7 ++-----
>   include/hw/pci-host/pnv_phb3.h          | 6 ++----
>   include/hw/pci-host/pnv_phb4.h          | 8 ++++----
>   include/hw/ppc/mac_dbdma.h              | 7 +++----
>   include/hw/riscv/iommu.h                | 3 ---
>   include/hw/scsi/scsi.h                  | 7 +++----
>   include/hw/vfio/vfio-container-legacy.h | 5 ++---
>   include/hw/virtio/virtio-serial.h       | 5 ++---
>   include/net/can_emu.h                   | 7 +++----
>   23 files changed, 43 insertions(+), 75 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


