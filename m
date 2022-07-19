Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 979B657A599
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 19:43:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370810.602789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDrFn-0000kU-Ar; Tue, 19 Jul 2022 17:43:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370810.602789; Tue, 19 Jul 2022 17:43:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDrFm-0000eF-IY; Tue, 19 Jul 2022 17:43:26 +0000
Received: by outflank-mailman (input) for mailman id 370810;
 Tue, 19 Jul 2022 17:43:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6sG=XY=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oDrFj-00065R-U2
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 17:43:24 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 490d4515-078a-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 19:43:23 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id mf4so28602384ejc.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Jul 2022 10:43:23 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 wj18-20020a170907051200b0072af92fa086sm6903268ejb.32.2022.07.19.10.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 10:43:21 -0700 (PDT)
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
X-Inumbo-ID: 490d4515-078a-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mjfe83MniR2Jpzqqr5fpFWKhsRCC+quCKfhPY3IFOKo=;
        b=OQ2AVbzzIBKQSpHMBmd5Jzm4KjCKHI2AAmLHJXEljMxRabf2UMa3xCil5cWsSzMrZs
         RwsTk3NLGqkmP3w3yS8GXO+hUMMADmmSeHB7jnhbmLwJNBhZUvWSmztZjBvxxSdZFBaL
         uV8IBGw0b60nevXgPI5yGzPaAA5lgK/7Pep3xuNqVhSy7sAWE1yG1LPFn4MaXmfrKx0h
         mwAAcP+CluaUkKNp7ZSNiw8seuvSI1GhqGZm3/kP2Y3/N+EH/aLXncaQ0b4x7CaY27LQ
         3so8rkxBrQOJx3l2Jmtfzfb9Jua7272wcq92zN4mDgLqnYQhRmOicq39wagsTk+dDqvE
         1DMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mjfe83MniR2Jpzqqr5fpFWKhsRCC+quCKfhPY3IFOKo=;
        b=wEFqAo1J8PP3GiSlADc3JploblLN137V0Oz75lzUmgBtBkMV4t0SheX1LYhJNMu/zW
         5udMsGwNO2Sh4MsOuK9bwiw7OGXtlxaHwRu1/Eej6dyLRbkmxQ7io1BPYp7N67UTQ2G4
         7jDf56Jws7ewZEHokg9GYhI9Hv+6pC3vNfWDvfp6pcLhoPvxbwbWX8ovgztXzY917bTb
         viXeC0N9d68iUv95CPUOPut4mfNZp3OCLYI6VIqZBC1Ss7yHB3MYF50ibL8+hHt25W/W
         W9HUo4fAGP/7YjvBDq6798P/KMKLh4rEpJNZ6QkwaMxMmNs9qIM7mUqTgGtWwHqCyhLE
         X5Zg==
X-Gm-Message-State: AJIora+u8GK+0IJPwx5eJd6KLwowIqoexTgVkV4iY0+/ja/LV+zZFk/h
	SZ2QgcoqtYZ0EH/7Ppl5WjjMkBhsWp8yFg==
X-Google-Smtp-Source: AGRyM1ulGFt/09wDa5Hg84aWzr2K3uZuAfWScHqhuYAENdA5DS01nR+/TJ+ZwDfTeJ2Lg/7e/X6S9Q==
X-Received: by 2002:a17:907:75d9:b0:72b:1472:ba19 with SMTP id jl25-20020a17090775d900b0072b1472ba19mr30896306ejc.657.1658252602444;
        Tue, 19 Jul 2022 10:43:22 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH V7 11/11] xen/arm: account IO handlers for emulated PCI MSI-X
Date: Tue, 19 Jul 2022 20:42:53 +0300
Message-Id: <20220719174253.541965-12-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719174253.541965-1-olekstysh@gmail.com>
References: <20220719174253.541965-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

At the moment, we always allocate an extra 16 slots for IO handlers
(see MAX_IO_HANDLER). So while adding IO trap handlers for the emulated
MSI-X registers we need to explicitly tell that we have additional IO
handlers, so those are accounted.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
---
This actually moved here from the part 2 of the prep work for PCI
passthrough on Arm as it seems to be the proper place for it.

Since v5:
- optimize with IS_ENABLED(CONFIG_HAS_PCI_MSI) since VPCI_MAX_VIRT_DEV is
  defined unconditionally
New in v5
---
 xen/arch/arm/vpci.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 84b2b068a0..c5902cb9d3 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -131,6 +131,8 @@ static int vpci_get_num_handlers_cb(struct domain *d,
 
 unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
 {
+    unsigned int count;
+
     if ( !has_vpci(d) )
         return 0;
 
@@ -151,7 +153,17 @@ unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
      * For guests each host bridge requires one region to cover the
      * configuration space. At the moment, we only expose a single host bridge.
      */
-    return 1;
+    count = 1;
+
+    /*
+     * There's a single MSI-X MMIO handler that deals with both PBA
+     * and MSI-X tables per each PCI device being passed through.
+     * Maximum number of emulated virtual devices is VPCI_MAX_VIRT_DEV.
+     */
+    if ( IS_ENABLED(CONFIG_HAS_PCI_MSI) )
+        count += VPCI_MAX_VIRT_DEV;
+
+    return count;
 }
 
 /*
-- 
2.25.1


