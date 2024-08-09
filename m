Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 971F894D483
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 18:20:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774848.1185264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scSLL-0001xf-IF; Fri, 09 Aug 2024 16:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774848.1185264; Fri, 09 Aug 2024 16:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scSLL-0001nE-Da; Fri, 09 Aug 2024 16:19:55 +0000
Received: by outflank-mailman (input) for mailman id 774848;
 Fri, 09 Aug 2024 16:19:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k3r+=PI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1scSLJ-0001ij-SK
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 16:19:53 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34ba45e7-566b-11ef-8776-851b0ebba9a2;
 Fri, 09 Aug 2024 18:19:51 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52f01b8738dso2122976e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Aug 2024 09:19:51 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530de481f09sm1028479e87.285.2024.08.09.09.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 09:19:50 -0700 (PDT)
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
X-Inumbo-ID: 34ba45e7-566b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723220391; x=1723825191; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZEoeDpSVCGC1Y9DhPq4eLpD8REr3S70n2Afun0RLq94=;
        b=IWyI67C4Zik7lSWDWaELwRFE1T0b6eWbEX4veD0snRlZrgC5K9z+9Ek4alLneean0r
         UCYbniGcbSBixtGXb0zKiqvoZcHbD7jXgA/0dblzz8JghX04Xkc7FGVEM0YzGjUjqAd4
         WX5V0tL2ODHC4ShyoS39jLxZfH2LVosv7FRY9Ig0VaMzB6a8iv4jZ8FSrtQyVncCnhpF
         yfK3ptOn1x8IUHxdVs0eJxSbh/7EKwp1ENtJ1NpDVYn3cY7cLtzm4D4m9wmCyW+zMQmd
         Jn24ldwpCGBVsXHkZsm1yHWHUsk2R3S0phhiKenpJ54Y8+CBblLK5jJsnNsfX9xXd8Vf
         ygVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723220391; x=1723825191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZEoeDpSVCGC1Y9DhPq4eLpD8REr3S70n2Afun0RLq94=;
        b=c7sFNKoqoDN93tY15wbrHn3Xv3RwP7ic2ZQgVKq80anm54MSQrMzRDyaIO44MMJNZz
         gRE+rmZXBIunLaDAH8HVpWyaL2sDd/ANORN7WRAZDFFibL2K3e9oqCoH+fiLIUr8yU39
         f1Ou+K5DBQAERy4WvcJenBeZtiFSqm/ziNrQYX1rTklAhQXi7tGF3qqOCiPprRFfCpNn
         qpwJL/zE+HzSszE6Ew1NM9BlIigJE282PpiHHzPImholGu+nyyV72IfJ3whRd7vsZnYA
         Xw0oGHIhX+x/TEDI+0QzormXsDa30pBKI8fOYEPV+k0cUoK7XiXMGscrWzipLn2i1LnE
         lW8A==
X-Gm-Message-State: AOJu0Yxc4qNYdPn9wD9kNp6BY8lx123c0dpdPknylfVF9s/Ocys5m5R2
	5JpCtLlNGYgRQr/JW5TsPwvaIEYjUOVB1rIbfYXX3aKx/cL7YJumvrIp5g==
X-Google-Smtp-Source: AGHT+IFNZAjU4+OKutmk1+W8LtYamJOzQVs+qWyha0tYPRq/8xvCktfHH1ROPSiLmknz33m00mb5FQ==
X-Received: by 2002:ac2:4c49:0:b0:52e:9882:2cd8 with SMTP id 2adb3069b0e04-530ee96c714mr1517581e87.4.1723220390805;
        Fri, 09 Aug 2024 09:19:50 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 1/7] xen/riscv: enable CONFIG_HAS_DEVICE_TREE
Date: Fri,  9 Aug 2024 18:19:39 +0200
Message-ID: <cf61eaf4eaf398630246cd485298b5c14592c690.1723214540.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1723214540.git.oleksii.kurochko@gmail.com>
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable build of generic functionality for working with device
tree for RISC-V.
Also, a collection of functions for parsing memory map and other
boot information from a device tree are available now.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V4:
 - Nothing changed. Only rebase
---
Changes in V3:
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
 - update the commit message
---
Changes in V2:
 - move 'select HAS_DEVICE_TREE' to CONFIG_RISCV.
---
Changes in V1:
 - new patch
---
 xen/arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index f531e96657..259eea8d3b 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -2,6 +2,7 @@ config RISCV
 	def_bool y
 	select FUNCTION_ALIGNMENT_16B
 	select GENERIC_BUG_FRAME
+	select HAS_DEVICE_TREE
 
 config RISCV_64
 	def_bool y
-- 
2.45.2


