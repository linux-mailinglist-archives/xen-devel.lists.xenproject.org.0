Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DCC493AD6
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 14:07:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258834.446228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAAf8-0008KZ-Jy; Wed, 19 Jan 2022 13:06:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258834.446228; Wed, 19 Jan 2022 13:06:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAAf8-0008HE-Gg; Wed, 19 Jan 2022 13:06:06 +0000
Received: by outflank-mailman (input) for mailman id 258834;
 Wed, 19 Jan 2022 13:06:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7l/E=SD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nAAf6-0008Gr-Se
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 13:06:04 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8de5fc63-7928-11ec-9bbc-9dff3e4ee8c5;
 Wed, 19 Jan 2022 14:06:03 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6FAD421122;
 Wed, 19 Jan 2022 13:06:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3BB2613B61;
 Wed, 19 Jan 2022 13:06:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HJ1FDboM6GEzMAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 19 Jan 2022 13:06:02 +0000
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
X-Inumbo-ID: 8de5fc63-7928-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642597562; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=X9TF0UCrVN8MPXUemayk1jcTqVk+WiDi0ZPq15Svabs=;
	b=BCTE42a/5QwlUsQifKXEorG4GOX7pqBhlbbxrz40hmVSj0XKxcn+485uIMrrL5nagkpW0m
	NU+NXfX4NW9OAN1da8ZwFXDQZdiGTXnGp/j2tEuvaHLTXIwAJ6a7IMSphS837g2TpcgEfL
	O7t79vPkXqp3C+2jg06dc3B654eqC4c=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] fix wrong function declaration
Date: Wed, 19 Jan 2022 14:06:00 +0100
Message-Id: <20220119130600.27579-1-jgross@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Coverity spotted a wrong function declaration, fix it.

Coverity-Id: 1497423
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 include/balloon.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/balloon.h b/include/balloon.h
index 8f7c8bd8..510e475a 100644
--- a/include/balloon.h
+++ b/include/balloon.h
@@ -50,7 +50,7 @@ static inline int chk_free_pages(unsigned long needed)
 {
     return needed <= nr_free_pages;
 }
-static inline balloon_set_nr_pages(unsigned long pages, unsigned long pfn) { }
+static inline void balloon_set_nr_pages(unsigned long pages, unsigned long pfn) { }
 
 #endif /* CONFIG_BALLOON */
 #endif /* _BALLOON_H_ */
-- 
2.31.1


