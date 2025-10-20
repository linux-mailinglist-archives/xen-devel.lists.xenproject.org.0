Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EFCBF240B
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 17:58:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146539.1479026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsH8-0006Wz-L7; Mon, 20 Oct 2025 15:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146539.1479026; Mon, 20 Oct 2025 15:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsH8-0006St-E8; Mon, 20 Oct 2025 15:58:22 +0000
Received: by outflank-mailman (input) for mailman id 1146539;
 Mon, 20 Oct 2025 15:58:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Li3P=45=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vAsH6-0004nC-P8
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:58:20 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98c24f20-adcd-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 17:58:19 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-634cef434beso9263516a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 08:58:19 -0700 (PDT)
Received: from fedora (user-109-243-146-38.play-internet.pl. [109.243.146.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c48ab560esm6966067a12.12.2025.10.20.08.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 08:58:18 -0700 (PDT)
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
X-Inumbo-ID: 98c24f20-adcd-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760975898; x=1761580698; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bBWp0cZZfbhFMln+pmHCUN44UHPmvo/arXunhT5jKE=;
        b=TzdxuHks/JptFCI0GTpHHjlb8Pw+IxBip8LxvSDziFwQuqGxnE9JgzWI8lzzOtkC4v
         J9+8eP3pb3tCFfmBpbwDJ2lvy71Pz0cr7eRpyk0Rt+K6vj6u6vZbrGnzs1HrNzFV/1dw
         9yYbfK96RCoRO8iGk+CuRseHKpkXmZ4G6A9pjrqTKtgff9W8ibKBOodjFYa7yi5A0KAQ
         MQ494ET/TztiofIM3gd4WYKcMCkdavc3PcdJIIDQyALthlMmIAyHieNQ4v2DRlYOUxQL
         VyRw7GHQkuX0TGTiJwa3yeQVzObj7/e0QnZirNRyb9tqHqr0K1kgulIcGLOZJJLVLt2M
         61BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975898; x=1761580698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4bBWp0cZZfbhFMln+pmHCUN44UHPmvo/arXunhT5jKE=;
        b=DhDTDA1DWyiqgnG3PtR1jwhrdjM9uz+oGF3UsnpQKbpUaHpBp34xSs4WobnBtyxFsg
         h6Yz0zQJdSRVxQN8toPVwU20LS8V2EZ+Vg03UKM47+M7tEKDn9qtmOhQV0b65zEd5psM
         33DkZWJ15kaTqYn8jh8bpHbjkax+O6f1sq2rtY1zWwiCsTNHm/39Fd7sDRUcT8L8Az6G
         K6Il25W5sd0R5dD9K5Mh23k0ZUluOPCDBHnyeWr6int8X9trj1ng0wAM/AJjmB/tJayT
         K2cdwLHRKIS9nmooSKIqg11LgHprfe41FwGtz9vDIrgenx6dDhSnHt8X+Y6XPhqRRAeK
         uBKw==
X-Gm-Message-State: AOJu0YziQDlWEkL11OVDciSrDgTqAe0E2cxrnH5hwsb4lZ6mwNFkjJBI
	C/Qg7JLd9TC8yczdbv0XodcrvpON3onHIS+viTtSnXoPyK6zJgS+z3b8wwoI9A==
X-Gm-Gg: ASbGncscUcSXgEgmVDnNNb2nFRmR/UhKiW7xAvjgMVs06pJHMZsI6J1yAmq4msvTksU
	rCUjJjGdX5/Sg249wOsxaxpQJslFtb9Eha25kE5MJM+OSs19xFJG9wdlEak6Ch2xOPRqUoyDl4V
	WGwA9bLlzqSPP6TdneSwD+KqVbNXkyI4JotCb5LXT7qxIJEm/ylvJ8kkpHhBB7kLcrcdtHLiPdg
	tzGCFxoLlaDsxfuxOVo6acNdTkfvDubM+PKTM7Icdkc7S7CXcYCKZ05GTE0oRMzx3R2KbgVtOf9
	Xt0XNzoP1OX8Qbkw+x4hxh8CN2wHtQ3gsiq86ChaUgFU2RI8CSYDMo7RaRVlMuTgnfvS/wdpzsy
	glNUqW/AUQ8uOhab3gN+eeCevvogbNubFt5veHIJhYdVfvi7XXF8XCJHIkPc4d5fuNwrZOf2xR6
	i5oMhPF/KvfqWQuaSRfWSxtsulN+Das+uT5lZS0H3iPWrJrA4=
X-Google-Smtp-Source: AGHT+IHKzfgKW4bZ1DeL5o8aeZFWZ/+PF8Y+PPAhdeMS/8XKyHNiU4gsFiCPZ1uP6C2Xem5giTelUw==
X-Received: by 2002:aa7:d698:0:b0:631:6acd:fa3a with SMTP id 4fb4d7f45d1cf-63bfcdd5015mr13393417a12.4.1760975898483;
        Mon, 20 Oct 2025 08:58:18 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [for 4.22 v5 08/18] xen/dom0less: abstract Arm-specific p2m type name for device MMIO mappings
Date: Mon, 20 Oct 2025 17:57:51 +0200
Message-ID: <4cd92470b044ea63ebfb2170734ca2a68e0bf420.1760974017.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760974017.git.oleksii.kurochko@gmail.com>
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce arch_dt_passthrough_p2m_type() and use it instead of
`p2m_mmio_direct_dev` to avoid leaking Arm-specific naming into
common Xen code, such as dom0less passthrough property handling.

This helps reduce platform-specific terminology in shared logic and
improves clarity for future non-Arm ports (e.g. RISC-V or PowerPC).

No functional changes — the definition is preserved via a static inline
function for Arm.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5:
 - Nothing changed. Only rebase.
---
Changes in V4:
 - Introduce arch_dt_passthrough_p2m_type() instead of re-defining of
   p2m_mmio_direct.
---
Changes in V3:
 - New patch.
---
 xen/arch/arm/include/asm/p2m.h          | 5 +++++
 xen/common/device-tree/dom0less-build.c | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index ef98bc5f4d..010ce8c9eb 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -137,6 +137,11 @@ typedef enum {
     p2m_max_real_type,  /* Types after this won't be store in the p2m */
 } p2m_type_t;
 
+static inline p2m_type_t arch_dt_passthrough_p2m_type(void)
+{
+    return p2m_mmio_direct_dev;
+}
+
 /* We use bitmaps and mask to handle groups of types */
 #define p2m_to_mask(_t) (1UL << (_t))
 
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 9fd004c42a..8214a6639f 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -185,7 +185,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
                                gaddr_to_gfn(gstart),
                                PFN_DOWN(size),
                                maddr_to_mfn(mstart),
-                               p2m_mmio_direct_dev);
+                               arch_dt_passthrough_p2m_type());
         if ( res < 0 )
         {
             printk(XENLOG_ERR
-- 
2.51.0


