Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE5A9C6A76
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 09:19:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835088.1250920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB8ak-00026e-ST; Wed, 13 Nov 2024 08:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835088.1250920; Wed, 13 Nov 2024 08:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB8ak-00024t-Pm; Wed, 13 Nov 2024 08:19:10 +0000
Received: by outflank-mailman (input) for mailman id 835088;
 Wed, 13 Nov 2024 08:19:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZFwE=SI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1tB8aj-00024i-Id
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 08:19:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2930e0d-a197-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 09:19:05 +0100 (CET)
Received: from truciolo.bugseng.com (unknown [37.161.56.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 876DC4EE0746;
 Wed, 13 Nov 2024 09:19:04 +0100 (CET)
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
X-Inumbo-ID: f2930e0d-a197-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE2Mi41NS4xMzEuNDciLCJoZWxvIjoic3VwcG9ydC5idWdzZW5nLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImYyOTMwZTBkLWExOTctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDg1OTQ1LjU4NjkxMiwic2VuZGVyIjoiZmVkZXJpY28uc2VyYWZpbmlAYnVnc2VuZy5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1731485945; bh=gikYKJ/kKxTgJ648RNOba3OHb2s582EVNyvg3y+74eE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kUi3m3kPFCKpdZrB2EGiobIJPCCz5E0Qso4WtZeihNtFXPs6xpyMK1vf1hCGRkxML
	 gU/tkH5XJL4cmrev3ECmID24zmPBc+HFXX7ZkxQzArGKpi3pNfdcFAC1PBSOB+gj9N
	 zPRMYnjEXjzbjaKwYYKljofnl4SHebnL9vsLHLiEeCNhdXP8l/H2HDTP49LXkorjlD
	 6hCuqxYPZaKKSuLESO4VzkOVwrP3aeaU/URNR/K/nNNXefdkwt0rUKm/6TY+DPVi8M
	 P7wv4G/6+I+ml+LGfQPqWvrPdR5H9sAgPZSs9SbQBLOcljiAE7BwupIaW6tgsnfY5H
	 OV7GxWBOXf9aw==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 1/3] x86/emul: auxiliary definition of pseudo keyword fallthrough
Date: Wed, 13 Nov 2024 09:17:26 +0100
Message-ID: <f1dc3c1e70cfa9f7ce505e10624d0771f7697013.1731485149.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1731485149.git.federico.serafini@bugseng.com>
References: <cover.1731485149.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pseudo keyword fallthrough shall be used to make explicit the
fallthrough intention at the end of a case statement (doing this
using comments is deprecated).

A definition of such pseudo keyword is already present in the
Xen build. This auxiliary definition makes it available also for
for test and fuzzing harness without iterfearing with the one
that the Xen build has.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes from v1:
- moved definition in the right file;
- remove useless parenthesis;
- description improved.
---
 tools/tests/x86_emulator/x86-emulate.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/tests/x86_emulator/x86-emulate.h b/tools/tests/x86_emulator/x86-emulate.h
index 00abc829b0..b01bb0cdce 100644
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -70,6 +70,16 @@
 extern uint32_t mxcsr_mask;
 extern struct cpu_policy cpu_policy;
 
+/*
+ * Pseudo keyword 'fallthrough' to make explicit the fallthrough intention at
+ * the end of a case statement block.
+ */
+#if !defined(__clang__) && (__GNUC__ >= 7)
+# define fallthrough        __attribute__((__fallthrough__))
+#else
+# define fallthrough        do {} while (0)  /* fallthrough */
+#endif
+
 #define MMAP_SZ 16384
 bool emul_test_init(void);
 
-- 
2.43.0


