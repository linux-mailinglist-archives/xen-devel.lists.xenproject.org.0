Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB2F8C226C
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 12:49:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719761.1122611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Noc-0007xD-RR; Fri, 10 May 2024 10:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719761.1122611; Fri, 10 May 2024 10:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Noc-0007tb-O7; Fri, 10 May 2024 10:49:26 +0000
Received: by outflank-mailman (input) for mailman id 719761;
 Fri, 10 May 2024 10:49:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Xy6=MN=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1s5Nob-0007sQ-HF
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 10:49:25 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6e23306-0eba-11ef-909d-e314d9c70b13;
 Fri, 10 May 2024 12:49:24 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2e538a264e0so7789451fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 03:49:24 -0700 (PDT)
Received: from m1x-phil.lan (sev93-h02-176-184-17-152.dsl.sta.abo.bbox.fr.
 [176.184.17.152]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b896a06sm4231043f8f.27.2024.05.10.03.49.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 May 2024 03:49:23 -0700 (PDT)
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
X-Inumbo-ID: f6e23306-0eba-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715338164; x=1715942964; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WG6hHvxHnsfDLBmoixzqYQgPTY2J5n6T9oUHauE6pdQ=;
        b=YiearKB/mIu9+rSlpfPyjFaEzdcPkvOzunu9UYVmdCLQSVOVENujUBdRDGAaWJdiNU
         T9kl73sB+LhujSJqZnAIwX5OaxEU60uDQEJf0/icpor8BA3WnOydayMRW7QZABX/SQ6b
         HTUZkHC/fy/+UfX7cZUKpWfbrEmq6n1BVrk7VQ4f2F4BBdN2mYwBAViwute58nB86MGu
         gjqT6fMHEyhOxoFTc3Zp8ffyZ9FIuiPC9SsWYsK/I+hZyj5klTsQGsiKwuybUz8LLbAj
         Xmb4UTeKpcMq0KMqe0ZRDcxQS0a+qxGdgLs7uGDdZNC5l8ATmuj6wu5rGS29js84GEd6
         3TVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715338164; x=1715942964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WG6hHvxHnsfDLBmoixzqYQgPTY2J5n6T9oUHauE6pdQ=;
        b=HLjMrzKBUnMEUunN2jxrrpmVQ1ArCK9QWfZ7/fj4eFg13YU48iq2Tqkw7SUcd77/SX
         x+KLMHuTeQd5e098V47q0k2DEHgCU36FUnuwKYUYQL6cJunw1KJ2q2JmWAHyus1IsEpX
         Vn7Bwf11ZKcl+2viSO+xkOeowIZZqWcsjZFAxF2mLQF7DcMBF56pbQB/ZhPn7S6yS77o
         iqcEQqGFbX4JHB2lom6M6z4+NpFbHyXG1iwhT9pKCyWUQ23zEc+bn8vAmK4rhwl2M5r0
         KN2rpEiXZrjWpmRAIIr/+4MqO7mf8Oq+AApQiCF8DCy5HcbpHC6xgNwxeu6a7BivYnad
         PS+w==
X-Forwarded-Encrypted: i=1; AJvYcCWCjjjDelFk7bmSUnjP8WU1O6hxqIV/VB+4gcNK3T/ZRXlFNfJlBlqqO8URc7pCo7tJXDt/ZQqvPLSW9Z5Cfz2PStia6RiXfejONCORuL0=
X-Gm-Message-State: AOJu0YyxJseW1pOQW7u7our+eIX7Ir1lNTWp/PW8sY0xktFvpHSoiBLK
	uivlWO02hf1EncsENlOHsjkPmg7Wk5HDHZ2AmFkliiFBmt1m7y2+1m3f5Xcrz5A=
X-Google-Smtp-Source: AGHT+IFmnZ+GsRWrg13UBzYocLVh19CoDwULJS52v4mItPwgRYVUMX2l1wSejvKjHmjEdqsBZaZvSw==
X-Received: by 2002:a2e:859:0:b0:2e5:4171:1808 with SMTP id 38308e7fff4ca-2e541711898mr7342581fa.51.1715338163501;
        Fri, 10 May 2024 03:49:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/7] hw/xen: Constify XenLegacyDevice::XenDevOps
Date: Fri, 10 May 2024 12:49:03 +0200
Message-ID: <20240510104908.76908-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240510104908.76908-1-philmd@linaro.org>
References: <20240510104908.76908-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

XenDevOps @ops is not updated, mark it const.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/xen/xen_pvdev.h  | 2 +-
 hw/xen/xen-legacy-backend.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/xen/xen_pvdev.h b/include/hw/xen/xen_pvdev.h
index ddad4b9f36..fd9a33e6ab 100644
--- a/include/hw/xen/xen_pvdev.h
+++ b/include/hw/xen/xen_pvdev.h
@@ -53,7 +53,7 @@ struct XenLegacyDevice {
     xenevtchn_handle   *evtchndev;
     xengnttab_handle   *gnttabdev;
 
-    struct XenDevOps   *ops;
+    const struct XenDevOps *ops;
     QTAILQ_ENTRY(XenLegacyDevice) next;
 };
 
diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 124dd5f3d6..35f2b57560 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -170,7 +170,7 @@ int xen_be_copy_grant_refs(struct XenLegacyDevice *xendev,
  */
 static struct XenLegacyDevice *xen_be_get_xendev(const char *type, int dom,
                                                  int dev,
-                                                 struct XenDevOps *ops)
+                                                 const struct XenDevOps *ops)
 {
     struct XenLegacyDevice *xendev;
 
-- 
2.41.0


