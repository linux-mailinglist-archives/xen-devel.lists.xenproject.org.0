Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F384A8C1411
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 19:30:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719346.1122109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s57ad-0000Mf-Mw; Thu, 09 May 2024 17:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719346.1122109; Thu, 09 May 2024 17:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s57ad-0000Kx-Jb; Thu, 09 May 2024 17:29:55 +0000
Received: by outflank-mailman (input) for mailman id 719346;
 Thu, 09 May 2024 17:29:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QLvV=MM=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s57ab-0008WC-Gv
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 17:29:53 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be241a25-0e29-11ef-b4bb-af5377834399;
 Thu, 09 May 2024 19:29:51 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2e34e85ebf4so10422421fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2024 10:29:51 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d0ef229csm2555471fa.66.2024.05.09.10.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 10:29:50 -0700 (PDT)
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
X-Inumbo-ID: be241a25-0e29-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715275791; x=1715880591; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CWrR8s0gYDS+czdwwl88oUb1Zx/cHo9QTV6MX+PdaQ=;
        b=PuaZxYbh4dl/k+kRVrw4kzEzL7R/4qBmasKmm76uPOIncuiut2RFZf7lflsADVIVsB
         SaTosd8Vsn7VFTZk/e8aVWYApbSRPAQozer5yS2XcDPdEl1vsk3w7PrqFIR/qEnJZoCv
         yaouowfMbdNOajLJsZXiDslCnGw5yn3mEjMLOBvNq7glRAVtg8w659yNHGWvR1aPqXiy
         Uio6i1I3cwzCsXscFobRyHqk9sO19RH/qK3FhrhBJUqnG7oX80tH76TUDTg7jNz06X5n
         BbcXxkNkngr4U237Omw0/9ng0oprG6TsLszr8PKqVei5tdlubq4RI1dqWegwyQ8SfkxI
         8yJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715275791; x=1715880591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8CWrR8s0gYDS+czdwwl88oUb1Zx/cHo9QTV6MX+PdaQ=;
        b=fhZYJ55ZiLTSSXCsvMjp4V9Jm1AB1xj9xofq/lH3ROLOWHnHU9sY5SoTa9LQOBj/MN
         xjjmJmyHC6OFujz+yJfIFPTeZOWPfHKj/mOMorLXDze/ZCLJSEQcuxt8tD4tfvzrdiRY
         UsqurTc6wsX80rhyACDipanFagin67DaScQ97jEqFvXtlBmYBcyTHcAI/sJi3+l3ho2C
         2XIl5CXwhkiKUXDNTeq2kFFoiNDtK1GbjK8SPBOvS1JJRxa8SQetE27LIQJxrPsPLdst
         Qhl8ozjSp6WakvYAIizMb478SzsNQmP9+Sbhp02OANTZDefpeTy2W+KZK4vLmRcYeRrt
         raZw==
X-Forwarded-Encrypted: i=1; AJvYcCW4brdFwiJHJtaoWyYV1Ul6i3CprM5vMhm1s3AkAnDBU9Od8K3XEIc7OoCHJKhSXcLMrZxjFjSsdb+4cI7y1L8WXXBiuXWpW1tX/RJHhas=
X-Gm-Message-State: AOJu0Ywl9BeN31qCpPz/bNiExqHt+gHc9R17/AMMKMOGoxLKL1MlNpsG
	niEB8b0lgAIOO7MH0KENycxnTFfwBd1CjsvD2fzhS9xkwF31Ou6k
X-Google-Smtp-Source: AGHT+IEqPcOqKJgEtzLBhZogEkbqeGe1tWfxm6fA+Z6yvRB5yQwN2WVk6iss6MyCzgHI/1kn9iQ+GQ==
X-Received: by 2002:a2e:be13:0:b0:2de:25e2:6187 with SMTP id 38308e7fff4ca-2e51fe57b06mr778381fa.23.1715275791414;
        Thu, 09 May 2024 10:29:51 -0700 (PDT)
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
Subject: [PATCH v5 3/8] xen: Add xen_mr_is_memory()
Date: Fri,  3 May 2024 03:44:44 +0200
Message-Id: <20240503014449.1046238-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503014449.1046238-1-edgar.iglesias@gmail.com>
References: <20240503014449.1046238-1-edgar.iglesias@gmail.com>
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
index 1627da7398..c94f1990c5 100644
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


