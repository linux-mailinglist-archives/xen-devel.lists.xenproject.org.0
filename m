Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E52CC986292
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:14:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804083.1215012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTiq-0006I9-Mq; Wed, 25 Sep 2024 15:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804083.1215012; Wed, 25 Sep 2024 15:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTiq-0006E5-ID; Wed, 25 Sep 2024 15:14:32 +0000
Received: by outflank-mailman (input) for mailman id 804083;
 Wed, 25 Sep 2024 15:01:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HSPS=QX=flex--ardb.bounces.google.com=34iX0ZggKCT0Zqca+fhsfnnfkd.bnlwdm-cdudkkhrsr.wdmoqnidbs.nqf@srs-se1.protection.inumbo.net>)
 id 1stTWd-0002UM-S3
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:01:55 +0000
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com
 [2a00:1450:4864:20::34a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a9edb4e-7b4f-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 17:01:55 +0200 (CEST)
Received: by mail-wm1-x34a.google.com with SMTP id
 5b1f17b1804b1-42f310f0ed2so5455765e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:01:55 -0700 (PDT)
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
X-Inumbo-ID: 1a9edb4e-7b4f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276515; x=1727881315; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yjSReXj8XxN+J1aHSpg+bgY7XO8zJXJrh2uX1BeFRGQ=;
        b=svoGmyJb7vdOQpvetAFcCxLEGhY32/bWZxNmOUM7bzFkq6ycQlOGEy7t6wKprbfs5q
         viqiau1wPKoed/AB98qgbUOMn+8cKvouDfDC1P9zmogiQNakEzeJyPP7GOEwDMBsC4hA
         WjAFT3eH38OcU+gaS2KBru0FXU4BxtPd9qzs9aP1GNSzvfYxjpJIJgyWqEhwsMGRUvC2
         l1W1EkGRm+zlM3X1N7ggshduT4/d1cT+T4i45XxZWGmanpRp9w5pc/ZT/Tx0NxCN/u9A
         vF4lqAWZtlluMjcIaADliVfbFCk9oLpqkvcsUOhKkaJwoVrztXeNkvc8MM6OLNrLzpsM
         h7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276515; x=1727881315;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yjSReXj8XxN+J1aHSpg+bgY7XO8zJXJrh2uX1BeFRGQ=;
        b=UTpqsy2mPLZRcrxqC1lDtHQz9lXIapIXmYaVQ1SrKcDgMx9C2xXTLqi9C0xAfKSi4n
         aPsSUJi9y9e/a+WACzCtw8MD9v5XsbGiEfY4W4ZHR4uiZP8/NRId1JOljlNgd8SIgC+I
         JEz9VwXv/NoHG6IOB3AX85dXMqUesa43SRrLoOvcMm85zGToVGcwtUNXUSTUoPoSvu28
         X2Aov/b9ncIvlXgzIXa3CIbF0xgI3uHaUWoyqsA5othrCw+oxBt2U2DAZBXNwT71nz3d
         aANzXYUZGyc1VLKPWYGltBYTb3qDIYLNCiCm1EywREPdvQCAUUvSxA6o1SwdDz6nTtVD
         S5kw==
X-Forwarded-Encrypted: i=1; AJvYcCUO40/g0JZsiB9JRnsNtciiaoh7uT07JvOczEaQIY6hBwfm3ISXwLXCEpjD8Uh8eJ+Z34tBdJYUQm4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAklYtyva2eG2mtPzBDndaTe4EFbW5kCuELGrtIHbDMAUcn6LZ
	8UUlvz69rkWkEHjN/fIt2UBzhDiK8hL38cB19etppu6FdFcekx0WrICz8RSZoTIgac5CMQ==
X-Google-Smtp-Source: AGHT+IGzIZ2o2YM9LwRx7GUBkPXP1nnHd93bOM06M/lDtcRNJJFbQb+/UGpm4f4GZO5kVPvAO8R9y3yP
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:600c:214f:b0:42c:b32e:6ba7 with SMTP id
 5b1f17b1804b1-42e9624246bmr34035e9.6.1727276514236; Wed, 25 Sep 2024 08:01:54
 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:02 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1869; i=ardb@kernel.org;
 h=from:subject; bh=Etb53DEUMtJxbS45M94XzvcBugumXuKFZ3M2B/KYBNo=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6jquDX165ub5J178W1mVH21S/GxP0fqUgljlqYpRR
 x60nEvpKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABPRa2RkeBV2XNd/yacJf4IS
 mc47ex9ud90aJbN1Uf8PDSuxLfrPTjD8rwhuEVogxe0Xov++IjA4keVg55+fz6JEZeM/B04o0/B nBgA=
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-32-ardb+git@google.com>
Subject: [RFC PATCH 02/28] Documentation: Bump minimum GCC version to 8.1
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Uros Bizjak <ubizjak@gmail.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Bump the minimum GCC version to 8.1 to gain unconditional support for
referring to the per-task stack cookie using a symbol rather than
relying on the fixed offset of 40 bytes from %GS, which requires
elaborate hacks to support.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 Documentation/admin-guide/README.rst | 2 +-
 Documentation/process/changes.rst    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index f2bebff6a733..3dda41923ed6 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -259,7 +259,7 @@ Configuring the kernel
 Compiling the kernel
 --------------------
 
- - Make sure you have at least gcc 5.1 available.
+ - Make sure you have at least gcc 8.1 available.
    For more information, refer to :ref:`Documentation/process/changes.rst <changes>`.
 
  - Do a ``make`` to create a compressed kernel image. It is also possible to do
diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 00f1ed7c59c3..59b7d3d8a577 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -29,7 +29,7 @@ you probably needn't concern yourself with pcmciautils.
 ====================== ===============  ========================================
         Program        Minimal version       Command to check the version
 ====================== ===============  ========================================
-GNU C                  5.1              gcc --version
+GNU C                  8.1              gcc --version
 Clang/LLVM (optional)  13.0.1           clang --version
 Rust (optional)        1.78.0           rustc --version
 bindgen (optional)     0.65.1           bindgen --version
-- 
2.46.0.792.g87dc391469-goog


