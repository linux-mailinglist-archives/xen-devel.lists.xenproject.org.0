Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E4342111E
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 16:12:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201472.356017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOhd-0001vi-Er; Mon, 04 Oct 2021 14:12:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201472.356017; Mon, 04 Oct 2021 14:12:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOhd-0001rx-Af; Mon, 04 Oct 2021 14:12:25 +0000
Received: by outflank-mailman (input) for mailman id 201472;
 Mon, 04 Oct 2021 14:12:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U/Qt=OY=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mXOhb-0008QG-EE
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 14:12:23 +0000
Received: from mail-lf1-x12a.google.com (unknown [2a00:1450:4864:20::12a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fadc80f-0717-4551-9792-16413c61196a;
 Mon, 04 Oct 2021 14:12:04 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id y26so72533785lfa.11
 for <xen-devel@lists.xenproject.org>; Mon, 04 Oct 2021 07:12:04 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id n12sm1076809lfe.145.2021.10.04.07.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:12:01 -0700 (PDT)
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
X-Inumbo-ID: 2fadc80f-0717-4551-9792-16413c61196a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+Ihu8WIsBNrrd/XYg45D3f8fvmiiGUNqVLLkujQ3kSQ=;
        b=P7FVi5NuBKlmOjDovaxcHsNZRDofWPqtuFCfvvhbn0xNCa0CQGm89iQ9ZsvGJHba3W
         s0f5tFt5ltgrt9gCI/v0qEQ4tWx46I7yfrTBL5+LjQgHSvExeS7i8YHyIEk+uITRBdYl
         xQKpm3kBFS0rrUNOia93qQaHI/rgNOPYn0A+L+EdmwQ1PF4sY9k0BAm/ITZBA8ukHi57
         zegm3KJSAhzxH1euJoHijWltm001sKQZLIgyTPVTQ7Kcqx22lxIdPkH5WirvXb/B3H3k
         t/jHyx/x+IBolejEuaeFJQPty82Xg1nmIAfwiAxBQcMOXJzBMeIyooNJ421SRnxcMr8L
         5SwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+Ihu8WIsBNrrd/XYg45D3f8fvmiiGUNqVLLkujQ3kSQ=;
        b=fOd3X2cdTrQKewA6Hg0czKql6yQocTYUg53F+hE3UMYicwdw5f8s/9nVoiVXOQjUXZ
         o2Yf0LWjpiqHlj25eWBX4MpqaPa5RykHQSkoMXh4+fheOiZiq1V+z2ApcSw8v3Tqp9Sb
         k9YE91JgJPsMoxFM32KO7WYLnxxuUCQ3NU+oZJ83MoQZCi9eWg8EiWJXOijMQ/sjehkn
         oq1Id5FoOJQXoABV3gFDAUxV0NW4AkaKW0cILrfYTiug121wEfdOPvr8h0AP2rTrYV6Q
         qbD5NAsRx/3DoXJVnfwzitf0+LwGJzWvdM0LajPXxyTVfI2cSdpPLAU95I6Dw32CmlM6
         GL2Q==
X-Gm-Message-State: AOAM533a0ftl8/KWO5twyE23aoZhzK0dRtTgNe+MDD5u76SnTUk8fIGZ
	yTyzdvDq7kNuekYzn8j0MJi8jlUOua0=
X-Google-Smtp-Source: ABdhPJyHpK9g16BM2BPUWlUCc1BuvoSI7jQvDCN3PstgDPofILOIH1rVzq6oomDhq2WyFkeAx9W9kg==
X-Received: by 2002:a05:6512:3e1e:: with SMTP id i30mr14503161lfv.273.1633356722040;
        Mon, 04 Oct 2021 07:12:02 -0700 (PDT)
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
Subject: [PATCH v4 06/11] xen/domain: Call pci_release_devices() when releasing domain resources
Date: Mon,  4 Oct 2021 17:11:46 +0300
Message-Id: <20211004141151.132231-7-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004141151.132231-1-andr2000@gmail.com>
References: <20211004141151.132231-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This is the very same that we already do for DT devices. Moreover, x86
already calls pci_release_devices().

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Since v1:
 - re-wording in the commit message
---
 xen/arch/arm/domain.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index fbb52f78f1a6..79012bf77757 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -985,7 +985,8 @@ static int relinquish_memory(struct domain *d, struct page_list_head *list)
  * function which may return -ERESTART.
  */
 enum {
-    PROG_tee = 1,
+    PROG_pci = 1,
+    PROG_tee,
     PROG_xen,
     PROG_page,
     PROG_mapping,
@@ -1022,6 +1023,12 @@ int domain_relinquish_resources(struct domain *d)
 #ifdef CONFIG_IOREQ_SERVER
         ioreq_server_destroy_all(d);
 #endif
+#ifdef CONFIG_HAS_PCI
+    PROGRESS(pci):
+        ret = pci_release_devices(d);
+        if ( ret )
+            return ret;
+#endif
 
     PROGRESS(tee):
         ret = tee_relinquish_resources(d);
-- 
2.25.1


