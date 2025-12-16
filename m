Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A979CC476F
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 17:56:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188149.1509451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYL3-0008NI-Uh; Tue, 16 Dec 2025 16:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188149.1509451; Tue, 16 Dec 2025 16:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYL3-0008JR-PN; Tue, 16 Dec 2025 16:55:53 +0000
Received: by outflank-mailman (input) for mailman id 1188149;
 Tue, 16 Dec 2025 16:55:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcum=6W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vVYL1-0006gk-N5
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 16:55:51 +0000
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [2a00:1450:4864:20::644])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 132753cb-daa0-11f0-9cce-f158ae23cfc8;
 Tue, 16 Dec 2025 17:55:50 +0100 (CET)
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-b7a72874af1so743009666b.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 08:55:50 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8003cb349csm63169766b.68.2025.12.16.08.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 08:55:48 -0800 (PST)
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
X-Inumbo-ID: 132753cb-daa0-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765904149; x=1766508949; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1NtInnSmemjufOwn8IQ7njKkF0r+OU4WznXSajv2QU=;
        b=STb3eOfONyZ9utOImDnnJwYb8JUWn7ae3G/PqVPXo2wF3xV8zvGd2FyA4O7CBxLxj6
         3FnXmuOI8i+0gsXo5c/CpbG4WGObvsNBtzzSqlSdVc50nIlyvxXIjuoBnYCX6HcMzUg2
         xkDP9R0mtWIzXaYTdKSV8691M+qrabRBYwqOPDvg0i74jJvTq8PPJOOJ9cyzmkhHOEZP
         wSbQRDwwZzAHpjH8BG2yIRpC3jarWi/z0fcu4BOfeRRD9YGg6VC3UUID/NtkVFs4Nayc
         k11boQ//Gg8GOvceDC9w74O4fPxJUeko9b5pGIWhVpINQ8CpsZ71KIMvUDyO3k3FZLdX
         mWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904149; x=1766508949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B1NtInnSmemjufOwn8IQ7njKkF0r+OU4WznXSajv2QU=;
        b=Vc0vqix0d77VfIIVrutsqQQbCwJBsYeLJKJFKMgWGAQEoQHfUdO0+omd4I+vuJGmaV
         3YsFiGQwpifnH/Gt6IBg1PpBdFmJcVbm4T+KaQgvnkoAMd/gUeHMmtwh5jXjUATmHshn
         KSOosH3TDj6DBDcoSb5VeX74T6vwBLwoV4G4kNvDiAyMmFELPwvGCOFkir83ObhVjX2x
         7NSkL981Ha3W1PYs1oT5Y/j2xw3jdv/OoBpmb+MZoROijXcSYq5WK50noSQey1CQffpU
         DutyyBP+7P0YBCyBFEOLz3gkS6H1aFw4IeGU4uPCMmE2Xq+LPRo90M684maWw2P2TrsI
         onOA==
X-Gm-Message-State: AOJu0YyA8NQ+R7VBFLsabRBMMT+wWCgdDHvU1Zf+0KYbOEkF6BSAKICD
	QqAzmlj8VWyEJEbp/C3olHBk5vc8eBGIXSsXtI0VejcJMVGen7J51Q4wt4kzziN2
X-Gm-Gg: AY/fxX6UUT0ZpoOHJv3xPz0rau6uERratywsHbkX/bRsfVdqKMTlsbA+C261Gs98zgT
	Xr1Eti8AWxsKDfDI3xg3xu/B/eZduDE5/7ny29otLjtu8ULdlaLz0hfhLyxjZt6yAgtVlPl7NjI
	e3BtgAwjdhncPhNxnob1uTUYRFSo0Mg57Nvkcbi+6n13Uv7gQ8AXcln1K9NiQPEQlRtWYX1QYCx
	Tnhd5iidLtvDIt08ElzCaz5kwDLAL/jUCCa2jp0i1ZAZjfvjjFQoBx4H5ZqrprAe3lqw8ZzsCAr
	GmTR+RAvcpemjPm5h9dNTY9Is4idjc+MESZWW+wvPQWFYAZY/q54k5dngwDmhMEQfQjfA+dfOnM
	zfISNVI5WKKxP6ECcMQRawQ7Io//Sq40l+DwnStMQ1IKDUq5OmmHXuHBIM4IQaMjZIfPtgt/lpU
	GdCauHIIoT48X/oPnh4HaXsq53Vzv3OnLeLTxliQ1Ug91uqIQl9ha+vX0=
X-Google-Smtp-Source: AGHT+IEebl/uN93l3L7SaSUYfEwV1Wm0D68eh2OksLfQj13yfomYfNaQKRAXmPTW7KCYWi9V/lwdUA==
X-Received: by 2002:a17:906:c110:b0:b72:77c7:d8ad with SMTP id a640c23a62f3a-b7d238cefa7mr1488125566b.35.1765904148847;
        Tue, 16 Dec 2025 08:55:48 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 07/19] xen/riscv: add new p2m types and helper macros for type classification
Date: Tue, 16 Dec 2025 17:55:17 +0100
Message-ID: <8eb13555fc18830a879f00f4882980898b26d94e.1765879052.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765879052.git.oleksii.kurochko@gmail.com>
References: <cover.1765879052.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- Extended p2m_type_t with additional types: p2m_mmio_direct,
  p2m_ext_storage.
- Added macros to classify memory types: P2M_RAM_TYPES.
- Introduced helper predicates: p2m_is_ram(), p2m_is_any_ram().
- Introduce arch_dt_passthrough() to tell handle_passthrough_prop()
  from common code how to map device memory.
- Introduce p2m_first_external for detection for relational operations
  with p2m type which is stored outside P2M's PTE bits.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5-V7:
 - Nothing changed. Only Rebase.
---
Changes in V4:
 - Drop underscores for argumets of p2m_is_ram() and p2m_is_any_ram().
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in V4:
 - Drop underscode in p2m_to_mask()'s argument and for other similar helpers.
 - Introduce arch_dt_passthrough_p2m_type() instead of p2m_mmio_direct.
 - Drop for the moment grant tables related stuff as it isn't going to be used in the nearest future.
---
Changes in V3:
 - Drop p2m_ram_ro.
 - Rename p2m_mmio_direct_dev to p2m_mmio_direct_io to make it more RISC-V specicific.
 - s/p2m_mmio_direct_dev/p2m_mmio_direct_io.
---
Changes in V2:
 - Drop stuff connected to foreign mapping as it isn't necessary for RISC-V
   right now.
---
 xen/arch/riscv/include/asm/p2m.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index c9aa19ad43..1c89838408 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -70,8 +70,29 @@ struct p2m_domain {
 typedef enum {
     p2m_invalid = 0,    /* Nothing mapped here */
     p2m_ram_rw,         /* Normal read/write domain RAM */
+    p2m_mmio_direct_io, /* Read/write mapping of genuine Device MMIO area,
+                           PTE_PBMT_IO will be used for such mappings */
+    p2m_ext_storage,    /* Following types'll be stored outsude PTE bits: */
+
+    /* Sentinel — not a real type, just a marker for comparison */
+    p2m_first_external = p2m_ext_storage,
 } p2m_type_t;
 
+static inline p2m_type_t arch_dt_passthrough_p2m_type(void)
+{
+    return p2m_mmio_direct_io;
+}
+
+/* We use bitmaps and mask to handle groups of types */
+#define p2m_to_mask(t) BIT(t, UL)
+
+/* RAM types, which map to real machine frames */
+#define P2M_RAM_TYPES (p2m_to_mask(p2m_ram_rw))
+
+/* Useful predicates */
+#define p2m_is_ram(t) (p2m_to_mask(t) & P2M_RAM_TYPES)
+#define p2m_is_any_ram(t) (p2m_to_mask(t) & P2M_RAM_TYPES)
+
 #include <xen/p2m-common.h>
 
 static inline int get_page_and_type(struct page_info *page,
-- 
2.52.0


