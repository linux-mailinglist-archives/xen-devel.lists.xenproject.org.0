Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7B3614EC5
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 17:05:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435036.688011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optka-0003LK-R8; Tue, 01 Nov 2022 16:04:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435036.688011; Tue, 01 Nov 2022 16:04:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optka-0003J1-OR; Tue, 01 Nov 2022 16:04:28 +0000
Received: by outflank-mailman (input) for mailman id 435036;
 Tue, 01 Nov 2022 16:04:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optkY-0003Iv-R8
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 16:04:26 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db4ea332-59fe-11ed-91b5-6bf2151ebd3b;
 Tue, 01 Nov 2022 17:04:25 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3AB2F22537;
 Tue,  1 Nov 2022 16:04:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E85CA1346F;
 Tue,  1 Nov 2022 16:04:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZcNDN4hDYWMccgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 16:04:24 +0000
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
X-Inumbo-ID: db4ea332-59fe-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667318665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NnWE8Bi9rxvc//cfqCoXtYhB8VvdWu9RGDKrjPB8kEI=;
	b=MlmaLhzDfOlO4tr9jFCJQ/fa0Fn9p7ee6XQu0BZtdkAnUNdpi+LkggIwz9XKx6KGq63V9I
	lpDwP46lWAX0bQLshkyR+OPlGs1sC3nRlsW3o7pnnFHe/BwKBt9PDF5i6hHjxsQ6E/GNpt
	lsXMJ3+2Mk4GiKiYm/sZUKssOMgzS8E=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 00/12] tools/xenstore
Date: Tue,  1 Nov 2022 17:04:10 +0100
Message-Id: <20221101160422.7212-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series reworks the Xenstore internal accounting to use a uniform
generic framework. It is adding some additional useful diagnostic
information, like accounting trace and max. per-domain and global quota
values seen.

This series is based on top of the series "tools/xenstore: do some
cleanup and fixes".

Juergen Gross (12):
  tools/xenstore: manage per-transaction domain accounting data in an
    array
  tools/xenstore: introduce accounting data array for per-domain values
  tools/xenstore: add framework to commit accounting data on success
    only
  tools/xenstore: use accounting buffering for node accounting
  tools/xenstore: add current connection to domain_memory_add()
    parameters
  tools/xenstore: use accounting data array for per-domain values
  tools/xenstore: add accounting trace support
  tools/xenstore: add TDB access trace support
  tools/xenstore: switch transaction accounting to generic accounting
  tools/xenstore: remember global and per domain max accounting values
  tools/xenstore: use generic accounting for remaining quotas
  tools/xenstore: switch quota management to be table based

 docs/misc/xenstore.txt                 |   5 +-
 tools/xenstore/xenstored_control.c     |  65 ++--
 tools/xenstore/xenstored_core.c        | 164 +++++-----
 tools/xenstore/xenstored_core.h        |  23 +-
 tools/xenstore/xenstored_domain.c      | 414 ++++++++++++++++++-------
 tools/xenstore/xenstored_domain.h      |  55 +++-
 tools/xenstore/xenstored_transaction.c |  22 +-
 tools/xenstore/xenstored_watch.c       |  15 +-
 8 files changed, 496 insertions(+), 267 deletions(-)

-- 
2.35.3


