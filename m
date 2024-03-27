Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A7A88E8A5
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 16:23:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698614.1090561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpV7Y-0002Tx-Nx; Wed, 27 Mar 2024 15:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698614.1090561; Wed, 27 Mar 2024 15:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpV7Y-0002R8-K1; Wed, 27 Mar 2024 15:23:20 +0000
Received: by outflank-mailman (input) for mailman id 698614;
 Wed, 27 Mar 2024 15:23:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kcEO=LB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rpV7X-0007fn-3P
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 15:23:19 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efc82369-ec4d-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 16:23:17 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 48BE320CE4;
 Wed, 27 Mar 2024 15:23:17 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 0EAD313215;
 Wed, 27 Mar 2024 15:23:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id wSkuAuU5BGbIfgAAn2gu4w
 (envelope-from <jgross@suse.com>); Wed, 27 Mar 2024 15:23:17 +0000
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
X-Inumbo-ID: efc82369-ec4d-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1711552997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=svDhVGjKFzIPpcWjFYARn/2rWUfeidU+xfRiYlSjnX4=;
	b=hchFnFTpmvg2xILUuW8mlqB2nh83QyCO/EmARie/ZORSYtuJnBUo/zyJLY2HjVHqx09Elz
	aMaCJd0+9xLNObzCsolh41txPSQCTP0SXoMvzmysaK9xrz4NosL+/bITjscww81oqY4oMf
	9BN6qdzi0893vEzcaiyNbLNQnCouXuQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1711552997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=svDhVGjKFzIPpcWjFYARn/2rWUfeidU+xfRiYlSjnX4=;
	b=hchFnFTpmvg2xILUuW8mlqB2nh83QyCO/EmARie/ZORSYtuJnBUo/zyJLY2HjVHqx09Elz
	aMaCJd0+9xLNObzCsolh41txPSQCTP0SXoMvzmysaK9xrz4NosL+/bITjscww81oqY4oMf
	9BN6qdzi0893vEzcaiyNbLNQnCouXuQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 8/8] xen: allow up to 16383 cpus
Date: Wed, 27 Mar 2024 16:22:29 +0100
Message-Id: <20240327152229.25847-9-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240327152229.25847-1-jgross@suse.com>
References: <20240327152229.25847-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Level: ***
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Flag: NO

With lock handling now allowing up to 16384 cpus (spinlocks can handle
65535 cpus, rwlocks can handle 16384 cpus), raise the allowed limit for
the number of cpus to be configured to 16383.

The new limit is imposed by IOMMU_CMD_BUFFER_MAX_ENTRIES and
QINVAL_MAX_ENTRY_NR required to be larger than 2 * CONFIG_NR_CPUS.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V5:
- new patch (Jan Beulich)
---
 xen/arch/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index 67ba38f32f..308ce129a8 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -6,7 +6,7 @@ config PHYS_ADDR_T_32
 
 config NR_CPUS
 	int "Maximum number of CPUs"
-	range 1 4095
+	range 1 16383
 	default "256" if X86
 	default "8" if ARM && RCAR3
 	default "4" if ARM && QEMU
-- 
2.35.3


