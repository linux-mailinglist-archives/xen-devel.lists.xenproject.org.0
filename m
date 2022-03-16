Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EEA4DB5AD
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 17:11:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291210.494128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUWEC-00006W-5Z; Wed, 16 Mar 2022 16:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291210.494128; Wed, 16 Mar 2022 16:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUWEC-0008Vi-2D; Wed, 16 Mar 2022 16:10:24 +0000
Received: by outflank-mailman (input) for mailman id 291210;
 Wed, 16 Mar 2022 16:10:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/w4J=T3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nUWE9-0008Vc-Rw
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 16:10:21 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8feae865-a543-11ec-853c-5f4723681683;
 Wed, 16 Mar 2022 17:10:14 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4B3962112B;
 Wed, 16 Mar 2022 16:10:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0EE23139B5;
 Wed, 16 Mar 2022 16:10:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GLtmAuwLMmK2OwAAMHmgww
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
X-Inumbo-ID: 8feae865-a543-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1647447020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tN8OsMtRYtol/EJRpHheAzvEZdyyzUH3LNGhAdLsDFU=;
	b=jXvFtHRCwGGc+K+fStsf6puXTNUkXP5sVl/a6vYyviLfp3LtU0HiYF8tk0Yqqe6e0/tsgH
	Mfp0r3Tp7S5NuozqOqGoVWPN5xgsk5FkCHFdjHXc3TGtS/wXMoVH8Qz0odPXhZWNNfjdLG
	oVus3b0Cp5NoSY9AFemVqLIYCeftbvw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] tools/xenstore: add documentation for new set/get-feature commands
Date: Wed, 16 Mar 2022 17:10:15 +0100
Message-Id: <20220316161017.3579-2-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220316161017.3579-1-jgross@suse.com>
References: <20220316161017.3579-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for two new Xenstore wire commands SET_FEATURE and
GET_FEATURE used to set or query the Xenstore features visible in the
ring page of a given domain.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/misc/xenstore-ring.txt |  1 +
 docs/misc/xenstore.txt      | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/docs/misc/xenstore-ring.txt b/docs/misc/xenstore-ring.txt
index f91accb5b0..bd000f694e 100644
--- a/docs/misc/xenstore-ring.txt
+++ b/docs/misc/xenstore-ring.txt
@@ -68,6 +68,7 @@ Mask    Description
 -----------------------------------------------------------------
 1       Ring reconnection (see the ring reconnection feature below)
 2       Connection error indicator (see connection error feature below)
+4       GET_FEATURE and SET_FEATURE Xenstore wire commands are available
 
 The "Connection state" field is used to request a ring close and reconnect.
 The "Connection state" field only contains valid data if the server has
diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
index ea3d8be177..31e3d53c52 100644
--- a/docs/misc/xenstore.txt
+++ b/docs/misc/xenstore.txt
@@ -332,6 +332,18 @@ SET_TARGET		<domid>|<tdomid>|
 
 	xenstored prevents the use of SET_TARGET other than by dom0.
 
+GET_FEATURE		<domid>|		<value>|
+SET_FEATURE		<domid>|<value>|
+	Returns or sets the contents of the "feature" field located at
+	offset 2064 of the Xenstore ring page of the domain specified by
+	<domid>. <value> is a decimal number being a logical or of the
+	feature bits as defined in docs/misc/xenstore-ring.txt. Trying
+	to set a bit for a feature not being supported by the running
+	Xenstore will be denied.
+
+	xenstored prevents the use of GET_FEATURE and SET_FEATURE other
+	than by dom0.
+
 ---------- Miscellaneous ----------
 
 CONTROL			<command>|[<parameters>|]
-- 
2.34.1


