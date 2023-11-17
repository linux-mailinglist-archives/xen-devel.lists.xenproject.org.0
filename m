Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9068B7EF298
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 13:25:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635123.990980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xuD-0004Cb-My; Fri, 17 Nov 2023 12:25:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635123.990980; Fri, 17 Nov 2023 12:25:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xuD-00044W-AI; Fri, 17 Nov 2023 12:25:05 +0000
Received: by outflank-mailman (input) for mailman id 635123;
 Fri, 17 Nov 2023 12:25:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c3wv=G6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r3xuA-0000ZQ-M4
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 12:25:02 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54bf2552-8544-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 13:25:02 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-507cee17b00so2493491e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 04:25:02 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a18-20020ac25e72000000b005094d95e8bcsm209811lfr.218.2023.11.17.04.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 04:25:00 -0800 (PST)
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
X-Inumbo-ID: 54bf2552-8544-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700223901; x=1700828701; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJjcySsrWCUTisDHIaY5a1c2SD1fU/bpuLwPL2CuBTA=;
        b=kVlnbOm77zfqpTI7bhsw7GfxK69nRmBl5XSxY1Zdqyw2TXg2Y9pUZ6igHxjqMYz6Ci
         KCp00FOZHpGA14ImMDUQhz8cJ2lJG0nxee+WMhBOC6ZDjjavbi1GEz1ysRz71MjiwLHO
         PlMETrbFuWbvX0SPh5vlTf8rVUYd6bHMXUyVWYLggmAlyUzlgTaauGCzvurmmsENmHbn
         Bc0zS2uR7a0b+EB2DIyJJWFezBDtMn/wrrot3MBSy2BoK04zBpO9vckJbmMBqVrL1fma
         aQnXXS9TIHgwflC3TrR3tTknuN5vSdQWr/k6MMsZsJ1F6Wybmpblc04E53f13hMQRPH4
         a/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700223901; x=1700828701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJjcySsrWCUTisDHIaY5a1c2SD1fU/bpuLwPL2CuBTA=;
        b=I+b/Sn/dKBaXLVBtwWrPcE6aCg9VGSly+m4d0ASMmPvcMe1myWEJpYCHhB/lJWdMGo
         9efFLeC2zB0t0+8y37YNDM02TBICOVtxFo3em7hZejPS84U09gtRQ/N2cICidUyk54ZM
         42wKwsoXZgXlTsmPMjdpGtfNLXj1vHzvs1g1aNE0JT30nIUj0kWoL4jVrw6nh2hprrx/
         KmWYP+KuqM7nD9otAOq71biXKaAYW4W3XIkeyXwjv5+CjJ2m4AxsBsR+T/GJUBSMnS6X
         Gi6HoTOgYsYiU6FpZxI6MJ4SxjApUFZmpNAjmPyqsI8nlIsnHEA7yYvYO8wntMDhqYnc
         rMQw==
X-Gm-Message-State: AOJu0YwVa/H1y3OCyyKfJJRRrpXwjAUNdac2M+qDBfmn3TIZGn7a8cDN
	9AF7F7rrANyII30NdCnwLM5+hyI6Y5s=
X-Google-Smtp-Source: AGHT+IFYxXcNyg3SvVQe/LDOT6dpnjF82/o1CSl8OOCxiVTZeiGHE1uvF5kyLOIQ17nCI2mCCn+XvQ==
X-Received: by 2002:a05:6512:1383:b0:50a:9652:31d2 with SMTP id fc3-20020a056512138300b0050a965231d2mr7469171lfb.15.1700223900985;
        Fri, 17 Nov 2023 04:25:00 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v3 13/14] xen: ifdef inclusion of <asm/grant_table.h> in <xen/grant_table.h>
Date: Fri, 17 Nov 2023 14:24:37 +0200
Message-ID: <d2ccd9d037202515a63d085c8f11654d12926a47.1700221559.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1700221559.git.oleksii.kurochko@gmail.com>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ifdef-ing inclusion of <asm/grant_table.h> allows to avoid
generation of empty <asm/grant_table.h> for cases when
CONFIG_GRANT_TABLE is not enabled.

The following changes were done for Arm:
<asm/grant_table.h> should be included directly because it contains
gnttab_dom0_frames() macros which is unique for Arm and is used in
arch/arm/domain_build.c.
<asm/grant_table.h> is #ifdef-ed with CONFIG_GRANT_TABLE in
<xen/grant_table.h> so in case of !CONFIG_GRANT_TABLE gnttab_dom0_frames
won't be available for use in arch/arm/domain_build.c.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - Remove unnecessary comment.
---
 xen/arch/arm/domain_build.c            | 1 +
 xen/arch/ppc/include/asm/grant_table.h | 5 -----
 xen/include/xen/grant_table.h          | 3 +++
 3 files changed, 4 insertions(+), 5 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/grant_table.h

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 2dd2926b41..6e8cc6bbb5 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -34,6 +34,7 @@
 
 #include <xen/irq.h>
 #include <xen/grant_table.h>
+#include <asm/grant_table.h>
 #include <xen/serial.h>
 
 #define STATIC_EVTCHN_NODE_SIZE_CELLS 2
diff --git a/xen/arch/ppc/include/asm/grant_table.h b/xen/arch/ppc/include/asm/grant_table.h
deleted file mode 100644
index d0ff58dd3d..0000000000
--- a/xen/arch/ppc/include/asm/grant_table.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_GRANT_TABLE_H__
-#define __ASM_PPC_GRANT_TABLE_H__
-
-#endif /* __ASM_PPC_GRANT_TABLE_H__ */
diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 85fe6b7b5e..50edfecfb6 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -26,7 +26,10 @@
 #include <xen/mm-frame.h>
 #include <xen/rwlock.h>
 #include <public/grant_table.h>
+
+#ifdef CONFIG_GRANT_TABLE
 #include <asm/grant_table.h>
+#endif
 
 struct grant_table;
 
-- 
2.41.0


