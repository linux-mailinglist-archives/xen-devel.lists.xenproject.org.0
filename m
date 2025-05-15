Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F903AB8838
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:39:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985641.1371580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYnp-0007us-T2; Thu, 15 May 2025 13:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985641.1371580; Thu, 15 May 2025 13:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYnp-0007tD-QJ; Thu, 15 May 2025 13:39:13 +0000
Received: by outflank-mailman (input) for mailman id 985641;
 Thu, 15 May 2025 13:39:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYXT-0006hT-Ug
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:22:19 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f1ba848-318f-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 15:22:18 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747315173142393.942667038713;
 Thu, 15 May 2025 06:19:33 -0700 (PDT)
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
X-Inumbo-ID: 9f1ba848-318f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1747315176; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NZBxKFLc6I/FFdo2eQajsV65yLItatKjMNG2BsTPPE5xNCLxYj9XvxDGsvcWK4CL4bTlvYjLXRzqHX7idrc8ztSdd+uAM7E0wCLQrPNmx79GhwbYvcMOu/0ep91baAJHa1S71f6NngSjtzZknjQvtS323PTUsPLk/0tMGyveIj8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315176; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dok5mCKGcvhcJcoUDY82s5z4bmExib11eYAieKaC4x4=; 
	b=ZtUrLxSywqzIrWxm8OZ/RuyXCrnIxLhgSyFhLNUdTrXBSgycmgPYTn6TPaE6LONGY/CdR96uWcpzbvBFp+K9dmYm8wSvZGVJGWjHqqXP9HkPkD8TYDJCHxILkWXEj9nV09Y/qsHDNFzewwLvu97Irz5EJNJBrEXR5Jvt45DtA0k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315176;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=dok5mCKGcvhcJcoUDY82s5z4bmExib11eYAieKaC4x4=;
	b=IXP6sts2bp2m053tZO4YXzfDi3sf5C2DPWtoqKaiSTCmv9hZH97/hZYi+zw4emE7
	vwxNnYv+zywE/nnVt1cq5UdJMbDe6LqIWuePJZ7vp9D2uXkCJMFJlr8t5h+3BuyIz3E
	67OHIZ4GIA/e0Qz98FxtOPrgZ2+QQQYbxn60SkBQ=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: [RFCv2 27/38] x86/hyperlaunch: introduce arch builder finalize
Date: Thu, 15 May 2025 09:19:10 -0400
Message-Id: <20250515131912.5019-8-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131912.5019-1-dpsmith@apertussolutions.com>
References: <20250515131912.5019-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit introduces a per arch builder finalize method where all
post-construction finalization and cleanup can be handled. The call to discard
boot modules relocated from inside the two x86 domain construction paths to the
x86 domain builder finalize method. This will ensure modules are not discarded
until after all domains have been constructed.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

---

Changes since RFC v1:
- reworked the commit to introduce builder finalize
- renamed the commit to refelect builder finalize
---
 xen/arch/x86/domain-builder/core.c   | 2 ++
 xen/arch/x86/domain-builder/domain.c | 8 ++++++++
 xen/arch/x86/hvm/dom_build.c         | 3 ---
 xen/arch/x86/pv/dom0_build.c         | 3 ---
 xen/include/xen/domain-builder.h     | 2 ++
 5 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-builder/core.c
index 3b315e59b188..4eaf3a111208 100644
--- a/xen/arch/x86/domain-builder/core.c
+++ b/xen/arch/x86/domain-builder/core.c
@@ -22,6 +22,8 @@ unsigned int __init builder_create_domains(struct boot_info *bi)
     if ( bd->d )
         build_count++;
 
+    arch_builder_finalize(bi);
+
     return build_count;
 }
 
diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain-builder/domain.c
index 2c01705ebe4f..5b03e3dce228 100644
--- a/xen/arch/x86/domain-builder/domain.c
+++ b/xen/arch/x86/domain-builder/domain.c
@@ -326,6 +326,14 @@ struct domain *__init arch_create_dom(
     return d;
 }
 
+int __init arch_builder_finalize(struct boot_info *bi)
+{
+    /* Free temporary buffers. */
+    free_boot_modules();
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/hvm/dom_build.c b/xen/arch/x86/hvm/dom_build.c
index e73a3950b30e..58fc40916df5 100644
--- a/xen/arch/x86/hvm/dom_build.c
+++ b/xen/arch/x86/hvm/dom_build.c
@@ -853,9 +853,6 @@ static int __init pvh_load_kernel(
         last_addr = ROUNDUP(last_addr, PAGE_SIZE);
     }
 
-    /* Free temporary buffers. */
-    free_boot_modules();
-
     rc = hvm_copy_to_guest_phys(last_addr, bd->cmdline, cmdline_len, v);
     if ( rc )
     {
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 195c0902d5a1..21cb0b11748e 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -866,9 +866,6 @@ static int __init dom0_construct(struct boot_domain *bd)
         init_hypercall_page(d, _p(parms.virt_hypercall));
     }
 
-    /* Free temporary buffers. */
-    free_boot_modules();
-
     /* Set up start info area. */
     si = (start_info_t *)vstartinfo_start;
     clear_page(si);
diff --git a/xen/include/xen/domain-builder.h b/xen/include/xen/domain-builder.h
index c26f670d4f66..ca9d9032b35b 100644
--- a/xen/include/xen/domain-builder.h
+++ b/xen/include/xen/domain-builder.h
@@ -43,6 +43,8 @@ void domain_vcpus_create(struct domain *d);
 struct domain *arch_create_dom(
     struct boot_info *bi, struct boot_domain *bd);
 
+int arch_builder_finalize(struct boot_info *bi);
+
 unsigned int builder_create_domains(struct boot_info *bi);
 
 #endif /* __XEN_DOMAIN_BUILDER_H__ */
-- 
2.30.2


