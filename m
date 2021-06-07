Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E8B39DB2E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 13:23:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137866.255355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqDLf-0006Zg-MT; Mon, 07 Jun 2021 11:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137866.255355; Mon, 07 Jun 2021 11:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqDLf-0006XR-JL; Mon, 07 Jun 2021 11:23:15 +0000
Received: by outflank-mailman (input) for mailman id 137866;
 Mon, 07 Jun 2021 11:23:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kcEO=LB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lqDLe-0006XL-1a
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 11:23:14 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4cf39ab3-c2cb-430a-ad5b-69dccfcfb67c;
 Mon, 07 Jun 2021 11:23:13 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 67E5A21A91;
 Mon,  7 Jun 2021 11:23:12 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 2DEBD118DD;
 Mon,  7 Jun 2021 11:23:12 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id +cACCqABvmBlVQAALh3uQQ
 (envelope-from <jgross@suse.com>); Mon, 07 Jun 2021 11:23:12 +0000
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
X-Inumbo-ID: 4cf39ab3-c2cb-430a-ad5b-69dccfcfb67c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623064992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TVsG2bpF3vrLfIDDvhyK+FQrs0rLZxCGvWEeqGGq7Wk=;
	b=lLD6qrGJ3mHXxkjkjeaT6f/LSCjfb1hr9M7BvpaPvWE1p8XUqE7db//wrHeduj1hbxcp7i
	7JFwvvAlya4ykQxGwZgJouOt1SPIKEdklibNrDCJZS+riN80s6uCjTLchKmQypr1wWswwG
	ZbZDRnK/RtRH+E0V+uPUNaVp6pGavi4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623064992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TVsG2bpF3vrLfIDDvhyK+FQrs0rLZxCGvWEeqGGq7Wk=;
	b=lLD6qrGJ3mHXxkjkjeaT6f/LSCjfb1hr9M7BvpaPvWE1p8XUqE7db//wrHeduj1hbxcp7i
	7JFwvvAlya4ykQxGwZgJouOt1SPIKEdklibNrDCJZS+riN80s6uCjTLchKmQypr1wWswwG
	ZbZDRnK/RtRH+E0V+uPUNaVp6pGavi4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] MAINTAINERS: add myself as tools/libs reviewer
Date: Mon,  7 Jun 2021 13:23:10 +0200
Message-Id: <20210607112310.22180-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have touched most of the Xen libraries in the past, and there is a
clear lack of reviewer band width in the tools area.

Add myself as a tools/libs reviewer for that reason.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d46b08a0d2..bd80740cfe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -374,6 +374,13 @@ F:	xen/include/{kexec,kimage}.h
 F:	xen/arch/x86/machine_kexec.c
 F:	xen/arch/x86/x86_64/kexec_reloc.S
 
+LIBS:
+M:	Ian Jackson <iwj@xenproject.org>
+M:	Wei Liu <wl@xen.org>
+R:	Juergen Gross <jgross@suse.com>
+S:	Supported
+F:	tools/libs/
+
 LIBXENLIGHT
 M:	Ian Jackson <iwj@xenproject.org>
 M:	Wei Liu <wl@xen.org>
-- 
2.26.2


