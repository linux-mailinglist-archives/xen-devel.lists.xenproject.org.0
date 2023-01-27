Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6BE67EDF2
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 20:05:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485886.753326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLU2L-0000Mq-Hs; Fri, 27 Jan 2023 19:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485886.753326; Fri, 27 Jan 2023 19:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLU2L-0000Je-Ei; Fri, 27 Jan 2023 19:05:21 +0000
Received: by outflank-mailman (input) for mailman id 485886;
 Fri, 27 Jan 2023 19:05:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pLU2K-0000JY-0i
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 19:05:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pLU2J-0005vR-HY; Fri, 27 Jan 2023 19:05:19 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pLU2J-0000WN-90; Fri, 27 Jan 2023 19:05:19 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=fTCKKhrIkTqrwRgYKyo0rDxZRUPeduOTNvM+XVhaz38=; b=DgxBbM
	mOUg6ujloGoy/HYwpEdEKwCZjdFnuBPi2KPaSj5d2f6JmrGXLsrnMgmKywdndo129tC7Xi8NbST+E
	T20kRz+dDCpOPQeh1RiytevD3az6D2HdbK9lgcQKEBX1FGcYzCqxXhu8YjG95X7EvgcnLCn1UAoGL
	ZCV0hPM4JAw=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/common: Constify the parameter of _spin_is_locked()
Date: Fri, 27 Jan 2023 19:05:16 +0000
Message-Id: <20230127190516.52994-1-julien@xen.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The lock is not meant to be modified by _spin_is_locked(). So constify
it.

This is helpful to be able to assert the locked is taken when the
underlying structure is const.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/common/spinlock.c      | 2 +-
 xen/include/xen/spinlock.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 84996c3fbc1f..a15f0a2eb667 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -368,7 +368,7 @@ void _spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
     local_irq_restore(flags);
 }
 
-int _spin_is_locked(spinlock_t *lock)
+int _spin_is_locked(const spinlock_t *lock)
 {
     /*
      * Recursive locks may be locked by another CPU, yet we return
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 2fa6ba36548e..ca40c71c88f9 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -185,7 +185,7 @@ void _spin_unlock(spinlock_t *lock);
 void _spin_unlock_irq(spinlock_t *lock);
 void _spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags);
 
-int _spin_is_locked(spinlock_t *lock);
+int _spin_is_locked(const spinlock_t *lock);
 int _spin_trylock(spinlock_t *lock);
 void _spin_barrier(spinlock_t *lock);
 
-- 
2.38.1


