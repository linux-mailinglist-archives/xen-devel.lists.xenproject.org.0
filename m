Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4C7918379
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:58:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749012.1157008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTA0-0001WK-Jg; Wed, 26 Jun 2024 13:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749012.1157008; Wed, 26 Jun 2024 13:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTA0-0001L2-Ag; Wed, 26 Jun 2024 13:58:08 +0000
Received: by outflank-mailman (input) for mailman id 749012;
 Wed, 26 Jun 2024 13:58:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1Ku=N4=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sMT9y-0000af-JH
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:58:06 +0000
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [2607:f8b0:4864:20::72b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bc125b2-33c4-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 15:58:05 +0200 (CEST)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-79c06a06a8eso99842385a.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 06:58:05 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79bce9318f6sm499371185a.101.2024.06.26.06.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 06:58:03 -0700 (PDT)
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
X-Inumbo-ID: 1bc125b2-33c4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719410284; x=1720015084; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CicAy88BoQhTqLPRoVgCuGO0iyrk5R5H3mkM3cjN/E=;
        b=J6ZCXsgv6aZiOJCAsaTTg8qJPXOAnqYSAzGzNjwu4pN8+c/V4tTM6Gx06TrimhfXZz
         Z+2IMsj+VCpgXjUzu9ik6hDB3lHAnRSL2CtgzInB0i9+CJK4N5kANfbPDdyqPQbgf/hU
         5M7HRJJq+zAIi9YegdDEnlRC+LGKFVc8i+O40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410284; x=1720015084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CicAy88BoQhTqLPRoVgCuGO0iyrk5R5H3mkM3cjN/E=;
        b=D0t9vUZeOFo4zOhL43Fk1vUxTKLd/Z6EVe36fNBuGfvnIQhl51NDmSCqbHxZPqNewt
         WMnZlOzlTuIy9Ckt+OKVkawRuD8TpTeINDR1V5twzolgo3shiDVqJvdSpOfU+tcPAuXn
         tPUN5C901OYxiDBCmRm0AaOLGS4zHTz8Dz98o9k5YxSpwTyblNQi6yYiPGBG0U28ft0L
         bd4SjLvPWffAc0mnteXlgJirIFwFXzqLStLl6sHfMGPL5uajWNDgFBsZpJHxCLmkjvYQ
         e1qEEAffGbx36efhVpOYJAUTqv3aT28T7Pfe5RmjLGaRiPpiy+uYZ63r/2clfqtTUbmo
         0Z8w==
X-Gm-Message-State: AOJu0Yx/7G9iTJd5E0FGKqxov6Lo9XhjJex/YZCX9A1SYxs9Fw0UlJSK
	nPjSd7fUn2zdf3Yjfx5J3+b0wdo0R6KhP/qYrb3brPqb5w0VQ+1jnbFqi66Q2xhX3n/1rHRefdr
	9nFY=
X-Google-Smtp-Source: AGHT+IFuaaGzYU5rWVD3+w/otwtbTWoRCXh7i4fUBEqB1FYOqspJGP6Lpr0Q080r7c8cpsLLXlmXCA==
X-Received: by 2002:a05:620a:1a19:b0:797:b319:c3a2 with SMTP id af79cd13be357-79be6eae80dmr1257297985a.39.1719410283769;
        Wed, 26 Jun 2024 06:58:03 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>
Subject: [PATCH WIP 04/14] xenalyze: Track generic event information when not in summary mode
Date: Wed, 26 Jun 2024 14:38:43 +0100
Message-Id: <20240626133853.4150731-5-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626133853.4150731-1-george.dunlap@cloud.com>
References: <20240626133853.4150731-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Generally speaking, a VMEXIT/VMENTRY cycle should have at least three
trace records: the VMEXIT trace (which contains the processor-specific
exit code), a more generic Xen-based Xen event (an HVM_HANDLER trace
record), and a VMEXIT trace; and any given VMEXIT exit reason should
only have a single HVM_HANDLER trace type.  Having duplicate or
missing HVM_HANDLER traces is generally indicative of a problem that's
crept in in the hypervisor tracing scheme.

This is property is checked in hvm_generic_postprocess(), and
violations are flagged with a warning.  In order to do this, when an
HVM trace record that doesn't have a specific post-processor happens,
information about the HVM trace record is stored in
hvm_data->inflight.generic.

Unfortunately, while the check was being done in all "modes", the
relevant information was only being copied into inflight.generic in
summary mode.  This resulted in spurious warnings about missing
HVM_HANDLER traces when running in dump mode.

Since running in dump mode is often critical to understanding how the
warnings came about, just collect the information always as well.

That said, the data from the trace doesn't appear to be used by
anyone; so to save some time, don't bother copying it.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
 tools/xentrace/xenalyze.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index 52ee7a5f9f..46248e9a70 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -1367,7 +1367,6 @@ struct hvm_data {
             } msr;
             struct {
                 unsigned int event;
-                uint32_t d[4];
             } generic;
             struct {
                 unsigned eax;
@@ -4572,8 +4571,7 @@ void hvm_npf_process(struct record_info *ri, struct hvm_data *h)
                (unsigned long long)r->gpa, r->qualification,
                (unsigned long long)r->mfn, r->p2mt);
 
-    if ( opt.summary_info )
-        hvm_generic_postprocess_init(ri, h);
+    hvm_generic_postprocess_init(ri, h);
 }
 
 void hvm_rdtsc_process(struct record_info *ri, struct hvm_data *h)
@@ -4621,7 +4619,6 @@ void hvm_generic_postprocess_init(struct record_info *ri, struct hvm_data *h)
         fprintf(warn, "%s: Strange, h->postprocess set!\n",
                 __func__);
     h->inflight.generic.event = ri->event;
-    bcopy(h->d, h->inflight.generic.d, sizeof(unsigned int) * 4);
 }
 
 void hvm_generic_postprocess(struct hvm_data *h)
@@ -4899,8 +4896,7 @@ needs_vmexit:
     default:
         if(opt.dump_all)
             hvm_generic_dump(ri, "]");
-        if(opt.summary_info)
-            hvm_generic_postprocess_init(ri, h);
+        hvm_generic_postprocess_init(ri, h);
         break;
     }
 }
@@ -6166,11 +6162,10 @@ void shadow_fault_generic_process(struct record_info *ri, struct hvm_data *h)
 
     /* pf-case traces, vs others */
     h->inflight.generic.event = ri->event;
-    bcopy(ri->d, h->inflight.generic.d, sizeof(unsigned int) * 4);
 
     if(opt.dump_all)
-        shadow_fault_generic_dump(h->inflight.generic.event,
-                                  h->inflight.generic.d,
+        shadow_fault_generic_dump(ri->event,
+                                  ri->d,
                                   "]", ri->dump_header);
 
     h->inflight.pf_xen.pf_case = sevt.minor;
-- 
2.25.1


