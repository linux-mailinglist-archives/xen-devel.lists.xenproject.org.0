Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0037E59ACD8
	for <lists+xen-devel@lfdr.de>; Sat, 20 Aug 2022 11:26:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390685.628246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPKjg-0007qN-SD; Sat, 20 Aug 2022 09:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390685.628246; Sat, 20 Aug 2022 09:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPKjg-0007hw-J8; Sat, 20 Aug 2022 09:25:44 +0000
Received: by outflank-mailman (input) for mailman id 390685;
 Sat, 20 Aug 2022 09:25:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cfLG=YY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oPKje-0006NK-Jp
 for xen-devel@lists.xenproject.org; Sat, 20 Aug 2022 09:25:42 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0dc3056f-206a-11ed-9250-1f966e50362f;
 Sat, 20 Aug 2022 11:25:38 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B0B3034367;
 Sat, 20 Aug 2022 09:25:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 728BA13440;
 Sat, 20 Aug 2022 09:25:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mIm5GpKoAGPJMAAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 20 Aug 2022 09:25:38 +0000
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
X-Inumbo-ID: 0dc3056f-206a-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660987538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UlbRhwJUB+EdBZOc37IvbCp3QAOY+aESAq1E4i9TKiY=;
	b=JshuIRAceP6IJvA0riFQZSd2Htq4cpLIftqmAiiPsVriEG1H1DgpOwVRp2+8gYx4bUYnBb
	sQbmVHPAY3GUOWlsvTHo51jdOnlUOMv3p5HaCzn7K4N9tsevg+T3Ozz1KMjE1SvLp4mQu8
	n4aCd4tPKKFeEe1Nguuec2jpFNoUCig=
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
Subject: [PATCH v2 06/10] x86/mtrr: remove set_all callback from struct mtrr_ops
Date: Sat, 20 Aug 2022 11:25:29 +0200
Message-Id: <20220820092533.29420-7-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220820092533.29420-1-jgross@suse.com>
References: <20220820092533.29420-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using an indirect call to mtrr_if->set_all just call the
only possible target cache_cpu_init() directly. This enables to remove
the set_all callback from struct mtrr_ops.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/kernel/cpu/mtrr/generic.c |  1 -
 arch/x86/kernel/cpu/mtrr/mtrr.c    | 10 +++++-----
 arch/x86/kernel/cpu/mtrr/mtrr.h    |  2 --
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/cpu/mtrr/generic.c b/arch/x86/kernel/cpu/mtrr/generic.c
index 0be6d43ec1fe..1c6260b94cb9 100644
--- a/arch/x86/kernel/cpu/mtrr/generic.c
+++ b/arch/x86/kernel/cpu/mtrr/generic.c
@@ -848,7 +848,6 @@ int positive_have_wrcomb(void)
  * Generic structure...
  */
 const struct mtrr_ops generic_mtrr_ops = {
-	.set_all		= cache_cpu_init,
 	.get			= generic_get_mtrr,
 	.get_free_region	= generic_get_free_region,
 	.set			= generic_set_mtrr,
diff --git a/arch/x86/kernel/cpu/mtrr/mtrr.c b/arch/x86/kernel/cpu/mtrr/mtrr.c
index 4cd9c8d1473e..19662ab057be 100644
--- a/arch/x86/kernel/cpu/mtrr/mtrr.c
+++ b/arch/x86/kernel/cpu/mtrr/mtrr.c
@@ -165,15 +165,15 @@ static int mtrr_rendezvous_handler(void *info)
 	 * saved, and we want to replicate that across all the cpus that come
 	 * online (either at the end of boot or resume or during a runtime cpu
 	 * online). If we're doing that, @reg is set to something special and on
-	 * all the cpu's we do mtrr_if->set_all() (On the logical cpu that
+	 * all the cpu's we do cache_cpu_init() (On the logical cpu that
 	 * started the boot/resume sequence, this might be a duplicate
-	 * set_all()).
+	 * cache_cpu_init()).
 	 */
 	if (data->smp_reg != ~0U) {
 		mtrr_if->set(data->smp_reg, data->smp_base,
 			     data->smp_size, data->smp_type);
 	} else if (mtrr_aps_delayed_init || !cpu_online(smp_processor_id())) {
-		mtrr_if->set_all();
+		cache_cpu_init();
 	}
 	return 0;
 }
@@ -768,7 +768,7 @@ void __init mtrr_bp_init(void)
 
 			if (mtrr_cleanup(phys_addr)) {
 				changed_by_mtrr_cleanup = 1;
-				mtrr_if->set_all();
+				cache_cpu_init();
 			}
 		}
 	}
@@ -854,7 +854,7 @@ void mtrr_bp_restore(void)
 	if (!cache_generic)
 		return;
 
-	mtrr_if->set_all();
+	cache_cpu_init();
 }
 
 static int __init mtrr_init_finialize(void)
diff --git a/arch/x86/kernel/cpu/mtrr/mtrr.h b/arch/x86/kernel/cpu/mtrr/mtrr.h
index 88b1c4b6174a..3b1883185185 100644
--- a/arch/x86/kernel/cpu/mtrr/mtrr.h
+++ b/arch/x86/kernel/cpu/mtrr/mtrr.h
@@ -16,8 +16,6 @@ struct mtrr_ops {
 	u32	vendor;
 	void	(*set)(unsigned int reg, unsigned long base,
 		       unsigned long size, mtrr_type type);
-	void	(*set_all)(void);
-
 	void	(*get)(unsigned int reg, unsigned long *base,
 		       unsigned long *size, mtrr_type *type);
 	int	(*get_free_region)(unsigned long base, unsigned long size,
-- 
2.35.3


