Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39337690718
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 12:24:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492344.761862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ51s-0002cR-CL; Thu, 09 Feb 2023 11:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492344.761862; Thu, 09 Feb 2023 11:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ51s-0002aT-7p; Thu, 09 Feb 2023 11:23:52 +0000
Received: by outflank-mailman (input) for mailman id 492344;
 Thu, 09 Feb 2023 11:23:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iTR=6F=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pQ51q-0002Zd-Fg
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 11:23:50 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38fe8b53-a86c-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 12:23:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 56FF35C833;
 Thu,  9 Feb 2023 11:23:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1A1451339E;
 Thu,  9 Feb 2023 11:23:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dFbyBMTX5GN9PAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 09 Feb 2023 11:23:48 +0000
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
X-Inumbo-ID: 38fe8b53-a86c-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675941828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PIKqSOQIHwMFBZvx0nM7IWyLZBtpfrkRHMl2wjqjT3E=;
	b=IwewnNqTk3JobxZe6TSwZ4V1BTOCmwaP1HnJByDYdSpVU7YFTBJlqOkOijfcEgVvpmbQQ8
	hNmMqF5h4Ri9IoPsuUjYpPv7IvbuAR5GzjZFpTTkUFbdx0Ns9SzLstxiS2eOhvTdYwG15K
	CzNoCFenAB/ZF+d+BbtDTdAlsQKSFAY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	jbeulich@suse.com,
	julien@xen.org,
	sstabellini@kernel.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 1/2 RESEND] xen/public: fix 9pfs Xenstore entry documentation
Date: Thu,  9 Feb 2023 12:23:37 +0100
Message-Id: <20230209112338.26287-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230209112338.26287-1-jgross@suse.com>
References: <20230209112338.26287-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In xen/include/public/io/9pfs.h the documentation regarding the
Xenstore entries isn't reflecting reality: the "tag" Xenstore entry
is on the frontend side, not on the backend one.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V4:
- patch split off (Julien Grall)
---
 xen/include/public/io/9pfs.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/include/public/io/9pfs.h b/xen/include/public/io/9pfs.h
index 5dad0db869..617ad9afd7 100644
--- a/xen/include/public/io/9pfs.h
+++ b/xen/include/public/io/9pfs.h
@@ -64,12 +64,6 @@
  *
  *         Host filesystem path to share.
  *
- *    tag
- *         Values:         <string>
- *
- *         Alphanumeric tag that identifies the 9pfs share. The client needs
- *         to know the tag to be able to mount it.
- *
  *    security-model
  *         Values:         "none"
  *
@@ -106,6 +100,12 @@
  *         map a page with information to setup a share ring. One for each
  *         ring.
  *
+ *    tag
+ *         Values:         <string>
+ *
+ *         Alphanumeric tag that identifies the 9pfs share. The client needs
+ *         to know the tag to be able to mount it.
+ *
  ******************************************************************************
  *                              State Machine
  ******************************************************************************
-- 
2.35.3


