Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EBC3FFC19
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 10:34:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177852.323624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4eZ-0001Xm-Uh; Fri, 03 Sep 2021 08:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177852.323624; Fri, 03 Sep 2021 08:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4eZ-0001T7-Q3; Fri, 03 Sep 2021 08:34:27 +0000
Received: by outflank-mailman (input) for mailman id 177852;
 Fri, 03 Sep 2021 08:34:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=93bQ=NZ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mM4eY-0006kQ-Df
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 08:34:26 +0000
Received: from mail-ej1-x62e.google.com (unknown [2a00:1450:4864:20::62e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0898630a-f5e4-4ab6-8354-bf16210b9e36;
 Fri, 03 Sep 2021 08:33:58 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id me10so10462374ejb.11
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 01:33:58 -0700 (PDT)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id i7sm2311932ejx.73.2021.09.03.01.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 01:33:57 -0700 (PDT)
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
X-Inumbo-ID: 0898630a-f5e4-4ab6-8354-bf16210b9e36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kD50gSwDk757eJ2CQu1b9/IhYMvfHenQQYtu99uRv54=;
        b=G9YXRhru3uNLxB1PDUiun9J9pMrCuA67iL9Y2S0hbpXL6f5CH2X0QxIT5S1a9tUVI0
         ngdOqG5buY4ynepqOc4Mqw/59P8H5sjq34iVC/u0iXKce95prSaaImHKqsL0PaYH7vcE
         D1V6AOs2vm4fw/w3cgP9IhSPze4c2q6V0JyGGMv/a3ElMGbTNF0S7auFCdB0/MVNyqHt
         MSsg6wqzDA1lelto4azizexS43392uIQej/nGbEwF7OGVlS74cihi3/3uWxljNDqJhHU
         wFIzTiQMGRpJzgDNE4+dQa/3yv3zMkXoX1BmCUXGm3S/B7/wgbcEBjWuZCJOL6udh3zY
         kX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kD50gSwDk757eJ2CQu1b9/IhYMvfHenQQYtu99uRv54=;
        b=AP9HIzrCzQkFkZvqieTGE4tmU+0QANe3qh/xgxiywNDWgviFk0YWP8YwbWKO5e0JoX
         7VfKO2dAT/dMkoNTCtzWwwdLHfKWWK9qIBrtnVuc1WTKjhyrob7hDBMRVYIXhABpeDui
         C9bvM3qArCy6hfhVIwyLJUw9EAfE+v1q7JQuFVXI9MX1vQyqzM/lrU8wt+dbj6+sVh7g
         6aqrsJZro0owjPWvFQUmw8zcltCArkgxX/pJmMnAXF91fxajQYfnItw2bHbm3S0fzuKi
         B8cGRUudIGaoFiJC5fUQqCop5n7MuaTYiGmiGPbjEN0EtEHQWASH645RT5eWuhp1ZAVq
         eKhA==
X-Gm-Message-State: AOAM533KzecWeoojC2rWm7Gni1Du+O0rT40VNhGHm+p+LhXB8GYxfmoQ
	XtAkmYVHree4A9HaC2c44t8VqYf/cMs=
X-Google-Smtp-Source: ABdhPJzGKTmhAkRttkjaVwij4GDfdpVmfRmx6aBuBdUijcAaoOwlRu3VoW1BGbNMMqkWyy5d8+/pYQ==
X-Received: by 2002:a17:906:9b1:: with SMTP id q17mr2879682eje.546.1630658037434;
        Fri, 03 Sep 2021 01:33:57 -0700 (PDT)
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
Subject: [PATCH 07/11] libxl: Allow removing PCI devices for all types of domains
Date: Fri,  3 Sep 2021 11:33:43 +0300
Message-Id: <20210903083347.131786-8-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903083347.131786-1-andr2000@gmail.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
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


