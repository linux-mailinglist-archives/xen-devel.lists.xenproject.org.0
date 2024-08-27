Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE1E960CC0
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 15:58:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784070.1193458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwhp-0004dw-Kr; Tue, 27 Aug 2024 13:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784070.1193458; Tue, 27 Aug 2024 13:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwhp-0004bl-H1; Tue, 27 Aug 2024 13:57:57 +0000
Received: by outflank-mailman (input) for mailman id 784070;
 Tue, 27 Aug 2024 13:57:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovuO=P2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1siwho-00047p-5u
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 13:57:56 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c13d309-647c-11ef-a0b0-8be0dac302b0;
 Tue, 27 Aug 2024 15:57:55 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5bed83487aeso5778025a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 06:57:55 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e588adf2sm113898966b.173.2024.08.27.06.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 06:57:53 -0700 (PDT)
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
X-Inumbo-ID: 5c13d309-647c-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724767074; x=1725371874; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GG6I/ExZxOSYobQF/vdPu38zR0FWgZTstjCiLrrIFG0=;
        b=MCmjjpNMXpD0a2g1Hc4BAkYGMNPAKitkxzoNKlaS4XtaHY8gjS6Xf/taKgENk2VN9Y
         V0hUknZLMt9TcBXfmP2eGSPGw1Mrrb/7+2/MCI8SUSESn5HrWpN8lQ6ALeydWIhiQyfC
         9d7QEyHofboSqHVDP51OhyAco38xAg0ux+trQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724767074; x=1725371874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GG6I/ExZxOSYobQF/vdPu38zR0FWgZTstjCiLrrIFG0=;
        b=fkuhc/SZOgd9C/o8XIvO1sUS7pyexqkTXVzVgs2wcs56bb5+cHt/TAcyXWsxmMdCjT
         lWy0lky6DI3KL8DhVRRMPABLnIalFY8nn4SwRorO2EN6RJhL6vl07oLeR7ac/lN9Yztq
         LCVSNeXXlxI0JqAzMTtGPjEJIleIoVUaceO25UrXQ2aotzQQ+JkqxUc45ynO8zt6FMMi
         aMTv465ptmrWsKwhTWXVTRqr1UKtMj2EjDOUFVwiAPI8FK58BPj1MFx+r3ENPnTByHth
         9tRwx/hdMeK0KLgpsYxsHKTPSCtV2kcPYqqqFpK0VKe6M0SZ7auQopueL4GqXIS7jSGJ
         vjcw==
X-Gm-Message-State: AOJu0YyyAURZ/sZkjTmRVAE2TpRGMOWUgLgV7efgwFD6LUxxygHWVdD6
	3nSNbpkG2DgLh2hNbgqEDIkLqmNE9AU+pDYud3w53KQRuHxGeg/8bQiLyNVsahN3RYWUBAYoD7B
	/
X-Google-Smtp-Source: AGHT+IGPFcMG0+WuSEvzaLfVo4yvDOnp6oCLBMJgVrqDnI5Yvr5lFEvM6AhodWIgFxEHdcFp/6Tj+A==
X-Received: by 2002:a17:907:7d94:b0:a86:b46b:860a with SMTP id a640c23a62f3a-a86e3be5cf1mr197371566b.54.1724767074158;
        Tue, 27 Aug 2024 06:57:54 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/4] x86/hvm: Use for_each_set_bit() in hvm_emulate_writeback()
Date: Tue, 27 Aug 2024 14:57:44 +0100
Message-Id: <20240827135746.1908070-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827135746.1908070-1-andrew.cooper3@citrix.com>
References: <20240827135746.1908070-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... which is more consise than the opencoded form.

Also, for production VMs, ~100% of emulations are simple MOVs, so it is likely
that there are no segments to write back.

Furthermore, now that find_{first,next}_bit() are no longer in use, the
seg_reg_{accessed,dirty} fields aren't forced to be unsigned long, although
they do need to remain unsigned int because of __set_bit() elsewhere.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Pulling current out into curr is good for code generation.  When using current
in the loop, GCC can't retain the calculation across the call to
hvm_set_segment_register() and is forced to re-read from the cpu_info block.

However, if curr is initialised, it's calculated even in the likely path...
---
 xen/arch/x86/hvm/emulate.c             | 20 ++++++++++----------
 xen/arch/x86/include/asm/hvm/emulate.h |  4 ++--
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index feb4792cc567..732bdbab25b0 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2908,18 +2908,18 @@ void hvm_emulate_init_per_insn(
 void hvm_emulate_writeback(
     struct hvm_emulate_ctxt *hvmemul_ctxt)
 {
-    enum x86_segment seg;
+    struct vcpu *curr;
+    unsigned int dirty = hvmemul_ctxt->seg_reg_dirty;
 
-    seg = find_first_bit(&hvmemul_ctxt->seg_reg_dirty,
-                         ARRAY_SIZE(hvmemul_ctxt->seg_reg));
+    if ( likely(!dirty) )
+        return;
 
-    while ( seg < ARRAY_SIZE(hvmemul_ctxt->seg_reg) )
-    {
-        hvm_set_segment_register(current, seg, &hvmemul_ctxt->seg_reg[seg]);
-        seg = find_next_bit(&hvmemul_ctxt->seg_reg_dirty,
-                            ARRAY_SIZE(hvmemul_ctxt->seg_reg),
-                            seg+1);
-    }
+    curr = current;
+
+    for_each_set_bit ( seg, dirty )
+        hvm_set_segment_register(curr, seg, &hvmemul_ctxt->seg_reg[seg]);
+
+    hvmemul_ctxt->seg_reg_dirty = 0;
 }
 
 /*
diff --git a/xen/arch/x86/include/asm/hvm/emulate.h b/xen/arch/x86/include/asm/hvm/emulate.h
index 29d679442e10..972cdf1fa0cf 100644
--- a/xen/arch/x86/include/asm/hvm/emulate.h
+++ b/xen/arch/x86/include/asm/hvm/emulate.h
@@ -36,8 +36,8 @@ struct hvm_emulate_ctxt {
     unsigned int insn_buf_bytes;
 
     struct segment_register seg_reg[10];
-    unsigned long seg_reg_accessed;
-    unsigned long seg_reg_dirty;
+    unsigned int seg_reg_accessed;
+    unsigned int seg_reg_dirty;
 
     /*
      * MFNs behind temporary mappings in the write callback.  The length is
-- 
2.39.2


