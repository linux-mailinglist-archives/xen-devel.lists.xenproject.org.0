Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EAC97344D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 12:40:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795318.1204610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snyHa-0005GZ-PG; Tue, 10 Sep 2024 10:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795318.1204610; Tue, 10 Sep 2024 10:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snyHa-0005DS-MU; Tue, 10 Sep 2024 10:39:38 +0000
Received: by outflank-mailman (input) for mailman id 795318;
 Tue, 10 Sep 2024 10:39:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ulZE=QI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1snyHa-0005DK-44
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 10:39:38 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f926448e-6f60-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 12:39:36 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7B16621A32;
 Tue, 10 Sep 2024 10:39:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1CA81132CB;
 Tue, 10 Sep 2024 10:39:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +R6KBech4GahYwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 10 Sep 2024 10:39:35 +0000
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
X-Inumbo-ID: f926448e-6f60-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1725964775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=6w0KKKScpSdCGyQyfm+U/zq2K600ZMP+OJ4gtPNgbdg=;
	b=MJdwSxhILRkVOHveQo3EG9CabNyFBPmNnYuol2KN561p/EN6CTSFVg+zKoiXf8Vl5jm/c0
	yOqD1KxjD8zXBuZT/nq14WXl3q7oSxOwgbx3erwpDPCiDBhiWVhNScvSLVkrMtTwi0K578
	wnU7rBz/M/JPuILZ1Sia6JGEhoJW/Qc=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=MJdwSxhI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1725964775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=6w0KKKScpSdCGyQyfm+U/zq2K600ZMP+OJ4gtPNgbdg=;
	b=MJdwSxhILRkVOHveQo3EG9CabNyFBPmNnYuol2KN561p/EN6CTSFVg+zKoiXf8Vl5jm/c0
	yOqD1KxjD8zXBuZT/nq14WXl3q7oSxOwgbx3erwpDPCiDBhiWVhNScvSLVkrMtTwi0K578
	wnU7rBz/M/JPuILZ1Sia6JGEhoJW/Qc=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-acpi@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>
Subject: [PATCH v3 0/7]  xen: fix dom0 PV boot on some AMD machines
Date: Tue, 10 Sep 2024 12:39:25 +0200
Message-ID: <20240910103932.7634-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7B16621A32
X-Spam-Level: 
X-Spamd-Result: default: False [-5.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[13];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -5.01
X-Spam-Flag: NO

There have been reports of failed boots with Xen due to an overlap of
the kernel's memory with ACPI NVS reported in the E820 map of the host.

This series fixes this issue by moving the NVS area in dom0 to some
higher address.

Changes in V2:
- split of v1 patch 5
- new patch 6

Changes in V3:
- addressed comments

Juergen Gross (7):
  xen: use correct end address of kernel for conflict checking
  xen: introduce generic helper checking for memory map conflicts
  xen: move checks for e820 conflicts further up
  xen: move max_pfn in xen_memory_setup() out of function scope
  xen: add capability to remap non-RAM pages to different PFNs
  xen: allow mapping ACPI data using a different physical address
  xen: tolerate ACPI NVS memory overlapping with Xen allocated memory

 arch/x86/include/asm/acpi.h        |   8 ++
 arch/x86/kernel/acpi/boot.c        |  10 ++
 arch/x86/kernel/mmconf-fam10h_64.c |   2 +-
 arch/x86/kernel/x86_init.c         |   2 +-
 arch/x86/xen/mmu_pv.c              |   5 +-
 arch/x86/xen/p2m.c                 |  99 ++++++++++++++
 arch/x86/xen/setup.c               | 202 ++++++++++++++++++++++-------
 arch/x86/xen/xen-ops.h             |   6 +-
 8 files changed, 282 insertions(+), 52 deletions(-)

-- 
2.43.0


