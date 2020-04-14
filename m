Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB711A8C16
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 22:15:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jORx5-0005jp-Os; Tue, 14 Apr 2020 20:14:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LnnE=56=gmail.com=tcminyard@srs-us1.protection.inumbo.net>)
 id 1jORx4-0005jk-Jw
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 20:14:34 +0000
X-Inumbo-ID: 8df98808-7e8c-11ea-b4f4-bc764e2007e4
Received: from mail-ot1-x341.google.com (unknown [2607:f8b0:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8df98808-7e8c-11ea-b4f4-bc764e2007e4;
 Tue, 14 Apr 2020 20:14:33 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id w12so982430otm.13
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2020 13:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=mLX84IN8sSpaz92RYC0ANtzxCMitNAqA4sbOvVucjpo=;
 b=mJCoiUdYoRM7BsTum32ML7Agu0C4P6FMxUYLKjEPjtiYcybq6tW8iSggBcahXP7d4R
 bnGktvqFGsWgmRhQ54tR1Xq4VyiJSPT5VPPCZcTIykTgRLBauHjLUz3348id95hsjBDQ
 HD7zQGNVP8E2qTJd0b1Ulx9/eQT/0/tQdB4pfuLzNc4+OdxNW9A8GMtcM8Q0IF7RHZB1
 eK9FD5t+d7jRB/XFNKVSa0fviAZIeiSdIxfYNUILsQtPptIQbqGQxAGCyellpbPiuUpF
 D4TogO5XxC8oRyWymadXWPm7COV0+404o94OEIhtwcvoe9R5vDFHdgZqbqjQ0iwTIMdy
 vFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=mLX84IN8sSpaz92RYC0ANtzxCMitNAqA4sbOvVucjpo=;
 b=PI7kpZAzItiAdy7KyhQjZ+Shgy2xeTBjs3uD8s1Y2hGon3PPwNlrB075/gbpGJZzmJ
 t7c4yi/gTAAc23IFB0yvukOlU65BQV9JZbT1CVpgHw9+zpuv8GHg430kvSlxnedQA1jU
 Nx3hskWwRrNalcI7uTm3JWhMHLRYY7x7QXn+U4aKRUWE3gukEfOLAf6NGT0xaVbPTxKk
 xILOsIG3fQ2F1zD04313XgMqLa7wEsRb4TqVO8WDtXTjfwsTKlkHI4fV9I/6x3X5UAyO
 Kw/RaJFHwhcQKUVckS/V6Ga7Relb6YLEQLFa3PNFU76oEuv7XVslD+Avho3qD5DplstQ
 ePwg==
X-Gm-Message-State: AGi0PuY9kxWng0qRXZjlGEQKGgdIsyZC/GFoW5NjFdzICk7V/s/UaaVG
 47idgIlI5gw8oEAusGH0Zg==
X-Google-Smtp-Source: APiQypIGoB5Eyg4ncuNb2evXXz4/xw4fG+Pdl2xoScwF5fOGf3jkrfXAflVNWOGomQiIqihkGDqf0Q==
X-Received: by 2002:a9d:5512:: with SMTP id l18mr17601512oth.186.1586895272555; 
 Tue, 14 Apr 2020 13:14:32 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id i7sm5800480otl.12.2020.04.14.13.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 13:14:31 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:8b39:c3f3:f502:5c4e])
 by serve.minyard.net (Postfix) with ESMTPSA id 98082181888;
 Tue, 14 Apr 2020 20:14:30 +0000 (UTC)
Date: Tue, 14 Apr 2020 15:14:29 -0500
From: Corey Minyard <minyard@acm.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-5.1 2/3] various: Remove unnecessary OBJECT() cast
Message-ID: <20200414201429.GI3587@minyard.net>
References: <20200412210954.32313-1-f4bug@amsat.org>
 <20200412210954.32313-3-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200412210954.32313-3-f4bug@amsat.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: minyard@acm.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Apr 12, 2020 at 11:09:53PM +0200, Philippe Mathieu-Daudé wrote:
> The OBJECT() macro is defined as:
> 
>   #define OBJECT(obj) ((Object *)(obj))
> 
> Remove unnecessary OBJECT() casts.

For ipmi change:

Acked-by: Corey Minyard <cminyard@mvista.com>

> 
> Patch created mechanically using spatch with this script:
> 
>   @@
>   typedef Object;
>   Object *o;
>   @@
>   -   OBJECT(o)
>   +   o
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/core/bus.c                       | 2 +-
>  hw/ide/ahci-allwinner.c             | 2 +-
>  hw/ipmi/smbus_ipmi.c                | 2 +-
>  hw/microblaze/petalogix_ml605_mmu.c | 8 ++++----
>  hw/s390x/sclp.c                     | 2 +-
>  monitor/misc.c                      | 3 +--
>  qom/object.c                        | 4 ++--
>  7 files changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/core/bus.c b/hw/core/bus.c
> index 3dc0a825f0..4ea5870de8 100644
> --- a/hw/core/bus.c
> +++ b/hw/core/bus.c
> @@ -25,7 +25,7 @@
>  
>  void qbus_set_hotplug_handler(BusState *bus, Object *handler, Error **errp)
>  {
> -    object_property_set_link(OBJECT(bus), OBJECT(handler),
> +    object_property_set_link(OBJECT(bus), handler,
>                               QDEV_HOTPLUG_HANDLER_PROPERTY, errp);
>  }
>  
> diff --git a/hw/ide/ahci-allwinner.c b/hw/ide/ahci-allwinner.c
> index bb8393d2b6..8536b9eb5a 100644
> --- a/hw/ide/ahci-allwinner.c
> +++ b/hw/ide/ahci-allwinner.c
> @@ -90,7 +90,7 @@ static void allwinner_ahci_init(Object *obj)
>      SysbusAHCIState *s = SYSBUS_AHCI(obj);
>      AllwinnerAHCIState *a = ALLWINNER_AHCI(obj);
>  
> -    memory_region_init_io(&a->mmio, OBJECT(obj), &allwinner_ahci_mem_ops, a,
> +    memory_region_init_io(&a->mmio, obj, &allwinner_ahci_mem_ops, a,
>                            "allwinner-ahci", ALLWINNER_AHCI_MMIO_SIZE);
>      memory_region_add_subregion(&s->ahci.mem, ALLWINNER_AHCI_MMIO_OFF,
>                                  &a->mmio);
> diff --git a/hw/ipmi/smbus_ipmi.c b/hw/ipmi/smbus_ipmi.c
> index 2a9470d9df..f1a0148755 100644
> --- a/hw/ipmi/smbus_ipmi.c
> +++ b/hw/ipmi/smbus_ipmi.c
> @@ -329,7 +329,7 @@ static void smbus_ipmi_init(Object *obj)
>  {
>      SMBusIPMIDevice *sid = SMBUS_IPMI(obj);
>  
> -    ipmi_bmc_find_and_link(OBJECT(obj), (Object **) &sid->bmc);
> +    ipmi_bmc_find_and_link(obj, (Object **) &sid->bmc);
>  }
>  
>  static void smbus_ipmi_get_fwinfo(struct IPMIInterface *ii, IPMIFwInfo *info)
> diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
> index 0a2640c40b..52dcea9abd 100644
> --- a/hw/microblaze/petalogix_ml605_mmu.c
> +++ b/hw/microblaze/petalogix_ml605_mmu.c
> @@ -150,9 +150,9 @@ petalogix_ml605_init(MachineState *machine)
>      qdev_set_nic_properties(eth0, &nd_table[0]);
>      qdev_prop_set_uint32(eth0, "rxmem", 0x1000);
>      qdev_prop_set_uint32(eth0, "txmem", 0x1000);
> -    object_property_set_link(OBJECT(eth0), OBJECT(ds),
> +    object_property_set_link(OBJECT(eth0), ds,
>                               "axistream-connected", &error_abort);
> -    object_property_set_link(OBJECT(eth0), OBJECT(cs),
> +    object_property_set_link(OBJECT(eth0), cs,
>                               "axistream-control-connected", &error_abort);
>      qdev_init_nofail(eth0);
>      sysbus_mmio_map(SYS_BUS_DEVICE(eth0), 0, AXIENET_BASEADDR);
> @@ -163,9 +163,9 @@ petalogix_ml605_init(MachineState *machine)
>      cs = object_property_get_link(OBJECT(eth0),
>                                    "axistream-control-connected-target", NULL);
>      qdev_prop_set_uint32(dma, "freqhz", 100 * 1000000);
> -    object_property_set_link(OBJECT(dma), OBJECT(ds),
> +    object_property_set_link(OBJECT(dma), ds,
>                               "axistream-connected", &error_abort);
> -    object_property_set_link(OBJECT(dma), OBJECT(cs),
> +    object_property_set_link(OBJECT(dma), cs,
>                               "axistream-control-connected", &error_abort);
>      qdev_init_nofail(dma);
>      sysbus_mmio_map(SYS_BUS_DEVICE(dma), 0, AXIDMA_BASEADDR);
> diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
> index f0c35aa57a..bae9d2350f 100644
> --- a/hw/s390x/sclp.c
> +++ b/hw/s390x/sclp.c
> @@ -288,7 +288,7 @@ void s390_sclp_init(void)
>  
>      object_property_add_child(qdev_get_machine(), TYPE_SCLP, new,
>                                NULL);
> -    object_unref(OBJECT(new));
> +    object_unref(new);
>      qdev_init_nofail(DEVICE(new));
>  }
>  
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 6c45fa490f..57af5fa5a4 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -1839,8 +1839,7 @@ void object_add_completion(ReadLineState *rs, int nb_args, const char *str)
>  static int qdev_add_hotpluggable_device(Object *obj, void *opaque)
>  {
>      GSList **list = opaque;
> -    DeviceState *dev = (DeviceState *)object_dynamic_cast(OBJECT(obj),
> -                                                          TYPE_DEVICE);
> +    DeviceState *dev = (DeviceState *)object_dynamic_cast(obj, TYPE_DEVICE);
>  
>      if (dev == NULL) {
>          return 0;
> diff --git a/qom/object.c b/qom/object.c
> index 1812f79224..9893cc5459 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -762,7 +762,7 @@ Object *object_new_with_propv(const char *typename,
>          }
>      }
>  
> -    object_unref(OBJECT(obj));
> +    object_unref(obj);
>      return obj;
>  
>   error:
> @@ -1689,7 +1689,7 @@ void object_property_add_child(Object *obj, const char *name,
>          return;
>      }
>  
> -    type = g_strdup_printf("child<%s>", object_get_typename(OBJECT(child)));
> +    type = g_strdup_printf("child<%s>", object_get_typename(child));
>  
>      op = object_property_add(obj, name, type, object_get_child_property, NULL,
>                               object_finalize_child_property, child, &local_err);
> -- 
> 2.21.1
> 

