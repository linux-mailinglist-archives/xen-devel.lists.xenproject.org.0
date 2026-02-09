Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GM/CAAuEiWl8+QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 07:51:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DF410C3CB
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 07:51:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1224938.1531380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpL6L-0004aw-4F; Mon, 09 Feb 2026 06:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1224938.1531380; Mon, 09 Feb 2026 06:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpL6K-0004YI-Tq; Mon, 09 Feb 2026 06:50:28 +0000
Received: by outflank-mailman (input) for mailman id 1224938;
 Mon, 09 Feb 2026 06:50:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DrmV=AN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vpL6J-0004YB-Rm
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 06:50:27 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99f29c04-0583-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 07:50:21 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1403E3E6CB;
 Mon,  9 Feb 2026 06:50:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DC20B3EA63;
 Mon,  9 Feb 2026 06:50:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ZRCUNKqDiWnRCwAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 09 Feb 2026 06:50:18 +0000
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
X-Inumbo-ID: 99f29c04-0583-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1770619820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uxIup0MaVzd1A8EqzNcp+SXDu4RkLA1hB0nzbwvx01A=;
	b=Vae7kyOzMMBmqRJ8+bFsYYRnjjluA3VVsQNrETg9JIHbO5MsN5Xe8vGGiMOHsWK+eibsED
	ErUJ9Rwvk+DoePkxFQz3I4SySwIAK6sEDA5IN7d13KRCVJgYN8lJsAmD7Mh/lDI72t2T+5
	t8keCk/I5ZssUWOEwsi5iMQgCCuWr6c=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1770619819; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uxIup0MaVzd1A8EqzNcp+SXDu4RkLA1hB0nzbwvx01A=;
	b=j7KdINpScrRloY8LTUoYyTW0M3hzzZIUbd2xdFpmLNN/zaeAY51PrYTpF3iGFw83uLQ56s
	/DkD23FKVYK/9w28CV3wa8WQnVKBTrupLCz4W42JCaARhmSO3BTLw8zFtIj8O5XaPopEty
	hQXnx2MRJtS5rQ9QSO0GkhVve9ORwjc=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v7.0-rc1
Date: Mon,  9 Feb 2026 07:50:18 +0100
Message-ID: <20260209065018.74473-1-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 94DF410C3CB
X-Rspamd-Action: no action

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.0-rc1-tag

xen: branch for v7.0-rc1

It contains the following patches:

- a simple fix for running as Xen PVH guest in 32-bit mode without PAE

- a small series fixing PV device handling for suspend/resume when
  running as a Xen guest

- a small series cleaning up workqueue usage

- a small series fixing the Xen balloon driver for PVH dom0

- a patch introducing the possibility to use hypercalls for console
  messages in unprivileged guests

- a patch enabling a Xen dom0 to use virtio devices in nested
  virtualization setups

- a simplification of the xen-mcelog driver


Thanks.

Juergen

 Documentation/admin-guide/kernel-parameters.txt |  5 +++++
 arch/x86/platform/pvh/head.S                    |  2 ++
 arch/x86/xen/enlighten.c                        |  2 +-
 drivers/tty/hvc/hvc_xen.c                       | 29 ++++++++++++++++++++-----
 drivers/xen/balloon.c                           | 26 ++++++++++++++++++----
 drivers/xen/events/events_base.c                |  6 ++---
 drivers/xen/grant-dma-ops.c                     |  3 ++-
 drivers/xen/mcelog.c                            |  4 +---
 drivers/xen/privcmd.c                           |  3 ++-
 drivers/xen/unpopulated-alloc.c                 |  3 +++
 drivers/xen/xenbus/xenbus.h                     |  6 ++---
 drivers/xen/xenbus/xenbus_probe.c               | 22 +++++++++----------
 drivers/xen/xenbus/xenbus_probe_frontend.c      | 18 +++++++--------
 include/xen/xen.h                               |  2 ++
 14 files changed, 89 insertions(+), 42 deletions(-)

Hou Wenlong (1):
      x86/xen/pvh: Enable PAE mode for 32-bit guest only when CONFIG_X86_PAE is set

Jason Andryuk (2):
      xenbus: Use .freeze/.thaw to handle xenbus devices
      xenbus: Rename helpers to freeze/thaw/restore

Marco Crivellari (2):
      xen/events: replace use of system_wq with system_percpu_wq
      xen: privcmd: WQ_PERCPU added to alloc_workqueue users

Roger Pau Monne (2):
      Partial revert "x86/xen: fix balloon target initialization for PVH dom0"
      xen/balloon: improve accuracy of initial balloon target for dom0

Stefano Stabellini (1):
      xen: introduce xen_console_io option

Teddy Astie (1):
      xen/virtio: Don't use grant-dma-ops when running as Dom0

Uros Bizjak (1):
      xen/mcelog: simplify MCE_GETCLEAR_FLAGS using xchg()

