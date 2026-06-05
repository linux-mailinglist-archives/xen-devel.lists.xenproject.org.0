Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QnlSFLt9ImpBYgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:41:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C56764614C
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:41:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=EdiX99Ii;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1329108.1593318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVPBR-0000Ei-OJ; Fri, 05 Jun 2026 07:41:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329108.1593318; Fri, 05 Jun 2026 07:41:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVPBR-0000Bj-LR; Fri, 05 Jun 2026 07:41:37 +0000
Received: by outflank-mailman (input) for mailman id 1329108;
 Fri, 05 Jun 2026 07:41:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wVPBQ-0000Bd-8N
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 07:41:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVPBP-008vKo-ET
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 09:41:35 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a227dac-bab6-0a2a0a5309dd-0a2a450a95da-18
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:41:35 +0200
Received: from [209.85.208.50] (helo=mail-ed1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a227daf-56b3-0a2a450a0019-d155d032cdb6-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:41:35 +0200
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-68bac6e24fdso2241673a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 00:41:35 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.204])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf0517714c5sm421455066b.2.2026.06.05.00.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 00:41:33 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780645295; x=1781250095; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6eTxtuQ0Z5jBLuIlgZQKo02sLvYXSyHoneAsghrD09k=;
        b=EdiX99IisMbXiVgSBPcY89QjwG+0g/zKt3X7PZ6lae9+1yX+bwj6Ytf8ixTcBTsCk5
         lP2OfcQXf1WtBUouxnQJDhg306p+1XyuNyzZezrJEmbqPMaM5GAFdW0eY1Opir7dSKgu
         3BLHFOeQ26VJc+pVr7pHNsNhpQtuv1rxD/k8YOV2dbBk8y1/a1SniLead+SVw2gXG2hn
         /jTnrwpgf8jNxZx6JtOL/YIAgjXUdft36kRGdJWorJ4ZoXaXz9y68yUk5Iy/2EW8Uxdt
         DeWuYzOcIhhz1doh+pX9G6h3ICNayVKsp9RMKGIxY1qSCeENE60uDXLy4Xi/Yr67A7Wq
         hhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780645295; x=1781250095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6eTxtuQ0Z5jBLuIlgZQKo02sLvYXSyHoneAsghrD09k=;
        b=lDR+5mmcgYFn3JvlXl52ldOwoCB6dti9dzIqo7RLGj64XfvM/+iQeqjHIY+EOgYVOs
         sJAjW69FVaN5Xsux2MJPJ9DYoKIr3ohaxDBukNXiKfD1SLK4HipwIy7NCjxMv5PSvZcR
         aPNmyOtLl1pPTdUQd4ghRmCTxYVps5MROr8ueXnjx04+vuWanKdFCz6x5BGd/dW0JU2V
         N2N6XocbVOdYaoXr234nBmV7Qz/Tq4m6IIaDlGihjhExqlfrmVud5pP9S1FB0L2pQA6G
         o33qgTjzryL2GONYvJQqcEG1Xewb7ufnvZxkXx7BGbdXg4KQAr0rWKCie/0c/J//X1Ed
         x0RQ==
X-Gm-Message-State: AOJu0Yw1SYm266Cg37Ey+CLkFSaug3Y/Cz5l2nWTHpSrFmnS6jzVX1BN
	y7svRvJ9pc8rhoRrR2PTOmaIZR7+fzGK4X8afkSmItVLbgn6Mx1b0iIi9gXHPw==
X-Gm-Gg: Acq92OGzu2yJRqCE9qABmeKEAB9eUqiJ2FkvKR0c0qL0UIgH+EACrdOTkz9hR0wBQMw
	gcGIdTtGnDsQBZAqOVpkBLp2Td3VZqWSzP6pEjsMeii+EgTdQUKSurVRdT6SVjLA1/vjfvp3Vyd
	P9DbTRWmqIeRCRKGifunrO5rTkWqc7K79vqYM5CZ2q84BK4tuv/d0KFsIThVIauwe27Zjf2vUmL
	MLAtm0mArwp0uKoZprmm122EgksSGbDM9Cg5DkzZmfzhYvsrmY95d8Kc6ccVUPv2xxE21BFMpzy
	fZVrqjKE3njsGNssrUvYe9mCgZusXkuIuE4jAkUTwK/bRFno2EOpdXh68nMmO5Zhmxw7xi6se3u
	7cCXZYuprDjtER8FsVwj33BJWkyIcpj5DBWUPClV++MpXucqndafHaKdkYeSuQOcG7zNVl+excN
	90vVBd5jH1JKBI8ibiO+zyp0+juS8OXLiusdMK0Kr2ZwkSMCdJ
X-Received: by 2002:a17:907:8686:b0:bef:89d9:9f08 with SMTP id a640c23a62f3a-bf370b5fd4fmr102471366b.19.1780645294473;
        Fri, 05 Jun 2026 00:41:34 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tim Deegan <tim@xen.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v4] xen/domain: make shutdown state explicit
Date: Fri,  5 Jun 2026 10:39:06 +0300
Message-ID: <accc9b61dc46281289a303155653d48d5fde2084.1780643643.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1780645295-7FD788B7-77E27536/0/0
X-purgate-type: clean
X-purgate-size: 17158
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.32 / 15.00];
	URL_MULTIPLE_AT_SIGNS(3.00)[3];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:paul@xen.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tim@xen.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email,epam.com:mid,epam.com:email];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C56764614C

From: Mykola Kvach <mykola_kvach@epam.com>

The shutdown flow currently uses is_shutting_down and is_shut_down to
represent the domain shutdown lifecycle. The two flags are not mutually
exclusive: after shutdown completion is_shutting_down remains set until
domain_resume() clears both flags.

Replace the two booleans with an enum domain_shutdown_state. Keep
domain_shutting_down() as the direct replacement for the old
is_shutting_down flag: it is true once shutdown has been initiated and
remains true after completion, until domain_resume(). Add
domain_shutdown_completed() for users that need the final completed
state.

This makes the state transition explicit while avoiding a semantic split
between "in progress" and "completed" at call sites where the old code
only cared that shutdown had started and had not yet been reset by
domain_resume().

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v4:
- Adjust shadow_prealloc() condition formatting.
- Apply unlikely() only to the domain_shutting_down() predicate in shadow
  page fault checks.
- Add a comment documenting that DOMSHUTDOWN_none must remain first.
- Make enum domain_shutdown_state packed.

Changes in v3:
- Keep domain_shutting_down() as a direct replacement for
  is_shutting_down: true from shutdown start until domain_resume(),
  including after shutdown completion.
- Drop domain_in_shutdown_state().
- Make old is_shutting_down conversions mechanical again; use
  domain_shutdown_completed() only for old is_shut_down users.
- Keep domain_resume() returning void and leave callers unchanged.
- Drop resume-state validation and the related invalid-resume
  diagnostic, including the cached shutdown_state/shutdown_code values.
- Reword the commit message to avoid describing
  domain_shutting_down() as only the transient shutdown phase.

Changes in v2:
- Drop the shutdown reason restrictions from domain_resume(), so the
  validation remains compatible with the existing soft-reset flow.
- Use clearer helper naming for the three shutdown-state predicates.
- Document in the commit message how old is_shutting_down/is_shut_down
  users map to the new shutdown-state helpers.
- Fix label indentation noted during review.

Link to discussion:
  https://patchew.org/Xen/cover.1756392094.git.mykola._5Fkvach@epam.com/bb53d9911b00879c7b25f5258d0e3e48005671f9.1756392094.git.mykola._5Fkvach@epam.com/#a64cff9f-df5f-467b-a944-74e803c64ab9@suse.com
---
 xen/arch/x86/hvm/viridian/time.c |  2 +-
 xen/arch/x86/mm.c                |  2 +-
 xen/arch/x86/mm/hap/hap.c        |  2 +-
 xen/arch/x86/mm/shadow/common.c  |  5 +++--
 xen/arch/x86/mm/shadow/multi.c   | 12 +++++++-----
 xen/common/domain.c              | 20 ++++++++++----------
 xen/common/domctl.c              |  2 +-
 xen/common/sched/core.c          |  2 +-
 xen/drivers/passthrough/iommu.c  |  8 ++++----
 xen/drivers/passthrough/pci.c    |  2 +-
 xen/include/xen/sched.h          | 23 +++++++++++++++++++----
 11 files changed, 49 insertions(+), 31 deletions(-)

diff --git a/xen/arch/x86/hvm/viridian/time.c b/xen/arch/x86/hvm/viridian/time.c
index 9311858d63..cf57af263a 100644
--- a/xen/arch/x86/hvm/viridian/time.c
+++ b/xen/arch/x86/hvm/viridian/time.c
@@ -102,7 +102,7 @@ static void time_ref_count_thaw(const struct domain *d)
     struct viridian_domain *vd = d->arch.hvm.viridian;
     struct viridian_time_ref_count *trc = &vd->time_ref_count;
 
-    if ( d->is_shutting_down ||
+    if ( domain_shutting_down(d) ||
          test_and_set_bit(_TRC_running, &trc->flags) )
         return;
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index a158379e77..c8ce166d6e 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1219,7 +1219,7 @@ void put_page_from_l1e(l1_pgentry_t l1e, struct domain *l1e_owner)
      */
 #if _PAGE_GNTTAB
     if ( (l1e_get_flags(l1e) & _PAGE_GNTTAB) &&
-         !l1e_owner->is_shutting_down && !l1e_owner->is_dying )
+         !domain_shutting_down(l1e_owner) && !l1e_owner->is_dying )
     {
         gprintk(XENLOG_WARNING,
                 "Attempt to implicitly unmap %pd's grant PTE %" PRIpte "\n",
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 5ccb80bda5..0ede4181a0 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -414,7 +414,7 @@ static mfn_t hap_make_monitor_table(struct vcpu *v)
 
  oom:
     if ( !d->is_dying &&
-         (!d->is_shutting_down || d->shutdown_code != SHUTDOWN_crash) )
+         (!domain_shutting_down(d) || d->shutdown_code != SHUTDOWN_crash) )
     {
         printk(XENLOG_G_ERR "%pd: out of memory building monitor pagetable\n",
                d);
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index ed698fa90b..f777224539 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -164,7 +164,7 @@ void shadow_promote(struct domain *d, mfn_t gmfn, unsigned int type)
     /* We should never try to promote a gmfn that has writeable mappings */
     ASSERT((page->u.inuse.type_info & PGT_type_mask) != PGT_writable_page
            || (page->u.inuse.type_info & PGT_count_mask) == 0
-           || d->is_shutting_down);
+           || domain_shutting_down(d));
 
     /* Is the page already shadowed? */
     if ( !test_and_set_bit(_PGC_shadowed_pt, &page->count_info) )
@@ -442,7 +442,8 @@ bool shadow_prealloc(struct domain *d, unsigned int type, unsigned int count)
         count += paging_logdirty_levels();
 
     ret = _shadow_prealloc(d, count);
-    if ( !ret && (!d->is_shutting_down || d->shutdown_code != SHUTDOWN_crash) )
+    if ( !ret &&
+         (!domain_shutting_down(d) || d->shutdown_code != SHUTDOWN_crash) )
         /*
          * Failing to allocate memory required for shadow usage can only result in
          * a domain crash, do it here rather that relying on every caller to do it.
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 2990cee869..2662ee2c27 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -2370,7 +2370,8 @@ static int cf_check sh_page_fault(
      * already used for some special purpose (ioreq pages, or granted pages).
      * If that happens we'll have killed the guest already but it's still not
      * safe to propagate entries out of the guest PT so get out now. */
-    if ( unlikely(d->is_shutting_down && d->shutdown_code == SHUTDOWN_crash) )
+    if ( unlikely(domain_shutting_down(d)) &&
+         d->shutdown_code == SHUTDOWN_crash )
     {
         SHADOW_PRINTK("guest is shutting down\n");
         goto propagate;
@@ -2480,7 +2481,7 @@ static int cf_check sh_page_fault(
 #if GUEST_PAGING_LEVELS == 3
         sh_update_cr3(v, false);
 #else
-        ASSERT(d->is_shutting_down);
+        ASSERT(domain_shutting_down(d));
         sh_trace_va(TRC_SHADOW_DOMF_DYING, va);
 #endif
         paging_unlock(d);
@@ -2494,7 +2495,8 @@ static int cf_check sh_page_fault(
          && ft == ft_demand_write )
         sh_unsync(v, gmfn);
 
-    if ( unlikely(d->is_shutting_down && d->shutdown_code == SHUTDOWN_crash) )
+    if ( unlikely(domain_shutting_down(d)) &&
+         d->shutdown_code == SHUTDOWN_crash )
     {
         /* We might end up with a crashed domain here if
          * sh_remove_shadows() in a previous sh_resync() call has
@@ -3265,7 +3267,7 @@ static pagetable_t cf_check sh_update_cr3(struct vcpu *v, bool noflush)
                                        sh_make_shadow);
     if ( unlikely(pagetable_is_null(v->arch.paging.shadow.shadow_table[0])) )
     {
-        ASSERT(d->is_dying || d->is_shutting_down);
+        ASSERT(d->is_dying || domain_shutting_down(d));
         return old_entry;
     }
     if ( !paging_mode_external(d) && !is_pv_32bit_domain(d) )
@@ -3332,7 +3334,7 @@ static pagetable_t cf_check sh_update_cr3(struct vcpu *v, bool noflush)
     ASSERT(pagetable_is_null(old_entry));
     if ( unlikely(pagetable_is_null(v->arch.paging.shadow.shadow_table[0])) )
     {
-        ASSERT(d->is_dying || d->is_shutting_down);
+        ASSERT(d->is_dying || domain_shutting_down(d));
         return old_entry;
     }
 #else
diff --git a/xen/common/domain.c b/xen/common/domain.c
index bb9e210c28..473b7f8e3f 100644
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
+    if ( domain_shutting_down(d) )
     {
         /* Print nothing: the domain is already shutting down. */
     }
@@ -1394,13 +1394,13 @@ int domain_shutdown(struct domain *d, u8 reason)
     if ( is_hardware_domain(d) )
         hwdom_shutdown(reason);
 
-    if ( d->is_shutting_down )
+    if ( domain_shutting_down(d) )
     {
         spin_unlock(&d->shutdown_lock);
         return 0;
     }
 
-    d->is_shutting_down = 1;
+    d->shutdown_state = DOMSHUTDOWN_in_progress;
 
     smp_mb(); /* set shutdown status /then/ check for per-cpu deferrals */
 
@@ -1435,7 +1435,7 @@ void domain_resume(struct domain *d)
 
     spin_lock(&d->shutdown_lock);
 
-    d->is_shutting_down = d->is_shut_down = 0;
+    d->shutdown_state = DOMSHUTDOWN_none;
 
     arch_domain_resume(d);
 
@@ -1460,7 +1460,7 @@ int vcpu_start_shutdown_deferral(struct vcpu *v)
 
     v->defer_shutdown = 1;
     smp_mb(); /* set deferral status /then/ check for shutdown */
-    if ( unlikely(v->domain->is_shutting_down) )
+    if ( unlikely(domain_shutting_down(v->domain)) )
         vcpu_check_shutdown(v);
 
     return v->defer_shutdown;
@@ -1470,7 +1470,7 @@ void vcpu_end_shutdown_deferral(struct vcpu *v)
 {
     v->defer_shutdown = 0;
     smp_mb(); /* clear deferral status /then/ check for shutdown */
-    if ( unlikely(v->domain->is_shutting_down) )
+    if ( unlikely(domain_shutting_down(v->domain)) )
         vcpu_check_shutdown(v);
 }
 
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index b969f5ada6..5594fc72d8 100644
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
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 8e2b75bc35..9ac00e4c0d 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1539,7 +1539,7 @@ static void cf_check domain_watchdog_timeout(void *data)
 
     BUILD_BUG_ON(alignof(*d) < PAGE_SIZE);
 
-    if ( d->is_shutting_down || d->is_dying )
+    if ( domain_shutting_down(d) || d->is_dying )
         return;
 
     printk("Watchdog timer %u fired for %pd\n", id, d);
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index c9425d6971..4b22ecfe65 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -355,7 +355,7 @@ long iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
         if ( likely(!rc) )
             continue;
 
-        if ( !d->is_shutting_down && printk_ratelimit() )
+        if ( !domain_shutting_down(d) && printk_ratelimit() )
             printk(XENLOG_ERR
                    "d%d: IOMMU mapping dfn %"PRI_dfn" to mfn %"PRI_mfn" failed: %d\n",
                    d->domain_id, dfn_x(dfn), mfn_x(mfn), rc);
@@ -427,7 +427,7 @@ long iommu_unmap(struct domain *d, dfn_t dfn0, unsigned long page_count,
         if ( likely(!err) )
             continue;
 
-        if ( !d->is_shutting_down && printk_ratelimit() )
+        if ( !domain_shutting_down(d) && printk_ratelimit() )
             printk(XENLOG_ERR
                    "d%d: IOMMU unmapping dfn %"PRI_dfn" failed: %d\n",
                    d->domain_id, dfn_x(dfn), err);
@@ -492,7 +492,7 @@ int iommu_iotlb_flush(struct domain *d, dfn_t dfn, unsigned long page_count,
                     flush_flags);
     if ( unlikely(rc) )
     {
-        if ( !d->is_shutting_down && printk_ratelimit() )
+        if ( !domain_shutting_down(d) && printk_ratelimit() )
             printk(XENLOG_ERR
                    "d%d: IOMMU IOTLB flush failed: %d, dfn %"PRI_dfn", page count %lu flags %x\n",
                    d->domain_id, rc, dfn_x(dfn), page_count, flush_flags);
@@ -517,7 +517,7 @@ int iommu_iotlb_flush_all(struct domain *d, unsigned int flush_flags)
                     flush_flags | IOMMU_FLUSHF_all);
     if ( unlikely(rc) )
     {
-        if ( !d->is_shutting_down && printk_ratelimit() )
+        if ( !domain_shutting_down(d) && printk_ratelimit() )
             printk(XENLOG_ERR
                    "d%d: IOMMU IOTLB flush all failed: %d\n",
                    d->domain_id, rc);
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 464bb0fee4..5dbee61900 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1746,7 +1746,7 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev)
 
     pdev->broken = true;
 
-    if ( !d->is_shutting_down && printk_ratelimit() )
+    if ( !domain_shutting_down(d) && printk_ratelimit() )
         printk(XENLOG_ERR "dom%d: ATS device %pp flush failed\n",
                d->domain_id, &pdev->sbdf);
     if ( !is_hardware_domain(d) )
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 00db1da12f..7426e6f9bc 100644
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
 
+enum __packed domain_shutdown_state {
+    DOMSHUTDOWN_none, /* Must remain first, as domains are zero-initialized. */
+    DOMSHUTDOWN_in_progress,
+    DOMSHUTDOWN_complete,
+};
+
 struct domain
 {
     domid_t          domain_id;
@@ -552,10 +558,9 @@ struct domain
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
 
@@ -674,6 +679,16 @@ struct domain
     unsigned int pending_scrub_index;
 } __aligned(PAGE_SIZE);
 
+static inline bool domain_shutting_down(const struct domain *d)
+{
+    return d->shutdown_state != DOMSHUTDOWN_none;
+}
+
+static inline bool domain_shutdown_completed(const struct domain *d)
+{
+    return d->shutdown_state == DOMSHUTDOWN_complete;
+}
+
 static inline struct page_list_head *page_to_list(
     struct domain *d, const struct page_info *pg)
 {
-- 
2.43.0


