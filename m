Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 025C4426456
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 07:56:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204341.359529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYirc-0001t4-Bn; Fri, 08 Oct 2021 05:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204341.359529; Fri, 08 Oct 2021 05:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYirc-0001ok-75; Fri, 08 Oct 2021 05:56:12 +0000
Received: by outflank-mailman (input) for mailman id 204341;
 Fri, 08 Oct 2021 05:56:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ipo1=O4=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mYira-0007cA-Kd
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 05:56:10 +0000
Received: from mail-lf1-x12e.google.com (unknown [2a00:1450:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1aee4013-3614-4fc5-b8e1-57dc7b49f9fe;
 Fri, 08 Oct 2021 05:55:46 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id x27so34677426lfu.5
 for <xen-devel@lists.xenproject.org>; Thu, 07 Oct 2021 22:55:46 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id f8sm151147lfq.168.2021.10.07.22.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 22:55:44 -0700 (PDT)
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
X-Inumbo-ID: 1aee4013-3614-4fc5-b8e1-57dc7b49f9fe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gze8iYmqiF2cMvijBG4Ld8cLztnOhc60UjeRzFilfH0=;
        b=S5cKZo3IYyM/uvuPtHNfJ0qEZUbg4C2bKsgzSnRxa5gX2KNUsUPpivR/rpdGo5P022
         LSH383eq4HAUrIrekVaRgj7JZ0jT3drDXxPyVVWrF08ePLpdS4TnUQlq1/3vFO9DUFjq
         CFhDu7XaIAsGmjjL93CtYXUaop8JJ3qR/ns6hdlYgmvJlBG8Qe9Ul6ZodP8uKhMVDhvG
         d9UcWLsRhuvSkMNwcPLXbLvIv/ndFgTHGkzV7QMGENGQ3Ix03r+JKLFQx38dEaFTGD57
         /Bdon7kFwOJT5/lZrdk21Bg+R+y8p4PFOzbfm2aI3In0PhHdbDqIPKd97X3MnZRzVBO+
         t6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gze8iYmqiF2cMvijBG4Ld8cLztnOhc60UjeRzFilfH0=;
        b=Ty0G4ML6IOTCw8QBqIxsvzC98/9sqHX0Sf2evOJF3N5d/kLheQMMYAx+Zf2t3zjv8j
         eRslQytOUa2hf96xtU722UGfsDHHU68CuMku7qeUyTB5Ux2MCjW4LiADG25DsnTzOrjw
         yFmHRXDaJTGFBUBtJJ8knrpFSySNwPFlPJ/ccvOvy4tKr0PSq4FALlzpfPuGaaAxd4S1
         NnuJvaVc1VvuWFCLS4wcw48T/VbxAWF4hxMWabCkPerjWTiYTyeP1gYx43LD2t9o38ZW
         u2BcVLnUC8OzmZ5Ty8aw4epKwgPKUI/aB0rUe+GBEAiKtokUw7OEfM2UuazgJvZmN+gI
         6cVg==
X-Gm-Message-State: AOAM530p00wNumqjPPmcRQF3kubYVfKGQXsOnMWg/cZKWt446RzntbJi
	maeAxNrd4MswFCRjcq4eyGW9YDlOQDA=
X-Google-Smtp-Source: ABdhPJwmcEvN71rOOpBhumTj6iAvUbtG04zcFvN4XV0h/MXlqBNJpABcP9VxDYwCcBTXd7RmlCpWlQ==
X-Received: by 2002:a05:6512:398c:: with SMTP id j12mr8483974lfu.631.1633672545224;
        Thu, 07 Oct 2021 22:55:45 -0700 (PDT)
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
Subject: [PATCH v5 06/10] libxl: Allow removing PCI devices for all types of domains
Date: Fri,  8 Oct 2021 08:55:31 +0300
Message-Id: <20211008055535.337436-7-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211008055535.337436-1-andr2000@gmail.com>
References: <20211008055535.337436-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

The PCI device remove path may now be used by PVH on ARM, so the
assert is no longer valid.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
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


