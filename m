Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E62F83DF2A
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 17:51:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672222.1045981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTPP3-0003Uc-9f; Fri, 26 Jan 2024 16:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672222.1045981; Fri, 26 Jan 2024 16:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTPP3-0003RU-6a; Fri, 26 Jan 2024 16:50:05 +0000
Received: by outflank-mailman (input) for mailman id 672222;
 Fri, 26 Jan 2024 16:50:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UtOA=JE=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1rTPP1-00036E-Pe
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 16:50:03 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f27cdc61-bc6a-11ee-8a43-1f161083a0e0;
 Fri, 26 Jan 2024 17:50:02 +0100 (CET)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-cDHrV5eLMVO7WMddoUGGLA-1; Fri, 26 Jan 2024 11:50:00 -0500
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7832c437dceso70879185a.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2024 08:49:59 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-176-119.web.vodafone.de.
 [109.43.176.119]) by smtp.gmail.com with ESMTPSA id
 w1-20020a05620a148100b0078322b61e88sm712978qkj.78.2024.01.26.08.49.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jan 2024 08:49:58 -0800 (PST)
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
X-Inumbo-ID: f27cdc61-bc6a-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706287801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0KfPDhHPOVpc4yilmMGil/qgHhNOxNfCayRNOJMvDwY=;
	b=JK2xBvr9xggmR5S5g9hcqzzFgAbuhAFhg6RAWJRXY/Af4KkP0MoiFozXVWFtvMuNEsbzs7
	aXe8YMSfH5EO4EZY8foLnD2p0KTrWL08QOXf74UcP3+6JCg5Gn16j5GH3vLYNjuFQvTdAH
	GgASyl9Tbj0C56h/KrIwxuC84D9Fs+I=
X-MC-Unique: cDHrV5eLMVO7WMddoUGGLA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706287799; x=1706892599;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0KfPDhHPOVpc4yilmMGil/qgHhNOxNfCayRNOJMvDwY=;
        b=Ihqo+1xO+c1p09j+C8kJSin/0NElXAwMpzRPrezkluXRgTa2/yoAdKTf1ApXxLIvKZ
         XayViDSMYDpZIKPC8xWs9kDGvceADU98ybGpKr+fPXgj2mZ4X1mtZKfVEgmPx2qrLcY4
         OxljIi2w/qCdAcjIAZM0GfrtV8UqLDVQ6vKY5VE/FdIq0FHNWEgrF0doE8/j2ZQzMcj9
         X5K+ntTsXK450DBaU9kl1MAIYpZwhaNPEbQD2O9Rub5mppPHCU4dxmLCpuXSLc41UDRN
         XmRlJrsU8SOixUAh5DWyZqHTfl+KAhQNkjrxuRZmd/t8UdZGm0UnLV9ivPh0FeeOcui3
         q88Q==
X-Gm-Message-State: AOJu0YywMwJSrCvC2hqMFrKotpJDc76u1wMNzHKoyb0rmY0F76nkydWF
	BIGccC0m0EJ/21/2f3Nj854COqwDfQnlFMHfEZwrzD492WnykZSmgfHjsy6ulxhVOcPO1HnAaX8
	726RuP6/qftSZXhb528AKJ6d+K6e8RgzP/f4EU+1bnAA6S2GYO8UOyqvLjXfcWheZ
X-Received: by 2002:a05:620a:5319:b0:783:3457:a7e5 with SMTP id oo25-20020a05620a531900b007833457a7e5mr14935qkn.53.1706287799504;
        Fri, 26 Jan 2024 08:49:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGphXDzpKcGUhfOPCNP0TPTVgL1hvzGVl/NturbUf/gHks7ulSbCd9UwbjzXETYsqnWuMLKTg==
X-Received: by 2002:a05:620a:5319:b0:783:3457:a7e5 with SMTP id oo25-20020a05620a531900b007833457a7e5mr14862qkn.53.1706287799171;
        Fri, 26 Jan 2024 08:49:59 -0800 (PST)
Message-ID: <580501eb-e6e2-49d7-8b12-667f4a24d260@redhat.com>
Date: Fri, 26 Jan 2024 17:49:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 45/46] net: remove qemu_show_nic_models(),
 qemu_find_nic_model()
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
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
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
References: <20240108204909.564514-1-dwmw2@infradead.org>
 <20240108204909.564514-46-dwmw2@infradead.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240108204909.564514-46-dwmw2@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/01/2024 21.27, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> These old functions can be removed now too. Let net_param_nic() print
> the full set of network devices directly, and also make it note that a
> list more specific to this platform/config will be available by using
> '-nic model=help' instead.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   include/net/net.h |  3 ---
>   net/net.c         | 39 ++++++---------------------------------
>   2 files changed, 6 insertions(+), 36 deletions(-)
> 
> diff --git a/include/net/net.h b/include/net/net.h
> index 1be8b40074..19fb82833c 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -203,9 +203,6 @@ void qemu_set_vnet_hdr_len(NetClientState *nc, int len);
>   int qemu_set_vnet_le(NetClientState *nc, bool is_le);
>   int qemu_set_vnet_be(NetClientState *nc, bool is_be);
>   void qemu_macaddr_default_if_unset(MACAddr *macaddr);
> -int qemu_show_nic_models(const char *arg, const char *const *models);
> -int qemu_find_nic_model(NICInfo *nd, const char * const *models,
> -                        const char *default_model);
>   NICInfo *qemu_find_nic_info(const char *typename, bool match_default,
>                               const char *alias);
>   bool qemu_configure_nic_device(DeviceState *dev, bool match_default,
> diff --git a/net/net.c b/net/net.c
> index ffd4b42d5a..09ab0889f5 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -977,38 +977,6 @@ GPtrArray *qemu_get_nic_models(const char *device_type)
>       return nic_models;
>   }
>   
> -int qemu_show_nic_models(const char *arg, const char *const *models)
> -{
> -    int i;
> -
> -    if (!arg || !is_help_option(arg)) {
> -        return 0;
> -    }
> -
> -    printf("Available NIC models:\n");
> -    for (i = 0 ; models[i]; i++) {
> -        printf("%s\n", models[i]);
> -    }
> -    return 1;
> -}
> -
> -int qemu_find_nic_model(NICInfo *nd, const char * const *models,
> -                        const char *default_model)
> -{
> -    int i;
> -
> -    if (!nd->model)
> -        nd->model = g_strdup(default_model);
> -
> -    for (i = 0 ; models[i]; i++) {
> -        if (strcmp(nd->model, models[i]) == 0)
> -            return i;
> -    }
> -
> -    error_report("Unsupported NIC model: %s", nd->model);
> -    return -1;
> -}
> -
>   static int net_init_nic(const Netdev *netdev, const char *name,
>                           NetClientState *peer, Error **errp)
>   {
> @@ -1791,9 +1759,14 @@ static int net_param_nic(void *dummy, QemuOpts *opts, Error **errp)
>           }
>           if (is_help_option(type)) {
>               GPtrArray *nic_models = qemu_get_nic_models(TYPE_DEVICE);
> +            int i;
>               show_netdevs();
>               printf("\n");
> -            qemu_show_nic_models(type, (const char **)nic_models->pdata);
> +            printf("Supported NIC models "

Can we please keep "Available" instead of "Supported" ? ... since not each 
NIC is supported on each machine type...

  Thomas


> +                   "(use -nic model=help for a filtered list):\n");
> +            for (i = 0 ; nic_models->pdata[i]; i++) {
> +                printf("%s\n", (char *)nic_models->pdata[i]);
> +            }
>               g_ptr_array_free(nic_models, true);
>               exit(0);
>           }


