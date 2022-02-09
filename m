Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA944AEBBF
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 09:03:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268818.462777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHhvo-0002FX-Fx; Wed, 09 Feb 2022 08:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268818.462777; Wed, 09 Feb 2022 08:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHhvo-0002CX-C7; Wed, 09 Feb 2022 08:02:28 +0000
Received: by outflank-mailman (input) for mailman id 268818;
 Wed, 09 Feb 2022 08:02:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1zPP=SY=linutronix.de=bigeasy@srs-se1.protection.inumbo.net>)
 id 1nHhvm-0001r0-HO
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 08:02:26 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c59a9de-897e-11ec-8eb8-a37418f5ba1a;
 Wed, 09 Feb 2022 09:02:24 +0100 (CET)
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
X-Inumbo-ID: 9c59a9de-897e-11ec-8eb8-a37418f5ba1a
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1644393742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mGICh+XWg4zl0BiLYSOzGN+Dsvh3xZ6pQjRuhNeu4t0=;
	b=ExUJbo84qFWHQkDAcAAStNINkRabfk8iqlakMkfpAmeUEtkbAySRTYSeSJDPzjC8ESDJjs
	swNFfrhhlAGeF0NLs/r64Eyk+1Td6b9zKYMN3ok5zwYOgcaOAP1qkPPo1oL2jV2sNsdI5+
	LiSOvtHlUYOZK+mDwdteqLAhgWjyasTaXK64aUt9UGdT8Z5UiiLBZU6owgmiZqsUOgXuLM
	fEDKOzNGXSw1XwOn+qC53DI8miXoiqN0FrfwxuqRL9vsRDzdbnbAHm6QPh7QLy1Brvz86x
	AowW/70fENFFaxAkvAaZcbDSXsWmL22tSd1WGdhaLdOKNblqDvfFYeWtRQhi+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1644393742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mGICh+XWg4zl0BiLYSOzGN+Dsvh3xZ6pQjRuhNeu4t0=;
	b=g1B138BAtPqSmJQ3szFTc93wehmOLL8GH6VVKCoGPE7yBHuAp4eaCSW9kuMmWr95Ow20Gr
	zuRl08iV0JPH6NDg==
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	xen-devel@lists.xenproject.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Longpeng <longpeng2@huawei.com>,
	Gonglei <arei.gonglei@huawei.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Valentin Schneider <valentin.schneider@arm.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH REPOST v2 2/2] cpu/hotplug: Allow the CPU in CPU_UP_PREPARE state to be brought up again.
Date: Wed,  9 Feb 2022 09:02:14 +0100
Message-Id: <20220209080214.1439408-3-bigeasy@linutronix.de>
In-Reply-To: <20220209080214.1439408-1-bigeasy@linutronix.de>
References: <20220209080214.1439408-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: "Longpeng(Mike)" <longpeng2@huawei.com>

A CPU will not show up in virtualized environment which includes an
Enclave. The VM splits its resources into a primary VM and a Enclave
VM. While the Enclave is active, the hypervisor will ignore all requests
to bring up a CPU and this CPU will remain in CPU_UP_PREPARE state.
The kernel will wait up to ten seconds for CPU to show up
(do_boot_cpu()) and then rollback the hotplug state back to
CPUHP_OFFLINE leaving the CPU state in CPU_UP_PREPARE. The CPU state is
set back to CPUHP_TEARDOWN_CPU during the CPU_POST_DEAD stage.

After the Enclave VM terminates, the primary VM can bring up the CPU
again.

Allow to bring up the CPU if it is in the CPU_UP_PREPARE state.

[bigeasy: Rewrite commit description.]

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Link: https://lore.kernel.org/r/20210901051143.2752-1-longpeng2@huawei.com
Reviewed-by: Valentin Schneider <valentin.schneider@arm.com>
Tested-by: Dongli Zhang <dongli.zhang@oracle.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
Link: https://lore.kernel.org/r/20211122154714.xaoxok3fpk5bgznz@linutronix.=
de
Link: https://lore.kernel.org/r/20211206152034.2150770-3-bigeasy@linutronix=
.de
---
 kernel/smpboot.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/smpboot.c b/kernel/smpboot.c
index f6bc0bc8a2aab..b9f54544e7499 100644
--- a/kernel/smpboot.c
+++ b/kernel/smpboot.c
@@ -392,6 +392,13 @@ int cpu_check_up_prepare(int cpu)
 		 */
 		return -EAGAIN;
=20
+	case CPU_UP_PREPARE:
+		/*
+		 * Timeout while waiting for the CPU to show up. Allow to try
+		 * again later.
+		 */
+		return 0;
+
 	default:
=20
 		/* Should not happen.  Famous last words. */
--=20
2.34.1


