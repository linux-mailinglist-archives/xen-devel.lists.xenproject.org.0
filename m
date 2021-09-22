Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA754414FB9
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 20:19:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193008.343790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT6pl-0004D3-76; Wed, 22 Sep 2021 18:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193008.343790; Wed, 22 Sep 2021 18:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT6pl-0004BG-3E; Wed, 22 Sep 2021 18:19:05 +0000
Received: by outflank-mailman (input) for mailman id 193008;
 Wed, 22 Sep 2021 18:19:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JCiA=OM=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mT6pk-0004BA-1g
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 18:19:04 +0000
Received: from mail-lf1-x12a.google.com (unknown [2a00:1450:4864:20::12a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c754cfad-bc99-4853-84a0-f393c54364a9;
 Wed, 22 Sep 2021 18:19:02 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id y28so15381574lfb.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Sep 2021 11:19:02 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id c4sm235296lfr.59.2021.09.22.11.18.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 11:19:00 -0700 (PDT)
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
X-Inumbo-ID: c754cfad-bc99-4853-84a0-f393c54364a9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=cdYrxpSpDGHg9um55NhNlBekvRpOeiukL4q9FZQajXE=;
        b=VxZbTzo5LCN+0LPMsq7iMB2RnKDBOTx91/hktHfmUT2o+FVy/DDIug+jd0g8S3WTQ3
         JSAwNZf861jfjtebX1b1rD9AmeI80niHcfOOR3lyFCEA97Avw32MX37wDuF5/SLeaB6U
         RHLl0kbOAMZlW7i9GjxpkL/jtIetxt5CJnM5I0PoL+M9tkShhHOUFyvUX3xhBpTozuzC
         TEClfbambtr5NcEYyaey+Yg4s5ruu2YGYAv4io4iWjnVOYkK7OjHXtr8X71WPdqMnHrC
         W9qH2/GaXNe4sYn6svmUMrifx/ZIfM1Rt93eCLXUrNiEu4qN3Vbs/GIojGt5/dIWgjW8
         XSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=cdYrxpSpDGHg9um55NhNlBekvRpOeiukL4q9FZQajXE=;
        b=GUgOUonp6OPXHUZDZudKPJxEShwKKOPCqZAt5gv9R6DQjyr9dI/cKLsJOZnG2fwlOQ
         sbeW0+16dYgHnmrxvIIoeuV7zymnbQi4avMnX0CSh+j5mFhgZlfd43LVj9eujhm47iDT
         ALqEm0bscx51cxxF0qEplnROa8PYuTi0dSzLDiZOJWcFDmHGFmD5Ou0ji3XB95fiVgl8
         BerUoC+yBhbmk14f8i5p3eNht+n+1pP+SJAwuG4+INYZf9CbCrn8urMrBXz2jAOoCfEf
         k2pvEc+cZPP99FQ4vqnYEYkyZZOxNz1aQ48MtFMVByO+GVNpnyLfpVw7W5GzrXw4kL/s
         0v1w==
X-Gm-Message-State: AOAM533QfdnniTjFkYXQj3hzpyNXfdqXJGwWg5uMd55U0QzwN7Q8UM5c
	TA0lLnMjwkqerUJlgfKHaok=
X-Google-Smtp-Source: ABdhPJxc70A3BpvdY40pWQ+iuxwUtdYUwY4Zz0aha42T6numlyxn29/up8j13uHPBX1JGalVPkNDeA==
X-Received: by 2002:a05:6512:455:: with SMTP id y21mr358847lfk.548.1632334740428;
        Wed, 22 Sep 2021 11:19:00 -0700 (PDT)
Subject: Re: [PATCH V2 2/3] xen/arm: Add handling of extended regions for Dom0
From: Oleksandr <olekstysh@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com>
 <1631297924-8658-3-git-send-email-olekstysh@gmail.com>
 <0a72559e-5742-dc33-1c8f-5903c50b27be@xen.org>
 <08294c53-109a-8544-3a23-85e034d2992d@gmail.com>
 <alpine.DEB.2.21.2109171451230.21985@sstabellini-ThinkPad-T480s>
 <a993466f-1b7d-ceb3-aa3b-16f5f145b2fb@gmail.com>
Message-ID: <a3f5707b-b161-1c94-ebe1-d6b8bbe11081@gmail.com>
Date: Wed, 22 Sep 2021 21:18:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a993466f-1b7d-ceb3-aa3b-16f5f145b2fb@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



Hi Stefano


[snip]


>>>
>>>
>>>>
>>>> You will also need to cover "ranges" that will describe the BARs 
>>>> for the PCI
>>>> devices.
>>> Good point.
>> Yes, very good point!
>>
>>
>>> Could you please clarify how to recognize whether it is a PCI
>>> device as long as PCI support is not merged? Or just to find any 
>>> device nodes
>>> with non-empty "ranges" property
>>> and retrieve addresses?
>> Normally any bus can have a ranges property with the aperture and
>> possible address translations, including /amba (compatible =
>> "simple-bus"). However, in these cases dt_device_get_address already
>> takes care of it, see xen/common/device_tree.c:dt_device_get_address.
>>
>> The PCI bus is special for 2 reasons:
>> - the ranges property has a different format
>> - the bus is hot-pluggable
>>
>> So I think the only one that we need to treat specially is PCI.
>>
>> As far as I am aware PCI is the only bus (or maybe just the only bus
>> that we support?) where ranges means the aperture.
> Thank you for the clarification. I need to find device node with 
> non-empty ranges property
> (and make sure that device_type property is "pci"), after that I need 
> to read the context of ranges property and translate it.
>
>

OK, I experimented with that and managed to parse ranges property for 
PCI host bridge node.

I tested on my setup where the host device tree contains two PCI host 
bridge nodes with the following:

pcie@fe000000 {
...
             ranges = <0x1000000 0x0 0x0 0x0 0xfe100000 0x0 0x100000 
0x2000000 0x0 0xfe200000 0x0 0xfe200000 0x0 0x200000 0x2000000 0x0 
0x30000000 0x0 0x30000000 0x0 0x8000000 0x42000000 0x0 0x38000000 0x0 
0x38000000 0x0 0x8000000>;
...
};

pcie@ee800000 {
...
             ranges = <0x1000000 0x0 0x0 0x0 0xee900000 0x0 0x100000 
0x2000000 0x0 0xeea00000 0x0 0xeea00000 0x0 0x200000 0x2000000 0x0 
0xc0000000 0x0 0xc0000000 0x0 0x8000000 0x42000000 0x0 0xc8000000 0x0 
0xc8000000 0x0 0x8000000>;
...
};

So Xen retrieves the *CPU addresses* from the ranges:

(XEN) dev /soc/pcie@fe000000 range_size 7 nr_ranges 4
(XEN) 0: addr=fe100000, size=100000
(XEN) 1: addr=fe200000, size=200000
(XEN) 2: addr=30000000, size=8000000
(XEN) 3: addr=38000000, size=8000000
(XEN) dev /soc/pcie@ee800000 range_size 7 nr_ranges 4
(XEN) 0: addr=ee900000, size=100000
(XEN) 1: addr=eea00000, size=200000
(XEN) 2: addr=c0000000, size=8000000
(XEN) 3: addr=c8000000, size=8000000

The code below covers ranges property in the context of finding memory 
holes (to be squashed with current patch):

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d37156a..7d20c10 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -834,6 +834,8 @@ static int __init find_memory_holes(struct meminfo 
*ext_regions)
      {
          unsigned int naddr;
          u64 addr, size;
+        const __be32 *ranges;
+        u32 len;

          naddr = dt_number_of_address(np);

@@ -857,6 +859,41 @@ static int __init find_memory_holes(struct meminfo 
*ext_regions)
                  goto out;
              }
          }
+
+        /*
+         * Also looking for non-empty ranges property which would 
likely mean
+         * that we deal with PCI host bridge device and the property here
+         * describes the BARs for the PCI devices.
+         */
+        ranges = dt_get_property(np, "ranges", &len);
+        if ( ranges && len )
+        {
+            unsigned int range_size, nr_ranges;
+            int na, ns, pna;
+
+            pna = dt_n_addr_cells(np);
+            na = dt_child_n_addr_cells(np);
+            ns = dt_child_n_size_cells(np);
+            range_size = pna + na + ns;
+            nr_ranges = len / sizeof(__be32) / range_size;
+
+            for ( i = 0; i < nr_ranges; i++, ranges += range_size )
+            {
+                /* Skip the child address and get the parent (CPU) 
address */
+                addr = dt_read_number(ranges + na, pna);
+                size = dt_read_number(ranges + na + pna, ns);
+
+                start = addr & PAGE_MASK;
+                end = PAGE_ALIGN(addr + size);
+                res = rangeset_remove_range(mem_holes, start, end - 1);
+                if ( res )
+                {
+                    printk(XENLOG_ERR "Failed to remove: 
%#"PRIx64"->%#"PRIx64"\n",
+                           start, end);
+                    goto out;
+                }
+            }
+        }
      }

      start = 0;



-- 
Regards,

Oleksandr Tyshchenko


