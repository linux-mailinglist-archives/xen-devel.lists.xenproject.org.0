Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V82pFb7QS2osawEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D605E712EE5
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CCh6zxhC;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355519.1610402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliX-0002Vr-Ex; Mon, 06 Jul 2026 15:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355519.1610402; Mon, 06 Jul 2026 15:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliW-0002OI-6T; Mon, 06 Jul 2026 15:58:44 +0000
Received: by outflank-mailman (input) for mailman id 1355519;
 Mon, 06 Jul 2026 15:58:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wgliT-0001mr-AA
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:58:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgliS-003COz-NC
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:58:40 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd092-2eae-0a2a0a5409dd-0a2a4502b80a-46
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:40 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0b0-5a27-0a2a45020019-d1558029e442-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:40 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-493bc8fda98so35469985e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:58:40 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce03fa1sm284910325e9.11.2026.07.06.08.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:58:39 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783353520; x=1783958320; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHkgIPf46HKPOxJxqgCmDuDrFwFnSVGNxj+iOnJ7uQ0=;
        b=CCh6zxhC3iUas9wAlCoEZ9Q4JbJWYVcmSEunx7SjDLGNwxQ594Jz7o/FV7cYPdIZVL
         h5bVYyYgAmS2ADNl9a0Eb3fn+My+L+mktap4MPDy4l/BBXZIvSn+Q5PzGXKO7K8jMbj9
         kUEpEILaZaTpctWWCNEs1e1wn1wp5qG9Fc8gZK7jReg8Gn6NXULVyp4asw7zIaNiqco2
         fMguOjSwZkXn0+FekZomsDi80MMY70Lq8/yCk7BDNgJlnK/An4BD8zXaSfDx/wkqNjWC
         2lixyBrLEgEtJ6h8ryDaegP6mVeScTZ8eOFwboPg9jbmrwSxyo8Xp6n/sVDJx3I8jnJQ
         p9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353520; x=1783958320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FHkgIPf46HKPOxJxqgCmDuDrFwFnSVGNxj+iOnJ7uQ0=;
        b=IIIXWwjkOecRtqlDOSF0QeREPTyF0IFJanwDl7cWrOlkhq4Bj01xZ3pY1wPBxpUVcj
         NossPFXtAuwySvc4YMn5rxMSUWnKXjomhZdZo5ovJ7z/oiaF1kSWxoNGiV0XjHL+RM1N
         15R6QlMWQ9IOD84OJWRNerLxS811HaNO8umR9Fbh/Nmbn3HexF7yr+VbXWYSg5dKAg9w
         N1BD+ceXP8xpkFrn5saQGBUTf3rFu4PGMS1uUNclwjpboi1ps0Bha1zf5lrty5oWlOLH
         t2oUVqgqZ7DqlbzT7AWCPC6UXYc/CksJavLjeZVYoC/z5H81LjE9QDqeaGZ44MMMExkd
         mzow==
X-Gm-Message-State: AOJu0Yz5Wo9xc1/U/ZZXPbHFLQYlm+aB5B10TrRU1KqzndekQdSLzVZ2
	BRfHv/m95BHA6XBC53MPcyzGsjJaM1M7T85D8DfVOZD+5s2IwA1PQhexwoZr1Q==
X-Gm-Gg: AfdE7cnU4TN59wiKpRIpjRePMfjLSYvEjWmKFpz3e7OrK0m1TSW7lO6XlJ2SYYJ6jHP
	hd6uD3sEksrtTr+zkLbmp1rVoM41kc3Xp261/GIbajLp08FbnSuPXfMhnW8fieTRzA5gMd22G9U
	2U+auv8u9Zmigj/c8JPer+1yUzJDhWR88VwGW4q3c5Rbl7k3luZD2ODozrY2hy09ja3j34Uzz8Y
	ajsQW06TpWoB53tDZw7KrHm4kdk3F7/oSXOaMJyGyWF2MKq1f0e1mU0nvb3vCUxqSMmhAw7tqx2
	YP1bsD5hV00yokCvpR0XLOR+ozPUCYgg/HfWksytEPcKJ8uIzfeMmNizY3VelIPxb+bnjtYvxNA
	HdO7EGhuWMjruLj2nvt9ZbWbGKlm61WgTTyXFxfc2JUsOfQvtjBI4aDBTxzR4qGWC9IABuJTUFn
	enOIwINZb5WqqwytTtmRs9BOq2y+bn4sjOCcouZ9RAjgPjVxpCIE1IhGWbNw==
X-Received: by 2002:a05:600c:8b82:b0:493:bd2a:93bb with SMTP id 5b1f17b1804b1-493df038790mr14690605e9.3.1783353520093;
        Mon, 06 Jul 2026 08:58:40 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
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
Subject: [PATCH v5 16/26] xen/riscv: introduce per-vCPU IMSIC state
Date: Mon,  6 Jul 2026 17:57:57 +0200
Message-ID: <5d7e0342ac4eeb65defd58a923267c4b0f8029b7.1783331040.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783331040.git.oleksii.kurochko@gmail.com>
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1783353520-4D50C7C5-F6A1770B/10/73395122804
X-purgate-type: spam
X-purgate-size: 6433
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
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,gmail.com,wdc.com,citrix.com,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
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
X-Rspamd-Queue-Id: D605E712EE5

Each vCPU interacting with the IMSIC requires state to track the
associated guest interrupt file and its backing context.

Introduce a per-vCPU structure to hold IMSIC-related state, including
the guest interrupt file identifier and the CPU providing the backing
VS-file. Access to the guest file identifier is protected by a lock.

Initialize this structure during vCPU setup and store it in arch_vcpu.
The initial state marks the VS-file as software-backed until it becomes
associated with a physical CPU.

Add helper to retrieve the guest interrupt file identifier:
- vcpu_guest_file_id() is going to be used during update of APLIC's
  target register with the pair of information <guest_file_id, cpu_id>
  (to have MSI delivery mode work properly) when guest is trying to
  access vAPLIC's target register.
It will be used in the follow up patches.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5:
 - Move v->arch.vimsic_state = imsic_state; after full initialization of
   the struct, so the pointer only becomes globally visible once all
   fields are set up.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v4:
-  s/w vs h/w IMSIC VS-file commentary for struct vimsic_state:
   - fix the vsfile_pcpu h/w condition:
     "vsfile_pcpu >= 0" -> "vsfile_pcpu < NR_CPUS"
     (the old wording conflicted with the s/w "== NR_CPUS" case).
   - reorder both comment blocks to the "s/w ... / h/w ..." form for readability.
 - drop IMPOSSIBLE_GUEST_FILE_ID: the s/w IMSIC VS-file is always available
   and corresponds to guest_file_id == 0, which xvzalloc() already provides,
   so the explicit initializer in vcpu_imsic_init() and the macro itself
   are unneeded.
---
Changes in v3:
 - Drop const from imsic_set_guest_file_id() and vcpu_imsic_deinit() as
   it only works due to vimsic_state being a pointer member.
 - Use XVFREE() in vcpu_imsic_deinit() to make it idempotent.
 - Fix SW-file typo in struct vimsic_state comments; should be VS-file.
 - Drop imsic_set_guest_file_id() here, it will be added later when it
   will be nessary to initialise guest file id as the correspondendt code
   in this patch series was reworked and there is no need to use this
   function in arch_vcpu_create().
 - Introduce IMPOSSIBLE_GUEST_FILE_ID and init with it ->guest_file_id.
---
Changes in v2:
 - Rename imsic_state to vimsic_state.
 - Use 'unsigned int' for vsfile_pcpu.
 - Drop initialzation of ->guest_file_id as it will be by default zero.
 - Add the comment about ->guest_file_id field.
 - Drop __init for vcpu_imsic_init() as it could be used during post-boot
   vCPU creation.
 - Update the commit message.
 - Drop locks around ->guest_file_id() in  vcpu_guest_file_id() and imsic_set_guest_file_id().
---
---
 xen/arch/riscv/imsic.c              | 35 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/domain.h |  2 ++
 xen/arch/riscv/include/asm/imsic.h  | 22 ++++++++++++++++++
 3 files changed, 59 insertions(+)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index f7b70a8da09e..5a5758e45dc2 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -16,6 +16,7 @@
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/macros.h>
+#include <xen/sched.h>
 #include <xen/smp.h>
 #include <xen/spinlock.h>
 #include <xen/xvmalloc.h>
@@ -56,6 +57,11 @@ do {                            \
     csr_clear(CSR_SIREG, v);    \
 } while (0)
 
+unsigned int vcpu_guest_file_id(const struct vcpu *v)
+{
+    return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
+}
+
 void __init imsic_ids_local_delivery(bool enable)
 {
     if ( enable )
@@ -312,6 +318,35 @@ static int imsic_parse_node(const struct dt_device_node *node,
     return 0;
 }
 
+int vcpu_imsic_init(struct vcpu *v)
+{
+    struct vimsic_state *imsic_state;
+
+    /* Allocate IMSIC context */
+    imsic_state = xvzalloc(struct vimsic_state);
+    if ( !imsic_state )
+        return -ENOMEM;
+
+    /* Setup IMSIC context  */
+    rwlock_init(&imsic_state->vsfile_lock);
+
+    /*
+     * xvzalloc() already cleared the context, so guest_file_id == 0, i.e. the
+     * always-available s/w IMSIC VS-file. Only vsfile_pcpu needs an explicit
+     * initializer as its s/w VS-file value is NR_CPUS rather than 0.
+     */
+    imsic_state->vsfile_pcpu = NR_CPUS;
+
+    v->arch.vimsic_state = imsic_state;
+
+    return 0;
+}
+
+void vcpu_imsic_deinit(struct vcpu *v)
+{
+    XVFREE(v->arch.vimsic_state);
+}
+
 /*
  * Initialize the imsic_cfg structure based on the IMSIC DT node.
  *
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index bdc6086a1752..a0f681e25c33 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -54,6 +54,8 @@ struct arch_vcpu {
 
     struct vtimer vtimer;
 
+    struct vimsic_state *vimsic_state;
+
     register_t hcounteren;
     register_t hedeleg;
     register_t hideleg;
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index c6c59215df20..e2c413487d24 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -11,6 +11,7 @@
 #ifndef ASM_RISCV_IMSIC_H
 #define ASM_RISCV_IMSIC_H
 
+#include <xen/rwlock.h>
 #include <xen/spinlock.h>
 #include <xen/stdbool.h>
 #include <xen/types.h>
@@ -61,7 +62,24 @@ struct imsic_config {
     spinlock_t lock;
 };
 
+struct vimsic_state {
+    /* IMSIC VS-file */
+    rwlock_t vsfile_lock;
+    /*
+     * s/w IMSIC VS-file -> guest_file_id == 0
+     * h/w IMSIC VS-file -> guest_file_id > 0
+     */
+    unsigned int guest_file_id;
+    /*
+     * s/w IMSIC VS-file -> vsfile_pcpu == NR_CPUS
+     * h/w IMSIC VS-file -> vsfile_pcpu < NR_CPUS
+     */
+    unsigned int vsfile_pcpu;
+};
+
 struct dt_device_node;
+struct vcpu;
+
 int imsic_init(const struct dt_device_node *node);
 
 const struct imsic_config *imsic_get_config(void);
@@ -71,4 +89,8 @@ void imsic_irq_disable(unsigned int hwirq);
 
 void imsic_ids_local_delivery(bool enable);
 
+int vcpu_imsic_init(struct vcpu *v);
+void vcpu_imsic_deinit(struct vcpu *v);
+unsigned int vcpu_guest_file_id(const struct vcpu *v);
+
 #endif /* ASM_RISCV_IMSIC_H */
-- 
2.54.0


