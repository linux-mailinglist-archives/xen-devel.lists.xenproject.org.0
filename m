Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RVPEOKbQS2oZawEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E3F712E94
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Lh7Rs+gE;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355478.1610258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglhp-0005yt-Pv; Mon, 06 Jul 2026 15:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355478.1610258; Mon, 06 Jul 2026 15:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglhp-0005xU-Mw; Mon, 06 Jul 2026 15:58:01 +0000
Received: by outflank-mailman (input) for mailman id 1355478;
 Mon, 06 Jul 2026 15:57:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wglhn-0005wC-CX
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:57:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wglhm-009yhn-1Q
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:57:58 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd06f-e002-0a2a0a5209dd-0a2a4502e43c-30
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:57:58 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd085-5a27-0a2a45020019-d155dd34d14d-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:57:57 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-471eeac43bfso3588219f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:57:57 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1e6ccsm26348562f8f.5.2026.07.06.08.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:57:56 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783353477; x=1783958277; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ThlkkY8xlNJZqfpe1tEj2IYsUOL0HElHSB7ghhFKhE=;
        b=Lh7Rs+gEAynZewfhEvhSdBYB38hEJCARYxKrpEkMPQoch/a0fD1ddWfm7E0srfe/Bj
         OHujd79Bd4QXCnKLE3TNVXkSFe73os8vV2zYqn0aLqVLIqpj8jxNkdS7HzrX8tEJfh+T
         J7ST+lv0wfiEEOIhiEz7yhJmTRvpSt5p/XCWRkxOP5X3yJ3VbLgPZu0e/r0DlikvCvvp
         BUpWfA6nszimDxD11pFgnGiZbzuueUKD6kiCSI58VD5AcvAmZmS9+EypQ3Hjxql7iUP7
         AC5FNxjnCMAfCmxpZgcWboRH4p7pdHFSLtP6We8+CAlbcQCNlfDXArjZa91ljvFiZ7ff
         /uWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353477; x=1783958277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ThlkkY8xlNJZqfpe1tEj2IYsUOL0HElHSB7ghhFKhE=;
        b=KWrzjhXpXlssEHvIRyQtLm6fnMLSUcHXy8fhqFv/iY/VStNwGJthuIToPPl/VdQkC7
         SyY3SXgHR9Ny8D+uiJYYEbfAGxd6qoyZaRHn13RKUlt29GXL7c+9DOJjK+7jNCdi/O0M
         2Qqn1aaVBrjKDx+jBm5k3Z6NbLELj2QC6uRC2tptr9c30VFnW94hHz17wFsek3sFs+Ie
         in0fHGbobd6ZnJKdVaYmj8izrgkE8rIsVJbdk4O+939sKy7cGK83yd8bd4mXnhSI9lhk
         GQL/ygWsZEFYuHS9leC9cjGokmxWoYiuwDZ9t+Czlb+DnDEkHV7eJ0LUQMRrF5eBN03Y
         Cr9A==
X-Gm-Message-State: AOJu0Yx5zbvfauSPQrXMsH6M7SrnMXodIacstgX6ocapcmjHZ9RhhvlJ
	ecBy7xm0l48jiMU4tojpbkSiE99LTOe9khdQpjHCbGqvsHt+lubjTFogWGiZjQ==
X-Gm-Gg: AfdE7cl6nm7tSXqQ4MeKvLGAg5eWpxe+BQWH2MdxKsqBNnDOrr0Ct8+wkFbQd2Mj7Jm
	LaTv5gug3EmMyOmgjwsTdH9BHYvSiZj7xZBLHipTJFJV1VZlLnSiHmNkmg0p4KEP0LYzYblAFyy
	8UJnKIM6/gv+VFId8DZ869AbPpjHSBtSlJiBVC/Fnwv+yzbQsg5c2Zy0UYecDcwdDpUUjkV9us3
	I8+aV2CcanNmsWcSV8H9Tt0mnyqjkib0Io7ABTgp4iQAUzynCJDPsCtUsrcwg8yYcj0ffFDubkC
	QfxnXrqGjgVnvZAWBW7Mw4ZOg9f4BxdeWAmynOugVgWPuGIRIII378sJChGfsAu3Av50Ayyx7Mr
	yOhxG8JHA9p7biWGMzs2l/+yUwoMs9QqMRHwwLtkbf+E9o0x3aa120gFGH7JURUcvZ+QXEbdaMW
	q8z+f7PSd3vqc9LsOhtlyQ7O0g5pNKy9OWoQQDRNszbikizYGHD4mhaBwoI13cLzz6MdEO
X-Received: by 2002:a5d:5509:0:b0:47d:e63f:dbe with SMTP id ffacd0b85a97d-47de66b4c1fmr686751f8f.24.1783353476795;
        Mon, 06 Jul 2026 08:57:56 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
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
Subject: [PATCH v5] xen: introduce CONFIG_HAS_SHARED_INFO for archs without a shared page
Date: Mon,  6 Jul 2026 17:57:48 +0200
Message-ID: <6948fb2823ffa41cf2eabbd87952b236e4f379bf.1783085655.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1783353477-56EEA7C5-68D53BFB/10/73395122804
X-purgate-type: spam
X-purgate-size: 15860
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,suse.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,vcpu_info_area.map:url];
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
X-Rspamd-Queue-Id: 37E3F712E94

On architectures that run guests in dom0less mode without the PV ABI
(currently RISC-V), no shared_info page is allocated and d->shared_info
remains NULL throughout the domain lifetime.  Several places in common
code access d->shared_info through the shared_info() macro or directly,
causing UBSAN null-pointer errors on such architectures.

Rather than adding runtime NULL guards that are logically unreachable
on x86 and Arm (where shared_info is always allocated), introduce a new
Kconfig symbol CONFIG_HAS_SHARED_INFO selected by x86 and Arm.

On !HAS_SHARED_INFO the shared_info() macro expands to a dereference
of shared_info_absent, an extern pointer that is declared but
intentionally never defined.  Any use of shared_info() that is not
dead-code-eliminated will therefore cause a link-time failure, making
missed guards impossible to overlook.

The 2L event-channel ops call shared_info() and must not be compiled on
architectures without a shared_info page, so event_2l.o is gated on
CONFIG_HAS_SHARED_INFO.  On such architectures evtchn_init() installs the
FIFO ops as a placeholder instead, so that a later guest opt-in to the
FIFO ABI via EVTCHNOP_init_control has no special-casing to do; if FIFO
support itself is also unavailable (!CONFIG_EVTCHN_FIFO), a dedicated
no-op evtchn_port_ops_none table is installed instead, so that
d->evtchn_port_ops is never NULL.  evtchn_fifo_word_from_port() is
guarded against uninitialised d->evtchn_fifo so the FIFO ops are safe
before evtchn_fifo_init_control() is called by the guest.

With CONFIG_HAS_SHARED_INFO=n all vCPUs fall back to the global
dummy_vcpu_info, so writes through vcpu_info() could leak data between
vCPUs. Reviewing the write paths in common code: the write in
map_guest_area() stores the constant ~0 so nothing serious would happen
if it were leaked; the event_2l.c paths are not compiled on
!HAS_SHARED_INFO, as event_2l.o is gated on CONFIG_HAS_SHARED_INFO; the
write in vcpu_info_populate() targets the new mapping buffer, not
dummy_vcpu_info.

Outside common code, the remaining writes are x86 PV-specific, for which
CONFIG_HAS_SHARED_INFO=y. No code changes are needed.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v5:
 - drop the static inline evtchn_2l_init() stub for !HAS_SHARED_INFO;
   a plain declaration is enough since the only call sites are guarded by
   IS_ENABLED(CONFIG_HAS_SHARED_INFO) and the dead call is eliminated
   before linking.
 - fix a NULL d->evtchn_port_ops dereference when CONFIG_HAS_SHARED_INFO=n
   and CONFIG_EVTCHN_FIFO=n: evtchn_init() was unconditionally calling
   evtchn_fifo_init_ops(), whose !EVTCHN_FIFO stub leaves d->evtchn_port_ops
   unset.  Gate the FIFO branch on IS_ENABLED(CONFIG_EVTCHN_FIFO) and add
   a dedicated evtchn_port_ops_none table for the remaining case. Stubs
   are shared where signatures permit: evtchn_none_noop covers both
   clear_pending and unmask; evtchn_none_false covers both is_pending and
   is_masked. evtchn_none_init() is called only from event_channel.c, so its
   declaration is kept there rather than in event_channel.h.
 - gate evtchn_fifo_init_ops() on !CONFIG_HAS_SHARED_INFO;
   its only call site is in the IS_ENABLED(CONFIG_EVTCHN_FIFO) dead branch
   of evtchn_init(), which is never reached on HAS_SHARED_INFO=y builds.
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
 xen/common/domain.c        |  6 ++---
 xen/common/domctl.c        | 11 ++++++---
 xen/common/event_channel.c | 49 +++++++++++++++++++++++++++++++++++---
 xen/common/event_channel.h |  2 ++
 xen/common/event_fifo.c    | 18 +++++++++++++-
 xen/common/time.c          |  2 ++
 xen/include/xen/shared.h   |  8 ++++++-
 xen/include/xen/time.h     |  4 ++++
 12 files changed, 95 insertions(+), 12 deletions(-)

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
index a3d18bc464e8..ff744e30559d 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -40,6 +40,9 @@
 
 #define consumer_is_xen(e) (!!(e)->xen_consumer)
 
+/* Defined below when !CONFIG_HAS_SHARED_INFO; call is DCE'd otherwise. */
+void evtchn_none_init(struct domain *d);
+
 /*
  * Lock an event channel exclusively. This is allowed only when the channel is
  * free or unbound either when taking or when releasing the lock, as any
@@ -1323,9 +1326,13 @@ int evtchn_reset(struct domain *d, bool resuming)
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
+            evtchn_none_init(d);
     }
 
     write_unlock(&d->event_lock);
@@ -1622,9 +1629,45 @@ void evtchn_check_pollers(struct domain *d, unsigned int port)
     }
 }
 
+#ifndef CONFIG_HAS_SHARED_INFO
+/*
+ * Placeholder ops for domains with neither a shared_info page nor (yet)
+ * a FIFO control block.  None of these are ever reachable in practice;
+ * they only exist to keep d->evtchn_port_ops non-NULL.
+ */
+static void cf_check evtchn_none_set_pending(
+    struct vcpu *v, struct evtchn *evtchn) {}
+static void cf_check evtchn_none_noop(
+    struct domain *d, struct evtchn *evtchn) {}
+static bool cf_check evtchn_none_false(
+    const struct domain *d, const struct evtchn *evtchn) { return false; }
+static void cf_check evtchn_none_print_state(
+    struct domain *d, const struct evtchn *evtchn) {}
+
+static const struct evtchn_port_ops evtchn_port_ops_none = {
+    .set_pending   = evtchn_none_set_pending,
+    .clear_pending = evtchn_none_noop,
+    .unmask        = evtchn_none_noop,
+    .is_pending    = evtchn_none_false,
+    .is_masked     = evtchn_none_false,
+    .print_state   = evtchn_none_print_state,
+};
+
+void evtchn_none_init(struct domain *d)
+{
+    d->evtchn_port_ops = &evtchn_port_ops_none;
+}
+#endif /* !CONFIG_HAS_SHARED_INFO */
+
 int evtchn_init(struct domain *d, unsigned int max_port)
 {
-    evtchn_2l_init(d);
+    if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
+        evtchn_2l_init(d);
+    else if ( IS_ENABLED(CONFIG_EVTCHN_FIFO) )
+        evtchn_fifo_init_ops(d);
+    else
+        evtchn_none_init(d);
+
     d->max_evtchn_port = min_t(unsigned int, max_port, INT_MAX);
 
     d->evtchn = alloc_evtchn_bucket(d, 0);
diff --git a/xen/common/event_channel.h b/xen/common/event_channel.h
index dc94a43cc2dd..d3e5424f6ac8 100644
--- a/xen/common/event_channel.h
+++ b/xen/common/event_channel.h
@@ -55,6 +55,7 @@ struct evtchn_expand_array;
 int evtchn_fifo_init_control(struct evtchn_init_control *init_control);
 int evtchn_fifo_expand_array(const struct evtchn_expand_array *expand_array);
 void evtchn_fifo_destroy(struct domain *d);
+void evtchn_fifo_init_ops(struct domain *d);
 #else
 static inline int evtchn_fifo_init_control(struct evtchn_init_control *init_control)
 {
@@ -68,6 +69,7 @@ static inline void evtchn_fifo_destroy(struct domain *d)
 {
     return;
 }
+static inline void evtchn_fifo_init_ops(struct domain *d) {}
 #endif /* CONFIG_EVTCHN_FIFO */
 
 #endif /* EVENT_CHANNEL_H */
diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
index 37cba9bc4564..56f1bcb967f2 100644
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
 
@@ -420,6 +423,18 @@ static const struct evtchn_port_ops evtchn_port_ops_fifo =
     .print_state   = evtchn_fifo_print_state,
 };
 
+/*
+ * evtchn_fifo_init_ops() only call site is in the
+ * IS_ENABLED(CONFIG_EVTCHN_FIFO) dead branch of evtchn_init(), which is never
+ * reached on HAS_SHARED_INFO=y builds because of DCE.
+ */
+#ifndef CONFIG_HAS_SHARED_INFO
+void evtchn_fifo_init_ops(struct domain *d)
+{
+    d->evtchn_port_ops = &evtchn_port_ops_fifo;
+}
+#endif
+
 static int map_guest_page(struct domain *d, uint64_t gfn, void **virt)
 {
     struct page_info *p;
@@ -562,7 +577,8 @@ static void setup_ports(struct domain *d, unsigned int prev_evtchns)
 
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


