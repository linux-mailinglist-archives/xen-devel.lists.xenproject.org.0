Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E03D8A03C0E
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 11:18:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866262.1277606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV6eg-0003wA-Re; Tue, 07 Jan 2025 10:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866262.1277606; Tue, 07 Jan 2025 10:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV6eg-0003tU-Km; Tue, 07 Jan 2025 10:17:46 +0000
Received: by outflank-mailman (input) for mailman id 866262;
 Tue, 07 Jan 2025 10:17:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qdqe=T7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tV6ee-00022t-LG
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 10:17:44 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a205886e-cce0-11ef-a0df-8be0dac302b0;
 Tue, 07 Jan 2025 11:17:43 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 301C721111;
 Tue,  7 Jan 2025 10:17:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D045413763;
 Tue,  7 Jan 2025 10:17:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yJBUMUb/fGcZYgAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 07 Jan 2025 10:17:42 +0000
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
X-Inumbo-ID: a205886e-cce0-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1736245063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mnyb1VTsPzRYzo1crPy1xQ6Z7waAvUFyhIHQGke0Ywk=;
	b=Dq1eNPpp+/CUmUUMh7KiPdoD+UykoT9A+syPOqyS1Pe1RzS/Z2c/MrEebypkCprIYLsk9D
	2OnT/Exn830W9f33GOE/bvm9PG7SchXvCVxRUmxjy7ZUSKRRZWlfQWkdocTOMI9bO7AvS/
	hxHoSK39mmzoa+5cL0o9WwWKPoO966U=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1736245063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mnyb1VTsPzRYzo1crPy1xQ6Z7waAvUFyhIHQGke0Ywk=;
	b=Dq1eNPpp+/CUmUUMh7KiPdoD+UykoT9A+syPOqyS1Pe1RzS/Z2c/MrEebypkCprIYLsk9D
	2OnT/Exn830W9f33GOE/bvm9PG7SchXvCVxRUmxjy7ZUSKRRZWlfQWkdocTOMI9bO7AvS/
	hxHoSK39mmzoa+5cL0o9WwWKPoO966U=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 5/7] xen: add new domctl get_changed_domain
Date: Tue,  7 Jan 2025 11:17:09 +0100
Message-ID: <20250107101711.5980-6-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107101711.5980-1-jgross@suse.com>
References: <20250107101711.5980-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLme6mccyyenyxxgt1bwti8hnf)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Add a new domctl sub-function to get data of a domain having changed
state (this is needed by Xenstore).

The returned state just contains the domid, the domain unique id,
and some flags (existing, shutdown, dying).

In order to enable Xenstore stubdom being built for multiple Xen
versions, make this domctl stable.  For stable domctls the
interface_version is always 0.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
V1:
- use a domctl subop for the new interface (Jan Beulich)
V2:
- fix XSM hooks (Daniel P. Smith)
- remove versioning of stable sub-ops (Jan Beulich)
- use domctl.domain for retuning domid of a changed domain (Jan Beulich)
- simplify locking in get_domain_state() (Jan Beulich)
- undo stray change in event_channel.c (Jan Beulich)
V3:
- have disjunct states "dying" and "dead" (Jan Beulich)
- check padding fields to be 0 (Jan Beulich)
- drop memset() (Jan Beulich)
V4:
- add locking in get_domain_state() (Jan Beulich)
- only allow querying domain having changed state by domain receiving
  VIRQ_DOM_EXC events (Jan Beulich)
V5:
- use memset() (Jan Beulich)
---
 tools/flask/policy/modules/dom0.te     |  2 +-
 tools/flask/policy/modules/xen.if      |  4 +-
 tools/flask/policy/modules/xenstore.te |  1 +
 xen/common/domain.c                    | 70 ++++++++++++++++++++++++++
 xen/common/domctl.c                    | 18 ++++++-
 xen/common/event_channel.c             |  9 +++-
 xen/include/public/domctl.h            | 26 ++++++++++
 xen/include/xen/event.h                |  7 +++
 xen/include/xen/sched.h                |  2 +
 xen/include/xsm/dummy.h                |  8 +++
 xen/include/xsm/xsm.h                  |  6 +++
 xen/xsm/dummy.c                        |  1 +
 xen/xsm/flask/hooks.c                  |  7 +++
 xen/xsm/flask/policy/access_vectors    |  2 +
 14 files changed, 158 insertions(+), 5 deletions(-)

diff --git a/tools/flask/policy/modules/dom0.te b/tools/flask/policy/modules/dom0.te
index 16b8c9646d..6043c01b12 100644
--- a/tools/flask/policy/modules/dom0.te
+++ b/tools/flask/policy/modules/dom0.te
@@ -40,7 +40,7 @@ allow dom0_t dom0_t:domain {
 };
 allow dom0_t dom0_t:domain2 {
 	set_cpu_policy gettsc settsc setscheduler set_vnumainfo
-	get_vnumainfo psr_cmt_op psr_alloc get_cpu_policy
+	get_vnumainfo psr_cmt_op psr_alloc get_cpu_policy get_domain_state
 };
 allow dom0_t dom0_t:resource { add remove };
 
diff --git a/tools/flask/policy/modules/xen.if b/tools/flask/policy/modules/xen.if
index 11c1562aa5..2e06f3ed94 100644
--- a/tools/flask/policy/modules/xen.if
+++ b/tools/flask/policy/modules/xen.if
@@ -54,7 +54,7 @@ define(`create_domain_common', `
 	allow $1 $2:domain2 { set_cpu_policy settsc setscheduler setclaim
 			set_vnumainfo get_vnumainfo cacheflush
 			psr_cmt_op psr_alloc soft_reset
-			resource_map get_cpu_policy };
+			resource_map get_cpu_policy get_domain_state };
 	allow $1 $2:security check_context;
 	allow $1 $2:shadow enable;
 	allow $1 $2:mmu { map_read map_write adjust memorymap physmap pinpage mmuext_op updatemp };
@@ -94,7 +94,7 @@ define(`manage_domain', `
 			getaddrsize pause unpause trigger shutdown destroy
 			setaffinity setdomainmaxmem getscheduler resume
 			setpodtarget getpodtarget getpagingmempool setpagingmempool };
-    allow $1 $2:domain2 set_vnumainfo;
+    allow $1 $2:domain2 { set_vnumainfo get_domain_state };
 ')
 
 # migrate_domain_out(priv, target)
diff --git a/tools/flask/policy/modules/xenstore.te b/tools/flask/policy/modules/xenstore.te
index 519566ab81..49de53ebe2 100644
--- a/tools/flask/policy/modules/xenstore.te
+++ b/tools/flask/policy/modules/xenstore.te
@@ -13,6 +13,7 @@ allow dom0_t xenstore_t:domain set_virq_handler;
 allow xenstore_t xen_t:xen writeconsole;
 # Xenstore queries domaininfo on all domains
 allow xenstore_t domain_type:domain getdomaininfo;
+allow xenstore_t domain_type:domain2 get_domain_state;
 
 # As a shortcut, the following 3 rules are used instead of adding a domain_comms
 # rule between xenstore_t and every domain type that talks to xenstore
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 78e2732e94..783a79e447 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -185,6 +185,76 @@ static void domain_changed_state(const struct domain *d)
     unlock_dom_exc_handler(hdl);
 }
 
+static void set_domain_state_info(struct xen_domctl_get_domain_state *info,
+                                  const struct domain *d)
+{
+    info->state = XEN_DOMCTL_GETDOMSTATE_STATE_EXIST;
+    if ( d->is_shut_down )
+        info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_SHUTDOWN;
+    if ( d->is_dying == DOMDYING_dying )
+        info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DYING;
+    if ( d->is_dying == DOMDYING_dead )
+        info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DEAD;
+    info->unique_id = d->unique_id;
+}
+
+int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
+                     domid_t *domid)
+{
+    unsigned int dom;
+    int rc = -ENOENT;
+    struct domain *hdl;
+
+    if ( info->pad0 || info->pad1 )
+        return -EINVAL;
+
+    if ( d )
+    {
+        set_domain_state_info(info, d);
+
+        return 0;
+    }
+
+    /*
+     * Only domain registered for VIRQ_DOM_EXC event is allowed to query
+     * domains having changed state.
+     */
+    if ( !domain_handles_global_virq(current->domain, VIRQ_DOM_EXC) )
+        return -EACCES;
+
+    hdl = lock_dom_exc_handler();
+
+    while ( dom_state_changed )
+    {
+        dom = find_first_bit(dom_state_changed, DOMID_MASK + 1);
+        if ( dom >= DOMID_FIRST_RESERVED )
+            break;
+        if ( test_and_clear_bit(dom, dom_state_changed) )
+        {
+            *domid = dom;
+
+            d = rcu_lock_domain_by_id(dom);
+
+            if ( d )
+            {
+                set_domain_state_info(info, d);
+
+                rcu_unlock_domain(d);
+            }
+            else
+                memset(info, 0, sizeof(*info));
+
+            rc = 0;
+
+            break;
+        }
+    }
+
+    unlock_dom_exc_handler(hdl);
+
+    return rc;
+}
+
 static void __domain_finalise_shutdown(struct domain *d)
 {
     struct vcpu *v;
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 05abb581a0..b897ca8723 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -279,6 +279,11 @@ static struct vnuma_info *vnuma_init(const struct xen_domctl_vnuma *uinfo,
     return ERR_PTR(ret);
 }
 
+static bool is_stable_domctl(uint32_t cmd)
+{
+    return cmd == XEN_DOMCTL_get_domain_state;
+}
+
 long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
     long ret = 0;
@@ -289,7 +294,8 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
     if ( copy_from_guest(op, u_domctl, 1) )
         return -EFAULT;
 
-    if ( op->interface_version != XEN_DOMCTL_INTERFACE_VERSION )
+    if ( op->interface_version !=
+         (is_stable_domctl(op->cmd) ? 0 : XEN_DOMCTL_INTERFACE_VERSION) )
         return -EACCES;
 
     switch ( op->cmd )
@@ -310,6 +316,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         fallthrough;
     case XEN_DOMCTL_test_assign_device:
     case XEN_DOMCTL_vm_event_op:
+    case XEN_DOMCTL_get_domain_state:
         if ( op->domain == DOMID_INVALID )
         {
             d = NULL;
@@ -876,6 +883,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             ret = -EOPNOTSUPP;
         break;
 
+    case XEN_DOMCTL_get_domain_state:
+        ret = xsm_get_domain_state(XSM_XS_PRIV, d);
+        if ( ret )
+            break;
+
+        copyback = 1;
+        ret = get_domain_state(&op->u.get_domain_state, d, &op->domain);
+        break;
+
     default:
         ret = arch_do_domctl(op, d, u_domctl);
         break;
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index c247efc4b1..ed55f73648 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -997,6 +997,13 @@ void send_global_virq(uint32_t virq)
     send_guest_global_virq(get_global_virq_handler(virq), virq);
 }
 
+bool domain_handles_global_virq(const struct domain *d, uint32_t virq)
+{
+    ASSERT(virq_is_global(virq));
+
+    return get_global_virq_handler(virq) == d;
+}
+
 int set_global_virq_handler(struct domain *d, uint32_t virq)
 {
     struct domain *old, *hdl;
@@ -1008,7 +1015,7 @@ int set_global_virq_handler(struct domain *d, uint32_t virq)
     if (!virq_is_global(virq))
         return -EINVAL;
 
-    if (global_virq_handlers[virq] == d)
+    if ( domain_handles_global_virq(d, virq) )
         return 0;
 
     if (unlikely(!get_domain(d)))
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index e2d392d1e5..5b2063eed9 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -28,6 +28,7 @@
  * Pure additions (e.g. new sub-commands) or compatible interface changes
  * (e.g. adding semantics to 0-checked input fields or data to zeroed output
  * fields) don't require a change of the version.
+ * Stable ops are NOT covered by XEN_DOMCTL_INTERFACE_VERSION!
  *
  * Last version bump: Xen 4.19
  */
@@ -1243,7 +1244,30 @@ struct xen_domctl_set_llc_colors {
     XEN_GUEST_HANDLE_64(uint32) llc_colors;
 };
 
+/*
+ * XEN_DOMCTL_get_domain_state (stable interface)
+ *
+ * Get state information of a domain.
+ *
+ * In case domain is DOMID_INVALID, return information about a domain having
+ * changed state and reset the state change indicator for that domain. This
+ * function is usable only by a domain having registered the VIRQ_DOM_EXC
+ * event (normally Xenstore).
+ * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
+ */
+struct xen_domctl_get_domain_state {
+    uint16_t state;
+#define XEN_DOMCTL_GETDOMSTATE_STATE_EXIST     0x0001  /* Domain is existing. */
+#define XEN_DOMCTL_GETDOMSTATE_STATE_SHUTDOWN  0x0002  /* Shutdown finished. */
+#define XEN_DOMCTL_GETDOMSTATE_STATE_DYING     0x0004  /* Domain dying. */
+#define XEN_DOMCTL_GETDOMSTATE_STATE_DEAD      0x0008  /* Domain dead. */
+    uint16_t pad0;           /* Must be 0 on input, returned as 0. */
+    uint32_t pad1;           /* Must be 0 on input, returned as 0. */
+    uint64_t unique_id;      /* Unique domain identifier. */
+};
+
 struct xen_domctl {
+/* Stable domctl ops: interface_version is required to be 0.  */
     uint32_t cmd;
 #define XEN_DOMCTL_createdomain                   1
 #define XEN_DOMCTL_destroydomain                  2
@@ -1333,6 +1357,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_dt_overlay                    87
 #define XEN_DOMCTL_gsi_permission                88
 #define XEN_DOMCTL_set_llc_colors                89
+#define XEN_DOMCTL_get_domain_state              90 /* stable interface */
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1400,6 +1425,7 @@ struct xen_domctl {
         struct xen_domctl_dt_overlay        dt_overlay;
 #endif
         struct xen_domctl_set_llc_colors    set_llc_colors;
+        struct xen_domctl_get_domain_state  get_domain_state;
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
index 5c0ba90c9f..ae02012cc5 100644
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -36,6 +36,13 @@ void send_global_virq(uint32_t virq);
  */
 void send_guest_global_virq(struct domain *d, uint32_t virq);
 
+/*
+ * domain_handles_global_virq:
+ *  @d:        Suspected target domain for this VIRQ
+ *  @virq:     Virtual IRQ number (VIRQ_*), must be global
+ */
+bool domain_handles_global_virq(const struct domain *d, uint32_t virq);
+
 /*
  * sent_global_virq_handler: Set a global VIRQ handler.
  *  @d:        New target domain for this VIRQ
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 9d9b89ec27..ea63ca1c79 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -807,6 +807,8 @@ int domain_soft_reset(struct domain *d, bool resuming);
 
 int domain_init_states(void);
 void domain_deinit_states(const struct domain *d);
+int get_domain_state(struct xen_domctl_get_domain_state *info,
+                     struct domain *d, domid_t *domid);
 
 int vcpu_start_shutdown_deferral(struct vcpu *v);
 void vcpu_end_shutdown_deferral(struct vcpu *v);
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 6a2fc33c3b..a8d06de6b0 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -173,6 +173,7 @@ static XSM_INLINE int cf_check xsm_domctl(
     case XEN_DOMCTL_unbind_pt_irq:
         return xsm_default_action(XSM_DM_PRIV, current->domain, d);
     case XEN_DOMCTL_getdomaininfo:
+    case XEN_DOMCTL_get_domain_state:
         return xsm_default_action(XSM_XS_PRIV, current->domain, d);
     default:
         return xsm_default_action(XSM_PRIV, current->domain, d);
@@ -815,6 +816,13 @@ static XSM_INLINE int cf_check xsm_argo_send(
 
 #endif /* CONFIG_ARGO */
 
+static XSM_INLINE int cf_check xsm_get_domain_state(
+    XSM_DEFAULT_ARG struct domain *d)
+{
+    XSM_ASSERT_ACTION(XSM_XS_PRIV);
+    return xsm_default_action(action, current->domain, d);
+}
+
 #include <public/version.h>
 static XSM_INLINE int cf_check xsm_xen_version(XSM_DEFAULT_ARG uint32_t op)
 {
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 4dbff9d866..0689bf5c9f 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -200,6 +200,7 @@ struct xsm_ops {
     int (*argo_register_any_source)(const struct domain *d);
     int (*argo_send)(const struct domain *d, const struct domain *t);
 #endif
+    int (*get_domain_state)(struct domain *d);
 };
 
 #ifdef CONFIG_XSM
@@ -774,6 +775,11 @@ static inline int xsm_argo_send(const struct domain *d, const struct domain *t)
 
 #endif /* CONFIG_ARGO */
 
+static inline int xsm_get_domain_state(struct domain *d)
+{
+    return alternative_call(xsm_ops.get_domain_state, d);
+}
+
 #endif /* XSM_NO_WRAPPERS */
 
 #ifdef CONFIG_MULTIBOOT
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index e6ffa948f7..ce6fbdc6c5 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -148,6 +148,7 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .argo_register_any_source      = xsm_argo_register_any_source,
     .argo_send                     = xsm_argo_send,
 #endif
+    .get_domain_state              = xsm_get_domain_state,
 };
 
 void __init xsm_fixup_ops(struct xsm_ops *ops)
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 2b4efde689..f126e50b92 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -688,6 +688,7 @@ static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
     case XEN_DOMCTL_memory_mapping:
     case XEN_DOMCTL_set_target:
     case XEN_DOMCTL_vm_event_op:
+    case XEN_DOMCTL_get_domain_state:
 
     /* These have individual XSM hooks (arch/../domctl.c) */
     case XEN_DOMCTL_bind_pt_irq:
@@ -1860,6 +1861,11 @@ static int cf_check flask_argo_send(
 
 #endif
 
+static int cf_check flask_get_domain_state(struct domain *d)
+{
+    return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__GET_DOMAIN_STATE);
+}
+
 static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .set_system_active = flask_set_system_active,
     .security_domaininfo = flask_security_domaininfo,
@@ -1996,6 +2002,7 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .argo_register_any_source = flask_argo_register_any_source,
     .argo_send = flask_argo_send,
 #endif
+    .get_domain_state = flask_get_domain_state,
 };
 
 const struct xsm_ops *__init flask_init(
diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
index a35e3d4c51..c9a8eeda4e 100644
--- a/xen/xsm/flask/policy/access_vectors
+++ b/xen/xsm/flask/policy/access_vectors
@@ -251,6 +251,8 @@ class domain2
     resource_map
 # XEN_DOMCTL_get_cpu_policy
     get_cpu_policy
+# XEN_DOMCTL_get_domain_state
+    get_domain_state
 }
 
 # Similar to class domain, but primarily contains domctls related to HVM domains
-- 
2.43.0


