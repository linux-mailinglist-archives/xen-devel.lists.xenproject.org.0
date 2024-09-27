Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FA398818B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 11:44:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806175.1217515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su7Vm-0004vr-TO; Fri, 27 Sep 2024 09:43:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806175.1217515; Fri, 27 Sep 2024 09:43:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su7Vm-0004uM-Qe; Fri, 27 Sep 2024 09:43:42 +0000
Received: by outflank-mailman (input) for mailman id 806175;
 Fri, 27 Sep 2024 09:43:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J2Or=QZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1su7Vk-0004kt-S6
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 09:43:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f93a5414-7cb4-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 11:43:39 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8846C21BAE;
 Fri, 27 Sep 2024 09:43:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5744D13A73;
 Fri, 27 Sep 2024 09:43:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id dw+vE0p+9mbcSwAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 27 Sep 2024 09:43:38 +0000
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
X-Inumbo-ID: f93a5414-7cb4-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1727430218; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2Uu1EfCgnj4wDrzRwDuAI68ysm7+uYD9d5yxXTU5Yw0=;
	b=hzC5h/a7+zFH4q3ZcenRbERSq1ayIZA6/MS2Xr3UMo4IJIuCHTAmLv9f2auffRtQIB7D4f
	5o1jfFPzAK7EVMSzvwI/9uhRfzYa6870TeDkbtJgevy5pfNsByuKeXLVaWz9YbcD9PdJoR
	kwFDQ5TkgdYH7tuhN2MoPkAxr9Viv5o=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1727430218; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2Uu1EfCgnj4wDrzRwDuAI68ysm7+uYD9d5yxXTU5Yw0=;
	b=hzC5h/a7+zFH4q3ZcenRbERSq1ayIZA6/MS2Xr3UMo4IJIuCHTAmLv9f2auffRtQIB7D4f
	5o1jfFPzAK7EVMSzvwI/9uhRfzYa6870TeDkbtJgevy5pfNsByuKeXLVaWz9YbcD9PdJoR
	kwFDQ5TkgdYH7tuhN2MoPkAxr9Viv5o=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.12-rc1a
Date: Fri, 27 Sep 2024 11:43:37 +0200
Message-ID: <20240927094337.32387-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,imap1.dmz-prg2.suse.org:helo];
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

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.12-rc1a-tag

xen: branch for v6.12-rc1a

It contains a second round of Xen related changes and features for the
6.12 merge window:

- A small fix of the xen-pciback driver for a warning issued by sparse

- A series of 3 patches supporting PCI passthrough when using a PVH
  dom0

- A series of 5 patches enabling to load the kernel in PVH mode at
  arbitrary addresses, avoiding conflicts with the memory map when
  running as a Xen dom0 using the host memory layout

Thanks.

Juergen

 arch/x86/include/asm/pgtable_64.h               |  23 +++-
 arch/x86/kernel/head_64.S                       |  20 ---
 arch/x86/platform/pvh/head.S                    | 161 ++++++++++++++++++++++--
 arch/x86/xen/enlighten_pvh.c                    |  23 ++++
 drivers/acpi/pci_irq.c                          |   2 +-
 drivers/xen/Kconfig                             |   1 +
 drivers/xen/acpi.c                              |  50 ++++++++
 drivers/xen/pci.c                               |  13 ++
 drivers/xen/privcmd.c                           |  32 +++++
 drivers/xen/xen-pciback/conf_space_capability.c |   2 +-
 drivers/xen/xen-pciback/pci_stub.c              |  78 ++++++++++--
 include/linux/acpi.h                            |   1 +
 include/uapi/xen/privcmd.h                      |   7 ++
 include/xen/acpi.h                              |  27 ++++
 include/xen/interface/elfnote.h                 |  93 +++++++++++++-
 include/xen/interface/physdev.h                 |  17 +++
 include/xen/pci.h                               |   6 +
 17 files changed, 509 insertions(+), 47 deletions(-)

Jason Andryuk (5):
      xen: sync elfnote.h from xen tree
      x86/pvh: Make PVH entrypoint PIC for x86-64
      x86/pvh: Set phys_base when calling xen_prepare_pvh()
      x86/kernel: Move page table macros to header
      x86/pvh: Add 64bit relocation page tables

Jiqian Chen (3):
      xen/pci: Add a function to reset device for xen
      xen/pvh: Setup gsi for passthrough device
      xen/privcmd: Add new syscall to get gsi from dev

Min-Hua Chen (1):
      xen/pciback: fix cast to restricted pci_ers_result_t and pci_power_t

