Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CF5681928
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 19:29:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487151.754659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMYtY-0004Cs-PJ; Mon, 30 Jan 2023 18:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487151.754659; Mon, 30 Jan 2023 18:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMYtY-0004Ai-Mj; Mon, 30 Jan 2023 18:28:44 +0000
Received: by outflank-mailman (input) for mailman id 487151;
 Mon, 30 Jan 2023 18:28:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMYtX-0004Aa-5y
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 18:28:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMYtX-0000h3-41; Mon, 30 Jan 2023 18:28:43 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMYtW-0004Ps-S0; Mon, 30 Jan 2023 18:28:43 +0000
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
	Subject:Cc:To:From; bh=QHeyb39BAUbBq7kVi2Vj45hoLod0vCzIr6POB59arQY=; b=qYChNV
	uGSGzG8G0/IL4MYnug029eOK+NZO9TKW3l2K5Q0rWyepqUN1Idraz1S/e0rHlmSTnYaiNMENU9BF2
	5E9ES212yhB2gQx7sOf7WTb0PllYA8/ke3CrMc2VhbyxJzaaX9QCaLoUTJFweOrETOsDor4+KRv7H
	vwJ5AYfL6gg=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH] xen/common: rwlock: Constify the parameter of _rw_is{,_write}_locked()
Date: Mon, 30 Jan 2023 18:28:40 +0000
Message-Id: <20230130182840.86744-1-julien@xen.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The lock is not meant to be modified by _rw_is{,_write}_locked(). So
constify it.

This is helpful to be able to assert if the lock is taken when the
underlying structure is const.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/include/xen/rwlock.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/xen/rwlock.h b/xen/include/xen/rwlock.h
index b8d52a5aa939..e0d2b41c5c7e 100644
--- a/xen/include/xen/rwlock.h
+++ b/xen/include/xen/rwlock.h
@@ -149,7 +149,7 @@ static inline void _read_unlock_irqrestore(rwlock_t *lock, unsigned long flags)
     local_irq_restore(flags);
 }
 
-static inline int _rw_is_locked(rwlock_t *lock)
+static inline int _rw_is_locked(const rwlock_t *lock)
 {
     return atomic_read(&lock->cnts);
 }
@@ -254,7 +254,7 @@ static inline void _write_unlock_irqrestore(rwlock_t *lock, unsigned long flags)
     local_irq_restore(flags);
 }
 
-static inline int _rw_is_write_locked(rwlock_t *lock)
+static inline int _rw_is_write_locked(const rwlock_t *lock)
 {
     return (atomic_read(&lock->cnts) & _QW_WMASK) == _QW_LOCKED;
 }
-- 
2.38.1


