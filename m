Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B437E415EED
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:55:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194110.345824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOFz-0007yC-E1; Thu, 23 Sep 2021 12:55:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194110.345824; Thu, 23 Sep 2021 12:55:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOFz-0007ua-8q; Thu, 23 Sep 2021 12:55:19 +0000
Received: by outflank-mailman (input) for mailman id 194110;
 Thu, 23 Sep 2021 12:55:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD/Q=ON=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mTOFy-0004it-3r
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:55:18 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1abdf6a5-2656-4396-8478-8e678bb67c52;
 Thu, 23 Sep 2021 12:54:50 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id t10so26348964lfd.8
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 05:54:50 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id l7sm453584lfk.52.2021.09.23.05.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:54:48 -0700 (PDT)
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
X-Inumbo-ID: 1abdf6a5-2656-4396-8478-8e678bb67c52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kD50gSwDk757eJ2CQu1b9/IhYMvfHenQQYtu99uRv54=;
        b=A/GZKDhDtUFyfAXRqux8zSAjOsg67lOWqEd8gnbAkBjf2ZcGl8o6Lt2rIX9xn/hQzZ
         rboPJFgUMKOheXmwh3W/Jd2UFU683MeJ1NIGWoN+edqTbrnPSnsl28LpC9JyN1tDT0k0
         Xf2Bn3bHXhIaitQTbOqI5ThtQH4kBtOS8Fwf46mytqTm8l9Dxe5Ewfgfan1wj69tp0wD
         pLrMJx8cFSTkjiDbWoW8yYPhsRwrjufX43JQOguZ1/NbfCO1sBLv4hFk0P8RD49NrO3Z
         wcBip5MjV3N4WQmtEH70DxZXCJOxDbkiQkdkg87+UK+st8ok6tvvp9XqAzXeYQW9fQb9
         woBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kD50gSwDk757eJ2CQu1b9/IhYMvfHenQQYtu99uRv54=;
        b=4G/cqHJoElX1BDeWf9th8pyS1aPy1uFMhhLbuSIFI/JfGdD3qH6nl/14dMOdUkjdhu
         luiSGvyh/tngYD7Z0nWIaXrlXSxdonYNJO9fxMQ48/SYXNSDrjpl/MLsApqmDFqDU02g
         j/8iQ9z6MsPSBDQ7w4KGObUun9BboTHGYuaiZEzTY3L0pthT+6RkwQCXqqHOKOVIZcJb
         mT5b2th6QGYtoOcp4KItNUki+ICChLRSy8qryHxyxxbivQwYbuXoudYDkUt6ZlEFxfCI
         VxIVs8Tzyj0Hw09ot264Uo4TABLyW3qN512NZlStCjP0e5ACBYNa91A5Q12y0Z1vqvoZ
         gJ3A==
X-Gm-Message-State: AOAM531/Ilh1s3X+oxBB6TfeM5/ZgBT/luJ01jMVYLKIOjTzAfnrPFnH
	zJfy0OC/ZuLtUwAF92H1L2mjXogV4PBJpw==
X-Google-Smtp-Source: ABdhPJyPiC8+p5vTdecL32CVkX94l6rOzV6gWgEpMuOEU8GwMMl02WWx8nK2vMBCUYk8LpGC2ea0bQ==
X-Received: by 2002:a2e:9c43:: with SMTP id t3mr5005948ljj.198.1632401689231;
        Thu, 23 Sep 2021 05:54:49 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 07/11] libxl: Allow removing PCI devices for all types of domains
Date: Thu, 23 Sep 2021 15:54:34 +0300
Message-Id: <20210923125438.234162-8-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923125438.234162-1-andr2000@gmail.com>
References: <20210923125438.234162-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

The PCI device remove path may now be used by PVH on ARM, so the
assert is no longer valid.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
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


