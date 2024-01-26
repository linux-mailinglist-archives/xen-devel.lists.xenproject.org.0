Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B0383D911
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 12:11:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671940.1045493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTK6W-0003Gf-BC; Fri, 26 Jan 2024 11:10:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671940.1045493; Fri, 26 Jan 2024 11:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTK6W-0003F4-7R; Fri, 26 Jan 2024 11:10:36 +0000
Received: by outflank-mailman (input) for mailman id 671940;
 Fri, 26 Jan 2024 11:10:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UtOA=JE=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1rTK6U-0003Ey-Ue
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 11:10:34 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84bde023-bc3b-11ee-98f5-efadbce2ee36;
 Fri, 26 Jan 2024 12:10:32 +0100 (CET)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-WrQ4OGVdMTqJnQnOn4APmg-1; Fri, 26 Jan 2024 06:10:30 -0500
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6800e52d47aso33491776d6.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2024 03:10:30 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-176-119.web.vodafone.de.
 [109.43.176.119]) by smtp.gmail.com with ESMTPSA id
 mu3-20020a056214328300b006869d54c818sm11603qvb.109.2024.01.26.03.10.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jan 2024 03:10:28 -0800 (PST)
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
X-Inumbo-ID: 84bde023-bc3b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706267431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=v2/lmMXltQRLNYt6P2ilUAPc0Q3BMq0DxuQOWysRNdo=;
	b=Fs4ZRu9NaHPg4cFCp7cRe5bJVf1xNezs/GDaHERnftaNaXCt00brlPaBDT864UlH+CxTvF
	iIo31Ll8Owf99mxnhanstvtSv7xFD1IuoOoTFdEUrnJgySn6t3bMauHEJ4W2BRCc+4xOVV
	ue/xDqQGzZal4jvU29WhKn77N547VGI=
X-MC-Unique: WrQ4OGVdMTqJnQnOn4APmg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706267429; x=1706872229;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v2/lmMXltQRLNYt6P2ilUAPc0Q3BMq0DxuQOWysRNdo=;
        b=kARhZSjQ9W8yGUfUDQbt8OUAIDoUHkVF9LSDQTXTfu83dLOrhsPk6cixJEmfmROlAa
         H5x/dIOxAXOloDTX0LjE0xZldE7iUazc4jVjIgv4TIROtEqcCCamAGJsGe/LdTlzKAb6
         xmKT1slaXNE+beblEas4CwXl2oXbyr/46O/111obCGvJ1osGvUzCuWKngFazSEa1o+0S
         veV251dThe85Un5iJtVHM85FpnygvYz9ykv0Vb5hO7VvHHOq09Kbu0mwE8KhqpyCyTvY
         9A9gk8HWyOSxW5sYKY979VSBnGoqorIl17J1Jcd97+4+Q6X2XGB7JKo3/PtYS1lq4jq8
         esZg==
X-Gm-Message-State: AOJu0YzVj3WR2Or5rHdWLFoJTvvrc+jbATRqq1yyRiWJo7uENX675SSC
	aqyMPOCy/rUcQt3O8oTq9wY+lUcy46cwswJdgCNDE4W2ljxTT7u2EcCcNj2TS7sGnz5Wq7Lcn9r
	fG8MnZWqGND1dzPmQnAd5gcpTcZ7qUSvf9BLXkwK/KQ/MTgh2/QSFiQZ4/EwAB0Pl
X-Received: by 2002:a0c:b341:0:b0:681:132c:8b8e with SMTP id a1-20020a0cb341000000b00681132c8b8emr1235229qvf.46.1706267429636;
        Fri, 26 Jan 2024 03:10:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExh71HXG5OQTQJ658GxmPXTaBWNJQ1JNeXo3zpX4HUYj9y/kYObKvL/nmUj6LeMZaJG5o+SA==
X-Received: by 2002:a0c:b341:0:b0:681:132c:8b8e with SMTP id a1-20020a0cb341000000b00681132c8b8emr1235181qvf.46.1706267429300;
        Fri, 26 Jan 2024 03:10:29 -0800 (PST)
Message-ID: <9218c20b-8ba8-402b-bea5-856cb51156dc@redhat.com>
Date: Fri, 26 Jan 2024 12:10:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/46] net: add qemu_{configure, create}_nic_device(),
 qemu_find_nic_info()
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
 <20240108204909.564514-2-dwmw2@infradead.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240108204909.564514-2-dwmw2@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/01/2024 21.26, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Most code which directly accesses nd_table[] and nb_nics uses them for
> one of two things. Either "I have created a NIC device and I'd like a
> configuration for it", or "I will create a NIC device *if* there is a
> configuration for it".  With some variants on the theme around whether
> they actually *check* if the model specified in the configuration is
> the right one.
> 
> Provide functions which perform both of those, allowing platforms to
> be a little more consistent and as a step towards making nd_table[]
> and nb_nics private to the net code.
> 
> Also export the qemu_find_nic_info() helper, as some platforms have
> special cases they need to handle.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
>   include/net/net.h |  7 ++++++-
>   net/net.c         | 51 +++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 57 insertions(+), 1 deletion(-)
> 
> diff --git a/include/net/net.h b/include/net/net.h
> index ffbd2c8d56..25ea83fd12 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -207,7 +207,12 @@ int qemu_show_nic_models(const char *arg, const char *const *models);
>   void qemu_check_nic_model(NICInfo *nd, const char *model);
>   int qemu_find_nic_model(NICInfo *nd, const char * const *models,
>                           const char *default_model);
> -
> +NICInfo *qemu_find_nic_info(const char *typename, bool match_default,
> +                            const char *alias);
> +bool qemu_configure_nic_device(DeviceState *dev, bool match_default,
> +                               const char *alias);
> +DeviceState *qemu_create_nic_device(const char *typename, bool match_default,
> +                                    const char *alias);
>   void print_net_client(Monitor *mon, NetClientState *nc);
>   void net_socket_rs_init(SocketReadState *rs,
>                           SocketReadStateFinalize *finalize,
> diff --git a/net/net.c b/net/net.c
> index 0520bc1681..aeb7f573fc 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1087,6 +1087,57 @@ static int net_init_nic(const Netdev *netdev, const char *name,
>       return idx;
>   }
>   
> +NICInfo *qemu_find_nic_info(const char *typename, bool match_default,
> +                            const char *alias)
> +{
> +    NICInfo *nd;
> +    int i;
> +
> +    for (i = 0; i < nb_nics; i++) {
> +        nd = &nd_table[i];
> +
> +        if (!nd->used || nd->instantiated) {
> +            continue;
> +        }
> +
> +        if ((match_default && !nd->model) || !g_strcmp0(nd->model, typename)
> +            || (alias && !g_strcmp0(nd->model, alias))) {
> +            return nd;
> +        }
> +    }
> +    return NULL;
> +}
> +
> +
> +/* "I have created a device. Please configure it if you can" */
> +bool qemu_configure_nic_device(DeviceState *dev, bool match_default,
> +                               const char *alias)
> +{
> +    NICInfo *nd = qemu_find_nic_info(object_get_typename(OBJECT(dev)),
> +                                     match_default, alias);
> +
> +    if (nd) {
> +        qdev_set_nic_properties(dev, nd);
> +        return true;
> +    }
> +    return false;
> +}
> +
> +/* "Please create a device, if you have a configuration for it" */
> +DeviceState *qemu_create_nic_device(const char *typename, bool match_default,
> +                                    const char *alias)
> +{
> +    NICInfo *nd = qemu_find_nic_info(typename, match_default, alias);
> +    DeviceState *dev;
> +
> +    if (!nd) {
> +        return NULL;
> +    }

The qemu_check_nic_model() function that was used in some code that you 
turned into qemu_create_nic_device() used to set:

     if (!nd->model)
         nd->model = g_strdup(default_model);

(in the qemu_find_nic_model() function that has been called by 
qemu_check_nic_model())

Should we do that also here to make sure that nd->model is not NULL afterwards?

(same question likely applies to qemu_configure_nic_device() )

Apart from that, the patch looks fine to me.

  Thomas

> +    dev = qdev_new(typename);
> +    qdev_set_nic_properties(dev, nd);
> +    return dev;
> +}
>   
>   static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
>       const Netdev *netdev,


