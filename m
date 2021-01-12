Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 606FF2F3BFD
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 22:59:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66076.117256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRgp-0003eZ-1E; Tue, 12 Jan 2021 21:58:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66076.117256; Tue, 12 Jan 2021 21:58:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRgo-0003dA-NM; Tue, 12 Jan 2021 21:58:58 +0000
Received: by outflank-mailman (input) for mailman id 66076;
 Tue, 12 Jan 2021 21:58:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OoN1=GP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kzRcy-0002PK-KI
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 21:55:00 +0000
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 289e7733-795a-4b97-bc99-0e0332592d63;
 Tue, 12 Jan 2021 21:53:16 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id r7so18279wrc.5
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 13:53:14 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 138sm6574053wma.41.2021.01.12.13.53.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Jan 2021 13:53:13 -0800 (PST)
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
X-Inumbo-ID: 289e7733-795a-4b97-bc99-0e0332592d63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pY2EFgr5mZYb8VB78RF90bV56k/p4A7pIlBY1qio2Gw=;
        b=F1sEvpaf++vKOVcm7VJUbBFnQs64PZvbL8vV4c5mNsxuApay5BbcZxkB5Uv36KX71p
         BOTB/GPgXjQ4UXbEwzGsbkBGR9M1HAJ60M6r84HwJR8Z9NYFsxmYhvLDDF74TP8Y1Ump
         x4/2gnLzwBMAwh0bYuTVGp9UKPZPOR7iBK+2y6/+54ixeQkcYkhgmdVHPqXCHA5GnC72
         SmKKt9zZbowlD41oA7VJ1wUZxd/UkAMroquAZCDbMXmq2kG7f7PzvCbb457kqIDQY6zP
         3VoNzeevYUb/LmArzh3MyF+QpQeXCQGC7rVRgEUC2wnYIKUukQh+AIL/UJj9VqlwbIrO
         aG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pY2EFgr5mZYb8VB78RF90bV56k/p4A7pIlBY1qio2Gw=;
        b=rTWx8SeX1dove/pIziZ+61/g70WKLtjy+ne62UUtLsiXfD8yMgA+oFVrJsdArC76Zv
         lf1mjz/wUw0OJN92hG814NURQzdKpJbkQMO9WJgz3X99J0fZULl+YWiJp9yLLsgh4ymt
         k8/y+v2pjXscrNmS3B8Tsf9uJoaP5L9Mw7emzKAbbRlqSDjK5q7Hy7e+TejFTx3U+ncK
         qR98dD22IXMs8jzLcg8wDZxepQACvDu+iab8WaXVekf3saWrkIQbTd69Vp/+Ja+zn//M
         71/24QMNwv4A28mzHNtnc1xRwqP3jCMBtIiFK6cnhA8HsbAB9QhTc4eX41WJVPaApJ7P
         iwaw==
X-Gm-Message-State: AOAM5303JFh2ekXrwcCqyZM+jv08ZTLLQIjJNaE52TCeBaJ8iWTmk2UN
	Dwy9yM5rX8+xFCROXmiSqRXyX9pumbV3NA==
X-Google-Smtp-Source: ABdhPJz/WFN/AicNIBoaiz3sEvig6nDC2HbYwIaKJVX7I6VBPHLqmeE2eJTbI1Z76Z0Id9wHJa1wFw==
X-Received: by 2002:adf:a4cc:: with SMTP id h12mr775366wrb.391.1610488393829;
        Tue, 12 Jan 2021 13:53:13 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V4 20/24] xen/arm: io: Harden sign extension check
Date: Tue, 12 Jan 2021 23:52:28 +0200
Message-Id: <1610488352-18494-21-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>

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
CC: Julien Grall <julien.grall@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes V3 -> V4:
   - new patch
---
 xen/include/asm-arm/traps.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/include/asm-arm/traps.h b/xen/include/asm-arm/traps.h
index e301c44..992d537 100644
--- a/xen/include/asm-arm/traps.h
+++ b/xen/include/asm-arm/traps.h
@@ -93,7 +93,8 @@ static inline register_t sign_extend(const struct hsr_dabt dabt, register_t r)
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


