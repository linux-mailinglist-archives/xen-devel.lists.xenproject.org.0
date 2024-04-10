Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 366298A00B0
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 21:35:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703579.1099283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rudjN-00064v-VC; Wed, 10 Apr 2024 19:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703579.1099283; Wed, 10 Apr 2024 19:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rudjN-00062T-SH; Wed, 10 Apr 2024 19:35:37 +0000
Received: by outflank-mailman (input) for mailman id 703579;
 Wed, 10 Apr 2024 19:35:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wftW=LP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rudjM-00062N-Th
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 19:35:36 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80e6d11f-f771-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 21:35:36 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d8b2389e73so23451831fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 12:35:36 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ji7-20020a170907980700b00a4e86dd231dsm7192483ejc.42.2024.04.10.12.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 12:35:34 -0700 (PDT)
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
X-Inumbo-ID: 80e6d11f-f771-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712777735; x=1713382535; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zhU14UictSRaK0JRs1BvAkcwPDCX6XlNf7Ku0rddFnc=;
        b=ghkZ6cY4Sf1ttEIvqiTsEWotMV166tyIzAx8EG/w9R/viR42Ijzo5BtAJNEdH9oF+c
         RtswhcTUjE5BkpYKQFpmnQe70q0EA8KL+o1gG6pisJzZsBueQL18scrbC7lXZ5yXrkGs
         pJCUu0OsDimmOkgWq2nhvegpK4Zpsr8dAjgRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712777735; x=1713382535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhU14UictSRaK0JRs1BvAkcwPDCX6XlNf7Ku0rddFnc=;
        b=DNe9u3u4syWeLxqosgWAPwMPQRrJTMXInfcHInZT2ApnQd5B2Di8xPsneNo05WrrYl
         iINXqGdPUx315xkEifEWTp1xc/Sk/QKhGNCylMDlFptUfPXBgS5q8A0mk/Ms1xj7rmtM
         MVQiXuOvSwUBBtGOE3SZ8cLZUj7P4IR96xdU0yy4qExaC7n3/vi62Wip4Us9fJ6AS86U
         uXPKW+hs2ECL+sBAUSHuThREdh4MTfCy+hPWebvYYiwtf/ZkNGhMujE2HCOH3MQOGaED
         OqxPKAtb//5FzQUBZ+c84nuPuOy0lQO4i2fx3XERCjok2U3rQ/OKFUBWVk5d5eY3qO8v
         40OA==
X-Gm-Message-State: AOJu0YwnLbQ70XWiP6bywNGCoM309HruXw3Owb22z8Druy0UqhDYf/ny
	ugyDRuDbDFKYGemkHoXebGwSVbdCO4jbfTUAJ5aJ3Tvyiq79hiv7izOFENf3t3PoOJ9S6VmOiAX
	3Io4=
X-Google-Smtp-Source: AGHT+IGr6423c394JYvpCYavu8ehM3wqRfsoe76I8wWeZbM983LlPSmqaQxfJuk7XLrbWBPzkEHa6Q==
X-Received: by 2002:a19:e04f:0:b0:516:d538:35b2 with SMTP id g15-20020a19e04f000000b00516d53835b2mr2069736lfj.23.1712777734945;
        Wed, 10 Apr 2024 12:35:34 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Juergen Gross <jgross@suse.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH] xen/spinlock: Adjust LOCK_DEBUG_INITVAL to placate MISRA
Date: Wed, 10 Apr 2024 20:35:31 +0100
Message-Id: <20240410193531.1499128-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolves an R7.2 violation.

Fixes: c286bb93d20c ("xen/spinlock: support higher number of cpus")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Juergen Gross <jgross@suse.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Federico Serafini <federico.serafini@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/include/xen/spinlock.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index db00a24646bd..18793c5e29cb 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -13,7 +13,7 @@
 #ifdef CONFIG_DEBUG_LOCKS
 union lock_debug {
     uint32_t val;
-#define LOCK_DEBUG_INITVAL 0xffffffff
+#define LOCK_DEBUG_INITVAL 0xffffffffU
     struct {
         unsigned int cpu:SPINLOCK_CPU_BITS;
 #define LOCK_DEBUG_PAD_BITS (30 - SPINLOCK_CPU_BITS)

base-commit: 0e7ea8ca5fc9bce9248414f6aaf2dc861abd45d9
prerequisite-patch-id: 8d06e56c5d8a52f1387e1f5a7fce6a94b8c4a1ed
prerequisite-patch-id: 13355d26254b979c79de456c9a6ea6a9c639ba63
-- 
2.30.2


