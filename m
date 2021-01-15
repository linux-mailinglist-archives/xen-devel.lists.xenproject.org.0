Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C412F856F
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 20:30:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68577.122749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0UnO-0004nC-6C; Fri, 15 Jan 2021 19:30:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68577.122749; Fri, 15 Jan 2021 19:30:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0UnO-0004lA-2p; Fri, 15 Jan 2021 19:30:06 +0000
Received: by outflank-mailman (input) for mailman id 68577;
 Fri, 15 Jan 2021 19:30:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l0UnM-0004cK-Tw
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 19:30:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0UnM-0002re-Dz; Fri, 15 Jan 2021 19:30:04 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0UnM-0007hU-1b; Fri, 15 Jan 2021 19:30:04 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=iIEwED8NVg3+0QRXW1D5BpGCsMVZAFmTGQJ6WbMy8W8=; b=5sqojSb7VK/XPlgZAmUih0v5yU
	+J5P2JzyBIy8JDG/vetGptU1+pKeW1Sg14/NhUoVgZH3sWkF9D9IqyR8siOGn58uZi2a7MiU0YFF5
	spBj9PpjUkjqGI1NkLakzr5ufTbxTgp6wtQ7R+/c7nrWMGOj80Zh6yoESWW8K1rUD6Ns=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	Julien Grall <jgrall@amazon.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: livepatch: Include xen/mm.h rather than asm/mm.h
Date: Fri, 15 Jan 2021 19:29:47 +0000
Message-Id: <20210115192947.6499-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Livepatch fails to build on Arm after commit ced9795c6cb4 "mm: split
out mfn_t / gfn_t / pfn_t definitions and helpers":

In file included from livepatch.c:13:0:
/oss/xen/xen/include/asm/mm.h:32:28: error: field ‘list’ has incomplete type
     struct page_list_entry list;
                            ^~~~
/oss/xen/xen/include/asm/mm.h:53:43: error: ‘MAX_ORDER’ undeclared here (not in a function); did you mean ‘PFN_ORDER’?
                 unsigned long first_dirty:MAX_ORDER + 1;
                                           ^~~~~~~~~
                                           PFN_ORDER
/oss/xen/xen/include/asm/mm.h:53:31: error: bit-field ‘first_dirty’ width not an integer constant
                 unsigned long first_dirty:MAX_ORDER + 1;
                               ^~~~~~~~~~~

This is happening because asm/mm.h is included directly by livepatch.c.
Yet it depends on xen/mm.h to be included first so MAX_ORDER is defined.

Resolve the build failure by including xen/mm.h rather than asm/mm.h.

Fixes: ced9795c6cb4 ("mm: split out mfn_t / gfn_t / pfn_t definitions and helpers")
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/livepatch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/livepatch.c b/xen/arch/arm/livepatch.c
index 915e9d926a11..75e8adcfd6a1 100644
--- a/xen/arch/arm/livepatch.c
+++ b/xen/arch/arm/livepatch.c
@@ -6,11 +6,11 @@
 #include <xen/lib.h>
 #include <xen/livepatch_elf.h>
 #include <xen/livepatch.h>
+#include <xen/mm.h>
 #include <xen/vmap.h>
 
 #include <asm/cpufeature.h>
 #include <asm/livepatch.h>
-#include <asm/mm.h>
 
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef virt_to_mfn
-- 
2.17.1


