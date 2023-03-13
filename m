Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739326B81F7
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 20:59:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509381.785039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pboJD-00039i-1M; Mon, 13 Mar 2023 19:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509381.785039; Mon, 13 Mar 2023 19:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pboJC-00036M-UV; Mon, 13 Mar 2023 19:58:14 +0000
Received: by outflank-mailman (input) for mailman id 509381;
 Mon, 13 Mar 2023 19:58:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jvaw=7F=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pboJB-00036C-JP
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 19:58:13 +0000
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [2607:f8b0:4864:20::f30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 612f644a-c1d9-11ed-b463-930f4c7d94ae;
 Mon, 13 Mar 2023 20:58:11 +0100 (CET)
Received: by mail-qv1-xf30.google.com with SMTP id t13so2093240qvn.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Mar 2023 12:58:10 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 24-20020ac85658000000b003b85ed59fa2sm428476qtt.50.2023.03.13.12.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 12:58:08 -0700 (PDT)
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
X-Inumbo-ID: 612f644a-c1d9-11ed-b463-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678737489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RAV4seBl4GnX8c6NM8zRqsU6jrCuITbMY/50NF12Ke0=;
        b=XkWg78eWgBzHajm3d6qthS07nhYJeFHFxIh7fla58wJsO0a/7HdQB60paKO6Q2+fIW
         lb10Js/7X5oDwIDml+jU36lh5557tL/LFX7kAYLNeZunAnvnJ5OkKHTdLQliNw35ohgd
         5d3QoOR/3GmXgYWLs4Wxjo6XYvjWJoHhdWT7ZJYzqsuVBkrvopXqhvt5JOr4AII1QETL
         ZhhtFxsQEBChrQaMeSCmsDu4ujdV2hthKRBCGl26pQ8zi4EuWVhbi3Rwn0bNSJYi5Hjc
         w4SbEzIrOL2fCtwsude1NAiOaONAlMAqUEy3giIgCJL3cKQa1HSkjEB7zeCdAsLZfFsX
         8UAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678737489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAV4seBl4GnX8c6NM8zRqsU6jrCuITbMY/50NF12Ke0=;
        b=VARtH48JuW8RMbyPiOxUs9JUF/Rhc0zMr6hIkZAL+rZk8ZqFIhveBrIS20gW0ipXxk
         IG+Zes1dMCMbfqiB1HMm10zh5a6WpLJ3VAuXZDxXAqcGPRE+X6z8QzRvs6eITfWWdt9Q
         EHCjSTfdmB2YL8OI8+o3c2X2czCyPpLDzoU4htqnu26nM/YUJfFNIE29hah/8qtjYxO7
         uAwm0kulB8b9PVUW0KI5ZgVHPxgywz2wEtf59r1W+xooH1pKDyGd6m+TNhS7j42hCAjR
         ZMehZKEqLvJXYDEKUKqKPDOXSQy3Chm8TqH8D6XPSY98+tehdL0T0QRyH+ZvXw1N/x2G
         8ZhA==
X-Gm-Message-State: AO0yUKWtWL6IIPScDB8PGyMeGP3JVcXuA9Bbht54ymQymSBgCkvA0ulp
	/NzfhJuIkdCwJ0cHC+9B0bib2XXzmAQ=
X-Google-Smtp-Source: AK7set9KoFKm+AMs28Qxujoqt45q6obyjISqJj4M8UbpuB01uPJ38pM4VUxxAvIlCLAdqAMsO/Yr5A==
X-Received: by 2002:a05:6214:dce:b0:56e:a4c5:9da5 with SMTP id 14-20020a0562140dce00b0056ea4c59da5mr15447421qvt.6.1678737489104;
        Mon, 13 Mar 2023 12:58:09 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] libxl: Fix libxl__device_pci_reset error messages
Date: Mon, 13 Mar 2023 15:57:55 -0400
Message-Id: <20230313195755.35949-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Don't use the LOG*D macros.  They expect a domid, but "domain" here is
the PCI domain.  Hence it is inappropriate for this use.

Make the write error messages uniform with LOGE.  errno has the
interesting information while rc is just -1.  Drop printing rc and use
LOGE to print errno as text.

The interesting part of a failed write to do_flr is that PCI BDF, so
print that.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libs/light/libxl_pci.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index f4c4f17545..27d9dbff25 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1554,27 +1554,27 @@ static int libxl__device_pci_reset(libxl__gc *gc, unsigned int domain, unsigned
         char *buf = GCSPRINTF(PCI_BDF, domain, bus, dev, func);
         rc = write(fd, buf, strlen(buf));
         if (rc < 0)
-            LOGD(ERROR, domain, "write to %s returned %d", reset, rc);
+            LOGE(ERROR, "write '%s' to %s failed", buf, reset);
         close(fd);
         return rc < 0 ? rc : 0;
     }
     if (errno != ENOENT)
-        LOGED(ERROR, domain, "Failed to access pciback path %s", reset);
+        LOGE(ERROR, "Failed to access pciback path %s", reset);
     reset = GCSPRINTF("%s/"PCI_BDF"/reset", SYSFS_PCI_DEV, domain, bus, dev, func);
     fd = open(reset, O_WRONLY);
     if (fd >= 0) {
         rc = write(fd, "1", 1);
         if (rc < 0)
-            LOGED(ERROR, domain, "write to %s returned %d", reset, rc);
+            LOGE(ERROR, "write to %s failed", reset);
         close(fd);
         return rc < 0 ? rc : 0;
     }
     if (errno == ENOENT) {
-        LOGD(ERROR, domain,
-             "The kernel doesn't support reset from sysfs for PCI device "PCI_BDF,
-             domain, bus, dev, func);
+        LOG(ERROR,
+            "The kernel doesn't support reset from sysfs for PCI device "PCI_BDF,
+            domain, bus, dev, func);
     } else {
-        LOGED(ERROR, domain, "Failed to access reset path %s", reset);
+        LOGE(ERROR, "Failed to access reset path %s", reset);
     }
     return -1;
 }
-- 
2.39.2


