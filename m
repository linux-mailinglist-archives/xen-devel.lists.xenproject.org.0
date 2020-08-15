Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9862450DA
	for <lists+xen-devel@lfdr.de>; Sat, 15 Aug 2020 12:07:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6t5T-0007Vt-BR; Sat, 15 Aug 2020 10:06:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ceF6=BZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k6t5R-0007V7-ES
 for xen-devel@lists.xenproject.org; Sat, 15 Aug 2020 10:06:53 +0000
X-Inumbo-ID: 0a0c8da6-331e-484d-9751-282eef4a4d7b
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a0c8da6-331e-484d-9751-282eef4a4d7b;
 Sat, 15 Aug 2020 10:06:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8CFB7B052;
 Sat, 15 Aug 2020 10:07:10 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v4 4/6] x86/entry/32: revert "Fix XEN_PV build dependency"
Date: Sat, 15 Aug 2020 12:06:39 +0200
Message-Id: <20200815100641.26362-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200815100641.26362-1-jgross@suse.com>
References: <20200815100641.26362-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

With 32-bit Xen PV support gone commit a4c0e91d1d65bc58
("x86/entry/32: Fix XEN_PV build dependency") can be reverted again.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/idtentry.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/idtentry.h
index a43366191212..337dcfd45472 100644
--- a/arch/x86/include/asm/idtentry.h
+++ b/arch/x86/include/asm/idtentry.h
@@ -547,7 +547,7 @@ DECLARE_IDTENTRY_RAW(X86_TRAP_MC,	exc_machine_check);
 
 /* NMI */
 DECLARE_IDTENTRY_NMI(X86_TRAP_NMI,	exc_nmi);
-#if defined(CONFIG_XEN_PV) && defined(CONFIG_X86_64)
+#ifdef CONFIG_XEN_PV
 DECLARE_IDTENTRY_RAW(X86_TRAP_NMI,	xenpv_exc_nmi);
 #endif
 
@@ -557,7 +557,7 @@ DECLARE_IDTENTRY_DEBUG(X86_TRAP_DB,	exc_debug);
 #else
 DECLARE_IDTENTRY_RAW(X86_TRAP_DB,	exc_debug);
 #endif
-#if defined(CONFIG_XEN_PV) && defined(CONFIG_X86_64)
+#ifdef CONFIG_XEN_PV
 DECLARE_IDTENTRY_RAW(X86_TRAP_DB,	xenpv_exc_debug);
 #endif
 
-- 
2.26.2


