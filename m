Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBC0998C73
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 17:55:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816343.1230584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syvVa-0002bH-T9; Thu, 10 Oct 2024 15:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816343.1230584; Thu, 10 Oct 2024 15:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syvVa-0002Xs-QG; Thu, 10 Oct 2024 15:55:22 +0000
Received: by outflank-mailman (input) for mailman id 816343;
 Thu, 10 Oct 2024 15:55:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rEWG=RG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1syvVY-0002EK-Rh
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 15:55:20 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c964bee-8720-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 17:55:19 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 04D931FB68;
 Thu, 10 Oct 2024 15:55:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CDA7913A6E;
 Thu, 10 Oct 2024 15:55:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 3TjAMOb4B2e6BAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 10 Oct 2024 15:55:18 +0000
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
X-Inumbo-ID: 0c964bee-8720-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728575719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jawzLmSLqlOX3R4myb7g2jhU88qFTv5EWOeT/Uv/Ceo=;
	b=l80+H8Y598z7yAwKfGUKtBuObPh0Yl7z/+pewJSMK0jfrxRmK3tAAMzXnl9x4ZAPAdx3SP
	2AL/3CBRYqZIFRBbxy6JX5qzLAKXaUlkNDicIsrK0gxPgP6VcQ69yQiObXfwX7DK0BM5VD
	je3Dk2C+sRXjpy2BPSyTODwZ8DMfauo=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728575719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jawzLmSLqlOX3R4myb7g2jhU88qFTv5EWOeT/Uv/Ceo=;
	b=l80+H8Y598z7yAwKfGUKtBuObPh0Yl7z/+pewJSMK0jfrxRmK3tAAMzXnl9x4ZAPAdx3SP
	2AL/3CBRYqZIFRBbxy6JX5qzLAKXaUlkNDicIsrK0gxPgP6VcQ69yQiObXfwX7DK0BM5VD
	je3Dk2C+sRXjpy2BPSyTODwZ8DMfauo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH 3/3] stubdom: use real lib dependencies for xenstore stubdoms
Date: Thu, 10 Oct 2024 17:54:59 +0200
Message-ID: <20241010155459.22389-4-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241010155459.22389-1-jgross@suse.com>
References: <20241010155459.22389-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.992];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Today the build of Xenstore stubdoms depend on libxenguest just because
libxenguest depends on all needed libraries. In reality there is no
dependency on libxenguest for Xenstore stubdoms.

Use the actual dependencies instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 stubdom/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/stubdom/Makefile b/stubdom/Makefile
index 6ed4253b25..2a81af28a1 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -523,12 +523,14 @@ else
 pv-grub-if-enabled:
 endif
 
+XENSTORE_DEPS := libxenevtchn libxengnttab libxenctrl
+
 .PHONY: xenstore-stubdom
-xenstore-stubdom: mini-os-$(XEN_TARGET_ARCH)-xenstore libxenguest xenstore
+xenstore-stubdom: mini-os-$(XEN_TARGET_ARCH)-xenstore $(XENSTORE_DEPS) xenstore
 	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/xenstore-minios.gen.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS=$(CURDIR)/xenstore/xenstored.a
 
 .PHONY: xenstorepvh-stubdom
-xenstorepvh-stubdom: mini-os-$(XEN_TARGET_ARCH)-xenstorepvh libxenguest xenstorepvh
+xenstorepvh-stubdom: mini-os-$(XEN_TARGET_ARCH)-xenstorepvh $(XENSTORE_DEPS) xenstorepvh
 	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/xenstorepvh-minios.gen.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS=$(CURDIR)/xenstorepvh/xenstored.a
 
 #########
-- 
2.43.0


