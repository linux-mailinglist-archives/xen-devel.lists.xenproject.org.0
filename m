Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE47AD0920
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 22:34:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008857.1388025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNdlh-0004sz-0Y; Fri, 06 Jun 2025 20:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008857.1388025; Fri, 06 Jun 2025 20:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNdlg-0004rJ-U8; Fri, 06 Jun 2025 20:34:24 +0000
Received: by outflank-mailman (input) for mailman id 1008857;
 Fri, 06 Jun 2025 20:34:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRk0=YV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uNdlf-0004qR-Fq
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 20:34:23 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a04d5cf9-4315-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 22:34:22 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 36CCE4A2E4;
 Fri,  6 Jun 2025 20:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C4D1C4CEEB;
 Fri,  6 Jun 2025 20:34:18 +0000 (UTC)
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
X-Inumbo-ID: a04d5cf9-4315-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749242060;
	bh=DEGB4w7NTqmb4nl/oEsiOGm0rJ+4lnd18izXzzlo6Hk=;
	h=Date:From:To:cc:Subject:From;
	b=uZ5VREu1dKhklCl83ph1vrPXfD7ffzFUQdq6c/E8C2FG+hhBrCbiIOiIJH8dAPwUY
	 yXw+y+sMQ3t15r16n3qhtdVuFNODXgaomxr5mWq8Ybip6M7hlzQRR26Bo3jJXhRyNS
	 F6/38i1uQE5hha7eSktq1ZmY2Afy8G5MLRnmNnEltv8DF+DDB+o3sMT4lWvacn2DPa
	 LRhA7A89DRlUTxCbRf9XK58QgjXcBxYsUvk4sU2pbQq9HjzN4Pav8kUC27UhlKCf5V
	 4C8vbp++zId75SPJKw/OO+TvfZH6LrkfsquxwvDAdT7/Ixxg4Uf9pWCbzNbCHoyMIA
	 zEshGUEssdhJQ==
Date: Fri, 6 Jun 2025 13:34:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, michal.orzel@amd.com, jbeulich@suse.com, 
    julien@xen.org, roger.pau@citrix.com
Subject: [PATCH v3] xen: add header guards to generated asm generic headers
Message-ID: <alpine.DEB.2.22.394.2506061333270.2495561@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

MISRA D4.10 requires to have proper header guards in place in all header
files. Add header guards for generated asm generic headers as well.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3:
- switch from printf to echo
---
 xen/scripts/Makefile.asm-generic | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/scripts/Makefile.asm-generic b/xen/scripts/Makefile.asm-generic
index b0d356bfa3..b082801808 100644
--- a/xen/scripts/Makefile.asm-generic
+++ b/xen/scripts/Makefile.asm-generic
@@ -32,7 +32,14 @@ old-headers := $(wildcard $(obj)/*.h)
 unwanted    := $(filter-out $(generic-y) $(generated-y),$(old-headers))
 
 quiet_cmd_wrap = WRAP    $@
-      cmd_wrap = echo "\#include <asm-generic/$*.h>" > $@
+      cmd_wrap = \
+	arch=$$(echo $@ | sed -n 's:.*arch/\([^/]*\)/.*:\1:p' | tr a-z A-Z); \
+	upper=$$(echo $*.h | tr a-z A-Z | tr '/.' '__'); \
+	echo "\#ifndef $${arch}_GENERIC_$${upper}" > $@.new; \
+	echo "\#define $${arch}_GENERIC_$${upper}" >> $@.new; \
+	echo "\#include <asm-generic/$*.h>" >> $@.new; \
+	echo "\#endif /* $${arch}_GENERIC_$${upper} */" >> $@.new; \
+	mv -f $@.new $@
 
 quiet_cmd_remove = REMOVE  $(unwanted)
       cmd_remove = rm -f $(unwanted)
-- 
2.25.1


