Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D94F4B106E6
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 11:49:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055580.1423976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uesZH-00047t-OU; Thu, 24 Jul 2025 09:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055580.1423976; Thu, 24 Jul 2025 09:48:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uesZH-000458-Lp; Thu, 24 Jul 2025 09:48:51 +0000
Received: by outflank-mailman (input) for mailman id 1055580;
 Thu, 24 Jul 2025 09:48:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=98ak=2F=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uesZG-000452-Jw
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 09:48:50 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65abcf4c-6873-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 11:48:48 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4560add6cd2so6741675e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 02:48:48 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b76fc60595sm1648166f8f.4.2025.07.24.02.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 02:48:47 -0700 (PDT)
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
X-Inumbo-ID: 65abcf4c-6873-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753350527; x=1753955327; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pv18L5ti0ruaakxzFmNz13ViN/tZVGK/Z9dY8laDGO8=;
        b=CFwuR6JB5j+ZLx2FWisJZxruV9u+Q0aloGSCrM2mRkXqzNLVuqCBCNPw3Wh6EVEgaK
         LDepy1Mkh+TmtCMyJgK1U00VFTjim5l0SMO3fkfhMisw5eEmWzw1PXPFH8d0vaa5fhVn
         cF5q0M0BEvERneTNECCAchOOlkNFXSg0i4sbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753350527; x=1753955327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pv18L5ti0ruaakxzFmNz13ViN/tZVGK/Z9dY8laDGO8=;
        b=R8nJyr09GsfOSzcOvebdarpIhVlJ5BuvyZ+m7mjubwXOS52E5aggMohmZr4ZVONZXG
         xeFu9sxhJsTVSEOATD/VBimGhZvsJk5Sc9t7dicgarcBwWuCB12fAR+GGiiwGEjq8fNe
         siZMxap6AAh9Jvn7lwXViu0jYTaABtJwKxhCFtYIl96vqalC+ZNhgxTqLOR/UnPWbmA7
         ds2dTXDYyl+TMazhtLxfft5Y7AJhGw56hSOVDoCNJk3QMCt43PEX8fl9/De1hrdf91Mk
         9O9cbfBBEwUjQnFt6HdGTVXhlMrogjRcWggUbmIiTb24+SETZ8nZS1RnG4bEJjnKtw8X
         xNPw==
X-Gm-Message-State: AOJu0Yzkdy1KuovB5WmcXlVfaVMP/ToPc5nWtPQcsXYeEGHepOmgHsNU
	3shBkIoUSWVsFA/bx5GY4iaa3c+cibJ55CcHFDcrAUN/RtJc09Of88Q0QRecnB1OsjIOUeGgsnb
	vyEhu
X-Gm-Gg: ASbGncuGFy3OPy1t7rAT6Lwqo0o8t6oNmRpyG4I+Z9NQudnB6EBBj0qoCN2GPEJcPgl
	guHOts0Md/+B2XPZxcvGpDTW1m7uWmCZItDustiy/yVUia/MzLuXCrD3D4jTSfUVhRsj3ppp1HS
	4kDBKbe07ulQLVxayBPsZDTLEt0xwprx95q6zudbo9s5nWpTHXqhmEX2XvFGACBmCbl6/2eqYOh
	h00jlB4AaLa8S79YvX1pTxBkX/QSFF/MHVnGeKNzJU2fOWnmyyLbqmUiEmoVdYe1gNDWVpdgUXr
	znksiMkubPrqT1jQ2Achj5DK8e3GpspDisWIBvB3rpjJgnKcRjpeocdSvM1g5UHRYwV1A7qYzUk
	qylTTs14XUivjBiODlIOe+SquzXpHNgNPeMsDjbbJGd5Vn/bToW5L7oXRUkaAzDdvpw==
X-Google-Smtp-Source: AGHT+IFe3XeyFSh2mIggkz21lW2SeiECiZeiP6JgDJxrpGW/9ZGH++2IecsZTFsHdPehHLpZaUtmSg==
X-Received: by 2002:a05:600c:190a:b0:453:7713:476c with SMTP id 5b1f17b1804b1-4587050d177mr12190115e9.2.1753350527545;
        Thu, 24 Jul 2025 02:48:47 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] char/ns16550: avoid additions to NULL pointer
Date: Thu, 24 Jul 2025 11:48:43 +0200
Message-ID: <20250724094843.968-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Clang UBSAN reports:

UBSAN: Undefined behaviour in drivers/char/ns16550.c:124:49
applying non-zero offset 0000000000000001 to null pointer

And

UBSAN: Undefined behaviour in drivers/char/ns16550.c:142:49
applying non-zero offset 0000000000000001 to null pointer

Move calculation of the MMIO address so it's only done if the MMIO is
mapped by Xen, otherwise the address is not consumed anyway because IO port
access is used instead.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/char/ns16550.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index c1c08b235e8f..81ceff1d1c8c 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -121,11 +121,14 @@ static void cf_check ns16550_delayed_resume(void *data);
 
 static u8 ns_read_reg(const struct ns16550 *uart, unsigned int reg)
 {
-    void __iomem *addr = uart->remapped_io_base + (reg << uart->reg_shift);
+    void __iomem *addr;
+
 #ifdef CONFIG_HAS_IOPORTS
     if ( uart->remapped_io_base == NULL )
         return inb(uart->io_base + reg);
 #endif
+
+    addr = uart->remapped_io_base + (reg << uart->reg_shift);
     switch ( uart->reg_width )
     {
     case 1:
@@ -139,11 +142,14 @@ static u8 ns_read_reg(const struct ns16550 *uart, unsigned int reg)
 
 static void ns_write_reg(const struct ns16550 *uart, unsigned int reg, u8 c)
 {
-    void __iomem *addr = uart->remapped_io_base + (reg << uart->reg_shift);
+    void __iomem *addr;
+
 #ifdef CONFIG_HAS_IOPORTS
     if ( uart->remapped_io_base == NULL )
         return outb(c, uart->io_base + reg);
 #endif
+
+    addr = uart->remapped_io_base + (reg << uart->reg_shift);
     switch ( uart->reg_width )
     {
     case 1:
-- 
2.49.0


