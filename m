Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC8B92CE4B
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 11:37:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756660.1165348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRTlO-0003h5-LG; Wed, 10 Jul 2024 09:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756660.1165348; Wed, 10 Jul 2024 09:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRTlO-0003e1-Ht; Wed, 10 Jul 2024 09:37:26 +0000
Received: by outflank-mailman (input) for mailman id 756660;
 Wed, 10 Jul 2024 09:37:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pAY=OK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sRTlN-0003T0-57
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 09:37:25 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02ae37cb-3ea0-11ef-8776-851b0ebba9a2;
 Wed, 10 Jul 2024 11:37:23 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7994F21A3D;
 Wed, 10 Jul 2024 09:37:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1A8E6137D2;
 Wed, 10 Jul 2024 09:37:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kd4CBVJWjmaSWwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 10 Jul 2024 09:37:22 +0000
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
X-Inumbo-ID: 02ae37cb-3ea0-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1720604242; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AdPWVWbyk6GilbYgK6r8iH+eFHHYovKHeB/OAj0wy+c=;
	b=TZgdKOkhaj2jtwz2NuipEolNP1N5iaIqhW57xSDfdyghpruaSDvJYRDBh+398qPw1ob0SU
	/8L/yz79SPP5MAh823rx9yeTwc7NxgX3jxjnCJ/nq58S/tWfHgCrWE4esgVTqOTEWt1VX0
	d6C008hp4RiWebINz4In+RFulGEDglw=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1720604242; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AdPWVWbyk6GilbYgK6r8iH+eFHHYovKHeB/OAj0wy+c=;
	b=TZgdKOkhaj2jtwz2NuipEolNP1N5iaIqhW57xSDfdyghpruaSDvJYRDBh+398qPw1ob0SU
	/8L/yz79SPP5MAh823rx9yeTwc7NxgX3jxjnCJ/nq58S/tWfHgCrWE4esgVTqOTEWt1VX0
	d6C008hp4RiWebINz4In+RFulGEDglw=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH 0/2] x86/xen: cleanup of xen private headers
Date: Wed, 10 Jul 2024 11:37:16 +0200
Message-ID: <20240710093718.14552-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-2.80)[99.13%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -2.60
X-Spam-Level: 

Cleanup the private header files in arch/x86/xen by merging them into
one file and by removing unneeded stuff.

Juergen Gross (2):
  x86/xen: make some functions static
  x86/xen: eliminate some private header files

 arch/x86/xen/apic.c          |   2 -
 arch/x86/xen/debugfs.c       |   2 +-
 arch/x86/xen/debugfs.h       |   7 --
 arch/x86/xen/enlighten.c     |   2 -
 arch/x86/xen/enlighten_hvm.c |   2 -
 arch/x86/xen/enlighten_pv.c  |   4 -
 arch/x86/xen/mmu.c           |   3 +-
 arch/x86/xen/mmu.h           |  28 -------
 arch/x86/xen/mmu_hvm.c       |   2 +-
 arch/x86/xen/mmu_pv.c        |  15 ++--
 arch/x86/xen/multicalls.c    |   3 +-
 arch/x86/xen/multicalls.h    |  69 ----------------
 arch/x86/xen/p2m.c           |   2 -
 arch/x86/xen/pmu.c           |   1 -
 arch/x86/xen/pmu.h           |  22 ------
 arch/x86/xen/setup.c         |   1 -
 arch/x86/xen/smp.c           |   1 -
 arch/x86/xen/smp.h           |  51 ------------
 arch/x86/xen/smp_hvm.c       |   2 -
 arch/x86/xen/smp_pv.c        |   3 -
 arch/x86/xen/suspend.c       |   2 -
 arch/x86/xen/xen-ops.h       | 148 ++++++++++++++++++++++++++++++++++-
 include/xen/events.h         |   2 +
 23 files changed, 158 insertions(+), 216 deletions(-)
 delete mode 100644 arch/x86/xen/debugfs.h
 delete mode 100644 arch/x86/xen/mmu.h
 delete mode 100644 arch/x86/xen/multicalls.h
 delete mode 100644 arch/x86/xen/pmu.h
 delete mode 100644 arch/x86/xen/smp.h

-- 
2.43.0


