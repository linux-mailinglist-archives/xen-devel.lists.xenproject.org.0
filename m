Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E41E76A236C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 22:07:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501582.773413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVfHS-000284-MH; Fri, 24 Feb 2023 21:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501582.773413; Fri, 24 Feb 2023 21:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVfHS-00026B-J5; Fri, 24 Feb 2023 21:07:02 +0000
Received: by outflank-mailman (input) for mailman id 501582;
 Fri, 24 Feb 2023 21:07:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V4+4=6U=citrix.com=prvs=412e064f8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVfHR-000265-8Q
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 21:07:01 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2af96e2b-b487-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 22:06:57 +0100 (CET)
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
X-Inumbo-ID: 2af96e2b-b487-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677272817;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EkflLGL5Iq06WiyTlOwBMTCMQw+4i7UVOQ5l5q9ecsg=;
  b=cs9Saw5aPVPDmDY2ILlrsYYc2h5VZR/WMyfADWId0jRb+aVbJPzfmEy/
   N1PecRHTp44NUGR4M5rLjDsfnpZpsu/9XlmugPLuss78P6HZQPujfh2qX
   l0QgTYmIlNI6QwztN5lLQ96EbyfOGKq4kQKSfxIzWcPZPe+rYLP1lGOQE
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97854733
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:dXTAt6tIWft0F/36kytapTs2wufnVE5eMUV32f8akzHdYApBsoF/q
 tZmKTuCPfnZMWfyLopyOYiw9x4E6MeEzocxQAc5rSowEyND+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj51v0gnRkPaoQ5AWEyyFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwcBQidkvAgOuN+Z2ZDeJPotwDKZTPM9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw9
 z2WojimWUpy2Nq3lxqJqWirovDzjSbwebJPF+SfpvRGjwjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAPQsqdUkTDgt2
 liWlvvmADVutPueTnf1y1uPhWrsY25PdzZEPHJaC1JfuLEPvb3fkDqXavl7S+2yh+bMNhO3y
 BOutAg72pEc2JtjO7qAwXjLhDelp57sRwEz5xnKUm/N0j6VdLJJdKTztwGFsK8owJKxCwDY4
 SNaw5T2APUmV8nlqcCbfAka8FhFDd6hOSaUv1NgFoJJG9+Fqy/6JtA4DN2TyS5U3ic4ld3BO
 hK7VeB5vsU70J6WgUhfMuqM5zwCl/SIKDgcfqm8giBySpZwbhSb2ypleFSd2Wvg+GB1z/5gY
 8nAL5f1UytFYUiC8NZRb71AuYLHOwhknT+DLXwF50nPPUWiiI69Fu5ebQrmghER56KYugTFm
 +uzxOPToyizpNbWO3GNmaZKdABiEJTOLcyuwyChXrLZc1UO9aBII6O5/I7NjKQ1w/QLxr+Xp
 yvVt40x4AOXuEAr4D6iMhhLAI4Dl74l9BrX4QRE0Y6U5kUe
IronPort-HdrOrdr: A9a23:RISJnKFWga3zzLjWpLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 aTdZUgpGfJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YYT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="97854733"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Xenia Ragiadakou <burzalodowa@gmail.com>
Subject: [PATCH v3 05.5/14] x86/svm: Decouple types in struct nestedsvm
Date: Fri, 24 Feb 2023 21:06:16 +0000
Message-ID: <20230224210616.2818727-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230224185010.3692754-6-burzalodowa@gmail.com>
References: <20230224185010.3692754-6-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

struct nestedvm uses mostly plain integer types, except for virt_ext_t which
is a union wrapping two bitfield names.  But the nested virt logic only ever
deals with it as full opaque register.

Switch it to being a plain uint64_t, allowing us to hide even more of the SVM
internal infrastructure.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Xenia Ragiadakou <burzalodowa@gmail.com>

This allows virt_ext_t to move out of the public vmcb.h along with all other
vmcb types.
---
 xen/arch/x86/hvm/svm/nestedsvm.c             | 4 ++--
 xen/arch/x86/include/asm/hvm/svm/nestedsvm.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 92316c6624ce..153a37f2f227 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -164,7 +164,7 @@ int cf_check nsvm_vcpu_reset(struct vcpu *v)
     svm->ns_exception_intercepts = 0;
     svm->ns_general1_intercepts = 0;
     svm->ns_general2_intercepts = 0;
-    svm->ns_virt_ext.bytes = 0;
+    svm->ns_virt_ext = 0;
 
     svm->ns_hap_enabled = 0;
     svm->ns_vmcb_guestcr3 = 0;
@@ -526,7 +526,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
 
     /* LBR and other virtualization */
     if ( !clean.lbr )
-        svm->ns_virt_ext = ns_vmcb->virt_ext;
+        svm->ns_virt_ext = ns_vmcb->virt_ext.bytes;
 
     n2vmcb->virt_ext.bytes =
         n1vmcb->virt_ext.bytes | ns_vmcb->virt_ext.bytes;
diff --git a/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h b/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
index 94d45d2e8d47..184248bbd7c5 100644
--- a/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
@@ -44,7 +44,7 @@ struct nestedsvm {
     uint32_t ns_general2_intercepts;
 
     /* Cached real lbr and other virtual extentions of the l2 guest */
-    virt_ext_t ns_virt_ext;
+    uint64_t ns_virt_ext;
 
     /* Cached real MSR permission bitmaps of the l2 guest */
     unsigned long *ns_cached_msrpm;
-- 
2.30.2


