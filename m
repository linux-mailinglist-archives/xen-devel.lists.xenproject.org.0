Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF52684CB97
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 14:32:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677551.1054197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXi1E-0006bs-60; Wed, 07 Feb 2024 13:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677551.1054197; Wed, 07 Feb 2024 13:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXi1E-0006ZY-3C; Wed, 07 Feb 2024 13:31:16 +0000
Received: by outflank-mailman (input) for mailman id 677551;
 Wed, 07 Feb 2024 13:31:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D7mL=JQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rXi1C-0006ZS-T0
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 13:31:14 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 290b653f-c5bd-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 14:31:12 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AAED0222E0;
 Wed,  7 Feb 2024 13:31:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C54B139B9;
 Wed,  7 Feb 2024 13:31:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jbQHFR2Gw2W/HAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 07 Feb 2024 13:31:09 +0000
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
X-Inumbo-ID: 290b653f-c5bd-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707312671; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=m2KNOLFrtgTQyAwV3sA794wX+VsOWbUl4bE7mleClg4=;
	b=BHvtWdvuaomagskxwCJOLeBvflORnsvVhRAJFkyLAeAhPZ8JQ45oSOvGCJT6VodgYEGeYz
	tilF1h2xLYdYvpaZOtagheoIyFsKUFqUKuQGzafMl7FB6xisG1sMDWBL3/hUrlQSLXEuZ4
	i2y19OKbxg4a6HDLruheO4Ii2eIeDO0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707312669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=m2KNOLFrtgTQyAwV3sA794wX+VsOWbUl4bE7mleClg4=;
	b=P0VaZMVsqHg6BvpOPYIRSKlpfuVzKsa0ADtTxmXFz3M1E4im7HsGT6fHPsiSmxrcFCAxDS
	PdUj2695VC2u/wpDF2cEcleaqYwv+zNXM5AxeDgBldyNn5dIyx1UZ617aahLfmYHKXIDGU
	OF+arwZuqC/PpLx8Vr0ebAd0cwZW7e0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] config: update Mini-OS commit
Date: Wed,  7 Feb 2024 14:31:06 +0100
Message-Id: <20240207133106.6185-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [4.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[config.mk:url,suse.com:email,xen.org:url];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[15.33%]
X-Spam-Level: ****
X-Spam-Score: 4.90
X-Spam-Flag: NO

Update the Mini-OS upstream revision.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index f7d6d84847..077d841bb7 100644
--- a/Config.mk
+++ b/Config.mk
@@ -224,7 +224,7 @@ QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
 QEMU_UPSTREAM_REVISION ?= master
 
 MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
-MINIOS_UPSTREAM_REVISION ?= 090eeeb1631f00a9a41ebf66d9b4aacb97eb51e7
+MINIOS_UPSTREAM_REVISION ?= b119f0178fd86876d0678007dfcf435ab8bb7568
 
 SEABIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/seabios.git
 SEABIOS_UPSTREAM_REVISION ?= rel-1.16.3
-- 
2.35.3


