Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB95A0119D
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 02:59:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864716.1276048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQt-0007wS-IT; Sat, 04 Jan 2025 01:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864716.1276048; Sat, 04 Jan 2025 01:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQs-0007gA-PZ; Sat, 04 Jan 2025 01:58:30 +0000
Received: by outflank-mailman (input) for mailman id 864716;
 Sat, 04 Jan 2025 01:58:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AhC6=T4=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tTtQm-0005Ax-R2
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 01:58:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e0b0c0b-ca3f-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 02:58:19 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 362555C61E7;
 Sat,  4 Jan 2025 01:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A394C4CEE5;
 Sat,  4 Jan 2025 01:58:15 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 43699E77188;
 Sat,  4 Jan 2025 01:58:15 +0000 (UTC)
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
X-Inumbo-ID: 5e0b0c0b-ca3f-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735955895;
	bh=AcdrW3O8H43kz0elqqoeILzh7ZG+wA08lKxXLcP1yPI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qFWPcMge1P3Kadc0hgvWN/ZI1ulugOzHad0WyuquIw4VVVdq6ItD5M50Lc6lfgaKG
	 1EBNGneBMz9XFuzlvtmTOoG0WI9b4vVyJSJ01ZFp3Ph2LmE/OalHSlwLMyL8BCZsg2
	 IS+ixF1AKwNQpjIcCX2hDbV/gM9Gp6/YiTmN0iaZooPj/3QcJIOIW1tfK3FKO6JV9Y
	 scEqgbuw0rjTQgx6Koe0PnecrMxIJymYkHwESt+hUmEcj1j3EU2zfUxT9tfNy/Hu6n
	 ugZYH8hL6KTz3KN2vv6T9G44xee1roMqN0UrG/N0bAUdoSZS6+Vf2eYBw18xAfRw4o
	 2xFJ8T+FMuZBw==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Fri, 03 Jan 2025 17:58:16 -0800
Subject: [PATCH v3 10/24] xen/console: introduce use of 'is_console' flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-vuart-ns8250-v3-v1-10-c5d36b31d66c@ford.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735955892; l=6019;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=HwgHil59vq9EKv+z5DPAShRIPOKHguO2oiS7uAA2fgM=;
 b=THBoqR6cFXYEpRta1DnD8ynIu+e0N3IIpv1WCUSL8mxTJf0v4ahgyFVw22S7EsevQiO/aNfdQ
 gTOEUQZPWe1AgSSXG5v76XgncIw7A76rvEW6HZzdSMPo6zNHBbixHgu
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

The code inspects d->is_console flag to decide whether the console focus
should move to the domain with console after administrator uses <Ctrl+aaa>
key combination to switch the console focus.

Console owner switch logic updated accordingly.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/dom0less-build.c |  1 -
 xen/arch/x86/pv/shim.c        |  2 ++
 xen/common/domain.c           |  2 ++
 xen/drivers/char/console.c    | 53 +++++++++++++++++++++++++++++++++++--------
 xen/drivers/virtdev-uart.c    |  2 ++
 5 files changed, 49 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 78fba18b6aa80278207f920145c5aab4fecc6d18..818e693222059a5e99a44831be62644ac442392b 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -985,7 +985,6 @@ void __init create_domUs(void)
             panic("Error initializing LLC coloring for domain %s (rc = %d)\n",
                   dt_node_name(node), rc);
 
-        d->is_console = true;
         dt_device_set_used_by(node, d->domain_id);
 
         rc = construct_domU(d, node);
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index 81e4a0516d18b359561f471f1d96e38977661ca7..9eb120258aeaf7068eae88d1e7d1b95ea7a00f31 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -238,6 +238,8 @@ void __init pv_shim_setup_dom(struct domain *d, l4_pgentry_t *l4start,
      * guest from depleting the shim memory pool.
      */
     d->max_pages = domain_tot_pages(d);
+
+    d->is_console = true;
 }
 
 static void write_start_info(struct domain *d)
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 0c4cc771115509afe3bb457b8002961a73f5a8e7..711ec3bf3b7845a6c295575421c252193ccbc0ae 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -706,6 +706,8 @@ struct domain *domain_create(domid_t domid,
 
         old_hwdom = hardware_domain;
         hardware_domain = d;
+
+        d->is_console = true;
     }
 
     TRACE_TIME(TRC_DOM0_DOM_ADD, d->domain_id);
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 33da5ff7933ea2186245763e07940c17d74bf40f..8d68116991ba9e2c5a36840b4d973f8cafe95488 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1,8 +1,8 @@
 /******************************************************************************
  * console.c
- * 
+ *
  * Emergency console I/O for Xen and the domain-0 guest OS.
- * 
+ *
  * Copyright (c) 2002-2004, K A Fraser.
  *
  * Added printf_ratelimit
@@ -473,11 +473,26 @@ static unsigned int __read_mostly console_owner = 0;
 
 #define max_console_rx (max_init_domid + 1)
 
+static struct domain *console_get_domain_by_id(domid_t domid)
+{
+    struct domain *d = rcu_lock_domain_by_id(domid);
+
+    if ( !d )
+        return NULL;
+
+    if ( d->is_console )
+        return d;
+
+    rcu_unlock_domain(d);
+
+    return NULL;
+}
+
 struct domain *console_get_domain(void)
 {
     if ( console_owner == 0 )
             return NULL;
-    return rcu_lock_domain_by_id(console_owner - 1);
+    return console_get_domain_by_id(console_owner - 1);
 }
 
 void console_put_domain(struct domain *d)
@@ -486,6 +501,15 @@ void console_put_domain(struct domain *d)
         rcu_unlock_domain(d);
 }
 
+static bool console_owner_possible(domid_t domid)
+{
+    struct domain *d = console_get_domain_by_id(domid);
+
+    console_put_domain(d);
+
+    return !!d;
+}
+
 static void console_switch_input(void)
 {
     unsigned int next_rx = console_owner;
@@ -497,7 +521,6 @@ static void console_switch_input(void)
     for ( ; ; )
     {
         domid_t domid;
-        struct domain *d;
 
         if ( next_rx++ >= max_console_rx )
         {
@@ -510,10 +533,9 @@ static void console_switch_input(void)
             domid = get_initial_domain_id();
         else
             domid = next_rx - 1;
-        d = rcu_lock_domain_by_id(domid);
-        if ( d )
+
+        if ( console_owner_possible(domid) )
         {
-            rcu_unlock_domain(d);
             console_owner = next_rx;
             printk("*** Serial input to DOM%u", domid);
             break;
@@ -562,8 +584,19 @@ static void __serial_rx(char c)
         /* Deliver input to the PV shim console. */
         rc = consoled_guest_tx(c);
 
-    if ( rc )
-        printk(KERN_ERR "d%pd: failed to process console input: %d\n", d, rc);
+    switch ( rc )
+    {
+    case 0:
+        break;
+    case -EBUSY:    /* Loopback mode */
+    case -ENOSPC:   /* FIFO is full */
+        printk(KERN_WARNING "d%pd: failed to process console input: %d\n", d, rc);
+        break;
+    default:
+        d->is_console = false;
+        printk(KERN_ERR "d%pd: disabled console forwarding: %d\n", d, rc);
+        break;
+    }
 
     console_put_domain(d);
 }
@@ -807,7 +840,7 @@ static int printk_prefix_check(char *p, char **pp)
     return ((atomic_read(&print_everything) != 0) ||
             (loglvl < lower_thresh) ||
             ((loglvl < upper_thresh) && printk_ratelimit()));
-} 
+}
 
 static int cf_check parse_console_timestamps(const char *s)
 {
diff --git a/xen/drivers/virtdev-uart.c b/xen/drivers/virtdev-uart.c
index d238ef369c6b94429eaad9f33c79b63ba325b7c6..fe119e3e6e938957613b182cbef0a29bf67230d2 100644
--- a/xen/drivers/virtdev-uart.c
+++ b/xen/drivers/virtdev-uart.c
@@ -20,6 +20,7 @@ int virtdev_uart_init(struct domain *d, struct virtdev_uart_params *params)
 #if !defined(__i386__) && !defined(__x86_64__)
     d->arch.emulation_flags |= VIRTDEV_UART;
 #endif
+    d->is_console = true;
 
     return 0;
 }
@@ -33,6 +34,7 @@ void virtdev_uart_exit(struct domain *d)
 #if !defined(__i386__) && !defined(__x86_64__)
     d->arch.emulation_flags &= ~VIRTDEV_UART;
 #endif
+    d->is_console = false;
 }
 
 int virtdev_uart_putchar(struct domain *d, char c)

-- 
2.34.1



