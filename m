Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7884A8562
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 14:39:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264770.457994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFcK1-0001Lm-Am; Thu, 03 Feb 2022 13:38:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264770.457994; Thu, 03 Feb 2022 13:38:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFcK1-0001Is-6R; Thu, 03 Feb 2022 13:38:49 +0000
Received: by outflank-mailman (input) for mailman id 264770;
 Thu, 03 Feb 2022 13:38:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ap74=SS=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nFcJz-0001Im-5n
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 13:38:47 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a8eeff7-84f6-11ec-8eb8-a37418f5ba1a;
 Thu, 03 Feb 2022 14:38:45 +0100 (CET)
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
X-Inumbo-ID: 9a8eeff7-84f6-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643895525;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HHOX/WHyplwxog3uWsB8rHIhKz2K06Z2bGy3CpsQCGs=;
  b=GCUSweDiQ8jUtJpLzMES2MdDsHXAe1eXBb9lar4l3cG+rvGCPX+KwoUz
   Nz8JLJJV+Pv+oVSGQLi7tmM2J30t7GfW7c78Nye81jgIMMo8ytsD7a9fg
   RWs+41h4T0pxaaV1Ab66/HfJ6CnPS7s6PlRvrE/PyahiTWuKMPTbFZ3e8
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QNYqSAQOvwMYcAlKDavaPrinwxMRn/Ntfg7OeX/VIHZClDs1krAywSzmTtq73N7Fb4WObymhkz
 FiUUplptly5x5ugQN0uXUcB2iA8Sqeh7FUzhySlqBqn9dPjJsZUZUOmtx90Lk3uMyOH3IPPV3i
 5MGCapNmD3t9vGqBy2NfqmkuU5s/ctYbJ8v8KsXoYmSBoX3joIIuOwHd6HI05drLW8PnpxXc60
 k8f/Hwvnjd07dbvBjsa9THKrELvllFcQgF4r2RUjWrepVUU8vMtk1JIRtRKBt64prV9FIKez3g
 XPF4CZfeIg0t7/xij/5cJlXV
X-SBRS: 5.2
X-MesageID: 63817204
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:W2lH7aLKJ11WYOivFE+RZJIlxSXFcZb7ZxGr2PjKsXjdYENS0jICy
 mBOWG7Qa/3ZY2Xzft90OoS09EkF6MDcyoIyHQNlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug7wLZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3Swopb6
 /hGhaCScgt4B/DXh+knbwJXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Glr1pkRR66CD
 yYfQQFJchnMTx9QBl00LpIjktmBqEHaYTIN/Tp5ooJoujOOnWSdyoPFMsfRe9GMbdVYmACfv
 G2u11r+BhYWJdmO0w2v+3inhvLMtS7jUYdUH7q9ntZgjUeP3GUVBFsTXEGivPiiokekXpRUL
 El80jUqhbg/8gqsVNaVdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOluU7WDgr3
 V+hhM7yCHpkt7j9YWmG6r6eoDe2OC4UBWwPfykJSU0C+daLnW0opkuRFJA5Svfz14CrX2Grq
 9yXkMQgr+5O1+Qo+q6LwXL8j2OV+4PWQzQJ/QqCCwpJ8ThFTIKiYoWp733S4vBBMJuVQzG9g
 ZQUpySNxLtQVM/QzURhVM1IRej0vKjdbFUwlHYyR8FJyti7x5K0kWm8ChlaLVwhDMsLcCSBj
 KT76VIIv8870JdHgMZKj2ON5yYCkPCI+TfNDKm8gj9yjn5ZLlTvEMZGPhb44owVuBJw+ZzTw
 L/CGSpWMV4UCL580B29TPoH3Lkgy0gWnD2PHsCgkkr6gOHBPxZ5rIvp1nPUNYjVC4vf+G3oH
 yt3bZPWm32zrsWiCsUozWLjBQ9TdiVqbXwHg8dWavSCMmJb9JIJUJfsLUcaU9U9xcx9z76Ql
 lnkAxMw4Aeh2RXvdFvbAlg+OOKHdcsu9hoTYH1zVWtELlB+O+5DGo9FKctuFVTmncQ+pcNJo
 w4tIJTdW6kfF2icplzwr/DV9eRfSfhivirWVwLNXdT1V8Q5L+AQ0tO7LAbp6gcUCS+76Zk3r
 7G6j1uJSpsfXQVySs3Rbav3nV+2uHEcnsN0XlfJfYYPKBm9rtAyJnyjlOIzLuENNQ7HmmmQ2
 TGJDEpKvuLKuYI0roXE3PjWs4ezHuJiNUNGBG2Hv62uPCzX8zP7k49NWeqFZx7HU2bw9Pnwb
 OlZ1aikYvYGgExLo8x3FLMylfAy4N7mprl7yAV4HSqUMwT3W+04enTfhJtBrKxAwLNdqDCaY
 EPX94kII6iNNePkDEUVeFgvYNOc2KxGgTLV9/k0fhn3vXcl4LqdXExOFBCQkygBfqBtOYYoz
 Op96s4b7wuz1kgjPtqc130G8m2NKjoLUrk9t4FcC4ju01J5xlZHaJ3aKyn3/JDQNIkcbhh0e
 meZ1PjYmrBR5kveaH5iR3HC0N1UiYkKpB0XnkQJIE6Em4adi/I6tPGLHe/bkuiBIs177t9O
IronPort-HdrOrdr: A9a23:fYz76KBlZYCf/dLlHemi55DYdb4zR+YMi2TC1yhKKCC9Ffbo8f
 xG/c5rsiMc5wxhO03I9eruBEDiewK5yXcW2/hyAV7KZmCP0wHEQL2KhbGSugEIcBefygcy78
 ldmtBFebjNMWQ=
X-IronPort-AV: E=Sophos;i="5.88,340,1635220800"; 
   d="scan'208";a="63817204"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH] xen: Modify domain_crash() to take a print string
Date: Thu, 3 Feb 2022 13:38:29 +0000
Message-ID: <20220203133829.7913-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There are two problems with domain_crash().

First, that it is frequently not preceded by a printk() at all, or that it is
only preceded by a dprintk().  Either way, critical diagnostic is omitted for
an event which is fatal to the guest.

Second, the embedded __LINE__ is an issue for livepatching, creating unwanted
churn in the binary diff.  This is the final __LINE__ remaining in
livepatching-relevant contexts.

The end goal is to have domain_crash() require a print string which gets fed
to printk(), making it far less easy to omit relevant diagnostic information.

However, modifying all callers at once is far too big and complicated, so use
some macro magic to tolerate the old API (no print string) in the short term.

Adjust two callers in load_segments() to demonstrate the new API.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>

Supersedes my previous attempt to update every caller in one go.  In due
course I'll split that mammoth patch up into a series.
---
 xen/arch/x86/domain.c   | 14 ++++----------
 xen/include/xen/sched.h | 13 +++++++++----
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index ef1812dc1402..45be5e1cd7c9 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1693,11 +1693,8 @@ static void load_segments(struct vcpu *n)
                  put_guest(uregs->fs,   esp - 5) |
                  put_guest(uregs->es,   esp - 6) |
                  put_guest(uregs->ds,   esp - 7) )
-            {
-                gprintk(XENLOG_ERR,
-                        "error while creating compat failsafe callback frame\n");
-                domain_crash(n->domain);
-            }
+                domain_crash(n->domain,
+                             "Error creating compat failsafe callback frame\n");
 
             if ( n->arch.pv.vgc_flags & VGCF_failsafe_disables_events )
                 vcpu_info(n, evtchn_upcall_mask) = 1;
@@ -1732,11 +1729,8 @@ static void load_segments(struct vcpu *n)
              put_guest(uregs->ds,   rsp -  9) |
              put_guest(regs->r11,   rsp - 10) |
              put_guest(regs->rcx,   rsp - 11) )
-        {
-            gprintk(XENLOG_ERR,
-                    "error while creating failsafe callback frame\n");
-            domain_crash(n->domain);
-        }
+            domain_crash(n->domain,
+                         "Error creating failsafe callback frame\n");
 
         if ( n->arch.pv.vgc_flags & VGCF_failsafe_disables_events )
             vcpu_info(n, evtchn_upcall_mask) = 1;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 37f78cc4c4c9..38b390d20371 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -736,10 +736,15 @@ void vcpu_end_shutdown_deferral(struct vcpu *v);
  * from any processor.
  */
 void __domain_crash(struct domain *d);
-#define domain_crash(d) do {                                              \
-    printk("domain_crash called from %s:%d\n", __FILE__, __LINE__);       \
-    __domain_crash(d);                                                    \
-} while (0)
+#define domain_crash(d, ...)                            \
+    do {                                                \
+        if ( count_args(__VA_ARGS__) == 0 )             \
+            printk("domain_crash called from %s:%d\n",  \
+                   __FILE__, __LINE__);                 \
+        else                                            \
+            printk(XENLOG_G_ERR __VA_ARGS__);           \
+        __domain_crash(d);                              \
+    } while ( 0 )
 
 /*
  * Called from assembly code, with an optional address to help indicate why
-- 
2.11.0


