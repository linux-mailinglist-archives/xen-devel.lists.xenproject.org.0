Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DE4B30DFF
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 07:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089483.1447029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upKN2-0004My-9j; Fri, 22 Aug 2025 05:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089483.1447029; Fri, 22 Aug 2025 05:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upKN2-0004Lu-5Y; Fri, 22 Aug 2025 05:31:24 +0000
Received: by outflank-mailman (input) for mailman id 1089483;
 Fri, 22 Aug 2025 05:31:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O20d=3C=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1upKN1-0004Ie-LE
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 05:31:23 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d3fff6b-7f19-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 07:31:22 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 038D721E3E;
 Fri, 22 Aug 2025 05:31:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B95B8139B3;
 Fri, 22 Aug 2025 05:31:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 3fotK6gAqGgxaAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 22 Aug 2025 05:31:20 +0000
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
X-Inumbo-ID: 3d3fff6b-7f19-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1755840682; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=t4yhiDG7pnnHGOYG9tLhM3AjIpjpSUErxIas3N0XuJI=;
	b=SMnpxR49bglg7Ftr94YtzbFpS+ikumwhs8a31QVXR9JNF0o0koOLWKPifkHIovXu2muxnY
	IaIaIQikXW8gDqlbMzMgJLEu6jcEvmBVzW1oF+m7YCsztmraHc4RRkyFRgbYZB7tsxPcWS
	i2SXhnfgqnz+55uUigQJuNaReR79JJE=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1755840681; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=t4yhiDG7pnnHGOYG9tLhM3AjIpjpSUErxIas3N0XuJI=;
	b=Yest83Kc32HjMHUx6dp+KZogufXEiwF3G+PR8Hh+5SvZuTqH2O98QPzmTzGqpJ/8IemS5O
	yZKgNNY2EQMoF+70QSHoIJBMzZj0sXykTlRHBFoknDndIRz4/DYYAadRJCYgqsWp/bMv48
	s+egS5cNKgcEpPjkxKxHRge+DlSZ8jM=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.17-rc3
Date: Fri, 22 Aug 2025 07:31:20 +0200
Message-ID: <20250822053120.31771-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.17-rc3-tag

xen: branch for v6.17-rc3

It contains 2 small cleanups which are both relevant only when running as
a Xen guest.


Thanks.

Juergen

 arch/x86/include/asm/xen/hypercall.h |  5 +++--
 drivers/xen/xenbus/xenbus_xs.c       | 23 -----------------------
 include/linux/compiler.h             |  8 --------
 3 files changed, 3 insertions(+), 33 deletions(-)

Jan Beulich (1):
      compiler: remove __ADDRESSABLE_ASM{_STR,}() again

Juergen Gross (1):
      drivers/xen/xenbus: remove quirk for Xen 3.x

