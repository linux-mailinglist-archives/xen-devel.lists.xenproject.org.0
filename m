Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D2B6C62DE
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 10:09:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513693.795100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfGwj-0005cS-4H; Thu, 23 Mar 2023 09:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513693.795100; Thu, 23 Mar 2023 09:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfGwi-0005Z7-Vf; Thu, 23 Mar 2023 09:09:20 +0000
Received: by outflank-mailman (input) for mailman id 513693;
 Thu, 23 Mar 2023 09:09:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d8pY=7P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pfGwh-0004iI-Nn
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 09:09:19 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6481d08e-c95a-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 10:09:19 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C90CE3421D;
 Thu, 23 Mar 2023 09:09:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8520613596;
 Thu, 23 Mar 2023 09:09:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 33UrHz4XHGQ3PAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Mar 2023 09:09:18 +0000
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
X-Inumbo-ID: 6481d08e-c95a-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679562558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KekcHDT8sTSNNg7lix6UgmDeCEWrsQjl0v8SorJ5R/A=;
	b=Zp/dpWSG6EYHkJVo9Url9+pkD5mzSEclEQp9bZMBvBpSFGs5R7MQPXrIbvzLb27NpZbxnh
	qe1soVQZuupx2i+eqP7HjGmXcQSR/zpqT7Zk2Xw1lDo2h2OnS0zp3lnBA/EDDGRLW8chhu
	eUmRGfHqcWBblDnmtoFJ0iN+UsT36dM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v5 3/5] tools/hvmloader: remove private offsetof() definition
Date: Thu, 23 Mar 2023 10:08:57 +0100
Message-Id: <20230323090859.25240-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230323090859.25240-1-jgross@suse.com>
References: <20230323090859.25240-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

util.h contains a definition of offsetof(), which isn't used.

Remove it.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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


