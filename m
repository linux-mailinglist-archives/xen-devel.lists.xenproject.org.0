Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B16D176B964
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 18:06:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574413.899658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQrtI-0007vj-L5; Tue, 01 Aug 2023 16:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574413.899658; Tue, 01 Aug 2023 16:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQrtI-0007te-IW; Tue, 01 Aug 2023 16:06:32 +0000
Received: by outflank-mailman (input) for mailman id 574413;
 Tue, 01 Aug 2023 16:06:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Rc=DS=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qQrtH-0007tU-6E
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 16:06:31 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d721bbf-3085-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 18:06:27 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1690905978394667.5904322669267;
 Tue, 1 Aug 2023 09:06:18 -0700 (PDT)
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
X-Inumbo-ID: 5d721bbf-3085-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1690905980; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E0+G4/RbxkFKV79+eB7HIqeT2L1Q1Nqvfl4LNWWQVHo0lpK+Xea1PjHP7Il35THdaVAxq7In1PZG1unoBc+ZSGEyOtmXqtD8fnTldABpVYUDnHX7lZij1utAPrKUThDF+Terij31PMjGe5taePHAV1RKuGSB8c4HpdKkqe4xew4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1690905980; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=O/CJBISWz6EI4/Y6OymY+j6HswAHAIyZi8m02gX250o=; 
	b=C3FzfMVWW33z+pFKbs1aL06U5g2h+LkyL+Of8tR1KNixGj1iX9WRqw7nf2DFlVGXpxlRa8mBTI/owkc0vuYe+Dpkoj5TKkffepf34jUUSNgaB5NUHNUQxe8sK9rXvbdLOWf8mhVe5k2bqa8CnCcZFJ6tX8uQHWebB/bcCJOr2cI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1690905980;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=O/CJBISWz6EI4/Y6OymY+j6HswAHAIyZi8m02gX250o=;
	b=O4m12KzDUnvCnEgF+iMd/0v91UJSt9CAYvQ+fVnMYDOd7itpEmbYppypQLzJdzn0
	x9S5ggTSQXbDNCn3Gv6eb0etTc7vY+D9VDTRqFZBXSz1l1PKuo81Nkt+luQ8O2KSTa9
	meKmiTmnU5F9et6Zu1+G6TDgDC6bnp9iYGocNDa0=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Christopher Clark <christopher.w.clark@gmail.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] console: generalize the ability for domU access
Date: Tue,  1 Aug 2023 12:06:07 -0400
Message-Id: <20230801160608.19219-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This patch reworks the console rotation logic to provide a general mechanism to
incorporate domU in to the rotation. It does so by walking the domain list
using the XSM console privlege check to determine if the domain is given access.

In reworking the rotation logic, the assumption that the hardware domain is the
first domain created is removed and is changed to explicitly locate the
hardware domain at boot. As part of this removal, the reliance on the
`max_init_domid` global is eliminated, allowing the removal of a compatibility
`#define` for the x86 arch.

Suggested-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---

This patch was developed as part of enabling PVH domain construction for
hyperlaunch. There will be a corresponding Linux patch to enable the kernel to
make use of console_io when running as a DomU. For x86, this will only be
usable by leveraging FLASK to assign the privilege to a label that is applied
to domains desired to be able to use the Xen console. When hyperlaunch is
merged, it will become possible to assign the privilege without FLASK. This
should work for Arm environments with or without vp1011 backend.

 xen/arch/x86/include/asm/setup.h |   2 -
 xen/drivers/char/console.c       | 134 +++++++++++++++++++++++--------
 2 files changed, 99 insertions(+), 37 deletions(-)

diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 51fce66607..5242dfcf93 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -64,6 +64,4 @@ extern bool opt_dom0_verbose;
 extern bool opt_dom0_cpuid_faulting;
 extern bool opt_dom0_msr_relaxed;
 
-#define max_init_domid (0)
-
 #endif
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 0e410fa086..f5b759898e 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -473,45 +473,102 @@ static void cf_check dump_console_ring_key(unsigned char key)
  */
 static unsigned int __read_mostly console_rx = 0;
 
-#define max_console_rx (max_init_domid + 1)
+#define CON_RX_DOMID (console_rx - 1)
 
 /* Make sure to rcu_unlock_domain after use */
 struct domain *console_input_domain(void)
 {
     if ( console_rx == 0 )
             return NULL;
-    return rcu_lock_domain_by_id(console_rx - 1);
+    return rcu_lock_domain_by_id(CON_RX_DOMID);
 }
 
 static void switch_serial_input(void)
 {
-    unsigned int next_rx = console_rx;
+    struct domain *next, *d = console_input_domain();
 
-    /*
-     * Rotate among Xen, dom0 and boot-time created domUs while skipping
-     * switching serial input to non existing domains.
-     */
-    for ( ; ; )
+    if ( d == NULL )
     {
-        struct domain *d;
+        if ( hardware_domain )
+        {
+            console_rx = hardware_domain->domain_id + 1;
+            printk("*** Serial input to DOM%d", CON_RX_DOMID);
+            goto out; //print switch_code statement & newline
+        }
+        else
+        {
+            for_each_domain(next)
+            {
+                if ( xsm_console_io(XSM_OTHER, next, CONSOLEIO_read) == 0 )
+                {
+                    console_rx = next->domain_id + 1;
+                    printk("*** Serial input to DOM%d", CON_RX_DOMID);
+                    goto out; //print switch_code statement & newline
+                }
+            }
 
-        if ( next_rx++ >= max_console_rx )
+            console_rx = 0;
+            printk("*** Serial input to Xen");
+            goto out;
+        }
+    }
+
+    for ( next = rcu_dereference(d->next_in_list); next != NULL;
+          next = rcu_dereference(next->next_in_list) )
+    {
+        if ( hardware_domain && next == hardware_domain )
         {
             console_rx = 0;
             printk("*** Serial input to Xen");
-            break;
+            goto out;
         }
 
-        d = rcu_lock_domain_by_id(next_rx - 1);
-        if ( d )
+        if ( xsm_console_io(XSM_OTHER, next, CONSOLEIO_read) == 0 )
         {
-            rcu_unlock_domain(d);
-            console_rx = next_rx;
-            printk("*** Serial input to DOM%u", next_rx - 1);
-            break;
+            console_rx = next->domain_id + 1;
+            printk("*** Serial input to DOM%d", CON_RX_DOMID);
+            goto out;
+        }
+    }
+
+    /*
+     * Hit the end of the domain list and instead of assuming that the
+     * hardware domain is the first in the list, get the first domain
+     * in the domain list and then if it is not the hardware domain or
+     * does not have console privilege, iterate the list until we find
+     * the hardware domain or a domain with console privilege.
+     */
+    if ( next == NULL )
+    {
+        for_each_domain(next)
+        {
+            if ( hardware_domain && next == hardware_domain )
+            {
+                console_rx = 0;
+                printk("*** Serial input to Xen");
+                goto out;
+            }
+
+            if ( xsm_console_io(XSM_OTHER, next, CONSOLEIO_read) == 0 )
+            {
+                console_rx = next->domain_id + 1;
+                printk("*** Serial input to DOM%d", CON_RX_DOMID);
+                goto out;
+            }
         }
     }
 
+    /*
+     * If we got here, could not find a domain with console io privilege.
+     * Default to Xen.
+     */
+    console_rx = 0;
+    printk("*** Serial input to Xen");
+
+out:
+    if ( d != NULL)
+        rcu_unlock_domain(d);
+
     if ( switch_code )
         printk(" (type 'CTRL-%c' three times to switch input)",
                opt_conswitch[0]);
@@ -520,12 +577,11 @@ static void switch_serial_input(void)
 
 static void __serial_rx(char c, struct cpu_user_regs *regs)
 {
-    switch ( console_rx )
-    {
-    case 0:
+    if ( console_rx == 0 )
         return handle_keypress(c, regs);
 
-    case 1:
+    if ( hardware_domain->domain_id == CON_RX_DOMID )
+    {
         /*
          * Deliver input to the hardware domain buffer, unless it is
          * already full.
@@ -538,31 +594,37 @@ static void __serial_rx(char c, struct cpu_user_regs *regs)
          * getting stuck.
          */
         send_global_virq(VIRQ_CONSOLE);
-        break;
-
-#ifdef CONFIG_SBSA_VUART_CONSOLE
-    default:
+    }
+    else
     {
-        struct domain *d = rcu_lock_domain_by_id(console_rx - 1);
+        struct domain *d = rcu_lock_domain_by_any_id(CON_RX_DOMID);
 
+        if ( d == NULL )
+            goto unlock_out;
+
+#ifdef CONFIG_SBSA_VUART_CONSOLE
         /*
          * If we have a properly initialized vpl011 console for the
          * domain, without a full PV ring to Dom0 (in that case input
          * comes from the PV ring), then send the character to it.
          */
-        if ( d != NULL &&
-             !d->arch.vpl011.backend_in_domain &&
+        if ( !d->arch.vpl011.backend_in_domain &&
              d->arch.vpl011.backend.xen != NULL )
+        {
             vpl011_rx_char_xen(d, c);
-        else
-            printk("Cannot send chars to Dom%d: no UART available\n",
-                   console_rx - 1);
+            goto unlock_out;
+        }
+#endif
+
+        if ( (serial_rx_prod - serial_rx_cons) != SERIAL_RX_SIZE )
+            serial_rx_ring[SERIAL_RX_MASK(serial_rx_prod++)] = c;
 
+        send_guest_global_virq(d, VIRQ_CONSOLE);
+
+unlock_out:
         if ( d != NULL )
             rcu_unlock_domain(d);
     }
-#endif
-    }
 
 #ifdef CONFIG_X86
     if ( pv_shim && pv_console )
@@ -627,7 +689,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
         if ( copy_from_guest(kbuf, buffer, kcount) )
             return -EFAULT;
 
-        if ( is_hardware_domain(cd) )
+        if ( cd->domain_id == CON_RX_DOMID )
         {
             /* Use direct console output as it could be interactive */
             spin_lock_irq(&console_lock);
@@ -717,6 +779,8 @@ long do_console_io(
         rc = -E2BIG;
         if ( count > INT_MAX )
             break;
+        if ( CON_RX_DOMID != current->domain->domain_id )
+            return 0;
 
         rc = 0;
         while ( (serial_rx_cons != serial_rx_prod) && (rc < count) )
@@ -1107,7 +1171,7 @@ void __init console_endboot(void)
      * a useful 'how to switch' message.
      */
     if ( opt_conswitch[1] == 'x' )
-        console_rx = max_console_rx;
+        console_rx = 0;
 
     register_keyhandler('w', dump_console_ring_key,
                         "synchronously dump console ring buffer (dmesg)", 0);
-- 
2.20.1


