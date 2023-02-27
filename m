Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C33AF6A4175
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 13:10:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502455.774264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWcKV-0003Fe-Eo; Mon, 27 Feb 2023 12:10:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502455.774264; Mon, 27 Feb 2023 12:10:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWcKV-0003Dq-Bh; Mon, 27 Feb 2023 12:10:07 +0000
Received: by outflank-mailman (input) for mailman id 502455;
 Mon, 27 Feb 2023 12:10:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zQU0=6X=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pWcKT-00039C-Mi
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 12:10:05 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab26c7ab-b697-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 13:10:04 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4B094219F8;
 Mon, 27 Feb 2023 12:10:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F27B113912;
 Mon, 27 Feb 2023 12:10:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id q56yOZud/GO4NAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 27 Feb 2023 12:10:03 +0000
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
X-Inumbo-ID: ab26c7ab-b697-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1677499804; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=FKQ4wSkV6NqwsSD0A/qTcE4myzNk8m5bjzR93rMoRBo=;
	b=Bcax36SKxgmeziiLRFTXcamj16oGQ9+iOWFWcqcpkcwQkn4PR+YtAlZJBOLmmzQY3vgDCq
	yoH3YlNvA77/JeOg1Zz9D0syDRhhmlL6dzVNtWvRSxvIKDC+OjB3qIXdKcV9e0wqvZrJKo
	0gAGeU8NrPKqFFrejSEDmVOTwpU1WRo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 0/3] tools: use xen-tools/libs.h for common definitions
Date: Mon, 27 Feb 2023 13:09:54 +0100
Message-Id: <20230227120957.10037-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some macros defined multiple times in tools. Use only
xen-tools/libs.h for defining those macros and drop the copies.

Juergen Gross (3):
  tools: add container_of() macro to xen-tools/libs.h
  tools: get rid of additional min() and max() definitions
  tools: add offsetof() to xen-tools/libs.h

 tools/firmware/hvmloader/util.h        | 11 ++---------
 tools/firmware/include/stddef.h        |  4 ++--
 tools/include/xen-tools/libs.h         |  8 ++++++++
 tools/libfsimage/Rules.mk              |  2 ++
 tools/libfsimage/xfs/fsys_xfs.c        |  4 +---
 tools/libs/vchan/init.c                |  7 +------
 tools/tests/vhpet/emul.h               | 14 --------------
 tools/tests/vpci/emul.h                | 22 +---------------------
 tools/tests/x86_emulator/x86-emulate.h |  5 -----
 tools/xenstore/list.h                  |  6 ++----
 10 files changed, 19 insertions(+), 64 deletions(-)

-- 
2.35.3


