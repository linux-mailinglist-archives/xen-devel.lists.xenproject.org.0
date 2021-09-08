Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D379403A25
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 14:53:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181922.329273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNx4A-0000Ow-GA; Wed, 08 Sep 2021 12:52:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181922.329273; Wed, 08 Sep 2021 12:52:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNx4A-0000MN-D6; Wed, 08 Sep 2021 12:52:38 +0000
Received: by outflank-mailman (input) for mailman id 181922;
 Wed, 08 Sep 2021 12:52:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RTps=N6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mNx48-0000MH-Hr
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 12:52:36 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0680f4d-5440-4476-8297-788d5e60eb95;
 Wed, 08 Sep 2021 12:52:35 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D9ED120141;
 Wed,  8 Sep 2021 12:52:34 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 83A8D13A8B;
 Wed,  8 Sep 2021 12:52:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 6TCYHhKyOGGZHAAAGKfGzw
 (envelope-from <jgross@suse.com>); Wed, 08 Sep 2021 12:52:34 +0000
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
X-Inumbo-ID: f0680f4d-5440-4476-8297-788d5e60eb95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631105554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=M6GQ+molqFLn27l3OHP4cZYUO31klpYjR5c6dJdii4s=;
	b=R8j1yemUKEISpGYp/d7VcLx4SM/987wt5penAju4SVQ9v5byrbupbWSfemGKGRoCgX/Rp/
	+YvfBgz/6oRCX0To38wSv+xFad0yRrDus9wI+5qJvBGXeivS0mkwqvKyOjMaEZ/kgSVeUb
	F0zTVwqDhzer1IR2VSuo58SCW2PTcyQ=
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
Subject: [PATCH v2] Config: use Mini-OS commit 9f09744aa3e5982 for xen-unstable
Date: Wed,  8 Sep 2021 14:52:32 +0200
Message-Id: <20210908125232.20993-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch the used Mini-OS commit to 9f09744aa3e5982 in xen-unstable.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- use a specific commit instead of master (Ian Jackson, Jan Beulich)
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index 4d723eec1d..e85bf18654 100644
--- a/Config.mk
+++ b/Config.mk
@@ -246,7 +246,7 @@ MINIOS_UPSTREAM_URL ?= git://xenbits.xen.org/mini-os.git
 endif
 OVMF_UPSTREAM_REVISION ?= b37cfdd2807181aed2fee1e17bd7ec1190db266a
 QEMU_UPSTREAM_REVISION ?= master
-MINIOS_UPSTREAM_REVISION ?= 051b87bb9c19609976fb038f386920e1ce5454c5
+MINIOS_UPSTREAM_REVISION ?= 9f09744aa3e5982a083ecf8e9cd2123f477081f9
 
 SEABIOS_UPSTREAM_REVISION ?= rel-1.14.0
 
-- 
2.26.2


