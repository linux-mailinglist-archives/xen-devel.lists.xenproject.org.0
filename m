Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15044984981
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 18:24:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803098.1213532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8Kq-00066I-EH; Tue, 24 Sep 2024 16:24:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803098.1213532; Tue, 24 Sep 2024 16:24:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8Kq-00064Z-BN; Tue, 24 Sep 2024 16:24:20 +0000
Received: by outflank-mailman (input) for mailman id 803098;
 Tue, 24 Sep 2024 16:24:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C5PF=QW=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1st8Ko-00063x-T4
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 16:24:18 +0000
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [2607:f8b0:4864:20::e2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71f4c5b2-7a91-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 18:24:17 +0200 (CEST)
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-49bd27b3507so1688554137.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 09:24:18 -0700 (PDT)
Received: from gmail.com ([168.243.189.171]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4a15178e4cdsm1023711137.9.2024.09.24.09.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 09:24:15 -0700 (PDT)
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
X-Inumbo-ID: 71f4c5b2-7a91-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727195056; x=1727799856; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHqFiYd34JBge6EKjvquxYF3ZfNzIdsMHiJwWGrVeAw=;
        b=XY/2D85lcl1Cuaumfz7l1B8z6Exw85CRff0Jmo9Rplq1aYgmNQ2syTf9qdh9ZSSxlK
         M/t76VZ7kfZRxze9LVjbOoVjHb2ihfZgg3eFk1TiqhOWIv1SW5tqRWiE4LUR+d7JALHp
         kcGVL0rDMNyvPR+onTSTPHAhwsgYFR6KaUu+CwA7YeTPlrubUFx1MfBePPbKt/1jFaqv
         U87TbKqZbakERbQ7/PNUy7ocVFl1Pgt097iBuAcX78lIkfFQeZUk7V33Tz1czTzMWcwh
         MMsGrErPSDf8P3BdQ3Wfgeykv/j6dI5PwlwIZ4hVqYetExjqz0r1w320iR8Qy76UmMzJ
         LhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727195056; x=1727799856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHqFiYd34JBge6EKjvquxYF3ZfNzIdsMHiJwWGrVeAw=;
        b=XPYcXBBpEwgY/hgNDhX8p3pOwM9bffGdm9hZIxPS20t0RPQLhXZPkTWkPg1XxhE9if
         ZmojOUf58MvQkAAucSMWskCGRNPwG4WlAgA+k7lkg4+60jDX46mNTnHB9SIXFu+t0JYR
         SKcLZSITiiQ08QTqHlwboFwWg6bBN84PGsFc42BpH1i5M175Qu0xiOuYl8Mr06/71tds
         UE5UPkibDTFgaIB1IqxPf1pTeAdAAivalw+g3URvmtdWY8efO5LZg2K39Gv7azoj4fua
         tCZjK6lzqOolZgoMYa/zyCZqLyAtY/06Ge0zN9m2yvkHNo2cSRguuBF5yCjrf72CkEFx
         /Ygw==
X-Gm-Message-State: AOJu0YxJFW2NSMkp/3iVIyRgjyCDMLkaFZPpsR91rdwjGURRcfqTNfcB
	oXeF0UfPeDFiCAWWhg+4skeMkvRzbMAkj1UW8WB65FPYHO8Loq1Mm6olwcnb
X-Google-Smtp-Source: AGHT+IFOadIJyLA3vRoloCeVTGG6IzK5wKQ0L3+f1O4b8Vx9++Gc0LFlRZaf0w4w3DseWR2VvoJoqA==
X-Received: by 2002:a05:6102:54a7:b0:498:9c0a:af1a with SMTP id ada2fe7eead31-4a15dc64fa3mr111772137.4.1727195056388;
        Tue, 24 Sep 2024 09:24:16 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	dpsmith@apertussolutions.com,
	edgar.iglesias@amd.com
Subject: [PATCH v1 1/6] xen/arm: Decrease size of the 2nd ram bank
Date: Tue, 24 Sep 2024 18:23:54 +0200
Message-ID: <20240924162359.1390487-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

The address range between 4G (32bit) and 1TB (40bit) is fully
allocated. There's no more room for devices on ARM systems with
40-bit physicall address width.

This decreases the size of the second RAM bank to free up space
in preparation for virtio-pci and for future use-cases.

In the future we may need to add a third RAM bank in higher
address ranges.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 xen/include/public/arch-arm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index e2412a1747..e19f0251a6 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -491,8 +491,8 @@ typedef uint64_t xen_callback_t;
 #define GUEST_VPCI_PREFETCH_MEM_ADDR        xen_mk_ullong(0x100000000)
 #define GUEST_VPCI_PREFETCH_MEM_SIZE        xen_mk_ullong(0x100000000)
 
-#define GUEST_RAM1_BASE   xen_mk_ullong(0x0200000000) /* 1016GB of RAM @ 8GB */
-#define GUEST_RAM1_SIZE   xen_mk_ullong(0xfe00000000)
+#define GUEST_RAM1_BASE   xen_mk_ullong(0x0200000000) /* 952GB of RAM @ 8GB */
+#define GUEST_RAM1_SIZE   xen_mk_ullong(0xee00000000)
 
 #define GUEST_RAM_BASE    GUEST_RAM0_BASE /* Lowest RAM address */
 /* Largest amount of actual RAM, not including holes */
-- 
2.43.0


