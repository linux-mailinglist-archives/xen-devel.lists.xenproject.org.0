Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6071DAF711B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 12:57:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031985.1405739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXHcv-0003Cp-Rg; Thu, 03 Jul 2025 10:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031985.1405739; Thu, 03 Jul 2025 10:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXHcv-0003Aq-P5; Thu, 03 Jul 2025 10:57:13 +0000
Received: by outflank-mailman (input) for mailman id 1031985;
 Thu, 03 Jul 2025 10:57:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rGZt=ZQ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uXHcv-00033v-0Y
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 10:57:13 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7606e5e2-57fc-11f0-a314-13f23c93f187;
 Thu, 03 Jul 2025 12:57:07 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-453634d8609so56296975e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 03:57:07 -0700 (PDT)
Received: from localhost.localdomain ([83.247.137.20])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9bde8c8sm23730205e9.31.2025.07.03.03.57.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Jul 2025 03:57:06 -0700 (PDT)
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
X-Inumbo-ID: 7606e5e2-57fc-11f0-a314-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751540227; x=1752145027; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnLLL7YQoCQGdWR3EVL4zcbePVJyUuDX4baxuyLLriU=;
        b=OQIGb6M+TnK9LACdUv8BD3AoSBYeymXFyCZJEiFIAGXV6nPEn3C9k4lDv8lv7dso+h
         sxWjh5jbmOKcXpNtWWBWDaz2ueqKl7JRAzrONFRTowWkfOlMEQOGNx0f4/+NWQATYMKz
         shaLgU1GeGPsFqB0iMh3XstiXgf48QNEvsRivM9EtzvCcXz+LFHxMVDuotpcWKZ852yq
         fX8yrwVAVE1yxIJL/NjnaczmJni+crFyMDOj9Vt1x7N8reXS04551s/7oT/3v6sktsyp
         Xha0pqxgBqr69KMMls9rEioCg8/C/ZUvQnVwyDcEA9lKTDJW8NR226IbdrOn/awQ9Aem
         gDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751540227; x=1752145027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnLLL7YQoCQGdWR3EVL4zcbePVJyUuDX4baxuyLLriU=;
        b=UOWjEjk63qK0E+7Fat3zK1KzB42x8aGMDZ0XSjvg1vAh4HPPA8zNk+qJ9UItE9ZkHK
         ax/0oIQRJSk3lECdjl4NMKYkYI4633niYiDGIDCTGk7bLyp0Iy9T3TwruhaQvUYxb8W6
         hsGDkBDmcOK5nHGlcm0JBsWBh9VMgyMcJD7vl9GmvNKgSrnrX9YbXa6bxffLnSSbP4X7
         fmCOvnoHIVm/hAtLV4uhJd487OUtVhM7IWtqnwPyM/3aHIkNAlJRWc7/a/BBSd6zqtjI
         R++eIuIgDZ9961DZR3h5v+TnnJRAWrghryWvcQXAohH4YSJkPPGtMplDD//6igP36s1V
         HKBg==
X-Forwarded-Encrypted: i=1; AJvYcCU72zNVik4ob7BZPvZU74ts++4DNa76dVWoqBePjCI8vW6KuFaXvzqyB87xcc0icmpWkzwaOij1e9A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwIdz61ZEN9jMXK5FpkYRtXTk0v/xc0iynqBpDKjE1y7lLWXRcl
	KIbgzwlj/iqLOnIKRoMwIJTDoD1w1SMCpPurLed3uZtiaSj16ak5XzBrckLsHuO7Aqc=
X-Gm-Gg: ASbGncs5l67iaFYTBQT5IEoPakvOPV7ZaG3I2xchPep5cZ2vQ73H+JdfKFoICKNLMTm
	HWLMrTsjd2BKRR57KgrI/C4NQWz5J7TyRtI2tvonoMxP1GYYO7gzwQoovMBpYbctl4eo3R0Qr/v
	7dID1RW52U2rokK0NQvUoHnD7r18hxoAP1iGOfnMkqa36rX3jUZ2D/812/JXvVk5jIrKLENpL+x
	KxrZmkSB+WtfP8xW2SHO8AEfT5hjLik6DcD/ABj/dijNS8feeFrGiXNEJchbL1grXxNSD/hpOFm
	Go/7B5mhzrQg+PPwno9EE3DYUUtj1PQMcvYZ3ak2+aCfFjnn+a+j4+TiFMYbYOz1n0+ZXoq+/VI
	SQ/omkD0IjL0=
X-Google-Smtp-Source: AGHT+IEYucf5bnqrTZ0PYjrv8kqSiGOKUc/yPkaJr/uv7wwktIzjqebLnUo5ht4si12JpTCvy+cETg==
X-Received: by 2002:a05:600c:820e:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-454af1d8088mr13927765e9.10.1751540226727;
        Thu, 03 Jul 2025 03:57:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	kvm@vger.kernel.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v5 16/69] accel: Remove unused MachineState argument of AccelClass::setup_post()
Date: Thu,  3 Jul 2025 12:54:42 +0200
Message-ID: <20250703105540.67664-17-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703105540.67664-1-philmd@linaro.org>
References: <20250703105540.67664-1-philmd@linaro.org>
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


