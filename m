Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED6D28C20D
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 22:08:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6023.15785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kS470-00077h-9s; Mon, 12 Oct 2020 20:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6023.15785; Mon, 12 Oct 2020 20:08:02 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kS470-000772-50; Mon, 12 Oct 2020 20:08:02 +0000
Received: by outflank-mailman (input) for mailman id 6023;
 Mon, 12 Oct 2020 20:08:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CKVJ=DT=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kS46y-00073L-CB
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 20:08:00 +0000
Received: from mail-qv1-xf44.google.com (unknown [2607:f8b0:4864:20::f44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d8cb4da-0b8c-45fe-83b2-8d614af9c96d;
 Mon, 12 Oct 2020 20:07:59 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id b10so6713792qvf.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2020 13:07:59 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:9802:d83e:b724:7fdf])
 by smtp.gmail.com with ESMTPSA id d129sm13418350qkg.127.2020.10.12.13.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 13:07:58 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CKVJ=DT=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kS46y-00073L-CB
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 20:08:00 +0000
X-Inumbo-ID: 9d8cb4da-0b8c-45fe-83b2-8d614af9c96d
Received: from mail-qv1-xf44.google.com (unknown [2607:f8b0:4864:20::f44])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9d8cb4da-0b8c-45fe-83b2-8d614af9c96d;
	Mon, 12 Oct 2020 20:07:59 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id b10so6713792qvf.0
        for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2020 13:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QY2243JX786fdUoHzoK1Y6Kh1lJrJoZtoq/K0Z9ICJs=;
        b=rYtSPe2K/v1dU7vZsTf27LfQRM1ImXctJlIOG3nIN7IH978uvQVPQCjWOd6D6XniNU
         mKQg27mvMRIXMCi4AnPhtDNCrMgkF9YnvVLyst07RQa3J7AoDV9twIKB9nD75/WM1SXf
         si7oE4eTR1Vtlc59TMUo6Ns6acrzagC9QRh6ajVF6vQJKUtHM3bRSpHWKiraNSDp0oTx
         PbbHDxkBMZjQDCuFP0KNmVOHAEZYT4PS/s0QVTFGjQsKkfTJRLfrtGTHABYgGkfMvWX9
         PaucQ1LQGfo7nU2F3n7cPK94O3Z3cTejLMuXEXktHME0VdOtuuhg8oNV+MVp3QdHgj+c
         eaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QY2243JX786fdUoHzoK1Y6Kh1lJrJoZtoq/K0Z9ICJs=;
        b=N5vQNLrLjLwDg8/qdiFNllK7Dch672r2qLfcGFy+NfatUkDUVJZqqY7uVPaRdSekqQ
         oPV/WWtZTTWZPRZEZWcZr88j06siplWo/MOrTpfcccIwI5nQ+vSloXnhoxqz3bkGTU8p
         UvF2gMzqjmmXVh2fwglszh2Zqy+Pb53xsMvft2lJq8eJlwXeNR7Aay0VvhKPckfyWsFX
         j7VvpuG8lfiolcSIZFS+kVlP/1zi3Rjo1xuRI2GIwIYIgGaMEK/wk0SgGygiW/yYCCEf
         9JXCx0/BnaGR31zR6atHZzlfZ+cEzfhON94l3fOHanMDTENR+6HWZnfb3KKvYfko9FgV
         yp3A==
X-Gm-Message-State: AOAM531FZCITL/VqLXKLmq3mWocvuwU/yCb9SwQlywdZiG3TPM9ZkJ5W
	XblesAUJ7SoF2wjVHklah+I=
X-Google-Smtp-Source: ABdhPJw3I51kN+J+TGXLaLkJTSdYuDYY97kg7N1G1MUPkpX1p5tdCYS7ebkzO/aJ0SAisDXB4fym3w==
X-Received: by 2002:a0c:b29e:: with SMTP id r30mr27540725qve.38.1602533279090;
        Mon, 12 Oct 2020 13:07:59 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:9802:d83e:b724:7fdf])
        by smtp.gmail.com with ESMTPSA id d129sm13418350qkg.127.2020.10.12.13.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 13:07:58 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH 2/2] accel: Add xen CpusAccel using dummy-cpu
Date: Mon, 12 Oct 2020 16:07:24 -0400
Message-Id: <20201012200725.64137-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201012200725.64137-1-jandryuk@gmail.com>
References: <20201012200725.64137-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen was broken by commit 1583a3898853 ("cpus: extract out qtest-specific
code to accel/qtest").  Xen relied on qemu_init_vcpu() calling
qemu_dummy_start_vcpu() in the default case, but that was replaced by
g_assert_not_reached().

Add a minimal "CpusAccel" for xen using the dummy-cpu implementation
used by qtest.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 accel/dummy/meson.build |  1 +
 accel/xen/xen-all.c     | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/accel/dummy/meson.build b/accel/dummy/meson.build
index 5fbe27de90..cdff0ba746 100644
--- a/accel/dummy/meson.build
+++ b/accel/dummy/meson.build
@@ -4,3 +4,4 @@ dummy_ss.add(files(
 ))
 
 specific_ss.add_all(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'], if_true: dummy_ss)
+specific_ss.add_all(when: ['CONFIG_XEN'], if_true: dummy_ss)
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 60b971d0a8..2d243c58d4 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -16,12 +16,15 @@
 #include "hw/xen/xen_pt.h"
 #include "chardev/char.h"
 #include "sysemu/accel.h"
+#include "sysemu/cpus.h"
 #include "sysemu/xen.h"
 #include "sysemu/runstate.h"
 #include "migration/misc.h"
 #include "migration/global_state.h"
 #include "hw/boards.h"
 
+#include "accel/dummy/dummy-cpus.h"
+
 //#define DEBUG_XEN
 
 #ifdef DEBUG_XEN
@@ -153,6 +156,10 @@ static void xen_setup_post(MachineState *ms, AccelState *accel)
     }
 }
 
+const CpusAccel xen_cpus = {
+    .create_vcpu_thread = dummy_start_vcpu_thread,
+};
+
 static int xen_init(MachineState *ms)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
@@ -180,6 +187,9 @@ static int xen_init(MachineState *ms)
      * opt out of system RAM being allocated by generic code
      */
     mc->default_ram_id = NULL;
+
+    cpus_register_accel(&xen_cpus);
+
     return 0;
 }
 
-- 
2.25.1


