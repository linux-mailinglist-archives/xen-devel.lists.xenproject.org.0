Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A2AACFA4F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 02:08:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007726.1386993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNKdZ-0002tD-SD; Fri, 06 Jun 2025 00:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007726.1386993; Fri, 06 Jun 2025 00:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNKdZ-0002rh-PI; Fri, 06 Jun 2025 00:08:45 +0000
Received: by outflank-mailman (input) for mailman id 1007726;
 Fri, 06 Jun 2025 00:08:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRk0=YV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uNKdY-0002fD-L1
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 00:08:44 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67bdeb19-426a-11f0-a300-13f23c93f187;
 Fri, 06 Jun 2025 02:08:43 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0E13D43D24;
 Fri,  6 Jun 2025 00:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E086CC4CEE7;
 Fri,  6 Jun 2025 00:08:40 +0000 (UTC)
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
X-Inumbo-ID: 67bdeb19-426a-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749168521;
	bh=Y0eNZf6WgSeSHgRZA85F4qsPOOHxtJMS7AUAA/I8TwU=;
	h=Date:From:To:cc:Subject:From;
	b=bZA9lSmeC54sxYeWMGJVdUIc3DPPaR+6pXLgioqJbQLmx1f5Yd9GmW2ziogqQgREa
	 bRAfMiLfrwyHb2ZEtU0drE57WOgULctqFoDIhgM+QuduNVesQPjPue0Z1vmk2D7Y2L
	 kfbWBuyFmpXXDcE7SipEiM1ap41gxgZThfors7AmjqOeTB/oxTxRPjuzNT4ryrvO8V
	 MxIHKPL+4aFsNYABugqW0zg33ghNnggFTGjmNhL1sTwQ4giFCzF+lGxDZENKdum/Ai
	 c/ehTdwYrTC4sJNmauUNCABYVIKv8TgVKsJwEU+0Msgc9geqBRufwOKbMmZc1bqHL0
	 3/Sk1dD9qeZoA==
Date: Thu, 5 Jun 2025 17:08:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, michal.orzel@amd.com, jbeulich@suse.com, 
    julien@xen.org, roger.pau@citrix.com
Subject: [PATCH v2] xen: add header guards to generated asm generic headers
Message-ID: <alpine.DEB.2.22.394.2506051708100.2495561@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

MISRA D4.10 requires to have proper header guards in place in all header
files. Add header guards for generated asm generic headers as well.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- write to $@.new and move the file
- change the header guard name
---
 xen/scripts/Makefile.asm-generic | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/scripts/Makefile.asm-generic b/xen/scripts/Makefile.asm-generic
index b0d356bfa3..1e85a92c32 100644
--- a/xen/scripts/Makefile.asm-generic
+++ b/xen/scripts/Makefile.asm-generic
@@ -32,7 +32,14 @@ old-headers := $(wildcard $(obj)/*.h)
 unwanted    := $(filter-out $(generic-y) $(generated-y),$(old-headers))
 
 quiet_cmd_wrap = WRAP    $@
-      cmd_wrap = echo "\#include <asm-generic/$*.h>" > $@
+      cmd_wrap = \
+	arch=$$(echo $@ | sed -n 's:.*arch/\([^/]*\)/.*:\1:p' | tr a-z A-Z); \
+	upper=$$(echo $*.h | tr a-z A-Z | tr '/.' '__'); \
+	printf "\#ifndef $${arch}_GENERIC_$${upper}\n" > $@.new; \
+	printf "\#define $${arch}_GENERIC_$${upper}\n" >> $@.new; \
+	printf "\#include <asm-generic/$*.h>\n" >> $@.new; \
+	printf "\#endif /* $${arch}_GENERIC_$${upper} */\n" >> $@.new; \
+	mv -f $@.new $@
 
 quiet_cmd_remove = REMOVE  $(unwanted)
       cmd_remove = rm -f $(unwanted)
-- 
2.25.1


