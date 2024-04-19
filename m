Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3B48AAC63
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 12:04:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708908.1108101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxl6G-0002cg-4n; Fri, 19 Apr 2024 10:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708908.1108101; Fri, 19 Apr 2024 10:04:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxl6G-0002b6-1c; Fri, 19 Apr 2024 10:04:08 +0000
Received: by outflank-mailman (input) for mailman id 708908;
 Fri, 19 Apr 2024 10:04:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o3Bi=LY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rxl6F-0002MX-7L
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 10:04:07 +0000
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [2607:f8b0:4864:20::82b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28019673-fe34-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 12:04:06 +0200 (CEST)
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-434d0f63c31so11068411cf.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 03:04:06 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 y3-20020ac87c83000000b00434f6c1458bsm1456526qtv.17.2024.04.19.03.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 03:04:04 -0700 (PDT)
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
X-Inumbo-ID: 28019673-fe34-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713521045; x=1714125845; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7mjp33WpBhabm3Id1MQ0ozfzCKuhgzqE8mZPDJPVPI=;
        b=bvxg+fbOOjG1RVwMpbb3WKF6B+y8+Upfl9nRORLwJMa1PrOq0k1ip3ijLrId8lQz/1
         uCaS+8pztTz2tr0/LRaVBSoAEoAzdoiz/Y9HYCQ0911aWSG/VrJ4fap8uPZid0Yq0wKA
         P+V+ZuargtsFQqFL/qLwO3D9nrBU8NZrLjmQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713521045; x=1714125845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7mjp33WpBhabm3Id1MQ0ozfzCKuhgzqE8mZPDJPVPI=;
        b=mbJUjfV32kFozvVom6Qno1sUlPr1pj8VJEW46GCA1EWtyS5iV1SaHiA0YnGeW5O18o
         ZCxMEYPXFWDuBa0ZonQgWT/LAThKAA0DnRm87KeHzA290cQc5fw5zJp7PDhZqyOQRlgN
         Z2qRNaNMFVXwyTU1rKy0fGggiF8hW1KvOj7mOHUs4lDO8vTQBrjFWATES85q4dJf+6pq
         RDpuxfY5XINpynx2B2zKnHSR965/Q8f9CEtHLR9wTDjmcMDDGoP7SapXMB154EyQ0NxX
         WxYkU7B3sPxjtcglsV7RkHxfMGnm17UfWiW87Ud6AWtvGiIArrbATPM0Loj5lWM6l2yf
         lltg==
X-Gm-Message-State: AOJu0Yy2qGtnHZRNOrQQ5HiMVrd1tDBxHNq/7reRVY3548JEHivVAOhh
	tIE6dR+DSiRdcUiGd5jZa6sgcRKlp2pFJdppAStE5PLF87cNv7hvqP2TZRiEc8KIqxGXNlyaZia
	G
X-Google-Smtp-Source: AGHT+IEgt1x7AwSVTqJ5ET+Y/tJF5F5j5c9iPm3TUgRsvlxZq8dumUcHT/9DgBFnQWlxs+lhgiyvrQ==
X-Received: by 2002:a05:622a:189c:b0:434:aed1:844b with SMTP id v28-20020a05622a189c00b00434aed1844bmr1675139qtc.37.1713521044738;
        Fri, 19 Apr 2024 03:04:04 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 1/2] xen: introduce header file with section related symbols
Date: Fri, 19 Apr 2024 12:02:16 +0200
Message-ID: <20240419100217.12072-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419100217.12072-1-roger.pau@citrix.com>
References: <20240419100217.12072-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Start by declaring the beginning and end of the init section.

No functional change intended.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/arm/mmu/setup.c   |  3 +--
 xen/arch/x86/setup.c       |  3 +--
 xen/include/xen/sections.h | 17 +++++++++++++++++
 3 files changed, 19 insertions(+), 4 deletions(-)
 create mode 100644 xen/include/xen/sections.h

diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index c0cb17ca2ecf..f4bb424c3c91 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -7,6 +7,7 @@
 
 #include <xen/init.h>
 #include <xen/libfdt/libfdt.h>
+#include <xen/sections.h>
 #include <xen/sizes.h>
 #include <xen/vmap.h>
 
@@ -62,8 +63,6 @@ vaddr_t directmap_virt_start __read_mostly;
 unsigned long directmap_base_pdx __read_mostly;
 #endif
 
-extern char __init_begin[], __init_end[];
-
 /* Checking VA memory layout alignment. */
 static void __init __maybe_unused build_assertions(void)
 {
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 86cd8b999774..dd4d1b2887ee 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -5,6 +5,7 @@
 #include <xen/param.h>
 #include <xen/sched.h>
 #include <xen/domain.h>
+#include <xen/sections.h>
 #include <xen/serial.h>
 #include <xen/softirq.h>
 #include <xen/acpi.h>
@@ -309,8 +310,6 @@ void __init discard_initial_images(void)
     initial_images = NULL;
 }
 
-extern unsigned char __init_begin[], __init_end[];
-
 static void __init init_idle_domain(void)
 {
     scheduler_init();
diff --git a/xen/include/xen/sections.h b/xen/include/xen/sections.h
new file mode 100644
index 000000000000..b6cb5604c285
--- /dev/null
+++ b/xen/include/xen/sections.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __XEN_SECTIONS_H__
+#define __XEN_SECTIONS_H__
+
+/* SAF-0-safe */
+extern char __init_begin[], __init_end[];
+
+#endif /* !__XEN_SECTIONS_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.44.0


