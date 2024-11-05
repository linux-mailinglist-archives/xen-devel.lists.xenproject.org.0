Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0958C9BCF79
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 15:34:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830257.1245207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Kd0-0002ae-JY; Tue, 05 Nov 2024 14:33:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830257.1245207; Tue, 05 Nov 2024 14:33:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Kd0-0002YP-Gs; Tue, 05 Nov 2024 14:33:54 +0000
Received: by outflank-mailman (input) for mailman id 830257;
 Tue, 05 Nov 2024 14:33:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SSsw=SA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t8Kcz-0002K5-4A
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 14:33:53 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f998a050-9b82-11ef-a0c5-8be0dac302b0;
 Tue, 05 Nov 2024 15:33:50 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c941623a5aso11544248a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 06:33:50 -0800 (PST)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6a99ff2sm1395047a12.4.2024.11.05.06.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 06:33:49 -0800 (PST)
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
X-Inumbo-ID: f998a050-9b82-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzQiLCJoZWxvIjoibWFpbC1lZDEteDUzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY5OThhMDUwLTliODItMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODE3MjMwLjg5NTk1NSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730817230; x=1731422030; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5MI75e4+hOjaOxFZKHpo9oTq8hdhATr+ZHahTSCs6U=;
        b=PKYz8U1znWxozUwaYYMfdTV77Kp4otFElDwOVHx9mhAklzIW8t3iYXuGIFFlUauKvZ
         icbQFsQYFxCqjYNi8BZ90e/JEtJtW0EfsjGp71yoAyWp67/baPa8GamEs9UdQaWoDl2y
         Zstprrl5ANbXnZBF3lL6Ply/DVTmdKjMCiRl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817230; x=1731422030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5MI75e4+hOjaOxFZKHpo9oTq8hdhATr+ZHahTSCs6U=;
        b=EenDw7AmIkEWo7D7xbVtQjFsouzGpB85c4nWAjjQiD0ilcUJ9teNdfwQ+I0Q6NKeyO
         abhp8TTS+mYEHKI01XjS3sBSjWHNnuF9BuPK3HJjQumtAHUjd+iqP3zFLOUl+dkuP3Iu
         5W9uKsJr5Ar0vmExlHWmHy6EV3qsQvzDauS98a/8P3TMhGqknx+9avUnutvqkt+L4Znx
         W/0aXPe5/4WxCA/16ma4XsmTUOAi6SrlwjZy9LQRXX9jQAkOuOuG/oEX2NvpJvRzUGAF
         IiYPCCO489oXyJWfbJ8vX/hjw88emR7cXZfwLl/2NbsdZg39J4iH2OWdurDVoQv1Y6I2
         eOWA==
X-Gm-Message-State: AOJu0Yz8+VZ9p0dB0/+4AH4lh5k0u3g0002DMfL0txvyQnp1xKjq18UI
	SzccX8VY2U/mngwmNzisKX6DLepYkkcKyFc0ahxKCkg/5XuhGmc6yp03hgZCNA40EX/9e8LcOUk
	q
X-Google-Smtp-Source: AGHT+IElpRYa2awz+b5ZiTEQCetsqe4Q4xDPQIeYnAy0JSjDCDL+J66ma0sNHWP3O0Gl53xOoGT0Pg==
X-Received: by 2002:a05:6402:51c7:b0:5ce:df98:ea7d with SMTP id 4fb4d7f45d1cf-5cedf98eb22mr4487574a12.8.1730817229985;
        Tue, 05 Nov 2024 06:33:49 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 02/13] x86/xstate: Create map/unmap primitives for xsave areas
Date: Tue,  5 Nov 2024 14:32:59 +0000
Message-ID: <20241105143310.28301-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
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
v2:
  * Comment macros more heavily to show their performance characteristics.
  * Addressed various nits in the macro comments.
  * Macro names to uppercase.
---
 xen/arch/x86/include/asm/xstate.h | 42 +++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index 07017cc4edfd..6b0daff0aeec 100644
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
+#define VCPU_UNMAP_XSAVE_AREA(v, x) ({ (x) = NULL; })
+
 #endif /* __ASM_XSTATE_H */
-- 
2.47.0


