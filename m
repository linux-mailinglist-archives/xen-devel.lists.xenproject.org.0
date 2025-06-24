Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB12AE5D45
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 08:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023154.1399076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTxaq-00021w-Q4; Tue, 24 Jun 2025 06:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023154.1399076; Tue, 24 Jun 2025 06:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTxaq-0001zq-NP; Tue, 24 Jun 2025 06:57:20 +0000
Received: by outflank-mailman (input) for mailman id 1023154;
 Tue, 24 Jun 2025 06:57:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LEHU=ZH=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uTxap-0001zk-D3
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 06:57:19 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7738ac02-50c8-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 08:57:17 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-553dceb345eso5531916e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 23:57:17 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553e41cc18esm1706337e87.229.2025.06.23.23.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 23:57:15 -0700 (PDT)
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
X-Inumbo-ID: 7738ac02-50c8-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750748236; x=1751353036; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x/YWy/FYLDxPFS3Zo1qm/QUmhAl184xKR8fcYgXKlX0=;
        b=RUD109ttk1qxsXu4Iad0W6UGRj7GovnLg2CAhzRFAG7zhZ9l5TVC7AAO5CNEG75hu8
         KoJ9vzZVXFLTMsFp9M5DPYtlYj1SSDT25S9gI7BvmlYlSqY5t43VR4CjLId+FdV+tsPr
         IBwHgfhTu4/pVYP9VDCnY3BVdWjpTGsRhqU95E0DMf7YNFtdP2QEN2QaOVbaOLrOvmKk
         RNjwF+m6zVR5FC8T+hSKlAFU8Fcx5tkonZwqa42q/2WqqqfIV+zTJ4eCkGWTiHjv1cJh
         B0EnnEV5MTUetQAl6qDnZaifhMhPMWcKZ1TpznwCdcKqdGQWf9Af8MM23FRGAH6JauL3
         AaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750748236; x=1751353036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x/YWy/FYLDxPFS3Zo1qm/QUmhAl184xKR8fcYgXKlX0=;
        b=vtDurGaGDX1QlQPeRu1Qcmi67wFWtDwC0qnG9FhNFpUGpog0sdvCtEw+iad/+vs6Pp
         Im391A6YfVuo6TdMZNZz7tddrNZMpOJWjBCzM8cfskMhSDQR+xscjS8w+D8s7GyTZdzV
         a4h6vZ9Y/QGxdRj8mrU0TlsbsGp7b9ntT+y2b449uRpvLiUNY/DODgnn6y2+Hxmi9J9k
         ej4ILPJl0JbrZSfcYftX4WQlPZ6oXgaJKdkcE++QV82En8RVxEW9yD7PHCquyH5v74ZQ
         ppIcnO+UI+o1dvEnNQKZWG06uTRhZ01R93qOlx/9nppeV/nh6bboOhxAuvuN5y7BsafP
         nrJw==
X-Gm-Message-State: AOJu0YyyOsaaw7NcvV1qG/s2Khm4fJDz+Wvnh10E4Y4Xng7XNtC3JFPQ
	+Vk8sgiN5et26wVZYkB072Qbu+UE7Myp3+u6YfqiKIE7N8VU28IasNGh0/itg6A1bUQ=
X-Gm-Gg: ASbGncsyRXhr7BiUq1La6/Ge2PmSmw4x8mkP2s/xofmxBGjKrm2/poGC1YOZvJH/uG2
	u1UcOPHvs8b7SEzeTmaUd6LuoaDz3qdVrNP3l+ED77aP4FvpDU/+DnTKbwor9gi9+TxCC+2t3QZ
	XGEz66kBAwkSCGHrnkeQtUFLxoAyMLQJfDc6IdNj8WZmn+xo/hwY0FPnjo8yFS2C0z0RPJ9Mapz
	8OXBv1yR0NMuYimZYo6rcs6X5NFYT8GhJ2fOg5oVER1Wx8fs8X2UavAsKIfylTyTNrG7xnzhns9
	G8bBjJngDlpRu4LiKRKrlKV9V3wQ9d3cm2OWwrKNqSYTOWvQFOpPq9f9W4uMNdJruOenmEdbU30
	3nwfbwuHx+cvM3pCSEF2M/oSGcW+G+ijvMXvv
X-Google-Smtp-Source: AGHT+IEQfcUqSvvJ6gz7S2FK9BzDvjtZfr3lc3QrhI8oHiX/GFi9vslmVg782LlAXUKupClH1mQK/g==
X-Received: by 2002:a05:6512:3055:b0:553:2c65:f1d1 with SMTP id 2adb3069b0e04-553e3ba7286mr3707404e87.13.1750748235644;
        Mon, 23 Jun 2025 23:57:15 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/common: Guard freeze/thaw_domains functions with CONFIG_SYSTEM_SUSPEND
Date: Tue, 24 Jun 2025 09:56:01 +0300
Message-ID: <20250624065601.197492-1-xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

This patch adds CONFIG_SYSTEM_SUSPEND guards around freeze_domains
and thaw_domains functions.

This ensures they are only compiled into the hypervisor when the system
suspend functionality is enabled, aligning their inclusion with their
specific use case.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/common/domain.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8c8f70347a..303c338ef2 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -2411,6 +2411,8 @@ domid_t get_initial_domain_id(void)
     return 0;
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
 void freeze_domains(void)
 {
     struct domain *d;
@@ -2436,6 +2438,8 @@ void thaw_domains(void)
     rcu_read_unlock(&domlist_read_lock);
 }
 
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 /*
  * Local variables:
  * mode: C
-- 
2.48.1


