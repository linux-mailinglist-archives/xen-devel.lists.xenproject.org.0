Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36966ABAB3D
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 18:58:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.988372.1373212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGKr5-0003MY-IM; Sat, 17 May 2025 16:57:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 988372.1373212; Sat, 17 May 2025 16:57:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGKr5-0003LQ-En; Sat, 17 May 2025 16:57:47 +0000
Received: by outflank-mailman (input) for mailman id 988372;
 Sat, 17 May 2025 16:57:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JLOd=YB=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1uGKr4-0003LK-Jc
 for xen-devel@lists.xenproject.org; Sat, 17 May 2025 16:57:46 +0000
Received: from mail.zytor.com (terminus.zytor.com [2607:7c80:54:3::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cafa859-3340-11f0-9eb8-5ba50f476ded;
 Sat, 17 May 2025 18:57:44 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 54HGvDhh935399
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sat, 17 May 2025 09:57:18 -0700
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
X-Inumbo-ID: 0cafa859-3340-11f0-9eb8-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 54HGvDhh935399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1747501039;
	bh=mKRkOm6YCP44COro/tUSTMPHIOXwpBJTdxPBtiGGv34=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OYWedsLYqMQmUpWqc2lx996Ra0psIm3b5PKqU86NwNH25aNWyIThMqo2+aNRuDOug
	 B1CY58kCLHBpWGBl0T1HxmhtWReeJMNs8rsPm9o1GG8t67JuTKpzymKrmieoahJOdS
	 TOqO3IMnQj/CrXNe879Sjb1ZilZ2/j9XWTakmjs3koC7vrgSeL/nPPgUkb6zuBW+E2
	 bSVwKohXIIesXQ58FjFp9XJnUD25RKDb3oAyZD2kHGEN27x07cSde3P9HrdTNVUlKv
	 gLCdquuKYcnBd0aCK3drY1Cst2OvRwLvdn/z9ZSeVsC564kEFulFyZbIaENPQ9nP+A
	 k0KUjSx4wKMfA==
From: "Xin Li (Intel)" <xin@zytor.com>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-acpi@vger.kernel.org
Cc: tglx@linutronix.de, mingo@kernel.org, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        peterz@infradead.org, jgross@suse.com, boris.ostrovsky@oracle.com,
        dan.carpenter@linaro.org, rafael@kernel.org, lenb@kernel.org
Subject: [PATCH v1A 2/3] x86/xen/msr: Fix uninitialized symbol 'err'
Date: Sat, 17 May 2025 09:57:12 -0700
Message-ID: <20250517165713.935384-1-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <ae1d05f6-cd65-4ca4-87c5-af0ae34e21ce@suse.com>
References: <ae1d05f6-cd65-4ca4-87c5-af0ae34e21ce@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xen_read_msr_safe() currently passes an uninitialized argument err to
xen_do_read_msr().  But as xen_do_read_msr() may not set the argument,
xen_read_msr_safe() could return err with an unpredictable value.

To ensure correctness, initialize err to 0 (representing success)
in xen_read_msr_safe().

Do the same in xen_read_msr(), even err is not used after being passed
to xen_do_read_msr().

Fixes: d815da84fdd0 ("x86/msr: Change the function type of native_read_msr_safe()"
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/xen-devel/aBxNI_Q0-MhtBSZG@stanley.mountain/
Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---

Change in v1A:
*) Drop setting err to 0 in xen_do_read_msr() initially and set err to
   0 in all callers (Jürgen Groß).
---
 arch/x86/xen/enlighten_pv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 7f9ded1bc707..26bbaf4b7330 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1162,7 +1162,7 @@ static void xen_do_write_msr(u32 msr, u64 val, int *err)
 
 static int xen_read_msr_safe(u32 msr, u64 *val)
 {
-	int err;
+	int err = 0;
 
 	*val = xen_do_read_msr(msr, &err);
 	return err;
@@ -1179,7 +1179,7 @@ static int xen_write_msr_safe(u32 msr, u64 val)
 
 static u64 xen_read_msr(u32 msr)
 {
-	int err;
+	int err = 0;
 
 	return xen_do_read_msr(msr, xen_msr_safe ? &err : NULL);
 }
-- 
2.49.0


