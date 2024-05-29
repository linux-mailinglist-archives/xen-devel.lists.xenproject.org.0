Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D068D38B9
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 16:08:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731993.1137791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCJy1-0004kf-FW; Wed, 29 May 2024 14:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731993.1137791; Wed, 29 May 2024 14:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCJy1-0004iR-C9; Wed, 29 May 2024 14:07:49 +0000
Received: by outflank-mailman (input) for mailman id 731993;
 Wed, 29 May 2024 14:07:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9nLQ=NA=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sCJy0-0004U5-7I
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 14:07:48 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d361b662-1dc4-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 16:07:46 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52b119986f2so710587e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 07:07:46 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-529715e57c1sm1333816e87.286.2024.05.29.07.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 07:07:44 -0700 (PDT)
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
X-Inumbo-ID: d361b662-1dc4-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716991666; x=1717596466; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfQU3CIk8oi6JUEGcx9QZf/9+B1Oq0qqW+7JWEaNpUQ=;
        b=QoswkUFCR7FGFb+hWlx6AuRK9tIIKedF4mT5M9Vym6NhCnNt9L/y6LyY6S5NeM6m2F
         blU/eyXywaU32Ekx8sq4+uh43onH5LCL/KLHJ0Vl+npjWnyTqgh3m8Y9B85h0WHpvBZP
         6EkVID6sK79PHiDCm+Fd1JZVnND5UzHJQIRiJF3EmXDXueQhdnYIlveIRaLauEnIYuQE
         Z1AMBdzpU3IP+eicgW2NZnUEgxxFCS+eXtudP1d3klxg1nF11tix1sccKMSxxCuf8QyY
         Dx5QW9N7b/k2oUas267tyxGqPBut8wT7IwYDCmsuDiiMhYIAwy3a6p0boky3uvRT5xfO
         AfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716991666; x=1717596466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfQU3CIk8oi6JUEGcx9QZf/9+B1Oq0qqW+7JWEaNpUQ=;
        b=NFC1lhpBNflk5TRn7V+3ogxm5Z2fWvHdzycE4bvH/w1omJA0EVm+By/fMA2yC+xIBJ
         tA0tlFFWTy3f9bCXK8RTYHS2iBTlKE+Wk4lcmioNa/js4B1eukApeMYu35pkfFg+Xw0V
         aXqfMq8L5uyRfKUfdlACL+dUxFGVcodzMgP+eDcGBaEh6qekSXk7zUWlOSpZztwD5quI
         spOOCPPLNkO63kDA6gdklkKp3mL1q5AH20/+qi3mcfy89t+BTVQ99PKvzrv6nM44XJOr
         +ewZo3mVuCPCUBxUzQCLysuaB4ZPO/viOKl9ZuVpWX1YUrq+AeLictE2OL+/Y5gDSVyY
         acLg==
X-Forwarded-Encrypted: i=1; AJvYcCXRL1mH+PPVfjDvx2s7bQwGmMrAIoJtlGXDIsGmqDc3mOTT/mPNbmW1zTpuR9rabA57IbSL5TEr70NMzHiAR2ex/YAO0u9JK/qUG+4E8KY=
X-Gm-Message-State: AOJu0YwpqxQt5LJDF4CvIgfvJt/8rr6MUeDp+wT9yY/7lezgR3d8QPaa
	y8w8dHbdcW+TQ2NhqSQfEtn2g+zSlsMAXdzts9Gty8mm1cQfl8D0
X-Google-Smtp-Source: AGHT+IGzkXOYSImMOV6N87l6JZQ270Dpu6VtX1s3RWgHcPsFkFEwPwb1/bHSmEc0ivZv+7V/GBf3hw==
X-Received: by 2002:a19:2d48:0:b0:526:92d7:52d4 with SMTP id 2adb3069b0e04-529bea19e84mr2711966e87.61.1716991666190;
        Wed, 29 May 2024 07:07:46 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v8 3/8] xen: Add xen_mr_is_memory()
Date: Wed, 29 May 2024 16:07:34 +0200
Message-Id: <20240529140739.1387692-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240529140739.1387692-1-edgar.iglesias@gmail.com>
References: <20240529140739.1387692-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add xen_mr_is_memory() to abstract away tests for the
xen_memory MR.

No functional changes.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/xen/xen-hvm-common.c | 10 ++++++++--
 include/sysemu/xen.h    |  1 +
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 2d1b032121..a0a0252da0 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -12,6 +12,12 @@
 
 MemoryRegion xen_memory;
 
+/* Check for xen memory.  */
+bool xen_mr_is_memory(MemoryRegion *mr)
+{
+    return mr == &xen_memory;
+}
+
 void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
                    Error **errp)
 {
@@ -28,7 +34,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
         return;
     }
 
-    if (mr == &xen_memory) {
+    if (xen_mr_is_memory(mr)) {
         return;
     }
 
@@ -55,7 +61,7 @@ static void xen_set_memory(struct MemoryListener *listener,
 {
     XenIOState *state = container_of(listener, XenIOState, memory_listener);
 
-    if (section->mr == &xen_memory) {
+    if (xen_mr_is_memory(section->mr)) {
         return;
     } else {
         if (add) {
diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
index 754ec2e6cb..3445888e39 100644
--- a/include/sysemu/xen.h
+++ b/include/sysemu/xen.h
@@ -49,4 +49,5 @@ static inline void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
 
 #endif /* CONFIG_XEN_IS_POSSIBLE */
 
+bool xen_mr_is_memory(MemoryRegion *mr);
 #endif
-- 
2.40.1


