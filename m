Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD807DDEAD
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:48:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626299.976452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7pK-0008MN-Va; Wed, 01 Nov 2023 09:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626299.976452; Wed, 01 Nov 2023 09:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7pK-0008J3-SZ; Wed, 01 Nov 2023 09:47:54 +0000
Received: by outflank-mailman (input) for mailman id 626299;
 Wed, 01 Nov 2023 09:47:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy7d5-0005E0-BR
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:35:15 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f60426cb-7899-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 10:35:14 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9D2471F74A;
 Wed,  1 Nov 2023 09:35:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7BDAC13460;
 Wed,  1 Nov 2023 09:35:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 07v7HNIbQmVdCQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:35:14 +0000
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
X-Inumbo-ID: f60426cb-7899-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698831314; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0BCvqkeF/p7gtxHE7eM8MzybUWLvedVAfVRJo1N4ieE=;
	b=skswm6PqpH/X2ANmAYar1eIoRvBMUhIG1XfSQEW+md0ZUYtotEDcA4gcnnME3l3USe1swB
	Nd23c2PAGnik/Vf+9S5EeXS1Q/u725p/Hqgv8BzVTo+oIM+7OQuTESsrvOStDmovD5w4q8
	sJCPQyBlvA2w6mYehUJWT8dNj8NUYRE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH 19/29] stubdom: extend xenstore stubdom configs
Date: Wed,  1 Nov 2023 10:33:15 +0100
Message-Id: <20231101093325.30302-20-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101093325.30302-1-jgross@suse.com>
References: <20231101093325.30302-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the config files of the Xenstore stubdoms to include XENBUS
and 9PFRONT items in order to support file based logging.

Signed-off-by: Juergen Gross <jgross@suse.com>
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


