Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B06DE9B3552
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 16:50:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826692.1241113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0S-0002M4-FJ; Mon, 28 Oct 2024 15:50:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826692.1241113; Mon, 28 Oct 2024 15:50:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0S-0002D9-4v; Mon, 28 Oct 2024 15:50:12 +0000
Received: by outflank-mailman (input) for mailman id 826692;
 Mon, 28 Oct 2024 15:50:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7IZ5=RY=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5S0P-0008FV-QF
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 15:50:09 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e98f673-9544-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 16:50:08 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so669331866b.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 08:50:08 -0700 (PDT)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a0834a6sm387674066b.191.2024.10.28.08.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 08:50:07 -0700 (PDT)
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
X-Inumbo-ID: 4e98f673-9544-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730130607; x=1730735407; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVQr91XZlcFHKTZl1uI+zUZ3+gisoPjkP7pJQrXj6Go=;
        b=MfUNumKTljT6wgPlIt4UNi9ZUHNwx1vhLw7gMn085JDV8UNVsrwSrX0gj5+wstiwu/
         mP/SE7tJQRYMxLonKrfqlnXiyN9EtudWe5Z847+ml74LkFUEUaYCa0utvUeHi6ZMvShy
         6Jsya90FcYEkhBdMbRHaKLf74XfarQxRmk1hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730130607; x=1730735407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVQr91XZlcFHKTZl1uI+zUZ3+gisoPjkP7pJQrXj6Go=;
        b=CTjod5ch/PrC5Uf1C7o6jOGRL/D07GYQjU0CIu9wtUe1oVDa/jhIp2qhbdoReRxD2f
         TDv7/bp+Aa6aKzev7B/alXJhV0ObnzYCCdiTVz7kOsHEtZTExdpGiZJdQvPXoHs51p7b
         a7mgKO8hC59S4i2YwPW7utTkqdlvLpkjh83rT96uxXIw05oczZ7BFEXtoHxyVTvpcZCH
         1M3358w9sybvfp6Uwo2jVJhTWLuOFcv2OQINx/URp58mk97AGz8UeIzq5UpUjZS29vuO
         aRa+AonMHCRKv/Q4BYeDmR8QdK3Z0aNFtA4d7D9Ns/FDNGC+AB7Hto4aV/BmNClblNpw
         OG7Q==
X-Gm-Message-State: AOJu0YycqrhH9E8bvTIi8y1ESat1PLdBlKXiectz8x2WUKeAoM4UwZzs
	70Cn93Lip5afnjVnJ5iRcDT1DnkyHR3RQtxWm3N1g6UbJj/CZHvGzEv6MYCgCe4HF31lq+5nVfS
	q
X-Google-Smtp-Source: AGHT+IE9C6AE9q4nMjRt1C+VfW2rH9XoLb9J6ZQJla+EMe54GmyWuVpV1KfcGJcfCKDpZX5aG3UOew==
X-Received: by 2002:a17:907:1c9d:b0:a99:ed2e:3875 with SMTP id a640c23a62f3a-a9de615ece4mr713802766b.42.1730130607479;
        Mon, 28 Oct 2024 08:50:07 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 09/14] x86/emulator: Refactor FXSAVE_AREA to use wrappers
Date: Mon, 28 Oct 2024 15:49:27 +0000
Message-ID: <20241028154932.6797-10-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds an UNMAP primitive to make use of vcpu_unmap_xsave_area() when
linked into xen. unmap is a no-op during tests.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/x86_emulate/blk.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/x86_emulate/blk.c b/xen/arch/x86/x86_emulate/blk.c
index 08a05f8453f7..d5b59333823f 100644
--- a/xen/arch/x86/x86_emulate/blk.c
+++ b/xen/arch/x86/x86_emulate/blk.c
@@ -11,9 +11,11 @@
     !defined(X86EMUL_NO_SIMD)
 # ifdef __XEN__
 #  include <asm/xstate.h>
-#  define FXSAVE_AREA ((void *)&current->arch.xsave_area->fpu_sse)
+#  define FXSAVE_AREA ((void *)vcpu_map_xsave_area(current))
+#  define UNMAP_FXSAVE_AREA(x) vcpu_unmap_xsave_area(currt ent, x)
 # else
 #  define FXSAVE_AREA get_fpu_save_area()
+#  define UNMAP_FXSAVE_AREA(x) ((void)x)
 # endif
 #endif
 
@@ -292,6 +294,9 @@ int x86_emul_blk(
         }
         else
             asm volatile ( "fxrstor %0" :: "m" (*fxsr) );
+
+        UNMAP_FXSAVE_AREA(fxsr);
+
         break;
     }
 
@@ -320,6 +325,9 @@ int x86_emul_blk(
 
         if ( fxsr != ptr ) /* i.e. s->op_bytes < sizeof(*fxsr) */
             memcpy(ptr, fxsr, s->op_bytes);
+
+        UNMAP_FXSAVE_AREA(fxsr);
+
         break;
     }
 
-- 
2.47.0


