Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8169B3551
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 16:50:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826684.1241037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0K-00005P-O1; Mon, 28 Oct 2024 15:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826684.1241037; Mon, 28 Oct 2024 15:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0K-0008SS-Hm; Mon, 28 Oct 2024 15:50:04 +0000
Received: by outflank-mailman (input) for mailman id 826684;
 Mon, 28 Oct 2024 15:50:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7IZ5=RY=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5S0J-000874-CJ
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 15:50:03 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b65b92e-9544-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 16:50:02 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a9a0ec0a94fso626989766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 08:50:02 -0700 (PDT)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a0834a6sm387674066b.191.2024.10.28.08.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 08:50:01 -0700 (PDT)
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
X-Inumbo-ID: 4b65b92e-9544-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730130602; x=1730735402; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4k/sSFYh0TQGRGsfutUPLlHi3zFXSiHFIADoMp0Wgc=;
        b=BxWtNzFoQZNttH0ufX5ixSCfo0bNSsdzdMNnnPbFIpaX3Y6eHjsQ/cKNWZIEb/Zn1f
         jponcH4WEeTDUrk07DJlbr7JP5l15KSgkJU322j4NpBqQ5PshEQWGWVmMO2unOjlKxro
         q4P+10Q+vp16Lqxs/rKh7cELfOlvt8neUAJCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730130602; x=1730735402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4k/sSFYh0TQGRGsfutUPLlHi3zFXSiHFIADoMp0Wgc=;
        b=klddmtkyWV0aKfxl62CM1t9UP4SQQ7dGEGslf5AiFPHxVByXwPtdL2cXSb0w97tnTm
         IoQbT3JDsUWlNzXgLtiP7i62z/kswLmnjTfA3o4o2nwX2bl0ofb3H2rRGLYZBns6Xk8h
         hJsKk2vv/NwTZk1J4ePTBlYOBHR2WHriDHRw/T9hGxWgUJ/q7M1jSiXgJx/lx5TFBv3X
         kfiXWiAU9uMbnl9B4LKXhMiPIE3Gtgxv1r5CzCcZtYiZnQLvpXmAyWp2Y6qpFdT6q/1o
         WcsL/7/VxNv5GLblatE1dVIItDLgnOq6YwuqcXTkubTdAl80KH0skOmyh/bUxNCgY1mv
         w0WA==
X-Gm-Message-State: AOJu0YyJFAno/gd+8XkRqqwlwvEgT2F7iWLQYjBcJhhJToVywNdesZU+
	huKbyctdDv9js675akeLjL+uVQtHI6KVs34YLz4ijtOpJbSdaYLdEOfXYS9/BZfZ7SemX878K4e
	K
X-Google-Smtp-Source: AGHT+IHjJ9oGe3akrkidsj5uCSXKoT5jpDGsKnM6W6RXB7stLEvw/7zR2nEMIrzcFYIyPwxWLJL/dw==
X-Received: by 2002:a17:907:7b93:b0:a9a:b70:2a7c with SMTP id a640c23a62f3a-a9de5f3f87cmr634499366b.25.1730130601572;
        Mon, 28 Oct 2024 08:50:01 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 02/14] x86/xstate: Create map/unmap primitives for xsave areas
Date: Mon, 28 Oct 2024 15:49:20 +0000
Message-ID: <20241028154932.6797-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
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
 xen/arch/x86/include/asm/xstate.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index 07017cc4edfd..36260459667c 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -143,4 +143,24 @@ static inline bool xstate_all(const struct vcpu *v)
            (v->arch.xcr0_accum & XSTATE_LAZY & ~XSTATE_FP_SSE);
 }
 
+/*
+ * Fetch a pointer to the XSAVE area of a vCPU
+ *
+ * If ASI is enabled for the domain, this mapping is pCPU-local.
+ *
+ * @param v Owner of the XSAVE area
+ */
+#define vcpu_map_xsave_area(v) ((v)->arch.xsave_area)
+
+/*
+ * Drops the XSAVE area of a vCPU and nullifies its pointer on exit.
+ *
+ * If ASI is enabled and v is not the currently scheduled vCPU then the
+ * per-pCPU mapping is removed from the address space.
+ *
+ * @param v           vCPU logically owning xsave_area
+ * @param xsave_area  XSAVE blob of v
+ */
+#define vcpu_unmap_xsave_area(v, x) ({ (x) = NULL; })
+
 #endif /* __ASM_XSTATE_H */
-- 
2.47.0


