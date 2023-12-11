Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F49F80CA9E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 14:16:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651785.1017618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCg96-0005fu-7n; Mon, 11 Dec 2023 13:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651785.1017618; Mon, 11 Dec 2023 13:16:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCg96-0005e4-3O; Mon, 11 Dec 2023 13:16:28 +0000
Received: by outflank-mailman (input) for mailman id 651785;
 Mon, 11 Dec 2023 13:16:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g7EY=HW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rCg94-0005MG-R0
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 13:16:26 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c2cf8f7-9827-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 14:16:25 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B425C1FB92;
 Mon, 11 Dec 2023 13:16:24 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 795FC134B0;
 Mon, 11 Dec 2023 13:16:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id n1BaHKgLd2XEUgAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 11 Dec 2023 13:16:24 +0000
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
X-Inumbo-ID: 7c2cf8f7-9827-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702300584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SgbXdYtzORxNSYsY9wikbAOanF5hYSOrLFRs1h5WPMc=;
	b=FqUpU3knHx6djprnV03piggikbpTI4HAh19/UxmXoSnlaDyy3pj/V0UVX3ivmL/VdAbfhG
	hYX0Q7omJZlRAd1mVDHmP0EUMamtCZ1TPcZxXZPBEddv2a+u4M/UmS+tME/AEI9dHt8J1M
	y2zoG9ak7Nygr0Pr9lcS/43z6TlSHwk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702300584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SgbXdYtzORxNSYsY9wikbAOanF5hYSOrLFRs1h5WPMc=;
	b=FqUpU3knHx6djprnV03piggikbpTI4HAh19/UxmXoSnlaDyy3pj/V0UVX3ivmL/VdAbfhG
	hYX0Q7omJZlRAd1mVDHmP0EUMamtCZ1TPcZxXZPBEddv2a+u4M/UmS+tME/AEI9dHt8J1M
	y2zoG9ak7Nygr0Pr9lcS/43z6TlSHwk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 1/3] xen/arm: set -mno-unaligned-access compiler option for Arm32
Date: Mon, 11 Dec 2023 14:16:14 +0100
Message-Id: <20231211131616.1839-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231211131616.1839-1-jgross@suse.com>
References: <20231211131616.1839-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: -0.30
X-Spam-Flag: NO
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.30
X-Spamd-Result: default: False [-0.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[8];
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

Backport: 4.15+
Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
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


