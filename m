Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF99448B03E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 16:03:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255793.438529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7IgG-0001Xm-7K; Tue, 11 Jan 2022 15:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255793.438529; Tue, 11 Jan 2022 15:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7IgG-0001TY-2x; Tue, 11 Jan 2022 15:03:24 +0000
Received: by outflank-mailman (input) for mailman id 255793;
 Tue, 11 Jan 2022 15:03:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7IgE-0001Pm-Jo
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 15:03:22 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9da82cf0-72ef-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 16:03:21 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C863F210F5;
 Tue, 11 Jan 2022 15:03:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A05E913DDD;
 Tue, 11 Jan 2022 15:03:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id x9OlJTic3WFCfQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 11 Jan 2022 15:03:20 +0000
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
X-Inumbo-ID: 9da82cf0-72ef-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641913400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PugA/ZrY2PwDBZ15ZxoHE6cWNTMMPUso+Y1C8spYrnw=;
	b=vIJlpdhYdabY5hYLq5Acxp4ANIZE6Hpl+LYywFz4dvviU7uwjvAqXMDbWv242WZXwQDBei
	JqqoxcM7j4bhCSLEb/FHKqP1fDS/1Cn6SR4IrIL+vmImbq1BBAeyoK8uKxIVZM4eOML0iB
	aFaq/HzHZIAvLTo+EKW55d1qJlTx4DY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 0/3] tools/libs: decouple more from mini-os
Date: Tue, 11 Jan 2022 16:03:15 +0100
Message-Id: <20220111150318.22570-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series removes some hard coupling of the Xen build with some
Mini-OS internals, especially the struct file layout and the internal
organization of the file handling.

This series depends on the Mini-OS series posted recently:

https://lists.xen.org/archives/html/xen-devel/2022-01/threads.html#00347

The main idea is to no longer have Xen library specific structures
inside struct file, or to let struct file layout depend on the
configuration of Mini-OS.

All Xen libraries needing a hook in struct file should use the now
available generic dev pointer and allocate the needed data dynamically.

Additionally Xen libraries should get the pointer of struct file via
the new get_file_from_fd() function instead of accessing directly the
files[] array, which might go away in future (e.g. in order to support
dynamic allocation of struct file as needed).

Via using alloc_file_type() the libs provide a function vector in
order to enable Mini9-OS to remove the dedicated callbacks into the
libs via known function names and replacing them to use the new
vector.

Changes in V2:
- comments addressed
- add using alloc_file_type()
- new patch 3

Juergen Gross (3):
  tools/libs/evtchn: decouple more from mini-os
  tools/libs/gnttab: decouple more from mini-os
  tools/libs/ctrl: remove file related handling

 tools/libs/ctrl/xc_minios.c |   9 ---
 tools/libs/evtchn/minios.c  | 143 +++++++++++++++++++++++-------------
 tools/libs/gnttab/minios.c  |  68 ++++++++++++-----
 3 files changed, 139 insertions(+), 81 deletions(-)

-- 
2.26.2


