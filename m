Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC52CB07A5
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 16:57:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181923.1504897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT05d-00079T-An; Tue, 09 Dec 2025 15:57:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181923.1504897; Tue, 09 Dec 2025 15:57:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT05d-00077B-7i; Tue, 09 Dec 2025 15:57:25 +0000
Received: by outflank-mailman (input) for mailman id 1181923;
 Tue, 09 Dec 2025 15:57:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3Df=6P=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vT05b-00074j-M1
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 15:57:23 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf68e9e6-d517-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 16:57:22 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47755de027eso40515905e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 07:57:22 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a7d6a19cesm46330905e9.15.2025.12.09.07.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Dec 2025 07:57:21 -0800 (PST)
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
X-Inumbo-ID: bf68e9e6-d517-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765295841; x=1765900641; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aDmh6Prc1PbllrKXX7d+dNCoSrcxBgqey3kMovH9Ac8=;
        b=bIh6yNXLBBigUa0ErAFZHfhOYdHcupOccKsll8l3gennQ3tA9ofkRgXeWaTQD7Trdf
         26oS6NVcXAEXhenUzLwI/pxMwOcyY6LDJMcF4udwmjWPQrM+vohbp4cZCqxJdn2Q9Itv
         5y/VZI8hRhpzDy8qhzVkPyxAFFL7teZRyGEF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765295841; x=1765900641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDmh6Prc1PbllrKXX7d+dNCoSrcxBgqey3kMovH9Ac8=;
        b=aGQvCNnvt2qfPkfVyWZ8s7iJIj+UuD98fGotlLFuoA1VTHT3Ysb3jcPylmNaAsmgij
         Z/NWFKoDeXbctMuzfvYWSKdOs93DKkxAqBSj9nx6ZrL9OaVLXRq16/FZFdylNDhNFH8Z
         PgAumZ+8Y+cPrhBAx1OaF06gM5Nm+GKYM27uauKEYE7HxkJja1CfJPD6K/+WSE8zU1ed
         WdeGH1wiJIAgTSdDhALidjrs/cpdxoXftlVLsPyaAC0butoY5CtPLDqSgqC6aWXuol9V
         COrneqlHT6nM6iyTsUyHeSqlRkdejABri60SrRN63ibPA1ZVQvXe+t1kZpj06PqFQjz/
         Of5A==
X-Gm-Message-State: AOJu0YxTayvCEv26u/qzfOi0DDF+hazMG1t/N0pEQyvCqIN39B13XRSb
	8qI4KNzEoiBBMHPHGNlu2OzTXGPxMCXM1GW8HIf1cDj5Vj8ZnpEDehP8m0Nc08O0VG+ykaSf4o1
	9cQca
X-Gm-Gg: ASbGncvTjtwa7Ho/LY/y1Ao2YMJ3wBB6VJsATBT4hShhpbqxbNo11wpHS8Ss/641w2l
	sPvw53HmKh6maDLI/OQcY+eJt3sWIfGyHdV0ibBSTBinG4fCSNUijgEGSNMQV4o8ZbFXuwQKfx+
	1YpHTslkl5UqSkQF+JQGICgERM78+vuizbQJB7fq2o6KEowWukGvoKt5TQ8mq2eQcjbRAzl/I00
	r/J7ySbrxv6K/KiahxraTn8w73GT4B+QjMTgABWGJ6scUy994ma25tkWDcKftflacQXGsvynvre
	RsuovRNKZRkn42fgVGrNLAEWId54Hy7pqLDlTE1E+6xCHS6KqqT9YuHt6Cb9gvyGNFJa/MOyLpU
	FBBL06p9FzmVZGjeBawG72GqI33VWTf/sEPJlShG5Xj5LfAveJAWExaUD5mujkaEpG3KXW2dM4C
	O9hOy1m0yyXxzLyVhe41k98ezl3oHxZ16a8pQNHxbxXE0fKfKb55GYtk6NfZ3QZw==
X-Google-Smtp-Source: AGHT+IFSQPUiD1UwneOvw1KQZyUEmK1CA4uto6kVKSs/dOkEDcaXyzfeJnNj3hHWy+0uNx7DK+ylWA==
X-Received: by 2002:a05:600c:198f:b0:471:115e:87bd with SMTP id 5b1f17b1804b1-47939e381damr141974565e9.26.1765295841356;
        Tue, 09 Dec 2025 07:57:21 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [PATCH] x86/pv: Unhide writes to d->arch.hv_compat_vstart
Date: Tue,  9 Dec 2025 15:57:19 +0000
Message-Id: <20251209155719.2098440-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The variable is never 0, but because the writes into it are hidden behind the
HYPERVISOR_COMPAT_VIRT_START() macro, it does a good impression of appearing
to be 0.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/x86/domain.c        | 2 +-
 xen/arch/x86/pv/dom0_build.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index bd75d044a01b..d33a42c8824c 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -891,7 +891,7 @@ int arch_domain_create(struct domain *d,
     d->arch.emulation_flags = emflags;
 
 #ifdef CONFIG_PV32
-    HYPERVISOR_COMPAT_VIRT_START(d) =
+    d->arch.hv_compat_vstart =
         is_pv_domain(d) ? __HYPERVISOR_COMPAT_VIRT_START : ~0u;
 #endif
 
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 21158ce1812e..fed03dc15dcf 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -521,7 +521,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
                 printk("Dom0 expects too high a hypervisor start address\n");
                 return -ERANGE;
             }
-            HYPERVISOR_COMPAT_VIRT_START(d) =
+            d->arch.hv_compat_vstart =
                 max_t(unsigned int, m2p_compat_vstart, value);
         }
 

base-commit: 63137a87311e1081bce0c5a4364492b4fc728bfb
-- 
2.39.5


