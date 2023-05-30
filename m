Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9B8715923
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 10:55:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540895.843043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3v8Y-0006VS-11; Tue, 30 May 2023 08:55:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540895.843043; Tue, 30 May 2023 08:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3v8X-0006Rt-TD; Tue, 30 May 2023 08:55:25 +0000
Received: by outflank-mailman (input) for mailman id 540895;
 Tue, 30 May 2023 08:55:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q3v8X-00026J-3C
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 08:55:25 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6783c8e-fec7-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 10:55:23 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1786B1FD68;
 Tue, 30 May 2023 08:55:23 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id DFDEA1341B;
 Tue, 30 May 2023 08:55:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id Yr9iNfq5dWStGwAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 30 May 2023 08:55:22 +0000
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
X-Inumbo-ID: b6783c8e-fec7-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685436923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PDnOcjlXr0n33CXGUYwRzMJ17HYI0m/s+3vU9XMRSFo=;
	b=qv913pYssmeeJ5myFZc6q/HZnmAK0DzNHSU/bLRVhTOAjx7HDYStaGNUIxBn0M80tU1fLj
	V/Io4V9cjfxZX1TtVVeEgCasH71U4ZfqUDamaNL6plq9nQIHy9i/lhrH6yEfgeOPp5iYk5
	5P4NzcT9d6LLQi6FPKCSUi+1Iib70T8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 11/16] tools/libs/store: make libxenstore independent of utils.h
Date: Tue, 30 May 2023 10:54:13 +0200
Message-Id: <20230530085418.5417-12-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230530085418.5417-1-jgross@suse.com>
References: <20230530085418.5417-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no real need for including tools/xenstore/utils.h from
libxenstore, as only streq() and ARRAY_SIZE() are obtained via that
header.

streq() is just !strcmp(), and ARRAY_SIZE() is brought in via
xen-tools/common-macros.h.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 tools/libs/store/xs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index 3813b69ae2..76ffb1be45 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -33,9 +33,9 @@
 #include <signal.h>
 #include <stdint.h>
 #include <errno.h>
+#include <xen-tools/common-macros.h>
 #include "xenstore.h"
 #include "xs_lib.h"
-#include "utils.h"
 
 #include <xentoolcore_internal.h>
 #include <xen_list.h>
@@ -437,7 +437,7 @@ static int get_error(const char *errorstring)
 {
 	unsigned int i;
 
-	for (i = 0; !streq(errorstring, xsd_errors[i].errstring); i++)
+	for (i = 0; strcmp(errorstring, xsd_errors[i].errstring); i++)
 		if (i == ARRAY_SIZE(xsd_errors) - 1)
 			return EINVAL;
 	return xsd_errors[i].errnum;
-- 
2.35.3


