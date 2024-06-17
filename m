Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E7190B139
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 16:13:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742348.1149131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJD6u-0006wg-Ja; Mon, 17 Jun 2024 14:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742348.1149131; Mon, 17 Jun 2024 14:13:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJD6u-0006tl-Ga; Mon, 17 Jun 2024 14:13:28 +0000
Received: by outflank-mailman (input) for mailman id 742348;
 Mon, 17 Jun 2024 14:13:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sWYw=NT=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sJD6t-0006tf-Uq
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 14:13:27 +0000
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [2607:f8b0:4864:20::f2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2e18e92-2cb3-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 16:13:26 +0200 (CEST)
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-6b065d12e81so21662076d6.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 07:13:26 -0700 (PDT)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5eb4811sm55124386d6.77.2024.06.17.07.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 07:13:24 -0700 (PDT)
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
X-Inumbo-ID: c2e18e92-2cb3-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1718633604; x=1719238404; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AEPYDVeLkU0IonjTu34unuOh82lmo92YGof/pNWGY/U=;
        b=lhKDFu2VUexnKdnHioAzF28P4ER/bXf/wEUOFglvTaquUeAJ3eGuUogrrguFnhze53
         3mAgmm21tNR7VdufUNDbHVQDRfJjlrxz74JqYGv3JqTx80O3E6WYGG5zHRFL54Uy/4Qb
         aOxfVIjT0iagwUxIy4uq4TZE8xqhC8w9K0VL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718633604; x=1719238404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AEPYDVeLkU0IonjTu34unuOh82lmo92YGof/pNWGY/U=;
        b=Xgy+mwvS5DPiyob6yfP72mJpFBSQzPUvOSA2LbWmCarpmbuMF/ZIMO4Y3+y/IYabdS
         8kZZ5rmB/jdSAutOtYhtgOJ7smQPR47avlJP+/F7VolQjtk5JKmeDPfH4E33JH41Xm6W
         z07PnsJ9lz0lFWBdz1W5+DD5eGZ8+xWD6nocXe2rXeR5EdUMWdZL4PWMQY7A6wyjYMk3
         bbV+mLqw/xOzhZhK/jCkxPWQHHTrLjgOljKfrv4SRr4qlL2SzRHNKpVsAkKT43qvBybZ
         Nrw1OCN3fgyOKdUHHhmA7/8OuC2D1e/ZYJWq1OAJjLT82MXc81KoX24Dr2+O4t7MVrU8
         DUnA==
X-Gm-Message-State: AOJu0YzfAL/7c49glaDcLVReI2nsaQ81l5rEsr8QyP6wEkYNW1jhd8Ni
	oH7uIstfILYI0Ty/E+lcynlwaDMUj0kOtKCkqSrXmrzSYDkZe51rWnHENaG1EPrNQGiq/ZvgoYH
	Ko2K1eg==
X-Google-Smtp-Source: AGHT+IGng51gHJ++fAhRU0HYTBiDRSVfUV9r9cDVWxS6lcJMbyubX5iCAI3jBFKyZg6BMsISJA1PAA==
X-Received: by 2002:a0c:e6ca:0:b0:6b2:c888:6c7 with SMTP id 6a1803df08f44-6b2c888089emr48248246d6.7.1718633604500;
        Mon, 17 Jun 2024 07:13:24 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>,
	x86@kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: [PATCH] x86/xen/time: Reduce Xen timer tick
Date: Mon, 17 Jun 2024 15:13:03 +0100
Message-ID: <20240617141303.53857-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current timer tick is causing some deadline to fail.
The current high value constant was probably due to an old
bug in the Xen timer implementation causing errors if the
deadline was in the future.
This was fixed in Xen commit:
19c6cbd90965 xen/vcpu: ignore VCPU_SSHOTTMR_future

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 arch/x86/xen/time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 52fa5609b7f6..ce30b8d3efe7 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -30,7 +30,7 @@
 #include "xen-ops.h"
 
 /* Minimum amount of time until next clock event fires */
-#define TIMER_SLOP	100000
+#define TIMER_SLOP	1000
 
 static u64 xen_sched_clock_offset __read_mostly;
 
-- 
2.45.1


