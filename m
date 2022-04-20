Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2C5508234
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 09:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308939.524877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh4o9-00072c-GB; Wed, 20 Apr 2022 07:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308939.524877; Wed, 20 Apr 2022 07:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh4o9-0006yn-BB; Wed, 20 Apr 2022 07:31:25 +0000
Received: by outflank-mailman (input) for mailman id 308939;
 Wed, 20 Apr 2022 07:31:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTZJ=U6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nh4o7-0006Tb-B8
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 07:31:23 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfa36ac1-c07b-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 09:31:21 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 268C7210ED;
 Wed, 20 Apr 2022 07:31:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 004C813A30;
 Wed, 20 Apr 2022 07:31:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yNBUOsi2X2IhXAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 20 Apr 2022 07:31:20 +0000
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
X-Inumbo-ID: dfa36ac1-c07b-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650439881; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CTPiijYWD7yPxL86YUqzoUHVXxb7L5u3k0/gpyUiDjo=;
	b=Hc5mx8MxTTQhGpiczvnm4m7uQF/GzNwq2CccsU0FB/ebKbyfENh17aJ7Hk1/EOiLy7DjmF
	fdO3T5Ii4hMQG/gx+KOzzWF4LVt8Q26iX4Fqzy63VsLR+ed0UQy07v2EzgB5Nt5j+4WTCu
	P0xrU7oZgEOREVzZQ4CZu0fA6akEsa4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 1/4] tools/libs/evtchn: don't set errno to negative values
Date: Wed, 20 Apr 2022 09:31:16 +0200
Message-Id: <20220420073119.16974-2-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420073119.16974-1-jgross@suse.com>
References: <20220420073119.16974-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting errno to a negative value makes no sense.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/evtchn/freebsd.c | 2 +-
 tools/libs/evtchn/minios.c  | 2 +-
 tools/libs/evtchn/netbsd.c  | 2 +-
 tools/libs/evtchn/solaris.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/libs/evtchn/freebsd.c b/tools/libs/evtchn/freebsd.c
index c4d075350b..422836f1a1 100644
--- a/tools/libs/evtchn/freebsd.c
+++ b/tools/libs/evtchn/freebsd.c
@@ -58,7 +58,7 @@ int osdep_evtchn_close(xenevtchn_handle *xce)
 
 int osdep_evtchn_restrict(xenevtchn_handle *xce, domid_t domid)
 {
-    errno = -EOPNOTSUPP;
+    errno = EOPNOTSUPP;
 
     return -1;
 }
diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
index 65cfccfd09..8ff46de884 100644
--- a/tools/libs/evtchn/minios.c
+++ b/tools/libs/evtchn/minios.c
@@ -143,7 +143,7 @@ int osdep_evtchn_close(xenevtchn_handle *xce)
 
 int osdep_evtchn_restrict(xenevtchn_handle *xce, domid_t domid)
 {
-    errno = -EOPNOTSUPP;
+    errno = EOPNOTSUPP;
 
     return -1;
 }
diff --git a/tools/libs/evtchn/netbsd.c b/tools/libs/evtchn/netbsd.c
index 0b223c4beb..2de9cefc67 100644
--- a/tools/libs/evtchn/netbsd.c
+++ b/tools/libs/evtchn/netbsd.c
@@ -53,7 +53,7 @@ int osdep_evtchn_close(xenevtchn_handle *xce)
 
 int osdep_evtchn_restrict(xenevtchn_handle *xce, domid_t domid)
 {
-    errno = -EOPNOTSUPP;
+    errno = EOPNOTSUPP;
 
     return -1;
 }
diff --git a/tools/libs/evtchn/solaris.c b/tools/libs/evtchn/solaris.c
index 7fef88a73e..375a5f9b4f 100644
--- a/tools/libs/evtchn/solaris.c
+++ b/tools/libs/evtchn/solaris.c
@@ -53,7 +53,7 @@ int osdep_evtchn_close(xenevtchn_handle *xce)
 
 int osdep_evtchn_restrict(xenevtchn_handle *xce, domid_t domid)
 {
-    errno = -EOPNOTSUPP;
+    errno = EOPNOTSUPP;
     return -1;
 }
 
-- 
2.34.1


