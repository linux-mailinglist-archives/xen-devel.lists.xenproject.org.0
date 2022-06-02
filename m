Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8EC53BEB1
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 21:24:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341187.566443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwqQn-0001nq-P4; Thu, 02 Jun 2022 19:24:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341187.566443; Thu, 02 Jun 2022 19:24:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwqQn-0001i1-8B; Thu, 02 Jun 2022 19:24:29 +0000
Received: by outflank-mailman (input) for mailman id 341187;
 Thu, 02 Jun 2022 19:24:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2EeJ=WJ=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nwqQl-0000dK-06
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 19:24:27 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d68adeb-e2a9-11ec-bd2c-47488cf2e6aa;
 Thu, 02 Jun 2022 21:24:26 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id s12so4610717ejx.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jun 2022 12:24:25 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 eg13-20020a056402288d00b0042dce73168csm2938301edb.13.2022.06.02.12.24.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Jun 2022 12:24:25 -0700 (PDT)
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
X-Inumbo-ID: 9d68adeb-e2a9-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1vkkmAPV7KLk5lLiYTidlJE/79j9EHin+NPAEwFGGPw=;
        b=jmz6IGbzJezrRiTA2mBa10TijR6VR0Wsv+zWCJK861wll6nY+yQF0eqIKkBS5xRnY3
         06uO1Xxv/f6WxMrF7ZyLzMMJpLL7T61a9BflqTJ5BPHI2FF2yaJJHfW/bvUVTWX/bfjV
         TROS8lfNzLEEAzJE9nYscufoMwjo6IO6XfMO3atpb5xGlgWq24wpMqelyhVadYrVknNw
         V4Dfqy8uPCBCPMqt8EIVIXfDHx1hVqeQ4NxiznFjv2NBcgYhlvr/UPQpIcO2wVH5JkM0
         oetd2/yrhmoOzPa4PebgUEMktci6Q0lz4PC7beZD+tIq3arTBN3tTXxehvdl7SduyR5Q
         8frg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1vkkmAPV7KLk5lLiYTidlJE/79j9EHin+NPAEwFGGPw=;
        b=vUahCzipRlcj4LeynpZKSp317kFZZn2QFGFiDEh65tSZqWywSsgYM1J/kUVaTymGMc
         M0cGU4OeVK01c4ckNFK6HOkDDAVH3GJ8B8htCvwYdi4Stm9Ljn3jIWi0lBikzbYFnGdH
         yvQUuw/4jlUp/n0FeDYHP5iO/ZROyYkc+zbVqUbTcGxnxlcrDtkm6qiR+Z3GQlDVMVgi
         YxtuYrLKGTPPMHmQ+3skMtvQOD5iDg1cwA36rQM4iPyV5634W2J4JQEy95VL0duQj+rg
         r+h1lqiZU+27huxyG3zsqo6HWqrrVEz6rkpAbh0e3Tf3CjcFX+2oQHKsKPpXvmJo4JeU
         JPvQ==
X-Gm-Message-State: AOAM533XC2TxC8PjQx8j/Q6pt2eCBH+YbXLPU580CETNaiphKJ/bdKcu
	ii8CZ5DvGXjWUlI4Skisid8HkqrLPBM=
X-Google-Smtp-Source: ABdhPJzV8VoTn9s996wPN+vTdvWiSQPgr/k13Tl/xR8W22maSDMF8OZr0DW6z0mMDrujt2w9yOf1MQ==
X-Received: by 2002:a17:907:7f20:b0:6fe:f0c8:8e6f with SMTP id qf32-20020a1709077f2000b006fef0c88e6fmr5510662ejc.453.1654197865496;
        Thu, 02 Jun 2022 12:24:25 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Christoph Hellwig <hch@infradead.org>
Subject: [PATCH V4 8/8] arm/xen: Assign xen-grant DMA ops for xen-grant DMA devices
Date: Thu,  2 Jun 2022 22:23:53 +0300
Message-Id: <1654197833-25362-9-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1654197833-25362-1-git-send-email-olekstysh@gmail.com>
References: <1654197833-25362-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

By assigning xen-grant DMA ops we will restrict memory access for
passed device using Xen grant mappings. This is needed for using any
virtualized device (e.g. virtio) in Xen guests in a safe manner.

Please note, for the virtio devices the XEN_VIRTIO config should
be enabled (it forces ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS).

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes RFC -> V1:
   - update commit subject/description
   - remove #ifdef CONFIG_XEN_VIRTIO
   - re-organize the check taking into the account that
     swiotlb and virtio cases are mutually exclusive
   - update according to the new naming scheme:
     s/virtio/grant_dma

Changes V1 -> V2:
   - add Stefano's R-b
   - remove arch_has_restricted_virtio_memory_access() check
   - update commit description
   - remove the inclusion of virtio_config.h

Changes V2 -> V3:
   - no changes

Changes V3 -> V4:
   - no changes
---
 include/xen/arm/xen-ops.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/xen/arm/xen-ops.h b/include/xen/arm/xen-ops.h
index 288deb1..b0766a6 100644
--- a/include/xen/arm/xen-ops.h
+++ b/include/xen/arm/xen-ops.h
@@ -3,11 +3,14 @@
 #define _ASM_ARM_XEN_OPS_H
 
 #include <xen/swiotlb-xen.h>
+#include <xen/xen-ops.h>
 
 static inline void xen_setup_dma_ops(struct device *dev)
 {
 #ifdef CONFIG_XEN
-	if (xen_swiotlb_detect())
+	if (xen_is_grant_dma_device(dev))
+		xen_grant_setup_dma_ops(dev);
+	else if (xen_swiotlb_detect())
 		dev->dma_ops = &xen_swiotlb_dma_ops;
 #endif
 }
-- 
2.7.4


