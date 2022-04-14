Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F605501BAF
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 21:20:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305051.519920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf50O-0006jb-Jx; Thu, 14 Apr 2022 19:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305051.519920; Thu, 14 Apr 2022 19:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf50O-0006f8-Ce; Thu, 14 Apr 2022 19:19:48 +0000
Received: by outflank-mailman (input) for mailman id 305051;
 Thu, 14 Apr 2022 19:19:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RCiM=UY=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nf50M-00054x-G3
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 19:19:46 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d82992f9-bc27-11ec-8fbe-03012f2f19d4;
 Thu, 14 Apr 2022 21:19:45 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id u7so10757064lfs.8
 for <xen-devel@lists.xenproject.org>; Thu, 14 Apr 2022 12:19:45 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a194943000000b0046b928d2795sm85001lfj.67.2022.04.14.12.19.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Apr 2022 12:19:44 -0700 (PDT)
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
X-Inumbo-ID: d82992f9-bc27-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JLvcL2fLROn3t3atjcd/ETf/m7mMDU63S8SDHDmllis=;
        b=PHixjVnS4M4CDbB1CHxDVeo28b/aVzSp0mJdrnkLOhqhj+Q/2wwhqo/TFVejF1D2cn
         M+V0zaS78dJd9lsRuBeMiEdLy1jV96PMJyIQ6tdjGX+3REplXlVqvCJvz8NPjkgZDOPf
         0khIrkBNwrWYo3QJ78y6BdHbLNpK0mHknzDWftCsqrE3xGyfA0HJKlIH7azM+WvVfhCo
         FHFrJ5hJRJK3Z7+BjHY/QTvixVEHiQzKm5aCRqRcCN/lRd8u9CYEkm4z/L9bHAfjRB0R
         fxISXS4qdfBlfdENdbDSL4T/6mCEkKAVOD6Rznx/DdO6NACB2S+j7tbT1uhlqWI/zvSd
         XiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JLvcL2fLROn3t3atjcd/ETf/m7mMDU63S8SDHDmllis=;
        b=NmroHfOKX7GO4XNqsPzENCJPicBKQx90nzYREaR2EgI0VLCirEea6c83Frat2N2VXj
         8FQmz9x/TMbdotJQKOmIQqAirCgeLxl+SgFg6GolQOb8g0my+yciaf1GcZvnpThNkw3G
         7GG0ixdcPaFmEF++hUpmwCJHvmHodEUSZP3Ua8rCdOdBk1i1vPScRjs1vgTKYCtu39/E
         kpIs6JBuDxdDnrhGx+Qn8L+7o76scyX5K97Jb9S8ARabQ8qLuh3cy1QCdVoEotTi28KD
         khbAb/9s5F6vyo73TOyMkiVr9kLwXXG7rnjRYXYCzH9HzYa0RpDXv3vTRSr+CMC8G+Nc
         RbsQ==
X-Gm-Message-State: AOAM530jZozdHCB7us1QOnymzZkRUqUZe3pm6rFRkW3bcNysnUsJwXI6
	U3NO/oWH4AEwUvqow+Rf54XJhP9w9/o=
X-Google-Smtp-Source: ABdhPJwMUxbIWiWwpSwBanMHzTQNTMGbJ4JbV9MkuLqT17euk/S+BBLtlBgciKyx0qEt1KTBdH2vcw==
X-Received: by 2002:a05:6512:1082:b0:44a:a6be:90b with SMTP id j2-20020a056512108200b0044aa6be090bmr2827259lfg.45.1649963985288;
        Thu, 14 Apr 2022 12:19:45 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [RFC PATCH 6/6] arm/xen: Assign xen-virtio DMA ops for virtio devices in Xen guests
Date: Thu, 14 Apr 2022 22:19:33 +0300
Message-Id: <1649963973-22879-7-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1649963973-22879-1-git-send-email-olekstysh@gmail.com>
References: <1649963973-22879-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Call xen_virtio_setup_dma_ops() only for Xen-aware virtio devices
in Xen guests if restricted access to the guest memory is enabled.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 include/xen/arm/xen-ops.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/xen/arm/xen-ops.h b/include/xen/arm/xen-ops.h
index 621da05..28b2ad3 100644
--- a/include/xen/arm/xen-ops.h
+++ b/include/xen/arm/xen-ops.h
@@ -2,12 +2,19 @@
 #ifndef _ASM_ARM_XEN_OPS_H
 #define _ASM_ARM_XEN_OPS_H
 
+#include <linux/virtio_config.h>
 #include <xen/swiotlb-xen.h>
+#include <xen/xen-ops.h>
 
 static inline void xen_setup_dma_ops(struct device *dev)
 {
 	if (xen_swiotlb_detect())
 		dev->dma_ops = &xen_swiotlb_dma_ops;
+
+#ifdef CONFIG_XEN_VIRTIO
+	if (arch_has_restricted_virtio_memory_access() && xen_is_virtio_device(dev))
+		xen_virtio_setup_dma_ops(dev);
+#endif
 }
 
 #endif /* _ASM_ARM_XEN_OPS_H */
-- 
2.7.4


