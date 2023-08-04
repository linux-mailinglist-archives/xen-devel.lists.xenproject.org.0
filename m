Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C9976F9C3
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 08:00:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576831.903417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRnrB-0003oJ-Pg; Fri, 04 Aug 2023 06:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576831.903417; Fri, 04 Aug 2023 06:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRnrB-0003k0-M9; Fri, 04 Aug 2023 06:00:13 +0000
Received: by outflank-mailman (input) for mailman id 576831;
 Fri, 04 Aug 2023 06:00:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Hv6=DV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qRnr1-0003E0-QN
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 06:00:03 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2722b34f-328c-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 08:00:03 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8E3CC2186B;
 Fri,  4 Aug 2023 06:00:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 52AE4133B5;
 Fri,  4 Aug 2023 06:00:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YNUZEuKTzGRbMQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 04 Aug 2023 06:00:02 +0000
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
X-Inumbo-ID: 2722b34f-328c-11ee-b26a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691128802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=H9woQQMc1BuLVL77pkVFJCk3edz6PGqB1F1anOaKa7M=;
	b=mgtytCg4Ea9KWviQrhfXSYbhCqk3gPGhKKydVEWMNNFUCK1gS9cP6QEgrgaCY758DMcmJ2
	uZzgxAXEXDNRas7ImAG56Qbz6GY+XRjDfmqyJNn/IpmA+XjirHc4E9VQeCCJ3u1L3jYSEH
	KIX5yYa31sgOXawpgO0l8nKXY63x0yY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 0/2] tools: add some more configure options
Date: Fri,  4 Aug 2023 07:59:58 +0200
Message-Id: <20230804060000.27710-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add two additional configure options for controlling the build of
pygrub and libfsimage.

Juergen Gross (2):
  tools: add configure option for disabling pygrub
  tools: add configure option for libfsimage

 config/Tools.mk.in |  2 ++
 tools/Makefile     |  4 ++--
 tools/configure    | 54 ++++++++++++++++++++++++++++++++++++++++++++++
 tools/configure.ac | 14 ++++++++++++
 4 files changed, 72 insertions(+), 2 deletions(-)

-- 
2.35.3


