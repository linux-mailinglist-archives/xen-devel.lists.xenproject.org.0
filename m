Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A44576FAED8
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 13:48:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531395.827008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvzLV-00042f-JA; Mon, 08 May 2023 11:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531395.827008; Mon, 08 May 2023 11:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvzLV-00040M-GL; Mon, 08 May 2023 11:48:01 +0000
Received: by outflank-mailman (input) for mailman id 531395;
 Mon, 08 May 2023 11:48:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SOTd=A5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pvzLU-00040G-JD
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 11:48:00 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cae1b69-ed96-11ed-8611-37d641c3527e;
 Mon, 08 May 2023 13:47:57 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 85DCD1FE44;
 Mon,  8 May 2023 11:47:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 44BD51346B;
 Mon,  8 May 2023 11:47:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id j+RjD2zhWGTiNgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 08 May 2023 11:47:56 +0000
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
X-Inumbo-ID: 2cae1b69-ed96-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683546476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sHByFjc6g+J1m3gjwq+ynzSH/6Ec1w8cHibOV3GDZ7A=;
	b=m97MgFUcOtTsPRfofXMMa2qlEy+GUybkjWqkCG890oJyLhdegdYK5NAWAEXhLtnAROsnks
	8Yp/3Bm8jGSgiLAlkOHBJWFgr25Rm3F359+baZmzDS4eQjsBVKMoVJG1Gf4zcIVrFOU8D5
	3KnV3NcOsKwxalk53/rmFLIotEADQ7I=
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
Subject: [PATCH v5 00/14] tools/xenstore: rework internal accounting
Date: Mon,  8 May 2023 13:47:40 +0200
Message-Id: <20230508114754.31514-1-jgross@suse.com>
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

Changes in V4:
- fixed patch 3

Changes in V5:
- addressed comments

Juergen Gross (14):
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
  tools/xenstore: switch get_optval_int() to get_optval_uint()
  tools/xenstore: switch quota management to be table based

 docs/misc/xenstore.txt                 |   5 +-
 tools/xenstore/xenstored_control.c     |  65 ++--
 tools/xenstore/xenstored_core.c        | 176 +++++-----
 tools/xenstore/xenstored_core.h        |  24 +-
 tools/xenstore/xenstored_domain.c      | 432 ++++++++++++++++++-------
 tools/xenstore/xenstored_domain.h      |  59 +++-
 tools/xenstore/xenstored_transaction.c |  24 +-
 tools/xenstore/xenstored_watch.c       |  15 +-
 8 files changed, 521 insertions(+), 279 deletions(-)

-- 
2.35.3


