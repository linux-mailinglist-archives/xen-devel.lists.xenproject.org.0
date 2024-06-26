Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6955891837B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:58:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749010.1156995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMT9z-0001Cz-JR; Wed, 26 Jun 2024 13:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749010.1156995; Wed, 26 Jun 2024 13:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMT9z-00015j-Du; Wed, 26 Jun 2024 13:58:07 +0000
Received: by outflank-mailman (input) for mailman id 749010;
 Wed, 26 Jun 2024 13:58:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1Ku=N4=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sMT9x-0000aq-C9
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:58:05 +0000
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [2607:f8b0:4864:20::729])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b496037-33c4-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 15:58:04 +0200 (CEST)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-79c11e92afaso71239485a.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 06:58:04 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79bce9318f6sm499371185a.101.2024.06.26.06.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 06:58:02 -0700 (PDT)
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
X-Inumbo-ID: 1b496037-33c4-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719410283; x=1720015083; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvj66XLtWaLUUhs6hHRcK0ccgrRw6yMVK7cJhOUGdj4=;
        b=RKQrSjKSwCvg2r8kpo3ysSgxPwmWvJPnWxdIAPtON0ZWr7NhRqXB8ulJmn7dKQSYrO
         qUSSnqWV1Mxlr8WKyynv7/frWooV+pTXRDGaJPJwWnGUALOP9fobuk0dgDoFRIbZlLW1
         dHJRSx7k7L77ItffWA4OQPs3wpnmW0wzZEGbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410283; x=1720015083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvj66XLtWaLUUhs6hHRcK0ccgrRw6yMVK7cJhOUGdj4=;
        b=N8uFceKd6mbFEGC2ag90TX7uuaRg4AOzEEa3PZWCsNJF1Ef/u2q6w8TXSH6Q3N3/Tm
         CW+AJa7KhoRHr85ftN4Xxj1W0/0F8BSRE0dvV6yINVSyXGBL/rWboceV1dUzOXJbNg5b
         0lyVm5yna7eGFGuYczM+ecnM9YSNp5LQbxoLbQf7RMeE2G+FdiAuTjSkr5m2yWhtHaAH
         99DDD/zthhLMcuUbVj05ZIhasPFz3RPDfxFN2AoEt8JnbV9SN8rdJNeVa3icIbbGjYkv
         IzXAla1X2xpQdLOto2rPEYSBkFB5pKaNizP1DxfKrd1reWs3i1POunKjgCezwStsGtAm
         D4Dw==
X-Gm-Message-State: AOJu0Yyw3WjuqcDM6QnjIBtVKkVgRW58HV7YfAMvWUU/Oe3K5cvhCrYF
	u3trU9X1UPAP0Qfa4ak5gA+QuFq23AdcJ7o6Vyt7+fbLho3yb5bztOxdtaVQUpYPpiUxC0vQCab
	3wwI=
X-Google-Smtp-Source: AGHT+IHFDYppDfhSsXX23yD5NHNWcJuD1Vdf+5KwPSJ4NnOz2YoqrvF07uS8JC9JNzH8eNAHdGhIuQ==
X-Received: by 2002:a05:620a:190f:b0:795:598d:b99c with SMTP id af79cd13be357-79be701b2b6mr1258395985a.64.1719410282848;
        Wed, 26 Jun 2024 06:58:02 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>
Subject: [PATCH WIP 03/14] xenalyze: Basic nested virt processing
Date: Wed, 26 Jun 2024 14:38:42 +0100
Message-Id: <20240626133853.4150731-4-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626133853.4150731-1-george.dunlap@cloud.com>
References: <20240626133853.4150731-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On SVM, VMEXIT that occur in when an L1 is in non-root mode ("nested
exits") are tagged with the TRC_HVM_NESTEDFLAG flag.  Expand xenalyze
to do basic handling of these records:

- Refactor hvm_process to filter out both TRC_HVM_NESTEDFLAG and
  TRC_64_FLAG when deciding how to process

- Create separate "trace volume" sub-categories for them (HVM_VOL_*),
  tweaking layout so things continue to align

- Visually distinquish nested from non-nested vmexits and vmentries in
  dump mode

At the moment, nested VMEXITs which are passed through to the L1
hypervisor won't have any HVM handlers; note in hvm_data when a vmexit
was nested, and don't warn when no handlers occur.

While here:
 - Expand one of the error messages with a bit more information
 - Replace repeated `ri->event & TRC_64_FLAG` instances with `flag64`
 - Remove a stray whitespace at the end of a line
 - Add a missing newline to a warning statement

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
 tools/xentrace/xenalyze.c | 66 ++++++++++++++++++++++++++-------------
 1 file changed, 45 insertions(+), 21 deletions(-)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index d95e52695f..52ee7a5f9f 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -986,7 +986,9 @@ const char * hvm_event_handler_name[HVM_EVENT_HANDLER_MAX] = {
 
 enum {
     HVM_VOL_VMENTRY,
+    HVM_VOL_VMENTRY_NESTED,
     HVM_VOL_VMEXIT,
+    HVM_VOL_VMEXIT_NESTED,
     HVM_VOL_HANDLER,
     HVM_VOL_EMUL,
     HVM_VOL_MAX
@@ -1014,6 +1016,8 @@ const char *guest_interrupt_case_name[] = {
 const char *hvm_vol_name[HVM_VOL_MAX] = {
     [HVM_VOL_VMENTRY]="vmentry",
     [HVM_VOL_VMEXIT] ="vmexit",
+    [HVM_VOL_VMENTRY_NESTED]="vmentry(n)",
+    [HVM_VOL_VMEXIT_NESTED] ="vmexit(n)",
     [HVM_VOL_HANDLER]="handler",
     [HVM_VOL_EMUL]="emul",
 };
@@ -1380,7 +1384,7 @@ struct hvm_data {
     tsc_t exit_tsc, arc_cycles, entry_tsc;
     unsigned long long rip;
     unsigned exit_reason, event_handler;
-    unsigned int short_summary_done:1, prealloc_unpin:1, wrmap_bf:1;
+    bool nested_vmexit, short_summary_done, prealloc_unpin, wrmap_bf;
 
     /* Immediate processing */
     void *d;
@@ -1807,7 +1811,7 @@ void volume_summary(struct trace_volume *vol)
             case TOPLEVEL_HVM:
                 for(k=0; k<HVM_VOL_MAX; k++) {
                     if(vol->hvm[k])
-                        printf(" +-%-7s: %10lld\n",
+                        printf(" +-%-10s: %10lld\n",
                                hvm_vol_name[k], vol->hvm[k]);
                 }
 
@@ -4633,6 +4637,9 @@ void hvm_generic_postprocess(struct hvm_data *h)
         /* Some exits we don't expect a handler; just return */
         if(opt.svm_mode)
         {
+            /* Nested vmexits passed on to L1's have no handlers for now */
+            if(h->nested_vmexit)
+                return;
             switch(h->exit_reason)
             {
             case VMEXIT_VINTR: /* Equivalent of PENDING_VIRT_INTR */
@@ -4660,8 +4667,10 @@ void hvm_generic_postprocess(struct hvm_data *h)
         if ( !warned[h->exit_reason] )
         {
             /* If we aren't a known exception, warn and log results */
-            fprintf(warn, "%s: Strange, exit %x(%s) missing a handler\n",
-                    __func__, h->exit_reason,
+            fprintf(warn, "%s: d%dv%d Strange, exit %x(%s) missing a handler\n",
+                    __func__,
+                    h->v->d->did, h->v->vid,
+                    h->exit_reason,
                     (h->exit_reason > h->exit_reason_max)
                       ? "[clipped]"
                       : h->exit_reason_name[h->exit_reason]);
@@ -5067,6 +5076,9 @@ static inline void runstate_update(struct vcpu_data *v, int new_runstate,
 
 void hvm_vmexit_process(struct record_info *ri, struct hvm_data *h,
                         struct vcpu_data *v) {
+    bool flag64 = ri->event & TRC_64_FLAG;
+    bool nested = ri->event & TRC_HVM_NESTEDFLAG;
+
     struct {
         union {
             struct {
@@ -5080,7 +5092,7 @@ void hvm_vmexit_process(struct record_info *ri, struct hvm_data *h,
         };
     } *r;
 
-    if ( ri->event & TRC_64_FLAG )
+    if(flag64)
     {
         if (check_extra_words(ri, sizeof(r->x64), "vmexit"))
             return;
@@ -5097,9 +5109,10 @@ void hvm_vmexit_process(struct record_info *ri, struct hvm_data *h,
         set_hvm_exit_reason_data(h, ri->event);
 
     h->vmexit_valid=1;
+    h->nested_vmexit=nested;
     bzero(&h->inflight, sizeof(h->inflight));
 
-    if(ri->event & TRC_64_FLAG) {
+    if(flag64) {
         if(v->guest_paging_levels != 4)
         {
             if ( verbosity >= 6 )
@@ -5145,14 +5158,16 @@ void hvm_vmexit_process(struct record_info *ri, struct hvm_data *h,
     if(opt.dump_all) {
         if ( h->exit_reason < h->exit_reason_max
              && h->exit_reason_name[h->exit_reason] != NULL)
-            printf("]%s vmexit exit_reason %s eip %llx%s\n",
+            printf("]%s vmexit%s exit_reason %s eip %llx%s\n",
                    ri->dump_header,
+                   nested ? "(n)" : "",
                    h->exit_reason_name[h->exit_reason],
                    h->rip,
                    find_symbol(h->rip));
         else
-            printf("]%s vmexit exit_reason %x eip %llx%s\n",
+            printf("]%s vmexit%s exit_reason %x eip %llx%s\n",
                    ri->dump_header,
+                   nested ? "(n)" : "",
                    h->exit_reason,
                    h->rip,
                    find_symbol(h->rip));
@@ -5244,11 +5259,13 @@ void hvm_close_vmexit(struct hvm_data *h, tsc_t tsc) {
 }
 
 void hvm_vmentry_process(struct record_info *ri, struct hvm_data *h) {
+    bool nested = ri->event & TRC_HVM_NESTEDFLAG;
     if(!h->init)
     {
         if(opt.dump_all)
-            printf("!%s vmentry\n",
-                   ri->dump_header);
+            printf("!%s vmentry%s\n",
+                   ri->dump_header,
+                   nested ? "(n)" : "");
         return;
     }
 
@@ -5283,15 +5300,18 @@ void hvm_vmentry_process(struct record_info *ri, struct hvm_data *h) {
     if(!h->vmexit_valid)
     {
         if(opt.dump_all)
-            printf("!%s vmentry\n",
-                   ri->dump_header);
+            printf("!%s vmentry%s\n",
+                   ri->dump_header,
+                   nested ? "(n)" : "");
         return;
     }
 
     if(opt.dump_all) {
         unsigned long long arc_cycles = ri->tsc - h->exit_tsc;
-        printf("]%s vmentry cycles %lld %s\n",
-               ri->dump_header, arc_cycles, (arc_cycles>10000)?"!":"");
+        printf("]%s vmentry%s cycles %lld %s\n",
+               ri->dump_header,
+               nested ? "(n)" : "",
+               arc_cycles, (arc_cycles>10000)?"!":"");
     }
 
     hvm_close_vmexit(h, ri->tsc);
@@ -5323,16 +5343,20 @@ void hvm_process(struct pcpu_info *p)
         /* FIXME: Collect analysis on this */
         break;
     default:
-        switch(ri->event) {
+        switch(ri->event & ~(TRC_HVM_NESTEDFLAG|TRC_64_FLAG)) {
         case TRC_HVM_VMX_EXIT:
-        case TRC_HVM_VMX_EXIT64:
         case TRC_HVM_SVM_EXIT:
-        case TRC_HVM_SVM_EXIT64:
-            UPDATE_VOLUME(p, hvm[HVM_VOL_VMEXIT], ri->size);
+            if (ri->event & TRC_HVM_NESTEDFLAG)
+                UPDATE_VOLUME(p, hvm[HVM_VOL_VMEXIT_NESTED], ri->size);
+            else
+                UPDATE_VOLUME(p, hvm[HVM_VOL_VMEXIT], ri->size);
             hvm_vmexit_process(ri, h, v);
             break;
         case TRC_HVM_VMENTRY:
-            UPDATE_VOLUME(p, hvm[HVM_VOL_VMENTRY], ri->size);
+            if (ri->event & TRC_HVM_NESTEDFLAG)
+                UPDATE_VOLUME(p, hvm[HVM_VOL_VMENTRY_NESTED], ri->size);
+            else
+                UPDATE_VOLUME(p, hvm[HVM_VOL_VMENTRY], ri->size);
             hvm_vmentry_process(ri, &p->current->hvm);
             break;
         default:
@@ -6977,7 +7001,7 @@ void vcpu_start(struct pcpu_info *p, struct vcpu_data *v,
         /* Change default domain to 'queued' */
         runstate_update(p->current, RUNSTATE_QUEUED, p->first_tsc);
 
-        /* 
+        /*
          * Set current to NULL, so that if another vcpu (not in INIT)
          * is scheduled here, we don't trip over the check in
          * vcpu_next_update()
@@ -6997,7 +7021,7 @@ void vcpu_start(struct pcpu_info *p, struct vcpu_data *v,
 
         return;
     } else if ( v->delayed_init ) {
-        fprintf(warn, "d%dv%d RUNSTATE_RUNNING detected, leaving INIT",
+        fprintf(warn, "d%dv%d RUNSTATE_RUNNING detected, leaving INIT\n",
                 v->d->did, v->vid);
         v->delayed_init = 0;
     }
-- 
2.25.1


