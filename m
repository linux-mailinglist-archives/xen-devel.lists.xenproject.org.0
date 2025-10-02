Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 934AEBB347F
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 10:46:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135454.1472581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Ewu-0003qp-GW; Thu, 02 Oct 2025 08:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135454.1472581; Thu, 02 Oct 2025 08:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Ewu-0003pg-Bt; Thu, 02 Oct 2025 08:46:04 +0000
Received: by outflank-mailman (input) for mailman id 1135454;
 Thu, 02 Oct 2025 08:46:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9sj0=4L=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v4Etz-000821-PU
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 08:43:03 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cefd1e0c-9f6b-11f0-9d14-b5c5bf9af7f9;
 Thu, 02 Oct 2025 10:43:03 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46e52279279so5093965e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Oct 2025 01:43:03 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e6917a867sm24739885e9.5.2025.10.02.01.43.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Oct 2025 01:43:02 -0700 (PDT)
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
X-Inumbo-ID: cefd1e0c-9f6b-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759394583; x=1759999383; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5PC+1TlVBTyXto+jnsJwdDvPaPiKj+lxKbw9om1DB0=;
        b=jz5N1WPDiGbFME8JQMxtd2I77nmvjkr/oqjWLSLgQ1YekzcpQlLb0DvbV99Ld4D5Bu
         /DPUHD+hSpamcRXia7xVMr14dBzpWfMcvXCkgD/Gs8uSK/ibhVM1HXB+zcJDVSV1ECdm
         cd6m7eXZjVmNr+FhHLMmcSstH7IytuOrk/MYILo0foV8tS0d/bhk4etoBnFLwQCzy/nz
         iMq7xJcUamRJ3bH8+i/KUG0sU0eEWIsds9DY1HMlqUb6AvbP88uuq2hBz//mbn/uWQWZ
         mYl6l8WH1y8fT5sBBIetkOsNO6Ioporlua4zaJ4usCF8gJyeT9CSQqpyV4XwLOPDKTNC
         iHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759394583; x=1759999383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5PC+1TlVBTyXto+jnsJwdDvPaPiKj+lxKbw9om1DB0=;
        b=gPSbsCHdCpi0ahttScvawWWkfoDvbVJTAB540PzMoQOfwvauePOlFkIGMXbfKYTfG6
         A/ZV7hK6HB5OlGN7GcskMR6v9tQjh6B22nSy9oFk8Dp242jLN176WUyyDRT7AjRy5eRI
         ja1rygZYaB6XFGbzB15cDviGyiHRK3U+gigHl/APw/dhGxc5YdftAH344wATwviWoah0
         wNRBFIMSA5hFXofxz6JW8Nb7lMxifyl2/B7quHmVKTFUPCWwXBcBZw7Ra5w0QoIuDwQ9
         ObtILZ59mb3hMSZJrpESjtR5fEV8vQyeBzfn2outs3rV8ZT0EXCTzkvw6IMgiqjQrULI
         0ETA==
X-Forwarded-Encrypted: i=1; AJvYcCV1i72080Dd46x3XQjils3a8ZITxupffGJXpjuHhc5sNW/FJe/MrEImx388w3iNgO3/9H3aST0Ctz0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwH59UPIsFcsR9om2LfYbxwAy/SHbmDLw+CpH2FwznPA2OMx3ih
	D4L2jkUpGbF9paY5pcSqJjG2fylarn6CLHsV9dAP2wrkgDxRg0SNzZha6SrTNo0q8Is=
X-Gm-Gg: ASbGnctot1dmmy09Knq4jSfudTR7AtvRG+NQP7ooLz3fVorIE4AbC6r5A96rbO9sDWN
	TgElJkpNIFcbAiner67CqV9sR8Mt8dfAYbs1mz/O8vK0Qbr2u29cij1veAojIQmeFhrmcDVMOpt
	vXP8TUX7A9Hrw5HNzW2CGc7SldV2RiIWkywulSYa0Q+lFcUlv3Q/leRdKc2FbFqfoBZBrmIjDjC
	IUseUHmra6wTcmnWvkR5lqBvGbHU3JNBVW231JId8MCqCCtMfuX5okpMK7K+i8Dm9g0f5L1cwyV
	UgsA6I5pkU01HcCiM7Aji8aDC2d65XTDyQsP17GK3ld+/Aeppi72V1zHzRxNYXInqmcu2p58E6J
	P/Bv9au881HH3tbrI9KPuN58ZmeZUBjR2Jt+rgH8kd0OQMkSsJPjxVOtbVIURny8lbhDp0hHj50
	yep1s+W28wSyB9oIq2Z18AMPvYUukN4A==
X-Google-Smtp-Source: AGHT+IG8Ma/4I60woYQn+sfaatxOnQXHwssxQgt8liAn1/sRa9HXbIzN6+J2l9ZCi0NeEjgUws6OFQ==
X-Received: by 2002:a05:600c:8119:b0:46e:4883:27d with SMTP id 5b1f17b1804b1-46e6128617amr48211715e9.30.1759394582729;
        Thu, 02 Oct 2025 01:43:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v4 12/17] hw/xen/hvm: Inline cpu_physical_memory_rw() in rw_phys_req_item()
Date: Thu,  2 Oct 2025 10:41:57 +0200
Message-ID: <20251002084203.63899-13-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002084203.63899-1-philmd@linaro.org>
References: <20251002084203.63899-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cpu_physical_memory_rw() is legacy, replace by address_space_rw().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/xen/xen-hvm-common.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 78e0bc8f644..52e2cce397a 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -12,6 +12,7 @@
 #include "hw/xen/xen-bus.h"
 #include "hw/boards.h"
 #include "hw/xen/arch_hvm.h"
+#include "system/memory.h"
 #include "system/runstate.h"
 #include "system/system.h"
 #include "system/xen.h"
@@ -279,8 +280,8 @@ static void do_outp(uint32_t addr,
  * memory, as part of the implementation of an ioreq.
  *
  * Equivalent to
- *   cpu_physical_memory_rw(addr + (req->df ? -1 : +1) * req->size * i,
- *                          val, req->size, 0/1)
+ *   address_space_rw(as, addr + (req->df ? -1 : +1) * req->size * i,
+ *                    attrs, val, req->size, 0/1)
  * except without the integer overflow problems.
  */
 static void rw_phys_req_item(hwaddr addr,
@@ -295,7 +296,8 @@ static void rw_phys_req_item(hwaddr addr,
     } else {
         addr += offset;
     }
-    cpu_physical_memory_rw(addr, val, req->size, rw);
+    address_space_rw(&address_space_memory, addr, MEMTXATTRS_UNSPECIFIED,
+                     val, req->size, rw);
 }
 
 static inline void read_phys_req_item(hwaddr addr,
-- 
2.51.0


