Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IXN1LFNRPWrf1AgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 18:03:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE37F6C7443
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 18:03:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gtIgQ56a;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1345783.1604525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcmXr-0000Ak-8G; Thu, 25 Jun 2026 16:03:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345783.1604525; Thu, 25 Jun 2026 16:03:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcmXr-00008q-4G; Thu, 25 Jun 2026 16:03:15 +0000
Received: by outflank-mailman (input) for mailman id 1345783;
 Thu, 25 Jun 2026 16:03:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wcmXp-00008k-4K
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 16:03:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcmXo-003dBi-Gz
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 18:03:12 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3d512a-2eae-0a2a0a5409dd-0a2a450c83ca-44
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 18:03:12 +0200
Received: from [209.85.208.175] (helo=mail-lj1-f175.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3d5140-f399-0a2a450c0019-d155d0afb066-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 18:03:12 +0200
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-39979f72d0cso322051fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 09:03:12 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3999af9f376sm46047991fa.9.2026.06.25.09.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2026 09:03:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782403392; x=1783008192; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2uZPCPrBYs7CuTTD0DNQCjFYGHnRqYaTxkjXjS+5fu4=;
        b=gtIgQ56aN7ed/MIVey3L1+gjdVXWeukBCbOGKx1oyQxQvAH5SaJmC7drqjYhLxDnLu
         zOyZzILDdas5ATYnOu++MOyka6uoiCMzFvaG0vNUy/2LahBpIeymOjhkRf1gOuFhzHoy
         NlF8d/1egGED1O9ccc9HnjMRIjP07BTrd+lG/DFXj103HppFUSNppLEXvNrbHKwVyxh3
         UVv7/X0R6DvP3PX0E+SE35jxvRaz5eon1GTpgOtrTv7r7ZmBl/mne4qCiWi1gv0KTXwA
         JFMDF1vg5rj6S1NaK/qwbfAa3wXtH27PUi6xG1NN1iG8BT5kyCw5NjbQHoWsNWCY0qrq
         eb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782403392; x=1783008192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uZPCPrBYs7CuTTD0DNQCjFYGHnRqYaTxkjXjS+5fu4=;
        b=nFJN9/UziLwaWXp4rRSK4IgeIlKqxPw5AjVZsv1WXKxCpUI1bGkc4tB+HSfzTBzXHM
         vP3bfoaWRXasWOba3w5869gxJynhrbcM94cNKDi+XX+f3qAEcCAiiz0ISHVEc3E1gS/+
         WsTUpzk1/B67t5IBmI095nPAP1aLVHCdzj8L+pdPnSb2D7vEugKnHizVGyA6R2hN2Jc8
         DZ2IlgHieIvxtpFpOQvma+dombYRyHxIlEWZlBBYaVNXmC28NFf0ObDqyIu7bssMjsgu
         j6essgUnY94RnRCkvLyqrLmk9jdWjJEfOrqwdK3zW18ljBIuaIuIw4J8yjX4lsHwkOnQ
         lXOQ==
X-Gm-Message-State: AOJu0Yyi5LrR2OF4ay8SvK37hX4fcLFGXe7TXe7LpmbD59HFd4aysquz
	8VCusXB4/dYA7+u/eadG454lhbM7IULQNyTzo/YywOOE4TNZGjIcMqA2J4E+kA==
X-Gm-Gg: AfdE7cnk86MfTrtxdEjJV3pGzS6BR6PgStuqCybiL0++2FRaxPqp5jAsivjz7bZVlsv
	V4MSPuA0zywi/XOdeC3FxdVZRqY7qwMz/d0Co4TFuFrBS55pWgIhreOAl1HnxWhMsz+5oCDUHMU
	oNezWBw9ZK4Bu5mIyFw4VtO/z3M9Fxba2rNtUTyi8NJcjZjDcOG2AwbLe3N2/Lkocv5hYkdjx6t
	2Ls6ZwCviRyTJ6DbiJfIAenpg2qvyLWeOJndcB1D4wLmHk/+p3aYfZS9cvVVEeeWTFwmnE3BzvA
	HdyuNj5x9FXTw38g9Z6Hq/dGDv3PVig+jAoFka0Z/ipIq2CgZ0If8NfDDcCbQ5RR5lgROuRtqFo
	CewPpSJ2av9GLCzzgs8DHTjBkDrQ8Z/JduDpPtugHNvnOqrFrX9USbFhal87tfEy0sx82hSGLo1
	5N23Iz2gyBZTqHQJhuLswUWSbN3zwEOgUbPFdN2Dklao39K5wwwNPfsiaRWYplosGvh6fv
X-Received: by 2002:a2e:a547:0:b0:396:ae32:860 with SMTP id 38308e7fff4ca-39acb9235a5mr11861531fa.16.1782403391127;
        Thu, 25 Jun 2026 09:03:11 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v4] xen: introduce CONFIG_HAS_SHARED_INFO for archs without a shared page
Date: Thu, 25 Jun 2026 18:02:54 +0200
Message-ID: <775c88457e5ec7fc7889002c6f9829669f9bce97.1782388193.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1782403392-91128D51-D54A806F/10/73395122804
X-purgate-type: spam
X-purgate-size: 12811
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE37F6C7443

On architectures that run guests in dom0less mode without the PV ABI
(currently RISC-V), no shared_info page is allocated and d->shared_info
remains NULL throughout the domain lifetime.  Several places in common
code access d->shared_info through the shared_info() macro or directly,
causing UBSAN null-pointer errors on such architectures.

Rather than adding runtime NULL guards that are logically unreachable
on x86 and Arm (where shared_info is always allocated), introduce a new
Kconfig symbol CONFIG_HAS_SHARED_INFO selected by x86 and Arm.

On !HAS_SHARED_INFO the shared_info() macro expands to a dereference
of a pointer returned by shared_info_absent(), which is declared but
intentionally never defined.  Any use of shared_info() that is not
dead-code-eliminated will therefore cause a link-time failure, making
missed guards impossible to overlook.

The 2L event-channel ops call shared_info() and must not be compiled on
architectures without a shared_info page, so event_2l.o is gated on
CONFIG_HAS_SHARED_INFO.  On such architectures evtchn_init() installs
the FIFO ops as a placeholder instead; evtchn_fifo_word_from_port() is
guarded against uninitialised d->evtchn_fifo so the FIFO ops are safe
before evtchn_fifo_init_control() is called by the guest.

With CONFIG_HAS_SHARED_INFO=n all vCPUs fall back to the global
dummy_vcpu_info, so writes through vcpu_info() could leak data between
vCPUs. Reviewing the write paths in common code: the write in
map_guest_area() stores the constant ~0 so nothing serious would happen
if it were leaked; the event_2l.c paths are unreachable because the
preceding shared_info() call would trap first; the write in
vcpu_info_populate() targets the new mapping buffer, not
dummy_vcpu_info.

Outside common code, the remaining writes are x86 PV-specific, for which
CONFIG_HAS_SHARED_INFO=y. No code changes are needed.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - event_channel.c: drop the redundant evtchn_fifo_init_ops() in the
   else branch of evtchn_reset(); evtchn_fifo_destroy() does not undo the
   ops installed by evtchn_init(), so only the switch back to 2-level ABI
   needs an explicit call.
 - shared.h: simplify the !HAS_SHARED_INFO shared_info() definition to use
   an undefined "extern struct shared_info *shared_info_absent" instead of
   shared_info_absent() with a typeof cast.
 - Extend the commit description to note that vcpu_info()/__vcpu_info()
   uses were also audited: on !HAS_SHARED_INFO vcpu_info_area.map points at
   dummy_vcpu_info, reads are harmless, and writes in common code do not
   open a cross-domain info-leak side channel, so no code changes are
   needed on that path.
---
Changes in v3:
 - Introduce CONFIG_HAS_SHARED_INFO Kconfig symbol selected by x86
   and Arm; RISC-V does not select it.
 - Gate shared_info() macro on CONFIG_HAS_SHARED_INFO; on
   !HAS_SHARED_INFO it calls shared_info_absent() (declared, never
   defined) so any unguarded use produces a link-time error.
 - Replace runtime if (!d->shared_info) guards with IS_ENABLED() at
   call sites so both branches type-check and dead code is eliminated.
 - Guard shared_info_frame assignment in domctl.c.
 - Gate event_2l.o on CONFIG_HAS_SHARED_INFO; use FIFO ops as
   placeholder on !HAS_SHARED_INFO archs instead of dedicated stub
   ops; guard evtchn_fifo_word_from_port() against uninitialised
   d->evtchn_fifo.
 - Add static inline stubs for evtchn_2l_init() (!HAS_SHARED_INFO)
   and evtchn_fifo_init_ops() (!EVTCHN_FIFO) so call sites can use
   IS_ENABLED() without #ifdef.
 - Drop inaccurate changelog entry about "only FIFO ABI" migration.
 - Update the commit message.
 - Drop R-by: Baptiste ... as some extra checks are added.
---
Changes in v2:
 - Update commit message + subject.
 - Drop Fixes tag.
---
 xen/arch/arm/Kconfig       |  1 +
 xen/arch/x86/Kconfig       |  1 +
 xen/common/Kconfig         |  3 +++
 xen/common/Makefile        |  2 +-
 xen/common/domain.c        |  6 +++---
 xen/common/domctl.c        | 11 ++++++++---
 xen/common/event_channel.c | 12 +++++++++---
 xen/common/event_channel.h |  6 ++++++
 xen/common/event_fifo.c    | 11 ++++++++++-
 xen/common/time.c          |  2 ++
 xen/include/xen/shared.h   |  8 +++++++-
 xen/include/xen/time.h     |  4 ++++
 12 files changed, 55 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 5fa89fcb2428..683ab7d25a1e 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -20,6 +20,7 @@ config ARM
 	select HAS_DEVICE_TREE_DISCOVERY
 	select HAS_DOM0LESS
 	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
+	select HAS_SHARED_INFO
 	select HAS_STACK_PROTECTOR
 	select HAS_UBSAN
 
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 2ce4747f6ea7..49697b795259 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -29,6 +29,7 @@ config X86
 	select HAS_PCI_MSI
 	select HAS_PIRQ
 	select HAS_SCHED_GRANULARITY
+	select HAS_SHARED_INFO
 	imply HAS_SOFT_RESET
 	select HAS_UBSAN
 	select HAS_VMAP
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5ff71480eebe..8b48d84c79e8 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -158,6 +158,9 @@ config HAS_PMAP
 config HAS_SCHED_GRANULARITY
 	bool
 
+config HAS_SHARED_INFO
+	bool
+
 config HAS_SOFT_RESET
 	bool
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 6018e256147f..f69d47d18934 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -12,7 +12,7 @@ obj-$(CONFIG_DEVICE_TREE_PARSE) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
 obj-y += domid.o
-obj-y += event_2l.o
+obj-$(CONFIG_HAS_SHARED_INFO) += event_2l.o
 obj-y += event_channel.o
 obj-$(CONFIG_EVTCHN_FIFO) += event_fifo.o
 obj-$(CONFIG_GRANT_TABLE) += grant_table.o
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8f2bfcae2890..fba8e9161937 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -316,9 +316,9 @@ void vcpu_info_reset(struct vcpu *v)
     struct domain *d = v->domain;
 
     v->vcpu_info_area.map =
-        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
-         ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
-         : &dummy_vcpu_info);
+        IS_ENABLED(CONFIG_HAS_SHARED_INFO) && v->vcpu_id < XEN_LEGACY_MAX_VCPUS
+        ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
+        : &dummy_vcpu_info;
 }
 
 static struct domain *alloc_domain_struct(void)
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index e30b38a337ac..5e5632f912d3 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -102,9 +102,14 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
 #ifdef CONFIG_MEM_PAGING
     info->paged_pages       = atomic_read(&d->paged_pages);
 #endif
-    info->shared_info_frame =
-        gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
-    BUG_ON(SHARED_M2P(info->shared_info_frame));
+    if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
+    {
+        info->shared_info_frame =
+            gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
+        BUG_ON(SHARED_M2P(info->shared_info_frame));
+    }
+    else
+        info->shared_info_frame = INVALID_GFN_RAW;
 
     info->cpupool = cpupool_get_id(d);
 
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index a3d18bc464e8..fae58985e501 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -1323,9 +1323,11 @@ int evtchn_reset(struct domain *d, bool resuming)
         rc = -EAGAIN;
     else if ( d->evtchn_fifo )
     {
-        /* Switching back to 2-level ABI. */
         evtchn_fifo_destroy(d);
-        evtchn_2l_init(d);
+
+        if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
+            /* Switching back to 2-level ABI. */
+            evtchn_2l_init(d);
     }
 
     write_unlock(&d->event_lock);
@@ -1624,7 +1626,11 @@ void evtchn_check_pollers(struct domain *d, unsigned int port)
 
 int evtchn_init(struct domain *d, unsigned int max_port)
 {
-    evtchn_2l_init(d);
+    if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
+        evtchn_2l_init(d);
+    else
+        evtchn_fifo_init_ops(d);
+
     d->max_evtchn_port = min_t(unsigned int, max_port, INT_MAX);
 
     d->evtchn = alloc_evtchn_bucket(d, 0);
diff --git a/xen/common/event_channel.h b/xen/common/event_channel.h
index dc94a43cc2dd..91f6d7b3d4bf 100644
--- a/xen/common/event_channel.h
+++ b/xen/common/event_channel.h
@@ -44,7 +44,11 @@ static inline void evtchn_port_print_state(struct domain *d,
 
 /* 2-level */
 
+#ifdef CONFIG_HAS_SHARED_INFO
 void evtchn_2l_init(struct domain *d);
+#else
+static inline void evtchn_2l_init(struct domain *d) {}
+#endif
 
 /* FIFO */
 
@@ -55,6 +59,7 @@ struct evtchn_expand_array;
 int evtchn_fifo_init_control(struct evtchn_init_control *init_control);
 int evtchn_fifo_expand_array(const struct evtchn_expand_array *expand_array);
 void evtchn_fifo_destroy(struct domain *d);
+void evtchn_fifo_init_ops(struct domain *d);
 #else
 static inline int evtchn_fifo_init_control(struct evtchn_init_control *init_control)
 {
@@ -68,6 +73,7 @@ static inline void evtchn_fifo_destroy(struct domain *d)
 {
     return;
 }
+static inline void evtchn_fifo_init_ops(struct domain *d) {}
 #endif /* CONFIG_EVTCHN_FIFO */
 
 #endif /* EVENT_CHANNEL_H */
diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
index 37cba9bc4564..4aa34ca13a56 100644
--- a/xen/common/event_fifo.c
+++ b/xen/common/event_fifo.c
@@ -62,6 +62,9 @@ static inline event_word_t *evtchn_fifo_word_from_port(const struct domain *d,
      */
     smp_rmb();
 
+    if ( unlikely(!d->evtchn_fifo) )
+        return NULL;
+
     if ( unlikely(port >= d->evtchn_fifo->num_evtchns) )
         return NULL;
 
@@ -420,6 +423,11 @@ static const struct evtchn_port_ops evtchn_port_ops_fifo =
     .print_state   = evtchn_fifo_print_state,
 };
 
+void evtchn_fifo_init_ops(struct domain *d)
+{
+    d->evtchn_port_ops = &evtchn_port_ops_fifo;
+}
+
 static int map_guest_page(struct domain *d, uint64_t gfn, void **virt)
 {
     struct page_info *p;
@@ -562,7 +570,8 @@ static void setup_ports(struct domain *d, unsigned int prev_evtchns)
 
         evtchn = evtchn_from_port(d, port);
 
-        if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
+        if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) &&
+             guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
             evtchn->pending = true;
 
         evtchn_fifo_set_priority(d, evtchn, EVTCHN_FIFO_PRIORITY_DEFAULT);
diff --git a/xen/common/time.c b/xen/common/time.c
index 04a65f00b35c..cdfdc53b6a17 100644
--- a/xen/common/time.c
+++ b/xen/common/time.c
@@ -89,6 +89,7 @@ struct tm gmtime(unsigned long t)
     return tbuf;
 }
 
+#ifdef CONFIG_HAS_SHARED_INFO
 void update_domain_wallclock_time(struct domain *d)
 {
     uint32_t *wc_version;
@@ -117,6 +118,7 @@ void update_domain_wallclock_time(struct domain *d)
 
     spin_unlock(&wc_lock);
 }
+#endif /* CONFIG_HAS_SHARED_INFO */
 
 /* Set clock to <secs,usecs> after 00:00:00 UTC, 1 January, 1970. */
 void do_settime(u64 secs, unsigned int nsecs, u64 system_time_base)
diff --git a/xen/include/xen/shared.h b/xen/include/xen/shared.h
index 5b71342cab32..f20a46801181 100644
--- a/xen/include/xen/shared.h
+++ b/xen/include/xen/shared.h
@@ -43,7 +43,13 @@ typedef struct vcpu_info vcpu_info_t;
 
 extern vcpu_info_t dummy_vcpu_info;
 
-#define shared_info(d, field)      __shared_info(d, (d)->shared_info, field)
+#ifdef CONFIG_HAS_SHARED_INFO
+#define shared_info(d, field) __shared_info(d, (d)->shared_info, field)
+#else
+extern struct shared_info *shared_info_absent;
+#define shared_info(d, field) (((void)(d), shared_info_absent)->field)
+#endif /* CONFIG_HAS_SHARED_INFO */
+
 #define vcpu_info(v, field)        \
         __vcpu_info(v, (vcpu_info_t *)(v)->vcpu_info_area.map, field)
 
diff --git a/xen/include/xen/time.h b/xen/include/xen/time.h
index e9c0822e6f31..2f872f580ffc 100644
--- a/xen/include/xen/time.h
+++ b/xen/include/xen/time.h
@@ -66,7 +66,11 @@ struct tm wallclock_time(uint64_t *ns);
 #define version_update_begin(v) (((v) + 1) | 1)
 #define version_update_end(v)   ((v) + 1)
 extern void update_vcpu_system_time(struct vcpu *v);
+#ifdef CONFIG_HAS_SHARED_INFO
 extern void update_domain_wallclock_time(struct domain *d);
+#else
+static inline void update_domain_wallclock_time(struct domain *d) {}
+#endif
 
 extern void do_settime(
     u64 secs, unsigned int nsecs, u64 system_time_base);
-- 
2.54.0


