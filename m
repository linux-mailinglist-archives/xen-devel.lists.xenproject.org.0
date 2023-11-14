Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E3C7EB2BD
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 15:47:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632655.986993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uh2-0005rF-00; Tue, 14 Nov 2023 14:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632655.986993; Tue, 14 Nov 2023 14:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uh1-0005o4-TK; Tue, 14 Nov 2023 14:47:07 +0000
Received: by outflank-mailman (input) for mailman id 632655;
 Tue, 14 Nov 2023 14:47:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2uZx-0003vI-FR
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 14:39:49 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a98a2ede-82fb-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 15:39:48 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-507bd19eac8so7632269e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 06:39:48 -0800 (PST)
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 l18-20020a50d6d2000000b00542db304680sm5268842edj.63.2023.11.14.06.39.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Nov 2023 06:39:48 -0800 (PST)
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
X-Inumbo-ID: a98a2ede-82fb-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972788; x=1700577588; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5X2FluBMHtEHwLVURbcbmArZUeMN34wqMB+9uG3SGg=;
        b=qqIB2ixtDwnE8Ljp1CRMJKiVKwfUu7C8qkWkxML06u2pAP5DLTuNbZgtCLaPOVCJnX
         9DxmxhykGfwE2znel8+OABw7XM+4NnvBOIZ+2GM8L4/o74RM6/y+3D2uGUAJ78MZ6YMe
         hmbXc0dIdBG8AS2Uqktus5uIZJPTjiHxcyia0DaritmtY+nC9aWqaX282oDvX7vEX7bc
         HHqIid1cH0P4ufCLraSVJkMPdWjOj5MeVPl0yCO+Jqq2oqv/kX5Di0UbC/pgT6Joc+T1
         kTzpda+pWUuyhm2l8QmJFc23TKKkMiD+diXNrrqzgNqK8LdIF6dUPhiyYcStssol2IZ3
         /Tlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972788; x=1700577588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x5X2FluBMHtEHwLVURbcbmArZUeMN34wqMB+9uG3SGg=;
        b=Uvbb8g9LiZSi5bjI4mLa3zoHzJSmkUiMiGEbF7mzPpilo22GAf8Q9UxvvOgsDwRyqc
         NO2EQe1oTz7vMSCdAzODUou7n5f81/MGljhdmE0r5krCwjmtZz/SWbQhNPoWri6jI72G
         8ynbEifGH6PPdTIB11GuFb9Bs2PHDKAz+pxoXxOG6zA2CvKHyJ47by1mxNARQmiUFh/v
         XZsO8e0vIfyZdzX0LvIBA/Vo5EHAkNiWwpl6UxxGamMx7Rt6DIfIAFFzIX0Xff1wYTzt
         GXkoaCjcyJ9288P63Vm2iW1SVp+qfaD4s/LRvhJmV2ZBJ/1Zrt5g3KbgN/Z+L5BNJ/Mk
         XWhw==
X-Gm-Message-State: AOJu0YzG+VMPXM9euQjl+KDXeyn41iyRN5r01zDWM+IAoH5G+7tVaiEG
	csQjZoBpcWQdNkMbzIg24KwV1Q==
X-Google-Smtp-Source: AGHT+IEJ1DzMQPrVK6vmcQ1s/BHFe+ZR138ty+E3IEfmXhpEvhlt8hMy3AYRKnboRNNE1Pe2RYsE2w==
X-Received: by 2002:a05:6512:b14:b0:509:8e3d:7cb0 with SMTP id w20-20020a0565120b1400b005098e3d7cb0mr9400030lfu.41.1699972788532;
        Tue, 14 Nov 2023 06:39:48 -0800 (PST)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-9.0 v2 13/19] hw/xen: Remove use of 'target_ulong' in handle_ioreq()
Date: Tue, 14 Nov 2023 15:38:09 +0100
Message-ID: <20231114143816.71079-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Per commit f17068c1c7 ("xen-hvm: reorganize xen-hvm and move common
function to xen-hvm-common"), handle_ioreq() is expected to be
target-agnostic. However it uses 'target_ulong', which is a target
specific definition.

Per xen/include/public/hvm/ioreq.h header:

  struct ioreq {
    uint64_t addr;          /* physical address */
    uint64_t data;          /* data (or paddr of data) */
    uint32_t count;         /* for rep prefixes */
    uint32_t size;          /* size in bytes */
    uint32_t vp_eport;      /* evtchn for notifications to/from device model */
    uint16_t _pad0;
    uint8_t state:4;
    uint8_t data_is_ptr:1;  /* if 1, data above is the guest paddr
                             * of the real data to use. */
    uint8_t dir:1;          /* 1=read, 0=write */
    uint8_t df:1;
    uint8_t _pad1:1;
    uint8_t type;           /* I/O type */
  };
  typedef struct ioreq ioreq_t;

If 'data' is not a pointer, it is a u64.

- In PIO / VMWARE_PORT modes, only 32-bit are used.

- In MMIO COPY mode, memory is accessed by chunks of 64-bit

- In PCI_CONFIG mode, access is u8 or u16 or u32.

- None of TIMEOFFSET / INVALIDATE use 'req'.

- Fallback is only used in x86 for VMWARE_PORT.

Masking the upper bits of 'data' to keep 'req->size' low bits
is irrelevant of the target word size. Remove the word size
check and always extract the relevant bits.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/xen/xen-hvm-common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index bb3cfb200c..fb81bd8fbc 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -1,5 +1,6 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "qemu/bitops.h"
 #include "qapi/error.h"
 #include "trace.h"
 
@@ -426,9 +427,8 @@ static void handle_ioreq(XenIOState *state, ioreq_t *req)
     trace_handle_ioreq(req, req->type, req->dir, req->df, req->data_is_ptr,
                        req->addr, req->data, req->count, req->size);
 
-    if (!req->data_is_ptr && (req->dir == IOREQ_WRITE) &&
-            (req->size < sizeof (target_ulong))) {
-        req->data &= ((target_ulong) 1 << (8 * req->size)) - 1;
+    if (!req->data_is_ptr && (req->dir == IOREQ_WRITE)) {
+        req->data = extract64(req->data, 0, BITS_PER_BYTE * req->size);
     }
 
     if (req->dir == IOREQ_WRITE)
-- 
2.41.0


