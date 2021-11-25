Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 165F345D714
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 10:21:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230753.398912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqAwA-00082j-7o; Thu, 25 Nov 2021 09:21:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230753.398912; Thu, 25 Nov 2021 09:21:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqAwA-0007wF-2T; Thu, 25 Nov 2021 09:21:02 +0000
Received: by outflank-mailman (input) for mailman id 230753;
 Thu, 25 Nov 2021 09:21:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ia/m=QM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mqAw8-0007rb-Ja
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 09:21:00 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00683bef-4dd1-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 10:20:59 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E58DA1FDF2;
 Thu, 25 Nov 2021 09:20:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8CB9113F7C;
 Thu, 25 Nov 2021 09:20:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wJ4+IXpVn2FpHwAAMHmgww
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
X-Inumbo-ID: 00683bef-4dd1-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637832058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j+kg43gH5f/VeO+5uCJZLTpM/p/LHUGCKqHELE4mgbs=;
	b=acI1XCkmVlG9zzoj+M7uftnNs2xwfPfCf6ZvidUV5Yf7QJ4/5/sOfIZw7H1xuXnCIV6A9c
	WgtZouaHhstKIjaKqHajqioTe1yx98HP9AIciRp1G6D0MungIx0Suz1uPkHl93twsrgWpa
	5JFBYJekN2DzK8HLq7z0R/RkHvHWzuE=
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
Subject: [PATCH 1/2] xen: make HYPERVISOR_get_debugreg() always_inline
Date: Thu, 25 Nov 2021 10:20:55 +0100
Message-Id: <20211125092056.24758-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211125092056.24758-1-jgross@suse.com>
References: <20211125092056.24758-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HYPERVISOR_get_debugreg() is being called from noinstr code, so it
should be attributed "always_inline".

Fixes: f4afb713e5c3a4419ba ("x86/xen: Make get_debugreg() noinstr")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/xen/hypercall.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/xen/hypercall.h b/arch/x86/include/asm/xen/hypercall.h
index 0575f5863b7f..28ca1119606b 100644
--- a/arch/x86/include/asm/xen/hypercall.h
+++ b/arch/x86/include/asm/xen/hypercall.h
@@ -287,7 +287,7 @@ HYPERVISOR_set_debugreg(int reg, unsigned long value)
 	return _hypercall2(int, set_debugreg, reg, value);
 }
 
-static inline unsigned long
+static __always_inline unsigned long
 HYPERVISOR_get_debugreg(int reg)
 {
 	return _hypercall1(unsigned long, get_debugreg, reg);
-- 
2.26.2


