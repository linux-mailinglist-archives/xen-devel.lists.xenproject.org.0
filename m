Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B6AA79183
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 16:54:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935892.1337271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzzTw-0002nc-1G; Wed, 02 Apr 2025 14:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935892.1337271; Wed, 02 Apr 2025 14:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzzTv-0002lK-UK; Wed, 02 Apr 2025 14:54:19 +0000
Received: by outflank-mailman (input) for mailman id 935892;
 Wed, 02 Apr 2025 14:54:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zyr3=WU=edera.dev=alexander@srs-se1.protection.inumbo.net>)
 id 1tzzTu-0002Wn-Ie
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 14:54:18 +0000
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [2607:f8b0:4864:20::f35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 594e59b5-0fd2-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 16:54:17 +0200 (CEST)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-6ecfc7fb2aaso61185636d6.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 07:54:17 -0700 (PDT)
Received: from dell.axolotl-tone.ts.net
 ([2605:9480:312:2031:4ed7:17ff:feaa:a013])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6eec97bdd78sm75399536d6.124.2025.04.02.07.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 07:54:15 -0700 (PDT)
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
X-Inumbo-ID: 594e59b5-0fd2-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edera.dev; s=google; t=1743605655; x=1744210455; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZi4Eq4uS4syTFaufhJVx5idvQkHlIkt7q9u4cXSyo8=;
        b=MAkQy/nkID5xO2sc9mQxifN02TonzJX7J6a6cSm3zdLVtTZflIhru8Ly2kkcraTzaJ
         S0dVuV0jqRIwIkcX4d/CjG6LVmo9Ti5rFY5JCd5GkAqmYbRkSc4OalGrODFU6wS8vTAL
         TArAlsBfifCmvVjlKtqowSxxbm/N8hVZd+ZsZXRQk+qepmGD1hshabktO/B6Vve3OYXR
         0e+DDmLyECmot258gS3ZlBqbQjIIP00GM70Sp9Qqic4/Hz1LVuvCt7+z88/1zuobmPIO
         HYTDAG965zax8iAx24D0OfPf+rJnZuoe+MlIiCQyO9YuzcwcOdwyqdbpUF1w8B4EHRIE
         +2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743605655; x=1744210455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fZi4Eq4uS4syTFaufhJVx5idvQkHlIkt7q9u4cXSyo8=;
        b=cqei0Z1Mzy439SEfZ9ODhcSThdxgZPXctGzNS+KUmr+6iA0RF9DNyssmbg/zPDZdDd
         g3w0DU4QuUDQlycLtcMiWbDCbAg/ZUYH+mloPaYyM2pdhNBL95aF5YAjL/dzINylAlVH
         t0kQLAEpferWBqbKdQdKwD77cOx4Rnz3P5E92w6rDcroYbokbTVQh1NlgWX4haocGg5H
         IR9zVnIWqyjGw0RRn3cP7T9eBFYVP0r8/TAc5Rm8IzIJyMT0F50F4WiS5kjBGGGa9OL2
         S3A37FGIeJonYob7NRKJRYUzJtqP/FniUIcd4IlJEIHTvkUZ5UzC7loQweawZaWhluaE
         IkwA==
X-Gm-Message-State: AOJu0Yw80S6++KMJmmaQea0ZlgVE9DfwUv824kIO0uhfIpPBPSzy4cTm
	kNlxM77HdnzGyiWLFdHo10gJkZWOLt6KTvmJ+Hr35yDYDTd5ZKtC06sIevO0/fcPqlzXkdQ29gb
	m1y8=
X-Gm-Gg: ASbGncvdv+IiZzfqPnGHlKzjilVNvpPfBLn/B9xEWM+wmOey6t+H6CMk1vblyr9PKxC
	GpFXbR7gtd6WZveZJ5VL1OzgmELFqZtKO7aIt1iTbhj/jOCxC94TcY9SiguikxC1rI1b8ju9G29
	g2+mvJjKmnIg2Mv5igmgjm66lX+1tUjGL9dLiQHO0HnHfaJpLMdviC33U3eBtmEFbubIMvY+hsr
	1ai8fk3onHK9FalTU/bREDc/tQ0RJIRRH3MFHJ+ErEu47nyZQSWMiouxm271UMza1aHTBNBCMIe
	HMxOjF3wkZxxgo7DZ1FBxKD9QDuX20LI3raUba89ZKGODkPgZdczoEb3z83RJL6MWnjg9r87aO4
	=
X-Google-Smtp-Source: AGHT+IF83fq1fLPTKCVMBSHP0CIenee/OmpeRoe097/dgfjTu3PK3KWVldklPVKHKeviZrFhULV2dg==
X-Received: by 2002:a05:6214:496:b0:6e8:f4d3:e8a5 with SMTP id 6a1803df08f44-6eed5fcb027mr248266536d6.15.1743605655651;
        Wed, 02 Apr 2025 07:54:15 -0700 (PDT)
From: "Alexander M. Merritt" <alexander@edera.dev>
To: xen-devel@lists.xenproject.org
Cc: "Alexander M. Merritt" <alexander@edera.dev>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 1/1] xen/x86: drop wrappers of SVM instructions
Date: Wed,  2 Apr 2025 14:54:10 +0000
Message-ID: <034a5518e8dfde9ac707b494f5d863d78efec84e.1743601241.git.alexander@edera.dev>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1743601241.git.alexander@edera.dev>
References: <cover.1743601241.git.alexander@edera.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The new toolchain baseline knows the SVM instructions.

Resolves: xen-project/xen#204

Signed-off-by: Alexander M. Merritt <alexander@edera.dev>
---
 xen/arch/x86/hvm/svm/svm.h           | 14 +++-----------
 xen/arch/x86/include/asm/asm-defns.h | 12 ------------
 2 files changed, 3 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
index beeaaab4f7..5c5e91a1ac 100644
--- a/xen/arch/x86/hvm/svm/svm.h
+++ b/xen/arch/x86/hvm/svm/svm.h
@@ -23,25 +23,17 @@ void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len);
 
 static inline void svm_vmload_pa(paddr_t vmcb)
 {
-    asm volatile (
-        ".byte 0x0f,0x01,0xda" /* vmload */
-        : : "a" (vmcb) : "memory" );
+    asm volatile ( "vmload" : : "a" (vmcb) : "memory" );
 }
 
 static inline void svm_vmsave_pa(paddr_t vmcb)
 {
-    asm volatile (
-        ".byte 0x0f,0x01,0xdb" /* vmsave */
-        : : "a" (vmcb) : "memory" );
+    asm volatile ( "vmsave" : : "a" (vmcb) : "memory" );
 }
 
 static inline void svm_invlpga(unsigned long linear, uint32_t asid)
 {
-    asm volatile (
-        ".byte 0x0f,0x01,0xdf"
-        : /* output */
-        : /* input */
-        "a" (linear), "c" (asid) );
+    asm volatile ( "invlpga" : /* output */ : /* input */ "a" (linear), "c" (asid) );
 }
 
 /*
diff --git a/xen/arch/x86/include/asm/asm-defns.h b/xen/arch/x86/include/asm/asm-defns.h
index 32d6b44910..5a64b42495 100644
--- a/xen/arch/x86/include/asm/asm-defns.h
+++ b/xen/arch/x86/include/asm/asm-defns.h
@@ -10,18 +10,6 @@
 .endm
 #endif
 
-.macro vmrun
-    .byte 0x0f, 0x01, 0xd8
-.endm
-
-.macro stgi
-    .byte 0x0f, 0x01, 0xdc
-.endm
-
-.macro clgi
-    .byte 0x0f, 0x01, 0xdd
-.endm
-
 /*
  * Call a noreturn function.  This could be JMP, but CALL results in a more
  * helpful backtrace.  BUG is to catch functions which do decide to return...
-- 
2.45.2


