Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1AC9ED366
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 18:28:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855076.1268110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQVE-0007Kt-PN; Wed, 11 Dec 2024 17:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855076.1268110; Wed, 11 Dec 2024 17:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQVE-0007JS-MV; Wed, 11 Dec 2024 17:28:00 +0000
Received: by outflank-mailman (input) for mailman id 855076;
 Wed, 11 Dec 2024 17:27:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ntru=TE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tLQVC-0007JC-O3
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 17:27:58 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 432b0522-b7e5-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 18:27:57 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aa684b6d9c7so666028366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 09:27:57 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6656f306csm687297466b.61.2024.12.11.09.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 09:27:55 -0800 (PST)
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
X-Inumbo-ID: 432b0522-b7e5-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733938077; x=1734542877; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzX0EG8we7tfVPdrZl970dxIaE2lTCTt+eDvQIAPb6U=;
        b=gyy4oAQ4JzDOaQWwLKl+lgiA/U8Q8LXUUB3k+NOX2+AzGor4obsc880ws+/SZNZDAZ
         CjHk7JwwvYS7ZqXBH/AdeLPh9BQ84EVBOPs871YkKEkrjJGgQG0r6kJPqTOLajoxGHB4
         WMShlHL9zsyCRsz4f3fcx/yRwgk/mWzGW878n933DLvR/26DMVHai4eaMtA+gKtjaovn
         kqFSF4B/5sCdhvHTtFzYVpWJdKdaumd+vkj5FyDoOL28lK20NloDZVS+m1/r3EHy+EHM
         RDdyDq1NhesejWlPQSRz2Drib8YuqDyJOl8WPxSAvJLLgRU61M1yxp/eXv+sih9U/qHj
         ThdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733938077; x=1734542877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VzX0EG8we7tfVPdrZl970dxIaE2lTCTt+eDvQIAPb6U=;
        b=cj0CQu1FeVaWfnAYLQBBE6usbKWNTl4RpQUyM/2Y38u+BnTkc7wftlJaO+E4tQhc7r
         75axNEOpoexl8iQjczyjMEYrCnZOblZUdLtIJOtQ0eu9ZOssVpD/ArfHiFJoY2YMNpkY
         GIlvwex8FkSopsxgnYxM4A8wChDx4Ct0M/6KvlZxBwwIdqbQbTXHP17JXIh0K6aMprKl
         YifZDIdaBK4Um6k3imaLusEp6hbaxVejI/dHerTk45ad4QmpDYdfv3cJDpy4RdME+fLo
         +JKO4e5ghJXgnNQ2QsitFPLkvlLei0sgXHIEvx56BJc0pURemT2niyY9ZZr7z16TPxqP
         xK0Q==
X-Gm-Message-State: AOJu0YzIBOGRUFZobMsWxtsu4jU1c0LIJZhWaOoT6iVxTnYegdOnVu35
	dVsnBiSefaGQyxMTciGIe4sIi6bHCJEqHSkIdiDF4/9+28pZkCZiO1V9gYYc
X-Gm-Gg: ASbGncunwMxxa4fUK3lkz8+LK3zsinGQ94NN94ZCHhP/oJ8vc1K2VvPK6SMiWdGuJlL
	QRc+uRvB08qwrtotwKjUh/Hm4lFJOFstMyfgEZnnFjQMjnnwsVcrpCkPKmqMiMGbkvhMcDE2+Xr
	Es0m7ubFxq8Xo2BrMZN0uct8NjoyzOnmr6/dhDNPlWc/t5pYdjtJcNzhcNDiVgfTVXfcgqJarh1
	Qn2pI8zjQCxG7OTjxyBWJnlqb/2YrVYrKdew6gsoLvHGO1kq0IkHT8=
X-Google-Smtp-Source: AGHT+IHa49oG7xF72kcIsHSUqvy7xJ4GbRUC02XLty084JogjHEMWJU8D7j8yPmTBBEzTL036/kfmg==
X-Received: by 2002:a17:906:9a95:b0:aa6:6276:fe5a with SMTP id a640c23a62f3a-aa6c1ce75f7mr70820866b.43.1733938075671;
        Wed, 11 Dec 2024 09:27:55 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/7] xen/riscv: update layout table in config.h
Date: Wed, 11 Dec 2024 18:27:45 +0100
Message-ID: <c305ae5003da25d7ea4d4aa5602c4b22f83df4a8.1733937787.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733937787.git.oleksii.kurochko@gmail.com>
References: <cover.1733937787.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make all upper bounds (end addresses) for areas inclusive to align
with the corresponding definitions.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - new patch
---
 xen/arch/riscv/include/asm/config.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 4954677aff..826e5c7172 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -41,17 +41,17 @@
  * Start addr          | End addr         | Slot       | area description
  * ============================================================================
  *                   .....                 L2 511          Unused
- *  0xffffffffc0a00000  0xffffffffc0c00000 L2 511          Fixmap
+ *  0xffffffffc0a00000  0xffffffffc0bfffff L2 511          Fixmap
  *                   ..... ( 2 MB gap )
- *  0xffffffffc0400000  0xffffffffc0800000 L2 511          FDT
+ *  0xffffffffc0400000  0xffffffffc07fffff L2 511          FDT
  *                   ..... ( 2 MB gap )
- *  0xffffffffc0000000  0xffffffffc0200000 L2 511          Xen
+ *  0xffffffffc0000000  0xffffffffc01fffff L2 511          Xen
  *                   .....                 L2 510          Unused
- *  0x3200000000        0x7f40000000       L2 200-509      Direct map
+ *  0x3200000000        0x7f7fffffff       L2 200-509      Direct map
  *                   .....                 L2 199          Unused
- *  0x30c0000000        0x31c0000000       L2 195-198      Frametable
+ *  0x30c0000000        0x31bfffffff       L2 195-198      Frametable
  *                   .....                 L2 194          Unused
- *  0x3040000000        0x3080000000       L2 193          VMAP
+ *  0x3040000000        0x307fffffff       L2 193          VMAP
  *                   .....                 L2 0-192        Unused
 #elif RV_STAGE1_MODE == SATP_MODE_SV48
  * Memory layout is the same as for SV39 in terms of slots, so only start and
-- 
2.47.1


