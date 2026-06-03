Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aBY6AGI5IGpKywAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:25:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD976388B1
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:25:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="eWjlPz/3";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1326565.1591984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmXC-0003nj-O6; Wed, 03 Jun 2026 14:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326565.1591984; Wed, 03 Jun 2026 14:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmXC-0003lv-JD; Wed, 03 Jun 2026 14:25:30 +0000
Received: by outflank-mailman (input) for mailman id 1326565;
 Wed, 03 Jun 2026 14:25:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUmXB-0003Xp-81
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:25:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUmXA-00CIZk-L5
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 16:25:28 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a203954-e002-0a2a0a5209dd-0a2a45099a3e-10
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:25:28 +0200
Received: from [209.85.218.42] (helo=mail-ej1-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a203958-2497-0a2a45090019-d155da2ad9e9-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:25:28 +0200
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-bf0170c80f7so284182866b.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 07:25:28 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf0517721c2sm162199766b.3.2026.06.03.07.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 07:25:27 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780496728; x=1781101528; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miha+RILCA7ne03eYfC+l8atexUy0yz60KL9zHv6qbE=;
        b=eWjlPz/3YLufQo9NgBRV8fG8hcLnVE2XCxOI3FbkA4rL32eX6eAerAyvGFYJnGb/HN
         jhH6DfYFktxINIz0uRjhiipdUJAfAG37bd+bf+ZV16CLak8u9U6boI7E1Mhwz9Li71Wn
         d6CPf/9adlUNHGyX5FzNiazK7ynHsDDG5Mv1eIF4eCnQTwVjfXVjRuP+scztIB9ZAzJm
         qfOIaejXTG7IEdqKV/4aAJpAWQA1UbU7DiYn5UrCf2W8O0DQoMdvpqunFSKdYpAotKnA
         bekUm5G2untxZcewRDR1yF30DlRLgjiw4kStPR5xYqwRa2b+6aFYX/YccnlGbtUw4ekT
         f77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496728; x=1781101528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=miha+RILCA7ne03eYfC+l8atexUy0yz60KL9zHv6qbE=;
        b=JfC311zZshthat9WCQOrQ09OWWnALhEhGvZR+SQ4mmMv3HPqdVKS21BctQmM3QV2kW
         rH9I8+lA2NgxfpQ5BIrQtEbdgPZaBq6/GNunM+QO11WjWJnwa7YwhVBBs0W8oQLk6DSh
         X033kLJxjIqIBsJJDDv0xzo49FNfPtThRykO1csq4vF0vOxcZVumsjbrMuFNZJTNX/Ow
         FbKozahAt1RAK756jr6KTM2qmGgcoKB7z7t5HwIBg22ABMGNKVW/t6vrlYURf0z9CoCD
         HlhOkXUQ8/ijn55n+jcRwrWGNFmA4jc2T/b1zSlAh9Ao8Cbc5ss4k+JY6MZjM8Tpd/Ex
         6w+Q==
X-Gm-Message-State: AOJu0YxfZJeU07ln7RoN0qvx7XX5spHOVKlhvwY6N9H0uWpLYKlZNZlZ
	X9j0JAmd4TnDMKY28H+U54+y/psKnOpfR6zUbGmBo+RkQ1xzxu43DgAm87hw4Q==
X-Gm-Gg: Acq92OGZOgOUf1Scqo25KY/tSvpIWvCdkjidBCyyJ4f+vLH9WrrkSewHTyD/wIkvWMi
	1ptb5Shp6rMHTcmVrdOEG/irMAzMMe3dXRFFTnoJANRVjIrzlzbtjtXbV6XSqQvJ20eLFqH1lGa
	5js32jnyB7rH9v1IUs3N+zuk1XKJQUO/hEG9U/s+IKWm33er0IctmOoVr1p0AEPV2KVrwtZJruK
	2hZ3qvL/ZfxoQcj0ykHC9EFN353IsCNCQ4UX+AtekQC7BlK2Tz5kZl1AfbTy4xWBF5HyZMRcjcC
	nJABk8ext2hKNJ4+m5cvRROhLZ9BlnD9DjzGLbzj7tY1sSMIVi1DRggFcktzxLWwNZQ/bd1I85E
	Gb1t/I03fWKDWl248WP30/x5m8+KfDUVukccpdPVPIHbXjahDAs3cm8HabqjGf12yMXZ+BNFBOb
	sTSNMH3dxC8lxC1snIyCPjrwfy/ziseDShrOay8Z1LGpIzmxyKkIC+m0z5UYuV35aODsbZ6HGke
	9bq/a4=
X-Received: by 2002:a17:907:3d44:b0:bec:d077:c4e1 with SMTP id a640c23a62f3a-bf0afcf41ffmr200574566b.47.1780496727766;
        Wed, 03 Jun 2026 07:25:27 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v3 2/2] xen: introduce CONFIG_HAS_SHARED_INFO for archs without a shared page
Date: Wed,  3 Jun 2026 16:25:18 +0200
Message-ID: <7ed7b888e203b7cc6c3a3a82b3bcc89d90b3fb48.1780494838.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1780494838.git.oleksii.kurochko@gmail.com>
References: <cover.1780494838.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1780496728-8B790A53-B3395CF4/10/73395122804
X-purgate-type: spam
X-purgate-size: 11641
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
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 9AD976388B1

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

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
With having in Xen:
   info->shared_info_frame = INVALID_GFN_RAW;
probably we want to add at least ASSERT() in tools/libs/guest code
as xc_map_foreign_range() doesn't check if mfn arguemnt is correct or not.
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
 xen/common/event_channel.c | 14 +++++++++++---
 xen/common/event_channel.h |  6 ++++++
 xen/common/event_fifo.c    | 11 ++++++++++-
 xen/common/time.c          |  2 ++
 xen/include/xen/shared.h   |  7 +++++++
 xen/include/xen/time.h     |  4 ++++
 12 files changed, 57 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 79622b46a10d..23ff49842c90 100644
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
index bb9e210c2895..caf3b1e1ba0b 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -320,9 +320,9 @@ void vcpu_info_reset(struct vcpu *v)
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
index b969f5ada6cc..edeb8ec32b3b 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -104,9 +104,14 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
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
index a3d18bc464e8..d8ff0122e86f 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -1323,9 +1323,13 @@ int evtchn_reset(struct domain *d, bool resuming)
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
+        else
+            evtchn_fifo_init_ops(d);
     }
 
     write_unlock(&d->event_lock);
@@ -1624,7 +1628,11 @@ void evtchn_check_pollers(struct domain *d, unsigned int port)
 
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
index 5b71342cab32..a938312170e5 100644
--- a/xen/include/xen/shared.h
+++ b/xen/include/xen/shared.h
@@ -43,7 +43,14 @@ typedef struct vcpu_info vcpu_info_t;
 
 extern vcpu_info_t dummy_vcpu_info;
 
+#ifdef CONFIG_HAS_SHARED_INFO
 #define shared_info(d, field)      __shared_info(d, (d)->shared_info, field)
+#else
+void * shared_info_absent(void);
+#define shared_info(d, field) \
+    (*(typeof(__shared_info(d, (d)->shared_info, field)) *)shared_info_absent())
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


