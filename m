Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE569E6663
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:42:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849421.1264132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQA8-0007jc-82; Fri, 06 Dec 2024 04:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849421.1264132; Fri, 06 Dec 2024 04:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQA7-0007RI-6h; Fri, 06 Dec 2024 04:41:55 +0000
Received: by outflank-mailman (input) for mailman id 849421;
 Fri, 06 Dec 2024 04:41:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQ9z-0004Kb-W4
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62c8835c-b38c-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 05:41:41 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6FFB45C7307;
 Fri,  6 Dec 2024 04:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9ACAC4CEE0;
 Fri,  6 Dec 2024 04:41:37 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E22EDE77175;
 Fri,  6 Dec 2024 04:41:37 +0000 (UTC)
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
X-Inumbo-ID: 62c8835c-b38c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460097;
	bh=tVwGh2fI891yEmph9JS9g2v7QV1qSjDfL8jnuUT3Tb8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DBzgJtybXhXq1eNkGfJ8DH1NhvocvW43UaWJ9Yx+ZaXnNmA7O91SFdmShOORcVfjc
	 jJkau6mG4PfPNOa4/gtFMIMNBSuBVQ6+QULjgjSOucPgBbrGBRwBQdv3Q1JPenSYxo
	 StTLy1K1v+DGdusUclQTcVrhsIMhXGkXujhnJcSKF6smgwfomcNBGKegVM17FzZBcR
	 ILYV6ViRZ+htsoggtX+Xrtdx3yiRGKpZHQl9qXkuBHnW4wwrVYnPuxKSlGyqVeAtuh
	 lKJdnFiqZHDxt2JE2VxWnV7BgfUTYJ/pYb8RrXVXFOzHNhAkH7Un/VfcFRnFQ28tLq
	 bTNnIVfNOYHmw==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:40 -0800
Subject: [PATCH v2 10/35] xen/domain: add get_initial_domain_id()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-10-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460094; l=3214;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=e/LNB+9Wk5d4Vu+ImwNmQARBXeefJiOOq9L8JfHstNA=;
 b=5L8rPCs4pZZiWY8ZAdYomk3nYievoOQV1OGbxK/bIoBZOmkf4+R9OBRrd2hxO0WaHFXCsqyvB
 h1bbyNFHNsVBIh6LUg6sY+kHC6raUY41Eek0IyLAbNbykEParYXDVD8
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Move get_initial_domain_id() to a public API and enable for all architectures.
That is pre-requisite change for console focus switch logic cleanup.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/include/asm/pv/shim.h |  4 ++--
 xen/arch/x86/pv/shim.c             |  4 ++--
 xen/common/domain.c                | 10 ++++++++++
 xen/include/xen/domain.h           |  2 ++
 4 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/pv/shim.h b/xen/arch/x86/include/asm/pv/shim.h
index 6153e27005986881ad87e9db0b555b30edc59fc0..1515ad1b0680aa11ab91a152a1944fc1bb477a79 100644
--- a/xen/arch/x86/include/asm/pv/shim.h
+++ b/xen/arch/x86/include/asm/pv/shim.h
@@ -31,7 +31,7 @@ long cf_check pv_shim_cpu_up(void *data);
 long cf_check pv_shim_cpu_down(void *data);
 void pv_shim_online_memory(unsigned int nr, unsigned int order);
 void pv_shim_offline_memory(unsigned int nr, unsigned int order);
-domid_t get_initial_domain_id(void);
+domid_t pv_shim_initial_domain_id(void);
 uint64_t pv_shim_mem(uint64_t avail);
 void pv_shim_fixup_e820(void);
 const struct platform_bad_page *pv_shim_reserved_pages(unsigned int *size);
@@ -76,7 +76,7 @@ static inline void pv_shim_offline_memory(unsigned int nr, unsigned int order)
 {
     ASSERT_UNREACHABLE();
 }
-static inline domid_t get_initial_domain_id(void)
+static inline domid_t pv_shim_initial_domain_id(void)
 {
     return 0;
 }
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index 81e4a0516d18b359561f471f1d96e38977661ca7..17cb30620290c76cf42251f70cfa4199c0e165d1 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -328,7 +328,7 @@ int pv_shim_shutdown(uint8_t reason)
     }
 
     /* Update domain id. */
-    d->domain_id = get_initial_domain_id();
+    d->domain_id = pv_shim_initial_domain_id();
 
     /* Clean the iomem range. */
     BUG_ON(iomem_deny_access(d, 0, ~0UL));
@@ -1016,7 +1016,7 @@ void pv_shim_offline_memory(unsigned int nr, unsigned int order)
     }
 }
 
-domid_t get_initial_domain_id(void)
+domid_t pv_shim_initial_domain_id(void)
 {
     uint32_t eax, ebx, ecx, edx;
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 92263a4fbdc57159b4a32d9d4ee038f9f37804ed..2f67aa06ed50e69c27cedc8d7f6eb0b469fe81cd 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -45,6 +45,7 @@
 
 #ifdef CONFIG_X86
 #include <asm/guest.h>
+#include <asm/pv/shim.h>
 #endif
 
 /* Linux config option: propageted to domain0 */
@@ -2229,6 +2230,15 @@ int continue_hypercall_on_cpu(
     return 0;
 }
 
+domid_t get_initial_domain_id(void)
+{
+#ifdef CONFIG_X86
+    return pv_shim_initial_domain_id();
+#else
+    return 0;
+#endif
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 3de56352911347a54cce310f0211bcc213d8a08d..601ef431cf621af44c867400499b73b845eb137a 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -171,4 +171,6 @@ extern bool vmtrace_available;
 
 extern bool vpmu_is_available;
 
+domid_t get_initial_domain_id(void);
+
 #endif /* __XEN_DOMAIN_H__ */

-- 
2.34.1



