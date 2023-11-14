Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B29057EB2EF
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 16:00:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632713.987089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uta-0000Fh-EC; Tue, 14 Nov 2023 15:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632713.987089; Tue, 14 Nov 2023 15:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uta-0000Cj-AG; Tue, 14 Nov 2023 15:00:06 +0000
Received: by outflank-mailman (input) for mailman id 632713;
 Tue, 14 Nov 2023 15:00:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2uaB-0003b0-V7
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 14:40:03 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b19ac7f7-82fb-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 15:40:02 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-53e751aeb3cso8834434a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 06:40:02 -0800 (PST)
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 r30-20020a50aade000000b005434e3d8e7bsm5309632edc.1.2023.11.14.06.39.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Nov 2023 06:40:01 -0800 (PST)
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
X-Inumbo-ID: b19ac7f7-82fb-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972802; x=1700577602; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfmEPJkfg9xcA7W0yB07+uhlzLrR51RZZmvLOIuALj0=;
        b=sexywZSuZ5OpVpMwaZq+bkmen11MGw6bGNxc5lCGhet+f85tIukUUW8aO/2Kkc4x0h
         5dCeXThmpBG5hfCevx+QctQZLRB7LWXlO0x3pKdAlUN0kF4O/DA3TjZTpOEeVx4XjNwA
         vCXqw0Wu5SudpThf98wEjQSzb22/WHpIHoImh7OK5ClKI59UgVfvS6+IcR0hvUr/Zz51
         qz5ZdMeNtU7lFc+8Xhm1ZeyAz7PNhRYEDf+trN799nDHWqP4HoCD/rW+8Uyz+x00Afk7
         V83aEnRt8/+bLzk7XELS6waFJL1FO7ScCTaytOAjt3UdLFimdyXnhmS7SG21NGMaw5TS
         fgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972802; x=1700577602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfmEPJkfg9xcA7W0yB07+uhlzLrR51RZZmvLOIuALj0=;
        b=xEn511E5/Hbk15iCfarn3jdqWpmITcxbnM5r855SULBRpP7QV2AAbzFoTN9jA8IbFU
         ulub9o6v4fEbpGJYT9yxUyYU85FT0GOILMl+Nfu0PUNZMvYUX+ba6s7IEk44fmirZfz6
         LHxNWGoRSZZW7lkh780wUEv8TGU22dnd+EktqG3xuBcg0YCcjmbRhnlIL5GWcBQXb+tN
         BgtcCZDR6boIlYArRQyVSFCCUDLQPwKPuiCVLhmvT3OFnDmn/Q8tSZgOSMAaH8JQvGm2
         GE98CPSwUcIbYsYeoARpSND7mHeDUBJHBo0sdzAjU7doYzidXNTP3BrQNOecHaQZoQ0l
         +amA==
X-Gm-Message-State: AOJu0YzjHoeDj+fouJfzqPTC63nxEiKOuNSLixK7FFXwA29h8U9CUqy0
	4yNksCDxuDVTjLbp4D7sPLlsLg==
X-Google-Smtp-Source: AGHT+IFr1fCG0rC/823Fjj2RnGPLFEJJu5Vypm0crh2s8xGJ38WYt9mRvWNiRlcZ2yw4Up2Qw1V1LQ==
X-Received: by 2002:aa7:d704:0:b0:53d:e0cf:cb95 with SMTP id t4-20020aa7d704000000b0053de0cfcb95mr7775616edq.21.1699972802002;
        Tue, 14 Nov 2023 06:40:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH-for-9.0 v2 15/19] hw/xen: Reduce inclusion of 'cpu.h' to target-specific sources
Date: Tue, 14 Nov 2023 15:38:11 +0100
Message-ID: <20231114143816.71079-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We rarely need to include "cpu.h" in headers. Including it
'taint' headers to be target-specific. Here only the i386/arm
implementations requires "cpu.h", so include it there and
remove from the "hw/xen/xen-hvm-common.h" *common* header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
---
 include/hw/xen/xen-hvm-common.h | 1 -
 hw/arm/xen_arm.c                | 1 +
 hw/i386/xen/xen-hvm.c           | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
index 8934033eaa..83ed16f425 100644
--- a/include/hw/xen/xen-hvm-common.h
+++ b/include/hw/xen/xen-hvm-common.h
@@ -4,7 +4,6 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 
-#include "cpu.h"
 #include "hw/pci/pci.h"
 #include "hw/hw.h"
 #include "hw/xen/xen_native.h"
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index 6b0e396502..b478d74ea0 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -33,6 +33,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/xen/xen-hvm-common.h"
 #include "sysemu/tpm.h"
+#include "cpu.h"
 
 #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
 OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 0fbe720c8f..f1c30d1384 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -22,6 +22,7 @@
 
 #include "hw/xen/xen-hvm-common.h"
 #include <xen/hvm/e820.h>
+#include "cpu.h"
 
 static MemoryRegion ram_640k, ram_lo, ram_hi;
 static MemoryRegion *framebuffer;
-- 
2.41.0


