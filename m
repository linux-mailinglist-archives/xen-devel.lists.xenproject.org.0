Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBF56F5C0F
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 18:32:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529380.823733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puFOl-0004Bf-Fx; Wed, 03 May 2023 16:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529380.823733; Wed, 03 May 2023 16:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puFOl-00046e-9a; Wed, 03 May 2023 16:32:11 +0000
Received: by outflank-mailman (input) for mailman id 529380;
 Wed, 03 May 2023 16:32:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O9tK=AY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1puFOj-0003pe-9y
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 16:32:09 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b1c3d72-e9d0-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 18:32:06 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f00c33c3d6so6788921e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 May 2023 09:32:06 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 h20-20020a2e9ed4000000b002a634bfa224sm6074321ljk.40.2023.05.03.09.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 09:32:05 -0700 (PDT)
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
X-Inumbo-ID: 0b1c3d72-e9d0-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683131526; x=1685723526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Na1AM2pS/tIxc8UzxXCz1qX+aY29hkPhhjEAhDGZruo=;
        b=YN4i0x2Yf/gqJP/4Wil8NwO76B5aVgrwNYJfDOi8HrmreBLvnv7H08aytbVqZ11YhL
         4KekE+f6UrOsu3MY9X0MLjVCZYapuKXWZQmCGXGqq8oAdXx3NeEHZitnOUlLKf47hQIK
         vlcgKcr35nyhsh7XF1oHcpG/Q4bJJS3fAYMSY0cvU/HeMXSfq6cRBqE/bRG/69xs0Sr6
         4icKCS2Oqd4uKktE5QoUTobPVOK4ETFx7dZIOhK1XQ8c7XZdnXz09wuhqf0jo67vsRsp
         NK2vVQRZ+tmQYCMI8Qneg6sD6J93ozqM+SGdnvl+wYsxK5GDUpBkMIECURDrm9kV4ydO
         tPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683131526; x=1685723526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Na1AM2pS/tIxc8UzxXCz1qX+aY29hkPhhjEAhDGZruo=;
        b=eII/XvRzZF/PXjkQ8ZFZoREfOlqHoiknav+w5Sz+PIpOGfLmLQWOQE7EXUR2XWtR5D
         aLjnTOtf7S6GUHp9rOYfl2xzCB8Y5aIwsoGMDWKZJz++4ozQ28tbHQugnFluD+HV5/Rx
         sfpU7IhZqV8uOe3HQCk4JmGlMzwnEYI+HbrozCES3w3LvRdRAluXM1Nc+ShDefJm1SUL
         zRC9/8Kyl3J0AwowVYT+C/sD13gKHfLDGWAXd+JlxwrRi8nXhcYdipY9pyKEM7quvudO
         qG2xjHzKb7IPn1Q5hErenOiaZj8RSEDIMGgCXzkoo+TByMfuF5Pk5wPlCu9zctWt44hb
         N7eQ==
X-Gm-Message-State: AC+VfDysJH1CQn/S7VEFuRQRKd3yt7XIhzg/2gU27msm2wh/9+O/Kcd1
	67Ke0iL1sgT9NjKlc8rmAAvVj/Fys2w=
X-Google-Smtp-Source: ACHHUZ6yZKqCW5UQULMXODri/ZEA/RVcnsdSbX8Yx5MfUVYSJ4SkZhriZAecO1eFmtWzAYYMtP4P3g==
X-Received: by 2002:ac2:42d4:0:b0:4ec:9fe9:fea9 with SMTP id n20-20020ac242d4000000b004ec9fe9fea9mr1289229lfl.56.1683131525895;
        Wed, 03 May 2023 09:32:05 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v6 1/4] xen/riscv: add VM space layout
Date: Wed,  3 May 2023 19:31:58 +0300
Message-Id: <a4004849c87990e5379acc5d60a52492385cd8e0.1683131359.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1683131359.git.oleksii.kurochko@gmail.com>
References: <cover.1683131359.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Also it was added explanation about ignoring of top VA bits

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V6:
 - update comment above the RISCV-64 layout table
 - add Slot column to the table with RISCV-64 Layout
 - update RV-64 layout table.
---
Changes in V5:
* the patch was introduced in the current patch series.
---
 xen/arch/riscv/include/asm/config.h | 31 +++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 763a922a04..73b86ce789 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -4,6 +4,37 @@
 #include <xen/const.h>
 #include <xen/page-size.h>
 
+/*
+ * RISC-V64 Layout:
+ *
+ * From the riscv-privileged doc:
+ *   When mapping between narrower and wider addresses,
+ *   RISC-V zero-extends a narrower physical address to a wider size.
+ *   The mapping between 64-bit virtual addresses and the 39-bit usable
+ *   address space of Sv39 is not based on zero-extension but instead
+ *   follows an entrenched convention that allows an OS to use one or
+ *   a few of the most-significant bits of a full-size (64-bit) virtual
+ *   address to quickly distinguish user and supervisor address regions.
+ *
+ * It means that:
+ *   top VA bits are simply ignored for the purpose of translating to PA.
+ *
+ * ============================================================================
+ *    Start addr    |   End addr        |  Size  | Slot       |area description
+ * ============================================================================
+ * FFFFFFFFC0000000 |  FFFFFFFFC0200000 |  2 MB  | L2 511     | Xen
+ * FFFFFFFFC0200000 |  FFFFFFFFC0600000 |  4 MB  | L2 511     | FDT
+ * FFFFFFFFC0600000 |  FFFFFFFFC0800000 |  2 MB  | L2 511     | Fixmap
+ *                 ...                  |  1 GB  | L2 510     | Unused
+ * 0000003200000000 |  0000007f40000000 | 331 GB | L2 200-609 | Direct map
+ *                 ...                  |  1 GB  | L2 199     | Unused
+ * 0000003100000000 |  0000003140000000 |  3 GB  | L2 196-198 | Frametable
+ *                 ...                  |  1 GB  | L2 195     | Unused
+ * 0000003080000000 |  00000030c0000000 |  1 GB  | L2 194     | VMAP
+ *     .................. unused ..................
+ * ============================================================================
+ */
+
 #if defined(CONFIG_RISCV_64)
 # define LONG_BYTEORDER 3
 # define ELFSIZE 64
-- 
2.40.1


