Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3155D357447
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 20:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106899.204370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUCto-0006pA-TF; Wed, 07 Apr 2021 18:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106899.204370; Wed, 07 Apr 2021 18:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUCto-0006ol-PY; Wed, 07 Apr 2021 18:27:32 +0000
Received: by outflank-mailman (input) for mailman id 106899;
 Wed, 07 Apr 2021 18:27:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lUCtm-0006og-SL
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 18:27:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lUCtl-0003AZ-Jv; Wed, 07 Apr 2021 18:27:29 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lUCtl-00082B-7F; Wed, 07 Apr 2021 18:27:29 +0000
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
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=QU9LxEd/xA9jkmgV1v8fY23G82LJl35wNTL+ArBVMu4=; b=50m9b7Du1v+ESNBZzT9Ca/TN61
	21W27JBCWYM0JHo4AUBx/fpyCqEaWHrvFEQiBXS51bCG9quUGHpoNUkUgiWQ8B8AmW4jqPOIaZl8t
	9RAHbTEw7x1OPHT8W3mnHF/Ino5WPa5DNHJT8hGq/aVjSRi5JOLHs4Eoy33GT/Y3fldY=;
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
Subject: [PATCH] xen/gunzip: Fix build with clang after 33bc2a8495f7
Date: Wed,  7 Apr 2021 19:27:26 +0100
Message-Id: <20210407182726.26603-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

The compilation will fail when building Xen with clang and
CONFIG_DEBUG=y:

make[4]: Leaving directory '/oss/xen/xen/common/libelf'
  INIT_O  gunzip.init.o
Error: size of gunzip.o:.text is 0x00000019

This is because the function init_allocator() will not be inlined
and is not part of the init section.

Fix it by marking init_allocator() with INIT.

Fixes: 33bc2a8495f7 ("xen/gunzip: Allow perform_gunzip() to be called multiple times")
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/common/inflate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/inflate.c b/xen/common/inflate.c
index d8c28a3e9593..c593b94d481e 100644
--- a/xen/common/inflate.c
+++ b/xen/common/inflate.c
@@ -238,7 +238,7 @@ STATIC const ush mask_bits[] = {
 static unsigned long INITDATA malloc_ptr;
 static int INITDATA malloc_count;
 
-static void init_allocator(void)
+static void INIT init_allocator(void)
 {
     malloc_ptr = free_mem_ptr;
     malloc_count = 0;
-- 
2.17.1


