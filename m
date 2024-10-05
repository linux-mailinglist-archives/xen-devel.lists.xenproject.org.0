Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 088949917A6
	for <lists+xen-devel@lfdr.de>; Sat,  5 Oct 2024 17:16:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810956.1223633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sx6Vh-0006GF-4B; Sat, 05 Oct 2024 15:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810956.1223633; Sat, 05 Oct 2024 15:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sx6Vh-0006ED-1c; Sat, 05 Oct 2024 15:15:57 +0000
Received: by outflank-mailman (input) for mailman id 810956;
 Sat, 05 Oct 2024 15:15:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=edRR=RB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sx6Vf-0006E7-Jc
 for xen-devel@lists.xenproject.org; Sat, 05 Oct 2024 15:15:55 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b64c6aa9-832c-11ef-99a2-01e77a169b0f;
 Sat, 05 Oct 2024 17:15:53 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C02EF1FBAE;
 Sat,  5 Oct 2024 15:15:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A0AD13A8F;
 Sat,  5 Oct 2024 15:15:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QPnXFyhYAWfgCAAAD6G6ig
 (envelope-from <jgross@suse.com>); Sat, 05 Oct 2024 15:15:52 +0000
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
X-Inumbo-ID: b64c6aa9-832c-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728141352; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=O0I7WB/+l4rbymuIgcW/XxebwwdHJGWCav0ZJGUC7gQ=;
	b=qN+BHGEcPbJqyz+aLIUMtiXrGHjnUudPrIdh5DZrnqFFd33Bok1+/Vkc1fXlHYp1ImqjsR
	lcSSmhHMZg6QBLgnTHPkTh/qhnF1rMLJ2cTzl3fxysSs1i/8Sa6wjhwki/IAejb3FyocIa
	M861w1f45hBzmppCgX0q7DkSpCyZYO0=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728141352; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=O0I7WB/+l4rbymuIgcW/XxebwwdHJGWCav0ZJGUC7gQ=;
	b=qN+BHGEcPbJqyz+aLIUMtiXrGHjnUudPrIdh5DZrnqFFd33Bok1+/Vkc1fXlHYp1ImqjsR
	lcSSmhHMZg6QBLgnTHPkTh/qhnF1rMLJ2cTzl3fxysSs1i/8Sa6wjhwki/IAejb3FyocIa
	M861w1f45hBzmppCgX0q7DkSpCyZYO0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 0/4] stubdom: prepare more fine grained Xen library usage
Date: Sat,  5 Oct 2024 17:15:44 +0200
Message-ID: <20241005151548.29184-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -0.27
X-Spamd-Result: default: False [-0.27 / 50.00];
	BAYES_HAM(-1.97)[94.87%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_CC(0.00)[suse.com,citrix.com,xen.org,kernel.org,ens-lyon.org,tycho.nsa.gov,gmail.com,vates.tech];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 

Prepare the build system of stubdoms to allow a more fine grained
Xen library usage per stubdom (today its all or none).

This is a first step to set the stage for related Mini-OS changes
which are required to have stubdoms using e.g. only stable Xen
libraries.

Juergen Gross (4):
  stubdom: add local .gitignore file
  stubdom: explcitly add libc and lwip Mini-OS config options
  build: move xenlibs-dependencies make definition to uselibs.mk
  stubdom: add fine grained library config items to Mini-OS configs

 .gitignore                     | 37 +------------------------
 stubdom/.gitignore             | 37 +++++++++++++++++++++++++
 stubdom/Makefile               | 49 +++++++++++++++++++++++++---------
 stubdom/c/minios.cfg           |  2 ++
 stubdom/grub/minios.cfg        |  3 ++-
 stubdom/ioemu-minios.cfg       |  2 ++
 stubdom/vtpm/minios.cfg        |  3 ++-
 stubdom/vtpmmgr/minios.cfg     |  3 ++-
 stubdom/xenstore-minios.cfg    |  1 +
 stubdom/xenstorepvh-minios.cfg |  1 +
 tools/Rules.mk                 |  7 -----
 tools/libs/uselibs.mk          |  7 +++++
 12 files changed, 94 insertions(+), 58 deletions(-)
 create mode 100644 stubdom/.gitignore

-- 
2.43.0


