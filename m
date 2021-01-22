Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4692FF998
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 01:55:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72502.130594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2kja-0002lI-6L; Fri, 22 Jan 2021 00:55:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72502.130594; Fri, 22 Jan 2021 00:55:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2kja-0002kn-29; Fri, 22 Jan 2021 00:55:30 +0000
Received: by outflank-mailman (input) for mailman id 72502;
 Fri, 22 Jan 2021 00:55:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0NXE=GZ=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1l2kjY-0002iW-EH
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 00:55:28 +0000
Received: from mail-pj1-x1034.google.com (unknown [2607:f8b0:4864:20::1034])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91a7897d-4d6c-4799-bde9-812b3755a4b1;
 Fri, 22 Jan 2021 00:55:23 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id e6so2793533pjj.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jan 2021 16:55:23 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:4f00:c640:3cc1:5f60:de20:49b1])
 by smtp.gmail.com with ESMTPSA id j23sm6930632pgj.34.2021.01.21.16.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 16:55:22 -0800 (PST)
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
X-Inumbo-ID: 91a7897d-4d6c-4799-bde9-812b3755a4b1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IZpokacvZSMBoacIfrREFVSTHwQh54ys3EOhcT8aoCg=;
        b=kdzm+pQBhQC2HeKNWPzAb7gqPt/eRAb4XvlHxZe73weDzkRzFM7dfwRbgc/7okYp2n
         4zcYd7ut4NHAA+1kfd00OCXSTrsf6Gc7aye51pjLjpwy30qxkMttFrZ3ubVuOiXeJpLb
         LUhzrniExcadSUFRK7PbFsTVLzTxx6XgLFtinA3/NNyUWrBJYAucCZB20gXYw773CE/+
         KYT7B+lLo/0Trt8tRxDuv2ERmq5KdttpPIEnwndC2Ziaz6VhLixkU0p9Bamdp0HxNaEK
         /frnfCmS8in86meDGFFjXI/KNiALnrUzwSatggnnoAAvFREb7M248OyKUkJbdNsE4psb
         QF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IZpokacvZSMBoacIfrREFVSTHwQh54ys3EOhcT8aoCg=;
        b=JcsEtgXqHpx6X3esmBI3zjPcUJqXadec5kzEgtCcI+IutjrZIFwluYHm8O8+x9UifZ
         EPLn/+dYOaeXfGDJMzuyQ5JQoNoU5BCPROwgKKI4tMEdeBKe14diIvnRuNuH/LyGMt+2
         eVg/DsUvgvoZptzCwT0+Aqnf+s0If1P2WVALsvMP9lJbRR92Lq93BYPwaqCH3+hp8hJS
         +7WEhN0ja+PFFCcGhmMd+z14PQJnB5l+p5s9s3odm6nmY7eiXw6musrasYOj5Rhyw7bv
         wZECfKji6OuA53ljb6kc9FjcDCq+Xst+Qiwtd7SRcCGz6YiUp0dPJM1zjMQi4j8oGiB/
         CdNQ==
X-Gm-Message-State: AOAM531i51PkvuYgec22thYY36KNnTDp32rkL8+p8VZhWLqK8zwuOfIn
	VpB0XayMzWwUwG4xsp5wYQMNbqMuFbD7LLbg
X-Google-Smtp-Source: ABdhPJy2+Z8OadIClk+do//xWMXjt7MkHgU6fn3tblN97Y6hnvdJXRMbk5HWTytITHPpKLuG7o3c8w==
X-Received: by 2002:a17:90a:2ec7:: with SMTP id h7mr2342487pjs.200.1611276922799;
        Thu, 21 Jan 2021 16:55:22 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Daniel Kiper <daniel.kiper@oracle.com>,
	Bobby Eshleman <bobbyeshleman@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/5] xen: add XEN_BUILD_POSIX_TIME
Date: Thu, 21 Jan 2021 16:51:40 -0800
Message-Id: <e8c57268455291bad0bbcdf0013b0d5aa349be1b.1611273359.git.bobbyeshleman@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1611273359.git.bobbyeshleman@gmail.com>
References: <cover.1611273359.git.bobbyeshleman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Kiper <daniel.kiper@oracle.com>

POSIX time is required to fill the TimeDateStamp field
in the PE header.

Use SOURCE_DATE_EPOCH if available, otherwise use
`date +%s` (available on both Linux and FreeBSD).

Signed-off-by: Daniel Kiper <daniel.kiper@oracle.com>
Signed-off-by: Bobby Eshleman <bobbyeshleman@gmail.com>
---
 xen/Makefile                 | 2 ++
 xen/include/xen/compile.h.in | 1 +
 2 files changed, 3 insertions(+)

diff --git a/xen/Makefile b/xen/Makefile
index 544cc0995d..85f9b763a4 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -11,6 +11,7 @@ export XEN_DOMAIN	?= $(shell ([ -x /bin/dnsdomainname ] && /bin/dnsdomainname) |
 export XEN_BUILD_DATE	?= $(shell LC_ALL=C date)
 export XEN_BUILD_TIME	?= $(shell LC_ALL=C date +%T)
 export XEN_BUILD_HOST	?= $(shell hostname)
+export XEN_BUILD_POSIX_TIME	?= $(shell echo $${SOURCE_DATE_EPOCH:-$(shell date +%s)})
 
 # Best effort attempt to find a python interpreter, defaulting to Python 3 if
 # available.  Fall back to just `python` if `which` is nowhere to be found.
@@ -386,6 +387,7 @@ delete-unfresh-files:
 include/xen/compile.h: include/xen/compile.h.in .banner
 	@sed -e 's/@@date@@/$(XEN_BUILD_DATE)/g' \
 	    -e 's/@@time@@/$(XEN_BUILD_TIME)/g' \
+	    -e 's/@@posix_time@@/$(XEN_BUILD_POSIX_TIME)/g' \
 	    -e 's/@@whoami@@/$(XEN_WHOAMI)/g' \
 	    -e 's/@@domain@@/$(XEN_DOMAIN)/g' \
 	    -e 's/@@hostname@@/$(XEN_BUILD_HOST)/g' \
diff --git a/xen/include/xen/compile.h.in b/xen/include/xen/compile.h.in
index 440ecb25c1..b2ae6f96ad 100644
--- a/xen/include/xen/compile.h.in
+++ b/xen/include/xen/compile.h.in
@@ -1,5 +1,6 @@
 #define XEN_COMPILE_DATE	"@@date@@"
 #define XEN_COMPILE_TIME	"@@time@@"
+#define XEN_COMPILE_POSIX_TIME	@@posix_time@@
 #define XEN_COMPILE_BY		"@@whoami@@"
 #define XEN_COMPILE_DOMAIN	"@@domain@@"
 #define XEN_COMPILE_HOST	"@@hostname@@"
-- 
2.30.0


