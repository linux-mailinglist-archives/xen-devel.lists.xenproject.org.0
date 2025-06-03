Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1D1ACC70B
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 14:52:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004348.1384082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMR7u-0004QQ-0Z; Tue, 03 Jun 2025 12:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004348.1384082; Tue, 03 Jun 2025 12:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMR7t-0004NS-TT; Tue, 03 Jun 2025 12:52:21 +0000
Received: by outflank-mailman (input) for mailman id 1004348;
 Tue, 03 Jun 2025 12:52:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pD2F=YS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uMR7r-0004NK-SM
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 12:52:19 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9540f2e4-4079-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 14:52:18 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-451d54214adso22204515e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 05:52:18 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe6ca46sm18586919f8f.31.2025.06.03.05.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 05:52:17 -0700 (PDT)
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
X-Inumbo-ID: 9540f2e4-4079-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748955138; x=1749559938; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EjLawBkFdZCmVWxeleotfU9HS3zYkrhDKjmwvUJc1RI=;
        b=Z54Zb7jo+ROHSaK/CPdecyHh9z8OCqh6AF4+uq+aJgdFYCZkjb0+xZJbEveiBz1CMy
         vPW2WudUWVJOYfbgDVUWNJlS538nEAwIoSYw47BUULaZEUKq8Ef6U26SJs/49dgWmOPM
         xINsw6prUNd9k2qUfWHE+SlZAaMu2T41aKv0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748955138; x=1749559938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EjLawBkFdZCmVWxeleotfU9HS3zYkrhDKjmwvUJc1RI=;
        b=oYNWI5NrJkv2ueZTyr1HQF/yi1u4aVrholxdq7nhEduO1xz7DkdhLCjVT3wTN1IU3y
         +6z0YGzSX9puw3gReoSOePJB2Mq1BTgnKfCHkYDxuj5z2gl8fW/qky5RG4zW22FR4zkR
         G5c4wsIxPEdCqqIsjUS9rxE0amU1TnsG1FY+AvtYiIy1OBe4XgGZOVZkBsUHCfZmexUQ
         jtBuljaUuobZBHbypjVkIXtzANb5J8Wj8hncE+c2MTWUInh2LCSNC9aHfIMzBxqtZ+Bm
         YqYR5KHPuEdwwJzWPY3BF7iV+p7BqzjbfoewcB+54R2+pM1h/O2YbINJPoIgpxy6TK83
         qz/A==
X-Gm-Message-State: AOJu0Yy+Er898lV7s0M5b9i0TF7qg17CnBz0CyVLdymoEqakNtSjNHWF
	KruKqaBeHJuimyMNNhOhcf4Q6exfiM8mz9Hdv4ATSF/EfFKENgPYBR3cLP9lCgErjFcRkMiIJ1C
	NrV+c
X-Gm-Gg: ASbGncvuFK16HcpFwns/kcy6hhIqdqEqKAieiZ7XiIadc8vU/lm4Ji9z9u4L7NjMcR+
	wijX/DRDLiYlj8IUoQVloX0yrlRqyuBOCytl/hgAc4iQm4p6bFvKiy3Q7/N0ZHWYnAxlmqLzUdZ
	NGZRdwXIgAak3EGHfkF1ivD4oNsbrXdW2kwpDSV+fd0XJ4FbZ51dAR1R12FL2UACmFY1vtskwGP
	X6CuDYQWrv59ovVGD+t18UICa19/lshvIkB1t14i5/gAUB0yu2Nni77YQIz0uBtxQIFClNPt2hy
	e3DwCcCAywX16ffFK3Fili39tOD5tIuCmw+ZmuDQqv18IlUA5BM87tA2RdNIh6DcI9pC2ECpKlg
	CUpUIQfMRqS7VcfxnYggzt0iZ
X-Google-Smtp-Source: AGHT+IFEms/kCWiCF0W/m/TTgfzKxA40SrJRUxWn9pZdxenYIibsBX2Yp5kC1Jib67+egtOccdmxHQ==
X-Received: by 2002:adf:f34a:0:b0:3a4:f8e9:cee0 with SMTP id ffacd0b85a97d-3a4f8e9cf5cmr10768484f8f.40.1748955138087;
        Tue, 03 Jun 2025 05:52:18 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/kernel: Move parse_params() back into __init
Date: Tue,  3 Jun 2025 13:52:15 +0100
Message-Id: <20250603125215.2716132-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's non-init caller was dropped in Xen 4.14

No functional change.

Fixes: 02e9a9cf2095 ("xen: remove XEN_SYSCTL_set_parameter support")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>

Found while reviewing the lockdown series, where an __init callee was added.

It appears that GCC has inlined it into it's single caller (which is __init),
and not emitted a non-__init form.
---
 xen/common/kernel.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 8b63ca55f14f..5be668ba855a 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -67,8 +67,9 @@ static int assign_integer_param(const struct kernel_param *param, uint64_t val)
     return 0;
 }
 
-static int parse_params(const char *cmdline, const struct kernel_param *start,
-                        const struct kernel_param *end)
+static int __init parse_params(
+    const char *cmdline, const struct kernel_param *start,
+    const struct kernel_param *end)
 {
     char opt[MAX_PARAM_SIZE], *optval, *optkey, *q;
     const char *p = cmdline, *key;

base-commit: 2c4a3d688943b2034756859844b8337a5a97ce07
-- 
2.39.5


