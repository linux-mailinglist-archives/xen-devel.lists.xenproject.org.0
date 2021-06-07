Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6590B39D83E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 11:05:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137751.255176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqBBP-0002ps-T9; Mon, 07 Jun 2021 09:04:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137751.255176; Mon, 07 Jun 2021 09:04:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqBBP-0002nh-Po; Mon, 07 Jun 2021 09:04:31 +0000
Received: by outflank-mailman (input) for mailman id 137751;
 Mon, 07 Jun 2021 09:04:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kcEO=LB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lqBBN-0002nb-LX
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 09:04:29 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c317017b-bc5c-4c8b-872c-03e730df006f;
 Mon, 07 Jun 2021 09:04:28 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BB84421A86;
 Mon,  7 Jun 2021 09:04:27 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 8DB4A118DD;
 Mon,  7 Jun 2021 09:04:27 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id pTV1IRvhvWDdBAAALh3uQQ
 (envelope-from <jgross@suse.com>); Mon, 07 Jun 2021 09:04:27 +0000
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
X-Inumbo-ID: c317017b-bc5c-4c8b-872c-03e730df006f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623056667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yL97rnNZM/IuAgRq+UAn/CMZq82m0SlmJjq4Ku9Fwmk=;
	b=aGVb94R3An5t1FUxPWWKFZc2kO/7nc82f8/g7ECRWgSWFMYkCp8IJPF43XFK8/tSr6yHxr
	RIe4Q7ldQXOE+Z6tWJ2eqy+sPS4rYBot2vMPDHGkRj1RDGiJ5qj1XUdkzN1pYUVAjaSl4K
	jYVxiD/rzlz77q9HT3c+KV2S/AEriyI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623056667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yL97rnNZM/IuAgRq+UAn/CMZq82m0SlmJjq4Ku9Fwmk=;
	b=aGVb94R3An5t1FUxPWWKFZc2kO/7nc82f8/g7ECRWgSWFMYkCp8IJPF43XFK8/tSr6yHxr
	RIe4Q7ldQXOE+Z6tWJ2eqy+sPS4rYBot2vMPDHGkRj1RDGiJ5qj1XUdkzN1pYUVAjaSl4K
	jYVxiD/rzlz77q9HT3c+KV2S/AEriyI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] tools/libs/guest: fix save and restore of pv domains after 32-bit de-support
Date: Mon,  7 Jun 2021 11:04:25 +0200
Message-Id: <20210607090425.18277-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After 32-bit PV-guests have been security de-supported when not running
under PV-shim, the hypervisor will no longer be configured to support
those domains per default when not being built as PV-shim.

Unfortunately libxenguest will fail saving or restoring a PV domain
due to this restriction, as it is trying to get the compat MFN list
even for 64 bit guests.

Fix that by obtaining the compat MFN list only for 32-bit PV guests.

Fixes: 1a0f2fe2297d122a08fe ("SUPPORT.md: Un-shimmed 32-bit PV guests are no longer supported")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/guest/xg_sr_common_x86_pv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/libs/guest/xg_sr_common_x86_pv.c b/tools/libs/guest/xg_sr_common_x86_pv.c
index cd33406aab..ad20461e2e 100644
--- a/tools/libs/guest/xg_sr_common_x86_pv.c
+++ b/tools/libs/guest/xg_sr_common_x86_pv.c
@@ -154,6 +154,7 @@ int x86_pv_map_m2p(struct xc_sr_context *ctx)
     ctx->x86.pv.compat_m2p_mfn0 = entries[0].mfn;
 #else
     /* 64 bit toolstacks need to ask Xen specially for it */
+    if ( ctx->x86.pv.levels == 3 )
     {
         struct xen_machphys_mfn_list xmml = {
             .max_extents = 1,
-- 
2.26.2


