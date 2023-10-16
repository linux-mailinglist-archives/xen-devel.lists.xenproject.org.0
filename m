Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C53F67C9F78
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 08:28:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617223.959638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsH5k-0005XF-3n; Mon, 16 Oct 2023 06:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617223.959638; Mon, 16 Oct 2023 06:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsH5k-0005Uc-12; Mon, 16 Oct 2023 06:28:40 +0000
Received: by outflank-mailman (input) for mailman id 617223;
 Mon, 16 Oct 2023 06:28:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4t3W=F6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qsH5h-0005UW-UI
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 06:28:37 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c2a21cd-6bed-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 08:28:35 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1FE3D21ADB;
 Mon, 16 Oct 2023 06:28:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E1534138EF;
 Mon, 16 Oct 2023 06:28:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mYXBNRLYLGV9QQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 16 Oct 2023 06:28:34 +0000
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
X-Inumbo-ID: 3c2a21cd-6bed-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1697437715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3S4X3hdCR3jWGjnnYmala4Nsas/lYtTIdqglFRoFwTs=;
	b=BXY2UEMNMmZbcu5VmPlkaN3XoDtUO+bHshdurIZmVdRxBXthi5XMSQ+Xm8Qo3a51IwZxG7
	/bEbscpzxopICtv18k3fgreAOhWiwnV8BLH+xb7LlolAQSQV24heKvLm7CQIYqb4s0WOEZ
	XFwjdTSR/YN7oHHjFQO0ZmcQQhGV6o0=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 0/7] xen/events: do some cleanups in events_base.c
Date: Mon, 16 Oct 2023 08:28:24 +0200
Message-Id: <20231016062831.20630-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.90
X-Spamd-Result: default: False [0.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(0.00)[19.76%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

As a followup to the XSA-441 patch this series is doing a minor bug fix
and some cleanups of events_base.c (with some minor effects outside of
it).

Juergen Gross (7):
  xen/events: fix delayed eoi list handling
  xen/events: remove unused functions
  xen/events: reduce externally visible helper functions
  xen/events: remove some simple helpers from events_base.c
  xen/events: drop xen_allocate_irqs_dynamic()
  xen/events: modify internal [un]bind interfaces
  xen/events: remove some info_for_irq() calls in pirq handling

 drivers/xen/events/events_2l.c       |   8 +-
 drivers/xen/events/events_base.c     | 557 +++++++++++++--------------
 drivers/xen/events/events_internal.h |   1 -
 include/xen/events.h                 |   8 +-
 4 files changed, 276 insertions(+), 298 deletions(-)

-- 
2.35.3


