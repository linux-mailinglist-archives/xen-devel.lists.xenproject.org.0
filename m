Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D339D308A66
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 17:40:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78317.142440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5WoD-0001Nw-Rf; Fri, 29 Jan 2021 16:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78317.142440; Fri, 29 Jan 2021 16:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5WoD-0001NX-O7; Fri, 29 Jan 2021 16:39:45 +0000
Received: by outflank-mailman (input) for mailman id 78317;
 Fri, 29 Jan 2021 16:39:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5WoC-0001NS-Rn
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 16:39:44 +0000
Received: from mail-lf1-x135.google.com (unknown [2a00:1450:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96cda91e-0026-4b07-b105-9b0dc6a1270c;
 Fri, 29 Jan 2021 16:39:44 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id e2so9714447lfj.13
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 08:39:43 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id w18sm2591332ljm.11.2021.01.29.08.39.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Jan 2021 08:39:42 -0800 (PST)
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
X-Inumbo-ID: 96cda91e-0026-4b07-b105-9b0dc6a1270c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=EOugPesWge3Q64OHuB1MGvixZz05GP8UbM6Im7F0rAA=;
        b=PoXw1IZLMHUMzgQpV2CdczzycYC9SDBZGOZAkaS9VCYZVqgpw1KFIo4GL9fpvK7tBV
         UeD0LQ2eDjCjg5LvigFZAKhqHWRuX058WnXGCpLQaDgkbpqUOJEOeT5SQbn1Uhor/YN2
         Vw2pFizaFaT5MGOkq+JZCnZSS9wOWnjb7rMe3oDmpSGlpPuq9OO2Ac4zs9+4j0C7PY7V
         aHqPkaPtXXZj3alCFA+xPyL2mnkonA+9WLGO0EItUwOXC3xepdWbYJ/NiKnbdZoS+UUc
         gTSUcX4iABjXXXwNMHcsK9V37rgjWOm1J+/FK1ycOqTFIMquaS4capmHejuf2MFJSPAR
         wdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=EOugPesWge3Q64OHuB1MGvixZz05GP8UbM6Im7F0rAA=;
        b=lawDRzLgsjSQxm8dhDfqWtSuqZZ7DnMzKXCzs5CGIWfWpvKIGpR8vC13QW/yChJC5t
         fpcJdecl+Scke5IdCDVPIlMHTnFR9qnS7OVEVX1YTtRIGkYuZRlgmPFYa+vCHl2xRdlj
         5X9KozfvJw90Kdo/zIKRJ6skJ1bIMNOGwfb9JWx+7qHl47ppu3AW4EKm3Bh0dQzv9wT8
         Z2FEO5j29bXOyhwpboonJvHXopneOYKE7U8KbbeueQ9brPfqplSFTci7nZvwD4SfvnmP
         dPWSaKnYqEaiOLPnmsfpA7+q4ia/ATzRouzHROdPbu/bDVM+cZOIsHucBa5QSNUlG+ZT
         sj1g==
X-Gm-Message-State: AOAM5301WxJTXEtwAOIkm+LUyTSWGhM79M1chvRoPlrD50Dp0d4OcBDI
	/RPdOueGo7NWdjFV/eBkJkYu7r9MrwpUOw==
X-Google-Smtp-Source: ABdhPJwVgIZZ2rl6PJgsh1CYVsjcnNfKYApzIFfexhMs7s16HjoEY8szFZ9GBEQdAnoCCHpPAtNVng==
X-Received: by 2002:ac2:4acc:: with SMTP id m12mr2731698lfp.537.1611938382770;
        Fri, 29 Jan 2021 08:39:42 -0800 (PST)
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
Subject: [PATCH V7 24/24] xen/ioreq: Make the IOREQ feature selectable on Arm
Date: Fri, 29 Jan 2021 18:39:25 +0200
Message-Id: <1611938365-19059-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The purpose of this patch is to add a possibility for user
to be able to select IOREQ support on Arm (which is disabled
by default) with retaining the current behaviour on x86
(is selected by HVM and it's prompt is not visible).

Also make the IOREQ be depended on CONFIG_EXPERT on Arm since
it is considered as Technological Preview feature and
update SUPPORT.md.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes V5 -> V6:
   - new patch

Changes V6 -> V7:
   - use "If unsure, say N."
   - add Jan's and Julien's A-b
   - update SUPPORT.md
---
 SUPPORT.md         | 4 ++++
 xen/common/Kconfig | 8 +++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 5ee3c86..f69edc7 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -691,6 +691,10 @@ to be used in addition to QEMU.
 
 	Status: Experimental
 
+### ARM/IOREQ servers
+
+	Status: Tech Preview
+
 ### ARM/Non-PCI device passthrough
 
     Status: Supported, not security supported
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index fa049a6..1ecd4f6 100644
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
+	  If unsure, say N.
 
 config KEXEC
 	bool "kexec support"
-- 
2.7.4


