Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3DF6C49F2
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 13:09:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513368.794232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexGu-0008NH-GX; Wed, 22 Mar 2023 12:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513368.794232; Wed, 22 Mar 2023 12:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexGu-0008Jv-DX; Wed, 22 Mar 2023 12:08:52 +0000
Received: by outflank-mailman (input) for mailman id 513368;
 Wed, 22 Mar 2023 12:08:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+B1I=7O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pexGs-0008Jp-67
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 12:08:50 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cf1da5d-c8aa-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 13:08:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7E71220D4C;
 Wed, 22 Mar 2023 12:08:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3C15313416;
 Wed, 22 Mar 2023 12:08:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bI48Dc/vGmT3TgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Mar 2023 12:08:47 +0000
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
X-Inumbo-ID: 4cf1da5d-c8aa-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679486927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TbUT4bS/1mAf5l0t4bx2e5I2vKmdIgrz1+HOUskmE+o=;
	b=lYn0Eo9Dj5BPojXK2vUSs4omZJ6TMUYweNllHrzRYccu0NA5yCV2982Q7NIL5/H5tlqJEF
	Sb67vEtibE0RaF6QnlfTNYpBlgw/gC1H17d+WxS1d2z1VF4mND6STf2yTOHUv88yWG3Wgw
	wwT2W71uUxfjzvUleQZ0A1785Fe6pZU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v4 0/5] tools: use xen-tools/libs.h for common definitions
Date: Wed, 22 Mar 2023 13:08:39 +0100
Message-Id: <20230322120844.19657-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some macros defined multiple times in tools. Use only
a single header file for defining those macros and drop the copies,
or use stddef.h for offsetof().

V2:
- add patch 1 (Andrew Cooper)

V3:
- address comments

V4:
- patch 1 of V3 already applied
- new patches 3-5

Juergen Gross (5):
  tools: add container_of() macro to xen-tools/common-macros.h
  tools: get rid of additional min() and max() definitions
  tools/hvmloader: remove private offsetof() definition
  tools/libfsimage: remove private offsetof() definition
  tools/libs/vchan: remove private offsetof() definition

 tools/firmware/hvmloader/util.h         | 11 ++---------
 tools/include/xen-tools/common-macros.h |  4 ++++
 tools/libfsimage/xfs/fsys_xfs.c         |  4 +---
 tools/libs/vchan/init.c                 |  8 ++------
 tools/tests/vpci/Makefile               |  2 +-
 tools/tests/vpci/emul.h                 | 22 +---------------------
 tools/tests/x86_emulator/x86-emulate.h  |  5 -----
 tools/xenstore/list.h                   |  6 ++----
 8 files changed, 13 insertions(+), 49 deletions(-)

-- 
2.35.3


