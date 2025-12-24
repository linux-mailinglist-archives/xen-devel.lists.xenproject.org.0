Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9853ECDCEB4
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 18:04:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192957.1512041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSH7-000570-9E; Wed, 24 Dec 2025 17:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192957.1512041; Wed, 24 Dec 2025 17:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSH7-00050i-3F; Wed, 24 Dec 2025 17:03:49 +0000
Received: by outflank-mailman (input) for mailman id 1192957;
 Wed, 24 Dec 2025 17:03:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jcWU=66=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vYSH5-0003b7-5H
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 17:03:47 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81f799f9-e0ea-11f0-9cce-f158ae23cfc8;
 Wed, 24 Dec 2025 18:03:45 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b734fcbf1e3so1217320766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Dec 2025 09:03:45 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ab7f7bsm1798927766b.18.2025.12.24.09.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 09:03:44 -0800 (PST)
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
X-Inumbo-ID: 81f799f9-e0ea-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766595825; x=1767200625; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGJ+8PA+B3BZDqfQOwxBtkdsNJonGtyAMvb81pE0IsY=;
        b=dD3IgTGK28E1oOIT4mnmx9bJdTBah48Zr5x/6Lw2WpQODtSfq622R/iiU66V64aDlh
         4csU1v/vJBxzzQ7adyMtsrJPcLuum/EaENybG/dmzBRQjqNVyYoZOMfBZb32q/mIsrnB
         a6o/mDRoS/6eZob0dmh8uBj9tuQmfprOjy+1OGPFVaGwZ6Vo/4xtbxUMCFi9jbTSREUN
         59EkXWDhBJyioegZD8O1Otn0+xI9zAndei9wwxwFvCFfchJelIHQfCilATDBwr5sKvmA
         lF2V1a3K/HRTFwqRZahLgzpYH5zRvkVfF/1yv3iTC3ua34GLvtdIEF3VXQigUetvam09
         AmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766595825; x=1767200625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MGJ+8PA+B3BZDqfQOwxBtkdsNJonGtyAMvb81pE0IsY=;
        b=xQoGptxTYagrKW9NUF34jHWsdxhyd6GJOFi6WmEAfZcjb/m1mAmyQVHkrTsdmlZoEh
         UfUXQ/GTv23ccenJmjlPnnR8koGtEranhyCDiOpzFJLVa05NMsh0rh1iF9rOhQe4unSB
         6WCD6GPlQA5gp2YqAq1ZPLRLatfbVTKAmXA9XG/adPUVDqPFvKKszmKltf8+Fv1a3UtD
         2wVBcB8pTw2ZsRH+2+vlJqOY+rnBzdsgHB/EQ8yOK66fsfAjVaqhzQPqNBDTlfrxlUpf
         jr4pPSJnZRlvnHePH0UDN8NNpHgS/hDxRiPHFB8x8SPQv7pRDMW9Ub0r7X0Indu4Fall
         qj0A==
X-Gm-Message-State: AOJu0YxVxK0+cE2li83v/UHVGQa79rpJ2BLCYA7VyrRHjpLcMexmx1Qv
	SE/HcYAuvl2tnzhS6Zwy+kRx4vBMYklJJ3QKQY1+TZKA+4rnH9vzxVtPLN2ftQ==
X-Gm-Gg: AY/fxX4wTUnBG0wIIOYe4mepk3YL6NADegxvSZLoHNmk+3s2g3k9KAyswBEgGhoaw2K
	XidNgJZ1WQwkjFjLot8lt+7p4G3xEmK4qo/iOH5smGUk8Zateq8HHC9GeDysxJebyhokZpIORnt
	As4hPDFhM5jvdjRNBCS3fB8TNOYIEHXiQ2o3a3nUe6Tr6WH8eAr0uA2mZnNPmciUuinvr1XfIgI
	6I2beg0qLeOaGwWJzT4BwCYGjYywCdg8G3D7e+N2yWDGrE7yRaTaixbs2xs4XwtxPVhCqUPcHrf
	EDZvOcRJhPnnx/RR+Pv6tJkOXPzSgaMO/OVauirgwJuM8nA0TSfxU/vtLxNSteulHME6MV7ICrz
	N7UTSLiuDtZFY0MDtn5kPfd9mszHGcVfKoWBNsWu32dIrDW0zF4fEi77f/GpmRkEb/vSSbTQjyL
	J4V0i2UNLEHgdn3n64zQ6aQQ29tv/mYjlUQVy1dy8UFl7PTy+zM9ivEvk=
X-Google-Smtp-Source: AGHT+IE6Rng/74BQOORFuFqqd25NLbcHLdjnMNrygxPv5l6Eq0mWe3vHJVxozddH9FrS50pBgVXS9Q==
X-Received: by 2002:a17:907:8686:b0:b76:8163:f1f8 with SMTP id a640c23a62f3a-b80371d6725mr1938532166b.53.1766595824765;
        Wed, 24 Dec 2025 09:03:44 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 09/15] xen/riscv: add vtimer_{save,restore}()
Date: Wed, 24 Dec 2025 18:03:22 +0100
Message-ID: <c553efa44f384dcb9a49684c586a762b2a1444c9.1766595589.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766595589.git.oleksii.kurochko@gmail.com>
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add implementations of vtimer_save() and vtimer_restore().

At the moment, vrtimer_save() does nothing as SSTC, which provided
virtualization-aware timer,  isn't supported yet, so emulated (SBI-based)
timer is used.

vtimer uses internal Xen timer: initialize it on the pcpu the vcpu is
running on, rather than the processor that it's creating the vcpu.

On vcpu restore migrate (when vtimer_restore() is going to be called)
the vtimer to the pcpu the vcpu is running on.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/vtimer.h |  3 +++
 xen/arch/riscv/vtimer.c             | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/xen/arch/riscv/include/asm/vtimer.h b/xen/arch/riscv/include/asm/vtimer.h
index 2cacaf74b83b..e0f94f7c31c7 100644
--- a/xen/arch/riscv/include/asm/vtimer.h
+++ b/xen/arch/riscv/include/asm/vtimer.h
@@ -24,4 +24,7 @@ int domain_vtimer_init(struct domain *d, struct xen_arch_domainconfig *config);
 
 void vtimer_set_timer(struct vtimer *t, const uint64_t ticks);
 
+void vtimer_save(struct vcpu *v);
+void vtimer_restore(struct vcpu *v);
+
 #endif /* ASM__RISCV__VTIMER_H */
diff --git a/xen/arch/riscv/vtimer.c b/xen/arch/riscv/vtimer.c
index 99a0c5986f1d..4256fe9a2bb0 100644
--- a/xen/arch/riscv/vtimer.c
+++ b/xen/arch/riscv/vtimer.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/bug.h>
 #include <xen/domain.h>
 #include <xen/sched.h>
 #include <xen/time.h>
@@ -65,3 +66,17 @@ void vtimer_set_timer(struct vtimer *t, const uint64_t ticks)
 
     set_timer(&t->timer, expires);
 }
+
+void vtimer_save(struct vcpu *p)
+{
+    ASSERT(!is_idle_vcpu(p));
+
+    /* Nothing to do at the moment as SSTC isn't supported now. */
+}
+
+void vtimer_restore(struct vcpu *n)
+{
+    ASSERT(!is_idle_vcpu(n));
+
+    migrate_timer(&n->arch.vtimer.timer, n->processor);
+}
-- 
2.52.0


