Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68440680A74
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 11:08:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486775.754239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMR5W-0000BC-4z; Mon, 30 Jan 2023 10:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486775.754239; Mon, 30 Jan 2023 10:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMR5W-00008d-22; Mon, 30 Jan 2023 10:08:34 +0000
Received: by outflank-mailman (input) for mailman id 486775;
 Mon, 30 Jan 2023 10:08:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZQwi=53=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pMR5U-0007zj-FH
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 10:08:32 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c0be557-a086-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 11:08:30 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8EEE22198D;
 Mon, 30 Jan 2023 10:08:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7408A13444;
 Mon, 30 Jan 2023 10:08:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IpoWGx6X12PdfgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 30 Jan 2023 10:08:30 +0000
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
X-Inumbo-ID: 0c0be557-a086-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675073310; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PIKqSOQIHwMFBZvx0nM7IWyLZBtpfrkRHMl2wjqjT3E=;
	b=ol8vD0zsG46kHnFOwZCRNRQuasrgV42YBlye71qNr6UzkpM02PFyq0c/D7ectsA54zRBGF
	tGXR8OUrTZkR1uB7KJ7EPSKas/Ug+x6jeA8g75dlCbaKXFlGTjSywUMqMiioyDrIUsN55m
	E9idgMYEh2fil+NZ6hNjd4ZgQjoTfAk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 2/3] xen/public: fix 9pfs Xenstore entry documentation
Date: Mon, 30 Jan 2023 11:08:12 +0100
Message-Id: <20230130100813.3298-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230130100813.3298-1-jgross@suse.com>
References: <20230130100813.3298-1-jgross@suse.com>
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


