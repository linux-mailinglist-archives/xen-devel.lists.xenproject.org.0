Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 669A8989B26
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 09:15:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807022.1218185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svAd2-0007uF-5g; Mon, 30 Sep 2024 07:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807022.1218185; Mon, 30 Sep 2024 07:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svAd2-0007sT-2c; Mon, 30 Sep 2024 07:15:32 +0000
Received: by outflank-mailman (input) for mailman id 807022;
 Mon, 30 Sep 2024 07:15:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OsbY=Q4=flex--ardb.bounces.google.com=3D1D6ZggKCdY2J53+8AL8GG8D6.4GEP6F-56N6DDAKLK.P6FHJGB64L.GJ8@srs-se1.protection.inumbo.net>)
 id 1svAd0-0007gP-9c
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 07:15:30 +0000
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [2607:f8b0:4864:20::114a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c563d1c4-7efb-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 09:15:29 +0200 (CEST)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6ddbcc96984so59785677b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 00:15:29 -0700 (PDT)
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
X-Inumbo-ID: c563d1c4-7efb-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727680528; x=1728285328; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HsZTXhwK3mXXOhRjtLwXUoeG4XCPMITRRWukmjYsd98=;
        b=r5BvIWjhzgBZLXiFsnaR7700yj/lo3uMYDxrusVnxnFM22T4O6+rf5zcui6B0oxxRx
         uZSrkSDZwv7zMoVRDvC7XBnJ94PDbUVFXAG64mxvlBfOTNfj0Z20oQZjNQk2B5tCTpuy
         QcMqM09q2kVl+TQKXOCsUawMhyIH5flhKmkoqLndxTj6HvTSQHbjhwtKu3GKjATxXmq4
         QLCjbllOu6p5ChA3Jp6Sar751mHvhfqLQM6oGu5tYRFUdGf2bIAknHMNC9MGuFbJPlBj
         ka3MOrOQViBp7IGzzzWBlBPTk3DeWJZup7rvoTRXaHUg/llgxLjWGbzbyAz9pD2vxo7W
         dbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727680528; x=1728285328;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HsZTXhwK3mXXOhRjtLwXUoeG4XCPMITRRWukmjYsd98=;
        b=Ux3Qs+Xi5ioYMOhuGlHPSXQsa7ku0PLytDLhdsLzPb2/9XfHozBPGn/YwcT46uaok5
         eVZDl7H9XFf3w1n8b3bJNQ5SHmdy8fgPJTyx7tDUdPwm7DK3UhZDOWHjQBM9AA3KyVVk
         nEYUPyqnJbaSfCftE7TssimV6phRDLiZhBZboJvDL3Ebqn3JookzUBiv9DOTvRTLBeXx
         YIj93y+NPWrtWQA/MT35CBYTymKJ1DA6Tzdb/frVq5a1kMNQ7AnlH9BdofwXNQP1jtEN
         PBDKeJb1GKoiZAGEwPdoBcJmAUSMEtp/KkWBSWs++rKxbbU3W9RIlFnNnkDwAvxPKPiu
         a8Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWkG5XWsrct5kHYDnYsB4okyaCh1NTYaoqdy1pCluKz3Ks3tSfb9MTBh8ibrYH/r9X2ei66WsSaGpc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1gSbPzNY6K9YJ8pq9n4ycPVlUGvUHFTz9h6DLey/YClMKtlVb
	Dysyfn3wNHnW1zrcxNQB+C2fhaoHoulbyADFBmSec3jPSkChDpllEZOK6n1T9cGcHcma0Q==
X-Google-Smtp-Source: AGHT+IEEITnmcH5UeTV2zllc3PmFUNjrBWClElCZQ6t5GapgJ1dmZhJuA8uiVOK2ULv5OhBDd14Xgcyd
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:c83:b0:68d:52a1:bed with SMTP id
 00721157ae682-6e2474d2257mr1919327b3.1.1727680527795; Mon, 30 Sep 2024
 00:15:27 -0700 (PDT)
Date: Mon, 30 Sep 2024 09:15:15 +0200
In-Reply-To: <20240930071513.909462-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20240930071513.909462-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580; i=ardb@kernel.org;
 h=from:subject; bh=DOghVKCQRkP+2PZSSBUfsRwzGz2qTq1yeEJiIzZkHRA=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe1XAPP+CW6ZqxccPKowL43/Tf6HExp8dsf8IuIdo91Dp
 38VbpvbUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZyP5ThD39HQciqZ45X7a+I
 V/w7Vrn2CUPYFo2E0GfiEzqK3SeJaDH8FaicbvpzA/e5xw8uM6jYfnfbb220fSNTS1jDbtfUmGu XuAE=
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240930071513.909462-8-ardb+git@google.com>
Subject: [PATCH v2 1/5] x86/pvh: Call C code via the kernel virtual mapping
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Calling C code via a different mapping than it was linked at is
problematic, because the compiler assumes that RIP-relative and absolute
symbol references are interchangeable. GCC in particular may use
RIP-relative per-CPU variable references even when not using -fpic.

So call xen_prepare_pvh() via its kernel virtual mapping on x86_64, so
that those RIP-relative references produce the correct values. This
matches the pre-existing behavior for i386, which also invokes
xen_prepare_pvh() via the kernel virtual mapping before invoking
startup_32 with paging disabled again.

Fixes: 7243b93345f7 ("xen/pvh: Bootstrap PVH guest")
Tested-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/platform/pvh/head.S | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index 64fca49cd88f..ce4fd8d33da4 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -172,7 +172,14 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 	movq %rbp, %rbx
 	subq $_pa(pvh_start_xen), %rbx
 	movq %rbx, phys_base(%rip)
-	call xen_prepare_pvh
+
+	/* Call xen_prepare_pvh() via the kernel virtual mapping */
+	leaq xen_prepare_pvh(%rip), %rax
+	subq phys_base(%rip), %rax
+	addq $__START_KERNEL_map, %rax
+	ANNOTATE_RETPOLINE_SAFE
+	call *%rax
+
 	/*
 	 * Clear phys_base.  __startup_64 will *add* to its value,
 	 * so reset to 0.
-- 
2.46.1.824.gd892dcdcdd-goog


