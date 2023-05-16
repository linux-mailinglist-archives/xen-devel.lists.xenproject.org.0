Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 672997057D8
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 21:48:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535633.833551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0eA-0002lE-Vb; Tue, 16 May 2023 19:47:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535633.833551; Tue, 16 May 2023 19:47:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0eA-0002iP-RF; Tue, 16 May 2023 19:47:46 +0000
Received: by outflank-mailman (input) for mailman id 535633;
 Tue, 16 May 2023 19:47:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oY92=BF=kernel.org=arnd@srs-se1.protection.inumbo.net>)
 id 1pz0UK-00020V-Ap
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 19:37:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ad9d06d-f421-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 21:37:34 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B40FD63E94;
 Tue, 16 May 2023 19:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B617C4339C;
 Tue, 16 May 2023 19:37:27 +0000 (UTC)
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
X-Inumbo-ID: 1ad9d06d-f421-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684265853;
	bh=VUIVbi0JrRPfajUkNZclAh0STTeBs9rnHGdAvoTKkf0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mC+M7eKABjyFWUz3ahztx+5ej0UDKRHny6IDcOOkOBb7T8TKyoOo1fQHoeIhY+UJr
	 sMwYJWriml+CN5IT55dh+Y3N4Qkk1jy6sqNrI9NQRSoJY9QmUi1UgvCpWOpG8IrCEn
	 JOOcmypp8HYKXesh78Zw9Mn2B1hMfzJ5E0vHwnVhf9EWjHBjng/8AutDQDYVKbiQni
	 nhbYm4YAKuzLx1TphcnEliNa7XAqoVH4gMMnVTi3+fU11+7fSp55kbWmoZSJxYHgWE
	 bkp6SUDmTbzTpuvHIao5LyGY8w2RZRYUNYlNHTF5PTUou4JACCZ0eU58pOVKhjr1zj
	 +aqQ1XVbdlOGQ==
From: Arnd Bergmann <arnd@kernel.org>
To: x86@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Juergen Gross <jgross@suse.com>,
	"Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>,
	Alexey Makhalov <amakhalov@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Andy Shevchenko <andy@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-pci@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-pm@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 14/20] x86: fbdev: include asm/fb.h as needed
Date: Tue, 16 May 2023 21:35:43 +0200
Message-Id: <20230516193549.544673-15-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516193549.544673-1-arnd@kernel.org>
References: <20230516193549.544673-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

fb_is_primary_device() is defined as a global function on x86, unlike
the others that have an inline version. The file that defines is
however needs to include the declaration to avoid a warning:

arch/x86/video/fbdev.c:14:5: error: no previous prototype for 'fb_is_primary_device' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/video/fbdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/video/fbdev.c b/arch/x86/video/fbdev.c
index 9fd24846d094..9e9143085d19 100644
--- a/arch/x86/video/fbdev.c
+++ b/arch/x86/video/fbdev.c
@@ -10,6 +10,7 @@
 #include <linux/pci.h>
 #include <linux/module.h>
 #include <linux/vgaarb.h>
+#include <asm/fb.h>
 
 int fb_is_primary_device(struct fb_info *info)
 {
-- 
2.39.2


