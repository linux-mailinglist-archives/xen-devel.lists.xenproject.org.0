Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE109B05C51
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 15:30:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044112.1414213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfjA-0000tb-NC; Tue, 15 Jul 2025 13:29:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044112.1414213; Tue, 15 Jul 2025 13:29:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfjA-0000rU-K7; Tue, 15 Jul 2025 13:29:48 +0000
Received: by outflank-mailman (input) for mailman id 1044112;
 Tue, 15 Jul 2025 13:29:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7giJ=Z4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ubfj9-0000p6-Sf
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 13:29:47 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c45c4a65-617f-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 15:29:43 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 970811F397;
 Tue, 15 Jul 2025 13:29:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E06A13A68;
 Tue, 15 Jul 2025 13:29:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id xMx0GcZXdmgBNwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 15 Jul 2025 13:29:42 +0000
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
X-Inumbo-ID: c45c4a65-617f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752586182; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gn+jXUBeZECVlWYUrwJRrUi+VHDxst5pXixlmjQuGVU=;
	b=Ex4pOT9ZYPry8lpr3QegzkfJsyLlJ4LMOBIZSua5faU0qsf7IQPcL7JNIAS+g5+7sLRl6c
	4HMnKTM6BNDjRE7QXCIjYadITqmCRpaGjhDDDobgp3qB4IOFa2Rg9nNPYmeyiyaCy/W5kE
	mNDCn1O6fRdGBln33R7DTLo6Vt7ZRg4=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Ex4pOT9Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752586182; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gn+jXUBeZECVlWYUrwJRrUi+VHDxst5pXixlmjQuGVU=;
	b=Ex4pOT9ZYPry8lpr3QegzkfJsyLlJ4LMOBIZSua5faU0qsf7IQPcL7JNIAS+g5+7sLRl6c
	4HMnKTM6BNDjRE7QXCIjYadITqmCRpaGjhDDDobgp3qB4IOFa2Rg9nNPYmeyiyaCy/W5kE
	mNDCn1O6fRdGBln33R7DTLo6Vt7ZRg4=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH v2 00/14] Make Xenstore-stubdom live update possible
Date: Tue, 15 Jul 2025 15:29:22 +0200
Message-ID: <20250715132936.2798-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[config.mk:url,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:mid,suse.com:dkim]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 970811F397
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

With this series applied I was able to perform Live Update of Xenstore
running in a PVH stubdom.

The main problem to solve was to keep the 9pfs device used to store and
later retrieve the Xenstore state usable across kexec(). This has been
achieved by using a module containing the shared pages of the device
and the related config data. This module is then passed to the new
kernel via linking it to the struct hvm_start_info.

The rest of the series are some missing bits and pieces to have a sane
state when activating the new kernel, and some minor fixes and
cleanups.

In order to be able to perform a Xenstore live update an associated
patch series for Xen is needed. The Xen series is depending on this
Mini-OS patch series.

Changes in V2:
- patches 1-5 of V1 have been applied already
- addressed the (minor) comments to V1

Juergen Gross (14):
  mm: don't add module pages to free memory
  kexec: fix physical addresses in start info data
  e820: don't count lapic page as initially reserved
  kexec: restructure building the start info data
  e820: use special type for software reserved memory
  mini-os: config: add support for config items with numerical values
  mini-os: kexec: add support for handing over some memory across kexec
  kexec: add support for allocating pages from kexec module memory
  9pfs: store bepath in struct struct dev_9pfs
  9pfs: refactor init_9pfront()
  gnttab: remove gnttab_alloc_and_grant() function
  gnttab: add function to obtain memory address from grantref
  9pfs: add support to keep device opened across kexec
  events: export bind_evtchn()

 9pfront.c             | 267 +++++++++++++++++++++++++++++++-----------
 Config.mk             |   6 +
 arch/x86/kexec.c      | 123 +++++++++++++++++--
 arch/x86/mm.c         |  95 +++++++++++++++
 arch/x86/setup.c      |  28 +++++
 e820.c                |  11 +-
 events.c              |   1 +
 gnttab.c              |  15 +--
 include/9pfront.h     |   9 ++
 include/e820.h        |   2 +
 include/gnttab.h      |   2 +-
 include/kernel.h      |   1 +
 include/kexec.h       | 122 +++++++++++++++++++
 include/mm.h          |   1 +
 include/x86/arch_mm.h |   1 +
 kexec.c               | 118 +++++++++++++++++++
 mm.c                  |  27 ++++-
 17 files changed, 733 insertions(+), 96 deletions(-)

-- 
2.43.0


