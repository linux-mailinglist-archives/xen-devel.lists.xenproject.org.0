Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45517C92926
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 17:24:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175021.1499943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP1GC-0002oY-JG; Fri, 28 Nov 2025 16:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175021.1499943; Fri, 28 Nov 2025 16:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP1GC-0002ly-Fi; Fri, 28 Nov 2025 16:23:52 +0000
Received: by outflank-mailman (input) for mailman id 1175021;
 Fri, 28 Nov 2025 16:23:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHoX=6E=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vP1GA-0002ls-LI
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 16:23:50 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d8f0d06-cc76-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 17:23:47 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b7370698a8eso106500566b.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Nov 2025 08:23:47 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f5a2176csm472366466b.57.2025.11.28.08.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 08:23:45 -0800 (PST)
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
X-Inumbo-ID: 9d8f0d06-cc76-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764347026; x=1764951826; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2IpQHvzTox4G32Rgow85savMrnDc4tUH/QwMFtXEFsc=;
        b=fD3yHB6kSo3LVdmDx/fGTdGjTQRtUOpjpV/fLRjg5vAFAGPnIzWtXi+V05kzc+2Ucm
         qX/4h9Wprf4BpflcIoG2NlYp8En1WgiXjMg9O3ad3TJi3w1kn7j8VfV+YJMpFUDIOJP0
         jwjZOVhJ/4syGK2A/d+iGBHYAlETK8kdkkCba4IXjLsYscDOJDjBuR1sCLSmsdQ9kiQ/
         0/jQy0Fa3k/RFDrq8zBZqTHjp/PkmkTfhy2gD0pfEmiYrrVHZnXOPHFmzQR0xDyfxcZM
         o1P1YZxBA3zbhHobBnxTeXz0zw2onK22pyKDjmCC1vM60HFfC4c36xee4khy8ADPSNe7
         Fkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764347026; x=1764951826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2IpQHvzTox4G32Rgow85savMrnDc4tUH/QwMFtXEFsc=;
        b=OmN2XX+TLmoI924vCA0Jalyb1YH7gaezYER5Am1j7/v/ZAz3jPvbmNh7pe9El8i2Rb
         7rENLeme7D2qb2E6GuEb9OYnhY3RZkK1Ef7K4RvOcVfYFcFf8P6s00fjpv8xwttxiUw0
         lavTTMNkJG7RBIYzWDcMPussiuF9PjEMBzPVVk0jtyH7xWJ5kliGTjMfyIP+6tG14moY
         66Cs398UXH2xM+aMXngPEdSZQZWPUBmXhgPNDeAra48YKMd4pEFHI/m6xxqUa3kBuUo+
         mDlSwOfDwz7x7vi+pB/25Enp4ow7Wv4ceOEkM3jYJ8BZdimsIN5bMU8FR2XD6Qbssaq0
         i6EQ==
X-Gm-Message-State: AOJu0YwMUPVLiAyLwSF+ZFAtPdyM/oq2oKlW8GQmr32NpKZiyCU9U9Rg
	DjUthsVVl4qANQABrEQiN7qtMVjccI1BSbWL8XN5U3zuCy+x/9Jd8/cKFfR5zGyu
X-Gm-Gg: ASbGncu0wPMTd9/aTp0KSXAXGFdan+mAdMlUB7S/fvzddQSty8/10wgnT91+8kDv/U1
	Rmx76dd5pO678PlO49ZI2ey13x3zYAdyNwSpc9on3QFgc8/g6gIkREcMiExS6LPvNap2Df/j4JG
	tnuvMOGpZf53Q1mpkI23VJmIokeowSE85W7k05jIT5T60nJaMYJ3D3DFarGudxRqJ6dXFdlHFoF
	tJRCck7jc71heIVkALRcK4wOZQQ5SGy8ou0WPnOZMThaFo9bBsEDZltbSN9v9uvzz8lJt+mS2TR
	uHbdceOMJNDM6mu+BYRNfbv4mh0akhFlb6h3xGWicxoUSW9feLjyRvu7coNGiSXzxPLVh4nooR5
	y9XsuEWay639RBMg+sD74X7oEm7OwyaI2G+PuBnhlg+XOxq0EtC+hVfEEMPoQ8yoFYP+pw299Y7
	CobOg8cuUht3bgoAdQmt5IdR1fDv2zCrQ1Wbn0d4Zl+XZ/eH84Nlpq5mE=
X-Google-Smtp-Source: AGHT+IHJSkXwLZL8Xjb13PyuGDJV9IHv05ZhH6nQMhhVHreZDznpFpE44ZxKNeE6PZ6TEDuqT5J8/A==
X-Received: by 2002:a17:907:1c04:b0:b71:8448:a8dd with SMTP id a640c23a62f3a-b7671703d89mr3219472566b.31.1764347026007;
        Fri, 28 Nov 2025 08:23:46 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Timothy Pearson <tpearson@raptorengineering.com>
Subject: [PATCH v2] xen: move vcpu_kick() declaration to common header
Date: Fri, 28 Nov 2025 17:23:35 +0100
Message-ID: <b009997b5f3e7489fadb5f62f1623fc4d13bf271.1764344988.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vcpu_kick() declaration is duplicated across multiple
architecture-specific event.h headers (ARM, x86, PPC).

Remove the redundant declarations and move vcpu_kick() into
the common xen/include/xen/sched.h header.

Drop the definition of vcpu_kick() from ppc/include/asm/event.h,
as it is already provided in ppc/stubs.c.

Add inclusion of xen/sched.h in the files where vcpu_kick() is
used.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
CI tests:
 https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2185404470
---
Changes in v2:
 - Move vcpu_kick() declaration to xen/sched.h instead of xen/event.h
 - Revert changes connected to switching asm/event.h to xen/event.h as vcpu_kick() 
   is now living in xen/sched.h.
 - Add inclusion of xen/sched.h because of moved vcpu_kick() declaration to
   xen/sched.h.
 - Update the commit message.
---
 xen/arch/arm/include/asm/event.h | 1 -
 xen/arch/ppc/include/asm/event.h | 1 -
 xen/arch/x86/cpu/mcheck/vmce.c   | 1 +
 xen/arch/x86/include/asm/event.h | 1 -
 xen/arch/x86/pv/traps.c          | 1 +
 xen/include/xen/sched.h          | 1 +
 6 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/event.h b/xen/arch/arm/include/asm/event.h
index 509157b2b3..e036ab7fb8 100644
--- a/xen/arch/arm/include/asm/event.h
+++ b/xen/arch/arm/include/asm/event.h
@@ -3,7 +3,6 @@
 
 #include <asm/domain.h>
 
-void vcpu_kick(struct vcpu *v);
 void vcpu_mark_events_pending(struct vcpu *v);
 void vcpu_update_evtchn_irq(struct vcpu *v);
 void vcpu_block_unless_event_pending(struct vcpu *v);
diff --git a/xen/arch/ppc/include/asm/event.h b/xen/arch/ppc/include/asm/event.h
index 0f475c4b89..565eee1439 100644
--- a/xen/arch/ppc/include/asm/event.h
+++ b/xen/arch/ppc/include/asm/event.h
@@ -5,7 +5,6 @@
 #include <xen/lib.h>
 
 /* TODO: implement */
-static inline void vcpu_kick(struct vcpu *v) { BUG_ON("unimplemented"); }
 static inline void vcpu_mark_events_pending(struct vcpu *v) { BUG_ON("unimplemented"); }
 static inline void vcpu_update_evtchn_irq(struct vcpu *v) { BUG_ON("unimplemented"); }
 static inline void vcpu_block_unless_event_pending(struct vcpu *v) { BUG_ON("unimplemented"); }
diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmce.c
index 1a7e92506a..5e89c61238 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -12,6 +12,7 @@
 #include <xen/event.h>
 #include <xen/kernel.h>
 #include <xen/delay.h>
+#include <xen/sched.h>
 #include <xen/smp.h>
 #include <xen/mm.h>
 #include <asm/hvm/save.h>
diff --git a/xen/arch/x86/include/asm/event.h b/xen/arch/x86/include/asm/event.h
index 434f65007e..d13ce28167 100644
--- a/xen/arch/x86/include/asm/event.h
+++ b/xen/arch/x86/include/asm/event.h
@@ -11,7 +11,6 @@
 
 #include <xen/shared.h>
 
-void vcpu_kick(struct vcpu *v);
 void vcpu_mark_events_pending(struct vcpu *v);
 
 static inline int vcpu_event_delivery_is_enabled(struct vcpu *v)
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index c3c0976c44..21340eb0e9 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -10,6 +10,7 @@
 #include <xen/event.h>
 #include <xen/hypercall.h>
 #include <xen/lib.h>
+#include <xen/sched.h>
 #include <xen/softirq.h>
 
 #include <asm/debugreg.h>
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 52090b4f70..1f77e0869b 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -877,6 +877,7 @@ void vcpu_wake(struct vcpu *v);
 long vcpu_yield(void);
 void vcpu_sleep_nosync(struct vcpu *v);
 void vcpu_sleep_sync(struct vcpu *v);
+void vcpu_kick(struct vcpu *v);
 
 /*
  * Force synchronisation of given VCPU's state. If it is currently descheduled,
-- 
2.52.0


