Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAB87E7DD2
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:31:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630621.983744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPW-0000OC-BX; Fri, 10 Nov 2023 16:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630621.983744; Fri, 10 Nov 2023 16:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPV-0000G6-8J; Fri, 10 Nov 2023 16:31:09 +0000
Received: by outflank-mailman (input) for mailman id 630621;
 Fri, 10 Nov 2023 16:31:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zww5=GX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r1UPS-0005EV-MI
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:31:06 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bd95cdd-7fe6-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 17:31:06 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5401bab7525so3843209a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Nov 2023 08:31:06 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 lv19-20020a170906bc9300b009a9fbeb15f5sm4128966ejb.46.2023.11.10.08.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 08:31:04 -0800 (PST)
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
X-Inumbo-ID: 8bd95cdd-7fe6-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699633865; x=1700238665; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siHHtAM9D25u5Lx3r2aGylXTGpuJBmD1qXgq5At793w=;
        b=hSpcQUP646q94PaHhMcvP4ZWBZ+wHbKtDA7LittE/K1EnBJ4PJK51AfvU5HZTKSHMI
         wJdneIe74mdlWdK87aJke7tmcZM5RekoupbMqtl0sDiRJJyBNBEjj9BTtl31RBVzKrVr
         pyBp3Eg4sNVdR1PAQMJbrkhNBbsM19NsYtR+vhm5XXpb4icyJrYToSoifOneBpWC0hNm
         UgA+ERhDGe4dK56rk7LuzVJMVySj8U1KudJqkQr9bxZKtn7gnEnKLl4sIbRZLyYtA5am
         tmTDk+LoLExZjTbyzs0AS7+dA7/btN/aZWZ50S21eZCpLcNI9VZgksf1E5r1BuSJFp3f
         zOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699633865; x=1700238665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siHHtAM9D25u5Lx3r2aGylXTGpuJBmD1qXgq5At793w=;
        b=Ms1+SJ9JFOeP2ZLgRqdAyncKWP9VHtzinDN+2BxGiPeV2GCrEeAV1ei6caF0tQ947t
         pCN06u5//hjGmapGXByrb0uzIbjvpS+42qQEuhd3qNB2QdPWElIDNCDsl5u0qQewmctc
         jUCe1ZW3i8QEM8xyru2qXQMcAKahgGbeHidJBEpnmBMeoMASeAej2WVs6w7H2FA8jCc3
         yDLcubn7yLCbq+twoXT+VnWGcjQF4RhRmXUryTm6y+WiSTv5K/t7dyYqAcYdO9y3ogXn
         1pKFTcQq9t3CLanpq0eq18lIqLFEoyt5M9omvW/FxA8PCjDuT4nDd3/7oMMCWdwWUtGq
         mLFg==
X-Gm-Message-State: AOJu0YwCQv1hUIaDX0UD+KQFfY4UgcsKNd0eSl211xeuNNcl2rpGNd5/
	kT3mmxvlM9RjHFR4EllAPrLnRXNrWFs=
X-Google-Smtp-Source: AGHT+IEyKH4OPM5ndJj6Azvb+INQ2RUwGFcF+FRStm1C6DrBmn27AFzibzz9tZ8lsd7/S3Rta4kDHw==
X-Received: by 2002:a17:907:1b24:b0:9ae:5765:c134 with SMTP id mp36-20020a1709071b2400b009ae5765c134mr7451255ejc.15.1699633865385;
        Fri, 10 Nov 2023 08:31:05 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 14/15] xen/asm-generic: introduce stub header numa.h
Date: Fri, 10 Nov 2023 18:30:40 +0200
Message-ID: <1b50e70d168a1b084ac40711096c38abe44a7b9d.1699633310.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699633310.git.oleksii.kurochko@gmail.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<asm/numa.h> is common through some archs so it is moved
to asm-generic.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
	- update the commit message.
	- change u8 to uint8_t.
	- add ifnded CONFIG_NUMA.
---
 xen/include/asm-generic/numa.h | 40 ++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 xen/include/asm-generic/numa.h

diff --git a/xen/include/asm-generic/numa.h b/xen/include/asm-generic/numa.h
new file mode 100644
index 0000000000..353642c353
--- /dev/null
+++ b/xen/include/asm-generic/numa.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ARCH_GENERIC_NUMA_H
+#define __ARCH_GENERIC_NUMA_H
+
+#include <xen/types.h>
+#include <xen/mm.h>
+
+typedef uint8_t nodeid_t;
+
+#ifndef CONFIG_NUMA
+
+/* Fake one node for now. See also node_online_map. */
+#define cpu_to_node(cpu) 0
+#define node_to_cpumask(node)   (cpu_online_map)
+
+/*
+ * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
+ * is required because the dummy helpers are using it.
+ */
+extern mfn_t first_valid_mfn;
+
+/* XXX: implement NUMA support */
+#define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
+#define node_start_pfn(nid) (mfn_x(first_valid_mfn))
+#define __node_distance(a, b) (20)
+
+#endif
+
+#define arch_want_default_dmazone() (false)
+
+#endif /* __ARCH_GENERIC_NUMA_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.41.0


