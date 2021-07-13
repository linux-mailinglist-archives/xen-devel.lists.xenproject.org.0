Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D703C6856
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 04:01:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154941.286188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m37jJ-0002AA-Qa; Tue, 13 Jul 2021 02:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154941.286188; Tue, 13 Jul 2021 02:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m37jJ-00026U-Lw; Tue, 13 Jul 2021 02:01:01 +0000
Received: by outflank-mailman (input) for mailman id 154941;
 Tue, 13 Jul 2021 02:01:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yAHm=MF=gmail.com=bobby.eshleman@srs-us1.protection.inumbo.net>)
 id 1m37jI-000176-2q
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 02:01:00 +0000
Received: from mail-pj1-x102f.google.com (unknown [2607:f8b0:4864:20::102f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a4a83df-4f93-4d66-99d0-66d242d5a5c6;
 Tue, 13 Jul 2021 02:00:47 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id cu14so5895987pjb.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jul 2021 19:00:47 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4c02:4c00::1])
 by smtp.gmail.com with ESMTPSA id o20sm19285728pgv.80.2021.07.12.19.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 19:00:46 -0700 (PDT)
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
X-Inumbo-ID: 6a4a83df-4f93-4d66-99d0-66d242d5a5c6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IYB3iZHRXJw5EDQRJ886nEUR/jLEeGwphV4Z/nAkuoA=;
        b=vQ8b5kDFCqOCH0hWy6rT6p8nLejfhuuLpsltsXVzLAmuo5T987HMdrzKNAzs8zXx1I
         hj8NSaAWveXgYkkrhHv5Wbs9gdoDLBVdUiPLoqTv1puh84PAYCnh83910gsqPG4QFxmd
         9aRYjWk3ARbB34GnYn7BGqaq/isfBFEYt3Sdt4j9m4BqHWN14ot01dR78yTZZXuY9jmJ
         ba58Cn3F/PET1RMzapZdti3pNaWxOaUFmyRrKwD9XDPEzBa0HTKgh7PSd9TwdNkOpEJv
         KnjMCjymALCnQtqBvl6F9hThvZl7+QmOVEmq6LwvE6/KTpmp9oPNgkVfgw6Q4o33Soyl
         nbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=IYB3iZHRXJw5EDQRJ886nEUR/jLEeGwphV4Z/nAkuoA=;
        b=jj+zRYlyxpZfQP5TmWqLVjjfNxY63lRTR+L0PnOevQlVO6eONS9pk3+zEJxM4qz6zV
         iA8TpYTb3AMB6Ip4gXf86GwLGGXsU3Ov/kSYOLuLgPYCV31f/5emxJUT63TSV+vzQHAr
         JZN+tSmGN7Tf8AggsQsZheisRy+6ojedDlqBEEuUeiYtpiOdBjbZOZWxHcpUyjBiLYnT
         j+RRovKfkUmHeNBmSUj6l7Jq+uYcG9+bP2PXWlicGOhcSwfj1MbWR6vq3ezPULaY3Pz1
         +Jp5y3BxKz4ASshXx0rlcGt6YpjPyKVvUPOAdwSyTA2ZC7JImuMfLa9GJS87TkdeQHZL
         J0/g==
X-Gm-Message-State: AOAM531eUdVRYpkqEfIll0jeEW2B4fn4WSDRR85cs0ciYTfs7l12sXgD
	ZhghetxduHfY2Jlo9kUBYMrrOx2fKgRISqKl
X-Google-Smtp-Source: ABdhPJzTADmqDU1sLjfzYDfb9vCVlvA29Sl+JJg1Q5nFHyy4feMy996dHxe//jyKECBphs6uEpqPKw==
X-Received: by 2002:a17:902:650b:b029:129:9c6a:13d8 with SMTP id b11-20020a170902650bb02901299c6a13d8mr1661193plk.63.1626141646687;
        Mon, 12 Jul 2021 19:00:46 -0700 (PDT)
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
Subject: [PATCH 3/4] x86/debug: move debugger_trap_entry into debugger.c not inlined
Date: Mon, 12 Jul 2021 18:59:55 -0700
Message-Id: <02355502c796b500a6b7e9e60b903d245d2ece23.1626136452.git.bobby.eshleman@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1626136452.git.bobby.eshleman@gmail.com>
References: <cover.1626136452.git.bobby.eshleman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function debugger_trap_entry() is rather large for an inlined
function.  This commit moves debugger_trap_entry() into debugger.c and
makes it not inlined.

Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
---
 xen/arch/x86/Makefile          |  1 +
 xen/arch/x86/debugger.c        | 41 ++++++++++++++++++++++++++++++++++
 xen/include/asm-x86/debugger.h | 29 ++----------------------
 3 files changed, 44 insertions(+), 27 deletions(-)
 create mode 100644 xen/arch/x86/debugger.c

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 2ec883456e..ba274fb8e6 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -32,6 +32,7 @@ obj-y += emul-i8254.o
 obj-y += extable.o
 obj-y += flushtlb.o
 obj-$(CONFIG_CRASH_DEBUG) += gdbstub.o
+obj-$(CONFIG_CRASH_DEBUG) += debugger.o
 obj-y += hypercall.o
 obj-y += i387.o
 obj-y += i8259.o
diff --git a/xen/arch/x86/debugger.c b/xen/arch/x86/debugger.c
new file mode 100644
index 0000000000..6f33f509ff
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
+    unsigned int vector, struct cpu_user_regs *regs)
+{
+    /*
+     * This function is called before any checks are made.  Amongst other
+     * things, be aware that during early boot, current is not a safe pointer
+     * to follow.
+     */
+    struct vcpu *v = current;
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
index 38359da0a1..0e30d27a4e 100644
--- a/xen/include/asm-x86/debugger.h
+++ b/xen/include/asm-x86/debugger.h
@@ -15,9 +15,6 @@
 #include <asm/regs.h>
 #include <asm/processor.h>
 #include <xen/gdbstub.h>
-#include <xen/domain.h>
-#include <xen/event.h>
-#include <xen/sched.h>
 
 void domain_pause_for_debugger(void);
 
@@ -31,29 +28,7 @@ static inline bool debugger_trap_fatal(
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
+    unsigned int vector, struct cpu_user_regs *regs);
 
 #endif /* __X86_DEBUGGER_H__ */
-- 
2.30.0


