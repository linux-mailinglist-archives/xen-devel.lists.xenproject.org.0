Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAE928E5C4
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 19:54:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6960.18213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSkyT-000675-C1; Wed, 14 Oct 2020 17:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6960.18213; Wed, 14 Oct 2020 17:54:05 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSkyT-00066I-6N; Wed, 14 Oct 2020 17:54:05 +0000
Received: by outflank-mailman (input) for mailman id 6960;
 Wed, 14 Oct 2020 17:54:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x6PD=DV=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kSkyR-00060V-Ak
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 17:54:03 +0000
Received: from mail-il1-x143.google.com (unknown [2607:f8b0:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d3bd845-3b31-4300-bfdf-2ca521d27f5f;
 Wed, 14 Oct 2020 17:54:00 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id j13so241218ilc.4
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2020 10:54:00 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 v15sm67765ile.37.2020.10.14.10.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 10:53:59 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=x6PD=DV=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kSkyR-00060V-Ak
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 17:54:03 +0000
X-Inumbo-ID: 6d3bd845-3b31-4300-bfdf-2ca521d27f5f
Received: from mail-il1-x143.google.com (unknown [2607:f8b0:4864:20::143])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6d3bd845-3b31-4300-bfdf-2ca521d27f5f;
	Wed, 14 Oct 2020 17:54:00 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id j13so241218ilc.4
        for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2020 10:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=72uE8HBho6CRDEfq5zUs9af/VZhtVN+A95L9VpNei3g=;
        b=WPYcwYQQ8P4JgmLO9WS1jZolr0Vv2PVTia9WT/lQ7MX5gq+HsgEva9AfGW2FlgkgbM
         HVJwCL5VPEiTqLxbrJJ8A2q6YMODS7ZMAb+ADTjLgyMXIG9zTJC02fhcJE4vdysPzQ+h
         7wOEuIA4KEZYRd4Miv5wes3HRO3QndjWh+xU/zP7xcvds0rqh59kMY4QvTVA/uvaFEnT
         VhgDXyS/LFydlvr3Q2eIXePyc1P8MCdMbaxQEA4wPi7vlq72DYhfiuBpF8QOYHsd1Vnm
         0IQ8wo3SZrNi2vGPELBiHRkH0cJPFOXShMcxHEkloat2A4GQ1WyvAGOOUMdhQUib/HpS
         8FVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=72uE8HBho6CRDEfq5zUs9af/VZhtVN+A95L9VpNei3g=;
        b=qL0giTAbnKc8vlWuOmNR/2sMRfMXqWsFFY/CPQG+v7AvX4TF2Rvd7BuZAQPeuEt2W3
         y928SpxxagV40ia6FrWU5DiMIhZguUYUGhIW5dtC20oz4Tp71LrBG41cmytSDuD0y9R+
         QcdjXqgi5sAZ/3xiF7tiyA3XKSrsg2dLzrPcB/9NWrtdPXjdr6DUNLuMXc5ligWG+VqV
         Of7Imi+a5Y49Mk/xuQhyGy1Q20D5NWVxX7wtngmLPKVoc0s4G25utniJAJ8nHcJ9Ftnf
         J/2cKdjs0UMFJXEMeQkuEtN8WXcu6NUrt3odohpJNY6B1vkicj00s2cIyX2P3tXrcEHw
         IVQg==
X-Gm-Message-State: AOAM530y+QTzC7RwsjZDyhkAbCVi3HfmCJjTJkikRYMpx0qmoonuPR+U
	jwnbqF8tFy32L/tmqYSIyOI=
X-Google-Smtp-Source: ABdhPJwj+vJExjs0I5nCxR1nMrw0GQPeUqeZDyFFqHum+1s5g1WGgg2wXN6N5rYZrkp6aUT3nWYY8w==
X-Received: by 2002:a92:3650:: with SMTP id d16mr262484ilf.29.1602698040294;
        Wed, 14 Oct 2020 10:54:00 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
        by smtp.gmail.com with ESMTPSA id v15sm67765ile.37.2020.10.14.10.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 10:53:59 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] xen: Kconfig: nest Xen guest options
Date: Wed, 14 Oct 2020 13:53:41 -0400
Message-Id: <20201014175342.152712-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201014175342.152712-1-jandryuk@gmail.com>
References: <20201014175342.152712-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moving XEN_512GB allows it to nest under XEN_PV.  That also allows
XEN_PVH to nest under XEN as a sibling to XEN_PV and XEN_PVHVM giving:

[*]   Xen guest support
[*]     Xen PV guest support
[*]       Limit Xen pv-domain memory to 512GB
[*]       Xen PV Dom0 support
[*]     Xen PVHVM guest support
[*]     Xen PVH guest support

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 arch/x86/xen/Kconfig | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
index b75007eb4ec4..2b105888927c 100644
--- a/arch/x86/xen/Kconfig
+++ b/arch/x86/xen/Kconfig
@@ -26,6 +26,19 @@ config XEN_PV
 	help
 	  Support running as a Xen PV guest.
 
+config XEN_512GB
+	bool "Limit Xen pv-domain memory to 512GB"
+	depends on XEN_PV && X86_64
+	default y
+	help
+	  Limit paravirtualized user domains to 512GB of RAM.
+
+	  The Xen tools and crash dump analysis tools might not support
+	  pv-domains with more than 512 GB of RAM. This option controls the
+	  default setting of the kernel to use only up to 512 GB or more.
+	  It is always possible to change the default via specifying the
+	  boot parameter "xen_512gb_limit".
+
 config XEN_PV_SMP
 	def_bool y
 	depends on XEN_PV && SMP
@@ -53,19 +66,6 @@ config XEN_PVHVM_GUEST
 	help
 	  Support running as a Xen PVHVM guest.
 
-config XEN_512GB
-	bool "Limit Xen pv-domain memory to 512GB"
-	depends on XEN_PV
-	default y
-	help
-	  Limit paravirtualized user domains to 512GB of RAM.
-
-	  The Xen tools and crash dump analysis tools might not support
-	  pv-domains with more than 512 GB of RAM. This option controls the
-	  default setting of the kernel to use only up to 512 GB or more.
-	  It is always possible to change the default via specifying the
-	  boot parameter "xen_512gb_limit".
-
 config XEN_SAVE_RESTORE
 	bool
 	depends on XEN
-- 
2.26.2


