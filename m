Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5897F804FD7
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 11:08:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647512.1010703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rASLS-0005mm-Au; Tue, 05 Dec 2023 10:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647512.1010703; Tue, 05 Dec 2023 10:08:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rASLS-0005kL-77; Tue, 05 Dec 2023 10:08:02 +0000
Received: by outflank-mailman (input) for mailman id 647512;
 Tue, 05 Dec 2023 10:08:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mnjk=HQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rASLR-0005kF-41
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 10:08:01 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a263359-9356-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 11:07:58 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 659D322060;
 Tue,  5 Dec 2023 10:07:58 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 18D64138FF;
 Tue,  5 Dec 2023 10:07:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id fXJ/BH72bmXyMAAAn2gu4w
 (envelope-from <jgross@suse.com>); Tue, 05 Dec 2023 10:07:58 +0000
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
X-Inumbo-ID: 2a263359-9356-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701770878; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3pLGrDwnK3jAaev0mySNOBjMO3Q36w958rI8Dt5sBmA=;
	b=TTzvJ5y3BN8dLICVwNRqlfs0qq83yap2Vb/IYw6EFcvTxwHv1eqCPt2BY9cfUZUoGxjY5V
	qzOMXlhU31x1K1GwLE4CEOWEQcYc1wKyRhh7FF6zA3E0Uka7jGeok4bwfMW9bVDjuHOKLn
	7qLw58C2XtSPvdewHz4AUkDIPzIrH8M=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/2] xen: have a more generic unaligned.h header
Date: Tue,  5 Dec 2023 11:07:54 +0100
Message-Id: <20231205100756.18920-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Score: 3.81
X-Spam-Level: ***
X-Spamd-Result: default: False [3.81 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(0.11)[62.11%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]

Update Xen's unaligned.h header to support all architectures, allowing
to remove the architecture specific variants (x86 only until now).

Juergen Gross (2):
  xen: make include/xen/unaligned.h usable on all architectures
  xen: remove asm/unaligned.h

 xen/arch/x86/include/asm/unaligned.h |   6 --
 xen/common/lz4/defs.h                |   2 +-
 xen/common/lzo.c                     |   2 +-
 xen/common/unlzo.c                   |   2 +-
 xen/common/xz/private.h              |   2 +-
 xen/common/zstd/mem.h                |   2 +-
 xen/include/xen/unaligned.h          | 121 +++++++++++++++++++--------
 xen/lib/xxhash32.c                   |   2 +-
 xen/lib/xxhash64.c                   |   2 +-
 9 files changed, 93 insertions(+), 48 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/unaligned.h

-- 
2.35.3


