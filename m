Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC859535A48
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 09:24:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337813.562520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuUKo-0003n7-Lf; Fri, 27 May 2022 07:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337813.562520; Fri, 27 May 2022 07:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuUKo-0003do-Fh; Fri, 27 May 2022 07:24:34 +0000
Received: by outflank-mailman (input) for mailman id 337813;
 Fri, 27 May 2022 07:24:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTKn=WD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nuUKm-0003UV-T7
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 07:24:32 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c920126-dd8e-11ec-bd2c-47488cf2e6aa;
 Fri, 27 May 2022 09:24:31 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9EC531F937;
 Fri, 27 May 2022 07:24:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 66C4B139C4;
 Fri, 27 May 2022 07:24:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YETfF658kGJLIgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 27 May 2022 07:24:30 +0000
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
X-Inumbo-ID: 0c920126-dd8e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1653636270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LXfNj/iGT8On9btajkRJiSegeiqr4EifmedQT5zKgB8=;
	b=MRnjpdNTuiaij2HtIBz/4giFm4JwphAzSH2SPbn7zst2jXfoBve17Sd9qyvqpmoBq7FtSs
	lF/sak4APgN9ydnGx9ixg3D4mEOxpHhZ/hWW2ChlzDqrWGw/2uDB4A60UWTd3PZhSWU9bm
	K6XTSfDxuvvFrxvrQI76f+IKohN+lEs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/4] tools/xenstore: add documentation for new set/get-quota commands
Date: Fri, 27 May 2022 09:24:26 +0200
Message-Id: <20220527072427.20327-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220527072427.20327-1-jgross@suse.com>
References: <20220527072427.20327-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for two new Xenstore wire commands SET_QUOTA and
GET_QUOTA used to set or query the global Xenstore quota or those of
a given domain.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
Note that it might be a good idea to add support to the Xenstore
migration protocol to transfer quota data (global and/or per domain).
V2:
- remove feature bit (Julien Grall)
- add possibility to access global quota and to query supported quotas
---
 docs/misc/xenstore.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
index 00f6969202..49b05e3c9a 100644
--- a/docs/misc/xenstore.txt
+++ b/docs/misc/xenstore.txt
@@ -345,6 +345,23 @@ SET_FEATURE		<domid>|<value>|
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


