Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACDE9D9FB3
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 00:37:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844321.1259895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG57b-00028O-IJ; Tue, 26 Nov 2024 23:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844321.1259895; Tue, 26 Nov 2024 23:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG57b-00026U-FL; Tue, 26 Nov 2024 23:37:31 +0000
Received: by outflank-mailman (input) for mailman id 844321;
 Tue, 26 Nov 2024 23:37:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rasV=SV=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tG4sl-0000At-De
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 23:22:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3dbb8ddd-ac4d-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 00:22:02 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A3A9D5C5D31;
 Tue, 26 Nov 2024 23:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1560C4CED0;
 Tue, 26 Nov 2024 23:21:56 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id C7F4DD66B97;
 Tue, 26 Nov 2024 23:21:56 +0000 (UTC)
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
X-Inumbo-ID: 3dbb8ddd-ac4d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjNkYmI4ZGRkLWFjNGQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjYzMzIzLjE1Mzg0NCwic2VuZGVyIjoiZGV2bnVsbCtkbXVraGluLmZvcmQuY29tQGtlcm5lbC5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732663316;
	bh=3B9kDEeHN3CLeIVggukm2mQ91O/Gp2h/G9Z0+jViCMU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cr5zAvq4k8x3uKM38Jz4HtBTKbGja2wbZmF6XG0K8nudD9IEhghKJJwsatgsvTfgE
	 tOj1Rfjh9QoJCdPcOmeDhUm2Wd0De/OFwNguK0cBTTtaavf2k/w66IycgdSxSjdIjV
	 NO+9OHhmcAd+IDzpqJ1Kv8XPf5fqQvTctp7+O2/aJanmDxonEMsyd7f58t0PAknLUC
	 ZnelYJkaDQjj8W6DdjL7doWjMfxXXMAAtHNBelEcAAGeAuyl6MVK4KMViBu4MG3fAJ
	 k+rRYAp88hHzxdNSB0SDgn7Z1pMxblpYPfs9a8W3ZhVB7yVrGiZMtWfJrq4EdljZGl
	 5his4NKZAjZ2A==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Tue, 26 Nov 2024 15:22:11 -0800
Subject: [PATCH 21/36] xen/console: introduce use of 'is_console' flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-vuart-ns8250-v1-v1-21-87b9a8375b7a@ford.com>
References: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
In-Reply-To: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
To: Jan Beulich <jbeulich@suse.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
 Bertrand Marquis <bertrand.marquis@arm.com>, 
 Michal Orzel <michal.orzel@amd.com>, Rahul Singh <rahul.singh@arm.com>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bob Eshleman <bobbyeshleman@gmail.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Shawn Anastasio <sanastasio@raptorengineering.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
 Christian Lindig <christian.lindig@citrix.com>, 
 David Scott <dave@recoil.org>, 
 =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732663312; l=3376;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=ly2NKmV1rm1k90TAwD4huxu/gpF7eMHcF04jNDfnH2A=;
 b=Adf9/uDabysbO97VQCxegMuFHWIbw+k/X5FX4Vsxz0Y+j/VcL+5URcPHM/jpc4NJZyL8kTyY4
 yGmxTV2nxksDqRPybSI7d7nPcT9HN8BKUfsx8LBkoVWN5+6Gsr2vfOd
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

The code now inspects d->is_console flag to decide whether the console focus
should move to the domain w/ console after administrator presses <Ctrl+aaa>.

To do that max_init_domid is updated in domain_create().

Console owner domain switch logic updated accordingly.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/pv/shim.c     |  2 ++
 xen/common/domain.c        | 14 ++++++++++++++
 xen/drivers/char/console.c | 14 ++++++++++----
 3 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index 17cb30620290c76cf42251f70cfa4199c0e165d1..a55c1d2a1e616f8979677a198eb9caabc3afc6bf 100644
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
index d8f6829db50dabba7464004b39eea39f6970f800..56f5d3b2031c52d567bfcf839740600320d952e9 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -682,6 +682,8 @@ struct domain *domain_create(domid_t domid,
 
         old_hwdom = hardware_domain;
         hardware_domain = d;
+
+        d->is_console = true;
     }
 
     TRACE_TIME(TRC_DOM0_DOM_ADD, d->domain_id);
@@ -818,6 +820,18 @@ struct domain *domain_create(domid_t domid,
 
     memcpy(d->handle, config->handle, sizeof(d->handle));
 
+    /*
+     * Housekeeping for physical console forwarding to the domain.
+     */
+    if ( !is_system_domain(d) && max_init_domid < domid )
+        max_init_domid = domid;
+
+    /*
+     * NB: flag is already set for PV shim and hardware domain, check whether
+     * virtual UART is present.
+     */
+    d->is_console |= domain_has_vuart(d);
+
     return d;
 
  fail:
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 60c055396b697869b04b9132b0dcfa832fabe932..8cbac54c66044ae8581e486a782102b75c8bfaa9 100644
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
@@ -509,14 +509,20 @@ static void console_find_owner(void)
             domid = get_initial_domain_id();
         else
             domid = next_rx - 1;
+
         d = rcu_lock_domain_by_id(domid);
-        if ( d )
+        if ( d == NULL )
+            continue;
+
+        if ( d->is_console )
         {
             rcu_unlock_domain(d);
             console_owner = next_rx;
             printk("*** Serial input to DOM%u", domid);
             break;
         }
+
+        rcu_unlock_domain(d);
     }
 
     if ( switch_code )
@@ -814,7 +820,7 @@ static int printk_prefix_check(char *p, char **pp)
     return ((atomic_read(&print_everything) != 0) ||
             (loglvl < lower_thresh) ||
             ((loglvl < upper_thresh) && printk_ratelimit()));
-} 
+}
 
 static int cf_check parse_console_timestamps(const char *s)
 {

-- 
2.34.1



