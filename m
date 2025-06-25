Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6380CAE7F65
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 12:33:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024677.1400510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUNRI-00086A-3T; Wed, 25 Jun 2025 10:33:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024677.1400510; Wed, 25 Jun 2025 10:33:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUNRI-00083s-0h; Wed, 25 Jun 2025 10:33:12 +0000
Received: by outflank-mailman (input) for mailman id 1024677;
 Wed, 25 Jun 2025 10:33:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XgUS=ZI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uUNRH-00083m-0c
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 10:33:11 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9e7ef65-51af-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 12:33:10 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2219F2116D;
 Wed, 25 Jun 2025 10:33:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F2E0E13AC4;
 Wed, 25 Jun 2025 10:33:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id flnCOWTQW2gkSAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 25 Jun 2025 10:33:08 +0000
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
X-Inumbo-ID: c9e7ef65-51af-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750847589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7/+BzpDTLyj/g6qTn3N+ge2TUlSpNqc+t5mf+a0g4AA=;
	b=UhG7Z1pVQmJBJbpqFP0gB1L0HYXBM5djkfz/6lxkbS3qQ74sU5L5xzBVbel1e7Vc+A9DdT
	+xWDXv1JTVTcyVRyht08gWTuYo8WWOpa1DCBUnSvZymXGxMbagOo3HQBDWH99t/aAlOk8d
	9eH1pEdIN3EP8UAdad03eKDxqmOwHfg=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=UhG7Z1pV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750847589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7/+BzpDTLyj/g6qTn3N+ge2TUlSpNqc+t5mf+a0g4AA=;
	b=UhG7Z1pVQmJBJbpqFP0gB1L0HYXBM5djkfz/6lxkbS3qQ74sU5L5xzBVbel1e7Vc+A9DdT
	+xWDXv1JTVTcyVRyht08gWTuYo8WWOpa1DCBUnSvZymXGxMbagOo3HQBDWH99t/aAlOk8d
	9eH1pEdIN3EP8UAdad03eKDxqmOwHfg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] tools/libxenguest: fix build in stubdom environment
Date: Wed, 25 Jun 2025 12:33:06 +0200
Message-ID: <20250625103306.4599-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 2219F2116D
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.01
X-Spam-Level: 

With introduction of the new byteswap infrastructure the build of
libxenguest for stubdoms was broken. Fix that again.

Fixes: 60dcff871e34 ("xen/decompressors: Remove use of *_to_cpup() helpers")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c | 9 +++++++++
 tools/libs/guest/xg_dom_decompress_unsafe_xz.c    | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c b/tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c
index ca2f37d915..356f228718 100644
--- a/tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c
+++ b/tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c
@@ -25,6 +25,15 @@ static inline uint16_t be16_to_cpu(const uint16_t v)
 #endif
 }
 
+static inline uint32_t be32_to_cpu(const uint32_t v)
+{
+#if BYTE_ORDER == LITTLE_ENDIAN
+	return __builtin_bswap32(v);
+#else
+	return v;
+#endif
+}
+
 #include "../../xen/common/lzo.c"
 #include "../../xen/common/unlzo.c"
 
diff --git a/tools/libs/guest/xg_dom_decompress_unsafe_xz.c b/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
index 1f52875340..0501f7f693 100644
--- a/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
+++ b/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
@@ -25,7 +25,7 @@ static inline uint32_t cpu_to_le32(const uint32_t v)
 #endif
 }
 
-static inline uint32_t le32_to_cpu(const uint32_t p)
+static inline uint32_t le32_to_cpu(const uint32_t v)
 {
 #if BYTE_ORDER == BIG_ENDIAN
 	return __builtin_bswap32(v);
-- 
2.43.0


