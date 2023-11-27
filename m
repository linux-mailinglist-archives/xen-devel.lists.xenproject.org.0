Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C232C7F9D6A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:26:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641716.1000492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Yo1-0008Pn-Nn; Mon, 27 Nov 2023 10:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641716.1000492; Mon, 27 Nov 2023 10:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Yo1-0008NT-Kn; Mon, 27 Nov 2023 10:25:33 +0000
Received: by outflank-mailman (input) for mailman id 641716;
 Mon, 27 Nov 2023 10:25:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7Yo0-0008NG-Uu
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:25:32 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47f41aac-8d0f-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 11:25:29 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 95AB221A8E;
 Mon, 27 Nov 2023 10:25:25 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 6AA80132A6;
 Mon, 27 Nov 2023 10:25:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id Jw69GJVuZGV5fgAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 27 Nov 2023 10:25:25 +0000
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
X-Inumbo-ID: 47f41aac-8d0f-11ee-9b0e-b553b5be7939
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 00/32] Mini-OS: hide mini-os internal symbols
Date: Mon, 27 Nov 2023 11:24:51 +0100
Message-Id: <20231127102523.28003-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: **************************
X-Spamd-Bar: ++++++++++++++++++++++++++
Authentication-Results: smtp-out1.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=fail (smtp-out1.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:98 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [26.60 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(5.10)[100.00%];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 FROM_HAS_DN(0.00)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_SPAM_SHORT(3.00)[1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 26.60
X-Rspamd-Queue-Id: 95AB221A8E
X-Spam-Flag: NO

In order to avoid conflicts due to symbols with the same name when
linking Mini-OS with an application, hide all Mini9-OS internal symbols
from the application by linking the Mini-OS kernel individually and
then removing all symbols which should be used internally only.

Changes in V2:
- added more symbols in patch 2

Changes in V3:
- Instead of a global file with symbol names use EXPORT_SYMBOL()
  instances for each symbol. Former patch 2 is replaced with new
  patches 2-32.

Juergen Gross (32):
  Mini-OS: link kernel separately
  Mini-OS: explicitly mark symbols to be visible for apps
  Mini-OS: add EXPORT_SYMBOL() instances to kernel.c
  Mini-OS: add EXPORT_SYMBOL() instances to hypervisor.c
  Mini-OS: add EXPORT_SYMBOL() instances to sched.c
  Mini-OS: add EXPORT_SYMBOL() instances to mm.c
  Mini-OS: add EXPORT_SYMBOL() instances to lib/sys.c
  Mini-OS: add EXPORT_SYMBOL() instances to lib/string.c
  Mini-OS: add EXPORT_SYMBOL() instances to lib/math.c
  Mini-OS: add EXPORT_SYMBOL() instances to lib/printf.c
  Mini-OS: add EXPORT_SYMBOL() instances to lib/ctype.c
  Mini-OS: add EXPORT_SYMBOL() instances to lib/xmalloc.c
  Mini-OS: add EXPORT_SYMBOL() instances to lib/xs.c
  Mini-OS: add EXPORT_SYMBOL() instances to main.c
  Mini-OS: add EXPORT_SYMBOL() instances to console.c
  Mini-OS: add EXPORT_SYMBOL() instances to events.c
  Mini-OS: add EXPORT_SYMBOL() instances to gntmap.c
  Mini-OS: add EXPORT_SYMBOL() instances to gnttab.c
  Mini-OS: add EXPORT_SYMBOL() instances to ioremap.c
  Mini-OS: add EXPORT_SYMBOL() instances to lock.c
  Mini-OS: add EXPORT_SYMBOL() instances to time.c
  Mini-OS: add EXPORT_SYMBOL() instances to lwip-*.c
  Mini-OS: add EXPORT_SYMBOL() instances to 9pfront.c
  Mini-OS: add EXPORT_SYMBOL() instances to blkfront.c
  Mini-OS: add EXPORT_SYMBOL() instances to fbfront.c
  Mini-OS: add EXPORT_SYMBOL() instances to netfront.c
  Mini-OS: add EXPORT_SYMBOL() instances to pcifront.c
  Mini-OS: add EXPORT_SYMBOL() instances to tpmback.c
  Mini-OS: add EXPORT_SYMBOL() instances to tpmfront.c
  Mini-OS: add EXPORT_SYMBOL() instances to tpm_tis.c
  Mini-OS: add EXPORT_SYMBOL() instances to xenbus.c
  Mini-OS: hide all symbols not exported via EXPORT_SYMBOLS()

 .gitignore         |  1 +
 9pfront.c          |  2 +
 Makefile           | 11 ++++--
 arch/arm/mm.c      |  2 +
 arch/arm/time.c    |  1 +
 arch/x86/ioremap.c |  5 ++-
 arch/x86/mm.c      |  5 +++
 arch/x86/sched.c   |  5 +++
 arch/x86/time.c    |  2 +-
 blkfront.c         | 12 ++++--
 console.c          |  5 +++
 events.c           |  7 ++++
 fbfront.c          | 11 +++++-
 gntmap.c           |  5 +++
 gnttab.c           |  6 +++
 hypervisor.c       |  5 +++
 include/export.h   | 10 +++++
 include/lib.h      |  1 +
 kernel.c           |  5 +++
 lib/ctype.c        |  2 +
 lib/math.c         |  6 +++
 lib/printf.c       | 10 ++++-
 lib/string.c       | 18 +++++++++
 lib/sys.c          | 92 +++++++++++++++++++++++++++++++++++++++++++---
 lib/xmalloc.c      |  3 ++
 lib/xs.c           | 10 +++++
 lock.c             |  9 ++++-
 lwip-arch.c        |  9 +++++
 lwip-net.c         |  2 +-
 main.c             |  3 ++
 mm.c               |  4 ++
 netfront.c         |  7 ++++
 pcifront.c         | 11 +++++-
 sched.c            |  7 ++++
 tpm_tis.c          |  5 +++
 tpmback.c          | 11 ++++++
 tpmfront.c         |  6 +++
 xenbus.c           | 23 ++++++++++++
 38 files changed, 320 insertions(+), 19 deletions(-)
 create mode 100644 include/export.h

-- 
2.35.3


