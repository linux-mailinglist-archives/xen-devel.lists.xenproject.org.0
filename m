Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8B85576F5
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 11:46:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354729.582011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4JPl-0000bs-PR; Thu, 23 Jun 2022 09:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354729.582011; Thu, 23 Jun 2022 09:46:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4JPl-0000Up-Iw; Thu, 23 Jun 2022 09:46:17 +0000
Received: by outflank-mailman (input) for mailman id 354729;
 Thu, 23 Jun 2022 09:46:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j28/=W6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o4JPk-0008LX-32
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 09:46:16 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 508d46e9-f2d9-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 11:46:11 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B6B731FD8B;
 Thu, 23 Jun 2022 09:46:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7291713AB2;
 Thu, 23 Jun 2022 09:46:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4A6NGmM2tGLmLwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Jun 2022 09:46:11 +0000
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
X-Inumbo-ID: 508d46e9-f2d9-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655977571; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JeJlzEy9S9HO3UBMbEaEgVpv+aw7L6zfG0jvSaFE4ro=;
	b=XTE+RGVoZDWEOCRBYwyFcbohYpKJ0tpbYKgmRUWXHS0+VkUaHPYT85AzuVlQqwIoTHLAGh
	tgsvveadD+BFZE0w4NEj2C0G9PIi/KMBvbG23r1w+/0eAt/LTSkuq9N7QERf5nCB7vjHbS
	0Tqza47Z5amQO5OYJVc/LVLFHU2SiTw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 2/3] x86: fix setup of brk area
Date: Thu, 23 Jun 2022 11:46:07 +0200
Message-Id: <20220623094608.7294-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220623094608.7294-1-jgross@suse.com>
References: <20220623094608.7294-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit e32683c6f7d2 ("x86/mm: Fix RESERVE_BRK() for older binutils")
put the brk area into the .bss..brk section (placed directly behind
.bss), causing it not to be cleared initially. As the brk area is used
to allocate early page tables, these might contain garbage in not
explicitly written entries.

This is especially a problem for Xen PV guests, as the hypervisor will
validate page tables (check for writable page tables and hypervisor
private bits) before accepting them to be used. There have been reports
of early crashes of PV guests due to illegal page table contents.

Fix that by letting clear_bss() clear the brk area, too.

Fixes: e32683c6f7d2 ("x86/mm: Fix RESERVE_BRK() for older binutils")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/kernel/head64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index e7e233209a8c..6a3cfaf6b72a 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -430,6 +430,8 @@ void __init clear_bss(void)
 {
 	memset(__bss_start, 0,
 	       (unsigned long) __bss_stop - (unsigned long) __bss_start);
+	memset(__brk_base, 0,
+	       (unsigned long) __brk_limit - (unsigned long) __brk_base);
 }
 
 static unsigned long get_cmd_line_ptr(void)
-- 
2.35.3


