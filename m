Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8852E7E79CD
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 08:40:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629923.982486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1M8A-0005DV-Sz; Fri, 10 Nov 2023 07:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629923.982486; Fri, 10 Nov 2023 07:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1M8A-0005AC-Pw; Fri, 10 Nov 2023 07:40:42 +0000
Received: by outflank-mailman (input) for mailman id 629923;
 Fri, 10 Nov 2023 07:40:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=huas=GX=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r1M88-0005A6-SE
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 07:40:40 +0000
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70956109-7f9c-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 08:40:37 +0100 (CET)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-9ae2cc4d17eso291923266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Nov 2023 23:40:37 -0800 (PST)
Received: from [192.168.69.115] ([176.187.194.109])
 by smtp.gmail.com with ESMTPSA id
 qt19-20020a170906ecf300b009a1be9c29d7sm3567178ejb.179.2023.11.09.23.40.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 23:40:29 -0800 (PST)
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
X-Inumbo-ID: 70956109-7f9c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699602030; x=1700206830; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w1cQVy8Tdk0u30Y5Hhr0erXikh+ihShfX7wQfHbqGoc=;
        b=LC1YOOjp9uOpE+Ua8eWUDBjZxKdUWpdkV89r+pTxj7EL2X8+boMDTIatoTgglT/WsG
         F9GZuUYyPfQMInMxmgN2ud5tFJSeGyMUL9J5aV7wKz6pk45DfEKDrMBJ7D9o0HTCeraP
         FfofyfbWwUsopSZE4V1zE400XX+9bMcPPVOfic28C7kUp0FtPkJ1w8yiqtO1Nl97R0o9
         YvCcwYEELaNQ0culPVSStHsFxYQOGU57ZQPLgxOOtjdayKx1ab9tgPtrsd6nAdBYN/LW
         Jm4diRFHak/ZAFTqiM8nyL9XJ4oGW7C/5E/DJBsSnVoJi1/O452DbPnKwQfUeIZ/1lKV
         kyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699602030; x=1700206830;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w1cQVy8Tdk0u30Y5Hhr0erXikh+ihShfX7wQfHbqGoc=;
        b=ng4WfHzA2BTpnHUj7MQB2ZacItXgjWiMYesjxvGZOrVovf79eXccjQhZFKidCrUV3U
         2+dFL5DdWvxGz+bbequ4IkUEnxN8CoaQ768sWXQfRMjhv7RZOLjEqFRmRixQFZedJnKv
         4rc5dJ5P6CxQlSoIbs3umpzls0ulnSnsyKYUDtCf0aSaAqAygDGJkbvy4P78z5n37E38
         4He+vtx0oZV2pKym6s4VLUbKJJ+IBhOL98u9ESMln9KN44sqrz53fi3Kps1YWL+Wr0Fw
         O0OzJk9xfMq26j7t0NU1mJ19ueApVX1HqdMIWDNVV3OJ+/VmYdOff7SRsI1TUVfzd4zv
         dmXg==
X-Gm-Message-State: AOJu0YxiXwLNvi4GpofAeI/8RPQFfgHEnbi1TahxYvYFRnnr9T+IpJce
	ZnfT/SXoepklMVpGZYiZoXWrUw==
X-Google-Smtp-Source: AGHT+IFiynhjKq3A77rBORXMoLsYOtp3N+GMcbcfs+ylkUNpnOvZIjAqXdE960vvYQGNOoGt3u62WQ==
X-Received: by 2002:a17:907:9287:b0:9c7:5a01:ffec with SMTP id bw7-20020a170907928700b009c75a01ffecmr6368674ejc.0.1699602029914;
        Thu, 09 Nov 2023 23:40:29 -0800 (PST)
Message-ID: <34e2c0c6-4e04-486a-8e1f-4afdc461a5d4@linaro.org>
Date: Fri, 10 Nov 2023 08:40:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-8.3 v2 05/46] hw/i386/pc: use qemu_get_nic_info() and
 pci_init_nic_devices()
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>, Markus Armbruster <armbru@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Rob Herring <robh@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Song Gao <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>,
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
References: <20231106195352.301038-1-dwmw2@infradead.org>
 <20231106195352.301038-6-dwmw2@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231106195352.301038-6-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi David,

+Markus/Bernhard

On 6/11/23 20:49, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Eliminate direct access to nd_table[] and nb_nics by processing the the
> Xen and ISA NICs first and then calling pci_init_nic_devices() for the
> rest.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
>   hw/i386/pc.c                | 26 ++++++++++++++++----------
>   include/hw/net/ne2000-isa.h |  2 --
>   2 files changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index c2bc3fa52d..4078d2d231 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -652,8 +652,11 @@ static void pc_init_ne2k_isa(ISABus *bus, NICInfo *nd)
>   {
>       static int nb_ne2k = 0;
>   
> -    if (nb_ne2k == NE2000_NB_MAX)
> +    if (nb_ne2k == NE2000_NB_MAX) {
> +        error_setg(&error_fatal,

In the context of dynamically created machines I'd rather have
this function,

> +                   "maximum number of ISA NE2000 devices exceeded");
>           return;
> +    }
>       isa_ne2000_init(bus, ne2000_io[nb_ne2k],
>                       ne2000_irq[nb_ne2k], nd);
>       nb_ne2k++;
> @@ -1291,23 +1294,26 @@ void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus,
>                    BusState *xen_bus)
>   {
>       MachineClass *mc = MACHINE_CLASS(pcmc);
> -    int i;
> +    bool default_is_ne2k = g_str_equal(mc->default_nic, TYPE_ISA_NE2000);
> +    NICInfo *nd;
>   
>       rom_set_order_override(FW_CFG_ORDER_OVERRIDE_NIC);
> -    for (i = 0; i < nb_nics; i++) {
> -        NICInfo *nd = &nd_table[i];
> -        const char *model = nd->model ? nd->model : mc->default_nic;
>   
> -        if (xen_bus && (!nd->model || g_str_equal(model, "xen-net-device"))) {
> +    if (xen_bus) {
> +        while (nc = qemu_find_nic_info("xen-net-device", true, NULL)) {
>               DeviceState *dev = qdev_new("xen-net-device");
>               qdev_set_nic_properties(dev, nd);
>               qdev_realize_and_unref(dev, xen_bus, &error_fatal);

and this one non-fatal (primarily for API example). But this is pending
on a discussion on another thread, see:
https://lore.kernel.org/qemu-devel/c1322f3b-2ae2-4ca7-9a76-a2a434dc8315@linaro.org/
so no changed requested so far.

> -        } else if (g_str_equal(model, "ne2k_isa")) {
> -            pc_init_ne2k_isa(isa_bus, nd);
> -        } else {
> -            pci_nic_init_nofail(nd, pci_bus, model, NULL);
>           }
>       }

Regards,

Phil.

