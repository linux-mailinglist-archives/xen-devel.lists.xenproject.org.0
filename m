Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A92D597C426
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 08:07:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800511.1210439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srAJR-0001pH-VV; Thu, 19 Sep 2024 06:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800511.1210439; Thu, 19 Sep 2024 06:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srAJR-0001mD-Sl; Thu, 19 Sep 2024 06:06:45 +0000
Received: by outflank-mailman (input) for mailman id 800511;
 Thu, 19 Sep 2024 06:06:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l340=QR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1srAJQ-0001m7-HU
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 06:06:44 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57cbce78-764d-11ef-a0b8-8be0dac302b0;
 Thu, 19 Sep 2024 08:06:43 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7B736337AD;
 Thu, 19 Sep 2024 06:06:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4E03D13A5F;
 Thu, 19 Sep 2024 06:06:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8fAFEXK/62Z+NgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 19 Sep 2024 06:06:42 +0000
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
X-Inumbo-ID: 57cbce78-764d-11ef-a0b8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1726726002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0q8lpjbBdWl/Bwvse0JH1SoZIHUQkGzm3g/hvCMqczs=;
	b=S0sNRzj4z8lINVoaBdY2xH5OqnsEpShvCc35cy3NYCT9eyVRe6zvjsnPjpUR8qxdFcayPK
	gEKSNU58zdKgkhKJP9FCWIUnjeafDEF9SN0Oy8W/oirqOLoL0KkaNo6SP/uyrzidjkZ0e6
	7Kf0tH/WPJ8KclcKAgp0CmcyBBGdXqc=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1726726002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0q8lpjbBdWl/Bwvse0JH1SoZIHUQkGzm3g/hvCMqczs=;
	b=S0sNRzj4z8lINVoaBdY2xH5OqnsEpShvCc35cy3NYCT9eyVRe6zvjsnPjpUR8qxdFcayPK
	gEKSNU58zdKgkhKJP9FCWIUnjeafDEF9SN0Oy8W/oirqOLoL0KkaNo6SP/uyrzidjkZ0e6
	7Kf0tH/WPJ8KclcKAgp0CmcyBBGdXqc=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.12-rc1
Date: Thu, 19 Sep 2024 08:06:41 +0200
Message-ID: <20240919060641.14017-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
X-Spam-Flag: NO
X-Spam-Level: 

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.12-rc1-tag

xen: branch for v6.12-rc1

It contains the following patches:

- A 7 patch series fixing a boot problem as a Xen dom0 on some AMD systems
- A 3 patch series fixing Xen PVH boot problems with KASAN enabled
- A fix for a build warning
- 2 fixes in swiotlb-xen

Thanks.

Juergen

 arch/x86/include/asm/acpi.h        |   8 ++
 arch/x86/include/asm/cpuid.h       |   7 +-
 arch/x86/kernel/acpi/boot.c        |  11 ++
 arch/x86/kernel/jailhouse.c        |   1 +
 arch/x86/kernel/mmconf-fam10h_64.c |   1 +
 arch/x86/kernel/smpboot.c          |   1 +
 arch/x86/kernel/x86_init.c         |   1 +
 arch/x86/platform/pvh/Makefile     |   1 +
 arch/x86/platform/pvh/enlighten.c  |   6 +-
 arch/x86/xen/mmu_pv.c              |   5 +-
 arch/x86/xen/p2m.c                 |  98 ++++++++++++++++++
 arch/x86/xen/setup.c               | 202 ++++++++++++++++++++++++++++---------
 arch/x86/xen/xen-ops.h             |   6 +-
 drivers/xen/pci.c                  |  14 +--
 drivers/xen/swiotlb-xen.c          |  10 +-
 drivers/xen/xenbus/xenbus_xs.c     |   6 +-
 16 files changed, 312 insertions(+), 66 deletions(-)

Alexey Dobriyan (3):
      xen, pvh: fix unbootable VMs (PVH + KASAN - AMD_MEM_ENCRYPT)
      x86/cpu: fix unbootable VMs by inlining memcmp() in hypervisor_cpuid_base()
      xen, pvh: fix unbootable VMs by inlining memset() in xen_prepare_pvh()

Gustavo A. R. Silva (1):
      xen/pci: Avoid -Wflex-array-member-not-at-end warning

Juergen Gross (9):
      xen: use correct end address of kernel for conflict checking
      xen: introduce generic helper checking for memory map conflicts
      xen: move checks for e820 conflicts further up
      xen: move max_pfn in xen_memory_setup() out of function scope
      xen: add capability to remap non-RAM pages to different PFNs
      xen: allow mapping ACPI data using a different physical address
      xen: tolerate ACPI NVS memory overlapping with Xen allocated memory
      xen/swiotlb: add alignment check for dma buffers
      xen/swiotlb: fix allocated size

Shen Lichuan (1):
      xen/xenbus: Convert to use ERR_CAST()

