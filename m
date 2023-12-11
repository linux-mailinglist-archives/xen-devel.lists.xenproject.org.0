Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D30280C9A8
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 13:23:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651731.1017518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCfJp-0005V7-4L; Mon, 11 Dec 2023 12:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651731.1017518; Mon, 11 Dec 2023 12:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCfJp-0005SA-1C; Mon, 11 Dec 2023 12:23:29 +0000
Received: by outflank-mailman (input) for mailman id 651731;
 Mon, 11 Dec 2023 12:23:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rCfJo-0005Ns-7E
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 12:23:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rCfJo-0003oL-4I; Mon, 11 Dec 2023 12:23:28 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rCfJn-0001JH-RT; Mon, 11 Dec 2023 12:23:28 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=QmraDL7EiHJusNTBmKq404QcRHhqD9isCoOntnGhREE=; b=GKlSyZyKaUErUVPD3/b/wo3VRI
	Ea/Rg0Z7cfOrv8KgD7ghQWyKdv0s+nW3opDztPJxWuvaiRKtEpE1k0AFVPgkeiYND7hiX70isu5l4
	FsM38YbIgSBo7N8XEff+MvBosePnJCktGRQtIf2bvQeEyRBjgoC7OQCMc1ha/bM13EQo=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/2] xen/x86: io_apic: Introduce a command line option to skip timer check
Date: Mon, 11 Dec 2023 12:23:21 +0000
Message-Id: <20231211122322.15815-2-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231211122322.15815-1-julien@xen.org>
References: <20231211122322.15815-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Currently, Xen will spend ~100ms to check if the timer works. If the
Admin knows their platform have a working timer, then it would be
handy to be able to bypass the check.

Introduce a command line option 'pit-irq-works' for this purpose.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Changelog since v1:
    - Rename the command line option. I went with pit-irq-works rather
      than timer-irq-works because Roger thought it would be better suited
    - Rework the command line description
---
 docs/misc/xen-command-line.pandoc | 11 +++++++++++
 xen/arch/x86/io_apic.c            | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 8e65f8bd18bf..c382b061b302 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2535,6 +2535,17 @@ pages) must also be specified via the tbuf_size parameter.
 ### tickle_one_idle_cpu
 > `= <boolean>`
 
+### pit-irq-works (x86)
+> `=<boolean>`
+
+> Default: `false`
+
+Disables the code which tests for broken timer IRQ sources. Enabling
+this option will reduce boot time on HW where the timer works properly.
+
+If the system is unstable when enabling the option, then it means you
+may have a broken HW and therefore the testing cannot be be skipped.
+
 ### timer_slop
 > `= <integer>`
 
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index d11c880544e6..238b6c1c2837 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -57,6 +57,14 @@ bool __initdata ioapic_ack_forced;
 int __read_mostly nr_ioapic_entries[MAX_IO_APICS];
 int __read_mostly nr_ioapics;
 
+/*
+ * The logic to check if the timer is working is expensive. So allow
+ * the admin to bypass it if they know their platform doesn't have
+ * a buggy timer.
+ */
+static bool __initdata pit_irq_works;
+boolean_param("pit-irq-works", pit_irq_works);
+
 /*
  * Rough estimation of how many shared IRQs there are, can
  * be changed anytime.
@@ -1502,6 +1510,9 @@ static int __init timer_irq_works(void)
 {
     unsigned long t1, flags;
 
+    if ( pit_irq_works )
+        return 1;
+
     t1 = ACCESS_ONCE(pit0_ticks);
 
     local_save_flags(flags);
-- 
2.40.1


