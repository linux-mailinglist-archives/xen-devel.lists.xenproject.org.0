Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E0EC10B55
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 20:16:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151745.1482284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDShU-0000rl-QT; Mon, 27 Oct 2025 19:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151745.1482284; Mon, 27 Oct 2025 19:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDShU-0000ow-NG; Mon, 27 Oct 2025 19:16:16 +0000
Received: by outflank-mailman (input) for mailman id 1151745;
 Mon, 27 Oct 2025 19:16:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=asFF=5E=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vDShT-0000nO-HZ
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 19:16:15 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60934903-b369-11f0-9d16-b5c5bf9af7f9;
 Mon, 27 Oct 2025 20:16:02 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-426fd62bfeaso2463336f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Oct 2025 12:16:02 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952de4a1sm15780056f8f.37.2025.10.27.12.15.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 12:16:00 -0700 (PDT)
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
X-Inumbo-ID: 60934903-b369-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761592562; x=1762197362; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CoYRlUHvu4bfKY1MKCPfA+vI0KIfDiQsFZOWKDfq3r8=;
        b=xEKzgYtJm6SiA68jSLU+EoTkpYpQIvdO4EibP3fueEr+rYV7ovfp6lu/Iei04AO/1U
         rUtQKGVEtLyxMYr+RQXZbvpuuYYGIEl8AG4/Y7XsPxDUXCGuwt8huBhZ/7k4hHDOXEsu
         5r6vc1KGtSi240LIHV1H92r7dDIiuUzxXd1kqIZvj4sI62rPw7/Z4rqdlkQlSQSBSaLb
         8oC/3a0cmU2Pqv7mQpaBErLmYmj4WwsAQJUCfVlnUWkX5qHGJ+2Co3RkhTXVaa/v8511
         FnUyyx14jd3Q3ik1Lu2uknau2D0PEiLqgRzrE+nzAR8TUSNbhwv9tlMqViQQ/dXE3G4G
         cMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761592562; x=1762197362;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CoYRlUHvu4bfKY1MKCPfA+vI0KIfDiQsFZOWKDfq3r8=;
        b=xOb9gS2Ocl7rg6rQPWnqWAfayEtp5pPaAJlL5sH1TRS2sLfPVuuCzVBxUH1Dbk1ICF
         P0m3y4e7AQLMGYrhTawVf4mf24Z6VotYBfsj5D1DePacpd2x2R9E+/QfqHYydcXxev2i
         sWBSuzVm0eNMfvbka6MHga5g8d9+XtmlY04gFGH9vJgcV907qw0BTXeEoA/fT83C0T8E
         +c95aN8IVM7Br+yv1Ey0VBFZGmGv60etvLch607I9hThnN/s8O18EiHFvlT2kGJt+0jy
         r8YPD1lCOei+kUa9nI3r17Gi2cffYLfwn+ADcVpPmujGbW/P1DoVH1llF+od9mCwFpbf
         GndQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTjFZ2zGAWS6Hp5AZat5pDeq5P+4wBNB2cq3Tl8zDUiCsK2rimXpHUhdoByIVK26f6fc004by/zdg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxyUpSgZpDlyTMlGvGbW99KguBv/mK4m+otfVk1dNTU6w6HDBJw
	eJmIBkwoqDwHvRfVSNaBpYxiIuqY74TceHjirPVAzXKiRq4ABnhcY+F0YOlt5PvvGUk=
X-Gm-Gg: ASbGnctbYQ5kLPvnJweRtvMGwY/qi0WEt9Qw77vyi5n7iIsFFxLbfQTeglw4PII64Zi
	Ma/0RQO4N9f+Lk4y71WJiqSILFl76Nl2AUK7jUEgw7d8WZkAZwX4osmScyJAH15Epv8NlQBN5vd
	8PqZRPaMMcyNkXST6whc9CB/Cj3C8zNduPtQV8ZHVUTsZvcEuROC1HgRgHkny7OoklRDg2N0lVz
	V2FHIEdxxwDLpKqXFHot0zZB+tC4YmYkBtErQFJUnzghwXAPt67Opi2IImJkvARwxb35EqLRY/V
	9s+JsEdE5oeH0ZH/xH49DnIB7BdZAZkUJ2EWYJlLcbIMFDz3iJqyl38rbpf2UfdyQK6JHRNBbZp
	1C3F4SSueB63wCFCL516+f6V+MxyNhSSMXQlRI1qYgA2amE+3r5bwXt8Ku8yZZn9hUwC+H0dtn2
	LP3HenPYK8byCQRRhAnLri32r4pT/fu4uULvtjD5FLkCo=
X-Google-Smtp-Source: AGHT+IHBSEpEozHAFTJdTfk/a3fUIM2hb08ESeGXxhxbKeH6+EF0pf/ollVaJVxzwnqub14NZNiUAg==
X-Received: by 2002:a05:6000:2282:b0:3fa:5925:4b11 with SMTP id ffacd0b85a97d-429a7e83671mr817298f8f.42.1761592561617;
        Mon, 27 Oct 2025 12:16:01 -0700 (PDT)
Message-ID: <a3d4a6b5-2ce4-4df3-8d29-62999ad71b74@linaro.org>
Date: Mon, 27 Oct 2025 20:15:58 +0100
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

Patch queued, thanks!

