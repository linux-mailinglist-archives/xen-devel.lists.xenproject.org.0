Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF21858293
	for <lists+xen-devel@lfdr.de>; Fri, 16 Feb 2024 17:32:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682279.1061383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rb17p-0000GU-Qo; Fri, 16 Feb 2024 16:31:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682279.1061383; Fri, 16 Feb 2024 16:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rb17p-0000EG-Nr; Fri, 16 Feb 2024 16:31:45 +0000
Received: by outflank-mailman (input) for mailman id 682279;
 Fri, 16 Feb 2024 16:31:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LzRM=JZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rb17o-0000EA-RB
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2024 16:31:44 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddff5890-cce8-11ee-98f5-efadbce2ee36;
 Fri, 16 Feb 2024 17:31:42 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9FC611FB7A;
 Fri, 16 Feb 2024 16:31:41 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C20613343;
 Fri, 16 Feb 2024 16:31:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id nAP0FO2Nz2U4VAAAn2gu4w
 (envelope-from <jgross@suse.com>); Fri, 16 Feb 2024 16:31:41 +0000
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
X-Inumbo-ID: ddff5890-cce8-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1708101101; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=44RbCMtlPx/YsHv8XPhvBu4VsidyaCEOqPGz709Iy7s=;
	b=Ie9I96rP5aIR/69VSDeNJzLbBtwMSr/sjWSDBJNs4QixMmSoqNPXYvSJh/543NdMxQb6Gv
	mYsp+u8s1e4C8+0QPRls6E9zQcknA8hMgiWfrFcdf07K9Mm3tMCJfo/+vmEl+p9qZubiur
	aWJPdxIGs0kI8AQHRVTkCK1kxNtw76E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1708101101; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=44RbCMtlPx/YsHv8XPhvBu4VsidyaCEOqPGz709Iy7s=;
	b=Ie9I96rP5aIR/69VSDeNJzLbBtwMSr/sjWSDBJNs4QixMmSoqNPXYvSJh/543NdMxQb6Gv
	mYsp+u8s1e4C8+0QPRls6E9zQcknA8hMgiWfrFcdf07K9Mm3tMCJfo/+vmEl+p9qZubiur
	aWJPdxIGs0kI8AQHRVTkCK1kxNtw76E=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v8 0/8] tools: enable xenstore-stubdom to use 9pfs
Date: Fri, 16 Feb 2024 17:31:31 +0100
Message-Id: <20240216163139.9093-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.70
X-Spamd-Result: default: False [0.70 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[suse.com,citrix.com,gmail.com,xen.org,ens-lyon.org];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

This series is adding 9pfs support to Xenstore-stubdom, enabling it
to do logging to a dom0 directory.

This is a prerequisite for the final goal to add live update support
to Xenstore-stubdom, as it enables the stubdom to store its state in
a dom0 file.

Reposting the rest series.

Changes in V8:
- patches 1-13 of V7 have been applied

Changes in V7:
- fixed V6 bugs

Changes in V6:
- patch 1 of V5 has been applied
- rebase
- addressed comments

Changes in V5:
- 10 patches have been applied already
- rename source directory to tools/9pfsd
- addressed comments

Changes in V4:
- patch 2 of V3 was applied
- added support of reading directories
- addressed review comments

Changes in V3:
- new patches 1, 23-25
- addressed review comments

Changes in V2:
- support of multiple rings per device
- xenlogd->xen-9pfsd rename
- addressed review comments
- fixed some bugs

Juergen Gross (8):
  tools/libs/light: add backend type for 9pfs PV devices
  tools/xl: support new 9pfs backend xen_9pfsd
  stubdom: extend xenstore stubdom configs
  tools: add 9pfs device to xenstore-stubdom
  tools/xenstored: mount 9pfs device in stubdom
  tools/xenstored: add helpers for filename handling
  tools/xenstored: support complete log capabilities in stubdom
  tools/xenstored: have a single do_control_memreport()

 docs/man/xl.cfg.5.pod.in                      |  36 +++-
 stubdom/xenstore-minios.cfg                   |   2 +-
 stubdom/xenstorepvh-minios.cfg                |   2 +-
 tools/golang/xenlight/helpers.gen.go          |  10 +
 tools/golang/xenlight/types.gen.go            |  12 ++
 tools/helpers/init-xenstore-domain.c          |   7 +
 .../Linux/init.d/sysconfig.xencommons.in      |   1 -
 tools/hotplug/Linux/launch-xenstore.in        |   1 +
 tools/include/libxl.h                         |  22 ++
 tools/libs/light/libxl_9pfs.c                 | 191 +++++++++++++++++-
 tools/libs/light/libxl_create.c               |   4 +-
 tools/libs/light/libxl_dm.c                   |   2 +-
 tools/libs/light/libxl_types.idl              |  11 +
 tools/libs/light/libxl_types_internal.idl     |   1 +
 tools/xenstored/control.c                     |  29 +--
 tools/xenstored/core.c                        |  15 +-
 tools/xenstored/core.h                        |  11 +-
 tools/xenstored/domain.c                      |   2 +
 tools/xenstored/lu_daemon.c                   |   4 +-
 tools/xenstored/minios.c                      |  62 ++++++
 tools/xenstored/posix.c                       |   8 +-
 tools/xl/xl_parse.c                           |  23 ++-
 22 files changed, 414 insertions(+), 42 deletions(-)

-- 
2.35.3


