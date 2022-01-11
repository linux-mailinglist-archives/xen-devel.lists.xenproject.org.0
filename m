Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2653548B1E4
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 17:19:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255955.438952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Jr0-0002hg-8z; Tue, 11 Jan 2022 16:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255955.438952; Tue, 11 Jan 2022 16:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Jr0-0002cu-3w; Tue, 11 Jan 2022 16:18:34 +0000
Received: by outflank-mailman (input) for mailman id 255955;
 Tue, 11 Jan 2022 16:18:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7Jqy-0002Xe-Ty
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 16:18:32 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d418c98-72fa-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 17:18:30 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C66631F3B8;
 Tue, 11 Jan 2022 16:18:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 97FC713AF0;
 Tue, 11 Jan 2022 16:18:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 14vSI9Wt3WHnKgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 11 Jan 2022 16:18:29 +0000
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
X-Inumbo-ID: 1d418c98-72fa-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641917909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Z8zl9pmR2oXaoRrVITtJfZTtu2lKhA2i7qZp2ikx5bg=;
	b=mDA0LQduQJccu0QlFBaS6etHb107qF+kiG7ht1UGiRX0LEPBDBCyuJdCWhFAMjbYuNYve+
	KBwNW5Ar3QRcC3m2+9VPoRddiM2a3mpAsCYPGKkgLpwoTe+jogjirvMmGjXzc8hPPKEdXN
	0mo0wp/hWyTQIwuuCr4PVNQtYptURA0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 0/2] tools/libs: final cleanup making mini-os callbacks static
Date: Tue, 11 Jan 2022 17:18:25 +0100
Message-Id: <20220111161827.8982-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a final patch series making the callbacks static now referenced
by the file_ops vector only.

Note that this series depends on the related Mini-OS series to have
gone in:

https://lists.xen.org/archives/html/xen-devel/2022-01/threads.html#00369

Juergen Gross (2):
  tools/libs/evtchn: make mini-os specific callback static
  tools/libs/gnttab: make mini-os specific callback static

 tools/libs/evtchn/minios.c | 4 +---
 tools/libs/gnttab/minios.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

-- 
2.26.2


