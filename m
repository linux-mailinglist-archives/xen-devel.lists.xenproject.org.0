Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDDD8CE46A
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 12:52:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729312.1134441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASWp-0006Df-FK; Fri, 24 May 2024 10:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729312.1134441; Fri, 24 May 2024 10:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASWp-0006A0-AE; Fri, 24 May 2024 10:52:03 +0000
Received: by outflank-mailman (input) for mailman id 729312;
 Fri, 24 May 2024 10:52:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2lVY=M3=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sASWo-0005va-7b
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 10:52:02 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6794cf7-19bb-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 12:52:01 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2e95a7545bdso8103881fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 03:52:01 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e95be00a9esm1417431fa.103.2024.05.24.03.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 03:51:59 -0700 (PDT)
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
X-Inumbo-ID: a6794cf7-19bb-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716547921; x=1717152721; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YP28Iks2aCd2MOvUAbQc4yYuz/leCz2VtuKFu0fMfns=;
        b=Wl4j6IP6/aHZ0ifQHdheTEn2PWngmtcVEywDgaBYPaEqm+g8RSgs2o0BC0A2bWNOnZ
         tlysKLtQA7gFr+scuWAYicl5i1AVFnUDiW7hS+0EJVHSB8PqqRTsyfRP++BvVQPYwZ67
         33VVXtFJX81rnzXeVZ4xoPch0ZedFMw+9ngfqi9UyITAq792g1k/+YTjXRdp6wEwKEBi
         xsh9PnesERgcpz/FK/kwm18ZZH3VPQbCI1xp/RkdFlfHcApaGJowGAd5r5kNy9NyE/Vy
         4wDTYOzEXOzOJPCxIDxYQymHTpqMHyHO42RvY3fGzFqL+eafUBIs13EMZPKGTwgLFrvd
         Pz4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716547921; x=1717152721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YP28Iks2aCd2MOvUAbQc4yYuz/leCz2VtuKFu0fMfns=;
        b=fZXfhN4GP1MxoipY23lKgTSI5BENqQDpCA/MYD5jIG3UsOtlZ910HninnRIf9egpOs
         qrVuk1q1Vtp0oKuBzqLJoAxM+mTtj1nFfhCePNbNnqdb2f4SVTgCt5bIldXwOL0McMQ0
         yGePB0Yn1GFAenSBVfRjx/x/Ae8BMpi18Mf9gCDmL8vCzyWmCLrxMzavl0+awx512Gj/
         XK5rFvNpClBIfzrlZyIvaWof5oGObdx+CMfT7gLN321gocGOdDu3WttzK4upJT9Z23H9
         UXN+hh3m27VIefosxPIp2UEKOc69WRo/6VXr4B6KP5z+7tbRGt8/tzwB4sYkNpWptcJK
         l4Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWuFZpVxQ1iBZjP1In0AB9zOsAWF/dyhla6K0Td2QkzakQq0zYVBHGrwhZdy0MJKj6+NV/+4IU+rseL1Vcru3U4zpXkuUTJUHM3/HQ4S4U=
X-Gm-Message-State: AOJu0YyiPTWZA5p7adDfqva5KCdWX44rzf67ewSOqgKHYn2Y0TgLpIwD
	6NoiIgBRgHSIulmpOp6d81IpLnHep8HLBUt80JDE5UlGvbpqg0gf
X-Google-Smtp-Source: AGHT+IHxf48OGn9vlQXF6Pl1G+8i2NXaRVtBjeCMc7C8+mcWr77Zr/it24OxvWZYA9xQzmTZ7G5dGA==
X-Received: by 2002:a2e:6802:0:b0:2e5:67a8:2e6b with SMTP id 38308e7fff4ca-2e95b04115amr13608211fa.8.1716547920962;
        Fri, 24 May 2024 03:52:00 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>,
	David Hildenbrand <david@redhat.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v7 3/8] xen: Add xen_mr_is_memory()
Date: Fri, 24 May 2024 12:51:47 +0200
Message-Id: <20240524105152.1301842-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240524105152.1301842-1-edgar.iglesias@gmail.com>
References: <20240524105152.1301842-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add xen_mr_is_memory() to abstract away tests for the
xen_memory MR.

No functional changes.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: David Hildenbrand <david@redhat.com>
---
 hw/xen/xen-hvm-common.c | 10 ++++++++--
 include/sysemu/xen.h    |  8 ++++++++
 2 files changed, 16 insertions(+), 2 deletions(-)

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
index 754ec2e6cb..dc72f83bcb 100644
--- a/include/sysemu/xen.h
+++ b/include/sysemu/xen.h
@@ -34,6 +34,8 @@ void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
 void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
                    struct MemoryRegion *mr, Error **errp);
 
+bool xen_mr_is_memory(MemoryRegion *mr);
+
 #else /* !CONFIG_XEN_IS_POSSIBLE */
 
 #define xen_enabled() 0
@@ -47,6 +49,12 @@ static inline void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
     g_assert_not_reached();
 }
 
+static inline bool xen_mr_is_memory(MemoryRegion *mr)
+{
+    g_assert_not_reached();
+    return false;
+}
+
 #endif /* CONFIG_XEN_IS_POSSIBLE */
 
 #endif
-- 
2.40.1


