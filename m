Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E948DAEA220
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 17:14:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026653.1401854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUoIb-0004Ph-09; Thu, 26 Jun 2025 15:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026653.1401854; Thu, 26 Jun 2025 15:14:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUoIa-0004MU-Sp; Thu, 26 Jun 2025 15:14:00 +0000
Received: by outflank-mailman (input) for mailman id 1026653;
 Thu, 26 Jun 2025 15:13:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zZyX=ZJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uUoIZ-00046W-KG
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 15:13:59 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f48dc7d-52a0-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 17:13:59 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B1F7C21160;
 Thu, 26 Jun 2025 15:13:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5045C13188;
 Thu, 26 Jun 2025 15:13:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4PTTEbZjXWj1OgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 26 Jun 2025 15:13:58 +0000
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
X-Inumbo-ID: 2f48dc7d-52a0-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750950838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MsNYyEfvb5jYbzHJ2E51/v1/xsNYdiKTSuL/Sh/LsmA=;
	b=a2qkNvNUCc1rfEIgIGag4Fb7dMwh44gx1IcCc2s7uvXIqToLirV3Oo8TAfuLcXOVV7whg/
	GQbzV0Cwc/sfcBXan3FVq/ywlfN5lR8QHpRIv/KA/ziN+iyGjKskg40qn/EB3JHQ0Lg22x
	aPFluaB3it/q37XoQbYPTAPRFaDCW7o=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750950838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MsNYyEfvb5jYbzHJ2E51/v1/xsNYdiKTSuL/Sh/LsmA=;
	b=a2qkNvNUCc1rfEIgIGag4Fb7dMwh44gx1IcCc2s7uvXIqToLirV3Oo8TAfuLcXOVV7whg/
	GQbzV0Cwc/sfcBXan3FVq/ywlfN5lR8QHpRIv/KA/ziN+iyGjKskg40qn/EB3JHQ0Lg22x
	aPFluaB3it/q37XoQbYPTAPRFaDCW7o=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/3] Config: update Mini-OS commit id
Date: Thu, 26 Jun 2025 17:13:43 +0200
Message-ID: <20250626151344.6971-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250626151344.6971-1-jgross@suse.com>
References: <20250626151344.6971-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 

Use the newest Mini-OS.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index 3ebc9ac125..55b1b83d49 100644
--- a/Config.mk
+++ b/Config.mk
@@ -208,7 +208,7 @@ QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
 QEMU_UPSTREAM_REVISION ?= master
 
 MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
-MINIOS_UPSTREAM_REVISION ?= d273a44cec90dad5d3f0bc361a6fea41e0288a56
+MINIOS_UPSTREAM_REVISION ?= 2d3b22f842a969574cf967925b435c5913e8a6e0
 
 SEABIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/seabios.git
 SEABIOS_UPSTREAM_REVISION ?= rel-1.16.3
-- 
2.43.0


