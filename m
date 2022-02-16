Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5BA4B8C3A
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 16:16:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274221.469654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKM2o-0001jr-KI; Wed, 16 Feb 2022 15:16:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274221.469654; Wed, 16 Feb 2022 15:16:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKM2o-0001aH-CI; Wed, 16 Feb 2022 15:16:38 +0000
Received: by outflank-mailman (input) for mailman id 274221;
 Wed, 16 Feb 2022 15:16:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=miT7=S7=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1nKM2m-0000ia-P5
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 15:16:36 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e692108-8f3b-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 16:16:36 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id bx31so3882353ljb.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Feb 2022 07:16:36 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id bt2sm3082357lfb.93.2022.02.16.07.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 07:16:35 -0800 (PST)
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
X-Inumbo-ID: 6e692108-8f3b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jzNPBmlgY6KQmcQw14tBqJfV5dL9s7shqTcsZA+5AgQ=;
        b=TsV6bEvDXLlZtbCASc/xe9GCKFucEulegH3lKRkFAgyMzTU4SyU+Fun96JhxlD+AOY
         nikahjJOLIneZdfNd8sMpA43APGtReE811C7xELfMAr21E2cGwhS3s38g+oTvwV8/0ik
         3kZJZaUdUyVW2ibfJWyvcCqYQq4gahf2nHuzcbeDQ7SZR483UZ1O/WaBghyrflm5MM6s
         6Ucguyj9A7eHx5yL2PtyjXdLXP3NG7az0pJ/kT3Eaq5XoeWSI77AhtkaOCX0EQLIKMKZ
         P2RhCmWNDcmKSzSWaDaVL14QYZbQEirRAWqpANf3Dq+FxTYKNZI2w8g0RlGw/WJmMIJ8
         1l7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jzNPBmlgY6KQmcQw14tBqJfV5dL9s7shqTcsZA+5AgQ=;
        b=2x1EOO7F5s3UgZ1VuRsiWKNFOqBcANlOMnElB7PMMpsZagfwp7fKJeJ9R0hjvoINGM
         hq6kAjKqcBFBTT/zOiIKxx/k+jzQ75hn69MhAkngkg7M5ixyIsT5MbUNYNQ7/T+vyY+d
         gQQGWFoxigczXdK4wgGj/1HtwyIOKg4HaAAzYf7HccM+rJ1Lo7t2Qc6D46IZEdr/nckO
         PkLc8xhmIm43x6TtVoS0/pO9dDlJTovrvDxhNuVmAmkhO8HURrO4eFDP56tGtNnErlGB
         ylDj+gc0U+xw1h/7U8J0T+j6UOtDe76oFkElkqltQj9RZU5bO38l65tPvv9FFk7h0WTq
         a6hA==
X-Gm-Message-State: AOAM533JD3NxC+u17dJzP7yKQBT32vXr+AT7UCOuhnAnVQnQ+Eg47xk6
	TmAb2DH4GVboGMpzGFp0TXBffkKsUfA=
X-Google-Smtp-Source: ABdhPJxnt0SZcGjSHJgWxCZHuf9astKgh20exBxdg26yhlRFgk9MOZE9juT+b1OUcHBpl8MMQnRcKQ==
X-Received: by 2002:a05:651c:1791:b0:243:94bd:d94c with SMTP id bn17-20020a05651c179100b0024394bdd94cmr2382485ljb.468.1645024595427;
        Wed, 16 Feb 2022 07:16:35 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com,
	jbeulich@suse.com,
	julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	artem_mygaiev@epam.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 4/4] vpci: resolve possible clash while removing BAR overlaps
Date: Wed, 16 Feb 2022 17:16:28 +0200
Message-Id: <20220216151628.1610777-5-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220216151628.1610777-1-andr2000@gmail.com>
References: <20220216151628.1610777-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

modify_bars checks if the mapping of the BAR memory has already been
done when mapping other device's BARs or, while unmapping, are still
in use by other devices.

With the existing locking scheme it is possible that there are other
devices trying to do the same in parallel with us, but on other CPUs
as we only hold a read lock without acquiring _pcidevs_lock recursive
lock.

To prevent that upgrade the read lock to normal pcidevs_lock during
BAR overlapping check.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/drivers/vpci/header.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 75e972740106..c80a8bb5e3e0 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -281,7 +281,11 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
     /*
      * Check for overlaps with other BARs. Note that only BARs that are
      * currently mapped (enabled) are checked for overlaps.
+     * We are holding pcidevs_read_lock here, but we need to access
+     * different devices at a time. So, upgrade our current read lock to normal
+     * pcidevs_lock.
      */
+    pcidevs_lock();
     for_each_pdev ( pdev->domain, tmp )
     {
         if ( tmp == pdev )
@@ -321,10 +325,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                 printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
                        start, end, rc);
                 rangeset_destroy(mem);
+                pcidevs_unlock();
                 return rc;
             }
         }
     }
+    pcidevs_unlock();
 
     ASSERT(dev);
 
-- 
2.25.1


