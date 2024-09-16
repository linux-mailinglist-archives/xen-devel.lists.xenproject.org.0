Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8424A97A4D3
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 17:09:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799579.1209549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqDLb-0005lh-Cz; Mon, 16 Sep 2024 15:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799579.1209549; Mon, 16 Sep 2024 15:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqDLb-0005jz-A6; Mon, 16 Sep 2024 15:09:03 +0000
Received: by outflank-mailman (input) for mailman id 799579;
 Mon, 16 Sep 2024 15:09:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CVXs=QO=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sqDLZ-0005jt-A7
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 15:09:01 +0000
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [2607:f8b0:4864:20::d2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9950c980-743d-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 17:08:59 +0200 (CEST)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-82cd872755dso190340539f.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 08:08:59 -0700 (PDT)
Received: from gmail.com (ip190-5-140-142.intercom.com.sv. [190.5.140.142])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed351ebsm1525037173.141.2024.09.16.08.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 08:08:56 -0700 (PDT)
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
X-Inumbo-ID: 9950c980-743d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726499338; x=1727104138; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vu2bW3oPLPtiaOMxv8oJDWfzTzC5BBzl6CK0bwZlSkE=;
        b=mi9QRcjjzcOHQ9vEccfzvNH4S8DH/CG5vrU3Jabk/lFEP9stmpJcVB0VlYn0rO3Nab
         Kyqgo6EBa/9tnf9j2GsC0y8FUxQuh8o9Gz2xQgWVNGIzXw6OYZA3+Q+ZCxcknFCzxCHn
         srBI+dzkxYekPDYwXf5Qv9dIQYpfmtPgOS8JoDkm4UzOyss5TYEnYTYuE0XEGNn+0oMB
         iHWWnQKf9t7pCnDzMBSQSL+PPXfzzdJQ7AJepSXEuMD1jn3ykZah3hHHMvdb5S4OT9VM
         S8XwKcnSuKOvy46HODIxnShtfmOajxL9Zeg0F5OedtF8SvpBkJFW76xS8Qz2IrTcsOQv
         tnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726499338; x=1727104138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vu2bW3oPLPtiaOMxv8oJDWfzTzC5BBzl6CK0bwZlSkE=;
        b=ehcFzrm5HYa8WQoKYdYO6ei2UIMZd5gmmvCVl4i5bdBbd1DOG6stMeRi22BOJI/0m+
         tousg/jYIZb3CssAwC78EdxOqxQKsh/KyY/P84W7x7Q9wexN5b+86kECpwjIiwQ3UVNq
         isZOF8j7gD9WxqGER/Sj+Uw1BaqTawwkv5RZPs+xWa/wNTTCAewZpXlhIS/DfJ9o+rv9
         ZCH0eZpAucxeSjD8ntMb/vaeAF9RG8gKeI8GBiWXsr7mKGmfLC9u6By8AMEHVmjuwcD+
         m5f3KPnWrvfStfguRVBNaR3ulYj1JNesEDUlKYkHKfMStrtSEO5YRcMriS3rxmMHu9N9
         ptTg==
X-Forwarded-Encrypted: i=1; AJvYcCWZfj16H+EcydilnOyybmX/zxYsxSyrRxinEDBlRqksxbhmHnKxyYA09CRS3GqkQp2pREXdYUy8Ahc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEELx9unDA3iDNpsAnpD4wLxeDsJqzM9EOiBaXC2D/KMFVu/0q
	LKJAdEjmXoP7QrI+BPbTNIOPzm6ioDneKYj9Ivrr+xcIs1TJdvkf
X-Google-Smtp-Source: AGHT+IH1gIPF3EhKwbuaRZX0PCyEdS4IBTEEIWk/DkQLPPf+Ots073bm8ldHhRNAHmGef5GuPCQXYg==
X-Received: by 2002:a05:6602:26ca:b0:82a:4c58:e1e0 with SMTP id ca18e2360f4ac-82d1f93f6dcmr1923382739f.12.1726499337890;
        Mon, 16 Sep 2024 08:08:57 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: [PATCH v1 0/4] hw/arm: xenpvh: Enable PCI for ARM PVH
Date: Mon, 16 Sep 2024 17:08:48 +0200
Message-ID: <20240916150853.1216703-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Enable PCI on the ARM PVH machine. First we add a way to control the use
of buffered IOREQ's since those are not supported on Xen/ARM.
Finally we enable the PCI support.

I've published some instructions on how to try this including the work in
progress Xen side of the PVH PCI support:
https://github.com/edgarigl/docs/blob/master/xen/pvh/virtio-pci-dom0less.md

Cheers,
Edgar

Edgar E. Iglesias (4):
  xen: Expose handle_bufioreq in xen_register_ioreq
  hw/xen: xenpvh: Disable buffered IOREQs for ARM
  hw/xen: xenpvh: Add pci-intx-irq-base property
  hw/arm: xenpvh: Enable PCI for ARM PVH

 hw/arm/xen-pvh.c                |  17 ++++++
 hw/i386/xen/xen-hvm.c           |   4 +-
 hw/i386/xen/xen-pvh.c           |   3 +
 hw/xen/xen-hvm-common.c         | 100 +++++++++++++++++++-------------
 hw/xen/xen-pvh-common.c         |  40 ++++++++++++-
 include/hw/xen/xen-hvm-common.h |   3 +
 include/hw/xen/xen-pvh-common.h |   3 +
 include/hw/xen/xen_native.h     |   3 +-
 8 files changed, 129 insertions(+), 44 deletions(-)

-- 
2.43.0


