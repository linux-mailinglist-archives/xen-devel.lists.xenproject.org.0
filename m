Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA506706887
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 14:46:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535910.833949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzGXB-000748-D4; Wed, 17 May 2023 12:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535910.833949; Wed, 17 May 2023 12:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzGXB-00071b-7V; Wed, 17 May 2023 12:45:37 +0000
Received: by outflank-mailman (input) for mailman id 535910;
 Wed, 17 May 2023 12:45:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v3JH=BG=kernel.org=arnd@srs-se1.protection.inumbo.net>)
 id 1pzGX9-00071T-8L
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 12:45:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b668fed2-f4b0-11ed-b229-6b7b168915f2;
 Wed, 17 May 2023 14:45:33 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B5DC7646CA;
 Wed, 17 May 2023 12:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC045C4339B;
 Wed, 17 May 2023 12:45:28 +0000 (UTC)
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
X-Inumbo-ID: b668fed2-f4b0-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684327532;
	bh=iOvwhrIqurJ9VDkNH99fkMyAAsvkDjtRTJDy0SAwuEE=;
	h=From:To:Cc:Subject:Date:From;
	b=KXW/r94Q7ohDPiHr0WynE0BNA5PbgMdv1VdP3fPVRosVwyBRn7cKtcvUHduFDm/6n
	 Z7ROnCIBNMzOYh4W6Lne0zgMcRsWz4vfpGfN2AFOdfrb+uUtd7orQ0KL6Kp5dEGLrs
	 FlzSb7yHd4VOO64a3lGHt429hR9rOA9YlSkxHH/kaptA/8GzG3jIOOIFT34l7SD+GH
	 lne4q4ssxGKV8nM4y86ywSHghXnzr3qmL6B11q5AKGvTW76/nagyX35hi0QLj5CSX8
	 rjKhJ/JdACi3+X78dudTjmyOL6QV+dyifUsO3VQeo+W+pkq6tm0+ts0sn+8kgtqGYL
	 GOd3HPkal7XTw==
From: Arnd Bergmann <arnd@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xen: xen_debug_interrupt prototype to global header
Date: Wed, 17 May 2023 14:45:07 +0200
Message-Id: <20230517124525.929201-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The xen_debug_interrupt() function is only called on x86, which has a
prototype in an architecture specific header, but the definition also
exists on others, where the lack of a prototype causes a W=1 warning:

drivers/xen/events/events_2l.c:264:13: error: no previous prototype for 'xen_debug_interrupt' [-Werror=missing-prototypes]

Move the prototype into a global header instead to avoid this warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/xen/xen-ops.h | 2 --
 include/xen/events.h   | 3 +++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index 84a35ff1e0c9..0f71ee3fe86b 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -72,8 +72,6 @@ void xen_restore_time_memory_area(void);
 void xen_init_time_ops(void);
 void xen_hvm_init_time_ops(void);
 
-irqreturn_t xen_debug_interrupt(int irq, void *dev_id);
-
 bool xen_vcpu_stolen(int vcpu);
 
 void xen_vcpu_setup(int cpu);
diff --git a/include/xen/events.h b/include/xen/events.h
index 44c2855c76d1..ac1281c5ead6 100644
--- a/include/xen/events.h
+++ b/include/xen/events.h
@@ -138,4 +138,7 @@ int xen_test_irq_shared(int irq);
 
 /* initialize Xen IRQ subsystem */
 void xen_init_IRQ(void);
+
+irqreturn_t xen_debug_interrupt(int irq, void *dev_id);
+
 #endif	/* _XEN_EVENTS_H */
-- 
2.39.2


