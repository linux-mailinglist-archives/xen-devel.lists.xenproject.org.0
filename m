Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E7475DB01
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jul 2023 10:17:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567878.887344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qN7nJ-0000fD-2c; Sat, 22 Jul 2023 08:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567878.887344; Sat, 22 Jul 2023 08:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qN7nI-0000db-Vs; Sat, 22 Jul 2023 08:16:52 +0000
Received: by outflank-mailman (input) for mailman id 567878;
 Sat, 22 Jul 2023 08:16:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9aU5=DI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qN7nH-0000dR-R2
 for xen-devel@lists.xenproject.org; Sat, 22 Jul 2023 08:16:51 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b484896-2868-11ee-8611-37d641c3527e;
 Sat, 22 Jul 2023 10:16:49 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 25ECB1FD99;
 Sat, 22 Jul 2023 08:16:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E98FE1346D;
 Sat, 22 Jul 2023 08:16:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Ey+NN3CQu2SyQQAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 22 Jul 2023 08:16:48 +0000
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
X-Inumbo-ID: 1b484896-2868-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690013809; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fQhOOswQDEVcBnxSyeWGk8qIextgjVPNvxIC0FSoJyg=;
	b=gNQykMOWl9UDkBepexCUvMEH9bpM1fSCuBZKQfjjREIZeZdf9U9qL9ODKqIwavko8tL2h7
	OMP8jsQKsLhfx3DBqkNgT/HNyPWsPGpqJRxFfP9SpL/Ayo+sxP5fNhGWPfq09d2CHQhGQU
	CWS+kxvNJcIJ4ZSeU8IxpAUwU2mueZs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 0/2] tools/xenstore: fix get_spec_node()
Date: Sat, 22 Jul 2023 10:16:44 +0200
Message-Id: <20230722081646.4136-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Small series to fix a bug in get_spec_node().

Patch 1 is turning several function parameters into const in order to
avoid having to cast away the const attribute in get_spec_node().

Patch 2 is the fix, which is a backport candidate.

Alternatives to this series would be:

- merge the patches into one patch and backport that
- swap the sequence of the patches in order to have less code churn
  when backporting, but re-adding the cast from const to non-cont,
  while backporting only the fix
- leave the series as is and backport both patches
- leave the series as is and use V1 of patch 2 for the backport

Juergen Gross (2):
  tools/xenstore: add const to the return type of  canonicalize()
  tools/xenstore: fix get_spec_node()

 tools/xenstore/xenstored_core.c  | 27 ++++++++++++++++-----------
 tools/xenstore/xenstored_core.h  |  3 ++-
 tools/xenstore/xenstored_watch.c | 16 ++++++++++------
 3 files changed, 28 insertions(+), 18 deletions(-)

-- 
2.35.3


