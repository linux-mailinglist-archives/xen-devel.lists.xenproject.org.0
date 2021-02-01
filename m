Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E080C30AC81
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 17:21:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80008.146093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6bwg-00062n-4a; Mon, 01 Feb 2021 16:20:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80008.146093; Mon, 01 Feb 2021 16:20:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6bwg-00062O-1O; Mon, 01 Feb 2021 16:20:58 +0000
Received: by outflank-mailman (input) for mailman id 80008;
 Mon, 01 Feb 2021 16:20:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6bwe-00062J-Hv
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 16:20:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1e149c4-393a-49e8-8ba6-e8a9b5b1b409;
 Mon, 01 Feb 2021 16:20:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BCA2BAB92;
 Mon,  1 Feb 2021 16:20:54 +0000 (UTC)
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
X-Inumbo-ID: b1e149c4-393a-49e8-8ba6-e8a9b5b1b409
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612196454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GvGyOpHjxePA3adDxLLV4FpwWSt7Uar0rJSh1I4ST+U=;
	b=ie48RAdB4XksWzNkS/bCeIoDEds/o1OgfW28Fd15bq0vn6MfN+NrSyH1XhUn0J4pHDBjto
	QrPswOwnMKsc0YjRzCfUDXWuqE2aHR1Mf6SCa8nxJEYfkGO0Zq7LmBXJuo/eDuWvdkLzyS
	NXc37/rTyTvFkH+pgCJP+RW14Osh5Nk=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] memory: fix build with COVERAGE but !HVM
Message-ID: <84a05b9e-a0c3-7860-4a59-a591a873b884@suse.com>
Date: Mon, 1 Feb 2021 17:20:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Xen is heavily relying on the DCE stage to remove unused code so the
linker doesn't throw an error because a function is not implemented
yet we defined a prototype for it.

On some GCC versions (such as 9.4 provided by Debian sid), the compiler
DCE stage will not manage to figure that out for
xenmem_add_to_physmap_batch():

ld: ld: prelink.o: in function `xenmem_add_to_physmap_batch':
/xen/xen/common/memory.c:942: undefined reference to `xenmem_add_to_physmap_one'
/xen/xen/common/memory.c:942:(.text+0x22145): relocation truncated
to fit: R_X86_64_PLT32 against undefined symbol `xenmem_add_to_physmap_one'
prelink-efi.o: in function `xenmem_add_to_physmap_batch':
/xen/xen/common/memory.c:942: undefined reference to `xenmem_add_to_physmap_one'
make[2]: *** [Makefile:215: /root/xen/xen/xen.efi] Error 1
make[2]: *** Waiting for unfinished jobs....
ld: /xen/xen/.xen-syms.0: hidden symbol `xenmem_add_to_physmap_one' isn't defined
ld: final link failed: bad value

It is not entirely clear why the compiler DCE is not detecting the
unused code. However, cloning the check introduced by the commit below
into xenmem_add_to_physmap_batch() does the trick.

No functional change intended.

Fixes: d4f699a0df6c ("x86/mm: p2m_add_foreign() is HVM-only")
Reported-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
---
Julien, since I reused most of your patch'es description, I've kept your
S-o-b. Please let me know if you want me to drop it.

--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -904,6 +904,19 @@ static int xenmem_add_to_physmap_batch(s
 {
     union add_to_physmap_extra extra = {};
 
+    /*
+     * While, unlike xenmem_add_to_physmap(), this function is static, there
+     * still have been cases observed where xatp_permission_check(), invoked
+     * by our caller, doesn't lead to elimination of this entire function when
+     * the compile time evaluation of paging_mode_translate(d) is false. Guard
+     * against this be replicating the same check here.
+     */
+    if ( !paging_mode_translate(d) )
+    {
+        ASSERT_UNREACHABLE();
+        return -EACCES;
+    }
+
     if ( unlikely(xatpb->size < extent) )
         return -EILSEQ;
 

