Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC664875A6
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jan 2022 11:36:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254337.436081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5mb9-0001Qu-Fw; Fri, 07 Jan 2022 10:35:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254337.436081; Fri, 07 Jan 2022 10:35:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5mb9-0001O2-CV; Fri, 07 Jan 2022 10:35:51 +0000
Received: by outflank-mailman (input) for mailman id 254337;
 Fri, 07 Jan 2022 10:35:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kqIQ=RX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n5mb8-0001Nl-3b
 for xen-devel@lists.xenproject.org; Fri, 07 Jan 2022 10:35:50 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93020f0e-6fa5-11ec-9ce5-af14b9085ebd;
 Fri, 07 Jan 2022 11:35:49 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6FD3C21126;
 Fri,  7 Jan 2022 10:35:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4AC8713CCC;
 Fri,  7 Jan 2022 10:35:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iv/vEIIX2GHvCwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 07 Jan 2022 10:35:46 +0000
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
X-Inumbo-ID: 93020f0e-6fa5-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641551746; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=whWas9y32BNfS/qd76E6KV1KI5cIaJWycHQDwpknfXA=;
	b=NATGd/cjLzYIY/sgSbNQEmxG64KHHvhs0q9h4XMghY0LgpbS2YSxOckyFmYbCrwk46zoMY
	c1wCUAwDju9XQccioTCeCovWc4Bj2q+IWu/dNhaWBi4SGm74IudEnKtfnpPc192uN/UwNF
	bf/gb2EaD3z8ZtI2Q8YLjbtFy5+0KdA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 0/2] tools/libs: decouple more from mini-os
Date: Fri,  7 Jan 2022 11:35:42 +0100
Message-Id: <20220107103544.9271-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series removes some hard coupling of the Xen build with some
Mini-OS internals, especially the struct file layout and the internal
organization of the file handling.

This series depends on the Mini-OS series posted recently:

https://lists.xen.org/archives/html/xen-devel/2022-01/threads.html#00110

The main idea is to no longer have Xen library specific structures
inside struct file, or to let struct file layout depend on the
configuration of Mini-OS.

All Xen libraries needing a hook in struct file should use the now
available generic dev pointer and allocate the needed data dynamically.

Additionally Xen libraries should get the pointer of struct file via
the new get_file_from_fd() function instead of accessing directly the
files[] array, which might go away in future (e.g. in order to support
dynamic allocation of struct file as needed).

Juergen Gross (2):
  tools/libs/evtchn: decouple more from mini-os
  tools/libs/gnttab: decouple more from mini-os

 tools/libs/evtchn/minios.c | 82 +++++++++++++++++++++++++++-----------
 tools/libs/gnttab/minios.c | 48 +++++++++++++++-------
 2 files changed, 91 insertions(+), 39 deletions(-)

-- 
2.26.2


