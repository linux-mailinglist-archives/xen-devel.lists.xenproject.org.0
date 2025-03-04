Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1200A4F1E4
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 00:59:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901592.1309550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpcAH-0006bt-Kv; Tue, 04 Mar 2025 23:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901592.1309550; Tue, 04 Mar 2025 23:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpcAH-0006aE-Hw; Tue, 04 Mar 2025 23:59:09 +0000
Received: by outflank-mailman (input) for mailman id 901592;
 Tue, 04 Mar 2025 23:59:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Z5M=VX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tpcAG-0006a8-Dj
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 23:59:08 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a83c2f53-f954-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 00:59:06 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-439a4fc2d65so66340515e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 15:59:06 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4844abbsm18946054f8f.70.2025.03.04.15.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 15:59:05 -0800 (PST)
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
X-Inumbo-ID: a83c2f53-f954-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741132746; x=1741737546; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ARU3lqTjT00glB53BT+77aYNW8WQZLcUINvHTmLy8fM=;
        b=c0yx9Fc4SeC5Dn54lQSpXBvRnI53PT/aLQCIPFVl+ElFsrEtrLPkALf1mDZ80Ea1ON
         9ooIFM8QaU/C3xUZeeqdchTOU/zODgc8t+6ApSOQEZVWgJcm9TZ+QRSG2wgHlsGeOcOk
         a8a0A2G5TBJDD5+QAA9vFb6uCORALqVpD7Bco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741132746; x=1741737546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARU3lqTjT00glB53BT+77aYNW8WQZLcUINvHTmLy8fM=;
        b=dVD7wZpO92Ue4s6fHJ3DgX5LZKUhFBh39GulU3b3PSE6dINyUfJFVkvUyPD4APiX6r
         v4gL+8c5qj9AQuQ0tQJaG621ke5Yqb+xCq90CQIO/D+itXX1fCS6p4vEBEXa9mYy8n1e
         lkRRV74DyGz1Q6+/akEvpocSqjvqnbu+/NsP7gPtxXV1f99zJlia2WVzg+bKSxvcnBKn
         EqNK1tvTzgBk8Qtkel+5xqWdlgWxI8D7EE3Mhx7laLTguS9Mb5JSYPun4wqkkBPP4cZC
         DwRYiFrxpJMEDKlfV24dJEUmZYsKglqCFMw8VDOEtpKg1Imoxl8fvTId+WFq5PWXgbqe
         FUGA==
X-Gm-Message-State: AOJu0YyRZ4bGkquCIkenOzvxcbUVpcH4yks/qk/D0lhYhbq/GAP3LEs7
	3Bldf20S+MVfqilE/XDGXvrctCLsB1FZGyLnqr6hUu58xbHiMYA8fWdV4QvKhTxX29eURP6dx+V
	m
X-Gm-Gg: ASbGncutTgT/hKMFOwzFd0XmNnYtPdlI9m1gxqVPzHaF7hA1tDr91uBpM4QN5A5f+yZ
	+ryMJvRiheOoMB7QmOtgPP7utUmaKITRb5hsyd5B6d7do3Hmt1qmEBnF8ZDI2HwW/DdqhH93aWU
	cF7gRNTImTcgARl8DRVIz744qNk0UcNziyg5yTl/IhQti7Hxpo9075Bcw5f/wX3Fy5N3UeCWHXC
	18Rkja7cnkaEK4qZcB5zYHPXdZQeuJcxJw/yss9wEVXbeSxygfG2pf679PTo8wtHbw9JM5O/eQa
	7JMB5dhUonkByfpK4V360lwG/zOT8/w5iN3PM2TtxIjpuf9lGmCFkpufNqfl0QD1ml+bOt5SfyC
	n4+xeg/D0sP12rYjPUaKsvBtV
X-Google-Smtp-Source: AGHT+IGOfT/e9cA7JAPZcv6lxOSh7zmJVLTyUXDjo0bTP0j4K1prkKDDtDVZfy+BQ5WIfhQ8VbNZ5A==
X-Received: by 2002:a5d:6dad:0:b0:390:ffd0:4142 with SMTP id ffacd0b85a97d-3911f75678emr547659f8f.26.1741132746107;
        Tue, 04 Mar 2025 15:59:06 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH] MISRA: Rephrase the deviation for Directive 4.10
Date: Tue,  4 Mar 2025 23:57:01 +0000
Message-Id: <20250304235701.2770842-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The use of "legitimately" mixes the concepts of "it was designed to do this"
and "it was correct to do this".

The latter in particular can go stale.  "intended" is a better way of phrasing
this.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 2 +-
 xen/arch/arm/include/asm/perfc_defn.h            | 2 +-
 xen/arch/x86/include/asm/perfc_defn.h            | 2 +-
 xen/include/asm-generic/perfc_defn.h             | 2 +-
 xen/include/xen/perfc_defn.h                     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index dfa5f34b3952..2c8fb9271391 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -74,7 +74,7 @@ they are not instances of commented-out code."
 
 -doc_begin="Files that are intended to be included more than once do not need to
 conform to the directive."
--config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* This file is legitimately included multiple times\\. \\*/$, begin-4))"}
+-config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* This file is intended to be included multiple times\\. \\*/$, begin-4))"}
 -config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* Generated file, do not edit! \\*/$, begin-3))"}
 -config=MC3A2.D4.10,reports+={safe, "all_area(all_loc(file(^xen/include/generated/autoconf.h$)))"}
 -doc_end
diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/include/asm/perfc_defn.h
index 3ab0391175d7..effd25b69ecc 100644
--- a/xen/arch/arm/include/asm/perfc_defn.h
+++ b/xen/arch/arm/include/asm/perfc_defn.h
@@ -1,4 +1,4 @@
-/* This file is legitimately included multiple times. */
+/* This file is intended to be included multiple times. */
 /*#ifndef __XEN_PERFC_DEFN_H__*/
 /*#define __XEN_PERFC_DEFN_H__*/
 
diff --git a/xen/arch/x86/include/asm/perfc_defn.h b/xen/arch/x86/include/asm/perfc_defn.h
index 487e20dc9734..d6127cb91ea5 100644
--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -1,4 +1,4 @@
-/* This file is legitimately included multiple times. */
+/* This file is intended to be included multiple times. */
 /*#ifndef __XEN_PERFC_DEFN_H__*/
 /*#define __XEN_PERFC_DEFN_H__*/
 
diff --git a/xen/include/asm-generic/perfc_defn.h b/xen/include/asm-generic/perfc_defn.h
index 8237636d83fb..726cddc1b3e8 100644
--- a/xen/include/asm-generic/perfc_defn.h
+++ b/xen/include/asm-generic/perfc_defn.h
@@ -1,4 +1,4 @@
-/* This file is legitimately included multiple times. */
+/* This file is intended to be included multiple times. */
 /* #ifndef ASM_GENERIC_PERFC_DEFN_H */
 /* #define ASM_GENERIC_PERFC_DEFN_H */
 
diff --git a/xen/include/xen/perfc_defn.h b/xen/include/xen/perfc_defn.h
index a987d80dd6f1..afbabad0b3be 100644
--- a/xen/include/xen/perfc_defn.h
+++ b/xen/include/xen/perfc_defn.h
@@ -1,4 +1,4 @@
-/* This file is legitimately included multiple times. */
+/* This file is intended to be included multiple times. */
 /*#ifndef __XEN_PERFC_DEFN_H__*/
 /*#define __XEN_PERFC_DEFN_H__*/
 

base-commit: 83e043ee72b8c2fe1d620d137c20a2ffb040da01
-- 
2.39.5


