Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD873FFDFD
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 12:09:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177992.323866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM68L-00080B-QF; Fri, 03 Sep 2021 10:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177992.323866; Fri, 03 Sep 2021 10:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM68L-0007xZ-Ls; Fri, 03 Sep 2021 10:09:17 +0000
Received: by outflank-mailman (input) for mailman id 177992;
 Fri, 03 Sep 2021 10:09:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=93bQ=NZ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mM68K-0004Cr-An
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 10:09:16 +0000
Received: from mail-ej1-x635.google.com (unknown [2a00:1450:4864:20::635])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81dc2936-e1af-40c8-8a27-a24992fd589f;
 Fri, 03 Sep 2021 10:08:44 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id mf2so10990948ejb.9
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 03:08:43 -0700 (PDT)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id p5sm2427187eju.30.2021.09.03.03.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 03:08:42 -0700 (PDT)
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
X-Inumbo-ID: 81dc2936-e1af-40c8-8a27-a24992fd589f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9oZWyDoHrlYE4f9O9pDC/GUYZqq2tbn79VvRAgG5sU8=;
        b=G0v5SVgVhnp27fzhTFh/t3t6T3ZG3N3FQIFEBpPCV7HbEmNwdwHCsDna9Ka/KxV5FU
         DxTwEW485P0l8KGipmtwsR4PUeZba5wv3+Fu/ntpk5rL4UwSUtnBWGZYnBKUOM42NxuJ
         GFgt36WnRDm+PUd1QAGp4A2cQ2ZxqVUvShjebP00K+B1HTsHQQkU3uLmPWxgKL0AJPtb
         aznDETYoKDAewvu3eFK5aeZmP/KclS4BjcmZC+3sJHmxn1JpWg7lOPN/kWaaXmSgMb8e
         JqOVncQSXD/xA4F426v3mWQvQi+W2MGFum99JYmvYKVxmw6AeK1htZrltbHDiaSMYs2Q
         MMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9oZWyDoHrlYE4f9O9pDC/GUYZqq2tbn79VvRAgG5sU8=;
        b=Ul5ha2HbBHeFKU56A9FmD89nbB41SnxF5p4NO3s0lTyS/i2jSY94clHHGBlMRvu5Pb
         R+FZdRi1AssRf/R98fuBSuQbzexSwpDKH5D6WeWoNYBhRsbKzAFeAQ2dCCHVS3kW48Yr
         oh0uzN+gzfLxTuVdhpGJruzP39PZlHEXUzNy8YJk85Mh4PVoRco/Nz+SUyOGOaCCJVj/
         avBvwXftKBd0+zzkojEUvWHA+q9DBLrqWulwhrs7i+3wKSlOkmleWU4HyPUvssQCH+wi
         XcGMc3zMlannMfrlUBiW+YDS9TE9i+q50PJ0rEFPBNLxR91oYmCGOxEN986gTtmg2hya
         f8Kg==
X-Gm-Message-State: AOAM530t0rSAulO2Tr5mbpKDyYH5bn482wOLwLHWZUUq6kRc6muezO5m
	b5RsjRZOtucJLIyYUMYBWvAf0AVt3G8=
X-Google-Smtp-Source: ABdhPJwC0I+pj81VPq5Z8aniIDBjWrsyNx1aYeEbgRJViZP4d+n9MV4hh4STMk34EUBwp0NwdeCIrw==
X-Received: by 2002:a17:906:748e:: with SMTP id e14mr3277798ejl.152.1630663722931;
        Fri, 03 Sep 2021 03:08:42 -0700 (PDT)
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
Subject: [PATCH 8/9] vpci/header: Reset the command register when adding devices
Date: Fri,  3 Sep 2021 13:08:30 +0300
Message-Id: <20210903100831.177748-9-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903100831.177748-1-andr2000@gmail.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Reset the command register when passing through a PCI device:
it is possible that when passing through a PCI device its memory
decoding bits in the command register are already set. Thus, a
guest OS may not write to the command register to update memory
decoding, so guest mappings (guest's view of the BARs) are
left not updated.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/drivers/vpci/header.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 7416ef1e1e06..dac973368b1e 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -811,6 +811,16 @@ int vpci_bar_add_handlers(const struct domain *d, struct pci_dev *pdev)
         gprintk(XENLOG_ERR,
             "%pp: failed to add BAR handlers for dom%d\n", &pdev->sbdf,
             d->domain_id);
+
+    /*
+     * Reset the command register: it is possible that when passing
+     * through a PCI device its memory decoding bits in the command
+     * register are already set. Thus, a guest OS may not write to the
+     * command register to update memory decoding, so guest mappings
+     * (guest's view of the BARs) are left not updated.
+     */
+    pci_conf_write16(pdev->sbdf, PCI_COMMAND, 0);
+
     return rc;
 }
 
-- 
2.25.1


