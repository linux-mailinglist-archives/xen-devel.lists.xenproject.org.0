Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C43E71F89A3
	for <lists+xen-devel@lfdr.de>; Sun, 14 Jun 2020 18:19:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkVKC-0004tY-Tf; Sun, 14 Jun 2020 16:17:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UtKD=73=gmail.com=gorbak25@srs-us1.protection.inumbo.net>)
 id 1jkVKA-0004tT-Kj
 for xen-devel@lists.xenproject.org; Sun, 14 Jun 2020 16:17:34 +0000
X-Inumbo-ID: 8d9f0812-ae5a-11ea-8496-bc764e2007e4
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d9f0812-ae5a-11ea-8496-bc764e2007e4;
 Sun, 14 Jun 2020 16:17:34 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id q19so14836778eja.7
 for <xen-devel@lists.xenproject.org>; Sun, 14 Jun 2020 09:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C3mRdoRg64BYc4ys1yIyprFZdBXkem8fN8ugpNmuLtA=;
 b=OgmSgp0YvbM4MjXhwP44uDmQ9IJchTdgBfvwlcsY4z0Knp2mv3PlL6fcJcdpuNKafO
 1itnNmVeSD44yfoyyoVvnyGiTCmMQZi+2fxf9j+tNpyj45zMHojjthi+HrdZvsqga9VT
 CcxaV92AnGeqoXnsZZYFcom6qGjnFkpQKaAViILeMdHtQ08KrVUfLlDrUr3HVqhTirpP
 JS1Z/8K5xNQ3Ey0afUOGavvpflzd3cKTr1aWTn4jw+uZVabvC10AuR6HjTED73OLi45V
 F/ddhM+o7fp3RAO1otiEaNDoN6PkPgOXW5NUvQ8QSI4HhKdPTr0Z13Y5nIDy4YUCpCkd
 ss+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C3mRdoRg64BYc4ys1yIyprFZdBXkem8fN8ugpNmuLtA=;
 b=SxU3gKfRhF+TXzG6hRxJOZ0mP5eOy76Geyb9jcJdZodOv6jGDK/JlRFKx3AT7wmtE9
 mathdpxNh3FgVADYqs04GhUtvIeOaHWop6RWa7UDHmUy9p3JB+Np8jNKoMieG7Q5bSn5
 GhO+0HD7+XxxDYmwmogrxa89HEqnaXibLklNqTJq/Hjy9tdZgWa3627p/CqmhFcvpCmx
 miPWHhZFJDsQHLK/ToAPlpJ5r0qEaIUJVfPYqDjK+yxVZHMR4m8LUqKdH728/ja47SdR
 A7aKLCciq6hhToBNVbkp5nuwFQaM6U2/bysbYs+KMggtcFldgXbl8R0eoV5J0DbMFSLA
 0BGw==
X-Gm-Message-State: AOAM530kcSaIGB6LjWfIOuVndE7KW7NgUI9wngiVkRn76MJOZdETVRQ1
 SwVRckc71JTQO6MiRkSVm2QrG2lvyX/4tg==
X-Google-Smtp-Source: ABdhPJzu809FPnL+SaqbdfLTTjXT3ClJxmAO7HnV+sg36krRUjBee4Bzk6FUlRj35IvMH7D64wzQhw==
X-Received: by 2002:a17:906:1fcd:: with SMTP id
 e13mr21718301ejt.472.1592151452843; 
 Sun, 14 Jun 2020 09:17:32 -0700 (PDT)
Received: from localhost.localdomain (public-gprs354212.centertel.pl.
 [37.47.14.229])
 by smtp.gmail.com with ESMTPSA id g25sm6752429edq.34.2020.06.14.09.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 09:17:32 -0700 (PDT)
From: Grzegorz Uriasz <gorbak25@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] libxl: tooling expects wrong errno
Date: Sun, 14 Jun 2020 16:17:08 +0000
Message-Id: <ebdcefb5ab4b9053dee7c090b4e6562e597b3474.1592151144.git.gorbak25@gmail.com>
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
Cc: Wei Liu <wl@xen.org>, jakub@bartmin.ski,
 Ian Jackson <ian.jackson@eu.citrix.com>, marmarek@invisiblethingslab.com,
 Grzegorz Uriasz <gorbak25@gmail.com>, j.nowak26@student.uw.edu.pl,
 Anthony PERARD <anthony.perard@citrix.com>, contact@puzio.waw.pl
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

When iommu is not enabled for a given domain then pci passthrough
hypercalls such as xc_test_assign_device return EOPNOTSUPP.
The code responsible for this is in "iommu_do_domctl" inside
xen/drivers/passthrough/iommu.c
This patch fixes the error message reported by libxl when assigning
pci devices to domains without iommu.

Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
Tested-by: Grzegorz Uriasz <gorbak25@gmail.com>
---
 tools/libxl/libxl_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libxl/libxl_pci.c b/tools/libxl/libxl_pci.c
index 957ff5c8e9..bc5843b137 100644
--- a/tools/libxl/libxl_pci.c
+++ b/tools/libxl/libxl_pci.c
@@ -1561,7 +1561,7 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
             LOGD(ERROR, domid,
                  "PCI device %04x:%02x:%02x.%u %s?",
                  pcidev->domain, pcidev->bus, pcidev->dev, pcidev->func,
-                 errno == ENOSYS ? "cannot be assigned - no IOMMU"
+                 errno == EOPNOTSUPP ? "cannot be assigned - no IOMMU"
                  : "already assigned to a different guest");
             goto out;
         }
-- 
2.27.0


