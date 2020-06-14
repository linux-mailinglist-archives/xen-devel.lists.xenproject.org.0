Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F149C1F8B48
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 01:22:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkbwf-00063a-Cc; Sun, 14 Jun 2020 23:21:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UtKD=73=gmail.com=gorbak25@srs-us1.protection.inumbo.net>)
 id 1jkbwd-00063V-EF
 for xen-devel@lists.xenproject.org; Sun, 14 Jun 2020 23:21:43 +0000
X-Inumbo-ID: ce09bd9e-ae95-11ea-b7bb-bc764e2007e4
Received: from mail-ej1-x641.google.com (unknown [2a00:1450:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce09bd9e-ae95-11ea-b7bb-bc764e2007e4;
 Sun, 14 Jun 2020 23:21:42 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id f7so15468254ejq.6
 for <xen-devel@lists.xenproject.org>; Sun, 14 Jun 2020 16:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SH6vGa/2KJH/HQw68J9t455+U0X8pVu2CUDEZICF8XY=;
 b=EkIv9BYDu2bqD1CBznjqgx+paP0JuGPGE0DqOLWDwiv7lfBUIT49NApiq0ZRi/3k2a
 HVdA1VVaLKHShFXr379eP0t9AVISe91N5vK3lsX9WU5PS/lT6Vfw9TKXZjmF4QZITHzt
 G/2TL4LJXm07PWpaXJ50e69gWgbFHaSBdFyIixlWacp/mMngaChRqG9E/78G3TQFuMQr
 qXHHfCAf20lHz7uFFDy/Xm5D+0dVs0J1AAfmOi6lqCMXXmHUhSs/U9Xxzn1Krtw1Vm/7
 FIMZCbRr0oibg6NYn4EweryYKu6DtBVH+GkEwIzQPktg0aoE3md1Uki3WJ8rO02lghDP
 jQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SH6vGa/2KJH/HQw68J9t455+U0X8pVu2CUDEZICF8XY=;
 b=Csq3bqq7ehM53KRn2hGvCfMm4eAHEayxVTtggRiYQ7hb6/HBedgQphIrRTB30b1D8Y
 dSB5Cqyb0OkXXstjz1VcOBwutaTpjy5xZG30TBzMJea32WsNCwSRdc+OMebvTntqYQqU
 beUgQQ3iSzN+u/0XBuLXmA7e1WqFloClz9Vvvf4r+q/lbhckvxG+D9UVVvnn+f4nUM8A
 l0yGBzMUD5807Wz9Sz3yCikdY/l/w6dzFRNtIb4ANEDlZC3bLGvS8UaKlKXa2HcN88Tw
 XdLOC6ab4mCUW+ztunKDV/iwJlO5g9VlBru0P580GgQ9vMP6DiFVSqpliONy+X6El/0Y
 gtsw==
X-Gm-Message-State: AOAM532efocYLm7yi2r2neErlh7/DSP17Xdu653gmy3BDqf+tmTo6D3g
 N07sT0u3XVgeVf71znz6jKw=
X-Google-Smtp-Source: ABdhPJwOoAC6qLQWxDRL1D5jvqQBH2cD4fnGpHmX1LN/GMQycdeSu6OgkZRdLPIMHrPNtvN6+LLa8w==
X-Received: by 2002:a17:906:7712:: with SMTP id
 q18mr22584732ejm.140.1592176901522; 
 Sun, 14 Jun 2020 16:21:41 -0700 (PDT)
Received: from localhost.localdomain (public-gprs354212.centertel.pl.
 [37.47.14.229])
 by smtp.gmail.com with ESMTPSA id i21sm7332998edr.68.2020.06.14.16.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 16:21:41 -0700 (PDT)
From: Grzegorz Uriasz <gorbak25@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/xen_pt: Don't grant opregion permissions
Date: Sun, 14 Jun 2020 23:21:09 +0000
Message-Id: <2157e10d63619d43151fe8b8ca913b44c54aba6e.1592176600.git.gorbak25@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, jakub@bartmin.ski,
 marmarek@invisiblethingslab.com, Grzegorz Uriasz <gorbak25@gmail.com>,
 j.nowak26@student.uw.edu.pl, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, contact@puzio.waw.pl
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

With the upstreaming of linux based stubdomains to xen, qemu can't
assume it runs inside dom0 - permission assignment must be moved to
libxl running in dom0. This xen patch:
https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg00973.html
implements granting the required permissions to the stubdomain running
qemu. This patch removes granting opregion permissions in qemu - this
should be fine as when qemu is running inside dom0 the memory mapping will
be successfully created without first explicitly granting the permission.

Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
---
 hw/xen/xen_pt_graphics.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/hw/xen/xen_pt_graphics.c b/hw/xen/xen_pt_graphics.c
index 7d46e9c209..303674365b 100644
--- a/hw/xen/xen_pt_graphics.c
+++ b/hw/xen/xen_pt_graphics.c
@@ -283,19 +283,6 @@ void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val)
     igd_guest_opregion = (unsigned long)(val & ~XEN_PCI_INTEL_OPREGION_MASK)
                             | (igd_host_opregion & XEN_PCI_INTEL_OPREGION_MASK);
 
-    ret = xc_domain_iomem_permission(xen_xc, xen_domid,
-            (unsigned long)(igd_host_opregion >> XC_PAGE_SHIFT),
-            XEN_PCI_INTEL_OPREGION_PAGES,
-            XEN_PCI_INTEL_OPREGION_ENABLE_ACCESSED);
-
-    if (ret) {
-        XEN_PT_ERR(&s->dev, "[%d]:Can't enable to access IGD host opregion:"
-                    " 0x%lx.\n", ret,
-                    (unsigned long)(igd_host_opregion >> XC_PAGE_SHIFT)),
-        igd_guest_opregion = 0;
-        return;
-    }
-
     ret = xc_domain_memory_mapping(xen_xc, xen_domid,
             (unsigned long)(igd_guest_opregion >> XC_PAGE_SHIFT),
             (unsigned long)(igd_host_opregion >> XC_PAGE_SHIFT),
-- 
2.27.0


