Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A3558CE96
	for <lists+xen-devel@lfdr.de>; Mon,  8 Aug 2022 21:33:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382566.617531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oL8Ub-00044L-2S; Mon, 08 Aug 2022 19:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382566.617531; Mon, 08 Aug 2022 19:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oL8Ua-00041L-W3; Mon, 08 Aug 2022 19:32:48 +0000
Received: by outflank-mailman (input) for mailman id 382566;
 Mon, 08 Aug 2022 19:32:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y+qk=YM=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oL8UY-0003s1-SQ
 for xen-devel@lists.xen.org; Mon, 08 Aug 2022 19:32:47 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e100601e-1750-11ed-bd2e-47488cf2e6aa;
 Mon, 08 Aug 2022 21:32:46 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id c17so14112413lfb.3
 for <xen-devel@lists.xen.org>; Mon, 08 Aug 2022 12:32:45 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 4-20020a05651c12c400b0025e53413b6dsm1451220lje.2.2022.08.08.12.32.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 12:32:44 -0700 (PDT)
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
X-Inumbo-ID: e100601e-1750-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ipnhp/Ii+AspFQv5rTlWkcDTE1Tq1YxQYf6J72n8Gbw=;
        b=UeBa1CkxRBrtHcOdthRkH+sus6U95dPvmYEOHt9EuXmXxrwo+l06uGlzLF4sUgTdLc
         NXbh3I/BuxxognUuGgY9uST0O6ywNwGvtBBYIdGlsGNXxEsEDS7HTOpjjOhusZ6U73ys
         qqx7fE3NvBk+0Ia5HXhaIG5RpySRNMkrOgKC28AqJLH9deinhPMp8hJgntOJlfNj2FBO
         Kj5mzrkvRlhOSRtSQbIwuoeCW/B+7GceWXIa6uYU5OMLgEB/1x0n0F+N/Dz585OWAv3g
         eZfdXR3Oxfo8u5sVP71cz4rw862vSD+cM8tqPihPgx6jou5BoZXi4XwnaJJcYk6WzZf4
         QxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ipnhp/Ii+AspFQv5rTlWkcDTE1Tq1YxQYf6J72n8Gbw=;
        b=JcfThDEug21e+clI2vw6i14iKGuZ4irPWkMgSB51kqQq2XZzTLwgyjpXOQ+V520Qh+
         04fghfpzAXeJcwWNCmecxlDiprypkEhSfvVr/UIHIXlRrk8SATpT3Z8Lcv+280tNaq5T
         GkQi6x9AMAzoBcUjuxBxAZZhoXxsikNcxqpX/CtB6nq4QAZp0hnnO4hbwndB7/Azy7Ba
         wWboz6dZUCNuvF25e7bVniFvVAedf0SkicI2hoSokJsOBlYDa8UdjWb26Dp/DtbOw2hh
         3Za8nrSOpCrDPJz1Ejqijsk4LajMquEPyzK+vpZ6vTIjKcchj2tPyjFgA1nIBrjvoJg5
         /hgA==
X-Gm-Message-State: ACgBeo1CMMweyT50guS9eAE0C147cmeY0Ie/5U2t7Y/iSA3nJH40QLop
	YNBdDKfstRKkidM5tfjH2Ns=
X-Google-Smtp-Source: AA6agR5wxhUDokBJPLRjwKEDrs6acNcGqnLmZVu//HDEeWCrA4Zg4fBPVEOmxXIiYFWuvLo3Be3P4A==
X-Received: by 2002:a05:6512:1083:b0:48b:a1bb:a8b4 with SMTP id j3-20020a056512108300b0048ba1bba8b4mr3362543lfg.342.1659987165442;
        Mon, 08 Aug 2022 12:32:45 -0700 (PDT)
Message-ID: <43fd61cf-b66f-b45a-c501-2b68e40c004a@gmail.com>
Date: Mon, 8 Aug 2022 22:32:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3 4/6] libxl: arm: Split make_virtio_mmio_node()
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
 <ae20b87d583b981302905059d157a03400cd8eb2.1659596139.git.viresh.kumar@linaro.org>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <ae20b87d583b981302905059d157a03400cd8eb2.1659596139.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 04.08.22 10:01, Viresh Kumar wrote:

Hello Viresh

> make_virtio_mmio_node() creates the DT node for simple MMIO devices
> currently, i.e. the ones that don't require any additional properties.
>
> In order to allow using it for other complex device types, split the
> functionality into two, one where the fdt node isn't closed and the
> other one to create a simple DT node.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>   tools/libs/light/libxl_arm.c | 24 ++++++++++++++----------
>   1 file changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 2f64b9f0ebee..6a8c4d042bd9 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -900,9 +900,8 @@ static int make_xen_iommu_node(libxl__gc *gc, void *fdt)
>       return 0;
>   }
>   
> -static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
> -                                 uint64_t base, uint32_t irq,
> -                                 uint32_t backend_domid)
> +static int make_virtio_mmio_node_common(libxl__gc *gc, void *fdt, uint64_t base,
> +                                        uint32_t irq)
>   {
>       int res;
>       gic_interrupt intr;
> @@ -922,7 +921,15 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
>       res = fdt_property_interrupts(gc, fdt, &intr, 1);
>       if (res) return res;
>   
> -    res = fdt_property(fdt, "dma-coherent", NULL, 0);
> +    return fdt_property(fdt, "dma-coherent", NULL, 0);
> +}
> +
> +static int make_virtio_mmio_node_simple(libxl__gc *gc, void *fdt, uint64_t base,
> +                                        uint32_t irq, uint32_t backend_domid)
> +{
> +    int res;
> +
> +    res = make_virtio_mmio_node_common(gc, fdt, base, irq);
>       if (res) return res;
>   
>       if (backend_domid != LIBXL_TOOLSTACK_DOMID) {
> @@ -935,10 +942,7 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
>           if (res) return res;
>       }
>   
> -    res = fdt_end_node(fdt);
> -    if (res) return res;
> -
> -    return 0;
> +    return fdt_end_node(fdt);
>   }
>   
>   static const struct arch_info *get_arch_info(libxl__gc *gc,
> @@ -1261,8 +1265,8 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
>                       iommu_created = true;
>                   }
>   
> -                FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq,
> -                                           disk->backend_domid) );
> +                FDT( make_virtio_mmio_node_simple(gc, fdt, disk->base,
> +                                            disk->irq, disk->backend_domid) );
>               }
>           }

[I failed to find a better place where to make a comment]


I think that the following chunk should be also moved to 
make_virtio_mmio_node_common() since it is not a virtio disk specific 
action, this "iommus" property pointing to "xen,grant-dma" IOMMU node is 
used to inform a guest that restricted memory access using Xen grant 
mappings needs to be enabled for the virtio device if it's backend is 
going to run in a non hardware domain, which I assume also applies for 
virtio i2c, etc.


     if (backend_domid != LIBXL_TOOLSTACK_DOMID) {
         uint32_t iommus_prop[2];

         iommus_prop[0] = cpu_to_fdt32(GUEST_PHANDLE_IOMMU);
         iommus_prop[1] = cpu_to_fdt32(backend_domid);

         res = fdt_property(fdt, "iommus", iommus_prop, 
sizeof(iommus_prop));
         if (res) return res;
     }


This means that "uint32_t backend_domid" should be also passed as 
argument to make_virtio_mmio_node_common()


Something like the diff on top of current patch below (not tested):

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index a98cfe708b..1a6ace3d8d 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -900,7 +900,7 @@ static int make_xen_iommu_node(libxl__gc *gc, void *fdt)
  }

  static int make_virtio_mmio_node_common(libxl__gc *gc, void *fdt, 
uint64_t base,
-                                        uint32_t irq)
+                                        uint32_t irq, uint32_t 
backend_domid)
  {
      int res;
      gic_interrupt intr;
@@ -920,15 +920,7 @@ static int make_virtio_mmio_node_common(libxl__gc 
*gc, void *fdt, uint64_t base,
      res = fdt_property_interrupts(gc, fdt, &intr, 1);
      if (res) return res;

-    return fdt_property(fdt, "dma-coherent", NULL, 0);
-}
-
-static int make_virtio_mmio_node_simple(libxl__gc *gc, void *fdt, 
uint64_t base,
-                                        uint32_t irq, uint32_t 
backend_domid)
-{
-    int res;
-
-    res = make_virtio_mmio_node_common(gc, fdt, base, irq);
+    res = fdt_property(fdt, "dma-coherent", NULL, 0);
      if (res) return res;

      if (backend_domid != LIBXL_TOOLSTACK_DOMID) {
@@ -941,6 +933,17 @@ static int make_virtio_mmio_node_simple(libxl__gc 
*gc, void *fdt, uint64_t base,
          if (res) return res;
      }

+    return res;
+}
+
+static int make_virtio_mmio_node_simple(libxl__gc *gc, void *fdt, 
uint64_t base,
+                                        uint32_t irq, uint32_t 
backend_domid)
+{
+    int res;
+
+    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
+    if (res) return res;
+
      return fdt_end_node(fdt);
  }


Other changes look good.


>   

-- 
Regards,

Oleksandr Tyshchenko


