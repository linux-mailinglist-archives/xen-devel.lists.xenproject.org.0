Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE111C5CDFD
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 12:33:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162446.1490087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJs2o-0001YC-Uf; Fri, 14 Nov 2025 11:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162446.1490087; Fri, 14 Nov 2025 11:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJs2o-0001WC-RJ; Fri, 14 Nov 2025 11:32:46 +0000
Received: by outflank-mailman (input) for mailman id 1162446;
 Fri, 14 Nov 2025 11:32:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=leFb=5W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vJs2n-0001W6-OE
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 11:32:45 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1e56d68-c14d-11f0-980a-7dc792cee155;
 Fri, 14 Nov 2025 12:32:42 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6520A211D3;
 Fri, 14 Nov 2025 11:32:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0F7823EA61;
 Fri, 14 Nov 2025 11:32:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iulIAlkTF2k5SwAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 14 Nov 2025 11:32:41 +0000
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
X-Inumbo-ID: a1e56d68-c14d-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1763119961; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7/ImX0iR+crwKQx3ii+dJzPGlOJ3GjYJfoEf9hGwDww=;
	b=igQPEGr2epXwgoQuONBNNVTSsxKAyhUBOeMJhVP2RFV+3LHFa1b+bi0WyrEU8p7moJu1uT
	XjZKMGu/rB4q4QisTZm8655WwqRm26TpddFh6Ic30EO6XGDw7Rp1YSIH7NRPXJljxrCPUJ
	R2hwkR3OuPsdA461IJbnxaXU7hBo/Tk=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1763119961; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7/ImX0iR+crwKQx3ii+dJzPGlOJ3GjYJfoEf9hGwDww=;
	b=igQPEGr2epXwgoQuONBNNVTSsxKAyhUBOeMJhVP2RFV+3LHFa1b+bi0WyrEU8p7moJu1uT
	XjZKMGu/rB4q4QisTZm8655WwqRm26TpddFh6Ic30EO6XGDw7Rp1YSIH7NRPXJljxrCPUJ
	R2hwkR3OuPsdA461IJbnxaXU7hBo/Tk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: [PATCH v2 0/4] configure: reduce number of files created
Date: Fri, 14 Nov 2025 12:32:34 +0100
Message-ID: <20251114113238.9279-1-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Instead of creating lots of files during configure, create those
files (where possible) rather at build time. This reduces the need
to run configure when e.g. changing a man page containing a path
defined by the configure run.

Changes in V2:
- dropped patch 1 as already applied
- no longer rename files to *.src
- don't use pattern rule

Juergen Gross (4):
  build: add make macro for making file from file.in
  docs: replace @xxx@ markers at build time
  config: remove unused paths from config/Paths.mk.in
  tools: replace @xxx@ markers at build time

 .gitignore                     |  1 +
 Config.mk                      | 13 +++++++++++++
 config/Paths.mk.in             |  5 -----
 config/Tools-paths.mk.in       | 10 ++++++++++
 docs/Makefile                  |  8 +++++++-
 docs/configure                 |  7 +------
 docs/configure.ac              |  9 +--------
 tools/configure                | 21 ++-------------------
 tools/configure.ac             | 19 +------------------
 tools/hotplug/FreeBSD/Makefile |  7 ++++++-
 tools/hotplug/Linux/Makefile   | 10 +++++++++-
 tools/hotplug/NetBSD/Makefile  |  7 ++++++-
 tools/hotplug/common/Makefile  |  7 ++++++-
 tools/ocaml/libs/xs/Makefile   |  9 +++++++++
 tools/ocaml/xenstored/Makefile |  9 ++++++++-
 15 files changed, 80 insertions(+), 62 deletions(-)
 create mode 100644 config/Tools-paths.mk.in

-- 
2.51.0


