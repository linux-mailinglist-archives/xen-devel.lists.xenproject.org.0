Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD3AA69615
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 18:14:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921001.1325036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuwzK-00015D-R5; Wed, 19 Mar 2025 17:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921001.1325036; Wed, 19 Mar 2025 17:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuwzK-00012P-O0; Wed, 19 Mar 2025 17:13:54 +0000
Received: by outflank-mailman (input) for mailman id 921001;
 Wed, 19 Mar 2025 17:13:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zx04=WG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tuwzJ-00012J-HL
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 17:13:53 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8646773f-04e5-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 18:13:49 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso33692645e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 10:13:49 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb40cdd0sm21576382f8f.77.2025.03.19.10.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 10:13:48 -0700 (PDT)
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
X-Inumbo-ID: 8646773f-04e5-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742404429; x=1743009229; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s/g17zJ07S6L56H0Nj1u+OEDvQkGg1PkZ057c/eNwig=;
        b=N+0v9ErOtwUG3ARzhnb9PvN4TZKaN8Jl3/cAsy/7C28tjl0K5AVrbxetDgYKkjyuAc
         HCFDvXpFlxeBeUa7JopFOgbXsRELsOUE8H/F8G5wU/S+ZE5ODN/x36mlkGMost9WLKZE
         ksJAjM+visf4kwqaaKM9a6XsVHPZ+hqg80hM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742404429; x=1743009229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/g17zJ07S6L56H0Nj1u+OEDvQkGg1PkZ057c/eNwig=;
        b=w5eeDGAkGVDlgH7nb4+u8vF/rwkrS12hhp+9bdQoABNpIYNuWIypaU2AQION5xOecq
         NQvLLwlQicaBC5oc2RE0Wn7lSLHGMlejXXsqmXQoIZkiKnB8g5QruVeKc7enpjlPIlU7
         fHaUq9g69dFvalEjQqqo7nz5ahQxtyx5XCrfpxbma48fi6suhmneeAovFpRLgjXI3om2
         nwLlSnrtUqCtGDstBAiuDf9xkC9+UBRUpxOBXnsyQ0UYFQmk5Cfj0o4h+92rpBF6TQDz
         GqRShrEZGmhhdZVqyRG6ukClovD8Rcm7P4Ce8/N5BGQrHRngN9MF+AWvFJxY8AHmQGQY
         2cfQ==
X-Gm-Message-State: AOJu0YyuTmw75JvavwlGvkTmvvai86bC+aXEvbGndOVELiK3jfKdLJcz
	8MiVOdK5RDwS985j9KFwZHh3mFkufcwMaUv6RrtT4pxWGgyHqBkykYuUDhXNhBd3CJkRVO6kfaM
	a
X-Gm-Gg: ASbGncuwtW7tTyaYAgCvLvYsOQdtjxPzPo+XZhHCA8OHRUhkzT0pQPNy9USRuI70+H8
	IBLrNtKAS0KOOAwUH5GHbMXpUOc5m1XZdcBOIcLyrSnHrDpEsEM7xnfkZgBcN/t+C+Y8A5MnhSv
	c4+JrBc2Y8hpVFGfAT8Im/kYe3meLxRpg4sYcdRAnf6VjLJNLG9zcUgp6ggTMUfOMHihc4YtXqZ
	VrPyVGQL+BEa2WMKQQHNEk5xPbOz+XqS37//7zQeasI3hJ8nNENqdHXbdtmc0hTfIaNs6FYeRVh
	PIiMsLCvt9/MH5faPX/lXIEd8eVRYoy3s7r34U445vWel4Yn3hLZOld3vn8/OsFPBlyI/V0x9GU
	keA9KkE+1v1QhL/dQXg==
X-Google-Smtp-Source: AGHT+IEquiE8XZBGWoym6oL+iQeU8yimqu7DOvc3MBOUm4Uj3WPdUxaSWuKolTww5wF/vI2yiIAgxg==
X-Received: by 2002:a05:600c:3ac6:b0:43c:fe85:e4a0 with SMTP id 5b1f17b1804b1-43d4378b869mr37242705e9.7.1742404428834;
        Wed, 19 Mar 2025 10:13:48 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/boot: Simplify the expression for extra allocation space
Date: Wed, 19 Mar 2025 17:13:46 +0000
Message-Id: <20250319171346.19478-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The expression for one parameter of find_memory() is already complicated and
about to become moreso.  Break it out into a new variable, and express it in
an easier-to-follow way.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/dom0_build.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 6a4453103a9a..6591949984b8 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -654,6 +654,7 @@ static int __init pvh_load_kernel(
     const char *cmdline = image->cmdline_pa ? __va(image->cmdline_pa) : NULL;
     struct elf_binary elf;
     struct elf_dom_parms parms;
+    size_t extra_space;
     paddr_t last_addr;
     struct hvm_start_info start_info = { 0 };
     struct hvm_modlist_entry mod = { 0 };
@@ -711,13 +712,16 @@ static int __init pvh_load_kernel(
      * split into smaller allocations, done as a single region in order to
      * simplify it.
      */
-    last_addr = find_memory(d, &elf, sizeof(start_info) +
-                            (initrd ? ROUNDUP(initrd_len, PAGE_SIZE) +
-                                      sizeof(mod)
-                                    : 0) +
-                            (cmdline ? ROUNDUP(strlen(cmdline) + 1,
-                                               elf_64bit(&elf) ? 8 : 4)
-                                     : 0));
+    extra_space = sizeof(start_info);
+
+    if ( initrd )
+        extra_space += sizeof(mod) + ROUNDUP(initrd_len, PAGE_SIZE);
+
+    if ( cmdline )
+        extra_space += ROUNDUP(strlen(cmdline) + 1,
+                               elf_64bit(&elf) ? 8 : 4);
+
+    last_addr = find_memory(d, &elf, extra_space);
     if ( last_addr == INVALID_PADDR )
     {
         printk("Unable to find a memory region to load initrd and metadata\n");

base-commit: aa78a7d10c6c2ef877b34d119a6db934c201ddfd
-- 
2.39.5


