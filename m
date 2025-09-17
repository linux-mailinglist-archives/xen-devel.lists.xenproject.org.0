Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 775FEB8204E
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 23:49:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125558.1467467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz00q-0005cP-Nf; Wed, 17 Sep 2025 21:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125558.1467467; Wed, 17 Sep 2025 21:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz00q-0005Ys-Jy; Wed, 17 Sep 2025 21:48:28 +0000
Received: by outflank-mailman (input) for mailman id 1125558;
 Wed, 17 Sep 2025 21:48:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uz00p-0005Yi-Rx
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 21:48:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uz00p-00EY7N-1F;
 Wed, 17 Sep 2025 21:48:27 +0000
Received: from [149.199.65.200] (helo=l14..)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uz00p-00F7dH-0s;
 Wed, 17 Sep 2025 21:48:27 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From;
	bh=XGb+gGeKyZDQMTF1ARe7eP6YHdANHrG833P8p7ukfEs=; b=f4HPfzJd1S8AoNGApw71ZGzBi8
	gfTRl7TJtxz9yfCUORsTH8CjfSc0QFblFffV5eKU4UVNAI0dRSBNngaxJB1V6v1CB9fodtE6FPJO8
	8X9jKnpW+pttkN1VsvbZ6kHaZnw3bcK4naF7zOkbfrCUjM3NhFcxtmpTLe9WxOjfoD4Q=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC XEN PATCH] build: Require explicit .config update
Date: Wed, 17 Sep 2025 23:45:20 +0200
Message-ID: <20250917214519.64323-2-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

It is sometime unwelcome for the config of the hypervisor to change.

Make output will be something like that:
  tools/kconfig/conf  --syncconfig Kconfig

  *** The configuration requires explicit update.

  make[2]: *** [/xen.git/xen/tools/kconfig/Makefile:73: syncconfig] Error 1
    GEN     Makefile
  /xen.git/xen/Rules.mk:19: include/config/auto.conf: No such file or directory
  make[2]: *** No rule to make target 'include/config/auto.conf'.  Stop.
  make[1]: *** [/xen.git/xen/Makefile:620: xen] Error 2
  make: *** [/xen.git/xen/Makefile:179: __sub-make] Error 2

This also prevent update when the toolchain change and change CONFIG_*
values like CONFIG_GCC_VERSION.

Proposed-by: during design session
Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---

During the design session, the proposal was to compare .config before
and after syncconfig. But maybe KCONFIG_NOSILENTUPDATE is enough?

---
 xen/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/Makefile b/xen/Makefile
index 49da79e10f..efeaaa557c 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -379,7 +379,7 @@ $(KCONFIG_CONFIG): tools_fixdep
 # The syncconfig should be executed only once to make all the targets.
 include/config/%.conf include/config/%.conf.cmd: $(KCONFIG_CONFIG)
 	$(Q)rm -f include/config/auto.conf
-	$(Q)$(MAKE) $(build)=tools/kconfig syncconfig
+	$(Q)$(MAKE) $(build)=tools/kconfig syncconfig KCONFIG_NOSILENTUPDATE=1
 
 ifeq ($(CONFIG_DEBUG),y)
 CFLAGS += -O1
-- 
Anthony PERARD


