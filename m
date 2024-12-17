Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 146CD9F4D82
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 15:22:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859209.1271336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNYSu-00042r-Vc; Tue, 17 Dec 2024 14:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859209.1271336; Tue, 17 Dec 2024 14:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNYSu-00040k-Sf; Tue, 17 Dec 2024 14:22:24 +0000
Received: by outflank-mailman (input) for mailman id 859209;
 Tue, 17 Dec 2024 14:22:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Iy1x=TK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tNYSu-00040e-5N
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 14:22:24 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54535502-bc82-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 15:22:22 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6E62A1F7A2;
 Tue, 17 Dec 2024 14:22:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0F05313AD8;
 Tue, 17 Dec 2024 14:22:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sfb+AR2JYWdUDgAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 17 Dec 2024 14:22:21 +0000
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
X-Inumbo-ID: 54535502-bc82-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1734445341; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fi8wTsJxRWGXV0c43N7Ba5cd5OL3MOOHSvf+jJIMB3Y=;
	b=QZmEm/bAg6Za7yHBCDOfBLt3xVxGFxlWn/YrsOKh2x5PLh7ySuiEfYhzovgK6rAvrXfYxl
	FIl/dhb6Sf6GPbav8zXdy+JR4LFsYhGYw0bz5igV9PiMk8hEjXCK1nHj7vLKAR/OHbaoHt
	eIFEHv0DAZkDaulkmrfsRSOLX0p5Vu0=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1734445341; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fi8wTsJxRWGXV0c43N7Ba5cd5OL3MOOHSvf+jJIMB3Y=;
	b=QZmEm/bAg6Za7yHBCDOfBLt3xVxGFxlWn/YrsOKh2x5PLh7ySuiEfYhzovgK6rAvrXfYxl
	FIl/dhb6Sf6GPbav8zXdy+JR4LFsYhGYw0bz5igV9PiMk8hEjXCK1nHj7vLKAR/OHbaoHt
	eIFEHv0DAZkDaulkmrfsRSOLX0p5Vu0=
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
Subject: [PATCH v5 0/5] remove libxenctrl usage from xenstored
Date: Tue, 17 Dec 2024 15:22:13 +0100
Message-ID: <20241217142218.24129-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

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

Changes in V5:
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
 xen/common/domain.c                    | 127 +++++++++++++++++++
 xen/common/domctl.c                    |  18 ++-
 xen/common/event_channel.c             |  25 +++-
 xen/include/public/domctl.h            |  26 ++++
 xen/include/xen/event.h                |   7 ++
 xen/include/xen/sched.h                |   5 +
 xen/include/xsm/dummy.h                |   8 ++
 xen/include/xsm/xsm.h                  |   6 +
 xen/xsm/dummy.c                        |   1 +
 xen/xsm/flask/hooks.c                  |   7 ++
 xen/xsm/flask/policy/access_vectors    |   2 +
 33 files changed, 591 insertions(+), 74 deletions(-)
 create mode 100644 tools/include/xen-barrier.h
 create mode 100644 tools/include/xenmanage.h
 create mode 100644 tools/libs/manage/Makefile
 create mode 100644 tools/libs/manage/Makefile.common
 create mode 100644 tools/libs/manage/core.c
 create mode 100644 tools/libs/manage/libxenmanage.map

-- 
2.43.0


