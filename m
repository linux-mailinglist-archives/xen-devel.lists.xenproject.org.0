Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4359CA33A57
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 09:56:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887229.1296761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiV0b-0008Jx-5d; Thu, 13 Feb 2025 08:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887229.1296761; Thu, 13 Feb 2025 08:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiV0b-0008HD-2Z; Thu, 13 Feb 2025 08:55:45 +0000
Received: by outflank-mailman (input) for mailman id 887229;
 Thu, 13 Feb 2025 08:55:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YDip=VE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tiV0Z-0008H6-Oi
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 08:55:43 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e48007e-e9e8-11ef-a075-877d107080fb;
 Thu, 13 Feb 2025 09:55:42 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3B4A52295F;
 Thu, 13 Feb 2025 08:55:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C2402137DB;
 Thu, 13 Feb 2025 08:55:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8W7qLYyzrWcCdgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 13 Feb 2025 08:55:40 +0000
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
X-Inumbo-ID: 4e48007e-e9e8-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1739436941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dvp+2zva3b1OzC9c49Z/oXKVc7Zk8EYxQY79anNSCaA=;
	b=ajQAG1827NLagTbTwYjbfqQpSVsCL9eywPM/N7ZN63lNQYOI5o/irGXlYPnLcGmryG1TwU
	Bt2mljd+T16zbOo+h8qZA30lhYwzIjATaCPxa4HAPErBPIKbco6haDbLyPcmWJDhQAWtX7
	UadBSlkpVPO2nglFEQoSN1iI2SoVrfQ=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=ajQAG182
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1739436941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dvp+2zva3b1OzC9c49Z/oXKVc7Zk8EYxQY79anNSCaA=;
	b=ajQAG1827NLagTbTwYjbfqQpSVsCL9eywPM/N7ZN63lNQYOI5o/irGXlYPnLcGmryG1TwU
	Bt2mljd+T16zbOo+h8qZA30lhYwzIjATaCPxa4HAPErBPIKbco6haDbLyPcmWJDhQAWtX7
	UadBSlkpVPO2nglFEQoSN1iI2SoVrfQ=
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
Subject: [PATCH v2 0/2] xen/swiotlb: two fixes
Date: Thu, 13 Feb 2025 09:55:36 +0100
Message-ID: <20250213085538.17060-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3B4A52295F
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Patch 1 removes an unneeded alignment requirement, which resulted in
exhausting the SWIOTLB with normal use cases.

Patch 2 allows to allocate larger continuous regions by reallocating
the frame list if needed.

Changes in V2:
- drop former patch 2 for now in order to avoid more lengthy discussion
- new patch 2

Juergen Gross (2):
  xen/swiotlb: relax alignment requirements
  x86/xen: allow larger contiguous memory regions in PV guests

 arch/x86/xen/mmu_pv.c     | 71 ++++++++++++++++++++++++++++++++++-----
 drivers/xen/swiotlb-xen.c | 20 ++++++-----
 2 files changed, 74 insertions(+), 17 deletions(-)

-- 
2.43.0


