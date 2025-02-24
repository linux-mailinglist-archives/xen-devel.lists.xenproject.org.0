Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 239D4A422CF
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 15:21:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895192.1303782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmZJe-0003QG-6W; Mon, 24 Feb 2025 14:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895192.1303782; Mon, 24 Feb 2025 14:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmZJe-0003Oh-3Q; Mon, 24 Feb 2025 14:20:14 +0000
Received: by outflank-mailman (input) for mailman id 895192;
 Mon, 24 Feb 2025 14:20:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6kuv=VP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tmZJc-0003OY-H8
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 14:20:12 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 737674c1-f2ba-11ef-9897-31a8f345e629;
 Mon, 24 Feb 2025 15:20:08 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 650B61F444;
 Mon, 24 Feb 2025 14:20:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 416D213707;
 Mon, 24 Feb 2025 14:20:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qA5pDhiAvGdhQwAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 24 Feb 2025 14:20:08 +0000
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
X-Inumbo-ID: 737674c1-f2ba-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1740406808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TBtgxIiWQx70/RzrCgGRERGn16aZBFgxTw/EFUirWbM=;
	b=m6qHuOLKfuKd3L6qQXNh1HY6U6qXFAINosCPmxzWLCl6ztmQDx51h4O7uw7bqrmUHYjz0M
	ZeTzScsZZT8sXk6S1SGAzFMGL3Q8B0Zj6hlYzFMnuEI6YHpxYigxaL74kMhEexwJvXYNIN
	tcMVenICFB2TqDtoqP2xjFUosQclvqo=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1740406808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TBtgxIiWQx70/RzrCgGRERGn16aZBFgxTw/EFUirWbM=;
	b=m6qHuOLKfuKd3L6qQXNh1HY6U6qXFAINosCPmxzWLCl6ztmQDx51h4O7uw7bqrmUHYjz0M
	ZeTzScsZZT8sXk6S1SGAzFMGL3Q8B0Zj6hlYzFMnuEI6YHpxYigxaL74kMhEexwJvXYNIN
	tcMVenICFB2TqDtoqP2xjFUosQclvqo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] tools/xl: fix channel configuration setting
Date: Mon, 24 Feb 2025 15:20:05 +0100
Message-ID: <20250224142005.24172-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Channels work differently than other device types: their devid should
be -1 initially in order to distinguish them from the primary console
which has the devid of 0.

So when parsing the channel configuration, set devid explicitly to -1
after expanding the channels array, as this expansion of the array will
have set the devid to the index of the item in the array, overwriting
the -1 initialization done by libxl_device_channel_init().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xl/xl_parse.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 3d85be7dd4..4705f6fd4b 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2426,6 +2426,9 @@ void parse_config_data(const char *config_source,
             chn = ARRAY_EXTEND_INIT(d_config->channels, d_config->num_channels,
                                    libxl_device_channel_init);
 
+            /* ARRAY_EXTEND_INIT() has set the devid, but it must be -1. */
+            chn->devid = -1;
+
             split_string_into_string_list(buf, ",", &pairs);
             len = libxl_string_list_length(&pairs);
             for (i = 0; i < len; i++) {
-- 
2.43.0


