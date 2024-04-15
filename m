Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A482B8A56B0
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 17:43:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706353.1103484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwOU6-00019f-MN; Mon, 15 Apr 2024 15:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706353.1103484; Mon, 15 Apr 2024 15:43:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwOU6-00011k-I3; Mon, 15 Apr 2024 15:43:06 +0000
Received: by outflank-mailman (input) for mailman id 706353;
 Mon, 15 Apr 2024 15:43:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQk4=LU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rwOU4-0000Nb-FT
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 15:43:04 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d816c462-fb3e-11ee-94a3-07e782e9044d;
 Mon, 15 Apr 2024 17:43:02 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a51a1c8d931so433377066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2024 08:43:02 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 jz1-20020a17090775e100b00a526457fc84sm1987261ejc.57.2024.04.15.08.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 08:43:01 -0700 (PDT)
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
X-Inumbo-ID: d816c462-fb3e-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713195782; x=1713800582; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KwG/SvK+aur9Ak8+5b+UV8UOo2svZqs0RzBYX+mlEmk=;
        b=cSap+eBzM4wuLz1xzGg2b6LMSWdzJ6spEEbH7O38LUPvurWI7dwaWJXPfrRbwYo+wd
         NjsrsAm2/Hdg0MToTM7zMYNmM9KPLqq9x6xzHWhEvBAoxwp5aFpBUU6YfS9ZlFLklv3S
         /GZ7RsIm+UO69br4eUW6ar6tHsqjlw6Cj2exQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713195782; x=1713800582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KwG/SvK+aur9Ak8+5b+UV8UOo2svZqs0RzBYX+mlEmk=;
        b=wJxvUGhAe8zzxI++kVQp2MdnphLWRgG9RJTarKQSqnoZLQ8IamEbUYtKJiJX032j+D
         YdcKq5jlWQWifqk2Q7uD35TTUcTzp9ri06n5YacKPemBBKx25/HFxqFhgukBi096SFw9
         Sjl96iLgbt3SGU6YxsRYRKVJDpT4v5b9k9ZEzbemPaVmsYG/qi8Y8odopYrBjXaoSQG5
         YJgisLd7OgA/ft0MayWijEZAWB156jqC0ChfF0ONBA+a5EyQTpvmWUq/XJyUrLavGoSC
         oL+b8sv5nvVFGj/9NwcDTmbiMafTqGm0KEfdrSN0nLMTcwv/hjpP/yKQNiodSSMqnVq+
         +8kA==
X-Gm-Message-State: AOJu0YwAzuLMDhSZlRJL3IiVxUhVwUveieo2kKn2SAqHi+9sZOtKzdIS
	XZ+5wVCxVwPDr2B1/347VddB4Pie9Cpa4XPq47cN/LLGC+cFMiDi9MXMAizd6DRkDj3u0SiPewR
	wBlo=
X-Google-Smtp-Source: AGHT+IFMRTgoBO75/F6759VTwv2svqgv1NIVz46T3NVo7ac4Ptoecbeo+nDmHrqX5jUOSMk/mP+cCw==
X-Received: by 2002:a17:907:d2a:b0:a52:2f19:f1d7 with SMTP id gn42-20020a1709070d2a00b00a522f19f1d7mr7217919ejc.53.1713195781801;
        Mon, 15 Apr 2024 08:43:01 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 4/4] xen/public: Use -Wpadding for public headers
Date: Mon, 15 Apr 2024 16:41:55 +0100
Message-Id: <20240415154155.2718064-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240415154155.2718064-1-andrew.cooper3@citrix.com>
References: <20240415154155.2718064-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RFC.  In theory this is a great way to avoid some of the spiketraps involved
with C being the official representation.

However, this doesn't build.  gnttab_transfer has a layout that requires a
CONFIG_COMPAT if we want to satisfy -Wpadding for both forms of the structure.

Thoughts on whether this cross-check is worthwhile-enough to warrant the
ifdefary?

~Andrew
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
---
 xen/common/Makefile              |  1 +
 xen/common/hdr-chk.c             | 13 +++++++++++++
 xen/include/public/grant_table.h |  7 +++++++
 3 files changed, 21 insertions(+)
 create mode 100644 xen/common/hdr-chk.c

diff --git a/xen/common/Makefile b/xen/common/Makefile
index d512cad5243f..dbbda70829f1 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -15,6 +15,7 @@ obj-y += event_fifo.o
 obj-$(CONFIG_GRANT_TABLE) += grant_table.o
 obj-y += guestcopy.o
 obj-y += gzip/
+obj-y += hdr-chk.o
 obj-$(CONFIG_HYPFS) += hypfs.o
 obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
 obj-y += irq.o
diff --git a/xen/common/hdr-chk.c b/xen/common/hdr-chk.c
new file mode 100644
index 000000000000..1c7a509dcd06
--- /dev/null
+++ b/xen/common/hdr-chk.c
@@ -0,0 +1,13 @@
+#include <xen/stdint.h>
+
+#include <public/xen.h>
+
+#pragma GCC diagnostic error "-Wpadded"
+
+#include <public/grant_table.h>
+
+#ifdef CONFIG_COMPAT
+
+#include <compat/grant_table.h>
+
+#endif /* CONFIG_COMPAT */
diff --git a/xen/include/public/grant_table.h b/xen/include/public/grant_table.h
index 1dfa17a6d02a..a66c77d0166c 100644
--- a/xen/include/public/grant_table.h
+++ b/xen/include/public/grant_table.h
@@ -355,6 +355,7 @@ struct gnttab_unmap_grant_ref {
     grant_handle_t handle;
     /* OUT parameters. */
     int16_t  status;              /* => enum grant_status */
+    uint16_t _pad0;
 };
 typedef struct gnttab_unmap_grant_ref gnttab_unmap_grant_ref_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_unmap_grant_ref_t);
@@ -371,6 +372,7 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_unmap_grant_ref_t);
 struct gnttab_setup_table {
     /* IN parameters. */
     domid_t  dom;
+    uint16_t _pad0;
     uint32_t nr_frames;
     /* OUT parameters. */
     int16_t  status;              /* => enum grant_status */
@@ -409,9 +411,12 @@ struct gnttab_transfer {
     /* IN parameters. */
     xen_pfn_t     mfn;
     domid_t       domid;
+    uint16_t      _pad0;
     grant_ref_t   ref;
     /* OUT parameters. */
     int16_t       status;
+    uint16_t      _pad1;
+    /* XXX compat-dependent padding. */
 };
 typedef struct gnttab_transfer gnttab_transfer_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
@@ -468,10 +473,12 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_copy_t);
 struct gnttab_query_size {
     /* IN parameters. */
     domid_t  dom;
+    uint16_t _ign1;
     /* OUT parameters. */
     uint32_t nr_frames;
     uint32_t max_nr_frames;
     int16_t  status;              /* => enum grant_status */
+    uint16_t _ign2;
 };
 typedef struct gnttab_query_size gnttab_query_size_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_query_size_t);
-- 
2.30.2


