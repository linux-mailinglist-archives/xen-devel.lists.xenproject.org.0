Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C988B6119
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 20:29:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714344.1115530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Vjr-0002rW-EW; Mon, 29 Apr 2024 18:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714344.1115530; Mon, 29 Apr 2024 18:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Vjr-0002oJ-Af; Mon, 29 Apr 2024 18:28:31 +0000
Received: by outflank-mailman (input) for mailman id 714344;
 Mon, 29 Apr 2024 18:28:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yZQG=MC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s1Vjp-0002kh-HT
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 18:28:29 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4539d4d4-0656-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 20:28:27 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-56e69a51a33so4309468a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 11:28:27 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h25-20020a0564020e9900b0056bc0c44f02sm13241293eda.96.2024.04.29.11.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 11:28:26 -0700 (PDT)
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
X-Inumbo-ID: 4539d4d4-0656-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714415306; x=1715020106; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUdqn8yUPt0MflCFKO44Jy4f931QdjFQX4/EF2ueLbI=;
        b=ZlJQTcT8Kgcp/GaZvjkHOihS5Iv/MahsITYBuS3gBoOcxJBBSuyThxbgcsN30pLrUN
         E4LGBbhobTd+bxWWlspiRkVBLM36NeeW2FJsydHCUpRYQ+gPmy/lHorNDiu0e/gYNbWg
         Tzz/czM9gjUyMNaTTKV7g09GAnt5GNSajXZQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714415306; x=1715020106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUdqn8yUPt0MflCFKO44Jy4f931QdjFQX4/EF2ueLbI=;
        b=EtYHpifRT27DoK0wa7YNAH8UyrWQEy2ykQffHJEgn/1GapmqsLp6Xm4ClT98EYaJv3
         AyqSzzcg8+NmPFBujyX+5qnKLLw6nNGqK80NKInxoaND13V6prINjGoSsON5TVwF+lpL
         tMP1d14l9jlhpwce4jg/tHQE4G4Q+G0sGC+TnmELzQQ8Z1WYr3tC2YfbGmylJ/Dme1eY
         A5j/reSaD8qEEz6OAAk+xOVBnEg2cuuelSmgiHT0Q5sQdz6yppRlyMcmYg913oihf4Ue
         QOnxJRcPCNTA5eRI8ceng/ity/YP53QXDnboWtaRD1c/OOV/e+eXBcMGzM37TFuTa9q2
         uIvg==
X-Gm-Message-State: AOJu0YztKPIoxHDfLg0B1fmYw4vzABLJRD3/3NCSrySnNef4v1HOUCUJ
	sy9jETHtF6lXKRKM/E59tzXPLSjKO+kItfCSM/ZsQ6sI5HYWUw9AlJ87kbzT+KfOSJiUJzJBBBs
	M
X-Google-Smtp-Source: AGHT+IHXBawz6JpDRHazp+O1fHnxg6joyWlQlXd46cii/bn/mOjqqALSQkG6sVyPZRnPl/V1xOEuZQ==
X-Received: by 2002:a50:875e:0:b0:56b:cfef:b2de with SMTP id 30-20020a50875e000000b0056bcfefb2demr7789583edv.26.1714415306494;
        Mon, 29 Apr 2024 11:28:26 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/4] x86/hvm: Defer the size calculation in hvm_save_cpu_xsave_states()
Date: Mon, 29 Apr 2024 19:28:20 +0100
Message-Id: <20240429182823.1130436-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240429182823.1130436-1-andrew.cooper3@citrix.com>
References: <20240429182823.1130436-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

HVM_CPU_XSAVE_SIZE() may rewrite %xcr0 twice.  Defer the caluclation it until
after we've decided to write out an XSAVE record.

Note in hvm_load_cpu_xsave_states() that there were versions of Xen which
wrote out a useless XSAVE record.  This sadly limits out ability to tidy up
the existing infrastructure.  Also leave a note in xstate_ctxt_size() that 0
still needs tolerating for now.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * New
---
 xen/arch/x86/hvm/hvm.c | 10 ++++++++--
 xen/arch/x86/xstate.c  |  2 +-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 0ce45b177cf4..9594e0a5c530 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1197,12 +1197,13 @@ static int cf_check hvm_save_cpu_xsave_states(
     struct vcpu *v, hvm_domain_context_t *h)
 {
     struct hvm_hw_cpu_xsave *ctxt;
-    unsigned int size = HVM_CPU_XSAVE_SIZE(v->arch.xcr0_accum);
+    unsigned int size;
     int err;
 
-    if ( !cpu_has_xsave || !xsave_enabled(v) )
+    if ( !xsave_enabled(v) )
         return 0;   /* do nothing */
 
+    size = HVM_CPU_XSAVE_SIZE(v->arch.xcr0_accum);
     err = _hvm_init_entry(h, CPU_XSAVE_CODE, v->vcpu_id, size);
     if ( err )
         return err;
@@ -1255,6 +1256,11 @@ static int cf_check hvm_load_cpu_xsave_states(
     if ( !cpu_has_xsave )
         return -EOPNOTSUPP;
 
+    /*
+     * Note: Xen prior to 4.12 would write out empty XSAVE records for VMs
+     * running on XSAVE-capable hardware but without XSAVE active.
+     */
+
     /* Customized checking for entry since our entry is of variable length */
     desc = (struct hvm_save_descriptor *)&h->data[h->cur];
     if ( sizeof (*desc) > h->size - h->cur)
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index cf94761d0542..99cedb4f5e24 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -573,7 +573,7 @@ unsigned int xstate_ctxt_size(u64 xcr0)
     if ( xcr0 == xfeature_mask )
         return xsave_cntxt_size;
 
-    if ( xcr0 == 0 )
+    if ( xcr0 == 0 ) /* TODO: clean up paths passing 0 in here. */
         return 0;
 
     return hw_uncompressed_size(xcr0);
-- 
2.30.2


