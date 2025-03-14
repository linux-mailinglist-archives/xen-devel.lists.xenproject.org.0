Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5296A618CC
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 19:00:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915254.1320801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt9Jr-0006Dv-R4; Fri, 14 Mar 2025 17:59:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915254.1320801; Fri, 14 Mar 2025 17:59:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt9Jr-0006CT-OM; Fri, 14 Mar 2025 17:59:39 +0000
Received: by outflank-mailman (input) for mailman id 915254;
 Fri, 14 Mar 2025 17:59:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXxa=WB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tt9Jq-0006CN-Ly
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:59:38 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1836c485-00fe-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 18:59:37 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5e5dce099f4so3131782a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:59:37 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3149cfa1fsm251163866b.87.2025.03.14.10.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:59:36 -0700 (PDT)
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
X-Inumbo-ID: 1836c485-00fe-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741975177; x=1742579977; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U670jsvctPqXX5fSqI4atnmohsDFygF+IFyoLRBvxbM=;
        b=Ir2SHRg0t75cKumELtO6Ky1ddDijqLazFIR/o8KeuF6x0r33gLZqJmc0c3v5DtTAiL
         9lvSCzykXrVTs+/7VcVUfiYd40V52xwqRGYgdluXCrTMutiTCXMOF9dbNrXEC1zks1+K
         7dNuywsKntowcVwY0dmpNSZOjDNFhTjjdvu2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741975177; x=1742579977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U670jsvctPqXX5fSqI4atnmohsDFygF+IFyoLRBvxbM=;
        b=rH0PDW4p5jClODpvFTalMDrDokAPNFdjS8o3HTdIPmBfeTGEt9AWvlP0y3I4cp3bg6
         SCOzog2hR0kkz/CtpqNvm1afkPfr6RnnpNBl6T5fZOOMw8uamqlwHQnOthUnNyiTII6t
         yz7ivwZafFITZNJQRxK3FQXvDHfyA+7Aq2J1cekKX6PoqnilQeO/Xqc2syo99fguX6jK
         CUIsb4p6PJzqjGUhd34UlUjskySHAYcLDk/GjGw7EyLQsQTDl+ER8msB8Q6lhFYrTd2f
         cuCL1I17Q0SMWKQDqMXZlkxpFprsBlcdBMhZFkkf1D2cf2KEhbOTPSxMuONyQC4d3arY
         rstg==
X-Gm-Message-State: AOJu0YxsE/oR27AWkb6JUdVVMIzAb5swFgaJDzrXQB+FlOvRPkXjPCy4
	cglug3I3N/HAaaunrBsj8p8gCm5Y662dqa53oHK0kZeWEaLeFzokV2lRE3OqlDRArco+ubPh6O5
	9
X-Gm-Gg: ASbGncssVCJmKThKq0BIxL6kTmZmXSscmnx4zlhy6ctSIJI6OEQGuv1K4OEtACAwZYi
	nrcxxVNeTLzRPB0GDVVdJJ74NpPFk5y/jsMNJcCcghi7QzhHx2gwENCoj4LG0Z1rcTc/gQA5Wfm
	9dtwDwR6Z4LCD9LIxFOBI2L5Nc5WhGn+xJ6twNTQo13Om7WYQ7eFvKX8LFpyu14xmvn9UHhZX+5
	SppZp8NYqKfC5ki3Vq3mczl4fOiPaoXe6boy88VW7AgAS5+6ELaJDeg6NZJBNJfvevEl4k0xth/
	1dHbBGAj2Jz9U3uYDJAtyimu6OkgPqEK1+rzRYdZPPEZG0LXu9Dn4ka0/ACL6FcUB9uFusN2FDV
	vbJeNTlYrR8TAHyecYrcKxfMA
X-Google-Smtp-Source: AGHT+IH92REWPLDOf8kXJGp7G6WdUOt4q4r3ashPc+VSD+gsCQX0U7JK2l4N0vND8ZA26c5AFHAEEA==
X-Received: by 2002:a17:906:dc91:b0:ac3:10e3:7fa5 with SMTP id a640c23a62f3a-ac3302c05d3mr403147666b.21.1741975176868;
        Fri, 14 Mar 2025 10:59:36 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen: Drop __text_section()
Date: Fri, 14 Mar 2025 17:59:33 +0000
Message-Id: <20250314175933.67422-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is an unnecessary indirection.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/include/xen/compiler.h | 1 -
 xen/include/xen/init.h     | 6 +++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index b118e4ba62eb..301c9af29553 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -72,7 +72,6 @@
 #define __section(s)      __attribute__((__section__(s)))
 #endif
 #define __used_section(s) __used __attribute__((__section__(s)))
-#define __text_section(s) __attribute__((__section__(s)))
 
 #define __aligned(a) __attribute__((__aligned__(a)))
 
diff --git a/xen/include/xen/init.h b/xen/include/xen/init.h
index 0a4223833755..037ff0dbf8ff 100644
--- a/xen/include/xen/init.h
+++ b/xen/include/xen/init.h
@@ -5,9 +5,9 @@
  * Mark functions and data as being only used at initialization
  * or exit time.
  */
-#define __init            __text_section(".init.text")
-#define __exit            __text_section(".exit.text")
-#define __cold            __text_section(".text.cold")
+#define __init            __section(".init.text")
+#define __exit            __section(".exit.text")
+#define __cold            __section(".text.cold")
 #define __initdata        __section(".init.data")
 #define __initconst       __section(".init.rodata")
 #define __initconstrel    __section(".init.rodata.rel")
-- 
2.39.5


