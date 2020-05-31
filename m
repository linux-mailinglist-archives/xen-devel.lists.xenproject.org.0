Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CD01E997F
	for <lists+xen-devel@lfdr.de>; Sun, 31 May 2020 19:39:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfRvD-0003hA-1Q; Sun, 31 May 2020 17:38:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yblG=7N=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jfRvC-0003gl-A9
 for xen-devel@lists.xenproject.org; Sun, 31 May 2020 17:38:54 +0000
X-Inumbo-ID: 899b0f22-a365-11ea-9947-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 899b0f22-a365-11ea-9947-bc764e2007e4;
 Sun, 31 May 2020 17:38:28 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id k26so9130958wmi.4
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2020 10:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nx6i+AHtHhOPOYC0ludmYEcyPCtH+R6fArfoXhgX/80=;
 b=ecRtJ9+dMcz6HFcCrjMA79m2NLL9pLTe3YlR6u/5U8B/pDwEZnHkpthloUcJD9mdeX
 z4NzrruZHIQ5BDed7AH8zcr/JzgBoZ1wQmFBvCf0zqPlH2VDi3PlRQEl/z3dTDw8CP0R
 VEh2hNdQFoGTa0ucGgNoDbeocX77DmNTTR7f1AuNpakZHtfsid+pCIBY0so133aao2cN
 b+i37OA+ThO+bxJeMeXuuwDMmwuLCLkIY+kfFnePWYnEWyGruAmEtPG2VehLleFSgTQF
 GNo4UF310Aboap3C76RpTvPD64wZq/2auDdcnjb13FWLdoOod69RR73rZOQlRY4ZML6K
 vZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nx6i+AHtHhOPOYC0ludmYEcyPCtH+R6fArfoXhgX/80=;
 b=ibIKM81wuAJwmyyB9/sJG5jiR1rrduahqSCDE7tksQI9lNEzx3xqzPJy0eYMWvhikr
 lcUmQBy8ESZgRMM3fr1FFDlYH4SU8YQRx9GWybH7SpT5BC1RZBZfv6S8DRJT5fAPt4ka
 Nd1ManrvpVMrFrkWP29FzdJzswFtcUonUfm0ojgNAsQ3rN5edMqEXNo4PzxdjmfjjcrN
 O3RNW94GW3FNhHvFFcCH/knhtus+BkCh0+qOX5h7zUyskUPKPvp385/9fpgp7UIe2syG
 E8bLKb/MdyLmFMuF4jDsJv28gdyUVbYpOGYY0Bmau4x404vlkS1PvuLe0ypIUg2oUEVv
 Vyig==
X-Gm-Message-State: AOAM531Vof60L2JDKfP3KE0YJVYCTgO+1kfkQ0kwT9r54l5/BfavwCrJ
 gpkjuqjn4AOIwiScz4LLGQ8=
X-Google-Smtp-Source: ABdhPJwrR3vwdIenjSppjEGj76X18jhrVpnPd8ljKzuiMJUGDNuZXGPyuZJVIrkrS466Afme7Vb7pg==
X-Received: by 2002:a1c:39c1:: with SMTP id g184mr17816585wma.9.1590946708068; 
 Sun, 31 May 2020 10:38:28 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id l19sm7973121wmj.14.2020.05.31.10.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 10:38:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/8] hw/i386/xen/xen-hvm: Use the IEC binary prefix definitions
Date: Sun, 31 May 2020 19:38:13 +0200
Message-Id: <20200531173814.8734-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200531173814.8734-1-f4bug@amsat.org>
References: <20200531173814.8734-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 qemu-ppc@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

IEC binary prefixes ease code review: the unit is explicit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/xen/xen-hvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 82ece6b9e7..679d74e6a3 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -9,6 +9,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 
 #include "cpu.h"
 #include "hw/pci/pci.h"
@@ -230,7 +231,7 @@ static void xen_ram_init(PCMachineState *pcms,
          * Xen does not allocate the memory continuously, it keeps a
          * hole of the size computed above or passed in.
          */
-        block_len = (1ULL << 32) + x86ms->above_4g_mem_size;
+        block_len = 4 * GiB + x86ms->above_4g_mem_size;
     }
     memory_region_init_ram(&ram_memory, NULL, "xen.ram", block_len,
                            &error_fatal);
-- 
2.21.3


