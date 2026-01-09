Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3030BD0A558
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 14:16:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198752.1515587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veCME-00068e-Ur; Fri, 09 Jan 2026 13:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198752.1515587; Fri, 09 Jan 2026 13:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veCME-00065K-RW; Fri, 09 Jan 2026 13:16:50 +0000
Received: by outflank-mailman (input) for mailman id 1198752;
 Fri, 09 Jan 2026 13:16:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfgE=7O=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1veCMD-00064g-2E
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 13:16:49 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72d3c20c-ed5d-11f0-b15e-2bf370ae4941;
 Fri, 09 Jan 2026 14:16:46 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-430f9ffd4e8so1460918f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Jan 2026 05:16:46 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dacdcsm22423033f8f.1.2026.01.09.05.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 05:16:45 -0800 (PST)
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
X-Inumbo-ID: 72d3c20c-ed5d-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1767964605; x=1768569405; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5VfkchlJ/9TrBejggw+pB6naFdzYvQ/o4hvcC4styY0=;
        b=H4theXJjxuwEqTgBtuZMlKlhHlT1v8+0IsioPuG7Bvf3GU7y24y5sx5szCUP0s7OwC
         ZqgP/KEATzSihA2wDNYQlqkI15bjFCehBDmDd+3mAqnHcpaKM3Z7i6tb0NgL3ygr4Ty5
         iO/kTldmvYSILGPQ2YeBk8cNgZYfEv8+Gi0ro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767964605; x=1768569405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VfkchlJ/9TrBejggw+pB6naFdzYvQ/o4hvcC4styY0=;
        b=KooV2i5p66dslnW27MFpxlutKl1ZL8v3vkGqnmYidESPNtkUPusWjL0HFNlTwzclCt
         FBIEp7dfu2JExqvSpDURtwtcKI1Xc9RfYI0q4zb1leLKSyEZBvoq1wDkdoVHuKlESxvb
         eSo9CXe+zjnKylykecsgWsbm8xW/+p+wOJOUg/7d8skLsVtQwGt8UgU8rOeNbXBX7Ulm
         9TRQhUiBIY0VWLLXKlVxI+UT5U0irpd1uKyLKhDo7DNbZFXblge8ymQTiLT2Zu+GnszQ
         3bgrmDH+2S1oOvCpmAOjjv1nbvZxvB7HMX3plAkLkBlPbLrN1okAihYn362J8VroCWXC
         MVaQ==
X-Gm-Message-State: AOJu0YwitiX3zxXxw/CSvaaoZYjvU6BiVM9esM9xKYHLKFNyOOD+XaAi
	AwNBFNyMiGnYUu7unK1CYuQbCpjEKWQ9VEIjI9TqfAQALhsru8lPycsNdJrgIsBX+gIYwHQ504k
	MzG62
X-Gm-Gg: AY/fxX75tmfhLEPrbuKl7fQqZj8J31B8JrkM63LCMh/rEuYxYMG7TyMLyZ3O49aKtoH
	7BLd4t8yIXMyxCREBF/U7aRUsDjEyG+N/SSTN19X+qd5fy2/6VSGTME5dQtB9oCDLE87PGQ+VFs
	c3D4MzxXrWSNDyWRvTs0Sx75Moc+C3qqqpErbX+PAteThM5BOZLof3ljty7P3WwIrlWpJCEQw6K
	6cFB95bUZXtM50e45EEt5+3962pwFhDUmYnndWvrSWy1vzhufykYcxk+LTL2oJ198fHSo1Lsa4T
	pCO8q+SXC8GOPf9AhkXERo0EG9XBTc01gNJULqtHtw8gz68ApR7+ntE4x6xT5tue7gZsNPqnlJD
	N+bioP+XYPgHxN5GmlpqxRTASctKgaoENeLzQpSIwRQfW+bSyPvJmNkgasNmpWkXORuzid+KBza
	6HsQr+xL5/DL2+kWbtMvZeH2Dorua6wHHXr/pdDYZEkRrarbYaZguPxd6UMQmhKA==
X-Google-Smtp-Source: AGHT+IFNv1UR8MFvAUVKR1eJ1Q1ff206ybolzcabnGhpA5DKWETAsojYJXQukJ8a5/JxYdlI1eO+WQ==
X-Received: by 2002:a05:6000:2c0f:b0:430:fca5:7353 with SMTP id ffacd0b85a97d-432bcfa1031mr17037740f8f.8.1767964605471;
        Fri, 09 Jan 2026 05:16:45 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] xen/gen_hypercall: Leave a breadcrumb in xen-hypercall-defs.h
Date: Fri,  9 Jan 2026 13:16:43 +0000
Message-Id: <20260109131643.859509-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When Cscope-ing through Xen, one occasionally finds themselves in
xen-hypercall-defs.h and needing to find the originating file.

This is substantially magic, and even reading the Makefile that produces
xen-hypercall-defs.h is of little help if you're not aware of of the %.i : %.c
pattern rule, and that the header is generated from a .c file in practice.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Juergen Gross <jgross@suse.com>
---
 xen/scripts/gen_hypercall.awk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/scripts/gen_hypercall.awk b/xen/scripts/gen_hypercall.awk
index b544fe1c4df7..c137f8fc4e6d 100644
--- a/xen/scripts/gen_hypercall.awk
+++ b/xen/scripts/gen_hypercall.awk
@@ -4,7 +4,7 @@
 BEGIN {
     printf("#ifndef XEN_HYPERCALL_DEFS_H\n");
     printf("#define XEN_HYPERCALL_DEFS_H\n\n");
-    printf("/* Generated file, do not edit! */\n\n");
+    printf("/* Automatically generated from xen/include/hypercall-defs.c - do not edit! */\n\n");
     e = 0;
     n = 0;
     p = 0;
-- 
2.39.5


