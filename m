Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ECD6C49F1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 13:09:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513373.794261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexHA-00012v-8n; Wed, 22 Mar 2023 12:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513373.794261; Wed, 22 Mar 2023 12:09:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexHA-00010l-5R; Wed, 22 Mar 2023 12:09:08 +0000
Received: by outflank-mailman (input) for mailman id 513373;
 Wed, 22 Mar 2023 12:09:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+B1I=7O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pexH8-0008Jp-FJ
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 12:09:06 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57057e99-c8aa-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 13:09:05 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BB07B20D4C;
 Wed, 22 Mar 2023 12:09:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6955513416;
 Wed, 22 Mar 2023 12:09:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4GolGODvGmQsTwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Mar 2023 12:09:04 +0000
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
X-Inumbo-ID: 57057e99-c8aa-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679486944; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tnwj4SkxnHy4amvMB/ppif2VnlwKSRyDYISvivee9EU=;
	b=PrJwija0qWsbPZwKAKv0CQlaFdxCPAY9wauY1p+yiTXZEaAZ853lUZk2HTKRj5n61VsN8a
	vT3d5SDHMoJn9EoX4kgEDC5o1aOdOxtaab5/cap23chsiWjZoCnQts7Jq+qcB+aeOvaYRL
	AiLLxTCmKPNrN0f2vPOwb8Yi6rmUchM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 3/5] tools/hvmloader: remove private offsetof() definition
Date: Wed, 22 Mar 2023 13:08:42 +0100
Message-Id: <20230322120844.19657-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230322120844.19657-1-jgross@suse.com>
References: <20230322120844.19657-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

util.h contains a definition of offsetof(), which isn't needed.

Remove it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V4:
- new patch
---
 tools/firmware/hvmloader/util.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
index e04990ee97..7249773eeb 100644
--- a/tools/firmware/hvmloader/util.h
+++ b/tools/firmware/hvmloader/util.h
@@ -30,9 +30,6 @@ enum {
 #define SEL_DATA32          0x0020
 #define SEL_CODE64          0x0028
 
-#undef offsetof
-#define offsetof(t, m) ((unsigned long)&((t *)0)->m)
-
 #undef NULL
 #define NULL ((void*)0)
 
-- 
2.35.3


