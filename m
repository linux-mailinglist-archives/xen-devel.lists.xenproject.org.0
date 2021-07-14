Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A76FA3C9244
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 22:38:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156214.288283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3leE-00010q-KD; Wed, 14 Jul 2021 20:38:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156214.288283; Wed, 14 Jul 2021 20:38:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3leE-0000xE-Fv; Wed, 14 Jul 2021 20:38:26 +0000
Received: by outflank-mailman (input) for mailman id 156214;
 Wed, 14 Jul 2021 20:38:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kxbS=MG=gmail.com=bobby.eshleman@srs-us1.protection.inumbo.net>)
 id 1m3leC-0000KG-On
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 20:38:24 +0000
Received: from mail-pl1-x633.google.com (unknown [2607:f8b0:4864:20::633])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67347e58-726d-41d7-ba9b-936580e7fb8a;
 Wed, 14 Jul 2021 20:38:22 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id o8so2042539plg.11
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jul 2021 13:38:22 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4c02:4c00::1])
 by smtp.gmail.com with ESMTPSA id b17sm1785084pfm.54.2021.07.14.13.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 13:38:21 -0700 (PDT)
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
X-Inumbo-ID: 67347e58-726d-41d7-ba9b-936580e7fb8a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c0nnBaD2pL0VkhpqTi/GSsyBm9vArGbyMPY2G5OiRPc=;
        b=V0YuUm4F5ZL//dA3LzDvyZzAgn0zfz3TOvIZvz8EOy0xECuQfna58kZb7W9q79D8m/
         QQvfTsv5f4oy09CL9OFX/pUbFJbiS0JPyrpDm7ZIeOFc03tHvhjacqFZunxegQvJxVmB
         WQjnhr+AimvtwCNveWncXAvBNLSsKtDkjJ56zwl0vuvSGoYQrCmPm9wuHR1fL+NYEj+k
         OpgaqU9/snWSMnshvmWgeE5ypPSI9jkydw2wwSuMUUznPcgYgj2MoD4ZKhctTpCGP0jk
         p4NIcQufdZw5qXPYg8CR2IgQePeonSEjetU8WVuTMLEv5jcUtVzVpN42Wb0Q9/fjtijA
         G2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=c0nnBaD2pL0VkhpqTi/GSsyBm9vArGbyMPY2G5OiRPc=;
        b=ulxZEDi+J2Qsw+fpsb0cZEHB+rTzSpBmoU0wnOq0wmb153sL4S2Aubjpcot6h9u/2x
         XBb+CPPr9giOGeNqZ8P286RdRzDbMHt//kYsAtuMfbocoBCfZCctldIfBda3Qj4xlOsW
         7V+n3j5Aw7d9KA84zSEit5lM26QgVsXv1WzO/XdpGBshW8C3m5zc5B3F0atnx8k4mhKQ
         9r9qLiTgUOXZ1fD9YBqoXpuSbyUNAuvb1A5sqLDiR/g0zEHU3meB2bLTANoD8eBDMKs2
         2LTu3QRUIzpNIQnPuwJghkAsw32Lv3FZJYAtKkVfh5iJ0zMfutW1BeHOHfOtXuYVOxdq
         Hr0A==
X-Gm-Message-State: AOAM533zfnUwsjtxivp/XOB5sP4E9mPe6hnIZyBxueaRLsqZ9iFLqkJv
	9vc5ymaJeeVL22JR/JCWHyriWk9h9SDaIlHU
X-Google-Smtp-Source: ABdhPJxSyAq9fc8Va4SaiyXmdltT4t2CxbaMnDmVNqIFS4vO/qscXSfsjUf2o5jXGqG2XTrLJ49R0A==
X-Received: by 2002:a17:90b:d8f:: with SMTP id bg15mr5377047pjb.152.1626295101821;
        Wed, 14 Jul 2021 13:38:21 -0700 (PDT)
Sender: Bobby Eshleman <bobbyeshleman@gmail.com>
From: Bobby Eshleman <bobby.eshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobby.eshleman@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v2 3/4] x86/debug: move debugger_trap_entry into debugger.c not inlined
Date: Wed, 14 Jul 2021 13:37:46 -0700
Message-Id: <a7af5b3fd6d297b2659433060d6f1e2fc6bfdb86.1626286772.git.bobby.eshleman@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1626286772.git.bobby.eshleman@gmail.com>
References: <cover.1626286772.git.bobby.eshleman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function debugger_trap_entry() is somewhat large for an inlined
function.  This commit moves debugger_trap_entry() into debugger.c and
makes it not inlined.

Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
---

Changes in v2:
- Move obj-$(CONFIG_CRASH_DEBUG) += debugger.o to be in alphabetical
  order
- Constify cpu_user_regs *regs and struct vcpu *v in
  debugger_trap_entry()

 xen/arch/x86/Makefile          |  1 +
 xen/arch/x86/debugger.c        | 41 ++++++++++++++++++++++++++++++++++
 xen/include/asm-x86/debugger.h | 26 ++-------------------
 3 files changed, 44 insertions(+), 24 deletions(-)
 create mode 100644 xen/arch/x86/debugger.c

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 2ec883456e..c5c9f37570 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_PV) += compat.o
 obj-$(CONFIG_PV32) += x86_64/compat.o
 obj-$(CONFIG_KEXEC) += crash.o
 obj-$(CONFIG_GDBSX) += debug.o
+obj-$(CONFIG_CRASH_DEBUG) += debugger.o
 obj-y += delay.o
 obj-y += desc.o
 obj-bin-y += dmi_scan.init.o
diff --git a/xen/arch/x86/debugger.c b/xen/arch/x86/debugger.c
new file mode 100644
index 0000000000..985c1275b4
--- /dev/null
+++ b/xen/arch/x86/debugger.c
@@ -0,0 +1,41 @@
+/******************************************************************************
+ * x86 crash debug hooks
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <asm/debugger.h>
+#include <xen/domain.h>
+#include <xen/event.h>
+#include <xen/sched.h>
+
+bool debugger_trap_entry(
+    unsigned int vector, const struct cpu_user_regs *regs)
+{
+    /*
+     * This function is called before any checks are made.  Amongst other
+     * things, be aware that during early boot, current is not a safe pointer
+     * to follow.
+     */
+    const struct vcpu *v = current;
+
+    if ( vector != TRAP_int3 && vector != TRAP_debug )
+        return false;
+
+    if ( guest_mode(regs) && guest_kernel_mode(v, regs) &&
+         v->domain->debugger_attached  )
+    {
+        if ( vector != TRAP_debug ) /* domain pause is good enough */
+            current->arch.gdbsx_vcpu_event = vector;
+        domain_pause_for_debugger();
+        return true;
+    }
+
+    return false;
+}
diff --git a/xen/include/asm-x86/debugger.h b/xen/include/asm-x86/debugger.h
index c856c1b795..75e35c7902 100644
--- a/xen/include/asm-x86/debugger.h
+++ b/xen/include/asm-x86/debugger.h
@@ -31,30 +31,8 @@ static inline bool debugger_trap_fatal(
 /* Int3 is a trivial way to gather cpu_user_regs context. */
 #define debugger_trap_immediate() __asm__ __volatile__ ( "int3" );
 
-static inline bool debugger_trap_entry(
-    unsigned int vector, struct cpu_user_regs *regs)
-{
-    /*
-     * This function is called before any checks are made.  Amongst other
-     * things, be aware that during early boot, current is not a safe pointer
-     * to follow.
-     */
-    struct vcpu *v = current;
-
-    if ( vector != TRAP_int3 && vector != TRAP_debug )
-        return false;
-
-    if ( guest_mode(regs) && guest_kernel_mode(v, regs) &&
-         v->domain->debugger_attached  )
-    {
-        if ( vector != TRAP_debug ) /* domain pause is good enough */
-            current->arch.gdbsx_vcpu_event = vector;
-        domain_pause_for_debugger();
-        return true;
-    }
-
-    return false;
-}
+bool debugger_trap_entry(
+    unsigned int vector, const struct cpu_user_regs *regs);
 
 #ifdef CONFIG_GDBSX
 unsigned int dbg_rw_mem(unsigned long gva, XEN_GUEST_HANDLE_PARAM(void) buf,
-- 
2.30.0


