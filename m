Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C932DC1D9
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 15:09:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55265.96298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpXU3-0007Xw-97; Wed, 16 Dec 2020 14:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55265.96298; Wed, 16 Dec 2020 14:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpXU3-0007XX-5l; Wed, 16 Dec 2020 14:08:51 +0000
Received: by outflank-mailman (input) for mailman id 55265;
 Wed, 16 Dec 2020 14:08:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vvT0=FU=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kpXU1-0007XS-Ei
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 14:08:49 +0000
Received: from mail-qv1-xf34.google.com (unknown [2607:f8b0:4864:20::f34])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 345bef11-c01a-431d-b5aa-d78300b88282;
 Wed, 16 Dec 2020 14:08:48 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id s6so11341455qvn.6
 for <xen-devel@lists.xenproject.org>; Wed, 16 Dec 2020 06:08:48 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:b150:92df:fbb7:5df0])
 by smtp.gmail.com with ESMTPSA id
 h25sm1113717qkh.122.2020.12.16.06.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 06:08:47 -0800 (PST)
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
X-Inumbo-ID: 345bef11-c01a-431d-b5aa-d78300b88282
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hw1VUdj7oe+RFhOiOdtGs39fzND3Jk6BzojvG/18LqQ=;
        b=IYJrC+opx3RLldMMxKa+dnCdhBtLbYnq411h7iiYF9ef0/eKjQCrJCFdC/xXxARHVk
         hgZwqhemvIbeEUYojpXPZXFaec6MC4EjE6iifV5CmhRH4Uso7deUtBEcv3C48KwOe2IX
         AotAwfUYy2E0EMxePt6fwTcyKngYQULGVSl4IX7xZ/O/Rwe1FU/L6us/62Sxw6UXoeYJ
         BU8zIp3SVIBnlWZL77U4Oz1DD+DTx9/+ZFjLeDwFau2PJCBAYKnUvJLmK4v1KMzXtZgE
         4sZoG8ojDbjl79lpO6NII5VuzUB9gIvdeUTI1RUvZsA1QGDsIvKZX8O76zWgRA+o8MzL
         7D/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hw1VUdj7oe+RFhOiOdtGs39fzND3Jk6BzojvG/18LqQ=;
        b=rEHmUbWoOAl3HFdpmMZHLAwqmXGz9Y/fUefV2lGOlfaqhPBTqcgPswhlXwZ5u48hZO
         XcFRZBM1DoGUYgJtTh9SMU7tKPD06O94D7KJpXrwDFl/gZg8FMeAyTLwj/vlBASzFaif
         PjzOPdFhk8yh7yw4R8AE7qMtkk4XT8xk4tfInmi1r/CR1lfjcF17LHp7JevQADeGXyZy
         bnA2PyU3GgWp81BU/9Kir/bVN1jvC4N/2xhgkFPbKCLypbrqDTp+Ie8VvtdYILb8hkgs
         42renoIAcoI38k5VH0C3Y83oNlu323mTaPBgBySwqlDAg0G1Z5M6vaaO5Ob29DiKB4mx
         LMbw==
X-Gm-Message-State: AOAM533CKMZcvTZFBJ9zWZ9jb4t2CwMLty0xgN/kquoOW81Wi1EGzhYu
	vg8k8vuIS88PFIMwMzNZGqw=
X-Google-Smtp-Source: ABdhPJx2O7S7enSJUDMETKVJkTVEahKzf1Jq4arGE9gh5ELFFQGqLEFuiPeVji+PzJ9hBGu27Ah8kw==
X-Received: by 2002:a05:6214:1764:: with SMTP id et4mr39801202qvb.2.1608127728273;
        Wed, 16 Dec 2020 06:08:48 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jason Andryuk <jandryuk@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xen: Kconfig: remove X86_64 depends from XEN_512GB
Date: Wed, 16 Dec 2020 09:08:38 -0500
Message-Id: <20201216140838.16085-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit bfda93aee0ec ("xen: Kconfig: nest Xen guest options")
accidentally re-added X86_64 as a dependency to XEN_512GB.  It was
originally removed in commit a13f2ef168cb ("x86/xen: remove 32-bit Xen
PV guest support").  Remove it again.

Fixes: bfda93aee0ec ("xen: Kconfig: nest Xen guest options")
Reported-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
This fixes Boris's review comment.  I lost track of posting a v2 with it
fixed.
---
 arch/x86/xen/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
index 2b105888927c..afc1da68b06d 100644
--- a/arch/x86/xen/Kconfig
+++ b/arch/x86/xen/Kconfig
@@ -28,7 +28,7 @@ config XEN_PV
 
 config XEN_512GB
 	bool "Limit Xen pv-domain memory to 512GB"
-	depends on XEN_PV && X86_64
+	depends on XEN_PV
 	default y
 	help
 	  Limit paravirtualized user domains to 512GB of RAM.
-- 
2.29.2


