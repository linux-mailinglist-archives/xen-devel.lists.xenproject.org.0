Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED8E6C62DD
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 10:09:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513694.795110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfGwq-000602-KV; Thu, 23 Mar 2023 09:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513694.795110; Thu, 23 Mar 2023 09:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfGwq-0005x0-FZ; Thu, 23 Mar 2023 09:09:28 +0000
Received: by outflank-mailman (input) for mailman id 513694;
 Thu, 23 Mar 2023 09:09:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d8pY=7P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pfGwo-0004eG-4H
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 09:09:26 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67d4d568-c95a-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 10:09:24 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2C6541FE54;
 Thu, 23 Mar 2023 09:09:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3B4A613596;
 Thu, 23 Mar 2023 09:09:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0XJDDUQXHGRKPAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Mar 2023 09:09:24 +0000
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
X-Inumbo-ID: 67d4d568-c95a-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679562564; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=afC9LuDOI4S1LmIJPeS//2B8HX3QZZNvVY/3xGApvhI=;
	b=CdSL9jCe442uhJD96ljIEIaqVWzWUxhs69dU3Liv7jqnLJUuqM7jqzyTmk1HjvlpPPWLjV
	g3jsA5ITP69UJoaj4Kzp/obmkr6TojwUJF074EcYJcBsLU/W6gy4qfFXfi+9SZvynXREvK
	weMP7Y3TVBMGXpl4+ngcXKg57NzoVXI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v5 4/5] tools/libfsimage: remove private offsetof() definition
Date: Thu, 23 Mar 2023 10:08:58 +0100
Message-Id: <20230323090859.25240-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230323090859.25240-1-jgross@suse.com>
References: <20230323090859.25240-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xfs/fsys_xfs.c is defining offsetof privately. Remove that definition
and just use stddef.h instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V4:
- new patch
---
 tools/libfsimage/xfs/fsys_xfs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/libfsimage/xfs/fsys_xfs.c b/tools/libfsimage/xfs/fsys_xfs.c
index d735a88e55..b8b4ca928c 100644
--- a/tools/libfsimage/xfs/fsys_xfs.c
+++ b/tools/libfsimage/xfs/fsys_xfs.c
@@ -17,6 +17,7 @@
  *  along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <stddef.h>
 #include <xenfsimage_grub.h>
 #include "xfs.h"
 
@@ -182,9 +183,6 @@ fsb2daddr (xfs_fsblock_t fsbno)
 			 (xfs_agblock_t)(fsbno & mask32lo(xfs.agblklog)));
 }
 
-#undef offsetof
-#define offsetof(t,m)	((size_t)&(((t *)0)->m))
-
 static inline int
 btroot_maxrecs (fsi_file_t *ffi)
 {
-- 
2.35.3


