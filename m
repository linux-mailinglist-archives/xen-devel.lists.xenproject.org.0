Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9FF49357A
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 08:29:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258726.445919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA5OY-0003ef-Dk; Wed, 19 Jan 2022 07:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258726.445919; Wed, 19 Jan 2022 07:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA5OY-0003aJ-A9; Wed, 19 Jan 2022 07:28:38 +0000
Received: by outflank-mailman (input) for mailman id 258726;
 Wed, 19 Jan 2022 07:28:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7l/E=SD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nA5OW-0003Y7-Bh
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 07:28:36 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68ccbc8b-78f9-11ec-a115-11989b9578b4;
 Wed, 19 Jan 2022 08:28:35 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EC91C2114D;
 Wed, 19 Jan 2022 07:28:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9F6FD13B28;
 Wed, 19 Jan 2022 07:28:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Wu1XJaG952EyZQAAMHmgww
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
X-Inumbo-ID: 68ccbc8b-78f9-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642577313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=K2I+O6xkUbxJsn0i8xI3kunjK9MPh3RJPHeGA1FDxQ8=;
	b=eHDwj27Q85oY+7ekgsxKKjv74Knp8JUSlWxFII0cP7Sx1cr3m8SL1SmWjzKADY/4BZokMx
	zJ7/DhO7dKiHFJHzVIxBWhzBaBZh4TCChUAWqS8CcRWz4AizNk4lei5bH3sK8xsZ9Vg6py
	v1J30uBZ3tvtplekV75DimzNa5+MuZU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 0/3] tools/libs: final cleanup removing old mini-os callbacks
Date: Wed, 19 Jan 2022 08:28:20 +0100
Message-Id: <20220119072823.21025-1-jgross@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a final patch series removing the library callbacks referenced
directly by Mini-OS.

Changes in V2:
- added patch 1
- rebase

Juergen Gross (3):
  config: use more recent mini-os commit
  tools/libs/evtchn: remove old mini-os callback
  tools/libs/gnttab: remove old mini-os callback

 Config.mk                  |  2 +-
 tools/libs/evtchn/minios.c | 11 -----------
 tools/libs/gnttab/minios.c |  9 ---------
 3 files changed, 1 insertion(+), 21 deletions(-)

-- 
2.31.1


