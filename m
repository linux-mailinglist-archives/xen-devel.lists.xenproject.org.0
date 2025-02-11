Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D81C5A30BBB
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 13:29:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885504.1295314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thpNr-00024s-JV; Tue, 11 Feb 2025 12:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885504.1295314; Tue, 11 Feb 2025 12:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thpNr-00021q-GM; Tue, 11 Feb 2025 12:28:59 +0000
Received: by outflank-mailman (input) for mailman id 885504;
 Tue, 11 Feb 2025 12:28:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vD9p=VC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1thpNp-00021k-NV
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 12:28:57 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c297c5f6-e873-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 13:28:55 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E68A937B3E;
 Tue, 11 Feb 2025 12:04:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7ECAB13782;
 Tue, 11 Feb 2025 12:04:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id njSKHdM8q2egGgAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 11 Feb 2025 12:04:35 +0000
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
X-Inumbo-ID: c297c5f6-e873-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1739275475; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zxuVAvyzkp6zq60Y3IIgw3a0N6EBZB0/ewpeFUtjxfE=;
	b=mG5KJkJEA9cENgXVVW1/b1jxBw55qBBByi9PqzfHzpewCvY3NEQwN486QwswigWR3z3MaO
	5RV9+Cpgb3JBOuZf7DOhtGxjiRbMQmmRdcShemoF4qnQwJsM6EDshp0HbF+ORTW7Gu3afx
	DdhHDp5aJLMzmzDwtMCbwbIAsgo2hUY=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=mG5KJkJE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1739275475; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zxuVAvyzkp6zq60Y3IIgw3a0N6EBZB0/ewpeFUtjxfE=;
	b=mG5KJkJEA9cENgXVVW1/b1jxBw55qBBByi9PqzfHzpewCvY3NEQwN486QwswigWR3z3MaO
	5RV9+Cpgb3JBOuZf7DOhtGxjiRbMQmmRdcShemoF4qnQwJsM6EDshp0HbF+ORTW7Gu3afx
	DdhHDp5aJLMzmzDwtMCbwbIAsgo2hUY=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 0/2] xen/swiotlb: one fix and one optimization
Date: Tue, 11 Feb 2025 13:04:30 +0100
Message-ID: <20250211120432.29493-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E68A937B3E
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim,suse.com:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Patch 1 removes an unneeded alignment requirement, which resulted in
exhausting the SWIOTLB with normal use cases.

Patch 2 is an optimization to avoid destroying a contiguous region
without any need to do so.

There will be probably another patch following to allow larger
contiguous regions to be created, but this one isn't ready yet.

Juergen Gross (2):
  xen/swiotlb: relax alignment requirements
  xen/swiotlb: don't destroy contiguous region in all cases

 arch/x86/include/asm/xen/swiotlb-xen.h |  5 +++--
 arch/x86/xen/mmu_pv.c                  | 18 ++++++++++-----
 drivers/xen/swiotlb-xen.c              | 31 ++++++++++++++++----------
 3 files changed, 34 insertions(+), 20 deletions(-)

-- 
2.43.0


