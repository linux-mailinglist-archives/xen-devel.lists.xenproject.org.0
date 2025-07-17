Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A043B091CC
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 18:29:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047091.1417470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucRTm-0002M4-9r; Thu, 17 Jul 2025 16:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047091.1417470; Thu, 17 Jul 2025 16:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucRTm-0002JU-5n; Thu, 17 Jul 2025 16:29:06 +0000
Received: by outflank-mailman (input) for mailman id 1047091;
 Thu, 17 Jul 2025 16:29:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ObpW=Z6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ucRTk-0002JO-5W
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 16:29:04 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 241b2067-632b-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 18:28:59 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so914815f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 09:28:59 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e80731bsm55204195e9.15.2025.07.17.09.28.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 09:28:57 -0700 (PDT)
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
X-Inumbo-ID: 241b2067-632b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752769738; x=1753374538; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P2T4q56Gem1JMsiv/ArNA5K75O1Bp8dS3wI9bYTfg/w=;
        b=avbRP341K53Dtmmxgzy1fbAezWgl4ev8ELuJl/M6Y7Thpr6GvDb2p/KrUHMfWGG2Eh
         abDxCisODAbBDKT5lvpdhmS7aJqETrHsJfJRjcXmkCJl7aegPkeusoQrnvQJBWaVC78g
         iyJJAYLhavGgg1THneF+Ysk7IXAW47RLQYxpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752769738; x=1753374538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P2T4q56Gem1JMsiv/ArNA5K75O1Bp8dS3wI9bYTfg/w=;
        b=bAlfK7OxC4I+sXZfoKMnG7xs6NadQBQbYwvFMJEzOEKKzUv3YfrKbVq3JPv4YP7LEd
         JYGGsl6QbyJyBbn8O8NpjK0FRumZXtWM7YFnwEhijW33/nJWMSu4q3Pt2dgTq8f8wipR
         emPz6QoCVdRf8IhjfZUxMasBHpMcwuIcDL13rFXxJY4JQbXlM0pqipCeE2mSkKcxzufX
         1MKogA28ssoeijM0+XB+1FuOSeZQVQ7R3BycQP2REFLjzK40Gqr+TuRZ2b4MBW3EQbRm
         VplergoBEY1L1tJRUnt0cLJQCtDNZgtG2oiodXlU13KoIeYTDS5fTWRuCVWsRsGoKtuy
         sdWQ==
X-Gm-Message-State: AOJu0YxqqInA13ZzPZdeZruE71Mu6qUh4UdPGjF0IMYcCPR7htHng0ye
	xU4FmzgIUjLC0VxxS3o+fRWCvg5163yJsstDtxKTeRqYOcQ4/+rA7Qjpm6pMa0nGojmEHnZQjay
	130DXtBlB/g==
X-Gm-Gg: ASbGncu0SxND9tMntX/lgFuM0MTw3KAIk2ytVAQFjJvrtJp8NVNxBCJ2/Ucss2M2eu1
	Z/bA0NmmHsjJSx3jBF1vfHb3EonP5Wr8BpmUNTa5//KSkGV6OakLrciU4zP0MYRsXjHTgtcR1uo
	dINK4gybWTFQvG1rGDk8gfweAxcmfEwyoEzLO6l76wlxTHgQe/MPUC7688yXh2WKkbV6Kj7BXlt
	sA8Cl2uHngIlpbMFVjsvd+kZKguXls89s/wK3wZ4f8fyPAzef+8TqinFkSeg8MAp6I7v+ovd+rl
	JcsENZPAXOF6yS0RsHnnLu/+amOup7gp5UK6HLSpFfx7V93DIx3Ft35oiUWlvYlsYPgWaG6BPq6
	SLcYbVOYvWJz0BVBQAkVgcINDx+lzqyZRQnRMY2t9vMNBDI6hfftp/aPDodTpWow05xYvmW0Ncl
	1S
X-Google-Smtp-Source: AGHT+IEUrgjtyhm9X6rYHJ/qlii8ko7f+PxrBMfSE8u9yFmeBplZgxIVMqVxcz8K5qFWq+1ce7Z5nQ==
X-Received: by 2002:a5d:5d0c:0:b0:3b6:463:d886 with SMTP id ffacd0b85a97d-3b60e4ccea6mr6859761f8f.20.1752769738145;
        Thu, 17 Jul 2025 09:28:58 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/idle: Fix the C6 eoi_errata[] list to include NEHALEM_EX
Date: Thu, 17 Jul 2025 17:28:56 +0100
Message-Id: <20250717162856.2233585-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

NEHALEM_EX is affected by the erratum too.

Change the comment to be the full text, rather than interpretation of it.

Fixes: 95807bcae47e ("C6 state with EOI issue fix for some Intel processors")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Pulled out of the cleanup series as it wants backporting.
---
 xen/arch/x86/acpi/cpu_idle.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 19f710f0dd9d..f422316b03e2 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -584,18 +584,24 @@ bool errata_c6_workaround(void)
     {
 #define INTEL_FAM6_MODEL(m) { X86_VENDOR_INTEL, 6, m, X86_FEATURE_ALWAYS }
         /*
-         * Errata AAJ72: EOI Transaction May Not be Sent if Software Enters
-         * Core C6 During an Interrupt Service Routine"
+         * Errata AAJ72/etc: EOI Transaction May Not be Sent if Software
+         * Enters Core C6 During an Interrupt Service Routine
          *
-         * There was an errata with some Core i7 processors that an EOI
-         * transaction may not be sent if software enters core C6 during an
-         * interrupt service routine. So we don't enter deep Cx state if
-         * there is an EOI pending.
+         * If core C6 is entered after the start of an interrupt service
+         * routine but before a write to the APIC EOI (End of Interrupt)
+         * register, and the core is woken up by an event other than a fixed
+         * interrupt source the core may drop the EOI transaction the next
+         * time APIC EOI register is written and further interrupts from the
+         * same or lower priority level will be blocked.
+         *
+         * Software should check the ISR register and if any interrupts are in
+	 * service only enter C1.
          */
         static const struct x86_cpu_id eoi_errata[] = {
-            INTEL_FAM6_MODEL(0x1a),
+            INTEL_FAM6_MODEL(0x1a), /* AAJ72 */
             INTEL_FAM6_MODEL(0x1e),
             INTEL_FAM6_MODEL(0x1f),
+            INTEL_FAM6_MODEL(0x2e), /* BA106 */
             INTEL_FAM6_MODEL(0x25),
             INTEL_FAM6_MODEL(0x2c),
             INTEL_FAM6_MODEL(0x2f),
-- 
2.39.5


