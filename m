Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB9BAF0D95
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:13:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030376.1404012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsaT-000855-Qi; Wed, 02 Jul 2025 08:13:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030376.1404012; Wed, 02 Jul 2025 08:13:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsaT-00082j-MR; Wed, 02 Jul 2025 08:13:01 +0000
Received: by outflank-mailman (input) for mailman id 1030376;
 Wed, 02 Jul 2025 08:13:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWsaS-00082X-SA
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:13:00 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d204e47-571c-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 10:12:58 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B2AAE2117F;
 Wed,  2 Jul 2025 08:12:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 89CA213A24;
 Wed,  2 Jul 2025 08:12:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MGs9IAnqZGjsSAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 02 Jul 2025 08:12:57 +0000
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
X-Inumbo-ID: 5d204e47-571c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751443977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pmrwFewWEb//FrXkeXoW39+51hKI+iB3NXqjXALFneU=;
	b=Pu+oPjAInqDI5v008Y0RIoqBGss1CWZJQfjSeldYYLHYt/iaZCTKwnypkp1wm4C2IVwFch
	JxwxEcQOcCptGNadVK8WDO9ae0e+eOGXRyoZAGrK08zN2Ly4WXjq54WvO1zhPBIvqQOy3M
	Sw27FmTQ8oTngCHbJ/yNk+Xe6zxaQjA=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Pu+oPjAI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751443977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pmrwFewWEb//FrXkeXoW39+51hKI+iB3NXqjXALFneU=;
	b=Pu+oPjAInqDI5v008Y0RIoqBGss1CWZJQfjSeldYYLHYt/iaZCTKwnypkp1wm4C2IVwFch
	JxwxEcQOcCptGNadVK8WDO9ae0e+eOGXRyoZAGrK08zN2Ly4WXjq54WvO1zhPBIvqQOy3M
	Sw27FmTQ8oTngCHbJ/yNk+Xe6zxaQjA=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 00/19] Make Xenstore-stubdom live update possible
Date: Wed,  2 Jul 2025 10:12:35 +0200
Message-ID: <20250702081254.14383-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B2AAE2117F
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:mid]
X-Spam-Score: -3.01
X-Spam-Level: 

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

Juergen Gross (19):
  setup: add global pointer for struct hvm_start_info
  mini-os: kexec: add O_CLOEXEC support
  mini-os: grants: support populated grant table at boot
  time: unbind VIRQ_TIMER across kexec
  mm: refactor init_page_allocator()
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
 arch/x86/kexec.c      | 113 ++++++++++++++++--
 arch/x86/mm.c         |  98 ++++++++++++++++
 arch/x86/setup.c      |  48 +++++++-
 arch/x86/time.c       |  14 +++
 e820.c                |  11 +-
 events.c              |   1 +
 gnttab.c              |  21 ++--
 include/9pfront.h     |   9 ++
 include/e820.h        |   2 +
 include/fcntl.h       |   6 +
 include/gnttab.h      |   2 +-
 include/hypervisor.h  |   3 +
 include/kernel.h      |   1 +
 include/kexec.h       |  98 ++++++++++++++++
 include/lib.h         |   1 +
 include/mm.h          |   4 +
 include/x86/arch_mm.h |   1 +
 kexec.c               | 118 +++++++++++++++++++
 lib/sys.c             |  44 ++++++-
 mm.c                  | 134 +++++++++++++--------
 22 files changed, 858 insertions(+), 144 deletions(-)

-- 
2.43.0


