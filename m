Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 940A9ABBFDB
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 15:52:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989861.1373823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH0uw-0002Rf-KL; Mon, 19 May 2025 13:52:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989861.1373823; Mon, 19 May 2025 13:52:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH0uw-0002PM-Hj; Mon, 19 May 2025 13:52:34 +0000
Received: by outflank-mailman (input) for mailman id 989861;
 Mon, 19 May 2025 13:52:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Afj=YD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uH0uu-0002PG-T5
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 13:52:32 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81edd9b2-34b8-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 15:52:30 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so30478955e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 06:52:30 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3368fbasm210852615e9.2.2025.05.19.06.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 06:52:29 -0700 (PDT)
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
X-Inumbo-ID: 81edd9b2-34b8-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747662750; x=1748267550; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dzfe1YMWT6hqd8weaS8C4B1kY+AHXFbeCn3sBPzhl24=;
        b=rdjHa4p3fiJSB4z8PTiv9fIbn5Y2DsWhx6h4OnzaHlJ2T2k77cbmPYRIC/1fZjPwjz
         sqykPa85ztQrrtRL7R0Ii0KU6FI5kCngdF4ZgTk06IThDypiegdIBs3PD0RcwHgqWYtC
         AJ6s75NI/8TBmpX5L8k7zyjMQS3+DUTTIf+fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747662750; x=1748267550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dzfe1YMWT6hqd8weaS8C4B1kY+AHXFbeCn3sBPzhl24=;
        b=bKNTeFKQzwDw/kJW6HJnyomdyEOJgrXxH2VAtgx0I7YVmqxi731P5anDnjbrg4SUue
         OttKKvlyFM1RDwZsfEDyEXhSfdAhQKKW55rnrn7z5tRxKQrS4FCJzwo+1sn4Yqw7fHX8
         x+GXWbm+QIikl6yn6hY21tCduhWPp9nc4W1FehDRF3BFvPZ5DPUuQKHeGPgMsWPd1Q7x
         8c0XHRsfelTNZb8ZkeZZNRpsAjt+vqFN5figNhjq6kDoI864EvuC8MN+4COHZ5Lro36h
         oHqwwdOPTdMbHc8Yjyz/AzWUPTvLrI+tma7rqSY3XUbANRMgB0/aIUmQ08dzmoEzbF+I
         Myxg==
X-Gm-Message-State: AOJu0YxIVds1NE5Ns/foMKJ13OWjYh61+NXbSR4N78jnHQy7ZD1R/bka
	OS2exWFMyA50TQQPW+Y8BvQ6fZP9y6EgPrfIz6coJQ1eVGdsfUz8MlFbamSlOTh2OOqhdxvTelZ
	9QnWh
X-Gm-Gg: ASbGncupxZDG/+087DX0bHDflhkUrKHXoG+Izv+y4mQGjX586siFppPopzUoql7ukcZ
	3hV6vGM7+58sztpEmDprnyhsAw0ViQfDFVjkSOcqNgIMl7dU47k5/fu+qvW8ZETZPNAu4bzlcin
	KUDQLw3cmkEJC63yoxv1EMexx279MCu6XuMbOwRlpfk2sikHjzzPzBgR2NEkRWxtiWL+gmy2l0W
	C+AO+pzB64FS2c7BN0oaStsKKnY5JpT8HiR5d0P5ETBsiEAm/LaHXX+q79yvECLyYRKQ7C0b8pN
	N8KUB1VoYRt1TXtKNHyDDXy0ghQWcEyfJizOKiMKXlDINwoTANfx4SuGs1J/iWT59y1Wz2X040Q
	PdRzM/cUX/BK8Pb9vml+eie28
X-Google-Smtp-Source: AGHT+IFqofJNsQtla3niG2JXRd5+LaEevX72HkVxExEwNGO26miJsJlNGtosIf7EEBl1DjxiDwNHyQ==
X-Received: by 2002:a05:600c:3e0a:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-442fd5a2c09mr149640615e9.0.1747662750024;
        Mon, 19 May 2025 06:52:30 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen: Give compile.h header guards
Date: Mon, 19 May 2025 14:52:27 +0100
Message-Id: <20250519135227.27386-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/include/xen/compile.h.in | 3 +++
 xen/tools/process-banner.sed | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/xen/include/xen/compile.h.in b/xen/include/xen/compile.h.in
index 3151d1e7d1bf..9206341ba692 100644
--- a/xen/include/xen/compile.h.in
+++ b/xen/include/xen/compile.h.in
@@ -1,3 +1,6 @@
+#ifndef XEN_COMPILE_H
+#define XEN_COMPILE_H
+
 #define XEN_COMPILE_DATE	"@@date@@"
 #define XEN_COMPILE_TIME	"@@time@@"
 #define XEN_COMPILE_BY		"@@whoami@@"
diff --git a/xen/tools/process-banner.sed b/xen/tools/process-banner.sed
index 56c76558bcd9..4cf3f9a1163a 100755
--- a/xen/tools/process-banner.sed
+++ b/xen/tools/process-banner.sed
@@ -12,3 +12,8 @@ s_(.*)_"\1\\n"_
 
 # Trailing \ on all but the final line.
 $!s_$_ \\_
+
+# Append closing header guard
+$a\
+\
+#endif /* XEN_COMPILE_H */

base-commit: 6fc02ebdd053856221f37ba5306232ac1575332d
prerequisite-patch-id: 7bc1c498ba2c9c4a4939a56a0006f820f47f2a66
-- 
2.39.5


