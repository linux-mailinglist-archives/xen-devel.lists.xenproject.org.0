Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F1D61E07C
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 07:15:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438409.692516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orYwE-0002u0-AF; Sun, 06 Nov 2022 06:15:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438409.692516; Sun, 06 Nov 2022 06:15:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orYwE-0002rx-6d; Sun, 06 Nov 2022 06:15:22 +0000
Received: by outflank-mailman (input) for mailman id 438409;
 Sun, 06 Nov 2022 06:15:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HJCJ=3G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1orYwD-0002rr-1U
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 06:15:21 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63a57c01-5d9a-11ed-8fd1-01056ac49cbb;
 Sun, 06 Nov 2022 07:15:19 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4FD8F21878;
 Sun,  6 Nov 2022 06:15:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 223B513A67;
 Sun,  6 Nov 2022 06:15:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Wi3oBvdQZ2P9LQAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 06 Nov 2022 06:15:19 +0000
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
X-Inumbo-ID: 63a57c01-5d9a-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667715319; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wmx1p/fibZIPAcnrUo8dI+OSOgfucXCIKC2XOFQFE/Y=;
	b=sMf6gxr6gi+Dh3lATXs2/hYm/c8sCfH56iUSQ4U+7RbXrHQYvdHhK4mxX5YzwTbXehpS7a
	DmxBla5bj4AHO5ay26YEOIGN6TKRm3OcxMDNfQADjY0Vzg2Xe8Ry1lQZIH4zhLhtlXEfF5
	afBn2y+rA/GSEBARca5zEfEFY2D1TTo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH-for-4.17] tools/hotplug: fix systemd unit dependencies
Date: Sun,  6 Nov 2022 07:15:17 +0100
Message-Id: <20221106061517.15602-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 1283af6465cd ("tools/xenstore: remove XEN_LIB_STORED and
XENSTORED_ROOTDIR") removed the systemd file var-lib-xenstored.mount
without removing dependencies to this file.

Fixes: 1283af6465cd ("tools/xenstore: remove XEN_LIB_STORED and XENSTORED_ROOTDIR")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/hotplug/Linux/systemd/xenstored.service.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tools/hotplug/Linux/systemd/xenstored.service.in b/tools/hotplug/Linux/systemd/xenstored.service.in
index 80c1d408a5..261077dc92 100644
--- a/tools/hotplug/Linux/systemd/xenstored.service.in
+++ b/tools/hotplug/Linux/systemd/xenstored.service.in
@@ -1,7 +1,7 @@
 [Unit]
 Description=The Xen xenstore
-Requires=proc-xen.mount var-lib-xenstored.mount
-After=proc-xen.mount var-lib-xenstored.mount
+Requires=proc-xen.mount
+After=proc-xen.mount
 Before=libvirtd.service libvirt-guests.service
 RefuseManualStop=true
 ConditionPathExists=/proc/xen/capabilities
@@ -16,4 +16,3 @@ ExecStart=@XEN_SCRIPT_DIR@/launch-xenstore
 [Install]
 WantedBy=multi-user.target
 Also=proc-xen.mount
-Also=var-lib-xenstored.mount
-- 
2.35.3


