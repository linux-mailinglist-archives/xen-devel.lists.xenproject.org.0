Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FA3A388F0
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 17:15:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890607.1299753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk3lp-0001Ud-D0; Mon, 17 Feb 2025 16:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890607.1299753; Mon, 17 Feb 2025 16:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk3lp-0001Rc-8q; Mon, 17 Feb 2025 16:14:57 +0000
Received: by outflank-mailman (input) for mailman id 890607;
 Mon, 17 Feb 2025 16:14:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xGAw=VI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tk3ln-0001RW-4Z
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 16:14:55 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51af012d-ed4a-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 17:14:52 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4397e5d5d99so8003725e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 08:14:52 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258cccd3sm12623708f8f.23.2025.02.17.08.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:14:51 -0800 (PST)
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
X-Inumbo-ID: 51af012d-ed4a-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739808892; x=1740413692; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ffJdAu+A8JzYZbJdWs5DiMLboiGFcezY0rYEm3HgNoU=;
        b=OxfJoNWo2zcMtJwzWQvYYtlFMw/nuOes7uoMVhCAROPLGQHa55NrBwDzmi9YHbWHka
         7UExptBZ2HAso6YTNAoWvUAttgJT6EvpcFcKh6NRubct9aYoDDpKXLVgVDzqxtv4RufP
         9ob01h00BL/rXmzYjUjJqYSPiqUKAdQ9kfXsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739808892; x=1740413692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffJdAu+A8JzYZbJdWs5DiMLboiGFcezY0rYEm3HgNoU=;
        b=EP/zl8cMlBYQYpqj0OZvQc5rj1oGGEsutdmPthOyV6Yh3nTmJ+frXulLyDVIUGuACf
         jY5aAwyPUVv5631jZlDGPqvnwR7HSs+Wc1ahbnWuQjYNv9vompqZhWaZWEr0RjsK0pbC
         i28A1tle6Nh+KVZ3JO3/ZVMK+nRjTI2qrojsHsoYF/gJGvCmS+TdxDrqz2wg8708YZRk
         r3FC4M7My5iOy/hXnfAzmTIM6E2fxZFXU+3TBklcdTgbbW0wl7p2gBFpI4ZVjDL4cnFd
         DjHGI6H+nvqPazHcoJs3IWLwE2PiOIrHa2WFkIyb1c6a4ybXZAetr+PZw70rijLr3+am
         S5AQ==
X-Gm-Message-State: AOJu0Yw4Tl07Oz+IdyuJ1bv8CMKC4UjD5EUl2EPZtKFi+3g9nkY5kw+V
	J+yFKBFCrU29Wz0iMRUVYUwCYcBuGKt4pMIh/tzem1uvrQGdWGHDnIJpPi4hBN+zGiN3ykgtqtF
	T
X-Gm-Gg: ASbGnctlhOYypu+RFDKtwPt4i5zzlxoTnhx4Eiw+S7GLaPdgQYUyI/f+SCvHzQqbfZx
	R0kgpaw7d6HX781CxNZJi8JTrev6JAqyA6u0uSEzbAxa3v0nfhTP6J37/Im0zqrLH54gpq4CxDD
	RdpE+eu1bwkVW+TcFqPLcei5nZybWAx+KWjXhLHvSsq+GWIkbx+EKDMrCAi1IeNizdKlFymivLg
	jbo8k8eGAjcNP85Qw0TsBQ9Q7CjKFVhWnSARVLeVHc/yzfD9EkEaNY3hj77uhinvF7Bq1ZL8dfu
	tDeqw9QQCVxnin9JIwvJX9Hr2a5Z2NUalKDhLSpY/LmPa1jquONX18klDrwKhnoFvO5ZZFc=
X-Google-Smtp-Source: AGHT+IG3aMkSXw2TC8uwRZuck0G0IVIy8h7BJP6CeOAAbY5n6s3iuXBHEDoU5qOwCIOOrifIwLjQLg==
X-Received: by 2002:a05:600c:470a:b0:434:f5c0:328d with SMTP id 5b1f17b1804b1-4396e752a98mr92311705e9.23.1739808891871;
        Mon, 17 Feb 2025 08:14:51 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/svm: Separate STI and VMRUN instructions in svm_asm_do_resume()
Date: Mon, 17 Feb 2025 16:12:41 +0000
Message-Id: <20250217161241.537168-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There is a corner case in the VMRUN instruction where its INTR_SHADOW state
leaks into guest state if a VMExit occurs before the VMRUN is complete.  An
example of this could be taking #NPF due to event injection.

Xen can safely execute STI anywhere between CLGI and VMRUN, as CLGI blocks
external interrupts too.  Move the STI to the other end of the block, which
moves the VMRUN instruction outside of STI's shadow.

Link: https://lore.kernel.org/all/CADH9ctBs1YPmE4aCfGPNBwA10cA8RuAk2gO7542DjMZgs4uzJQ@mail.gmail.com/
Fixes: 66b245d9eaeb ("SVM: limit GIF=0 region")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

I'm reasonbly sure this will trigger reliably during LogDirty because of how
we do misconfig propagation.

It's also mostly benign; from the guest's point of view, a pending interrupt
will be delayed by one instruction.  Hence, not tagged for 4.20 at this
juncture.
---
 xen/arch/x86/hvm/svm/entry.S | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index 6fd9652c04a1..c710464673f0 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -57,6 +57,14 @@ __UNLIKELY_END(nsvm_hap)
 
         clgi
 
+        /*
+         * Set EFLAGS.IF, after CLGI covers us from real interrupts, but not
+         * immediately prior to VMRUN.  AMD CPUs leak Xen's INTR_SHADOW from
+         * the STI into guest state if a VMExit occurs during VMEntry
+         * (e.g. taking #NPF during event injecting.)
+         */
+        sti
+
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
         /* SPEC_CTRL_EXIT_TO_SVM       Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
         .macro svm_vmentry_spec_ctrl
@@ -91,7 +99,6 @@ __UNLIKELY_END(nsvm_hap)
         pop  %rsi
         pop  %rdi
 
-        sti
         vmrun
 
         SAVE_ALL

base-commit: 414dde38b0cf8a38230c8c3f9e8564da9762e743
-- 
2.39.5


