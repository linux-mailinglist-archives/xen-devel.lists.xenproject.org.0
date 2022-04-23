Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 567CE50C7E4
	for <lists+xen-devel@lfdr.de>; Sat, 23 Apr 2022 09:06:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311440.528661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ni9ph-0003CF-8H; Sat, 23 Apr 2022 07:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311440.528661; Sat, 23 Apr 2022 07:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ni9ph-00039P-4Q; Sat, 23 Apr 2022 07:05:29 +0000
Received: by outflank-mailman (input) for mailman id 311440;
 Sat, 23 Apr 2022 07:05:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hJIN=VB=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1ni9pf-00039I-T5
 for xen-devel@lists.xenproject.org; Sat, 23 Apr 2022 07:05:28 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfad2ae3-c2d3-11ec-8fc2-03012f2f19d4;
 Sat, 23 Apr 2022 09:05:25 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id bn33so12044893ljb.6
 for <xen-devel@lists.xenproject.org>; Sat, 23 Apr 2022 00:05:25 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a056512320600b0047196449b7fsm507662lfe.92.2022.04.23.00.05.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 00:05:23 -0700 (PDT)
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
X-Inumbo-ID: bfad2ae3-c2d3-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=/OlakjqnRmEAn/ytZGVcF22kYWzHUx0JWp7WuYws5xc=;
        b=dG3Cqw8W+risw5HhgeGUsOV40IIJN9LsfZ/mAt53EHPXci8Nh+AS0Ukg7ugAniPlvf
         2kMqWG/94faucQwjCFPGSlPgAniNw53bC+/Z2jpnNhuAfFOMslvUk8ffO+xJWC6elags
         DzBBmQPsl2ZWmlUpiBBlF/kAFNvs75hTOMhy9PUF8hRWso+0p7sI8aZARWWvGdyHQMw0
         cypec0klqiA/oNpDbS1oDR0knRoiDjcnaD2T5jJwo8w/NfJqc7VmUFOYOb4PF9TfGnUo
         fX5HlQ1of/u1PYZ2DZwtWGBh26oESoG/Q5kRpeZnQCI1cefaGnb0XbPe80ZES01fcHCu
         V0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=/OlakjqnRmEAn/ytZGVcF22kYWzHUx0JWp7WuYws5xc=;
        b=gooRYXM07AYueoO2op4pKQDJXa4DBWOSZz+WrCnCZg5KD6zWYhh5n7VfUCbMsFxt6i
         6vOVXZWyibgZgHwsIomlj/by1Sm040iqO2/4QNlnRVPHOnK7kXtxU5x0LdOuK+n0xXMF
         719C4VrEIlJQpeProMMj7AkeGJTcjl5qzH9KruVca4T6zGxCi1JOrPk2UlX2zCxPkr3b
         5cqeI0RLj5d3yj/eCqiHkqjSHpC+7Z/OecSGZhfKIBOhMJAnznReqnxIsCDCb9Uew7/F
         918Zj56lZDkXECA8CGrvA6cbRlcQ45dkJvYpz1B+II3ml31WCWJcOmy22ew+985KZH+r
         G49A==
X-Gm-Message-State: AOAM530Ss9qJ06fLLWnzDb0EQSfG2deKNdUiEDVhdABW4nBTVu6ZRGeW
	l0Bc79lYPC29a2AoT+qdUgE=
X-Google-Smtp-Source: ABdhPJzYqUou0JMTdEbgFu+n32xCOhNS5ykDoZom+OkX0kkYiAJxNaDtFp7tRuvODxqjyVzBcqPIcg==
X-Received: by 2002:a2e:9345:0:b0:24b:451:7ce1 with SMTP id m5-20020a2e9345000000b0024b04517ce1mr4877723ljh.258.1650697524590;
        Sat, 23 Apr 2022 00:05:24 -0700 (PDT)
Subject: Re: [PATCH V1 3/6] xen/virtio: Add option to restrict memory access
 under Xen
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Juergen Gross <jgross@suse.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Julien Grall <julien@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Christoph Hellwig <hch@infradead.org>
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>
 <1650646263-22047-4-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.22.394.2204221526221.915916@ubuntu-linux-20-04-desktop>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <3de2852b-0a94-fd1d-2eb6-fd818f33fc88@gmail.com>
Date: Sat, 23 Apr 2022 10:05:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2204221526221.915916@ubuntu-linux-20-04-desktop>
Content-Type: multipart/mixed;
 boundary="------------1C2D46C789FB115F1F5DE02D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1C2D46C789FB115F1F5DE02D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 23.04.22 02:00, Stefano Stabellini wrote:

Hello Stefano


> On Fri, 22 Apr 2022, Oleksandr Tyshchenko wrote:
>> From: Juergen Gross <jgross@suse.com>
>>
>> Introduce Xen grant DMA-mapping layer which contains special DMA-mapping
>> routines for providing grant references as DMA addresses to be used by
>> frontends (e.g. virtio) in Xen guests.
>>
>> In order to support virtio in Xen guests add a config option XEN_VIRTIO
>> enabling the user to specify whether in all Xen guests virtio should
>> be able to access memory via Xen grant mappings only on the host side.
>>
>> As this also requires providing arch_has_restricted_virtio_memory_access
>> implementation, switch from a pure stub to a real function on Arm
>> and combine with existing implementation for the SEV guests on x86.
>>
>> Add the needed functionality by providing a special set of DMA ops
>> handling the needed grant operations for the I/O pages.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> There are a couple of minor things that checkpatch.pl reports,

Thank you for pointing this out, my fault.


>   but aside
> from those the patch looks fine to me.

good


The attached diff to be squashed for the new version. One thing remains:

checkpatch.pl says regarding drivers/xen/grant-dma-ops.c:

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#151:
new file mode 100644


Which, I assume, this is not an issue as new file falls under XEN 
HYPERVISOR INTERFACE maintainership?

scripts/get_maintainer.pl -f drivers/xen/grant-dma-ops.c
Boris Ostrovsky <boris.ostrovsky@oracle.com> (supporter:XEN HYPERVISOR 
INTERFACE)
Juergen Gross <jgross@suse.com> (supporter:XEN HYPERVISOR INTERFACE)
Stefano Stabellini <sstabellini@kernel.org> (reviewer:XEN HYPERVISOR 
INTERFACE)
xen-devel@lists.xenproject.org (moderated list:XEN HYPERVISOR INTERFACE)
linux-kernel@vger.kernel.org (open list)

[snip]

-- 
Regards,

Oleksandr Tyshchenko


--------------1C2D46C789FB115F1F5DE02D
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-fixup.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="0001-fixup.patch"

From 8d36fc5a3604a69848c300a42f1a78f8ace41829 Mon Sep 17 00:00:00 2001
From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Date: Sat, 23 Apr 2022 09:23:04 +0300
Subject: [PATCH] fixup

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 drivers/xen/Kconfig         |  2 ++
 drivers/xen/grant-dma-ops.c | 21 ++++++++++++---------
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index b95581f..1727337 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -350,4 +350,6 @@ config XEN_VIRTIO
 	  guest type this will require special support on the backend side
 	  (qemu or kernel, depending on the virtio device types used).
 
+	  If in doubt, say n.
+
 endmenu
diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index 70d5d77..b9d93d7 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -139,7 +139,7 @@ static struct page *xen_grant_dma_alloc_pages(struct device *dev, size_t size,
 					      enum dma_data_direction dir,
 					      gfp_t gfp)
 {
-	WARN_ONCE(1, "xen_grant_dma_alloc_pages size %zu\n", size);
+	WARN_ONCE(1, "%s: size %zu\n", __func__, size);
 	return NULL;
 }
 
@@ -147,7 +147,7 @@ static void xen_grant_dma_free_pages(struct device *dev, size_t size,
 				     struct page *vaddr, dma_addr_t dma_handle,
 				     enum dma_data_direction dir)
 {
-	WARN_ONCE(1, "xen_grant_dma_free_pages size %zu\n", size);
+	WARN_ONCE(1, "%s: size %zu\n", __func__, size);
 }
 
 static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
@@ -160,7 +160,8 @@ static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
 	grant_ref_t grant;
 	dma_addr_t dma_handle;
 
-	BUG_ON(dir == DMA_NONE);
+	if (WARN_ON(dir == DMA_NONE))
+		return DMA_MAPPING_ERROR;
 
 	data = find_xen_grant_dma_data(dev);
 	if (!data)
@@ -190,7 +191,8 @@ static void xen_grant_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
 	unsigned int i, n_pages = PFN_UP(size);
 	grant_ref_t grant;
 
-	BUG_ON(dir == DMA_NONE);
+	if (WARN_ON(dir == DMA_NONE))
+		return;
 
 	data = find_xen_grant_dma_data(dev);
 	if (!data)
@@ -219,7 +221,8 @@ static void xen_grant_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
 	struct scatterlist *s;
 	unsigned int i;
 
-	BUG_ON(dir == DMA_NONE);
+	if (WARN_ON(dir == DMA_NONE))
+		return;
 
 	for_each_sg(sg, s, nents, i)
 		xen_grant_dma_unmap_page(dev, s->dma_address, sg_dma_len(s), dir,
@@ -233,7 +236,8 @@ static int xen_grant_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	struct scatterlist *s;
 	unsigned int i;
 
-	BUG_ON(dir == DMA_NONE);
+	if (WARN_ON(dir == DMA_NONE))
+		return -EINVAL;
 
 	for_each_sg(sg, s, nents, i) {
 		s->dma_address = xen_grant_dma_map_page(dev, sg_page(s), s->offset,
@@ -303,10 +307,9 @@ void xen_grant_setup_dma_ops(struct device *dev)
 	}
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
-	if (!data) {
-		dev_err(dev, "Сannot allocate Xen grant DMA data\n");
+	if (!data)
 		goto err;
-	}
+
 	data->dev_domid = dev_domid;
 	data->dev = dev;
 
-- 
2.7.4


--------------1C2D46C789FB115F1F5DE02D--

