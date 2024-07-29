Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F93993F8F6
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 17:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766873.1177412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRto-0006KG-K7; Mon, 29 Jul 2024 15:02:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766873.1177412; Mon, 29 Jul 2024 15:02:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRto-0006Ig-H3; Mon, 29 Jul 2024 15:02:56 +0000
Received: by outflank-mailman (input) for mailman id 766873;
 Mon, 29 Jul 2024 15:02:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7lGn=O5=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1sYRtn-0006Ia-Dx
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 15:02:55 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a17c0cb2-4dbb-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 17:02:53 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5afa207b8bfso3103068a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 08:02:53 -0700 (PDT)
Received: from EMEAENGAAD91498.citrite.net ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac6339b06esm5848322a12.10.2024.07.29.08.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 08:02:52 -0700 (PDT)
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
X-Inumbo-ID: a17c0cb2-4dbb-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1722265373; x=1722870173; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kBtjsfdsTy7i8mRY2ZgMcr3TDqeVEGFIRB258IV37CA=;
        b=bXl/YNPq/y8M6JBi8jWAAjX9XMi2Fpw7u9H+9a2Lg2scRiErjo3nD3GyUHtrNAvBOb
         KSvxlvxNT7D1U6QjzjLtliXO978D1oBtiMzEQmdzKVoGqKQAdS7VzyfxKZFAQE3c8kiN
         XUnsEp8hfwrHTqaDtvqcvzf/vO/74z4EzFAWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722265373; x=1722870173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBtjsfdsTy7i8mRY2ZgMcr3TDqeVEGFIRB258IV37CA=;
        b=NiZEn4i086rBqFNpaKD+ELC9yoQcjyAdJZz85XbBL2jOg1nbpMssCWFLU2c+Y6nuFf
         IVnNvTKKLHLbwsmGbjT6P72kmn4kIpfjOBTKxQFZh/XxzmUKVl1Dpk2PRGpTl63FLLq8
         5BIvEHuKlnljehKigeI9JvvoUb+l5Cs2Gao9kAzQOzmblTIY3GFFlf6/1fS6LzAYKMcf
         bQHJnwBK2/UwfJWtTrhkjFUdCMUnGOh/K7mnSB5ri06+Ir4+Die+TbzswLbbbSEzbEQR
         llZUDrAf0/sBe5xsO0EHGce8w5MwbLZsl86c+/gPQ6+bvi+/W56eajwxMICnV/l8aBnj
         ai7A==
X-Gm-Message-State: AOJu0Yw2h+DB6CNal7I7FHRJxnkJ+I+Koi0uimidmfBEsUY+7O0UTxkY
	/7D4Pk0S9pdbl6aE3bC3A2yB+OuYxwRax5Z+IzwIu0Oyd4WAs74PxW5v0/VMypIRhlfMFl87Czl
	z
X-Google-Smtp-Source: AGHT+IEklQ96vRviqOT8LlJpDTS1BsN+ypuK42NQSF78PAKQ9a8sQ24qH0SFjgEQUGQ2p/1LYCSRKw==
X-Received: by 2002:a50:d489:0:b0:5a2:1693:1a2f with SMTP id 4fb4d7f45d1cf-5b0208c2d59mr4992714a12.12.1722265372287;
        Mon, 29 Jul 2024 08:02:52 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v6] tools/lsevtchn: Use errno macro to handle hypercall error cases
Date: Mon, 29 Jul 2024 16:02:41 +0100
Message-Id: <cbb751a7fab10d228513bb163c85c83d025330c9.1722265284.git.matthew.barnes@cloud.com>
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
 tools/xcutils/lsevtchn.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/tools/xcutils/lsevtchn.c b/tools/xcutils/lsevtchn.c
index d1710613ddc5..29504c9d2077 100644
--- a/tools/xcutils/lsevtchn.c
+++ b/tools/xcutils/lsevtchn.c
@@ -3,6 +3,7 @@
 #include <stdint.h>
 #include <string.h>
 #include <stdio.h>
+#include <errno.h>
 
 #include <xenctrl.h>
 
@@ -24,7 +25,28 @@ int main(int argc, char **argv)
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
+            case ESRCH:
+                perror("Domain ID does not correspond to valid domain");
+                rc = ESRCH;
+                break;
+
+            default:
+                perror(NULL);
+                rc = errno;
+                break;
+            }
+            goto out;
+        }
 
         if ( status.status == EVTCHNSTAT_closed )
             continue;
@@ -58,7 +80,8 @@ int main(int argc, char **argv)
         printf("\n");
     }
 
+ out:
     xc_interface_close(xch);
 
-    return 0;
+    return rc;
 }
-- 
2.34.1


