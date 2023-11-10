Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9AC7E7BDF
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 12:35:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630208.982888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Pme-0007lH-GF; Fri, 10 Nov 2023 11:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630208.982888; Fri, 10 Nov 2023 11:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Pme-0007jK-Bs; Fri, 10 Nov 2023 11:34:44 +0000
Received: by outflank-mailman (input) for mailman id 630208;
 Fri, 10 Nov 2023 11:34:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r1Pmc-0007he-Bp
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 11:34:42 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21a575dc-7fbd-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 12:34:39 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 130301F8BB;
 Fri, 10 Nov 2023 11:34:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D08F613398;
 Fri, 10 Nov 2023 11:34:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VxNsMU0VTmXLAwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Nov 2023 11:34:37 +0000
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
X-Inumbo-ID: 21a575dc-7fbd-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699616078; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pNCiJUWFfsXgVl/gqWvxL0l23TvdHEFvCP7wwR+J2qI=;
	b=eN8ft1jPAAiuhfi2n9Ts2bI6R26YiGMpl6PkCSZMTvrOkhf2X0Fab0fGsF2Hgbf3qofdAJ
	nX7eHUqWS5ieF26mAE3YTaGSG/g3NMwJxfgwV9YO7N8vkfG7hJLGdPQKxnMNqehVZL0NXq
	0urBbltpZzo86pvqGJHPDBLsWXCJGe0=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 0/5] Mini-OS: preparations for 9pfs in xenstore-stubdom
Date: Fri, 10 Nov 2023 12:34:30 +0100
Message-Id: <20231110113435.22609-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small patch series is doing some preparations for being able to
use 9pfs in Xenstore-stubdom.

Changes in V2:
- added patches 2 and 5

Juergen Gross (5):
  Mini-OS: make xenstore_buf externally visible
  Mini-OS: get own domid
  Mini-OS: don't crash if no shutdown node is available
  Mini-OS: fix 9pfs stat receive format
  Mini-OS: fix 9pfs response receiving

 9pfront.c        | 13 ++++++++-----
 events.c         | 32 ++++++++++++++++++++++++++++++++
 include/events.h |  2 ++
 include/xenbus.h |  2 ++
 shutdown.c       | 12 ++++--------
 xenbus.c         |  2 +-
 6 files changed, 49 insertions(+), 14 deletions(-)

-- 
2.35.3


