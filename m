Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ABB7F8999
	for <lists+xen-devel@lfdr.de>; Sat, 25 Nov 2023 10:23:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641065.999911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6orb-0007nN-FX; Sat, 25 Nov 2023 09:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641065.999911; Sat, 25 Nov 2023 09:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6orb-0007k2-Bj; Sat, 25 Nov 2023 09:22:11 +0000
Received: by outflank-mailman (input) for mailman id 641065;
 Sat, 25 Nov 2023 09:22:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hI3K=HG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r6orZ-0007jw-8n
 for xen-devel@lists.xenproject.org; Sat, 25 Nov 2023 09:22:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a72130f-8b74-11ee-98e2-6d05b1d4d9a1;
 Sat, 25 Nov 2023 10:22:07 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0A3261FF07;
 Sat, 25 Nov 2023 09:22:06 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id D4FCB13519;
 Sat, 25 Nov 2023 09:22:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id +awxMr28YWUheQAAn2gu4w
 (envelope-from <jgross@suse.com>); Sat, 25 Nov 2023 09:22:05 +0000
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
X-Inumbo-ID: 1a72130f-8b74-11ee-98e2-6d05b1d4d9a1
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.7-rc3
Date: Sat, 25 Nov 2023 10:22:05 +0100
Message-Id: <20231125092205.8378-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++++++++++++
X-Spam-Score: 15.00
X-Rspamd-Server: rspamd1
X-Spam-Level: ***************
X-Rspamd-Queue-Id: 0A3261FF07
X-Spam-Flag: YES
Authentication-Results: smtp-out2.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=fail (smtp-out2.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:98 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Spamd-Result: default: False [15.00 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.02)[-0.094];
	 MID_CONTAINS_FROM(1.00)[];
	 NEURAL_HAM_LONG(-0.99)[-0.994];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:106:10:150:64:167:received];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.11)[88.26%]
X-Spam: Yes

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.7a-rc3-tag

xen: branch for v6.7-rc3

It contains the following patches:

- A small cleanup patch for the Xen privcmd driver.

- A fix for the swiotlb-xen driver which was missing the advertising
  of the maximum mapping length.

- A fix for Xen on Arm for a long standing bug, which happened to occur
  only recently: a structure in percpu memory crossed a page boundary,
  which was rejected by the hypervisor.


Thanks.

Juergen

 arch/arm/xen/enlighten.c  | 3 ++-
 drivers/xen/privcmd.c     | 2 +-
 drivers/xen/swiotlb-xen.c | 1 +
 3 files changed, 4 insertions(+), 2 deletions(-)

Gustavo A. R. Silva (1):
      xen: privcmd: Replace zero-length array with flex-array member and use __counted_by

Keith Busch (1):
      swiotlb-xen: provide the "max_mapping_size" method

Stefano Stabellini (1):
      arm/xen: fix xen_vcpu_info allocation alignment

