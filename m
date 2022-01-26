Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2B049C57C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 09:45:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260715.450666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCdvW-0000HR-2w; Wed, 26 Jan 2022 08:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260715.450666; Wed, 26 Jan 2022 08:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCdvV-0000BA-TE; Wed, 26 Jan 2022 08:45:13 +0000
Received: by outflank-mailman (input) for mailman id 260715;
 Wed, 26 Jan 2022 08:45:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DU/T=SK=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nCdvU-000088-8R
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 08:45:12 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43c193a8-7e84-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 09:45:10 +0100 (CET)
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
X-Inumbo-ID: 43c193a8-7e84-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643186710;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aBo0kQNJhRHsmzKv1kY5xGJnmg1ogk4/N3dA6zlLZAk=;
  b=FeQOjRpLueRGy7N/pvvKoGCgoFz4AdQ36qW38bTgP1KNURUqf/403snm
   2Q228Gm/XsyhXo6y/2vEyOYMEv7TuAygL+Nku0cKiOjqvLH3kQVswPHi6
   irPHZzd6gkIovOQMQCIZWCkYJQqFgAwwtkUifcwWTuTp4b90fnIPHiM3f
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2eng8OM1elcPvt7hhoxwg1wNUPg0F5A5mXhaa+ZBTTn+YC35aqc63/G8ygJJ4nfZUIhXdUWrze
 RCVHvMK+3tCahktPyzec+NyqtlybGcx0lCSO+sXjzD2G3S/+1F7twrvkiKgC+tT3ZtZoniiTir
 CpixnuKFmTYcckUyRfzU2g+avXfioUnsTNYV8aYBHsL0BjnDs49eXZ9nIUBE45xEIL5cA5DtY3
 0Dee5sytcUKHMyfJZ5PeL3/FTWbCk4AhUdD32LgdkvOGnbfEvY7JlVD7Ulx+xSaFjZQn/FQ7T+
 ihbJa/9SWfWgHrakI3kDm3kA
X-SBRS: 5.2
X-MesageID: 62700205
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:j+PN3K2NMaDk8SlF4fbD5Qd2kn2cJEfYwER7XKvMYLTBsI5bp2BRm
 GoZWW6HaP6MMTSne9B2O4i2/EoFv8OGmIdlSgFppC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o6wbBh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhro9Q6
 IhT6qeLcBYIErXiic4RaBUGOnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9u3J8WRayGO
 qL1bxJeYk/lcQF2fW0mL5gegf6Tv0HvIxZx/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 kDs8nn9AxoaHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKali9DevoNDbIB0zic64bMzRezClMIEBcUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/4+SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFRON/Ni2+AswGzARN8wGCxFAjpU
 J8swJD20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4Mu2gleRk1bptUJlcFh
 XM/XysLtfe/21PxNcdKj3+ZUZx2ncAM6/y4PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1gmQv7GM6qpzz6gev2TCPEEt8tbQrRBt3VGYvZ+m05B
 f4FaZvTo/ieOcWjChTqHXk7dABTciNjVMmo8qS6tIere2JbJY3oMNeJqZtJRmCvt/g9ej7g8
 i7vV0lG5kD4gHGbewyGZmo6MOHkXIplrGJ9NispZA76138maIepzaEea5poIuV3qL09laZ5H
 6sfZsGNIvVTUTCbqT4TWobw8d55fxOxiAPQYyf8OGojf4RtThDi88P/ele97zEHCye67JNso
 7Cp2g7Bb4AEQgBuUJTfZP61lgvjtnkBguNiGUDPJ4ALKknr9YFrLQ33j+M2fJ5QeUmSmGPC2
 l/PUxkCpOTLr4sky/XzhPiJ/9WzDu9zPktGBG2Hv7y4AjbXozi4yohaXefWIT2EDDHo+L+vb
 Pl+xu3nNKFVh05DtodxHuo5za864Nez9bZWwh49QSfOZlWvTLhhPmOHzY9EsagUnu1Vvg6/W
 0Su/NhGOOrWZJO5QQBJfAd1PP6e0fw0myXJ6aVnKUr30yZ74b6bXBgAJBKLkiFccON4PY5NL
 T3NYyLKB9hTUiYXD+s=
IronPort-HdrOrdr: A9a23:mI9JJqM+dSwte8BcTvmjsMiBIKoaSvp037Eqv3oedfUzSL3gqy
 nOpoV86faaslYssR0b9exofZPwJE80lqQFhrX5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtrZ
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.88,317,1635220800"; 
   d="scan'208";a="62700205"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 7/8] x86/msr: AMD MSR_SPEC_CTRL infrastructure
Date: Wed, 26 Jan 2022 08:44:51 +0000
Message-ID: <20220126084452.28975-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220126084452.28975-1-andrew.cooper3@citrix.com>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Fill in VMCB accessors for spec_ctrl in svm_{get,set}_reg(), and CPUID checks
for all supported bits in guest_{rd,wr}msr().

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/svm/svm.c | 9 +++++++++
 xen/arch/x86/msr.c         | 8 +++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 8fdb530b4004..bc834556c5f7 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2471,10 +2471,14 @@ static bool svm_get_pending_event(struct vcpu *v, struct x86_event *info)
 
 static uint64_t svm_get_reg(struct vcpu *v, unsigned int reg)
 {
+    const struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     struct domain *d = v->domain;
 
     switch ( reg )
     {
+    case MSR_SPEC_CTRL:
+        return vmcb->spec_ctrl;
+
     default:
         printk(XENLOG_G_ERR "%s(%pv, 0x%08x) Bad register\n",
                __func__, v, reg);
@@ -2485,10 +2489,15 @@ static uint64_t svm_get_reg(struct vcpu *v, unsigned int reg)
 
 static void svm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
 {
+    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     struct domain *d = v->domain;
 
     switch ( reg )
     {
+    case MSR_SPEC_CTRL:
+        vmcb->spec_ctrl = val;
+        break;
+
     default:
         printk(XENLOG_G_ERR "%s(%pv, 0x%08x, 0x%016"PRIx64") Bad register\n",
                __func__, v, reg, val);
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 5e80c8b47c21..4ac5b5a048eb 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -265,7 +265,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         break;
 
     case MSR_SPEC_CTRL:
-        if ( !cp->feat.ibrsb )
+        if ( !cp->feat.ibrsb && !cp->extd.ibrs )
             goto gp_fault;
         goto get_reg;
 
@@ -442,7 +442,8 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
  */
 uint64_t msr_spec_ctrl_valid_bits(const struct cpuid_policy *cp)
 {
-    bool ssbd = cp->feat.ssbd;
+    bool ssbd = cp->feat.ssbd || cp->extd.amd_ssbd;
+    bool psfd = cp->extd.psfd;
 
     /*
      * Note: SPEC_CTRL_STIBP is specified as safe to use (i.e. ignored)
@@ -450,6 +451,7 @@ uint64_t msr_spec_ctrl_valid_bits(const struct cpuid_policy *cp)
      */
     return (SPEC_CTRL_IBRS | SPEC_CTRL_STIBP |
             (ssbd       ? SPEC_CTRL_SSBD       : 0) |
+            (psfd       ? SPEC_CTRL_PSFD       : 0) |
             0);
 }
 
@@ -526,7 +528,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
         break;
 
     case MSR_SPEC_CTRL:
-        if ( !cp->feat.ibrsb ||
+        if ( (!cp->feat.ibrsb && !cp->extd.ibrs) ||
              (val & ~msr_spec_ctrl_valid_bits(cp)) )
             goto gp_fault;
         goto set_reg;
-- 
2.11.0


