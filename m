Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C124237E7
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 08:20:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202624.357610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY0HV-0003JK-7x; Wed, 06 Oct 2021 06:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202624.357610; Wed, 06 Oct 2021 06:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY0HV-0003Gp-3n; Wed, 06 Oct 2021 06:19:57 +0000
Received: by outflank-mailman (input) for mailman id 202624;
 Wed, 06 Oct 2021 06:19:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xI/c=O2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mY0HT-0003Gg-Ha
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 06:19:55 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f7ec06c-4b4d-4303-873d-9b48fc30823e;
 Wed, 06 Oct 2021 06:19:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8C6A622470;
 Wed,  6 Oct 2021 06:19:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 34CED13DF0;
 Wed,  6 Oct 2021 06:19:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id URSDCwlAXWGebAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 06 Oct 2021 06:19:53 +0000
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
X-Inumbo-ID: 5f7ec06c-4b4d-4303-873d-9b48fc30823e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1633501193; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=OEUzqfY9J3CJj8oYNpzjv2N/kxiY+V/QZvH33Q4Al1A=;
	b=iRZshKpiC7wF4aJj5AuGpMoKfhXQsUwB/PQWxgWHbFgtCRQFLYg1DoTtWDS8kxwUdPPK0j
	pvoYqwcdODu5OzsKZj0f9BjgRvVWgW0CXV8TQALMuH+bSDAccnaTbtFUDGNGPy1K4A2pZg
	w5dEBFIakM8iMcUprtaHxXfjg7YXLyQ=
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
	"H. Peter Anvin" <hpa@zytor.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] x86/pvh: add prototype for xen_pvh_init()
Date: Wed,  6 Oct 2021 08:19:50 +0200
Message-Id: <20211006061950.9227-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xen_pvh_init() is lacking a prototype in a header, add it.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/xen/hypervisor.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/include/asm/xen/hypervisor.h b/arch/x86/include/asm/xen/hypervisor.h
index ff4b52e37e60..4957f59deb40 100644
--- a/arch/x86/include/asm/xen/hypervisor.h
+++ b/arch/x86/include/asm/xen/hypervisor.h
@@ -62,4 +62,8 @@ void xen_arch_register_cpu(int num);
 void xen_arch_unregister_cpu(int num);
 #endif
 
+#ifdef CONFIG_PVH
+void __init xen_pvh_init(struct boot_params *boot_params);
+#endif
+
 #endif /* _ASM_X86_XEN_HYPERVISOR_H */
-- 
2.26.2


