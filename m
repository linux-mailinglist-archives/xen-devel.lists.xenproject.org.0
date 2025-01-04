Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A64C7A0119B
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 02:59:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864712.1276013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQp-0006sW-AB; Sat, 04 Jan 2025 01:58:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864712.1276013; Sat, 04 Jan 2025 01:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQo-0006iI-DJ; Sat, 04 Jan 2025 01:58:26 +0000
Received: by outflank-mailman (input) for mailman id 864712;
 Sat, 04 Jan 2025 01:58:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AhC6=T4=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tTtQk-0005Ax-QO
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 01:58:22 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5df4cd6d-ca3f-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 02:58:18 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3C02AA411F0;
 Sat,  4 Jan 2025 01:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BCF9C4CEDD;
 Sat,  4 Jan 2025 01:58:16 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 25896E7719A;
 Sat,  4 Jan 2025 01:58:16 +0000 (UTC)
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
X-Inumbo-ID: 5df4cd6d-ca3f-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735955896;
	bh=2mHkPjXf6NjW+LO0bsnwT2e081y81crKinFFDfZUM/8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=b6CWmi2eXFjuj3dBJUQGQi2DY7mfzc2/rU/a5xqRt0c1R2D80+nzRD06J9oxLgaph
	 fb20RRMaWbnKCm+6gMinN79bcDsQ2RteEJmXcDS0oehGj6G50iWSsFypAlBqnHYUeF
	 ApZBfLLD8uDKdB2evAiGjWcfeWPBY6XRP2lTBPivxGMEcijxN/MUone536Dp6pb0Ir
	 /43eUjBlMg/Dc/GA6Wy6UmByKg0YvnnRglOizjUOhi5b7CZqLY9ooyV7vPmPM8n077
	 tamcnloB59wF4hNhiu17UeeST4W7OuSO+/VhoNJKtFt9zVMVhJdVz7DKTZc3B4N9fm
	 S6GtCSn6tx2mA==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Fri, 03 Jan 2025 17:58:30 -0800
Subject: [PATCH v3 24/24] xen/console: unify printout behavior for UART
 emulators
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-vuart-ns8250-v3-v1-24-c5d36b31d66c@ford.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
In-Reply-To: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735955892; l=6584;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=ht6Wazj1keo9tj+WEpSpwlWS9w1mUW+HbPE+9o8P0XA=;
 b=a9v2A+pEGC73S64duP7Evt85PvPWNZaAkUU7eN+j8YqqbMH0bZXfZJ28pMx0ePRJsPx1uTi6w
 Bw2REOs04J5AizYVsUfSAOcGa9KX2lR3rudN3+aJ/KzFXDA+5IQITHi
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

If virtual UART prints on the physical console, the behavior is updated to:
- no prefix for Dom0 output;
- DOM$NUM for DomUs when not in focus, otherwise no prefix.

Introduce printk_noprefix() for convenient printouts which skip '(XEN)'
prefix on the physical console. This is needed for the case when physical
console is owned by a domain with in-hypervisor UART emulation enabled.

Add printk_noprefix() to exception into ECLAIR deviations list for
rule MC3A2.R17.1.

Use guest_printk() in all current in-hypervisor UART emulators. That aligns
behavior with debug I/O port 0xe9 handler in x86 port and slightly improves the
logging since guest_printk() already prints the domain ID.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 1 +
 xen/arch/arm/vpl011.c                            | 6 +++---
 xen/arch/arm/vuart.c                             | 8 +++++++-
 xen/arch/x86/hvm/vuart-ns16550.c                 | 7 +++++--
 xen/drivers/char/console.c                       | 8 ++++++++
 xen/include/xen/lib.h                            | 3 +++
 6 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index ae25eeb76ac938588d16c9b4f9f116ddcaf97956..d94a8bc59d0b562cc285bb236dbac41a151042ac 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -523,6 +523,7 @@ safe."
 -config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(panic)&&kind(function))))"}
 -config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(elf_call_log_callback)&&kind(function))))"}
 -config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vprintk_common)&&kind(function))))"}
+-config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(printk_noprefix)&&kind(function))))"}
 -config=MC3A2.R17.1,macros+={hide , "^va_(arg|start|copy|end)$"}
 -doc_end
 
diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index efe77c13007716d0e0d70ab5ccf5f94268d5b693..ab85893174e76c5ec4350931a030760c9e0331b0 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -89,7 +89,7 @@ static void vpl011_write_data_xen(struct domain *d, uint8_t data)
     {
         if ( intf->out_prod == 1 )
         {
-            printk("%c", data);
+            printk_noprefix("%c", data);
             intf->out_prod = 0;
         }
         else
@@ -97,7 +97,7 @@ static void vpl011_write_data_xen(struct domain *d, uint8_t data)
             if ( data != '\n' )
                 intf->out[intf->out_prod++] = '\n';
             intf->out[intf->out_prod++] = '\0';
-            printk("%s", intf->out);
+            printk_noprefix("%s", intf->out);
             intf->out_prod = 0;
         }
     }
@@ -109,7 +109,7 @@ static void vpl011_write_data_xen(struct domain *d, uint8_t data)
             if ( data != '\n' )
                 intf->out[intf->out_prod++] = '\n';
             intf->out[intf->out_prod++] = '\0';
-            printk("DOM%u: %s", d->domain_id, intf->out);
+            guest_printk(d, "%s", intf->out);
             intf->out_prod = 0;
         }
     }
diff --git a/xen/arch/arm/vuart.c b/xen/arch/arm/vuart.c
index 03366da17a604502f6e0afb45e8824c9d7cfa3dd..0e0fba344b68760463e894dc43133121bccbd960 100644
--- a/xen/arch/arm/vuart.c
+++ b/xen/arch/arm/vuart.c
@@ -31,6 +31,7 @@
 #include <xen/serial.h>
 #include <asm/mmio.h>
 #include <xen/perfc.h>
+#include <xen/console.h>
 
 #include "vuart.h"
 
@@ -87,7 +88,12 @@ static void hwdom_vuart_print_char(struct vcpu *v, char c)
         if ( c != '\n' )
             uart->buf[uart->idx++] = '\n';
         uart->buf[uart->idx] = '\0';
-        printk(XENLOG_G_DEBUG "DOM%u: %s", d->domain_id, uart->buf);
+
+        if ( d->domain_id == console_get_owner() )
+            printk_noprefix("%s", uart->buf);
+        else
+            guest_printk(d, "%s", uart->buf);
+
         uart->idx = 0;
     }
     spin_unlock(&uart->lock);
diff --git a/xen/arch/x86/hvm/vuart-ns16550.c b/xen/arch/x86/hvm/vuart-ns16550.c
index d0c19f53399bd8241f54d2fe2716e62046b8e59d..67cc7e9acc396a2f4346aebeef85d4b96c0d0e3f 100644
--- a/xen/arch/x86/hvm/vuart-ns16550.c
+++ b/xen/arch/x86/hvm/vuart-ns16550.c
@@ -35,6 +35,7 @@
 #include <asm/setup.h>   /* max_init_domid */
 #include <public/io/console.h>
 #include <xen/8250-uart.h>
+#include <xen/console.h>
 #include <xen/ctype.h>
 #include <xen/ioreq.h>
 #include <xen/resource.h>
@@ -899,10 +900,12 @@ static int cf_check ns16550_putchar(struct domain *d, char ch)
         regs[UART_LSR] |= UART_LSR_DR | val;
 
         /*
-         * Echo the user input on Xen console.
+         * Echo the user input on Xen console iff Xen console input is owned
+         * by NS16550 domain.
          * NB: use 'console_timestamps=none' to disable Xen timestamps.
          */
-        printk("%c", ch);
+        if ( d->domain_id == console_get_owner() )
+            printk_noprefix("%c", ch);
 
         /* FIXME: check FCR when to fire an interrupt */
         ns16550_irq_check(vdev);
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 96375067164980a138b1a93161712c0758f4f7fe..64abde479305910d1a962e68d5c1f0c25000cb3d 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1026,6 +1026,14 @@ void printk(const char *fmt, ...)
     va_end(args);
 }
 
+void printk_noprefix(const char *fmt, ...)
+{
+    va_list args;
+    va_start(args, fmt);
+    vprintk_common("", fmt, args);
+    va_end(args);
+}
+
 void guest_printk(const struct domain *d, const char *fmt, ...)
 {
     va_list args;
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 81b722ea3e801e9089aaf8758249feb3a758c4f7..e55b8fac8d4d121262a56948638d83f1146e5a06 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -61,6 +61,9 @@ debugtrace_printk(const char *fmt, ...) {}
 extern void printk(const char *fmt, ...)
     __attribute__ ((format (printf, 1, 2), cold));
 
+extern void printk_noprefix(const char *fmt, ...)
+    __attribute__ ((format (printf, 1, 2), cold));
+
 #define printk_once(fmt, args...)               \
 ({                                              \
     static bool __read_mostly once_;            \

-- 
2.34.1



