Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBHoGP/4q2nDigEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 07 Mar 2026 11:07:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C0F22AEF2
	for <lists+xen-devel@lfdr.de>; Sat, 07 Mar 2026 11:07:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1248498.1546495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyoYa-000292-Jd; Sat, 07 Mar 2026 10:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1248498.1546495; Sat, 07 Mar 2026 10:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyoYa-00026w-Fq; Sat, 07 Mar 2026 10:06:48 +0000
Received: by outflank-mailman (input) for mailman id 1248498;
 Sat, 07 Mar 2026 10:06:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2JRE=BH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vyoYY-00026q-67
 for xen-devel@lists.xenproject.org; Sat, 07 Mar 2026 10:06:46 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57c5fc18-1a0d-11f1-9ccf-f158ae23cfc8;
 Sat, 07 Mar 2026 11:06:43 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 05A9D5BD36;
 Sat,  7 Mar 2026 10:06:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D0DE53EA61;
 Sat,  7 Mar 2026 10:06:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UHFnMbL4q2niYAAAD6G6ig
 (envelope-from <jgross@suse.com>); Sat, 07 Mar 2026 10:06:42 +0000
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
X-Inumbo-ID: 57c5fc18-1a0d-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772878003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ktH4T/n4AWGaIdpsZn8pz8mhhflSm2yIca4kR/9/PoA=;
	b=rN2jx0JKkPIfpT0Rjv6hg1ZY0HATxO/l4WAz0hnUtdXWoXlRu/vH7rIFm/OMLeFw6lJrw2
	zOFTuu/nyrRS5LhwViM8lRf2aiRdr0G6lsjoidGdjOrWd5rXjYEV79cDCwn6eec+wDSgXl
	PcPtj3uu4Wr0JjiWVbd6DeBVtr36LG4=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772878003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ktH4T/n4AWGaIdpsZn8pz8mhhflSm2yIca4kR/9/PoA=;
	b=rN2jx0JKkPIfpT0Rjv6hg1ZY0HATxO/l4WAz0hnUtdXWoXlRu/vH7rIFm/OMLeFw6lJrw2
	zOFTuu/nyrRS5LhwViM8lRf2aiRdr0G6lsjoidGdjOrWd5rXjYEV79cDCwn6eec+wDSgXl
	PcPtj3uu4Wr0JjiWVbd6DeBVtr36LG4=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v7.0-rc3
Date: Sat,  7 Mar 2026 11:06:42 +0100
Message-ID: <20260307100642.2365128-1-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Rspamd-Queue-Id: 04C0F22AEF2
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.0-rc3-tag

xen: branch for v7.0-rc3

It contains the following changes:

- a cleanup of arch/x86/kernel/head_64.S removing the pre-built page
  tables for Xen guests

- a small comment update

- another cleanup for Xen PVH guests mode

- a 2-patch series fixing an issue with Xen PV-devices backed by driver
  domains


Thanks.

Juergen

 arch/x86/include/asm/pgtable_64.h          |  2 --
 arch/x86/kernel/head_64.S                  | 28 --------------------
 arch/x86/platform/pvh/enlighten.c          |  7 +----
 arch/x86/xen/enlighten_pv.c                |  2 +-
 arch/x86/xen/mmu_pv.c                      |  9 +++++++
 drivers/net/xen-netfront.c                 | 34 ++++++++++++------------
 drivers/pci/xen-pcifront.c                 |  8 +++---
 drivers/scsi/xen-scsifront.c               |  2 +-
 drivers/xen/xen-acpi-processor.c           |  7 ++---
 drivers/xen/xen-pciback/xenbus.c           | 10 +++----
 drivers/xen/xenbus/xenbus_client.c         | 17 +++++++++---
 drivers/xen/xenbus/xenbus_probe.c          | 42 +++++++++++++++++++++++++++---
 drivers/xen/xenbus/xenbus_probe_frontend.c |  2 +-
 include/xen/xenbus.h                       |  4 ++-
 14 files changed, 97 insertions(+), 77 deletions(-)

David Thomson (1):
      xen/acpi-processor: fix _CST detection using undersized evaluation buffer

Hou Wenlong (2):
      x86/xen: Build identity mapping page tables dynamically for XENPV
      x86/PVH: Use boot params to pass RSDP address in start_info page

Juergen Gross (2):
      xenbus: add xenbus_device parameter to xenbus_read_driver_state()
      xen/xenbus: better handle backend crash

kexinsun (1):
      x86/xen: update outdated comment

