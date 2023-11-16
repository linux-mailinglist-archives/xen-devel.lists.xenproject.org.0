Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5867EE077
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 13:13:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634148.989452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3bFW-00045z-Ik; Thu, 16 Nov 2023 12:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634148.989452; Thu, 16 Nov 2023 12:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3bFW-00043P-FR; Thu, 16 Nov 2023 12:13:34 +0000
Received: by outflank-mailman (input) for mailman id 634148;
 Thu, 16 Nov 2023 12:13:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flNc=G5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r3bFV-0003ma-2r
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 12:13:33 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e473f31-8479-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 13:13:31 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-32ddfb38c02so496864f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Nov 2023 04:13:30 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 z11-20020a056000110b00b003143c9beeaesm13469331wrw.44.2023.11.16.04.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 04:13:29 -0800 (PST)
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
X-Inumbo-ID: 8e473f31-8479-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700136810; x=1700741610; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zL5mcmdb0pBxZaBE+peKARaW7+tFOaxVmIA77QUjENw=;
        b=LqOY6Cme04sVftjt+X+xb05wZeOXogVT3WYBdk568ZyxkyKpP7NitcVjGR8dvF7CQt
         AM5VZKdm2D1nzbpNfImH5PXkOUCFW8Mi0PTITfx109avFsrwrza8+Xy3ZjCWvny/e2/L
         5CKvNxwT+O1rlFhWZnJS93GGVqu4Qjp1jkh4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700136810; x=1700741610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zL5mcmdb0pBxZaBE+peKARaW7+tFOaxVmIA77QUjENw=;
        b=m++wW5pRDPE2I/MEgiR7PQH+jlcmwrRyG+2GCiJdAuM57WEY7JAeh2TPLw7gMZyfO5
         qP7+e9gsyROIpeiDHHOnqt1g4oaXLku4iBEkIvafyHtXL8xh+FGUf9uuu2KZxES5fi35
         TzCyrAM/7PCCJcPkltNBUBLgXM0zfgPHRtW2zHh1AIyjNbwioS30CVh4ns+Qlr/00IxP
         Gxq1T/lisnc0lLSzoilYIBXF5+9Dc+4Q2MHjt5+rISvOiRmzhC6ZZ0gXWjiZxxm+aTea
         plVt6dO79jSN2qGlAXxaXQPhXg7dibGrCk1qtPWBhoNzg1q3Kt+warrvDZ7HeiIU+S41
         D4CQ==
X-Gm-Message-State: AOJu0Yz5wU3Hsgq8rteYnHakXyv+PGRh1ZP6jSMWC/bWtIvyy7yY71E3
	fi7SznIznokvBLu+99UVEnmzD5VblqhsHi/ZIEE=
X-Google-Smtp-Source: AGHT+IEo1RVeCgBxEJ5tYFcMYqOGVHo9R+DcD+BVOVKAJgmuCp+N0l0fDnv688F8uEIdEqz6XnAZUQ==
X-Received: by 2002:a05:6000:156b:b0:32f:bed7:ed82 with SMTP id 11-20020a056000156b00b0032fbed7ed82mr2254340wrz.4.1700136809833;
        Thu, 16 Nov 2023 04:13:29 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/6] automation: remove CR characters from QEMU serial
Date: Thu, 16 Nov 2023 13:13:05 +0100
Message-ID: <20231116121310.72210-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231116121310.72210-1-roger.pau@citrix.com>
References: <20231116121310.72210-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The gitlab CI webpage seems to have issues displaying the \CR\CR\LF "\r\r\n"
sequence on the web interface used as line returns by the Linux kernel serial
output.  This leads to the QEMU tests output looking like:

(XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 664kB init memory
mapping kernel into physical memory
about to get started...
qemu-system-x86_64: terminating on signal 15 from pid 52 (timeout)

This not helpful, so strip the CR characters from the output that goes to
stdout, leaving the output in the smoke.serial untouched.

Fixes: 3030a73bf849 ('automation: add a QEMU based x86_64 Dom0/DomU test')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 automation/scripts/qemu-alpine-x86_64.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index 8c8d0b0cd759..a1c41c030a47 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -84,7 +84,10 @@ qemu-system-x86_64 \
     -monitor none -serial stdio \
     -nographic \
     -device virtio-net-pci,netdev=n0 \
-    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0 |& tee smoke.serial
+    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0 |& \
+        # Remove carriage returns from the stdout output, as gitlab
+        # interface chokes on them
+        tee smoke.serial | sed 's/\r//'
 
 set -e
 (grep -q "Domain-0" smoke.serial && grep -q "BusyBox" smoke.serial) || exit 1
-- 
2.42.0


