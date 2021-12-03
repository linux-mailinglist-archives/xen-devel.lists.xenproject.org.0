Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0014672A1
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 08:32:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237158.411317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt32G-0006wP-GK; Fri, 03 Dec 2021 07:31:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237158.411317; Fri, 03 Dec 2021 07:31:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt32G-0006tR-Cd; Fri, 03 Dec 2021 07:31:12 +0000
Received: by outflank-mailman (input) for mailman id 237158;
 Fri, 03 Dec 2021 07:31:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A+hS=QU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mt32F-0006tL-Hm
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 07:31:11 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f715c195-540a-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 08:31:02 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 211431FD52;
 Fri,  3 Dec 2021 07:31:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EBE4C13C41;
 Fri,  3 Dec 2021 07:31:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NH9YOLTHqWH7QwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 03 Dec 2021 07:31:00 +0000
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
X-Inumbo-ID: f715c195-540a-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1638516661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=bbebW9VqbAGjIhzBcVOgvBCL7jkvCGnbU+/r3lXqYe4=;
	b=vRjIUNVugAcBEU01a9cJv81fqoX5NmYO/yH+y8YrJLXsIKdTWdZ1kQOci6X5Pbf7B/Ku1m
	PA+voetAHQOs2+d0JrpoQBTwacRbStzUiPmbEh6Q4lbV7Bsmmyi4morB8pi1+fdTeeObA4
	XCCU0OOdJodoR9hd8dG6tc4qHs+CIp4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/libs/light: set video_mem for PVH guests
Date: Fri,  3 Dec 2021 08:30:58 +0100
Message-Id: <20211203073058.10980-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The size of the video memory of PVH guests should be set to 0 in case
no value has been specified.

Doing not so will leave it to be -1, resulting in an additional 1 kB
of RAM being advertised in the memory map (here the output of a PVH
Mini-OS boot with 16 MB of RAM assigned):

Memory map:
000000000000-0000010003ff: RAM
0000feff8000-0000feffffff: Reserved
0000fc008000-0000fc00803f: ACPI
0000fc000000-0000fc000fff: ACPI
0000fc001000-0000fc007fff: ACPI

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/light/libxl_create.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index dcd09d32ba..d7a40d7550 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -427,6 +427,8 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
         break;
     case LIBXL_DOMAIN_TYPE_PVH:
         libxl_defbool_setdefault(&b_info->u.pvh.pvshim, false);
+        if (b_info->video_memkb == LIBXL_MEMKB_DEFAULT)
+            b_info->video_memkb = 0;
         if (libxl_defbool_val(b_info->u.pvh.pvshim)) {
             if (!b_info->u.pvh.pvshim_path)
                 b_info->u.pvh.pvshim_path =
-- 
2.26.2


