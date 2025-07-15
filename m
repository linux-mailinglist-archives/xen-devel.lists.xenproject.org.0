Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D08B067E5
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 22:47:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044712.1414797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubmXu-0001gk-Gj; Tue, 15 Jul 2025 20:46:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044712.1414797; Tue, 15 Jul 2025 20:46:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubmXu-0001f9-DV; Tue, 15 Jul 2025 20:46:38 +0000
Received: by outflank-mailman (input) for mailman id 1044712;
 Tue, 15 Jul 2025 20:46:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6ZfW=Z4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ubmXt-0001f3-0i
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 20:46:37 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9dd50a0-61bc-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 22:46:31 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a522224582so3029550f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 13:46:31 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e7f2d4fsm954075e9.4.2025.07.15.13.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 13:46:30 -0700 (PDT)
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
X-Inumbo-ID: c9dd50a0-61bc-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752612391; x=1753217191; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rpiN/L2/GYLFkGj+NQZ9/20Wx3+NoNPS3w4mMjkBd2g=;
        b=gRiAoc7xPV0e0S+MJVlqdm6Hi1je5+zq9ahrIKHwn/82Tsm++Ge1FwSuyFt9kZaErj
         kfo4CQAuaI/O7Z606ZR1tecswv5ys06FnbjK0P2f/W9/FfQLBr/LdscXfNv4ypCTNQYk
         7SKgacx1fUr9h2NpWkbZADJRAu37Z3VhrgdjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752612391; x=1753217191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpiN/L2/GYLFkGj+NQZ9/20Wx3+NoNPS3w4mMjkBd2g=;
        b=g+oMRYGrWhk/YnRQ4ekVzOeaHHuFmHZEAX3Ty11XKOaxC9W/ecwou/+Iia17v6udWw
         V20W3SoxwMudpTnv4UBfhajmnJyDhSYpmZixOUPURUhYnLVEljUMxVw8vXWyo8bwshYW
         dqzXsWIRtaVKufz+m8YzJre2z9EjcBanRKdeXiJPEiwRHTtHMd3iVRYOr40BMovu1CrC
         HE4rge0lEwGzZPr33ANJWnEexPW3+g0SdNboHMIGMIcqspQNXhGKQ+OBPwPsbN1hqJGA
         PbcZKzIHpk1qiZA3v9ojN6915i1rS3ZY8UMA82MJ7K6CfDpCU4nDc0ig20ATBMFfXu8W
         bP0g==
X-Gm-Message-State: AOJu0YxiIv6XNAPZOSIfwC4iej6+/ao+iGVU4VXCqXW8BTniuR2gwA3r
	3te+z+6xS9NUcqVhLaOUk0ekRQRlHucNTVm73PlLTBwlhbAbK+bOYsLNqoysJdXyUmQF7EUudj/
	WG1w07+WzhA==
X-Gm-Gg: ASbGnctSIWqrSB9JysvB5nQ2kwV6GRZRnYyj0pim27U/dQuaG2ZhrijFNvslTrneD2N
	MubuxWrKgK0bNp9s+/g5UH2kG62DyzORat9iIkuvxQ9QaXhOwT2dliYZpXJaoDyIlytTGYFjkZ4
	VFL7cUjybpjqCitO9XcKWbAlF1vz2UN334POtoFyFw7YEt73VjCdyWt9tIP7iRQQhJHofnEZRuk
	FZ1raUunIem7rhQye9ieDW0dpYTnje/QtfAIoUAsx7ZkUOkDO1oZ54vpDSKueTM1tC1jHJyiHo0
	AmgXDSxYacJLhb4udoRsxLxYSPzL3H7Wt+LYZZd+fiRtFnWJ5zYMTjOmeuw8aWoTZPtAcq8X9h0
	z2Lx5797y+IFf+1lWX4ju0kK6yO1FIbu6VYQ4WuqzpRSKMdJ5sM11ArA3exPLLM3GsKGqf7cMO3
	7/
X-Google-Smtp-Source: AGHT+IGU9RIt9dX+nG5hvz0ICYWfap9LMZOHwo7MdiqjgwGzGoHpNySxgxADbY2N5cSSxyuRwgLcbw==
X-Received: by 2002:a05:6000:288f:b0:3b6:489:b7e5 with SMTP id ffacd0b85a97d-3b60ddc5a47mr380487f8f.49.1752612390972;
        Tue, 15 Jul 2025 13:46:30 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86: Drop rep_nop() and use the PAUSE mnemonic directly
Date: Tue, 15 Jul 2025 21:46:28 +0100
Message-Id: <20250715204628.1848686-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In udelay(), use cpu_relax() directly which, for better or worse, is the
common way to refer to the PAUSE instruction.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/delay.c                 | 2 +-
 xen/arch/x86/include/asm/processor.h | 9 ++-------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/delay.c b/xen/arch/x86/delay.c
index b3a41881a17a..ed093fbb0861 100644
--- a/xen/arch/x86/delay.c
+++ b/xen/arch/x86/delay.c
@@ -23,7 +23,7 @@ void udelay(unsigned long usecs)
     s = rdtsc_ordered();
     do
     {
-        rep_nop();
+        cpu_relax();
         e = rdtsc_ordered();
     } while ((e-s) < ticks);
 }
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 04824c3633cf..b6e8de5e864d 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -340,13 +340,8 @@ DECLARE_PER_CPU(root_pgentry_t *, root_pgt);
 
 extern void write_ptbase(struct vcpu *v);
 
-/* REP NOP (PAUSE) is a good thing to insert into busy-wait loops. */
-static always_inline void rep_nop(void)
-{
-    asm volatile ( "rep;nop" : : : "memory" );
-}
-
-#define cpu_relax() rep_nop()
+/* PAUSE (encoding: REP NOP) is a good thing to insert into busy-wait loops. */
+#define cpu_relax() asm volatile ( "pause" ::: "memory" )
 
 void show_code(const struct cpu_user_regs *regs);
 void show_stack_overflow(unsigned int cpu, const struct cpu_user_regs *regs);
-- 
2.39.5


