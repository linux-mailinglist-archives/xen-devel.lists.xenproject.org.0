Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FFF73191A
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 14:40:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549581.858185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9mGj-0002Cy-25; Thu, 15 Jun 2023 12:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549581.858185; Thu, 15 Jun 2023 12:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9mGi-000299-Ur; Thu, 15 Jun 2023 12:40:04 +0000
Received: by outflank-mailman (input) for mailman id 549581;
 Thu, 15 Jun 2023 12:40:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h2I2=CD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q9mGh-0001pM-AI
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 12:40:03 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be9bd698-0b79-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 14:40:01 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 38D70223DE;
 Thu, 15 Jun 2023 12:40:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D010513A47;
 Thu, 15 Jun 2023 12:40:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JJxjMaAGi2T1OQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 15 Jun 2023 12:40:00 +0000
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
X-Inumbo-ID: be9bd698-0b79-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1686832801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sLKvpHmhwxzhGsa8RD9GXj1E3Cqd53RX8qPUzRGgONI=;
	b=Adcvt8jp3J6VJHStWp7XI8UqjjBdIO+60lveaGrjsR2IoO908L/uW+lrRpAlKri7Tr1U1b
	0rSAZhSTlsBqaIbAeAjCVNdKHFRgkFCQ/FRCyulDtp7vEKz/s5lL6REthbZkfhlyB+L2PA
	Eawu3ARj6wsxY5ljRaIEnRG2FZSLwEo=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH] x86/xen: set default memory type for pv guests to WB
Date: Thu, 15 Jun 2023 14:39:59 +0200
Message-Id: <20230615123959.12298-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running as an unprivileged PV-guest under Xen (not dom0), the
default MTRR memory type should be write-back.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
Based on tip x86/mtrr branch
---
 arch/x86/xen/enlighten_pv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 8732b85d5650..93b658248d01 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -187,6 +187,8 @@ static void __init xen_pv_init_platform(void)
 
 	if (xen_initial_domain())
 		xen_set_mtrr_data();
+	else
+		mtrr_overwrite_state(NULL, 0, MTRR_TYPE_WRBACK);
 }
 
 static void __init xen_pv_guest_late_init(void)
-- 
2.35.3


