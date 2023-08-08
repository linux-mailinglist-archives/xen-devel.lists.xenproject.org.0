Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 296AA773A6E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:22:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579856.908017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMfH-0003lD-LE; Tue, 08 Aug 2023 13:22:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579856.908017; Tue, 08 Aug 2023 13:22:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMfH-0003ip-IY; Tue, 08 Aug 2023 13:22:23 +0000
Received: by outflank-mailman (input) for mailman id 579856;
 Tue, 08 Aug 2023 13:22:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yw+Y=DZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qTMfG-0003ij-MP
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:22:22 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b1b3759-35ee-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 15:22:21 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5733C1F854;
 Tue,  8 Aug 2023 13:22:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1DBAF139D1;
 Tue,  8 Aug 2023 13:22:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aTeDBY1B0mSEFAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 08 Aug 2023 13:22:21 +0000
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
X-Inumbo-ID: 9b1b3759-35ee-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691500941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UQ+5zBn1XAZxftfBB0XZsFZk9nESEsmFs1t+RvZXh0w=;
	b=rXseobaNJvAPZ//kgm0nIWfo1uxKnsTBKgMspqVsbiZ5VBgUKdFIOY8cKULidc4g6Zb3ax
	PKT2ispOWxv/29uearM7QoEe4e+3AooUIuICjSaxQLrIX0J3NQOZtNCNLwa2Clye28oOCb
	CINpxGFChosvVyS5zL+xCpJ4C1Ua2vk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 0/3] tools: add some more configure options
Date: Tue,  8 Aug 2023 15:22:16 +0200
Message-Id: <20230808132219.6422-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add two additional configure options for controlling the build of
pygrub and libfsimage.

Changes in V2:
- add check for --enable-pygrub --disable-libfsimage
- new patch 3

Juergen Gross (3):
  tools: add configure option for disabling pygrub
  tools: add configure option for libfsimage
  tools/xl: reject bootloader=pygrub in case pygrub is disabled

 config/Tools.mk.in  |  2 ++
 tools/Makefile      |  4 +--
 tools/config.h.in   |  3 ++
 tools/configure     | 74 +++++++++++++++++++++++++++++++++++++++++++++
 tools/configure.ac  | 26 ++++++++++++++++
 tools/xl/xl_parse.c |  9 ++++++
 6 files changed, 116 insertions(+), 2 deletions(-)

-- 
2.35.3


