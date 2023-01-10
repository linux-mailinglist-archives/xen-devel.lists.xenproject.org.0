Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FCA664745
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 18:19:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474881.736352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFIH9-0005AP-1I; Tue, 10 Jan 2023 17:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474881.736352; Tue, 10 Jan 2023 17:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFIH8-00057K-PI; Tue, 10 Jan 2023 17:19:02 +0000
Received: by outflank-mailman (input) for mailman id 474881;
 Tue, 10 Jan 2023 17:19:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dQxz=5H=citrix.com=prvs=367c7493a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pFIH6-0003S0-Qe
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 17:19:00 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd6eb98c-910a-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 18:18:57 +0100 (CET)
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
X-Inumbo-ID: dd6eb98c-910a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673371137;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JEFM5DgSMIlHdoI6Ogj3/3vP8p3vve1BuSmFbdoNBC0=;
  b=CkJfXtGAuvEjg0fSpmAQpDOtb+a/xGUkfpEjtXNssU8v2WwoUpN+LrCE
   BNOR5fBNcTNCMEstQpPOj5d3C70hhJSospZ6FMmPZN1MGoOCOjdcAwMs0
   VZh3zUeU+0rARogkOGXgh5OrojteeuIrFnL764w/j/A4VGfx9gRiSjdmy
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 90908190
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DbCNyqvq0Vx5DDVZ2p/52hYuvufnVEVeMUV32f8akzHdYApBsoF/q
 tZmKTuAP66DZWHwLt5yYYq+p0gAvZXSy4VnQQQ4+Ho2Ri4T+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoQ5AaHzyFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwIhc1PiGhqLiNz42GEsNDmPsYMZbGFdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfAdMYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27J/
 jOerz2oWnn2MvSE1ziV0WuHhdbzoiH3V78oL7aa5NBD1Qj7Kms7V0RNCArTTeOColG6c8JSL
 QoT4CVGhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xJEIJUzpAY9wOr9ItSHoh0
 Vrhoj/yLWUx6vvPEyvbr+rK62PpUcQIEYMcTSUjdVs0wfa5m44Ms0rlYchcK7Pqo/SgTFkc3
 Au2hCQ5grwSi+sC2KO64U3LjlqQm3TZcuImzl6JBzz4t2uVcKbgPtX1sgaDsZ6sOa7DFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPn6gKu1mSx28zaK7onAMFh
 2eN0T69HLcJYBOXgVZfOupd8fgCw6n6DsjCXfvJdNdIaZUZXFbZo3o0NR/IgD2wyRJEfUQD1
 XGzK57E4ZEyUPoP8dZLb71Fje9DKt4WmQs/uqwXPzz4iOHDNRZ5uJ8OMUeUb/BR0U93iFy9z
 jqrDOPTk083eLSnMkHqHXs7cQhiwY4TWcqn9KS6t4erfmJbJY3WI6SNneJwKtE4wf89eyWh1
 ijVZ3K0AWHX3RXvQThmoFg9AF8zdf6TdU4GABE=
IronPort-HdrOrdr: A9a23:oRLJXKi0dBOuc7/fiMW0v9kprnBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-IronPort-AV: E=Sophos;i="5.96,315,1665460800"; 
   d="scan'208";a="90908190"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 7/8] x86/pagewalk: Support PKS
Date: Tue, 10 Jan 2023 17:18:44 +0000
Message-ID: <20230110171845.20542-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230110171845.20542-1-andrew.cooper3@citrix.com>
References: <20230110171845.20542-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

PKS is very similar to the existing PKU behaviour, operating on pagewalks for
any supervisor mapping.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/guest_pt.h | 5 +++++
 xen/arch/x86/include/asm/hvm/hvm.h  | 3 +++
 xen/arch/x86/mm/guest_walk.c        | 9 +++++----
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/guest_pt.h b/xen/arch/x86/include/asm/guest_pt.h
index 6647ccfb8520..6802db2a415a 100644
--- a/xen/arch/x86/include/asm/guest_pt.h
+++ b/xen/arch/x86/include/asm/guest_pt.h
@@ -282,6 +282,11 @@ static always_inline bool guest_pku_enabled(const struct vcpu *v)
     return !is_pv_vcpu(v) && hvm_pku_enabled(v);
 }
 
+static always_inline bool guest_pks_enabled(const struct vcpu *v)
+{
+    return !is_pv_vcpu(v) && hvm_pks_enabled(v);
+}
+
 /* Helpers for identifying whether guest entries have reserved bits set. */
 
 /* Bits reserved because of maxphysaddr, and (lack of) EFER.NX */
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 93254651f2f5..65768c797ea7 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -407,6 +407,8 @@ int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value);
     ((v)->arch.hvm.guest_efer & EFER_NXE)
 #define hvm_pku_enabled(v) \
     (hvm_paging_enabled(v) && ((v)->arch.hvm.guest_cr[4] & X86_CR4_PKE))
+#define hvm_pks_enabled(v) \
+    (hvm_paging_enabled(v) && ((v)->arch.hvm.guest_cr[4] & X86_CR4_PKS))
 
 /* Can we use superpages in the HAP p2m table? */
 #define hap_has_1gb (!!(hvm_funcs.hap_capabilities & HVM_HAP_SUPERPAGE_1GB))
@@ -911,6 +913,7 @@ static inline void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
 #define hvm_smap_enabled(v) ((void)(v), false)
 #define hvm_nx_enabled(v) ((void)(v), false)
 #define hvm_pku_enabled(v) ((void)(v), false)
+#define hvm_pks_enabled(v) ((void)(v), false)
 
 #define arch_vcpu_block(v) ((void)(v))
 
diff --git a/xen/arch/x86/mm/guest_walk.c b/xen/arch/x86/mm/guest_walk.c
index 161a61b8f5ca..76b4e0425887 100644
--- a/xen/arch/x86/mm/guest_walk.c
+++ b/xen/arch/x86/mm/guest_walk.c
@@ -406,16 +406,17 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
 #if GUEST_PAGING_LEVELS >= 4 /* 64-bit only... */
     /*
      * If all access checks are thus far ok, check Protection Key for 64bit
-     * data accesses to user mappings.
+     * data accesses.
      *
      * N.B. In the case that the walk ended with a superpage, the fabricated
      * gw->l1e contains the appropriate leaf pkey.
      */
-    if ( (ar & _PAGE_USER) && !(walk & PFEC_insn_fetch) &&
-         guest_pku_enabled(v) )
+    if ( !(walk & PFEC_insn_fetch) &&
+         ((ar & _PAGE_USER) ? guest_pku_enabled(v)
+                            : guest_pks_enabled(v)) )
     {
         unsigned int pkey = guest_l1e_get_pkey(gw->l1e);
-        unsigned int pkr = rdpkru();
+        unsigned int pkr = (ar & _PAGE_USER) ? rdpkru() : rdpkrs();
         unsigned int pk_ar = (pkr >> (pkey * PKEY_WIDTH)) & (PKEY_AD | PKEY_WD);
 
         if ( (pk_ar & PKEY_AD) ||
-- 
2.11.0


