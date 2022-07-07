Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CD5569EAE
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 11:40:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362877.593139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9Nye-0002kg-N2; Thu, 07 Jul 2022 09:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362877.593139; Thu, 07 Jul 2022 09:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9Nye-0002ia-J1; Thu, 07 Jul 2022 09:39:16 +0000
Received: by outflank-mailman (input) for mailman id 362877;
 Thu, 07 Jul 2022 09:39:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tn4w=XM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o9Nyc-0002iU-RW
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 09:39:14 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a94cc52a-fdd8-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 11:39:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D42A81FDCE;
 Thu,  7 Jul 2022 09:39:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8B52413A33;
 Thu,  7 Jul 2022 09:39:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vNrDIMGpxmKbGwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 07 Jul 2022 09:39:13 +0000
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
X-Inumbo-ID: a94cc52a-fdd8-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1657186753; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8x8nnPqZhI2NQboezzcWTnGNqtcfgmJkkNECedEEebk=;
	b=jkczioW1jes3NWRNRo4QpczESuCY9sfPC9TW1dxjRrcd4ksg2m4OQuSzMAZ5PQq6ZL6Kgs
	YqCPvERM67Cwp2D9O0f5Of2X7c+Bo/7ex101l9jNmFtGPZdn0LT30lO5ehjKfJRJUXtsvl
	+dfzPjmoWEA/OYn3behMRt5Y71O+MIk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] Config.mk: use newest Mini-OS commit
Date: Thu,  7 Jul 2022 11:39:11 +0200
Message-Id: <20220707093911.22182-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to use the newest Mini-OS commit in order to get the recent
fixes.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index a806ef0afb..e56844d964 100644
--- a/Config.mk
+++ b/Config.mk
@@ -230,7 +230,7 @@ MINIOS_UPSTREAM_URL ?= git://xenbits.xen.org/mini-os.git
 endif
 OVMF_UPSTREAM_REVISION ?= 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5
 QEMU_UPSTREAM_REVISION ?= master
-MINIOS_UPSTREAM_REVISION ?= 83ff43bff4bdd6879539fcb2b3d6ba5e61a64135
+MINIOS_UPSTREAM_REVISION ?= 5bcb28aaeba1c2506a82fab0cdad0201cd9b54b3
 
 SEABIOS_UPSTREAM_REVISION ?= rel-1.16.0
 
-- 
2.35.3


