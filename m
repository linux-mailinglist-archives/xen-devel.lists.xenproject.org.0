Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 290CA308377
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 02:59:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77621.140694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5J3s-0006fq-Ol; Fri, 29 Jan 2021 01:59:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77621.140694; Fri, 29 Jan 2021 01:59:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5J3s-0006f1-Jz; Fri, 29 Jan 2021 01:59:00 +0000
Received: by outflank-mailman (input) for mailman id 77621;
 Fri, 29 Jan 2021 01:58:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5IwF-0004da-Mu
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 01:51:07 +0000
Received: from mail-lf1-x12a.google.com (unknown [2a00:1450:4864:20::12a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20401dd4-8379-48c8-bfb9-df4ecad16768;
 Fri, 29 Jan 2021 01:49:36 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id p21so10291168lfu.11
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 17:49:31 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z128sm1840238lfa.72.2021.01.28.17.49.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Jan 2021 17:49:29 -0800 (PST)
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
X-Inumbo-ID: 20401dd4-8379-48c8-bfb9-df4ecad16768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jYVbTReNhthuaYUiNHZtnj8eTkyYCReKM8/i81+nTtE=;
        b=p0q+c7IkORKo+QxKh1j5u6bKK0SZg0M7cu79OFC5zwqUN7OUyi2FwHCH/SEvPeejP+
         7MzqbITTc2dx+1EVY9XZ6/MeYZQCrmnF72Ude7aJXPgykL9IbqQ7FbebXWEfxNkwcj5Y
         +BxVp6gQQ1SaJGRVZhbv2sKwL4yQqNE9IOzWDIDwE4y2lm+lRSNSQGKZ0Atfgsbxn6ua
         TTnyXsAn3vYx2b05i0KTTXKZKk8HtFtkuN/Lq0kiCAXLP0N+Xj+0hThA/+Iv9xkuq+O5
         aqAZWQCzPenipt52/kcHnEEyDvJl62BqBC9eXHK3mpQNwSTLol6wqh9mBAXcCc5r7HmA
         dQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jYVbTReNhthuaYUiNHZtnj8eTkyYCReKM8/i81+nTtE=;
        b=degvd8OM0Zd7H+rX4qRqKtoSY00gEJvcxOc9+dqOSgTWP6wvemmPJhjzSsYxel+E/f
         2Emq/O18ss/gyj/WMA3HsHfQhR+F3sOJci6ewQafBJcOMBCXekA1tmnOZ8dHlc6ZkLzY
         lOHHx9jiRDFskmSnjsUh+6VgFVWqkJk1lpGyuVqls52255NUaIfFDsz3zLICTvaLxSt4
         tT97l23x12VINBCX2f/Gqhs8p5z2OwBQpXFAW6JmzRGJ5YEHDtSivB4pZKzZm61K+NOy
         Rs1q/aMqGKlgTqM95tqyC9948K4X3NRf0bjlPKua4drnMUs3g3oMCdotegY6jT+piIWx
         vpZg==
X-Gm-Message-State: AOAM530ArBewrJ35/0aGlGvPtWBbx6n95NyMnXxZqyYb7YJwU0Y9XWkR
	r/xAbX70KprC50K73o3WHyzzWcPCJHdceQ==
X-Google-Smtp-Source: ABdhPJy7zqkl36xjz6XPIC+Ds7kUHtc175tsQAi/loZtEy6RVEPjxKVHtbNmA0eSsbsec7Onrz/28g==
X-Received: by 2002:ac2:54ac:: with SMTP id w12mr951239lfk.514.1611884970294;
        Thu, 28 Jan 2021 17:49:30 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH V6 24/24] xen/ioreq: Make the IOREQ feature selectable on Arm
Date: Fri, 29 Jan 2021 03:48:52 +0200
Message-Id: <1611884932-1851-25-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The purpose of this patch is to add a possibility for user
to be able to select IOREQ support on Arm (which is disabled
by default) with retaining the current behaviour on x86
(is selected by HVM and it's prompt is not visible).

Also make the IOREQ be depended on CONFIG_EXPERT on Arm since
it is considered as Technological Preview feature.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes V5 -> V6:
   - new patch
---
---
 xen/common/Kconfig | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index fa049a6..225e57b 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -137,7 +137,13 @@ config HYPFS_CONFIG
 	  want to hide the .config contents from dom0.
 
 config IOREQ_SERVER
-	bool
+	bool "IOREQ support (EXPERT)" if EXPERT && !X86
+	default X86
+	depends on HVM
+	---help---
+	  Enables generic mechanism for providing emulated devices to the guests.
+
+	  If unsure, say Y.
 
 config KEXEC
 	bool "kexec support"
-- 
2.7.4


