Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 311326751EB
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 11:00:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481561.746540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIoCK-0001NX-N5; Fri, 20 Jan 2023 10:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481561.746540; Fri, 20 Jan 2023 10:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIoCK-0001Kp-JZ; Fri, 20 Jan 2023 10:00:36 +0000
Received: by outflank-mailman (input) for mailman id 481561;
 Fri, 20 Jan 2023 10:00:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NYwS=5R=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pIoCJ-0001Kj-H3
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 10:00:35 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47fb4d70-98a9-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 11:00:34 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 22F5122A04;
 Fri, 20 Jan 2023 10:00:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D0ACA1390C;
 Fri, 20 Jan 2023 10:00:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NthvMUFmymPvRAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 20 Jan 2023 10:00:33 +0000
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
X-Inumbo-ID: 47fb4d70-98a9-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674208834; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BP2Ghnh4lJv6QN3DkwdB0Xdmy7oy5X0QBXuC3leED8Q=;
	b=f4Rq3o9pbCpc+uXh3oFQ6x+6OdFH4+ok8jJoISu7YorWjME1Whd4mY7dTlBVWsAWbRdfx4
	ER3NXWydAw1G0bRLNaJi2GTJrfdPM/+LBax9p/DoMmZlBjo1EPhKveiVwE5/Nx1wsGTOqg
	8dQrpRn/av6SYjXNk8A1mqaxq1WyOjM=
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
Subject: [PATCH v2 00/13] tools/xenstore: rework internal accounting
Date: Fri, 20 Jan 2023 11:00:15 +0100
Message-Id: <20230120100028.11142-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series reworks the Xenstore internal accounting to use a uniform
generic framework. It is adding some additional useful diagnostic
information, like accounting trace and max. per-domain and global quota
values seen.

Changes in V2:
- added patch 1 (leftover from previous series)
- rebase

Juergen Gross (13):
  tools/xenstore: don't allow creating too many nodes in a transaction
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
 tools/xenstore/xenstored_domain.c      | 435 ++++++++++++++++++-------
 tools/xenstore/xenstored_domain.h      |  55 +++-
 tools/xenstore/xenstored_transaction.c |  22 +-
 tools/xenstore/xenstored_watch.c       |  15 +-
 8 files changed, 506 insertions(+), 278 deletions(-)

-- 
2.35.3


