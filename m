Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 496A7571564
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 11:10:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365579.595785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBBuH-0007nG-E0; Tue, 12 Jul 2022 09:10:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365579.595785; Tue, 12 Jul 2022 09:10:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBBuH-0007k0-A9; Tue, 12 Jul 2022 09:10:13 +0000
Received: by outflank-mailman (input) for mailman id 365579;
 Tue, 12 Jul 2022 09:10:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AePn=XR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oBBuG-0007js-0u
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 09:10:12 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e9c0ab8-01c2-11ed-924f-1f966e50362f;
 Tue, 12 Jul 2022 11:10:11 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D2BD522606;
 Tue, 12 Jul 2022 09:10:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 93BE513A94;
 Tue, 12 Jul 2022 09:10:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TVSFInE6zWIkRwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 12 Jul 2022 09:10:09 +0000
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
X-Inumbo-ID: 6e9c0ab8-01c2-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1657617009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wO3BxdMkCLrjkHXmHzYdPQLBB2Xlr4RLHiKYMmMx3TE=;
	b=tl3u5V2enh1PRdYkfPSQXyEAa4iX7VAKhdTKpsWzvi4BQ5ynVo7cC4W2zNtX89gJft7qNi
	AnN+t3sog4ytg5Y4ffuWYEDs6J4Zv3vH0EXLU7Hn0h3+Wh+1mbP5KSkjGj+cBW8aNOw3nO
	Vf1UEp/c/rxfx5IeGE7aKofOB9keFsU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] xen/build: remove unneeded enumeration in clean-files of xen/include/Makefile
Date: Tue, 12 Jul 2022 11:10:07 +0200
Message-Id: <20220712091007.13595-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enumerating a file from $(targets) in $(clean-files) isn't needed.

Remove hypercall-defs.h and headers*.chk from $(clean-files) in
xen/include/Makefile.

Reported-by: Jan Beulich <jbeulich@suse.com>
Fixes: eca1f00d0227 ("xen: generate hypercall interface related code")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- remove headers*.chk from clean-files, too (Anthony Perard)
---
 xen/include/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index 39d9f5556c..65d61fc7f4 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -224,5 +224,5 @@ lib-x86-all:
 all: lib-x86-all
 endif
 
-clean-files := compat config generated headers*.chk xen/lib/x86/cpuid-autogen.h
-clean-files += xen/hypercall-defs.h hypercall-defs.i
+clean-files := compat config generated xen/lib/x86/cpuid-autogen.h
+clean-files += hypercall-defs.i
-- 
2.35.3


