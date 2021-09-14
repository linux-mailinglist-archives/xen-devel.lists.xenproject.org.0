Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B6940ADD7
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 14:36:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186541.335276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ7fS-00072U-AP; Tue, 14 Sep 2021 12:36:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186541.335276; Tue, 14 Sep 2021 12:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ7fS-00070S-7H; Tue, 14 Sep 2021 12:36:06 +0000
Received: by outflank-mailman (input) for mailman id 186541;
 Tue, 14 Sep 2021 12:36:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8exS=OE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mQ7fQ-00070M-JX
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 12:36:04 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1bcbe46a-b677-481e-ace2-8554af700768;
 Tue, 14 Sep 2021 12:36:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D74BB220BC;
 Tue, 14 Sep 2021 12:36:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6A4FB13342;
 Tue, 14 Sep 2021 12:36:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id n0JYGDKXQGE7MAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 14 Sep 2021 12:36:02 +0000
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
X-Inumbo-ID: 1bcbe46a-b677-481e-ace2-8554af700768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631622962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=M1dIWQCkg38Q5PQjLGTJ1A9BSt19LN0OahLQLwcJiqc=;
	b=EIZG1R3W/2cd0m/AJaopGED7B2/odtslsTU+XcJg1pDVocGqA8FYZjlCx7jnOOOD7lVDAR
	PuSZWDud5jubQVJm6SsF1GcehcxMqxGuREzWuBiy2guLGacfCPQ03iV1FjEYoL4IKEO9V2
	D0DLuJP81RAXpV91a3pxeiXHxUQ5CzI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH RFC 0/4] remove libxenctrl usage from xenstored
Date: Tue, 14 Sep 2021 14:35:56 +0200
Message-Id: <20210914123600.1626-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xenstored is using libxenctrl for only one purpose: to get information
about state of domains.

This RFC patch series is removing that dependency by introducing a new
stable interface which can be used by xenstored instead.

I have chosen to add a new hypercall with sub-commands. This can be
changed, of course, but I thought this would be a good step towards
stable control interfaces for the Xen tools.

I have done only very little testing (basically normal domain creation
and deletion). In case my approach is being accepted I'll do a more
thorough test.

What is missing right now is some cleanup (e.g. the need to allow
the dominfo operation of the domctl hypercall for a stubdom based
Xenstore could be removed). For Mini-OS some more work is needed to
remove the dependency to libxenctrl for xenstore-stubdom, as Mini-OS
can't be configured to use libxenevent and libxengnttab, but not
libxenctrl today. Again, I'll do that cleanup in case the series is
generally accepted.

Juergen Gross (4):
  xen: add a domain unique id to each domain
  xen: add bitmap to indicate per-domain state changes
  xen: add new stable control hypercall
  tools/xenstore: use new stable interface instead of libxenctrl

 tools/flask/policy/modules/dom0.te  |   2 +-
 tools/xenstore/Makefile             |   3 +-
 tools/xenstore/xenstored_control.c  |  14 +-
 tools/xenstore/xenstored_domain.c   | 219 +++++++++++++++-------------
 xen/arch/arm/traps.c                |   1 +
 xen/arch/x86/hvm/hypercall.c        |   1 +
 xen/arch/x86/hypercall.c            |   1 +
 xen/arch/x86/pv/hypercall.c         |   1 +
 xen/common/Makefile                 |   1 +
 xen/common/control.c                |  52 +++++++
 xen/common/domain.c                 |  76 ++++++++++
 xen/common/event_channel.c          |  11 +-
 xen/include/Makefile                |   1 +
 xen/include/public/control.h        |  80 ++++++++++
 xen/include/public/xen.h            |   1 +
 xen/include/xen/event.h             |   6 +
 xen/include/xen/hypercall.h         |   5 +
 xen/include/xen/sched.h             |   7 +
 xen/include/xsm/dummy.h             |  14 ++
 xen/include/xsm/xsm.h               |   6 +
 xen/xsm/dummy.c                     |   1 +
 xen/xsm/flask/hooks.c               |   6 +
 xen/xsm/flask/policy/access_vectors |   2 +
 23 files changed, 402 insertions(+), 109 deletions(-)
 create mode 100644 xen/common/control.c
 create mode 100644 xen/include/public/control.h

-- 
2.26.2


