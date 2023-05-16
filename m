Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0C170578D
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 21:39:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535598.833491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0WJ-0006r0-Lc; Tue, 16 May 2023 19:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535598.833491; Tue, 16 May 2023 19:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0WJ-0006oj-I7; Tue, 16 May 2023 19:39:39 +0000
Received: by outflank-mailman (input) for mailman id 535598;
 Tue, 16 May 2023 19:39:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oY92=BF=kernel.org=arnd@srs-se1.protection.inumbo.net>)
 id 1pz0Tp-00020V-VX
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 19:37:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08b71e5d-f421-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 21:37:04 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4C09F63EB5;
 Tue, 16 May 2023 19:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2D1C433AC;
 Tue, 16 May 2023 19:36:56 +0000 (UTC)
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
X-Inumbo-ID: 08b71e5d-f421-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684265822;
	bh=DMCbu5Ck8nL16laCe8gzQ409+Zy7oFJ6XN+76haQQGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q3CPblb9vbnnqFuY1tw61aFfK9l0Nhj6hfccpdSnjngrZvApvgdIxViPf4vjP57Qt
	 qFvGozg2KkPlPBN+rhtss57IV7tT1g8FtyasUBtWiN829+Muh+cn2shwW83ND+k0Cc
	 FplnF09GMWMj2fcC0b4/jJX2TTCfua7UEdLt0MdxFgk7PQtYpG9Ml8CxcQcizGiZaB
	 ZR03FhPL6TM5aGirSEx1n5ym6Z3bavzahWDpVyLa0GqRqs2Kjp4+nNz+wxsThyDUFs
	 rdCC/oV4Ld02UzX5Lf0ab8U3AP0KQT6Q7EydXL76RrAs/+USlWya2sP3b0UpG2emEd
	 pAwthPxEXYTPA==
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
Subject: [PATCH 09/20] x86: platform_quirks: include linux/pnp.h for arch_pnpbios_disabled
Date: Tue, 16 May 2023 21:35:38 +0200
Message-Id: <20230516193549.544673-10-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516193549.544673-1-arnd@kernel.org>
References: <20230516193549.544673-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

arch_pnpbios_disabled() is defined in architecture code on x86, but this
does not include the appropriate header, causing a warning:

arch/x86/kernel/platform-quirks.c:42:13: error: no previous prototype for 'arch_pnpbios_disabled' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/kernel/platform-quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/platform-quirks.c b/arch/x86/kernel/platform-quirks.c
index b348a672f71d..b525fe6d6657 100644
--- a/arch/x86/kernel/platform-quirks.c
+++ b/arch/x86/kernel/platform-quirks.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/pnp.h>
 
 #include <asm/setup.h>
 #include <asm/bios_ebda.h>
-- 
2.39.2


