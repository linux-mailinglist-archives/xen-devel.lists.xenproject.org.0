Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAA693D71F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 18:40:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765714.1176380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXNzj-0008CP-JC; Fri, 26 Jul 2024 16:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765714.1176380; Fri, 26 Jul 2024 16:40:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXNzj-00089h-G7; Fri, 26 Jul 2024 16:40:39 +0000
Received: by outflank-mailman (input) for mailman id 765714;
 Fri, 26 Jul 2024 16:40:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kt2q=O2=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1sXNzi-00089Z-1Z
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 16:40:38 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c922b669-4b6d-11ef-bc00-fd08da9f4363;
 Fri, 26 Jul 2024 18:40:37 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5a2ffc3447fso2730279a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 09:40:37 -0700 (PDT)
Received: from EMEAENGAAD91498.citrite.net ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acac615c0sm195437766b.97.2024.07.26.09.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 09:40:35 -0700 (PDT)
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
X-Inumbo-ID: c922b669-4b6d-11ef-bc00-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1722012036; x=1722616836; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LO45yhSQCcSMoa4fk6/H17U+Lx8XN6Ubl0ffAptUvJI=;
        b=S34yoHx3yP+9NPibhK1MIwai2FKXjHxusIyRKorBuS6TDLdiCnfvVg10g/0ZCPEr78
         p86vmuY30LnOfTrpyghKTeSk8C5V6tjI2lfG2Y9r8Bkr4VKqTOQIJ4jmsbnIYr0rDu87
         sJZryL+uy5VqV5YfTDS8ijXy8F54qy0hBnPMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722012036; x=1722616836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LO45yhSQCcSMoa4fk6/H17U+Lx8XN6Ubl0ffAptUvJI=;
        b=GXpY81N1cEbSmnuHOpt9f0YTulcUC3TQSdUYKQhvsKDft5hX9yy3zNTM11YHxkiwP/
         bYN7PnGGvp/JO4y3elmP62lO0ux2kpsMBZabdkmIzSuUO5RMqlkS6MzYEJbIh3mCJAUp
         UD/Ka1MBXkfqp9lR0df88FA7AwPkTmI810EuIG1mwk0l9Frbp39x8oXWgXKZZAM/MwmO
         fnctq6X37BccWaRJRZYJ0Wfk7PfdEligXFEUqteJl91MwwvLyQA4mZm7BkkgEJWBuS8M
         mCp2wML0HRHVY9hUVJPuw0f5pA5tv4E67XXBhANZpktGNdBAyGGKL+3uFn+cGenHKYD9
         dlsQ==
X-Gm-Message-State: AOJu0Yw7MOYWavxpB73CpeGaMTcomkrb6qs2bTI0qcIWB3n35a1g8L/h
	9Xk6IfzoYay5uMh9YM7eZHXnLhlm+99/jvaTdmpv7JUo+GYs8b1J3B1mF7G8/Xk/pG3hpf9ex00
	U
X-Google-Smtp-Source: AGHT+IHjqHCEBSuT/dvqjRlG2EYBj4qLNYlOMmVv+H/rd2GXyRnk+AIHpWJ8Tzq9gH0n/jJ8YMd2SQ==
X-Received: by 2002:a17:907:874c:b0:a7a:9f78:fef with SMTP id a640c23a62f3a-a7d400dc3fdmr2228666b.45.1722012036083;
        Fri, 26 Jul 2024 09:40:36 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v4] tools/lsevtchn: Use errno macro to handle hypercall error cases
Date: Fri, 26 Jul 2024 17:40:32 +0100
Message-Id: <cce46da98274f84a3cea16d0e1e34b56d4d09410.1722011581.git.matthew.barnes@cloud.com>
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
index d1710613ddc5..16f5e3def023 100644
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
+            switch ( errno ) {
+                case EACCES: continue; /* Xen-owned evtchn */
+                case EINVAL: /* Port enumeration has ended */
+                    rc = 0;
+                    goto out;
+
+                case ESRCH:
+                    perror("Domain ID does not correspond to valid domain");
+                    rc = ESRCH;
+                    goto out;
+                default:
+                    perror(NULL);
+                    rc = errno;
+                    goto out;
+            }
+        }
 
         if ( status.status == EVTCHNSTAT_closed )
             continue;
@@ -58,7 +75,8 @@ int main(int argc, char **argv)
         printf("\n");
     }
 
+out:
     xc_interface_close(xch);
 
-    return 0;
+    return rc;
 }
-- 
2.34.1


