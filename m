Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 284144571CD
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 16:39:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228095.394610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo5yx-0004g4-Lv; Fri, 19 Nov 2021 15:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228095.394610; Fri, 19 Nov 2021 15:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo5yx-0004eI-Iv; Fri, 19 Nov 2021 15:39:19 +0000
Received: by outflank-mailman (input) for mailman id 228095;
 Fri, 19 Nov 2021 15:39:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spps=QG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mo5yv-0004e8-M3
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 15:39:17 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da8fa134-494e-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 16:39:16 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 205451FD38;
 Fri, 19 Nov 2021 15:39:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C5A7C13B35;
 Fri, 19 Nov 2021 15:39:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HM/1LiPFl2HIIwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 19 Nov 2021 15:39:15 +0000
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
X-Inumbo-ID: da8fa134-494e-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637336356; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1j1MNeLLIwQNenVL0GJ3LtVT6hsmn8LBmDa9I+SCdEA=;
	b=RRukonH7VR6a1V4h76tfh3yTxEh1jKqtgW3gZCl02/vOmRZrwXpGtTKwN9imaZUi+HXqEh
	+3AhXsHfIbOUPR7338tVCJ+O6KlQsKvsvZ3//UbZE/rqgP+yDnySYUTcEXjPcVb8wLEnZW
	1pnMgHlMZF+e7t7xPwxtiE0zE/fh958=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] xen/pvh: add missing prototype to header
Date: Fri, 19 Nov 2021 16:39:13 +0100
Message-Id: <20211119153913.21678-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The prototype of mem_map_via_hcall() is missing in its header, so add
it.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: a43fb7da53007e67ad ("xen/pvh: Move Xen code for getting mem map via hcall out of common file")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/xen/hypervisor.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/include/asm/xen/hypervisor.h b/arch/x86/include/asm/xen/hypervisor.h
index 4957f59deb40..5adab895127e 100644
--- a/arch/x86/include/asm/xen/hypervisor.h
+++ b/arch/x86/include/asm/xen/hypervisor.h
@@ -64,6 +64,7 @@ void xen_arch_unregister_cpu(int num);
 
 #ifdef CONFIG_PVH
 void __init xen_pvh_init(struct boot_params *boot_params);
+void __init mem_map_via_hcall(struct boot_params *boot_params_p);
 #endif
 
 #endif /* _ASM_X86_XEN_HYPERVISOR_H */
-- 
2.26.2


