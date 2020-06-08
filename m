Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D901F1CC6
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:03:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKFJ-0005Zk-D1; Mon, 08 Jun 2020 16:03:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKFI-0005Ys-FD
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:03:32 +0000
X-Inumbo-ID: 96decccc-a9a1-11ea-96fb-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 96decccc-a9a1-11ea-96fb-bc764e2007e4;
 Mon, 08 Jun 2020 16:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6htctWfi0MuFSG0QMH05N/TPpEubln82RtGM2+VRUkY=;
 b=Ul0cJiIVNQn4mBpQsqELB939niuIBptRc4P0+yZfe5NLoh/q0RBlkA2CiR4p8tlycIa36L
 eK/ubT+1YDMyFH43qmUAjkFflYGZYgBsdMVgYgZidAU7Nru+AP/J4bDbvyzgRpCt7BIN+8
 6xEwdg9BR38CyY1ws+jzlA/cn3umFnE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-cKOrTLa9NsmBOi00y4g5GQ-1; Mon, 08 Jun 2020 12:03:25 -0400
X-MC-Unique: cKOrTLa9NsmBOi00y4g5GQ-1
Received: by mail-wm1-f71.google.com with SMTP id b63so116042wme.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6htctWfi0MuFSG0QMH05N/TPpEubln82RtGM2+VRUkY=;
 b=SBMtI8HJJ1ONZxzHkXNweac4Li1fDENMLqmN9T2/jUwPS88A8bpWEiuTY/VcPrxLaT
 v/nCXWrCTUghZSOW0TprQzT1ZFjj0E8GEaKHYtdM72FRVAcmkOcCUlRDk2iosl+RWVVl
 j5pf2OZDAek4m1kDeXq54q50gpEC4xgl5nSvJ3O43W6cxNgu/rtv9AbHHo+qmaNo1NG8
 CesFTqX7lAAAeiiLKB3ZzM7CqIDBy6DjyilD2/e3LWMoOHOaHUm38creOxusAKr6V8lp
 ovdmhtlqBEvnvh1CdlkFCG3Vg5/y+5WIa/6PcgLhiHmwgnRgnq1uwMLElOAYc4GFHeXj
 eyqQ==
X-Gm-Message-State: AOAM531untfaIRnooh6G6KWtIpqRQRExbl5qcJzYLYbDcuN2qRQZtchw
 OCj56RMGgowFnYNEZYI5gKoDfDYG+S3oAXqhDOtt3OhFdCoqjKaZpQRAE+IpG57/DstvCpPGLRN
 ILef1UZvFnkxryhyXHQd5OAbAGGg=
X-Received: by 2002:a5d:5585:: with SMTP id i5mr23967103wrv.112.1591632204338; 
 Mon, 08 Jun 2020 09:03:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPoWRkkwB/FnLCAhEPa5I9PvgN5hBH0wEtPqJP6K6G5xK4bW4Hm9SvYdS2VHkDfOIc4QPeAQ==
X-Received: by 2002:a5d:5585:: with SMTP id i5mr23967049wrv.112.1591632204161; 
 Mon, 08 Jun 2020 09:03:24 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id f71sm21622wmf.22.2020.06.08.09.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 27/35] hw/ppc/ppc: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:36 +0200
Message-Id: <20200608160044.15531-28-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/ppc/ppc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 4a11fb1640..39fcf746c5 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -37,6 +37,7 @@
 #include "kvm_ppc.h"
 #include "migration/vmstate.h"
 #include "trace.h"
+#include "hw/qdev-deprecated.h"
 
 //#define PPC_DEBUG_IRQ
 //#define PPC_DEBUG_TB
@@ -1114,6 +1115,8 @@ clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq)
     PowerPCCPU *cpu = env_archcpu(env);
     ppc_tb_t *tb_env;
 
+    qdev_warn_deprecated_function_used();
+
     tb_env = g_malloc0(sizeof(ppc_tb_t));
     env->tb_env = tb_env;
     tb_env->flags = PPC_DECR_UNDERFLOW_TRIGGERED;
-- 
2.21.3


