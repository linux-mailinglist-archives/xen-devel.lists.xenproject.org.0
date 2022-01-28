Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B42249FAAE
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 14:30:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261997.453977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDRK7-0003fo-K9; Fri, 28 Jan 2022 13:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261997.453977; Fri, 28 Jan 2022 13:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDRK7-0003dl-FE; Fri, 28 Jan 2022 13:29:55 +0000
Received: by outflank-mailman (input) for mailman id 261997;
 Fri, 28 Jan 2022 13:29:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Vxm=SM=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nDRK5-0003aQ-Aw
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 13:29:53 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e237702-803e-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 14:29:51 +0100 (CET)
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
X-Inumbo-ID: 5e237702-803e-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643376591;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jvgLjL7MB3hMPmdvyPDZopgLkGOarBr/NDTac4D+Vws=;
  b=S2a9CPN7YCHDq/cdSrNfnISxpMV9c3O23U9XanyXEt5QN0RpMYawbEL6
   T3Ou6f9gFW4Y9YBxBtaherj1KnUpY0TKq6b75WQMHZf80r01So++QkqGi
   FtVwGE5t61SjU8zsFaF1LnnwFEtupDu2GrBudasTEIW0/qHTP2wdQamOG
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: zZKYe867PDRHXbBEASc76BVoz+oD81DNfiBdC0vrFS7/UUfvIced70R+ocLjFm6q4F9YYMsaEj
 4OuwfDArb41IilUFQWp22xIZKywMIuCsCK0Crm05sIpKHCbvddui2GVuKPr7E+qviCqsn9zfIh
 MZChXMhiuXO4lhRraS8puz4NAtjly7fopkzJqnHHBxoZRLSUbbVuOpnuE9w/C/pZm/HPPenfI0
 G7qLuV7PZeHVz82Q7DoZlY0xGh6xsBVE/ITxveDHrjNisLPRdJ442la1p9ikG7FsS6otTvSyp+
 B8isG/qL4CY5sAwKO7sXyCBm
X-SBRS: 5.2
X-MesageID: 62900203
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3c2Tda3Lt0tDiDZeDfbD5Qd2kn2cJEfYwER7XKvMYLTBsI5bpzxSz
 WsdXjuFaKyKY2ujKo9zbIu+/UgPv5HdztY3HgQ/pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o6wb5h3uaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhw4xNz
 fRV8q6MbQYwOLWLtNxBUTsEOnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9u3JEWRayGP
 KL1bxJtVAaZaR8fGmwbJ7g9hfqC1iLFVSVH/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 kDs8nn9AxoaHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKalkJAZ99xC6oI1CWM06zMpCqhWmomEhcUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/4+SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFROdbNi2+AswGzARN8wGCxFATpU
 J8swJD20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4Mu2slfBw3b55ZKFcFh
 XM/XysLuve/21PxNcdKj3+ZUZx2ncAM6/y7PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1gmQv7GM6qpzz6gev2TCPEEt8tbQrRBt3VGYvZ+m05B
 f4FaZvTo/ieOcWjChTqHXk7dABTciNjVMmo8qS6tIere2JbJY3oMNeJqZtJRmCvt/49ej7g8
 i7vV0lG5kD4gHGbewyGZmo6MOHkXIplrGJ9NispZA76138maIepzaEea5poIuV3qL09laZ5H
 6sfZsGNIvVTUTCbqT4TWobw8d55fxOxiAPQYyf8OGojf4RtThDi88P/ele97zEHCye67JNso
 7Cp2g7Bb4AEQgBuUJTfZP61lgvjtnkBguNiGUDPJ4ALKknr9YFrLQ33j+M2fJ5QeUmSmGPC2
 l/PUxkCpOTLr4sky/XzhPiJ/9WzDu9zPktGBG2Hv7y4AjbXozi4yohaXefWIT2EDDHo+L+vb
 Pl+xu3nNKFVh05DtodxHuo5za864Nez9bZWwh49QSfOZlWvTLhhPmOHzY9EsagUnu1Vvg6/W
 0Su/NhGOOrWZJO5QQBJfAd1PP6e0fw0myXJ6aVnKUr30yZ74b6bXBgAJBKLkiFccON4PY5NL
 T3NYyLKB9hTUiYXD+s=
IronPort-HdrOrdr: A9a23:cOqUyKm0Lne2yvdOkW3dj4M9TPbpDfIW3DAbv31ZSRFFG/Fxl6
 iV/cjzsiWE8Ar5OUtQ4OxoV5PwIk80maQb3WBVB8bHYOCEghrPEGgB1/qB/9SIIUSXnYQxuZ
 uIMZIOb+EYZWIK9voSizPZLz9P+re6GdiT9ILj80s=
X-IronPort-AV: E=Sophos;i="5.88,324,1635220800"; 
   d="scan'208";a="62900203"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 8/9] x86/msr: AMD MSR_SPEC_CTRL infrastructure
Date: Fri, 28 Jan 2022 13:29:26 +0000
Message-ID: <20220128132927.14997-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220128132927.14997-1-andrew.cooper3@citrix.com>
References: <20220128132927.14997-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Fill in VMCB accessors for spec_ctrl in svm_{get,set}_reg(), and CPUID checks
for all supported bits in guest_{rd,wr}msr().

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/svm/svm.c | 9 +++++++++
 xen/arch/x86/msr.c         | 8 +++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index f753bf48c252..aa82fe29befb 100644
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


