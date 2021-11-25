Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC20445D8A7
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 12:03:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230874.399131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCWp-0001kd-0F; Thu, 25 Nov 2021 11:02:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230874.399131; Thu, 25 Nov 2021 11:02:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCWo-0001d0-O0; Thu, 25 Nov 2021 11:02:58 +0000
Received: by outflank-mailman (input) for mailman id 230874;
 Thu, 25 Nov 2021 11:02:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=68NU=QM=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mqCWm-0001Km-TI
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 11:02:56 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e3d595f-4ddf-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 12:02:56 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id b40so15315526lfv.10
 for <xen-devel@lists.xenproject.org>; Thu, 25 Nov 2021 03:02:55 -0800 (PST)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id bt10sm235165lfb.193.2021.11.25.03.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 03:02:54 -0800 (PST)
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
X-Inumbo-ID: 3e3d595f-4ddf-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RCl87Let7v1piBQuF1AwGWgI3o9wVtyo4nCoCPCgQzo=;
        b=S3Ibnsg8Hp3Woi8/hIXa47CEs0zstSsM52a2powxFZx/nQ3ysic3FE5vVAAI6LSPu4
         /bQooWMpp1ftaWMQ7weQIQD58y1c/y8GCvF5SBTE0SflwquVXE1rwiEq3iwAbwmMmxby
         2SjioFB9nbWIRc6BPhiahe4udlZB+E2LpacABoDsxLEpZuJKKzRlONFIp9+y8b2uTk6m
         P9BLS6Sd5tv+OiY+UkAAZYRMCSKeDwsvFJT4TYCVoVrmt8lXS6VQvMcLUAmXzlGs3woD
         Seffm80pcxa7hKgQpf++cSfKgg3ocUg+HMyPKEmzlHeaz0lGaojRl1kvN5hKFWweYx3G
         zYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RCl87Let7v1piBQuF1AwGWgI3o9wVtyo4nCoCPCgQzo=;
        b=lbwerSWHT+fD6nXHb8auOHrlayHHwMP7iU4VgFogsMjOfaZ5CM2Q3dr+3BU4RWFYFn
         kEhguVLEYEoWZ1UPvKcVIEUQ3bei9KdmZgMLVoz7eJRkKB2B0EDpoE10E0b8uJq6dz/f
         FABruD6vRf2zTqU5lWvC0L+OVXw9kKZrlDrO/SRzi4nZlHa5XpBFvUh6esddgG34o47N
         IJx3NGc24qX6iQZhnHtqxLOHRlNvw4/MpIUQzt6BXzdhOpBUhrMd/+PwkpXvCuOJRvC+
         xfPNqynY/ajVzsvp2WOhnKxVGvy66gOGz1RiohW0OngT9ibB/IZpvDqfniHGrV+R+/zl
         C65w==
X-Gm-Message-State: AOAM533oz5WApc/uFIPXs78L8paS18pX21yhsoP6gn/dQQpiSYPzeyoz
	4N+jdZa32/w0PC4BvAaTDPpcXn7EMbB+GA==
X-Google-Smtp-Source: ABdhPJxRnShat0Qo6e0njAtYNAACw/nqPCn7aYjsxR9gy+3mgzPQ4pkCvYI87GgT3WFpxBgseaGzjA==
X-Received: by 2002:a05:6512:3a90:: with SMTP id q16mr22510651lfu.135.1637838175293;
        Thu, 25 Nov 2021 03:02:55 -0800 (PST)
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
Subject: [PATCH v5 01/14] rangeset: add RANGESETF_no_print flag
Date: Thu, 25 Nov 2021 13:02:38 +0200
Message-Id: <20211125110251.2877218-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125110251.2877218-1-andr2000@gmail.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
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

---
Since v1:
- update BUG_ON with new flag
- simplify the definition of the flags
---
 xen/common/rangeset.c      | 5 ++++-
 xen/include/xen/rangeset.h | 7 ++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

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
index 135f33f6066f..045fcafa8368 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -48,9 +48,10 @@ void rangeset_limit(
     struct rangeset *r, unsigned int limit);
 
 /* Flags for passing to rangeset_new(). */
- /* Pretty-print range limits in hexadecimal. */
-#define _RANGESETF_prettyprint_hex 0
-#define RANGESETF_prettyprint_hex  (1U << _RANGESETF_prettyprint_hex)
+/* Pretty-print range limits in hexadecimal. */
+#define RANGESETF_prettyprint_hex   (1U << 0)
+/* Do not print entries marked with this flag. */
+#define RANGESETF_no_print          (1U << 1)
 
 bool_t __must_check rangeset_is_empty(
     const struct rangeset *r);
-- 
2.25.1


