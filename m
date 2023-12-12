Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AE480F26C
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 17:27:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653307.1019738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD5b9-0000Ie-UU; Tue, 12 Dec 2023 16:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653307.1019738; Tue, 12 Dec 2023 16:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD5b9-0000Fa-RF; Tue, 12 Dec 2023 16:27:07 +0000
Received: by outflank-mailman (input) for mailman id 653307;
 Tue, 12 Dec 2023 16:27:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/k62=HX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rD5b8-0000E9-Kl
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 16:27:06 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49c3c757-990b-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 17:27:06 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A07CE21B4E;
 Tue, 12 Dec 2023 16:27:04 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C72C139E9;
 Tue, 12 Dec 2023 16:27:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id QxxSFdiJeGUgeQAAn2gu4w
 (envelope-from <jgross@suse.com>); Tue, 12 Dec 2023 16:27:04 +0000
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
X-Inumbo-ID: 49c3c757-990b-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702398424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zVP2t2W8BRlSVq7GpLt/uxZxuO3Mb4WFW3tHVkiGuD8=;
	b=BZB4kuIcDN5n7H23xzX4ilATTUnoHxeeJbINmLHKllRmsDh5LufBqTtvq7gp0mhsOuJSXs
	W3kKPClLq3NAnOe1ROBYDVM24HsoVeITWowUpHgs7g53e9R29J3OndKnONMGupU/QbuCsf
	XcwxgagWA4fUuTr4qqqXALHmCZ8qVFA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702398424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zVP2t2W8BRlSVq7GpLt/uxZxuO3Mb4WFW3tHVkiGuD8=;
	b=BZB4kuIcDN5n7H23xzX4ilATTUnoHxeeJbINmLHKllRmsDh5LufBqTtvq7gp0mhsOuJSXs
	W3kKPClLq3NAnOe1ROBYDVM24HsoVeITWowUpHgs7g53e9R29J3OndKnONMGupU/QbuCsf
	XcwxgagWA4fUuTr4qqqXALHmCZ8qVFA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/2] xen: have a more generic unaligned.h header (take 2)
Date: Tue, 12 Dec 2023 17:27:00 +0100
Message-Id: <20231212162702.26360-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: ***************
X-Spam-Score: 15.80
X-Spam-Flag: YES
X-Spam-Level: 
X-Rspamd-Server: rspamd1
X-Rspamd-Queue-Id: A07CE21B4E
X-Spam-Flag: NO
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=BZB4kuIc;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=fail (smtp-out1.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:98 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Spamd-Result: default: False [-1.76 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 DMARC_POLICY_ALLOW(0.00)[suse.com,quarantine];
	 DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-1.45)[91.33%];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(0.00)[-all];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 SPAM_FLAG(5.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 WHITELIST_DMARC(-7.00)[suse.com:D:+];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:104:10:150:64:98:from];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -1.76

Second try for the generic unaligned.h approach.

This time including a fix for building stubdom with libxenguest,
which is using a cruel hack to reuse the hypervisor's decompressing
code.

Juergen Gross (2):
  xen: make include/xen/unaligned.h usable on all architectures
  xen: remove asm/unaligned.h

 .../guest/xg_dom_decompress_unsafe_zstd.c     |  2 +-
 xen/arch/x86/include/asm/unaligned.h          |  6 ---
 xen/common/lz4/defs.h                         |  2 +-
 xen/common/lzo.c                              |  2 +-
 xen/common/unlzo.c                            |  2 +-
 xen/common/xz/private.h                       |  2 +-
 xen/common/zstd/mem.h                         |  2 +-
 xen/include/xen/unaligned.h                   | 53 +++++++++++--------
 xen/lib/xxhash32.c                            |  2 +-
 xen/lib/xxhash64.c                            |  2 +-
 10 files changed, 38 insertions(+), 37 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/unaligned.h

-- 
2.35.3


