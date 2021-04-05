Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DCF3543DE
	for <lists+xen-devel@lfdr.de>; Mon,  5 Apr 2021 17:57:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105401.201826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRbY-0002TE-6D; Mon, 05 Apr 2021 15:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105401.201826; Mon, 05 Apr 2021 15:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRbX-0002Rn-T7; Mon, 05 Apr 2021 15:57:31 +0000
Received: by outflank-mailman (input) for mailman id 105401;
 Mon, 05 Apr 2021 15:57:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTRbU-0002LQ-RY
 for xen-devel@lists.xenproject.org; Mon, 05 Apr 2021 15:57:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRbU-0002oS-3D; Mon, 05 Apr 2021 15:57:28 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRbT-00053b-RA; Mon, 05 Apr 2021 15:57:28 +0000
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
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=lyhRqrnLbAOU2YP7TBUMqJqT/uwbvMLMSBzL3B6aYDM=; b=3Gr5r9LZKz7autrB/fEbv7nk4
	Ly3bxyt5lzdn97NLfjISrWngoQbegaXsde6Lwr3CrIngHV7M9hPpwSlT3WDkIRs7LsBNZ5GJCJlKG
	/dNxd9cj8TTaG/oNE7j4QlTNDneyiXVGPBsqpVmSar+7k68jy6uvQS9gzHYz79qx6eaRg=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH 08/14] tools/firmware: hvmloader: Use const in __bug() and __assert_failed()
Date: Mon,  5 Apr 2021 16:57:07 +0100
Message-Id: <20210405155713.29754-9-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210405155713.29754-1-julien@xen.org>
References: <20210405155713.29754-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

__bug() and __assert_failed() are not meant to modify the string
parameters. So mark them as const.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/firmware/hvmloader/util.c | 4 ++--
 tools/firmware/hvmloader/util.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index 7da144b0bb15..581b35e5cfb5 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -722,14 +722,14 @@ static void __attribute__((noreturn)) crash(void)
         asm volatile ( "hlt" );
 }
 
-void __assert_failed(char *assertion, char *file, int line)
+void __assert_failed(const char *assertion, const char *file, int line)
 {
     printf("*** HVMLoader assertion '%s' failed at %s:%d\n",
            assertion, file, line);
     crash();
 }
 
-void __bug(char *file, int line)
+void __bug(const char *file, int line)
 {
     printf("*** HVMLoader bug at %s:%d\n", file, line);
     crash();
diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
index 4f0baade0e6c..8d95eab28a65 100644
--- a/tools/firmware/hvmloader/util.h
+++ b/tools/firmware/hvmloader/util.h
@@ -34,11 +34,11 @@ enum {
 #undef NULL
 #define NULL ((void*)0)
 
-void __assert_failed(char *assertion, char *file, int line)
+void __assert_failed(const char *assertion, const char *file, int line)
     __attribute__((noreturn));
 #define ASSERT(p) \
     do { if (!(p)) __assert_failed(#p, __FILE__, __LINE__); } while (0)
-void __bug(char *file, int line) __attribute__((noreturn));
+void __bug(const char *file, int line) __attribute__((noreturn));
 #define BUG() __bug(__FILE__, __LINE__)
 #define BUG_ON(p) do { if (p) BUG(); } while (0)
 #define BUILD_BUG_ON(p) ((void)sizeof(char[1 - 2 * !!(p)]))
-- 
2.17.1


