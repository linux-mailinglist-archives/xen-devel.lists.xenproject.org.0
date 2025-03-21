Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E79A6B733
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 10:25:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923430.1326939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYcb-0005R5-I9; Fri, 21 Mar 2025 09:24:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923430.1326939; Fri, 21 Mar 2025 09:24:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYcb-0005OE-DU; Fri, 21 Mar 2025 09:24:57 +0000
Received: by outflank-mailman (input) for mailman id 923430;
 Fri, 21 Mar 2025 09:24:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wue=WI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tvYca-0005O8-Df
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 09:24:56 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 594acb44-0636-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 10:24:54 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F00C11FB6B;
 Fri, 21 Mar 2025 09:24:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C5638139AA;
 Fri, 21 Mar 2025 09:24:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YhyqLmUw3Wf4GAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 21 Mar 2025 09:24:53 +0000
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
X-Inumbo-ID: 594acb44-0636-11f0-9ea1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742549094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=I16Jcmi/tPhnqXbhhvCxsdDEoRl/IPTWj8eh5kJrCns=;
	b=YerRSN8d/CHlugjy5AfDYQXUyc42ugQfyWlYVwXntkeIdeajs6IgY1kVdWIeiSPBDl0JK0
	GbL3VyjIzfAyDOnZVxk3aAAVxR9ByPpxnRzIzrzy+Bx3PrnHIzvAPAwMt5IaIOK1X82Zlh
	CQF6bRW0j7c5C3Dy/DjYz/5St4yaJlo=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=YerRSN8d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742549094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=I16Jcmi/tPhnqXbhhvCxsdDEoRl/IPTWj8eh5kJrCns=;
	b=YerRSN8d/CHlugjy5AfDYQXUyc42ugQfyWlYVwXntkeIdeajs6IgY1kVdWIeiSPBDl0JK0
	GbL3VyjIzfAyDOnZVxk3aAAVxR9ByPpxnRzIzrzy+Bx3PrnHIzvAPAwMt5IaIOK1X82Zlh
	CQF6bRW0j7c5C3Dy/DjYz/5St4yaJlo=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 00/12] kexec: add kexec support to Mini-OS
Date: Fri, 21 Mar 2025 10:24:39 +0100
Message-ID: <20250321092451.17309-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F00C11FB6B
X-Spam-Score: -3.01
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Add basic kexec support to Mini-OS for running in x86 PVH mode.

With this series applied it is possible to activate another kernel
from within Mini-OS.

Right now no Xen related teardown is done (so no reset of grant table,
event channels, PV devices). These should be added via kexec callbacks
which are added as a framework.

This is a major building block for support of Xenstore-stubdom live
update (in fact I've tested the kexec path to work using the PVH
variant of Xenstore-stubdom).

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
 arch/x86/kexec.c           | 273 +++++++++++++++++++++++++++++
 arch/x86/minios-x86.lds.S  |  16 ++
 arch/x86/mm.c              | 238 ++++++++++++++++++++------
 arch/x86/testbuild/all-no  |   1 +
 arch/x86/testbuild/all-yes |   2 +
 arch/x86/testbuild/kexec   |   4 +
 arch/x86/x86_hvm.S         |  46 +++++
 include/elf.h              | 340 +++++++++++++++++++++++++++++++++++++
 include/kexec.h            |  63 +++++++
 include/mm.h               |   8 +
 include/x86/os.h           |   5 +
 kexec.c                    | 253 +++++++++++++++++++++++++++
 mm.c                       |  89 +++++++++-
 15 files changed, 1289 insertions(+), 51 deletions(-)
 create mode 100644 arch/x86/kexec.c
 create mode 100644 arch/x86/testbuild/kexec
 create mode 100644 include/elf.h
 create mode 100644 include/kexec.h
 create mode 100644 kexec.c

-- 
2.43.0


