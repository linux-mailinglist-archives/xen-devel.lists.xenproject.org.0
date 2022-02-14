Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3E64B510F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:06:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271699.466316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3U-0006vR-Rl; Mon, 14 Feb 2022 13:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271699.466316; Mon, 14 Feb 2022 13:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3U-0006sV-Ii; Mon, 14 Feb 2022 13:06:12 +0000
Received: by outflank-mailman (input) for mailman id 271699;
 Mon, 14 Feb 2022 13:06:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb2w-0008IH-Gb
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:05:38 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cca26c48-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:05:37 +0100 (CET)
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
X-Inumbo-ID: cca26c48-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843937;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=4s3bqHzDxRb3sy7KdmJzYNLlBSeOBXvCKtFlSSrGjpU=;
  b=CNQti08JLvQqrEccupWdbSo4PoWSm6HyuOiA0tIeLcYMW3e6yssqWxs6
   BQ/8Pzm6vFyCpmbEmaeSrxiPD2a54nJ2TUvCv1PQRdLWvjuEbdQy9GPCG
   M/VCPbyZq5fX4Xr8ePjAleJO/mJFI+t2q0IeB27st3rTZ/8eX032eFL0U
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: f2121Ej7+AAryE+M4fZWH1sR0wMYOCIhdRvvy2ee7nTBRUsqxx5mjG8EbvYG4ULwFfybOvLzbz
 beP00bjVaLt/VtFJzjTyvZxYhAyG7ll6LAv4CYHiKlMN9+b1Z/ArXOVKRZlGGYEH4A6222Bv5N
 av+ofoiIdA7KRlEpTArzl6qgbe/FppWbw232UDgJg5Plhb3Pf5OhXLeAygJc+jXn98UcMWq611
 qRWN282hkenzj0c21G4XpvgibLK9ZOr4OWjwA75o7vALoYEZwP23PvJJ7+4v5JeyZ/FVIg5NRp
 8sFJ+H3wcz2l0helDOTJup3R
X-SBRS: 5.1
X-MesageID: 63592636
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LIOa8qPhWI2Yj+vvrR27kMFynXyQoLVcMsEvi/4bfWQNrUoggzYPm
 2dMWD2DbKmJYzf8f9ogPoqwo0tXuZ6Ay9IwGgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En1500s/w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoy2swOFS4
 8Vyibmfaj0DP7zIp80bfBYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgmxt15oQRqi2i
 8wxVT8yUQr4ZUZzfUYoKooCvsCqmn/kbGgNwL6SjfVuuDWCpOBr65D9PdyQdtGUSMF9mkeDu
 nmA72n/GgsdNtGU1XyC6H3EuwPUtXqlAsRITuT+r6M0xg3IroAONPEIfUOe/siaoV6BZ/dwC
 HY++zsqkoE020P+G7ERQCaEiHKDuxcdXf9ZHOs79ByBx8Lo3uqJOoQXZmUfMYJ77afaURRvj
 wbUxI2xWVSDpZXIESr1y1uCkd+l1cH5x0cmbDRMcwYK6sKLTGob3kOWFYYL/EJYY7TI9dDML
 9Ki8XJWa1Y715djO0CHEbfv2WzEm3QxZlRpjjg7p0r8hu+DWKarZpaz9X/Q5utaIYCSQzGp5
 SZYx5fOvL1TVcjWzkRhpdnh+5nzuZ643MD02wYzT/HNCRzxk5JcQWygyG4nfxo4Wir1UTTof
 FXSqWtsCGx7ZxOXgVtMS9vpUawClPG4ffy8D6y8RoceM/BZKV7clAkzNBH44owYuBV1+U3JE
 czAKpjE4LdzIfkP8QdasM9Dje51lnhmnzu7qFKS503P7IdyrUW9Ed8tWGZipMhghE9diAmKo
 dtZKeWQzBBTDL/3biXNqNZBJlEWN3krQ5vxrpUPJOKEJwNnHkAnCuPQnux9K9A0wfwNm7ea5
 Gy5V29Z1EH72S/NJzKVZy0xc7joR5t+8y42ZHR+IVay1nE/So+z96NDJYAvdLwq+bU7n/55R
 vUIYeuaBfFLRmiV8jgRd8Cl/odjaA6qlUSFOC/8OGozeJtpRgro/N74f1SwqHlSX3Tv7cZn+
 u+uzALWR5YHVj9ONseOZaL91U61sFgchPl2AxnCLO5MdRi+64NtMSHw0KM6epleNRXZyzKG/
 A+KGhNE9/LVqoo4/dSV16CJq4ClT7l3EkZARjSJ6L+3MW/R/3a5wJ8GW+GNJGiPWGTx8aSkR
 ONU0/Cjb6FXwAcU69JxQ+Rx0KYzx9rzvLsLnA1rEULCY0mvFr49cGKN2tNCt/EVy7JU0edst
 pljJjWO1W21Bf7Y
IronPort-HdrOrdr: A9a23:a2X9Z6MLL114acBcTsOjsMiBIKoaSvp037Eqv3oedfU1SL3gqy
 nAppQmPHPP5Ar5HUtQ/OxoW5PwJ080l6QFgrX5VI3KNGKN1VdAbrsSibcKqweQfBEWndQ96U
 4PScdD4aXLfDpHsfo=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="63592636"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 53/70] x86/psr: CFI hardening
Date: Mon, 14 Feb 2022 12:51:10 +0000
Message-ID: <20220214125127.17985-54-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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


