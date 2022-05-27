Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E64C3535A45
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 09:24:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337812.562511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuUKo-0003dq-6j; Fri, 27 May 2022 07:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337812.562511; Fri, 27 May 2022 07:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuUKo-0003XC-2G; Fri, 27 May 2022 07:24:34 +0000
Received: by outflank-mailman (input) for mailman id 337812;
 Fri, 27 May 2022 07:24:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTKn=WD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nuUKm-0003UW-HH
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 07:24:32 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c6e98e2-dd8e-11ec-837f-e5687231ffcc;
 Fri, 27 May 2022 09:24:30 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6019B21A85;
 Fri, 27 May 2022 07:24:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 28F57139C4;
 Fri, 27 May 2022 07:24:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8IatCK58kGJLIgAAMHmgww
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
X-Inumbo-ID: 0c6e98e2-dd8e-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1653636270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E6zy0H1QLcikhT3nJW6R/zDsHVZ2kOQtMcpCnXKd1Ms=;
	b=DrsrayzqmPCppEAAobwVZV/l/JkmprzER9r2PN4rky3JrC2ejxKrJ0sY1fusvlWsT3Hftt
	Z6oRaJbTi+Ty8LS56YoEWxxArV3oHuaz0rgkSHOc1jhhN+S/MG7cZyBKH5patYd/DiRLvI
	EaMLzXA33J9w/IB1ca8ourPK3L4Q2ro=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/4] tools/xenstore: add documentation for new set/get-feature commands
Date: Fri, 27 May 2022 09:24:25 +0200
Message-Id: <20220527072427.20327-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220527072427.20327-1-jgross@suse.com>
References: <20220527072427.20327-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for two new Xenstore wire commands SET_FEATURE and
GET_FEATURE used to set or query the Xenstore features visible in the
ring page of a given domain.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
Do we need support in the migration protocol for the features?
V2:
- remove feature bit (Julien Grall)
- GET_FEATURE without domid will return Xenstore supported features
  (triggered by Julien Grall)
---
 docs/misc/xenstore.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
index a3d3da0a5b..00f6969202 100644
--- a/docs/misc/xenstore.txt
+++ b/docs/misc/xenstore.txt
@@ -331,6 +331,20 @@ SET_TARGET		<domid>|<tdomid>|
 
 	xenstored prevents the use of SET_TARGET other than by dom0.
 
+GET_FEATURE		[<domid>|]		<value>|
+SET_FEATURE		<domid>|<value>|
+	Returns or sets the contents of the "feature" field located at
+	offset 2064 of the Xenstore ring page of the domain specified by
+	<domid>. <value> is a decimal number being a logical or of the
+	feature bits as defined in docs/misc/xenstore-ring.txt. Trying
+	to set a bit for a feature not being supported by the running
+	Xenstore will be denied. Providing no <domid> with the
+	GET_FEATURE command will return the features which are supported
+	by Xenstore.
+
+	xenstored prevents the use of GET_FEATURE and SET_FEATURE other
+	than by dom0.
+
 ---------- Miscellaneous ----------
 
 CONTROL			<command>|[<parameters>|]
-- 
2.35.3


