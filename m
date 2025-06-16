Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36467ADAB08
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 10:46:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016880.1393854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR5UB-0007oT-0a; Mon, 16 Jun 2025 08:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016880.1393854; Mon, 16 Jun 2025 08:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR5UA-0007m5-TZ; Mon, 16 Jun 2025 08:46:34 +0000
Received: by outflank-mailman (input) for mailman id 1016880;
 Mon, 16 Jun 2025 08:46:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GKzt=Y7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uR5U9-0007jR-Jy
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 08:46:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61f6e740-4a8e-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 10:46:24 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 95DB82117F;
 Mon, 16 Jun 2025 08:46:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 69736139E2;
 Mon, 16 Jun 2025 08:46:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 3vgHGN3ZT2jUPwAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 16 Jun 2025 08:46:21 +0000
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
X-Inumbo-ID: 61f6e740-4a8e-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750063582; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=T4caMaW8bugDRSGPfSz/ynH/nu5eTDf2OXty7FDoRQY=;
	b=JAQq61Cpb3tVLl1TFx2NqWBYwNpGZUJqgo//fULC+siz5DGwF3yLMFnIWBbxTMumWVtu+S
	2SQLeV5o73fye1Ei0umtxHHfalcBANRZhDS1W0mHTXrfVAn2WgT3SXZ3HdaIV4eIPDyPJX
	o7gopzFyv5GweCwCDKlytGxQQJSpRI0=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=gH0t1Ce5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750063581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=T4caMaW8bugDRSGPfSz/ynH/nu5eTDf2OXty7FDoRQY=;
	b=gH0t1Ce5jC8inaTPV+MV2kZyg6G2BCFmwbuXNDJIcAqNHPtQaU4yVBirL4eRDiIQiqQ+6B
	cMJEVjY4gtYdgUp9og16JwT31ssHWMUFYYZMaFun0szb18/FcKQQ+r2WjZtJodyYvNecdb
	w2CgnrvPccxQIM42qalMrCkOGasG5Ug=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH v2 00/12] kexec: add kexec support to Mini-OS
Date: Mon, 16 Jun 2025 10:46:07 +0200
Message-ID: <20250616084619.11112-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 95DB82117F
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

Add basic kexec support to Mini-OS for running in x86 PVH mode.

With this series applied it is possible to activate another kernel
from within Mini-OS.

Right now no Xen related teardown is done (so no reset of grant table,
event channels, PV devices). These should be added via kexec callbacks
which are added as a framework.

This is a major building block for support of Xenstore-stubdom live
update (in fact I've tested the kexec path to work using the PVH
variant of Xenstore-stubdom).

Changes in V2:
- addressed comments

Juergen Gross (12):
  add kexec framework
  Mini-OS: add final kexec stage
  mini-os: add elf.h
  mini-os: analyze new kernel for kexec
  mini-os: kexec: finalize parameter location and size
  mini-os: reserve memory below boundary
  mini-os: kexec: build parameters for new kernel
  mini-os: kexec: move used pages away for new kernel
  Mini-OS: mm: change set_readonly() to change_readonly()
  Mini-OS: kexec: switch read-only area to be writable again
  mini-os: kexec: add kexec callback functionality
  mini-os: kexec: do the final kexec step

 Config.mk                  |   1 +
 Makefile                   |   1 +
 arch/x86/kexec.c           | 272 +++++++++++++++++++++++++++++++++
 arch/x86/minios-x86.lds.S  |  17 +++
 arch/x86/mm.c              | 238 ++++++++++++++++++++++-------
 arch/x86/testbuild/all-no  |   1 +
 arch/x86/testbuild/all-yes |   2 +
 arch/x86/testbuild/kexec   |   4 +
 arch/x86/x86_hvm.S         |  46 ++++++
 include/elf.h              | 300 +++++++++++++++++++++++++++++++++++++
 include/kexec.h            |  63 ++++++++
 include/mm.h               |   8 +
 include/x86/os.h           |   5 +
 kexec.c                    | 252 +++++++++++++++++++++++++++++++
 mm.c                       |  89 ++++++++++-
 15 files changed, 1248 insertions(+), 51 deletions(-)
 create mode 100644 arch/x86/kexec.c
 create mode 100644 arch/x86/testbuild/kexec
 create mode 100644 include/elf.h
 create mode 100644 include/kexec.h
 create mode 100644 kexec.c

-- 
2.43.0


