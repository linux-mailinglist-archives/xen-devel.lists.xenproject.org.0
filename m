Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C6A984986
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 18:24:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803109.1213571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8LF-0007qu-It; Tue, 24 Sep 2024 16:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803109.1213571; Tue, 24 Sep 2024 16:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8LF-0007nI-Ft; Tue, 24 Sep 2024 16:24:45 +0000
Received: by outflank-mailman (input) for mailman id 803109;
 Tue, 24 Sep 2024 16:24:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C5PF=QW=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1st8LE-0005nz-10
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 16:24:44 +0000
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [2607:f8b0:4864:20::e31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80977fbc-7a91-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 18:24:42 +0200 (CEST)
Received: by mail-vs1-xe31.google.com with SMTP id
 ada2fe7eead31-49bc44e51bcso1878536137.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 09:24:42 -0700 (PDT)
Received: from gmail.com ([168.243.189.171]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4a1517c0e1asm1003400137.17.2024.09.24.09.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 09:24:40 -0700 (PDT)
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
X-Inumbo-ID: 80977fbc-7a91-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727195081; x=1727799881; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmcayURbwLA4fglObLyXfZR4RfFVjxNCGtPf3/Kime4=;
        b=ljIA0e47/O/1iIMLfUCWSKFByZuePAOKqAocQC7xBR0dgXcuGByX0LPbztD21ze0Y/
         VvLnk0GYXCjC80VY68MjJ16iK9cDxRavQOapHMTD/qiqjYOSBMgUF6+sm9lRRx7n7roV
         TpwTdbK7opKTh+GpZczBfC6Dvycck2HP9Ljetqkb5bDNfJNEmt5e8V+7SPQrfmkGiZO8
         v8BtKkO7qhzmKm6mhraggxfnTTnrlh5JBM9l5UqrZXkfFevDkGBxEwWVzPioKDiad/PK
         I3dKgjbp0S0piMKvg7XRcndBbmdBXs2rkhz1KrHVHlfqThPn5opcQ37xaV6i7CFni2EO
         AkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727195081; x=1727799881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmcayURbwLA4fglObLyXfZR4RfFVjxNCGtPf3/Kime4=;
        b=CuSQKb1/bhlcg0bjXZF9uRT/z/b19O4G//7jN9l8bHG8wICb6t4hxkbKESZhIOlTpu
         w3yH9XRhMfBOIbeNVvGeOIgZh8brD3QdWFHgo7xFGI9DKIixJwT08azINxt7g3FfHUw8
         bx12ulqBMULeO/M3oODlnAyMrsgYgxrj7spMbwfPPbTP/DgruRqGxFxvhWU1hxjd3sK/
         wWWr3cEb5sfkoroiAvwt+hgTiTlhqHYinNpxCd/YMNVeS/5Q6uz8l4ZAZB/VOcZIwDVL
         LH7XoIkcd/FeAh7RT+mHAjOLz7OQUfPuGDiXej3Hz6nWzVciLbqR5MiMBce8bwlxmrTW
         5L1A==
X-Gm-Message-State: AOJu0Yzd/JUpG4/kbi4+xBVJB2In4mjaW//ZYepqBBX9pXQQuwhI9qZ3
	z05Qc61u4tqDG4Mx2AD2NKWKOUuWUPQyyXbOvhW7tM3E0eZQzVH74rF3HE2d
X-Google-Smtp-Source: AGHT+IHLZSH080iTk+As1JXYiDfxpcGs1Rd+oD5mrht+Y1a4L+lu+7BUt7tkPVi8MQkr+poDU4lhew==
X-Received: by 2002:a05:6102:c92:b0:49a:211a:f08d with SMTP id ada2fe7eead31-4a15dd7897amr47661137.24.1727195080731;
        Tue, 24 Sep 2024 09:24:40 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	dpsmith@apertussolutions.com,
	edgar.iglesias@amd.com
Subject: [PATCH v1 5/6] xen/arm: io: Add a read-const writes-ignored mmio handler
Date: Tue, 24 Sep 2024 18:23:58 +0200
Message-ID: <20240924162359.1390487-6-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add a read-const writes-ignored mmio handler. This is useful
to for example register background regions that return a fixed
value instead of raising data aborts.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 xen/arch/arm/include/asm/mmio.h |  2 ++
 xen/arch/arm/io.c               | 21 +++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/xen/arch/arm/include/asm/mmio.h b/xen/arch/arm/include/asm/mmio.h
index 7da542cd79..605620a2f4 100644
--- a/xen/arch/arm/include/asm/mmio.h
+++ b/xen/arch/arm/include/asm/mmio.h
@@ -82,6 +82,8 @@ struct vmmio {
     struct mmio_handler *handlers;
 };
 
+extern const struct mmio_handler_ops mmio_read_const_writes_ignored;
+
 enum io_state try_handle_mmio(struct cpu_user_regs *regs,
                               mmio_info_t *info);
 void register_mmio_bg_handler(struct domain *d,
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 934a2ad2b9..8ab0435afc 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -20,6 +20,27 @@
 
 #include "decode.h"
 
+/*
+ * Reusable mmio handler useful as background while waiting for IOREQ.
+ * Register with priv as default read value. Writes ignored.
+ */
+static int bg_read(struct vcpu *v, mmio_info_t *info, register_t *r, void *priv)
+{
+    *r = (uintptr_t) priv;
+    return 1;
+}
+
+static int bg_write(struct vcpu *v, mmio_info_t *info, register_t r, void *priv)
+{
+    return 1;
+}
+
+/* Read const value (from priv), writes ignored.  */
+const struct mmio_handler_ops mmio_read_const_writes_ignored = {
+    .read = bg_read,
+    .write = bg_write,
+};
+
 static enum io_state handle_read(const struct mmio_handler *handler,
                                  struct vcpu *v,
                                  mmio_info_t *info)
-- 
2.43.0


