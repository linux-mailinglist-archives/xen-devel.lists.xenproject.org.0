Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C27946E333
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 08:29:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242717.419796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvDrr-0007h8-DK; Thu, 09 Dec 2021 07:29:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242717.419796; Thu, 09 Dec 2021 07:29:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvDrr-0007em-9F; Thu, 09 Dec 2021 07:29:27 +0000
Received: by outflank-mailman (input) for mailman id 242717;
 Thu, 09 Dec 2021 07:29:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5bTN=Q2=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mvDrp-00075S-7C
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 07:29:25 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbcbace7-58c1-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 08:29:24 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id u22so7572069lju.7
 for <xen-devel@lists.xenproject.org>; Wed, 08 Dec 2021 23:29:24 -0800 (PST)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id f13sm445069lfe.297.2021.12.08.23.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 23:29:23 -0800 (PST)
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
X-Inumbo-ID: bbcbace7-58c1-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5zMEfsrDMgGvbxJE8yizewP5LPSer3MoFR6+sMloccU=;
        b=nwSZwsWRKgJcOzhiHDaN4norjoJ1YzrXrGfYBPtNd/KBeTeU55r2WkRIY7FcwfkxEl
         3OdVmMtxVg5KGNCEiLnMMnFY8VPF3fwNuPnrxOLOWS8XTL4Wf14v2uo8XQhwS6aqzD/2
         GDOa8B7wR6BHtyyF7syfE7V0VW0VrR3RdjMd81J9XarQOE49cL4eHleMJgegOwmDO3vJ
         QYCV3mF0yAAg/+rn6bZsllA5vmMEF/ev0MggvvLTGMO2FhZt2eYqouG6sCuclbN5sKIq
         4DpEWLsl8kB/trlQ0zgMTPJN45daqmiY1prZ9pAA4PJuZWw9zqYvG28YCmVaC3PBxmVD
         DZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5zMEfsrDMgGvbxJE8yizewP5LPSer3MoFR6+sMloccU=;
        b=KHze6+SPyXlB4YIyB5o/jn10wj2X5M2Ub8l6X9aA1nWoi1cBxochsenX/N/U7Ui/5i
         GruRuDikLs9nbv2xbDcRcZnrUOUamicMrTKZX9z24EHCuzx3niO03Dd/+gEEtIL6HQmw
         6q6/NmXVDq0oegQrYQSBb98XbT4v3X0ZVsAYXeEJFO8aoa7E6085zCTAkcjHauyTeI2z
         bLKwVwEmwidSvu8/g/nHdxmUyt1epVQD+PB3R5wUbnMnIHJ0OFfSEl+qfRhH71gWo5Ml
         vKn+eVRDkFSRFxIrblNc34H9ylS1wbuW/YbXDC3x6SMwhPItmYMr8IKMUOSRK11vlznU
         5YMQ==
X-Gm-Message-State: AOAM533Jit4jLC5xiNhyBJ+XZAo/cUWMyjGA2WS0jADkmkHawiVttnyj
	adz2JFrnPC8nCxTxsAryxzkVpOKBl+0eHg==
X-Google-Smtp-Source: ABdhPJzJNMSzJKdK5Un4XS19D0FwAW7BsnV1snLB/1oEAMUDNtrotAwvFJyvrKGJFjYrYJoKKgtucg==
X-Received: by 2002:a2e:b528:: with SMTP id z8mr4648866ljm.178.1639034963970;
        Wed, 08 Dec 2021 23:29:23 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	artem_mygaiev@epam.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v8 3/4] xen/arm: account IO handler for emulated PCI host bridge
Date: Thu,  9 Dec 2021 09:29:17 +0200
Message-Id: <20211209072918.460902-4-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211209072918.460902-1-andr2000@gmail.com>
References: <20211209072918.460902-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

At the moment, we always allocate an extra 16 slots for IO handlers
(see MAX_IO_HANDLER). So while adding an IO trap handler for the emulated
PCI host bridge we are not breaking anything, but we have a latent bug
as the maximum number of IOs may be exceeded.
Fix this by explicitly telling that we have an additional IO handler, so it is
accounted.

Fixes: d59168dc05a5 ("xen/arm: Enable the existing x86 virtual PCI support for ARM")

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Since v7:
- updated comment
New in v7
---
 xen/arch/arm/vpci.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 1564448c6c8d..84aaaaebd69d 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -124,7 +124,11 @@ unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
         return ret < 0 ? 0 : ret;
     }
 
-    return 0;
+    /*
+     * For guests each host bridge requires one region to cover the
+     * configuration space. At the moment, we only expose a single host bridge.
+     */
+    return 1;
 }
 
 /*
-- 
2.25.1


