Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 763948497FD
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 11:45:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675771.1051226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwTk-0006WH-Pq; Mon, 05 Feb 2024 10:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675771.1051226; Mon, 05 Feb 2024 10:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwTk-0006Uj-Mo; Mon, 05 Feb 2024 10:45:32 +0000
Received: by outflank-mailman (input) for mailman id 675771;
 Mon, 05 Feb 2024 10:45:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/8nl=JO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1rWwTj-0006Ud-Kt
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 10:45:31 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae75e977-c413-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 11:45:30 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5606f2107ebso1045610a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 02:45:30 -0800 (PST)
Received: from localhost.localdomain ([185.25.64.249])
 by smtp.gmail.com with ESMTPSA id
 st10-20020a170907c08a00b00a36f7891799sm4137629ejc.193.2024.02.05.02.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 02:45:29 -0800 (PST)
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
X-Inumbo-ID: ae75e977-c413-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707129930; x=1707734730; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KFRLF/eDxgbHDTI7/GHRl3I+hTFf/BFZxPyQ0bGdHe8=;
        b=QaQkvvKu40zmNYr3wK07W236H9j17Li3ElDA9v76rktEmIfdMXlUKJHJlgNadnmJ8u
         FTjjyAM9gHv7KhHVwS5NFKoGyvIXmGkeUhc+jhmW9qisaGdVjlrL3hiOnnKijuirEVcZ
         6ryjyOGfA3lCx4ZieD75YzJwUkTMyPvE6+Qjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707129930; x=1707734730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KFRLF/eDxgbHDTI7/GHRl3I+hTFf/BFZxPyQ0bGdHe8=;
        b=TVDLDPHSUQa/ErGebz7YX64U+QTiF0oYbhSIjX9nxzbSvkyX+wabeUXGSqqFuKkgUS
         2YxoV9SRytOOD5qbQ/+IQhfioJtnvqFHQyZryXdS4XS8RUceS9GrmNmm8ulCI0gKS83V
         Qwfdt0LwpC6IoTStlfVTRTzMsv367ktU5ILv1ZO5nP1b3ogxCjsdRnJVrj4CHqhebJfW
         neyPmLUFyC/GAcCOqf0lwY5H3UmK+4Xi2UjQ5YcOrx3A/XfCYsQya4fZd7BrGvt3omuS
         hOVMGeZVrVR6iTjpy3FLw4vlTuzkQGydF1oxEgf+yhKsOjuz7BpUDMGaxzn/x7jPUY93
         85OQ==
X-Gm-Message-State: AOJu0Yw5H4UA0n8qhbvvcV8Ua0Rwq2daItmLRZ1McApX29OE/XHvh9f0
	oFLxpa0gD6QS4O4F0zasI7VXuYwqF4lgteZkJsRzp//Eev5lK9rj+MQfmvXudNRUehcH2HguKu8
	fc4ev7g==
X-Google-Smtp-Source: AGHT+IHnzcS/aHFsA8Lz6lv0ncTPBBlXB9hZV/8pptAbo5+iwwJyGv0h9ZJFqEAj3VnHRjBASzhXeA==
X-Received: by 2002:a17:906:5647:b0:a34:9d98:ac1f with SMTP id v7-20020a170906564700b00a349d98ac1fmr6926315ejr.24.1707129930225;
        Mon, 05 Feb 2024 02:45:30 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWHQYT6OFTXRTQpovzE1OQK79KJxFz9IJZd+StjlMDMHgTfvS7pKpWFLc8ExpKIcf73WbY26B3pu3NcIvD7ZK95+WrpUOH4YQCzTkl6YrJveqzV2Vt8x+SVGWJcxHCnNbKdMSabqhqQBvemBqedibcwz6GSHmRGj/eREFEvnkWPCCBTvnO6u6Nem95vwSVLyjrcO/F0TDn/AXYn4tGZ40F4ECUVaaLJX63tHsU8wkIwCizL/M5vzNfvYwJC8pWofCCIbiqw6yHKbZ8O9oH6pGmLIOk=
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: [PATCH 1/5] Constify some parameters
Date: Mon,  5 Feb 2024 10:45:04 +0000
Message-Id: <20240205104504.14830-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make clean they are not changed in the functions.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/pv/callback.c | 4 ++--
 xen/common/sched/compat.c  | 2 +-
 xen/common/sched/core.c    | 2 +-
 xen/xsm/flask/flask_op.c   | 8 ++++----
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/pv/callback.c b/xen/arch/x86/pv/callback.c
index 17829304fe..caec4fb16f 100644
--- a/xen/arch/x86/pv/callback.c
+++ b/xen/arch/x86/pv/callback.c
@@ -48,7 +48,7 @@ static void unregister_guest_nmi_callback(void)
     memset(t, 0, sizeof(*t));
 }
 
-static long register_guest_callback(struct callback_register *reg)
+static long register_guest_callback(const struct callback_register *reg)
 {
     long ret = 0;
     struct vcpu *curr = current;
@@ -102,7 +102,7 @@ static long register_guest_callback(struct callback_register *reg)
     return ret;
 }
 
-static long unregister_guest_callback(struct callback_unregister *unreg)
+static long unregister_guest_callback(const struct callback_unregister *unreg)
 {
     long ret;
 
diff --git a/xen/common/sched/compat.c b/xen/common/sched/compat.c
index dd97593630..a02204ec9a 100644
--- a/xen/common/sched/compat.c
+++ b/xen/common/sched/compat.c
@@ -26,7 +26,7 @@ CHECK_sched_shutdown;
 CHECK_sched_remote_shutdown;
 #undef xen_sched_remote_shutdown
 
-static int compat_poll(struct compat_sched_poll *compat)
+static int compat_poll(const struct compat_sched_poll *compat)
 {
     struct sched_poll native;
 
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index d177c675c8..c5db373972 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1431,7 +1431,7 @@ static void vcpu_block_enable_events(void)
     vcpu_block();
 }
 
-static long do_poll(struct sched_poll *sched_poll)
+static long do_poll(const struct sched_poll *sched_poll)
 {
     struct vcpu   *v = current;
     struct domain *d = v->domain;
diff --git a/xen/xsm/flask/flask_op.c b/xen/xsm/flask/flask_op.c
index b866e8d05f..ea7dd10dc8 100644
--- a/xen/xsm/flask/flask_op.c
+++ b/xen/xsm/flask/flask_op.c
@@ -469,7 +469,7 @@ static int flask_security_load(struct xen_flask_load *load)
     return ret;
 }
 
-static int flask_devicetree_label(struct xen_flask_devicetree_label *arg)
+static int flask_devicetree_label(const struct xen_flask_devicetree_label *arg)
 {
     int rv;
     char *buf;
@@ -492,7 +492,7 @@ static int flask_devicetree_label(struct xen_flask_devicetree_label *arg)
 
 #ifndef COMPAT
 
-static int flask_ocontext_del(struct xen_flask_ocontext *arg)
+static int flask_ocontext_del(const struct xen_flask_ocontext *arg)
 {
     int rv;
 
@@ -506,7 +506,7 @@ static int flask_ocontext_del(struct xen_flask_ocontext *arg)
     return security_ocontext_del(arg->ocon, arg->low, arg->high);
 }
 
-static int flask_ocontext_add(struct xen_flask_ocontext *arg)
+static int flask_ocontext_add(const struct xen_flask_ocontext *arg)
 {
     int rv;
 
@@ -550,7 +550,7 @@ static int flask_get_peer_sid(struct xen_flask_peersid *arg)
     return rv;
 }
 
-static int flask_relabel_domain(struct xen_flask_relabel *arg)
+static int flask_relabel_domain(const struct xen_flask_relabel *arg)
 {
     int rc;
     struct domain *d;
-- 
2.34.1


