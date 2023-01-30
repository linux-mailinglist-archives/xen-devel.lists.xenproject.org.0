Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0759680A72
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 11:08:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486773.754220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMR5L-00082N-Gp; Mon, 30 Jan 2023 10:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486773.754220; Mon, 30 Jan 2023 10:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMR5L-0007zp-DX; Mon, 30 Jan 2023 10:08:23 +0000
Received: by outflank-mailman (input) for mailman id 486773;
 Mon, 30 Jan 2023 10:08:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZQwi=53=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pMR5K-0007zj-5o
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 10:08:22 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 058c1f97-a086-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 11:08:19 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 75DF52198D;
 Mon, 30 Jan 2023 10:08:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E93513444;
 Mon, 30 Jan 2023 10:08:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mTYCChOX12PBfgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 30 Jan 2023 10:08:19 +0000
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
X-Inumbo-ID: 058c1f97-a086-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675073299; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UvoK/zP3JM8dIh4F9eh+Issdx8xHzdJYq7B8CjxYg64=;
	b=fIo6wkWhVBRcOZIk5qiJwE6eSb6/sMlO02xAgL3o0FYCOMprY2In/G17omYZ6IOgwrqt0h
	FL9T7T2MX+eLWk4BjYx9wrZnI9/b5+Vqq+s0uHU/de1KD4H4HliviGTMcBb6FjdJIROPSE
	xIJVqNqiIrDSf8u849rPYlTYfN/NIXw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 0/3] xen/public move and fix 9pfs documentation
Date: Mon, 30 Jan 2023 11:08:10 +0100
Message-Id: <20230130100813.3298-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in V4:
- patch split into 3 patches

Juergen Gross (3):
  xen/public: move xenstore related doc into 9pfs.h
  xen/public: fix 9pfs Xenstore entry documentation
  xen/public: fix 9pfs documentation of connection sequence

 docs/misc/9pfs.pandoc        | 153 +-----------------------------
 xen/include/public/io/9pfs.h | 178 ++++++++++++++++++++++++++++++++++-
 2 files changed, 181 insertions(+), 150 deletions(-)

-- 
2.35.3


