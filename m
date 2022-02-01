Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D73374A614E
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 17:25:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263633.456441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEvy0-0005dM-V1; Tue, 01 Feb 2022 16:25:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263633.456441; Tue, 01 Feb 2022 16:25:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEvy0-0005V4-Nz; Tue, 01 Feb 2022 16:25:16 +0000
Received: by outflank-mailman (input) for mailman id 263633;
 Tue, 01 Feb 2022 16:25:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=scQ7=SQ=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1nEvxz-0005Ky-Nh
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 16:25:15 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 895883a9-837b-11ec-8eb8-a37418f5ba1a;
 Tue, 01 Feb 2022 17:25:15 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id x23so35118545lfc.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Feb 2022 08:25:15 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id z20sm2037887ljn.92.2022.02.01.08.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 08:25:13 -0800 (PST)
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
X-Inumbo-ID: 895883a9-837b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zf0SXmh7ppwJ/thacBkxdMQhMGMB2nHh2LPFDThcNGk=;
        b=XpJvvbpEUYoLErsZRXX4lG9uNB57vhEPnHdXBzXza3jFxQkF3ceyXYdmRu/zzVxNo9
         wS3WRaDKhYg42tjm37yfrqROI2/XNaY9mFYAeiQmlkQjWTNBYFlRm1bKj1IzsDEabg2Z
         ZXB+4Bu6dchfZJqi0iSgCrkEawgQXCAOWb1NbhfDM9dBa6NSLEO7oVnZ1oG6bIDrRDTp
         TKooKs1VjJxCRogreuWA4kxNK6j3cE98NOO3J5GgH7MgfyFo0b5/6jta7RYuKY6lfLuv
         4lArSFjFF8BG2Ik5HQS9KDhGIEz20Atl8FyxnHj1x1Zu3TrYH6+x11pnvnAF0wgbE1WT
         iIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zf0SXmh7ppwJ/thacBkxdMQhMGMB2nHh2LPFDThcNGk=;
        b=7lakmGsSd5T6hlySshD+HXDI7fOzAY4T7lYUazsOIqV2vXCkCrAICmm93nDJXNw4Mz
         GQ222DUcEcXCrZnmAh/JI3Egqxl8QKPVdpuAodqAdDxYkmWBrmo9scfwWcJQ7I6Ars/o
         1/Tu7+xE5bA8BvV3igEuVKZPVn7BTcdflE7G97urEmfG2aWutC62udmWKDUQEs8hyeXZ
         299WVN4VFPgQ4PYDuBvwt8wqmA7oGbKzSwrUFDyCdGBKatTC5wSNzaL1shAEfiehNR8O
         eUwXW10Bmw1D1y7jkRuoedi6d7sSjJG/ZR/kW5Qq5ErnZ0ZifCA6U0L2EGpgLbYka++y
         UmEw==
X-Gm-Message-State: AOAM533h7JKhhY1vepMcGvpGVmblDkWpatOkkgZ7BmWgyGbbyGzbzCPb
	oG7Ll3SZFN4AUD/AuVng2M7eQdi1/bs=
X-Google-Smtp-Source: ABdhPJyCvek8axmHS9oDXcyCrEQe3WzO0YHajhyUR+ohQ84kFaRbCqkLApNwjlY30/Vp5rNK+RSDQg==
X-Received: by 2002:a05:6512:10d6:: with SMTP id k22mr20503490lfg.243.1643732713986;
        Tue, 01 Feb 2022 08:25:13 -0800 (PST)
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
Subject: [PATCH 2/4] rangeset: add rangeset_reset helper function
Date: Tue,  1 Feb 2022 18:25:06 +0200
Message-Id: <20220201162508.417008-3-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201162508.417008-1-andr2000@gmail.com>
References: <20220201162508.417008-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

This helper destroys all the ranges of the rangeset given.
Please note, that it uses rangeset_remove_range which returns an error
code on failure. This error code can be ignored as while destroying all
the ranges no memory allocation is expected, so in this case it must not
fail.

To make sure this remains valid use BUG_ON if that changes in the future.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/common/rangeset.c      | 6 ++++++
 xen/include/xen/rangeset.h | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index ea27d651723b..9ca2b06cff22 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -525,6 +525,12 @@ void rangeset_swap(struct rangeset *a, struct rangeset *b)
     write_unlock(&b->lock);
 }
 
+void rangeset_reset(struct rangeset *r)
+{
+    /* This doesn't allocate anything and must not fail. */
+    BUG_ON(rangeset_remove_range(r, 0, ~0ULL));
+}
+
 /*****************************
  * Pretty-printing functions
  */
diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
index f7c69394d66a..e0d70d88bdd7 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -95,6 +95,9 @@ bool_t __must_check rangeset_contains_singleton(
 /* swap contents */
 void rangeset_swap(struct rangeset *a, struct rangeset *b);
 
+/* Destroy all ranges. */
+void rangeset_reset(struct rangeset *r);
+
 /* Rangeset pretty printing. */
 void rangeset_domain_printk(
     struct domain *d);
-- 
2.25.1


