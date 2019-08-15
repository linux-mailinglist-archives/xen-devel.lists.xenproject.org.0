Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB34F8F114
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 18:42:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyInD-00028I-RB; Thu, 15 Aug 2019 16:40:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sCuO=WL=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hyInC-0001zW-7g
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 16:40:02 +0000
X-Inumbo-ID: 52bf7142-bf7b-11e9-a661-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52bf7142-bf7b-11e9-a661-bc764e2007e4;
 Thu, 15 Aug 2019 16:40:00 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id c9so2074730lfh.4
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2019 09:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=Eb2lINdJWrbY6BPJRIBuVUJFXnELwxRICIiRVRaIaSk=;
 b=E/HlJvz3mydgKwOSNEZoBtfLSBOo54gsMMwHPrqFx3awBqZgml/LtC8bczVQoRFQ6o
 j3CUcItNb+gtM0hdWlByYrVlutSkZPX6UKDu/1VZtni/OpjWlEB0bedmnsWC0FZ6R57n
 GQvCmzNEFxN1eV1ytGmisMpneTlwGXYMrn3ay+wnRsRPqjc8ttd5np48brbZkeeLJstD
 oZd1kRT5IKNMAwoczofj637Genyivx57mwJkAfeLS3ro4/LY4PWWEFt2ybU3PpNSjBFD
 WtUgDdVQYnw2wLNueVNVO660wKM2PpMXBwTHMPCadpUpcx+SGkUg5Lco5blOBP1gcuNH
 XzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=Eb2lINdJWrbY6BPJRIBuVUJFXnELwxRICIiRVRaIaSk=;
 b=VUnMkkvztrXJ+HFNfVSG7Vo3ZpJDxbmjrsXzhpJzC1Y7+atAnb8/WKhljSXPcwZqua
 QaeTgaO3MfneXVEZldcNpxUNCO6KVcgPSDWbnYM5I4hAjAiI49xlnTBhH55y4tA5OlGS
 39jQLHW2lx5cAo1VF/T2DacKYH3Ph/W/7wyGGGiWFVTjM3SZ5I6gvPYdF1lwfKbLkCgW
 aktjIU2q8NxysFzcm2BLVXDdwvkyJkg6QTfSuXFgC5fwF+dVd++amx7znbiQo+dsZYnb
 v/eAGzq6Lcd9VEBc9I8vfkCMGRXNAeGa6F6DawTZZzs4qLNB+veQE90eYCLvYg73dqI7
 x57w==
X-Gm-Message-State: APjAAAVViXb/XwcgoB6JkJQ9e4uLR/7/pRH/S+QvjORLA0m/FkJF/3ZN
 jm/zMUL4qriZPRP1M9mt1Cy6FE+F
X-Google-Smtp-Source: APXvYqx4jTGY+tbLtuHJntemGWczbqtDNhED5au+JLtxgJr452Y2Ot7iJtv4N9EQftIL71CtEiBziw==
X-Received: by 2002:a19:914c:: with SMTP id y12mr2827646lfj.108.1565887199560; 
 Thu, 15 Aug 2019 09:39:59 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id y5sm522098lfy.59.2019.08.15.09.39.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Aug 2019 09:39:58 -0700 (PDT)
From: Oleksandr <olekstysh@gmail.com>
To: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-3-git-send-email-olekstysh@gmail.com>
 <3c6d54f2-06ad-6bd1-447b-0e4cbef3d391@arm.com>
 <8626bea6-cec3-128a-3b7a-b4c1542a659a@gmail.com>
 <7101e744-784b-9b89-3a90-e748ff03a02d@arm.com>
 <6119cff5-b39a-3782-18d9-f6e51c57ac37@gmail.com>
 <74e0b656-a6a1-d0c6-3cb2-e32d552d42c8@arm.com>
 <alpine.DEB.2.21.1908141208300.8737@sstabellini-ThinkPad-T480s>
 <becf5395-56cd-ccc6-4931-0e3854532ac8@arm.com>
 <44ba5fba-48c3-f352-510c-fc0d8ada181a@arm.com>
 <b8a98f17-4f10-8a2d-2223-7bfd520e7a77@gmail.com>
Message-ID: <39c5a11f-ee2b-ca7c-7f42-0e1a6e581bb9@gmail.com>
Date: Thu, 15 Aug 2019 19:39:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b8a98f17-4f10-8a2d-2223-7bfd520e7a77@gmail.com>
Content-Type: multipart/mixed; boundary="------------10ED972A4684BDE392685928"
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 2/6] iommu/arm: Add ability to handle
 deferred probing request
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
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--------------10ED972A4684BDE392685928
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi, Julien


>
>> I noticed there was already a panic() in iommu_setup() just in case 
>> the user
>> force the use of IOMMU but they were not initialized. I was 
>> half-tempted to set
>> iommu_force to true for Arm, but I think this is a different issue.
>>
>> So here my take (not tested nor compiled).
>
> Thank you. I will check it and come back with results.

I have preliminary tested it with my IPMMU series including new 
modification of "deferred probing" patch (attached). Being honest my 
series is not based on the *current* staging, but not too outdated.

So, your patch works as expected in the following scenarios:

1. [No panic] Without IOMMU driver in Xen (#CONFIG_IPMMU_VMSA is not set).

2. [No panic] IOMMU driver is present, but reports it is cannot be used 
in Xen (P2M sharing not supported, etc) by returning -ENODEV.

3. [No panic] IOMMU is globally disabled in command line "iommu=0".

4. [No panic] IOMMU driver requests deferred probing until the last 
device in DT is initialized, after that all deferred devices get 
initialized.

5. [Panic] IOMMU driver returns an error (other than -EBADF and -ENODEV) 
at the very beginning/when a part of devices are already initialized.

6. [Panic] IOMMU driver always returns deferred probing/returns an error 
other than -EAGAIN after deferred probing.


>>
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index 2c5d1372c0..8f94f618b0 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -755,6 +755,7 @@ void __init start_xen(unsigned long 
>> boot_phys_offset,
>>           .max_grant_frames = gnttab_dom0_frames(),
>>           .max_maptrack_frames = opt_max_maptrack_frames,
>>       };
>> +    int rc;
>>         dcache_line_bytes = read_dcache_line_bytes();
>>   @@ -890,7 +891,9 @@ void __init start_xen(unsigned long 
>> boot_phys_offset,
>>         setup_virt_paging();
>>   -    iommu_setup();
>> +    rc = iommu_setup();
>> +    if ( !iommu_enabled && rc != -ENODEV )
>> +        panic("Couldn't configure correctly all the IOMMUs.");

"\n" should be added.



-- 
Regards,

Oleksandr Tyshchenko


--------------10ED972A4684BDE392685928
Content-Type: text/x-patch;
 name="0001-iommu-arm-Add-ability-to-handle-deferred-probing-req.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-iommu-arm-Add-ability-to-handle-deferred-probing-req.pa";
 filename*1="tch"

From ff0af4d3d332a4b7b1b9b7edd4dbd1b3a263cb70 Mon Sep 17 00:00:00 2001
From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Date: Thu, 15 Aug 2019 16:56:04 +0300
Subject: [PATCH] iommu/arm: Add ability to handle deferred probing request

This patch adds minimal required support to General IOMMU framework
to be able to handle a case when IOMMU driver requesting deferred
probing for a device.

In order not to pull Linux's error code (-EPROBE_DEFER) to Xen
we have chosen -EAGAIN to be used for indicating that device
probing is deferred.

This is needed for the upcoming IPMMU driver which may request
deferred probing depending on what device will be probed the first
(there is some dependency between these devices, Root device must be
registered before Cache devices. If not the case, driver will deny
further Cache device probes until Root device is registered).
As we can't guarantee a fixed pre-defined order for the device nodes
in DT, we need to be ready for the situation where devices being
probed in "any" order.

While here, order the headers alphabetically.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Changes V2 -> V3:
    - removed deferred_probe field from struct dt_device_node,
      re-used domain_list instead
    - documented domain_list usage
    - added ASSERT to check that np->domain_list is empty
      before re-using it
    - put deferred_probe_list to init section
    - used more strict logic regarding processing devices in
      the deferred list
    - added more comments to code
    - put headers in alphabetical order
---
 xen/drivers/passthrough/arm/iommu.c | 55 ++++++++++++++++++++++++++++++++++---
 xen/include/asm-arm/device.h        |  6 +++-
 xen/include/xen/device_tree.h       |  7 +++++
 3 files changed, 63 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/passthrough/arm/iommu.c b/xen/drivers/passthrough/arm/iommu.c
index f8bb2c3..8569d2e 100644
--- a/xen/drivers/passthrough/arm/iommu.c
+++ b/xen/drivers/passthrough/arm/iommu.c
@@ -15,11 +15,20 @@
  * GNU General Public License for more details.
  */
 
-#include <xen/lib.h>
-#include <xen/iommu.h>
 #include <xen/device_tree.h>
+#include <xen/iommu.h>
+#include <xen/lib.h>
+
 #include <asm/device.h>
 
+/*
+ * Deferred probe list is used to keep track of devices for which driver
+ * requested deferred probing (returned -EAGAIN).
+ *
+ * We re-use device's domain_list to link the device in the deferred list.
+ */
+static __initdata LIST_HEAD(deferred_probe_list);
+
 static const struct iommu_ops *iommu_ops;
 
 const struct iommu_ops *iommu_get_ops(void)
@@ -42,7 +51,7 @@ void __init iommu_set_ops(const struct iommu_ops *ops)
 
 int __init iommu_hardware_setup(void)
 {
-    struct dt_device_node *np;
+    struct dt_device_node *np, *tmp;
     int rc;
     unsigned int num_iommus = 0;
 
@@ -51,6 +60,17 @@ int __init iommu_hardware_setup(void)
         rc = device_init(np, DEVICE_IOMMU, NULL);
         if ( !rc )
             num_iommus++;
+        else if ( rc == -EAGAIN )
+        {
+            /* We expect nobody uses domain_list at such early stage. */
+            ASSERT(list_empty(&np->domain_list));
+
+            /*
+             * Driver requested deferred probing, so add this device to
+             * the deferred list for further processing.
+             */
+            list_add(&np->domain_list, &deferred_probe_list);
+        }
         /*
          * Ignore the following error codes:
          *   - EBADF: Indicate the current is not an IOMMU
@@ -60,7 +80,34 @@ int __init iommu_hardware_setup(void)
             return rc;
     }
 
-    return ( num_iommus > 0 ) ? 0 : -ENODEV;
+    rc = ( num_iommus > 0 ) ? 0 : -ENODEV;
+
+    /*
+     * Process devices in the deferred list if it is not empty and at least one
+     * successfully probed device is present. Check that at least one device
+     * is added at each loop, otherwise we may get an infinite loop. Also stop
+     * processing if we got an error other than -EAGAIN.
+     */
+    while ( !list_empty(&deferred_probe_list) && num_iommus )
+    {
+        num_iommus = 0;
+
+        list_for_each_entry_safe ( np, tmp, &deferred_probe_list, domain_list )
+        {
+            rc = device_init(np, DEVICE_IOMMU, NULL);
+            if ( !rc )
+            {
+                num_iommus++;
+
+                /* Remove successfully probed device from the deferred list. */
+                list_del_init(&np->domain_list);
+            }
+            else if ( rc != -EAGAIN )
+                return rc;
+        }
+    }
+
+    return rc;
 }
 
 void __hwdom_init arch_iommu_check_autotranslated_hwdom(struct domain *d)
diff --git a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
index 63a0f36..ee1c3bc 100644
--- a/xen/include/asm-arm/device.h
+++ b/xen/include/asm-arm/device.h
@@ -44,7 +44,11 @@ struct device_desc {
     enum device_class class;
     /* List of devices supported by this driver */
     const struct dt_device_match *dt_match;
-    /* Device initialization */
+    /*
+     * Device initialization.
+     *
+     * -EAGAIN is used to indicate that device probing is deferred.
+     */
     int (*init)(struct dt_device_node *dev, const void *data);
 };
 
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index e1ec6cb..60ae99c 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -92,6 +92,13 @@ struct dt_device_node {
 
     /* IOMMU specific fields */
     bool is_protected;
+    /*
+     * The main purpose of this list node is to link the structure in the list
+     * of devices assigned to domain.
+     *
+     * Boot code (iommu_hardware_setup) re-uses this list to link the structure
+     * in the list of devices for which driver requested deferred probing.
+     */
     struct list_head domain_list;
 
     struct device dev;
-- 
2.7.4


--------------10ED972A4684BDE392685928
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------10ED972A4684BDE392685928--

