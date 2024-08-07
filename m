Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF70694A596
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 12:34:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773299.1183742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbdzG-0005qV-6P; Wed, 07 Aug 2024 10:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773299.1183742; Wed, 07 Aug 2024 10:33:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbdzG-0005nJ-2h; Wed, 07 Aug 2024 10:33:46 +0000
Received: by outflank-mailman (input) for mailman id 773299;
 Wed, 07 Aug 2024 10:33:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6zTk=PG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sbdzE-0005nD-6a
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 10:33:44 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 810aebf1-54a8-11ef-8776-851b0ebba9a2;
 Wed, 07 Aug 2024 12:33:37 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7906F1F86A;
 Wed,  7 Aug 2024 10:33:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 208F213297;
 Wed,  7 Aug 2024 10:33:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id e4WABoVNs2beHwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 07 Aug 2024 10:33:41 +0000
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
X-Inumbo-ID: 810aebf1-54a8-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1723026821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qsPSyX3JmaVc+f4Tkm+uJmQXt6zFhh500l0/kg//IC8=;
	b=ui9gXtc3qWxb6jKcxoJev/mYYLyE6GwG3QInrdzyJV7NL/OW2WM86pC8F9OC4BkA/qx0q2
	Uqc58iyxU0aJDBQbCJM5ZSxFGmnbjzmNjrZTxedCwQ/xoqGR3nc62gqGTfqEDWQts6NjPg
	RW0VLoMG2vYPHNSFA4q2Ix29zjTpwHg=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=ui9gXtc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1723026821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qsPSyX3JmaVc+f4Tkm+uJmQXt6zFhh500l0/kg//IC8=;
	b=ui9gXtc3qWxb6jKcxoJev/mYYLyE6GwG3QInrdzyJV7NL/OW2WM86pC8F9OC4BkA/qx0q2
	Uqc58iyxU0aJDBQbCJM5ZSxFGmnbjzmNjrZTxedCwQ/xoqGR3nc62gqGTfqEDWQts6NjPg
	RW0VLoMG2vYPHNSFA4q2Ix29zjTpwHg=
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
	xen-devel@lists.xenproject.org
Subject: [PATCH 0/5] xen: fix dom0 PV boot on some AMD machines
Date: Wed,  7 Aug 2024 12:33:31 +0200
Message-ID: <20240807103338.22007-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: 7906F1F86A

There have been reports of failed boots with Xen due to an overlap of
the kernel's memory with ACPI NVS reported in the E820 map of the host.

This series fixes this issue by moving the NVS area in dom0 to some
higher address.

Juergen Gross (5):
  xen: use correct end address of kernel for conflict checking
  xen: introduce generic helper checking for memory map conflicts
  xen: move checks for e820 conflicts further up
  xen: move max_pfn in xen_memory_setup() out of function scope
  xen: tolerate ACPI NVS memory overlapping with Xen allocated memory

 arch/x86/xen/mmu_pv.c  |   5 +-
 arch/x86/xen/setup.c   | 242 +++++++++++++++++++++++++++++++++--------
 arch/x86/xen/xen-ops.h |   3 +-
 3 files changed, 201 insertions(+), 49 deletions(-)

-- 
2.43.0


