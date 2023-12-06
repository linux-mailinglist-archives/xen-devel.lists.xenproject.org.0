Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92906806802
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 08:11:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648917.1012995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAm3W-0006Iw-F2; Wed, 06 Dec 2023 07:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648917.1012995; Wed, 06 Dec 2023 07:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAm3W-0006Ge-CO; Wed, 06 Dec 2023 07:10:50 +0000
Received: by outflank-mailman (input) for mailman id 648917;
 Wed, 06 Dec 2023 07:10:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lx6I=HR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rAm3V-0006G7-3z
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 07:10:49 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9489467a-9406-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 08:10:48 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 894701FCFA;
 Wed,  6 Dec 2023 07:10:47 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 5414A13403;
 Wed,  6 Dec 2023 07:10:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id g5o3E3cecGW0DQAAn2gu4w
 (envelope-from <jgross@suse.com>); Wed, 06 Dec 2023 07:10:47 +0000
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
X-Inumbo-ID: 9489467a-9406-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701846647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hDGYrruK/gE8BhhPs/pNrBuUXXpG5jh9JFmDAumCt+g=;
	b=m51hq4xHjOStUdOlrveBOiBDqyvxQimVF7+n3Nu8OH1jt5A4LZeX2i/gDIhweTMkb2ZYL4
	svgUW1qdVKsMDA5VQ+gSPFfRSeMpVmf0o8QQXWUs/k+h6Ox1tT97hbyaZX6zdn3AY3ZSME
	qunVfSCC1IMDnWAYFq7FxQ5W7pOqsp0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/3] xen/arm: set -mno-unaligned-access compiler option for Arm32
Date: Wed,  6 Dec 2023 08:10:37 +0100
Message-Id: <20231206071039.24435-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231206071039.24435-1-jgross@suse.com>
References: <20231206071039.24435-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ****
X-Spam-Score: 4.71
X-Spamd-Result: default: False [4.71 / 50.00];
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
	 NEURAL_HAM_SHORT(-0.19)[-0.931];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

As the hypervisor is disabling unaligned accesses for Arm32, set the
-mno-unaligned-access compiler option for building. This will prohibit
unaligned accesses when e.g. accessing 2- or 4-byte data items in
packed data structures.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 xen/arch/arm/arch.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index 58db76c4e1..022dcda192 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -7,6 +7,7 @@ $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
 # Prevent floating-point variables from creeping into Xen.
 CFLAGS-$(CONFIG_ARM_32) += -msoft-float
 CFLAGS-$(CONFIG_ARM_32) += -mcpu=cortex-a15
+CFLAGS-$(CONFIG_ARM_32) += -mno-unaligned-access
 
 CFLAGS-$(CONFIG_ARM_64) += -mcpu=generic
 CFLAGS-$(CONFIG_ARM_64) += -mgeneral-regs-only # No fp registers etc
-- 
2.35.3


