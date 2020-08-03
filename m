Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD0823AC5F
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 20:31:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2fEn-0001Z5-Q3; Mon, 03 Aug 2020 18:31:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XyPB=BN=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k2f6k-0008F4-8O
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 18:22:46 +0000
X-Inumbo-ID: 377cf859-d5b6-11ea-90c4-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 377cf859-d5b6-11ea-90c4-bc764e2007e4;
 Mon, 03 Aug 2020 18:21:58 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id m15so20303516lfp.7
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2020 11:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1DZeLDeQLAW3wDtg4nsTIUzMiSJtyCyrnnqQeeQIfZc=;
 b=l5r/G7XizMtl4Jo6THLgp7+OQ05dU8uylAR5kvt92eMz9hNK9Wx9iJfWx1sOkeXew/
 dDdjL8kxdVKO/5J/ePv2UXhqUvgsMh92fR2c8HAexuAQ7HwpD5cM3l1R+bG+WidbLDQF
 a+2b7FLpvBsZl4fYu4Pzb41NLeN2NrwTjfDvaWlZ8vaBkSthTZNZodBHuO/vxcGDIRaP
 9ZwEtQYArHZvgwpAkrLFip40/rvpfJvmuceHnh4u/ceo0ASjfq/4jQh0AvZis+PktZt1
 3i5tnB0Y89SS1+fRHFdv8sw30HZoBCEh5KnE9XCYEMMBdwfkJOyy6wF+tY/bMqnoy9L6
 1b9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1DZeLDeQLAW3wDtg4nsTIUzMiSJtyCyrnnqQeeQIfZc=;
 b=cLLPGX9hryIFtHJyeyAvpiVU2hCuNQZPNeEFbI4K0Ydo7SjKSghdLa+n6VaQqFTxYt
 4cJotnvCiQNprB9bI1R/osUVRXc/8SnbLWALq4jIM4y5FbSakJjJRCyDlrzNWtNwn6bY
 OeCzW+NDmWbN0uFOT08Y9XDS3HIfiRlqIsppkC0bW1h/qnOt2LzUi231WaUFHvoVD4hB
 wQpP6xLyCvOHaUWVFPqRNAiuao1hGDABLNVtGrWeipwWlhm55xgcTodwiTcFS/4pvKGH
 ePthIijfwYcaBlIj9crynQJojQB2vqpDITtN8yAd0eSWQjiQf1/mW+y7nnNylAAK/SeZ
 cd4w==
X-Gm-Message-State: AOAM531JOnCLJOL448rqK6w2cn+k/A1XvKTNMFGHLGqXh0bnvAXQG1vn
 vVC5Y8ZLdmbP+pQdfcEyEOTk5hSzR4g=
X-Google-Smtp-Source: ABdhPJytiiD7l56b7Vm/NaSQXoaXOLDxnIvoSE8ZvLGZHZEUatUZoCFu/Kmqn5PTbDoeaT2KzUFD3A==
X-Received: by 2002:ac2:598f:: with SMTP id w15mr9054121lfn.216.1596478917357; 
 Mon, 03 Aug 2020 11:21:57 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id h18sm4486730ljk.7.2020.08.03.11.21.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Aug 2020 11:21:56 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [RFC PATCH V1 12/12] libxl: Fix duplicate memory node in DT
Date: Mon,  3 Aug 2020 21:21:28 +0300
Message-Id: <1596478888-23030-13-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

When two or more VirtIO devices are passed to DomU the
following message is observed:
OF: Duplicate name in base, renamed to "virtio#1"

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 tools/libxl/libxl_arm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/libxl/libxl_arm.c b/tools/libxl/libxl_arm.c
index a68fb14..9671a44 100644
--- a/tools/libxl/libxl_arm.c
+++ b/tools/libxl/libxl_arm.c
@@ -710,9 +710,11 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
 {
     int res;
     gic_interrupt intr;
+    /* Placeholder for virtio@ + a 64-bit number + \0 */
+    char buf[24];
 
-    /* XXX: Add address in the node name */
-    res = fdt_begin_node(fdt, "virtio");
+    snprintf(buf, sizeof(buf), "virtio@%"PRIx64, base);
+    res = fdt_begin_node(fdt, buf);
     if (res) return res;
 
     res = fdt_property_compat(gc, fdt, 1, "virtio,mmio");
-- 
2.7.4


