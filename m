Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9624E6B97EC
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 15:28:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509661.785851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5cw-0003CX-P3; Tue, 14 Mar 2023 14:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509661.785851; Tue, 14 Mar 2023 14:27:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5cw-00039x-M7; Tue, 14 Mar 2023 14:27:46 +0000
Received: by outflank-mailman (input) for mailman id 509661;
 Tue, 14 Mar 2023 14:27:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6q5S=7G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pc5cv-00039r-TM
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 14:27:45 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62cc2b9e-c274-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 15:27:44 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 761931F895;
 Tue, 14 Mar 2023 14:27:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A70F13A26;
 Tue, 14 Mar 2023 14:27:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rbnxDGCEEGSPHQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 14 Mar 2023 14:27:44 +0000
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
X-Inumbo-ID: 62cc2b9e-c274-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678804064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=R1wW+YnArC6IHU7qwTCVnEU29JD+W5z4FpnswptM4hY=;
	b=eryhgfOvvaYw8USYF2PSt056fJlHaUHN+oyliCoh2ZzqATfy0X0EjhRh8Hn/FG6kbXPP9L
	27kLF4mS/exwNPe0FdbFY61LrT3DogzorndDft/TGe07ZxEZmqjgCp4djiZmyo+SwkQV4D
	Goz/dtdj0KwOPJaY0w+PGgTx77dD8Tw=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 0/4] xen/blkback: some cleanups
Date: Tue, 14 Mar 2023 15:27:37 +0100
Message-Id: <20230314142741.24917-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some small cleanup patches I had lying around for some time now.

Juergen Gross (4):
  xen/blkback: fix white space code style issues
  xen/blkback: remove stale prototype
  xen/blkback: simplify free_persistent_gnts() interface
  xen/blkback: move blkif_get_x86_*_req() into blkback.c

 drivers/block/xen-blkback/blkback.c | 126 +++++++++++++++++++++++++---
 drivers/block/xen-blkback/common.h  | 103 +----------------------
 2 files changed, 118 insertions(+), 111 deletions(-)

-- 
2.35.3


