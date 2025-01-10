Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0BEA091EE
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 14:29:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869517.1281006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWF4g-0002pL-83; Fri, 10 Jan 2025 13:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869517.1281006; Fri, 10 Jan 2025 13:29:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWF4g-0002l8-0d; Fri, 10 Jan 2025 13:29:18 +0000
Received: by outflank-mailman (input) for mailman id 869517;
 Fri, 10 Jan 2025 13:29:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmVM=UC=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tWF4e-0001QR-GE
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 13:29:16 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e33d4457-cf56-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 14:29:15 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5d3dce16a3dso3707488a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 05:29:16 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9900c98d6sm1589297a12.35.2025.01.10.05.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 05:29:14 -0800 (PST)
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
X-Inumbo-ID: e33d4457-cf56-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736515755; x=1737120555; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqLvtnGygQhpjVsvp9h9as+dqMu10ap3I0KwRn4gBrU=;
        b=jRGTW/Pc7/13lWxrUuXVe145yOiFaChY8Lq/aS57KiSuX8T0FQsjEzHN9jmMInvum/
         uSa4zbMULN517N0MrAeaa8NR9Y1h1aeHV/Man9Px0hSFtRLkzW6BZM5toyxJaibT4HEN
         qbUDlKvppe/BsZj1dEyWAHQU6gVIiUIfWbi/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736515755; x=1737120555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqLvtnGygQhpjVsvp9h9as+dqMu10ap3I0KwRn4gBrU=;
        b=t0DdO4mQIVZ7wcuoeeG8BOoSaFgaRr25UmqBL/uHBZMap5iN6e/WNUHYhX+R1t6Xaq
         vi9y+eLdoCAWci+6jmEKhMf1sB+u2LnhTpA6iirR3dQPtOYAOlQd8sYbLAIku6o/rYx4
         JQAxj/MkReZwBMZaohrGBcDxiWOgusFBp+IGMsxc+SWbBN+oHQhQDzxeBm1FQqaP3Qnh
         IAm8mQ/25oAat2gjCvlQRQOKoGHVDqEsilkvx7hBcq9+Cp/9pUyWy/PDNTLxKyyemqhX
         ThPk4781aFg7j6EVe2vRVd72Bw6+iQqLBcUq8QeyzPF50PClDMhzJMeYgZALtsIIBokY
         wUEw==
X-Gm-Message-State: AOJu0Yw6+e2XcQ4oG5QsMTOIHO7PAlXMYn2mvZEXUCCFpGUZt13Mhxic
	Xzsfcf/BDfj8bztvWHqQw324tM0XoXtphGzSaAxpZeVUzOS+WU/c2sT0DC16WmdkOrEUN2LmlPT
	SwiY8VQ==
X-Gm-Gg: ASbGnctFfibL85alxTTccO4PG4f03t3EB5yNovyDBhtQ/Hydp9xF68ifpPMLUkMncXH
	jvYmL2rsXgEha0lqhWJVTKVqIca/ZTjFXKB4P1KDbstdMZ+Kv5vYv1ZpSpfTdZ1kI+YxZOskU4H
	R6N94Qf+Z3k9bWn6lPSqjGpy0JwX7Idk6twIQvHT7/wSgNiXz7qa/MsiBbjygYJ2BdpzwWEFo2v
	/K3aJ7ORxFPg7FJHlmXwk1+9vl0SCDNr/ErZXxjN6j8UbIMUqUo87EUnnM935VEbzYl49zUKUQP
	y3w=
X-Google-Smtp-Source: AGHT+IEUzU/9TuxG5IxaDVVK7OZ7dMFL9qCGMhFZl/jaqgzNc7UBjeNpP97oNPvy+m/qQtqKPk4Isw==
X-Received: by 2002:a05:6402:4408:b0:5d3:eb50:4e33 with SMTP id 4fb4d7f45d1cf-5d9861d1511mr6241934a12.5.1736515755264;
        Fri, 10 Jan 2025 05:29:15 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 08/12] x86/emulator: Refactor FXSAVE_AREA to use wrappers
Date: Fri, 10 Jan 2025 13:28:19 +0000
Message-ID: <20250110132823.24348-9-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
References: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds an UNMAP primitive to make use of vcpu_unmap_xsave_area() when
linked into xen. unmap is a no-op during tests.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2->v3:
  * Fixed typo in first parameter of UNMAP_FXSAVE_AREA.
  * Added Parenthesis around "x" in #else's UNMAP_FXSAVE_AREA(x)

v1->v2:
  * Added comments highlighting fastpath on `current`
---
 xen/arch/x86/x86_emulate/blk.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/x86_emulate/blk.c b/xen/arch/x86/x86_emulate/blk.c
index 08a05f8453f7..11b16aeaec39 100644
--- a/xen/arch/x86/x86_emulate/blk.c
+++ b/xen/arch/x86/x86_emulate/blk.c
@@ -11,9 +11,12 @@
     !defined(X86EMUL_NO_SIMD)
 # ifdef __XEN__
 #  include <asm/xstate.h>
-#  define FXSAVE_AREA ((void *)&current->arch.xsave_area->fpu_sse)
+/* Has a fastpath for `current`, so there's no actual map */
+#  define FXSAVE_AREA ((void *)VCPU_MAP_XSAVE_AREA(current))
+#  define UNMAP_FXSAVE_AREA(x) VCPU_UNMAP_XSAVE_AREA(current, x)
 # else
 #  define FXSAVE_AREA get_fpu_save_area()
+#  define UNMAP_FXSAVE_AREA(x) ((void)(x))
 # endif
 #endif
 
@@ -292,6 +295,9 @@ int x86_emul_blk(
         }
         else
             asm volatile ( "fxrstor %0" :: "m" (*fxsr) );
+
+        UNMAP_FXSAVE_AREA(fxsr);
+
         break;
     }
 
@@ -320,6 +326,9 @@ int x86_emul_blk(
 
         if ( fxsr != ptr ) /* i.e. s->op_bytes < sizeof(*fxsr) */
             memcpy(ptr, fxsr, s->op_bytes);
+
+        UNMAP_FXSAVE_AREA(fxsr);
+
         break;
     }
 
-- 
2.47.1


