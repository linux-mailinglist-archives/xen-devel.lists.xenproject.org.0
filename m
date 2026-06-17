Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oWtDJIyCMmrB1AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:18:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C9C698F32
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:18:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TIVyiLOP;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340085.1601115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHZ-0001aR-7j; Wed, 17 Jun 2026 11:18:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340085.1601115; Wed, 17 Jun 2026 11:18:09 +0000
Received: from [127.0.0.1] (helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHY-0001U3-UQ; Wed, 17 Jun 2026 11:18:08 +0000
Received: by outflank-mailman (input) for mailman id 1340085;
 Wed, 17 Jun 2026 11:18:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoHW-00016v-LV
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:18:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoHW-008nOJ-1k
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:18:06 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a32826d-5cb7-0a2a0a5109dd-0a2a450abe50-6
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:06 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a32826d-56b3-0a2a450a0019-d1558029c971-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:05 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-490ac10e337so38151505e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:18:05 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa3a8efsm151319985e9.2.2026.06.17.04.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 04:18:05 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781695085; x=1782299885; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FE9KGCs3R/Kgm74pFNvt+2bRqPcGSPft9+RP3relho=;
        b=TIVyiLOPLzU/498kZtSoKncGr3j4Teqmmvs6PklL8TghH6C/iKe6oVbG26KFgG5zFI
         baCIyK3ZO1Y8QSddwRxdBPr6Ioa7pNoFy4LCe9IFif9h3q/cSQlkVDOk3eaaWiOOmxYK
         IRc6TTUA0mt+iiLZ9FGgoxXWeoqgdBykLoXJUM+du/QIN8Vm1ZQzxCvms5xlUeFDh1Np
         fRPabtlCXCls9lMi4KOSjpzbzYaMWqLRmeTH1MsE+qhXvdEZGogWD1MN+CeZ/I6R4Dg/
         8w8Cy+nWHRlHdpbpd5qXC9tTXbZLTXUSSP7Q3H/A1hOSK3cw46GGlXtv6EO3+RAkMpah
         pIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695085; x=1782299885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4FE9KGCs3R/Kgm74pFNvt+2bRqPcGSPft9+RP3relho=;
        b=oEh8rReaj/oBh30bTg7YAgEEHlfYPYExOdFnvqyXpWQKJnmClILQPtcC4dCPo6y1io
         b2qQNt/iP8hY2UQiHWzAaLKy3xZ3Pps15c3fNfkjt+M23l+wzzxwPxbPac2baAcyQEuw
         2idPR/NTeqw60Zig19cSWzq4L5VNiLZ/F9sWWR5Nz9n7YAbVRZXv1K6HL4EvuCt50dLS
         1ZY3Ytzv9v6hzK7lHKBcxnUlHdxy7LUMOmcphJx1jNA2h476cXZETUZgOPdH1iuI0193
         tMFJCsgGJJ7zFwDQmJMm57/7j0NIgaieckQpaXN8ytvV0X/9BdwdhJf2UP9yN+qb7YQy
         V3fQ==
X-Gm-Message-State: AOJu0Yyd4WtTJyS9ax2UH6mx5Yu+A99vtPv1NiHThYd3PzQH2K/5TWNq
	HsWJpOCpeOSe6uqXrZlfg5nLaHXpS2/HWz/1yYArBmlSpxSc3RTYDfBYMkvtRA==
X-Gm-Gg: Acq92OGCqhry5xwMbTDJBspBRNlwuyyxhERsauqt0Ip9OzXPmSfniVi2IFh8q8xTO98
	cNzgLl4Ee0KHfEMrtmN4RdmuWwk8T2/Ru19GzUMYirjjgLm/0xU9PI+FGCL6CjNlrSTqRTPt0KZ
	USiqpN9D0k1Slb+T4XCUN1qdGmPj005y9lMULfoEp4gyXwDeqf8cVXXb/Z4JGHeKpI6GDEGnzs7
	dq+iOd0zaJ9Pqk4fX4ygvB6xwJ9PHOZWnp4K7XRE+GT0Xwah8uCHguETSiz/wGSC2dVUb1U82rQ
	Bgkudlj7XftZPNKUpyBuhV8oBSspMVWFv2u8Ybpw9AIBaw2UO9l+PHuLpDWndAp9DH3TH5xSfw5
	VD2zzqsMU6m8gDGdsOG7LGCq9CVs745DlIDWpLL0GpaBFRICsEeDpIoQgwq/VCEKa6cNtheQMwu
	jl6mJ56p5YfZQqtjs1OsEbV0XG5ZrIQxEN+VEnjSQ4YZ+TcrHVywPtyDirHw==
X-Received: by 2002:a05:600c:c04b:20b0:492:32ec:ca2c with SMTP id 5b1f17b1804b1-492333eb2fdmr49962255e9.26.1781695085307;
        Wed, 17 Jun 2026 04:18:05 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 05/23] xen/riscv: implement prerequisites for domain_create()
Date: Wed, 17 Jun 2026 13:17:33 +0200
Message-ID: <6785b861e192b9812f9a945bce19ff4b725a996d.1781693963.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1781693963.git.oleksii.kurochko@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1781695086-7F1948B7-6642F979/10/73395122804
X-purgate-type: spam
X-purgate-size: 2869
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34C9C698F32

arch_domain_create() and arch_sanitise_domain_config() are prerequisites for
domain_create().

arch_sanitise_domain_config() currently returns 0, as there is no specific
work required at this stage.

arch_domain_create() performs basic initialization, such as setting up the P2M
and initializing of next unused phandle.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Move arch_domain_destroy() from stubs.c to domain.c next to arch_domain_create().
 - Drop d->is_dying = DOMDYING_dead from arch_domain_create()'s fail label as domain_create() already does it.
 - Replace BUG_ON("unimplemented") with printk() in arch_domain_destroy().
---
Changes in v2:
 - update the commit message.
 - Drop vcpu_switch_to_aarch64_mode() from riscv/stubs. It shouldn't be under
   riscv/ at all.
 - Drop next_phandle as it is now in common code.
---
---
 xen/arch/riscv/domain.c | 29 +++++++++++++++++++++++++++++
 xen/arch/riscv/stubs.c  | 17 -----------------
 2 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index c77be3b827eb..2819ff4e7c92 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -289,6 +289,35 @@ void sync_vcpu_execstate(struct vcpu *v)
     /* Nothing to do -- no lazy switching */
 }
 
+int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
+{
+    return 0;
+}
+
+void arch_domain_destroy(struct domain *d)
+{
+    printk(XENLOG_WARNING "%s: unimplemented\n", __func__);
+}
+
+int arch_domain_create(struct domain *d,
+                       struct xen_domctl_createdomain *config,
+                       unsigned int flags)
+{
+    int rc = 0;
+
+    if ( is_idle_domain(d) )
+        return 0;
+
+    if ( (rc = p2m_init(d, config)) != 0)
+        goto fail;
+
+    return rc;
+
+ fail:
+    arch_domain_destroy(d);
+    return rc;
+}
+
 static void __init __maybe_unused build_assertions(void)
 {
     /*
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index acbb5b9123ea..3a7953593d93 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -101,28 +101,11 @@ void dump_pageframe_info(struct domain *d)
     BUG_ON("unimplemented");
 }
 
-int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
-{
-    BUG_ON("unimplemented");
-}
-
-int arch_domain_create(struct domain *d,
-                       struct xen_domctl_createdomain *config,
-                       unsigned int flags)
-{
-    BUG_ON("unimplemented");
-}
-
 int arch_domain_teardown(struct domain *d)
 {
     BUG_ON("unimplemented");
 }
 
-void arch_domain_destroy(struct domain *d)
-{
-    BUG_ON("unimplemented");
-}
-
 void arch_domain_shutdown(struct domain *d)
 {
     BUG_ON("unimplemented");
-- 
2.54.0


