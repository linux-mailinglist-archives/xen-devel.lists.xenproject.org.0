Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6776AA56177
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 08:05:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904604.1312456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqRlk-00036v-O3; Fri, 07 Mar 2025 07:05:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904604.1312456; Fri, 07 Mar 2025 07:05:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqRlk-00035T-LE; Fri, 07 Mar 2025 07:05:16 +0000
Received: by outflank-mailman (input) for mailman id 904604;
 Fri, 07 Mar 2025 07:05:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uQHP=V2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tqRli-00035L-UJ
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 07:05:14 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82fc4e90-fb22-11ef-9ab5-95dc52dad729;
 Fri, 07 Mar 2025 08:05:11 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 45C431F766;
 Fri,  7 Mar 2025 07:05:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C3BCF13939;
 Fri,  7 Mar 2025 07:05:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id DXxSLqaaymdDGgAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 07 Mar 2025 07:05:10 +0000
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
X-Inumbo-ID: 82fc4e90-fb22-11ef-9ab5-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741331111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IzTrtNRwD750t1JBnHw9fIxPCdnuvWII1rgrzMHkIbY=;
	b=n8ykz+wGFLaGSUPa5okgW9Z/3JEYTIJ4nK30DxlSD3+NpDmUo2FE+RnsBbYan09yQ9Dhiz
	bRgpXO1CYf7SnTTnEAyIvEcvtZ0jn5tQHIitMmPobv8166CWXzhKvNdNCIYfiMm/PHHwk/
	hNIgq32euU2q1SZbv34XDu6S0qBdbs8=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741331111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IzTrtNRwD750t1JBnHw9fIxPCdnuvWII1rgrzMHkIbY=;
	b=n8ykz+wGFLaGSUPa5okgW9Z/3JEYTIJ4nK30DxlSD3+NpDmUo2FE+RnsBbYan09yQ9Dhiz
	bRgpXO1CYf7SnTTnEAyIvEcvtZ0jn5tQHIitMmPobv8166CWXzhKvNdNCIYfiMm/PHHwk/
	hNIgq32euU2q1SZbv34XDu6S0qBdbs8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] xen/events: fix global virq handling
Date: Fri,  7 Mar 2025 08:05:07 +0100
Message-ID: <20250307070507.30102-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[suse.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,raptorengineering.com,wdc.com,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 

VIRQs are split into "global" and "per vcpu" ones. Unfortunately in
reality there are "per domain" ones, too.

send_global_virq() and set_global_virq_handler() make only sense for
the real "global" ones, so replace virq_is_global() with a new
function get_virq_type() returning one of the 3 possible types (global,
domain, vcpu VIRQ).

Fixes: 980822c5edd1 ("xen/events: allow setting of global virq handler only for unbound virqs")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
As I don't have much time today (I'm having a day off), only compile
tested. Please try a CI run with this patch before applying!

 xen/arch/arm/include/asm/event.h   |  4 ++--
 xen/arch/ppc/include/asm/event.h   |  4 ++--
 xen/arch/riscv/include/asm/event.h |  4 ++--
 xen/arch/x86/include/asm/event.h   |  6 +++---
 xen/common/event_channel.c         | 34 +++++++++++++++++-------------
 xen/include/xen/sched.h            |  6 ++++++
 6 files changed, 34 insertions(+), 24 deletions(-)

diff --git a/xen/arch/arm/include/asm/event.h b/xen/arch/arm/include/asm/event.h
index b14c166ad6..509157b2b3 100644
--- a/xen/arch/arm/include/asm/event.h
+++ b/xen/arch/arm/include/asm/event.h
@@ -47,9 +47,9 @@ static inline void local_event_delivery_enable(void)
 }
 
 /* No arch specific virq definition now. Default to global. */
-static inline bool arch_virq_is_global(unsigned int virq)
+static inline enum virq_type arch_get_virq_type(unsigned int virq)
 {
-    return true;
+    return VIRQ_GLOBAL;
 }
 
 #endif
diff --git a/xen/arch/ppc/include/asm/event.h b/xen/arch/ppc/include/asm/event.h
index 1b95ee4f61..0f475c4b89 100644
--- a/xen/arch/ppc/include/asm/event.h
+++ b/xen/arch/ppc/include/asm/event.h
@@ -17,9 +17,9 @@ static inline int vcpu_event_delivery_is_enabled(struct vcpu *v)
 }
 
 /* No arch specific virq definition now. Default to global. */
-static inline bool arch_virq_is_global(unsigned int virq)
+static inline enum virq_type arch_get_virq_type(unsigned int virq)
 {
-    return true;
+    return VIRQ_GLOBAL;
 }
 
 static inline int local_events_need_delivery(void)
diff --git a/xen/arch/riscv/include/asm/event.h b/xen/arch/riscv/include/asm/event.h
index c7bb8c0fa6..116434c665 100644
--- a/xen/arch/riscv/include/asm/event.h
+++ b/xen/arch/riscv/include/asm/event.h
@@ -24,9 +24,9 @@ static inline void local_event_delivery_enable(void)
 }
 
 /* No arch specific virq definition now. Default to global. */
-static inline bool arch_virq_is_global(unsigned int virq)
+static inline enum virq_type arch_get_virq_type(unsigned int virq)
 {
-    return true;
+    return VIRQ_GLOBAL;
 }
 
 #endif /* ASM__RISCV__EVENT_H */
diff --git a/xen/arch/x86/include/asm/event.h b/xen/arch/x86/include/asm/event.h
index 5e09ede6d7..434f65007e 100644
--- a/xen/arch/x86/include/asm/event.h
+++ b/xen/arch/x86/include/asm/event.h
@@ -41,10 +41,10 @@ static inline void local_event_delivery_enable(void)
     vcpu_info(current, evtchn_upcall_mask) = 0;
 }
 
-/* No arch specific virq definition now. Default to global. */
-static inline bool arch_virq_is_global(unsigned int virq)
+/* Only global arch specific virq definitions. */
+static inline enum virq_type arch_get_virq_type(unsigned int virq)
 {
-    return true;
+    return VIRQ_GLOBAL;
 }
 
 #ifdef CONFIG_PV_SHIM
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index c68aa97135..0fcdec8a40 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -127,7 +127,7 @@ static struct domain *get_global_virq_handler(unsigned int virq)
     return global_virq_handlers[virq] ?: hardware_domain;
 }
 
-static bool virq_is_global(unsigned int virq)
+static enum virq_type get_virq_type(unsigned int virq)
 {
     switch ( virq )
     {
@@ -135,14 +135,17 @@ static bool virq_is_global(unsigned int virq)
     case VIRQ_DEBUG:
     case VIRQ_XENOPROF:
     case VIRQ_XENPMU:
-        return false;
+        return VIRQ_VCPU;
+
+    case VIRQ_ARGO:
+        return VIRQ_DOMAIN;
 
     case VIRQ_ARCH_0 ... VIRQ_ARCH_7:
-        return arch_virq_is_global(virq);
+        return arch_get_virq_type(virq);
     }
 
     ASSERT(virq < NR_VIRQS);
-    return true;
+    return VIRQ_GLOBAL;
 }
 
 static struct evtchn *_evtchn_from_port(const struct domain *d,
@@ -476,7 +479,7 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
     struct domain *d = current->domain;
     int            virq = bind->virq, vcpu = bind->vcpu;
     int            rc = 0;
-    bool           is_global;
+    enum virq_type type;
 
     if ( (virq < 0) || (virq >= ARRAY_SIZE(v->virq_to_evtchn)) )
         return -EINVAL;
@@ -486,9 +489,9 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
     * speculative execution.
     */
     virq = array_index_nospec(virq, ARRAY_SIZE(v->virq_to_evtchn));
-    is_global = virq_is_global(virq);
+    type = get_virq_type(virq);
 
-    if ( is_global && vcpu != 0 )
+    if ( type != VIRQ_VCPU && vcpu != 0 )
         return -EINVAL;
 
     if ( (v = domain_vcpu(d, vcpu)) == NULL )
@@ -496,7 +499,7 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
 
     write_lock(&d->event_lock);
 
-    if ( is_global && get_global_virq_handler(virq) != d )
+    if ( type == VIRQ_GLOBAL && get_global_virq_handler(virq) != d )
     {
         rc = -EBUSY;
         goto out;
@@ -756,7 +759,8 @@ int evtchn_close(struct domain *d1, int port1, bool guest)
         if ( chn1->u.virq == VIRQ_DOM_EXC )
             domain_deinit_states(d1);
 
-        v = d1->vcpu[virq_is_global(chn1->u.virq) ? 0 : chn1->notify_vcpu_id];
+        v = d1->vcpu[get_virq_type(chn1->u.virq) != VIRQ_VCPU
+            ? 0 : chn1->notify_vcpu_id];
 
         write_lock_irqsave(&v->virq_lock, flags);
         ASSERT(read_atomic(&v->virq_to_evtchn[chn1->u.virq]) == port1);
@@ -900,7 +904,7 @@ bool evtchn_virq_enabled(const struct vcpu *v, unsigned int virq)
     if ( !v )
         return false;
 
-    if ( virq_is_global(virq) && v->vcpu_id )
+    if ( get_virq_type(virq) != VIRQ_VCPU && v->vcpu_id )
         v = domain_vcpu(v->domain, 0);
 
     return read_atomic(&v->virq_to_evtchn[virq]);
@@ -913,7 +917,7 @@ void send_guest_vcpu_virq(struct vcpu *v, uint32_t virq)
     struct domain *d;
     struct evtchn *chn;
 
-    ASSERT(!virq_is_global(virq));
+    ASSERT(get_virq_type(virq) == VIRQ_VCPU);
 
     read_lock_irqsave(&v->virq_lock, flags);
 
@@ -940,7 +944,7 @@ void send_guest_global_virq(struct domain *d, uint32_t virq)
     struct vcpu *v;
     struct evtchn *chn;
 
-    ASSERT(virq_is_global(virq));
+    ASSERT(get_virq_type(virq) != VIRQ_VCPU);
 
     if ( unlikely(d == NULL) || unlikely(d->vcpu == NULL) )
         return;
@@ -995,7 +999,7 @@ static DEFINE_SPINLOCK(global_virq_handlers_lock);
 
 void send_global_virq(uint32_t virq)
 {
-    ASSERT(virq_is_global(virq));
+    ASSERT(get_virq_type(virq) == VIRQ_GLOBAL);
 
     send_guest_global_virq(get_global_virq_handler(virq), virq);
 }
@@ -1008,7 +1012,7 @@ int set_global_virq_handler(struct domain *d, uint32_t virq)
 
     if (virq >= NR_VIRQS)
         return -EINVAL;
-    if (!virq_is_global(virq))
+    if (get_virq_type(virq) != VIRQ_GLOBAL)
         return -EINVAL;
 
     if (global_virq_handlers[virq] == d)
@@ -1204,7 +1208,7 @@ int evtchn_bind_vcpu(evtchn_port_t port, unsigned int vcpu_id)
     switch ( chn->state )
     {
     case ECS_VIRQ:
-        if ( virq_is_global(chn->u.virq) )
+        if ( get_virq_type(chn->u.virq) != VIRQ_VCPU )
             chn->notify_vcpu_id = v->vcpu_id;
         else
             rc = -EINVAL;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index ea63ca1c79..43bc4da0e2 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -84,6 +84,12 @@ extern domid_t hardware_domid;
 #define XEN_CONSUMER_BITS 3
 #define NR_XEN_CONSUMERS ((1 << XEN_CONSUMER_BITS) - 1)
 
+enum virq_type {
+    VIRQ_GLOBAL,
+    VIRQ_DOMAIN,
+    VIRQ_VCPU
+};
+
 struct evtchn
 {
     rwlock_t lock;
-- 
2.43.0


