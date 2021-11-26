Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1687145EEC5
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:08:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232888.404134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxb-0003tT-Ce; Fri, 26 Nov 2021 13:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232888.404134; Fri, 26 Nov 2021 13:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxa-0003Y5-Kp; Fri, 26 Nov 2021 13:08:14 +0000
Received: by outflank-mailman (input) for mailman id 232888;
 Fri, 26 Nov 2021 13:08:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqav0-0002zD-7P
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:34 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 891388cb-4eb9-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 14:05:33 +0100 (CET)
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
X-Inumbo-ID: 891388cb-4eb9-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931933;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2MzOrJ78BogsSqIrTSJWk1tHUhlV8OhibZYGX9BCTw0=;
  b=Zut86zSFbISjSTEUM49c3TAerWLnbQ6vqUtqAMnPpO/JLYBhr79JjbbO
   4SUtVuRRmnHYg4EPWtie7Si80BGqbL1zm8rBW/KNXEDqTQV4Gd2Z0PXxn
   gJxeGYhyIw2zDeQ/tbujWt/J+50vIVHdZDQXQQQduXq8kzddApsr1dsTO
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2D0+zxpoXeTsNce9F3bY+AfJtSywlElzy1dSTtNoDLadx2dNuFopbHsfi0Vxp6unCB/RfMTC7U
 ek4qKV4Su8ZeBkRXPQ9WNE3Cvasyc8hmbruIV8bxO0V7Qro9SrOverOj+gdOGTXFt+DZ/Z4Iv6
 QQdhZ+iB1MAg5rPJIdiw+LkogCRPDEUn1YCBvV4wqDhIANZUIfDrdNncclDFx7qpp2AgepJfSJ
 xgAR54rPwjKTBrx/LMJsPt8SdPqK+0jjE76afd7d3r1GzlBIjZHV7SugcKxntCCRbjzyb/l61t
 HYTHHgfEp1zPw51+rsRFR4mn
X-SBRS: 5.1
X-MesageID: 58696001
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3QtIjqxKyXKoaLxQpH56t+f6wSrEfRIJ4+MujC+fZmUNrF6WrkUAz
 mVMWW2GOa2KMGOkLY10bo208BxV68PSztQ2TFNr/yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrRn2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt8hzk
 5IUhL62cydzY/Xgqc0jXRYJTD4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY25AQTKiGP
 5NxhTxHVEudOhJtCggsVNFkuveGi3nTeQV6gQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krk1WnkBhARNPSE1CGItHmrg4fnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDYEWYEXStwY7jutkPeMzzewOGYLH2FePYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLSfbt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb5OORECnCBtJ6sybp1qHHa5
 xDofODEsYgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvmohdBk0bZdYJ2OyC
 KM2he+3zMQIVJdNRfUqC79d9uxwlfSwfTgbfqy8giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLGkP3SMr9dMdQtiwLpSLcmelvG7v9WremJOcFzNwdeIqV/4U4A6zalTiMnS+
 XSxBh1RxFbl3CWVIgSWcHFzLrjoWM8n/348OCUtO3eu2mQiPtnzvPtOKcNvcOl17vFnwN51U
 +IBJ5eKDMNQR2mV4D8ad5T88tBvLUz5mQKUMiO5SzEjZJo8FRfR89rpc1K3pikDBya6r+Ukp
 Lik2l+JSJYPXV06Xs3XdOiu3xW6un1EwLB+WE7BI99yfkTw8dc1d3yt36Fve8xVcEfN3DqX0
 QqSECw0n+iVrt9n6sTNiICFs5ytT7l0EH1FEjSJ9r2xLyTboDaumNcSTOaScDnBf2ro46H+N
 /5NxvTxPfBbzlZHt41wT+Riwa4kvoa9orZbykJvHWnRbkTtAbRleyHU0c5Kv6xL57lYpQrpB
 R7fpogEYe2EaJH/DVocBAs5deDSh/gblw7b4ekxPEintjR8+6CKUBkKMhSB4MCHwGCZ7G/xL
 T8dhfMr
IronPort-HdrOrdr: A9a23:8+LOtqlB0wn00/6dVmmWJt3E8yTpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE8Qr5OUtQ/+xoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCBHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58696001"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 49/65] x86/psr: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:30 +0000
Message-ID: <20211126123446.32324-50-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/psr.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/psr.c b/xen/arch/x86/psr.c
index 6c9cabf3843d..ccb761998f9a 100644
--- a/xen/arch/x86/psr.c
+++ b/xen/arch/x86/psr.c
@@ -282,7 +282,7 @@ static enum psr_feat_type psr_type_to_feat_type(enum psr_type type)
 }
 
 /* Implementation of allocation features' functions. */
-static bool cat_check_cbm(const struct feat_node *feat, uint32_t *val)
+static bool cf_check cat_check_cbm(const struct feat_node *feat, uint32_t *val)
 {
     unsigned int first_bit, zero_bit;
     unsigned int cbm_len = feat->cat.cbm_len;
@@ -417,8 +417,8 @@ static bool mba_init_feature(const struct cpuid_leaf *regs,
     return true;
 }
 
-static bool cat_get_feat_info(const struct feat_node *feat,
-                              uint32_t data[], unsigned int array_len)
+static bool cf_check cat_get_feat_info(
+    const struct feat_node *feat, uint32_t data[], unsigned int array_len)
 {
     if ( array_len != PSR_INFO_ARRAY_SIZE )
         return false;
@@ -431,8 +431,8 @@ static bool cat_get_feat_info(const struct feat_node *feat,
 }
 
 /* L3 CAT props */
-static void l3_cat_write_msr(unsigned int cos, uint32_t val,
-                             enum psr_type type)
+static void cf_check l3_cat_write_msr(
+    unsigned int cos, uint32_t val, enum psr_type type)
 {
     wrmsrl(MSR_IA32_PSR_L3_MASK(cos), val);
 }
@@ -447,8 +447,8 @@ static const struct feat_props l3_cat_props = {
 };
 
 /* L3 CDP props */
-static bool l3_cdp_get_feat_info(const struct feat_node *feat,
-                                 uint32_t data[], uint32_t array_len)
+static bool cf_check l3_cdp_get_feat_info(
+    const struct feat_node *feat, uint32_t data[], uint32_t array_len)
 {
     if ( !cat_get_feat_info(feat, data, array_len) )
         return false;
@@ -458,8 +458,8 @@ static bool l3_cdp_get_feat_info(const struct feat_node *feat,
     return true;
 }
 
-static void l3_cdp_write_msr(unsigned int cos, uint32_t val,
-                             enum psr_type type)
+static void cf_check l3_cdp_write_msr(
+    unsigned int cos, uint32_t val, enum psr_type type)
 {
     wrmsrl(((type == PSR_TYPE_L3_DATA) ?
             MSR_IA32_PSR_L3_MASK_DATA(cos) :
@@ -478,8 +478,8 @@ static const struct feat_props l3_cdp_props = {
 };
 
 /* L2 CAT props */
-static void l2_cat_write_msr(unsigned int cos, uint32_t val,
-                             enum psr_type type)
+static void cf_check l2_cat_write_msr(
+    unsigned int cos, uint32_t val, enum psr_type type)
 {
     wrmsrl(MSR_IA32_PSR_L2_MASK(cos), val);
 }
@@ -494,8 +494,8 @@ static const struct feat_props l2_cat_props = {
 };
 
 /* MBA props */
-static bool mba_get_feat_info(const struct feat_node *feat,
-                              uint32_t data[], unsigned int array_len)
+static bool cf_check mba_get_feat_info(
+    const struct feat_node *feat, uint32_t data[], unsigned int array_len)
 {
     ASSERT(array_len == PSR_INFO_ARRAY_SIZE);
 
@@ -508,13 +508,14 @@ static bool mba_get_feat_info(const struct feat_node *feat,
     return true;
 }
 
-static void mba_write_msr(unsigned int cos, uint32_t val,
-                          enum psr_type type)
+static void cf_check mba_write_msr(
+    unsigned int cos, uint32_t val, enum psr_type type)
 {
     wrmsrl(MSR_IA32_PSR_MBA_MASK(cos), val);
 }
 
-static bool mba_sanitize_thrtl(const struct feat_node *feat, uint32_t *thrtl)
+static bool cf_check mba_sanitize_thrtl(
+    const struct feat_node *feat, uint32_t *thrtl)
 {
     /*
      * Per SDM (chapter "Memory Bandwidth Allocation Configuration"):
-- 
2.11.0


