Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5534421119
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 16:12:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201478.356039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOhn-00039i-2p; Mon, 04 Oct 2021 14:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201478.356039; Mon, 04 Oct 2021 14:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOhm-000373-V2; Mon, 04 Oct 2021 14:12:34 +0000
Received: by outflank-mailman (input) for mailman id 201478;
 Mon, 04 Oct 2021 14:12:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U/Qt=OY=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mXOhl-0008QG-ER
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 14:12:33 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e868626-1a8c-4afb-a1b9-319849fb2127;
 Mon, 04 Oct 2021 14:12:05 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id y26so72533951lfa.11
 for <xen-devel@lists.xenproject.org>; Mon, 04 Oct 2021 07:12:05 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id n12sm1076809lfe.145.2021.10.04.07.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:12:02 -0700 (PDT)
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
X-Inumbo-ID: 7e868626-1a8c-4afb-a1b9-319849fb2127
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WDh679uaxt3D3xG8n+dCNUszLzt3im/1WQOSXJPkVhE=;
        b=HIvpuPPvTQxm3OTLHvl+Tw3Oj3SBy3az2jhK/UzxV42Oc9je52k9hFyz6y33ZEuQSX
         WzcUKPT99S0mmEQUwgbSIXjgTzQ/yY586VLPk2uvwSr3rpCyVlUrTppqznKhsN5E2/YB
         UldBiS9bJ/fs4Tm+CzQDybmbQCMQJvX43OR8cy+SWzUD6lNAzcEVHYznJ4U47WrLi5t9
         W0iaARnFPLag0YC+LhHxM10iyfTdPkEfon74PSjA05kLmtrdgry+vjRJ8PHsKMCo9EZ8
         paDkuXb69ZcUT8Vhy85wLax9E3bpHx6FCiuR6ATpH9r8kwiHO+2ZO6sugk1s+S3dWlZA
         Un/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WDh679uaxt3D3xG8n+dCNUszLzt3im/1WQOSXJPkVhE=;
        b=0LpYe6gN9R44hRo2SPLtZwQD7w2QvT/bSGJqyW1Wb0Apj735JTgdHQa2ISLq3hPEaw
         yQQ53eRMtB00KUY4iTl7YMFBlAIDbqXYqfhjUpOd9wkFLvNFoHWVwd/eAKG04TTATYoW
         cNBv1VNH2MFUFHmF2LGuV+6JQzoH/BojL8XSJbr1FWA/Z23ERKo6CfB65JcAJWW2OMQM
         Hx8H3tgQ6m6xZ4iEjRvGH7hW/xGhuDR7fRvMSFXdafpJb3lgTybgLKZUDn5FnR65bP2+
         HczLoeGtR7Ns5XJCAeYhrFabmIGc64nrP+UR1lwjTpqjm3n2+0cmATFUMUritRvTGvsA
         qQQQ==
X-Gm-Message-State: AOAM531C2lLWnd7WS2fQ21eDBYp7FAvV366bTCd3i3jskZYQ08+BczSV
	X24zsjEVmKlV/sHGoai/hFcROoHnSgmzBw==
X-Google-Smtp-Source: ABdhPJxAec2PEhmXVf/JTyEZPASdhB7S68QQTKy/dhI+wiEenp0e1SIg5plQ7m+2kt83+jHKWv7Dsg==
X-Received: by 2002:a2e:70a:: with SMTP id 10mr16039162ljh.89.1633356723577;
        Mon, 04 Oct 2021 07:12:03 -0700 (PDT)
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
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 07/11] libxl: Allow removing PCI devices for all types of domains
Date: Mon,  4 Oct 2021 17:11:47 +0300
Message-Id: <20211004141151.132231-8-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004141151.132231-1-andr2000@gmail.com>
References: <20211004141151.132231-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

The PCI device remove path may now be used by PVH on ARM, so the
assert is no longer valid.

Cc: Ian Jackson <iwj@xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
 tools/libs/light/libxl_pci.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 1a1c2630803b..59f3686fc85e 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1947,8 +1947,6 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
             goto out_fail;
         }
     } else {
-        assert(type == LIBXL_DOMAIN_TYPE_PV);
-
         char *sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/resource", pci->domain,
                                      pci->bus, pci->dev, pci->func);
         FILE *f = fopen(sysfs_path, "r");
-- 
2.25.1


