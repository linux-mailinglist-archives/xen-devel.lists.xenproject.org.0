Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC16D7D714C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 17:54:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623092.970587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvgCl-0000fq-Ib; Wed, 25 Oct 2023 15:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623092.970587; Wed, 25 Oct 2023 15:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvgCl-0000dM-Fu; Wed, 25 Oct 2023 15:53:59 +0000
Received: by outflank-mailman (input) for mailman id 623092;
 Wed, 25 Oct 2023 15:42:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6lyY=GH=ventanamicro.com=dbarboza@srs-se1.protection.inumbo.net>)
 id 1qvg1h-0000Oo-RT
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 15:42:33 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c08b3a4-734d-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 17:42:32 +0200 (CEST)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1ca215cc713so38981425ad.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 08:42:32 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.2.33])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a170902da8600b001bf6ea340a9sm9386306plx.159.2023.10.25.08.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 08:42:30 -0700 (PDT)
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
X-Inumbo-ID: 1c08b3a4-734d-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698248551; x=1698853351; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pHBwe3N98CTxQYgA0OpqzFBkPW8+uhBzLc9xXUB5YP4=;
        b=iMeJRO6VqFhhyxK7HGkc4Gje95WKqB0P2Kcn5rBp/2DdacATjZZylIUkvVXNp9YzWE
         s/aNga2jjCEC3cgoyYFsNLaK0//5ea/dVgV/YOORmKeozsrP3KLhtgeIkBupkTenmRa8
         ESBL90+Nu+Lg2VXHvMA8rZSXUDZl+LbDLW61jDJCbbDQV4uWHt3QSkeISLao7xntLUA6
         t7JyQKrRy1rQvp4W+75Fm24Swe6r6/9dsjniY6YuVfZGcQqhEETE/RvKYNuUCr5S8zKk
         HViLP/C/aTjPkumwRvG7W/zLqwOvcKrU6BPsk/mULkCsQVg2DOoPIHvMHxNMQYWWYp4j
         ySmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698248551; x=1698853351;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pHBwe3N98CTxQYgA0OpqzFBkPW8+uhBzLc9xXUB5YP4=;
        b=oLPZXujpq0X2SbNifmlWrwCPt6KYcEbkPrbT/2oXjMx0Zzc1HpFUnhKRTYIx+TZZdx
         1ulzBEwrqqdplucpDmByNTEpGdEKHIOyrXqAOyAF1p5ObjHcKEwGCh7xDzsfbHkuxOEY
         GMqhbW5Pivyg3+7ExTpJlPvxcNTbZNsLnYY1Qju1OLatfRFS4floDCc9FMTkv81HDES+
         w2K+l4SNEqVh+GMvvq4xoV4hVvUtuuZPTjnMctlCnTo8SgdPnlqpET9A964QATJsGOpF
         J/aBAZfszW91re5HCcNpzrWCGJc2C0prBVY26pdYnDA6hGFGn9Dkwf4yCTqEHEmbu8YY
         TmsA==
X-Gm-Message-State: AOJu0Yyp266F5JeOTtzbPInGaVy42Ucpt8qHs2TVYa85sSBEL6iqaGyf
	nHveCr+xXqHF+wqxkEt58Z4pKA==
X-Google-Smtp-Source: AGHT+IHJv4yxw/7RDDq5T6r69uf5jnSvBXyabkpSOPUwReisWw3qMAHCPGLn0urLortt90MAwLpouA==
X-Received: by 2002:a17:902:d904:b0:1c9:e68a:1b58 with SMTP id c4-20020a170902d90400b001c9e68a1b58mr10283255plz.54.1698248550870;
        Wed, 25 Oct 2023 08:42:30 -0700 (PDT)
Message-ID: <c18da34b-56ae-4c9c-86a8-379e7b0fc759@ventanamicro.com>
Date: Wed, 25 Oct 2023 12:42:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 38/45] hw/riscv: use qemu_configure_nic_device()
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Rob Herring <robh@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Helge Deller <deller@gmx.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Song Gao
 <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>,
 Laurent Vivier <laurent@vivier.eu>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Bin Meng
 <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20231022155200.436340-1-dwmw2@infradead.org>
 <20231022155200.436340-39-dwmw2@infradead.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231022155200.436340-39-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/22/23 12:51, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/riscv/microchip_pfsoc.c | 13 ++-----------
>   hw/riscv/sifive_u.c        |  7 +------
>   2 files changed, 3 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index b775aa8946..8e0e3aa20c 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -411,17 +411,8 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
>           memmap[MICROCHIP_PFSOC_USB].size);
>   
>       /* GEMs */

I believe you forgot to remove the 'nd' variable. Building with this patch (applying
patches 1 to 4 first) fails with:


../hw/riscv/microchip_pfsoc.c: In function ‘microchip_pfsoc_soc_realize’:
../hw/riscv/microchip_pfsoc.c:205:14: error: unused variable ‘nd’ [-Werror=unused-variable]
   205 |     NICInfo *nd;
       |              ^~
cc1: all warnings being treated as errors


Patch looks good otherwise. Thanks,

Daniel

> -
> -    nd = &nd_table[0];
> -    if (nd->used) {
> -        qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
> -        qdev_set_nic_properties(DEVICE(&s->gem0), nd);
> -    }
> -    nd = &nd_table[1];
> -    if (nd->used) {
> -        qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
> -        qdev_set_nic_properties(DEVICE(&s->gem1), nd);
> -    }
> +    qemu_configure_nic_device(DEVICE(&s->gem0), true, NULL);
> +    qemu_configure_nic_device(DEVICE(&s->gem1), true, NULL);
>   
>       object_property_set_int(OBJECT(&s->gem0), "revision", GEM_REVISION, errp);
>       object_property_set_int(OBJECT(&s->gem0), "phy-addr", 8, errp);
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index ec76dce6c9..5207ec1fa5 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -789,7 +789,6 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
>       MemoryRegion *l2lim_mem = g_new(MemoryRegion, 1);
>       char *plic_hart_config;
>       int i, j;
> -    NICInfo *nd = &nd_table[0];
>   
>       qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-harts", ms->smp.cpus - 1);
>       qdev_prop_set_uint32(DEVICE(&s->u_cpus), "hartid-base", 1);
> @@ -893,11 +892,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
>       }
>       sysbus_mmio_map(SYS_BUS_DEVICE(&s->otp), 0, memmap[SIFIVE_U_DEV_OTP].base);
>   
> -    /* FIXME use qdev NIC properties instead of nd_table[] */
> -    if (nd->used) {
> -        qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
> -        qdev_set_nic_properties(DEVICE(&s->gem), nd);
> -    }
> +    qemu_configure_nic_device(DEVICE(&s->gem), true, NULL);
>       object_property_set_int(OBJECT(&s->gem), "revision", GEM_REVISION,
>                               &error_abort);
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->gem), errp)) {

