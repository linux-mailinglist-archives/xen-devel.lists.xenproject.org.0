Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 620978C79A9
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 17:48:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723475.1128359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7dL6-00009j-Nm; Thu, 16 May 2024 15:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723475.1128359; Thu, 16 May 2024 15:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7dL6-00005s-Jv; Thu, 16 May 2024 15:48:16 +0000
Received: by outflank-mailman (input) for mailman id 723475;
 Thu, 16 May 2024 15:48:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DxoZ=MT=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s7dL5-0008LQ-LJ
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 15:48:15 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4e7868a-139b-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 17:48:14 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2e538a264e0so12460321fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 08:48:14 -0700 (PDT)
Received: from gmail.com ([213.0.35.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42016b88f99sm146828625e9.10.2024.05.16.08.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 08:48:13 -0700 (PDT)
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
X-Inumbo-ID: b4e7868a-139b-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715874494; x=1716479294; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YP28Iks2aCd2MOvUAbQc4yYuz/leCz2VtuKFu0fMfns=;
        b=Htw5IuoKJOBVAtAAeIs9v+QWS5XZlSFOmftRCQWV3aNYJeqn1UeW61GtqyzbEJ1HxC
         /BTI6n18XkvkFuhdcRuMoNEGISDGGcCXqHXJkdsQkP9fzofnBXFO0NJX5SCVsngAia/K
         Cp1PryhEnY5KvLUiqAg7FbE2Mcir2cVl21EXbYmXWAQhq6xOFoBo8vfxRuyhn23XDA6x
         Ve+gkgPbkcttAyRZgwDpros33L1VkqlAukeoqaWVnye34iECtjHOx2OSuEwF0quh4WtB
         GmJIsgwV9cfluutacU0f1OwF+e2FxMZ2rO4l9PR2yvBFnGFS5YLMYWSVuY2jbETA4ZNE
         RDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715874494; x=1716479294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YP28Iks2aCd2MOvUAbQc4yYuz/leCz2VtuKFu0fMfns=;
        b=G1MDIHW2H9rKhgk4S+6G6N3Qp9jR4pW85vDCwIFBLO6MeDMwslbdiyhP2SYi4xEZxs
         OpwhZcSvk7THAMPrC0WQvLfgU1A31bWjzgAO4tWQIkLyREx9SpQyNzUO39n7Q+WHSPeY
         SYOttzThvclZR9SVFHVPtzliQIvN8AII4GzQbss7XZzDru1zJ3aOxybQ+q20qNtJaUN6
         gQTi4wiuQkgTFip9V/qwk+EiKmJMPcVoOzp8LjnX9d/S+MRCe0DInW8Hhe81j2Qm3qAe
         ey8DUGR/vwHO1VTOKQ84Z+9Aszz0z1t2Elk6nV8zswL+L7MRHBFpMpaWXzy3VfLSoLrV
         7zQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE6GcneH3GWcpb43+KwUCxdk9wMjzC6HqjuKUUZ37Q+3RcIJXj8Afg2ms7hFYv1wHWT+1YxhxQrs3g2ciNoW2WxtqyMbtYqmfQJWcJaFw=
X-Gm-Message-State: AOJu0YyPp/gbQv/ZFyBZULiGEsYejpD8BOnS0Rzmfct01Ess9JUHiHYf
	jofSXWRAbPhmbZcCSiEzjKKQv10Ff8XoXhpZkLZP8cej1i4FT51z
X-Google-Smtp-Source: AGHT+IEaN/+VHmkJjv/znpWgW3h0+GqXzWUJj0uCRLf2DykoyCNb/asHTon7nVels7WBBHQIR1MU9A==
X-Received: by 2002:a2e:be9f:0:b0:2e3:ba0e:de12 with SMTP id 38308e7fff4ca-2e51ff5cf48mr209958761fa.22.1715874494287;
        Thu, 16 May 2024 08:48:14 -0700 (PDT)
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
Subject: [PATCH v6 3/8] xen: Add xen_mr_is_memory()
Date: Thu, 16 May 2024 17:47:59 +0200
Message-Id: <20240516154804.1114245-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240516154804.1114245-1-edgar.iglesias@gmail.com>
References: <20240516154804.1114245-1-edgar.iglesias@gmail.com>
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


