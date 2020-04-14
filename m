Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 691BA1A7A76
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 14:15:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOKSb-00029M-Eo; Tue, 14 Apr 2020 12:14:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JNOL=56=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jOKSa-00029B-3S
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 12:14:36 +0000
X-Inumbo-ID: 80d2288a-7e49-11ea-8928-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80d2288a-7e49-11ea-8928-12813bfff9fa;
 Tue, 14 Apr 2020 12:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586866476;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kgWPLuNDZlpjxPv12VjGHkKvWtekNwVRANDpyMTHKGo=;
 b=ONcagt/ZcR0MtaoHKXlpJQF9PaExFECOS8nUuDzXTPHfRHKWRCm/O0A8
 XHUnZOZJtAxPdtNvuFSYbgqAU7kpDn/Zkuuu9WCQ+BBmhOvRadMLt5LKG
 h9NBziS34xrXK63bXhyq4G6DJmEt1zgtj8PjRISvpnZyjyBnXYaUnYT38 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JcXBX/xzh2A5GRXFwQsJvmtN95l6wgl2UkLOT6Sy55EMN4kNaRLu/hOmcqGvAE46WzB7z/A3bM
 quygnqwB3NoXUjkT0yc6R4tdCr0Jm1n5YWGtPcVWOsE3pJvJ++LIm2hjWV6fv0EimPYRmov31v
 geGB2UA0V752BJ3qaWzHjLolQjDSfJnSe6M0ukVS0wGDGEMaqCM2djVHQF/NRegUlabkTf0mhQ
 0qLbNZa8jf2PFlKV1C1H8ctSnu0m/4h7CdfHgHLMOoqNjCahCV55qs1oFok2RZGSCJX01wexn4
 OgA=
X-SBRS: 2.7
X-MesageID: 15621407
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,382,1580792400"; d="scan'208";a="15621407"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/svm: Don't use vmcb->tlb_control as if it is a boolean
Date: Tue, 14 Apr 2020 13:14:29 +0100
Message-ID: <20200414121429.10196-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

svm_asid_handle_vmrun() treats tlb_control as if it were boolean, but this has
been superseded by new additions to the SVM spec.

Introduce an enum containing all legal values, and update
svm_asid_handle_vmrun() to use appropriate constants.

While adjusting this, take the opportunity to fix up two coding style issues,
and trim the include list.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

N.B. Deliberately not updating the code to use TLB_CTRL_FLUSH_ASID.  The
safety of the current ASID logic depends on flusing everything when the ASID
wraps.
---
 xen/arch/x86/hvm/svm/asid.c        | 14 ++++++--------
 xen/include/asm-x86/hvm/svm/vmcb.h | 13 ++++++++++++-
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/asid.c b/xen/arch/x86/hvm/svm/asid.c
index e554e25213..b7a737fdc1 100644
--- a/xen/arch/x86/hvm/svm/asid.c
+++ b/xen/arch/x86/hvm/svm/asid.c
@@ -15,12 +15,9 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <xen/init.h>
-#include <xen/lib.h>
-#include <xen/perfc.h>
-#include <asm/hvm/svm/asid.h>
 #include <asm/amd.h>
 #include <asm/hvm/nestedhvm.h>
+#include <asm/hvm/svm/asid.h>
 
 void svm_asid_init(const struct cpuinfo_x86 *c)
 {
@@ -44,19 +41,20 @@ void svm_asid_handle_vmrun(void)
     struct hvm_vcpu_asid *p_asid =
         nestedhvm_vcpu_in_guestmode(curr)
         ? &vcpu_nestedhvm(curr).nv_n2asid : &curr->arch.hvm.n1asid;
-    bool_t need_flush = hvm_asid_handle_vmenter(p_asid);
+    bool need_flush = hvm_asid_handle_vmenter(p_asid);
 
     /* ASID 0 indicates that ASIDs are disabled. */
     if ( p_asid->asid == 0 )
     {
         vmcb_set_guest_asid(vmcb, 1);
-        vmcb->tlb_control = 1;
+        vmcb->tlb_control = TLB_CTRL_FLUSH_ALL;
         return;
     }
 
-    if (vmcb_get_guest_asid(vmcb) != p_asid->asid)
+    if ( vmcb_get_guest_asid(vmcb) != p_asid->asid )
         vmcb_set_guest_asid(vmcb, p_asid->asid);
-    vmcb->tlb_control = need_flush;
+
+    vmcb->tlb_control = need_flush ? TLB_CTRL_FLUSH_ALL : TLB_CTRL_NO_FLUSH;
 }
 
 /*
diff --git a/xen/include/asm-x86/hvm/svm/vmcb.h b/xen/include/asm-x86/hvm/svm/vmcb.h
index e5ed38369e..c2e1972feb 100644
--- a/xen/include/asm-x86/hvm/svm/vmcb.h
+++ b/xen/include/asm-x86/hvm/svm/vmcb.h
@@ -302,6 +302,17 @@ enum VMEXIT_EXITCODE
     VMEXIT_INVALID          =  -1
 };
 
+enum
+{
+    /* Available on all SVM-capable hardware. */
+    TLB_CTRL_NO_FLUSH             = 0,
+    TLB_CTRL_FLUSH_ALL            = 1,
+
+    /* Available with the FlushByASID feature. */
+    TLB_CTRL_FLUSH_ASID           = 3,
+    TLB_CTRL_FLUSH_ASID_NONGLOBAL = 7,
+};
+
 typedef union
 {
     struct
@@ -419,7 +430,7 @@ struct vmcb_struct {
     u64 _msrpm_base_pa;         /* offset 0x48 - cleanbit 1 */
     u64 _tsc_offset;            /* offset 0x50 - cleanbit 0 */
     u32 _guest_asid;            /* offset 0x58 - cleanbit 2 */
-    u8  tlb_control;            /* offset 0x5C */
+    u8  tlb_control;            /* offset 0x5C - TLB_CTRL_* */
     u8  res07[3];
     vintr_t _vintr;             /* offset 0x60 - cleanbit 3 */
     intstat_t int_stat;         /* offset 0x68 */
-- 
2.11.0


