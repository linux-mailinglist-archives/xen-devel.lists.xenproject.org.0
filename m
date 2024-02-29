Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3B986C973
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 13:48:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687040.1069789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffq5-0004Fg-Fm; Thu, 29 Feb 2024 12:48:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687040.1069789; Thu, 29 Feb 2024 12:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffq5-0004Dw-By; Thu, 29 Feb 2024 12:48:41 +0000
Received: by outflank-mailman (input) for mailman id 687040;
 Thu, 29 Feb 2024 12:48:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OAsO=KG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rffq3-0003qK-B0
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 12:48:39 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbe42f33-d700-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 13:48:38 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2A3911F7DD;
 Thu, 29 Feb 2024 12:48:38 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id C44851329E;
 Thu, 29 Feb 2024 12:48:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id SwVzLiV94GULIgAAn2gu4w
 (envelope-from <jgross@suse.com>); Thu, 29 Feb 2024 12:48:37 +0000
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
X-Inumbo-ID: dbe42f33-d700-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709210918; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IKydSM4pbIaFxQw0VTkeodepd55HC/WaytggrgVsJrc=;
	b=o1wAnnmiRwJMwM2zCwT0uQlWyz01/ktW0S7yxx4D7FuoMRPp7fqDVlFT6lmWsgbGHIzu7B
	x3u2LDmmdXrq1WRpNVc+c8w5GOvquv1/aSsCtVJdiRDRxwhsvQb5SqPe0AvzsvSFuujZV/
	W96xrsoJRllA4yrwWqL2nYctUGwAfRg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709210918; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IKydSM4pbIaFxQw0VTkeodepd55HC/WaytggrgVsJrc=;
	b=o1wAnnmiRwJMwM2zCwT0uQlWyz01/ktW0S7yxx4D7FuoMRPp7fqDVlFT6lmWsgbGHIzu7B
	x3u2LDmmdXrq1WRpNVc+c8w5GOvquv1/aSsCtVJdiRDRxwhsvQb5SqPe0AvzsvSFuujZV/
	W96xrsoJRllA4yrwWqL2nYctUGwAfRg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v9 1/6] config: update Mini-OS commit
Date: Thu, 29 Feb 2024 13:48:25 +0100
Message-Id: <20240229124830.13680-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240229124830.13680-1-jgross@suse.com>
References: <20240229124830.13680-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
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
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[34.07%]
X-Spam-Level: ****
X-Spam-Score: 4.90
X-Spam-Flag: NO

Update the Mini-OS upstream revision.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V9:
- new patch
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index 6f6e0425ba..a962f095ca 100644
--- a/Config.mk
+++ b/Config.mk
@@ -224,7 +224,7 @@ QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
 QEMU_UPSTREAM_REVISION ?= master
 
 MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
-MINIOS_UPSTREAM_REVISION ?= 2bc8dbb9b6111113d27455cbca318ea337309c04
+MINIOS_UPSTREAM_REVISION ?= b6a5b4d72b88e5c4faed01f5a44505de022860fc
 
 SEABIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/seabios.git
 SEABIOS_UPSTREAM_REVISION ?= rel-1.16.3
-- 
2.35.3


