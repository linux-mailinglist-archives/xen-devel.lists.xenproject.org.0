Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AE1588BA9
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 14:00:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379829.613650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJD2b-0000nn-Uw; Wed, 03 Aug 2022 11:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379829.613650; Wed, 03 Aug 2022 11:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJD2b-0000jc-M5; Wed, 03 Aug 2022 11:59:57 +0000
Received: by outflank-mailman (input) for mailman id 379829;
 Wed, 03 Aug 2022 11:59:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCkI=YH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oJD2Z-00008E-Ct
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 11:59:55 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c91c58bb-1323-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 13:59:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A607E3FF38;
 Wed,  3 Aug 2022 11:59:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6B60313AD8;
 Wed,  3 Aug 2022 11:59:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cJn7GDlj6mKNUgAAMHmgww
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
X-Inumbo-ID: c91c58bb-1323-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1659527993; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aEQopuLdWValM7nidZ9WkbS29HDB7GZW9XHtrUpHG2E=;
	b=ZzORzULIhMATytSzjLQiP1BXdg5NirLRZS4Ep079EugR2FMuCKeYWVJFlHt01FEU0IMNnu
	FvY+a9VmZ3+9PmLxySSNSw3qJBC0mAMb3ppeoGn7PMvRslEAXAJT6uLCrK4OPshmRaUXBv
	RkY6l0pTLAketVLSucjmDFgiz6jwRFM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/5] tools/xenstore: add documentation for new set/get-feature commands
Date: Wed,  3 Aug 2022 13:59:47 +0200
Message-Id: <20220803115950.10904-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220803115950.10904-1-jgross@suse.com>
References: <20220803115950.10904-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for two new Xenstore wire commands SET_FEATURE and
GET_FEATURE used to set or query the Xenstore features visible in the
ring page of a given domain.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- remove feature bit (Julien Grall)
- GET_FEATURE without domid will return Xenstore supported features
  (triggered by Julien Grall)
V3:
- clarify that guest only sees a copy of features (Julien Grall)
- add remark that SET_FEATURE will be rejected after INTRODUCE of a
  domain (Julien Grall)
---
 docs/misc/xenstore.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
index a3d3da0a5b..9134cb7947 100644
--- a/docs/misc/xenstore.txt
+++ b/docs/misc/xenstore.txt
@@ -331,6 +331,23 @@ SET_TARGET		<domid>|<tdomid>|
 
 	xenstored prevents the use of SET_TARGET other than by dom0.
 
+GET_FEATURE		[<domid>|]		<value>|
+SET_FEATURE		<domid>|<value>|
+	Returns or sets the contents of the "feature" field copied to
+	offset 2064 of the Xenstore ring page of the domain specified by
+	<domid>. <value> is a decimal number being a logical or of the
+	feature bits as defined in docs/misc/xenstore-ring.txt. Trying
+	to set a bit for a feature not being supported by the running
+	Xenstore will be denied. Providing no <domid> with the
+	GET_FEATURE command will return the features which are supported
+	by Xenstore.
+
+	SET_FEATURE for a domain will be rejected after the INTRODUCE
+	command for this domain has been sent to xenstored.
+
+	xenstored prevents the use of GET_FEATURE and SET_FEATURE other
+	than by dom0.
+
 ---------- Miscellaneous ----------
 
 CONTROL			<command>|[<parameters>|]
-- 
2.35.3


