Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7904AF0DB4
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:20:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030442.1404157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsi2-0005cd-89; Wed, 02 Jul 2025 08:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030442.1404157; Wed, 02 Jul 2025 08:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsi2-0005ZX-12; Wed, 02 Jul 2025 08:20:50 +0000
Received: by outflank-mailman (input) for mailman id 1030442;
 Wed, 02 Jul 2025 08:20:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWsb6-00082X-5G
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:13:40 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 748514af-571c-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 10:13:37 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DD8FF1F455;
 Wed,  2 Jul 2025 08:13:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B2B1C13A24;
 Wed,  2 Jul 2025 08:13:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Pw4yKi/qZGgsSQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 02 Jul 2025 08:13:35 +0000
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
X-Inumbo-ID: 748514af-571c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444015; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wEXVr7vNx+ZD3Vi9tkKFmxXn75/3BjiD+2cTf/nfsPU=;
	b=DRmgtjhVTWWoTjcAfdrtBYBnCh/qJnjjXQjEivWo5tYvJlVtid2a8AcbthfIH88xh7N6M4
	+XBK80SwRIp+v0zq/WUNSoBhKFtce8p/mOd2HxSRkfDs24o022EYEBIK4K5Qx/LEcEJrBW
	49LN+zTB0TqWYSTHAabEoJLqRM9ti+0=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444015; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wEXVr7vNx+ZD3Vi9tkKFmxXn75/3BjiD+2cTf/nfsPU=;
	b=DRmgtjhVTWWoTjcAfdrtBYBnCh/qJnjjXQjEivWo5tYvJlVtid2a8AcbthfIH88xh7N6M4
	+XBK80SwRIp+v0zq/WUNSoBhKFtce8p/mOd2HxSRkfDs24o022EYEBIK4K5Qx/LEcEJrBW
	49LN+zTB0TqWYSTHAabEoJLqRM9ti+0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 4/9] libxengnttab: set the cloexec flag on Mini-OS
Date: Wed,  2 Jul 2025 10:13:00 +0200
Message-ID: <20250702081305.14440-5-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702081305.14440-1-jgross@suse.com>
References: <20250702081305.14440-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 

With Mini-OS now supporting the O_CLOEXEC flag for the kexec case,
set the related cloexec flag in minios.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/gnttab/minios.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/libs/gnttab/minios.c b/tools/libs/gnttab/minios.c
index cac89f0ba6..63bbdc7719 100644
--- a/tools/libs/gnttab/minios.c
+++ b/tools/libs/gnttab/minios.c
@@ -74,6 +74,7 @@ int osdep_gnttab_open(xengnttab_handle *xgt)
     }
 
     file->dev = gntmap;
+    file->cloexec = true;
     gntmap_init(gntmap);
     xgt->fd = fd;
     return 0;
-- 
2.43.0


