Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 376B393F825
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 16:34:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766841.1177373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRSA-0007SA-Rg; Mon, 29 Jul 2024 14:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766841.1177373; Mon, 29 Jul 2024 14:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRSA-0007Pm-P8; Mon, 29 Jul 2024 14:34:22 +0000
Received: by outflank-mailman (input) for mailman id 766841;
 Mon, 29 Jul 2024 14:34:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7lGn=O5=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1sYRS9-0007Pg-1h
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 14:34:21 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3b55e8e-4db7-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 16:34:19 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52f0277daa5so5534027e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 07:34:19 -0700 (PDT)
Received: from EMEAENGAAD91498.citrite.net ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab22ffcsm523005266b.12.2024.07.29.07.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 07:34:17 -0700 (PDT)
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
X-Inumbo-ID: a3b55e8e-4db7-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1722263658; x=1722868458; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WYQASg0qEMRl0vt7k1Mn52hk12I5MM01uJ4iEBy3MoA=;
        b=kPzHL33kej+L6WDh9hdgWd8zb9kBS7+olUqHXCe0aS9CnAdxs7fSKWi/8T2ZPDRnR9
         T+HAlgOBNG6hMKIFf4UMXtSsVbatF8UuPmfnD0x7Ro2izvGbJgEkiuI+dTnN9ztY/87r
         vdUIQ/xspAZxGaOSttrDxOhnamQbGufIxRYcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722263658; x=1722868458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WYQASg0qEMRl0vt7k1Mn52hk12I5MM01uJ4iEBy3MoA=;
        b=PHLqbikbyTlHn1hEmHpj4CLwhR9at4kJs/UuIqjMfbEVIwCleuAi9HeGNBxnhJMLLa
         P2QWBuNiH4FRC/SocN2Fgsj+nwZt4oZLi09RK7xR5WXuIOOyXprvn32tOxgdfGy5nf72
         rIJ2ProMb5Q7YEyDPuglJ8Be3YH1lAQiWR/kyJvn+0QRRH0S5RxkuG53VifB80v72Mxv
         HO4e7qJ/WYsauyrI6fnIsVE2F8d4N2Abjv1zq5MBmV8y5dzHkCMykCr7htQ8aYKEKZ+S
         4C9cZ8egj+M4tvxcBc5m9HkoYSrqroOeGNNCxPOp38Z6gt/ATDqb+ojYWc4mNjxFsuuP
         3ViA==
X-Gm-Message-State: AOJu0YwirCVzo/8D+fCk3exuNOqpYjRK3+gbs9huREvHzbnQi2qxqKmW
	19EjQPQHjZoU83HcNylVUIFyP10O+NK8Sw/mzc0pmPmHxlVYuawTF6ouHNQ8nWeObJr9uIPxrFY
	m
X-Google-Smtp-Source: AGHT+IE4mgT1kEGBeVHUDuG7vDqdEvTWYP9MxoqFErLHoggYa/wos73pFBjG56spMhLYXa+UyI8lXQ==
X-Received: by 2002:a05:6512:ea0:b0:52c:d819:517e with SMTP id 2adb3069b0e04-5309b27bd2fmr7006371e87.30.1722263657812;
        Mon, 29 Jul 2024 07:34:17 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v5] tools/lsevtchn: Use errno macro to handle hypercall error cases
Date: Mon, 29 Jul 2024 15:34:11 +0100
Message-Id: <f7bc11cc63a7b8596eb7a7c17f1e5c910f0009e5.1722263364.git.matthew.barnes@cloud.com>
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
index d1710613ddc5..b7d1b3d424ae 100644
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
 
+out:
     xc_interface_close(xch);
 
-    return 0;
+    return rc;
 }
-- 
2.34.1


