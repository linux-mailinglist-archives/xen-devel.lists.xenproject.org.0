Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D41D30835E
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 02:49:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77577.140596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Iua-0004na-HV; Fri, 29 Jan 2021 01:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77577.140596; Fri, 29 Jan 2021 01:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Iua-0004n2-De; Fri, 29 Jan 2021 01:49:24 +0000
Received: by outflank-mailman (input) for mailman id 77577;
 Fri, 29 Jan 2021 01:49:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5IuY-0004da-Jn
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 01:49:22 +0000
Received: from mail-lf1-x132.google.com (unknown [2a00:1450:4864:20::132])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6dfd42f1-888e-440e-baad-0e73b78c4b04;
 Fri, 29 Jan 2021 01:49:08 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id u25so10287779lfc.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 17:49:08 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z128sm1840238lfa.72.2021.01.28.17.49.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Jan 2021 17:49:06 -0800 (PST)
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
X-Inumbo-ID: 6dfd42f1-888e-440e-baad-0e73b78c4b04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kdMuni2EH6DuFbXuV8A3zz5QqpHjmzDHkoSJZD+NLoI=;
        b=rfpoqwJP1gGZW07VlK3dNlgVHlmD5pYKE5+ugMcl+kqT/DDIkUmBQUnIQ94bqjyAtw
         RD8CiTl4i2/AlT2if/ZvT4wclRyQKzmhF7PChhCJ9l0J9Is/1rlEERFydldkC3+FFFwb
         X035jgaIa5Pq36CjC30Ru24AnPqi4GYHHEYAH+eQpoaEFA1CxQXv1lbpgo9miJ+KEmYy
         mj2ZJL1UZGynYn07h3PbnXLj8y1reKi9Bx56SjUOarGhAX+DbXduzTipObKaoDe5dhb3
         DDU8W093IdtLpm8A1Mx+RaEsRYAM8k/HuTkvyLRYWF9VFYaYavMykuOMf471yj/bpF8x
         4mgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kdMuni2EH6DuFbXuV8A3zz5QqpHjmzDHkoSJZD+NLoI=;
        b=PGHz2WwwWbN5v51bYOrJuHTH4wO1XwK7Q3RvmePlf6RzGNBJ5bNwbBauH17RuvO5/5
         zu42M03YzUyBc1xTCVFkFPbmsf3xfjckg5ksPx7fPY2+i6z+B/Z3iJ0LtILRE+3e/7Jk
         AhrcmsOAUq7Eyxf45wM38m9Z0XeKhqlqzambVeB/9sJg7V4CnnwFDwmyQBDr6rRCDFJr
         DjQnPKhp/EDPFq28Wnz1GVlV+jvAgZSoRSgQaRcNEysNRnDykPLVdVEzA7it/FTWQUYG
         K3SFXNvrdab7rdqjRPbIvCBkAEhm/BCJ8Ajw/3yNNeF5z0BTAIOLwWiZUrfaXmtvoSN9
         tUeg==
X-Gm-Message-State: AOAM532LOyljcBhIKEqrQTFqDszjJ4WxSzzk9GrGpyGFuaNt/ZRDJuNW
	yfS4mU7Z8L0O1YbXCR3084C68kiIwVTGhQ==
X-Google-Smtp-Source: ABdhPJyVMcX9CNxT0MTbCM3BdCanvpoqDilYF1nesxeH+UWBohvKwgYCq2/p0P0cCyZh4d0WbAG77w==
X-Received: by 2002:a05:6512:3182:: with SMTP id i2mr881568lfe.553.1611884947283;
        Thu, 28 Jan 2021 17:49:07 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V6 03/24] x86/ioreq: Provide out-of-line wrapper for the handle_mmio()
Date: Fri, 29 Jan 2021 03:48:31 +0200
Message-Id: <1611884932-1851-4-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The IOREQ is about to be common feature and Arm will have its own
implementation.

But the name of the function is pretty generic and can be confusing
on Arm (we already have a try_handle_mmio()).

In order not to rename the function (which is used for a varying
set of purposes on x86) globally and get non-confusing variant on Arm
provide a wrapper arch_ioreq_complete_mmio() to be used on common
and Arm code.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Paul Durrant <paul@xen.org>
CC: Julien Grall <julien.grall@arm.com>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - new patch

Changes V1 -> V2:
   - remove "handle"
   - add Jan's A-b

Changes V2 -> V3:
   - remove Jan's A-b
   - update patch subject/description
   - use out-of-line function instead of #define
   - put earlier in the series to avoid breakage

Changes V3 -> V4:
   - add Jan's R-b
   - rename ioreq_complete_mmio() to arch_ioreq_complete_mmio()

Changes V4 -> V5:
   - rebase
   - add Alex's, Julien's and Paul's R-b

Changes V5 -> V6:
   - no changes
---
---
 xen/arch/x86/hvm/ioreq.c | 7 ++++++-
 xen/include/xen/ioreq.h  | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 27a4a6f..30e8724 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -36,6 +36,11 @@
 #include <public/hvm/ioreq.h>
 #include <public/hvm/params.h>
 
+bool arch_ioreq_complete_mmio(void)
+{
+    return handle_mmio();
+}
+
 static void set_ioreq_server(struct domain *d, unsigned int id,
                              struct hvm_ioreq_server *s)
 {
@@ -226,7 +231,7 @@ bool handle_hvm_io_completion(struct vcpu *v)
         break;
 
     case HVMIO_mmio_completion:
-        return handle_mmio();
+        return arch_ioreq_complete_mmio();
 
     case HVMIO_pio_completion:
         return handle_pio(vio->io_req.addr, vio->io_req.size,
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index d0980c5..b95d3ef 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -24,6 +24,7 @@
 #define HANDLE_BUFIOREQ(s) \
     ((s)->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF)
 
+bool arch_ioreq_complete_mmio(void);
 bool arch_vcpu_ioreq_completion(enum hvm_io_completion io_completion);
 int arch_ioreq_server_map_pages(struct hvm_ioreq_server *s);
 void arch_ioreq_server_unmap_pages(struct hvm_ioreq_server *s);
-- 
2.7.4


