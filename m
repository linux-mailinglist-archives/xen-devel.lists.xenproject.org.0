Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F33BE38E8CF
	for <lists+xen-devel@lfdr.de>; Mon, 24 May 2021 16:34:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131791.246147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llBem-0006JH-MY; Mon, 24 May 2021 14:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131791.246147; Mon, 24 May 2021 14:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llBem-0006Gt-JR; Mon, 24 May 2021 14:34:12 +0000
Received: by outflank-mailman (input) for mailman id 131791;
 Mon, 24 May 2021 14:34:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SOm5=KT=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1llBel-0005zC-5X
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 14:34:11 +0000
Received: from mail-oi1-x22e.google.com (unknown [2607:f8b0:4864:20::22e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c99d4de-3ba0-40f8-a9dd-0629675e6e51;
 Mon, 24 May 2021 14:34:07 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id c3so27217128oic.8
 for <xen-devel@lists.xenproject.org>; Mon, 24 May 2021 07:34:07 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id p22sm2840564oop.7.2021.05.24.07.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 07:34:07 -0700 (PDT)
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
X-Inumbo-ID: 1c99d4de-3ba0-40f8-a9dd-0629675e6e51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2sOrZe5bNOUYq7hgK+U1znFwa5rrkIKkNIboxtn+L9M=;
        b=liBlJJdT9IQFayphoQ9LiGylFPUQJJ9Hg3ZjBg+o3ODXfwDihgspY00McxaVXSPuHL
         9elBHtA8L/MPH7er9ChFvpGR7BIhImU/ltwyABaqJEmd9XFLDg/ZJQn0xpXF8aCa8L6M
         XNVj6SakXgxORS+T/Aw+xjtgle4zfwagVa8ikuJZGXMycauN2HD1+xDip6G8jerGlBrw
         oXWQ26wCtcmCCC3Uj7x9BCTC8pCZae6s0WhDXpAYEA+WHhVrWzJSQCAmFv0JNrQeZ7xI
         vJmTSyVLwnxup5vamxxQ3RlbXeHmt4Mvbn9CDx2g48M/e112BRaqwHu2PPAqH3pA7QFy
         Edsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2sOrZe5bNOUYq7hgK+U1znFwa5rrkIKkNIboxtn+L9M=;
        b=UAlI5l66mD2phq/rD6bw2M38DXB/pRfYo+GCX0haClg9nBr6oX+Pmz/Fg9jteZNSyg
         GI7NVhN+OSHhKk5CmeM2xux2NwIskmgjbrTc6zfxl2VYLidIUTbLH4Pf4gI5eTuZmSfV
         WQbaAUXLgz1oKQx0z1zWc6jYyJyT9C4zp4TpzZMum4WR7eJL3DTGKZV+qY5vQKt2pVO2
         VNeQeAQEzsfG8aix9Dx3fGx8gqW57/nZUYQOEPkEzWdO7DfnwO8pT+wbIAWlTXGmiElS
         OpEODE6zAiEw7zyeEOD/ylolDytD/kRp6mlaX06NNhXW/pQgZRpSX+H73pl4EnFCUQiK
         txYQ==
X-Gm-Message-State: AOAM5327NEUuUxLokXuxFI04Yk9Uj8RuQGiHyi3uhSRylMEALgpLvcOE
	jsvj2zf9YRDTDFEZegxFrhkquysxgQ14Iw==
X-Google-Smtp-Source: ABdhPJyhmWVfRrGIBU252wYHKyGOHu0QebZeNgiFtFSkhzEwr7qNY5bc4lnG0fnebbcYFIo7gPTrSw==
X-Received: by 2002:aca:494d:: with SMTP id w74mr11026457oia.47.1621866847260;
        Mon, 24 May 2021 07:34:07 -0700 (PDT)
From: Connor Davis <connojdavis@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair23@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 1/4] xen/char: Default HAS_NS16550 to y only for X86 and ARM
Date: Mon, 24 May 2021 08:34:25 -0600
Message-Id: <2a8329da33d2af0eab8581a01e3098e8360bda87.1621712830.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621712830.git.connojdavis@gmail.com>
References: <cover.1621712830.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Defaulting to yes only for X86 and ARM reduces the requirements
for a minimal build when porting new architectures.

Signed-off-by: Connor Davis <connojdavis@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 xen/drivers/char/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index b572305657..2ff5b288e2 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -1,5 +1,6 @@
 config HAS_NS16550
 	bool "NS16550 UART driver" if ARM
+	default n if RISCV
 	default y
 	help
 	  This selects the 16550-series UART support. For most systems, say Y.
-- 
2.31.1


