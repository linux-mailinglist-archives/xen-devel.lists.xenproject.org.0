Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB47C3543DB
	for <lists+xen-devel@lfdr.de>; Mon,  5 Apr 2021 17:57:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105397.201773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRbR-0002Dz-Vv; Mon, 05 Apr 2021 15:57:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105397.201773; Mon, 05 Apr 2021 15:57:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRbR-0002Cs-Ne; Mon, 05 Apr 2021 15:57:25 +0000
Received: by outflank-mailman (input) for mailman id 105397;
 Mon, 05 Apr 2021 15:57:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTRbQ-0002BR-Dp
 for xen-devel@lists.xenproject.org; Mon, 05 Apr 2021 15:57:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRbP-0002nu-J8; Mon, 05 Apr 2021 15:57:23 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRbP-00053b-Ac; Mon, 05 Apr 2021 15:57:23 +0000
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
	 bh=lOO8LxgjP7mfnbj4AR6O+AWqc4xBBvOnf0MxiUn+xT8=; b=nzCnexDfy6V5fekkYmcoVJHtI
	x8Fw26jDm+t15L03/PZnBhfbg0aMQoaEkyJzu7NnS9z0XgKqddyUx8/jOSxhsR52zgpVzT3wS5nnG
	Q0TQ/MaTBPAaO7eKnps6yl0ItuhcZXqeY9CDzSPWD1TnNwkO8TDdQUCPnCHTVTfs7e6Ds=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 04/14] xen/char: console: Use const whenever we point to literal strings
Date: Mon,  5 Apr 2021 16:57:03 +0100
Message-Id: <20210405155713.29754-5-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210405155713.29754-1-julien@xen.org>
References: <20210405155713.29754-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

literal strings are not meant to be modified. So we should use const
char * rather than char * when we want to store a pointer to them.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/drivers/char/console.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 23583751709c..72a7cd1c32c1 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -168,7 +168,7 @@ static int parse_guest_loglvl(const char *s);
 static char xenlog_val[LOGLVL_VAL_SZ];
 static char xenlog_guest_val[LOGLVL_VAL_SZ];
 
-static char *lvl2opt[] = { "none", "error", "warning", "info", "all" };
+static const char *lvl2opt[] = { "none", "error", "warning", "info", "all" };
 
 static void xenlog_update_val(int lower, int upper, char *val)
 {
@@ -262,7 +262,7 @@ static int parse_guest_loglvl(const char *s)
     return ret;
 }
 
-static char *loglvl_str(int lvl)
+static const char *loglvl_str(int lvl)
 {
     switch ( lvl )
     {
-- 
2.17.1


