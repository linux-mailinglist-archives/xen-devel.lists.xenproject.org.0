Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CB53FFDFE
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 12:09:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177997.323877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM68R-0000A3-4H; Fri, 03 Sep 2021 10:09:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177997.323877; Fri, 03 Sep 2021 10:09:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM68Q-00006O-Vy; Fri, 03 Sep 2021 10:09:22 +0000
Received: by outflank-mailman (input) for mailman id 177997;
 Fri, 03 Sep 2021 10:09:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=93bQ=NZ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mM68P-0004Cr-Aw
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 10:09:21 +0000
Received: from mail-ej1-x62a.google.com (unknown [2a00:1450:4864:20::62a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfd41a6e-29ed-4f0d-93f2-6a4adb13b1b1;
 Fri, 03 Sep 2021 10:08:45 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id jg16so7877055ejc.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 03:08:45 -0700 (PDT)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id p5sm2427187eju.30.2021.09.03.03.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 03:08:43 -0700 (PDT)
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
X-Inumbo-ID: cfd41a6e-29ed-4f0d-93f2-6a4adb13b1b1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hMt74Ggq0zLuhF8LFxm6cOM3G4Wenq/IlhMP/O3Mgu8=;
        b=V1tudX9W4mPKN2zjexbubTP4JGF55U3CiWlqiVVH/aom0cJVJ9DzTQIKOt0DiEqdeB
         gwJsiJ7+KLjAsmewkiv3WjPx0NljKuCC6KIu8e1A/0EQb3tPwt+Iw9O6ttCu1nEbMen9
         dPfIoN8NWovGilGVHpkSunNV38UJxPyiT5SWc9gLFIWuF7vISABGFOf/CkkqLy5U8eBT
         csUbFMOjSPYoczhbwliEbPFTcQ1pEyU+dcCSuBHQlOK/0Jns8dCF/muXfodFaHpq4rue
         NAmSsaWkuUYPr1nJ+O/wEdrM+g5lWOlPDEU6Ak9vRyYXvYs0OI0MpwfvQwziA7gVjDds
         pMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hMt74Ggq0zLuhF8LFxm6cOM3G4Wenq/IlhMP/O3Mgu8=;
        b=rqp8P+819hb+Nc5KV1bfSgDPds2Qx4iqwmg8oFFbWh4ZqNIM6qVDcOCq7h6RawDZhd
         aEE62/tgVWnntBp55OnxsXazmB/MjUwRkpd4jY6duR1cEBqH3vVZuR+hJgW7BZsj4fER
         rmfXHct7z2ALSi7ZPhVn7iUoSjIX/debzlDvZ2RdKGyAlocz99WlZvuN7w0EVnGyLNw7
         S0R1n7VoXVIWzLqA9KtzcLpg/U1QkTQR56MuN7H3uP7CY1Xekbfi1kTc/C+edWW7mscV
         HowfSkqgG+Tn62lUY4V9ElvWTpBuESqgoibah25qOZY/qr4FkS5erpQHUvtVo+fozXUP
         CLfA==
X-Gm-Message-State: AOAM533PnJkO9S4kWSa0EgNTrODTxnqnnkoX83jVc6wYCeREriRFvzOK
	Ix1RSv1WQxCWpiQhuhKpoouQfIiBlUU=
X-Google-Smtp-Source: ABdhPJypiSxpzvy084GcT4yZmHBhr6SMk1ebVuiTgJuY67izy5QHVzN9Q+8vXBtuc3hYUclLgUGWEQ==
X-Received: by 2002:a17:906:e51:: with SMTP id q17mr3408604eji.76.1630663724006;
        Fri, 03 Sep 2021 03:08:44 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 9/9] vpci/header: Use pdev's domain instead of vCPU
Date: Fri,  3 Sep 2021 13:08:31 +0300
Message-Id: <20210903100831.177748-10-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903100831.177748-1-andr2000@gmail.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rahul Singh <rahul.singh@arm.com>

Fixes: 9c244fdef7e7 ("vpci: add header handlers")

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/drivers/vpci/header.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index dac973368b1e..688c69acbc23 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -157,7 +157,7 @@ bool vpci_process_pending(struct vcpu *v)
     if ( v->vpci.num_mem_ranges )
     {
         struct map_data data = {
-            .d = v->domain,
+            .d = v->vpci.pdev->domain,
             .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
         };
         struct pci_dev *pdev = v->vpci.pdev;
-- 
2.25.1


