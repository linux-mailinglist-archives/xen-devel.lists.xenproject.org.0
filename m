Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B4D4DB5B0
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 17:11:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291211.494141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUWEV-0000Ux-Lw; Wed, 16 Mar 2022 16:10:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291211.494141; Wed, 16 Mar 2022 16:10:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUWEV-0000SR-F7; Wed, 16 Mar 2022 16:10:43 +0000
Received: by outflank-mailman (input) for mailman id 291211;
 Wed, 16 Mar 2022 16:10:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/w4J=T3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nUWEU-0000RR-CB
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 16:10:42 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94030128-a543-11ec-8eba-a37418f5ba1a;
 Wed, 16 Mar 2022 17:10:39 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8B7401F391;
 Wed, 16 Mar 2022 16:10:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 51DF5139B5;
 Wed, 16 Mar 2022 16:10:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oBO3EuwLMmK2OwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 16 Mar 2022 16:10:20 +0000
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
X-Inumbo-ID: 94030128-a543-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1647447020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pkuTgxN7TeNQXPeaFQVVyGlZfccct+K6q4AfMKtVTGQ=;
	b=pdBV5B0mbXbb1QqOCmmnh5ccCEQXXCH4k99Y6RH6YdeB6+5aBbfXEpX++TAiM63b/q+pif
	OcJ4xO88YFW7eFaMhekGiptKI/LwUsL/eJLk2nOWxJWLOolFz46LloKSWOorqMMP9x78Nq
	8qMkaT7EzFhAKHDWxPMGjsrNt8zCfoE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/3] tools/xenstore: add documentation for new set/get-quota commands
Date: Wed, 16 Mar 2022 17:10:16 +0100
Message-Id: <20220316161017.3579-3-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220316161017.3579-1-jgross@suse.com>
References: <20220316161017.3579-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for two new Xenstore wire commands SET_QUOTA and
GET_QUOTA used to set or query the Xenstore quota of a given domain.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/misc/xenstore-ring.txt |  1 +
 docs/misc/xenstore.txt      | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/docs/misc/xenstore-ring.txt b/docs/misc/xenstore-ring.txt
index bd000f694e..0cb72a3e35 100644
--- a/docs/misc/xenstore-ring.txt
+++ b/docs/misc/xenstore-ring.txt
@@ -69,6 +69,7 @@ Mask    Description
 1       Ring reconnection (see the ring reconnection feature below)
 2       Connection error indicator (see connection error feature below)
 4       GET_FEATURE and SET_FEATURE Xenstore wire commands are available
+8       GET_QUOTA and SET_QUOTA Xenstore wire commands are available
 
 The "Connection state" field is used to request a ring close and reconnect.
 The "Connection state" field only contains valid data if the server has
diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
index 31e3d53c52..dd75a81328 100644
--- a/docs/misc/xenstore.txt
+++ b/docs/misc/xenstore.txt
@@ -344,6 +344,18 @@ SET_FEATURE		<domid>|<value>|
 	xenstored prevents the use of GET_FEATURE and SET_FEATURE other
 	than by dom0.
 
+GET_QUOTA		<domid>|<quota>|	<value>|
+SET_QUOTA		<domid>|<quota>|<value>|
+	Returns or sets a quota value for the domain being specified by
+	<domid>. <quota> is one of "nodes", "watches", "transactions",
+	"node-size" or "permissions". <value> is a decimal number
+	specifying the quota value, with "0" having the special meaning
+	of quota checks being disabled. The initial quota settings for
+	a domain are the global ones of Xenstore.
+
+	xenstored prevents the use of GET_QUOTA and SET_QUOTA other
+	than by dom0.
+
 ---------- Miscellaneous ----------
 
 CONTROL			<command>|[<parameters>|]
-- 
2.34.1


