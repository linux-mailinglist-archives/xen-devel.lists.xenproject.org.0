Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2551567E79B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 15:00:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485594.752972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPGj-0002TL-NP; Fri, 27 Jan 2023 13:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485594.752972; Fri, 27 Jan 2023 13:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPGj-0002OF-Ih; Fri, 27 Jan 2023 13:59:53 +0000
Received: by outflank-mailman (input) for mailman id 485594;
 Fri, 27 Jan 2023 13:59:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhsa=5Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pLPGi-00023y-6B
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 13:59:52 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd9bedf9-9e4a-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 14:59:50 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id m14so4594038wrg.13
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 05:59:50 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 d3-20020adfe2c3000000b002bc7fcf08ddsm3971131wrj.103.2023.01.27.05.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 05:59:48 -0800 (PST)
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
X-Inumbo-ID: dd9bedf9-9e4a-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZU75X7zN3E8l3wJnpARzbbD/gMXF2Tgi8DqO2CpH0I=;
        b=GHI2tm52iAwYlhN8x+9ynOzv3/ZRsq9sY0Dla1Uic5UCwS+KVTCEEUZnGVC0NO1goJ
         8Hr7gqsY7To896P9L4zYW25oNnmIPBnjFzqLTbGyAHwM3lFFMj2EzrnYRQKKIfb14Kgr
         /ha/NXFwh7FsLPByjKLb3re1KsTZ1vCiD9RMUMglieg+FXmkHk7QL9L1W3w8bj3ehzJ5
         yr1rMzDtmJHcXi8pJIu0qEdDtHHLesC8C1Y0bKNgXvxWurthhmt7FPPLH2K42L49MTdV
         euMpAfVPQUpc0RXMpIsLGkohMoW9p/39cGG8HEZncZhtuKy8Nd0SNSBOZBrCgTvqYWSk
         dZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZU75X7zN3E8l3wJnpARzbbD/gMXF2Tgi8DqO2CpH0I=;
        b=24Kvp0TgxmyKSh8NlafCjAxKYeEfiNdH47lTYEduq4ZIN0/BNbHwCeuLaWOGF7sUaZ
         F6VSMBH+9Ca7zdLM6CN93PxUgGWg3lqWvFrecxq9zpyHlt7lcq9NMZiCOTyZwxyoxuzc
         tbNqSCdRq96gwDgXaIVE7rN2mKc8Kj3u9Sn73Y/V/vuYxCjxtETv3xOf8yVUYXCTQVDJ
         +F+dYp+MKBGmoQ4zmeYqdNvMbBL4DSacdRd1ReonSTHFjk1QyRCnVtOxtAXvukXtGRdm
         pXC8r8Krlajgj9ewaqG83iLKLgWA0BBj5CZVIPTqrq3ptLqa4IB0Z1aDN4DBAbp80X9r
         YbaQ==
X-Gm-Message-State: AFqh2kpvPCZyPvlQe9H0UHr7otTrnhnmMkyLon7dGM5uSy/vjuTHPx7l
	xM2s+AZeK7cUeg/oL6wgeCreW1EADp0=
X-Google-Smtp-Source: AMrXdXvvRg9Xkp5SUkn5oAnJJ++hi0NhAJhqfmq4Ydun6pzIeJaEBnccx6LMLEIg5f5Wtkc2og1zNg==
X-Received: by 2002:a5d:6582:0:b0:2be:5c14:eb74 with SMTP id q2-20020a5d6582000000b002be5c14eb74mr23111943wru.62.1674827989547;
        Fri, 27 Jan 2023 05:59:49 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 06/14] xen/riscv: introduce empty <asm/cache.h>
Date: Fri, 27 Jan 2023 15:59:11 +0200
Message-Id: <1c53e9784707482edf96d144d9ce36a4fc9d7ed5.1674818705.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674818705.git.oleksii.kurochko@gmail.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To include <xen/lib.h> <asm/cache.h> is required

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
  - <asm/cache.h> is a new empty header which is required to include
    <xen/lib.h>
---
 xen/arch/riscv/include/asm/cache.h | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/cache.h

diff --git a/xen/arch/riscv/include/asm/cache.h b/xen/arch/riscv/include/asm/cache.h
new file mode 100644
index 0000000000..69573eb051
--- /dev/null
+++ b/xen/arch/riscv/include/asm/cache.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_RISCV_CACHE_H
+#define _ASM_RISCV_CACHE_H
+
+#endif /* _ASM_RISCV_CACHE_H */
-- 
2.39.0


