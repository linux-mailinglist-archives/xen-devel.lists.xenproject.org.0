Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E63B2873D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 22:41:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083891.1443396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1Ex-0007BX-VG; Fri, 15 Aug 2025 20:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083891.1443396; Fri, 15 Aug 2025 20:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1Ex-000791-OR; Fri, 15 Aug 2025 20:41:31 +0000
Received: by outflank-mailman (input) for mailman id 1083891;
 Fri, 15 Aug 2025 20:41:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFbR=23=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1un1Ev-0005E7-Ie
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 20:41:29 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 384b6a2c-7a18-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 22:41:29 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45a1abf5466so13081975e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 13:41:29 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb5d089e07sm3153924f8f.0.2025.08.15.13.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 13:41:27 -0700 (PDT)
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
X-Inumbo-ID: 384b6a2c-7a18-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755290488; x=1755895288; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQxOPgyYeB7NyNJYslvJ0f7DBDgh5r0i/jkvkXdHUJc=;
        b=RvPNpQOG/JYIFvcCRyAHlrLysEqo5kPc8LB8+N/ff1fvwNL34jg8MKLKXFzYMPm22w
         Hq5LvuRsT/QvFqeIOlr1o5BEl+gcwxElHfykkyuU6HphKq+9h7pi7amSIo+WOIvzebeH
         PclaBNNw29LVNFcN53R0I2hyIkijm3eeRcf30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755290488; x=1755895288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQxOPgyYeB7NyNJYslvJ0f7DBDgh5r0i/jkvkXdHUJc=;
        b=BC9IQ4bq2m25B2WfUNuExu/X7HzgfNH/gAJH7pb+z+AucZXXcVMK1KMyydq5THfe+D
         y9ToTBB214WSPP4icrU6+lcAkHCrrNG8MDhvNJG33eUWMY+UpnwGlxA8GgSLS9C9hwhI
         rMxp7j1vssVpI10ezCrVwa6x80kwyuV7PNl7EKmJyhXnYR63OHopf3PE3sqExYBFEp/C
         qqCDyY7bWWKHnTig1Tm1J8CWE9nvMeuLvO5AxhN7pgi7ZXhviOEc1rujb4ePZd7xwunx
         YCZ+Lr3v5QuozQ/uFhhAQXUcUPwiUyQpBe0OgmdHMjPTKkds99f5cRkxxWKBkY5LnfNr
         6zpw==
X-Gm-Message-State: AOJu0YzTEVgGPrQ7g1WFiQiXyJ1QBYO3OUmfKC2JX1nvK7aFEluyHDth
	sXFeVjPt95LfohjKU385iQkU4tistmFnlx40fBQSB4VPdj830W8gphyD4YmFQElhzb7eMpvJnbg
	vbhbE
X-Gm-Gg: ASbGncvtAwca8bsLhv+q5rDZVfwnmXtHEPc33RMoj7fRHhWBBBtw9F2fai6emoBoR75
	4BNEG9JBDGwuPrev5avEf7uDbZl5yi9SclTURDayj1suIubPwwVJmeLR2OD7N/moVMk2LO6YMP7
	StzDWznikMNDZ3OjOK2+tJsznFXon2mfdbp+ifHCBp808I8FUwDdRgQlA31yg5z2Y290F3tJ8P0
	nfpanDYDgaoSwg4WQB0gAnYyqpRZJrIkQpFAcq6xXHjC+zqRPrkFUnfAwYma/ajJPwUm9UlxRxI
	VlE/tTtb5ormNoeHmSyjT0ZCHM3Khcd9O1R6BQxUSawRpq9VWI+A+11iFK6wL9ItSSpq1fhMQ9I
	UkIL1hH1FyAL3xJyohUBPBIc+WgWQfCnTD6LqfqCJvYVqunM/v9D5Tzxwzw5r4l6mPE1RvcWglt
	Q8
X-Google-Smtp-Source: AGHT+IEXh/ktc0F9XBGdi4cicZDPiNEVbVK/poj0lIGxn189XDfNPnPMXIOY1An13z87LYT9VHEzLA==
X-Received: by 2002:a05:600c:8b05:b0:459:eeee:2759 with SMTP id 5b1f17b1804b1-45a1b6c7e20mr68277415e9.14.1755290488242;
        Fri, 15 Aug 2025 13:41:28 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 10/16] x86/svm: Rename variable in svm_msr_write_intercept()
Date: Fri, 15 Aug 2025 21:41:11 +0100
Message-Id: <20250815204117.3312742-11-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We're about to turn the rdmsr() macro into a real function, at which point
Eclair complains that we're now shadowing an identifer.

Rename rdmsr to is_rdmsr.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/svm/svm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 4fc6206edac0..90f19d98422a 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2087,14 +2087,14 @@ static int cf_check svm_msr_write_intercept(
 static void svm_do_msr_access(struct cpu_user_regs *regs)
 {
     struct vcpu *curr = current;
-    bool rdmsr = curr->arch.hvm.svm.vmcb->exitinfo1 == 0;
-    int rc, inst_len = svm_get_insn_len(curr, rdmsr ? INSTR_RDMSR
-                                                    : INSTR_WRMSR);
+    bool is_rdmsr = curr->arch.hvm.svm.vmcb->exitinfo1 == 0;
+    int rc, inst_len = svm_get_insn_len(curr, is_rdmsr ? INSTR_RDMSR
+                                                       : INSTR_WRMSR);
 
     if ( inst_len == 0 )
         return;
 
-    if ( rdmsr )
+    if ( is_rdmsr )
     {
         uint64_t msr_content = 0;
 
-- 
2.39.5


