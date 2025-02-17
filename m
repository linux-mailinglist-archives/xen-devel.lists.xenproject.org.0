Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FAAA38DA7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 21:48:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890879.1300004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk82Z-0008WA-8n; Mon, 17 Feb 2025 20:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890879.1300004; Mon, 17 Feb 2025 20:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk82Z-0008TA-69; Mon, 17 Feb 2025 20:48:31 +0000
Received: by outflank-mailman (input) for mailman id 890879;
 Mon, 17 Feb 2025 20:48:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kh3E=VI=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1tk82X-0008T4-CI
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 20:48:29 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8964e393-ed70-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 21:48:27 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-54622940ef7so1382114e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 12:48:27 -0800 (PST)
Received: from EPUAKYIW03DD.. ([91.123.151.154])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30925d6e58dsm11934321fa.15.2025.02.17.12.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 12:48:24 -0800 (PST)
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
X-Inumbo-ID: 8964e393-ed70-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739825306; x=1740430106; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R5cVRXKTeO+CcFoe8IyunQeLRM2NGH3rH8e2ToJmI4M=;
        b=goDPqUej16btZJ5t4e1xinvQcIKFqNhzn6BgdvG2sL/sJM2DPhTMF3LpLhVbVZ/NL2
         x8lPqghK01nU26qGGwZ+osAxA702jBHDObO6GNsu/APB9abcTRB56zkzUGBEcBD7K4EO
         GVPUdGZLFlJ6Y0rsrCUL5WcqLIcooz43A2krOPlwrx4g3/w0OTqLteJog8ec5Q4uAoey
         0SOKUDz1WDiQxZVSVAzZu6dVOsVI+uHILyte2Koz8l73p4HynzNyXqesAYUuiR7zTUfR
         hK5ngYB/Wnckfz8bVOneCeAtxW7f+QPhOH15WwJ0tcK+PCZtH+5yyBfhVSkwY1XBB7oB
         hg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739825306; x=1740430106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5cVRXKTeO+CcFoe8IyunQeLRM2NGH3rH8e2ToJmI4M=;
        b=DIOP+VOtc6ScEZ7tJFsAb4Z7c0pRXx/FdTFhs8kXInPbCz1sL/BqUnx63vfo8g6Agq
         tfWLhANahOOSD2VyNm2rOmrSJ1ygE8n+qyX6NrXyj3GGuMItWSKl0Y9ROPs4HPcwi8VF
         RpJAMIhv+Cch4TyGEbQ2Z0azW4NgOnaM4f6nY0u1lrx8pLrOUX5cOhuFH5BtiPv/b1t8
         /NakxfFwdWyE/XiZIAUSBtiraxiTK3j2hrAeMBt8WEL7DU0xjvbWUf17laYpLSS5oXkL
         br1A51eH96lJ2uBtdJ9zMKN8D+Z2weRJE7W0BVBsNl0UUt8sIwX1i8yXlSi5O/IlCBrm
         rxzA==
X-Gm-Message-State: AOJu0YxU4LkKD7wm+aou1Vep19Q6t0SIS2kecHsaLOlRzkU9WHWQT9D6
	nR9gs5R2dlhZcsZMtESKbK24x9YMNSdR8lTCBuckUKZueLWsR9bUc9rvFQ==
X-Gm-Gg: ASbGncueAH5duPYIyxh0zOu/M7NwGFic94TUWqMMVABz2W7cVKQ9pVf870HC4pSBPEm
	TvulRsM6A6FuznbcfgIk7C+QAzxa8yuTQtx+0yvoO3nyJaeNN5OtMZcRHc8T5lcfk5MFiQUK04m
	nKn/iisTsrF6YNEWhCbpUsQxkVcQonnpD5KiQVE6zvoqZqEzljgz1oiU1IGkuEjzHqoT/HYFXps
	rzAdDIf/mLoCc7cmnkjZdy7jil4NDeCJ4EOVeHrdrR59/fTGLTPGcWkYEQu78uFbL+gOIRCzLeE
	wscX/0SWCkV6cP3zb0s=
X-Google-Smtp-Source: AGHT+IF+hbXNblYvm7MkT63YDCVaIXH9M/fqUC4+czfkvvpDRxpsR7QHeZxKFYjXeoYMW4V9yu2+wg==
X-Received: by 2002:a05:6512:3da2:b0:545:e2e:843a with SMTP id 2adb3069b0e04-5452fe9308cmr2675508e87.38.1739825305667;
        Mon, 17 Feb 2025 12:48:25 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] tests/resource: Verify that Xen can deal with invalid resource type
Date: Mon, 17 Feb 2025 22:48:22 +0200
Message-Id: <20250217204822.136437-1-olekstysh@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The sign of the presence of a corresponding bugfix is an error
returned on querying the size of an unknown for Xen resource type.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Refer https://patchew.org/Xen/20250217102741.4122367-1-olekstysh@gmail.com/
Current patch should go in with Xen fix from the link above.

1. w/ fix in Xen:

+ ./tests/resource/test-resource
XENMEM_acquire_resource tests
Test x86 PV
  Created d1
  Test grant table
(XEN) [    8.702293] common/grant_table.c:1909:d0v1 Expanding d1 grant table from 1 to 32 frames
(XEN) [    8.704499] common/grant_table.c:1909:d0v1 Expanding d1 grant table from 32 to 40 frames
Test x86 PVH
  Created d2
  Test grant table
(XEN) [    8.717210] common/grant_table.c:1909:d0v1 Expanding d2 grant table from 1 to 32 frames
(XEN) [    8.719477] common/grant_table.c:1909:d0v1 Expanding d2 grant table from 32 to 40 frames
 [ ok ]
 [ ok ]
Welcome to Alpine Linux 3.18
Kernel 6.1.19 on an x86_64 (/dev/hvc0)

2. w/o fix in Xen:

+ ./tests/resource/test-resource
XENMEM_acquire_resource tests
Test x86 PV(XEN) [    9.839691] common/grant_table.c:1909:d0v0 Expanding d0 grant table from 1 to 2 frames
  Created d1
  Test grant table
(XEN) [    9.846621] common/grant_table.c:1909:d0v1 Expanding d1 grant table from 1 to 32 frames
(XEN) [    9.848796] common/grant_table.c:1909:d0v1 Expanding d1 grant table from 32 to 40 frames
    Fail: Expected error on an invalid resource type, got success
Test x86 PVH
  Created d2
  Test grant table
(XEN) [    9.865235] common/grant_table.c:1909:d0v1 Expanding d2 grant table from 1 to 32 frames
(XEN) [    9.867403] common/grant_table.c:1909:d0v1 Expanding d2 grant table from 32 to 40 frames
    Fail: Expected error on an invalid resource type, got success
 *   Execution of "/etc/local.d/xen.start" failed.
 [ !! ]
 [ !! ]
Welcome to Alpine Linux 3.18
Kernel 6.1.19 on an x86_64 (/dev/hvc0)
---
---
 tools/tests/resource/test-resource.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/test-resource.c
index 1b10be16a6..3f5479cf78 100644
--- a/tools/tests/resource/test-resource.c
+++ b/tools/tests/resource/test-resource.c
@@ -123,6 +123,17 @@ static void test_gnttab(uint32_t domid, unsigned int nr_frames,
         fail("    Fail: Managed to map gnttab v2 status frames in v1 mode\n");
         xenforeignmemory_unmap_resource(fh, res);
     }
+
+    /*
+     * While at it, verify that an attempt to query the size of an unknown
+     * for Xen resource type fails.
+     */
+    rc = xenforeignmemory_resource_size(
+        fh, domid, 3, 0, &size);
+
+    /* Check that Xen rejected the resource type. */
+    if ( !rc )
+        fail("    Fail: Expected error on an invalid resource type, got success\n");
 }
 
 static void test_domain_configurations(void)
-- 
2.34.1


