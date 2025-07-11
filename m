Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA765B01779
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 11:20:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040693.1412042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua9v5-000131-6t; Fri, 11 Jul 2025 09:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040693.1412042; Fri, 11 Jul 2025 09:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua9v5-00010B-3w; Fri, 11 Jul 2025 09:19:51 +0000
Received: by outflank-mailman (input) for mailman id 1040693;
 Fri, 11 Jul 2025 09:19:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s7n+=ZY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ua9v3-0000xr-7L
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 09:19:49 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 311f868d-5e38-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 11:19:48 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A528C1F74C;
 Fri, 11 Jul 2025 09:19:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7EC8E1388B;
 Fri, 11 Jul 2025 09:19:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id PCUwHTLXcGjgaQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 11 Jul 2025 09:19:46 +0000
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
X-Inumbo-ID: 311f868d-5e38-11f0-a318-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752225586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QzcJOl9vFJve+fYMCHaXRcDlES2yBRKN5Tol9lJDW1M=;
	b=qAEJyisulfP2ddE3piVaiwe881IU+NYFQFwM+HcLm7SN7bpcJ0l/FH4sTvv4K6n9PCEN/n
	Q8oXlEzbVaJ0QaujcyBlc1lhzOPUbaS/RSxjChv+1EvJXPaQArXP14x6F7Y9UnqcfDny/e
	ZWgW+6JyqJcp8358CV9OmSkyzzVrc9w=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=qAEJyisu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752225586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QzcJOl9vFJve+fYMCHaXRcDlES2yBRKN5Tol9lJDW1M=;
	b=qAEJyisulfP2ddE3piVaiwe881IU+NYFQFwM+HcLm7SN7bpcJ0l/FH4sTvv4K6n9PCEN/n
	Q8oXlEzbVaJ0QaujcyBlc1lhzOPUbaS/RSxjChv+1EvJXPaQArXP14x6F7Y9UnqcfDny/e
	ZWgW+6JyqJcp8358CV9OmSkyzzVrc9w=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] libxl: allow to run non-HVM guest without any device model being available
Date: Fri, 11 Jul 2025 11:19:44 +0200
Message-ID: <20250711091944.26603-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: A528C1F74C
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

When removing qemu-trad support, libxl__domain_build_info_setdefault()
was modified to only allow qemu-xen as a device model. This change
resulted in an error at domain creation when qemu-xen isn't there.

As this is a perfectly fine situation for PV and PVH guests without
any qemu based backends, handle this case gracefully.

Fixes: 19ab8356abe4 ("tools: remove support for running a guest with qemu-traditional")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/light/libxl_create.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 8a85fba1cf..dad7ad0fda 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -105,8 +105,8 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
         dm = libxl__domain_device_model(gc, b_info);
         rc = access(dm, X_OK);
         if (rc < 0) {
-            LOGE(ERROR, "qemu-xen access error");
-            return ERROR_FAIL;
+            LOGE(INFO, "qemu-xen is unavailable");
+            b_info->device_model_version = LIBXL_DEVICE_MODEL_VERSION_UNKNOWN;
         }
     }
 
-- 
2.43.0


