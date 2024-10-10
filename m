Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B71998C75
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 17:55:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816340.1230555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syvVK-0001kc-79; Thu, 10 Oct 2024 15:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816340.1230555; Thu, 10 Oct 2024 15:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syvVK-0001iK-4P; Thu, 10 Oct 2024 15:55:06 +0000
Received: by outflank-mailman (input) for mailman id 816340;
 Thu, 10 Oct 2024 15:55:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rEWG=RG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1syvVI-0001iE-D6
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 15:55:04 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02d98e66-8720-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 17:55:03 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 18A6621C1D;
 Thu, 10 Oct 2024 15:55:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BFF6813A6E;
 Thu, 10 Oct 2024 15:55:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id D9dnLdX4B2eaBAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 10 Oct 2024 15:55:01 +0000
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
X-Inumbo-ID: 02d98e66-8720-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728575702; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LAoGS220UydI7yrPGS3MgjWgCBZuy7C9W0mEBprJY6c=;
	b=SGTFq7addeLO/3lFvfcWCjbuN8tiiOpUwDt7V7Gv7++bW+szdLKs6xElMFQ+AuSqci94bW
	077ZQ6j23PQzxQ1nmWxGrTQ8WhuLnsGTtc/ubDW1M3c78F9r1CYkADqDadhLZQSbql3Azq
	KMgP92qg2jH6UxO364WPXwC0xJeWJUQ=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=SGTFq7ad
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728575702; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LAoGS220UydI7yrPGS3MgjWgCBZuy7C9W0mEBprJY6c=;
	b=SGTFq7addeLO/3lFvfcWCjbuN8tiiOpUwDt7V7Gv7++bW+szdLKs6xElMFQ+AuSqci94bW
	077ZQ6j23PQzxQ1nmWxGrTQ8WhuLnsGTtc/ubDW1M3c78F9r1CYkADqDadhLZQSbql3Azq
	KMgP92qg2jH6UxO364WPXwC0xJeWJUQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH 0/3] stubdom: reduce xenstore library dependencies
Date: Thu, 10 Oct 2024 17:54:56 +0200
Message-ID: <20241010155459.22389-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 18A6621C1D
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.98%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Instead of letting the xenstore stubdoms depend on libxenguest and
with that on basically all Xen libraries, only let it depend on the
actually used libraries.

This is in preparation of removing the libxenctrl dependency from
Xenstore and with that the capability to use xenstore-stubdom on
multiple hypervisor versions.

Juergen Gross (3):
  config: update Mini-OS commit
  tools/xenstored: remove unneeded libxenguest reference
  stubdom: use real lib dependencies for xenstore stubdoms

 Config.mk                       | 2 +-
 stubdom/Makefile                | 6 ++++--
 tools/xenstored/Makefile.common | 1 -
 3 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.43.0


