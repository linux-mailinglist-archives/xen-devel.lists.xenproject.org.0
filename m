Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EB4588BA6
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 14:00:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379828.613645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJD2b-0000jd-Id; Wed, 03 Aug 2022 11:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379828.613645; Wed, 03 Aug 2022 11:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJD2b-0000c6-E6; Wed, 03 Aug 2022 11:59:57 +0000
Received: by outflank-mailman (input) for mailman id 379828;
 Wed, 03 Aug 2022 11:59:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCkI=YH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oJD2Z-0008VV-8p
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 11:59:55 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c94ea17a-1323-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 13:59:54 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F31993FF3B;
 Wed,  3 Aug 2022 11:59:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B0CB013AD8;
 Wed,  3 Aug 2022 11:59:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SPvnKTlj6mKNUgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 03 Aug 2022 11:59:53 +0000
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
X-Inumbo-ID: c94ea17a-1323-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1659527994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K6SEriJ/12Ptr9jCpA0LXPaM3BfUwfWAPckT8APK2Io=;
	b=BYvUXsH1TGfMi7zg3aBERgMzGnXneQn1J8YlrmauID169x6K9i4Sy1nMg2RBM5kehqA0ZQ
	RTa842/QxJoRYDfjMXVaWdJB3QQ0HPDtEyTPlTucMfCd2dzZs632Du8swdIYr0qXZQtCET
	GS+piYVdiT+SGsrRfuEkQT1Jvzvt0no=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 3/5] tools/xenstore: add documentation for new set/get-quota commands
Date: Wed,  3 Aug 2022 13:59:48 +0200
Message-Id: <20220803115950.10904-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220803115950.10904-1-jgross@suse.com>
References: <20220803115950.10904-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for two new Xenstore wire commands SET_QUOTA and
GET_QUOTA used to set or query the global Xenstore quota or those of
a given domain.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V2:
- remove feature bit (Julien Grall)
- add possibility to access global quota and to query supported quotas
---
 docs/misc/xenstore.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
index 9134cb7947..4e0bdf5682 100644
--- a/docs/misc/xenstore.txt
+++ b/docs/misc/xenstore.txt
@@ -348,6 +348,23 @@ SET_FEATURE		<domid>|<value>|
 	xenstored prevents the use of GET_FEATURE and SET_FEATURE other
 	than by dom0.
 
+GET_QUOTA		[[<domid>|]<quota>|]	<value>|
+SET_QUOTA		[<domid>|]<quota>|<value>|
+	Returns or sets a quota value for the domain being specified by
+	<domid>. Omitting <domid> will return or set the global quota
+	values, which are the default values for new domains. <quota> is
+	 one of "nodes", "watches", "transactions", "node-size",
+	"permissions", or any other implementation defined value. For
+	GET_QUOTA it is possible to omit the <quota> parameter together
+	with the <domid> parameter, which will return a single string of
+	all supported <quota> values separated by blanks. <value> is a
+	decimal number specifying the quota value, with "0" having the
+	special meaning of quota checks being disabled. The initial quota
+	settings for a domain are the global ones of Xenstore.
+
+	xenstored prevents the use of GET_QUOTA and SET_QUOTA other
+	than by dom0.
+
 ---------- Miscellaneous ----------
 
 CONTROL			<command>|[<parameters>|]
-- 
2.35.3


