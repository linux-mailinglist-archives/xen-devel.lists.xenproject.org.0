Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CA39A536E
	for <lists+xen-devel@lfdr.de>; Sun, 20 Oct 2024 12:06:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822757.1236732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2Soe-0004EV-GP; Sun, 20 Oct 2024 10:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822757.1236732; Sun, 20 Oct 2024 10:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2Soe-0004D4-Cc; Sun, 20 Oct 2024 10:05:40 +0000
Received: by outflank-mailman (input) for mailman id 822757;
 Sun, 20 Oct 2024 10:05:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zp1O=RQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1t2Soc-0004Cy-Op
 for xen-devel@lists.xenproject.org; Sun, 20 Oct 2024 10:05:38 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d95b4a75-8eca-11ef-99a3-01e77a169b0f;
 Sun, 20 Oct 2024 12:05:35 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0E34B1FDDE;
 Sun, 20 Oct 2024 10:05:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CD2AF13894;
 Sun, 20 Oct 2024 10:05:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gQNDMO3VFGd4IgAAD6G6ig
 (envelope-from <jgross@suse.com>); Sun, 20 Oct 2024 10:05:33 +0000
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
X-Inumbo-ID: d95b4a75-8eca-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1729418734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yN4mSamSE977luvalP1/nrLwKNupeevFLON1NVBJIOg=;
	b=EAAlkW7uunjfa8n0lH/lb98e3o41KEvzMwShkY4eq3LWOKb8mfPFGTcrocv6u/seuTvXB6
	kMlWiGdoE13/3su9CIhYGsgsPXGjMvUb0J+c9Wa9piiCIqXMsoIlVRalWj3njXP6Z/O8+r
	QP8fTyXGkDZda3C8kZKMf4G+MJ5zvkc=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1729418734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yN4mSamSE977luvalP1/nrLwKNupeevFLON1NVBJIOg=;
	b=EAAlkW7uunjfa8n0lH/lb98e3o41KEvzMwShkY4eq3LWOKb8mfPFGTcrocv6u/seuTvXB6
	kMlWiGdoE13/3su9CIhYGsgsPXGjMvUb0J+c9Wa9piiCIqXMsoIlVRalWj3njXP6Z/O8+r
	QP8fTyXGkDZda3C8kZKMf4G+MJ5zvkc=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.12-rc4
Date: Sun, 20 Oct 2024 12:05:33 +0200
Message-ID: <20241020100533.24289-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
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
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.12a-rc4-tag

xen: branch for v6.12-rc4

It contains just a single fix for a build failure introduced with a
patch in the 6.12 merge window.

Thanks.

Juergen

 drivers/xen/Kconfig                |  1 -
 drivers/xen/acpi.c                 | 24 ++++++++++++++++++++++++
 drivers/xen/privcmd.c              |  6 ++----
 drivers/xen/xen-pciback/pci_stub.c | 11 +++++++++--
 include/xen/acpi.h                 | 14 +++++++++-----
 5 files changed, 44 insertions(+), 12 deletions(-)

Jiqian Chen (1):
      xen: Remove dependency between pciback and privcmd

