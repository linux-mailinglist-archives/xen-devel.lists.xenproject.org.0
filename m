Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F17371EA5E1
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 16:30:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jflSB-0006G8-Sz; Mon, 01 Jun 2020 14:30:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+AG4=7O=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jflSA-0006FR-Li
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 14:30:14 +0000
X-Inumbo-ID: 571b3b3a-a414-11ea-9dbe-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 571b3b3a-a414-11ea-9dbe-bc764e2007e4;
 Mon, 01 Jun 2020 14:29:46 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id k26so11592076wmi.4
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 07:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BWyCSlaGZ5iGWtDERp092wuI7W/yJ6Q5PNPhUdRKhqE=;
 b=YYdDUqhdLC78jQgiEyQ97vcy07tygmsEfX05PhXA32BxLX4Qe9twTWzZmVHR3RVHIY
 +iIyt1j0gFZqOFSr605qHbE2POl+jt9MJdfiedY4UGCiWC/djzHGT4gJjI3nG74wfkyf
 E/2/Kkh958INFuor/mhxBoXRwW4pFSd1w3zYBCgs8YkNUZoMLPAcfgJcNIx2hjDevr1L
 kgbcUNCBqqQhZlc+JNsd85h9B66dOpEA3+cInY/WOBNWG0Lc1Pa92lK7g4BUtZ4aaTKV
 mwP8Slp3c6cYpbvlWHqG1VDHdhtDUaTiWEO7Y4qycQdTKuVs8LtVl4dH8Jffj0657DSq
 Qi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BWyCSlaGZ5iGWtDERp092wuI7W/yJ6Q5PNPhUdRKhqE=;
 b=Qp59LMxYXjpSC6XTYUwV1qyTfqWhH7Pn+7BdZ6wEiOdglnikr1S3hBDsgSLCWfOkCL
 wMtKHvYbJBZubxxlTj12R6qLPAN3vTYXeOcwHzpgfP8POqWaMYFI3un9ExDcNZXzOFdW
 wHgDCKAw90HiPqc6ycHNjlB4FMJOIPouXycsyKcrNPxIPacTMwqFtzcxwMinIJ+LZZZt
 JBL/gAgoapcYLbDplua9NNoKJLW7ABhAVaR68FxKoan4lPi5jyxFsIaAmXw+/4cjs8Lb
 7hOnPUNPh9vpOWmkzS+1Rdr13L2ggq0c4eHoQpkOjYGwRKx1tAqPW2A9/pMUOsLLnTwO
 Pr6w==
X-Gm-Message-State: AOAM532xHZxqvI8LcRHsTY7kdX4eHw607l8FRldeN6WW3u9KWg4aolcX
 pFUEQmV0w3OwrrZq1SYNSkU=
X-Google-Smtp-Source: ABdhPJwzKaKvNJHEQ9IyYhEt4dQ3EvLLXvUAscQJQxiSIYHiAQMssMIh3EDSb2IIdm7moUjOASs4pA==
X-Received: by 2002:a1c:b656:: with SMTP id g83mr23163858wmf.151.1591021785290; 
 Mon, 01 Jun 2020 07:29:45 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id u12sm6824954wrq.90.2020.06.01.07.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 07:29:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] target/i386/cpu: Use the IEC binary prefix definitions
Date: Mon,  1 Jun 2020 16:29:30 +0200
Message-Id: <20200601142930.29408-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601142930.29408-1-f4bug@amsat.org>
References: <20200601142930.29408-1-f4bug@amsat.org>
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <rth@twiddle.net>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

IEC binary prefixes ease code review: the unit is explicit.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 3733d9a279..33ce4861fb 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6159,7 +6159,7 @@ static void x86_cpu_machine_done(Notifier *n, void *unused)
     if (smram) {
         cpu->smram = g_new(MemoryRegion, 1);
         memory_region_init_alias(cpu->smram, OBJECT(cpu), "smram",
-                                 smram, 0, 1ull << 32);
+                                 smram, 0, 4 * GiB);
         memory_region_set_enabled(cpu->smram, true);
         memory_region_add_subregion_overlap(cpu->cpu_as_root, 0, cpu->smram, 1);
     }
-- 
2.21.3


