Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 025D680CA9D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 14:16:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651784.1017607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCg90-0005Pj-Q8; Mon, 11 Dec 2023 13:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651784.1017607; Mon, 11 Dec 2023 13:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCg90-0005MX-NW; Mon, 11 Dec 2023 13:16:22 +0000
Received: by outflank-mailman (input) for mailman id 651784;
 Mon, 11 Dec 2023 13:16:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g7EY=HW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rCg8z-0005MG-NC
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 13:16:21 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78ef22b9-9827-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 14:16:19 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0D23F223CD;
 Mon, 11 Dec 2023 13:16:19 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id B2015134B0;
 Mon, 11 Dec 2023 13:16:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id +cAWKqILd2W5UgAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 11 Dec 2023 13:16:18 +0000
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
X-Inumbo-ID: 78ef22b9-9827-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702300579; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=SqOtV1aFu0+l1XwW7ccmSceicrrewr58Yx/V3PdGqYw=;
	b=BUQd4Vx0CCRFutSC509p5oURDxjOAmOgMbDL8mDQn+uvmfUqFqcGKE1uVePuQ8mMxJVXKv
	uQfQ2lAMRBnvxltSHbFDEMZDBeQhPOqUw0bRPhm0JnTF9LckLG499VbSaMzR23+N/dTX4B
	zm+24rqDQdFx2vBkZJNZq3DGyi3eCtY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702300579; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=SqOtV1aFu0+l1XwW7ccmSceicrrewr58Yx/V3PdGqYw=;
	b=BUQd4Vx0CCRFutSC509p5oURDxjOAmOgMbDL8mDQn+uvmfUqFqcGKE1uVePuQ8mMxJVXKv
	uQfQ2lAMRBnvxltSHbFDEMZDBeQhPOqUw0bRPhm0JnTF9LckLG499VbSaMzR23+N/dTX4B
	zm+24rqDQdFx2vBkZJNZq3DGyi3eCtY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 0/3] xen: have a more generic unaligned.h header
Date: Mon, 11 Dec 2023 14:16:13 +0100
Message-Id: <20231211131616.1839-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: 3.70
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
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
	 RCPT_COUNT_TWELVE(0.00)[12];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

Update Xen's unaligned.h header to support all architectures, allowing
to remove the architecture specific variants (x86 only until now).

Changes in V2:
- new patch 1 (Julien Grall)
- adjusted patch 2 (Jan Beulich)

Changes in V3:
- adjusted patch 2 (Andrew Cooper)

Juergen Gross (3):
  xen/arm: set -mno-unaligned-access compiler option for Arm32
  xen: make include/xen/unaligned.h usable on all architectures
  xen: remove asm/unaligned.h

 xen/arch/arm/arch.mk                 |  1 +
 xen/arch/x86/include/asm/unaligned.h |  6 ----
 xen/common/lz4/defs.h                |  2 +-
 xen/common/lzo.c                     |  2 +-
 xen/common/unlzo.c                   |  2 +-
 xen/common/xz/private.h              |  2 +-
 xen/common/zstd/mem.h                |  2 +-
 xen/include/xen/unaligned.h          | 53 ++++++++++++++++------------
 xen/lib/xxhash32.c                   |  2 +-
 xen/lib/xxhash64.c                   |  2 +-
 10 files changed, 38 insertions(+), 36 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/unaligned.h

-- 
2.35.3


