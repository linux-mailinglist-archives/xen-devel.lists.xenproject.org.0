Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AE850F700
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 11:08:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313585.531194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njHB9-0007Cg-Iz; Tue, 26 Apr 2022 09:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313585.531194; Tue, 26 Apr 2022 09:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njHB9-00079V-F6; Tue, 26 Apr 2022 09:08:15 +0000
Received: by outflank-mailman (input) for mailman id 313585;
 Tue, 26 Apr 2022 09:08:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YDip=VE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1njHB8-00079N-78
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 09:08:14 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6690b280-c540-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 11:08:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BD7FF1F388;
 Tue, 26 Apr 2022 09:08:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A26AB13223;
 Tue, 26 Apr 2022 09:08:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dSArJny2Z2LbKwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 26 Apr 2022 09:08:12 +0000
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
X-Inumbo-ID: 6690b280-c540-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650964092; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5ePbnWGj078M5rHzgpCHA5ttcI0pSrUoZ/F8e+XsuHY=;
	b=jaNJr2TbX//2L6PODaycWGPhMzLA+c7yMPSTeG2PmeD3Ms3q9WfqXGdqrdIX8LzlKySI2F
	4NM3oHaXRaGsTJp0Khdae3nq3Wbzy3H1mb9Mua1J1l5sVory1vdiZbSmdESEiguaVimh1G
	hgLtqUN3ScKwXwUXAMg/lMPT53tyKok=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>
Subject: [PATCH] xen/public: add new macro to ring.h
Date: Tue, 26 Apr 2022 11:08:10 +0200
Message-Id: <20220426090810.28616-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the initialization of a ring page by the frontend two macros are
available in ring.h: SHARED_RING_INIT() and FRONT_RING_INIT().

All known users use always both of them in direct sequence.

Add another macro XEN_FRONT_RING_INIT() combining the two macros.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/include/public/io/ring.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/include/public/io/ring.h b/xen/include/public/io/ring.h
index 277af36e61..3925d6ad95 100644
--- a/xen/include/public/io/ring.h
+++ b/xen/include/public/io/ring.h
@@ -184,6 +184,11 @@ typedef struct __name##_back_ring __name##_back_ring_t
 
 #define FRONT_RING_INIT(_r, _s, __size) FRONT_RING_ATTACH(_r, _s, 0, __size)
 
+#define XEN_FRONT_RING_INIT(_r, _s, __size) do {                        \
+    SHARED_RING_INIT(_s);                                               \
+    FRONT_RING_INIT(_r, _s, __size);                                    \
+} while (0)
+
 #define BACK_RING_ATTACH(_r, _s, _i, __size) do {                       \
     (_r)->rsp_prod_pvt = (_i);                                          \
     (_r)->req_cons = (_i);                                              \
-- 
2.34.1


