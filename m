Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EF7A880BD
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 14:47:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950132.1346534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4JDf-00031w-2q; Mon, 14 Apr 2025 12:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950132.1346534; Mon, 14 Apr 2025 12:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4JDe-0002zk-Vv; Mon, 14 Apr 2025 12:47:22 +0000
Received: by outflank-mailman (input) for mailman id 950132;
 Mon, 14 Apr 2025 12:47:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KxE1=XA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4JDc-0002ze-Tc
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 12:47:20 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 998b11ca-192e-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 14:47:18 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso43207805e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 05:47:18 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2075fc78sm180090265e9.27.2025.04.14.05.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 05:47:17 -0700 (PDT)
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
X-Inumbo-ID: 998b11ca-192e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744634838; x=1745239638; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vs3IPx0ubAvNTGKDP4dRKmTeeyajfpGQqvzCmhAlrNc=;
        b=OZNdx8bA5JnJ/YAFT5LcETkGvbH0o3iAq5NOaIj8QQZtUpjEnSZZobMQ+38SEBByh/
         +Mr93INpaKTBec6h7P+hgW1ZfoJBzA0yHIbEIzVlQtcZ2tAE4ejP5p+m3gtJ5ziNrIGx
         hkvhE9nzMl70Nyw8MVIMmvG+QWrMp9JVflLsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744634838; x=1745239638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vs3IPx0ubAvNTGKDP4dRKmTeeyajfpGQqvzCmhAlrNc=;
        b=H1qoobz3+egPQX3lR5BaEuaDdZ+HOJkHHRPwV794yK5GSjSRcFEMMiz30cIpg9YdN4
         TnEdMDswFxq7Bn5FY99D0JRaDZylhIFaJ7/4Cy5R7hrAutd6svIOlVCn5WPAe7/ENpFk
         F7QSgkRs5kiwcWFZCdn4FRwQdzxfoCVWV+STA8Gnjn7JzADJRK7iFbHP1VX9Rq/rlRm/
         e46gyMFpF3n1Wn+gHxukRJ5UUZTl8ILu1df3V9Mf3a+bD9J9SmJPfWsCm4qQ6/5H21wS
         2E0y8ivQfikML8hBTRxChAwzBFtoSnL5fLYzds3sG2ruOCwuP/yE/OH1CVTXuvTiowAW
         6gJQ==
X-Gm-Message-State: AOJu0Yy5O8qoQb4YZhEPLzm0koBE2fCUIkl5a14yGKfl3wbTQgv+KPSX
	y3scbR4LFTy/fS23j58CMIih2bmi3qlVekk2iL9ZF3xh6pSuBlGqRd8ctGtcteLO7fSpr/ybIRn
	WhQ8=
X-Gm-Gg: ASbGnctme8e7uSoNAm63OFUTaYH7mE/Zz+quc8DAxJjNBu0k8LnwaYpgb+e36O/n6uz
	BuTFaAG8Ctyb7Ajcg4+l3VxqlzrB4XcnsHV4Lv3LhFMm2N8GEwTJG6+fjKB2JYXjl0KSEXw30r+
	mQkmg/+6GTRHuBT1Q3YYVRcclWXVI/WMFas6aknkzgMPqJSsnvFlmsEQjdJJQsNoH6DkeWIA9pp
	tfaQ6DcX1PO/hEpsFXaTO0mV0v3+KXy3pYs/QezDUa2BPQEREehYP0N07OWIyuCFMMjcLyWMyuM
	+6uB6lPiFhf0l5/0sWDe0ZjMITFLH5ri6YO/uW80Pe4oCBdYQgFrdYHzVE4hIbTwmp9Z8KNSjvF
	zFWJR7Am0CvMLCOB1xi+2kqoB
X-Google-Smtp-Source: AGHT+IE08BXgF9+pyb8u67iHj4m4DOnmtiVuA4OE8q2DgHvIDM7e10AqKTbORFgBKdPFgdsEXJ6zpA==
X-Received: by 2002:a05:6000:2507:b0:39c:1257:cc25 with SMTP id ffacd0b85a97d-39eaaed2d1cmr10607975f8f.56.1744634837735;
        Mon, 14 Apr 2025 05:47:17 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH RFC 7/6] CI: Adjust how domU is packaged in dom0
Date: Mon, 14 Apr 2025 13:47:15 +0100
Message-Id: <20250414124715.2358883-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414110903.2355303-1-andrew.cooper3@citrix.com>
References: <20250414110903.2355303-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Package domU in /boot for dom0 and insert into the uncompressed part of dom0's
rootfs, rather than recompressing it as part of the overlay.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

A little RFC.  It wants extending to the other tests too.
---
 automation/scripts/qubes-x86-64.sh | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 1f90e7002c73..7ce077dfeaee 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -185,10 +185,22 @@ Kernel \r on an \m (\l)
     find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
     cd ..
     rm -rf rootfs
+
+    # Package domU kernel+rootfs in /boot for dom0 (uncompressed)
+    mkdir -p rootfs/boot
+    cd rootfs
+    cp ../binaries/bzImage boot/vmlinuz
+    cp ../binaries/domU-rootfs.cpio.gz boot/
+    find . | cpio -H newc -o > ../binaries/domU-in-dom0.cpio
+    cd ..
+    rm -rf rootfs
 fi
 
 # Dom0 rootfs
 cp binaries/ucode.cpio binaries/dom0-rootfs.cpio.gz
+if [ -e binaries/domU-in-dom0.cpio ]; then
+    cat binaries/domU-in-dom0.cpio >> binaries/dom0-rootfs.cpio.gz
+fi
 cat binaries/rootfs.cpio.gz >> binaries/dom0-rootfs.cpio.gz
 cat binaries/xen-tools.cpio.gz >> binaries/dom0-rootfs.cpio.gz
 
@@ -236,10 +248,6 @@ mkdir -p etc/default
 echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
 echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
 mkdir -p var/log/xen/console
-cp ../binaries/bzImage boot/vmlinuz
-if [ -n "$domU_check" ]; then
-    cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
-fi
 find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
-- 
2.39.5


