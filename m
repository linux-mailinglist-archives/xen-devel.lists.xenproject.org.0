Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24470493577
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 08:28:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258725.445914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA5OY-0003ab-5H; Wed, 19 Jan 2022 07:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258725.445914; Wed, 19 Jan 2022 07:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA5OY-0003YS-1a; Wed, 19 Jan 2022 07:28:38 +0000
Received: by outflank-mailman (input) for mailman id 258725;
 Wed, 19 Jan 2022 07:28:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7l/E=SD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nA5OW-0003Y6-5M
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 07:28:36 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68db0e19-78f9-11ec-9bbc-9dff3e4ee8c5;
 Wed, 19 Jan 2022 08:28:35 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 365D02170E;
 Wed, 19 Jan 2022 07:28:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EA62213B6D;
 Wed, 19 Jan 2022 07:28:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QKglOKG952EyZQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 19 Jan 2022 07:28:33 +0000
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
X-Inumbo-ID: 68db0e19-78f9-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642577314; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KYSZ4YoetIiNwYERXNj7SwMwS/sdGLv5NUxQ/ovPRA8=;
	b=GvDWzdFZ8sDfCnuZWedXJS0PWIjZ7l4Z+uwcLhm0U2x2yEuqB1nYbOtZ/uCW3f+R5nfPBD
	yu9MTRMm0KOWd6gRCie/WlEVONXNpBjqL4huk3cdYz8j9wVtJWu3o+FVI7U+PTlNk3uayx
	qcBXLj4bW1/LmTAKGKAwj7qoOgIFgPk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/3] config: use more recent mini-os commit
Date: Wed, 19 Jan 2022 08:28:21 +0100
Message-Id: <20220119072823.21025-2-jgross@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220119072823.21025-1-jgross@suse.com>
References: <20220119072823.21025-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to be able to use the recent Mini-OS features switch to the
most recent commit.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index 5c8c737fe4..168273e157 100644
--- a/Config.mk
+++ b/Config.mk
@@ -231,7 +231,7 @@ MINIOS_UPSTREAM_URL ?= git://xenbits.xen.org/mini-os.git
 endif
 OVMF_UPSTREAM_REVISION ?= 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5
 QEMU_UPSTREAM_REVISION ?= master
-MINIOS_UPSTREAM_REVISION ?= a91161eb0f92dac4ad6d41f91117268bc23ef28d
+MINIOS_UPSTREAM_REVISION ?= 83ff43bff4bdd6879539fcb2b3d6ba5e61a64135
 
 SEABIOS_UPSTREAM_REVISION ?= rel-1.14.0
 
-- 
2.31.1


