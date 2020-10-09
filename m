Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA90288BB8
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 16:43:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4783.12600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQtbO-0002ux-3d; Fri, 09 Oct 2020 14:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4783.12600; Fri, 09 Oct 2020 14:42:34 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQtbO-0002uY-0F; Fri, 09 Oct 2020 14:42:34 +0000
Received: by outflank-mailman (input) for mailman id 4783;
 Fri, 09 Oct 2020 14:42:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gROa=DQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kQtbM-0002uT-05
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 14:42:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b55b9195-e2b9-4385-9a97-de4bb1c7c545;
 Fri, 09 Oct 2020 14:42:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E8F0CAE2C;
 Fri,  9 Oct 2020 14:42:29 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gROa=DQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kQtbM-0002uT-05
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 14:42:32 +0000
X-Inumbo-ID: b55b9195-e2b9-4385-9a97-de4bb1c7c545
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b55b9195-e2b9-4385-9a97-de4bb1c7c545;
	Fri, 09 Oct 2020 14:42:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602254550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Mf9G95BFIif8P4JOo8vFEGHaFCuDzB5d2ITiJa6fvhQ=;
	b=hWIW3UxjjlHedkBjscX2/oMZBiqp8cMgbM5bV0NCuQYPfsNOtHucN61nhTHeTWM/sa/i8N
	bFbDMkKpRE+iGrAeCuYdUClZo3vcbJlPsqnB+JDYS54Jzgb0ekl4iudUBLU/kUI503bLol
	WkWWXUua7KDrPPiTrIomxXNLksFUXZo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E8F0CAE2C;
	Fri,  9 Oct 2020 14:42:29 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>
Subject: [PATCH] x86/alternative: don't call text_poke() in lazy TLB mode
Date: Fri,  9 Oct 2020 16:42:25 +0200
Message-Id: <20201009144225.12019-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running in lazy TLB mode the currently active page tables might
be the ones of a previous process, e.g. when running a kernel thread.

This can be problematic in case kernel code is being modified via
text_poke() in a kernel thread, and on another processor exit_mmap()
is active for the process which was running on the first cpu before
the kernel thread.

As text_poke() is using a temporary address space and the former
address space (obtained via cpu_tlbstate.loaded_mm) is restored
afterwards, there is a race possible in case the cpu on which
exit_mmap() is running wants to make sure there are no stale
references to that address space on any cpu active (this e.g. is
required when running as a Xen PV guest, where this problem has been
observed and analyzed).

In order to avoid that, drop off TLB lazy mode before switching to the
temporary address space.

Fixes: cefa929c034eb5d ("x86/mm: Introduce temporary mm structs")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/kernel/alternative.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index cdaab30880b9..cd6be6f143e8 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -807,6 +807,15 @@ static inline temp_mm_state_t use_temporary_mm(struct mm_struct *mm)
 	temp_mm_state_t temp_state;
 
 	lockdep_assert_irqs_disabled();
+
+	/*
+	 * Make sure not to be in TLB lazy mode, as otherwise we'll end up
+	 * with a stale address space WITHOUT being in lazy mode after
+	 * restoring the previous mm.
+	 */
+	if (this_cpu_read(cpu_tlbstate.is_lazy))
+		leave_mm(smp_processor_id());
+
 	temp_state.mm = this_cpu_read(cpu_tlbstate.loaded_mm);
 	switch_mm_irqs_off(NULL, mm, current);
 
-- 
2.26.2


