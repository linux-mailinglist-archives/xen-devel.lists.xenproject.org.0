Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E38245D713
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 10:21:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230754.398926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqAwK-00007r-GF; Thu, 25 Nov 2021 09:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230754.398926; Thu, 25 Nov 2021 09:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqAwK-0008WF-Bf; Thu, 25 Nov 2021 09:21:12 +0000
Received: by outflank-mailman (input) for mailman id 230754;
 Thu, 25 Nov 2021 09:21:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ia/m=QM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mqAwJ-0008Uo-D1
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 09:21:11 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00949656-4dd1-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 10:21:02 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 40F851FDF3;
 Thu, 25 Nov 2021 09:20:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E9EFA13F62;
 Thu, 25 Nov 2021 09:20:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qJGiN3pVn2FpHwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 25 Nov 2021 09:20:58 +0000
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
X-Inumbo-ID: 00949656-4dd1-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637832059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rll1uYbFob7J30NMc3pj9IfWKE4UB2l0V0OWrDn+p70=;
	b=MAzp7gBiss3bNz8fRBLhUjFo+YXsTYcsfFvb3J7ImaGbepkDIH1SGe2msLKgNFXEi4OVni
	B0I5WH/p73MjCakbEsECLNUqv+zu05JoecDnZnOZYPBEyKeSHyHbMQFKS+3bLIB6PDimN7
	tcANznhZd2iK8u9yf/+8D/pWWmbMcdk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: peterz@infradead.org,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 2/2] xen: make HYPERVISOR_set_debugreg() always_inline
Date: Thu, 25 Nov 2021 10:20:56 +0100
Message-Id: <20211125092056.24758-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211125092056.24758-1-jgross@suse.com>
References: <20211125092056.24758-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HYPERVISOR_set_debugreg() is being called from noinstr code, so it
should be attributed "always_inline".

Fixes: 7361fac0465ba96ec8f ("x86/xen: Make set_debugreg() noinstr")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/xen/hypercall.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/xen/hypercall.h b/arch/x86/include/asm/xen/hypercall.h
index 28ca1119606b..e5e0fe10c692 100644
--- a/arch/x86/include/asm/xen/hypercall.h
+++ b/arch/x86/include/asm/xen/hypercall.h
@@ -281,7 +281,7 @@ HYPERVISOR_callback_op(int cmd, void *arg)
 	return _hypercall2(int, callback_op, cmd, arg);
 }
 
-static inline int
+static __always_inline int
 HYPERVISOR_set_debugreg(int reg, unsigned long value)
 {
 	return _hypercall2(int, set_debugreg, reg, value);
-- 
2.26.2


