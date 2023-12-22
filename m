Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C17481C52C
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 07:35:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659239.1028760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGZ6y-0006oa-ET; Fri, 22 Dec 2023 06:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659239.1028760; Fri, 22 Dec 2023 06:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGZ6y-0006mL-Bt; Fri, 22 Dec 2023 06:34:20 +0000
Received: by outflank-mailman (input) for mailman id 659239;
 Fri, 22 Dec 2023 06:34:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f8FS=IB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rGZ6x-0006mF-D2
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 06:34:19 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2143baf9-a094-11ee-9b0f-b553b5be7939;
 Fri, 22 Dec 2023 07:34:17 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 58B3421E06;
 Fri, 22 Dec 2023 06:34:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 27BCE13AB5;
 Fri, 22 Dec 2023 06:34:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4K1jCOgthWWfXQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 22 Dec 2023 06:34:16 +0000
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
X-Inumbo-ID: 2143baf9-a094-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1703226856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VFUHfu/Qkc0+Nl1x/C6KXchuZT5UUipWq5f5WbggtB4=;
	b=r/GZTsztpU2245wi7imSr6/CUYZgnh/AaTtBj8LBBfxF50AmHclKom/0QJ0bNxUBdzAucQ
	AK/7/RGeGn1qVmvrZyNkzs+Rx9dOz3NyO9HNdIKk8vlN/0CNC64Rd0D8hE/A1eI7rPs0L1
	/I+Kvch8sOGY0nzKK890R0zuOGUgk8E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1703226856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VFUHfu/Qkc0+Nl1x/C6KXchuZT5UUipWq5f5WbggtB4=;
	b=r/GZTsztpU2245wi7imSr6/CUYZgnh/AaTtBj8LBBfxF50AmHclKom/0QJ0bNxUBdzAucQ
	AK/7/RGeGn1qVmvrZyNkzs+Rx9dOz3NyO9HNdIKk8vlN/0CNC64Rd0D8hE/A1eI7rPs0L1
	/I+Kvch8sOGY0nzKK890R0zuOGUgk8E=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.7-rc7
Date: Fri, 22 Dec 2023 07:34:15 +0100
Message-Id: <20231222063415.17316-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: *****
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Bar: /
X-Spam-Flag: NO
X-Spamd-Result: default: False [0.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.59)[98.17%]
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="r/GZTszt"
X-Spam-Score: 0.10
X-Rspamd-Queue-Id: 58B3421E06

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.7a-rc7-tag

xen: branch for v6.7-rc7

It contains a single patch fixing a build issue for x86 32-bit configurations
with CONFIG_XEN, which was introduced in the 6.7 development cycle.


Thanks.

Juergen

 arch/x86/xen/Kconfig | 1 +
 1 file changed, 1 insertion(+)

Arnd Bergmann (1):
      x86/xen: add CPU dependencies for 32-bit build

