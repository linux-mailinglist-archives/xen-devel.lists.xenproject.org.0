Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5A37DDDF3
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:01:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626145.976108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy75X-0005ek-9h; Wed, 01 Nov 2023 09:00:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626145.976108; Wed, 01 Nov 2023 09:00:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy75X-0005dU-75; Wed, 01 Nov 2023 09:00:35 +0000
Received: by outflank-mailman (input) for mailman id 626145;
 Wed, 01 Nov 2023 09:00:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy75V-0005d2-Ig
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:00:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a05d8ca-7895-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 10:00:28 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4B76821847;
 Wed,  1 Nov 2023 09:00:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1396A13460;
 Wed,  1 Nov 2023 09:00:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0BZdA6sTQmWDeQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:00:27 +0000
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
X-Inumbo-ID: 1a05d8ca-7895-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698829227; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=YzQsLmITRJfUXeZeVQgCKsJDMXDnG8wcEgTkWn0P5Nw=;
	b=sgVHMRw0sPqx0AhdUi+3Oj4zpYS39aIsGE8Sq3vHMeCS0oBCSBmurHZWrFWMewHAm51RDp
	jGiVQ08ec67Y0q3W59MauGuOvNwUvcPaq/Ob698YHbO2Ynwwg9FIn1EuQe5EPDdlvsDE2b
	nkWMWT/oMBZYpz2mFoGDg6TXPQFm7N0=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/3] Mini-OS: preparations for 9pfs in xenstore-stubdom
Date: Wed,  1 Nov 2023 10:00:21 +0100
Message-Id: <20231101090024.28934-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small patch series is doing some preparations for being able to
use 9pfs in Xenstore-stubdom.

Juergen Gross (3):
  Mini-OS: make xenstore_buf externally visible
  Mini-OS: don't crash if no shutdown node is available
  Mini-OS: fix 9pfs stat receive format

 9pfront.c        |  9 +++++----
 include/xenbus.h |  2 ++
 shutdown.c       | 12 ++++--------
 xenbus.c         |  2 +-
 4 files changed, 12 insertions(+), 13 deletions(-)

-- 
2.35.3


