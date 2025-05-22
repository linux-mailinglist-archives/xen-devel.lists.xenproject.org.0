Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0F7AC0F33
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 17:00:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994169.1377232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI7PG-0004Np-64; Thu, 22 May 2025 15:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994169.1377232; Thu, 22 May 2025 15:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI7PG-0004KC-1Y; Thu, 22 May 2025 15:00:26 +0000
Received: by outflank-mailman (input) for mailman id 994169;
 Thu, 22 May 2025 15:00:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ckVG=YG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uI7PE-0003kR-B6
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 15:00:24 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7cf75ed1-371d-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 17:00:24 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-601f278369bso9150926a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 08:00:24 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005ac32a7fsm10550119a12.56.2025.05.22.08.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 08:00:22 -0700 (PDT)
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
X-Inumbo-ID: 7cf75ed1-371d-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747926023; x=1748530823; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lr3f4QVXBQIDCvAtm/J7FXqG+fuDtkqVk40mCLaFjM8=;
        b=rXjMiK9JnMJRdG4PnhsWg2h4PlT+CAz96h165SNajgQoZNEin7atLn6c/iWpVjpTsi
         Wv962se85Z+3GjDberiNeUkE9LoYBJ0BaeE+yyUCjs6hBH5luQ9SMJEwqsC/BRkTzvsg
         k5Z6enxHV6YgqDl9Dtuaqyx6GAMtJtQETr04k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747926023; x=1748530823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lr3f4QVXBQIDCvAtm/J7FXqG+fuDtkqVk40mCLaFjM8=;
        b=IAflsfANmTnaLivvIBKFLpXUjWqcqIAnmWoeYOB8daT0wpnxO+1DlA/s7nHyY6z3+f
         9Hj5ctAlqJla8CPY04sC4B9Bj4iKfy/ejr+csO+mukAn5+MFN89pacWs/qoUrcei9UoC
         hgRIsl2f3vU4A35JNtpD4OGtcqffB9RT01YzjqUj7PoG8dZVZ85s6+/zPsuTiTgFZYRu
         Q/J0c+Ox+5LySfZDSI9YrnEvGTHmRDj2RmV0RdzYUik9LxPRQY6SoCbDMXe5NkoExNli
         nXRRV7X6Vtwv3+TSnivLSRP69AY3NAwSpkKzit+Q5KvWV9sf0oS04cFYIc7DKd2BQSVm
         q1vw==
X-Gm-Message-State: AOJu0YwGuMX2wPBcgZrIhwkWrOW5V9hJd5D/UkFUy6tMEnH3/BBbc4cI
	0HmLKUxmECNToJaKG2weg+DgcePIj+xMYbvxreIa/gG3jd+m2q9ELEF3GhBMaZhO/4XJ3E6vgiZ
	ABEgs
X-Gm-Gg: ASbGncuclKk9nRqynWHj8RCsTd+nvINalFWzDkYTgd+f9XYVsrLYzhwA5unCTP0bURh
	V3r/p3lfZ8fK/z/Q5hdx55HD41eF8c671Eu0aDSqpqfbHeYM1rcOQc1x6q3fOkwBDkBwoRkK4fC
	pHHFXG6RapxSW369miThBx7OWFQ6rU66fPM78A3bfRfX16qo8nMaPjZ+Zit1GCRNYBlDnRXA85P
	qxWKLez+VlWtxPlX71n/008Q61hpKxh86NxTGksfYzO8fQ/dUkXL2IlCSS4i72j6rVxFDaJZdsm
	zOA6bxFRz+rcmjXjjORP3bY8Z+7WHKtr9T/7TVl2uKLCmrnIm68JIuu9oBuCsd1F8MubbxOwzXZ
	V5vpVaqg6eemavYXw1cthqX+l
X-Google-Smtp-Source: AGHT+IGwN3+4ZGB1CCik2Dp+hZVMQfvh8ozffLpfJ+B7Xqh8901rhiCpfdZYsF8r17CSvH0+QTy0rw==
X-Received: by 2002:a05:6402:50cc:b0:601:9dc3:2795 with SMTP id 4fb4d7f45d1cf-6019dc32e17mr18470941a12.7.1747926023055;
        Thu, 22 May 2025 08:00:23 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/3] x86/alternatives: Introduce init_or_livepatch_ro_after_init
Date: Thu, 22 May 2025 16:00:15 +0100
Message-Id: <20250522150015.555492-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522150015.555492-1-andrew.cooper3@citrix.com>
References: <20250522150015.555492-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... and use it for ideal_nops and toolchain_nops_are_ideal; both of which are
invariant after arch_init_ideal_nops() has run.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/alternative.c  | 4 ++--
 xen/include/xen/livepatch.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index ff7d83c0ddbd..058a8b22d41f 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -47,7 +47,7 @@ static const unsigned char p6_nops[] init_or_livepatch_const = {
 };
 #endif
 
-static const unsigned char *ideal_nops init_or_livepatch_data = p6_nops;
+static const unsigned char *ideal_nops init_or_livepatch_ro_after_init = p6_nops;
 
 #ifdef HAVE_AS_NOPS_DIRECTIVE
 
@@ -56,7 +56,7 @@ asm ( ".pushsection .init.rodata, \"a\", @progbits\n\t"
       "toolchain_nops: .nops " __stringify(ASM_NOP_MAX) "\n\t"
       ".popsection\n\t");
 extern char toolchain_nops[ASM_NOP_MAX];
-static bool init_or_livepatch_read_mostly toolchain_nops_are_ideal;
+static bool init_or_livepatch_ro_after_init toolchain_nops_are_ideal;
 
 #else
 # define toolchain_nops_are_ideal false
diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
index d074a5bebecc..62f8db2b55b4 100644
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -29,6 +29,7 @@ struct xen_sysctl_livepatch_op;
 #define init_or_livepatch_constrel
 #define init_or_livepatch_data
 #define init_or_livepatch_read_mostly __read_mostly
+#define init_or_livepatch_ro_after_init __ro_after_init
 #define init_or_livepatch
 
 /* Convenience define for printk. */
@@ -153,6 +154,7 @@ void revert_payload_tail(struct payload *data);
 #define init_or_livepatch_constrel    __initconstrel
 #define init_or_livepatch_data        __initdata
 #define init_or_livepatch_read_mostly __initdata
+#define init_or_livepatch_ro_after_init __initdata
 #define init_or_livepatch             __init
 
 static inline int livepatch_op(struct xen_sysctl_livepatch_op *op)
-- 
2.39.5


