Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 157CF6A40B6
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 12:36:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502418.774194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWbnn-0002sj-CM; Mon, 27 Feb 2023 11:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502418.774194; Mon, 27 Feb 2023 11:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWbnn-0002qi-85; Mon, 27 Feb 2023 11:36:19 +0000
Received: by outflank-mailman (input) for mailman id 502418;
 Mon, 27 Feb 2023 11:36:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mutd=6X=citrix.com=prvs=4152eaadc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pWbnl-0002qb-4F
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 11:36:17 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef4072fe-b692-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 12:36:13 +0100 (CET)
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
X-Inumbo-ID: ef4072fe-b692-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677497772;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qdPqHjY3LWjug/jN//1EYqFhHat/Uu2KeZ7O9A4yG38=;
  b=VWCRoKmAHo5PIJwJbeBIaOF87zpOweDuf/5cmiL2dPuqy5M5C7ZhR+y+
   h+h538oYcPm6k2riU2k9wzKg0ChgGmiBAwO4L9ZKDFFPdwW9Otyinl54L
   dOgeR8DN+hrf6nuf2RWgj9NL5NaUU/6bqcWfTogTfs4u2IKt/V9mhA7Cs
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 98051109
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:4F0bBa5QpM1NU5XuFfXySgxRtCDHchMFZxGqfqrLsTDasY5as4F+v
 moYWDuBPfmPYmanfo8nbNnl/BhT7cWAm9dnTQE9q3syHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPaoR4weH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mz
 dE2dnNKNw64gfOn67uWVPBSg8g6BZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9zxbA+
 zufpzWR7hcyc/2g7Ry0032QudT+nB7hW6BVEpyBz6s/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZLdcY0vcsxSTs13
 3eGmtroAXpkt7j9dJ6G3u7K93XoY3FTdDJcI3ZeFmPp/uUPvqkLozyRDZE6DpWzn8zeEBzu2
 g6PoDEX0uB7YdEw6423+lXOgjSJr5fPTxIo6gi/Yl9J/j+Vd6b+OdX2tAGzAeJoad/AEwLf5
 CRsd922trhmMH2bqMCarAzh9pmN7u3NDjDTiEUH83IJp2X0oC7LkWy9DVhDyKZV3iQsI2CBj
 Kz741k5CHpv0JyCPMdKj3qZUZhC8EQZPY2NugroRtRPeINtUwSM4TtjY0Wdt0i0zhdzzfphZ
 cnLIJjyZZr/NUiA5GDrL9rxLJdxnnxurY8tbcyTI+ubPUq2OyfOFOZt3KqmZeEl9qKUyDg5A
 P4GX/ZmPy53CbWkCgGOqN57ELz/BSRjbXwAg5ANJ7Hrz8sPMD1JNsI9Npt6IdE6xPgKzruSl
 px/M2cBoGfCabT8AV3iQhhehHnHAv6TcVpT0fQQAGuV
IronPort-HdrOrdr: A9a23:RZ+vVKMT9YanL8BcTy3155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBHpTnyAtjlfZq6z+8J3WBxB8bZYOCCggeVxe5ZnOjfKlHbalXDH6tmpN
 xdmstFeaPN5DpB7foSiTPQe7hA/DDEytHQuQ639QYTcegAUdAE0+4WMHf9LqQ7fnglOXJvf6
 Dsmvav6gDQD0g/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/iYsKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF6d2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCqlqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0BjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXd
 WGNPusqsq+TGnqLkww5gJUsZyRtzUIb127q3E5y4OoO2M8pgE786MarPZv7EvouqhNCaWs3N
 60QZiApIs+P/P+UpgNdNvpYfHHflAlEii8R156Z26XX506Bw==
X-IronPort-AV: E=Sophos;i="5.97,331,1669093200"; 
   d="scan'208";a="98051109"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Xenia Ragiadakou <burzalodowa@gmail.com>
Subject: [PATCH v2] x86/svm: Decouple types in struct nestedsvm
Date: Mon, 27 Feb 2023 11:35:33 +0000
Message-ID: <20230227113533.2848119-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

struct nestedvm uses mostly plain integer types, except for virt_ext_t which
is a union wrapping two bitfield names.

However, it turns out that this is a write-only variable.  Delete it, allowing
us to drop the include of vmcb.h

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Xenia Ragiadakou <burzalodowa@gmail.com>

v2:
 * Delete the variable entirely.

This probably means that nested lbr/vmloadsave is broken, but that wouldn't be
a surprise at all.
---
 xen/arch/x86/hvm/svm/nestedsvm.c             | 5 -----
 xen/arch/x86/include/asm/hvm/svm/nestedsvm.h | 5 -----
 2 files changed, 10 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 92316c6624ce..63ed9fc248e1 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -164,7 +164,6 @@ int cf_check nsvm_vcpu_reset(struct vcpu *v)
     svm->ns_exception_intercepts = 0;
     svm->ns_general1_intercepts = 0;
     svm->ns_general2_intercepts = 0;
-    svm->ns_virt_ext.bytes = 0;
 
     svm->ns_hap_enabled = 0;
     svm->ns_vmcb_guestcr3 = 0;
@@ -524,10 +523,6 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     /* Pending Interrupts */
     n2vmcb->event_inj = ns_vmcb->event_inj;
 
-    /* LBR and other virtualization */
-    if ( !clean.lbr )
-        svm->ns_virt_ext = ns_vmcb->virt_ext;
-
     n2vmcb->virt_ext.bytes =
         n1vmcb->virt_ext.bytes | ns_vmcb->virt_ext.bytes;
 
diff --git a/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h b/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
index 94d45d2e8d47..230f818df80c 100644
--- a/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
@@ -20,8 +20,6 @@
 
 #include <xen/types.h>
 
-#include <asm/hvm/svm/vmcb.h>
-
 struct nestedsvm {
     bool ns_gif;
     uint64_t ns_msr_hsavepa; /* MSR HSAVE_PA value */
@@ -43,9 +41,6 @@ struct nestedsvm {
     uint32_t ns_general1_intercepts;
     uint32_t ns_general2_intercepts;
 
-    /* Cached real lbr and other virtual extentions of the l2 guest */
-    virt_ext_t ns_virt_ext;
-
     /* Cached real MSR permission bitmaps of the l2 guest */
     unsigned long *ns_cached_msrpm;
     /* Merged MSR permission bitmap */
-- 
2.30.2


