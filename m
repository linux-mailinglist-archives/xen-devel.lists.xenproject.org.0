Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D175550E07F
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 14:38:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312874.530270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nixyO-0008Tc-A8; Mon, 25 Apr 2022 12:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312874.530270; Mon, 25 Apr 2022 12:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nixyO-0008Rn-77; Mon, 25 Apr 2022 12:37:48 +0000
Received: by outflank-mailman (input) for mailman id 312874;
 Mon, 25 Apr 2022 12:37:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eo9G=VD=citrix.com=prvs=107e1699f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nixyM-0008Rh-M7
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 12:37:46 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80544ce1-c494-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 14:37:44 +0200 (CEST)
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
X-Inumbo-ID: 80544ce1-c494-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650890264;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XQJj0IseyZHMSZc/mrIZz/x+xkn7YoebrjeeAlWQNFo=;
  b=AOT8bLE98jYOT4GiLZL/n81GcFKzx14aHz+qAmSeFpC7Bl4HykchK0W1
   ULXdyi7/8poYreWy17RiNNuxhqcth22yUUl92Atu3qh+sUAdDsrjFhSmo
   AIH6DqgV+q3c0RaB5TeZilmfNufmQv/y77iTT1GLJBPcnm7EHu+v2Or1d
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 72295449
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:64iRqa/eNYGP75oqzEnbDrUDbX6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 WoZCGnQPamKMGTwL413YNvg8k9Uu8SBmocwQQVlpH08E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw3YLkW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCncWIa144AYvho/0YVB99C3xyHLdi8oaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 JBDOGczMEWojxtnGEoWDsMOldeTtlLadBp9lwyTi7Y1/D2GpOB2+Oe0a4eEEjCQfu1XkVyfv
 Xnu5HniD1cRM9n34Riv/2+oh+TPtTjmQ49UH7q9ntZgjUeP3GUVBFsTXEGivPiiokekXpRUL
 El80hQpqa8+5Um6VO7XVhezoGOHlhMEUt8WGOo/gCmW0bbd6QudAmkCTxZCZcYguctwQiYlv
 neZktWsCTFxvbm9TXOG6qzSvT60ITISL2IJeWkDVwRty9v+pIA+iDrfQ9AlF7S65vXqHRngz
 jbMqzIx74j/luZSif/9pwqexWvx+N6ZFWbZ+zk7QEr81iEgdbGDSrex7F/dyO4dIKeDalO46
 S1sd9el0MgCCpSElSqoSeoLHa206/vtDAAwkWKDDLF6qW3zpifLkZR4pWgneRw3appslSrBO
 he7hO9H2HNE0JJGh4dTapn5NcklxLOI+T/NBqGNNYomjnScmWa6EMBSiay4gjqFfKsEy/hX1
 XKnnSGEVytyNEif5GDqL9rxKJdyrszE+UvdRIrg0zOs2qeEaXieRN8taQXTNr9ktfve8ViPr
 b6z0vdmLT0FCYUShQGNr+Yuwa0idyBnVfgaVeQKHgJ8HuaWMD54UKKAqV/QU4dkg75Uho/1E
 oKVASdlJK7ErSSfc22iMyk7AJu2BMYXhS9rbEQEYAfzs1B+MNnH0UvqX8ZuFVXR3Lc4lqAco
 jhsU5joP8mjvRyapWRANcWt8N0KmdbCrVvmAhdJqQMXJ/ZILzElMPe4Fucz3EHi1haKiPY=
IronPort-HdrOrdr: A9a23:CFfzO6Oqtr7yKsBcTs2jsMiBIKoaSvp037Eqv3oedfUzSL3+qy
 nOpoV+6faaslYssR0b9exoW5PwJE80l6QFgrX5VI3KNGKN1VdARLsSi7cKqAeAJ8SRzIFgPN
 9bAspDNOE=
X-IronPort-AV: E=Sophos;i="5.90,288,1643691600"; 
   d="scan'208";a="72295449"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH v3] x86: Fix XEN_DOMCTL_gdbsx_guestmemio crash
Date: Mon, 25 Apr 2022 13:37:17 +0100
Message-ID: <20220425123717.18876-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

When CONFIG_GDBSX is compiled out, iommu_do_domctl() falls over a NULL
pointer.  One of several bugs here is known-but-compiled-out subops falling
into the default chain and hitting unrelated logic.

Remove the CONFIG_GDBSX ifdefary in arch_do_domctl() by implementing
gdbsx_domctl() and moving the logic across.

As minor cleanup,
 * gdbsx_guest_mem_io() can become static
 * Remove opencoding of domain_vcpu() and %pd

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Juergen Gross <jgross@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>

v2:
 * Implement the "split into new function" approach from the RFC.
v3:
 * Switch to int.
 * Insert missing break.
 * static inline for stub.
---
 xen/arch/x86/domctl.c            | 61 +---------------------------------
 xen/arch/x86/gdbsx.c             | 70 +++++++++++++++++++++++++++++++++++++++-
 xen/arch/x86/include/asm/gdbsx.h | 16 +++++++--
 3 files changed, 83 insertions(+), 64 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index c20ab4352715..9131acb8a230 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -816,71 +816,12 @@ long arch_do_domctl(
     }
 #endif
 
-#ifdef CONFIG_GDBSX
     case XEN_DOMCTL_gdbsx_guestmemio:
-        ret = gdbsx_guest_mem_io(d, &domctl->u.gdbsx_guest_memio);
-        if ( !ret )
-           copyback = true;
-        break;
-
     case XEN_DOMCTL_gdbsx_pausevcpu:
-    {
-        struct vcpu *v;
-
-        ret = -EBUSY;
-        if ( !d->controller_pause_count )
-            break;
-        ret = -EINVAL;
-        if ( domctl->u.gdbsx_pauseunp_vcpu.vcpu >= d->max_vcpus ||
-             (v = d->vcpu[domctl->u.gdbsx_pauseunp_vcpu.vcpu]) == NULL )
-            break;
-        ret = vcpu_pause_by_systemcontroller(v);
-        break;
-    }
-
     case XEN_DOMCTL_gdbsx_unpausevcpu:
-    {
-        struct vcpu *v;
-
-        ret = -EBUSY;
-        if ( !d->controller_pause_count )
-            break;
-        ret = -EINVAL;
-        if ( domctl->u.gdbsx_pauseunp_vcpu.vcpu >= d->max_vcpus ||
-             (v = d->vcpu[domctl->u.gdbsx_pauseunp_vcpu.vcpu]) == NULL )
-            break;
-        ret = vcpu_unpause_by_systemcontroller(v);
-        if ( ret == -EINVAL )
-            printk(XENLOG_G_WARNING
-                   "WARN: d%d attempting to unpause %pv which is not paused\n",
-                   currd->domain_id, v);
-        break;
-    }
-
     case XEN_DOMCTL_gdbsx_domstatus:
-    {
-        struct vcpu *v;
-
-        domctl->u.gdbsx_domstatus.vcpu_id = -1;
-        domctl->u.gdbsx_domstatus.paused = d->controller_pause_count > 0;
-        if ( domctl->u.gdbsx_domstatus.paused )
-        {
-            for_each_vcpu ( d, v )
-            {
-                if ( v->arch.gdbsx_vcpu_event )
-                {
-                    domctl->u.gdbsx_domstatus.vcpu_id = v->vcpu_id;
-                    domctl->u.gdbsx_domstatus.vcpu_ev =
-                        v->arch.gdbsx_vcpu_event;
-                    v->arch.gdbsx_vcpu_event = 0;
-                    break;
-                }
-            }
-        }
-        copyback = true;
+        ret = gdbsx_domctl(d, domctl, &copyback);
         break;
-    }
-#endif
 
     case XEN_DOMCTL_setvcpuextstate:
     case XEN_DOMCTL_getvcpuextstate:
diff --git a/xen/arch/x86/gdbsx.c b/xen/arch/x86/gdbsx.c
index 6ef46e8ea77d..21442f5dff1a 100644
--- a/xen/arch/x86/gdbsx.c
+++ b/xen/arch/x86/gdbsx.c
@@ -152,7 +152,8 @@ static unsigned int dbg_rw_guest_mem(struct domain *dp, unsigned long addr,
     return len;
 }
 
-int gdbsx_guest_mem_io(struct domain *d, struct xen_domctl_gdbsx_memio *iop)
+static int gdbsx_guest_mem_io(
+    struct domain *d, struct xen_domctl_gdbsx_memio *iop)
 {
     if ( d && !d->is_dying )
     {
@@ -178,6 +179,73 @@ void domain_pause_for_debugger(void)
         send_global_virq(VIRQ_DEBUGGER);
 }
 
+int gdbsx_domctl(struct domain *d, struct xen_domctl *domctl, bool *copyback)
+{
+    struct vcpu *v;
+    int ret;
+
+    switch ( domctl->cmd )
+    {
+    case XEN_DOMCTL_gdbsx_guestmemio:
+        ret = gdbsx_guest_mem_io(d, &domctl->u.gdbsx_guest_memio);
+        if ( !ret )
+            *copyback = true;
+        break;
+
+    case XEN_DOMCTL_gdbsx_pausevcpu:
+        ret = -EBUSY;
+        if ( !d->controller_pause_count )
+            break;
+        ret = -EINVAL;
+        if ( (v = domain_vcpu(d, domctl->u.gdbsx_pauseunp_vcpu.vcpu)) == NULL )
+            break;
+        ret = vcpu_pause_by_systemcontroller(v);
+        break;
+
+    case XEN_DOMCTL_gdbsx_unpausevcpu:
+        ret = -EBUSY;
+        if ( !d->controller_pause_count )
+            break;
+        ret = -EINVAL;
+        if ( (v = domain_vcpu(d, domctl->u.gdbsx_pauseunp_vcpu.vcpu)) == NULL )
+            break;
+        ret = vcpu_unpause_by_systemcontroller(v);
+        if ( ret == -EINVAL )
+            printk(XENLOG_G_WARNING
+                   "WARN: %pd attempting to unpause %pv which is not paused\n",
+                   current->domain, v);
+        break;
+
+    case XEN_DOMCTL_gdbsx_domstatus:
+        ret = 0;
+        domctl->u.gdbsx_domstatus.vcpu_id = -1;
+        domctl->u.gdbsx_domstatus.paused = d->controller_pause_count > 0;
+        if ( domctl->u.gdbsx_domstatus.paused )
+        {
+            for_each_vcpu ( d, v )
+            {
+                if ( v->arch.gdbsx_vcpu_event )
+                {
+                    domctl->u.gdbsx_domstatus.vcpu_id = v->vcpu_id;
+                    domctl->u.gdbsx_domstatus.vcpu_ev =
+                        v->arch.gdbsx_vcpu_event;
+                    v->arch.gdbsx_vcpu_event = 0;
+                    break;
+                }
+            }
+        }
+        *copyback = true;
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+        ret = -ENOSYS;
+        break;
+    }
+
+    return ret;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/gdbsx.h b/xen/arch/x86/include/asm/gdbsx.h
index 938eb74e2e25..e906be9ea318 100644
--- a/xen/arch/x86/include/asm/gdbsx.h
+++ b/xen/arch/x86/include/asm/gdbsx.h
@@ -2,18 +2,28 @@
 #ifndef __X86_GDBX_H__
 #define __X86_GDBX_H__
 
-#ifdef CONFIG_GDBSX
+#include <xen/stdbool.h>
 
 struct domain;
-struct xen_domctl_gdbsx_memio;
+struct xen_domctl;
 
-int gdbsx_guest_mem_io(struct domain *d, struct xen_domctl_gdbsx_memio *iop);
+#ifdef CONFIG_GDBSX
 
 void domain_pause_for_debugger(void);
 
+int gdbsx_domctl(struct domain *d, struct xen_domctl *domctl, bool *copyback);
+
 #else
 
+#include <xen/errno.h>
+
 static inline void domain_pause_for_debugger(void) {}
 
+static inline int gdbsx_domctl(
+    struct domain *d, struct xen_domctl *domctl, bool *copyback)
+{
+    return -ENOSYS;
+}
+
 #endif /* CONFIG_GDBSX */
 #endif /* __X86_GDBX_H__ */
-- 
2.11.0


