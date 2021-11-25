Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEB445D8B8
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 12:03:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230890.399250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCX8-0005wr-MZ; Thu, 25 Nov 2021 11:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230890.399250; Thu, 25 Nov 2021 11:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCX7-0005az-Jj; Thu, 25 Nov 2021 11:03:17 +0000
Received: by outflank-mailman (input) for mailman id 230890;
 Thu, 25 Nov 2021 11:03:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=68NU=QM=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mqCX3-0001Km-0V
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 11:03:13 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47e1a854-4ddf-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 12:03:12 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id r26so15322225lfn.8
 for <xen-devel@lists.xenproject.org>; Thu, 25 Nov 2021 03:03:12 -0800 (PST)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id bt10sm235165lfb.193.2021.11.25.03.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 03:03:10 -0800 (PST)
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
X-Inumbo-ID: 47e1a854-4ddf-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L3Qpmr6FqZYgDpc5qkrdE2inG3hirALh0cTqSNvXeb0=;
        b=A86ZGJDWrW5wsHgmN6KiObnttHnIdUH0wAEP75NY/1CAZXj9JACsj72sxaSPAyqpeL
         4eRRX7X8olSqt0PoP3cJ7++u6PbI7vkusgzoRpyKPNXRy8wgMIqJ53DsMhRB8lyRHaHk
         Bdfpepnrd+Smph0/u8UyLU94866oVm9OFMA5Ll7+S3hq5rAPeyq/C1fKpVAdXYDspytn
         Rg1N0jc96f7WDkWXJxjJ+wTMrSjsMyeOIYLF4dJg3RAMn1nhECzTTH4g7M99qbEmlrcZ
         KzLZM+hp1JnQTImPHBTCoGo+tzKuPDYoFaWiBkYw/40v5mg4+vve+g0wqGlr/Qkx8O+r
         F13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L3Qpmr6FqZYgDpc5qkrdE2inG3hirALh0cTqSNvXeb0=;
        b=Ck8pL32pqvZxngmmZmMrdmoOB2z3WSgP6mlgQR1V09JVZqrWf1fltZZKG1o1ofSYLe
         cJ2JG+gvFlsD3SVMyKfs2qcP1ZLcHvlfGqVAg+SqZsaOwsYEVtt7bcCtZxM3DGiU5C5j
         ikpUKjVWAn5RuuIihjHaba6gvLSij5OUBVuuofEHGKEYL0t11dFqAKtNQV9jF7esi+Yg
         wRvm6gQ2nf8SzEuol6L14ofF9NdRjMiGKUGFunJKymgnHMtvaHGNN7dOXSd4FqzAJpnc
         2CX+DSrR7lnEQhqZwkY5PK8s8BpvS1aBi7QeBTmWe/UrupFxbLCKVHSZPRDHc7vX1V4b
         lacA==
X-Gm-Message-State: AOAM531+0J7TJDabg1sZDxrvxF+hvlWoc3yU8XyLS76N02B3vnpUi2Ie
	keAucg0FM+UK8D6Do9JAqKpCZwn9cCK9zw==
X-Google-Smtp-Source: ABdhPJyrj13RzkBKxdB8sdeoYBM8yJ42d6o945D4TIYQ05dDgukaapyLHMVXDFefL29quZTh6Cw7jg==
X-Received: by 2002:ac2:4c4d:: with SMTP id o13mr22059581lfk.196.1637838191512;
        Thu, 25 Nov 2021 03:03:11 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v5 13/14] xen/arm: account IO handlers for emulated PCI MSI-X
Date: Thu, 25 Nov 2021 13:02:50 +0200
Message-Id: <20211125110251.2877218-14-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125110251.2877218-1-andr2000@gmail.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

At the moment, we always allocate an extra 16 slots for IO handlers
(see MAX_IO_HANDLER). So while adding IO trap handlers for the emulated
MSI-X registers we need to explicitly tell that we have additional IO
handlers, so those are accounted.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
---
This actually moved here from the part 2 of the prep work for PCI
passthrough on Arm as it seems to be the proper place for it.

New in v5
---
 xen/arch/arm/vpci.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 3d134f42d07e..902f8491e030 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -134,6 +134,8 @@ static int vpci_get_num_handlers_cb(struct domain *d,
 
 unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
 {
+    unsigned int count;
+
     if ( !has_vpci(d) )
         return 0;
 
@@ -145,7 +147,18 @@ unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
     }
 
     /* For a single emulated host bridge's configuration space. */
-    return 1;
+    count = 1;
+
+#ifdef CONFIG_HAS_PCI_MSI
+    /*
+     * There's a single MSI-X MMIO handler that deals with both PBA
+     * and MSI-X tables per each PCI device being passed through.
+     * Maximum number of emulated virtual devices is VPCI_MAX_VIRT_DEV.
+     */
+    count += VPCI_MAX_VIRT_DEV;
+#endif
+
+    return count;
 }
 
 /*
-- 
2.25.1


