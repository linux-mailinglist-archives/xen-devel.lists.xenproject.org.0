Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F18C99CF16C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 17:23:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837815.1253711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBz6D-0006ty-8U; Fri, 15 Nov 2024 16:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837815.1253711; Fri, 15 Nov 2024 16:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBz6D-0006ru-5q; Fri, 15 Nov 2024 16:23:09 +0000
Received: by outflank-mailman (input) for mailman id 837815;
 Fri, 15 Nov 2024 16:23:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CdzU=SK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tBz6B-0006ro-W1
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 16:23:08 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e40af776-a36d-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 17:23:04 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A9946211A7;
 Fri, 15 Nov 2024 16:23:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7EF09134B8;
 Fri, 15 Nov 2024 16:23:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id e5JsHWZ1N2eeTQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 15 Nov 2024 16:23:02 +0000
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
X-Inumbo-ID: e40af776-a36d-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5NS4xMzUuMjIzLjEzMCIsImhlbG8iOiJzbXRwLW91dDEuc3VzZS5kZSJ9
X-Custom-Transaction: eyJpZCI6ImU0MGFmNzc2LWEzNmQtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjg3Nzg0Ljc1NjYyLCJzZW5kZXIiOiJqZ3Jvc3NAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1731687783; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JixwWm6LrqeD3xFJMDuRzgjzzoYJflV23s1C/UNsOxU=;
	b=O8bOmlaseOpms0wVxRP5NCxuSbf2jrJWRXGLlPDwC937zosmrJJNAZ9iw+tOGlxZr0615n
	hpQwXKmIhxO+C/rNOa2R55g7AzhkJQF1vKsIitX9B/1M8CRwBKsNSfAuI53nTdb9Ok3FNy
	CHq8VVCJguyIB5lbsngPns1SUEqxPl0=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1731687782; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JixwWm6LrqeD3xFJMDuRzgjzzoYJflV23s1C/UNsOxU=;
	b=uNYG2pxGkmkUXjqiudoiKVl46j/SBccekuofQVqQqVNrn5rjrMONeUs6dL2GnkWux/sdtk
	vyWJzs4xNph4BjptkiMMKzsuK7M0Bty75cg9ErR7r03MapdAl0h9EBTKQBlBK2q16nf0k9
	jmL730VmPB3DoFZm7vFoEw7Kz7AeCJc=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.13-rc1
Date: Fri, 15 Nov 2024 17:23:01 +0100
Message-ID: <20241115162301.28457-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid]
X-Spam-Flag: NO
X-Spam-Level: 

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.13-rc1-tag

xen: branch for v6.13-rc1

It contains:

- a series for booting as a PVH guest, doing some cleanups after the
  previous work to make PVH boot code position independent

- a fix of the xenbus driver avoiding a leak in an error case

Thanks.

Juergen

 arch/x86/kernel/vmlinux.lds.S     | 19 +++++++++++++++
 arch/x86/platform/pvh/head.S      | 50 ++++++++++++++++++++++-----------------
 arch/x86/tools/relocs.c           |  1 +
 arch/x86/xen/xen-head.S           |  6 +++--
 drivers/xen/xenbus/xenbus_probe.c |  8 ++++++-
 5 files changed, 59 insertions(+), 25 deletions(-)

Ard Biesheuvel (5):
      x86/pvh: Call C code via the kernel virtual mapping
      x86/pvh: Use correct size value in GDT descriptor
      x86/pvh: Omit needless clearing of phys_base
      x86/xen: Avoid relocatable quantities in Xen ELF notes
      x86/pvh: Avoid absolute symbol references in .head.text

Qiu-ji Chen (1):
      xen: Fix the issue of resource not being properly released in xenbus_dev_probe()

