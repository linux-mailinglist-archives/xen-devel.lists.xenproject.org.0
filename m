Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD0C989B28
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 09:15:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807024.1218206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svAd5-0008Rv-P8; Mon, 30 Sep 2024 07:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807024.1218206; Mon, 30 Sep 2024 07:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svAd5-0008PF-JR; Mon, 30 Sep 2024 07:15:35 +0000
Received: by outflank-mailman (input) for mailman id 807024;
 Mon, 30 Sep 2024 07:15:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w5k4=Q4=flex--ardb.bounces.google.com=3FFD6ZggKCds7OA8+DFQDLLDIB.9LJUBK-ABSBIIFPQP.UBKMOLGB9Q.LOD@srs-se1.protection.inumbo.net>)
 id 1svAd3-0007gP-Pg
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 07:15:33 +0000
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com
 [2a00:1450:4864:20::449])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c84aff87-7efb-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 09:15:33 +0200 (CEST)
Received: by mail-wr1-x449.google.com with SMTP id
 ffacd0b85a97d-37cccd94a69so1929893f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 00:15:33 -0700 (PDT)
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
X-Inumbo-ID: c84aff87-7efb-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727680533; x=1728285333; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ih9d+rTLUr2iQKQ8WDSsNfedIcM8p6qAJVAZ/ooKdqM=;
        b=rg2SmShXzwPITJ3Le0dk0CpWA6wJhcsd07brO6yA2/An0ngjQLFG9DmpezhtgXMydp
         E9BmhD6/7p2XBfjbwBPXEACLyRVFQu33jonoCbltcCg8/Q05f4ZyyEfcFQ1SFFb3Hf0E
         kkgIIEraCmL4Bg6GnNyVjykT/ezZaTQOx3fdmcBxsWlU7l4a9YZRDeRCSCkVyY59nZKL
         eyARE2hOfHR8vyjU85q3pqy0rSTBTtzmDBe2LbXU6EYCaENADySdrBc/M5KYz8DdE0zX
         HW9HoFsYWqF2ufA++GThxKijrdEO2MJZiiehP6isXT7rGKVAuYOTAz8TBONpS4XYUy6R
         X/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727680533; x=1728285333;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ih9d+rTLUr2iQKQ8WDSsNfedIcM8p6qAJVAZ/ooKdqM=;
        b=UXw7LfCI8G0fDpkN8poBvbeR4r711x3j+Me3fXiOoeCvSI+nJlcQnQWYTqawIk0aiN
         JhbffbosI7ayJPpcV3rn0Gd0JGI/jcZ5W/K8ig6E4lx1h1SedNByvjvMrHggH4tYWL9X
         0S/IOVw32oNxZOEPai89UsXm7q9QCIj6I5CqxiG/vMzrKrdcEfBWrE9vpm0pUC1YCJvF
         KbyN14VMEsNbHjqD/y6P0G9bUO7ALGL0n5DuUZU0j80vv0w6AoUvlvbMSR3x0bl5+faj
         1peqMafaA/LI2YY4tsefUt/FZGg0XAWDJs37PjnOkHPQ/fJuDbrtC3jFeg5YcshIj0ZE
         V9ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUbI2wUcEu6SLdM28ujps6skDIojaHbQfWb13VOpBo5UsfOyIlQZZjxGaxCYLQwcoTCMub2vyQKHn0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVTpj+Lx9stVtSbddynq0F0YePS1NQ+LwTL9kawfTlMauZmGOt
	Phkxw5pg3q1sqxwC8k4+Y+7ykZmj/gt6ejxX+1+g2MI7blUKGT/RWE1vixysEyIJmWNneA==
X-Google-Smtp-Source: AGHT+IGgyhRnUwbTAj2kGZmw/vLPY3l1QpRNk0KAuY9a6bXPJX2/eiNIm+l7VxrERelrDYte7R+7XXJS
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:adf:cd90:0:b0:37c:d569:467c with SMTP id
 ffacd0b85a97d-37cd5b1de24mr6223f8f.9.1727680532382; Mon, 30 Sep 2024 00:15:32
 -0700 (PDT)
Date: Mon, 30 Sep 2024 09:15:17 +0200
In-Reply-To: <20240930071513.909462-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20240930071513.909462-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006; i=ardb@kernel.org;
 h=from:subject; bh=EGjxvAOcfFb2eior18qrLfn0YVRiZmxOws+RVk4EJNQ=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe1XAFs4e+aKv7/bb1hbz/Ja+/n4Jcvni89UOJWapK5ee
 6Zrb8rxjlIWBjEOBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCRU1sZ/vC0mHzPPSZTfPbz
 upN7a2oM50gu7Fx0f6rGJ8bu9o/y15QZGXbybPrXdTs3WODNymtrszU/y8/kq363O9D9ZvHiwpW iOqwA
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240930071513.909462-10-ardb+git@google.com>
Subject: [PATCH v2 3/5] x86/pvh: Omit needless clearing of phys_base
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Since commit

  d9ec1158056b ("x86/boot/64: Use RIP_REL_REF() to assign 'phys_base'")

phys_base is assigned directly rather than added to, so it is no longer
necessary to clear it after use.

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Tested-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/platform/pvh/head.S | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index 5a196fb3ebd8..7ca51a4da217 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -180,13 +180,6 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 	ANNOTATE_RETPOLINE_SAFE
 	call *%rax
 
-	/*
-	 * Clear phys_base.  __startup_64 will *add* to its value,
-	 * so reset to 0.
-	 */
-	xor  %rbx, %rbx
-	movq %rbx, phys_base(%rip)
-
 	/* startup_64 expects boot_params in %rsi. */
 	lea pvh_bootparams(%rip), %rsi
 	jmp startup_64
-- 
2.46.1.824.gd892dcdcdd-goog


