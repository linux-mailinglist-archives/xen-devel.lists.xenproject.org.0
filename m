Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B58C849839
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 11:58:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675851.1051515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwfp-0006Gx-Ln; Mon, 05 Feb 2024 10:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675851.1051515; Mon, 05 Feb 2024 10:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwfp-0006C1-Hc; Mon, 05 Feb 2024 10:58:01 +0000
Received: by outflank-mailman (input) for mailman id 675851;
 Mon, 05 Feb 2024 10:58:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4fC=JO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rWwZs-0000qL-Nd
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 10:51:52 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 913c5fb1-c414-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 11:51:51 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E7BD61F8BB;
 Mon,  5 Feb 2024 10:51:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B22E3132DD;
 Mon,  5 Feb 2024 10:51:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Mk79Kca9wGWvNgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 05 Feb 2024 10:51:50 +0000
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
X-Inumbo-ID: 913c5fb1-c414-11ee-98f5-efadbce2ee36
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v4 19/32] stubdom: extend xenstore stubdom configs
Date: Mon,  5 Feb 2024 11:49:48 +0100
Message-Id: <20240205105001.24171-20-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240205105001.24171-1-jgross@suse.com>
References: <20240205105001.24171-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: E7BD61F8BB
X-Spam-Flag: NO

Extend the config files of the Xenstore stubdoms to include XENBUS
and 9PFRONT items in order to support file based logging.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
 stubdom/xenstore-minios.cfg    | 2 +-
 stubdom/xenstorepvh-minios.cfg | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/stubdom/xenstore-minios.cfg b/stubdom/xenstore-minios.cfg
index a41704bb6b..239da519b9 100644
--- a/stubdom/xenstore-minios.cfg
+++ b/stubdom/xenstore-minios.cfg
@@ -3,7 +3,7 @@ CONFIG_NETFRONT=n
 CONFIG_FBFRONT=n
 CONFIG_KBDFRONT=n
 CONFIG_CONSFRONT=n
-CONFIG_XENBUS=n
 CONFIG_LWIP=n
+CONFIG_9PFRONT=y
 CONFIG_BALLOON=y
 XEN_INTERFACE_VERSION=__XEN_LATEST_INTERFACE_VERSION__
diff --git a/stubdom/xenstorepvh-minios.cfg b/stubdom/xenstorepvh-minios.cfg
index 6af51f5753..752b90d7d3 100644
--- a/stubdom/xenstorepvh-minios.cfg
+++ b/stubdom/xenstorepvh-minios.cfg
@@ -4,7 +4,7 @@ CONFIG_NETFRONT=n
 CONFIG_FBFRONT=n
 CONFIG_KBDFRONT=n
 CONFIG_CONSFRONT=n
-CONFIG_XENBUS=n
 CONFIG_LWIP=n
+CONFIG_9PFRONT=y
 CONFIG_BALLOON=y
 XEN_INTERFACE_VERSION=__XEN_LATEST_INTERFACE_VERSION__
-- 
2.35.3


