Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1E35B6ABC
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 11:33:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406231.648619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY2Hw-0006AA-QT; Tue, 13 Sep 2022 09:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406231.648619; Tue, 13 Sep 2022 09:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY2Hw-00067B-Lb; Tue, 13 Sep 2022 09:33:04 +0000
Received: by outflank-mailman (input) for mailman id 406231;
 Tue, 13 Sep 2022 09:33:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQ52=ZQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oY2Hu-000675-Mx
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 09:33:02 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1dcf1ed-3346-11ed-9761-273f2230c3a0;
 Tue, 13 Sep 2022 11:30:24 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 83D7434A56;
 Tue, 13 Sep 2022 09:33:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3E3A013AB5;
 Tue, 13 Sep 2022 09:33:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FXfEDUxOIGNzMwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 13 Sep 2022 09:33:00 +0000
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
X-Inumbo-ID: b1dcf1ed-3346-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1663061580; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/5pLYXZNjCGOsvALaYTumY4Dq6WSSAQIzCShFqFyEVM=;
	b=BVrOf7dx/BtsZ92d85fLDOvNFv7oqqdYA+SV8Rw8UtVwplG8/CedJ2yiG4qKc7bwUmCp05
	tRP4WVTK9BFnE4zM/jy59OCBlXP9vdQEWJt4+G5rItlUmwasCSfKjM+q3oeyRR1zXZdlKJ
	M5hLnHx99ab9CoZvjcX+IyPlFABEmiw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/2] xen/gnttab: reduce size of struct active_grant_entry
Date: Tue, 13 Sep 2022 11:32:54 +0200
Message-Id: <20220913093256.22880-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While looking at the grant table code I thought it should be possible
to have a smaller struct active_grant_entry. This approach should only
hit transitive grants with some negative performance effect, "normal"
grants should be not affected.

Juergen Gross (2):
  xen: add knownalive_domain_from_domid() helper
  xen/gnttab: reduce size of struct active_grant_entry

 xen/common/domain.c      | 53 +++++++++++++++++++++++++---------------
 xen/common/grant_table.c | 13 +++++-----
 xen/include/xen/sched.h  |  4 +++
 3 files changed, 44 insertions(+), 26 deletions(-)

-- 
2.35.3


