Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4619C20B6DF
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 19:24:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jos5c-00008l-RQ; Fri, 26 Jun 2020 17:24:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0eSM=AH=kernel.org=luto@srs-us1.protection.inumbo.net>)
 id 1jos5c-00008g-4U
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 17:24:36 +0000
X-Inumbo-ID: e7dfbe68-b7d1-11ea-b7bb-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7dfbe68-b7d1-11ea-b7bb-bc764e2007e4;
 Fri, 26 Jun 2020 17:24:35 +0000 (UTC)
Received: from localhost (c-67-180-165-146.hsd1.ca.comcast.net
 [67.180.165.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 219F620836;
 Fri, 26 Jun 2020 17:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593192275;
 bh=F/VWExg6XQ5+v2BiFiVfoHATO51UpO4eHrdk+RYhIUU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tFtDTtZ/LsvC48ct+GASS5dYzV+oh45HDZLwn8W3k1fWIUdg+T/tBuo9ctlvzon06
 Gah/UFGCtmQKCa6W/wCzF1ENDGCXIKWCG8g/1NtKm0BUJ/I2JBiOlahJe7oBNreGSc
 Xks4oexOZg3SXRO/rGaWduGPDomsDDOCo7x4YXBU=
From: Andy Lutomirski <luto@kernel.org>
To: x86@kernel.org
Subject: [PATCH fsgsbase v2 4/4] x86/fsgsbase: Fix Xen PV support
Date: Fri, 26 Jun 2020 10:24:30 -0700
Message-Id: <f07c08f178fe9711915862b656722a207cd52c28.1593192140.git.luto@kernel.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1593192140.git.luto@kernel.org>
References: <cover.1593192140.git.luto@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org,
 Andy Lutomirski <luto@kernel.org>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Xen PV, SWAPGS doesn't work.  Teach __rdfsbase_inactive() and
__wrgsbase_inactive() to use rdmsrl()/wrmsrl() on Xen PV.  The Xen
pvop code will understand this and issue the correct hypercalls.

Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
Signed-off-by: Andy Lutomirski <luto@kernel.org>
---
 arch/x86/kernel/process_64.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
index cb8e37d3acaa..457d02aa10d8 100644
--- a/arch/x86/kernel/process_64.c
+++ b/arch/x86/kernel/process_64.c
@@ -163,9 +163,13 @@ static noinstr unsigned long __rdgsbase_inactive(void)
 
 	lockdep_assert_irqs_disabled();
 
-	native_swapgs();
-	gsbase = rdgsbase();
-	native_swapgs();
+	if (!static_cpu_has(X86_FEATURE_XENPV)) {
+		native_swapgs();
+		gsbase = rdgsbase();
+		native_swapgs();
+	} else {
+		rdmsrl(MSR_KERNEL_GS_BASE, gsbase);
+	}
 
 	return gsbase;
 }
@@ -182,9 +186,13 @@ static noinstr void __wrgsbase_inactive(unsigned long gsbase)
 {
 	lockdep_assert_irqs_disabled();
 
-	native_swapgs();
-	wrgsbase(gsbase);
-	native_swapgs();
+	if (!static_cpu_has(X86_FEATURE_XENPV)) {
+		native_swapgs();
+		wrgsbase(gsbase);
+		native_swapgs();
+	} else {
+		wrmsrl(MSR_KERNEL_GS_BASE, gsbase);
+	}
 }
 
 /*
-- 
2.25.4


