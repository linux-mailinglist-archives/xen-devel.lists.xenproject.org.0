Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A38308385
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 02:59:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77643.140851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5J4M-0007q1-7S; Fri, 29 Jan 2021 01:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77643.140851; Fri, 29 Jan 2021 01:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5J4L-0007oG-QK; Fri, 29 Jan 2021 01:59:29 +0000
Received: by outflank-mailman (input) for mailman id 77643;
 Fri, 29 Jan 2021 01:59:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5Ivv-0004da-MF
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 01:50:47 +0000
Received: from mail-lj1-x22a.google.com (unknown [2a00:1450:4864:20::22a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4189ae2-8f49-4c16-b419-f5131a4e7e83;
 Fri, 29 Jan 2021 01:49:30 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id c18so8722861ljd.9
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 17:49:27 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z128sm1840238lfa.72.2021.01.28.17.49.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Jan 2021 17:49:25 -0800 (PST)
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
X-Inumbo-ID: e4189ae2-8f49-4c16-b419-f5131a4e7e83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=TdqDmTMibHmM0swGW3MLKhqpUk26AMu5zQCVZ6e6gLk=;
        b=uwPEbt5RXebB+vGG4kN1n8pOtK6UIL+0Ne9sKOJsuksAuwpkG9zlIVYzQz++uy8KBF
         wx32jxGbhH0V9f/Cc/L35i5iFAkbhmxshBXcdqpOpsrDP3a9Lu3ndFsahdIY+yy8xtwE
         ff/Ccb33ABEu/2+HXpdfrUWDbPiZylfKneqqFFK0MViGiQpcy4Mg9s+FG0dAvUilQNzt
         47Pu26R6kRY8hs63dkqWA4RDfNSkVbD6jekmRL209/o6RHSeCOleN8sOJwTUxGWTphZG
         I4/GX0dGiUia4vdlqPdlQ3+21xjN6U6p+Iyn6ALvRsXYl3SS/ctoIWAqqvBtHn20QY+d
         JARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=TdqDmTMibHmM0swGW3MLKhqpUk26AMu5zQCVZ6e6gLk=;
        b=qq3VVsHUwNU0NB8iVzHr7KYH5RMQ3XukPVvkwSrTEYYFn0kWXFZJZEj2ySJCBomKzQ
         ejdX4g4Otk7aaX4i8Ah6MKt4RId+zZCMYHcEzXj2vNHRfPYe06Yh/6SXlqJC+Y03MZ2W
         s2TTe/Biam8CI7HKgYxLCcpXay4TpRJeGRnv47NjERvvmVsNAfAr3oQXNdeH5arhXNf0
         xG9uWgQxTXJf5vcn0qEBkPWGZApLi3TcfujU5m6NxAntWpuSnA8k6ONElbqkFT0qG5Rl
         63/bZd8EvOC7eL86GI4kfketVvNiROfuCUgxQowMcnyS8X5K3Lp2rC6ozKuCB3mi0AQY
         Iogw==
X-Gm-Message-State: AOAM533qZri9NaRS97b05ErMLIXqSKajwwWjSblZvFYmfwq1TwrTGg2J
	dJVNqwW9irCesMJ9P6hn+2nJna+8Q7COZQ==
X-Google-Smtp-Source: ABdhPJygEAqQ4qjplH7v+s+jNLi8kCp9l7KEFWL20yfvovvgcL7X1K2J9hco+QAYNM8wQQS1gDhc+A==
X-Received: by 2002:a2e:993:: with SMTP id 141mr481288ljj.372.1611884966317;
        Thu, 28 Jan 2021 17:49:26 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V6 20/24] xen/arm: io: Harden sign extension check
Date: Fri, 29 Jan 2021 03:48:48 +0200
Message-Id: <1611884932-1851-21-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

In the ideal world we would never get an undefined behavior when
propagating the sign bit since that bit can only be set for access
size smaller than the register size (i.e byte/half-word for aarch32,
byte/half-word/word for aarch64).

In the real world we need to care for *possible* hardware bug such as
advertising a sign extension for either 64-bit (or 32-bit) on Arm64
(resp. Arm32).

So harden a bit more the code to prevent undefined behavior when
propagating the sign bit in case of buggy hardware.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
CC: Julien Grall <julien.grall@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes V3 -> V4:
   - new patch

Changes V4 -> V5:
   - add Stefano's and Volodymyr's R-b

Changes V5 -> V6:
   - no changes

---
---
 xen/include/asm-arm/traps.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/include/asm-arm/traps.h b/xen/include/asm-arm/traps.h
index c6b3cc7..2ed2b85 100644
--- a/xen/include/asm-arm/traps.h
+++ b/xen/include/asm-arm/traps.h
@@ -94,7 +94,8 @@ static inline register_t sign_extend(const struct hsr_dabt dabt, register_t r)
      * Note that we expect the read handler to have zeroed the bits
      * outside the requested access size.
      */
-    if ( dabt.sign && (r & (1UL << (size - 1))) )
+    if ( dabt.sign && (size < sizeof(register_t) * 8) &&
+         (r & (1UL << (size - 1))) )
     {
         /*
          * We are relying on register_t using the same as
-- 
2.7.4


