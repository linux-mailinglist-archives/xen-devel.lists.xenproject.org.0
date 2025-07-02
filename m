Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9421FAF61FB
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 20:55:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031457.1405272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX2c7-0003f1-Lo; Wed, 02 Jul 2025 18:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031457.1405272; Wed, 02 Jul 2025 18:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX2c7-0003ct-IU; Wed, 02 Jul 2025 18:55:23 +0000
Received: by outflank-mailman (input) for mailman id 1031457;
 Wed, 02 Jul 2025 18:55:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cCzP=ZP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uX2c6-0003Ai-Tn
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 18:55:22 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b30a034-5776-11f0-a314-13f23c93f187;
 Wed, 02 Jul 2025 20:55:22 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-450cb2ddd46so43532725e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 11:55:22 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9bac48esm5412345e9.37.2025.07.02.11.55.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Jul 2025 11:55:21 -0700 (PDT)
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
X-Inumbo-ID: 1b30a034-5776-11f0-a314-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751482522; x=1752087322; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnLLL7YQoCQGdWR3EVL4zcbePVJyUuDX4baxuyLLriU=;
        b=j0xwALucsiejURByNbdwxKxo5mqDvdinUcXwtF2qrCJuibc6+gw/CKiRLCEXTUy/hC
         gSES+QH3GbUO7IMonTJV3yIzR9AvWFUdjdCH5QmCGrLSlnfmCqefTer9pfxkCONDZbtN
         RU0WgUhea9qy93fE4HCQjIK157PJOj+DCSw8KjcL+Tb7RTG02VkgBo9UWuwsHOWT2Ol9
         65iOv0Wv+aCtw8vgRfaAL52dqBH7fX6MnTZUPqvd75OGMjt6T4TCJWbovDpxbrE6bzMH
         6DD5PK+fEdhcXD+9oZ2zMysUn1uG+CC1CfSphqJoHmK6/s8OLe/gqPtrzUG838NV9luT
         wNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751482522; x=1752087322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnLLL7YQoCQGdWR3EVL4zcbePVJyUuDX4baxuyLLriU=;
        b=bhzjDBjpQLv84oTqZF5Z/K68vrX13Mu53P75Z1ykEQDHZSy9UVeRBZzAAyWJ7yStjh
         2VWgg8527zcumZjB9xIkRYAnCj9qBPLZUX98o+qDglOfUa+95ur7zUyz5tZ/mNSzwuYd
         OWyEBMky2r5YR0tNoz1ffLSikyjU6YwEFMTzrkf+yrKf7e1hMHiM58ML2Dq4nXUMtPXq
         /3E5bKKSFpYaXl3d6iFcn3CcUGkPfn5pETLZXxieLXU5pDcywbRkuWNxJ4sIAMJoOoLR
         Djl80iKYsiYvU0rSsShKDiBAcopPDMNq+rPT4W2F4h1EXglNd4m1TarxsKN3sdsw4myU
         4OwA==
X-Forwarded-Encrypted: i=1; AJvYcCVUOrmQsTOhEpYdZyaIK84tiScj66/fmNhR0x6PF/5Aid60pRWXUb11DJXMhTGuBRUqLPEOT2xrzTQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7rNPdu9I42tziKkan3wqvursedeLUUqtdLCKP+mslya3pFBIo
	6/Ye5rQDMklOCHZvvgOPrbosXnNoEo5Y0NONMXauZ/LauwOoAEfPD7RsSEYadbsglo0=
X-Gm-Gg: ASbGncuqRvEj9VPhRU9K50Z2AZHUDR4O+YoiKpB2ovO8an6ShvN4FLVH+nxkXD+tOQO
	LRdwNEnhLE93xhVRAL17pH0E8pa38EXqSmlRSFpbddfiNfGshD7BEcjQ5W/jgrJ6+SQT64cuAM3
	udyoa15WJ43MESl92pXNkXiaVTPRSE+RZOKPG2OHqtl/o1KtAaUbUQNvGs5sSFMu3WIvBMRfM6W
	ie4f+l+sLD1USsUHZ3+quGwIbfwLh3hrt+WFr/z1D85X8BIHnoBZcevYRb5BtUgib7teeZw46WC
	ONR0fnMjtIqfJCvk5axHQTCC+DZGHQlXJZXPshQ/g4s+jALi1yYOWvIit+eFNhcB0FvEpTEkdCo
	vpGbsiiJOJgTGlumcpWLLnRZvp6uUOppP928n
X-Google-Smtp-Source: AGHT+IEXN1ji8HMgF3oWOa7k02PQHX4IAD+Mx2AkWivNZait2oN82da7g9XDELsEchLGK60Cx8nB2A==
X-Received: by 2002:a05:6000:2dc2:b0:3a4:f7e7:416b with SMTP id ffacd0b85a97d-3b1fdd16d21mr3559245f8f.16.1751482521753;
        Wed, 02 Jul 2025 11:55:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 15/65] accel: Remove unused MachineState argument of AccelClass::setup_post()
Date: Wed,  2 Jul 2025 20:52:37 +0200
Message-ID: <20250702185332.43650-16-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702185332.43650-1-philmd@linaro.org>
References: <20250702185332.43650-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This method only accesses xen_domid/xen_domid_restrict, which are both
related to the 'accelerator', not the machine. Besides, xen_domid aims
to be in Xen AccelState and xen_domid_restrict a xen_domid_restrict
QOM property.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/accel.h | 2 +-
 accel/accel-system.c | 2 +-
 accel/xen/xen-all.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/qemu/accel.h b/include/qemu/accel.h
index f327a71282c..a6a95ff0bcd 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -45,7 +45,7 @@ typedef struct AccelClass {
     void (*cpu_common_unrealize)(CPUState *cpu);
 
     /* system related hooks */
-    void (*setup_post)(MachineState *ms, AccelState *accel);
+    void (*setup_post)(AccelState *as);
     bool (*has_memory)(AccelState *accel, AddressSpace *as,
                        hwaddr start_addr, hwaddr size);
 
diff --git a/accel/accel-system.c b/accel/accel-system.c
index 913b7155d77..af713cc9024 100644
--- a/accel/accel-system.c
+++ b/accel/accel-system.c
@@ -58,7 +58,7 @@ void accel_setup_post(MachineState *ms)
     AccelState *accel = ms->accelerator;
     AccelClass *acc = ACCEL_GET_CLASS(accel);
     if (acc->setup_post) {
-        acc->setup_post(ms, accel);
+        acc->setup_post(accel);
     }
 }
 
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 1117f52bef0..ba752bbe5de 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -63,7 +63,7 @@ static void xen_set_igd_gfx_passthru(Object *obj, bool value, Error **errp)
     xen_igd_gfx_pt_set(value, errp);
 }
 
-static void xen_setup_post(MachineState *ms, AccelState *accel)
+static void xen_setup_post(AccelState *as)
 {
     int rc;
 
-- 
2.49.0


