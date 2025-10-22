Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA4BBFC5A7
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 16:02:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148168.1480360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZPc-0004gB-KL; Wed, 22 Oct 2025 14:02:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148168.1480360; Wed, 22 Oct 2025 14:02:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZPc-0004dX-GM; Wed, 22 Oct 2025 14:02:00 +0000
Received: by outflank-mailman (input) for mailman id 1148168;
 Wed, 22 Oct 2025 14:01:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vj3f=47=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vBZPb-0003XH-Cy
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 14:01:59 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac59f505-af4f-11f0-980a-7dc792cee155;
 Wed, 22 Oct 2025 16:01:57 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47117f92e32so46581545e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 07:01:57 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00ce586sm25929940f8f.49.2025.10.22.07.01.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Oct 2025 07:01:56 -0700 (PDT)
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
X-Inumbo-ID: ac59f505-af4f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761141717; x=1761746517; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UaZKulvsvyPazuPCESEO+VqOsAtzjlNqcxauSGwGk78=;
        b=l0cDCJmrtdbP8W2SOKaIeaZmoJPG4/MGO98r3PReYRBNXDeDQ1jH4vEh6kkecbpepB
         Ly2blq5SSaNGvNyasf2IlZPBZK6cmDSSebr5xr5KSmwCyebboziGqY6KswkAnttGSige
         RWCEWBzwtZlTvsmUVXD82dbQhRj0ajBYOpqMpZq9m4GbRklwmg4E4qZwC+z88Iyq6XQg
         GCrzrk7xfBb7J2I6QWmwKjuMiWaiX63r4P8rZ8vYQVD6KC9jxJqS3aHxVFW2V8ShuOrT
         Z0BDWAVR1u0oqMaornB8k527iv/F3KdbTFNaxWFiK3x76eVczlQusXIMcBXT13zJM13x
         +UfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761141717; x=1761746517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UaZKulvsvyPazuPCESEO+VqOsAtzjlNqcxauSGwGk78=;
        b=sAie50RQ35tp4O0xdD/XIOrw7ajOIehv6t45H3hufdSruX8K+8m/VO3yFhSiqlUDBj
         GlSSCvB/49qjAoNdg7E0EhHhT4qo3z+X8TznI/tbGi4NIySVttbyszCXviy6K/k6Nr1E
         eLCLXercnEcd5pNheXlfFK8mvv63ns6R0tzu2CJ5QbZ6x85Doba7f2MfspAkcI3zT5HW
         mkW2Ed1loMqFU5JsYvECljmZKWIvCvVEwIvVVRLovF+yg8OJZ7fa1djTbFTorwj0F3Uc
         xPG1dgArUN0dovuodBL473Nk5cGDJOWQOsCo/rQPsaQ2ls+lhpdNwr1pI2Yt5Hj+Tt/j
         OfQA==
X-Forwarded-Encrypted: i=1; AJvYcCUuu24Bu2aeTGbT92yI5DuJ45oV+GZYF0ITF5eiEk9fqca9KZfMCSyRkG6wub0LEW1mgc8SkBJaZL8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz400xq95lV45xfBpLF1zVvLhYS6q4Puxe/e5tHPAtw4i9FTL0N
	OYozPzxptmzUXx50ijdcZV0KUhJdGZ/AqEzi3I3Ecci/0x2k/l5tovF8UbVUK+oRJpg=
X-Gm-Gg: ASbGnctafoNBVEMS43chDM6UTP9G3tnOBJ5IreshvFZTzBZvLbvJtwyE5szTUQCcbM2
	lVKRl0HjIuN1NYN7jhQLPNOwJ1Skz8LpobesPk1Kg09CVHeY5XznZLX1/r4u4Vs6xMBt8szA1dQ
	uYZQj24/toAKfua8v9kKAvJHL1f4r2iZlKCHE80BqyxVp3L9MmxsE37mBbUSgw47gb7GmXrXDO6
	zUT8FguSXLSsXyf6onrLOApymWZ4XAukQA9B2rvQoWhd/OfXzqMxUtNqUz6dJwvX1n3iqdXYe5X
	Ug8nJ9NzzEMsYXQJjuSL1qvFOLFN3LneJPK7sSIWpXHNFm2s91XxCoabXJza5Y8iHmJmvO8Z2hV
	tKwOvsFFhkBLARi1GvcAyqrOt6EydcwUsNql3Yz4OPC5lcdIMrbi2Ik1wZNdFEiGiIQQcMDs5Uo
	572G1MOcZDs36gQrCwRcsnvwfaRlE9/pJnp6KYInQBJPU3tHk+JFm1iiKegmjY
X-Google-Smtp-Source: AGHT+IFjoAyFjm2+kFm7KY2q3aB2HGmRZNUqm25Wo0zJ7cEcAB/9ey5BsxA253c/AteFX/omR4r+QQ==
X-Received: by 2002:a05:600d:630a:b0:471:1b25:fa00 with SMTP id 5b1f17b1804b1-4711b25fd7cmr99064095e9.36.1761141717052;
        Wed, 22 Oct 2025 07:01:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anton Johansson <anjo@rev.ng>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/3] hw/xen: Build only once
Date: Wed, 22 Oct 2025 16:01:13 +0200
Message-ID: <20251022140114.72372-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022140114.72372-1-philmd@linaro.org>
References: <20251022140114.72372-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now than hw/xen/ files don't use any target-specific code,
we can build all file units once, removing the need for the
xen_specific_ss[] source set.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/xen/meson.build | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index a1850e76988..dcd2b7e1df3 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -7,21 +7,16 @@ system_ss.add(when: ['CONFIG_XEN_BUS'], if_true: files(
   'xen_pvdev.c',
 ))
 
-system_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
-  'xen-operations.c',
-),
-if_false: files(
-  'xen_stubs.c',
-))
-
-xen_specific_ss = ss.source_set()
-xen_specific_ss.add(files(
-  'xen-mapcache.c',
+xen_common_ss = ss.source_set()
+xen_common_ss.add(files(
   'xen-hvm-common.c',
+  'xen-mapcache.c',
+  'xen-operations.c',
   'xen-pvh-common.c',
 ))
+
 if have_xen_pci_passthrough
-  xen_specific_ss.add(files(
+  xen_common_ss.add(files(
     'xen-host-pci-device.c',
     'xen_pt.c',
     'xen_pt_config_init.c',
@@ -30,7 +25,8 @@ if have_xen_pci_passthrough
     'xen_pt_msi.c',
   ))
 else
-  xen_specific_ss.add(files('xen_pt_stub.c'))
+  xen_common_ss.add(files('xen_pt_stub.c'))
 endif
 
-specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
+system_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_common_ss)
+system_ss.add(when: ['CONFIG_XEN', xen], if_false: files('xen_stubs.c'))
-- 
2.51.0


