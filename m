Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF5C476E5A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 10:54:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247799.427357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxnTP-0006Nv-37; Thu, 16 Dec 2021 09:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247799.427357; Thu, 16 Dec 2021 09:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxnTO-0006Cb-Hr; Thu, 16 Dec 2021 09:54:50 +0000
Received: by outflank-mailman (input) for mailman id 247799;
 Thu, 16 Dec 2021 09:54:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VCpR=RB=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mxnTK-0004jJ-PG
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 09:54:46 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 324ce813-5e56-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 10:54:44 +0100 (CET)
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
X-Inumbo-ID: 324ce813-5e56-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639648484;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xtRI3BLk7ZWqiz6X+MMatMX66rJ6BEiGCj6erUpx/jo=;
  b=Z9XJ/wjxf5YLR9MvDJ/GwAsKeFocdRWCCeueVBuigLNHsNL9zZQhT67j
   KctgfL/9WXsFHF8L9GE7+KUVw0wQOeqZb1QnYgOaO+A9JK2icJ5QMPOqe
   tPWl6qOKUcr8yU9UFdWFjsQDuiUJbQ2UGIm+vArwyqHewC7WJ7g/K29Ky
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 488ouJ4q8rmljPTJrBrg+TTe2yYP5NDrzKwZf1W36Q3wNYaakrD6Oew+sxZQTeP2WQsLjR5Yz9
 jEnQOaCzVj/ZS2Lp79cqscwyNwnQmdxIhhFvit4+PsO0DTPiiVuRr6vAAqyK3tx0K73AzDOeVx
 QXg6IY5Jk5PHIa2zDNaXqPpOxj4LtetyBZfATxXtJ5mmsagevylpsYam1sRltcYlDtGAGqAQMW
 D0GH9PsHmIQ1ceRbx2ei0wjhrAEUh2iVT9oYapNsyRNs9TxaALQNaVvZdUy7CmxV2Pv/xrcsjg
 s5WGHp4lbl3nT4M59HyV9m58
X-SBRS: 5.1
X-MesageID: 60560088
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JZgV7anz8PgCRWCkYKjQBv/o5gxMIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdXTvQb/jfM2GnLtggbtvg8R5SuJ+AyoIxQVBr+y5jFSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbdg2Nc22YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NZzi5rzd1l2BaGPo8k8YgdILQUnZ5QTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ66DO
 ZJBOWoHgBLoZxx1FBRPV7QCo9iFpUXcfRNR9EiMnP9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zbKBwHMN2UyRKe72mhwOTImEvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJTLdM8qz/TlZHYoD20J1kaXgBlMYYf4ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud14WtQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT0uTA3Dt4ade51q2VtW
 lBewaByC8hUUvmweNSlGrllIV1Qz6/t3MfgqVBuBYI90D+m5mSue4tdiBknehw4b5dfJm+0O
 heI0e+02HO1FCHwBUOQS9juY/nGMIC6TYi1PhwqRoQmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu73ZUv2/Z9PlWLsL89EiOdD7nlnmQv7GMCqpzz6gOH2TCPEFt843K6mM7lRAFWs+16Or
 b6y9qKiln1ibQEJSnWNrNNIcwlVdSNT6FKfg5U/S9Nv6zFOQAkJY8I9C5t7E2C8t6gKxOrO4
 F+nXUpUlAj2iXHdcF3YYXF/crL/G514qCtjbyArOF+p3VklYJqus/hDJ8dmI+F/+bwx1+NwQ
 tkEZ96EXqZFRAPY9mlPdpL6toFjKkim3FrcIyq/bTEjVJd8XAiVqMT8dw7i+XBWXCq6vMczu
 ZO60QbfTcZRTghuFp+OOvmu00mwrT4Wn+crBxnEJdxaeUPN9ol2KnOu0q9rcp9UcRian2mUz
 QebBxsctNLhmY5t/Ymbn72AoqeoD/B6QhhQEV7E4OvkLiLd5Gein9NNCb7aYTDHWWro06y+f
 uEJnerkOfgKkVsW4YpxF7FnkfA369f1/uIIyw1lGDPAbkixC6MmKX6DhJEduqpIz75fmA23R
 kPQpYUKZeTXYJvoQAwLOQ4oTuWfzvVFyDDd4MM8LFj++CIqrqGMVl9fPkXUhSFQRFev3FjJH
 Qv1VBYq1jGC
IronPort-HdrOrdr: A9a23:4C42k637vEXiIF7oVo7hDQqjBIIkLtp133Aq2lEZdPUMSL39qy
 ncpoV96faUskdrZJhOo6HjBEDtexzhHP1OkPMs1NWZLWzbUQKTRekIh+aP/9SKIUzDH5tmpM
 Rdmt9FaOEYY2IVsS+w2njfLz9p+qj/zEiC7d2ut0tQcQ==
X-IronPort-AV: E=Sophos;i="5.88,211,1635220800"; 
   d="scan'208";a="60560088"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 5/6] x86/pagewalk: Support PKS
Date: Thu, 16 Dec 2021 09:54:20 +0000
Message-ID: <20211216095421.12871-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211216095421.12871-1-andrew.cooper3@citrix.com>
References: <20211216095421.12871-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

PKS is incredibly similar to the existing PKU behaviour, operating on
pagewalks for any supervisor mapping.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
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
index bd2cbb0e7baf..ffef7ed075a7 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -394,6 +394,8 @@ int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value);
     ((v)->arch.hvm.guest_efer & EFER_NXE)
 #define hvm_pku_enabled(v) \
     (hvm_paging_enabled(v) && ((v)->arch.hvm.guest_cr[4] & X86_CR4_PKE))
+#define hvm_pks_enabled(v) \
+    (hvm_paging_enabled(v) && ((v)->arch.hvm.guest_cr[4] & X86_CR4_PKS))
 
 /* Can we use superpages in the HAP p2m table? */
 #define hap_has_1gb (!!(hvm_funcs.hap_capabilities & HVM_HAP_SUPERPAGE_1GB))
@@ -868,6 +870,7 @@ static inline int hvm_vmtrace_get_option(
 #define hvm_smap_enabled(v) ((void)(v), false)
 #define hvm_nx_enabled(v) ((void)(v), false)
 #define hvm_pku_enabled(v) ((void)(v), false)
+#define hvm_pks_enabled(v) ((void)(v), false)
 
 #define arch_vcpu_block(v) ((void)(v))
 
diff --git a/xen/arch/x86/mm/guest_walk.c b/xen/arch/x86/mm/guest_walk.c
index dc8fdde0212e..8670d4990a11 100644
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
         unsigned int pk_ar = pkr >> (pkey * PKEY_WIDTH);
 
         if ( (pk_ar & PKEY_AD) ||
-- 
2.11.0


