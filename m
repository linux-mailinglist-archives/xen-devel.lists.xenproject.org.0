Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CF21AE17A
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 17:50:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPTFy-0007WE-Gh; Fri, 17 Apr 2020 15:50:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z9Py=6B=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jPTFw-0007W9-W9
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 15:50:17 +0000
X-Inumbo-ID: 1e35ab82-80c3-11ea-8d2d-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e35ab82-80c3-11ea-8d2d-12813bfff9fa;
 Fri, 17 Apr 2020 15:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587138611;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n+kJcIVbiUyfNa/vyQETwoQaqxnGj4WaK08bU0mpih8=;
 b=hRtN2I0OIE8y+Zi/dpQjUqLCsSAU9I3WoxwYgvRFatSvSMPtdD+0K+Bg
 N2cuCa65YRccGg5LHrXop7ylPBa9p06jsYP3IYeEM6WA85qFJNI1JlhYS
 0obBJgsPf2iGiIosKz/FH2LH/y49jZcbm/4MePNTk2nmJf0ymNcjK0fnm I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8Vcdiq6a3gEzu1kd9D3SXRhu8odtLdwfaNLMVV4pcfP+CBcV0GsgdPkLh86Q4M6llxFbBZSO8i
 lBGg6e9Rc2fwNZLdoFh7bY9V2GnlMyuixjajzPIZ5rHqb/Upld0OdrEezDv+HMUatSCfCnj3Hf
 iMDN6RY/uWDJ7ezfGmRAXh9BPOAMqmoM79JyJSkAeGJJSk3epCxXb7G2a1Pwv5/pTNf+8Bkwez
 Dku+pWBL//AfyNwjr7IN86o6UbvTK1+8Te73vE2rAcj1cUQ8mlMYuQTziAIcKTei9o2Z8HCWpP
 dPI=
X-SBRS: 2.7
X-MesageID: 16253793
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,395,1580792400"; d="scan'208";a="16253793"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 1/3] x86/pv: Options to disable and/or compile out 32bit PV
 support
Date: Fri, 17 Apr 2020 16:50:02 +0100
Message-ID: <20200417155004.16806-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200417155004.16806-1-andrew.cooper3@citrix.com>
References: <20200417155004.16806-1-andrew.cooper3@citrix.com>
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

This is the start of some performance and security-hardening improvements,
based on the fact that 32bit PV guests are few and far between these days.

Ring1 is full or architectural corner cases, such as counting as supervisor
from a paging point of view.  This accounts for a substantial performance hit
on processors from the last 8 years (adjusting SMEP/SMAP on every privilege
transition), and the gap is only going to get bigger with new hardware
features.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

There is a series I can't quite post yet which wants to conditionally turn
opt_pv32 off, which is why I've put it straight in in an int8_t form rather
than a straight boolean form.
---
 docs/misc/xen-command-line.pandoc | 12 +++++++++++-
 xen/arch/x86/Kconfig              | 16 ++++++++++++++++
 xen/arch/x86/pv/domain.c          | 35 +++++++++++++++++++++++++++++++++++
 xen/arch/x86/setup.c              |  9 +++++++--
 xen/include/asm-x86/pv/domain.h   |  6 ++++++
 5 files changed, 75 insertions(+), 3 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index acd0b3d994..ee12b0f53f 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1694,7 +1694,17 @@ The following resources are available:
     CDP, one COS will corespond two CBMs other than one with CAT, due to the
     sum of CBMs is fixed, that means actual `cos_max` in use will automatically
     reduce to half when CDP is enabled.
-	
+
+### pv
+    = List of [ 32=<bool> ]
+
+    Applicability: x86
+
+Controls for aspects of PV guest support.
+
+*   The `32` boolean controls whether 32bit PV guests can be created.  It
+    defaults to `true`, and is ignored when `CONFIG_PV32` is compiled out.
+
 ### pv-linear-pt (x86)
 > `= <boolean>`
 
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 8149362bde..4c52197de3 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -49,6 +49,22 @@ config PV
 
 	  If unsure, say Y.
 
+config PV32
+	bool "Support for 32bit PV guests"
+	depends on PV
+	default y
+	---help---
+	  The 32bit PV ABI uses Ring1, an area of the x86 architecture which
+	  was deprecated and mostly removed in the AMD64 spec.  As a result,
+	  it occasionally conflicts with newer x86 hardware features, causing
+	  overheads for Xen to maintain backwards compatibility.
+
+	  People may wish to disable 32bit PV guests for attack surface
+	  reduction, or performance reasons.  Backwards compatibility can be
+	  provided via the PV Shim mechanism.
+
+	  If unsure, say Y.
+
 config PV_LINEAR_PT
        bool "Support for PV linear pagetables"
        depends on PV
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 70fae43965..47a0db082f 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -16,6 +16,39 @@
 #include <asm/pv/domain.h>
 #include <asm/shadow.h>
 
+#ifdef CONFIG_PV32
+int8_t __read_mostly opt_pv32 = -1;
+#endif
+
+static int parse_pv(const char *s)
+{
+    const char *ss;
+    int val, rc = 0;
+
+    do {
+        ss = strchr(s, ',');
+        if ( !ss )
+            ss = strchr(s, '\0');
+
+        if ( (val = parse_boolean("32", s, ss)) >= 0 )
+        {
+#ifdef CONFIG_PV32
+            opt_pv32 = val;
+#else
+            printk(XENLOG_INFO
+                   "CONFIG_PV32 disabled - ignoring 'pv=32' setting\n");
+#endif
+        }
+        else
+            rc = -EINVAL;
+
+        s = ss + 1;
+    } while ( *ss );
+
+    return rc;
+}
+custom_param("pv", parse_pv);
+
 static __read_mostly enum {
     PCID_OFF,
     PCID_ALL,
@@ -174,6 +207,8 @@ int switch_compat(struct domain *d)
 
     BUILD_BUG_ON(offsetof(struct shared_info, vcpu_info) != 0);
 
+    if ( !opt_pv32 )
+        return -EOPNOTSUPP;
     if ( is_hvm_domain(d) || domain_tot_pages(d) != 0 )
         return -EACCES;
     if ( is_pv_32bit_domain(d) )
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 885919d5c3..c50aefb2de 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -53,6 +53,7 @@
 #include <asm/spec_ctrl.h>
 #include <asm/guest.h>
 #include <asm/microcode.h>
+#include <asm/pv/domain.h>
 
 /* opt_nosmp: If true, secondary processors are ignored. */
 static bool __initdata opt_nosmp;
@@ -1875,8 +1876,12 @@ void arch_get_xen_caps(xen_capabilities_info_t *info)
     {
         snprintf(s, sizeof(s), "xen-%d.%d-x86_64 ", major, minor);
         safe_strcat(*info, s);
-        snprintf(s, sizeof(s), "xen-%d.%d-x86_32p ", major, minor);
-        safe_strcat(*info, s);
+
+        if ( opt_pv32 )
+        {
+            snprintf(s, sizeof(s), "xen-%d.%d-x86_32p ", major, minor);
+            safe_strcat(*info, s);
+        }
     }
     if ( hvm_enabled )
     {
diff --git a/xen/include/asm-x86/pv/domain.h b/xen/include/asm-x86/pv/domain.h
index 7a69bfb303..df9716ff26 100644
--- a/xen/include/asm-x86/pv/domain.h
+++ b/xen/include/asm-x86/pv/domain.h
@@ -23,6 +23,12 @@
 
 #include <xen/sched.h>
 
+#ifdef CONFIG_PV32
+extern int8_t opt_pv32;
+#else
+# define opt_pv32 false
+#endif
+
 /*
  * PCID values for the address spaces of 64-bit pv domains:
  *
-- 
2.11.0


