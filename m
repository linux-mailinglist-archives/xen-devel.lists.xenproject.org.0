Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3690C4208CE
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 11:54:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201256.355700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXKfu-00044o-Ik; Mon, 04 Oct 2021 09:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201256.355700; Mon, 04 Oct 2021 09:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXKfu-00042D-Ev; Mon, 04 Oct 2021 09:54:22 +0000
Received: by outflank-mailman (input) for mailman id 201256;
 Mon, 04 Oct 2021 09:54:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sY6e=OY=gmail.com=rm.skakun@srs-us1.protection.inumbo.net>)
 id 1mXKft-0003kC-Bi
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 09:54:21 +0000
Received: from mail-lf1-x131.google.com (unknown [2a00:1450:4864:20::131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89649863-3125-4d7c-a32c-023248b3999f;
 Mon, 04 Oct 2021 09:54:16 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id b20so69477941lfv.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Oct 2021 02:54:16 -0700 (PDT)
Received: from localhost ([178.151.124.169])
 by smtp.gmail.com with ESMTPSA id d26sm252462lfi.154.2021.10.04.02.54.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 02:54:15 -0700 (PDT)
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
X-Inumbo-ID: 89649863-3125-4d7c-a32c-023248b3999f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pKeIejZMmAWUKSzpNfYJ7ftj0OuVVZzScF0RA9xJMh8=;
        b=IwNzQ2/zRS6NytwyXdzbEIDWmskxGJk/uioBO4rV+JHcIAiTW+yc300kIMSmWFflvD
         BaGaqMAIGZkc3PkDOd2A7LRBLWQp/jXIhuTK/sJKU67zPgVG5wakyrWfTiZR3R0NGATh
         QGQvOTXCr9mz4mZvBOSYxLWbWsumJlXqQPHdoDSYPCs9EjE+XHm2dRxMfFlsxf4i6NJ0
         9bEozKqLe6lvqANCD1qVPo2h+r3/8hv48cphH41yAF8rxYTAD3EeU6cou6xHZVNWtHnr
         5mdXklpXrM86ALocZ5SFCWUkKzrc/fLiLGwwNQz1TYa8SMy44qbGI8odaApBRqykrdcr
         zJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pKeIejZMmAWUKSzpNfYJ7ftj0OuVVZzScF0RA9xJMh8=;
        b=kqYLSgyvmD3w0OLzUU0PEfHbxhHIXIgJGXFjm+CTSH//imhQsNjri6sxjXzCDgh+iW
         V/Spb9WkbMT5fTMyOEgH5b96sSgpqx55Z0I82w7R+kFMv4IsLrkQ9d7O3SGe4crLM75Z
         8jSEKaozKvcXKZ5TIOy7GHtM0TuUu8fULKKDibja9YGl/6h/IYUsOtPdzU08MVKnhijx
         Evxxz1v79i3FDzgeHkLrKJzQBDyNOLXZJMoHwikLD32Z14AI88ep/nAKrNUG4lC26Q7d
         zF2p0mHXVbwdUZKneY9b2Yh6yXA7HXxi7VBe7T9KhBoyrRVIzvObNp1mR4Elk/+rs0UG
         5GLw==
X-Gm-Message-State: AOAM531m46a6bWEwhpMD1nOfyDcgg7h6CSGK1hBGst7sRZYFyLKi2MPZ
	X84C0UTQ8iWuqjiGEkaqiWD0AYfjIqpTkwO2
X-Google-Smtp-Source: ABdhPJyeztrkU+uxCkN1Q5o9nLEW+laMiQoaZtMd9zaApCallzLBMawwyhb4zEQIneNj/grWipTyvQ==
X-Received: by 2002:ac2:4e0a:: with SMTP id e10mr150199lfr.225.1633341255568;
        Mon, 04 Oct 2021 02:54:15 -0700 (PDT)
From: Roman Skakun <rm.skakun@gmail.com>
X-Google-Original-From: Roman Skakun <Roman_Skakun@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	xen-devel@lists.xenproject.org
Cc: Roman Skakun <roman_skakun@epam.com>,
	Roman Skakun <rm.skakun@gmail.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrii Anisov <andrii_anisov@epam.com>
Subject: [RFC 1/1] xen/arm: set iommu property for IOMMU-protected devices
Date: Mon,  4 Oct 2021 12:54:02 +0300
Message-Id: <5b101e4e85668bbb18da83044520b0350344f408.1633106362.git.roman_skakun@epam.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1633106362.git.roman_skakun@epam.com>
References: <cover.1633106362.git.roman_skakun@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Roman Skakun <roman_skakun@epam.com>

Xen is not exposing any IOMMU properties to Dom0.
So Dom0 assumes that all it's devices are not protected by IOMMU.

To make Dom0 aware of IOMMU-protected devices, we need to mark
them somehow. With this approach Dom0 Linux kernel will be able
to selectively disable swiotlb-xen fops for them which will remove
unnecessary buffer bounces.

This patch adds mechanism to describe IOMMU-protected devices by
adding `xen,behind-iommu` property to relevant device nodes in
Dom0 device tree.

Signed-off-by: Roman Skakun <roman_skakun@epam.com>
---
 xen/arch/arm/domain_build.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 69fff7fc29..99e2c42b6c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -580,6 +580,13 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
             return res;
     }
 
+    if ( iommu_node && is_iommu_enabled(d) && dt_device_is_protected(node) )
+    {
+        res = fdt_property(kinfo->fdt, "xen,behind-iommu", NULL, 0);
+        if ( res )
+            return res;
+    }
+
     /*
      * Override the property "status" to disable the device when it's
      * marked for passthrough.
-- 
2.27.0


