Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEBA56FF99
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 12:59:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365045.595083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAr7l-0007eB-UK; Mon, 11 Jul 2022 10:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365045.595083; Mon, 11 Jul 2022 10:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAr7l-0007cO-Rc; Mon, 11 Jul 2022 10:58:45 +0000
Received: by outflank-mailman (input) for mailman id 365045;
 Mon, 11 Jul 2022 10:58:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=twA/=XQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oAr7j-0007cI-Vv
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 10:58:43 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d90824e-0108-11ed-924f-1f966e50362f;
 Mon, 11 Jul 2022 12:58:42 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6A6C61FED0;
 Mon, 11 Jul 2022 10:58:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1C7B913322;
 Mon, 11 Jul 2022 10:58:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id z4+FBWICzGJfZgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 11 Jul 2022 10:58:42 +0000
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
X-Inumbo-ID: 6d90824e-0108-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1657537122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Jds5BRsfjOadmDwPclKxAiyMARYTIfOKkjIJkyT3rWg=;
	b=A1slG4u2uwkhEyuZIrCcUuJLLawHiSAlwVo51usOk1ObNmgA6CPif2GJ1kE/D5MTh4Cwdb
	k7aKJxLD1Y6NMGiaSy70yISPXAPcnNeKy+xfJQlGakSmUtDBzX8ENpLWconq7T/H6VrtTv
	IMOVl9QHCS/PzbzDrzEzZBIODfBeuP4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: [PATCH] xen/build: remove unneeded enumeration in clean-files
Date: Mon, 11 Jul 2022 12:58:40 +0200
Message-Id: <20220711105840.10533-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enumerating a file from $(targets) in $(clean-files) isn't needed.

Remove xen/include/xen/hypercall-defs.h from $(clean-files).

Reported-by: Jan Beulich <jbeulich@suse.com>
Fixes: eca1f00d0227 ("xen: generate hypercall interface related code")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/include/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index 39d9f5556c..fa0d454ab7 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -225,4 +225,4 @@ all: lib-x86-all
 endif
 
 clean-files := compat config generated headers*.chk xen/lib/x86/cpuid-autogen.h
-clean-files += xen/hypercall-defs.h hypercall-defs.i
+clean-files += hypercall-defs.i
-- 
2.35.3


