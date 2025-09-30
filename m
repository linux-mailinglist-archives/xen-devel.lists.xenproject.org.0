Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47548BAC07A
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 10:26:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133960.1472068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Vgk-0007Qe-0J; Tue, 30 Sep 2025 08:26:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133960.1472068; Tue, 30 Sep 2025 08:26:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Vgj-0007Nx-RL; Tue, 30 Sep 2025 08:26:21 +0000
Received: by outflank-mailman (input) for mailman id 1133960;
 Tue, 30 Sep 2025 08:26:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Vd6-0007Nm-Jl
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 08:22:36 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e04926c-9dd6-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 10:22:34 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46e52279279so14718645e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 01:22:34 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb74e46bcsm21775814f8f.8.2025.09.30.01.22.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 30 Sep 2025 01:22:33 -0700 (PDT)
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
X-Inumbo-ID: 9e04926c-9dd6-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759220554; x=1759825354; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtU1C0M8U0OTbHcI2E95ZD2Zrsmz5/OESKETD6NudSM=;
        b=btkaxKle6qF/ovKjiGQ9wY2p1NyTjGlhcKZIT4HUSFB/5stuQuAyytPlWH0PNgC2tG
         va+MiOuTIc8vyLC3B4xqPTeIrOBNoNt3Rfx6pqfgswmp1uGQ9lE7tlU1QDPKWkVgRJEX
         G+lA7yo8oKD786ssLnijCzOC9loxrH303xJ6IpMeCV9Jo1yoF6M2LG29mwQ67e9aNDiN
         0Kfe+sjdNqtLScP5S62urALa63yemJdsXX6d7S58vJnTquaT2BnZdsKfwKpJfr7EGLhE
         2Ck6D9klD++sTnPzcdjiYmDcftYZgAlth8Y7o7sFvNA0nY3AafUB5kXtc9v6BToHZrgn
         wVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759220554; x=1759825354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtU1C0M8U0OTbHcI2E95ZD2Zrsmz5/OESKETD6NudSM=;
        b=w7sfMN5PK2kGGVaQXYZ1PQrMVk0SLkVFs4sNLMRrcRDcN/TiyHkECQDlxR8dieBpPS
         QJoEoVMlL0Ei5Ak/lBzyQIdkaAaBbgfnWISXADQx+xIUrLjriAxA45Rk1qhznWGt6wE+
         ZcV79pbOxKuspF1Jao3gK24qbSzQ/uZwqkaBFggs1kkUedKJkH1WwYoXOhl8ja+C6QaS
         rF2OSyQRZ3foOKgrQzZriVTzMlzjIxATo0SXSnYtKqxC9caRiHfAMwM6GFwgi4PY1qG0
         ZKmOyjmHtxXWNT07zZPdwBcV06h6YpOe4/dhFeDYZUANPdZ3N13Yb6DUmYnueNl34buw
         NUjg==
X-Forwarded-Encrypted: i=1; AJvYcCWQn7J6DUALMXcm6QD2Ik4ZDLbg4DqelREFSX0Qxo+3iqBCWT4FFaMINs18+mq7Khfn7MYOluyPlOk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvIEW1Ma5rylneO3MrGMwkDhoZgMRl/m+kzXUvyd80RvCmVt+p
	Odqt7cyFeCpIQH+bUi/Xn2SF5hV08UbYd4eKSIZLuxKw3ThELy9AbB5j1ubewXE8W1stb3eNacl
	4sFkgzExZDA==
X-Gm-Gg: ASbGncurI1V6BDtisA0J6nO+ZUC+Bj++zeIXBrH0/wK/el5V567M7sJKstd3CAivmhR
	xhD42bJDp4MTijAVB+FXXSrqEkzyp52n+ek4QnUsHQ76CO5qJblx+mzHUPqF9NCjxg9XsLegzyB
	lCg2mB0WcR45mOgu1As3xQ1YVAqCfm6DoUi3/UqQ/IOXvpAMlLtu8Ib3QhQ27ifwOJE8TGjC6Gp
	JDKYESC8xFx3jIgq8G/j39tLLkbotrXW3TSE7RQEhDFzb8fVWWjvZcRH0Cxm6sz49V3kJEFgwL7
	iGZcntjiDAY9s3eYTJcww0BTNB1FOwCPEAkP/ayDe4Gc8ESmD8pYatR3MaegypQXMCYM7yezhWq
	gCIHtLxYe9VRdEneFSnOC42Iu5QG4imihPWIdNrtcdrT8Ou8rd+75tGcWEypjbP6baBeLFC1yJs
	b3rTBB6QmIEIuU6HoDlPmQkDq2DvPZMgU=
X-Google-Smtp-Source: AGHT+IHFPJkofYr79h9pu+6ONde86qKMR3dCMR8GX+HG+gEgb0uWvZOFxlaIJxTQ7PTY8pGPvnTorQ==
X-Received: by 2002:a05:600c:81e:b0:46e:1a14:a81b with SMTP id 5b1f17b1804b1-46e32a1a396mr111982275e9.36.1759220554357;
        Tue, 30 Sep 2025 01:22:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	David Hildenbrand <david@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	kvm@vger.kernel.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	qemu-s390x@nongnu.org,
	Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Jason Herne <jjherne@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Eric Farman <farman@linux.ibm.com>
Subject: [PATCH v3 12/18] target/i386/nvmm: Inline cpu_physical_memory_rw() in nvmm_mem_callback
Date: Tue, 30 Sep 2025 10:21:19 +0200
Message-ID: <20250930082126.28618-13-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930082126.28618-1-philmd@linaro.org>
References: <20250930082126.28618-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/nvmm/nvmm-all.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index ed424251673..2e442baf4b7 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -15,6 +15,7 @@
 #include "accel/accel-ops.h"
 #include "system/nvmm.h"
 #include "system/cpus.h"
+#include "system/memory.h"
 #include "system/runstate.h"
 #include "qemu/main-loop.h"
 #include "qemu/error-report.h"
@@ -516,7 +517,9 @@ nvmm_io_callback(struct nvmm_io *io)
 static void
 nvmm_mem_callback(struct nvmm_mem *mem)
 {
-    cpu_physical_memory_rw(mem->gpa, mem->data, mem->size, mem->write);
+    /* TODO: Get CPUState via mem->vcpu? */
+    address_space_rw(&address_space_memory, mem->gpa, MEMTXATTRS_UNSPECIFIED,
+                     mem->data, mem->size, mem->write);
 
     /* Needed, otherwise infinite loop. */
     current_cpu->vcpu_dirty = false;
-- 
2.51.0


