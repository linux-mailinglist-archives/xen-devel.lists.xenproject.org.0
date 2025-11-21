Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E452BC7948A
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 14:24:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1169201.1494999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMR6y-0006IG-FU; Fri, 21 Nov 2025 13:23:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1169201.1494999; Fri, 21 Nov 2025 13:23:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMR6y-0006GJ-Ct; Fri, 21 Nov 2025 13:23:40 +0000
Received: by outflank-mailman (input) for mailman id 1169201;
 Fri, 21 Nov 2025 13:23:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wmUi=55=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vMR6x-0006GA-2O
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 13:23:39 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48ed43b5-c6dd-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 14:23:36 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 235F920FEE;
 Fri, 21 Nov 2025 13:23:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF7633EA61;
 Fri, 21 Nov 2025 13:23:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iqI8LdZnIGkQVQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 21 Nov 2025 13:23:34 +0000
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
X-Inumbo-ID: 48ed43b5-c6dd-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1763731415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wHB0LPd3iol0b1RLK1wvGDRVvXXBhGff1PoGk2nUrqU=;
	b=AiFCygmQ7k9CSH11wOA1oxNwacn7LCEH0Db3iqJpcCJ1v2OS3bmGYaT3dsN8mzxaCuBd0U
	zSR0VNRbz5eAzvmGAG83UndHSpZb3UMABjiI+IqXb5j9DKC/mQ36WZXCjFlkZzia1uKHJj
	KkUU7FUBEzpXVsDlVwlef3TFAWk8uQs=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=AiFCygmQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1763731415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wHB0LPd3iol0b1RLK1wvGDRVvXXBhGff1PoGk2nUrqU=;
	b=AiFCygmQ7k9CSH11wOA1oxNwacn7LCEH0Db3iqJpcCJ1v2OS3bmGYaT3dsN8mzxaCuBd0U
	zSR0VNRbz5eAzvmGAG83UndHSpZb3UMABjiI+IqXb5j9DKC/mQ36WZXCjFlkZzia1uKHJj
	KkUU7FUBEzpXVsDlVwlef3TFAWk8uQs=
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
Subject: [PATCH v3 0/4] configure: reduce number of files created
Date: Fri, 21 Nov 2025 14:23:28 +0100
Message-ID: <20251121132332.23514-1-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 235F920FEE
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

Instead of creating lots of files during configure, create those
files (where possible) rather at build time. This reduces the need
to run configure when e.g. changing a man page containing a path
defined by the configure run.

Changes in V2:
- dropped patch 1 as already applied
- no longer rename files to *.src
- don't use pattern rule

Changes in V3:
- addressed comments by Jan and Andrew

Juergen Gross (4):
  build: add make macro for making file from file.in
  docs: replace @xxx@ markers at build time
  config: remove unused paths from config/Paths.mk.in
  tools: replace @xxx@ markers at build time

 .gitignore                     |  1 +
 Config.mk                      | 13 +++++++++++++
 config/Paths.mk.in             |  6 ------
 config/Tools-paths.mk.in       | 10 ++++++++++
 docs/Makefile                  | 11 ++++++++++-
 docs/configure                 |  7 +------
 docs/configure.ac              |  9 +--------
 tools/Rules.mk                 |  4 ++++
 tools/configure                | 21 ++-------------------
 tools/configure.ac             | 19 +------------------
 tools/hotplug/FreeBSD/Makefile | 13 +++++++++++--
 tools/hotplug/Linux/Makefile   | 21 +++++++++++++++++++--
 tools/hotplug/NetBSD/Makefile  | 13 +++++++++++--
 tools/hotplug/common/Makefile  | 10 +++++++++-
 tools/ocaml/libs/xs/Makefile   |  9 +++++++++
 tools/ocaml/xenstored/Makefile | 10 +++++++++-
 16 files changed, 111 insertions(+), 66 deletions(-)
 create mode 100644 config/Tools-paths.mk.in

-- 
2.51.0


