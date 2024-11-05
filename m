Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 807F79BCF73
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 15:34:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830265.1245288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8KdB-0004nr-Eu; Tue, 05 Nov 2024 14:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830265.1245288; Tue, 05 Nov 2024 14:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8KdB-0004i0-5v; Tue, 05 Nov 2024 14:34:05 +0000
Received: by outflank-mailman (input) for mailman id 830265;
 Tue, 05 Nov 2024 14:34:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SSsw=SA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t8Kd8-0002Lm-LH
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 14:34:02 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fef368e9-9b82-11ef-99a3-01e77a169b0f;
 Tue, 05 Nov 2024 15:33:59 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5ceca0ec4e7so3883220a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 06:33:59 -0800 (PST)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6a99ff2sm1395047a12.4.2024.11.05.06.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 06:33:58 -0800 (PST)
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
X-Inumbo-ID: fef368e9-9b82-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmIiLCJoZWxvIjoibWFpbC1lZDEteDUyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZlZjM2OGU5LTliODItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODE3MjM5Ljg4MzA0OCwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730817239; x=1731422039; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKD1CllUUFP/95/tHyduaxD4gLazG9r0IgfoStz+dic=;
        b=S+bstDkbGu3y+qM0RnCgWta6KZk/dW2D3rVgqHa0p/+XwT4SiKSxVRn4Qp04kd4KEW
         NVO6Nh6L7QjaxnrjB9JCwelirpeabrUqEYYcYAElCKWLpuQnNIda1jij/orbnPLiiIXd
         mARJVeD8vbkB/fSmK1/gfk0hNzKLfOM4Etyfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817239; x=1731422039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKD1CllUUFP/95/tHyduaxD4gLazG9r0IgfoStz+dic=;
        b=t+NEiCXvQLI6ZBRo+PaDoa2ekiRxeESia/SQL1jsgS4Z73MIeY7vmQz+upf6VDmy/3
         6PwZt2eXhdWn/FSI34YpQUBCZxOEPndMy3TDnIpc7KvQnXkqNVsollbTxFQOJqAHcTVZ
         NB2I5bEC2FAFPxd07vmb7jj4n6LLBYpqNCiAxJI+dtIpHuxj9knGmAwtLlD9vbkkm5KB
         Bz5YRct30yuoVQOBKNc0cj5AmsDuCcJgi7kowHFwQpS6HBJrBF5MFWafk48gXCsXCiaP
         +mPf5ZVxlZwFM57e+0j5d9bVmH3vUXwx9AkMFeF2gzXX9OC9QAQmF1dM/yZ+orifw5bD
         tblg==
X-Gm-Message-State: AOJu0Yx/eGEo1c1szvU1bcL8CPTrPyisiNs0EfU5G5cSLIyUL9cLTGT2
	J0+KSQg8sBH+HLqpjz7SpsfDisZrdnQKA+GiNhDch4NM+G8oi6KUUFLVqcDeztmWlowjRLs1cNi
	m
X-Google-Smtp-Source: AGHT+IHRZFhPefPtV7nx6c0cnFCSuUCW8livz50ATFuMJWDV1OhNGuvheVnLhO3/SW011uPiQ9tJRw==
X-Received: by 2002:a05:6402:845:b0:5cb:6675:bb3b with SMTP id 4fb4d7f45d1cf-5cbbf8b23eemr24693657a12.13.1730817239003;
        Tue, 05 Nov 2024 06:33:59 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 09/13] x86/emulator: Refactor FXSAVE_AREA to use wrappers
Date: Tue,  5 Nov 2024 14:33:06 +0000
Message-ID: <20241105143310.28301-10-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds an UNMAP primitive to make use of vcpu_unmap_xsave_area() when
linked into xen. unmap is a no-op during tests.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * Added comments highlighting fastpath on `current`
---
 xen/arch/x86/x86_emulate/blk.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/x86_emulate/blk.c b/xen/arch/x86/x86_emulate/blk.c
index 08a05f8453f7..76fd497ed8a3 100644
--- a/xen/arch/x86/x86_emulate/blk.c
+++ b/xen/arch/x86/x86_emulate/blk.c
@@ -11,9 +11,12 @@
     !defined(X86EMUL_NO_SIMD)
 # ifdef __XEN__
 #  include <asm/xstate.h>
-#  define FXSAVE_AREA ((void *)&current->arch.xsave_area->fpu_sse)
+/* has a fastpath for `current`, so there's no actual map */
+#  define FXSAVE_AREA ((void *)VCPU_MAP_XSAVE_AREA(current))
+#  define UNMAP_FXSAVE_AREA(x) VCPU_UNMAP_XSAVE_AREA(currt ent, x)
 # else
 #  define FXSAVE_AREA get_fpu_save_area()
+#  define UNMAP_FXSAVE_AREA(x) ((void)x)
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
2.47.0


