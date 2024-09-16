Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFF8979B67
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 08:48:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799167.1209026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq5Wd-0004hu-FU; Mon, 16 Sep 2024 06:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799167.1209026; Mon, 16 Sep 2024 06:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq5Wd-0004fF-CE; Mon, 16 Sep 2024 06:47:55 +0000
Received: by outflank-mailman (input) for mailman id 799167;
 Mon, 16 Sep 2024 06:47:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tb4s=QO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sq5Wc-0004f9-8D
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 06:47:54 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9822e90b-73f7-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 08:47:52 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 25E6D1F86B;
 Mon, 16 Sep 2024 06:47:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D85E6139CE;
 Mon, 16 Sep 2024 06:47:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6jRUM5bU52Z/IAAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 16 Sep 2024 06:47:50 +0000
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
X-Inumbo-ID: 9822e90b-73f7-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1726469271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=jDdjkbnsAiMFhfKjybazY963Vvy5Vm1vHgzynokF26w=;
	b=nm/7SdsmLB716zqUjTRDXTuZ6Y+A2VHtxwQP70gWcmcCondbkBMHOQ2T+pXsYcjbHIQS6r
	qF+Wi+NSFdatZV/TsWdhlwTZb/6MaeHSV1xoZD5EdPQjHu6Z4fV/QEYAe1HxqCCZkJfmKY
	mmtRjtTfSr3rzXmfeEgUAenBhx0rQNo=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1726469271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=jDdjkbnsAiMFhfKjybazY963Vvy5Vm1vHgzynokF26w=;
	b=nm/7SdsmLB716zqUjTRDXTuZ6Y+A2VHtxwQP70gWcmcCondbkBMHOQ2T+pXsYcjbHIQS6r
	qF+Wi+NSFdatZV/TsWdhlwTZb/6MaeHSV1xoZD5EdPQjHu6Z4fV/QEYAe1HxqCCZkJfmKY
	mmtRjtTfSr3rzXmfeEgUAenBhx0rQNo=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 0/2] xen/swiotlb: fix 2 issues in xen-swiotlb
Date: Mon, 16 Sep 2024 08:47:46 +0200
Message-ID: <20240916064748.18071-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Fix 2 issues in xen-swiotlb:

- buffers need to be aligned properly
- wrong buffer size if XEN_PAGE_SIZE < PAGE_SIZE

Changes in V2:
- added patch 2

Juergen Gross (2):
  xen/swiotlb: add alignment check for dma buffers
  xen/swiotlb: fix allocated size

 drivers/xen/swiotlb-xen.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
2.43.0


