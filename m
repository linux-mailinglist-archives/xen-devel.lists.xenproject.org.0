Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 031BE1EA5DF
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 16:30:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jflS6-0006CR-IS; Mon, 01 Jun 2020 14:30:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+AG4=7O=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jflS5-0006CA-LT
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 14:30:09 +0000
X-Inumbo-ID: 564b440c-a414-11ea-9947-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 564b440c-a414-11ea-9947-bc764e2007e4;
 Mon, 01 Jun 2020 14:29:44 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x6so5292wrm.13
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 07:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SXUn2QQFzfY6E+figfmQGRv5xI8cdi2Y+xrdtsaM+Sw=;
 b=MeXAw86ml412WTe/fsbzOJTWxjk+Rldv3qgzlTd0jJQsOtea9XegxhBH/8V5pQOVnP
 fXogzJSZ+hjZIrhND/m9A/vKYTfmeAue9Qox3ZjWrudLmjNTRT6YUl7fSOC4OPEIlXJx
 RDxRfuk+01gSofzmvWqhy4bmcEJtYSyOoEDLf9Vz3tGnb4sbwtp/IvgM0YmiX9BnMdy+
 m3rwE3Ca/xJv9Yp5SGAtoLPnH78Dt0QnoGznahyxH5L6k+XnfS/yXI1RBRVSkde7GJaA
 PWlTD9aL49q5TbVDMJrh3zuTWmQZ57Gq2f36LyP3VNPOpbvIdY6Grm5OwshvQp3Xu/wS
 nDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SXUn2QQFzfY6E+figfmQGRv5xI8cdi2Y+xrdtsaM+Sw=;
 b=R2dkXCAgcZUdPt+4RaS37bRWBNXwwNabbf1llN1yHkAHNrsqyVGxzkwLU67e60GjaO
 bLgc355QV/+Ar2sTqScRYXpwdt++xfJox4848VEp+pzoCjYI9eNZoorbHosm3VQJON5W
 1opQ6b1RFhmtA/2smBqIsZZNObeUHjwtppiYAStGE73X0rvLBJb58Pw04PLCi/Vhw1+n
 IgA6Pdy7iziHZqPHQGrSSr7dy8cyUN6FTVjh4Oh0XtpCdrbEaGRdPAzbaFxIikjvx63i
 lzORidjc4ZfKvYDwRY6kh5JXfNzcMv1U4BDoCTVHVCG+hH9YtZOUVhBi3ERw90znygHQ
 tDLQ==
X-Gm-Message-State: AOAM5333Qe8oBypSG//LqfdvKBNdVichkgLWDY9VhD5pADzLizhcCxHo
 bikN5/AfMPriWDJA8hmJd1M=
X-Google-Smtp-Source: ABdhPJxGfoEw6g2vJ9OfpCjaYwWCmMl8Ah+Lnpp6R9LdwbX3+s5BYxOV3Vc5ZpcNzQGowCfzq7ym7w==
X-Received: by 2002:adf:fe8d:: with SMTP id l13mr21567252wrr.282.1591021783964; 
 Mon, 01 Jun 2020 07:29:43 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id u12sm6824954wrq.90.2020.06.01.07.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 07:29:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] hw/i386/xen/xen-hvm: Use the IEC binary prefix
 definitions
Date: Mon,  1 Jun 2020 16:29:29 +0200
Message-Id: <20200601142930.29408-8-f4bug@amsat.org>
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
 hw/i386/xen/xen-hvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 82ece6b9e7..94fe5d65e9 100644
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
+        block_len = (4 * GiB) + x86ms->above_4g_mem_size;
     }
     memory_region_init_ram(&ram_memory, NULL, "xen.ram", block_len,
                            &error_fatal);
-- 
2.21.3


