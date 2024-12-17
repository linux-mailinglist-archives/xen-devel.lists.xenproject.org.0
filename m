Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B47A69F49A4
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 12:13:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858773.1271018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNVVV-0003QD-Nr; Tue, 17 Dec 2024 11:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858773.1271018; Tue, 17 Dec 2024 11:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNVVV-0003Nr-K7; Tue, 17 Dec 2024 11:12:53 +0000
Received: by outflank-mailman (input) for mailman id 858773;
 Tue, 17 Dec 2024 11:12:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Iy1x=TK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tNVVU-0002wn-4y
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 11:12:52 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da6e2e16-bc67-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 12:12:50 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DB61C1F385;
 Tue, 17 Dec 2024 11:12:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 84476132EA;
 Tue, 17 Dec 2024 11:12:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +XbCHrFcYWfxUAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 17 Dec 2024 11:12:49 +0000
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
X-Inumbo-ID: da6e2e16-bc67-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1734433970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Y2BwafB5l2UJcF5zJtaItYQyp8yHOBEocvm//FyVYBs=;
	b=J+ynfYUZ6yNs8pTdWUPCPEvBTdY73iTSA7H7kozkJg6WGowjjPfFQw4CMZtLk9cE+COgmi
	HTRm7fKeI1O3sBI2zTygwb5TBncN5hx0P5eDapd75XYy7aI1oV27FGyGFApbGdhG1RqVIJ
	4NnB6YXMEBTVRnv5pToqmO02bbzTLu4=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=AGT30IwU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1734433969; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Y2BwafB5l2UJcF5zJtaItYQyp8yHOBEocvm//FyVYBs=;
	b=AGT30IwUj+XpdkiBk5iNm1Fcl+cGsl+ETnlZh9qDWj9fGAHIYMBXfzQcRubd951PeWX+Rt
	KPPhTkVPrkgQ7oY7fkSkjgCHPGxZhkgT267K1mLrEejVWLTiwGj2RPs1Y3DfPTCxLXG6cd
	zB3CWvhARs3cRbpB3vcRZtwFzlm6sT0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v4 0/5] remove libxenctrl usage from xenstored
Date: Tue, 17 Dec 2024 12:12:42 +0100
Message-ID: <20241217111247.2204-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DB61C1F385
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:dkim];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Xenstored is using libxenctrl for only one purpose: to get information
about state of domains.

This patch series is removing that dependency by introducing a new
stable interface which can be used by xenstored instead.

There was a RFC series sent out 3 years ago, which I have taken as a
base and by addressing all comments from back then.

The main differences since that RFC series are:

- Instead of introducing an new main hypercall for a stable management
  interface I have just added a new domctl sub-op, as requested in 2021.

- I have added a new library libxenmanage for easy use of the new
  stable hypervisor interface. Main motivation for adding the library
  was the recent attempt to decouple oxenstored from the Xen git tree.
  By using the new library, oxenstored could benefit in the same way as
  xenstored from the new interface: it would be possible to rely on
  stable libraries only.

- Mini-OS has gained some more config options recently, so it was rather
  easy to make xenstore[pvh]-stubdom independent from libxenctrl, too.

- By moving the CPU barrier definitions out of xenctrl.h into a new
  dedicated header xenstored code no longer needs to #include xenctrl.h,
  thus removing any xenctrl reference from xenstored code.

Please note that the last patch can be committed only after the related
Mini-OS patch "config: add support for libxenmanage" has gone in AND
the Mini-OS commit-id has been updated in Config.mk accordingly! The
Mini-OS patch has been Acked already, so it can go in as soon as patch
4 of this series (the one introducing libxenmanage) has been committed.

Changes in V2:
- new patch 1
- former patch 5 mover earlier, now patch 2 (can go in without the rest
  of the series)
- addressed comments

Changes in V3:
- addressed comments

Changes in V4:
- patches 1 and 3 of V3 dropped, as already committed
- addressed comments

Juergen Gross (5):
  tools: add a dedicated header file for barrier definitions
  xen: add bitmap to indicate per-domain state changes
  xen: add new domctl get_changed_domain
  tools/libs: add a new libxenmanage library
  tools/xenstored: use new stable interface instead of libxenctrl

 stubdom/Makefile                       |   8 +-
 stubdom/mini-os.mk                     |   1 +
 tools/9pfsd/io.c                       |   5 +-
 tools/flask/policy/modules/dom0.te     |   2 +-
 tools/flask/policy/modules/xen.if      |   4 +-
 tools/flask/policy/modules/xenstore.te |   1 +
 tools/include/xen-barrier.h            |  39 ++++++
 tools/include/xenctrl.h                |  28 +----
 tools/include/xenmanage.h              |  92 ++++++++++++++
 tools/libs/Makefile                    |   1 +
 tools/libs/ctrl/Makefile               |   2 +-
 tools/libs/manage/Makefile             |  10 ++
 tools/libs/manage/Makefile.common      |   3 +
 tools/libs/manage/core.c               | 168 +++++++++++++++++++++++++
 tools/libs/manage/libxenmanage.map     |   8 ++
 tools/libs/uselibs.mk                  |   2 +
 tools/xenstored/Makefile               |   2 +-
 tools/xenstored/Makefile.common        |   2 +-
 tools/xenstored/core.h                 |   1 -
 tools/xenstored/domain.c               |  52 +++-----
 tools/xenstored/lu.c                   |   1 +
 tools/xenstored/lu_daemon.c            |   1 +
 xen/common/domain.c                    | 130 +++++++++++++++++++
 xen/common/domctl.c                    |  18 ++-
 xen/common/event_channel.c             |  26 +++-
 xen/include/public/domctl.h            |  26 ++++
 xen/include/xen/event.h                |   7 ++
 xen/include/xen/sched.h                |   5 +
 xen/include/xsm/dummy.h                |   8 ++
 xen/include/xsm/xsm.h                  |   6 +
 xen/xsm/dummy.c                        |   1 +
 xen/xsm/flask/hooks.c                  |   7 ++
 xen/xsm/flask/policy/access_vectors    |   2 +
 33 files changed, 595 insertions(+), 74 deletions(-)
 create mode 100644 tools/include/xen-barrier.h
 create mode 100644 tools/include/xenmanage.h
 create mode 100644 tools/libs/manage/Makefile
 create mode 100644 tools/libs/manage/Makefile.common
 create mode 100644 tools/libs/manage/core.c
 create mode 100644 tools/libs/manage/libxenmanage.map

-- 
2.43.0


