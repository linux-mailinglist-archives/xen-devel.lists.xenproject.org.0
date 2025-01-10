Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B86A1A091E8
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 14:29:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869508.1280941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWF4T-00012p-8F; Fri, 10 Jan 2025 13:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869508.1280941; Fri, 10 Jan 2025 13:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWF4T-0000yP-4g; Fri, 10 Jan 2025 13:29:05 +0000
Received: by outflank-mailman (input) for mailman id 869508;
 Fri, 10 Jan 2025 13:29:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmVM=UC=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tWF4S-0000vX-1b
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 13:29:04 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db40feb3-cf56-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 14:29:02 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5d3d2a30afcso3398579a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 05:29:02 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9900c98d6sm1589297a12.35.2025.01.10.05.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 05:29:01 -0800 (PST)
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
X-Inumbo-ID: db40feb3-cf56-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736515742; x=1737120542; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRQNfKsuvZw+nxO+9fRaGgM5v8xaStyagtWnmxEhbWE=;
        b=M94DQGGKuHNJfq3/ovUirZDCRE6qK/dMMVbdXWjbWclr6RUFwJI3/HKN+s5zNAHMCR
         e/1zisUbrIjspv0DrWEEbHSfFOHwvE4c1TokIHYE71v8kC+H9Pu5H93fQ9sYKzRizSL1
         yhldldxeJVkuBUU70rm3zBVQILnb4Q7SXDuII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736515742; x=1737120542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRQNfKsuvZw+nxO+9fRaGgM5v8xaStyagtWnmxEhbWE=;
        b=Xxc15VoanBE0k5fWLZ0KoRgz45HMKDiMOvwzOLgMnIM4RoaOkusKnZr4xCXXbYhXwL
         0WpZU9J6vW88nPrEQb4FtLaLUQxfAcsfBST2ZW4ga+Uqg6LJrxPh4XJxd5SNbhYBpTs4
         yOa08K0RzWtmeSdJmpgjyW6RVuf5fr2SJSEAcyvXIYrvcjW5N3RQRt9Eyy1PRZQclFw6
         qAWVFD5R62L6JmKHut/Orlo8sMpYnR43TD7i/bviGZXs32h5EpBqZU1cvEN5HmOEKHqv
         acNTyRX7eG6SJLcCimgUSUsQXVUkXlsFCXhxOLG8aHntUdp7Zd5C8swN4pBBJImvA3WE
         YCFg==
X-Gm-Message-State: AOJu0YwwguwnBoS4XOG+l+hDB1MUayoMkNbkfjB5cxtGRkWTHi2KLTNK
	CnIk3kC/NAwnQ+ULVSOKqpD3YF9PAxjhQsc0tVJPvG2P9B4raRqzE0XZtymYkf6QMkpIMU79zUV
	fGUkVKA==
X-Gm-Gg: ASbGncvsFVJcDrNUg1rtIh4Lwwy9M4+oXEZfc6mjPp8ji+yoVCQ1K9Fn/ZWySkEFlyZ
	c0ew44Fu+x0mSikaDZGlY9PmkHhvPP6Nn6tfB3/F8a56lXsJ+bCE1VJJk1sEUFe8wS04lK3/FU6
	9ibmJrgcaSn/gUjedFPdjbPXUP6dY4tQNe8iMw0V7FST6D6Vv/MeGuLKFJ5IvJNaITAZbm6Lwzw
	y5UreXJVQgqMk3ztovtt47u08vAsWp4UBMpeNTanXWibfQ8DVeUO18N2I6CIetYH0FUWB0aDWOa
	WPA=
X-Google-Smtp-Source: AGHT+IGyXX40MA98jKr2GDP3/U+a3JZgqNiBAzNjjB3AtjN0x38sMjEg0t46Ben6q3KxCJNyi6FbXg==
X-Received: by 2002:a05:6402:50c9:b0:5d9:a61:e7c9 with SMTP id 4fb4d7f45d1cf-5d972e1bf6fmr9811622a12.20.1736515741680;
        Fri, 10 Jan 2025 05:29:01 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 01/12] x86/xstate: Create map/unmap primitives for xsave areas
Date: Fri, 10 Jan 2025 13:28:12 +0000
Message-ID: <20250110132823.24348-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
References: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add infrastructure to simplify ASI handling. With ASI in the picture
we'll have several different means of accessing the XSAVE area of a
given vCPU, depending on whether a domain is covered by ASI or not and
whether the vCPU is question is scheduled on the current pCPU or not.

Having these complexities exposed at the call sites becomes unwieldy
very fast. These wrappers are intended to be used in a similar way to
map_domain_page() and unmap_domain_page(); The map operation will
dispatch the appropriate pointer for each case in a future patch, while
unmap will remain a no-op where no unmap is required (e.g: when there's
no ASI) and remove the transient maping if one was required.

Follow-up patches replace all uses of raw v->arch.xsave_area by this
mechanism in preparation to add the beforementioned dispatch logic to be
added at a later time.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2->v3:
  * Evaluate `v` in UNMAP (casted to void)

v1->v2:
  * Comment macros more heavily to show their performance characteristics.
  * Addressed various nits in the macro comments.
  * Macro names to uppercase.
---
 xen/arch/x86/include/asm/xstate.h | 42 +++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index 07017cc4edfd..ab81a4c8527e 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -143,4 +143,46 @@ static inline bool xstate_all(const struct vcpu *v)
            (v->arch.xcr0_accum & XSTATE_LAZY & ~XSTATE_FP_SSE);
 }
 
+/*
+ * Fetch a pointer to a vCPU's XSAVE area
+ *
+ * TL;DR: If v == current, the mapping is guaranteed to already exist.
+ *
+ * Despite the name, this macro might not actually map anything. The only case
+ * in which a mutation of page tables is strictly required is when ASI==on &&
+ * v!=current. For everything else the mapping already exists and needs not
+ * be created nor destroyed.
+ *
+ *                         +-----------------+--------------+
+ *                         |   v == current  | v != current |
+ *          +--------------+-----------------+--------------+
+ *          | ASI  enabled | per-vCPU fixmap |  actual map  |
+ *          +--------------+-----------------+--------------+
+ *          | ASI disabled |             directmap          |
+ *          +--------------+--------------------------------+
+ *
+ * There MUST NOT be outstanding maps of XSAVE areas of the non-current vCPU
+ * at the point of context switch. Otherwise, the unmap operation will
+ * misbehave.
+ *
+ * TODO: Expand the macro to the ASI cases after infra to do so is in place.
+ *
+ * @param v Owner of the XSAVE area
+ */
+#define VCPU_MAP_XSAVE_AREA(v) ((v)->arch.xsave_area)
+
+/*
+ * Drops the mapping of a vCPU's XSAVE area and nullifies its pointer on exit
+ *
+ * See VCPU_MAP_XSAVE_AREA() for additional information on the persistence of
+ * these mappings. This macro only tears down the mappings in the ASI=on &&
+ * v!=current case.
+ *
+ * TODO: Expand the macro to the ASI cases after infra to do so is in place.
+ *
+ * @param v Owner of the XSAVE area
+ * @param x XSAVE blob of v
+ */
+#define VCPU_UNMAP_XSAVE_AREA(v, x) do { (void)(v); (x) = NULL; } while(0)
+
 #endif /* __ASM_XSTATE_H */
-- 
2.47.1


