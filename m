Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id J1XkOqy+zGnEWQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 08:43:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0BE37555F
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 08:43:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269733.1558647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7pIm-0002TX-Tl; Wed, 01 Apr 2026 06:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269733.1558647; Wed, 01 Apr 2026 06:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7pIm-0002Qn-QS; Wed, 01 Apr 2026 06:43:44 +0000
Received: by outflank-mailman (input) for mailman id 1269733;
 Wed, 01 Apr 2026 06:43:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w7pIl-0002Qh-OC
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 06:43:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7pIl-0037F1-2Y
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 08:43:43 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ccbe97-bab6-0a2a0a5309dd-0a2a450ac3bc-38
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 08:43:43 +0200
Received: from [209.85.208.51] (helo=mail-ed1-f51.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ccbe9e-1772-0a2a450a0019-d155d033e88c-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 08:43:43 +0200
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-66c05fb27e4so4354828a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 23:43:42 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-66b72760506sm4206665a12.5.2026.03.31.23.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2026 23:43:41 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775025822; x=1775630622; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wXfGbxEgVK86zP9EXSrRv04RVHrSL1xGXF93+I1C8b4=;
        b=GK7hJBRSPxcmvjwP8qEdPOas5MH3DoIW1V2u5JhTgTHUEOBAYTEBeL5Ia8FED+mpvZ
         y4CB98uBKXmEqDqX7R0HBjZ+CsrZKrfbCR3lBorNff6IlW3bYyVEThQ4YFjLxqJAY+K8
         HT4vOnVkzG5Ww35c4/gSdtuJijDgtL/4W6OvWHXVW9h8fG/QEs9yuk70CnnoY/aEQIJ0
         B/Mx24E+/PrRoFMVge8tBuAnAqoU3/cQ12x4lLRp6hMGNhF17O0X36XVYAtTFjrvzbV9
         Y2iDHX7yb5ttOgQisoMIr3wOwT5QwjeoUHPkvozP86mXBQLp7cJM9rrdGuD5xlg1YTOo
         Xxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775025822; x=1775630622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXfGbxEgVK86zP9EXSrRv04RVHrSL1xGXF93+I1C8b4=;
        b=NXt9JUIvCLJJbPOGilnYTGzO0wHyK+rkieUt4w3uvaAyx3yfmGUDE6E2DfEpov5MLc
         I3sGOldvtyBgXsaz5dsRJu/r+hbYEpSdNmicgyrS7XJ42Dupc10A/F+wzsi95LFBrhHr
         zn2x06oRylyYWlZNAaBEHmaCFLz0zj4Tyrrjod8bVWOJfg+rNH78g0xDf/AzVj8zzlGP
         sti7OHuU5j0CJoedmR0YEim+E5x6iyyrSA2uokN9Zd1e9l5dUrQdj4GPXlmTuvsYu1Fn
         +7sHNw6g17e4XSy1vbxL4fHZP8NbV3zPx4x7s1Kq7bEVel0EcRCLrfDBC82PSW6mRdCU
         wrKA==
X-Gm-Message-State: AOJu0Yy5pjDe0IkQfnlWUIjm7CHsqKRDun5vE/zNvScYI4KYZ4DXu+d9
	ChgfNDF0EcKI9lgwfCOQz1tFhDhckNYVYkY7CnHi9v8DEZmqQJyfQzhrCNRo1Rpd
X-Gm-Gg: ATEYQzz7x+ETXDjdvBppm30d1XYf8LS9huEeMTEFYZyXT/MGo2ezketRoc/WR+SHssY
	mnJiORNNjQdf73Wif31CBQ3SJAwvQTRMw62sMEm2+VfEpR5sDVMeykxGNWDnUBOCGqBt5omDziB
	VJRrAh99VPtirt0FmfvqovSnkxyyO8XNFAb1tJYC7KB8dPPXGK27F+mCU21ufOXSWnSJ3aT3lyS
	693hV24c8RjXZ3dZnIJqoR0ev9qLetS+rxdQ6zjhaGrb5e3LqIuHQpCX4ZD9+WrHizlvavNnw21
	qnntDh0/WKDulJqHChsyf0PKT6bbg88vN7f4Wr4bChrHQiMQdG/9TNXRmKHyX8owyYF/zRmPxtj
	cpHLor5iB5z19Cs1CBJPTRaLXAtjBDvM+BnYLaydub0HUNc8OqfxDayBQFqiTYU1Yr13TYJNB84
	ZoA0f6dGhigGdSHGln39uHvXxbQQ==
X-Received: by 2002:aa7:c507:0:b0:66d:cfa5:9707 with SMTP id 4fb4d7f45d1cf-66dcfa5c4c9mr737212a12.0.1775025821867;
        Tue, 31 Mar 2026 23:43:41 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tim Deegan <tim@xen.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v2] xen/domain: make shutdown state explicit
Date: Wed,  1 Apr 2026 09:41:13 +0300
Message-ID: <e9c45be41bb36ca341dad57196c753fbe82d1526.1774998397.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1775025823-51E8D900-FCAFAFB0/0/0
X-purgate-type: clean
X-purgate-size: 19099
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:paul@xen.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tim@xen.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3F0BE37555F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

The shutdown flow currently overloads is_shutting_down and
is_shut_down to represent multiple phases of the shutdown lifecycle.
Some users treat is_shutting_down narrowly as "shutdown still needs to
be driven to completion", while others rely on it more broadly as
"the domain is no longer in its normal running state".

Make the lifecycle explicit by introducing enum
domain_shutdown_state and helper predicates whose names match their
semantics: domain_shutting_down() for the transient phase,
domain_shutdown_completed() for the final state, and
domain_in_shutdown_state() for checks that need the union of both.

The conversion is intentionally not mechanical. The old flags were not
mutually exclusive: once a domain became fully shut down,
is_shutting_down remained set. As a result, sites that previously
used the absence of is_shutting_down to exclude both the transient and
completed states now use domain_in_shutdown_state(), sites that care
specifically about the final state use domain_shutdown_completed(),
and only paths that still have work to do before shutdown finalization
use domain_shutting_down().

At the same time, make domain_resume() validate its input state and
return an error to its callers. Resume is now accepted only from the
fully shut down state.

This removes the implicit coupling between unrelated users of the old
flags and makes the shutdown/resume transitions self-describing.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
- Drop the shutdown reason restrictions from domain_resume(), so the
  validation remains compatible with the existing soft-reset flow.
- Use clearer helper naming for the three shutdown-state predicates.
- Document in the commit message how old is_shutting_down/is_shut_down
  users map to the new shutdown-state helpers.
- Fix label indentation noted during review.

Link to discussion: https://patchew.org/Xen/cover.1756392094.git.mykola._5Fkvach@epam.com/bb53d9911b00879c7b25f5258d0e3e48005671f9.1756392094.git.mykola._5Fkvach@epam.com/#a64cff9f-df5f-467b-a944-74e803c64ab9@suse.com
---
 xen/arch/x86/hvm/viridian/time.c |  2 +-
 xen/arch/x86/mm.c                |  2 +-
 xen/arch/x86/mm/hap/hap.c        |  2 +-
 xen/arch/x86/mm/shadow/common.c  |  5 ++--
 xen/arch/x86/mm/shadow/multi.c   | 12 +++++----
 xen/common/domain.c              | 43 +++++++++++++++++++++++---------
 xen/common/domctl.c              |  4 +--
 xen/common/sched/core.c          |  2 +-
 xen/drivers/passthrough/iommu.c  |  8 +++---
 xen/drivers/passthrough/pci.c    |  2 +-
 xen/include/xen/sched.h          | 30 ++++++++++++++++++----
 11 files changed, 77 insertions(+), 35 deletions(-)

diff --git a/xen/arch/x86/hvm/viridian/time.c b/xen/arch/x86/hvm/viridian/time.c
index 9311858d63..514b1643bc 100644
--- a/xen/arch/x86/hvm/viridian/time.c
+++ b/xen/arch/x86/hvm/viridian/time.c
@@ -102,7 +102,7 @@ static void time_ref_count_thaw(const struct domain *d)
     struct viridian_domain *vd = d->arch.hvm.viridian;
     struct viridian_time_ref_count *trc = &vd->time_ref_count;
 
-    if ( d->is_shutting_down ||
+    if ( domain_in_shutdown_state(d) ||
          test_and_set_bit(_TRC_running, &trc->flags) )
         return;
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 4c404b6c13..402bbf2309 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1219,7 +1219,7 @@ void put_page_from_l1e(l1_pgentry_t l1e, struct domain *l1e_owner)
      */
 #if _PAGE_GNTTAB
     if ( (l1e_get_flags(l1e) & _PAGE_GNTTAB) &&
-         !l1e_owner->is_shutting_down && !l1e_owner->is_dying )
+         !domain_in_shutdown_state(l1e_owner) && !l1e_owner->is_dying )
     {
         gprintk(XENLOG_WARNING,
                 "Attempt to implicitly unmap %pd's grant PTE %" PRIpte "\n",
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 5ccb80bda5..9db6d8fa9e 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -414,7 +414,7 @@ static mfn_t hap_make_monitor_table(struct vcpu *v)
 
  oom:
     if ( !d->is_dying &&
-         (!d->is_shutting_down || d->shutdown_code != SHUTDOWN_crash) )
+         (!domain_in_shutdown_state(d) || d->shutdown_code != SHUTDOWN_crash) )
     {
         printk(XENLOG_G_ERR "%pd: out of memory building monitor pagetable\n",
                d);
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index dd2d04d049..14f808dc61 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -164,7 +164,7 @@ void shadow_promote(struct domain *d, mfn_t gmfn, unsigned int type)
     /* We should never try to promote a gmfn that has writeable mappings */
     ASSERT((page->u.inuse.type_info & PGT_type_mask) != PGT_writable_page
            || (page->u.inuse.type_info & PGT_count_mask) == 0
-           || d->is_shutting_down);
+           || domain_in_shutdown_state(d));
 
     /* Is the page already shadowed? */
     if ( !test_and_set_bit(_PGC_shadowed_pt, &page->count_info) )
@@ -442,7 +442,8 @@ bool shadow_prealloc(struct domain *d, unsigned int type, unsigned int count)
         count += paging_logdirty_levels();
 
     ret = _shadow_prealloc(d, count);
-    if ( !ret && (!d->is_shutting_down || d->shutdown_code != SHUTDOWN_crash) )
+    if ( !ret && (!domain_in_shutdown_state(d) ||
+                  d->shutdown_code != SHUTDOWN_crash) )
         /*
          * Failing to allocate memory required for shadow usage can only result in
          * a domain crash, do it here rather that relying on every caller to do it.
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 80cd3299fa..a1e9129dd8 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -2373,7 +2373,8 @@ static int cf_check sh_page_fault(
      * already used for some special purpose (ioreq pages, or granted pages).
      * If that happens we'll have killed the guest already but it's still not
      * safe to propagate entries out of the guest PT so get out now. */
-    if ( unlikely(d->is_shutting_down && d->shutdown_code == SHUTDOWN_crash) )
+    if ( unlikely(domain_in_shutdown_state(d) &&
+                  d->shutdown_code == SHUTDOWN_crash) )
     {
         SHADOW_PRINTK("guest is shutting down\n");
         goto propagate;
@@ -2483,7 +2484,7 @@ static int cf_check sh_page_fault(
 #if GUEST_PAGING_LEVELS == 3
         sh_update_cr3(v, false);
 #else
-        ASSERT(d->is_shutting_down);
+        ASSERT(domain_in_shutdown_state(d));
         sh_trace_va(TRC_SHADOW_DOMF_DYING, va);
 #endif
         paging_unlock(d);
@@ -2497,7 +2498,8 @@ static int cf_check sh_page_fault(
          && ft == ft_demand_write )
         sh_unsync(v, gmfn);
 
-    if ( unlikely(d->is_shutting_down && d->shutdown_code == SHUTDOWN_crash) )
+    if ( unlikely(domain_in_shutdown_state(d) &&
+                  d->shutdown_code == SHUTDOWN_crash) )
     {
         /* We might end up with a crashed domain here if
          * sh_remove_shadows() in a previous sh_resync() call has
@@ -3269,7 +3271,7 @@ static pagetable_t cf_check sh_update_cr3(struct vcpu *v, bool noflush)
                                        sh_make_shadow);
     if ( unlikely(pagetable_is_null(v->arch.paging.shadow.shadow_table[0])) )
     {
-        ASSERT(d->is_dying || d->is_shutting_down);
+        ASSERT(d->is_dying || domain_in_shutdown_state(d));
         return old_entry;
     }
     if ( !paging_mode_external(d) && !is_pv_32bit_domain(d) )
@@ -3336,7 +3338,7 @@ static pagetable_t cf_check sh_update_cr3(struct vcpu *v, bool noflush)
     ASSERT(pagetable_is_null(old_entry));
     if ( unlikely(pagetable_is_null(v->arch.paging.shadow.shadow_table[0])) )
     {
-        ASSERT(d->is_dying || d->is_shutting_down);
+        ASSERT(d->is_dying || domain_in_shutdown_state(d));
         return old_entry;
     }
 #else
diff --git a/xen/common/domain.c b/xen/common/domain.c
index bb9e210c28..503836872d 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -191,7 +191,7 @@ static void set_domain_state_info(struct xen_domctl_get_domain_state *info,
                                   const struct domain *d)
 {
     info->state = XEN_DOMCTL_GETDOMSTATE_STATE_EXIST;
-    if ( d->is_shut_down )
+    if ( domain_shutdown_completed(d) )
         info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_SHUTDOWN;
     if ( d->is_dying == DOMDYING_dying )
         info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DYING;
@@ -282,14 +282,14 @@ static void __domain_finalise_shutdown(struct domain *d)
 
     BUG_ON(!spin_is_locked(&d->shutdown_lock));
 
-    if ( d->is_shut_down )
+    if ( domain_shutdown_completed(d) )
         return;
 
     for_each_vcpu ( d, v )
         if ( !v->paused_for_shutdown )
             return;
 
-    d->is_shut_down = 1;
+    d->shutdown_state = DOMSHUTDOWN_complete;
     domain_changed_state(d);
     if ( (d->shutdown_code == SHUTDOWN_suspend) && d->suspend_evtchn )
         evtchn_send(d, d->suspend_evtchn);
@@ -303,7 +303,7 @@ static void vcpu_check_shutdown(struct vcpu *v)
 
     spin_lock(&d->shutdown_lock);
 
-    if ( d->is_shutting_down )
+    if ( domain_shutting_down(d) )
     {
         if ( !v->paused_for_shutdown )
             vcpu_pause_nosync(v);
@@ -1356,7 +1356,7 @@ int domain_kill(struct domain *d)
 
 void __domain_crash(struct domain *d)
 {
-    if ( d->is_shutting_down )
+    if ( domain_in_shutdown_state(d) )
     {
         /* Print nothing: the domain is already shutting down. */
     }
@@ -1394,13 +1394,13 @@ int domain_shutdown(struct domain *d, u8 reason)
     if ( is_hardware_domain(d) )
         hwdom_shutdown(reason);
 
-    if ( d->is_shutting_down )
+    if ( domain_in_shutdown_state(d) )
     {
         spin_unlock(&d->shutdown_lock);
         return 0;
     }
 
-    d->is_shutting_down = 1;
+    d->shutdown_state = DOMSHUTDOWN_in_progress;
 
     smp_mb(); /* set shutdown status /then/ check for per-cpu deferrals */
 
@@ -1423,9 +1423,12 @@ int domain_shutdown(struct domain *d, u8 reason)
     return 0;
 }
 
-void domain_resume(struct domain *d)
+int domain_resume(struct domain *d)
 {
     struct vcpu *v;
+    enum domain_shutdown_state shutdown_state;
+    unsigned int shutdown_code;
+    int rc = 0;
 
     /*
      * Some code paths assume that shutdown status does not get reset under
@@ -1435,10 +1438,18 @@ void domain_resume(struct domain *d)
 
     spin_lock(&d->shutdown_lock);
 
-    d->is_shutting_down = d->is_shut_down = 0;
+    shutdown_state = d->shutdown_state;
+    shutdown_code = d->shutdown_code;
+
+    if ( !domain_shutdown_completed(d) )
+    {
+        rc = -EINVAL;
+        goto out_unlock;
+    }
 
     arch_domain_resume(d);
 
+    d->shutdown_state = DOMSHUTDOWN_none;
     d->shutdown_code = SHUTDOWN_CODE_INVALID;
 
     for_each_vcpu ( d, v )
@@ -1448,9 +1459,17 @@ void domain_resume(struct domain *d)
         v->paused_for_shutdown = 0;
     }
 
+ out_unlock:
     spin_unlock(&d->shutdown_lock);
 
     domain_unpause(d);
+
+    if ( rc )
+        dprintk(XENLOG_WARNING,
+                "%pd: Invalid domain state for resume: shutdown_state=%u, shutdown_code=%u\n",
+                d, shutdown_state, shutdown_code);
+
+    return rc;
 }
 
 int vcpu_start_shutdown_deferral(struct vcpu *v)
@@ -1460,7 +1479,7 @@ int vcpu_start_shutdown_deferral(struct vcpu *v)
 
     v->defer_shutdown = 1;
     smp_mb(); /* set deferral status /then/ check for shutdown */
-    if ( unlikely(v->domain->is_shutting_down) )
+    if ( unlikely(domain_shutting_down(v->domain)) )
         vcpu_check_shutdown(v);
 
     return v->defer_shutdown;
@@ -1470,7 +1489,7 @@ void vcpu_end_shutdown_deferral(struct vcpu *v)
 {
     v->defer_shutdown = 0;
     smp_mb(); /* clear deferral status /then/ check for shutdown */
-    if ( unlikely(v->domain->is_shutting_down) )
+    if ( unlikely(domain_shutting_down(v->domain)) )
         vcpu_check_shutdown(v);
 }
 
@@ -1802,7 +1821,7 @@ int domain_soft_reset(struct domain *d, bool resuming)
 
     rc = arch_domain_soft_reset(d);
     if ( !rc )
-        domain_resume(d);
+        rc = domain_resume(d);
     else
         domain_crash(d);
 
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 93738931c5..e816ff755c 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -86,7 +86,7 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
 
     info->flags = (info->nr_online_vcpus ? flags : 0) |
         ((d->is_dying == DOMDYING_dead) ? XEN_DOMINF_dying     : 0) |
-        (d->is_shut_down                ? XEN_DOMINF_shutdown  : 0) |
+        (domain_shutdown_completed(d)   ? XEN_DOMINF_shutdown  : 0) |
         (d->controller_pause_count > 0  ? XEN_DOMINF_paused    : 0) |
         (d->debugger_attached           ? XEN_DOMINF_debugged  : 0) |
         (is_xenstore_domain(d)          ? XEN_DOMINF_xs_domain : 0) |
@@ -404,7 +404,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         if ( d == current->domain ) /* no domain_pause() */
             ret = -EINVAL;
         else
-            domain_resume(d);
+            ret = domain_resume(d);
         break;
 
     case XEN_DOMCTL_createdomain:
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index a57d5dd929..26cdb8a857 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1540,7 +1540,7 @@ static void cf_check domain_watchdog_timeout(void *data)
 
     BUILD_BUG_ON(alignof(*d) < PAGE_SIZE);
 
-    if ( d->is_shutting_down || d->is_dying )
+    if ( domain_in_shutdown_state(d) || d->is_dying )
         return;
 
     printk("Watchdog timer %u fired for %pd\n", id, d);
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index c9425d6971..428ac89f50 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -355,7 +355,7 @@ long iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
         if ( likely(!rc) )
             continue;
 
-        if ( !d->is_shutting_down && printk_ratelimit() )
+        if ( !domain_in_shutdown_state(d) && printk_ratelimit() )
             printk(XENLOG_ERR
                    "d%d: IOMMU mapping dfn %"PRI_dfn" to mfn %"PRI_mfn" failed: %d\n",
                    d->domain_id, dfn_x(dfn), mfn_x(mfn), rc);
@@ -427,7 +427,7 @@ long iommu_unmap(struct domain *d, dfn_t dfn0, unsigned long page_count,
         if ( likely(!err) )
             continue;
 
-        if ( !d->is_shutting_down && printk_ratelimit() )
+        if ( !domain_in_shutdown_state(d) && printk_ratelimit() )
             printk(XENLOG_ERR
                    "d%d: IOMMU unmapping dfn %"PRI_dfn" failed: %d\n",
                    d->domain_id, dfn_x(dfn), err);
@@ -492,7 +492,7 @@ int iommu_iotlb_flush(struct domain *d, dfn_t dfn, unsigned long page_count,
                     flush_flags);
     if ( unlikely(rc) )
     {
-        if ( !d->is_shutting_down && printk_ratelimit() )
+        if ( !domain_in_shutdown_state(d) && printk_ratelimit() )
             printk(XENLOG_ERR
                    "d%d: IOMMU IOTLB flush failed: %d, dfn %"PRI_dfn", page count %lu flags %x\n",
                    d->domain_id, rc, dfn_x(dfn), page_count, flush_flags);
@@ -517,7 +517,7 @@ int iommu_iotlb_flush_all(struct domain *d, unsigned int flush_flags)
                     flush_flags | IOMMU_FLUSHF_all);
     if ( unlikely(rc) )
     {
-        if ( !d->is_shutting_down && printk_ratelimit() )
+        if ( !domain_in_shutdown_state(d) && printk_ratelimit() )
             printk(XENLOG_ERR
                    "d%d: IOMMU IOTLB flush all failed: %d\n",
                    d->domain_id, rc);
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 464bb0fee4..74b53e5430 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1746,7 +1746,7 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev)
 
     pdev->broken = true;
 
-    if ( !d->is_shutting_down && printk_ratelimit() )
+    if ( !domain_in_shutdown_state(d) && printk_ratelimit() )
         printk(XENLOG_ERR "dom%d: ATS device %pp flush failed\n",
                d->domain_id, &pdev->sbdf);
     if ( !is_hardware_domain(d) )
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 212c7d765c..0e55e4df3b 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -222,7 +222,7 @@ struct vcpu
     bool             force_context_switch;
     /* Require shutdown to be deferred for some asynchronous operation? */
     bool             defer_shutdown;
-    /* VCPU is paused following shutdown request (d->is_shutting_down)? */
+    /* VCPU is paused following a domain shutdown request? */
     bool             paused_for_shutdown;
     /* VCPU need affinity restored */
     uint8_t          affinity_broken;
@@ -382,6 +382,12 @@ struct domain_console {
     char buf[256];
 };
 
+enum domain_shutdown_state {
+    DOMSHUTDOWN_none,
+    DOMSHUTDOWN_in_progress,
+    DOMSHUTDOWN_complete,
+};
+
 struct domain
 {
     domid_t          domain_id;
@@ -548,10 +554,9 @@ struct domain
     struct rangeset *iomem_caps;
     struct rangeset *irq_caps;
 
-    /* Guest has shut down (inc. reason code)? */
+    /* Guest shutdown state and associated reason code. */
     spinlock_t       shutdown_lock;
-    bool             is_shutting_down; /* in process of shutting down? */
-    bool             is_shut_down;     /* fully shut down? */
+    enum domain_shutdown_state shutdown_state;
 #define SHUTDOWN_CODE_INVALID ~0u
     unsigned int     shutdown_code;
 
@@ -670,6 +675,21 @@ struct domain
     unsigned int pending_scrub_index;
 } __aligned(PAGE_SIZE);
 
+static inline bool domain_shutting_down(const struct domain *d)
+{
+    return d->shutdown_state == DOMSHUTDOWN_in_progress;
+}
+
+static inline bool domain_shutdown_completed(const struct domain *d)
+{
+    return d->shutdown_state == DOMSHUTDOWN_complete;
+}
+
+static inline bool domain_in_shutdown_state(const struct domain *d)
+{
+    return d->shutdown_state != DOMSHUTDOWN_none;
+}
+
 static inline struct page_list_head *page_to_list(
     struct domain *d, const struct page_info *pg)
 {
@@ -824,7 +844,7 @@ static inline void put_pg_owner(struct domain *pg_owner)
 void domain_destroy(struct domain *d);
 int domain_kill(struct domain *d);
 int domain_shutdown(struct domain *d, u8 reason);
-void domain_resume(struct domain *d);
+int domain_resume(struct domain *d);
 
 int domain_soft_reset(struct domain *d, bool resuming);
 
-- 
2.43.0


