Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E1F9D5C08
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 10:34:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841794.1257308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEQ3V-0003wW-1N; Fri, 22 Nov 2024 09:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841794.1257308; Fri, 22 Nov 2024 09:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEQ3U-0003uP-Oh; Fri, 22 Nov 2024 09:34:24 +0000
Received: by outflank-mailman (input) for mailman id 841794;
 Fri, 22 Nov 2024 09:34:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o6Qa=SR=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tEQ3T-0003Ql-7W
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 09:34:23 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2a44511-a8b4-11ef-a0cc-8be0dac302b0;
 Fri, 22 Nov 2024 10:34:19 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43167ff0f91so16514805e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Nov 2024 01:34:19 -0800 (PST)
Received: from localhost.localdomain ([87.115.149.99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433cde16abasm21427775e9.19.2024.11.22.01.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 01:34:18 -0800 (PST)
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
X-Inumbo-ID: f2a44511-a8b4-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzQiLCJoZWxvIjoibWFpbC13bTEteDMzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImYyYTQ0NTExLWE4YjQtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMjY4MDU5LjIyMzU0OCwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1732268058; x=1732872858; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2manZp1AIdPBh7iI0RBUSq4id6SrxSe85LAkzhSm0W8=;
        b=XOI1klEeYh4Ya34UH/Ooh2fkq+ZFq682EaW1u4SC9LeyFv6hHtjtIapeAdMMaHrLmH
         UJYUCFbmzdumvMFjULcEOa2oqHqQdxCrHxLOyR18SzpSqZeQnfN8YfM6MEV+IwDjTY0q
         B9Xoig8R97go2H9lcZihh2admbXX6JK5OInPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732268058; x=1732872858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2manZp1AIdPBh7iI0RBUSq4id6SrxSe85LAkzhSm0W8=;
        b=GSmIRxw5rbFxPAqMyByMVHaODaJMNeRWnwZJ49iteUfQWSTfEICDJi2NtsPDvM2QPz
         yrHK104kj5jveqnhJ/pTkbLH/Gqndyd7QQMbeDBwYa6pc8BMW0Xz3Zdk5T+JrA+m2dRg
         awlU4Aqx6pyu7A3D0chTGTZF1vMiAW/iQUBCl0qPdgWD+XBdySWzd6wQealX+QyXOuIF
         1vp9fgJhILm/15W5beXfYYg7nD879Ufs3Lm51NumN/uyPlyE7n5iQBKVLHtVLg6T0mAV
         gsA/YZNDQo1rPjKbvSZYfa8i3HaQ+uHw/iazU9FynitLzmDdMJhKblXsha4gjZyCs29M
         coZw==
X-Gm-Message-State: AOJu0YykPvZJEeGSGUnyxG5bjMRpJH1RgZ8NzrosuxPRN8LsSCIUK8VJ
	j3zg7eJOdRcx1T7jmp/jAEpHPKKJ6iLqIUbrgBxa/mmz9Jg6eIyhHxU5lw8rtIag3GBirdT+Is7
	L8Ic=
X-Gm-Gg: ASbGncuFkW9G9U7uBYU/2jfniDdrr7cbnIuhJ6CizjH+nsljnMhRESjUqebsmJKBDJI
	6+wD88b70uKV09cwxHowATRvtKr+S3vcysA5/kiup169noYcURPf3EbTNJsAEw1nk9ivenT1KsW
	BCrfFB1jEpkIQ7sxwWmFbF70TadfbavS4FJ4G97bAPPj7Ivcb5KjVIlm33Gg4Wk1NfJ6ifm5ZTi
	G9h9WNYYlCcIt5SGw7e0IVQP8uyU/lL68MqwESmkHTcJyQnGHclBIDymco/zacxc6DpvQ==
X-Google-Smtp-Source: AGHT+IFodxhFSGMz2wPZzJH0OfLJPHqvn9QSN/CUVAgp9yNsRWl2t3/+UqXtcApCXoDULXHfzVqjrg==
X-Received: by 2002:a05:600c:4507:b0:42c:b5f1:44ff with SMTP id 5b1f17b1804b1-433ce48f8c5mr16629935e9.24.1732268058468;
        Fri, 22 Nov 2024 01:34:18 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 2/4] x86/boot: Use header to allows inclusion of public xen.h header
Date: Fri, 22 Nov 2024 09:33:56 +0000
Message-Id: <20241122093358.478774-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122093358.478774-1-frediano.ziglio@cloud.com>
References: <20241122093358.478774-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows to include other headers and avoid duplicated declarations.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/include/boot/public/xen.h | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 xen/arch/x86/include/boot/public/xen.h

diff --git a/xen/arch/x86/include/boot/public/xen.h b/xen/arch/x86/include/boot/public/xen.h
new file mode 100644
index 0000000000..399b86b5e5
--- /dev/null
+++ b/xen/arch/x86/include/boot/public/xen.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/* This header allows the inclusion of public xen.h */
+
+#ifndef BOOT__PUBLIC__XEN_H
+#define BOOT__PUBLIC__XEN_H
+
+#if !defined(__XEN__) || defined(__XEN_TOOLS__) || __XEN__ != 1
+#error Unexpected defines
+#endif
+
+#include <xen/types.h>
+
+#ifdef __i386__
+
+# define __XEN_TOOLS__ 1
+# undef __XEN__
+# include <public/arch-x86/xen.h>
+# define __XEN__ 1
+# undef __XEN_TOOLS__
+
+#else
+
+# include <public/arch-x86/xen.h>
+
+#endif
+
+#endif /* BOOT__PUBLIC__XEN_H */
-- 
2.34.1


