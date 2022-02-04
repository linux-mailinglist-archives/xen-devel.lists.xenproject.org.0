Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 199D74A940C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 07:35:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265004.458269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFsBW-0008MR-QE; Fri, 04 Feb 2022 06:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265004.458269; Fri, 04 Feb 2022 06:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFsBW-0008Ga-KY; Fri, 04 Feb 2022 06:35:06 +0000
Received: by outflank-mailman (input) for mailman id 265004;
 Fri, 04 Feb 2022 06:35:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tguk=ST=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1nFsBU-0008DW-TO
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 06:35:04 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95dfe064-8584-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 07:35:04 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id c15so7131145ljf.11
 for <xen-devel@lists.xenproject.org>; Thu, 03 Feb 2022 22:35:03 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id f34sm163027lfv.165.2022.02.03.22.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 22:35:02 -0800 (PST)
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
X-Inumbo-ID: 95dfe064-8584-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fkt1iiffJfOyIvWsY76Bn/20kVLeJA6ML116mlUONbo=;
        b=pf1kd98rLRo4oMne6N5TZmeGAzADdmqWwChEtEtmGzVv81uVsjUztGLFhrbZFULVdE
         59MTje+KtbOtCXsBULQRsNzE7Z0GKfm8Nw3uoeKeNDxFEQ27YfVvizhGZLVmC+00sDzT
         GFycA4Y+NWJf8d8B6RgZYRLHCvA5/lghyY0lo9DewojjjiXB12uVVKO8HA+M0HBKO5gO
         rG+ZOZsp5yjmjQkM3AzPstjUMy4neYoQWjcH+1wdkB/Haj1o90UBHpNfSMawLb1c8u7I
         v/aUtOlxo0Vho4MIeLtOR1Uz9PjDjFjjDrZjHDMGYclAMJJz1cZI9fBx++zFhtF2eGVt
         O/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fkt1iiffJfOyIvWsY76Bn/20kVLeJA6ML116mlUONbo=;
        b=DRIdD5Oapo/yGKjgmf9wgZWDUYkvxnLCZiIttILa8fmgx3g2hjrpBIBdXZBhW/ITFB
         rhvwANbGnd7dhx9qEfJBzuKQDsrOIc6M2VqWQZUEeJOh7dxN+WgmwjIaCbuwWQAFDvjb
         8irAQRi6uVT5yxcdjtrFH7mVvBJtD9YvUm1T49re6JIqmAEjbAkqZyhlmu/4Uu3mIwSn
         zRG9CHQ0QPfDrJkf3AZ6WTg0xdfzeDMPJluzaF3tvRIhL+uIfcvtmNqrp3l26P12HV5C
         T75b3N1hPFQO9dQPL2NMmtwAig033Ulr6udEOjCD4K1rvbxBbEmWJr1Gcx8HdlkxxGNk
         gG3Q==
X-Gm-Message-State: AOAM5303zwEb02k+8Pz8CptI47KHAVGIz4qK+XlNQeU7ccBxWVva6JXl
	ICfgQpeUtqKyhsUDFW+a6qNu8GgivN4=
X-Google-Smtp-Source: ABdhPJxPoAt1JRMWcJlYt+YBJllDqtzQb/8LTegxXLQOdjyAb34lQHAZ/fQnkHFk0AYemOu19Q85wQ==
X-Received: by 2002:a2e:a583:: with SMTP id m3mr934695ljp.530.1643956503315;
        Thu, 03 Feb 2022 22:35:03 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	artem_mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v6 02/13] rangeset: add RANGESETF_no_print flag
Date: Fri,  4 Feb 2022 08:34:48 +0200
Message-Id: <20220204063459.680961-3-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204063459.680961-1-andr2000@gmail.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

There are range sets which should not be printed, so introduce a flag
which allows marking those as such. Implement relevant logic to skip
such entries while printing.

While at it also simplify the definition of the flags by directly
defining those without helpers.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Since v5:
- comment indentation (Jan)
Since v1:
- update BUG_ON with new flag
- simplify the definition of the flags
---
 xen/common/rangeset.c      | 5 ++++-
 xen/include/xen/rangeset.h | 5 +++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index 885b6b15c229..ea27d651723b 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -433,7 +433,7 @@ struct rangeset *rangeset_new(
     INIT_LIST_HEAD(&r->range_list);
     r->nr_ranges = -1;
 
-    BUG_ON(flags & ~RANGESETF_prettyprint_hex);
+    BUG_ON(flags & ~(RANGESETF_prettyprint_hex | RANGESETF_no_print));
     r->flags = flags;
 
     safe_strcpy(r->name, name ?: "(no name)");
@@ -575,6 +575,9 @@ void rangeset_domain_printk(
 
     list_for_each_entry ( r, &d->rangesets, rangeset_list )
     {
+        if ( r->flags & RANGESETF_no_print )
+            continue;
+
         printk("    ");
         rangeset_printk(r);
         printk("\n");
diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
index 135f33f6066f..f7c69394d66a 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -49,8 +49,9 @@ void rangeset_limit(
 
 /* Flags for passing to rangeset_new(). */
  /* Pretty-print range limits in hexadecimal. */
-#define _RANGESETF_prettyprint_hex 0
-#define RANGESETF_prettyprint_hex  (1U << _RANGESETF_prettyprint_hex)
+#define RANGESETF_prettyprint_hex   (1U << 0)
+ /* Do not print entries marked with this flag. */
+#define RANGESETF_no_print          (1U << 1)
 
 bool_t __must_check rangeset_is_empty(
     const struct rangeset *r);
-- 
2.25.1


