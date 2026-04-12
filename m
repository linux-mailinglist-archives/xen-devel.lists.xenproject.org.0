Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mC4MKGI622kz+ggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 12 Apr 2026 08:23:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 473E63E2EB7
	for <lists+xen-devel@lfdr.de>; Sun, 12 Apr 2026 08:23:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1280512.1564005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBoCr-0003yS-4T; Sun, 12 Apr 2026 06:22:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1280512.1564005; Sun, 12 Apr 2026 06:22:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBoCq-0003vS-Ta; Sun, 12 Apr 2026 06:22:04 +0000
Received: by outflank-mailman (input) for mailman id 1280512;
 Sun, 12 Apr 2026 06:22:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wBoCq-0003vM-9j
 for xen-devel@lists.xenproject.org; Sun, 12 Apr 2026 06:22:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBoCp-00H2YG-HR
 for xen-devel@lists.xenproject.org; Sun, 12 Apr 2026 08:22:03 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69db39ee-2eae-0a2a0a5409dd-0a2a450299e6-16
 for <xen-devel@lists.xenproject.org>; Sun, 12 Apr 2026 08:22:03 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jgross@suse.com>)
 id 69db3a0b-42fa-0a2a45020019-c387df82dfe2-3
 for <xen-devel@lists.xenproject.org>; Sun, 12 Apr 2026 08:22:03 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BDE4E6A844;
 Sun, 12 Apr 2026 06:22:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 971B24A79F;
 Sun, 12 Apr 2026 06:22:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id H0lPIwo622lXRwAAD6G6ig
 (envelope-from <jgross@suse.com>); Sun, 12 Apr 2026 06:22:02 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1775974922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=H4/EmGHaKtwX8U/Zwd5I44YWhwveUA/5hxSsrtYHhwM=;
	b=pgVKMgQchlrVfbdt6+ZXr36GRlWGA7G5oY5VHCXndLbIXYN93gfDVzJMdEIdEtVQ3gXG07
	ZAJdIsSkcdde63Z6vHPeF8hYi3ngUtALhKadkLfEyK4L/3/rdLYKT+P9zZVZ7DNj+6KKeV
	napuqvs3RZiBuoY04CLnHGmY02Ml3kg=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1775974922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=H4/EmGHaKtwX8U/Zwd5I44YWhwveUA/5hxSsrtYHhwM=;
	b=pgVKMgQchlrVfbdt6+ZXr36GRlWGA7G5oY5VHCXndLbIXYN93gfDVzJMdEIdEtVQ3gXG07
	ZAJdIsSkcdde63Z6vHPeF8hYi3ngUtALhKadkLfEyK4L/3/rdLYKT+P9zZVZ7DNj+6KKeV
	napuqvs3RZiBuoY04CLnHGmY02Ml3kg=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v7.1-rc1
Date: Sun, 12 Apr 2026 08:22:02 +0200
Message-ID: <20260412062202.627248-1-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-purgate-ID: tlsNG-720697/1775974923-47F29CD1-04F8C777/0/0
X-purgate-type: clean
X-purgate-size: 1427
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 473E63E2EB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.1-rc1-tag

xen: branch for v7.1-rc1

It contains:

- a fix of an error path in drivers/xen/manage.c
- a fix for the Xen console driver solving a boot hangup when the
  console backend isn't yet running
- a comment fix in the Xen swiotlb driver
- a hardening patch for Xen on Arm adding a more thorough validation
- a cleanup of the Xen grant table code hiding suspend/resume code for
  the case if CONFIG_HIBERNATE_CALLBACKS isn't defined

Thanks.

Juergen

 arch/arm/xen/enlighten.c           | 10 ++++++----
 drivers/tty/hvc/hvc_xen.c          |  3 +++
 drivers/xen/grant-table.c          |  3 ++-
 drivers/xen/manage.c               | 20 +++++++++++++++++---
 drivers/xen/swiotlb-xen.c          |  2 +-
 include/xen/grant_table.h          | 12 ++++++++++++
 include/xen/interface/io/console.h | 13 +++++++++++++
 7 files changed, 54 insertions(+), 9 deletions(-)

GuoHan Zhao (1):
      xen/manage: unwind partial shutdown watcher setup on error

Jason Andryuk (1):
      hvc/xen: Check console connection flag

Kexin Sun (1):
      xen/swiotlb: fix stale reference to swiotlb_unmap_page()

Pengpeng Hou (2):
      ARM: xen: validate hypervisor compatible before parsing its version
      xen/grant-table: guard gnttab_suspend/resume with CONFIG_HIBERNATE_CALLBACKS

