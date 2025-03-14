Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42305A61D1E
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 21:49:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915420.1320951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttByF-0001YT-2e; Fri, 14 Mar 2025 20:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915420.1320951; Fri, 14 Mar 2025 20:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttByE-0001Vl-W2; Fri, 14 Mar 2025 20:49:30 +0000
Received: by outflank-mailman (input) for mailman id 915420;
 Fri, 14 Mar 2025 20:49:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXxa=WB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ttByD-0001Vd-O2
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 20:49:29 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1ebd23e-0115-11f0-9899-31a8f345e629;
 Fri, 14 Mar 2025 21:49:27 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ac34257295dso93720966b.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 13:49:27 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac314a47fdcsm273079966b.146.2025.03.14.13.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 13:49:25 -0700 (PDT)
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
X-Inumbo-ID: d1ebd23e-0115-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741985367; x=1742590167; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kWKBeQuJUntCARKpU3ty0Mc65OJMO0R3PNKxg2r3dlw=;
        b=a2p3FplU7XK7R8jKmLzY1TXpzrDvk9G19Gq4vRLQVNbej85PQ7rht0vmOfvBizg43O
         M5vVg60QyzOnBOwuv7a43PfJL1Q/tmg+qubcKr7nIXprYZZiOewZCT/+k4rM8xNPO2te
         USdoBBGNfgpYORt0ELdDgA8bW7vXvdtWSMQYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741985367; x=1742590167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWKBeQuJUntCARKpU3ty0Mc65OJMO0R3PNKxg2r3dlw=;
        b=mirOI9rfs95UYF21a0XKT16kEU7nTrygdRnLFqOLz5E/SPXv/sv4y+K+5Rm6lL3bH7
         CRTqVyc2zPL2rnLjPszoSnb7u91UeV1x+bOh3pVC4Rz/H/HEtD56tGSEoe3B97LUb6/M
         Y4SGug+rXodwh2lhoMMlMvwN/OXTUHPBDNQVWP+udt2DqXddYFeZO9g1rnSQf9J7kCSz
         hs+awF/Iz0mjCbiTRcesRGfVU8oGlwmg9jge6u891B4koMgrsozvNSu28cavbzKtO+Op
         gmo+vtuaS8U1c/oX4h8y5fMIgYjjLDl8y7h7cVIAlEeQW1H3WUEcAeqK80XTp8UTryRj
         TBCA==
X-Gm-Message-State: AOJu0YwtflnSieHb6qpIbrGcNmfQW6IqDT1Xio45gQnmzAN/RRSPRggd
	BTT3BwJ1ItpiOH7QzbHJm1YveKWGyi5O19c28Q7nMeThPF9LjddJCOJ3JZ21FeMhCjlVK+VidOk
	P
X-Gm-Gg: ASbGncvLvQoSdqpKjpebQmAUCw+yJNB4yTMqKmfsCuEn1SXySG8JO+Tqs8llx4UTgor
	Uku3CMZ1PQ/9mtUeQVk4aGjFUvgDPMbA44SPDXChAw6W84DMmjYTwBpi9Kf0aBUD8EnA/R6kTe8
	ID7T5+hFtrVtTSFG6fvXkFSoNg2RnWxsRFWMcmRuDBdfVtHvbMUAgFLJpsYGsK5gMshIOnU9+Hg
	KVVgSWXkheu6R9n2NB4Jy7VQIt6a0wwzxxd0rcSEUmxC/qLCwF4xinzsSgqmarORvXUylAqf3XI
	eRGldol6qklJea15gbN4KaI/gG8iW0OoGxv2G/eqfb28FmIMxcsOSYojDFWAj50Pw8aHuSq8OQ5
	5DkRaZblIU5aMiREJqx2l6fWa
X-Google-Smtp-Source: AGHT+IGooEwOAYBKvvjwqqNk/r5gIY0aNgGG/FqT7CwUVBeVGjtZKgVFECTqOynfr+95rl0MYgmsoA==
X-Received: by 2002:a17:907:a08a:b0:ac2:ba52:f918 with SMTP id a640c23a62f3a-ac3302c5738mr414029466b.23.1741985366756;
        Fri, 14 Mar 2025 13:49:26 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] x86/hvm: Use for_each_set_bit() in hvm_emulate_writeback()
Date: Fri, 14 Mar 2025 20:49:20 +0000
Message-Id: <20250314204920.118065-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... which is more consise than the opencoded form, and more efficient when
compiled.

For production VMs, ~100% of emulations are simple MOVs, so it is likely that
there are no segments to write back.

Furthermore, now that find_{first,next}_bit() are no longer in use, the
seg_reg_{accessed,dirty} fields aren't forced to be unsigned long, although
they do need to remain unsigned int because of __set_bit() elsewhere.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Don't clear reg_dirty.  That mess can be sorted out later.

Bloat-o-meter reports:

  add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-43 (-43)
  Function                                     old     new   delta
  hvm_emulate_writeback                        131      88     -43

find_{first,next}_bit() did expand inline without function calls, but the loop
they create has two exit paths, and repeatedly shifts seg_reg by the last
answer before doing BSF on the result.

I still can't persuade GCC to do the early exit prior to establishing the
stack frame, and unlike do_livepatch_work(), it's not critical enough to
require noinline games.
---
 xen/arch/x86/hvm/emulate.c             | 18 ++++++++----------
 xen/arch/x86/include/asm/hvm/emulate.h |  4 ++--
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 1db14642b362..e8c704ab041c 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -3022,18 +3022,16 @@ void hvm_emulate_init_per_insn(
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
 }
 
 /*
diff --git a/xen/arch/x86/include/asm/hvm/emulate.h b/xen/arch/x86/include/asm/hvm/emulate.h
index d61eacfaa779..c7a2d2a5be4e 100644
--- a/xen/arch/x86/include/asm/hvm/emulate.h
+++ b/xen/arch/x86/include/asm/hvm/emulate.h
@@ -37,8 +37,8 @@ struct hvm_emulate_ctxt {
     unsigned int insn_buf_bytes;
 
     struct segment_register seg_reg[10];
-    unsigned long seg_reg_accessed;
-    unsigned long seg_reg_dirty;
+    unsigned int seg_reg_accessed;
+    unsigned int seg_reg_dirty;
 
     /*
      * MFNs behind temporary mappings in the write callback.  The length is
-- 
2.39.5


