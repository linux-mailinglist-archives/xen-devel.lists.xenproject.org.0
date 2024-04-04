Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A9789897F
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 16:06:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700911.1094724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsNj5-000829-Gy; Thu, 04 Apr 2024 14:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700911.1094724; Thu, 04 Apr 2024 14:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsNj5-0007yz-Dr; Thu, 04 Apr 2024 14:05:59 +0000
Received: by outflank-mailman (input) for mailman id 700911;
 Thu, 04 Apr 2024 14:05:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AyoO=LJ=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rsNj4-0007yl-5u
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 14:05:58 +0000
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [2607:f8b0:4864:20::f2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 741356b9-f28c-11ee-a1ef-f123f15fe8a2;
 Thu, 04 Apr 2024 16:05:55 +0200 (CEST)
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-69682bdf1d5so5303696d6.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 07:05:55 -0700 (PDT)
Received: from rossla-lxenia.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 fq8-20020a056214258800b0069903766e06sm2688494qvb.124.2024.04.04.07.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 07:05:54 -0700 (PDT)
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
X-Inumbo-ID: 741356b9-f28c-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712239554; x=1712844354; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6wG5hFEWSE8pCJM3CKdCtIfOIpf3B2JFMf25ZTR+uII=;
        b=XCUP8dDhaetBhnJ5/j06OVacPx9QjTZ/dfjUf68cuBE3FIEhPn0p3f+z8nM3Kjv21C
         CEEfv9v1p11dED0w9dCVxHnYjLC3Cckt04EVqZgZPCV6oKlMiteoZT76iyi1zLfem5yx
         2bONR0wUsWBZqlt+R3NOtRY1uVjfF1wgEm5pM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712239554; x=1712844354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6wG5hFEWSE8pCJM3CKdCtIfOIpf3B2JFMf25ZTR+uII=;
        b=VnC8m/R2mpZvAj3ZPR3/eD/CohqNCy2x93/WWzJgz4oYjhfWuA9vejuxIMfkG8jABy
         s1MPBayDEJYO0TIqtYCXC8Hy45ZRLdAuxX3w6QDVJQbRIP25Baalksa1+lqVXGhPf5Ol
         os7FtzGs7gaVvbFPSaCx5fJlbRSCl61bWGvhigdRxkg4jNwP72QX4Bdg6hpIbsdnlhQ/
         jmfTvWxx42+HxtSiW4uhx48rSdoJnBArElauFJIWfhjJ17BJBYgyx4372296HREuoC3+
         gNGjpzakG8nlOr6xeawe402qkZ05kP7JC5YIx08WwkiQWiiWVaM7OQi6++JFWuPKUZZa
         hZzg==
X-Gm-Message-State: AOJu0YxKg0TJlZwohcJi969k+3kjYdGQb2IonkY2ZlQC9G0/XoBYYjeL
	IIQ9yitqrDJw7JtjTROmFO2Y47TY6xif+K8Nh9OOPLjxpZMl9Ur8v/qQZsFgcQ==
X-Google-Smtp-Source: AGHT+IGyY9sw3RGJVfOjgmqlVSv0/p+x+OV/m/Ct2LCHP8v9i+7ycUCSK6tJqaZi3Ko+zn40uXj7ww==
X-Received: by 2002:a05:6214:2465:b0:699:28ee:da99 with SMTP id im5-20020a056214246500b0069928eeda99mr2482294qvb.65.1712239554621;
        Thu, 04 Apr 2024 07:05:54 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org,
	qemu-devel@nongnu.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] xen-hvm: Avoid livelock while handling buffered ioreqs
Date: Thu,  4 Apr 2024 15:08:33 +0100
Message-ID: <20240404140833.1557953-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A malicious or buggy guest may generated buffered ioreqs faster than
QEMU can process them in handle_buffered_iopage(). The result is a
livelock - QEMU continuously processes ioreqs on the main thread without
iterating through the main loop which prevents handling other events,
processing timers, etc. Without QEMU handling other events, it often
results in the guest becoming unsable and makes it difficult to stop the
source of buffered ioreqs.

To avoid this, if we process a full page of buffered ioreqs, stop and
reschedule an immediate timer to continue processing them. This lets
QEMU go back to the main loop and catch up.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 hw/xen/xen-hvm-common.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 1627da739822..1116b3978938 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -463,11 +463,11 @@ static void handle_ioreq(XenIOState *state, ioreq_t *req)
     }
 }
 
-static bool handle_buffered_iopage(XenIOState *state)
+static unsigned int handle_buffered_iopage(XenIOState *state)
 {
     buffered_iopage_t *buf_page = state->buffered_io_page;
     buf_ioreq_t *buf_req = NULL;
-    bool handled_ioreq = false;
+    unsigned int handled = 0;
     ioreq_t req;
     int qw;
 
@@ -480,7 +480,7 @@ static bool handle_buffered_iopage(XenIOState *state)
     req.count = 1;
     req.dir = IOREQ_WRITE;
 
-    for (;;) {
+    do {
         uint32_t rdptr = buf_page->read_pointer, wrptr;
 
         xen_rmb();
@@ -521,22 +521,30 @@ static bool handle_buffered_iopage(XenIOState *state)
         assert(!req.data_is_ptr);
 
         qatomic_add(&buf_page->read_pointer, qw + 1);
-        handled_ioreq = true;
-    }
+        handled += qw + 1;
+    } while (handled < IOREQ_BUFFER_SLOT_NUM);
 
-    return handled_ioreq;
+    return handled;
 }
 
 static void handle_buffered_io(void *opaque)
 {
+    unsigned int handled;
     XenIOState *state = opaque;
 
-    if (handle_buffered_iopage(state)) {
+    handled = handle_buffered_iopage(state);
+    if (handled >= IOREQ_BUFFER_SLOT_NUM) {
+        /* We handled a full page of ioreqs. Schedule a timer to continue
+         * processing while giving other stuff a chance to run.
+         */
         timer_mod(state->buffered_io_timer,
-                BUFFER_IO_MAX_DELAY + qemu_clock_get_ms(QEMU_CLOCK_REALTIME));
-    } else {
+                qemu_clock_get_ms(QEMU_CLOCK_REALTIME));
+    } else if (handled == 0) {
         timer_del(state->buffered_io_timer);
         qemu_xen_evtchn_unmask(state->xce_handle, state->bufioreq_local_port);
+    } else {
+        timer_mod(state->buffered_io_timer,
+                BUFFER_IO_MAX_DELAY + qemu_clock_get_ms(QEMU_CLOCK_REALTIME));
     }
 }
 
-- 
2.43.0


