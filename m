Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C439CDFEB
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 14:28:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837643.1253561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBwMc-0005mV-V9; Fri, 15 Nov 2024 13:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837643.1253561; Fri, 15 Nov 2024 13:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBwMc-0005kR-SK; Fri, 15 Nov 2024 13:27:54 +0000
Received: by outflank-mailman (input) for mailman id 837643;
 Fri, 15 Nov 2024 13:27:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=olWw=SK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBwMb-0005kL-ON
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 13:27:53 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67b2a603-a355-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 14:27:48 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5cb15b84544so2391810a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 05:27:48 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf79c0ad25sm1576784a12.61.2024.11.15.05.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 05:27:44 -0800 (PST)
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
X-Inumbo-ID: 67b2a603-a355-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmUiLCJoZWxvIjoibWFpbC1lZDEteDUyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjY3YjJhNjAzLWEzNTUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjc3MjY4LjA3NjEyNCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731677265; x=1732282065; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DC6dK6rjdOCXvqT6W8geooDGMZt0T48ALYLa3p/WTrQ=;
        b=G9ImQd6a9YxhLDX2JsnPEp1ehLzLDfyMK5EjEkv7fLKzyscCerfptw8sVHABHQpgfu
         74LNZ7ubdfuv/f3RazX/QMgAW+sRZoMDhq8Y6FRpDmaGvSIaXMVufYi3N3ak1uBQABwD
         A9zU4jZ4xSncXE4nGS4lBhZEYRi7jstFAHK6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731677265; x=1732282065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DC6dK6rjdOCXvqT6W8geooDGMZt0T48ALYLa3p/WTrQ=;
        b=w26kaQsEwCAIUqppN06i5jSkFvANLgm6wLXzIahFUTLoHBLJAVyxdo463BirkNqvYU
         4p79YdRAb6J0WAtMleyFWvnpAeIYfgxuAUyvIQ7B9kDMZbvQOVmgZPDBHc0XLe1i46s0
         kOOyzKHZcXWIZLXRjdEjtC94gzWhUTNeWlwL3HGxM4fbVTelCZznYsWzT9wzVfl8hCLx
         GwyR7lqvUZrJ+yJ1VFFX/ujUCjHIawS/uKQhchdNGKR044ZOnaQFObRnqHEYabyLyx+5
         KsVWT3uvnekDGi/nGA9sevdie49KhRGB/8p4QUh1XkdRGwRBQuguhQMcRRCK6ykpLQXT
         bIQA==
X-Gm-Message-State: AOJu0Yx5p9zMgm41uqtbT7BX0D+/E1/RWk4mkq7U2Gib/w6CwrWYwUIR
	3qtyCVLtZy4U8inoCfLRTrENMnq+pEs/CoFefan3yZgIMgDf+Fu4h6lhWNYr+9ptU3NClXS/+cx
	A
X-Google-Smtp-Source: AGHT+IEQvjTxcHmpEpE7H/TZBHNT3ekmYIUVPnqBIAEQZDAkYJJLiRj1wjRv5XXD4AFkjvCML14h3g==
X-Received: by 2002:a05:6402:524e:b0:5cf:6674:c669 with SMTP id 4fb4d7f45d1cf-5cf8fc5488cmr1672020a12.7.1731677265236;
        Fri, 15 Nov 2024 05:27:45 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>
Subject: [PATCH] x86/emul: Adjust get_stub() to avoid shadowing an outer variable
Date: Fri, 15 Nov 2024 13:27:42 +0000
Message-Id: <20241115132742.2155370-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Eclair reports a violation of MISRA Rule 5.3.

get_stub() has a local ptr variable which genuinely shadows x86_emul_rmw()'s
parameter of the same name.  The logic is correct, so the easiest fix is to
rename one of variables.

With this addressed, Rule 5.3 is clean, so mark it as such.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1545385154
---
 automation/eclair_analysis/ECLAIR/tagging.ecl |  1 +
 xen/arch/x86/x86_emulate/private.h            | 10 +++++-----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index 16e7adb61fe8..9318e5b10ca8 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -35,6 +35,7 @@ MC3R1.R4.1||
 MC3R1.R4.2||
 MC3R1.R5.1||
 MC3R1.R5.2||
+MC3R1.R5.3||
 MC3R1.R5.4||
 MC3R1.R5.6||
 MC3R1.R6.1||
diff --git a/xen/arch/x86/x86_emulate/private.h b/xen/arch/x86/x86_emulate/private.h
index 172270a458bd..ef4745f56e27 100644
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -672,19 +672,19 @@ amd_like(const struct x86_emulate_ctxt *ctxt)
 # include <asm/uaccess.h>
 
 # define get_stub(stb) ({                                    \
-    void *ptr;                                               \
+    void *_ptr;                                              \
     BUILD_BUG_ON(STUB_BUF_SIZE / 2 < MAX_INST_LEN + 1);      \
     ASSERT(!(stb).ptr);                                      \
     (stb).addr = this_cpu(stubs.addr) + STUB_BUF_SIZE / 2;   \
     (stb).ptr = map_domain_page(_mfn(this_cpu(stubs.mfn))) + \
         ((stb).addr & ~PAGE_MASK);                           \
-    ptr = memset((stb).ptr, 0xcc, STUB_BUF_SIZE / 2);        \
+    _ptr = memset((stb).ptr, 0xcc, STUB_BUF_SIZE / 2);       \
     if ( cpu_has_xen_ibt )                                   \
     {                                                        \
-        place_endbr64(ptr);                                  \
-        ptr += 4;                                            \
+        place_endbr64(_ptr);                                 \
+        _ptr += 4;                                           \
     }                                                        \
-    ptr;                                                     \
+    _ptr;                                                    \
 })
 
 # define put_stub(stb) ({             \

base-commit: d2bbb0d4554aa08649985d790317ba78f0db22ff
-- 
2.39.5


