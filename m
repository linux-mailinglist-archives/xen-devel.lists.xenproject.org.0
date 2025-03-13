Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEA3A5F9FB
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 16:32:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912506.1318755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskXu-0008A2-LQ; Thu, 13 Mar 2025 15:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912506.1318755; Thu, 13 Mar 2025 15:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskXu-00087m-IO; Thu, 13 Mar 2025 15:32:30 +0000
Received: by outflank-mailman (input) for mailman id 912506;
 Thu, 13 Mar 2025 15:32:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a3gq=WA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tskXt-0007tP-9d
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 15:32:29 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f55f0ef-0020-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 16:32:28 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5dc89df7eccso1813155a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 08:32:28 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5e8169b896csm843516a12.44.2025.03.13.08.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 08:32:27 -0700 (PDT)
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
X-Inumbo-ID: 5f55f0ef-0020-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741879948; x=1742484748; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vReGhqfBJ4uK8Q3JcoYxiqLwitDEZqAnuu3xoPEvPbI=;
        b=q9FMDkoJEYR/KqH60ERIN8GNpQ0E7yUidjn1jPAEPWu7FMI2HTgfm+4HIvmKj1+ZiB
         oSeLrppwgWQn+rQ2lM3uQzzrXBVVzbpy/yHcHsc9lI5nwERkaqJfGZKCFPzRiuHjbt4P
         QaP0P4GUsD17lQgmLQO028ceRCDYY8632AuyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741879948; x=1742484748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vReGhqfBJ4uK8Q3JcoYxiqLwitDEZqAnuu3xoPEvPbI=;
        b=ZZerKUHWne9/Tc80/N1D8lVke5Vo0/ExnUlbIIme5Sb8Yl3e1ZlmGciS7olUs41ipb
         AfySwLqEcS0d0wG7Ra+AAUtJCTxEj/iUYKMdXa4DP1QAfEzFIdCEb+XxJqK2Qf3jMegq
         NwlGro8j0qWZgIobkFeigVCwqlKSMDE/izlpPMn7WU9uCg96mcwXb7NPxImzAY6iWAyq
         ar9EYbYwQlfUx8nY2W8pIZzd8M5emOCOsarZwQanyi9fsVRPt4rJ1+dXL6IDtRwMVJOn
         n2AI64QXYkHHDjpU5MGOHS8InvL+T89wpeCFurfhKV7Mh2ZVdFGq+AdcubGPWRGAMyY2
         XlQg==
X-Gm-Message-State: AOJu0YxsQNRbUvA5SML+Pt2uyGI6zSH4/8HO9ebwqpCKxfWGcuUkwh+T
	JCUdbR7ssOdV1G5Pv1/gkir/u+nNORcf6UmmghJSTVzmANV+rpo6ehZkjBMsqUYe0WH/ERn/Lra
	5
X-Gm-Gg: ASbGncvDpm1Z7d8OxeDXRTDO8029hgvmi0XcM5yj1Ei4/dBDsmzhpRsojY/sSoNlGEG
	KNsm9q8mSkhoaQok2vETehpMJUzyVVJg0eEo4JAytSEkUSJHsiuNvAEXBKnmMNcE1VXy8vjEony
	RnS4xiLJG2iOSDS88eEGWTs3HZIh+v1c2OfpM+0MA6BoI8y7pG7ermKNfA5C+3DgQ0cIt5w4+kK
	FjNIDC+gFeSfEfJU66nyBlLAuKU0BVDdz+KxuMvdOIPW4Rhrmfy9hakZbmO1eA4msJw1+34iahq
	rS6p0U5PX+kpTjT4/U1YQhYk6My1rxPnz4uZsdOD6dK3kEa2Gg==
X-Google-Smtp-Source: AGHT+IFbfEhj6MgxTlKULwwo1Wwd0a5nmj7+MHvWMfzojnaK99p1HyYC4BL4AwHBleG+iqcEYcl8SA==
X-Received: by 2002:a05:6402:2550:b0:5e1:8604:9a2d with SMTP id 4fb4d7f45d1cf-5e5e229949amr31872827a12.4.1741879947944;
        Thu, 13 Mar 2025 08:32:27 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/7] xen/ubsan: provide helper for clang's -fsanitize=function
Date: Thu, 13 Mar 2025 16:30:23 +0100
Message-ID: <20250313153029.93347-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313153029.93347-1-roger.pau@citrix.com>
References: <20250313153029.93347-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

clang's -fsanitize=function relies on the presence of
__ubsan_handle_function_type_mismatch() to print the detection of indirect
calls of a function through a function pointer of the wrong type.

Implement the helper, inspired on the llvm ubsan lib implementation.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/ubsan/ubsan.c | 16 ++++++++++++++++
 xen/common/ubsan/ubsan.h |  5 +++++
 2 files changed, 21 insertions(+)

diff --git a/xen/common/ubsan/ubsan.c b/xen/common/ubsan/ubsan.c
index e99370322b44..7ebe4bfc14dc 100644
--- a/xen/common/ubsan/ubsan.c
+++ b/xen/common/ubsan/ubsan.c
@@ -546,3 +546,19 @@ void __ubsan_handle_invalid_builtin(struct invalid_builtin_data *data)
 
 	ubsan_epilogue(&flags);
 }
+
+void __ubsan_handle_function_type_mismatch(
+	struct function_type_mismatch_data *data, unsigned long val)
+{
+	unsigned long flags;
+
+	if (suppress_report(&data->location))
+		return;
+
+	ubsan_prologue(&data->location, &flags);
+
+	pr_err("call to function %ps through pointer to incorrect function type %s\n",
+		(void *)val, data->type->type_name);
+
+	ubsan_epilogue(&flags);
+}
diff --git a/xen/common/ubsan/ubsan.h b/xen/common/ubsan/ubsan.h
index 9c7f3b9b6c07..8987f9d45397 100644
--- a/xen/common/ubsan/ubsan.h
+++ b/xen/common/ubsan/ubsan.h
@@ -95,6 +95,11 @@ enum {
 	kind_clz,
 };
 
+struct function_type_mismatch_data {
+	struct source_location location;
+	struct type_descriptor *type;
+};
+
 #if defined(CONFIG_ARCH_SUPPORTS_INT128) && defined(__SIZEOF_INT128__)
 typedef __int128 s_max;
 typedef unsigned __int128 u_max;
-- 
2.48.1


