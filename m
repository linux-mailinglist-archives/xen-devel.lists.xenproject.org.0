Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B73694340A
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 18:19:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768968.1179874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZC2X-0006Yn-F5; Wed, 31 Jul 2024 16:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768968.1179874; Wed, 31 Jul 2024 16:19:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZC2X-0006X1-CG; Wed, 31 Jul 2024 16:19:01 +0000
Received: by outflank-mailman (input) for mailman id 768968;
 Wed, 31 Jul 2024 16:19:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=61WP=O7=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1sZC2W-0006Wv-3l
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 16:19:00 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97227334-4f58-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 18:18:59 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a7a83a968ddso824180066b.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 09:18:59 -0700 (PDT)
Received: from EMEAENGAAD91498.citrite.net ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad9068esm782937566b.153.2024.07.31.09.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 09:18:57 -0700 (PDT)
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
X-Inumbo-ID: 97227334-4f58-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1722442738; x=1723047538; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5zC3HPEws4IIYtj9rD2QA6iPL+Fvw6yU8Hh17lmetT8=;
        b=SNyfUnAM/AV6uOb+GzjzglyT7lOjd6PVY3GbgxB0wOoy5pJB8+tzdrBfbd41qNHx8F
         Q2+0W5jMeowRECYYWW9DfTM48uuawSbSMjkd1yEtbaypSfN2FBCwF3wsi+RxtO49g2VD
         xW+1zJuXRR7CwpRAIqTaFQ6wB9PRusVzDcnrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722442738; x=1723047538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zC3HPEws4IIYtj9rD2QA6iPL+Fvw6yU8Hh17lmetT8=;
        b=m/TdJt7gBnCPqk9Ye/2FBJ+6oATOOcgS3Y8K/RA6+6tUg2GeiVqsXtSbj3L+jilM3D
         HzNDBAZ9LooskPonrZvcyhn4XgHvbL4+cmM0JOYfOOfmuJDWP0Vlzv36GQ/VgvhEf08T
         qYBVN0OpyloQspo/WXZtCl5Dfyu8CgtLpCpoc1hSoDe9+1AUGuNTzIeSbrySGnBmrqIe
         E5PUsn2l7o2NwUNrJTtimbhBitVKIwmao0477coxf6Kk00SlVa7HVHX7yPvVnIeLNshh
         W3WmkPHTn5tN4NtdcgcfeitmJmzbMaQ7jfbr0nKwsdAerE7SbzzydH76UwT4HrJ7+5dI
         l3gQ==
X-Gm-Message-State: AOJu0YxUiaXLBq8EZDTfQv0pUapWi0+w2aUMBnmwPq+j9iRaFGQ8ri7m
	YMY7K5TQZbLXwpkMey/oaG+QEF34DYDA3DmpuP/iXX4f+aWU4XbehRUUiUfTYI5gge8kASDc3Xb
	A
X-Google-Smtp-Source: AGHT+IFjv/4LBO10IXmqnvFnYNmlumiMtnHFjHZgiuyxzbbjLnpE0xQP4sqUCHBHZ8Yd3VynDr/cbA==
X-Received: by 2002:a17:906:ee85:b0:a72:9d25:8ad3 with SMTP id a640c23a62f3a-a7d3ff58047mr934361666b.9.1722442737377;
        Wed, 31 Jul 2024 09:18:57 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v7] tools/lsevtchn: Use errno macro to handle hypercall error cases
Date: Wed, 31 Jul 2024 17:18:44 +0100
Message-Id: <1240a14dea2f75d2e5b8d8e8bb685fac956629c6.1722442563.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, lsevtchn aborts its event channel enumeration when it hits
an event channel that is owned by Xen.

lsevtchn does not distinguish between different hypercall errors, which
results in lsevtchn missing potential relevant event channels with
higher port numbers.

Use the errno macro to distinguish between hypercall errors, and
continue event channel enumeration if the hypercall error is not
critical to enumeration.

Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
Changes in v7:
- All error paths return error code 1 from lsevtchn
- Simplify perror message to failing function "xc_evtchn_status"

Changes in v6:
- Add blank space before label

Changes in v5:
- Code style changes to switch statement

Changes in v4:
- Catch non-critical errors and fail on everything else, instead of
  catching few known critical errors and ignoring everything else
- Use 'perror' to describe miscellaneous critical errors
- Return appropriate error code from lsevtchn tool
- Tweak commit description
---
 tools/xcutils/lsevtchn.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/tools/xcutils/lsevtchn.c b/tools/xcutils/lsevtchn.c
index d1710613ddc5..30c8d847b814 100644
--- a/tools/xcutils/lsevtchn.c
+++ b/tools/xcutils/lsevtchn.c
@@ -3,6 +3,7 @@
 #include <stdint.h>
 #include <string.h>
 #include <stdio.h>
+#include <errno.h>
 
 #include <xenctrl.h>
 
@@ -24,7 +25,23 @@ int main(int argc, char **argv)
         status.port = port;
         rc = xc_evtchn_status(xch, &status);
         if ( rc < 0 )
-            break;
+        {
+            switch ( errno )
+            {
+            case EACCES: /* Xen-owned evtchn */
+                continue;
+
+            case EINVAL: /* Port enumeration has ended */
+                rc = 0;
+                break;
+
+            default:
+                perror("xc_evtchn_status");
+                rc = 1;
+                break;
+            }
+            goto out;
+        }
 
         if ( status.status == EVTCHNSTAT_closed )
             continue;
@@ -58,7 +75,8 @@ int main(int argc, char **argv)
         printf("\n");
     }
 
+ out:
     xc_interface_close(xch);
 
-    return 0;
+    return rc;
 }
-- 
2.34.1


