Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A151C6CFDF5
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 10:17:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516449.800535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phnSl-0001bO-PI; Thu, 30 Mar 2023 08:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516449.800535; Thu, 30 Mar 2023 08:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phnSl-0001Zg-MU; Thu, 30 Mar 2023 08:16:51 +0000
Received: by outflank-mailman (input) for mailman id 516449;
 Thu, 30 Mar 2023 08:16:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QMey=7W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1phnSk-0001Za-5r
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 08:16:50 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3705b974-ced3-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 10:16:47 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2560821B24;
 Thu, 30 Mar 2023 08:16:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D62AA138FF;
 Thu, 30 Mar 2023 08:16:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bVfzMm5FJWTAEQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 30 Mar 2023 08:16:46 +0000
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
X-Inumbo-ID: 3705b974-ced3-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680164207; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rVyVnzqYt7PdzanhPmujtPSG8g+/e2+OmShWS8r3hDM=;
	b=A0AMxcUuunqFj066hyAbv5FTB0SNNSb5dq3EuN04Wpsjn2AnNDLj02tMUfRurPlYMWMJDl
	tKEU30L3Ym1gt3J2EzyFL2f5eUCKxcIz7CjjTJwgvyQrWny0FH2YiPVzargCEZUvGwCl1d
	ci9pOw8JlmEF0rn2geuWrqWmGvIfBVc=
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
Subject: [PATCH v3 00/13] tools/xenstore: rework internal accounting
Date: Thu, 30 Mar 2023 10:16:31 +0200
Message-Id: <20230330081644.11480-1-jgross@suse.com>
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

Changes in V3:
- addressed comments

Juergen Gross (13):
  tools/xenstore: take transaction internal nodes into account for quota
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
 tools/xenstore/xenstored_core.c        | 168 +++++-----
 tools/xenstore/xenstored_core.h        |  24 +-
 tools/xenstore/xenstored_domain.c      | 433 ++++++++++++++++++-------
 tools/xenstore/xenstored_domain.h      |  60 +++-
 tools/xenstore/xenstored_transaction.c |  22 +-
 tools/xenstore/xenstored_watch.c       |  15 +-
 8 files changed, 514 insertions(+), 278 deletions(-)

-- 
2.35.3


