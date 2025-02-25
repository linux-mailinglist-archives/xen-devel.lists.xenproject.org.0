Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07854A43633
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 08:30:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895439.1304039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmpOp-00017S-9Z; Tue, 25 Feb 2025 07:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895439.1304039; Tue, 25 Feb 2025 07:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmpOp-00014X-6n; Tue, 25 Feb 2025 07:30:39 +0000
Received: by outflank-mailman (input) for mailman id 895439;
 Tue, 25 Feb 2025 07:30:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M1ZL=VQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tmpOo-00013k-30
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 07:30:38 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 671630b3-f34a-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 08:30:35 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 07E211F44F;
 Tue, 25 Feb 2025 07:30:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D7F7D13332;
 Tue, 25 Feb 2025 07:30:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yb89M5pxvWdFbAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 25 Feb 2025 07:30:34 +0000
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
X-Inumbo-ID: 671630b3-f34a-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1740468635; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=i3KXPMuUPNaA+pC2G+xW8EughsoODiw5EBieFYeIaQg=;
	b=kntdDKipe+EAZNukZGH1uKS7c6NGRobkd7LN9Bh5u+3075VcySjyfbNwsbpG5kDbVtaYl2
	VHt15okO9PNiHh56f9CbDN/vy7VN9oHiEE6mVIszbyzQJqR5TdLW/k/2B9RbuML3XntfDF
	RGcbmmrA0RZ6LDe9Wr+xQyJzb9ePQIM=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=kntdDKip
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1740468635; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=i3KXPMuUPNaA+pC2G+xW8EughsoODiw5EBieFYeIaQg=;
	b=kntdDKipe+EAZNukZGH1uKS7c6NGRobkd7LN9Bh5u+3075VcySjyfbNwsbpG5kDbVtaYl2
	VHt15okO9PNiHh56f9CbDN/vy7VN9oHiEE6mVIszbyzQJqR5TdLW/k/2B9RbuML3XntfDF
	RGcbmmrA0RZ6LDe9Wr+xQyJzb9ePQIM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2] tools/xl: fix channel configuration setting
Date: Tue, 25 Feb 2025 08:30:33 +0100
Message-ID: <20250225073033.20972-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 07E211F44F
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Channels work differently than other device types: their devid should
be -1 initially in order to distinguish them from the primary console
which has the devid of 0.

So when parsing the channel configuration, use
ARRAY_EXTEND_INIT_NODEVID() in order to avoid overwriting the devid
set by libxl_device_channel_init().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- use ARRAY_EXTEND_INIT_NODEVID() (Anthony Perard)
---
 tools/xl/xl_parse.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 3d85be7dd4..089a88935a 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2423,8 +2423,9 @@ void parse_config_data(const char *config_source,
             char *path = NULL;
             int len;
 
-            chn = ARRAY_EXTEND_INIT(d_config->channels, d_config->num_channels,
-                                   libxl_device_channel_init);
+            chn = ARRAY_EXTEND_INIT_NODEVID(d_config->channels,
+                                            d_config->num_channels,
+                                            libxl_device_channel_init);
 
             split_string_into_string_list(buf, ",", &pairs);
             len = libxl_string_list_length(&pairs);
-- 
2.43.0


