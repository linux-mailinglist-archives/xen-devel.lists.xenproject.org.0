Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0589516AE
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 10:35:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776851.1187069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9TD-0004uL-TM; Wed, 14 Aug 2024 08:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776851.1187069; Wed, 14 Aug 2024 08:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9TD-0004qW-Op; Wed, 14 Aug 2024 08:35:03 +0000
Received: by outflank-mailman (input) for mailman id 776851;
 Wed, 14 Aug 2024 08:35:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jxPN=PN=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1se9TC-0002t1-1Q
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 08:35:02 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18748825-5a18-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 10:35:01 +0200 (CEST)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-7a1dac7f0b7so433371885a.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 01:35:01 -0700 (PDT)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a4c7e05595sm407786785a.122.2024.08.14.01.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 01:34:59 -0700 (PDT)
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
X-Inumbo-ID: 18748825-5a18-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723624500; x=1724229300; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cx+yFVCJfgxWpnsCCMINuRQ/ctq1Ga1ijOLJ+Mk9mo=;
        b=az8blai454zBbhhrTHV6Kk0zNQXleVGKjhEpAfDMNQ4gOaR3TyIDLIewHInPiL+MMz
         sIv5m1zqwWNfq4AxeRGinH8Ji7zv5kbhX1oDtsKpdxUNNWXyVUpfVmFNp8etNIBX7U0E
         /aoUBk4aRC69/GiPlCb7/ubwAuZ7n3Rt8awDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723624500; x=1724229300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8cx+yFVCJfgxWpnsCCMINuRQ/ctq1Ga1ijOLJ+Mk9mo=;
        b=sC0NKDKJq+QC1mbucCmP6D1yLegdb28k8Ot9aWRpjyz2ErKCTkTqxJtU8aQ06ELg9z
         cOqxqMpEWWdH4iGIjDpx2XNSuygyjj80k4g8KJ91NK1BqgAOXw+1r0dJrD8UyXZsxNBh
         0K3/Qr2KhxoDZBBeChsImpHMVT17t/hezRBGhck4jqE7SyosYOVLvlh6UThV2lZmHntN
         DmIhr16Knnjkmj3xSrJwnlAAQR9klVwpxsOnBLtT7BIOENtEdkvGEZhNPe31152ZXItd
         tEzQkmlnbqD2VKtO2zKxOr2giXUGEkdfQSN9ZrdWcpFttbQzRlFHvIlhSwyn7Asjn0jR
         z+MQ==
X-Gm-Message-State: AOJu0YxAFTt81phoaOMmR8fKfxsS23Hfb4PgT9zaMjVz/JNHwkqD2pya
	fipAP3OwEaL86HMQWwh+iLDN/NLj/INacItRBHbRtAZbX36gWXvBWoKuf4lOUzqB9fx0AwdwAjQ
	/
X-Google-Smtp-Source: AGHT+IH9FUz7tjCeqZVLYlglNRnjlEx+UsjubjRMdy3lW/lyF98I7fqJhsyulPcCyllSixJ04vyVjA==
X-Received: by 2002:a05:620a:28c1:b0:79f:9b5:ff78 with SMTP id af79cd13be357-7a4ee33c969mr246582985a.34.1723624500146;
        Wed, 14 Aug 2024 01:35:00 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 4/5] x86: Compensate relocation in case of EFI
Date: Wed, 14 Aug 2024 09:34:13 +0100
Message-ID: <20240814083428.3012-5-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814083428.3012-1-frediano.ziglio@cloud.com>
References: <20240814083428.3012-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If code is loaded by EFI the loader will relocate the image
under 4GB. This causes offsets in x86 code generated by
sym_offs(SYMBOL) to be relocated too (basically they won't be
offsets from image base). In order to get wanted address
when using sym_offs an sym_esi compensate the difference
in %esi.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/head.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
---
Changes since v1:
- Completely different way to cope with the issue, much more easier.

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 666e341bc5..86805389f9 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -380,7 +380,8 @@ x86_32_switch:
         lgdt    gdt_boot_descr(%rip)
 
         /* Store Xen image load base address in place accessible for 32-bit code. */
-        lea     __image_base__(%rip),%esi
+        lea     __image_base__(%rip), %esi
+        sub     $sym_offs(__image_base__), %esi
 
         /* Reload code selector. */
         pushq   $BOOT_CS32
-- 
2.45.2


