Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F835F4721
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 18:07:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415688.660313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofkRQ-0005d3-7F; Tue, 04 Oct 2022 16:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415688.660313; Tue, 04 Oct 2022 16:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofkRQ-0005aE-4Y; Tue, 04 Oct 2022 16:06:44 +0000
Received: by outflank-mailman (input) for mailman id 415688;
 Tue, 04 Oct 2022 16:06:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hw9g=2F=gmail.com=colin.i.king@srs-se1.protection.inumbo.net>)
 id 1ofkRO-0005a8-AF
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 16:06:42 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88927368-43fe-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 18:06:41 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id ay36so9222231wmb.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Oct 2022 09:06:41 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 j14-20020a5d464e000000b0022e38c93195sm6420254wrs.34.2022.10.04.09.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 09:06:40 -0700 (PDT)
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
X-Inumbo-ID: 88927368-43fe-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=JzOBFqoHQk5sbb88IXGYAWyLYnuSbnvMiffX2ln7ZwY=;
        b=Rj+l6U3nNSIFywr93jeVy56CN03wRC/7817IVultzoSms9L4uKB4b9B3NUnPUdvHNc
         TAG6ZDXEbSAui9n/gh8ZI28TiiieT5QyzZVc8StuRCmy/LkNZ7NrGxGhc8i0G7BtGWB0
         CdOet/pA8zkgMSUZEPq8GL9aaN5873fNruP3i1cTkZemSNUn8kLZJB60Zc+LgQcbHxqe
         5oAyQeHqyQ9Pz3Ujnw6+14hSRXfo9auNVrnjUOtFr6BbwwcPTeTS8zZgkXjcx4r67zoz
         9DvuNUA4JVHiAKgutltgWA0zE/0lXbQrN2ayZ7/xjc2/Wr8wTkdRzhU4QMg5+FJjr4ZD
         +7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=JzOBFqoHQk5sbb88IXGYAWyLYnuSbnvMiffX2ln7ZwY=;
        b=tdQHEUhLTobRDgPlGL1vAgP4hzI4nx+aXKOU9y9zZiASs3J9MnTr4ViU6Ej2f/N/Os
         k0EKpQ8Ip6xSUunGxpdFlINr5WyhFLna3T4ljgufTdNxqIYgKAcUwh6RzrqSnfcmMyPD
         blJDZUDXfKYatfMle8CLB+Y7KFyRrW17CfSDUxm8EcRi58DVmizHFuAm7ia0os3x8B65
         DxGTpj29AW9WAxQRdTafgJM68WQ4UkfehbnNqwW76yzeFb5R/jvONmmuJfWjA4+phOKc
         UVLhG8uAbHL42cJ3gGUpVMDp68Un+rvG26oQ6LssPaDa5558Yg7Givy71qf7EFKF3k3l
         InJQ==
X-Gm-Message-State: ACrzQf0dmnxehS7NoUAkxygQzXh7/3yf9RW0S5eNM4nDLyoLTZ2r/3i1
	qBD6UvO2O13yWpYTRsaskZU=
X-Google-Smtp-Source: AMsMyM6gRgaGAOCdkIrXOwLoGfT92j7KLM0C3wI+tKqR71EzYZ/Ko/ncz8DXmsZlQVl7c3hMCAbu3g==
X-Received: by 2002:a7b:c4c2:0:b0:3b4:fdc4:6df9 with SMTP id g2-20020a7bc4c2000000b003b4fdc46df9mr332508wmk.123.1664899600743;
        Tue, 04 Oct 2022 09:06:40 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xen/xenbus: Fix spelling mistake "hardward" -> "hardware"
Date: Tue,  4 Oct 2022 17:06:39 +0100
Message-Id: <20221004160639.154421-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in the module description. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/xen/xen-pciback/xenbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/xen-pciback/xenbus.c b/drivers/xen/xen-pciback/xenbus.c
index bde63ef677b8..d171091eec12 100644
--- a/drivers/xen/xen-pciback/xenbus.c
+++ b/drivers/xen/xen-pciback/xenbus.c
@@ -31,7 +31,7 @@ MODULE_PARM_DESC(passthrough,
 	"   frontend (for example, a device at 06:01.b will still appear at\n"\
 	"   06:01.b to the frontend). This is similar to how Xen 2.0.x\n"\
 	"   exposed PCI devices to its driver domains. This may be required\n"\
-	"   for drivers which depend on finding their hardward in certain\n"\
+	"   for drivers which depend on finding their hardware in certain\n"\
 	"   bus/slot locations.");
 
 static struct xen_pcibk_device *alloc_pdev(struct xenbus_device *xdev)
-- 
2.37.1


